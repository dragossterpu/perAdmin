package es.mira.progesin.web.beans;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import es.mira.progesin.constantes.Constantes;
import es.mira.progesin.exceptions.CorreoException;
import es.mira.progesin.persistence.entities.Sugerencia;
import es.mira.progesin.persistence.entities.User;
import es.mira.progesin.persistence.entities.enums.SeccionesEnum;
import es.mira.progesin.persistence.entities.enums.TipoRegistroEnum;
import es.mira.progesin.services.IRegistroActividadService;
import es.mira.progesin.services.ISugerenciaService;
import es.mira.progesin.services.IUserService;
import es.mira.progesin.util.FacesUtilities;
import es.mira.progesin.util.ICorreoElectronico;
import lombok.Getter;
import lombok.Setter;

/**
 * Controlador de las operaciones relacionadas con las sugerencias. Crear sugerencia de mejora. Eliminar sugerencia de
 * mejora. Responder sugerencia.
 * 
 * @author EZENTIS
 */

@Setter
@Getter
@Controller("sugerenciasBean")
@Scope("session")
public class SugerenciasBean implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * Variable utilizada para almacenar la sugerencia que se está gestionando.
     * 
     */
    private Sugerencia sugerencia;
    
    /**
     * Listado de sugerencias.
     * 
     */
    private List<Sugerencia> sugerenciasListado;
    
    /**
     * Variable utilizada para inyectar el servicio del correo.
     * 
     */
    @Autowired
    private transient ICorreoElectronico correo;
    
    /**
     * Variable utilizada para inyectar el servicio de sugerencias.
     * 
     */
    @Autowired
    private transient ISugerenciaService sugerenciaService;
    
    /**
     * Variable utilizada para inyectar el servicio de usuario.
     * 
     */
    @Autowired
    private transient IUserService userService;
    
    /**
     * Variable utilizada para inyectar el servicio de registro de actividad.
     * 
     */
    @Autowired
    private transient IRegistroActividadService regActividadService;
    
    /**
     * Guarda una nueva sugerencia con los datos del formulario.
     * 
     * @param modulo o sección del sistema al que hace referencia
     * @param descripcion de la sugerencia
     * @return vista crearSugerencia
     */
    public String guardarSugerencia(String modulo, String descripcion) {
        try {
            Sugerencia sugerenciaNueva = new Sugerencia();
            sugerenciaNueva.setModulo(modulo);
            sugerenciaNueva.setDescripcion(descripcion);
            sugerenciaService.save(sugerenciaNueva);
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_INFO, "Alta",
                    "Sugerencia guardada con éxito, cuando sea atendida recibirá un correo electrónico con la contestación.");
        } catch (DataAccessException e) {
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, Constantes.ERRORMENSAJE,
                    "Se ha producido un error al guardar la sugerencia. Inténtelo de nuevo más tarde.");
            regActividadService.altaRegActividadError(SeccionesEnum.SUGERENCIAS.getDescripcion(), e);
        }
        return "/principal/crearSugerencia?faces-redirect=true";
        
    }
    
    /**
     * Método que nos lleva al listado de sugerencias Se llama desde el menu lateral.
     * 
     */
    public void sugerenciasListado() {
        sugerencia = null;
        sugerenciasListado = (List<Sugerencia>) sugerenciaService.findAll();
    }
    
    /**
     * Método que nos lleva al listado de sugerencias y donde se elimina la sugerencia selecionada.
     * 
     * @param sugerenciaSeleccionada en la tabla
     */
    public void eliminarSugerencia(Sugerencia sugerenciaSeleccionada) {
        try {
            sugerenciaService.delete(sugerenciaSeleccionada.getIdSugerencia());
            sugerenciasListado.remove(sugerenciaSeleccionada);
            FacesUtilities.setMensajeInformativo(FacesMessage.SEVERITY_INFO, "Eliminación",
                    "Se ha eliminado con éxito la sugerencia.", "msgs");
        } catch (DataAccessException e) {
            FacesUtilities.setMensajeInformativo(FacesMessage.SEVERITY_ERROR, Constantes.ERRORMENSAJE,
                    "Se ha producido un error al eliminar la sugerencia. Inténtelo de nuevo más tarde.", "msgs");
            regActividadService.altaRegActividadError(SeccionesEnum.SUGERENCIAS.getDescripcion(), e);
        }
    }
    
    /**
     * Muestra el formulario para redactar y enviar la respuesta a una sugerencia.
     * 
     * @param sugerenciaSeleccionada en la tabla
     * @return vista contestarSugerencia
     */
    public String contestarSugerencia(Sugerencia sugerenciaSeleccionada) {
        sugerencia = sugerenciaSeleccionada;
        return "/administracion/sugerencias/contestarSugerencia?faces-redirect=true";
    }
    
    /**
     * Envía al correo electrónico de quien hizo la sugerencia el mensaje de respuesta.
     * 
     * @param sugerenciaSeleccionada en la tabla
     * @param contestacion mensaje a enviar
     * @return vista contestarSugerencia
     */
    public String contestar(Sugerencia sugerenciaSeleccionada, String contestacion) {
        try {
            String usuarioActual = SecurityContextHolder.getContext().getAuthentication().getName();
            Date fecha = new Date();
            sugerenciaSeleccionada.setFechaContestacion(fecha);
            sugerenciaSeleccionada.setUsuarioContestacion(usuarioActual);
            sugerenciaService.save(sugerenciaSeleccionada);
            String asunto = "Respuesta a su sugerencia sobre PROGESIN";
            String usuarioContestacion = sugerenciaSeleccionada.getUsuarioRegistro();
            User user = userService.findOne(usuarioContestacion);
            String fechaRegistro = new SimpleDateFormat("dd/MM/yyyy").format(sugerenciaSeleccionada.getFechaRegistro());
            StringBuilder mensaje = new StringBuilder("Sugerencia realizada el ").append(fechaRegistro)
                    .append(" sobre el módulo ").append(sugerencia.getModulo()).append("\r\n \"")
                    .append(sugerencia.getDescripcion()).append("\" \r\n \r\n").append(contestacion);
            correo.envioCorreo(user.getCorreo(), asunto, mensaje.toString());
            
            regActividadService.altaRegActividad(mensaje.toString(), TipoRegistroEnum.ALTA.name(),
                    SeccionesEnum.SUGERENCIAS.getDescripcion());
            
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_INFO, "Contestación",
                    "Mensaje de respuesta enviado correctamente.");
        } catch (CorreoException e) {
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, Constantes.ERRORMENSAJE,
                    "Se ha producido un error al enviar el correo electrónico.");
            regActividadService.altaRegActividadError(SeccionesEnum.SUGERENCIAS.getDescripcion(), e);
        } catch (DataAccessException e) {
            FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, Constantes.ERRORMENSAJE,
                    "Se ha producido un error al contestar la sugerencia. Inténtelo de nuevo más tarde.");
            regActividadService.altaRegActividadError(SeccionesEnum.SUGERENCIAS.getDescripcion(), e);
        }
        return "/administracion/sugerencias/contestarSugerencia?faces-redirect=true";
    }
    
}
