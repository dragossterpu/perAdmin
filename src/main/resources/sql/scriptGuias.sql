WHENEVER OSERROR EXIT FAILURE ROLLBACK
WHENEVER SQLERROR EXIT FAILURE ROLLBACK

prompt =========================================================================
prompt
prompt    SCRIPT CARGA DE GUÍAS
prompt
prompt    Autor: EZENTIS
prompt
prompt    Fecha modificación: 12/12/2017
prompt =========================================================================


prompt =========================================================================
prompt + Carga de guías
prompt =========================================================================


insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) 
values (SEQ_GUIAS.NEXTVAL,'ÁREAS ADMINISTRATIVAS Y APOYO GC','I.G.P.',0,trunc(sysdate),'system');


insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN PLANA MAYOR:Estructura y composición. Solicitar el Organigrama de la Plana Mayor, identificando al responsable y cada uno de los negociados que la componen','0');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN PLANA MAYOR:Dimensionado del personal que atiende los distintos negociados de la Plana Mayor. Valorar suficiencia, insuficiencia o sobredimensionamiento. Adecuación de su formación','1');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN PLANA MAYOR: Turnos y horario de trabajo. Ver si tienen encomendadas labores complementarias con su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','2');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN PLANA MAYOR: Medios informáticos con los que cuentan. Suficiencia y estado','3');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN PLANA MAYOR: Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','4');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias):  Identificar al responsable y solicitar relación nominal del personal dedicado a estos cometidos. Adecuación de su formación','5');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias):  Identificar responsables de áreas','6');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias):  Identificar cajero pagador, suplente y habilitado','7');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','8');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','9');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Cursos realizados por el personal, que tengan relación con el puesto de trabajo. Detectar necesidades de formación adicionales','10');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Programas informáticos que utilizan y su compatibilidad con la Hacienda Pública. Problemática que pueda plantear su utilización','11');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Indicar cuantía de Anticipo de Caja Fija. Valorar suficiencia','12');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Cantidad autorizada de dinero en metálico en caja. Valorar suficiencia','13');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Solicitar el último informe de control financiero ejecutado por la Intervención Territorial de la Intervención General de la Administración del Estado, comprobando si se han cumplido las recomendaciones establecidas en el mismo','14');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Solicitar informe detallado de los créditos asignados, por concepto presupuestario, gestionados en  los DOS ÚLTIMOS AÑOS NATURALES y del año en curso (hasta la fecha de la inspección). Asignación inicial, modificaciones y gastado. Ver si ha habido incremento y si se ejecuta el dinero asignado, así como si se fomenta la videoconferencia en los juicios para ahorrar en gastos de dietas','15');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Solicitar informe relativo a la contratación y prestación de servicios de interpretación. Modo de prestación y provisión de estos recursos. Recursos económicos asignados. Deficiencias, problemáticas y necesidades','16');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Verificar que se envían en tiempo y forma los estados trimestrales de la  situación de tesorería, solicitando el correspondiente al último trimestre','17');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Infraestructuras (oficina, mobiliario, etc.) y medios informáticos con los que cuentan. Suficiencia y estado','18');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias): Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','19');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN UNIDAD/OFICINA DE GESTIÓN ECONÓMICA (UGE/OGE) (Solo Zonas y Comandancias):  Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','20');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','21');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','22');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','23');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Comprobar si el registro es único y si está informatizado o es manual. Posibles problemas que pueda plantear su manejo y operatividad.','24');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Identificar qué personas tienen acceso al mismo, tanto para los documentos de entrada como para los de salida, y medios de acceso (claves personales u otros).','25');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Solicitar datos de la actividad realizada durante los dos últimos años naturales completos, que comprenda los número de escritos físicos registrados de entrada y de salida
','26');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Solicitar datos de la actividad realizada durante los dos últimos años naturales completos, que comprenda el número de correos electrónicos registrados de entrada y de salida.
','27');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales, estableciendo la media diaria de documentos registrados (solo días laborables), así como la ratio de documentos/hora','28');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Comprobar posibles retrasos en el registro de los documentos y si se consideran normales en función de la carga de trabajo','29');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Videoconferencias que se realizan anualmente, valorando la carga de trabajo que suponen','30');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Infraestructuras (oficina, mobiliario, etc.) y medios informáticos con los que cuentan. Suficiencia y estado','31');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','32');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO Y ARCHIVO: Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','33');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASESORÍA JURÍDICA (Solo Zonas): Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','34');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASESORÍA JURÍDICA (Solo Zonas): Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','35');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASESORÍA JURÍDICA (Solo Zonas): Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','36');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASESORÍA JURÍDICA (Solo Zonas): Control de la actividad. Solicitar la siguiente información numérica correspondiente a los dos últimos años naturales completos, de forma separada:
Actividad-Informes:
-Recusación instructores expediente por falta grave.
-Incoación expedientes faltas graves.
-Paralización expedientes faltas graves.
-Resoluciones expedientes faltas graves.
-Archivo expedientes faltas graves.
-Resolución Recurso de Alzada expediente disciplinario.
-Permisos, licencias, etc.
-Bajas médicas.
-Riesgos laborales.
-Lesiones en acto de servicio.
-Pabellones.
-Resarcimientos y responsabilidad patrimonial.
-Chalecos antibala.
-Limitaciones de servicio.
-Comisiones de servicio.
-Productividad.
-Otros procedimientos (especificar).
-Varios (especificar).','37');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASESORÍA JURÍDICA (Solo Zonas): Control de la actividad. Solicitar la siguiente información numérica correspondiente a los dos últimos años naturales completos, de forma separada: Informaciones reservadas.','38');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASESORÍA JURÍDICA (Solo Zonas): En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','39');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASESORÍA JURÍDICA (Solo Zonas): Examinar, de manera aleatoria, algunos de los procedimientos incoados, comprobando adecuación de su estructura, si cumple con los trámites de notificación, alegaciones y resoluciones en tiempo y forma','40');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASESORÍA JURÍDICA (Solo Zonas): Infraestructuras (oficinas, mobiliario, etc.) y medios informáticos con los que cuentan. Suficiencia y estado','41');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASESORÍA JURÍDICA (Solo Zonas): Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','42');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASESORÍA JURÍDICA (Solo Zonas): Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','43');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO:Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','44');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO:Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','45');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO:Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','46');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO: Control de la actividad. Solicitar la siguiente información correspondiente a los dos últimos años naturales completos, de forma separada:
-Número de Procedimientos incoados por falta leve.
  -Motivo por el que se ha incoado cada uno de los citados procedimientos, especificando su número.
  -Funcionarios inculpados en los mismos.
  -Resoluciones adoptadas para cada uno de dichos inculpados:
    -Archivo.
    -Reprensión.
    -Sanción (indicando el número de días).
  -Elevaciones de expediente a falta grave o muy grave.
  -Procedimientos en trámite.
  -Tiempo medio empleado para la tramitación.
-Número de informaciones reservadas:
  -Abiertas.
  -Archivadas.
  -Elevadas a procedimiento por falta leve
  -Elevadas a expediente por falta grave o muy grave.
-Reseñar los procedimientos caducados y archivados por prescripción, indicando los motivos, consignando la falta leve por la que se ha instruido y su número de procedimiento.
-Número de procedimientos por faltas graves y muy graves incoados a personal de la Comandancia, agentes implicados y sanción impuesta.
-Otros procedimientos. Número de expedientes por:
  -Lesiones en acto de servicio.
  -Resarcimiento de daños.
  -Otros (especificar).','47');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO:En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','48');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO:Examinar, de manera aleatoria, algunos de los procedimientos incoados, comprobando adecuación de su estructura, si cumple con los trámites de notificación, alegaciones y resoluciones en tiempo y forma','49');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO:Infraestructuras (oficinas, mobiliario, etc.) y medios informáticos con los que cuentan. Suficiencia y estado','50');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO:Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','51');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO:Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','52');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA:Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','53');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA:Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','54');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA:Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','55');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA:Control de la actividad. Solicitar la siguiente información correspondiente a los dos últimos años naturales completos, de forma separada:
-Número de casos asignados.
-Número de entrevistas preparatorias con funcionarios:
  -Personales.
  -Telefónicas.
-Número de intervenciones preliminares ante órganos judiciales.
-Número de juicios orales.
-Número de Resoluciones definitivas:
  -Autos de sobreseimiento provisionales.
  -Autos de sobreseimiento libres.
  -Sentencias absolutorias.
  -Sentencias condenatorias.
-Número de recursos:
  -Contra resoluciones interlocutorias.
  -Contra resoluciones definitivas.','56');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA:En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','57');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA:Asuntos pendientes en el momento de la inspección. Justificación del posible retraso acumulado','58');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA:Infraestructuras (oficina, mobiliario, etc.) y medios informáticos con los que cuentan. Suficiencia y estado','59');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA:Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios.','60');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA:Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','61');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN OFICINA PERIFERICA DE COMUNICACIÓN (Solo Comandancias)Identificar al responsable y número de personas dedicado a este cometido. Dependencia orgánica y funcional. Adecuación de su formación','62');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN OFICINA PERIFERICA DE COMUNICACIÓN (Solo Comandancias)Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento.','63');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN OFICINA PERIFERICA DE COMUNICACIÓN (Solo Comandancias)Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','64');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN OFICINA PERIFERICA DE COMUNICACIÓN (Solo Comandancias)Control de la actividad. Solicitar la siguiente información numérica correspondiente a los dos últimos años naturales completos, de forma separada:
-Notas de prensa.
-Noticias propias aparecidas.
-Noticias ajenas aparecidas.
-Imágenes:
  -Video.
  -Fotos.
-Entrevistas.
-Reportajes.
-Ruedas de prensa.
-Dossier prensa.
-Conferencias.
-Actos oficiales:
  -Guardia Civil.
  -Ajenos.
-Colaboraciones:
  -Policías.
  -Otros.
-Festivales y ferias.
-Vinos de honor.
-Otras actividades no recogidas (especificar).','65');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN OFICINA PERIFERICA DE COMUNICACIÓN (Solo Comandancias)En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','66');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN OFICINA PERIFERICA DE COMUNICACIÓN (Solo Comandancias)Examinar, de manera aleatoria, varias notas de prensa emitidas, valorando la adecuación de su estructura y contenido','67');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN OFICINA PERIFERICA DE COMUNICACIÓN (Solo Comandancias)Presencia en las redes sociales','68');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN OFICINA PERIFERICA DE COMUNICACIÓN (Solo Comandancias)Infraestructuras (oficina, mobiliario, etc.) y medios técnicos, audiovisuales e informáticos con los que cuentan. Suficiencia y estado','69');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN OFICINA PERIFERICA DE COMUNICACIÓN (Solo Comandancias)Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','70');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN OFICINA PERIFERICA DE COMUNICACIÓN (Solo Comandancias)Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','71');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'NÚCLEO DE DESTINOS (Solo Comandancias)Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación y cualificación','72');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'NÚCLEO DE DESTINOS (Solo Comandancias)Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','73');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'NÚCLEO DE DESTINOS (Solo Comandancias)Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','74');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'NÚCLEO DE DESTINOS (Solo Comandancias)Control de la actividad. Solicitar una relación numérica de la actividad realizada durante los dos últimos años naturales completos, de forma separada','75');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'NÚCLEO DE DESTINOS (Solo Comandancias)En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','76');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'NÚCLEO DE DESTINOS (Solo Comandancias)Infraestructuras (oficina, mobiliario, etc.), equipos y medios informáticos con los que cuentan. Suficiencia y estado','77');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'NÚCLEO DE DESTINOS (Solo Comandancias)Horarios de actividad. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','78');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'NÚCLEO DE DESTINOS (Solo Comandancias)Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','79');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASIdentificar al responsable de supervisar las contestaciones y quiénes las contestan. Dependencia orgánica y funcional. Adecuación de su formación','80');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASDimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento. Compatibilización con otras tareas','81');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASNúmero y dónde se encuentran ubicados los libros de atención al ciudadano. Valorar suficiencia','82');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASExistencia de cartel anunciador','83');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASComprobación de que se hallan bien cumplimentado','84');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASComprobar tiempos de contestación y si exceden de los establecidos en la Instrucción 7/2007','85');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASComprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','86');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASControl de la actividad. Solicitar la siguiente información numérica, correspondiente a los dos últimos años naturales completos, de forma separada:
-Quejas.
-Sugerencias.
-Felicitaciones
-Otras (especificar).','87');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASEn relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','88');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASComprobar varias de las contestaciones realizadas para verificar su adecuación al caso concreto y que se evitan respuestas estandarizadas','89');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASInfraestructuras (oficina, mobiliario, etc.), y medios informáticos con los que cuentan. Suficiencia y estado','90');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASHorarios de actividad. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','91');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIASProblemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','92');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN DE ACCIÓN SOCIAL. (Solo Zonas y Comandancias)Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','93');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN DE ACCIÓN SOCIAL. (Solo Zonas y Comandancias)Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','94');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN DE ACCIÓN SOCIAL. (Solo Zonas y Comandancias)Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','95');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN DE ACCIÓN SOCIAL. (Solo Zonas y Comandancias)Control de la actividad. Solicitar una relación numérica de la actividad realizada durante los dos últimos años naturales completos, de forma separada','96');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN DE ACCIÓN SOCIAL. (Solo Zonas y Comandancias)En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','97');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN DE ACCIÓN SOCIAL. (Solo Zonas y Comandancias)Infraestructuras (oficina, mobiliario, etc.), equipos y medios informáticos con los que cuentan. Suficiencia y estado','98');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN DE ACCIÓN SOCIAL. (Solo Zonas y Comandancias)Horarios de actividad. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','99');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN DE ACCIÓN SOCIAL. (Solo Zonas y Comandancias)Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','100');
commit;

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values (SEQ_GUIAS.NEXTVAL,'ÁREAS ADMINISTRATIVAS Y APOYO PN','I.G.P.',0,trunc(sysdate),'system');



insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN SECRETARÍA GENERAL:Solicitar el Organigrama de la Secretaría, identificando al responsable y cada uno de los departamentos que la componen','0');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN SECRETARÍA GENERAL:Dimensionado del personal que atiende los departamentos de la Secretaría. Valorar suficiencia, insuficiencia o sobredimensionamiento. Adecuación de su formación','1');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN SECRETARÍA GENERAL:Turnos y horario de trabajo. Ver si tienen encomendadas labores complementarias con su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','2');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN SECRETARÍA GENERAL:Medios informáticos con los que cuentan. Suficiencia y estado','3');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN SECRETARÍA GENERAL:Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','4');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Identificar al responsable y solicitar relación nominal del personal dedicado a estos cometidos. Adecuación de su formación','5');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Identificar al cajero pagador, suplente y habilitado','6');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','7');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','8');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Cursos realizados por el personal, que tengan relación con el puesto de trabajo. Detectar necesidades de formación adicionales','9');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Programas informáticos que utilizan y su compatibilidad con la Hacienda Pública. Problemática que pueda plantear su utilización','10');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Solicitar el último informe de control financiero ejecutado por la Intervención Territorial de la Intervención General de la Administración del Estado, comprobando si se han cumplido las recomendaciones establecidas en el mismo','11');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Solicitar informe detallado de los créditos asignados, por concepto presupuestario, gestionados en  los DOS ÚLTIMOS AÑOS NATURALES y del año en curso (hasta la fecha de la inspección). Asignación inicial, modificaciones y gastado. Ver si ha habido incremento y si se ejecuta el dinero asignado, así como si se fomenta la videoconferencia en los juicios para ahorrar en gastos de dietas','12');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Indicar cuantía de Anticipo de Caja Fija. Suficiencia de la cantidad asignada','13');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Cantidad autorizada de dinero en metálico en caja. Suficiencia de dicha cantidad','14');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Solicitar informe relativo a la contratación y prestación de servicios de interpretación. Modo de prestación y provisión de estos recursos. Recursos económicos asignados. Deficiencias, problemáticas y necesidades','15');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Verificar que se envían en tiempo y forma los estados trimestrales de la  situación de tesorería, solicitando el correspondiente al último trimestre','16');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Infraestructuras (oficina, mobiliario, etc.) y medios informáticos con los que cuentan. Suficiencia y estado','17');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','18');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GESTIÓN ECONÓMICA Y HABILITACIÓN (Solo Jefaturas Superiores y Comisarías Provinciales)Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','19');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','20');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','21');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','22');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: Comprobar si el registro es único y si está informatizado o es manual. Posibles problemas que pueda plantear su manejo y operatividad','23');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: Identificar qué personas tienen acceso al mismo, tanto para los documentos de entrada como para los de salida, y medios de acceso (claves personales u otros).','24');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: Solicitar datos de la actividad realizada durante los dos últimos años naturales completos, que comprenda:
-Número de escritos físicos registrados de entrada y de salida.
-Número de correos electrónicos registrados de entrada y de salida
','25');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales, estableciendo la media diaria de documentos registrados (solo días laborables), así como la ratio de documentos/hora','26');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: Comprobar posibles retrasos en el registro de los documentos y si se consideran normales en función de la carga de trabajo','27');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: Videoconferencias que se realizan anualmente, valorando la carga de trabajo que suponen','28');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: Infraestructuras (oficina, mobiliario, etc.) y medios informáticos con los que cuentan. Suficiencia y estado','29');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','30');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'REGISTRO GENERAL: Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','31');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ARCHIVO GENERAL: Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','32');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ARCHIVO GENERAL: Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','33');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ARCHIVO GENERAL: Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','34');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ARCHIVO GENERAL: Dimensionado del archivo. Si está informatizado o no (proponer digitalización, en su caso). Posible saturación (necesidad de espurgue)','35');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ARCHIVO GENERAL: Control de la actividad realizada mediante la solicitud de los siguientes datos, correspondientes a los dos últimos años naturales completos, de forma separada:
-Número de legajos abiertos.
-Número de documentos tramitados-archivados por día (media).
-Tiempo medio de retraso en el archivo de los documentos desde su tramitación.
-Espurgue de legajos realizado.
-Número de consultadas realizadas (Libro de control).','36');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ARCHIVO GENERAL: En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','37');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ARCHIVO GENERAL: Procedimiento de archivo de los atestados (y número de los archivados cada año) sin autor conocido y no enviados a la Autoridad Judicial ni al Ministerio Fiscal, de conformidad con lo dispuesto en el artículo 284 de la Ley de Enjuiciamiento Criminal','38');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ARCHIVO GENERAL: Comprobar “in situ” posibles retrasos en el registro de los documentos y si se consideran normales en función de la carga de trabajo','39');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ARCHIVO GENERAL: Infraestructuras (oficina, mobiliario, etc.) y medios informáticos con los que cuentan. Suficiencia y estado','40');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ARCHIVO GENERAL: Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','41');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ARCHIVO GENERAL: Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','42');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO: Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','43');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO: Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','44');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO: Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','45');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO: Control de la actividad. Solicitar la siguiente información correspondiente a los dos últimos años naturales completos, de forma separada:
-Número de Procedimientos incoados por falta leve.
  -Motivo por el que se ha incoado cada uno de los citados procedimientos, especificando su número.
  -Funcionarios inculpados en los mismos.
  -Resoluciones adoptadas para cada uno de dichos inculpados:
    -Archivo.
    -Apercibimiento.
    -Sanción (indicando el número de días).
  -Elevaciones de expediente a falta grave o muy grave.
  -Procedimientos en trámite.
  -Tiempo medio empleado para la tramitación.
-Número de informaciones reservadas:
  -Abiertas.
  -Archivadas.
  -Elevadas a procedimiento por falta leve
  -Elevadas a expediente por falta grave o muy grave.
-Reseñar los procedimientos caducados y archivados por prescripción, indicando los motivos, consignando la falta leve por la que se ha instruido y su número de procedimiento.
-Número de procedimientos por faltas graves y muy graves incoados a personal de la Comisaría, funcionarios implicados y sanción impuesta.
-Otros procedimientos. Número de expedientes por:
  -Lesiones en acto de servicio.
  -Resarcimiento de daños.
  -Otros (especificar).','46');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO: En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','47');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO: Examinar, de manera aleatoria, algunos de los procedimientos incoados, comprobando adecuación de su estructura, si cumple con los trámites de notificación, alegaciones y resoluciones en tiempo y forma','48');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO: Infraestructuras (oficinas, mobiliario, etc.) y medios informáticos con los que cuentan. Suficiencia y estado','49');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO: Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','50');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'RÉGIMEN DISCIPLINARIO: Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','51');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA: Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','52');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA: Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','53');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA: Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','54');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA: Control de la actividad. Solicitar la siguiente información correspondiente a los dos últimos años naturales completos, de forma separada:
-Número de casos asignados.
-Número de entrevistas preparatorias con funcionarios:
  -Personales.
  -Telefónicas.
-Número de intervenciones preliminares ante órganos judiciales.
-Número de juicios orales.
-Número de Resoluciones definitivas:
  -Autos de sobreseimiento provisionales.
  -Autos de sobreseimiento libres.
-Número de recursos:
  -Contra resoluciones interlocutorias.
  -Contra resoluciones definitivas.','55');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA: En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','56');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA: Asuntos pendientes en el momento de la inspección. Justificación del posible retraso acumulado','57');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA: Infraestructuras (oficina, mobiliario, etc.) y medios informáticos con los que cuentan. Suficiencia y estado','58');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA: Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','59');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ASISTENCIA LETRADA: Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','60');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GABINETE DE PRENSA (Solo Jefaturas Superiores y Comisarías Provinciales)Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','61');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GABINETE DE PRENSA (Solo Jefaturas Superiores y Comisarías Provinciales)Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento','62');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GABINETE DE PRENSA (Solo Jefaturas Superiores y Comisarías Provinciales)Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','63');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GABINETE DE PRENSA (Solo Jefaturas Superiores y Comisarías Provinciales)Control de la actividad. Solicitar la siguiente información numérica correspondiente a los dos últimos años naturales completos, de forma separada:
-Notas de prensa.
-Ruedas de prensa.
-Noticias propias aparecidas en prensa.
-Noticias propias aparecidas en radio.
-Noticias propias aparecidas en televisión.
-Noticias ajenas aparecidas en medios de comunicación.
-Intervenciones en radio.
-Intervenciones en televisión.
-Intervenciones en otros medios (especificar cuáles).
-Conferencias.
-Actos oficiales.
-Colaboraciones (especificar).
-Festivales y ferias.
-Otras actividades no recogidas (especificar).','64');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GABINETE DE PRENSA (Solo Jefaturas Superiores y Comisarías Provinciales)En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','65');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GABINETE DE PRENSA (Solo Jefaturas Superiores y Comisarías Provinciales)Examinar, de manera aleatoria, varias notas de prensa emitidas, valorando la adecuación de su estructura y contenido','66');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GABINETE DE PRENSA (Solo Jefaturas Superiores y Comisarías Provinciales)Presencia en las redes sociales','67');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GABINETE DE PRENSA (Solo Jefaturas Superiores y Comisarías Provinciales)Infraestructuras (oficina, mobiliario, etc.) y medios técnicos, audiovisuales e informáticos con los que cuentan. Suficiencia y estado','68');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GABINETE DE PRENSA (Solo Jefaturas Superiores y Comisarías Provinciales)Horarios de actividad. Ver si tienen encomendadas labores distintas de su actividad principal. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','69');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSPECCIÓN GABINETE DE PRENSA (Solo Jefaturas Superiores y Comisarías Provinciales)Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','70');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','71');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: Dimensionado del personal. Equipos establecidos. Turnos de mañana, tarde y/o jornada continuada. Valorar suficiencia, insuficiencia o sobredimensionamiento. Existencia de equipos móviles y análisis ','72');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','73');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: Funcionamiento de la cita previa. Retrasos. Existencia de aglomeración de gente en determinados horarios (colas). Propuestas de mejora','74');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: Control de la actividad. Solicitar la siguiente información numérica, POR CADA EQUIPO, correspondiente a los dos últimos años naturales completos, de forma separada:
-Producción de DNI (jornada ordinaria):
  -Número de funcionarios.
  -Número de terminales/Puestos de trabajo.
  -Citas previas anuales DNI.
  -DNI,s expedidos.
  -Número de Tarjetas anuladas:
    -Número total.
    -Causas:
-Chip.
-Impresora
-Otras (especificar).
  -Informes emitidos.
-Producción de Pasaportes (jornada ordinaria):
  -Número de funcionarios.
  -Número de terminales/Puestos de trabajo.
  -Citas previas anuales Pasaportes.
  -Pasaportes expedidos.
  -Número de Libretas anuladas:
    -Número total.
    -Causas:
-Chip.
-Impresora
-Otras (especificar).
  -Informes emitidos.
-Producción de DNI+Pasaportes (en horas extraordinarias):
Recabar la misma información de los apartados anteriores, pero referida a la actividad durante las horas extraordinarias, en su caso.
-Otros trámites documentales que se realizan (especificar).
-DNI RURAL:
  -Número de funcionarios.
  -DNI,s expedidos.','75');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','76');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: Tiempos de tramitación empleados (por días laborables, puestos de trabajo, funcionario, etc.).','77');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: Examinar, de manera aleatoria, varias actas de destrucción de DNI y Pasaportes, valorando los motivos y su posible corrección','78');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: Porcentaje de cobro en metálico (seguridad en la conservación e ingreso bancario) y de pago telemático previo','79');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: Infraestructuras (oficina, mobiliario, etc.), equipos de DNI-Pasaportes, y medios informáticos con los que cuentan. Suficiencia y estado','80');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: Horarios de actividad. Especificar el horario de atención al público (indicando el horario de verano). Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios. Horas extraordinarias que se realizan valorando si son necesarias','81');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE CIUDADANOS ESPAÑOLES: D.N.I. y PASAPORTE: Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','82');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE EXTRANJEROS: Identificar al responsable y número de personas dedicado a este cometido. Adecuación de su formación','83');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE EXTRANJEROS: Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento. Puestos de trabajo existentes para atender al público ','84');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE EXTRANJEROS: Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','85');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE EXTRANJEROS: Control de la actividad. Solicitar la siguiente información numérica, correspondiente a los dos últimos años naturales completos, de forma separada:
-Número de funcionarios.
-Número total de trámites realizados:
  -T.I.E.
  -Certificados
  -Certificados UE
  -Asignación N.I.E.
  -Prórrogas de estancia.
  -Residencias no lucrativas.
  -Solicitud Asilo y Refugio.
  -Títulos de Viaje.
  -Cédulas de inscripción.
  -Otros (especificar).','86');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE EXTRANJEROS: En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','87');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE EXTRANJEROS: Tiempos de tramitación empleados (por días laborables, puestos de trabajo, funcionario, etc.). Posibles retrasos en la expedición de informes de nacionalidad y otros documentos, motivación y soluciones','88');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE EXTRANJEROS: Control que se tiene de las Cartas de invitación, en el sentido de si comprueban la salida del invitado cuando llega la fecha de marcharse','89');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE EXTRANJEROS: Infraestructuras (oficina, mobiliario, etc.), y medios informáticos con los que cuentan. Suficiencia y estado','90');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE EXTRANJEROS: Horarios de actividad. Especificar el horario de atención al público (indicando el horario de verano). Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','91');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'DOCUMENTACIÓN DE EXTRANJEROS: Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','92');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Identificar al responsable de supervisar las contestaciones y quiénes las contestan. Dependencia orgánica y funcional. Adecuación de su formación','93');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Dimensionado del personal. Valorar suficiencia, insuficiencia o sobredimensionamiento. Compatibilización con otras tareas','94');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Número y dónde se encuentran ubicados los libros de atención al ciudadano. Valorar suficiencia','95');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Existencia de cartel anunciador','96');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Comprobación de que se hallan bien cumplimentados','97');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Comprobar tiempos de contestación y si exceden de los establecidos en la Instrucción 7/2007','98');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Comprobar qué actividades realizan y si tienen establecido un reparto de tareas entre los distintos funcionarios que permita valorar la carga individual de trabajo','99');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Control de la actividad. Solicitar la siguiente información numérica, correspondiente a los dos últimos años naturales completos, de forma separada:
