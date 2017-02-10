package es.mira.progesin.util;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import es.mira.progesin.services.ISolicitudDocumentacionService;
import es.mira.progesin.web.beans.ApplicationBean;

/**
 * @author EZENTIS
 */
@Component("correoDestinatarioValidator")
public class CorreoDestinatarioValidator implements Validator {

	@Autowired
	ISolicitudDocumentacionService solicitudDocumentacionService;

	@Autowired
	ApplicationBean applicationBean;

	@Override
	public void validate(FacesContext context, UIComponent component, Object value) {

		String nuevoCorreoDestinatario = value.toString();

		String actualCorreoDestinatario = (String) component.getAttributes().get("actualCorreo");

		String regex = "(?i)^[_a-z0-9-+]+(.[_a-z0-9-]+)*@(" + applicationBean.getDominiosValidos() + ")$";
		if (!nuevoCorreoDestinatario.matches(regex)) {
			FacesMessage facesMsg = new FacesMessage("Formato de correo incorrecto o dominio no válido.");
			facesMsg.setSeverity(FacesMessage.SEVERITY_ERROR);
			throw new ValidatorException(facesMsg);
		}
		else if (nuevoCorreoDestinatario.equals(actualCorreoDestinatario) == Boolean.FALSE
				&& solicitudDocumentacionService.findNoFinalizadaPorCorreoDestinatario(
						nuevoCorreoDestinatario) != null) {
			FacesMessage facesMsg = new FacesMessage(
					"Este correo ya existe para otra solicitud en curso. Debe finalizarla o eliminarla antes de proseguir.");
			facesMsg.setSeverity(FacesMessage.SEVERITY_ERROR);
			throw new ValidatorException(facesMsg);
		}

	}

}
