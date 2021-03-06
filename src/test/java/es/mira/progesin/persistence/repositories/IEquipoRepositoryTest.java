package es.mira.progesin.persistence.repositories;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import es.mira.progesin.persistence.entities.Equipo;
import es.mira.progesin.persistence.entities.TipoEquipo;

/**
 * 
 * Test del repositorio Equipos.
 * @author EZENTIS
 * 
 *
 */
@RunWith(SpringRunner.class)
@DataJpaTest
@TestPropertySource(locations = "classpath:test.properties")

public class IEquipoRepositoryTest {
    /**
     * Repositorio de equipos.
     */
    @Autowired
    private IEquipoRepository repository;
    
    /**
     * Test method for
     * {@link es.mira.progesin.persistence.repositories.IEquipoRepository#existsByTipoEquipo(TipoEquipo)}.
     */
    @Test
    public final void existsByTipoEquipo() {
        TipoEquipo tEquipo = TipoEquipo.builder().id(1L).codigo("IAPRL")
                .descripcion("Inspecciones Área Prevención de Riesgos Laborales").build();
        boolean existeEquipo = this.repository.existsByTipoEquipo(tEquipo);
        assertThat(existeEquipo).isTrue();
    }
    
    /**
     * Test method for {@link es.mira.progesin.persistence.repositories.IEquipoRepository#findByFechaBajaIsNull()}.
     */
    public final void findByFechaBajaIsNull() {
        List<Equipo> equipos = repository.findByFechaBajaIsNull();
        
        assertThat(equipos).hasSize(3);
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.persistence.repositories.IEquipoRepository#buscarEquiposByUsername(String)}.
     */
    public final void buscarEquiposByUsername() {
        List<Equipo> equipos = repository.buscarEquiposByUsername("alopez");
        
        assertThat(equipos).hasSize(2);
    }
    
}
