package es.mira.progesin.web.beans;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.spy;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.primefaces.event.RowEditEvent;

import es.mira.progesin.persistence.entities.TipoEquipo;
import es.mira.progesin.persistence.entities.enums.SeccionesEnum;
import es.mira.progesin.persistence.entities.enums.TipoRegistroEnum;
import es.mira.progesin.services.IEquipoService;
import es.mira.progesin.services.IRegistroActividadService;
import es.mira.progesin.services.ITipoEquipoService;
import es.mira.progesin.util.FacesUtilities;

/**
 * Test del bean TipoEquipo.
 * 
 * @author EZENTIS
 */
@RunWith(PowerMockRunner.class)
// @PowerMockRunnerDelegate(SpringRunner.class)
@PrepareForTest(FacesUtilities.class)
public class TipoEquipoBeanTest {
    /**
     * Mock del servicio de tipo equipo.
     */
    @Mock
    private ITipoEquipoService tipoEquipoService;
    
    /**
     * Mock del servicio de equipo.
     */
    @Mock
    private IEquipoService equipoService;
    
    /**
     * Mock del servicio de registro actividad.
     */
    @Mock
    private IRegistroActividadService regActividadService;
    
    /**
     * Instancia de prueba del bean de tipos de equipo.
     */
    @InjectMocks
    private TipoEquipoBean tipoEquipoBean;
    
    /**
     * Configuración inicial del test.
     */
    @Before
    public void setUp() {
        PowerMockito.mockStatic(FacesUtilities.class);
    }
    
    /**
     * Comprobación clase existe.
     */
    @Test
    public void type() {
        assertThat(TipoEquipoBean.class).isNotNull();
    }
    
    /**
     * Comprobación clase no abstracta.
     */
    @Test
    public void instantiation() {
        TipoEquipoBean target = new TipoEquipoBean();
        assertThat(target).isNotNull();
    }
    
    /**
     * Test method for {@link es.mira.progesin.web.beans.TipoEquipoBean#eliminarTipo(TipoEquipo)}.
     */
    @Test
    public void eliminarTipo() {
        TipoEquipo tEquipo = TipoEquipo.builder().id(1L).codigo("TEST").descripcion("Tipo Equipo").build();
        List<TipoEquipo> listaTipoEquipo = new ArrayList<>();
        listaTipoEquipo.add(tEquipo);
        tipoEquipoBean.setListaTipoEquipo(listaTipoEquipo);
        when(equipoService.existsByTipoEquipo(tEquipo)).thenReturn(false);
        
        tipoEquipoBean.eliminarTipo(tEquipo);
        
        verify(equipoService, times(1)).existsByTipoEquipo(tEquipo);
        verify(tipoEquipoService, times(1)).delete(tEquipo);
        assertThat(tipoEquipoBean.getListaTipoEquipo().size()).isEqualTo(0);
    }
    
    /**
     * Test method for {@link es.mira.progesin.web.beans.TipoEquipoBean#eliminarTipo(TipoEquipo)}.
     */
    @Test
    public void eliminarTipo_existeEquipo() {
        TipoEquipo tEquipo = TipoEquipo.builder().id(1L).codigo("CODIGO").descripcion("Equipo Test").build();
        List<TipoEquipo> listaTipoEquipo = new ArrayList<>();
        listaTipoEquipo.add(tEquipo);
        tipoEquipoBean.setListaTipoEquipo(listaTipoEquipo);
        when(equipoService.existsByTipoEquipo(tEquipo)).thenReturn(true);
        
        tipoEquipoBean.eliminarTipo(tEquipo);
        
        verify(equipoService, times(1)).existsByTipoEquipo(tEquipo);
        verify(tipoEquipoService, times(0)).delete(tEquipo);
        assertThat(tipoEquipoBean.getListaTipoEquipo().size()).isEqualTo(1);
    }
    
    /**
     * Test method for {@link es.mira.progesin.web.beans.TipoEquipoBean#init()}.
     */
    @Test
    public void init() {
        TipoEquipoBean tipoEquipoBeanMock = spy(tipoEquipoBean);
        
        tipoEquipoBeanMock.init();
        
    }
    
    /**
     * Test method for {@link es.mira.progesin.web.beans.TipoEquipoBean#altaTipo(String, String)}.
     */
    @Test
    public void altaTipo() {
        TipoEquipo tEquipo = TipoEquipo.builder().codigo("CIE").descripcion("Equipo").build();
        
        tipoEquipoBean.altaTipo("TEST", "Tipo Equipo Test");
        
        verify(tipoEquipoService, times(1)).save(tEquipo);
        verify(regActividadService, times(1)).altaRegActividad(any(String.class), eq(TipoRegistroEnum.ALTA.name()),
                eq(SeccionesEnum.ADMINISTRACION.getDescripcion()));
    }
    
    /**
     * Test method for {@link es.mira.progesin.web.beans.TipoEquipoBean#onRowEdit(RowEditEvent)}.
     */
    @Test
    public void onRowEdit() {
        TipoEquipo tEquipo = TipoEquipo.builder().id(1L).codigo("cod").descripcion("desc equipo").build();
        RowEditEvent event = mock(RowEditEvent.class);
        when(event.getObject()).thenReturn(tEquipo);
        
        tipoEquipoBean.onRowEdit(event);
        
        verify(tipoEquipoService, times(1)).save(tEquipo);
        verify(regActividadService, times(1)).altaRegActividad(any(String.class),
                eq(TipoRegistroEnum.MODIFICACION.name()), eq(SeccionesEnum.ADMINISTRACION.getDescripcion()));
    }
    
}
