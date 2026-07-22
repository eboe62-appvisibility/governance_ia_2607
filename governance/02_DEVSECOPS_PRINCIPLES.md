# DevSecOps Principles
((Mainly focus on DevSecOps: Core engineering principles governing the project's implementation)

## Architecture Principles

- Infrastructure as Code first (when applicable)
- Prefer simple and maintainable architectures (e.g. Single-node architecture when applicable)
- Progressive evolution
- Operational simplicity

---

## Security Principles

- Least privilege
- Defense in depth
- Progressive hardening
- Validation before enforcement (e.g. before runtime)
- Explicit trust boundaries

---

## Container Principles

When container technologies are used, default expectations include:

- cap_drop: ALL
- no-new-privileges
- non-root when viable
- healthchecks enabled

Security hardening measures (e.g. read_only) require evidence and validation.

---

## Operations Principles

- Stability over optimization
- Monitoring before enforcement (when applicable)
- Alerting before automation (when applicable)
- Evidence before action

---

## Observability Principles

When operational services exist, they should provide appropriate observability, such as:

- logs
- metrics
- healthchecks

Observability should precede operational enforcement.

---

## Governance Principles

Changes must respect:

- Explicit User Instructions
- Approved Architectural Decisions (when applicable)
- Project Governance
- Project scope
- Operational constraints (when applicable)

---

## Change Management Principles

Every significant change should define:

- objective
- risks
- validation
- rollback strategy (when applicable)

---

## Documentation Principles

Documentation is part of the deliverable.

Significant decisions and behaviours should remain traceable.

Undocumented behaviour should be considered temporary until appropriately documented or intentionally removed.
