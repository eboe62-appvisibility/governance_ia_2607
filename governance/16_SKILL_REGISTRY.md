# Skill Registry
(General Purpose Use: Catalog of available specialists - describes which AI capabilities are available)

## Purpose

This document is the authoritative registry of all AI Skills available within this project.

The objective is to:

- identify available Skills
- identify their lifecycle status
- identify ownership and maintenance responsibility
- identify governance dependencies
- identify capability scope
- improve traceability
- improve maintainability

All AI Skills must be registered.

Unregistered Skills are not considered part of the project's governed AI capabilities.

---

## Fundamental Principles

Skills are specialised AI capabilities.

Skills apply governance.

Skills do not create governance.

Skills must remain aligned with:

- Architectural Decisions (when applicable)
- Core Governance
- Authority Hierarchy

Skills may evolve, become obsolete or be replaced.

Skills require lifecycle management.

---

## Skill Lifecycle

An AI Skill may have one of the following lifecycle states:

PROPOSED

ACTIVE

DEPRECATED

SUPERSEDED

ARCHIVED

Only ACTIVE skills should be used.

---

## Status Definitions

### PROPOSED

Draft skill.

Under review.

Not authoritative.

---

### ACTIVE

Approved skill.

May be used.

Governance compliant at the time of its last review.

---

### DEPRECATED

Still functional.

Scheduled for removal.

Use discouraged.

---

### SUPERSEDED

Replaced by another skill.

Historical only.

Do not use.

---

### ARCHIVED

Retained only for historical traceability.

Do not use.

---

## Skill Registry Table

The following registry must be maintained.

Columns:

- Skill Name
- Status
- Owner
- Version
- Last Review
- Superseded By
- Governance Dependencies

Example:

| Skill | Status | Owner | Version | Last Review | Superseded By | Governance Dependencies |
|--------|--------|--------|--------|--------|--------|--------|
| governance_reviewer | ACTIVE | Architecture | 1.0 | 2026-06-01 | - | ADR-0018 |
| old_skill | SUPERSEDED | Architecture | 1.0 | 2026-01-01 | new_skill | ADR-0007 |

### Registered Skills

| Skill | Status | Owner | Version | Last Review | Superseded By | Governance Dependencies |
|--------|--------|--------|--------|--------|--------|--------|
| docker_hardening | ACTIVE | DevSecOps / Infraestructura | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 02_DEVSECOPS_PRINCIPLES |
| runtime_auditor | ACTIVE | DevSecOps / Infraestructura | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 02_DEVSECOPS_PRINCIPLES |
| observability_reviewer | ACTIVE | DevSecOps / Infraestructura | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 02_DEVSECOPS_PRINCIPLES |
| devsecops_architect | ACTIVE | DevSecOps / Infraestructura | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 02_DEVSECOPS_PRINCIPLES, ADR-0017 |
| resilience_and_rollback_reviewer | ACTIVE | DevSecOps / Infraestructura | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 02_DEVSECOPS_PRINCIPLES |
| architecture_reviewer | ACTIVE | Arquitectura y Gobernanza | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| governance_reviewer | ACTIVE | Gobernanza | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 13_AUTHORITY_HIERARCHY, 14_ADR_INDEX |
| dependency_governance_reviewer | ACTIVE | Arquitectura y Gobernanza | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| quality_attribute_reviewer | ACTIVE | Arquitectura y Gobernanza | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| threat_model_reviewer | ACTIVE | Arquitectura y Gobernanza | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| adr_author | ACTIVE | Gobernanza / Arquitectura | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 13_AUTHORITY_HIERARCHY, 14_ADR_INDEX |
| adr_reviewer | ACTIVE | Gobernanza / Arquitectura | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 13_AUTHORITY_HIERARCHY, 14_ADR_INDEX |
| governance_arbiter | ACTIVE | Gobernanza | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 13_AUTHORITY_HIERARCHY, 14_ADR_INDEX |
| elaborar_knowledge_assets | ACTIVE | Responsable de curación de conocimiento del proyecto | 1.0.0 | 2026-07-26 | - | ADR-1105 |
| api_gateway_reviewer | ACTIVE | Arquitectura Backend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| backend_security_reviewer | ACTIVE | Arquitectura Backend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| backend_testing_reviewer | ACTIVE | Arquitectura Backend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| jpa_reviewer | ACTIVE | Arquitectura Backend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| microservice_architect | ACTIVE | Arquitectura Backend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| spring_architect | ACTIVE | Arquitectura Backend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| accessibility_reviewer | ACTIVE | Arquitectura Frontend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| api_client_reviewer | ACTIVE | Arquitectura Frontend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| composables_reviewer | ACTIVE | Arquitectura Frontend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| frontend_architect | ACTIVE | Arquitectura Frontend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| frontend_security_reviewer | ACTIVE | Arquitectura Frontend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| frontend_testing_reviewer | ACTIVE | Arquitectura Frontend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| quasar_architect | ACTIVE | Arquitectura Frontend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| state_management_reviewer | ACTIVE | Arquitectura Frontend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |
| vue_architect | ACTIVE | Arquitectura Frontend | 1.0.0 | 2026-07-29 | - | 07_SKILL_ACTIVATION_MODEL, 16_SKILL_REGISTRY, 04_ARCHITECTURE_GUIDELINES |

