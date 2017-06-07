package es.mira.progesin.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import es.mira.progesin.persistence.entities.ModeloInforme;
import es.mira.progesin.persistence.repositories.IModeloInformeRepository;

/**
 * Implementación del servicio que gestiona los modelos de informe.
 * 
 * @author EZENTIS
 */
@Service
public class ModeloInformeService implements IModeloInformeService {
    
    /**
     * Variable utilizada para inyectar el repositorio de modelos de informe.
     * 
     */
    @Autowired
    private IModeloInformeRepository modeloInformeRepository;
    
    /**
     * Busca todos los modelos de informe que hay en BBDD.
     * 
     * @return List<ModeloInforme> lista de modelos en BBDD
     */
    @Override
    public List<ModeloInforme> findAll() {
        return (List<ModeloInforme>) modeloInformeRepository.findAll();
    }
    
}