package es.mira.progesin.persistence.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import es.mira.progesin.persistence.entities.Alerta;
import es.mira.progesin.persistence.entities.User;

public interface IAlertaRepository extends CrudRepository<Alerta, Long> {

	List<Alerta> findByFechaBajaIsNull();
	


}
