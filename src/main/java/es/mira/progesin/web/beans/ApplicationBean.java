package es.mira.progesin.web.beans;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import es.mira.progesin.persistence.entities.Provincia;
import es.mira.progesin.persistence.entities.PuestoTrabajo;
import es.mira.progesin.persistence.entities.TipoUnidad;
import es.mira.progesin.persistence.entities.gd.TipoDocumento;
import es.mira.progesin.services.IDocumentoService;
import es.mira.progesin.services.IParametroService;
import es.mira.progesin.services.IPuestoTrabajoService;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Clase utilizada para cargar datos en el contexto de la aplicación al arrarancar el servidor
 * 
 * @author EZENTIS
 *
 */
@Component("applicationBean")
@Getter
@Setter
@NoArgsConstructor
public class ApplicationBean implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    @Autowired
    private transient IPuestoTrabajoService puestosTrabajoService;
    
    @Autowired
    private transient IParametroService parametroService;
    
    @Autowired
    private transient IDocumentoService documentoService;
    
    // Los cargo en la aplicación porque van a ser siempre los mismo y así agilizo la aplicación
    private List<PuestoTrabajo> listaPuestosTrabajo;
    
    private Map<String, Map<String, String>> mapaParametros;
    
    private String dominiosValidos;
    
    private List<Provincia> listaProvincias;
    
    private List<TipoDocumento> listaTipos;
    
    private List<TipoUnidad> listaTiposUnidad;
    
    @PersistenceContext
    private transient EntityManager em;
    
    /**
     * Inicialización de datos
     */
    @PostConstruct
    public void init() {
        setListaPuestosTrabajo((List<PuestoTrabajo>) puestosTrabajoService.findAll());
        setMapaParametros(parametroService.getMapaParametros());
        setDominiosValidos(mapaParametros.get("dominiosCorreo").get("dominiosCorreo"));
        setListaTipos(documentoService.listaTiposDocumento());
        setListaProvincias(em.createNamedQuery("Provincia.findAll", Provincia.class).getResultList());
        setListaTiposUnidad(em.createNamedQuery("TipoUnidad.findAll", TipoUnidad.class).getResultList());
        
    }
}
