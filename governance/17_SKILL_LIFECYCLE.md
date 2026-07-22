# Skill Lifecycle Management
(General Purpose Use: How AI Skills evolve - describes how AI capabilities evolve over time)

## Purpose

This document defines how AI Skills are created, reviewed, activated, superseded and retired throughout their lifecycle.

---

## Lifecycle States

PROPOSED

ACTIVE

DEPRECATED

SUPERSEDED

ARCHIVED

---

## Creation Process

Requirements:

- documented purpose
- owner
- version
- governance alignment
- Skill Registry entry

Until completed:

Status = PROPOSED

---

## Activation Process

Requirements:

- governance review
- Skill Registry entry
- required metadata completed

Result:

Status = ACTIVE

---

## Review Process

Triggers:

- architectural decision changes (when applicable)
- governance changes
- scheduled review
- incident review

Review should evaluate:

- continued relevance
- correctness
- governance compliance
- consistency with current project objectives

---

## Deprecation Process

Triggers:

- replacement available
- governance changes
- obsolete functionality
- no longer aligned with project objectives

Status:

DEPRECATED

---

## Supersession Process

Requirements:

- replacement identified
- corresponding Skill Registry entry updated

Status:

SUPERSEDED

---

## Archival Process

Requirements:

- no active project value
- retained for historical traceability

Status:

ARCHIVED

---

## Governance Rule

Skill lifecycle changes are incomplete until the corresponding Skill Registry (e.g. SKILL_REGISTRY.md) entry has been updated.

---

## Final Principle

Skills are governed AI capabilities.

Their capabilities may evolve, but their governance and lifecycle must remain traceable.
