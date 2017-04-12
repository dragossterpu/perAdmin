package es.mira.progesin.web.beans;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.hibernate.criterion.Order;
import org.primefaces.event.data.SortEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import es.mira.progesin.persistence.entities.Equipo;
import es.mira.progesin.persistence.entities.Inspeccion;
import es.mira.progesin.persistence.entities.Municipio;
import es.mira.progesin.persistence.entities.Provincia;
import es.mira.progesin.persistence.entities.enums.EstadoInspeccionEnum;
import es.mira.progesin.persistence.entities.enums.SeccionesEnum;
import es.mira.progesin.persistence.entities.enums.TipoRegistroEnum;
import es.mira.progesin.services.IEquipoService;
import es.mira.progesin.services.IInspeccionesService;
import es.mira.progesin.services.IRegistroActividadService;
import es.mira.progesin.util.FacesUtilities;
import lombok.Getter;
import lombok.Setter;

/**
 * @author EZENTIS
 *
 */
@Setter
@Getter
@Controller("inspeccionBean")
@Scope("session")
public class InspeccionBean {
    
    private String vieneDe;
    
    private InspeccionBusqueda inspeccionBusqueda;
    
    private InspeccionBusqueda inspeccionBusquedaCopia;
    
    private Inspeccion inspeccion;
    
    private List<Boolean> list;
    
    boolean alta = false;
    
    @Autowired
    private IRegistroActividadService regActividadService;
    
    @Autowired
    private IInspeccionesService inspeccionesService;
    
    @Autowired
    private IEquipoService equipoService;
    
    private static final int MAX_RESULTS_PAGE = 20;
    
    private static final int FIRST_PAGE = 1;
    
    private long numeroRegistros;
    
    private int primerRegistro;
    
    private long actualPage;
    
    private long numPages;
    
    @PersistenceContext
    private EntityManager em;
    
    private List<Inspeccion> listaInspecciones;
    
    private List<Inspeccion> listaInspeccionesAsociadas;
    
    private List<Municipio> listaMunicipios;
    
    private List<Equipo> listaEquipos;
    
    private Provincia provinciSelec;
    
    private List<Order> listaOrden;
    
    private boolean sortOrder;
    
    private boolean nuevo_o_editar;
    
    /**************************************************************
     * 
     * Busca las inspeccions según los filtros introducidos en el formulario de búsqueda situandose en la primera página
     * de la tabla y con el orden por defecto
     * 
     **************************************************************/
    public void buscarInspeccion() {
        setNuevo_o_editar(false);
        inspeccionBusqueda.setProvincia(provinciSelec);
        listaOrden = new ArrayList<>();
        listaOrden.add(Order.desc("fechaAlta"));
        primerRegistro = 0;
        actualPage = FIRST_PAGE;
        inspeccionBusquedaCopia = copiaInspeccionBusqueda(inspeccionBusqueda);
        buscarConOrden(listaOrden, primerRegistro, actualPage);
    }
    
    /**************************************************************
     * 
     * Busca las inspeccions según los filtros introducidos en el formulario de búsqueda
     * 
     **************************************************************/
    private void buscarConOrden(List<Order> listaOrden, int primerResgistro, long actualPage) {
        // primerRegistro = 0;
        // actualPage = FIRST_PAGE;
        setNumeroRegistros(getCountRegistrosInspecciones());
        numPages = getCountPagesGuia(numeroRegistros);
        List<Inspeccion> listaInspecciones = inspeccionesService.buscarInspeccionPorCriteria(primerRegistro,
                MAX_RESULTS_PAGE, inspeccionBusquedaCopia, listaOrden);
        inspeccionBusqueda.setListaInspecciones(listaInspecciones);
        
    }
    
    /*********************************************************
     * 
     * Visualiza la inspeccion personalizada pasada como parámetro redirigiendo a la vista "visualizaInspección"
     * 
     * @param inspeccion
     * @return String
     * 
     *********************************************************/
    
    public String visualizaInspeccion(Inspeccion inspeccion) {
        this.inspeccion = inspeccionesService.findInspeccionById(inspeccion.getId());
        List<Inspeccion> listaAsociadas = inspeccionesService.listaInspecciones(this.inspeccion);
        this.inspeccion.setInspecciones(listaAsociadas);
        return "/inspecciones/visualizarInspeccion?faces-redirect=true";
    }
    
