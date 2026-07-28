# Skill Definition: elaborar_knowledge_assets
(Definition of a reusable project capability)

---

## Objective

Convertir un corpus de fuentes ya depuradas (`fuentes/<corpus>/`) en Knowledge Assets y Relationship Records gobernados, elaborados y verificados a escala, siguiendo el procedimiento formalizado en `ADR-1105`.

---

## Skill Metadata

Skill Name:
elaborar_knowledge_assets

Status:
ACTIVE

Owner:
Responsable de curación de conocimiento del proyecto

Version:
1.0.0

Last Review:
2026-07-26

Superseded By:
NONE

Architectural Decision Dependencies:
- ADR-1100 (ubicación y naming de `conocimiento/`)
- ADR-1101 (ubicación de fuentes en `fuentes/`)
- ADR-1102 (modelo de ramas gobernanza vs. contenido)
- ADR-1103 (procedimiento de integración de ramas)
- ADR-1104 (vocabulario Domain/Tags — ejemplo de ampliación previa a elaboración)
- ADR-1105 (procedimiento que este skill operacionaliza)

Governance Dependencies:
- docs/Project_Definition/03_ONTOLOGY.md
- docs/Project_Definition/04_SOURCE_MODEL.md
- docs/Project_Definition/05_EVIDENCE_CONFIDENCE.md
- docs/decisiones/ADR-0033-Taxonomia_ADRs.md (vocabulario Domain/Tags canónico)
- ai/templates/30_knowledge_asset.md
- ai/templates/31_relationship_record.md

Related Skills:
- NONE (primer skill registrado en `ai/skills/`)

---

## Scope

Usar este skill cuando:

* existe un corpus de documentos fuente ya ingerido en `fuentes/<corpus>/` y ya depurado (contenido ajeno eliminado, fecha real de publicación corregida en el nombre cuando se conozca);
* se necesita producir Knowledge Assets (`conocimiento/*.md`) y sus Relationship Records emparejados (`conocimiento/relaciones/*.md`) para ese corpus;
* el volumen del corpus (más de un puñado de documentos) hace conveniente un procesamiento por lotes en lugar de ficha a ficha.

No usar este skill para:

* fuentes todavía sin depurar (ejecutar primero la Fase 1 de `ADR-1105`);
* la elaboración de una única ficha aislada fuera de un corpus (las reglas de evidencia y naming siguen aplicando, pero la maquinaria de lotes/verificación de este skill no aporta valor para un solo documento);
* cambios en la propia arquitectura de conocimiento (ontología, vocabulario Domain) — eso corresponde a un ADR específico (ver Fase 2 de `ADR-1105`), no a este skill.

---

## Purpose

Este skill proporciona:

* un procedimiento reproducible para pasar de "corpus depurado" a "Knowledge Assets + Relationship Records verificados";
* un tamaño de lote de referencia y un patrón de instrucciones para paralelizar la elaboración mediante subagentes;
* un checklist de verificación mecánico que detecta huérfanos, duplicados, ficheros truncados y colisiones de nombre antes de dar por cerrado el trabajo;
* reglas explícitas que evitan dos errores observados en la práctica: (a) forzar un `Domain` inadecuado por falta de una opción mejor, y (b) fabricar relaciones `related_to` entre fichas por similitud temática superficial sin verificación cruzada.

Valor esperado: cada corpus futuro (nuevas incorporaciones a `fuentes/`) se procesa con el mismo nivel de rigor sin tener que re-derivar el procedimiento desde cero.

---

## Activation Criteria

Activar cuando el usuario solicite explícitamente "elaborar fichas", "crear Knowledge Assets", "hacer las fichas de conocimiento" (o equivalente) para un corpus ya presente en `fuentes/`.

No activar automáticamente solo porque exista contenido nuevo en `fuentes/` — la elaboración de Knowledge Assets es una decisión editorial del usuario, no una consecuencia automática de la ingesta de fuentes.

---

## Required Inputs

