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
