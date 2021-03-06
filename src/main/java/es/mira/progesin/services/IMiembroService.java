package es.mira.progesin.services;

import java.util.List;

import es.mira.progesin.persistence.entities.Equipo;
import es.mira.progesin.persistence.entities.Miembro;
import es.mira.progesin.persistence.entities.User;

/**
 * Interfaz del servicio que gestiona los miembros de un equipo.
 * 
 * @author EZENTIS
 *
 */

public interface IMiembroService {
    
    /**
     * Devuelve un miembro con un login especifico.
     * 
     * @param user usuario
     * @param equipo de busqueda
     * @return devuelve el miembro encontrado
     */
    Miembro buscaMiembroByUserAndEquipo(User user, Equipo equipo);
    
    /**
     * Guarda la información de un miembro de equipo en la bdd.
     * 
     * @param miembro a guardar
     * @return miembro con id
     */
    Miembro save(Miembro miembro);
    
    /**
     * Recupera los miembros que pertenecen a un equipo determinado.
     * 
     * @param equipo a consultar
     * @return lista de miembros del equipo
     */
    List<Miembro> findByEquipo(Equipo equipo);
    
    /**
     * Comprueba si un usuario es jefe de algún equipo de inspecciones.
     * 
     * @param username login del usuario
     * @return valor booleano
     */
    boolean esJefeEquipo(String username);
    
}
