# AI Entrypoint

## Purpose

This document is the primary entry point for AI assistants operating within this repository.

Before performing any analysis, review, recommendation, or implementation task, read the authoritative governance documents listed below.

---

## Context Resolution & Path Constraints

*   **Strict Relative Resolution:**  AI assistants MUST NOT expect or attempt to access absolute OS filesystem paths (e.g., `/mnt/d/WorkSpace/...`). All internal governance references, skills, templates, and codebase analysis MUST be executed using relative workspace paths (`./`) or files explicitly attached to the active session via chat references (`./`).
*   **Semantic Indexing:** To avoid expensive re-analysis and optimize token usage, AI assistants SHOULD connect to the project's Knowledge Provider as the first step during context collection. When available, the Knowledge Provider may use a pre-computed knowledge graph (currently planned as `./docs/arquitectura/.ua/knowledge-graph.json`) as its structural and semantic index. Repository documents remain the canonical source of truth. The underlying implementation may evolve without modifying this document.
*   **Path Alignment:** Any absolute path mentioned in prompts or configurations must be automatically translated by the AI to its equivalent relative position within the active workspace root.

---

## Governance Documents

Read in the following order:

1. ai/governance/01_AI_CONSTITUTION.md
2. ai/governance/02_DEVSECOPS_PRINCIPLES.md
3. ai/governance/04_ARCHITECTURE_GUIDELINES.md (when applicable — backend/frontend application development only)
4. ai/governance/05_ANALYSIS_PROTOCOL.md
5. ai/governance/07_SKILL_ACTIVATION_MODEL.md
6. ai/governance/08_TASK_CLASSIFICATION.md
7. ai/governance/10_EVIDENCE_MODEL.md
8. ai/governance/11_CONFIDENCE_MODEL.md
9. ai/governance/13_AUTHORITY_HIERARCHY.md
10. ai/governance/14_ADR_INDEX.md (governance model)
11. ai/governance/16_SKILL_REGISTRY.md
12. ai/governance/17_SKILL_LIFECYCLE.md
13. ai/governance/20_EXECUTION_PROTOCOL.md
14. ai/governance/22_USER_PREFERENCES.md
15. ai/governance/23_PROMPTING_GUIDE.md

---

## Specialist Skills

Load relevant skills according to the task. Skills are located under:

`ai/skills/`

---

## Skill Activation Model

Skills are independent review/support filters.

The activation of one skill does not imply the activation of any other skill.

Skills must only be activated when they are directly relevant to:

* repository evidence
* architectural scope
* requested task

AI assistants must not assume a mandatory skill chain unless explicitly defined by the user.

Example:

A frontend styling change does not require backend, infrastructure, threat modeling, or quality attribute reviews unless repository evidence demonstrates relevance.

Skill activation must always be evidence-based and scope-driven.

---

## Skill Selection Principle

Skills are not mandatory by default.

The existence of a skill does not imply that the skill must participate in every interaction.

AI assistants must justify skill activation based on:

* evidence
* risk profile
* affected architectural boundaries
* task objectives

Unnecessary skill activation should be avoided.

---

## Proportionality Principle

Governance must be applied proportionally to the scope, risk, and impact of the task.

AI assistants must avoid activating unnecessary governance processes, specialist skills, review workflows, or architectural analysis when repository evidence demonstrates that the change is local, isolated, or low-risk.

Examples:

Low-impact tasks normally include:

* UI styling adjustments
* text corrections
* documentation updates
* comments
* formatting changes

These changes normally require only directly relevant skills, and **do not warrant a new ADR**.

Medium-impact tasks normally include:

* service configuration changes
* API contract modifications
* dependency updates

These require activation of the affected domain skills, and may warrant an ADR if they establish a lasting rule (see `ai/governance/20_EXECUTION_PROTOCOL.md`).

High-impact tasks normally include:

* architectural boundary changes
* security model modifications
* infrastructure redesign
* ADR proposals

These require broader governance review and normally require an ADR under `docs/decisiones/`.

The existence of a governance mechanism does not imply mandatory activation.

Apply the minimum review set necessary to achieve reliable analysis.

Prefer proportional governance over maximum governance.

---

## Templates

Use templates when appropriate:

* ai/templates/01_analysis_template.md
* ai/templates/02_execution_template.md
* ai/templates/03_review_template.md
* docs/decisiones/04_adr_template.md
* ai/templates/10_repository_event.md
* ai/templates/20_skill_definition.md

---

## Infrastructure Alignment

### Mandatory Protocol for Infrastructure Changes

Any modification affecting:

* Docker Compose configuration
* Container execution model (privileges, users, capabilities)
* Network segmentation or exposure
* Runtime security requirements
* Secrets management

**Must mandatorily comply** with the approved Architectural Decisions listed below.

---

### Approved ADRs — Infrastructure Security