Note: `.claude/skills/gda-modulo-crud` is intentionally NOT listed above — see "Claude Code Native Skills (Pending Classification)" below.

---

## Active Skills

This section contains all active skills.

Only active skills are considered governance-compliant.

Format:

Skill:
Status:
Owner:
Version:
Last Review:
Governance Dependencies:
Related Skills:

---

Skill:
docker_hardening
Status:
ACTIVE
Owner:
DevSecOps / Infraestructura
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/02_DEVSECOPS_PRINCIPLES.md
Related Skills:
NONE

---

Skill:
runtime_auditor
Status:
ACTIVE
Owner:
DevSecOps / Infraestructura
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/02_DEVSECOPS_PRINCIPLES.md
Related Skills:
NONE

---

Skill:
observability_reviewer
Status:
ACTIVE
Owner:
DevSecOps / Infraestructura
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/02_DEVSECOPS_PRINCIPLES.md
Related Skills:
NONE

---

Skill:
devsecops_architect
Status:
ACTIVE
Owner:
DevSecOps / Infraestructura
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/02_DEVSECOPS_PRINCIPLES.md, ADR-0017
Related Skills:
NONE

---

Skill:
resilience_and_rollback_reviewer
Status:
ACTIVE
Owner:
DevSecOps / Infraestructura
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/02_DEVSECOPS_PRINCIPLES.md
Related Skills:
NONE

---

Skill:
architecture_reviewer
Status:
ACTIVE
Owner:
Arquitectura y Gobernanza
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
NONE

---

Skill:
governance_reviewer
Status:
ACTIVE
Owner:
Gobernanza
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/13_AUTHORITY_HIERARCHY.md, ai/governance/14_ADR_INDEX.md
Related Skills:
adr_reviewer

---

Skill:
dependency_governance_reviewer
Status:
ACTIVE
Owner:
Arquitectura y Gobernanza
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
NONE

---

Skill:
quality_attribute_reviewer
Status:
ACTIVE
Owner:
Arquitectura y Gobernanza
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
NONE

---

Skill:
threat_model_reviewer
Status:
ACTIVE
Owner:
Arquitectura y Gobernanza
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
NONE

---

Skill:
adr_author
Status:
ACTIVE
Owner:
Gobernanza / Arquitectura
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/13_AUTHORITY_HIERARCHY.md, ai/governance/14_ADR_INDEX.md
Related Skills:
adr_reviewer

---

Skill:
adr_reviewer
Status:
ACTIVE
Owner:
Gobernanza / Arquitectura
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/13_AUTHORITY_HIERARCHY.md, ai/governance/14_ADR_INDEX.md
Related Skills:
adr_author

---

Skill:
governance_arbiter
Status:
ACTIVE
Owner:
Gobernanza
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/13_AUTHORITY_HIERARCHY.md, ai/governance/14_ADR_INDEX.md
Related Skills:
NONE

---

Skill:
elaborar_knowledge_assets
Status:
ACTIVE
Owner:
Responsable de curación de conocimiento del proyecto
Version:
1.0.0
Last Review:
2026-07-26
Governance Dependencies:
ADR-1105
Related Skills:
NONE