* Ruta del corpus fuente: `fuentes/<corpus>/*.md` (ya depurado).
* Vocabulario `Domain` vigente: `docs/decisiones/ADR-0033-Taxonomia_ADRs.md` § Domain (verificar que está actualizado — puede haber sido ampliado por ADRs posteriores, p. ej. `ADR-1104`).
* Niveles de confianza: `docs/Project_Definition/05_EVIDENCE_CONFIDENCE.md`.
* Plantillas: `ai/templates/30_knowledge_asset.md`, `ai/templates/31_relationship_record.md`.
* Al menos un ejemplo real existente en `conocimiento/` como referencia de estilo (si el corpus es el primero del proyecto, usar los ejemplos ya presentes en `conocimiento/`, no inventar un formato nuevo).

---

## Behaviour Rules

**Obligatorio:**

* Ejecutar la Fase 2 de `ADR-1105` (chequeo de cobertura Domain/Tags/Ontology) antes de iniciar la elaboración; si hay huecos reales, proponer ADR de ampliación en `develop` primero.
* Leer el fichero fuente completo antes de escribir cualquier ficha — nunca inferir contenido a partir del nombre de fichero.
* Justificar en `Purpose` cualquier desviación respecto a un `Domain`/slug sugerido inicialmente.
* Asignar Confidence Level según `05_EVIDENCE_CONFIDENCE.md`, no por defecto.
* Ejecutar el checklist completo de la Fase 4 de `ADR-1105` antes de reportar la tarea como terminada.
* No commitear nada sin confirmación explícita del usuario (Fase 5 de `ADR-1105`).

**Opcional:**

* Ajustar el tamaño de lote (referencia: ~9 documentos) según la longitud media de los documentos del corpus y la capacidad de contexto disponible.

**Prohibido:**

* Usar términos de `Domain` fuera del vocabulario canónico vigente.
* Declarar relaciones (`Related Knowledge Assets`, `related_to`) entre fichas sin verificación cruzada explícita — el solapamiento temático sin verificar se documenta como nota, nunca como relación formal.
* Commitear o hacer merge de rama sin autorización explícita en el momento.

---

## Constraints

* Depende de que el vocabulario `Domain` de `ADR-0033.md` esté al día; si el corpus revela huecos de cobertura, este skill no debe forzar una clasificación inadecuada — debe derivar primero a la Fase 2 de `ADR-1105`.
* La elaboración ocurre en la rama de contenido activa; el commit y las fases de merge posteriores requieren aprobación explícita del usuario en cada paso, conforme a `ADR-1102`/`ADR-1103`.
* El tamaño de lote de referencia (9 documentos) es una observación empírica de un único corpus (`fuentes/260726_ABC/`, 54 documentos) — revisar si se aplica a corpus de tamaño muy distinto.

---

## Expected Outputs

* N Knowledge Assets en `conocimiento/YYMMDD-domain_principal-slug.md`.
* N Relationship Records emparejados en `conocimiento/relaciones/YYMMDD-domain_principal-slug.md`.
* Informe de verificación (Fase 4 de `ADR-1105`): cobertura, emparejamiento, integridad estructural, colisiones, solapamientos detectados.
* Lista de desviaciones de `Domain`/slug respecto a las sugerencias iniciales, con justificación.
* Lista de solapamientos temáticos detectados entre fichas, documentados sin relación formal fabricada.

Todo output debe distinguir explícitamente evidencia verificada, asunciones y preguntas sin resolver, conforme al principio general del proyecto (`04_SOURCE_MODEL.md`, `05_EVIDENCE_CONFIDENCE.md`).

---

## Validation

Éxito verificado cuando, para el corpus procesado:

1. Cada fichero fuente tiene exactamente una ficha Knowledge Asset (comprobación por conteo de citas "Fuente primaria de esta ficha").
2. Cada Knowledge Asset tiene su Relationship Record emparejado (diff de nombres base entre `conocimiento/` y `conocimiento/relaciones/`).
3. Ninguna ficha termina de forma abrupta antes del bloque `Prohibited Actions`.
4. No hay nombres de fichero duplicados.
5. Los solapamientos temáticos detectados están documentados como nota, no como relación formal no verificada.

---

## Notes

Este skill se originó a partir de la elaboración de 54 Knowledge Assets + 54 Relationship Records para el corpus `fuentes/260726_ABC/` (2026-07-26), el primer corpus del proyecto procesado con este nivel de sistematización. Ver `ADR-1105` para el contexto completo y el diagrama de flujo del procedimiento.