1. **ADR-0014 — Docker Port Exposure Policy**
   - `docs/decisiones/ADR-0014-docker_port_exposure_policy.md`
   - **Rule:** Port restricted to loopback (`127.0.0.1:port`) or internal Docker network
   - **Forbidden:** Global publication (`port:port` without interface restriction)
   - **Justification:** Attack surface reduction, IaC consistency

2. **ADR-0018 — Docker Security Runtime & Resilience Requirements**
   - `docs/decisiones/ADR-0018-docker_security_runtime_and_resilience_requirements.md`
   - **Rule:** `cap_drop: ALL` by default
   - **Rule:** Non-root user in runtime-stacks
   - **Forbidden:** `docker.sock` without explicit ADR justification
   - **Validation:** `make test-security-runtime`

3. **ADR-0020 — Container Execution Model & Privilege Strategy**
   - `docs/decisiones/ADR-0020-Container_Execution_Model_Privilege_Strategy.md`
   - **Classification:** runtime-stacks, service-stacks, operational-stacks
   - **Rule:** Clear separation by functional purpose
   - **Rule:** No code bind mounts in production
   - **Validation:** `make test-reproducibilidad`

4. **ADR-0021 — Network Segmentation Strategy**
   - `docs/decisiones/ADR-0021-Network_Segmentation_Strategy.md`
   - **Approved networks:** `backend-net`, `observability-net`, `restricted-net`, `edge-net` (optional)
   - **Forbidden:** Single global network (`monitoring-net`)
   - **Rule:** Principle of least network access
   - **Justification:** Functional domain isolation, lateral movement reduction

5. **ADR-0027 — Container Typology & Healthchecks Policy**
   - `docs/decisiones/ADR-0027-tipologia_contenedores_politica_healthchecks.md`
   - **Typology:** SERVICE_RUNTIME, SUPERVISOR_RUNTIME, TOOLBOX_RUNTIME, INFRA_TRUSTED
   - **Rule:** Explicit classification in `ops/runtime_containers.yml`
   - **Rule:** Healthchecks semantically coherent with container purpose
   - **Single source of truth:** `ops/runtime_containers.yml`

6. **ADR-0032 — PostgreSQL Secrets Hardening & CI Validation**
   - `docs/decisiones/ADR-0032-endurecimiento_secretos_PostgreSQL_y_validaciones_CI.md`
   - **Rule:** `POSTGRES_PASSWORD_FILE=/run/secrets/postgres_password`
   - **Forbidden:** Hardcoded secrets in `.env` or versioned files
   - **Validation:** `ops/services/postgres/scripts/check_postgres_secret.sh`
   - **CI Validation:** `make verify-security`

**Note:** `ai/governance/14_ADR_INDEX.md` defines the governance model for managing ADRs. The project-specific ADR inventory is maintained under `docs/decisiones/` and evolves as new ADRs are approved.

---

### Governing Principles — DevSecOps Infrastructure

Reference: `ai/governance/02_DEVSECOPS_PRINCIPLES.md`

**Container Principles:**
* `cap_drop: ALL` by default
* `no-new-privileges` enabled
* Non-root user when viable
* Healthchecks enabled

**Security Principles:**
* Principle of least privilege
* Defense in depth
* Progressive hardening
* Runtime validation

**Operations Principles:**
* Stability over optimization
* Monitoring before enforcement
* Evidence before action
* Verifiable reproducibility

---

### Skill Activation Model — Infrastructure Tasks

Infrastructure changes require proportional activation of specialist skills:

**When the task involves:**

* Container execution model, privileges, or users → Activate: **devsecops_architect**
* Docker security, hardening, or runtime validation → Activate: **docker_hardening**
* Port exposure or network changes → Activate: **devsecops_architect**
* Secrets, credentials, or regulatory compliance → Activate: **backend_security_reviewer** + **devsecops_architect**
* Observability integration (logs, metrics, healthchecks) → Activate: **observability_reviewer**
* Resilience, retry logic, or failure scenarios → Activate: **resilience_and_rollback_reviewer**

**Interdependent skill activation:**

If ADR-0014 (port exposure) is affected → Also activate ADR-0021 validation (network segmentation).

If ADR-0020 (privilege model) is affected → Also validate ADR-0018 compliance (runtime security).

---

### Validation Gates — Infrastructure Changes

Before proposing infrastructure modifications, mandatory verification:

**Structural Validation:**

* ✓ All docker-compose services have explicit network assignment
* ✓ No default network usage (`monitoring-net` eliminated)
* ✓ Port declarations follow loopback binding rule (if necessary)
* ✓ User/UID explicitly declared in runtime-stacks
* ✓ Capabilities explicitly dropped (`cap_drop: ALL`)

**Compliance Validation:**

* ✓ Changes respect all referenced ADRs (status = Approved)
* ✓ Container classification in `ops/runtime_containers.yml` is explicit
* ✓ Healthcheck semantics match container typology
* ✓ Secrets management follows ADR-0032 standard

**Runtime Security Validation (Makefile):**

```
make test-security-runtime       # Verifies user, exposure, docker.sock
make verify-security             # PostgreSQL secrets validation
make test-reproducibilidad       # Host independence validation
```