---

Skill:
api_gateway_reviewer
Status:
ACTIVE
Owner:
Arquitectura Backend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
NONE

---

Skill:
backend_security_reviewer
Status:
ACTIVE
Owner:
Arquitectura Backend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
NONE

---

Skill:
backend_testing_reviewer
Status:
ACTIVE
Owner:
Arquitectura Backend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
NONE

---

Skill:
jpa_reviewer
Status:
ACTIVE
Owner:
Arquitectura Backend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
spring_architect

---

Skill:
microservice_architect
Status:
ACTIVE
Owner:
Arquitectura Backend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
NONE

---

Skill:
spring_architect
Status:
ACTIVE
Owner:
Arquitectura Backend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
microservice_architect

---

Skill:
accessibility_reviewer
Status:
ACTIVE
Owner:
Arquitectura Frontend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
frontend_testing_reviewer, frontend_security_reviewer

---

Skill:
api_client_reviewer
Status:
ACTIVE
Owner:
Arquitectura Frontend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
NONE

---

Skill:
composables_reviewer
Status:
ACTIVE
Owner:
Arquitectura Frontend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
api_client_reviewer, state_management_reviewer, frontend_security_reviewer

---

Skill:
frontend_architect
Status:
ACTIVE
Owner:
Arquitectura Frontend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
state_management_reviewer, api_client_reviewer, frontend_security_reviewer

---

Skill:
frontend_security_reviewer
Status:
ACTIVE
Owner:
Arquitectura Frontend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
api_client_reviewer

---

Skill:
frontend_testing_reviewer
Status:
ACTIVE
Owner:
Arquitectura Frontend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
composables_reviewer, state_management_reviewer, api_client_reviewer, accessibility_reviewer, frontend_security_reviewer

---

Skill:
quasar_architect
Status:
ACTIVE
Owner:
Arquitectura Frontend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
accessibility_reviewer, state_management_reviewer, frontend_security_reviewer

---

Skill:
state_management_reviewer
Status:
ACTIVE
Owner:
Arquitectura Frontend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
frontend_security_reviewer, api_client_reviewer, composables_reviewer

---

Skill:
vue_architect
Status:
ACTIVE
Owner:
Arquitectura Frontend
Version:
1.0.0
Last Review:
2026-07-29
Governance Dependencies:
ai/governance/07_SKILL_ACTIVATION_MODEL.md, ai/governance/16_SKILL_REGISTRY.md, ai/governance/04_ARCHITECTURE_GUIDELINES.md
Related Skills:
composables_reviewer, state_management_reviewer, frontend_security_reviewer

---

## Deprecated Skills

Format:

Skill:
Reason:
Replacement:

---

## Superseded Skills

Format:

Skill:
Superseded By:
Reason:

---

## Archived Skills

Format:

Skill:
Archive Date:
Reason:

---

## Claude Code Native Skills (Pending Classification)

This project also contains Claude Code native skills under `.claude/skills/`, discovered and invoked automatically by the harness based on each skill's own `description` field — a different activation mechanism than the `ai/skills/` specialist personas catalogued above, which are loaded by AI judgement during analysis.

These skills are not yet incorporated into the lifecycle model of this registry.

| Skill | Location | Status |
|--------|--------|--------|
| gda-modulo-crud | .claude/skills/gda-modulo-crud/SKILL.md | PENDING CLASSIFICATION |

---

## Governance Rule

Every governed AI Skill must appear in this registry.

AI capabilities that are not registered are considered unmanaged.

Unmanaged Skills should not be relied upon for project governance.

---

## Review Rule

Every ACTIVE Skill must define at least:

- owner
- version
- last review date
- governance dependencies

Missing metadata indicates governance drift.

---

## ADR Dependency Rule

Skills must identify:

- governing architectural decisions (when applicable)
- governance dependencies

When a governing document changes, affected Skills should be reviewed to ensure continued consistency.

---

## AI Governance Rule

AI assistants should consult this registry before:

- introducing new Skills
- modifying existing Skills
- retiring Skills
- selecting Skills for task execution
- evaluating Skill applicability

---

## Final Principle

Skills require governance.

Governance requires traceability.

Traceability enables trustworthy AI behaviour.
