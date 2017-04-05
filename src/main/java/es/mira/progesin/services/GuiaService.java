package es.mira.progesin.services;

import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.mira.progesin.persistence.entities.Guia;
import es.mira.progesin.persistence.entities.GuiaPasos;
import es.mira.progesin.persistence.entities.enums.EstadoEnum;
import es.mira.progesin.persistence.repositories.IGuiasPasosRepository;
import es.mira.progesin.persistence.repositories.IGuiasRepository;
import es.mira.progesin.web.beans.GuiaBusqueda;

/**********************************************************
 * 
 * Implementación de los métodos definidos en la interfaz IGuiaService
 * 
 * @author Ezentis
 *
 ***********************************************************/

@Service
public class GuiaService implements IGuiaService {
    
    private static final String COMPARADORSINACENTOS = "upper(convert(replace(%1$s, \' \', \'\'), \'US7ASCII\')) LIKE upper(convert(\'%%\' || replace(\'%2$s\', \' \', \'\') || \'%%\', \'US7ASCII\'))";
    
    private SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Autowired
    private IGuiasPasosRepository pasosRepository;
    
    @Autowired
    private IGuiasRepository guiaRepository;
    
    /**
     * Busca en la base de datos las guías que cumplan con los criterios contenidos en el objeto GuiaBusqueda que se
     * recibe como parámetro
     * 
     * @param busqueda Objeto que contiene los parámetros de búsqueda
     * @return Lista de guías que cumplen con los parámetros de búsqueda
     * 
     */
    
    @Override
    public List<Guia> buscarGuiaPorCriteria(GuiaBusqueda busqueda) {
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(Guia.class);
        
        if (busqueda.getFechaDesde() != null) {
            /**
             * Hace falta truncar la fecha para recuperar todos los registros de ese día sin importar la hora, sino
             * compara con 0:00:00
             */
            criteria.add(Restrictions
                    .sqlRestriction("TRUNC(this_.fecha_alta) >= '" + sdf.format(busqueda.getFechaDesde()) + "'"));
        }
        if (busqueda.getFechaHasta() != null) {
            /**
             * Hace falta truncar la fecha para recuperar todos los registros de ese día sin importar la hora, sino
             * compara con 0:00:00
             */
            criteria.add(Restrictions
                    .sqlRestriction("TRUNC(this_.fecha_alta) <= '" + sdf.format(busqueda.getFechaHasta()) + "'"));
        }
        
        if (busqueda.getNombre() != null && !busqueda.getNombre().isEmpty()) {
            criteria.add(Restrictions
                    .sqlRestriction(String.format(COMPARADORSINACENTOS, "nombre_guia", busqueda.getNombre())));
        }
        
        if (busqueda.getUsuarioCreacion() != null && !busqueda.getUsuarioCreacion().isEmpty()) {
            criteria.add(Restrictions.sqlRestriction(
                    String.format(COMPARADORSINACENTOS, "username_alta", busqueda.getUsuarioCreacion())));
        }
        
        if (busqueda.getTipoInspeccion() != null) {
            criteria.add(Restrictions.eq("tipoInspeccion", busqueda.getTipoInspeccion()));
        }
        
        if (busqueda.getEstado() != null) {
            if (EstadoEnum.INACTIVO.equals(busqueda.getEstado())) {
                criteria.add(Restrictions.isNotNull("fechaAnulacion"));
            } else {
                criteria.add(Restrictions.isNull("fechaAnulacion"));
            }
        }
        
        criteria.add(Restrictions.isNull("fechaBaja"));
        criteria.addOrder(Order.desc("fechaAlta"));
        
        @SuppressWarnings("unchecked")
        List<Guia> listaGuias = criteria.list();
        session.close();
        
        return listaGuias;
    }
    
    /**
     * Recupera el listado de pasos contenidos en una guía
     * 
     * @param guía Guía de la que se desean recuperar los pasos
     * @return Lista de pasos de la guía
     * 
     */
    @Override
    public List<GuiaPasos> listaPasos(Guia guia) {
        return pasosRepository.findByIdGuiaOrderByOrdenAsc(guia);
    }
    
    /**
     * Recupera el listado de pasos contenidos en una guía sin fecha de baja
     * 
     * @param guía Guía de la que se desean recuperar los pasos
     * @return Lista de pasos de la guía
     * 
     */
    
    @Override
    public List<GuiaPasos> listaPasosNoNull(Guia guia) {
        return pasosRepository.findByIdGuiaAndFechaBajaIsNullOrderByOrdenAsc(guia);
        
    }
    
    /**
     * Almacena la guía recibida como parámetro en base de datos
     * 
     * @param guia La guía a guardar
     * @return La guía guardada
     */
    @Override
    @Transactional(readOnly = false)
    public Guia guardaGuia(Guia guia) {
        return guiaRepository.save(guia);
    }
    
    /**
     * Comprueba la existencia de un paso recibido como parámetro en las guías personalizadas
     * 
     * @param paso Paso del que se desea comprobar si existe en alguna guía personalizada
     * @return True si se encuentra el paso en alguna guía personalizada, false en caso contrario
     */
    
    @Override
    public boolean existePaso(GuiaPasos paso) {
        return pasosRepository.findPasoExistenteEnGuiasPersonalizadas(paso.getId()) != null;
        
    }
    
    /**
     * Elimina de la base de datos una guía pasada como parámetro
     */
    @Override
    public void eliminar(Guia guia) {
        guiaRepository.delete(guia);
        
    }
    
}
