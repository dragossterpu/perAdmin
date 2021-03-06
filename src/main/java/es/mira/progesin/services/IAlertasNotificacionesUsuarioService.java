package es.mira.progesin.services;

import java.util.List;

import es.mira.progesin.persistence.entities.Alerta;
import es.mira.progesin.persistence.entities.AlertasNotificacionesUsuario;
import es.mira.progesin.persistence.entities.Equipo;
import es.mira.progesin.persistence.entities.Inspeccion;
import es.mira.progesin.persistence.entities.Notificacion;
import es.mira.progesin.persistence.entities.enums.RoleEnum;
import es.mira.progesin.persistence.entities.enums.TipoMensajeEnum;

/**
 * 
 * Interfaz para el servicio de Alertas y Notificaciones de usuario.
 * 
 * @author EZENTIS
 * 
 */

public interface IAlertasNotificacionesUsuarioService {
    
    /**
     * 
     * Elimina un registro de base de datos. El registro se identifica por su tipo, el id y el usuario vinculado
     * 
     * @param user que tiene asignado el mensaje
     * @param id identificador del mensaje
     * @param tipo de Mensaje (Alerta o Notificacion)
     * 
     */
    
    void delete(String user, Long id, TipoMensajeEnum tipo);
    
    /**
     * 
     * Guarda un registro en base de datos.
     * 
     * @param entity Mensaje (Alerta o Notificacion) a guardar en base de datos
     * @return Mensaje (Alerta o Notificacion)
     * 
     */
    
    AlertasNotificacionesUsuario save(AlertasNotificacionesUsuario entity);
    
    /**
     * 
     * Devuelve un listado de alertas vinculadas al usuario.
     * 
     * @param user usuario para el que se busca el listado de alertas
     * @return listado de alertas asignadas al usuario
     * 
     */
    
    List<Alerta> findAlertasByUser(String user);
    
    /**
     * 
     * Devuelve un listado de notificaciones vinculadas al usuario.
     * 
     * @param user usuario para el que se busca el listado de notificaciones
     * @return listado de alertas asignadas al usuario
     * 
     */
    
    List<Notificacion> findNotificacionesByUser(String user);
    
    /**
     * 
     * Graba un mensaje (Alerta o Notificacion) vinculado a un usuario.
     * 
     * @param entidad Alerta o Notificación a grabar
     * @param user usuario al que se asigna el mensaje
     * 
     */
    
    void grabarMensajeUsuario(Object entidad, String user);
    
    /**
     * 
     * Graba un mensaje (Alerta o Notificacion) vinculado al jefe de un equipo.
     * 
     * @param entidad Alerta o Notificación a grabar
     * @param inspeccion Se asignará el mensaje al jefe del equipo que tiene asignada esta inspección
     * 
     */
    
    void grabarMensajeJefeEquipo(Object entidad, Inspeccion inspeccion);
    
    /**
     * 
     * Graba un mensaje (Alerta o Notificacion) vinculado a todos los usuarios pertenecientes a un mismo rol.
     * 
     * @param entidad Alerta o Notificación a grabar
     * @param rol rol del los usuarios a los que se asignará el mensaje
     * 
     */
    
    void grabarMensajeRol(Object entidad, RoleEnum rol);
    
    /**
     * 
     * Graba un mensaje (Alerta o Notificacion) vinculado a todos los usuarios pertenecientes a una lista de roles.
     * 
     * @param entidad Alerta o Notificación a grabar
     * @param roles lista de roles a los que pertenecen los usuarios a los que se asignará el mensaje
     * 
     */
    
    void grabarMensajeRol(Object entidad, List<RoleEnum> roles);
    
    /**
     * 
     * Graba un mensaje (Alerta o Notificacion) vinculado a todos los usuarios pertenecientes al equipo asignado a una
     * inspección.
     * 
     * @param entidad Alerta o Notificación
     * @param equipo al que se desea enviar el Mensaje (Alerta o Notificacion)
     * 
     */
    
    void grabarMensajeEquipo(Object entidad, Equipo equipo);
    
    /**
     * 
     * Recupera la lista de notificaciones en función de una lista contenida en una lista de
     * AlertasNotificacionesUsuario pasada como parámetro.
     * 
     * @param lista Lista de mensajes (alertas o notificaciones)
     * @return Lista de notificaciones
     * 
     */
    
    List<Notificacion> findNotificaciones(List<AlertasNotificacionesUsuario> lista);
    
    /**
     * 
     * Recupera la lista de alertas en función de una lista contenida en una lista de AlertasNotificacionesUsuario
     * pasada como parámetro.
     * 
     * @param lista Lista de mensajes (alertas o notificaciones)
     * @return Lista de alertas
     * 
     */
    
    List<Alerta> findAlertas(List<AlertasNotificacionesUsuario> lista);
    
}
