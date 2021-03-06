package es.mira.progesin.services;

import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.primefaces.model.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Throwables;

import es.mira.progesin.constantes.Constantes;
import es.mira.progesin.persistence.entities.RegistroActividad;
import es.mira.progesin.persistence.entities.enums.TipoRegistroEnum;
import es.mira.progesin.persistence.repositories.IRegActividadRepository;
import es.mira.progesin.web.beans.RegActividadBusqueda;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * Implementación del servicio de Registro de Actividad.
 * 
 * @author EZENTIS
 *
 */

@Slf4j
@NoArgsConstructor
@Service("registroActividadService")
public class RegistroActividadService implements IRegistroActividadService {
    
    /**
     * Repositorio de registro de actividad.
     */
    @Autowired
    private IRegActividadRepository regActividadRepository;
    
    /**
     * Factoría de sesiones.
     */
    @Autowired
    private SessionFactory sessionFactory;
    
    /**
     * Servicio para usar los métodos usados junto con criteria.
     */
    @Autowired
    private ICriteriaService criteriaService;
    
    /**
     * Constructor usado para el test.
     * 
     * @param sessionFact Factoría de sesiones
     * @param criteriaServ Servicio Criteria
     */
    public RegistroActividadService(SessionFactory sessionFact, ICriteriaService criteriaServ) {
        this.sessionFactory = sessionFact;
        this.criteriaService = criteriaServ;
    }
    
    /**
     * Guarda en base de datos un registro de actividad.
     * 
     * @param entity Registro a guardar en base de datos
     * @return Registro guardado
     */
    @Override
    @Transactional(readOnly = false)
    public RegistroActividad save(RegistroActividad entity) {
        return regActividadRepository.save(entity);
    }
    
    /**
     * Devuelve el número total de registros de una búsqueda.
     * 
     * @param regActividadBusqueda Objeto que contiene los criterios de búsqueda
     * @return Número de registros que responden a la búsqueda
     */
    @Override
    public int getCounCriteria(RegActividadBusqueda regActividadBusqueda) {
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(RegistroActividad.class);
        creaCriteria(regActividadBusqueda, criteria);
        criteria.setProjection(Projections.rowCount());
        Long cnt = (Long) criteria.uniqueResult();
        session.close();
        
        return Math.toIntExact(cnt);
    }
    
    /**
     * Busca registros de actividad según unos parámetros de forma paginada.
     * 
     * @param first Primer elemento a mostrar
     * @param pageSize Número máximo de registros recuperados
     * @param sortField Campo de ordenación
     * @param sortOrder Sentido de la ordenación
     * @param regActividadBusqueda Objeto que contiene los parámetros de búsqueda
     * @return Listado de los registros que responden a la búsqueda
     */
    @Override
    public List<RegistroActividad> buscarRegActividadCriteria(int first, int pageSize, String sortField,
            SortOrder sortOrder, RegActividadBusqueda regActividadBusqueda) {
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(RegistroActividad.class);
        creaCriteria(regActividadBusqueda, criteria);
        
        criteriaService.prepararPaginacionOrdenCriteria(criteria, first, pageSize, sortField, sortOrder,
                "idRegActividad");
        
        @SuppressWarnings("unchecked")
        List<RegistroActividad> listado = criteria.list();
        session.close();
        
        return listado;
    }
    
    /**
     * Consulta criteria para la búsqueda del registro de actividad.
     * 
     * @param criteria consulta criteria
     * @param regActividadBusqueda Objeto que contiene los parámetros de búsqueda
     */
    private void creaCriteria(RegActividadBusqueda regActividadBusqueda, Criteria criteria) {
        
        if (regActividadBusqueda.getFechaDesde() != null) {
            criteria.add(Restrictions.ge(Constantes.FECHAALTA, regActividadBusqueda.getFechaDesde()));
        }
        
        if (regActividadBusqueda.getFechaHasta() != null) {
            Date fechaHasta = new Date(regActividadBusqueda.getFechaHasta().getTime() + TimeUnit.DAYS.toMillis(1));
            criteria.add(Restrictions.le(Constantes.FECHAALTA, fechaHasta));
        }
        if (regActividadBusqueda.getNombreSeccion() != null) {
            criteria.add(
                    Restrictions.ilike("nombreSeccion", regActividadBusqueda.getNombreSeccion(), MatchMode.ANYWHERE));
        }
        if (regActividadBusqueda.getTipoRegActividad() != null) {
            criteria.add(Restrictions.ilike("tipoRegActividad", regActividadBusqueda.getTipoRegActividad(),
                    MatchMode.ANYWHERE));
        }
        if (regActividadBusqueda.getUsernameRegActividad() != null) {
            criteria.add(Restrictions.ilike("usernameRegActividad", regActividadBusqueda.getUsernameRegActividad(),
                    MatchMode.ANYWHERE));
        }
        
    }
    
    /**
     * Se introduce un registro de error en la base de datos.
     * 
     * @param nombreSeccion Nombre de la sección en la que se produce el error
     * @param e Excepción lanzada por la aplicación cuando se produce el error
     */
    @Override
    public void altaRegActividadError(String nombreSeccion, Exception e) {
        try {
            RegistroActividad registroActividad = new RegistroActividad();
            registroActividad.setTipoRegActividad(TipoRegistroEnum.ERROR.name());
            registroActividad.setFechaAlta(new Date());
            registroActividad.setNombreSeccion(nombreSeccion);
            registroActividad.setUsernameRegActividad(SecurityContextHolder.getContext().getAuthentication().getName());
            registroActividad.setDescripcion(Throwables.getStackTraceAsString(e));
            regActividadRepository.save(registroActividad);
        } catch (DataAccessException e1) {
            log.error(nombreSeccion, e1);
            
        }
    }
    
    /**
     * Se introduce un registro de actividad en la base de datos.
     * 
     * @param descripcion Descripción del registro
     * @param tipoReg Tipo de actividad registrada
     * @param seccion Sección en la que se hace el registro
     */
    @Override
    public void altaRegActividad(String descripcion, String tipoReg, String seccion) {
        try {
            RegistroActividad registroActividad = new RegistroActividad();
            registroActividad.setTipoRegActividad(tipoReg);
            if (SecurityContextHolder.getContext().getAuthentication() != null) {
                registroActividad
                        .setUsernameRegActividad(SecurityContextHolder.getContext().getAuthentication().getName());
            } else {
                registroActividad.setUsernameRegActividad("system");
            }
            registroActividad.setFechaAlta(new Date());
            registroActividad.setNombreSeccion(seccion);
            registroActividad.setDescripcion(descripcion);
            regActividadRepository.save(registroActividad);
        } catch (DataAccessException e) {
            altaRegActividadError(seccion, e);
        }
        
    }
    
    /**
     * Listado de registros de actividad para una sección.
     * 
     * @param infoSeccion Sección para la que se hace la consulta
     * @return Listado de los registros de la sección
     */
    @Override
    public List<String> buscarPorNombreSeccion(String infoSeccion) {
        return regActividadRepository.buscarPorNombreSeccion("%" + infoSeccion + "%");
    }
    
    /**
     * Busca los registros realizados por un usuario.
     * 
     * @param infoUsuario Usuario para el que se hace la consulta
     * @return Listado de los registros resultantes
     */
    @Override
    public List<String> buscarPorUsuarioRegistro(String infoUsuario) {
        return regActividadRepository.buscarPorUsuarioRegistro("%" + infoUsuario + "%");
    }
    
}
