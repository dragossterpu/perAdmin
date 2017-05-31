package es.mira.progesin.web.beans.cuestionarios;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import org.primefaces.context.RequestContext;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import es.mira.progesin.constantes.Constantes;
import es.mira.progesin.model.DatosTablaGenerica;
import es.mira.progesin.persistence.entities.User;
import es.mira.progesin.persistence.entities.cuestionarios.AreaUsuarioCuestEnv;
import es.mira.progesin.persistence.entities.cuestionarios.CuestionarioEnvio;
import es.mira.progesin.persistence.entities.cuestionarios.PreguntasCuestionario;
import es.mira.progesin.persistence.entities.cuestionarios.RespuestaCuestionario;
import es.mira.progesin.persistence.entities.cuestionarios.RespuestaCuestionarioId;
import es.mira.progesin.persistence.entities.enums.EstadoEnum;
import es.mira.progesin.persistence.entities.enums.RoleEnum;
import es.mira.progesin.persistence.entities.enums.SeccionesEnum;
import es.mira.progesin.persistence.entities.enums.TipoRegistroEnum;
import es.mira.progesin.persistence.entities.gd.Documento;
import es.mira.progesin.persistence.repositories.IDatosTablaGenericaRepository;
import es.mira.progesin.persistence.repositories.IRespuestaCuestionarioRepository;
import es.mira.progesin.services.IAlertaService;
import es.mira.progesin.services.IAreaCuestionarioService;
import es.mira.progesin.services.IAreaUsuarioCuestEnvService;
import es.mira.progesin.services.ICuestionarioEnvioService;
import es.mira.progesin.services.IDocumentoService;
import es.mira.progesin.services.INotificacionService;
import es.mira.progesin.services.IRegistroActividadService;
import es.mira.progesin.services.IRespuestaCuestionarioService;
import es.mira.progesin.services.IUserService;
import es.mira.progesin.util.DataTableView;
import es.mira.progesin.util.FacesUtilities;
import es.mira.progesin.util.VerificadorExtensiones;
import lombok.Getter;
import lombok.Setter;

/**
 * Bean que contiene los métodos necesarios para que los usuarios puedan responder las preguntas contenidas en los
 * cuestionarios
 * @author EZENTIS
 *
 */

