# Execution Template
(Request template for executing approved changes)

## Purpose

Use this template when implementation has been approved and execution is required.

Execution must only begin after the necessary analysis, evidence assessment, approvals, and governance validation have been completed.

---

## Context

Provide the context required to understand the approved change.

Examples:

- affected component
- affected knowledge area
- affected document
- affected service
- approved objective

---

## Approved Scope

Describe the approved implementation scope.

Clearly define:

In Scope

Out of Scope

Only the approved scope may be modified.

---

## Previous Analysis

Reference the analysis or decision that authorizes execution.

Examples:

- analysis document
- Architectural Decision Record (when applicable)
- decision record
- audit report
- incident review

---

## Evidence and Confidence

Summarize the evidence supporting execution.

Provide:

Evidence Level:

Confidence Level:

Known Limitations:

Validation Gaps:

Execution should normally require HIGH confidence or greater.

Lower confidence requires explicit justification or user authorization.

---

## Constraints

List all applicable constraints.

Examples:

- preserve existing architecture
- preserve observability
- preserve compatibility
- preserve existing safeguards
- preserve documentation consistency
- minimize operational disruption
- project-specific constraints

---

## Required Changes

Describe the approved modifications.

Examples:

- documentation updates
- configuration changes (e.g. CI)
- implementation changes
- automation updates
- workflow improvements
- operational procedure updates

---

## Validation Requirements

Implementation must include:

- verification method
- validation method
- acceptance criteria
- rollback method (when applicable)

Success Criteria:

Rollback Criteria (when applicable):

---

## Documentation Requirements

Update documentation whenever applicable.

Examples:

- implementation documentation
- architecture documentation
- governance documentation
- operational procedures
- knowledge assets

---

## Expected Deliverable

Provide:

1. Executive Summary
2. Proposed Changes
3. Modified Artifacts
4. Validation Procedure
5. Rollback Procedure (when applicable)
6. Documentation Updates
7. Remaining Limitations (if any)

---

## Prohibited Actions

Do not:

- expand the approved scope
- refactor unrelated work
- redesign architecture without approval
- implement unsupported assumptions
- remove controls without justification
- bypass governance requirements
- execute changes without sufficient evidence or authorization

Implementation must remain consistent with the project's governance model and approved decisions.
