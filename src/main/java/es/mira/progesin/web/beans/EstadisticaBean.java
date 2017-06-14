package es.mira.progesin.web.beans;

import java.awt.image.RenderedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.imageio.ImageIO;

import org.primefaces.model.StreamedContent;
import org.primefaces.model.chart.PieChartModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import es.mira.progesin.exceptions.ProgesinException;
import es.mira.progesin.persistence.entities.Inspeccion;
import es.mira.progesin.persistence.entities.Provincia;
import es.mira.progesin.persistence.entities.TipoInspeccion;
import es.mira.progesin.persistence.entities.enums.EstadoInspeccionEnum;
import es.mira.progesin.persistence.entities.enums.SeccionesEnum;
import es.mira.progesin.services.IEstadisticaService;
import es.mira.progesin.services.IRegistroActividadService;
import es.mira.progesin.services.ITipoInspeccionService;
import es.mira.progesin.util.FacesUtilities;
import lombok.Getter;
import lombok.Setter;

/**
 * Controlador del apartado de estadísticas.
 * 
 * @author EZENTIS
 *
 */
@Setter
@Getter
@Controller("estadisticaBean")
@Scope("session")

public class EstadisticaBean implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * Filtro de búsqueda para seleccionar las estadísticas a mostrar.
     */
    private InspeccionBusqueda filtro;
    
    /**
     * Lista de posibles estados de las inspecciones.
     */
    private List<EstadoInspeccionEnum> listaEstados;
    
    /**
     * Mapa que contiene las estadísticas.
     */
    private Map<EstadoInspeccionEnum, Integer> mapaResultados;
    
    /**
     * Estados seleccionados para la generación del informe en PDF.
     */
    private List<EstadoInspeccionEnum> estadosSeleccionados;
    
    /**
     * Gráfica obtenida a partir de las estadísticas.
     */
    private PieChartModel grafica;
    
    /**
     * Archivo para descargar el informe estadístico.
     */
    private transient StreamedContent file;
    
    /**
     * Servicio de tipos de inspección.
     */
    @Autowired
    private ITipoInspeccionService tipoInspeccionService;
    
    /**
     * Servicio de estadistica.
     */
    @Autowired
    private IEstadisticaService estadisticaService;
    
    /**
     * Servicio de registro de actividad.
     */
    @Autowired
    private IRegistroActividadService registroActividadService;
    
    /**
     * Lista de los posibles tipos de inspección.
     */
    private List<TipoInspeccion> listaTiposInspeccion;
    
    /**
     * Inicializa el bean.
     * 
     */
    
    @PostConstruct
    public void init() {
        setListaTiposInspeccion(tipoInspeccionService.buscaTodos());
        filtro = new InspeccionBusqueda();
        listaEstados = Arrays.stream(EstadoInspeccionEnum.values()).collect(Collectors.toList());
        obtieneEstadistica();
        
    }
    
    /**
     * Carga la vista de estadísticas.
     * 
     * @return URL de la vista de estadísticas.
     */
    public String getEstadisticas() {
        limpiarBusqueda();
        return "/estadisticas/estadisticas?faces-redirect=true";
    }
    
    /**
     * Borra los resultados de búsquedas anteriores.
     * 
     */
    public void limpiarBusqueda() {
        filtro = new InspeccionBusqueda();
        obtieneEstadistica();
    }
    
    /**
     * Filtra las inspecciones que se usarán para el cálculo de las estadísticas y lanza el cálculo.
     * 
     * @param tipoInspeccion Tipo al que pertenece la inspección.
     * @param provincia Provincia en la que se lleva a cabo la inspección.
     * @param fechaDesde Fecha desde la que se quieren filtrar los resultados.
     * @param fechaHasta Fecha hasta la que se quieren filtrar los resultados.
     */
    public void filtrar(TipoInspeccion tipoInspeccion, Provincia provincia, Date fechaDesde, Date fechaHasta) {
        rellenarFiltro(tipoInspeccion, provincia, fechaDesde, fechaHasta);
        obtieneEstadistica();
    }
    
    /**
     * Filtra las inspecciones que se usarán para la exportación a PDF y lanzqa la exportación.
     * 
     * @param tipoInspeccion Tipo al que pertenece la inspección.
     * @param provincia Provincia en la que se lleva a cabo la inspección.
     * @param fechaDesde Fecha desde la que se quieren filtrar los resultados.
     * @param fechaHasta Fecha hasta la que se quieren filtrar los resultados.
     * @param imagen Imagen generada en la vista y que queremos exportar.
     */
    public void filtraPDF(TipoInspeccion tipoInspeccion, Provincia provincia, Date fechaDesde, Date fechaHasta,
            String imagen) {
        rellenarFiltro(tipoInspeccion, provincia, fechaDesde, fechaHasta);
        File fileImg = null;
        if (imagen.split(",").length > 1) {
            String encoded = imagen.split(",")[1];
            byte[] decoded = org.apache.commons.codec.binary.Base64.decodeBase64(encoded);
            // Write to a .png file
            try {
                RenderedImage renderedImage = ImageIO.read(new ByteArrayInputStream(decoded));
                fileImg = File.createTempFile("out", ".png");
                ImageIO.write(renderedImage, "png", fileImg);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        obtieneInformePDF(fileImg);
    }
    
    /**
     * Rellena el Filtro con los valores obtenidos del formulario de la vista.
     * 
     * @param tipoInspeccion Tipo al que pertenece la inspección.
     * @param provincia Provincia en la que se lleva a cabo la inspección.
     * @param fechaDesde Fecha desde la que se quieren filtrar los resultados.
     * @param fechaHasta Fecha hasta la que se quieren filtrar los resultados.
     */
    private void rellenarFiltro(TipoInspeccion tipoInspeccion, Provincia provincia, Date fechaDesde, Date fechaHasta) {
        filtro = new InspeccionBusqueda();
        filtro.setTipoInspeccion(tipoInspeccion);
        filtro.setProvincia(provincia);
        filtro.setFechaDesde(fechaDesde);
        filtro.setFechaHasta(fechaHasta);
    }
    
    /**
     * Lanza el cálculo de las estadísticas tanto las generales como las detalladas y la gráfica.
     */
    private void obtieneEstadistica() {
        mapaResultados = estadisticaService.obtenerEstadisticas(filtro);
        createGrafica();
    }
    
    /**
     * Genera el PDF con el informe de las estadísticas desglosadas.
     * 
     * @param fileImg Fichero con la imagen a exportar
     */
    private void obtieneInformePDF(File fileImg) {
        if (estadosSeleccionados.isEmpty()) {
            FacesUtilities.setMensajeInformativo(FacesMessage.SEVERITY_ERROR, "No ha hecho ninguna selección", "",
                    "message");
        } else {
            try {
                setFile(estadisticaService.exportar(filtro, estadosSeleccionados, fileImg));
            } catch (ProgesinException e) {
                registroActividadService.altaRegActividadError(SeccionesEnum.ESTADISTICAS.getDescripcion(), e);
            }
        }
    }
    
    /**
     * Genera un gráfico de sectores a partir de los datos de las estadísticas.
     */
    private void createGrafica() {
        grafica = new PieChartModel();
        for (EstadoInspeccionEnum estado : listaEstados) {
            grafica.set(estado.getDescripcion(), mapaResultados.get(estado));
        }
        grafica.setShowDataLabels(true);
        grafica.setLegendPosition("w");
    };
    
    /**
     * Recupera el objeto gráfica para mostrarse en la vista.
     * 
     * @return Gráfica
     */
    public PieChartModel getGrafica() {
        return grafica;
    }
    
    /**
     * Carga la lista de inspecciones que se encuentran en el estado solicitado.
     * 
     * @param estado Estado que se desea consultar
     * @return Listado de las inspecciones que corresponden a la búsqueda.
     */
    public List<Inspeccion> verDetalles(EstadoInspeccionEnum estado) {
        return estadisticaService.verListaEstado(filtro, estado);
    }
}