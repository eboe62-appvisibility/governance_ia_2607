# Skill Activation Model
(Which specialists to activate - describes which specialised capabilities should be activated)

## Purpose

This document defines how AI assistants must select, activate and coordinate specialist skills during analysis and task execution.

The objective is to ensure:

- consistent governance enforcement
- proportional review depth
- evidence-based reviewer selection
- avoidance of unnecessary review overhead

This document is normative.

---

## Relationship with Governance Hierarchy

This document does not override:

- Explicit User Instructions
- Project Authoritative Documentation
- AI Constitution
- Project Governance

Skill activation decisions must always respect the project governance hierarchy.

---

## Core Principle

AI Skills are independent specialised capabilities.

A Skill provides domain expertise required to perform one or more specific tasks.

Skills may analyse, review, teach, explain, classify, translate, generate or validate information depending on the current context.

The existence of a skill does not imply that the skill must participate in every task.

Skill activation must always be:

- evidence-based
- scope-driven
- risk-aware
- context-dependent

---

## Independence Rule

Skills do not form a fixed execution pipeline or workflow.

Activating one Skill does not automatically require any other Skill to be activated.

Examples:

- A frontend styling change may not require backend review.
- A documentation update may not require security review.
- A Docker runtime modification may not require frontend review.

AI assistants must not invent mandatory reviewer chains unless explicitly defined by repository governance or user instructions.

---

## Skill Selection Criteria

AI assistants should activate skills based on:

### Scope

Which project domains are affected?

Examples:

Examples:

- infrastructure
- software
- backend
- frontend
- governance
- architecture
- documentation
- language
- history
- geography
- engineering
- research

### Risk

What is the operational impact?

Examples:

- low-risk documentation change
- security-sensitive modification
- production runtime change
- architectural redesign

### Evidence

What evidence demonstrates skill relevance?

Examples:

- affected files
- repository findings
- runtime findings (when applicable)
- authoritative documents
- architectural boundaries

User-declared scope is valid evidence for determining review proportionality.

When a user explicitly states that a change is limited to:

- documentation
- comments
- formatting
- typo corrections
- naming cleanup

the AI may classify governance requirements according to that declared scope unless repository evidence demonstrates a broader impact.

The absence of repository inspection does not automatically force an Unknown classification when the requested change scope is explicit and unambiguous.

### Objectives

What is the user attempting to achieve?

Examples:

- implementation
- review
- audit
- hardening
- troubleshooting
- architectural assessment

---

## Minimal Activation Principle

Activate only the Skills required to perform the requested task completely and reliably.

Avoid activating reviewers that do not contribute meaningful analysis.

Unnecessary reviewer activation increases complexity and may introduce noise.

---

## Cross-Domain Reviews

Multiple Skills may be activated when a task spans multiple knowledge domains.

Examples:

### Software + Security

- security_reviewer
- architecture_reviewer

### Architecture + Quality

- architecture_reviewer
- quality_reviewer

### Language + Culture

- linguistics_specialist
- cultural_reviewer

### Geography + Engineering

- geography_specialist
- engineering_specialist

The AI assistant must justify why multiple skills are relevant.

---

## Skill Conflict Resolution

Skills provide specialised recommendations.

Skills do not possess independent decision authority.

When reviewer conclusions appear to conflict:

1. Verify available evidence.
2. Verify applicable authoritative documentation.
3. Apply the governance hierarchy.
4. Explicitly identify the conflict.
5. Request clarification if required.

Conflict resolution authority remains with:

- Explicit User Instructions
- Approved ADRs
- Repository Governance

---

## Architectural Reviews

Some tasks may require the activation of multiple complementary Skills.

However:

No Skill has automatic precedence over another Skill.

Examples:

Examples:

- architecture_reviewer
- governance_reviewer
- security_reviewer
- domain_specialist

must be selected based on relevance, not by default.

---

## Paradigm Change Assessments

When a proposal challenges established repository architecture, additional reviewers may become relevant.

Examples:

- Docker Compose to Kubernetes
- Single-node to multi-node
- Monolith to microservices
- Local execution to managed cloud services

Such situations may require broader architectural review.

However, reviewer activation remains evidence-based and context-dependent.

---

## Analysis Phase Behaviour

During analysis:

- identify relevant skills
- justify activation decisions
- document assumptions
- identify evidence gaps

Do not activate Skills unless they contribute meaningful expertise to the requested task.

---

## Execution Phase Behaviour

During execution:

- apply only the capabilities relevant to the approved scope
- avoid expanding reviewer participation without justification
- preserve scope boundaries

Skill activation must not be used to justify scope expansion.

---

## Validation Requirements

AI assistants should be able to explain:

- why a skill was activated
- why a skill was not activated
- what evidence justified the decision
- how the selected skills relate to the requested task

Skill activation decisions must remain transparent and traceable.

---

## Expected Outcome

The project should benefit from:

- proportional reviews
- consistent governance enforcement
- reduced review noise
- better architectural focus
- evidence-driven decision making

The goal is not activating the greatest possible number of Skills.

The goal is activating the right Skills for the requested task.