-Quejas.
-Sugerencias.
-Felicitaciones
-Otras (especificar).','100');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: En relación con los datos del apartado anterior, comparar los resultados de ambos periodos anuales','101');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Comprobar varias de las contestaciones realizadas para verificar su adecuación al caso concreto y que se evitan respuestas estandarizadas','102');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Infraestructuras (oficina, mobiliario, etc.), y medios informáticos con los que cuentan. Suficiencia y estado','103');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Horarios de actividad. Comprobar que se cumple con la normativa en vigor sobre Jornada de Trabajo y medios con los que se cuenta para controlar el cumplimiento de los horarios','104');
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'QUEJAS Y SUGERENCIAS: Problemática y necesidades en relación con personal y medios, solicitando copia de los escritos mediante los que han comunicado dichas necesidades y las respuestas a los mismos, si se han producido','105');

COMMIT;

 --PREVENCIÓN DE RIESGOS LABORALES DE LA GUARDIA CIVIL.
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'PRL (Guardia civil)', 'I.T_PRL', 16, trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Organización, estructura, funciones y competencias del Servicio de Prevención.', 0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Estructura, Dependencia y Ámbito de Competencia. 
Comprobar que la estructura se adecúa a lo preceptuado en la Orden de INT 724.', 1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Personal destinado en el Servicio de Prevención con indicación de las titulaciones en materia de prevención tanto en la estructura central como territorial, así como personal de apoyo y auxiliar, con expresión de Orden y fecha de creación de la Unidad (Sección/Oficina).
Comprobar documentalmente.', 2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Medios materiales de que dispone para desarrollar la acción preventiva encomendada y asumida.', 3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Acreditar que los técnicos están formados adecuadamente en el correcto manejo de cada uno de los instrumentos. Justificar que cada instrumento se encuentra calibrado. Comprobar si son suficientes.', 4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Fecha de aprobación del Plan y Manual de Prevención de Riesgos Laborales y modificaciones que se hayan llevado a cabo, en su caso, en cada uno de los documentos.', 5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Plan de Prevención. 
Planes de Zona, elaborados por las Secciones y fecha de aprobación por el Director General de la Guardia Civil. Comprobar si han sido revisados. Si algún plan se encuentra sin aprobar justificar la causa.', 6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Relación de Evaluaciones de Riesgo realizadas, diferenciando las llevadas a cabo por el Servicio de Prevención, Secciones y Oficinas, en el periodo indicado, con especificación de si son iniciales o reevaluaciones (por reformas estructurales, nuevos equipos de trabajo, haber transcurrido el tiempo previsto y aquellas otras circunstancias que exijan una revisión y actualización).', 7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Evaluaciones de Riesgos.
Relación de las evaluaciones que quedan pendientes de realizar.', 8);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Comprobar si dichas evaluaciones de riesgos contemplan los correspondientes riesgos específicos (Unidades especializadas).', 9);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Evaluaciones de Riesgos. 
Examinar las evaluaciones.', 10);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Propuesta de Planificación Preventiva.  
Actividades de seguimiento y control de las acciones correctoras. Acreditar que se lleva control efectivo de las acciones correctoras.', 11);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Planes de Emergencia/Autoprotección elaborados durante el periodo, diferenciando los llevados a cabo por el Servicio de Prevención, Secciones y Oficinas.', 12);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Planes de Emergencia y de Autoprotección. 
Relación de los que quedan pendientes de realizar.', 13);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Planes de Emergencia y de Autoprotección. 
Indicar simulacros realizados.', 14);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Planes de Emergencia y de Autoprotección. 
Examinar copia de la documentación acreditativa (Actas).', 15);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Procedimientos de actuación y mecanismos de coordinación entre el Servicio de Prevención y los Servicios de Asistencia Sanitaria y de Psicología y Psicotecnia en materia de vigilancia y control de la salud de los guardias civiles en relación con los riesgos derivados del ejercicio de las funciones profesionales.', 16);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Actuaciones desarrolladas destinadas a la protección de trabajadores especialmente sensible a determinados riesgos y declarados útil con limitaciones al objeto de adaptar las condiciones y exigencias que demanda el puesto de trabajo al estado psicofísico del funcionario.', 17);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Comprobar si la vigilancia de la salud está externalizada y en caso afirmativo, si se adecúa a lo preceptuado en la normativa reguladora.', 18);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Comprobar si se ha desarrollado actuaciones destinadas a la protección de trabajadores sensibles.', 19);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Actuaciones llevadas a acabo en relación a la protección de la guardia civil en situación de embarazo, parto reciente o en periodo de lactancia.', 20);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Vigilancia de la Salud. 
Coordinación con los Servicios de Asistencia Sanitaria y de Psicología y Psicotecnia. Comprobar que se han evaluado los puestos de trabajo.', 21);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Relación de accidentes de trabajo con indicación de mortales, graves y que afecten a más de cuatro leves. Comprobar documentalmente.', 22);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Relación de aquellos incidentes contemplados en el documento “Criterio unificado sobre la valoración de la gravedad de los accidentes e incidentes en las Fuerzas y Cuerpos de Seguridad del Estado, a efectos de notificación e investigación.', 23);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Comprobar si los informes de investigación son recibidos por la Sección de Prevención de la Unidad afectada. Comprobar documentalmente.', 24);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Medidas preventivas de las propuestas en el informe de investigación INVAS23/13-SP adoptadas y, en su caso, situación en qué se encuentren las pendientes.', 25);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Responsable de ejecutar las medidas preventivas propuestas en los informes de investigación cuando el puesto de trabajo es común a nivel nacional. Comprobar documentalmente.', 26);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Relación de comunicaciones efectuadas a la Inspección de Trabajo de conformidad con lo establecido en la disposición adicional cuarta del RD 67/2010.', 27);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Estudio y Análisis de los Accidentes Ocurridos en Actos de Servicio. Comprobar documentalmente.', 28);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Información en Materia de Prevención de Riesgos Laborales. 
Manuales, Campañas de Prevención, Trípticos y cualquier otro medio informativo. 
Procedimiento empleado para justificar la recepción por el personal.
Examinar la web.
Examinar el método de control por parte del Servicio de Prevención.', 29);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Relacionar las actividades formativas desplegadas en materia preventiva por ese Servicio de Prevención, así como aquellas otras realizadas en colaboración con otros órganos, unidades o servicios.', 30);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Cursos, conferencias y otras actividades formativas recibidas por el personal del Servicio de Prevención.', 31);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Formación impartida y recibida. 
De cada una de las actividades contempladas en los puntos anteriores se realizará una breve descripción que al menos contenga:
Materia de Prevención de Riesgos laborales tratada: General, específica, Medidas de Emergencia…
Personal que la impartió.
Personal que lo recibió.
Número de alumnos.
Duración.
Método utilizado: Telemático, presencial, divulgativo,…', 32);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Formación impartida y recibida. 
Comprobar quien imparte la formación. Titulación.', 33);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Formación impartida y recibida. 
Comprobar quienes la reciben.', 34);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Formación impartida y recibida. 
Examinar actas de los diferentes cursos.', 35);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Breve descripción de las actividades de asesoramiento y de informes o dictámenes emitidos por el Servicio de Prevención relacionados con el sistema de gestión de la prevención de riesgos laborales en el ámbito de la Dirección General de la Guardia Civil.
Comprobar documentalmente.', 36);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Medidas que se han adoptado para que las distintas Unidades de la Guardia Civil dispongan de la información y las instrucciones adecuadas a seguir en materia de coordinación de actividades empresariales. Comprobación documental.', 37);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, '¿Se informa al Servicio de Prevención de los contratos de prestación de obras o servicios suscritos en el ámbito de la actividad de la Dirección General de la Guardia Civil?.  En caso afirmativo indicar número y tipo de actividad contratada. 
Comprobación documental.', 38);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Coordinación de actividades empresariales. 
Número y tipos de actuaciones en esta materia llevadas a cabo por el Servicio de Prevención. Comprobación documental.', 39);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Explicar brevemente si existe o se ejerce por el Servicio de Prevención algún tipo de control, vigilancia o seguimiento sobre las medidas previstas para la coordinación de actividades empresariales. Comprobación documental.', 40);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Relación detallada de la documentación correspondiente a la actividad desplegada en el ámbito de la Dirección General de la Guardia Civil en materia de prevención de riesgos laborales, que se encuentra bajo la custodia y archivo de ese Servicio de Prevención.
Comprobar si existe archivo físico y digital.', 41);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Relación de Procedimientos e Instrucciones Operativas aprobados, pendientes de aprobación o en fase de elaboración y estudio. 
Comprobar documentalmente.', 42);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'En su caso, informando sobre su causa o justificación, relación de Procedimientos o de Instrucciones Operativas en vigor, que estén o hayan sido objeto de actualización o revisión. 
Comprobar documentalmente.', 43);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Papel desempeñado por el Servicio de Prevención en el Protocolo de Acoso. Comprobar documentalmente las actuaciones del SPRL.', 44);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Relación de propuestas de mejora y sugerencias en materia de prevención, recibidas en el Servicio de Prevención. Comprobar documentalmente.', 45);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Elaboración de la Memoria Anual. 
Las actividades preventivas que se documentan a través de una programación y memoria anual.', 46);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Elaboración de la Memoria Anual. 
Indicar si se contienen las prioridades fijadas y los objetivos alcanzados o en fase de elaboración a este respecto.', 47);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL, 'Elaboración de la Memoria Anual. 
Analizar la memoria.', 48);

commit;

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
  (SEQ_GUIAS.NEXTVAL, 'ADMINISTRACIÓN.', 'I.T_CIE', 6,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Estructura. Examinar vacantes, comisiones de servicio, absentismo.', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Comprobar nombramiento Subgrupo A1 o A2', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Catálogo de puestos de trabajo. Comprobación documental.',2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de quejas ante: Comprobar que se han entregado al interno copia sellada de la primera página. Comprobar en el registro, fecha y hora de la presentación, identificación de interesado y destinatario. Comprobar que se han aportado al interesado copias selladas de los documentos presentados, si lo han solicitado. Examinar el libro registro. Examinar copias de resoluciones (Plazos, recursos y órganos).  
Órganos administrativos.
Órganos judiciales
El Ministerio Fiscal.
El Defensor del Pueblo.
El Director del Centro.
Otros organismos)', 3);;

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de solicitud de entrevistas personales con el director. Comprobar las que se han llevado a cabo y las que no y causas. Examinar recibos de presentación en sobres cerrado. (Ver Dirección)',4);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de propuestas de alteración de horarios. Comprobación documental. Resolución.',5);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Número de informes sobre deficiencias. Comprobación documental. Resoluciones adoptadas.',6);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Número de instrucciones recibidas del servicio sanitario respecto a la alimentación, limpieza y aseo. Comprobación documental. Resolución adoptada.', 7);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Medidas adoptadas en base a las creencias religiosas de los internos Comprobar', 8);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Medios destinados a facilitar la práctica de diferentes confesiones religiosas. Comprobación documental.', 9);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Solicitudes de internos para entrar en contactos con ONG,s. Comprobación documental, cuáles y causas.', 10);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Horario de visita a internos, lugar donde se llevan a cabo. Duración de las mismas. Limitaciones. Examen de las normas de régimen interior.', 11);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Como se aborda el problema de idioma de internos. Comprobación', 12);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Número de ejemplares de libros que contiene la biblioteca. Indicar idioma de los mismos. Comprobación.', 13);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Descripción de medios lúdicos instalados en la sala de estar. Comprobación', 14);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Número de ejemplares de prensa diaria, con indicación de nombre e idioma de edición. Comprobación.',15);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Horarios del centro, con especificación de actividades. Comprobación documental.', SEQ_GUIAS.CURRVAL );

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Número de autorizaciones de dispositivos captadores de imágenes. Comprobar', 17);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL , 'Identificación de todas personas que prestan servicios en el centro. Examinar . art. 49', 18);