    /*********************************************************
     * 
     * Limpia los valores del objeto de búsqueda
     * 
     *********************************************************/
    
    public void limpiarBusqueda() {
        inspeccionBusqueda.resetValues();
        setProvinciSelec(null);
    }
    
    /**
     * Método que nos lleva al formulario de alta de nueva inspección, inicializando todo lo necesario para mostrar
     * correctamente la página. Se llama desde la página de búsqueda de inspecciones.
     * @return
     */
    public String nuevaInspeccion() {
        setNuevo_o_editar(true);
        setProvinciSelec(null);
        setListaMunicipios(null);
        inspeccion = new Inspeccion();
        inspeccion.setEstadoInspeccion(EstadoInspeccionEnum.ESTADO_SIN_INICIAR);
        listaInspeccionesAsociadas = new ArrayList<>();
        inspeccion.setInspecciones(new ArrayList<>());
        
        return "/inspecciones/altaInspeccion?faces-redirect=true";
    }
    
    public String altaInspeccion() {
        try {
            
            Inspeccion inspeccionProvisional = null;
            if ((inspeccionProvisional = inspeccionesService.save(inspeccion)) != null) {
                
                StringBuilder numero = new StringBuilder(String.valueOf(inspeccionProvisional.getId()));
                numero.append("/");
                numero.append(inspeccionProvisional.getAnio());
                inspeccion.setNumero(numero.toString());
                // inspeccion.setInspecciones(listaInspeccionesAsociadas);
                inspeccionesService.save(inspeccion);
                
                FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_INFO, "Alta",
                        "La inspección " + numero + " ha sido creada con éxito");
                String descripcion = "Alta nueva inspección " + inspeccion.getNumero();
                regActividadService.altaRegActividad(descripcion, TipoRegistroEnum.ALTA.name(),
                        SeccionesEnum.INSPECCION.name());
            }
        } catch (Exception e) {
            regActividadService.altaRegActividadError(SeccionesEnum.INSPECCION.name(), e);
        }
        return null;
    }
    
    /**
     * Pasa los datos del usuario que queremos modificar al formulario de modificación para que cambien los valores que
     * quieran
     * @param user usuario recuperado del formulario de búsqueda de usuarios
     * @return
     */
    public String getFormModificarInspeccion(Inspeccion inspeccion) {
        setNuevo_o_editar(true);
        setProvinciSelec(inspeccion.getMunicipio().getProvincia());
        TypedQuery<Municipio> queryEmpleo = em.createNamedQuery("Municipio.findByCode_province", Municipio.class);
        queryEmpleo.setParameter("provinciaSeleccionada", provinciSelec);
        listaMunicipios = queryEmpleo.getResultList();
        this.inspeccion = inspeccion;
        // listaInspeccionesAsociadas = inspeccionesService.listaInspecciones(inspeccion);
        this.inspeccion.setInspecciones(listaInspeccionesAsociadas);
        
        return "/inspecciones/modificarInspeccion?faces-redirect=true";
    }
    
    /**
     * Modifica los datos del usuario en función de los valores recuperados del formulario
     */
    public void modificarInspeccion() {
        try {
            
            StringBuilder numero = new StringBuilder(String.valueOf(inspeccion.getId()));
            numero.append("/");
            numero.append(inspeccion.getAnio());
            inspeccion.setNumero(numero.toString());
            // inspeccion.setInspecciones(listaInspeccionesAsociadas);
            
            if (inspeccionesService.save(inspeccion) != null) {
                FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_INFO, "Modificación",
                        "La inspección ha sido modificada con éxito");
                
                String descripcion = "Modificación de la inspección : " + inspeccion.getNumero();
                
                // Guardamos la actividad en bbdd
                regActividadService.altaRegActividad(descripcion, TipoRegistroEnum.MODIFICACION.name(),
                        SeccionesEnum.INSPECCION.name());
            }
        } catch (Exception e) {
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, "Modificación",
                    "Se ha producido un error al modificar la inspección. Inténtelo de nuevo más tarde");
            // Guardamos los posibles errores en bbdd
            regActividadService.altaRegActividadError(SeccionesEnum.INSPECCION.name(), e);
        }
        
    }
    
    /*********************************************************
     * 
     * Inicializa el bean
     * 
     *********************************************************/
    
    @PostConstruct
    public void init() {
        inspeccionBusqueda = new InspeccionBusqueda();
        setListaEquipos(equipoService.findByFechaBajaIsNotNull());
        setProvinciSelec(null);
        listaMunicipios = new ArrayList<>();
        setList(new ArrayList<>());
        for (int i = 0; i <= 13; i++) {
            list.add(Boolean.TRUE);
        }
    }
    
    /*********************************************************
     * 
     * Limpia el menú de búsqueda si se accede a la vista desde el menú lateral
     * 
     *********************************************************/
    
    public void getFormularioBusqueda() {
        if ("menu".equalsIgnoreCase(this.vieneDe)) {
            setProvinciSelec(null);
            limpiarBusqueda();
            this.vieneDe = null;
        } else if ("visualizar".equalsIgnoreCase(this.vieneDe) && nuevo_o_editar) {
            setProvinciSelec(null);
            limpiarBusqueda();
            this.vieneDe = null;
        }
        
    }
    
    /**
     * 
     */
    public void nextInspeccion() {
        
        if (actualPage < numPages) {
            
            primerRegistro += MAX_RESULTS_PAGE;
            actualPage++;
            
            // List<Inspeccion> listaInspecciones = inspeccionesService.buscarInspeccionPorCriteria(primerRegistro,
            // MAX_RESULTS_PAGE, inspeccionBusquedaCopia, listaOrden);
            // cargaInspeccionesAsociadas(listaInspecciones);
            // inspeccionBusqueda.setListaInspecciones(listaInspecciones);
            buscarConOrden(listaOrden, primerRegistro, actualPage);
        }
        
    }
    
    /**
     * Cargar la página anterior de resultados de la búsqueda
     * 
     * @author EZENTIS
     */
    public void previousInspeccion() {
        
        if (actualPage > FIRST_PAGE) {
            
            primerRegistro -= MAX_RESULTS_PAGE;
            actualPage--;
            
            // List<Inspeccion> listaInspecciones = inspeccionesService.buscarInspeccionPorCriteria(primerRegistro,
            // MAX_RESULTS_PAGE, inspeccionBusquedaCopia, listaOrden);
            // cargaInspeccionesAsociadas(listaInspecciones);
            // inspeccionBusqueda.setListaInspecciones(listaInspecciones);
            buscarConOrden(listaOrden, primerRegistro, actualPage);
        }
    }
    
    /**
     * @return devuelve el número de registros de la consulta criteria.
     * @author EZENTIS
     * 
     */
    public long getCountRegistrosInspecciones() {
        return inspeccionesService.getCountInspeccionCriteria(inspeccionBusqueda);
    }
    
    /**
     * Devuelve el número de páginas de la consulta.
     * 
     * @param countRegistros
     * @return número de páginas.
     * @author EZENTIS
     */
    public long getCountPagesGuia(long countRegistros) {
        long numPag;
        if (countRegistros % MAX_RESULTS_PAGE == 0)
            numPag = countRegistros / MAX_RESULTS_PAGE;
        else
            numPag = countRegistros / MAX_RESULTS_PAGE + 1;
        
        return numPag;
    }
    
    /**
     * @param inspeccion
     * @return
     */
    public InspeccionBusqueda copiaInspeccionBusqueda(InspeccionBusqueda inspeccion) {
        InspeccionBusqueda inspeccionCopia = new InspeccionBusqueda();
        inspeccionCopia.setId(inspeccion.getId());
        inspeccionCopia.setNombreUnidad(inspeccion.getNombreUnidad());
        inspeccionCopia.setCuatrimestre(inspeccion.getCuatrimestre());
        inspeccionCopia.setTipoInspeccion(inspeccion.getTipoInspeccion());
        inspeccionCopia.setAmbito(inspeccion.getAmbito());
        inspeccionCopia.setEquipo(inspeccion.getEquipo());
        inspeccionCopia.setEstado(inspeccion.getEstado());
        inspeccionCopia.setFechaDesde(inspeccion.getFechaDesde());
        inspeccionCopia.setFechaHasta(inspeccion.getFechaHasta());
        inspeccionCopia.setUsuarioCreacion(inspeccion.getUsuarioCreacion());
        inspeccionCopia.setAnio(inspeccion.getAnio());
        inspeccionCopia.setTipoUnidad(inspeccion.getTipoUnidad());
        inspeccionCopia.setProvincia(inspeccion.getProvincia());
        inspeccionCopia.setMunicipio(inspeccion.getMunicipio());
        inspeccionCopia.setJefeEquipo(inspeccion.getJefeEquipo());
        
        return inspeccionCopia;
    }
    
    /**
     * 
     */
    public void onChangeProvincia() {
        TypedQuery<Municipio> queryEmpleo = em.createNamedQuery("Municipio.findByCode_province", Municipio.class);
        queryEmpleo.setParameter("provinciaSeleccionada", this.provinciSelec);
        listaMunicipios = queryEmpleo.getResultList();
        
    }
    
    /**
     * @param event
     */
    public void onSort(SortEvent event) {
        String columna = event.getSortColumn().getHeaderText();
        setSortOrder(event.isAscending());
        setListaOrden(new ArrayList<>());
        
        if ("Numero".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("id"));
                listaOrden.add(Order.asc("anio"));
            } else {
                listaOrden.add(Order.desc("id"));
                listaOrden.add(Order.desc("anio"));
            }
            
        } else if ("Fecha".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("fechaAlta"));
            } else {
                listaOrden.add(Order.desc("fechaAlta"));
            }
            
        } else if ("Originador".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("usernameAlta"));
            } else {
                listaOrden.add(Order.desc("usernameAlta"));
            }
            
        } else if ("Tipo".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("tipoInspeccion"));
            } else {
                listaOrden.add(Order.desc("tipoInspeccion"));
            }
            
        } else if ("Equipo".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("equipo.nombreEquipo"));
            } else {
                listaOrden.add(Order.desc("equipo.nombreEquipo"));
            }
            
        } else if ("Jefe".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("equipo.jefeEquipo"));
            } else {
                listaOrden.add(Order.desc("equipo.jefeEquipo"));
            }
            
        } else if ("Cuatrimestre".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("cuatrimestre"));
            } else {
                listaOrden.add(Order.desc("cuatrimestre"));
            }
            
        } else if ("Ámbito".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("ambito"));
            } else {
                listaOrden.add(Order.desc("ambito"));
            }
            
        } else if ("Tipo".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("tipoInspeccion"));
            } else {
                listaOrden.add(Order.desc("tipoInspeccion"));
            }
            
        } else if ("Estado".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("estadoInspeccion"));
            } else {
                listaOrden.add(Order.desc("estadoInspeccion"));
            }
            
        } else if ("Tipo unid.".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("tipoUnidad"));
            } else {
                listaOrden.add(Order.desc("tipoUnidad"));
            }
            
        } else if ("Nombre unid.".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("nombreUnidad"));
            } else {
                listaOrden.add(Order.desc("nombreUnidad"));
            }
            
        } else if ("Municipio".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("municipio"));
            } else {
                listaOrden.add(Order.desc("municipio"));
            }
            
        } else if ("Provincia".equals(columna)) {
            if (sortOrder) {
                listaOrden.add(Order.asc("municipio.provincia"));
            } else {
                listaOrden.add(Order.desc("municipio.provincia"));
            }
        }
        
        primerRegistro = 0;
        actualPage = FIRST_PAGE;
        buscarConOrden(listaOrden, primerRegistro, actualPage);
    }
    
    /**
     * Añade una nueva inspección a la lista de inspecciones del documento. Se comprueba que la inspección existe y no
     * está ya añadida.
     * 
     * @param inspeccion La inspección a añadir
     */
    public void asignarNuevaInspeccion(Inspeccion inspeccion) {
        if (inspeccion != null && !contieneInspeccion(listaInspeccionesAsociadas, inspeccion)) {
            try {
                if (inspeccion.getInspecciones() == null || inspeccion.getInspecciones().isEmpty()) {
                    listaInspeccionesAsociadas = new ArrayList<>();
                } else {
                    listaInspeccionesAsociadas = new ArrayList<>(inspeccion.getInspecciones());
                }
                if (!contieneInspeccion(listaInspeccionesAsociadas, inspeccion)) {
                    listaInspeccionesAsociadas.add(inspeccion);
                    inspeccion.setInspecciones(listaInspeccionesAsociadas);
                }
            } catch (Exception e) {
                FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, "ERROR ",
                        "Se ha producido un error al asignar una inspección");
                regActividadService.altaRegActividadError(SeccionesEnum.INSPECCION.getDescripcion(), e);
            }
        }
    }
    
    private boolean contieneInspeccion(List<Inspeccion> lista, Inspeccion inspeccion) {
        boolean respuesta = false;
        
        for (Inspeccion i : lista) {
            if (i.getNumero().equals(inspeccion.getNumero())) {
                respuesta = true;
            }
        }
        
        return respuesta;
    }
    
    /**
     * Elimina una inspección de la lista del documento
     * 
     * @param inspeccion Inspección a desasociar
     */
    public void desAsociarInspeccion(Inspeccion inspeccion) {
        try {
            List<Inspeccion> inspecciones = new ArrayList<>(inspeccion.getInspecciones());
            inspecciones.remove(inspeccion);
            inspeccion.setInspecciones(inspecciones);
            listaInspeccionesAsociadas.remove(inspeccion);
            inspeccion.setInspecciones(listaInspeccionesAsociadas);
        } catch (Exception e) {
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, "ERROR",
                    "Se ha producido un error al desasociar una inspección");
            regActividadService.altaRegActividadError(SeccionesEnum.INSPECCION.getDescripcion(), e);
        }
    }
    
    private void cargaInspeccionesAsociadas(List<Inspeccion> listaInsp) {
        for (Inspeccion ins : listaInsp) {
            ins.setInspecciones(inspeccionesService.listaInspecciones(ins));
        }
    }
    
    /**
     * 
     * Elimina la fecha de baja de la inspeccion para volver a ponerla activa
     * 
     * @param inspeccion
     */
    public void activa(Inspeccion inspeccion) {
        String user = SecurityContextHolder.getContext().getAuthentication().getName();
        inspeccion.setFechaAnulacion(null);
        inspeccion.setUsernameAnulacion(null);
        try {
            
            if (inspeccionesService.save(inspeccion) != null) {
                String descripcion = "El usuario " + user + " ha activado la inspección " + inspeccion.getNumero();
                regActividadService.altaRegActividad(descripcion, TipoRegistroEnum.MODIFICACION.name(),
                        SeccionesEnum.INSPECCION.name());
                
                buscarConOrden(listaOrden, primerRegistro, actualPage);
            }
        } catch (Exception e) {
            regActividadService.altaRegActividadError(SeccionesEnum.GUIAS.getDescripcion(), e);
        }
    }
    
    /**
     * 
     * Permite la anulación de una inspeccion. Una vez anulada no podrá ser usada aunque se mantendrá en la base de
     * datos
     * 
     * @param inspeccion La inspeccion a anular
     * 
     */
    
    public void anular(Inspeccion inspeccion) {
        String user = SecurityContextHolder.getContext().getAuthentication().getName();
        inspeccion.setFechaAnulacion(new Date());
        inspeccion.setUsernameAnulacion(user);
        inspeccion.setEstadoInspeccion(EstadoInspeccionEnum.ESTADO_SUSPENDIDA);
        try {
            if (inspeccionesService.save(inspeccion) != null) {
                String descripcion = "El usuario " + user + " ha anulado la inspección " + inspeccion.getNumero();
                
                // Guardamos la actividad en bbdd
                regActividadService.altaRegActividad(descripcion, TipoRegistroEnum.MODIFICACION.name(),
                        SeccionesEnum.INSPECCION.name());
                buscarConOrden(listaOrden, primerRegistro, actualPage);
            }
        } catch (Exception e) {
            // Guardamos los posibles errores en bbdd
            regActividadService.altaRegActividadError(SeccionesEnum.INSPECCION.name(), e);
        }
        
    }
    
    /**
     * 
     * Cuando un usuario use la opción de eliminar una inspección se procederá se hará una elimianción lógica de la base
     * de datos
     * 
     * @param inspeccionEliminar La inspección a anular
     * 
     */
    public void eliminar(Inspeccion inspeccionEliminar) {
        String user = SecurityContextHolder.getContext().getAuthentication().getName();
        inspeccionEliminar.setFechaBaja(new Date());
        inspeccionEliminar.setUsernameBaja(user);
        
        try {
            if (inspeccionesService.save(inspeccionEliminar) != null) {
                
                String descripcion = "El usuario " + user + " ha eliminado la inspección " + inspeccion.getNumero();
                
                regActividadService.altaRegActividad(descripcion, TipoRegistroEnum.BAJA.name(),
                        SeccionesEnum.INSPECCION.name());
                
                primerRegistro = 0;
                actualPage = FIRST_PAGE;
                buscarConOrden(listaOrden, primerRegistro, actualPage);
            }
        } catch (Exception e) {
            regActividadService.altaRegActividadError(SeccionesEnum.GUIAS.getDescripcion(), e);
        }
    }
    
}
