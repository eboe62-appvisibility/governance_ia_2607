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

## Maintenance Rules

Every Skill creation must update: 16_SKILL_REGISTRY.md
Every Skill status change must update: 16_SKILL_REGISTRY.md
Every Skill supersession must update: 16_SKILL_REGISTRY.md

Skill changes are incomplete until 16_SKILL_REGISTRY.md is updated.

### Verification (run before closing any Skill-related task)

This project has no CI pipeline — the AI assistant (or the user) is the validation gate (see `AI_ENTRYPOINT.md` § Self-Review Gate). These two one-line checks make that gate concrete instead of purely aspirational. Run from the repository root:

**1. Every skill file has exactly one row in the registry table:**
```bash
diff <(find ai/skills -name "*.md" ! -iname "* copy*" -exec basename {} .md \; | sort) \
     <(sed -n '/### Registered Skills/,/^Note:/p' ai/governance/16_SKILL_REGISTRY.md | grep '^|' | tail -n +3 | awk -F'|' '{gsub(/^ +| +$/,"",$2); print $2}' | sort)
```
Empty output = every skill file has exactly one table row (no missing, no orphaned rows).

**2. Every skill's own Status matches its row in the registry table:**
```bash
for f in $(find ai/skills -name "*.md" ! -iname "* copy*"); do
  name=$(basename "$f" .md)
  file_status=$(tr -d '\r' < "$f" | awk '/^Status:$/{getline; print; exit}')
  table_status=$(grep "^| $name |" ai/governance/16_SKILL_REGISTRY.md | awk -F'|' '{gsub(/^ +| +$/,"",$3); print $3}')
  [ "$file_status" = "$table_status" ] || echo "DRIFT: $name (file=$file_status, table=$table_status)"
done
```
No output = every skill's declared Status matches the registry. (`tr -d '\r'` guards against CRLF line endings, present in some skill files.)

---

## Final Principle

Skills require governance.

Governance requires traceability.

Traceability enables trustworthy AI behaviour.