@Setter
@Getter
@Controller("responderCuestionarioBean")
@Scope("session")
public class ResponderCuestionarioBean implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private List<User> usuariosProv;
    
    private boolean principalControlaTodasAreas;
    
    private List<AreaUsuarioCuestEnv> listaAreasUsuarioCuestEnv;
    
    private Map<Long, String> mapaAreaUsuarioCuestEnv;
    
    /**
     * Verificador de extensiones
     */
    @Autowired
    private transient VerificadorExtensiones verificadorExtensiones;
    
    @Autowired
    private VisualizarCuestionario visualizarCuestionario;
    
    @Autowired
    private transient ICuestionarioEnvioService cuestionarioEnvioService;
    
    private CuestionarioEnvio cuestionarioEnviado;
    
    @Autowired
    private transient IRespuestaCuestionarioRepository respuestaRepository;
    
    @Autowired
    private transient IRespuestaCuestionarioService respuestaService;
    
    @Autowired
    private transient IDatosTablaGenericaRepository datosTablaRepository;
    
    @Autowired
    private transient IDocumentoService documentoService;
    
    @Autowired
    private transient IRegistroActividadService regActividadService;
    
    @Autowired
    private transient INotificacionService notificacionService;
    
    @Autowired
    private transient IAlertaService alertaService;
    
    @Autowired
    private transient IAreaUsuarioCuestEnvService areaUsuarioCuestEnvService;
    
    @Autowired
    private transient IAreaCuestionarioService areaCuestionarioService;
    
    @Autowired
    private transient IUserService userService;
    
    /**
     * Guarda las respuestas introducidas por el usuario en BBDD, incluidos los documentos subidos
     */
    public void guardarBorrador() {
        try {
            List<RespuestaCuestionario> listaRespuestas = new ArrayList<>();
            guardarRespuestasTipoTexto(listaRespuestas);
            guardarRespuestasTipoTablaMatriz(listaRespuestas);
            
            listaRespuestas = cuestionarioEnvioService.transaccSaveConRespuestas(listaRespuestas);
            
            // Para que cuando guardemos las respuestas tipo tabla/matriz tengan id, sino da problemas el mapeo con las
            // respuestas de tipo tabla, ya que no encuantra el id cuando añaden filas y siguen con la misma sesión
            actualizarIdRespuestasTabla(listaRespuestas);
            
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_INFO, "Borrador",
                    "El borrador se ha guardado con éxito");
        } catch (Exception e) {
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, TipoRegistroEnum.ERROR.name(),
                    "Se ha producido un error al guardar las respuestas. ");
            regActividadService.altaRegActividadError(SeccionesEnum.CUESTIONARIO.name(), e);
        }
    }
    
    /**
     * Actualiza el mapa de respuestas de tipo tabla/matriz con los id obtenidos al guardar en BBDD
     * 
     * @param listaRespuestas
     */
    private void actualizarIdRespuestasTabla(List<RespuestaCuestionario> listaRespuestas) {
        listaRespuestas.forEach(respuesta -> {
            String tipoRespuesta = respuesta.getRespuestaId().getPregunta().getTipoRespuesta();
            if ((tipoRespuesta.startsWith(Constantes.TIPORESPUESTATABLA)
                    || tipoRespuesta.startsWith(Constantes.TIPORESPUESTAMATRIZ))
                    && respuesta.getRespuestaTablaMatriz() != null) {
                visualizarCuestionario.getMapaRespuestasTablaAux().put(respuesta.getRespuestaId().getPregunta(),
                        respuesta.getRespuestaTablaMatriz());
            }
        });
        visualizarCuestionario.construirTipoRespuestaTablaMatrizConDatos();
    }
    
    /**
     * Guarda la fecha de cumplimentación y las respuestas introducidas por el usuario en BBDD, incluidos los documentos
     * subidos
     * 
     * @author EZENTIS
     */
    public void enviarCuestionario() {
        try {
            comprobarAsignaciones();
            if (principalControlaTodasAreas) {
                List<RespuestaCuestionario> listaRespuestas = new ArrayList<>();
                guardarRespuestasTipoTexto(listaRespuestas);
                guardarRespuestasTipoTablaMatriz(listaRespuestas);
                
                cuestionarioEnviado.setFechaCumplimentacion(new Date());
                cuestionarioEnvioService.transaccSaveConRespuestasInactivaUsuariosProv(cuestionarioEnviado,
                        listaRespuestas);
                
                FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_INFO, "Cumplimentación",
                        "Cuestionario cumplimentado y enviado con éxito.");
                
                String textoNotReg = "Cuestionario para la inspección "
                        + cuestionarioEnviado.getInspeccion().getNumero() + " respondido";
                
                // Guardamos la actividad en bbdd
                regActividadService.altaRegActividad(textoNotReg, TipoRegistroEnum.ALTA.name(),
                        SeccionesEnum.CUESTIONARIO.name());
                // Creamos alertas a los miembros del equipo y al rol de Apoyo
                alertaService.crearAlertaRol(SeccionesEnum.CUESTIONARIO.name(), textoNotReg,
                        RoleEnum.ROLE_SERVICIO_APOYO);
                alertaService.crearAlertaEquipo(SeccionesEnum.CUESTIONARIO.name(), textoNotReg,
                        cuestionarioEnviado.getInspeccion());
            } else {
                FacesUtilities.setMensajeInformativo(FacesMessage.SEVERITY_ERROR, "Cumplimentación abortada",
                        "Aún hay areas asignadas a otros usuarios. ", null);
            }
        } catch (Exception e) {
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, TipoRegistroEnum.ERROR.name(),
                    "Se ha producido un error al enviar el cuestionario cumplimentado. ");
            regActividadService.altaRegActividadError(SeccionesEnum.CUESTIONARIO.name(), e);
        }
    }
    
    private void comprobarAsignaciones() {
        principalControlaTodasAreas = true;
        listaAreasUsuarioCuestEnv.forEach(areaUsuario -> principalControlaTodasAreas = principalControlaTodasAreas
                && visualizarCuestionario.getUsuarioActual().getUsername().equals(areaUsuario.getUsernameProv()));
    }
    
    private RespuestaCuestionario crearRespuesta(PreguntasCuestionario pregunta) {
        RespuestaCuestionario respuestaCuestionario = new RespuestaCuestionario();
        RespuestaCuestionarioId idRespuesta = new RespuestaCuestionarioId();
        idRespuesta.setCuestionarioEnviado(cuestionarioEnviado);
        idRespuesta.setPregunta(pregunta);
        respuestaCuestionario.setRespuestaId(idRespuesta);
        return respuestaCuestionario;
    }
    
    /**
     * Guarda las respuestas de las preguntas que no son de tipo TABLA o MATRIZ
     * @see guardarRespuestas
     *
     */
    private void guardarRespuestasTipoTexto(List<RespuestaCuestionario> listaRespuestas) {
        String usuarioActual = SecurityContextHolder.getContext().getAuthentication().getName();
        Map<PreguntasCuestionario, String> mapaRespuestas = visualizarCuestionario.getMapaRespuestas();
        mapaRespuestas.forEach((pregunta, respuesta) -> {
            // Guardar sólo las preguntas asignadas al usuario actual
            if (mapaAreaUsuarioCuestEnv.get(pregunta.getArea().getId()).equals(usuarioActual) && respuesta != null
                    && respuesta.isEmpty() == Boolean.FALSE) {
                RespuestaCuestionario respuestaCuestionario = crearRespuesta(pregunta);
                respuestaCuestionario.setRespuestaTexto(respuesta);
                if (pregunta.getTipoRespuesta() != null && pregunta.getTipoRespuesta().startsWith("ADJUNTO")) {
                    respuestaCuestionario.setDocumentos(visualizarCuestionario.getMapaDocumentos().get(pregunta));
                }
                listaRespuestas.add(respuestaCuestionario);
            }
        });
    }
    
    /**
     * Guarda en BBDD las respuestas de tipo TABLA o MATRIZ
     * @param listaRespuestas
     * @see guardarRespuestas
     * 
     */
    private void guardarRespuestasTipoTablaMatriz(List<RespuestaCuestionario> listaRespuestas) {
        String usuarioActual = SecurityContextHolder.getContext().getAuthentication().getName();
        Map<PreguntasCuestionario, DataTableView> mapaRespuestasTabla = visualizarCuestionario.getMapaRespuestasTabla();
        
        mapaRespuestasTabla.forEach((pregunta, dataTableView) -> {
            // Guardar sólo las preguntas asignadas al usuario actual
            if (mapaAreaUsuarioCuestEnv.get(pregunta.getArea().getId()).equals(usuarioActual)
                    && dataTableView != null) {
                List<DatosTablaGenerica> listaDatosTabla = dataTableView.getListaDatosTabla();
                RespuestaCuestionario rtaCuestionario = crearRespuesta(pregunta);
                rtaCuestionario.setRespuestaTablaMatriz(listaDatosTabla);
                listaRespuestas.add(rtaCuestionario);
            }
        });
    }
    
    /**
     * Elimina una fila nueva a la pregunta pasada como parámetro. El tipo de respuesta de esta pregunta siempre deberá
     * empezar por TABLA
     * @param pregunta Pregunta de un cuestionario
     */
    public void eliminarFilaRespuestaTabla(PreguntasCuestionario pregunta) {
        Map<PreguntasCuestionario, DataTableView> mapaRespuestasTabla = visualizarCuestionario.getMapaRespuestasTabla();
        if (mapaRespuestasTabla.get(pregunta) != null) {
            DataTableView dataTableView = mapaRespuestasTabla.get(pregunta);
            dataTableView.eliminarFila();
            mapaRespuestasTabla.put(pregunta, dataTableView);
            visualizarCuestionario.setMapaRespuestasTabla(mapaRespuestasTabla);
        }
    }
    
    /**
     * Se crea un objeto Documento a partir del fichero que sube el usuario y se añade al mapa de documentos que se
     * visualiza en pantalla
     * 
     * @param event Evento que contiene el fichero que sube el usuario
     */
    public void subirFichero(FileUploadEvent event) {
        UploadedFile archivoSubido = event.getFile();
        List<Documento> listaDocumentos;
        if (verificadorExtensiones.extensionCorrecta(archivoSubido)) {
            
            try {
                PreguntasCuestionario pregunta = (PreguntasCuestionario) event.getComponent().getAttributes()
                        .get("pregunta");
                
                // Grabamos la respuesta con el documento subido
                RespuestaCuestionario respuestaCuestionario = crearRespuesta(pregunta);
                respuestaCuestionario.setRespuestaTexto(visualizarCuestionario.getMapaRespuestas().get(pregunta));
                
                Map<PreguntasCuestionario, List<Documento>> mapaDocumentos = visualizarCuestionario.getMapaDocumentos();
                listaDocumentos = mapaDocumentos.get(pregunta) != null ? mapaDocumentos.get(pregunta)
                        : new ArrayList<>();
                
                respuestaService.saveConDocumento(respuestaCuestionario, archivoSubido, listaDocumentos);
                
                mapaDocumentos.put(pregunta, listaDocumentos);
                visualizarCuestionario.setMapaDocumentos(mapaDocumentos);
                
            } catch (Exception e) {
                FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, TipoRegistroEnum.ERROR.name(),
                        "Se ha producido un error al subir el fichero. Inténtelo de nuevo más tarde.");
                regActividadService.altaRegActividadError(SeccionesEnum.CUESTIONARIO.name(), e);
            }
        } else {
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, TipoRegistroEnum.ERROR.name(),
                    "La extensión del documento no corresponde con el documento subido");
        }
    }
    
    /**
     * Elimina el documento pasado como parámetro de la pregunta
     * @param pregunta a la que pertenece
     * @param documento a eliminar
     */
    public void eliminarDocumento(PreguntasCuestionario pregunta, Documento documento) {
        
        RespuestaCuestionario respuestaCuestionario = crearRespuesta(pregunta);
        List<Documento> listaDocumentos = visualizarCuestionario.getMapaDocumentos().get(pregunta);
        listaDocumentos.remove(documento);
        respuestaCuestionario.setDocumentos(listaDocumentos);
        respuestaRepository.save(respuestaCuestionario);
        respuestaRepository.flush();
        documentoService.delete(documento);
        
        visualizarCuestionario.getMapaDocumentos().put(pregunta, listaDocumentos);
    }
    
    /**
     * Obtiene el cuestionario a mostrar en función del usuario que se loguea
     */
    @PostConstruct
    public void init() {
        User usuarioActual = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (RoleEnum.ROLE_PROV_CUESTIONARIO.equals(usuarioActual.getRole())) {
            cuestionarioEnviado = cuestionarioEnvioService.findNoFinalizadoPorCorreoEnvio(usuarioActual.getCorreo());
            
            setUsuariosProv(
                    userService.crearUsuariosProvisionalesCuestionario(cuestionarioEnviado.getCorreoEnvio(), ""));
            
            // Dependiendo de si es el usuario principal o no recuperamos todas las asociaciones o sólo las del usuario
            // actual
            if (usuarioActual.getUsername().equals(usuarioActual.getCorreo())) {
                listaAreasUsuarioCuestEnv = areaUsuarioCuestEnvService
                        .findByIdCuestionarioEnviado(cuestionarioEnviado.getId());
            } else {
                listaAreasUsuarioCuestEnv = areaUsuarioCuestEnvService.findByIdCuestionarioEnviadoAndUsuarioProv(
                        cuestionarioEnviado.getId(), usuarioActual.getUsername());
            }
            
            generarMapaAreaUsuarioCuestEnv();
            
            visualizarCuestionario.setListaAreasVisualizarUsuario(
                    areaCuestionarioService.findByIdIn(new ArrayList<>(mapaAreaUsuarioCuestEnv.keySet())));
            visualizarCuestionario.generarMapaAreasVisualizarUsuario();
            
            visualizarCuestionario.visualizarRespuestasCuestionario(cuestionarioEnviado);
            
        }
    }
    
    /**
     * Guarda los cambios realizados a la asignación de areas a usuarios provisionales secundarios por parte del
     * principal
     * 
     * @author EZENTIS
     */
    public void asignarAreas() {
        try {
            List<String> usuariosAsignados = new ArrayList<>();
            listaAreasUsuarioCuestEnv.forEach(areaUsuario -> {
                if (usuariosAsignados.contains(areaUsuario.getUsernameProv()) == Boolean.FALSE) {
                    usuariosAsignados.add(areaUsuario.getUsernameProv());
                }
            });
            usuariosAsignados.forEach(usuarioProv -> userService.cambiarEstado(usuarioProv, EstadoEnum.ACTIVO));
            
            listaAreasUsuarioCuestEnv = areaUsuarioCuestEnvService.save(listaAreasUsuarioCuestEnv);
            
            if (listaAreasUsuarioCuestEnv != null) {
                FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_INFO, "Asignación",
                        "Areas asignadas con éxito, cuando los usuarios elegidos completen su parte volverá a tener asignadas dichas areas y podrá enviar el cuestionario.");
                generarMapaAreaUsuarioCuestEnv();
            }
        } catch (Exception e) {
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, TipoRegistroEnum.ERROR.name(),
                    "Se ha producido un error al asignar areas del cuestionario. ");
            regActividadService.altaRegActividadError(SeccionesEnum.CUESTIONARIO.name(), e);
        }
    }
    
    /**
     * Guarda las respuestas introducidas por el usuario en BBDD, incluidos los documentos subidos, desactiva el acceso
     * de dicho usuario provisional secundario y reasigna las areas al usuario principal
     * 
     * @author EZENTIS
     */
    public void guardarYAsignarAreasAlPrincipal() {
        try {
            List<RespuestaCuestionario> listaRespuestas = new ArrayList<>();
            guardarRespuestasTipoTexto(listaRespuestas);
            guardarRespuestasTipoTablaMatriz(listaRespuestas);
            
            cuestionarioEnvioService.transaccSaveConRespuestas(listaRespuestas);
            
            String nombreUsuarioActual = visualizarCuestionario.getUsuarioActual().getUsername();
            listaAreasUsuarioCuestEnv.forEach(areaUsuario -> {
                if (areaUsuario.getUsernameProv().equals(nombreUsuarioActual)) {
                    areaUsuario.setUsernameProv(cuestionarioEnviado.getCorreoEnvio());
                }
            });
            
            userService.cambiarEstado(nombreUsuarioActual, EstadoEnum.INACTIVO);
            
            listaAreasUsuarioCuestEnv = areaUsuarioCuestEnvService.save(listaAreasUsuarioCuestEnv);
            if (listaAreasUsuarioCuestEnv != null) {
                RequestContext context = RequestContext.getCurrentInstance();
                FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Cumplimentación",
                        "Guardado con éxito, su contribución al cuestionario ha finalizado.");
                FacesContext.getCurrentInstance().addMessage("dialogMessageReasignar", message);
                context.execute("PF('dialogMessageReasignar').show()");
                generarMapaAreaUsuarioCuestEnv();
            }
        } catch (Exception e) {
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, TipoRegistroEnum.ERROR.name(),
                    "Se ha producido un error al finalizar su parte.");
            regActividadService.altaRegActividadError(SeccionesEnum.CUESTIONARIO.name(), e);
        }
    }
    
    /**
     * Construye un mapa que relaciona las areas de un cuestionario enviado con los usuarios provisionales asignados
     * para responderlas, se utiliza para habilitar o inhabilitar la edición de los campos de respuesta en el formulario
     * del cuestionario.
     * 
     * @author EZENTIS
     */
    public void generarMapaAreaUsuarioCuestEnv() {
        mapaAreaUsuarioCuestEnv = new HashMap<>();
        
        listaAreasUsuarioCuestEnv.forEach(
                areaUsuario -> mapaAreaUsuarioCuestEnv.put(areaUsuario.getIdArea(), areaUsuario.getUsernameProv()));
        
    }
}