**CI/CD Gate:**

All infrastructure changes require:

* Successful validation: `make test-security-runtime`
* Successful validation: `make verify-security`
* Successful validation: `make test-reproducibilidad`
* Documentation update in relevant ADR or README

---

### Language & Documentation

All infrastructure governance documentation:

* Follows Spanish language policy (consistent with `02_DEVSECOPS_PRINCIPLES.md`, ADRs). (Note: The original authoritative reference documents and ADRs remain in Spanish) (see `ai/governance/22_USER_PREFERENCES.md`).
* Uses consistent terminology from approved ADRs.
* Must be auditable and referenceable.
* Path references must be relative (`./` or `docs/decisiones/`)

---

## Current Authoritative Ledgers

The user may designate specific authoritative versions.

Unless explicitly superseded, do not automatically replace an authoritative ledger with a newer version. Historical ledgers remain authoritative records of project state, implementation history, corrections, and operational context.

Approved ADRs may supersede architectural decisions, but they do not invalidate historical ledgers.

When inconsistencies exist between ADRs and historical ledgers:

* ADRs define current architectural authority.
* Ledgers preserve historical project traceability.
* AI assistants must explicitly identify the divergence.

**Highest priority documents:**

* docs/Project_Definition/00_PROJECT_VISION_DigitalOcean_Definicion_Proyecto.txt

## Authoritative Project Documentation

The following documents are the authoritative project sources.
AI must not assume that the most recent file is authoritative.
When multiple versions exist, the user must explicitly identify the authoritative version, or the AI must request clarification before proceeding.

### Architecture Decisions

* docs/decisiones/

### Project Definition

* docs/Project_Definition/

### Project Implementation

* docs/Project_Implementation/

### Project Corrections

* docs/Project_Corrections/

### Tooling

*   Active tooling inventory documentation (e.g., tooling_*.txt or equivalent project tooling registry)

### Knowledge Graph

*   **Codebase Knowledge Graph:** `./docs/arquitectura/.ua/knowledge-graph.json` (Source of truth for codebase structure, dependencies, and semantic summaries - accessed via root symlink ./.ua/)

### Infrastructure

* Active infrastructure inventory documentation (e.g., `Configuracion_Equipo_*.txt` or equivalent infrastructure registry)

---

## Response Generation Requirements

Before generating the final response, AI assistants must verify that:

1. Repository language policy has been applied (`ai/governance/22_USER_PREFERENCES.md`).
2. 22_USER_PREFERENCES.md response formatting requirements have been applied.
3. Governance hierarchy has been applied.
4. Relevant specialist skills have been selected according to the Skill Activation Model, applying the minimum set required by the task.
5. Evidence requirements have been respected.
6. Assumptions are explicitly identified.
7. Analysis and execution phases remain separated.

Mandatory response requirements defined in 22_USER_PREFERENCES.md must be applied unless explicitly overridden by the user.

Examples:

* If 22_USER_PREFERENCES.md requires responses to begin with a timestamp, the timestamp must be included.
* If 22_USER_PREFERENCES.md defines a preferred language, responses must use that language unless the user explicitly requests another.
* If 22_USER_PREFERENCES.md defines uncertainty handling requirements, they must be applied consistently.

Response generation requirements apply to:

* analysis
* recommendations
* ADR discussions
* plans
* reviews
* implementation proposals
* governance explanations

## Operational Requirements

Mandatory rules:

* **Architectural Precision:** Every proposed ADR must document a real, non-trivial structural design decision, boundary restriction, or topological pattern specific to the project. Generic framework setup, language versioning bump, linting rules, or standard library updates MUST NOT be generated as ADRs.
* Separate analysis from execution.
* Analysis of proposals that conflict with current governance remains permitted.
* Implementation of such proposals requires the governance changes defined by approved ADRs.
* Never execute modifications during analysis.
* Require explicit approval before implementation.
* Respect approved ADRs.
* Respect repository boundaries.
* Respect declared scope.
* Prefer evidence over assumptions.
* Prefer validation over inference.
* Promote reuse before creating new documentation.
* Preserve traceability across repository artifacts.
* When multiple candidate authoritative files exist for the same subject (see Current Authoritative Ledgers), request disambiguation before treating any of them as canonical.
* Response formatting requirements defined in USER_PREFERENCES.md are mandatory unless explicitly overridden by the user.

---

## Conflict Resolution

Priority order (Strict Downward Enforcement):

1. Explicit user instructions
2. Approved ADRs
3. AI Constitution & DevSecOps Principles
4. Specialist Skills Constraints (Technical and security restrictions from loaded skills act as non-negotiable filters over lower levels)
5. Execution Protocol
6. User Preferences
7. Task-specific instructions

Lower-priority documents must never contradict or bypass higher-priority documents or Specialist Skills restrictions.

---

## Objective

Provide deterministic, auditable, evidence-based assistance aligned with the project's DevSecOps governance model.

The repository shall remain independent from any specific AI model, Knowledge Provider, or software platform.
