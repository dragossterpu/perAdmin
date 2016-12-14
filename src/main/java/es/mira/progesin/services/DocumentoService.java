package es.mira.progesin.services;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.AutoDetectParser;
import org.apache.tika.parser.Parser;
import org.apache.tika.sax.BodyContentHandler;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.UploadedFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xml.sax.ContentHandler;
import org.xml.sax.SAXException;

import es.mira.progesin.persistence.entities.Documento;
import es.mira.progesin.persistence.entities.enums.EstadoRegActividadEnum;
import es.mira.progesin.persistence.entities.enums.RoleEnum;
import es.mira.progesin.persistence.entities.enums.SeccionesEnum;
import es.mira.progesin.persistence.repositories.IDocumentoRepository;

@Service("documentoService")

public class DocumentoService implements IDocumentoService {

	@Autowired
	IAlertaService alertaService;

	@Autowired
	INotificacionService notificacionService;

	@Autowired
	IRegistroActividadService registroActividadService;

	@Autowired
	IDocumentoRepository documentoRepository;

	@Autowired
	IRegistroActividadService registro;

	@Autowired
	private SessionFactory sessionFactory;

	/***************************************
	 * 
	 * delete
	 * 
	 * Elimina un documento de la base de datos. El documento se identifica por su id
	 * 
	 * @author Ezentis
	 * @param Long id Identificador del documento a eliminar
	 *
	 *************************************/

	@Override
	public void delete(Long id) {
		documentoRepository.delete(id);
	}

	/***************************************
	 * 
	 * delete
	 * 
	 * Elimina una serie de documentos de la base de datos. Los documentos se identifican por sus id
	 * 
	 * @author Ezentis
	 * @param Iterable<Documento> entities Identificadores de los documentos a eliminar
	 * 
	 *************************************/
	@Override
	public void delete(Iterable<Documento> entities) {
		documentoRepository.delete(entities);
	}

	/***************************************
	 * 
	 * delete
	 * 
	 * Elimina una serie de documentos de la base de datos. El documento a eliminar se pasa como parámetro.
	 * 
	 * @author Ezentis
	 * @param Documento entity Documento a eliminar
	 * 
	 *************************************/
	@Override
	public void delete(Documento entity) {
		documentoRepository.delete(entity);
	}

	/***************************************
	 * 
	 * deleteAll
	 * 
	 * Elimina todos los documentos de la base de datos
	 * 
	 * @author Ezentis
	 *
	 *************************************/
	@Override
	public void deleteAll() {
		documentoRepository.deleteAll();
	}

	/***************************************
	 * 
	 * exists
	 * 
	 * Localiza un documento identificado por su id en la base de datos. Devuelve un booleano con el resultado de la
	 * búsqueda.
	 * 
	 * @author Ezentis
	 * @param Long id Identificador del documento a buscar
	 * @return boolean Resultado de la búsqueda
	 * 
	 *************************************/
	@Override
	public boolean exists(Long id) {
		return documentoRepository.exists(id);
	}

	/***************************************
	 * 
	 * findAll
	 * 
	 * Busca todos los documentos almacenados en base de datos y los devuelve
	 * 
	 * @author Ezentis
	 * @return Iterable<Documento> Todos los documentos almacenados en base de datos
	 * 
	 *************************************/
	@Override
	public Iterable<Documento> findAll() {
		return documentoRepository.findAll();
	}

	/***************************************
	 * 
	 * findAll
	 * 
	 * Busca una serie de documentos almacenados en base de datos. Los documentos a buscar están identificados por sus
	 * id. Devuelve los documentos buscados
	 * 
	 * @author Ezentis
	 * @param Iterable<Long> ids Identificadores de los documentos a buscar
	 * @return Iterable<Documento> Documentos seleccionados
	 * 
	 *************************************/
	@Override
	public Iterable<Documento> findAll(Iterable<Long> ids) {
		return documentoRepository.findAll(ids);
	}

	/***************************************
	 * 
	 * findOne
	 * 
	 * Busca un documento en base de datos identificado por su id y lu devuelve.
	 * 
	 * @author Ezentis
	 * @param Long id Identificador del documento a localizar
	 * @return Documento Documento localizado
	 * 
	 *************************************/
	@Override
	public Documento findOne(Long id) {
		return documentoRepository.findOne(id);
	}

	/***************************************
	 * 
	 * findByFechaBajaIsNotNull
	 * 
	 * Busca todos los usuarios no eliminados.
	 * 
	 * @author Ezentis
	 * @return Iterable<Documento> Documentos seleccionados
	 * 
	 *************************************/
	@Override
	public Iterable<Documento> findByFechaBajaIsNull() {
		return documentoRepository.findByFechaBajaIsNull();
	}

