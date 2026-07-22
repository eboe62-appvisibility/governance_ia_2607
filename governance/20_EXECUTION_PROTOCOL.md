# Execution Protocol
(Mainly focus on DevSecOps: How approved changes should be executed)

## Objective

Define how approved changes should be executed.

---

## Preconditions

Before implementation:

- analysis completed
- risks identified
- constraints understood
- approval received

---

## Scope Control

Implement only the approved scope.

Do not:

- refactor unrelated code
- redesign architecture
- introduce additional features

unless explicitly authorized.

---

## Implementation Rules

Prefer:

- minimal changes
- reversible changes
- documented changes

Maintain:

- compliance with approved Architectural Decisions (when applicable)
- compliance with project governance (e.g. Infrastructure as Code - IaC requirements)
- operational stability (when applicable)

---

## Validation Requirements

Every change must include:

- verification method
- rollback method
- expected outcome

---

## Documentation Requirements

Update documentation when:

- behaviour changes
- architecture changes
- governance changes
- operational procedures change

---

## Security Changes

Security controls must:

- be evidence-based
- be validated
- be reversible

Never deploy unvalidated hardening controls.

---

## Completion Criteria

A change is complete only when:

- implementation finished
- validation passed
- documentation updated
- rollback documented

## Evidence Requirements

Execution proposals must identify:

- evidence supporting the change
- highest evidence level
- validation gaps

Execution based solely on E0 hypotheses should not occur unless explicitly authorized.

Execution based solely on E1 or E2 evidence requires explicit justification.

E3 or higher should be preferred whenever available.

## Confidence Requirements

Execution recommendations must include:

- evidence level
- confidence level
- validation gaps

Execution should normally require:

Confidence:
HIGH

or higher.

Execution proposals with:

Confidence:
LOW

or

INSUFFICIENT

are prohibited unless explicitly authorized by the user.

Validation should be preferred over implementation whenever confidence is insufficient.

## Governance Conflict Validation

Before execution:

Verify that:

- ADRs
- governance documents
- correction plans
- implementation requirements

do not conflict.

If conflicts exist:

Follow the project's governance conflict resolution process (e.g. activate governance_arbiter).

Execution must be suspended until the conflict is resolved.

## Authority Validation

Before execution:

Verify compliance with the project's Authority Hierarchy (e.g. docs/governance/AUTHORITY_HIERARCHY.md).

Authority conflicts must be resolved before implementation begins.

## ADR Authority Validation

Before implementing ADR-driven changes:

Verify the project's ADR Index (e.g. docs/architecture/ADR_INDEX.md) and confirm that the applicable Architectural Decisions are authoritative.

Implementation based on superseded ADRs is prohibited.

## Skill Authority Validation

Execution workflows should rely only on active project capabilities (e.g. capabilities registered in the project's Skill Registry such as SKILL_REGISTRY.md).
