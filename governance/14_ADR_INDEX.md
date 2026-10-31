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

Integral registry: it lists the ADRs of every project that shares this governance.
Each ADR is authoritative only within the scope of its own project, except the
cross-project (transversal) ADRs, which apply to all of them.

### Cross-project (transversal)

| ADR | Status | Category | Scope | Date | Title |
|-----|--------|----------|-------|------|-------|
| ADR-0033 | APPROVED | GOVERNANCE | System | 2026-06-17 | Taxonomía Oficial de Clasificación y Etiquetado de ADRs |

### Project: server_monitoring_2509 (Platform: Docker Compose, Python, IaC)

| ADR | Status | Category | Scope | Date | Title |
|-----|--------|----------|-------|------|-------|
| ADR-0000 | APPROVED | GOVERNANCE | System | 2026-01-24 | Trabajo paralelo fuera de Git durante refactor estructural |
| ADR-0001 | APPROVED | ARCHITECTURE | Runtime | 2025-12-09 | Verificación de imports durante la fase de migración |
| ADR-0002 | APPROVED | ARCHITECTURE | Runtime | 2026-01-25 | Scripts como wrappers operativos |
| ADR-0003 | APPROVED | RUNTIME | Runtime | 2026-01-25 | Desacoplamiento de configuración y ejecución en runtime |
| ADR-0004 | APPROVED | INFRASTRUCTURE | Infrastructure | 2026-01-27 | Eliminación del atributo version en docker-compose (Docker Compose v2) |
| ADR-0005 | APPROVED | RUNTIME | Runtime | 2026-01-27 | Desacoplamiento runtime y lazy imports en config (Runtime desacoplado) |
| ADR-0007 | APPROVED | GOVERNANCE | System | 2026-02-16 | Política oficial de entorno VS Code + WSL para proyectos Linux/DevOps |
| ADR-0008 | APPROVED | ARCHITECTURE | Infrastructure | 2026-02-17 | Clasificación de servicios: Micro-stack vs Infraestructura Operativa |
| ADR-0009 | APPROVED | DATABASE | Database | 2026-03-05 | Estrategia de Backups PostgreSQL |
| ADR-0010 | APPROVED | RUNTIME | Runtime | 2026-03-05 | Arquitectura de runtime cron |
| ADR-0011 | APPROVED | RUNTIME | Runtime | 2026-03-05 | Python Runtime Execution Model (Determinismo) |
| ADR-0012 | APPROVED | RUNTIME | Runtime | 2026-03-12 | Separation of Host Cron vs Monitoring Cron (Runtime reproducible) |
| ADR-0013 | APPROVED | SECURITY | Infrastructure | 2026-03-14 | Credential Management Policy |
| ADR-0014 | APPROVED | INFRASTRUCTURE | Infrastructure | 2026-03-14 | Docker Port Exposure Policy |
| ADR-0015 | APPROVED | INFRASTRUCTURE | Infrastructure | 2026-03-14 | Docker Network Exposure Model |
| ADR-0016 | APPROVED | SECURITY | Infrastructure | 2026-05-06 | Política de aislamiento y segmentación de redes Docker |
| ADR-0017 | APPROVED | RUNTIME | Runtime | 2026-04-01 | Resilience model at docker single-node |
| ADR-0018 | APPROVED | SECURITY | Runtime | 2026-04-05 | Modelo de Seguridad Runtime Docker y Requisitos de Resiliencia |
| ADR-0019 | APPROVED | TESTING | Runtime | 2026-04-25 | Resilience Testing Strategy |
| ADR-0020 | APPROVED | SECURITY | Runtime | 2026-05-04 | Container Execution Model & Privilege Strategy |
| ADR-0021 | APPROVED | SECURITY | Infrastructure | 2026-05-04 | Network Segmentation Strategy |
| ADR-0022 | APPROVED | SECURITY | Runtime | 2026-05-08 | Promtail Privilege Approval |
| ADR-0023 | APPROVED | SECURITY | Infrastructure | 2026-05-08 | Egress Control for restricted-net (Propuesto) |
| ADR-0024 | APPROVED | SECURITY | Runtime | 2026-05-09 | Container Privilege Exception Policy (Mínimo privilegio contextual) |
| ADR-0025 | APPROVED | SECURITY | Runtime | 2026-05-13 | Modelo SMTP explícito y endurecimiento de configuración (Endurecimiento SMTP) |
| ADR-0026 | APPROVED | TESTING | Runtime | 2026-05-13 | Estrategia de validación y testing del modelo SMTP (Estrategia de validación multinivel) |
| ADR-0027 | APPROVED | RUNTIME | Runtime | 2026-05-17 | Tipología oficial de contenedores y política de healthchecks |
| ADR-0028 | APPROVED | INFRASTRUCTURE | Infrastructure | 2026-05-18 | Política de reproducibilidad Docker y endurecimiento de validaciones IaC |
| ADR-0029 | APPROVED | GOVERNANCE | Infrastructure | 2026-05-20 | Structured Compose Policy Audit |
| ADR-0030 | APPROVED | GOVERNANCE | Runtime | 2026-05-23 | Auditoría Runtime HostConfig y Visibilidad de Privilegios Docker |
| ADR-0031 | APPROVED | GOVERNANCE | Runtime | 2026-05-26 | Gobernanza Runtime Docker y Clasificación de Dependencias Host |
| ADR-0032 | APPROVED | SECURITY | Database | 2026-05-31 | Endurecimiento de gestión de secretos PostgreSQL y validaciones CI |
| ADR-0034 | APPROVED | PROCESS | Process | 2026-10-30 | Política de ramas, promoción y despliegue a PRO |

