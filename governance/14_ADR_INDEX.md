# ADR Index
(Mainly focus on DevSecOps: Index of Architectural Decision Records)

## Purpose
This document is the authoritative index of all Architectural Decision Records (ADRs) within this project.

The objective is to:

- identify active ADRs
- identify superseded ADRs
- identify deprecated ADRs
- identify ADR relationships
- improve governance consistency
- improve AI reasoning reliability

Architectural decision reviews should consult this index before evaluating architectural decisions.

---

## Fundamental Principles

Architecture is governed by approved ADRs.

Not all ADRs have equal status.

An ADR may be:

- PROPOSED
- APPROVED
- SUPERSEDED
- DEPRECATED

Only APPROVED ADRs are considered authoritative.

---

## ADR Lifecycle

### PROPOSED

Status: PROPOSED

Meaning: Draft ADR. Not authoritative. May be discussed. May not govern implementation.

### APPROVED

Status: APPROVED

Meaning: Approved ADR. Authoritative. May govern architecture.

### SUPERSEDED

Status: SUPERSEDED

Meaning: Replaced by another ADR. Historical reference only. Not authoritative.

### DEPRECATED

Status: DEPRECATED

Meaning: No longer recommended. Historical reference only. Not authoritative.

---

## ADR Registry


### Backend — Java/Maven Multi-Module

| ADR | Status | Category | Scope | Date | Title |
|-----|--------|----------|-------|------|-------|
| ADR-0033 | APPROVED | GOVERNANCE | System | 2026-06-17 | Taxonomía Oficial de Clasificación y Etiquetado de ADRs |
| ADR-0600 | APPROVED | ARCHITECTURE | System | 2026-06-11 | Estrategia de Despliegue: Arquitectura de Microservicios Independientes basados en Maven Multi-Module |
| ADR-0601 | APPROVED | ARCHITECTURE | System | 2026-06-11 | Estructura de Desacoplamiento de Capas mediante el Patrón Módulo-Commons |
| ADR-0602 | APPROVED | ARCHITECTURE | System | 2026-06-11 | Estrategia de Comunicación Inter-Servicio en Arquitectura de Microservicios |
| ADR-0603 | APPROVED | DATABASE | Database | 2026-06-11 | Políticas de Gestión de Bases de Datos en Microservicios |
| ADR-0604 | APPROVED | ARCHITECTURE | System | 2026-07-16 | Patrón de Composición del API Gateway para Agregación de Datos Multi-Microservicio (BFF) |
| ADR-0605 | APPROVED | SECURITY | System | 2026-07-20 | Modelo de Autorización RBAC por Prefijo de Ruta en el API Gateway |
| ADR-0606 | APPROVED | ARCHITECTURE | System | 2026-07-22 | Patrón de Campos de Auditoría en Entidades de Negocio |
| ADR-0607 | APPROVED | ARCHITECTURE | System | 2026-08-14 | Introducción del Microservicio `gda-comunicacion` para Noticias y Eventos (Espacio Justicia) |
| ADR-0608 | APPROVED | INFRASTRUCTURE | System | 2026-08-14 | Estrategia de Almacenamiento de Adjuntos de Noticia (Espacio Justicia) |

### Deployment & Frontend Strategy

| ADR | Status | Category | Scope | Date | Title |
|-----|--------|----------|-------|------|-------|
| ADR-0801 | APPROVED | DEPLOYMENT | Infrastructure | 2026-06-11 | Estrategia de Empaquetado y Despliegue con Contenedores Docker |
| ADR-0802 | PROPOSED | ARCHITECTURE | System | 2026-06-11 | Lineamientos de Integración Frontend con Microservicios Backend |
| ADR-0803 | PROPOSED | SECURITY | Infrastructure | 2026-06-11 | Estrategias de Seguridad y Gestión de Secretos en Microservicios |
| ADR-0804 | PROPOSED | ARCHITECTURE | System | 2026-08-17 | Espacio Justicia como Frontend Alternativo a `GDA/frontend` — Repositorio, Stack y Entorno de Desarrollo |

---

## Active ADRs — Summary by Category

