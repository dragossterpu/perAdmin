package es.mira.progesin.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.primefaces.model.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.mira.progesin.constantes.Constantes;
import es.mira.progesin.exceptions.ExcepcionRollback;
import es.mira.progesin.exceptions.anotacion.TransactionalRollback;
import es.mira.progesin.persistence.entities.Inspeccion;
import es.mira.progesin.persistence.entities.Municipio;
import es.mira.progesin.persistence.entities.User;
import es.mira.progesin.persistence.entities.enums.EstadoInspeccionEnum;
import es.mira.progesin.persistence.entities.enums.InformeEnum;
import es.mira.progesin.persistence.entities.informes.AsignSubareaInformeUser;
import es.mira.progesin.persistence.entities.informes.Informe;
import es.mira.progesin.persistence.entities.informes.ModeloInformePersonalizado;
import es.mira.progesin.persistence.entities.informes.RespuestaInforme;
import es.mira.progesin.persistence.entities.informes.SubareaInforme;
import es.mira.progesin.persistence.repositories.IInformeRepository;
import es.mira.progesin.persistence.repositories.IRespuestaInformeRepository;
import es.mira.progesin.persistence.repositories.ISubareaInformeRepository;
import es.mira.progesin.util.Utilities;
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
     * Servicio de asignación de subáreas de informe a inspectores.
     */
    @Autowired
    private IAsignSubareaInformeUserService asignSubareaInformeUserService;
    
    /**
     * Servicio de inspecciones.
     */
    @Autowired
    private IInspeccionesService inspeccionService;
    
    /**
     * Constructor vacío.
     * 
     */
    public InformeService() {
    }
    
    /**
     * Constante con el informe.
     */
    public static final String INFORME = "informe";
    
    /**
     * Constructor usado para el test.
     * 
     * @param sessionFact Factoría de sesiones
     * @param criteriaServ Servicio Criteria
     */
    public InformeService(SessionFactory sessionFact, ICriteriaService criteriaServ) {
        this.sessionFactory = sessionFact;
        this.criteriaService = criteriaServ;
    }
    
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
     * Guarda el informe con todas las subareas que hayan sido respondidas.
     * 
     * @param informe informe
     * @param mapaRespuestas respuestas
     * @return informe actualizado
     */
    
    @Override
    @Transactional(readOnly = false)
    public Informe guardarInforme(Informe informe, Map<SubareaInforme, String[]> mapaRespuestas,
            Map<SubareaInforme, String> mapaAsignaciones) {
        String usernameUsuarioActual = SecurityContextHolder.getContext().getAuthentication().getName();
        Informe informeActualizado = findConRespuestas(informe.getId());
        guardarRespuestas(mapaRespuestas, informeActualizado, mapaAsignaciones, usernameUsuarioActual);
        return informeRepository.save(informeActualizado);
    }
    
    /**
     * @param mapaRespuestas respuestas
     * @param informeActualizado informe actualizado
     * @param mapaAsignaciones asignaciones
     * @param usernameUsuarioActual username del inspector actual
     */
    private void guardarRespuestas(Map<SubareaInforme, String[]> mapaRespuestas, Informe informeActualizado,
            Map<SubareaInforme, String> mapaAsignaciones, String usernameUsuarioActual) {
        final List<RespuestaInforme> respuestas = new ArrayList<>();
        mapaRespuestas.forEach((subarea, respuesta) -> {
            if (usernameUsuarioActual.equals(mapaAsignaciones.get(subarea))) {
                byte[] texto = null;
                byte[] conclusiones = null;
                if (respuesta[0] != null && Utilities.noEstaVacio(respuesta[0])) {
                    texto = respuesta[0].getBytes();
                }
                if (respuesta[1] != null && Utilities.noEstaVacio(respuesta[1])) {
                    conclusiones = respuesta[1].getBytes();
                }
                subarea = subareaInformeRepository.findOne(subarea.getId());
                respuestas.add(new RespuestaInforme(informeActualizado, subarea, texto, conclusiones));
            }
        });
        respuestaInformeRepository.save(respuestas);
        informeActualizado.setRespuestas(respuestaInformeRepository.findByInforme(informeActualizado));
    }
    
    /**
     * Guarda el informe con todas las subareas que hayan sido respondidas y elimina las asignaciones del usuario
     * actual.
     * 
     * @param informe informe
     * @param mapaRespuestas respuestas
     * @return informe actualizado
     */
    @Override
    @Transactional(readOnly = false)
    public Informe desasignarInforme(Informe informe, Map<SubareaInforme, String[]> mapaRespuestas,
            Map<SubareaInforme, String> mapaAsignaciones) {
        User usuarioActual = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Informe informeActualizado = findConRespuestas(informe.getId());
        guardarRespuestas(mapaRespuestas, informeActualizado, mapaAsignaciones, usuarioActual.getUsername());
        asignSubareaInformeUserService.deleteByInformeAndUser(informeActualizado, usuarioActual);
        return informeRepository.save(informeActualizado);
    }
    
    /**
     * Finaliza y guarda el informe con todas las subareas que hayan sido respondidas.
     * 
     * @param informe informe
     * @param mapaRespuestas respuestas
     * @return informe actualizado
     */
    @Override
    @Transactional(readOnly = false)
    public Informe finalizarInforme(Informe informe, Map<SubareaInforme, String[]> mapaRespuestas,
            Map<SubareaInforme, String> mapaAsignaciones) {
        Informe informeGuardado = null;
        String usernameUsuarioActual = SecurityContextHolder.getContext().getAuthentication().getName();
        Informe informeActualizado = findConRespuestas(informe.getId());
        guardarRespuestas(mapaRespuestas, informeActualizado, mapaAsignaciones, usernameUsuarioActual);
        
        // Comprobar que todas las subáreas tienen respuesta
        Long nSubareasSinRta = buscaSubareasSinResponder(informe.getId());
        if (nSubareasSinRta == 0) {
            asignSubareaInformeUserService.deleteByInforme(informeActualizado);
            
            informeActualizado.setFechaFinalizacion(new Date());
            informeActualizado.setUsernameFinalizacion(usernameUsuarioActual);
            informeGuardado = informeRepository.save(informeActualizado);
            // Cambiamos el estado de la inspección a INFORME FINALIZADO
            Inspeccion inspeccion = inspeccionService.findInspeccionById(informe.getInspeccion().getId());
            inspeccion.setEstadoInspeccion(EstadoInspeccionEnum.J_INFORME_REALIZADO);
            inspeccionService.save(inspeccion);
        }
        return informeGuardado;
    }
    
    /**
     * Recupera un informe con sus respuestas a partir de su id.
     * 
     * @param id id del informe
     * @return informe completo
     */
    @Override
    public Informe findConRespuestas(Long id) {
        return informeRepository.findById(id);
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
        Criteria criteria = session.createCriteria(Informe.class, INFORME);
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
        Criteria criteria = session.createCriteria(Informe.class, INFORME);
        creaCriteria(informeBusqueda, criteria);
        
        int cnt = criteria.list().size();
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
        
        criteriaAreas(criteria, informeBusqueda);
        criteriaInspeccion(criteria, informeBusqueda);
        criteriaEstadoInforme(criteria, informeBusqueda.getEstado());
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        
    }
    
    /**
     * Añade al criteria los parámetros de área y subárea.
     * 
     * @param informeBusqueda informe personalizado a guardar
     * @param criteria informe a guardar
     * 
     */
    private void criteriaAreas(Criteria criteria, InformeBusqueda informeBusqueda) {
        
        if (informeBusqueda.getModeloInforme() != null) {
            criteria.createAlias("informe.modeloPersonalizado", "modeloPersonalizado");
            
            criteria.add(Restrictions.eq("modeloPersonalizado.modeloInforme", informeBusqueda.getModeloInforme()));
        }
        
        if (informeBusqueda.getSelectedAreas() != null && !informeBusqueda.getSelectedAreas().isEmpty()) {
            
            DetachedCriteria subcrit = DetachedCriteria.forClass(RespuestaInforme.class, "respuesta");
            subcrit.createAlias("respuesta.subarea", "subarea");
            subcrit.createAlias("subarea.area", "area");
            
            Long[] longArea = new Long[informeBusqueda.getSelectedAreas().size()];
            for (int i = 0; i < informeBusqueda.getSelectedAreas().size(); i++) {
                longArea[i] = informeBusqueda.getSelectedAreas().get(i).getId();
            }
            
            subcrit.add(Restrictions.in("area.id", longArea));
            subcrit.setProjection(Projections.property(INFORME));
            
            criteria.add(Property.forName("id").in(subcrit));
            
            if (informeBusqueda.getSelectedSubAreas() != null && !informeBusqueda.getSelectedSubAreas().isEmpty()) {
                
                DetachedCriteria subcritsubarea = DetachedCriteria.forClass(RespuestaInforme.class, "respuesta");
                subcritsubarea.createAlias("respuesta.subarea", "subarea");
                
                Long[] longSubArea = new Long[informeBusqueda.getSelectedSubAreas().size()];
                for (int i = 0; i < informeBusqueda.getSelectedSubAreas().size(); i++) {
                    longSubArea[i] = informeBusqueda.getSelectedSubAreas().get(i).getId();
                }
                subcritsubarea.add(Restrictions.in("subarea.id", longSubArea));
                
                subcritsubarea.setProjection(Projections.property(INFORME));
                criteria.add(Property.forName("id").in(subcritsubarea));
            }
        }
        
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
        if (informeBusqueda.getCuatrimestre() != null) {
            criteria.add(Restrictions.eq("inspeccion.cuatrimestre", informeBusqueda.getCuatrimestre()));
        }
        
        criteriaEquipo(criteria, informeBusqueda);
        criteriaMunicipio(criteria, informeBusqueda);
        criteriaService.creaCriteriaEquipoInformes(criteria);
        
    }
    
    /**
     * Añade al criteria la búsqueda por equipo y tipo de equipo.
     * 
     * @param criteria Criteria al que se añadirán los parámetros.
     * @param informeBusqueda Objeto de búsqueda
     */
    private void criteriaEquipo(Criteria criteria, InformeBusqueda informeBusqueda) {
        if (informeBusqueda.getEquipo() != null) {
            criteria.add(Restrictions.eq("inspeccion.equipo", informeBusqueda.getEquipo()));
        }
        
        if (informeBusqueda.getTipoUnidad() != null) {
            criteria.createAlias("inspeccion.equipo", "equipo"); // inner join
            criteria.createAlias("equipo.tipoEquipo", "tipoEquipo"); // inner join
            criteria.add(Restrictions.eq("tipoEquipo.id", informeBusqueda.getTipoUnidad().getId()));
        }
    }
    
    /**
     * Añade al criteria el filtro de provincias y municipios.
     * 
     * @param criteria Criteria al que se añadirán los parámetros.
     * @param informeBusqueda Objeto de búsqueda
     */
    private void criteriaMunicipio(Criteria criteria, InformeBusqueda informeBusqueda) {
        if (informeBusqueda.getProvincia() != null) {
            DetachedCriteria subquery = DetachedCriteria.forClass(Municipio.class, "munic");
            subquery.add(Restrictions.eq("munic.provincia", informeBusqueda.getProvincia()));
            subquery.setProjection(Projections.property("munic.id"));
            criteria.add(Property.forName("inspeccion.municipio").in(subquery));
        }
        
        if (informeBusqueda.getMunicipio() != null) {
            criteria.add(Restrictions.eq("inspeccion.municipio", informeBusqueda.getMunicipio()));
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
    
    /**
     * Comprobar si hay algún informe basado en éste modelo personalizado.
     * 
     * @param modeloPersonalizado modelo de informe personalizado
     * @return verdadero o falso
     */
    @Override
    public boolean existsByModeloPersonalizado(ModeloInformePersonalizado modeloPersonalizado) {
        return informeRepository.existsByModeloPersonalizado(modeloPersonalizado);
    }
    
    /**
     * Comprueba si existe una asignación de un subárea de un informe y sino la crea asociada al usuario del inspector
     * al que pertenece la sesión actual.
     * 
     * @param subarea subárea seleccionada
     * @param informe informe de la inspección en curso
     * @return asignación existente o la nueva creada
     */
    @Override
    @Transactional(readOnly = false)
    public AsignSubareaInformeUser asignarSubarea(SubareaInforme subarea, Informe informe) {
        AsignSubareaInformeUser asignacion = asignSubareaInformeUserService.findBySubareaAndInforme(subarea, informe);
        if (asignacion == null) {
            User usuarioActual = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            SubareaInforme subareaActualizada = subareaInformeRepository.findOne(subarea.getId());
            Informe informeActualizado = informeRepository.findOne(informe.getId());
            AsignSubareaInformeUser nuevaAsignacion = new AsignSubareaInformeUser(subareaActualizada,
                    informeActualizado, usuarioActual);
            asignacion = asignSubareaInformeUserService.save(nuevaAsignacion);
        }
        return asignacion;
    }
    
    /**
     * Comprueba si para un informe dado existen subáres sin responder.
     * 
     * @param idInforme id del informe
     * @return 0 si todas las subáreas han sido respondidas
     */
    @Override
    public Long buscaSubareasSinResponder(Long idInforme) {
        return subareaInformeRepository.buscaSubareasSinResponder(idInforme);
    }
    
    /**
     * Crea el informe de una inspección a partir de un modelo.
     * 
     * @param inspeccion inspección a partir de la que se creará el informe
     * @param modeloInformePersonalizado modelo que se utilizará para crear el informe
     * @throws ExcepcionRollback Excepción lanzada si no se puede crear el informe
     */
    @Override
    @TransactionalRollback
    public void crearInforme(Inspeccion inspeccion, ModeloInformePersonalizado modeloInformePersonalizado)
            throws ExcepcionRollback {
        // Validación
        existsByInspeccionAndFechaBajaIsNull(inspeccion);
        
        Informe nuevoInforme = Informe.builder().modeloPersonalizado(modeloInformePersonalizado).inspeccion(inspeccion)
                .build();
        informeRepository.save(nuevoInforme);
        inspeccion.setEstadoInspeccion(EstadoInspeccionEnum.I_ELABORACION_INFORME);
        inspeccionService.save(inspeccion);
    }
    
    /**
     * Comprueba si existen otros informes no anulados asociados a la inspeccion.
     * 
     * @param inspeccion inspeccion asociada al informe
     * @throws ExcepcionRollback Excepción que se lanza si ya existe un informe para esta inspección sin anular
     */
    @Override
    public void existsByInspeccionAndFechaBajaIsNull(Inspeccion inspeccion) throws ExcepcionRollback {
        if (informeRepository.existsByInspeccionAndFechaBajaIsNull(inspeccion))
            throw new ExcepcionRollback(
                    "No se puede crear un informe ya que existe otro para esta inspección. Debe anularlo antes de proseguir.");
    }
    
}
