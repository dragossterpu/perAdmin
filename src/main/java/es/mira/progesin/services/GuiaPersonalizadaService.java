package es.mira.progesin.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import es.mira.progesin.constantes.Constantes;
import es.mira.progesin.persistence.entities.Guia;
import es.mira.progesin.persistence.entities.GuiaPasos;
import es.mira.progesin.persistence.entities.GuiaPersonalizada;
import es.mira.progesin.persistence.entities.enums.EstadoEnum;
import es.mira.progesin.persistence.repositories.IGuiaPersonalizadaRepository;
import es.mira.progesin.persistence.repositories.IGuiasPasosRepository;
import es.mira.progesin.web.beans.GuiaPersonalizadaBusqueda;

/**********************************************************
 * 
 * Implementación de los métodos definidos en la interfaz IGuiaPersonalizadaService
 * 
 * @author Ezentis
 *
 ***********************************************************/

@Service
public class GuiaPersonalizadaService implements IGuiaPersonalizadaService {
    
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Autowired
    private IGuiaPersonalizadaRepository guiaPersonalizadaRepository;
    
    @Autowired
    private IGuiasPasosRepository pasosRepository;
    
    @Override
    public void eliminar(GuiaPersonalizada guia) {
        guiaPersonalizadaRepository.delete(guia);
        
    }
    
    @Override
    public GuiaPersonalizada save(GuiaPersonalizada guia) {
        return guiaPersonalizadaRepository.save(guia);
    }
    
    @Override
    public List<GuiaPersonalizada> buscarGuiaPorCriteria(int firstResult, int maxResults,
            GuiaPersonalizadaBusqueda busqueda) {
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(GuiaPersonalizada.class, "guiaPersonalizada");
        
        consultaCriteriaGuiasPersonalizadas(busqueda, criteria);
        criteria.setFirstResult(firstResult);
        criteria.setMaxResults(maxResults);
        criteria.addOrder(Order.desc("fechaCreacion"));
        
        @SuppressWarnings("unchecked")
        List<GuiaPersonalizada> listaGuias = criteria.list();
        session.close();
        
        return listaGuias;
    }
    
    @Override
    public long getCountGuiaCriteria(GuiaPersonalizadaBusqueda busqueda) {
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(GuiaPersonalizada.class, "guiaPersonalizada");
        
        consultaCriteriaGuiasPersonalizadas(busqueda, criteria);
        criteria.setProjection(Projections.rowCount());
        Long cnt = (Long) criteria.uniqueResult();
        
        session.close();
        
        return cnt;
    }
    
    /**
     * @param busqueda
     * @param criteria
     */
    private void consultaCriteriaGuiasPersonalizadas(GuiaPersonalizadaBusqueda busqueda, Criteria criteria) {
        if (busqueda.getFechaDesde() != null) {
            /**
             * Hace falta truncar la fecha para recuperar todos los registros de ese día sin importar la hora, sino
             * compara con 0:00:00
             */
            criteria.add(Restrictions
                    .sqlRestriction("TRUNC(this_.fecha_creacion) >= '" + sdf.format(busqueda.getFechaDesde()) + "'"));
        }
        if (busqueda.getFechaHasta() != null) {
            /**
             * Hace falta truncar la fecha para recuperar todos los registros de ese día sin importar la hora, sino
             * compara con 0:00:00
             */
            criteria.add(Restrictions
                    .sqlRestriction("TRUNC(this_.fecha_creacion) <= '" + sdf.format(busqueda.getFechaHasta()) + "'"));
        }
        
        if (busqueda.getNombre() != null && !busqueda.getNombre().isEmpty()) {
            criteria.add(Restrictions.sqlRestriction(
                    String.format(Constantes.COMPARADORSINACENTOS, "nombre_guia_personalizada", busqueda.getNombre())));
        }
        
        if (busqueda.getUsuarioCreacion() != null && !busqueda.getUsuarioCreacion().isEmpty()) {
            criteria.add(Restrictions.sqlRestriction(String.format(Constantes.COMPARADORSINACENTOS, "USERNAME_CREACION",
                    busqueda.getUsuarioCreacion())));
        }
        
        if (busqueda.getTipoInspeccion() != null) {
            criteria.createCriteria("guia").add(Restrictions.eq("tipoInspeccion", busqueda.getTipoInspeccion()));
        }
        if (busqueda.getEstado() != null) {
            if (EstadoEnum.INACTIVO.equals(busqueda.getEstado())) {
                criteria.add(Restrictions.isNotNull("fechaAnulacion"));
            } else {
                criteria.add(Restrictions.isNull("fechaAnulacion"));
            }
        }
        criteria.add(Restrictions.isNull("fechaBaja"));
    }
    
    @Override
    public List<GuiaPasos> listaPasos(GuiaPersonalizada guia) {
        return pasosRepository.findPasosElegidosGuiaPersonalizada(guia.getId());
    }
    
    @Override
    public void anular(GuiaPersonalizada guia) {
        guia.setFechaAnulacion(new Date());
        guia.setUsernameAnulacion(SecurityContextHolder.getContext().getAuthentication().getName());
        guiaPersonalizadaRepository.save(guia);
        
    }
    
    @Override
    public boolean buscarPorModeloGuia(Guia guia) {
        return guiaPersonalizadaRepository.findByIdGuia(guia);
    }
    
}