--GUÍA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS.SERVICIO DE ASISTENCIA SANITARIA.

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'SERVICIODE ASISTENCIA SANITARIA.', 'I.T_CIE', 8,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Médico de la administración responsable del Servicio de Asistencia Sanitaria. Examinar nombramiento.', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de ATS/Diplomado/Graduado Universitario. Examinar nombramiento.', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de inspecciones, informes1 y propuestas sobre: Examinar. 
Alimentación.
Aseo de los internos, sus ropas y pertenencias.
Higiene, calefacción, iluminación, y ventilación de las dependencias.
Controles periódicos de salubridad.
Prevención de epidemias y medidas de aislamiento de pacientes infecto-contagiosos.',2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Entrega de elementos de aseo y abrigo. Comprobar art. 32', 3);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de actos médicos. Comprobación documental.', 4);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de actos de enfermería. Comprobación documental.', 5);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Convenios con otra Admón. pública para casos de hospitalización o especialidades. Examinar convenios.', 6);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Convenios con entidades privadas para casos de hospitalización o especialidades. Examinar convenios.', 7);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de reconocimientos médicos mediante mandamiento judicial, por negación del interno. Recabar copia del mandamiento.', 8);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de reconocimientos ordenados por el Director. Recabar copia de la resolución. Copia de la solicitud del Servicio y de la cuenta al juez competente.', 9);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de internos de ese Cie, hospitalizados. Comprobar documentalmente. Comunicación al juez.', 10);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de partes de lesiones, por las producidas anteriores al ingreso, y que estuvieran descritas en el parte facultativo de lesiones que entregan los funcionarios que hacen entrega del interno. Comprobar.', 11);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de partes de lesiones, por las producidas anteriores al ingreso, y que no estuvieran descritas en el parte facultativo de lesiones que entregan los funcionarios que hacen entrega del interno. Comprobar cuenta al director y la remisión al juez del partido judicial donde se encuentra el centro.', 12);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de reuniones entre la Comisaria General de Extranjería y Fronteras y representante de las entidades con las que se haya suscritos convenios de sanidad. Comprobar.', 13);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Atención farmacéutica. Comprobar en que consiste y, cómo y dónde se almacenan los productos', 14);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Procedimiento para la solicitud de asistencia médica. Examinar',15);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Tratamiento de los datos de salud. En, su caso, Entidades concertadas Comprobar art. 17', 16);


--SERVICIOS DE ASISTENCIA SOCIAL, JURÍDICA Y CULTURAL.

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'SERVICIOS DE ASISTENCIA SOCIAL, JURÍDICA Y CULTURAL.', 'I.T_CIE', 9,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Estructura. Comprobar documentalmente.', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de trabajadores sociales. Comprobar.', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Planes y proyectos de actuación presentados. Examinar.', 2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Planes y proyectos de actuación aprobados. Examinar.', 3);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Convenios con órganos de otros Ministerios, con entidades públicas y privadas y con ONG,s. Examinar los convenios.', 4);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Entidades colaboradoras. Detallando la actividad que realiza cada una. Comprobar documentalmente.', 5);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Actividades llevadas a cabo. Examinar', 6);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Formación en derechos humanos, extranjería, protección internacional, mediación intercultural y violencia de género. Numero de curso, jornadas, etc. que han recibido los trabajadores sociales. Comprobar documentalmente, mediante actas, títulos, etc.', 7);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Convenios con colegios de abogados. Examinar los convenios.', 8);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Dependencias destinadas a asegurar la confidencialidad en la orientación jurídica. Visitar las dependencias. Reportaje fotográfico.', 9);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de entrevistas y comunicaciones con abogados y representantes diplomáticos y consulares. Comprobar documentalmente.', 10);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Horarios de visitas. Examinar las normas de régimen interior.', 11);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Limitaciones establecidas para las visitas. Examinar las normas de régimen interior.', 12);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de personas por visita. Comprobar documentalmente.',13);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Donde tienen lugar. Comprobar documentalmente.', 14);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Como se informa a los visitantes de las normas de régimen interior. Comprobar documentalmente.', 15);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de personas que pueden simultanear la visita. Examinar las normas de régimen interior.', 16);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Comunicaciones telefónicas que se realizan al ingreso Comprobar art. 16', 17);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Como se informa de su situación al interno y de las resoluciones administrativas y judiciales. Examinar', 18);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Números de casos de asistencia de intérprete Examinar', 19);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Plazo de entrevista con servicio de asistencia social interno nuevo Comprobar art.30', 20);

--GUÍA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS.DIRECCIÓN.

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'DIRECCIÓN.', 'I.T_CIE', 4,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Comprobar nombramiento Dentro del subgrupo A1', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Periodos de sustitución y causas. Comprobar', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de respuestas a escritos, quejas y peticiones de los internos o remitidas a la autoridad competentes. Examinar, comprobando el contenido de las mismas.', 2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de reservas de plazas aceptadas o denegadas. Causas de denegación.', 3);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Visitas fuera de horarios, autorizadas y causas. Comprobar', 4);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de Iniciativas trasladadas a superiores. Detallar de que se tratan diferenciando las propias de las realizadas a propuestas de administración.', 5);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Normas de régimen interior/modificaciones. Comprobar que el horario del centro hace referencia a actos de aseo, visitas médicas, comidas, visitas externas, comunicaciones telefónicas, paseos al aire libre, ocio y descansos.', 6);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de entrevistas personales con el Director. Comprobar y cotejar con las solicitudes (Ver administración)', 7);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Medidas a imponer a los internos que incumplan las normas. Comprobar que están perfectamente definidas.', 8);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Numero de reconocimientos médicos ordenados por la dirección por causa de salud colectiva. Examinar las copias de la comunicación al juez.', 9);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Cómo se efectúa el control sobre la custodia y cumplimentación de los libros. Examinar.', 10);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de reuniones de seguimiento de la gestión entre Comisaria General de extranjería y Fronteras, con directores e instituciones. Remitir actas del año. Examinar actas', 11);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de visitas del Juez competente, especificando los motivos. Comprobar documentalmente', 12);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de inspecciones, con inclusión de fechas, distinguiendo las llevadas a cabo por la autoridad judicial, el CNP, u otros organismos. Comprobar documentalmente', 13);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Datos anuales publicados por la Comisaría General de Extranjería y Fronteras. Comprobar documentalmente', 14);

--GUÍA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS. INFRAESTRUCTURAS, INSTALACIONES Y MEDIOS BÁSICOS.

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'INFRAESTRUCTURAS, INSTALACIONES Y MEDIOS BÁSICOS.', 'I.T_CIE', 1,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Ubicación y estado del centro. Titularidad, ¿Se comparte con otras dependencias policiales? año de construcción, años de las últimas obras de rehabilitación y contenido. Comprobar estado y deficiencias que pongan en peligro a las personas.', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Fecha de creación del CIE. Examinar la Orden Ministerial de creación.', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Instalaciones. Descripción de las mismas. Es aconsejable realizar un reportaje fotográfico. Examinar el estado de limpieza, luminosidad, climatización, estado del mobiliario, y en general, estado de conservación y habitabilidad.  Comprobar que no existe hacinamiento.', 2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Disponibilidad de accesos para personas con movilidad reducida. Comprobar', 3);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Capacidad, por sexos. Comprobar documentalmente.', 4);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de módulos destinados al alojamiento de hombres. Describir y acompañar de reportaje fotográfico.',5);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de módulos destinados al alojamiento de mujeres. Describir y acompañar de reportaje fotográfico.', 6);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de alojamientos para unidades familiares. Describir y acompañar de reportaje fotográfico.', 7);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Servicios complementarios (Bibliotecas, salas multiconfesionales, etc.). Dimensiones. Describir y acompañar de reportaje fotográfico.', 8);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de habitaciones para llevar a cabo la separación preventiva. Describir y acompañar de reportaje fotográfico.',9);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Numero de dependencias y descripción de las mismas, destinadas a alojar  a internos, que aun no necesitando atención hospitalaria, por las características de enfermedad física o psíquica aconseje su separación del resto de los internos. Describir. Comprobar estado de uso y de limpieza.', 10);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Infraestructuras utilizadas para alojar internados en virtud del art.89.6 del Código Penal. Describir. Comprobar estado de uso y de limpieza.', 11);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Como se consigue la intimidad necesaria para los internos. Comprobar.', 27);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Espacios para el esparcimiento y recreo. Descripción. Comprobar si son suficientes y adecuadas, teniendo en cuenta el número de internos, y si hay separación entre hombres y mujeres.', 12);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Espacio para almacenamiento de equipajes. Caja fuerte. Capacidad. Comprobar cómo están almacenados y la seguridad de las pertenencias.', 13);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Almacén de equipos básicos de higiene diaria. Comprobar cómo están almacenados y estado de limpieza.', 14);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de teléfonos públicos para uso de los internos. Comprobar su estado de funcionamiento e higiene.', 15);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Locutorios para abogados y sala de visita. Comprobar adecuación y limpieza.',16);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Carteles Informativos. Horarios. Comprobar que en lugar bien visible se encuentra anunciado el horario de visitas. Zona Videovigilada. Comprobar', 17);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Limpieza: Empresa, número de personal, horario, horario en los servicios de 25 horas, grado de satisfacción, incidencias... Comprobar documentalmente.', 18);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Ascensores y aparatos elevadores: 
Ascensores. Número de ellos y ubicación. Inspección.  
Montacargas. Número de ellos y peso máximo. Inspección.', 19);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Instalaciones eléctrica (AT y BT) (RD 615/2001, disposiciones mínimas de protección contra riesgos eléctricos). Comprobar revisiones e inspecciones.  
Alta Tensión. Centros de transformación, centrales eléctricas o subestaciones.  
Baja Tensión. Cuadros eléctricos.  
Grupos electrógenos  
Sistema de Alimentación Ininterrumpida (S.A.I.)/Baterías de acumuladores.', 20);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Sistema de ventilación, climatización y ACS. Comprobar revisiones e inspecciones.  
Calderas de calefacción y ACS.  
Aire acondicionado y/o ventilación forzada.  
Aparatos a presión (compresores).  
Depósitos de combustibles. Comprobar revisiones e inspecciones.  
Combustibles líquidos.  
Combustibles gaseosos.', 21);
 
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 
'Prevención/control Legionelosis.  
Mantenimiento de sistemas de ACS y agua fía de consumo humano.  
Aspecto a revisar: General. Plazo de revisión: Anual.  
Aspecto a revisar: Conservación y limpieza. Plazo de revisión: Trimestral.  
Aspecto a revisar: Puntos de terminales de la red, duchas y grifos. Plazo de revisión: Mensual.  
Mantenimiento de torres de refrigeración y dispositivos análogos.  
Aspecto a revisar: Condensador y separador de gotas. Plazo de revisión: Anual.  
Aspecto a revisar: Relleno. Plazo de revisión: Semestral.  
Aspecto a revisar: Bandeja. Plazo de revisión: Mensual', 22);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Libro del edificio. Comprobación documental.', 23);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Libros de mantenimiento de cada una de las instalaciones, con sus informes, actas, etc. correspondientes a las operaciones de mantenimiento, revisiones e inspecciones. Comprobación documental.', 24);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Protección contra incendios. Empresas de mantenimientos y revisiones.  
Central de alarmas: número, ubicación.  
Sistemas automáticos de detección y alarma de incendios: número, ubicación.  
Sistemas manuales (pulsadores) de alarma de incendio: número, ubicación.  
Sirenas de alarma y megafonía: número, ubicación.  
Señalización de equipos contra incendios (de BIE,s, extintores, dirección evacuación, etc.). Comprobar su colocación.  
Extintores portátiles: Están redistribuidos y/o colocados los extintores portátiles en el sentido establecido en el RD  485/1977,  de 14 de abril, por el que se establecen las disposiciones mínimas en materia de señalización de seguridad y salud en el trabajo, y en el RD  314/2006, que aprueba el Documento Básico de Seguridad en caso de Incendio (DB-SI), del Código Técnico de Edificación (CTE)? ¿Existe un plano de distribución/colocación de los extintores portátiles? Solicitar.  
Bocas de Incendio Equipadas (BIE,s): número, ubicación.  
Sistema fijo de extinción. Agua. Gás. Espuma. Número, ubicación.  
Sistema de abastecimiento de agua: número, ubicación.  
Hidrantes exteriores: número, ubicación.  
Columnas secas: número, ubicación.  
Alumbrado de emergencias: número, ubicación.  
Otros.'
, 25);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Plan de Emergencia/Plan de Autoprotección Comprobar viabilidad, evacuación, señalización, simulacros (actas), nombramientos, formación, información, etc', 26);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Empresa de mantenimiento: Contrato, número de operarios, comprobar si alguno de ellos se ocupa en exclusividad al CIE', 27);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Empresas encargadas de las inspecciones', 28);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Pedir la documentación de la ITE', 29);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Residuos tóxicos. Comprobar cuáles son, donde se ubican, que empresa es la encargada de su recogida y gestión', 30);

--GUIA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS. JUNTA DE COORDINACIÓN.

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'JUNTA DE COORDINACIÓN.', 'I.T_CIE', 4,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Composición de la junta de coordinación. Examinar', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Normas de funcionamiento Examinar', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Remitir actas de reuniones ordinarias o extraordinarias. Examinar.', 2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Informes a consultas sobre: Examinar los informes.  
Normas de régimen interior.  
Directrices e instrucciones sobre organización de los distintos servicios.  
Criterios de actuación en cuestiones de alteración del orden, o incumplimiento de normas.  
Sobre peticiones y quejas.', 3);

--GUÍA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS. LIBROS OFICIALES.

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'JUNTA DE COORDINACIÓN.', 'I.T_CIE', 12,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Libros en poder del Centro y fecha de diligencia de cada uno de ellos1. Comprobar si están informatizados.  
Libro Registro de entradas y salidas de internos. Comprobar los diferentes asientos, y si se han cumplimentado las fichas individuales de comunicación. Cotejar las salidas con las copias de resoluciones y diligencias de salida del centro (copias firmadas por el interno). Comprobar los reingresos y causas.  
Libro Registro de traslados y desplazamientos. Examinar los asientos, cotejándolos con comunicaciones al juez competente y la constancia en los expedientes de los internos.  
Libro Registro de visitas. Comprobar que se anotan las visitas de miembros de organizaciones para defensa de los inmigrantes y del resto de personas.  
Libro Registro de correspondencia. Comprobar que está anotada la paquetería. (Observar si anotan correspondencia). Comprobar las anotaciones de paquetería devuelta por denegación de su apertura.  
Libro Registro de peticiones y quejas.- Comprobar que en las anotaciones figuran fecha, hora identificación del interno y del destinatario. Comprobar que la numeración de los impresos es consecutiva2. Comprobar si se archivan copias de los recibos de solicitud de entrevistas personales con el director.  
Comprobar tratamiento de los datos de carácter personal y de salud art.17.  
Ver plazos estancia art.21.', 0);

