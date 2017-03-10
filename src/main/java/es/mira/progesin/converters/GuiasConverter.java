package es.mira.progesin.converters;

import java.util.ArrayList;
import java.util.Iterator;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

import org.hibernate.collection.internal.PersistentBag;
import org.primefaces.component.orderlist.OrderList;
import org.springframework.stereotype.Component;

import es.mira.progesin.persistence.entities.GuiaPasos;

/***********************************
 * 
 * Conversor para objetos orderList de PrimeFaces
 * 
 * Convierte objetos de tipo GuiaPasos para su uso con el control orderList
 * 
 * @author Ezentis
 * 
 *************************************/

@Component("guiasConverter")
public class GuiasConverter implements Converter {

	@Override
	public String getAsString(FacesContext arg0, UIComponent arg1, Object value) {

		return ((GuiaPasos) value).getPaso().toString();
	}

	@Override
	public Object getAsObject(FacesContext context, UIComponent component, String value) {
		Object ret = null;
		if (component instanceof OrderList) {
			Object list = ((OrderList) component).getValue();
			if (list instanceof PersistentBag) {
				PersistentBag bolsa = (PersistentBag) list;
				Iterator<?> iterador = bolsa.iterator();
				while (iterador.hasNext()) {
					Object objeto = iterador.next();
					String name = ((GuiaPasos) objeto).getPaso();
					if (value.equals(name)) {
						ret = objeto;
						break;
					}
				}
			}
			else {
				@SuppressWarnings("unchecked")
				ArrayList<GuiaPasos> lista = (ArrayList<GuiaPasos>) list;
				for (Object objeto : lista) {
					String name = ((GuiaPasos) objeto).getPaso();
					if (value.equals(name)) {
						ret = objeto;
						break;
					}
				}
			}
		}
		return ret;
	}

}
