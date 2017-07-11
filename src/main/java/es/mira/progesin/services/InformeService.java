package es.mira.progesin.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.primefaces.model.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.mira.progesin.constantes.Constantes;
import es.mira.progesin.persistence.entities.enums.InformeEnum;
import es.mira.progesin.persistence.entities.informes.Informe;
import es.mira.progesin.persistence.entities.informes.RespuestaInforme;
import es.mira.progesin.persistence.entities.informes.SubareaInforme;
import es.mira.progesin.persistence.repositories.IInformeRepository;
import es.mira.progesin.persistence.repositories.IRespuestaInformeRepository;
import es.mira.progesin.persistence.repositories.ISubareaInformeRepository;
import es.mira.progesin.web.beans.informes.InformeBusqueda;

/**
 * Servicio de informes de inspección.
 * 
 * @author EZENTIS
 */
@Service
public class InformeService implements IInformeService {
    
    /**
     * Variable utilizada para inyectar la sesión de spring.
     * 
     */
    @Autowired
    private SessionFactory sessionFactory;
    
    /**
     * Servicio para usar los métodos usados junto con criteria.
     */
    @Autowired
    private ICriteriaService criteriaService;
    
    /**
     * Repositorio de informes.
     */
    @Autowired
    private IInformeRepository informeRepository;
    
    /**
     * Repositorio respuestas.
     */
    @Autowired
    private IRespuestaInformeRepository respuestaInformeRepository;
    
    /**
     * Repositorio de subareas de informe.
     */
    @Autowired
    private ISubareaInformeRepository subareaInformeRepository;
    
    /**
     * Guarda la información de un informe en la bdd.
     * 
     * @param informe informe creado o modificado
     * @return informe sincronizado
     */
    @Override
    public Informe save(Informe informe) {
        return informeRepository.save(informe);
    }
    
    /**
     * Guarda el informe y todas las subareas que hayan sido respondidas.
     * 
     * @param informe informe
     * @param mapaRespuestas respuestas
     * @return informe actualizado
     */
    @Override
    @Transactional(readOnly = false)
    public Informe saveConRespuestas(Informe informe, Map<SubareaInforme, String> mapaRespuestas) {
        Informe informeActualizado = informeRepository.findOne(informe.getId());
        final List<RespuestaInforme> respuestas = new ArrayList<>();
        mapaRespuestas.forEach((subarea, respuesta) -> {
            if (respuesta != null) {
                subarea = subareaInformeRepository.findOne(subarea.getId());
                respuestas.add(new RespuestaInforme(informeActualizado, subarea, respuesta.getBytes()));
            }
        });
        informeActualizado.setRespuestas(respuestaInformeRepository.save(respuestas));
        return informeRepository.save(informeActualizado);
    }
    
    /**
     * Recupera un informe con sus respuestas a partir de su id.
     * 
     * @param id id del informe
     * @return informe completo
     */
    @Override
    public Informe findOne(Long id) {
        return informeRepository.findOne(id);
    }
    
    /**
     * Método que devuelve la lista de informes en una consulta basada en criteria.
     * 
     * @param informeBusqueda objeto con los criterios de búsqueda
     * @param first primer elemento de la consulta
     * @param pageSize tamaño de cada página de resultados
     * @param sortField campo por el que se ordenan los resultados
     * @param sortOrder sentido de la ordenacion (ascendente/descendente)
     * @return la lista de informes.
     */
    @Override
    public List<Informe> buscarInformeCriteria(int first, int pageSize, String sortField, SortOrder sortOrder,
            InformeBusqueda informeBusqueda) {
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(Informe.class, "informe");
        creaCriteria(informeBusqueda, criteria);
        
        criteriaService.prepararPaginacionOrdenCriteria(criteria, first, pageSize, sortField, sortOrder, "id");
        
        @SuppressWarnings("unchecked")
        List<Informe> listaInformes = criteria.list();
        session.close();
        
        return listaInformes;
    }
    
