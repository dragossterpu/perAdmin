/**
 * 
 */
package es.mira.progesin.services;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PowerMockIgnore;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import es.mira.progesin.constantes.Constantes;
import es.mira.progesin.persistence.entities.DocumentacionPrevia;
import es.mira.progesin.persistence.entities.Inspeccion;
import es.mira.progesin.persistence.entities.Municipio;
import es.mira.progesin.persistence.entities.Provincia;
import es.mira.progesin.persistence.entities.SolicitudDocumentacionPrevia;
import es.mira.progesin.persistence.entities.TipoInspeccion;
import es.mira.progesin.persistence.entities.TipoUnidad;
import es.mira.progesin.persistence.entities.User;
import es.mira.progesin.persistence.entities.enums.AmbitoInspeccionEnum;
import es.mira.progesin.persistence.entities.enums.EstadoEnum;
import es.mira.progesin.persistence.entities.enums.EstadoInspeccionEnum;
import es.mira.progesin.persistence.entities.gd.Documento;
import es.mira.progesin.persistence.entities.gd.TipoDocumentacion;
import es.mira.progesin.persistence.repositories.IDocumentacionPreviaRepository;
import es.mira.progesin.persistence.repositories.ISolicitudDocumentacionPreviaRepository;
import es.mira.progesin.services.gd.ITipoDocumentacionService;
import es.mira.progesin.util.ICorreoElectronico;

/**
 * Test del servicio Solicitud Documentación Previa.
 * 
 * @author EZENTIS
 */
@RunWith(PowerMockRunner.class)
// Evita conflictos con clases del sistema al enlazar los mocks por tipo
@PowerMockIgnore("javax.security.*")
@PrepareForTest(SecurityContextHolder.class)
public class SolicitudDocumentacionServiceTest {
    
    /**
     * Mock del security context.
     */
    @Mock
    private SecurityContext securityContext;
    
    /**
     * Mock del objeto authentication.
     */
    @Mock
    private Authentication authentication;
    
    /**
     * Mock del servicio de usuario.
     */
    @Mock
    private IUserService userService;
    
    /**
     * Mock del servicio de inspección.
     */
    @Mock
    private IInspeccionesService inspeccionesService;
    
    /**
     * Mock del servicio de tipo de documentación.
     */
    @Mock
    private ITipoDocumentacionService tipoDocumentacionService;
    
    /**
     * Mock del repositorio de la documentación requerida en una solicitud.
     */
    @Mock
    private IDocumentacionPreviaRepository documentacionPreviaRepository;
    
    /**
     * Mock del repositorio de solicitudes de documentación.
     */
    @Mock
    private ISolicitudDocumentacionPreviaRepository solicitudDocumentacionPreviaRepository;
    
    /**
     * Simulación del servicio de documentos.
     */
    @Mock
    private IDocumentoService documentoService;
    
    /**
     * Mock del servicio de correos electrónicos.
     */
    @Mock
    private ICorreoElectronico correoElectronico;
    
    /**
     * Instancia de prueba del servicio de solicitudes de documentación.
     */
    @InjectMocks
    private ISolicitudDocumentacionService solicitudDocPreviaService = new SolicitudDocumentacionService();
    
    /**
     * Configuración inicial del test.
     */
    @Before
    public void setUp() {
        PowerMockito.mockStatic(SecurityContextHolder.class);
        when(SecurityContextHolder.getContext()).thenReturn(securityContext);
        when(securityContext.getAuthentication()).thenReturn(authentication);
    }
    
    /**
     * Comprobación clase existe.
     */
    @Test
    public void type() {
        assertThat(SolicitudDocumentacionService.class).isNotNull();
    }
    
