package es.mira.progesin.persistence.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import es.mira.progesin.persistence.entities.enums.AmbitoInspeccionEnum;
import es.mira.progesin.persistence.entities.enums.CuatrimestreEnum;
import es.mira.progesin.persistence.entities.enums.EstadoInspeccionEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Entidad creada para alamcenar una inspección.
 * 
 * @author EZENTIS
 *
 */
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false, of = "id")
@Builder
@Getter
@Setter
@Entity
@Table(name = "inspecciones")
public class Inspeccion extends AbstractEntity implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * ID.
     */
    @Id
    @SequenceGenerator(name = "seq_inspeccion", sequenceName = "seq_inspeccion", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_inspeccion")
    @Column(name = "id")
    private Long id;
    
    /**
     * Tipo de inspección.
     */
    @ManyToOne
    @JoinColumn(name = "tipo_inspeccion", foreignKey = @ForeignKey(name = "fk_i_tipo_inspeccion"), nullable = false)
    private TipoInspeccion tipoInspeccion;
    
    /**
     * Equipo.
     */
    @ManyToOne
    @JoinColumn(name = "id_equipo", foreignKey = @ForeignKey(name = "fk_i_equipo"), nullable = false)
    private Equipo equipo;
    
    /**
     * Nombre de unidad.
     */
    @Column(name = "nombre_unidad")
    private String nombreUnidad;
    
    /**
     * Tipo de unidad.
     */
    @ManyToOne
    @JoinColumn(name = "tipo_unidad", foreignKey = @ForeignKey(name = "FK_i_TIPOUNIDAD"))
    private TipoUnidad tipoUnidad;
    
    /**
     * Ámbito.
     */
    @Column(name = "ambito", length = 10, nullable = false)
    @Enumerated(EnumType.STRING)
    private AmbitoInspeccionEnum ambito;
    
    /**
     * Cuatrimestre.
     */
    @Column(name = "cuatrimestre", length = 30)
    @Enumerated(EnumType.STRING)
    private CuatrimestreEnum cuatrimestre;
    
    /**
     * Estado de inspección.
     */
    @Column(name = "estado_inspeccion", length = 30)
    @Enumerated(EnumType.STRING)
    private EstadoInspeccionEnum estadoInspeccion;
    
    /**
     * Año.
     */
    @Column(name = "anio", nullable = false)
    private Integer anio;
    
    /**
     * Municipio.
     */
    @ManyToOne
    @JoinColumn(name = "id_municipio", foreignKey = @ForeignKey(name = "FK_i_MUNICIPIO"))
    private Municipio municipio;
    
    /**
     * Fecha de finalización.
     */
    @Column(name = "fecha_finalizacion")
    private Date fechaFinalizacion;
    
    /**
     * Usuario de finalización.
     */
    @Column(name = "username_finalizacion")
    private String usernameFinalizacion;
    
    /**
     * Fecha prevista.
     */
    @Column(name = "fecha_prevista")
    private Date fechaPrevista;
    
    /**
     * Usuario de anulación.
     */
    @Column(name = "username_anulacion")
    private String usernameAnulacion;
    
    /**
     * Fecha de anulación.
     */
    @Column(name = "fecha_anulacion")
    private Date fechaAnulacion;
    
    /**
     * Inspecciones asociadas.
     */
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "inspecciones_asociadas", joinColumns = {
            @JoinColumn(name = "id_inspeccion") }, inverseJoinColumns = {
                    @JoinColumn(name = "id_inspeccion_asociada") })
    private List<Inspeccion> inspecciones;
    
    /**
     * @return numero de inspección, compuesto por el id y el año
     */
    public String getNumero() {
        return id + "/" + anio;
    }
    
}
