# Authority Hierarchy
(General Purpose Use: Which document takes precedence when there is a conflict? - describes which sources hold decision-making authority)

## Purpose

This document defines the authoritative hierarchy used by AI assistants operating within this project.

The objective is to:

- resolve governance conflicts
- determine source precedence
- prevent contradictory decisions
- ensure architectural consistency
- provide deterministic conflict resolution

This hierarchy applies whenever two or more sources provide incompatible guidance.

---

## Fundamental Principle

Authority must be resolved before analysis, recommendations, implementation, or execution.

When conflicts exist:

1. Determine authority.
2. Determine evidence.
3. Determine confidence.
4. Produce conclusions.

Never invert this order.

---

## Authority Levels

The following hierarchy is mandatory.

Higher levels supersede lower levels.

---

Level 1

Explicit User Instructions

Examples:

- direct requests
- approved exceptions
- approved implementation scope
- approved operational decisions

Notes:

User instructions always take precedence unless they would violate mandatory platform restrictions.

---

Level 2

Approved Architectural Decisions (e.g. ADRs)

Authority must be determined using the project's architectural decision registry (e.g. docs/architecture/ADR_INDEX.md).

Only architectural decisions classified as APPROVED are authoritative.

PROPOSED, SUPERSEDED and DEPRECATED decisions are historical records.

---

Level 3

Core Governance Documents

Examples:

- 01_AI_CONSTITUTION.md
- 02_DEVSECOPS_PRINCIPLES.md
- 04_ARCHITECTURE_GUIDELINES.md  (when applicable)
- 05_ANALYSIS_PROTOCOL.md
- 07_SKILL_ACTIVATION_MODEL.md
- 08_TASK_CLASSIFICATION.md
- 10_EVIDENCE_MODEL.md
- 11_CONFIDENCE_MODEL.md
- 13_AUTHORITY_HIERARCHY.md
- 14_ADR_INDEX.md  (when applicable)
- 16_SKILL_REGISTRY.md
- 17_SKILL_LIFECYCLE.md
- 19_AI_DECISION_REGISTRY.md
- 20_EXECUTION_PROTOCOL.md  (when applicable)
- 22_USER_PREFERENCES.md
- 23_PROMPTING_GUIDE.md

Notes:

Core governance defines how decisions are made.

Core governance does not redefine architecture.

---

Level 4

Governance Skills

Only ACTIVE AI Skills registered in the project's Skill Registry (e.g. docs/governance/SKILL_REGISTRY.md) may provide specialised guidance within their defined domains.

AI Skills apply governance through specialised capabilities.

They do not create authority and they do not modify the authority hierarchy.

---

Level 5

Approved Correction Plans

Examples:

- correction roadmaps
- remediation plans
- approved backlog items

Notes:

Correction plans describe intended change.

Correction plans do not create architecture.

Correction plans do not override ADRs.

---

Level 6

Project Documentation

Examples:

- implementation status
- project documentation
- technical procedures
- operational procedures
- academic documentation
- learning materials

Notes:

Project documentation describes the project from different perspectives.

Documentation may describe architecture, implementation, knowledge or learning materials, but it does not by itself establish architectural authority.

---

Level 7

Observed State

Examples:

- runtime behaviour
- observed project state
- generated outputs
- operational state
- knowledge graph contents

Notes:

Observed state constitutes evidence.

Observed state is not governance.

Observed state may be inconsistent with the project's authoritative documentation.

---

Level 8

Analysis Outputs

Examples:

- reports
- reviews
- recommendations
- assessments

Notes:

Analysis outputs are advisory.

Analysis outputs do not create authority.

---

Level 9

Assumptions

Examples:

- inferred behaviour
- expectations
- predictions
- hypotheses

Notes:

Assumptions have no governance authority.

Assumptions require validation.

---

## Conflict Resolution Rules

### Rule 1

Higher authority wins.

Example:

ADR conflicts with implementation.

Result:

ADR governs.

The implementation or project state becomes a compliance issue.

---

### Rule 2

Newer documents do not automatically override older documents.

Authority level takes precedence over document age.

---

### Rule 3

Evidence does not create authority.

Runtime observations may reveal non-compliance.

Runtime observations do not redefine governance.

---

### Rule 4

AI Skills do not create governance.

AI Skills apply and interpret governance within their domain of expertise.

AI Skills cannot override governance.

---

### Rule 5

Correction plans do not create architecture.

Architecture remains governed by ADRs.

---

### Rule 6

Analysis does not create authority.

Recommendations require approval before becoming authoritative.

---

## Escalation Conditions

Escalation is required when:

- two ADRs conflict
- authority level cannot be determined
- supersession status is unclear
- governance documents conflict
- evidence is insufficient

In such cases:

STOP.

Request clarification.

Do not invent a resolution.

---

## Relationship With Governance Arbiter

Any governance conflict resolution mechanism (e.g. governance_arbiter or authority_resolver) shall use this hierarchy to resolve conflicts.

The Governance Arbiter may:

- identify governing sources
- identify superseded sources
- identify missing governance

The Governance Arbiter may not:

- create authority
- override authority
- redefine architecture

---

## Final Principle

Authority first.

Evidence second.

Confidence third.

Implementation last.