    /**
     * Comprobación clase no abstracta.
     */
    @Test
    public void instantiation() {
        SolicitudDocumentacionService target = new SolicitudDocumentacionService();
        assertThat(target).isNotNull();
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.services.SolicitudDocumentacionService#save(SolicitudDocumentacionPrevia)}.
     */
    @Test
    public void save() {
        SolicitudDocumentacionPrevia solicitud = mock(SolicitudDocumentacionPrevia.class);
        
        solicitudDocPreviaService.save(solicitud);
        
        verify(solicitudDocumentacionPreviaRepository, times(1)).save(solicitud);
        
    }
    
    /**
     * Test method for {@link es.mira.progesin.services.SolicitudDocumentacionService#findAll()}.
     */
    @Test
    public void findAll() {
        solicitudDocPreviaService.findAll();
        
        verify(solicitudDocumentacionPreviaRepository, times(1)).findAll();
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.services.SolicitudDocumentacionService#findNoFinalizadaPorCorreoDestinatario(String)}.
     */
    @Test
    public void findNoFinalizadaPorCorreoDestinatario() {
        String correo = "";
        solicitudDocPreviaService.findNoFinalizadaPorCorreoDestinatario(correo);
        
        verify(solicitudDocumentacionPreviaRepository, times(1))
                .findByFechaBajaIsNullAndFechaFinalizacionIsNullAndCorreoDestinatarioIgnoreCase(correo);
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.services.SolicitudDocumentacionService#findEnviadaNoFinalizadaPorCorreoDestinatario(String)}
     * .
     */
    @Test
    public void findEnviadaNoFinalizadaPorCorreoDestinatario() {
        String correo = "";
        solicitudDocPreviaService.findEnviadaNoFinalizadaPorCorreoDestinatario(correo);
        
        verify(solicitudDocumentacionPreviaRepository, times(1))
                .findByFechaBajaIsNullAndFechaFinalizacionIsNullAndFechaEnvioIsNotNullAndCorreoDestinatarioIgnoreCase(
                        correo);
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.services.SolicitudDocumentacionService#transaccSaveCreaUsuarioProv(SolicitudDocumentacionPrevia ,User ,String )}
     * .
     */
    @SuppressWarnings("unchecked")
    @Test
    public void transaccSaveCreaUsuarioProv() {
        AmbitoInspeccionEnum ambito = AmbitoInspeccionEnum.GC;
        TipoUnidad tipoUnidad = new TipoUnidad();
        tipoUnidad.setDescripcion("tipoUnidad");
        TipoInspeccion tipoInspeccion = new TipoInspeccion();
        tipoInspeccion.setDescripcion("tipoInspeccion");
        tipoInspeccion.setCodigo("I.G.S.");
        Provincia provincia = new Provincia();
        provincia.setNombre("provincia");
        Municipio municipio = new Municipio();
        municipio.setName("municipio");
        municipio.setProvincia(provincia);
        Inspeccion inspeccion = Inspeccion.builder().id(1L).anio(2017).ambito(ambito).tipoInspeccion(tipoInspeccion)
                .nombreUnidad("unidad").tipoUnidad(tipoUnidad).municipio(municipio).build();
        
        SolicitudDocumentacionPrevia solicitud = SolicitudDocumentacionPrevia.builder().id(1L).inspeccion(inspeccion)
                .correoDestinatario("correo").asunto("asunto").build();
        User usuarioProv = mock(User.class);
        String password = "encodedPassword";
        
        solicitudDocPreviaService.transaccSaveCreaUsuarioProv(solicitud, usuarioProv, password);
        
        verify(solicitudDocumentacionPreviaRepository, times(1)).save(solicitud);
        verify(userService, times(1)).save(usuarioProv);
        verify(inspeccionesService, times(1)).cambiarEstado(solicitud.getInspeccion(),
                EstadoInspeccionEnum.D_PEND_RECIBIR_DOC_PREVIA);
        verify(correoElectronico, times(1)).envioCorreo(eq("correo"), any(String.class),
                eq(Constantes.TEMPLATESOLICITUDPREVIACUESTIONARIOIGS), any(Map.class));
        
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.services.SolicitudDocumentacionService#transaccSaveElimUsuarioProv(SolicitudDocumentacionPrevia, String)}
     * .
     */
    @Test
    public void transaccSaveElimUsuarioProv() {
        Inspeccion inspeccion = mock(Inspeccion.class);
        SolicitudDocumentacionPrevia solicitud = SolicitudDocumentacionPrevia.builder().inspeccion(inspeccion).build();
        String usuarioProv = "usuario";
        when(userService.exists(usuarioProv)).thenReturn(Boolean.TRUE);
        
        solicitudDocPreviaService.transaccSaveElimUsuarioProv(solicitud, usuarioProv);
        
        verify(solicitudDocumentacionPreviaRepository, times(1)).save(solicitud);
        verify(userService, times(1)).delete(usuarioProv);
        verify(inspeccionesService, times(1)).cambiarEstado(solicitud.getInspeccion(),
                EstadoInspeccionEnum.E_PEND_ENVIAR_CUESTIONARIO);
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.services.SolicitudDocumentacionService#transaccSaveInactivaUsuarioProv(SolicitudDocumentacionPrevia, String)}
     * .
     */
    @Test
    public void transaccSaveInactivaUsuarioProv() {
        
        SolicitudDocumentacionPrevia solicitud = mock(SolicitudDocumentacionPrevia.class);
        String usuarioProv = "usuario";
        
        solicitudDocPreviaService.transaccSaveInactivaUsuarioProv(solicitud, usuarioProv);
        
        verify(solicitudDocumentacionPreviaRepository, times(1)).save(solicitud);
        verify(userService, times(1)).cambiarEstado(usuarioProv, EstadoEnum.INACTIVO);
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.services.SolicitudDocumentacionService#transaccSaveActivaUsuarioProv(SolicitudDocumentacionPrevia, String)}
     * .
     */
    @Test
    public void transaccSaveActivaUsuarioProv() {
        SolicitudDocumentacionPrevia solicitud = mock(SolicitudDocumentacionPrevia.class);
        String usuarioProv = "usuario";
        
        solicitudDocPreviaService.transaccSaveActivaUsuarioProv(solicitud, usuarioProv);
        
        verify(solicitudDocumentacionPreviaRepository, times(1)).save(solicitud);
        verify(userService, times(1)).cambiarEstado(usuarioProv, EstadoEnum.ACTIVO);
    }
    
    /**
     * Test method for {@link es.mira.progesin.services.SolicitudDocumentacionService#transaccDeleteElimDocPrevia(Long)}
     * .
     */
    @Test
    public void transaccDeleteElimDocPrevia() {
        Long idSolicitud = 1L;
        
        solicitudDocPreviaService.transaccDeleteElimDocPrevia(idSolicitud);
        
        verify(documentacionPreviaRepository, times(1)).deleteByIdSolicitud(idSolicitud);
        verify(solicitudDocumentacionPreviaRepository, times(1)).delete(idSolicitud);
        
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.services.SolicitudDocumentacionService#findFinalizadasPorInspeccion(Inspeccion)}.
     */
    @Test
    public void findFinalizadasPorInspeccion() {
        Inspeccion inspeccion = mock(Inspeccion.class);
        
        solicitudDocPreviaService.findFinalizadasPorInspeccion(inspeccion);
        
        verify(solicitudDocumentacionPreviaRepository, times(1))
                .findByFechaBajaIsNullAndFechaFinalizacionIsNotNullAndInspeccionOrderByFechaFinalizacionDesc(
                        inspeccion);
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.services.SolicitudDocumentacionService#findNoFinalizadaPorInspeccion(Inspeccion)}.
     */
    @Test
    public void findNoFinalizadaPorInspeccion() {
        Inspeccion inspeccion = mock(Inspeccion.class);
        
        solicitudDocPreviaService.findNoFinalizadaPorInspeccion(inspeccion);
        
        verify(solicitudDocumentacionPreviaRepository, times(1))
                .findByFechaBajaIsNullAndFechaFinalizacionIsNullAndInspeccion(inspeccion);
    }
    
    /**
     * Test method for {@link es.mira.progesin.services.SolicitudDocumentacionService#findEnviadasNoCumplimentadas()}.
     */
    @Test
    public void findEnviadasNoCumplimentadas() {
        solicitudDocPreviaService.findEnviadasNoCumplimentadas();
        
        verify(solicitudDocumentacionPreviaRepository, times(1))
                .findByFechaBajaIsNullAndFechaFinalizacionIsNullAndFechaEnvioIsNotNullAndFechaCumplimentacionIsNull();
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.services.SolicitudDocumentacionService#transaccSaveAltaDocumentos(SolicitudDocumentacionPrevia, List)}
     * .
     */
    @Test
    public void transaccSaveAltaDocumentos() {
        SolicitudDocumentacionPrevia solicitudDocumentacionPrevia = mock(SolicitudDocumentacionPrevia.class);
        List<TipoDocumentacion> documentosSeleccionados = new ArrayList<>();
        documentosSeleccionados.add(mock(TipoDocumentacion.class));
        documentosSeleccionados.add(mock(TipoDocumentacion.class));
        
        solicitudDocPreviaService.transaccSaveAltaDocumentos(solicitudDocumentacionPrevia, documentosSeleccionados);
        
        verify(solicitudDocumentacionPreviaRepository, times(1)).save(solicitudDocumentacionPrevia);
        verify(tipoDocumentacionService, times(2)).save(any(DocumentacionPrevia.class));
    }
    
    /**
     * Test method for {@link es.mira.progesin.services.SolicitudDocumentacionService#findByIdConDocumentos(Long)}.
     */
    @Test
    public void findByIdConDocumentos() {
        solicitudDocPreviaService.findByIdConDocumentos(2L);
        verify(solicitudDocumentacionPreviaRepository, times(1)).findById(2L);
    }
    
    /**
     * Test method for
     * {@link es.mira.progesin.services.SolicitudDocumentacionService#eliminarDocumentoSolicitud(SolicitudDocumentacionPrevia, Documento)}.
     */
    @Test
    public void eliminarDocumentoSolicitud() {
        SolicitudDocumentacionPrevia solicitud = mock(SolicitudDocumentacionPrevia.class);
        Documento documento = mock(Documento.class);
        
        solicitudDocPreviaService.eliminarDocumentoSolicitud(solicitud, documento);
        
        verify(solicitudDocumentacionPreviaRepository, times(1)).save(solicitud);
        verify(documentoService, times(1)).delete(documento);
    }
    
    /**
     * Test method for {@link es.mira.progesin.services.SolicitudDocumentacionService#findOne(Long)}.
     */
    @Test
    public void findOne() {
        solicitudDocPreviaService.findOne(1L);
        verify(solicitudDocumentacionPreviaRepository, times(1)).findOne(1L);
    }
}
