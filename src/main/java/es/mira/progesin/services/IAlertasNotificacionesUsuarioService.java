package es.mira.progesin.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import es.mira.progesin.persistence.entities.Alerta;
import es.mira.progesin.persistence.entities.AlertasNotificacionesUsuario;
import es.mira.progesin.persistence.entities.Inspeccion;
import es.mira.progesin.persistence.entities.Notificacion;
import es.mira.progesin.persistence.entities.enums.RoleEnum;
import es.mira.progesin.persistence.entities.enums.TipoMensajeEnum;

public interface IAlertasNotificacionesUsuarioService {

	void delete(String user, Long id, TipoMensajeEnum tipo);

	AlertasNotificacionesUsuario save(AlertasNotificacionesUsuario entity);
	
	List<Alerta> findAlertasByUser(String user);
	
	List<Notificacion> findNotificacionesByUser(String user);
	
	AlertasNotificacionesUsuario grabarMensajeUsuario(Object entidad, String user);
	
	AlertasNotificacionesUsuario grabarMensajeJefeEquipo(Object entidad, Inspeccion inspeccion);
	
	void grabarMensajeRol(Object entidad, RoleEnum rol);
	
	void grabarMensajeRol(Object entidad, List<RoleEnum> roles);
	
	void grabarMensajeEquipo(Object entidad, Inspeccion inspeccion);
	
	List<Notificacion> findNotificaciones(List<AlertasNotificacionesUsuario> lista);
	
	List<Alerta> findAlertas(List<AlertasNotificacionesUsuario> lista);
	
	Page<AlertasNotificacionesUsuario>  findByUsuarioAndTipo(String usuario, TipoMensajeEnum tipo, Pageable request);
	
	
	
}