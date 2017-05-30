package es.mira.progesin.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import es.mira.progesin.persistence.entities.cuestionarios.ModeloCuestionario;
import es.mira.progesin.persistence.repositories.IAreaCuestionarioRepository;
import es.mira.progesin.persistence.repositories.IModeloCuestionarioRepository;

/**
 * Implementación del servicio que gestiona los modelos de cuestionario.
 * 
 * @author EZENTIS
 */
@Service
public class ModeloCuestionarioService implements IModeloCuestionarioService {
    
    /**
     * Variable utilizada para inyectar el repositorio de modelos de cuestionario.
     * 
     */
    @Autowired
    IModeloCuestionarioRepository modeloCuestionarioRepository;
    
    /**
     * Variable utilizada para inyectar el repositorio de áreas de cuestionario.
     * 
     */
    @Autowired
    IAreaCuestionarioRepository areaCuestionarioRepository;
    
    /**
     * Guarda o actualiza un modelo de cuestionario.
     * 
     * @param modeloCuestionario a guardar o actualizar
     */
    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
    public ModeloCuestionario save(ModeloCuestionario modeloCuestionario) {
        return modeloCuestionarioRepository.save(modeloCuestionario);
    }
    
    /**
     * Busca todos los modelos de cuestionario que hay en BBDD.
     * 
     * @return List<ModeloCuestionario> lista de modelos en BBDD
     */
    @Override
    public List<ModeloCuestionario> findAll() {
        return (List<ModeloCuestionario>) modeloCuestionarioRepository.findAll();
    }
    
}