### Project: GDA — Backend (Java/Maven Multi-Module)

| ADR | Status | Category | Scope | Date | Title |
|-----|--------|----------|-------|------|-------|
| ADR-0600 | APPROVED | ARCHITECTURE | System | 2026-06-11 | Estrategia de Despliegue: Arquitectura de Microservicios Independientes basados en Maven Multi-Module |
| ADR-0601 | APPROVED | ARCHITECTURE | System | 2026-06-11 | Estructura de Desacoplamiento de Capas mediante el Patrón Módulo-Commons |
| ADR-0602 | APPROVED | ARCHITECTURE | System | 2026-06-11 | Estrategia de Comunicación Inter-Servicio en Arquitectura de Microservicios |
| ADR-0603 | APPROVED | DATABASE | Database | 2026-06-11 | Políticas de Gestión de Bases de Datos en Microservicios |
| ADR-0604 | APPROVED | ARCHITECTURE | System | 2026-07-16 | Patrón de Composición del API Gateway para Agregación de Datos Multi-Microservicio (BFF) |
| ADR-0605 | APPROVED | SECURITY | System | 2026-07-20 | Modelo de Autorización RBAC por Prefijo de Ruta en el API Gateway |
| ADR-0606 | APPROVED | ARCHITECTURE | System | 2026-07-22 | Patrón de Campos de Auditoría en Entidades de Negocio |
| ADR-0608 | APPROVED | INFRASTRUCTURE | System | 2026-08-14 | Estrategia de Almacenamiento de Adjuntos de Noticia (Espacio Justicia) |
| ADR-0609 | APPROVED | ARCHITECTURE | System | 2026-08-20 | Segregación de Espacio Justicia en un Backend Independiente ("SPJ") |
| ADR-0610 | APPROVED | ARCHITECTURE | System | 2026-08-25 | Modelo de Identidad Multi-Aplicación en `gda-autenticacion` |

### Project: GDA — Deployment & Frontend Strategy

| ADR | Status | Category | Scope | Date | Title |
|-----|--------|----------|-------|------|-------|
| ADR-0801 | APPROVED | DEPLOYMENT | Infrastructure | 2026-06-11 | Estrategia de Empaquetado y Despliegue con Contenedores Docker |
| ADR-0802 | PROPOSED | ARCHITECTURE | System | 2026-06-11 | Lineamientos de Integración Frontend con Microservicios Backend |
| ADR-0803 | PROPOSED | SECURITY | Infrastructure | 2026-06-11 | Estrategias de Seguridad y Gestión de Secretos en Microservicios |
| ADR-0804 | PROPOSED | ARCHITECTURE | System | 2026-08-17 | Espacio Justicia como Frontend Alternativo a `GDA/frontend` — Repositorio, Stack y Entorno de Desarrollo |

