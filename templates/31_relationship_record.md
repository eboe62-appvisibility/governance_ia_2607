# Relationship Record Template
(Template for documenting stable relationships between project assets)

---

## Relationship Identifier

Relationship ID:

Status:
[DRAFT | VERIFIED | DEPRECATED | SUPERSEDED]

Relationship Type:

Examples:

- contains
- part_of
- depends_on
- uses
- implements
- references
- located_in
- connected_to
- belongs_to
- influenced
- created_by
- managed_by
- equivalent_to
- prerequisite_for
- successor_of
- predecessor_of
- other

Domain (optional):

See `docs/decisiones/ADR-0033-Taxonomia_ADRs.md` § Domain for the canonical, single-source vocabulary. Do not duplicate the list here (ADR-1100 point 5) — update ADR-0033 instead when a new Domain term is needed.

---

## Relationship

Source Asset:

Relationship:

Target Asset:

---

## Purpose

Describe why this relationship is relevant to the project.

---

## Description

Provide a clear, factual description of the relationship.

Describe only the relationship itself.

Do not duplicate the full description of either related asset.

---

## Scope

Describe what this relationship represents.

Also describe what is explicitly outside its scope.

---

## Evidence and Sources

List the evidence supporting this relationship.

Examples:

- project documentation
- official publications
- research sources
- standards
- reference works
- verified datasets

Clearly distinguish:

- verified evidence
- assumptions
- unresolved questions

---

## Related Assets

List related Knowledge Assets, ADRs, documents, or other repository artifacts that provide additional context.

---

## Validation

Describe how the relationship has been verified.

Examples:

- reviewed documentation
- authoritative source comparison
- expert review
- repository consistency check

---

## Notes

Additional information useful for future maintenance or extension.

---

## Prohibited Actions

Do not:

- duplicate information already documented in related Knowledge Assets
- infer relationships without supporting evidence
- mix verified facts with assumptions
- create circular or contradictory relationships without justification
- modify related assets without explicit review
