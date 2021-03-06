package es.mira.progesin.persistence.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.EntityGraph.EntityGraphType;
import org.springframework.data.repository.CrudRepository;

import es.mira.progesin.persistence.entities.Inspeccion;
import es.mira.progesin.persistence.entities.SolicitudDocumentacionPrevia;

/**
 * Interfaz del repositorio de solicitudes de documentación.
 * 
 * @author Ezentis
 */
public interface ISolicitudDocumentacionPreviaRepository extends CrudRepository<SolicitudDocumentacionPrevia, Long> {
    
    /**
     * Recupera la solicitud no finalizada perteneciente a un destinatario (no puede haber más de una).
     * 
     * @param correo correo destinatario
     * @return solicitud
     */
    SolicitudDocumentacionPrevia findByFechaBajaIsNullAndFechaFinalizacionIsNullAndCorreoDestinatarioIgnoreCase(
            String correo);
    
    /**
     * Recupera la solicitud y sus documentos subidos ya enviada pero sin finalizar perteneciente a un destinatario (no
     * puede haber más de una).
     * 
     * @param correo correo destinatario
     * @return solicitud con documentos
     */
    @EntityGraph(value = "SolicitudDocumentacionPrevia.documentos", type = EntityGraphType.LOAD)
    SolicitudDocumentacionPrevia findByFechaBajaIsNullAndFechaFinalizacionIsNullAndFechaEnvioIsNotNullAndCorreoDestinatarioIgnoreCase(
            String correo);
    
    /**
     * Recupera las solicitudes ya finalizadas asociadas a una inspección.
     * 
     * @param inspeccion inspección a la que pertenecen
     * @return lista solicitudes
     */
    List<SolicitudDocumentacionPrevia> findByFechaBajaIsNullAndFechaFinalizacionIsNotNullAndInspeccionOrderByFechaFinalizacionDesc(
            Inspeccion inspeccion);
    
    /**
     * Recupera la solicitud no finalizada asociada a una inspección (no puede haber más de una).
     * 
     * @param inspeccion inspección a la que pertenecen
     * @return lista solicitudes
     */
    SolicitudDocumentacionPrevia findByFechaBajaIsNullAndFechaFinalizacionIsNullAndInspeccion(Inspeccion inspeccion);
    
    /**
     * Recupera las solicitudes enviadas pero aún no cumplimentadas.
     * 
     * @return lista solicitudes
     */
    List<SolicitudDocumentacionPrevia> findByFechaBajaIsNullAndFechaFinalizacionIsNullAndFechaEnvioIsNotNullAndFechaCumplimentacionIsNull();
    
    /**
     * Recupera una solicitud y sus documentos subidos a partir de la clave.
     * 
     * @param id identificador de la solicitud
     * @return solicitud con documentos
     */
    @EntityGraph(value = "SolicitudDocumentacionPrevia.documentos", type = EntityGraphType.LOAD)
    SolicitudDocumentacionPrevia findById(Long id);
    
}
