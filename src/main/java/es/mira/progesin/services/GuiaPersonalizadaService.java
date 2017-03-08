package es.mira.progesin.services;

import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import es.mira.progesin.persistence.entities.GuiaPasos;
import es.mira.progesin.persistence.entities.GuiaPersonalizada;
import es.mira.progesin.persistence.repositories.IGuiaPersonalizadaRepository;
import es.mira.progesin.persistence.repositories.IGuiasPasosRepository;
import es.mira.progesin.web.beans.GuiaPersonalizadaBusqueda;

@Service
public class GuiaPersonalizadaService implements IGuiaPersonalizadaService {

	private static final String COMPARADORSINACENTOS = "upper(convert(replace(%1$s, \' \', \'\'), \'US7ASCII\')) LIKE upper(convert(\'%%\' || replace(\'%2$s\', \' \', \'\') || \'%%\', \'US7ASCII\'))";

	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	IGuiaPersonalizadaRepository guiaPersonalizadaRepository;

	@Autowired
	IGuiasPasosRepository preguntasRepository;

	@Override
	public void delete(GuiaPersonalizada guia) {
		// TODO Auto-generated method stub

	}

	@Override
	public GuiaPersonalizada save(GuiaPersonalizada guia) {
		return guiaPersonalizadaRepository.save(guia);
	}

	@Override
	public List<GuiaPersonalizada> buscarGuiaPorCriteria(GuiaPersonalizadaBusqueda busqueda) {
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(GuiaPersonalizada.class);

		if (busqueda.getFechaDesde() != null) {
			/**
			 * Hace falta truncar la fecha para recuperar todos los registros de ese día sin importar la hora, sino
			 * compara con 0:00:00
			 */
			criteria.add(Restrictions
					.sqlRestriction("TRUNC(this_.fecha_creacion) >= '" + sdf.format(busqueda.getFechaDesde()) + "'"));
		}
		if (busqueda.getFechaHasta() != null) {
			/**
			 * Hace falta truncar la fecha para recuperar todos los registros de ese día sin importar la hora, sino
			 * compara con 0:00:00
			 */
			criteria.add(Restrictions
					.sqlRestriction("TRUNC(this_.fecha_creacion) <= '" + sdf.format(busqueda.getFechaHasta()) + "'"));
		}

		if (busqueda.getNombre() != null && !busqueda.getNombre().isEmpty()) {
			criteria.add(Restrictions
					.sqlRestriction(String.format(COMPARADORSINACENTOS, "nombre_guia", busqueda.getNombre())));
		}

		if (busqueda.getUsuarioCreacion() != null && !busqueda.getUsuarioCreacion().isEmpty()) {
			criteria.add(Restrictions.sqlRestriction(
					String.format(COMPARADORSINACENTOS, "usuario_creacion", busqueda.getUsuarioCreacion())));
		}

		if (busqueda.getTipoInspeccion() != null) {
			criteria.add(Restrictions.eq("tipoInspeccion", busqueda.getTipoInspeccion()));
		}

		criteria.addOrder(Order.desc("fechaCreacion"));

		@SuppressWarnings("unchecked")
		List<GuiaPersonalizada> listaGuias = criteria.list();
		session.close();

		return listaGuias;
	}

	@Override
	public List<GuiaPasos> listaPasos(GuiaPersonalizada guia) {
		return preguntasRepository.findPasosElegidosGuiaPersonalizada(guia.getId());
	}

	@Override
	public List<GuiaPersonalizada> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}