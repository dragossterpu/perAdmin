package es.mira.progesin.services;

import org.hibernate.Criteria;
import org.primefaces.model.SortOrder;

/**
 * Interfaz utilizada para reducir la duplicidad de código en los critera de los buscadores.
 * 
 * @author EZENTIS
 *
 */
public interface ICriteriaService {
    
    /**
     * Prepara el criteria pasado como parámetro para la paginación de Primefaces.
     * 
     * @param criteria criteria a configurar
     * @param first primer elemento
     * @param pageSize tamaño de cada página de resultados
     * @param sortField campo por el que se ordenan los resultados
     * @param sortOrder sentido de la ordenacion (ascendente/descendente)
     * @param defaultField campo de ordenación por defecto
     */
    public void prepararPaginacionOrdenCriteria(Criteria criteria, int first, int pageSize, String sortField,
            SortOrder sortOrder, String defaultField);
    
    /**
     * Añade al criteria als restricciones necesarias para realizar las consultas en caso de que el usuario conectado
     * tenga el rol EQUIPO_INSPECCIONES.
     * @param criteria criteria al que se desea añadir la restricción
     */
    public void setCriteriaEquipo(Criteria criteria);
}