### Project: Knowledge Repository

| ADR | Status | Category | Scope | Date | Title |
|-----|--------|----------|-------|------|-------|
| ADR-1100 | APPROVED | KNOWLEDGE | Knowledge | 2026-07-26 | Knowledge Repository — Ubicación Física y Convención de Nombres de Knowledge Assets |
| ADR-1101 | APPROVED | ARCHITECTURE | System | 2026-07-26 | Migración de Fuentes Primarias Ubicadas en asignaturas/ y Convención de Nombres en fuentes/ |
| ADR-1102 | APPROVED | PROCESS | System | 2026-07-26 | Modelo de Ramas — Gobernanza vs. Contenido (Fuentes/Conocimiento) |
| ADR-1103 | APPROVED | PROCESS | System | 2026-07-26 | Procedimiento Validado de Integración de Ramas (develop → master) |
| ADR-1104 | APPROVED | KNOWLEDGE | Knowledge | 2026-07-26 | Ampliación del vocabulario Domain y Tags a partir de la cobertura temática del corpus 260726_ABC |
| ADR-1105 | APPROVED | KNOWLEDGE | Knowledge | 2026-07-26 | Procedimiento de Elaboración y Verificación de Knowledge Assets por Lotes |

---

## Active ADRs — Summary by Category

### ✅ ARCHITECTURE (APPROVED)
ADR-0001, ADR-0002, ADR-0008, ADR-0600, ADR-0601, ADR-0602, ADR-0604, ADR-0606, ADR-0609, ADR-0610, ADR-1101

### ✅ RUNTIME (APPROVED)
ADR-0003, ADR-0005, ADR-0010, ADR-0011, ADR-0012, ADR-0017, ADR-0027

### ✅ INFRASTRUCTURE (APPROVED)
ADR-0004, ADR-0014, ADR-0015, ADR-0028, ADR-0608

### ✅ SECURITY (APPROVED)
ADR-0013, ADR-0016, ADR-0018, ADR-0020, ADR-0021, ADR-0022, ADR-0023, ADR-0024, ADR-0025, ADR-0032, ADR-0605

### ✅ DATABASE (APPROVED)
ADR-0009, ADR-0603

### ✅ DEPLOYMENT (APPROVED)
ADR-0801

### ✅ TESTING (APPROVED)
ADR-0019, ADR-0026

### ✅ GOVERNANCE (APPROVED)
ADR-0000, ADR-0007, ADR-0029, ADR-0030, ADR-0031, ADR-0033

### ✅ PROCESS (APPROVED)
ADR-0034, ADR-1102, ADR-1103

### ✅ KNOWLEDGE (APPROVED)
ADR-1100, ADR-1104, ADR-1105

---

## Superseded ADRs

| ADR | Status | Category | Scope | Date | Superseded By | Title |
|-----|--------|----------|-------|------|---------------|-------|
| ADR-0607 | SUPERSEDED | ARCHITECTURE | System | 2026-08-14 | ADR-0609 | Introducción del Microservicio `gda-comunicacion` para Noticias y Eventos (Espacio Justicia) |

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

CI pipelines (where a project has one) do not validate ADRs — the AI assistant (or the user) is the validation gate (see `AI_ENTRYPOINT.md` § Self-Review Gate). These one-line checks make that gate concrete instead of purely aspirational. Run from the repository root of any consuming project:

**1a. Every local ADR file has a row in the registry table:**
```bash
comm -23 <(ls docs/decisiones | grep -oE '^ADR-[0-9]+' | sort -u) \
         <(grep -oE "^\| ADR-[0-9]+" ai/governance/14_ADR_INDEX.md | tr -d '| ' | sort -u)
```
Empty output = no local ADR is missing from the registry.

**1b. No ADR has more than one row in the registry table:**
```bash
grep -oE "^\| ADR-[0-9]+" ai/governance/14_ADR_INDEX.md | tr -d '| ' | sort | uniq -d
```
Empty output = no duplicated rows.

The registry is integral (all projects), so rows without a local file are expected: they belong to other projects and are not an error.

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
