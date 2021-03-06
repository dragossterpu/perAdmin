package es.mira.progesin.persistence.entities.gd;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import es.mira.progesin.converters.ListaExtensionesAdapter;
import es.mira.progesin.persistence.entities.enums.AmbitoInspeccionEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * Entidad para los tipos de documentación previa.
 * 
 * @author EZENTIS
 *
 */
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode()
@Builder
@ToString
@Getter
@Setter
@Entity
@Table(name = "tipodocumentacionprevia")

public class TipoDocumentacion implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * ID.
     */
    @Id
    @SequenceGenerator(name = "seq_tipodocumentacionprevia", sequenceName = "seq_tipodocumentacionprevia", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_tipodocumentacionprevia")
    @Column(name = "ID", nullable = false)
    private Long id;
    
    /**
     * Descripción.
     */
    @Column(name = "DESCRIPCION", length = 255)
    private String descripcion;
    
    /**
     * Nombre.
     */
    @Column(name = "NOMBRE", length = 100)
    private String nombre;
    
    /**
     * Extensiones.
     */
    @Column(name = "EXTENSIONES")
    @Convert(converter = ListaExtensionesAdapter.class)
    private List<String> extensiones;
    
    /**
     * Ámbito.
     */
    @Column(name = "ambito", length = 10)
    @Enumerated(EnumType.STRING)
    private AmbitoInspeccionEnum ambito;
}
