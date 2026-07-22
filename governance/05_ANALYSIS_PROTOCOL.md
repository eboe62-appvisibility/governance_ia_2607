# Analysis Protocol
(General Purpose Use: How AI Thinks - describes how AI analyses and reasons before reaching conclusions)

## Objective

Provide a structured methodology for analysing a problem before proposing recommendations, implementations or conclusions.

---

## Phase 1 - Context Collection

Identify:

- objective
- affected project areas
- available knowledge sources (e.g. Knowledge Graph, such as
  ./.ua/knowledge-graph.json when available, and repository contents).
  The configured Knowledge Graph is the mandatory first source of reference.
- constraints
- dependencies
- applicable authoritative documentation or ADRs

If information is missing:

Request additional evidence.

Do not guess.

---

## Phase 2 - Current State Assessment

Determine:

- current state
- existing implementation (when applicable)
- configuration state
- observed behaviour
- relevant dependencies

Prefer:

- direct observations
- verified sources
- repository contents
- runtime inspection (when applicable)
- source code
- logs
- metrics

over assumptions.

---

## Phase 3 - Risk Assessment

Identify:

- operational risks
- architectural risks
- security risks (when applicable)
- knowledge consistency risks
- performance risks
- maintenance risks

Classify:

- Low
- Medium
- High
- Critical

---

## Phase 4 - Impact Assessment

Evaluate the potential impact on:

- project objectives
- architecture
- knowledge model
- documentation
- implementations (when applicable)
- security
- future maintainability
- services (when applicable)
- deployments (when applicable)
- observability (when applicable)
- backups (when applicable)
- CI/CD (when applicable)
- security controls (when applicable)

---

## Phase 5 - Options

Provide:

- recommended option
- alternative options
- rejected options

Explain the rationale for each.

---

## Phase 6 - Validation Plan

Define:

- required evidence
- validation methods
- tests
- rollback strategy (when applicable)
- acceptance criteria

---

## Analysis Output Format

Every analysis should contain:

1. Context
2. Current State
3. Findings
4. Risks
5. Options
6. Recommendation
7. Validation Plan

Analysis and implementation are separate activities.

---

## Authority Validation

Before evaluating evidence:

Determine the applicable authority hierarchy.

Authority assessment precedes evidence assessment.

---

## ADR Referencing Rule

AI assistants must not claim that a specific ADR is impacted, superseded, contradicted, or requires modification unless that ADR has been explicitly reviewed during the current analysis.

When repository evidence is incomplete, ADR references must be reported as potential candidates rather than confirmed impacts.

---

## Evidence Sufficiency Gate

Before entering impact analysis,
AI assistants must verify that sufficient
evidence has been reviewed.

Impact analysis must not be performed solely from:

- names
- labels
- file names
- directory structures
- technology references
- user assumptions

If evidence is insufficient:

STOP

Report:

- known facts
- assumptions
- unknowns

Request additional evidence.

Impact classification is prohibited until the
Evidence Sufficiency Gate is satisfied.

---

## User-Supplied Scope Evidence

Explicit information provided by the user regarding the intended scope of a change constitutes admissible evidence for governance classification.

Examples:

- "Fix typo in README"
- "Rename variable"
- "Update comment"
- "Change button color"
- "Correct translation"
- "Summarise chapter three"

The AI may use the declared scope to determine proportional governance requirements.

Hidden impacts must not be assumed unless available evidence directly contradicts the declared scope.

Repository inspection becomes mandatory only when:

- the requested change is ambiguous
- available evidence contradicts the declared scope
- the requested action could reasonably affect architecture,
  knowledge integrity,
  runtime behaviour,
  security,
  governance,
  persistence,
  networking,
  authorization,
  authentication,
  infrastructure,
  or architectural constraints

The Evidence Sufficiency Gate prohibits unsupported technical or conceptual inferences, not the use of explicit user-provided information.

---

## Evidence Assessment

All findings must identify:

- evidence sources
- highest evidence level
- missing evidence

Use the project's Evidence Classification Model.

Conclusions without identified evidence levels are considered incomplete.

---

## Confidence Assessment

All findings and recommendations must include:

- confidence level
- confidence justification
- known limitations

Confidence must be evaluated independently from evidence level.

High evidence does not automatically imply high confidence.

Missing evidence must reduce confidence.

Confidence levels:

- INSUFFICIENT
- LOW
- MEDIUM
- HIGH
- VERY HIGH

---

## Governance Conflict Detection

If multiple authoritative sources provide incompatible guidance:

Activate the AI Skill responsible for governance conflict resolution. (e.g. governance_arbiter or  authority_resolver)

Do not silently choose one source.

Determine:

- authority hierarchy
- evidence levels
- confidence levels

Document the rationale.

If authority cannot be determined:

STOP.

Request clarification.

---

## ADR Validation

When ADRs are referenced:

Verify the status of the referenced ADR using the project's authoritative architectural documentation e.g.
  docs/architecture/ADR_INDEX.md (when applicable)

or

Determine authority using:
  docs/governance/AUTHORITY_HIERARCHY.md

Do not assume referenced ADRs remain active.

---

## Skill Validation

Before activating specialised skills:

Verify that:

- the required AI Skill exists
- the Skill is applicable to the current task
- the Skill is compatible with the current governance constraints

using:
using the project's Skill Registry e.g.
  docs/governance/SKILL_REGISTRY.md