--GUÍA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS. DOTACIÓN Y GESTIÓN DE RECURSOS HUMANOS.

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'DOTACIÓN Y GESTIÓN DE RECURSOS HUMANOS.', 'I.T_CIE', 2,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Estructura orgánica.', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Catálogo de puestos de trabajo personal CNP. Comprobar número de vacantes, comisiones de servicio y absentismo. Averiguar cómo se hacen las sustituciones en épocas vacacionales. Tiempo promedio en el destino.', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Catálogo de puestos de trabajo funcionarios Administración General del Estado. Comprobar número de vacantes, comisiones de servicio y absentismo. Averiguar cómo se hacen las sustituciones en épocas vacacionales. Tiempo promedio en el destino.',2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Catálogo de puestos de trabajo personal laboral. Comprobar número de vacantes, comisiones de servicio y absentismo. Averiguar cómo se hacen las sustituciones en épocas vacacionales. Tiempo promedio en el destino.', 3);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Otro personal. Comprobar tipo de contratación y requisitos exigidos número de vacantes, comisiones de servicio y absentismo. Averiguar cómo se hacen las sustituciones en épocas vacacionales.', 4);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Horarios de trabajo. Acreditar documentalmente el control de cumplimiento del horario.', 5);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de actividades formativas dirigidas al personal del CNP y resto de funcionarios y empleados públicos, diferenciando las referidas a derechos humanos, régimen de extranjería, seguridad y enfoque de género y violencia contra las mujeres, con expresión de número de participantes en cada una de ellas, así como personal o institución que las impartió. Comprobar documentalmente a través de actas de los cursos, títulos, etc.', 6);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de actividades formativas dirigidas al personal no incluido en el párrafo anterior, con expresión de número de participantes en cada una de ellas, así como personal o institución que las impartió. Comprobar documentalmente a través de actas de los cursos, títulos, etc.', 7);


--GUÍA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS. DOTACIÓN Y GESTIÓN DE RECURSOS MATERIALES.
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'DOTACIÓN Y GESTIÓN DE RECURSOS MATERIALES.', 'I.T_CIE', 1,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Inventario de recursos materiales, con expresión de fecha de adjudicación o reposición y estado de conservación. Comprobar la existencia de inventarios y examinarlos.', 0);

--GUÍA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS. RELACIONES Y COORDINACIÓN.
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'RELACIONES Y COORDINACIÓN.', 'I.T_CIE', 13, trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Entidades colaboradoras. Examinar', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Numero de organizaciones que están autorizadas para realizar visitas al centro. Comprobar documentalmente. Resoluciones del director, comprobar que se cumplen las 72 h de plazo para concederlas o para subsanación.', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Acreditaciones personales concedidas. Comprobar la relación de las mismas.', 2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de visitas de ONG,s. Comprobar documentalmente. En el libro registro debe quedar constancia. Cuáles y causas.', 3);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de comunicaciones a ONG,s, sobre solicitud de visitas de internos. Comprobar documentalmente.', 4);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Numero de exámenes a que han estado sometidos sus integrantes, causas y resultados. Comprobar documentalmente.', 5);


--GUÍA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS. SECRETARÍA.
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'SECRETARÍA.', 'I.T_CIE', 7,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Estructura. Comprobar.', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Nombramiento del Secretario Comprobar que el jefe es del subgrupo A2 o C1 del CNP.', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Catálogo de puestos de trabajo.', 2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de deficiencias o irregularidades apreciadas.', 3);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de trámites documentales con las Unidades policiales que gestionan los expedientes de extranjeros. Examinar', 4);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de trámites documentales con los juzgados competentes para el control de extranjeros internados. Examinar', 5);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de ingresos, diferenciadas por sexos, meses y periodo de permanencia de los internos, especificando los motivos. Cotejar con los libros y art 21', 6);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de salidas, diferenciadas por meses y periodo de permanencia de los internos, especificando los motivos. Cotejar con los libros y art 21', 7);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de traslados: Examinar libro de traslados y desplazamientos.  
A otros centros y de otros centros, especificando los motivos. Examinar acuerdo del juez o tribunal que autorizó el internamiento.  
Por comparecencias. Comprobar las constancias de fecha y hora de salida y regreso en el expediente y comunicación al juez o tribunal.  
Por cuestiones médicas. Comunicación inmediata al juez o tribunal. Comprobar los que se han realizado a instancia del director por ausencia del facultativo. Examinar copia de solicitud a la comisaria de la localidad las medidas tendentes a garantizar la seguridad del interno.', 8);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de ceses de internamiento, especificando sus causas. Comprobar documentalmente. Libro de entrada y salida de internos. Examinar copia de comunicación a la autoridad judicial que acordó el internamiento. Copia de la diligencia de entrega a los funcionarios encargados de su traslado a la frontera. Resolución por la que se acuerda el cese del internamiento o copia de la orden de expulsión, devolución o regreso.', 9);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de situaciones que se han producido en las cuales no se pueda llevar a efecto la expulsión de un interno por el art. 89.6 del CP. Examinar copia de comunicación a la Brigada o Unidad de extranjería. Examinar diligencia de salida del interno y copia del auto o resolución judicial.', 10);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de reingresos por no poderse llevar a cabo la expulsión, devolución o regreso. Examinar informe policial detallando las circunstancias, el parte de lesiones, en su caso, y la cuenta a la autoridad judicial. Libro registro de entradas y salidas.', 11);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Tratamiento de los datos de carácter personal en los expedientes. Comprobar art. 17.', 12);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Información sobre derechos y obligaciones del nuevo interno. Boletín Informativo. Copia boletín examinar art. 29.', 13);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Expedientes de los internos. Comprobar que están completos.',14);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Comprobar si los libros están en Secretaria', 15);


--GUÍA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS. UNIDAD DE SEGURIDAD.
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'UNIDAD DE SEGURIDAD.', 'I.T_CIE', 5,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Estructura orgánica. Examinar documentalmente.', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Nombramiento Jefe de Unidad de Seguridad. Comprobar subgrupo A1', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Catálogo de puestos de trabajo. Examinar vacantes, comisiones de servicio, absentismo.', 2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Criterio de selección. Examinar', 3);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Horarios de trabajo. Comprobación documental.', 4);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Directrices de organización. Examinarlas',5);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de atestados instruidos. Examinarlos.', 6);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Relación de objetos prohibidos intervenidos a internos y destino dados a los mismos. Examinar copia de documentos de remisión a la autoridad competente.', 7);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Relación de objetos no autorizados intervenidos a internos. Examinar documento de retirada y de entrega cuando el interno abandona el centro.', 8);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Custodia y depósito en caja fuerte de objetos de valor y dinero. Procedimiento. Comprobar actas art. 28.', 9);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Relación de objetos prohibidos intervenidos a visitantes. Examinar oficio de remisión a la autoridad competente.', 10);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Relación de objetos no autorizados intervenidos a visitantes. Examinar el acta de custodia.', 11);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Control de seguridad al que se somete la correspondencia recibida o remitida. Comprobar el procedimiento.', 12);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de registros de correspondencia autorizadas por la autoridad judicial. Comprobar autorizaciones judiciales.', 13);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Control de seguridad al que se somete la paquetería recibida. Comprobar el procedimiento.', 14);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de paquetería devuelta por falta de autorización a su apertura. Comprobar documentalmente.', 15);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de objetos intervenidos en paquetería y destinos dado a los mismos. Comprobar documentalmente.', 16);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Detalle de instrumentos de control instalados, con expresión de clase, y ubicación (cámaras, arcos detectores, etc.). Examinar y recabar documentación relativa a sus características y mantenimiento y revisiones. Comprobar que las cámaras no están dirigidas a dormitorios, baños y lugares considerados íntimos. Ver que esta el cartel de Zona Videovigilada.', 17);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Destino dado a las grabaciones y tiempo de permanencia. Comprobar documentalmente.', 18);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de incautaciones de medios de captación de imágenes. Examinar copia del informe al juez.', 19);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de borrados de imágenes. Examinar documentalmente.', 20);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Enumerar lugares donde se presta servicio sin armas de fuego. Comprobar documentación de propuesta y autorización.', 21);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de inspecciones y registros en las instalaciones de uso común. Comprobar documentalmente la resolución del director.', 22);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de ocasiones en que, por razón de urgencia se han adoptado medidas tendentes a reestablecer y asegurar el orden. Examinar las notificaciones al director.', 23);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de ocasiones en que se ha dado cuenta al director del incumplimiento de las normas de régimen interior', 24);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de inspecciones y registros en las instalaciones destinadas a dormitorios de los internos, ropas y enseres de los mismos, indicando las causas. Comprobar documentalmente la resolución del director.', 25);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de registros personales de los internos, indicando cuales lo fueron mediante desnudo integral, las causas que motivaron los mismos, diferenciando los autorizados por el Director de aquellos otros autorizados por el Jefe de la Unidad de seguridad. Indicar funcionarios encargados de practicarlos y lugar donde se llevaron a cabo. Examinar documento suscrito por el funcionario y comprobar que una copia fue remitida al juez.', 26);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de ocasiones en que ha sido necesario el empleo de medios de contención física personal, especificando en que han consistido y causa que las hayan motivado. Separar las que se han tomado previa notificación escrita y aquellas, que por razón de urgencia se haya notificado verbalmente. Examinar la resolución motivada o resolución cuando se ha informado verbalmente. Examinar la habitación de cumplimiento (debe ser similar a las comunes). Examinar el informe de reconocimiento médico preceptivo. Examinar la comunicación al juez y su resolución.', 27);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Número de ocasiones en que ha sido necesaria la separación preventiva individual de algún interno, especificando su causa. Examinar la resolución motivada o resolución cuando se ha informado verbalmente. Examinar la habitación de cumplimiento (debe ser similar a las comunes). Examinar el informe de reconocimiento médico preceptivo. Examinar la comunicación al juez y su resolución.', 28);


--GUÍA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS. FORMACIÓN.
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'FORMACIÓN.', 'I.T_CIE', 10,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Personal en plantilla a fecha de Inspección.', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Por categorías tiempo Medio de permanencia en el CIE.', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Relación numérica por categorías del personal que ha recibido “el curso sobre centro de Internamiento de Extranjeros” programado por la Centro de Actualización y Especialización, en colaboración  con la CGEF.', 2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Relación numérica por categorías del personal que han recibido  cursos a que hace referencia el art. 48.1. del RD 162/ 2014: Derechos Humanos, Régimen de Extranjería, Seguridad y Prevención y Enfoque de Género y Violencia contra las Mujeres.', 3);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Relación numérica por categorías del personal que ha recibido cursos en otras áreas de interés profesional relacionadas con la organización y el funcionamiento del CIE: Defensa Personal y Técnicas de Inmovilización; Prevención de Riesgos Laborales, Emergencias y Primeros Auxilios, Operador de equipos de   rayos X, etc.', 4);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Necesidades y problemas en materia de Formación: Conciliación con la vida laboral. Aprovechamiento/ tiempo de permanencia en el CIE. Escasez o inadecuación de los recursos u ofertas  formativas.', 5);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Propuestas de mejoras o alternativas.', 6);


--GUÍA DEL CENTRO DE INTERNAMIENTO DE EXTRANJEROS. GUIA MECANISMOS CONTROL/ INSPECCIÓN.
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'GUIA MECANISMOS CONTROL/ INSPECCIÓN.', 'I.T_CIE', 11,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Personal en plantilla a fecha de Inspección.', 0);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Relacionar las visitas o actuaciones de control llevadas a cabo por el Defensor del Pueblo,  otras autoridades u organismos, con inclusión de fechas y motivos.', 1);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Relacionar las visitas o actuaciones de control llevadas a cabo por la Dirección General de la Policía u otros órganos del Mº Interior, con inclusión de fechas y motivos.', 2);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Datos anuales referidos al CIE publicados por la Comisaría General de Extranjería y Fronteras.', 3);

insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.nextval, SEQ_GUIAS.CURRVAL, 'Informar de las actuaciones realizadas en el CIE, como  consecuencia de las recomendaciones o decisiones  adoptadas, en su caso, por algunas  de las Autoridades anteriores.', 4);