    /**
     * Método que devuelve el número de informes en una consulta basada en criteria.
     * 
     * @param informeBusqueda objeto con parámetros de búsqueda
     * @return devuelve el número de registros de la consulta criteria.
     */
    @Override
    public int getCountInformeCriteria(InformeBusqueda informeBusqueda) {
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(Informe.class, "informe");
        creaCriteria(informeBusqueda, criteria);
        criteria.setProjection(Projections.rowCount());
        Long cnt = (Long) criteria.uniqueResult();
        session.close();
        
        return Math.toIntExact(cnt);
    }
    
    /**
     * Crea la consulta criteria.
     * 
     * @param informeBusqueda informe personalizado a guardar
     * @param criteria informe a guardar
     * 
     */
    private void creaCriteria(InformeBusqueda informeBusqueda, Criteria criteria) {
        
        if (informeBusqueda.getFechaDesde() != null) {
            criteria.add(Restrictions.ge(Constantes.FECHAALTA, informeBusqueda.getFechaDesde()));
        }
        if (informeBusqueda.getFechaHasta() != null) {
            Date fechaHasta = new Date(informeBusqueda.getFechaHasta().getTime() + TimeUnit.DAYS.toMillis(1));
            criteria.add(Restrictions.le(Constantes.FECHAALTA, fechaHasta));
        }
        if (informeBusqueda.getUsuarioCreacion() != null) {
            criteria.add(Restrictions.ilike(Constantes.USERNAMEALTA, informeBusqueda.getUsuarioCreacion(),
                    MatchMode.ANYWHERE));
        }
        
        criteriaInspeccion(criteria, informeBusqueda);
        criteriaEstadoInforme(criteria, informeBusqueda.getEstado());
        
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
    }
    
    /**
     * Restricciones criteria que tienen que ver con la inspección asociada al informe.
     * 
     * @param criteria Criteria al que se añadirán los parámetros.
     * @param informeBusqueda informe personalizado a guardar
     */
    private void criteriaInspeccion(Criteria criteria, InformeBusqueda informeBusqueda) {
        criteria.createAlias("informe.inspeccion", "inspeccion"); // inner join
        criteria.createAlias("inspeccion.tipoInspeccion", "tipoInspeccion"); // inner join
        if (informeBusqueda.getIdInspeccion() != null) {
            criteria.add(Restrictions.eq("inspeccion.id", Long.parseLong(informeBusqueda.getIdInspeccion())));
        }
        if (informeBusqueda.getAnioInspeccion() != null) {
            criteria.add(Restrictions.eq("inspeccion.anio", Integer.parseInt(informeBusqueda.getAnioInspeccion())));
        }
        if (informeBusqueda.getAmbitoInspeccion() != null) {
            criteria.add(Restrictions.eq("inspeccion.ambito", informeBusqueda.getAmbitoInspeccion()));
        }
        if (informeBusqueda.getTipoInspeccion() != null) {
            criteria.add(Restrictions.eq("tipoInspeccion.codigo", informeBusqueda.getTipoInspeccion().getCodigo()));
        }
        if (informeBusqueda.getNombreUnidad() != null) {
            criteria.add(Restrictions.ilike("inspeccion.nombreUnidad", informeBusqueda.getNombreUnidad(),
                    MatchMode.ANYWHERE));
        }
    }
    
    /**
     * Añade al criteria el filtro con el estado del informe. En caso de no seleccionar ningún estado se mostrarán sólo
     * las solicitudes que no estén dadas de baja.
     * 
     * @param criteria Criteria al que se añadirán los parámetros.
     * @param estado del informe
     */
    private void criteriaEstadoInforme(Criteria criteria, InformeEnum estado) {
        if (estado != null) {
            switch (estado) {
                case INICIADO:
                    criteria.add(Restrictions.isNotNull(Constantes.FECHAALTA));
                    criteria.add(Restrictions.isNull(Constantes.FECHAFINALIZACION));
                    criteria.add(Restrictions.isNull(Constantes.FECHABAJA));
                    break;
                case FINALIZADO:
                    criteria.add(Restrictions.isNotNull(Constantes.FECHAFINALIZACION));
                    criteria.add(Restrictions.isNull(Constantes.FECHABAJA));
                    break;
                case ANULADA:
                    criteria.add(Restrictions.isNotNull(Constantes.FECHABAJA));
                    break;
                default:
                    break;
            }
        } else {
            criteria.add(Restrictions.isNull(Constantes.FECHABAJA));
        }
    }
    
}