	/***************************************
	 * 
	 * save
	 * 
	 * Guarda una serie de documentos en base de datos. Como parámetro recibe los documentos a guardar y devuelve los
	 * documentos guardados.
	 * 
	 * @author Ezentis
	 * @param Iterable<Documento> entities Documentos a salvar
	 * @return Iterable<Documento> Documentos salvado
	 * 
	 *************************************/
	@Override
	public Iterable<Documento> save(Iterable<Documento> entities) {
		return documentoRepository.save(entities);
	}

	/***************************************
	 * 
	 * save
	 * 
	 * Guarda un documento en base de datos. Como parámetro recibe el documento a guardar y devuelve el documento
	 * guardado.
	 * 
	 * @author Ezentis
	 * @param Documento Documento a guardar
	 * @return Documento Documento guardado
	 *************************************/
	@Override
	public Documento save(Documento entity) {
		return documentoRepository.save(entity);
	}

	/***************************************
	 * 
	 * descargaDocumento
	 * 
	 * Recibe un documento como parámetro y devuelve un stream para realizar la descarga.
	 * 
	 * @author Ezentis
	 * @param Documento Documento a descargar
	 * @return DefaultStreamedContent Flujo de descarga
	 * @throws SQLException
	 *************************************/
	@Override
	public DefaultStreamedContent descargaDocumento(Documento entity) throws SQLException {
		// InputStream stream = new ByteArrayInputStream(entity.getFichero());
		InputStream stream = entity.getFichero().getBinaryStream();
		return new DefaultStreamedContent(stream, entity.getTipoContenido(), entity.getNombre());
	}

	/***************************************
	 * 
	 * descargaDocumento
	 * 
	 * Recibe el id de un documento como parámetro y devuelve un stream para realizar la descarga.
	 * 
	 * @author Ezentis
	 * @param Documento Documento a descargar
	 * @return DefaultStreamedContent Flujo de descarga
	 * @throws SQLException
	 *************************************/
	@Override
	public DefaultStreamedContent descargaDocumento(Long id) throws SQLException {
		Documento entity = findOne(id);

		// InputStream stream = new ByteArrayInputStream(entity.getFichero());
		InputStream stream = entity.getFichero().getBinaryStream();
		return new DefaultStreamedContent(stream, entity.getTipoContenido(), entity.getNombre());

	}

	/***************************************
	 * 
	 * cargaDocumento
	 * 
	 * Recibe un archivo UploadedFile del que recupera los datos para generar un Documento que se almacenará en base da
	 * datos. Devuelve el documento almacenado
	 * 
	 * @author Ezentis
	 * @param UploadedFile
	 * @return Documento
	 * @throws SQLException
	 * 
	 *************************************/

	@Override
	public Documento cargaDocumento(UploadedFile file) throws SQLException {
		try {
			notificacionService.crearNotificacionRol("Carga fichero", SeccionesEnum.GESTOR.getDescripcion(),
					RoleEnum.ADMIN);
			registroActividadService.altaRegActividad("cargaFichero", EstadoRegActividadEnum.ALTA.name(),
					SeccionesEnum.GESTOR.getDescripcion());

			return documentoRepository.save(crearDocumento(file));
		}
		catch (Exception ex) {
			registroActividadService.altaRegActividadError("Carga documento", ex);
			throw ex;
		}
	}

	@Override
	public Documento crearDocumento(UploadedFile file) {
		Documento docu = new Documento();
		docu.setNombre(file.getFileName());
		Blob fileBlob = Hibernate.getLobCreator(sessionFactory.openSession()).createBlob(file.getContents());
		docu.setFichero(fileBlob);
		docu.setTipoContenido(file.getContentType());
		return docu;
	}

	/***************************************
	 * 
	 * extensionCorrecta
	 * 
	 * Recibe un objeto de tipo UploadedFile y comprueba que el content-type dado por JSF (basándose en su extensión) se
	 * corresponde con el content-type real obtenido a través de Tika (basándose en el contenido de la cabecera)
	 * 
	 * @author Ezentis
	 * @param UploadedFile
	 * @return boolean
	 *
	 *************************************/

	@Override
	public boolean extensionCorrecta(UploadedFile file) {

		ContentHandler contenthandler = new BodyContentHandler();
		Metadata metadata = new Metadata();
		metadata.set(Metadata.RESOURCE_NAME_KEY, file.getFileName());
		Parser x = new AutoDetectParser();
		try {
			x.parse(file.getInputstream(), contenthandler, metadata, null);
		}
		catch (IOException | SAXException | TikaException e) {
			registro.altaRegActividadError("DocumentoService", e);
		}

		String tipo = metadata.get("Content-Type");

		return tipo.equalsIgnoreCase(file.getContentType());
	}

}