COMMIT;

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values (SEQ_GUIAS.NEXTVAL,'RECURSOS HUMANOS', 'I.G.P.',0,trunc(sysdate),'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Catálogo de la Jefatura Superior / Comisaría Provincial / Distrito / Local.', 0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Personal real que presta servicio en el momento de la Inspección:
- Activo.
- 2ª Actividad.
- Policías en prácticas (fechas).
- Policías en prácticas en aula abierta (fechas).
- Personal CC.GG. (en labores de atención al público y cuál es su destino específico).
- Personal laboral (destinos ocupa y funciones asignadas).
- Liberados sindicales: Cuántos, desde cuándo, Unidad de destino, fechas de ausencia y perjuicios ocasionan.
- Personal femenino: Distribución por Unidades y puestos de responsabilidad', 1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Pedir relación nominal del personal de la plantilla donde figure el puesto de trabajo que desempeña.', 2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Numéricamente, altas y bajas por categorías los 2 últimos años (vemos la movilidad).', 3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Por categorías, plazas existentes y cubiertas en los 2 últimos CGM (plantilla atractiva o no).', 4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Personal no disponible en el momento de la Inspección:
- Baja médica (L/D).
- Comisión de servicio (desde y hasta qué fecha, en dónde se hallan).
- Agregados de esta plantilla a otra y VICEVERSA (fechas y Ud. de destino).
- Cursos.
- Otras causas.', 5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Existencia de puestos NO asignados y causas de ello.', 6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Origen del personal destinado (Academia, otras plantillas, etc.). Plantilla atractiva o no', 7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Distribución de efectivos del CNP:
- Destinados en el Área Operativa (desglosar por Brigadas).
- Destinados en el Área de Gestión (desglosar por Negociados o Áreas).', 8);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Ocupación del personal en 2ª Actividad con respecto al Catálogo:
- Motivación de déficit en caso de existir.
- Distribución.
- Criterios de adjudicación de los puestos.', 9);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Déficit en Cuerpos Generales (Catálogo respecto al personal destinado).', 10);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Tasa policial: Policías/1.000 habitantes. Tasa nacional______.', 11);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Adecuación o no de la plantilla. Caso negativo ¿en qué Unidades? Razones.', 12);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Análisis de la actividad', 13);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Evolución del personal (ÚLTIMO QUINQUENIO).', 14);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Media de edad: Normal o no. Causas.', 15);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Tiempo de permanencia en la plantilla.
- Existencia o no de movilidad (antigüedad en Z). Causas. Motivación, etc.
- ¿Destino atractivo o poco atractivo?.
- ¿Se cubren todas las convocatorias que salen?.', 16);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Bajas previstas por pase forzoso a segunda actividad.', 17);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'ABSENTISMO. Confeccionar cuadro.', 18);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Horas extraordinarias (peonadas): Autorización para su realización, control de las efectuadas y del personal (no sobrepasa las 80 anuales ni las 11 h. intervalo)', 19);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Problemáticas observadas. Propuestas de mejora. Problemática que continúa de la anterior inspección.', 20);

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values (SEQ_GUIAS.NEXTVAL,'GUÍA ÁMBITO INSPECCIÓN GC','I.G.P.',0,trunc(sysdate),'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Análisis y adecuación del Catálogo de Puestos de Trabajo a las necesidades de la Unidad.',0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Actividades desarrolladas por las distintas unidades operativas, tanto en los aspectos preventivos como de investigación.',1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Carga de trabajo y dimensionado de personal.',2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Estado de las infraestructuras.',3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Funcionamiento de la Intervención de Armas y Explosivos, valoración de la atención prestada al ciudadano.',4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Conocer sobre la dotación de los chalecos antibalas.',5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Evaluar el grado de cumplimiento del Plan Nacional de Tiro.',6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Inspección de los calabozos.',7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Análisis de la incidencia del absentismo.',8);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'La coordinación con otros cuerpos policiales en materia de seguridad ciudadana, especialmente con la Policía Municipal.',9);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Verificar el cumplimiento de las Instrucciones de la Secretaría de Estado de Seguridad 12/2009, Registro y Custodia de Detenidos, la 7/1997, Elaboración de atestados, la 2/2001, Libro de Menores e Incapaces en situación de riesgo, la 7/2005, Libro de Menores Detenidos, la 4/2007, Aplicación del Protocolo Facultativo a la Convención contra la Tortura, la 12/2007, Comportamientos exigidos a los miembros de la Fuerzas y Cuerpos de Seguridad del Estado, 13/2007, sobre uso del número de identificación en la uniformidad, la 8/2009, Conducción y custodia de internos de Centros Penitenciarios, la 7/2015, práctica de diligencias de identificación, registros y actuación con menores, y la 12/2015, protocolo de actuación en las áreas de custodia de detenidos de las FCSE.',10);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Comprobar la fiabilidad y evolución de los datos sobre delincuencia.',11);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Verificar el funcionamiento de la aplicación LexNET.',12);

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values (SEQ_GUIAS.NEXTVAL,'GUÍA ÁMBITO INSPECCIÓN PN','I.G.P.',0,trunc(sysdate),'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Análisis y adecuación del Catálogo de Puestos de Trabajo a las necesidades de la Unidad.',0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Actividades desarrolladas por las distintas unidades operativas, tanto en los aspectos preventivos como de investigación.',1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Carga de trabajo y dimensionado de personal.',2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Estado de las infraestructuras.',3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Funcionamiento de la oficina del D.N.I. y Pasaportes, valoración de la atención prestada al ciudadano.',4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Conocer sobre la dotación de los chalecos antibalas.',5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Evaluar el grado de cumplimiento del Plan Nacional de Tiro.',6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Inspección de los calabozos.',7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Análisis de la incidencia del absentismo.',8);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'La coordinación con otros cuerpos policiales en materia de seguridad ciudadana, especialmente con la Policía Municipal.',9);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Verificar el cumplimiento de las Instrucciones de la Secretaría de Estado de Seguridad 12/2009, Registro y Custodia de Detenidos, la 7/1997, Elaboración de atestados, la 2/2001, Libro de Menores e Incapaces en situación de riesgo, la 7/2005, Libro de Menores Detenidos, la 4/2007, Aplicación del Protocolo Facultativo a la Convención contra la Tortura, la 12/2007, Comportamientos exigidos a los miembros de la Fuerzas y Cuerpos de Seguridad del Estado, 13/2007, sobre uso del número de identificación en la uniformidad, la 8/2009, Conducción y custodia de internos de Centros Penitenciarios, la 7/2015, práctica de diligencias de identificación, registros y actuación con menores, y la 12/2015, protocolo de actuación en las áreas de custodia de detenidos de las FCSE.',10);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Comprobar la fiabilidad y evolución de los datos sobre delincuencia.',11);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Verificar el funcionamiento de la aplicación LexNET.',12);

insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values (SEQ_GUIAS.NEXTVAL,'GUÍA INSPECCIÓN AREA DE CUSTODIA DE DETENIDOS','I.G.P.',0,trunc(sysdate),'system');
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": .Ubicación',0);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": Estado general, situación del calabozo y descripción de dependencias de que dispone (Zona previa, Zona de Control y Zona de Celdas) ',1);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": Año de construcción y última reforma',2);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": Barreras arquitectónicas, puertas de acceso y por donde entran los detenidos (si atraviesan zonas comunes)',3);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": Dimensiones de cada celda y fotos (7 m² superficie estimada por cada celda) (paredes)',4);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": Se detectan en las celdas aristas vivas, picos, salientes, superficies cortantes, etc.',5);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": Se observan desperfectos (pintadas, agujeros, rayadas, etc.) en el interior: en paredes, suelo y puerta de entrada.',6);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": ¿Se dispone de servicio de mantenimiento integral para ésta instalación?',7);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": ¿Quién realiza este mantenimiento?, si existe',8);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": Las puertas como son, separación entre barrotes y sistema de cierre',9);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": Comprobar el perfil parte superior de la puerta',10);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 11/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA LA “INSTRUCCIÓN TÉCNICA PARA EL DISEÑO Y LA CONSTRUCCIÓN DE ÁREAS DE DETENCIÓN": Descripción somera de la instalación eléctrica y si el grupo electrógeno alimenta esta área y si disponen de SAI',11);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Disposición del Plan Específico de Medidas de Emergencia y Evacuación integrado en el Plan de Medidas de Emergencia?',12);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Fecha de su creación y última revisión',13);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": ¿Disponen de copia en el área de custodia?',14);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Conocimiento que tiene el personal de custodia de llevar a cabo la evacuación del recinto',15);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Medios contra incendios de que dispone:
-¿Existen extintores y BIES en el pasillo de celdas?  (Ojo , no deberían estar aquí, sino en la zona de control)
-¿En la Zona del Puesto de control existen Extintores de polvo ABC polivalente, extintor de CO2 para equipos eléctricos y BIES con alcance hasta la última celda? (contabilizar)
',16);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Sistema de climatización en qué consiste y su funcionamiento',17);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Sistema de extracción forzada de aire ¿dónde está ubicado?, comprobar su funcionamiento',18);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Número de personas/detenidos/presos durante el año anterior y lo que va del año en curso, ingresados en los calabazos. (contar del libro de detenidos)
-¿Son suficientes el número de celdas existentes?
-¿Se ha sobrepasado la capacidad máxima en algún momento puntual?
-En caso positivo, como han solucionado el problema',19);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Incidentes en los dos últimos años ocurridos en el interior del área de custodia y que se hubieran hecho constar en diligencias (solicitar copia de la mismas en relación al apartado donde se narra  lo ocurrido)
',20);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": CCTV (todo esto viene en el cuestionario pero comprobar)
-Enumeración
-Cámaras dentro de las celdas
-Tiempo de grabación
-Monitores (donde están, disponen recinto del calabozo)
-Donde se visualizan
-Carteles señalización',21);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Limpieza del Área de detención:
-Estado visual de las dependencias
-Empresa encargada.
-Número de limpiadores/as.
-Limpieza en fines de semana y festivos 
-Grado de satisfacción: 
-Caso de alguna incidencia extraordinaria como la solucionan
-Caso de vacaciones de la limpiadora, quien la sustituye',22);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Hay que advertir de la posibilidad de que se autolesione el detenido si lleva vendas y es ingresado en la celda con las mismas, por lo que se debe extremar las medidas de protección sobre el mismo.
',23);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": PERTENENCIAS: Bolsas de plástico formalizadas, ver si disponen de ellas',24);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": PERTENENCIAS: Como se cumplimentan',25);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": PERTENENCIAS: Donde se depositan',26);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": PERTENENCIAS: Objetos de gran valor',27);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": PERTENENCIAS: Medicamentos ver donde los depositan y que hacen con ellos una vez puesto a disposición judicial el detenido',28);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Hoja informativa, ver una y donde la depositan',29);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Comprobación del núm. identificativo del personal de custodia',30);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Hoja de incidencias de los relevos con los recibí y si disponen de algún protocolo establecido por la Unidad',31);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Vigilancia in situ SI/NO',32);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Vigilancia en remoto',33);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Personal asignado (custodia in situ):
-Por turno y total',34);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Como dejan constancia de las rondas realizadas',35);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Comprobar en la grabación, la periodicidad de las rondas en aquellas áreas de que no se disponga de cámaras enfocadas al interior de las celdas',36);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Entrada con armas o sin armas',37);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Donde las depositan (si disponen de cajas de seguridad)',38);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Que otros medios de defensa utilizan',39);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Medios de protección de que disponen (guantes, mascarillas, etc.).',40);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Timbre de llamada en las celdas Hay que comprobar el funcionamiento',41);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Micrófono ambiente en el pasillo Hay que comprobar el funcionamiento',42);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Ver si tiene el personal de custodia de la obligación del cierre de las puertas interiores de las celdas de incomunicados',43);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Informar de la obligación de cierre con llave del resto de las puertas de las celdas aunque estén vacías',44);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Alimentación de los detenidos.',45);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Procedimiento',46);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Clase de alimentos ',47);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Existencia de algún instrumento que permita calentar la comida y limpieza del mismo',48);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Se le proporciona agua (grifo o mineral).',49);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Comprobación de las bandejas de comida cuando se retiren (instrucciones)',50);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": ¿Disponen las celdas de bancada de obra u hormigón?, ver si su tamaño es adecuado al de la colchoneta. ',51);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": ¿Dispone de suficientes colchonetas y mantas? ',52);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": ¿Son ignífugas?  ',53);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Procedimiento de limpieza o sustitución. (quien se encarga de ello). Sistema de suministro y retirada a los detenidos por parte de los funcionarios.',54);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Lugar de almacenamiento',55);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Se detectan en los aseos elementos que pueden utilizarse para agredir (escobilla, papelera, soporte papel higiénico, etc.)',56);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Los aseos son antivandálicos. (describir de los elementos de que disponen)',57);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Material que se le proporciona para su limpieza',58);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": COMPROBACIÓN DEL ESTADO DE LA CELDA: ¿Se realiza?',59);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": COMPROBACIÓN DEL ESTADO DE LA CELDA: ¿Es supervisado por el responsable?',60);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": FORMACIÓN DEL PERSONAL DE CUSTODIA: ¿Existe algún tipo de formación que hayan recibido sobre esta materia?',61);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": FORMACIÓN DEL PERSONAL DE CUSTODIA: ¿Tienen constancia documental de los funcionarios a los que se les ha impartido?',62);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Cuando fue visitado por última vez por el MNPCT el área de custodia',63);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Copia del Informe',64);
insert into guia_Pasos (id, id_guia, paso, orden) values 
(SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INSTRUCCIÓN 12/2015, DE LA SECRETARÍA DE ESTADO DE SEGURIDAD, POR LA QUE SE APRUEBA EL "PROTOCOLO DE ACTUACIÓN EN LAS ÁREAS DE CUSTODIA DE DETENIDOS DE LAS FUERZAS Y CUERPOS DE  SEGURIDAD DEL ESTADO": Copia contestación de la Unidad',65);

commit;

--GUÍA AUTOMOCIÓN GC 
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'GUÍA AUTOMOCIÓN GC', 'I.G.P.', 0,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'El Destacamento de Material Móvil tiene la siguiente estructura.', 0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Ubicación del Destacamento de Material Móvil (Delegación de Automoción) (Taller-Zona, Comandancia, Compañía ) está ubicado en ………………..presenta el siguiente personal cubierto: ' , 1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Catálogo de puestos de trabajo aparecen:', 2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Puestos cubiertos:', 3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Auxiliados en el taller:', 4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Actividad desarrollada por la  Delegación es la encargada de la administración general de los vehículos oficiales (labores burocráticas)', 5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Programa preventivo de mantenimiento y mantenimientos realizados:', 6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Reparaciones de los vehículos propiedad de GC que se realizan:', 7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Como se ejerce el control de las reparaciones de los vehículos de la GC. Cuando un vehículo oficial del GC se accidenta se lleva a los talleres y, tras la confección del parte de accidentes y su grabación en ALFIL, se repara. ' , 8);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Otras reparaciones donde se hacen:', 9);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Compra de recambios de material', 10);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Carga de trabajo: análisis del rendimiento y evaluación del desempeño', 11);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Carga de Trabajo: Adecuación del dimensionado de la Unidad a la Actividad desarrollada.', 12);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Limpieza de los vehículos', 13);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Encontrándose  en la misma depositadas la documentación original de los vehículos oficiales para evitar pérdidas, en concreto, de  los seguros de los vehículos con el Consorcio de Compensación de Seguros, las Libretas de Documentación y Datos con las Tarjetas de Inspección  Técnicas y los  Permisos de Circulación y los informes favorables de ITV. ' , 14);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'De los …. guardias……. son especialistas en automoción con un curso de grabación y gestión como peritos tasadores en ALFIL, ………. especialistas en formación vial, tramitación de carnets de conducir, accidentes y control de los vehículos “renting” y el resto son personal de apoyo. De los especialistas en automoción, ……….. son mecánicos de coches, ……. mecánico de  motos y ………. electricista. ' , 15);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Cursos de actualización o formación de camión, motos, todoterrenos, microbuses  y furgonetas SEDEX.' , 16);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Necesidades de especialización: Despacho: el Jefe de la Delegación, …….. para la Secretaría General y Nave para taller, Almacén de repuestos. ' , 17);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Grúa: Problemática ' , 18);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'En cuanto al material informático con los que dispone la Delegación está compuesto por …. ordenadores……….., impresoras, ordenadores con una impresoras en talleres y en…………… ' , 19);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'En cuanto a los créditos presupuestarios de la Delegación, en los dos últimos años. Gastos de reparaciones y repuestos los dos últimos años (suministro de maquinaria, útiles de transporte) (casos de existir resúmenes mensuales) ' , 20);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Control y liquidación de carburante y lubricante (vemos los kilómetros recorridos de todo el parque incluidas las motos) ' , 21);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Control de la limitación de 2.000 kilómetros mensuales para todos los vehículos de servicio de nueva adquisición, durante sus dos primeros años contados a partir de su matriculación. ' , 22);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Gastos de reparaciones y repuestos en especial los que están en mal estado. ' , 23);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Durante los dos últimos años la Delegación ha realizado resúmenes del control mensual del gasto tanto para las reparaciones, los cambios de neumáticos, baterías y repuestos de los vehículos oficiales. ' , 24);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'La Delegación dispone de una relación de los movimientos de los vehículos policiales efectuados en los Talleres de la misma, con indicación de la entrada,  el motivo, la salida y pendientes de reparación. ' , 25);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Programa preventivo de mantenimiento reflejado en la aplicación ALFIL (aceite, filtros, correa de distribución y neumáticos) : ' , 26);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Tratamiento de los residuos.' , 27);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Ratio de efectivos destinados por vehículo adjudicado. ' , 28);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Quien establece el estado B R M de los vehículos. Documento de Pauta sobre el estado de los vehículos (escritos) ' , 29);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Accidentes: ' , 30);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Analizando los accidentes de los vehículos por culpa propia, con contrario y sin contrario en los dos últimos años, tenemos que:' , 31);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Medidas adoptadas respecto a los accidentes por culpa propia: ' , 32);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Vehículos en mal estado, causas y gasto acumulado en ALFIL, pasan la ITV ' , 33);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Atención de las averías por las compañías Renting: ' , 34);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Nª de vehículos renting de sustitución: ' , 35);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Inspección Técnica de Vehículos (ITV):  ' , 36);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Acuerdos para pasar la ITV: 
Acuerdos para la práctica de ITV: ……… de ………… tiene un acuerdo con el Ministerio de Defensa para la realización de la ITV en instalaciones militares). En cuanto a los vehículos renting son retirados por contrato antes de la fecha finalización del plazo para el paso de la ITV  (4 años)
Orden del 27 de julio de 1999 de Ministerio de Industria y Energía sobre extintores en vehículos: 
• 1 extintor de clase 5ª/21B para vehículos de transporte de personas hasta 9 plazas incluido el conductor. 
• 1 extintor de clase 8ª/34 B para vehículos de transporte de personas de hasta 23 plazas incluido el conductor. 
• 1 extinto de clase 21 A /113 B para vehículos  de transporte de personas de  más de 23 plazas incluido el conductor.' , 37);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Acuerdos para pasar la ITV:
Seguidamente se procedió a la inspección de forma aleatoria de los siguientes vehículos para comprobar su estado general, su documentación y los equipos que portaban: 
El vehículo tipo “K”, marca ………….., matrícula oficial ………….. y matrícula civil ………………………, disponía: 
• Libro de servicios prestados con Vehículos Policiales (identidad de los conductores usuarios, horarios de utilización, recorridos y naturaleza genérica de los servicios prestados):
• fotocopia compulsada  u original del Consorcio de Compensación de Seguros en vigor:
• fotocopia compulsada u original de la Libreta de Documentación y Datos 
• Tarjeta de Inspección Técnica y el Permiso de Circulación,
• fotocopia u original favorable compulsada la ITV pasada el………… 
• Tarjeta de repostaje SOLRED y sobre normalizado:
• Parte Europeo de Accidentes:
• Chalecos reflectantes:
• Linternas:
• Extintor de incendios:
• Triángulos: 
• Rueda de repuesto:
', 38);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Acuerdos para pasar la ITV:  
El vehículo tipo “Z”, ………….marca ……………, matrícula oficial
• Libro de Control de Vehículos y Material de Dotación (identidad, horarios, recorridos y naturaleza genérica de los servicios prestados”:
• Fotocopia compulsada  u original del Consorcio de Compensación de Seguros en vigor:
• Fotocopia compulsada u original  de la Libreta de Documentación y Datos:
• Tarjeta de Inspección Técnica y el Permiso de Circulación:
• Fotocopia y original favorable compulsada la ITV pasada el ………………..,
• Tarjeta de repostaje SOLRED y sobre normalizado:
• Parte Europeo de Accidentes:
• Chalecos reflectantes: 
• Linternas:
• Extintor de incendios:
• Conos de señalización:
• Triángulos:
• Rueda de repuesto:
• Manta térmica para accidente:
• Cintas  policiales delimitadoras:
• Paleta difusora (STOP)
• Palanqueta de apertura de puertas (Barra uña)' , 39);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Acuerdos para pasar la ITV:  
En cuanto a la media de utilización  de los vehículos para el sistema “Renting” establecida por resulta que en los dos últimos años. 
En cuanto a la media de utilización  de los vehículos propiedad del DGGC en los dos últimos años: SI' , 40);


--GUÍA AUTOMOCIÓN PN 
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'GUÍA AUTOMOCIÓN PN', 'I.G.P.', 0,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Estructura ' , 0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Ubicación La Delegación de Automoción de ………. está ubicada en….  ' , 1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Catálogo de puestos de trabajo aparecen: ' , 2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Puestos cubiertos: ' , 3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Auxiliados en el taller: ' , 4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Actividad desarrollada: la  Delegación es la encargada de la administración  general de los vehículos oficiales (labores burocráticas)  ' , 5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Reparaciones de los vehículos propiedad de PN que se realizan: ' , 6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Como se ejerce el control de las reparaciones de los vehículos de la PN: partes de trabajo que se abren a la entrada del vehículo en talleres y se cierran cuando sale. Comprobación de varios partes de reparación y que hayan quedado reflejados en la aplicación ASIA. ' , 7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Cuando un vehículo oficial de PN se accidenta se lleva a los talleres y, tras la confección del parte de accidentes y su grabación en ASIA, se repara. ' , 8);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'La Delegación dispone de una relación de los movimientos de los vehículos policiales efectuados en los Talleres de la misma, con indicación de la entrada,  el motivo, la salida y pendientes de reparación. ' , 9);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Otras reparaciones donde se hacen: ' , 10);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Programa preventivo de mantenimiento reflejado en la aplicación ASIA (aceite, filtros, correa de distribución y neumáticos). Mantenimientos. ' , 11);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Carga de Trabajo: Adecuación del dimensionado de la Unidad a la Actividad desarrollada. ' , 12);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Limpieza de los vehículos ' , 13);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Encontrándose  en la misma depositadas la documentación original de los vehículos oficiales para evitar pérdidas, en concreto, de  los Certificados y Recibos de Seguros de los vehículos con el Consorcio de Compensación de Seguros, las Libretas de Documentación y Datos con las Tarjetas de Inspección Técnicas,  los  Permisos de Circulación y los documentos de ITV (Informe de Inspección Técnica  de Vehículos. ' , 14);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Policías especialistas en automoción con un curso de grabación y gestión como peritos tasadores en ASIA, ………. especialistas en formación vial, tramitación de carnets de conducir, accidentes y control de los vehículos “renting” y el resto son personal de apoyo. De los especialistas en automoción, ……….. son mecánicos de coches, ……. mecánico de  motos y ………. electricista. ' , 15);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Cursos de actualización o formación de camión, motos, todoterrenos, microbuses  y furgonetas SEDEX/TEDAX. ' , 16);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Necesidades de especialización: Despacho: el Jefe de la Delegación, …….. para la Secretaría General y Nave para taller, almacén de repuestos. ' , 17);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Grúa (propia utilizada cuando o contratos): Problemática ' , 18);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'En cuanto al material informático con los que dispone la Delegación está compuesto por…. ordenadores……….., impresoras, ordenadores con una impresoras en talleres y en…………… ' , 19);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'En cuanto a los créditos presupuestarios de la Delegación, en los dos últimos años.  Gastos de reparaciones y repuestos de los dos últimos años (suministro de maquinaria, útiles de transporte) (casos de existir resúmenes mensuales). Compra de recambios de material: ' , 20);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Ver gastos de reparaciones y repuestos en especial de los vehículos que están en mal estado. ' , 21);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Durante los dos últimos años la Delegación ha realizado resúmenes del control mensual del gasto tanto para las reparaciones, los cambios de neumáticos, baterías y repuestos de los vehículos oficiales.  ' , 22);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Control y liquidación de carburante y lubricante (vemos los kilómetros recorridos de todo el parque incluidas las motos) ' , 23);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Tratamiento de los residuos. ' , 24);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Quien establece el estado B R M de los vehículos: (escritos) ' , 25);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Vehículos en mal estado, causas y gasto acumulado en ASIA, pasan la ITV ' , 26);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Ratio de efectivos destinados por vehículo adjudicado. ' , 27);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Accidentes en general: ' , 28);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Analizando los accidentes de los vehículos por culpa propia, con contrario y sin contrario en los dos últimos años, tenemos que: ' , 29);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Medidas adoptadas respecto a los accidentes por culpa propia: ' , 30);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Atención de las averías por las compañías Renting: ' , 31);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Nª de vehículos renting de sustitución: ' , 32);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Vehículos K de renting : kilometraje, utilización. ' , 33);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Inspección Técnica de Vehículos (ITV): ' , 34);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Acuerdos para pasar la ITV: 
Acuerdos para la práctica de ITV: ……………………la tiene un acuerdo con el Ministerio de Defensa para la realización de la ITV en instalaciones militares). En cuanto a los vehículos renting son retirados por contrato antes de la fecha finalización del plazo para el paso de la ITV  (4 años)
Orden del 27 de julio de 1999 de Ministerio de Industria y Energía sobre extintores en vehículos: 
• 1 extintor de clase 5ª/21B para vehículos de transporte de personas hasta 9 plazas incluido el conductor. 
• 1 extintor de clase 8ª/34 B para vehículos de transporte de personas de hasta 23 plazas incluido el conductor. 
• 1 extinto de clase 21 A /113 B para vehículos  de transporte de personas de  más de 23 plazas incluido el conductor.' , 35);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Acuerdos para pasar la ITV:
Seguidamente se procedió a la inspección de forma aleatoria de los siguientes vehículos para comprobar su estado general, su documentación y los equipos que portaban: 
El vehículo tipo “K”, marca..………….., matrícula oficial ………….. y matrícula civil ………………………, disponía: 
• Libro de servicios prestados con Vehículos Policiales (identidad de los conductores usuarios, horarios de utilización, recorridos y naturaleza genérica de los servicios prestados):
• Fotocopia compulsada  u original del Consorcio de Compensación de Seguros en vigor:
• Fotocopia compulsada u original de la Libreta de Documentación y Datos 
• Tarjeta de Inspección Técnica de Vehículos y el Permiso de Circulación,
• Fotocopia u original favorable compulsada la ITV pasada el………… 
• Tarjeta de repostaje SOLRED y sobre normalizado:
• Parte Europeo de Accidentes:
• 2 Chalecos reflectantes:
• 1 extintor de incendios:
• Conos linterna 
• Triángulos: 
• Lanza destellos
• Rueda de repuesto.', 36);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Acuerdos para pasar la ITV:
El vehículo tipo “Z”, ………….marca ……………, matrícula oficial
• Libro de Control de Vehículos y Material de Dotación (identidad, horarios, recorridos y naturaleza genérica de los servicios prestados” (Los Libros de control de vehículos y material de dotación, para vehículos Z, con número de imprenta A-079, deberán ser custodiados en las plantillas de destino del vehículo por un periodo no inferir a 12 meses, quedando los mismos a disposición del Área para las auditorias que se realizarán de forma aleatoria)
• Fotocopia compulsada  u original del Consorcio de Compensación de Seguros en vigor:
• Fotocopia compulsada u original  de la Libreta de Documentación y Datos:
• Tarjeta de Inspección Técnica y el Permiso de Circulación:
• Fotocopia u original favorable compulsada la ITV pasada el ………………..,
• Tarjeta de repostaje SOLRED y sobre normalizado:
• Parte Europeo de Accidentes:
• 2 Chalecos reflectantes policiales: 
• Chalecos antibala:
• 2 Linternas:
• 1 extintor de incendios (6 kg):
• 2 conos amarillos:
• 2 conos rojos
• Triángulos:
• rueda de repuesto:
• 2 mantas térmicas para accidente:
• Cinta policial delimitadora:
• Paleta difusora (STOP)
• Palanqueta de apertura de puertas (Barra uña)  
• Armero 2 llaves
• Martillo.' , 37);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Acuerdos para pasar la ITV:
En cuanto a la media de utilización  de los vehículos para el sistema “Renting” establecida por resulta que en los dos últimos años (la mayoría son  de asignación en fecha 01-10-xxxx y tan sólo se nos facilitó datos de kilometraje de un número limitado de los anteriores a esta fecha): 
En cuanto a la media de utilización  de los vehículos propiedad de PN en los dos últimos años.' , 38);


--GUIA DE INFORMÁTICA Y TELECOMUNICACIONES PN
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'GUIA DE INFORMÁTICA Y TELECOMUNICACIONES PN', 'I.G.P.', 0,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'INFORMÁTICA ', 0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Catálogo de Puestos de Trabajo, personal real y distribución de personal. (El CPT prevé 1 Delegado de Informática de la escala ejecutiva) ', 1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Turnos y horarios de servicio: 
Desplazamientos a otras platillas', 2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Carga de Trabajo: 
Control de las actividades diarias a través de partes de trabajo. 
Grabación estadística de hechos policiales, vehículos…
Reparaciones de equipos, tiempos de respuesta y grado de satisfacción. 
Adecuación del dimensionado de la Unidad a la actividad desarrollada.', 3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Adecuación de Equipos y Material: 
La Delegación de informática disponen: ……. de ordenadores ,……. Impresoras.
Fecha de adquisición y de instalación de los ordenadores.
¿Existen ordenadores almacenados y no instalados? ¿Se adoptan medias para que no se pierda las garantías?', 4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Estado del equipamiento informático y número de equipos sustituidos en el año anterior. 
Licencias, ¿Están utilizando licencias piratas? ¿Licencia Libre Office?.
Control del gasto de las impresoras y reposición de tóner.
Ratio entre el personal destinado y el número de ordenadores (El Escorial: 1 Pc x 3,5 funcionarios).
Número de impresoras y ratio por persona (1 impresas de red  x 4,5 PC,s).
Número de accesos a Internet.
Cuentas e-mail: por personales, por grupos.
Período de garantía de los ordenadores e impresoras.', 5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Cualificación profesional alcanzada: 
Formación del personal
Cursos de formación en informática y telecomunicaciones  (TIC)
Cursos realizados en los 3 últimos años
Accesos a las bases policiales tanto del personal como del Delegado de la Plantilla (SIDENPOL, SEIGESPOL, ARGOS, ADEXTRA, OBJETOS, etc', 6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Problemática, necesidades expuestas: ', 7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'TELECOMUNICACIONES ', 8);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'El CPT contempla………… puestos de especialistas de la escala básica
En la actualidad personal cubierto.', 9);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Turnos y horarios de servicio: 
Horario de prestación del servicio
Desplazamientos a otras platillas
Cómo se atienden las incidencias, urgencias, fines de semana (¿se compensa de alguna manera?', 10);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Cualificación profesional alcanzada:
Cursos de formación en Telecomunicaciones e Informática (TIC).
Conocimiento del manejo de los terminales SIRDEE por los usuarios.
Acceso a Internet ¿quién accede y como se autoriza?', 11);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Carga de Trabajo: 
Actividades, mantenimiento, reparaciones 
Programación de los terminales SIRDEE.
Asistencia a las video-conferencias en los 2 últimos años. 
Visionados de las CCTV (nocturno).
Se da cobertura a las comisarías provinciales, locales………
Accesos a las bases policiales del personal (SIDENPOL, SIGESPOL, ARGOS, ADEXTRA, OBJETOS, etc), ¿Se ejerce algún control del acceso por parte de este personal?', 12);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'"Adecuación de Equipos y Material: 
Número de equipos SIRDEE: 
Grado de cobertura SIRDEE ¿zonas de sombra? 
Número de emisoras base: 
Número de emisoras  móviles en vehículos.
Número de teléfonos móviles.
Solicitudes  de cámaras al Área de Telecomunicaciones de la Subdirección General de Logística (sustitución de las cámaras fijas por móviles).
Recepción de cámaras en los dos últimos años.', 13);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Problemática, necesidades expuestas:', 14);


--GUÍA VESTUARIO GC
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'GUÍA VESTUARIO GC', 'I.G.P.', 0,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Ubicación y características de la dependencia.' , 0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Personal que la atiende. Suficiencia o no. Causas.' , 1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Horario:' , 2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Gestión y control (), cada funcionario  graba las solicitudes a través del  programa ALFIL,  el personal de Vestuario realiza sólo el control y recepción de lotes los cuales se adjudican individualmente sin existir stock.' , 3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Normativa reguladora en las peticiones y detalle de cómo y a quién se efectúan.' , 4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Catálogo específico sobre uniformidad para especialidades.' , 5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Verificar retrasos en la reposición de prendas y calzado en las diferentes especialidades con expresión de la fecha de petición (en los dos últimos años), divisas…' , 6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Sección de Motos : Comprobar la dotación que se asigna a este personal y si se le facilitan protecciones para hombros, codos, rodilleras con sistema anti-abrasión, chalecos reflectantes.' , 7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Detalle de la distribución y entrega de prendas.' , 8);

--GUÍA VESTUARIO PN
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'GUÍA VESTUARIO PN', 'I.G.P.', 0,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Ubicación y características de la dependencia.' , 0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Personal que la atiende. Suficiencia o no. Causas.' , 1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Horario:' , 2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Gestión y control (bases de datos), el personal de vestuario graba las solicitudes a través de formularios normalizados en una aplicación centralizada proporcionada por el Servicio Central de Vestuario de la División Económica y Técnica.' , 3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Catálogo específico sobre uniformidad para especialidades. Normativa reguladora en las peticiones y detalle de cómo y a quién se efectúan.' , 4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Verificar retrasos en la reposición de prendas y calzado en las diferentes especialidades (BPSC) con expresión de la fecha de petición (en los dos últimos años), divisas…' , 5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Sección de Motos (BPSC): Comprobar la dotación que se asigna a este personal y si se le facilitan protecciones para hombros, codos, rodilleras con sistema anti-abrasión, chalecos reflectantes.' , 6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Sección de Subsuelo (BPSC): ¿Está dotada de monos desechables para la labor diaria y botas de seguridad?, ¿se han pedido?' , 7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'¿Quién facilita los monos de trabajo ignífugos?, ¿se han pedido?, ¿a quién?, ¿cuándo?' , 8);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Detalle de la distribución y entrega de prendas.' , 9);