### ✅ ARCHITECTURE (APPROVED)
ADR-0001, ADR-0002, ADR-0008, ADR-0600, ADR-0601, ADR-0602, ADR-0604, ADR-0606, ADR-0607, ADR-0802, ADR-0804

### ✅ RUNTIME (APPROVED)
ADR-0003, ADR-0005, ADR-0010, ADR-0011, ADR-0012, ADR-0017, ADR-0027

### ✅ INFRASTRUCTURE (APPROVED)
ADR-0004, ADR-0014, ADR-0015, ADR-0028, ADR-0608

### ✅ SECURITY (APPROVED)
ADR-0013, ADR-0016, ADR-0018, ADR-0020, ADR-0021, ADR-0022, ADR-0023, ADR-0024, ADR-0025, ADR-0032, ADR-0605, ADR-0803

### ✅ DATABASE (APPROVED)
ADR-0009, ADR-0603

### ✅ DEPLOYMENT (APPROVED)
ADR-0801

### ✅ TESTING (APPROVED)
ADR-0019, ADR-0026

### ✅ GOVERNANCE (APPROVED)
ADR-0000, ADR-0007, ADR-0029, ADR-0030, ADR-0031, ADR-0033

---

## Deprecated ADRs

| ADR | Status | Category | Scope | Date | Title |
|-----|--------|----------|-------|------|-------|
| ADR-0006 | DEPRECATED | GOVERNANCE | Infrastructure | 2026-05-04 | Gobernanza de imagen base monitoring-base (Rechazado) |

---

## ADR Conflict Resolution

If two ADRs appear to conflict:

1. Check ADR_INDEX.md for status
2. Verify supersession chain
3. Only APPROVED ADRs are authoritative
4. PROPOSED ADRs cannot override APPROVED ADRs
5. Escalate according to the project's governance process (e.g. Governance Arbiter)

Do not assume newer ADRs automatically override older ADRs.

---

## ADR Authority Rules

Only ADRs with Status: APPROVED are authoritative.

- PROPOSED ADRs: Not authoritative
- SUPERSEDED ADRs: Not authoritative
- DEPRECATED ADRs: Not authoritative

---

## AI Governance Rule

AI assistants must consult this ADR_INDEX.md before:

- reviewing architectural decisions
- reviewing architecture
- producing implementation recommendations
- evaluating architectural authority

Failure to verify ADR status may produce invalid conclusions.

---

## Maintenance Rules

Every ADR creation must update: ADR_INDEX.md
Every ADR status change must update: ADR_INDEX.md
Every ADR supersession must update: ADR_INDEX.md

ADR changes are incomplete until ADR_INDEX.md is updated.

### Verification (run before closing any ADR-related task)

This project has no CI pipeline — the AI assistant (or the user) is the validation gate (see `AI_ENTRYPOINT.md` § Self-Review Gate). These two one-line checks make that gate concrete instead of purely aspirational. Run from the repository root:

**1. Every ADR file has exactly one row in the registry table:**
```bash
diff <(ls docs/decisiones/ADR-*.md | xargs -n1 basename | sed -E 's/^(ADR-[0-9]+).*/\1/' | sort) \
     <(grep -oE "^\| ADR-[0-9]+" ai/governance/14_ADR_INDEX.md | tr -d '| ' | sort)
```
Empty output = every ADR file has exactly one table row (no missing, no orphaned rows).

**2. Every APPROVED ADR in the table appears in the category summary:**
```bash
adrs=$(grep -oE "^\| ADR-[0-9]+ \| APPROVED" ai/governance/14_ADR_INDEX.md | grep -oE "ADR-[0-9]+")
section=$(sed -n '/## Active ADRs/,/^## Deprecated/p' ai/governance/14_ADR_INDEX.md)
for adr in $adrs; do echo "$section" | grep -q "$adr" || echo "MISSING: $adr"; done
```
No output = every APPROVED ADR appears in some category bucket.

Both checks were validated against this repository's actual state (2026-07-28) and caught two real gaps before this rule existed: ADR-1100–1103 missing from the table entirely, and ADR-1101 missing from its category bucket.

---

## Final Principle

The ADR repository contains architectural history.

ADR_INDEX.md identifies architectural authority.
