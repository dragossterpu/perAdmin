package es.mira.progesin.web.beans;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;

import org.primefaces.context.RequestContext;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.StreamedContent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import es.mira.progesin.persistence.entities.Guia;
import es.mira.progesin.persistence.entities.GuiaPasos;
import es.mira.progesin.persistence.entities.GuiaPersonalizada;
import es.mira.progesin.persistence.entities.enums.SeccionesEnum;
import es.mira.progesin.persistence.entities.enums.TipoRegistroEnum;
import es.mira.progesin.services.IGuiaPersonalizadaService;
import es.mira.progesin.services.IGuiaService;
import es.mira.progesin.services.IRegistroActividadService;
import es.mira.progesin.util.FacesUtilities;
import es.mira.progesin.util.WordGenerator;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Controller("guiaBean")
@Scope("session")
public class GuiaBean {

	private Guia guia;

	private String vieneDe;

	private GuiaBusqueda busqueda;

	private GuiaPasos pasoSeleccionada;

	private List<Boolean> list;

	private List<GuiaPasos> listaPasos;

	private List<GuiaPasos> listaPasosSeleccionados;

	private List<Guia> listaModelos;

	private transient StreamedContent file;

	boolean alta = false;

	@Autowired
	private transient WordGenerator wordGenerator;

	@Autowired
	IGuiaService guiaService;

	@Autowired
	IRegistroActividadService regActividadService;

	@Autowired
	IGuiaPersonalizadaService guiaPersonalizadaService;

	/**
	 * Busca las guías según los filtros introducidos en el formulario de búsqueda
	 */
	public void buscarGuia() {

		List<Guia> listaGuias = guiaService.buscarGuiaPorCriteria(busqueda);
		busqueda.setListaGuias(listaGuias);
	}

	public String visualizaGuia(Guia guia) {
		this.guia = guia;
		listaPasos = guiaService.listaPasos(guia);
		return "/guias/visualizaGuia?faces-redirect=true";
	}

	public void limpiarBusqueda() {
		busqueda.resetValues();
	}

	public void visualizaModelos() {
		listaModelos = guiaService.findAll();
	}

	public String nuevaGuia() {
		alta = true;
		this.guia = new Guia();
		listaPasos = new ArrayList<>();
		return "/guias/editarGuia?faces-redirect=true";
	}

	public String editaGuia(Guia guia) {
		alta = false;
		this.guia = guia;
		listaPasos = guiaService.listaPasos(guia);
		return "/guias/editarGuia?faces-redirect=true";
	}

	public void aniadePaso(String pregunta) {
		GuiaPasos nuevaPregunta = new GuiaPasos();
		nuevaPregunta.setPaso(pregunta);
		nuevaPregunta.setIdGuia(guia);
		listaPasos.add(nuevaPregunta);

	}

	public void borraPaso() {
		// List<GuiaPasos> aux = new ArrayList<>();
		//
		// for (GuiaPasos paso : listaPasos) {
		// if (paso != pasoSeleccionada) {
		// aux.add(paso);
		// }
		// }
		// listaPasos = aux;

		if (pasoSeleccionada.getId() != null) {
			// La pregunta existe en base de datos
			if (guiaService.existePaso(pasoSeleccionada)) {
				// baja lógica
				pasoSeleccionada.setFechaBaja(new Date());
				pasoSeleccionada.setUsernameBaja(SecurityContextHolder.getContext().getAuthentication().getName());
			}
			else {// Baja física
					// guiaService.borrarPaso(pasoSeleccionada);
				listaPasos.remove(pasoSeleccionada);
			}
		}

	}

	public void onSelectPaso(SelectEvent event) {
		pasoSeleccionada = (GuiaPasos) event.getObject();
	}

	@PostConstruct
	public void init() {
		busqueda = new GuiaBusqueda();
		list = new ArrayList<>();
		for (int i = 0; i <= 4; i++) {
			list.add(Boolean.TRUE);
		}
	}

	public void crearDocumentoWordGuia(Guia guia) {
		try {
			setFile(wordGenerator.crearDocumentoGuia(guia));
		}
		catch (Exception e) {
			FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_ERROR, "ERROR",
					"Se ha producido un error en la generación del documento Word");
			regActividadService.altaRegActividadError(TipoRegistroEnum.ERROR.name(), e);
		}
	}

	public void guardaGuia() {

		try {

			guia.setPasos(ordenaPasos(listaPasos));
			if (guiaService.guardaGuia(guia) != null) {
				if (alta) {
					FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_INFO, "Alta",
							"La guía se ha creado con éxito ");
					regActividadService.altaRegActividad(
							"La guía '".concat(guia.getNombre().concat("' ha sido creada")),
							TipoRegistroEnum.ALTA.name(), SeccionesEnum.GUIAS.getDescripcion());
				}
				else {
					FacesUtilities.setMensajeConfirmacionDialog(FacesMessage.SEVERITY_INFO, "Modificacion",
							"La guía ha sido modificada con éxito ");
					regActividadService.altaRegActividad(
							"La guía '".concat(guia.getNombre().concat("' ha sido modificada")),
							TipoRegistroEnum.MODIFICACION.name(), SeccionesEnum.GUIAS.getDescripcion());
				}

			}

		}
		catch (Exception e) {
			regActividadService.altaRegActividadError(TipoRegistroEnum.ERROR.name(), e);
		}
	}

	private List<GuiaPasos> ordenaPasos(List<GuiaPasos> lista) {
		List<GuiaPasos> listaNueva = new ArrayList<>();
		for (int i = 0; i < lista.size(); i++) {
			GuiaPasos paso = lista.get(i);
			paso.setOrden(i);
			listaNueva.add(paso);
		}
		return listaNueva;
	}

	public void getFormularioBusqueda() {
		if ("menu".equalsIgnoreCase(this.vieneDe)) {
			limpiarBusqueda();
			this.vieneDe = null;
		}

	}

	public String creaPersonalizada(Guia guia) {
		alta = false;
		this.guia = guia;
		listaPasosSeleccionados = new ArrayList<>();
		listaPasos = guiaService.listaPasos(guia);

		return "/guias/personalizarGuia?faces-redirect=true";
	}

	public void guardarPersonalizada(String nombre) {
		RequestContext.getCurrentInstance().execute("PF('guiaDialogo').hide()");
		GuiaPersonalizada personalizada = new GuiaPersonalizada();
		personalizada.setNombreGuia(nombre);
		personalizada.setGuia(guia);
		personalizada.setPasosElegidos(listaPasosSeleccionados);
		guiaPersonalizadaService.save(personalizada);
	}
}