--GUIA GRUPO DE APOYO EN TECNOLOGÍAS DE LA INFORMACIÓN (GATI) GC
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'GUIA GRUPO DE APOYO EN TECNOLOGÍAS DE LA INFORMACIÓN (GATI) GC', 'I.G.P.', 0,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Catálogo de Puestos de Trabajo, personal real y distribución de personal. ', 0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Turnos y horarios de servicio: 
Desplazamientos a otras platillas: ¿Se anotan en la aplicación SIGO las salidas diarias, cuantificación de las actividades realizadas y tiempos invertidos?', 1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Carga de Trabajo: 
Control de las actividades diarias a través de partes de trabajo. Grabación estadística de hechos policiales, vehículos…Reparaciones de equipos, tiempos de respuesta y grado de satisfacción. 
Adecuación del dimensionado de la Unidad a la actividad desarrollada.', 2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Adecuación de Equipos y Material: El GATI dispone: ……. de ordenadores ,……. Impresoras.', 3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'"Estado del equipamiento informático y número de equipos sustituidos en el año anterior. 
Control del gasto de las impresoras y reposición de tóner.', 4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Ratio entre el personal destinado y el número de ordenadores. 
Número de impresoras y ratio por persona.
Número de accesos a Internet.
Cuentas e-mail: por personales, por grupos. 
Período de garantía de los ordenadores e impresoras.', 5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Cualificación profesional alcanzada: 
Formación del personal.
Cursos de formación en informática y telecomunicaciones  (TIC).
Cursos realizados en los 3 últimos años.
Accesos a las bases policiales tanto del personal: ALFIL Y SIGO.', 6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Problemática, necesidades expuestas:  ', 7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Telecomunicaciones:
El CPT contempla………… puestos de especialistas de la escala básica
En la actualidad personal cubierto:', 8);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Turnos y horarios de servicio: 
Horario de prestación del servicio.
Desplazamientos a otras platillas: ¿Se anotan en la aplicación SIGO las salidas diarias, cuantificación de las actividades realizadas y tiempos invertidos?.
Cómo se atienden las incidencias, urgencias, fines de semana (¿se compensa de alguna manera?', 9);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Cualificación profesional alcanzada:
Cursos de formación en Telecomunicaciones e Informática (TIC). 
Conocimiento del manejo de los terminales SIRDEE por los usuarios.
Acceso a Internet ¿quién accede y como se autoriza?.', 10);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Carga de Trabajo: 
Actividades, mantenimiento, reparaciones.
Programación de los terminales SIRDEE.
Asistencia a las video-conferencias en los 2 últimos años. 
Visionados de las CCTV (nocturno).
Se da cobertura a las compañías y puestos.
Accesos a las bases policiales del personal a ALFIL y SIGO.  ¿Se ejerce algún control del acceso por parte de este personal?', 11);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'"Adecuación de Equipos y Material: 
Número de equipos SIRDEE y grado de cobertura:  ¿zonas de sombra?.
Número de emisoras base. 
Número de emisoras  móviles en vehículos.
Número de equipos y ratio. 
Número de teléfonos móviles y ratio.  
Solicitudes  de cámaras al Área de ……………… (sustitución de las cámaras fijas por móviles): 
Recepción de cámaras en los dos últimos años.', 12);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Problemática, necesidades expuestas:', 13);


--GUÍA PROGRAMA PATIO GC
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'GUÍA PROGRAMA PATIO GC', 'I.G.P.', 0,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Dónde se realizan los ejercicios de tiro (campos de tiro – Convenios con el Ejército):', 0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Nº de profesores instructores operativos SIO (oficiales, nivel 1) nº instructores operativos SIO ( resto del personal con nivel 2)', 1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Porcentajes de participación durante los dos últimos años. ', 2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Fichas de Intervención Operativa: en papel  o soporte informático (Tabla Excel individualizada) sobre la aplicación del Programa PATIO.', 3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Revisión de Actas Semestrales sobre la aplicación del Programa PATIO remitido a las Comandancias:', 4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'¿Se lleva algún control de los que no realizan el tiro, se justifica, ¿se toman medidas disciplinarias? ', 5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Nivel alcanzado: APTO / NO APTO caso de refuerzo', 6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'La Comandancia  dicta la orden de servicio del Plan Patio   y nombra el servicio para la realización de las prácticas del PROGRAMA PATIO. ¿Cómo se planifica los ejercicios semestrales? Pedir copia de las ordenes semestrales.', 7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Actas semestrales enviadas a la Comandancia', 8);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Como medida preventiva, ¿se pone en conocimiento de los servicios de emergencia 112, la fecha y los lugares donde se realizarán los ejercicios de tiro, con una antelación mínima de…………….(una semana) al objeto de coordinarlos con servicios de emergencia en caso que fuera necesario, tal como establece en el Plan de Contingencia de la Comandancia? Los ejercicios de tiro ¿cuentan con personal sanitario y la presencia física de una ambulancia?:', 9);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Consumo de cartuchería:', 10);


--GUÍA PLAN NACIONAL DE TIRO (PNT) PN
insert into guias (id, nombre_guia, tipo_inspeccion, orden, fecha_alta, username_alta) values 
(SEQ_GUIAS.NEXTVAL, 'GUÍA PLAN NACIONAL DE TIRO (PNT) PN', 'I.G.P.', 0,trunc(sysdate), 'system');

insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Dónde se realizan los ejercicios de tiro (nº de galerías):', 0);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Catálogo de puestos de trabajo:', 1);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Personal cubierto: Nº de instructores de tiro: ¿titulado como especialista en armamento y tiro?', 2);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Los instructores de tiro: ¿Pasan reconocimientos médicos para la prevención de riesgos  (oficiales o particulares):', 3);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Porcentajes de participación durante los dos últimos años:', 4);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Digitalización de la Cartilla anual del PN', 5);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Revisión de Actas Trimestrales: ', 6);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Informe trimestral a la Superioridad del incumplimiento del Plan de Tiro por parte del funcionario encargado.', 7);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Citación a cada funcionario para el cumplimiento del PNT', 8);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Solicitud del justificante de la no asistencia a las prácticas de tiro del funcionario. ¿Se lleva algún control de los que no realizan el tiro, se justifica, ¿se toman medidas disciplinarias?', 9);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Nivel alcanzado:', 10);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Libro de  control de tiro de la galería:', 11);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Cartillas de tiro: ¿ Se cumplimentan? (hacer muestreo de varias cartillas). Existe alguna otra aplicación informática.', 12);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Calendario para las prácticas de tiro, como se planifica los ejercicios trimestrales? : Orden escrita de…, apuntarse el funcionario.', 13);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Como medida preventiva, ¿se pone en conocimiento de los servicios de emergencia 112, la fecha y los lugares donde se realizarán los ejercicios de tiro, con una antelación mínima de…………….(una semana) al objeto de coordinarlos con servicios de emergencia en caso que fuera necesario.', 14);
insert into guia_Pasos (id, id_guia, paso, orden) values (SEQ_PASOSGUIA.NEXTVAL, SEQ_GUIAS.CURRVAL,'Consumo de cartuchería:', 15);

commit;
