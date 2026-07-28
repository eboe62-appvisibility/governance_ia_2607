# Analysis Template
(Request template for project analysis, audits, priority assessments, and incident reviews)

## Purpose

Use this template whenever structured analysis is required before making recommendations, decisions, or executing changes.

The template supports different analysis scenarios, including:

- general analysis
- priority assessment
- audit
- incident review

Complete only the sections that are applicable.

---

# Analysis Type

Analysis Type:

- General Analysis
- Priority Assessment
- Audit
- Incident Review

---

## Context

Provide the relevant project context.

Examples:

- affected component
- affected knowledge area
- affected document
- affected service
- current implementation
- related Architectural Decisions (when applicable)
- operational constraints (when applicable)

---

## Objective

Describe the objective.

- What problem must be understood?
- What decision is required?
- What question should the analysis answer?

---

## Scope

Define:

In Scope

Out of Scope

---

## Constraints

List all known constraints.

Examples:

- no architecture redesign
- preserve compatibility
- no downtime
- documentation only
- no additional dependencies
- project-specific constraints

---

## Available Evidence

List all available evidence.

Examples:

- documentation
- project files
- configuration
- logs
- metrics
- command outputs
- runtime observations
- audit results
- screenshots
- timelines

---

## Additional Information (when applicable)

Complete only the sections relevant to the selected analysis type.

### Priority Assessment

Priority Identifier:

Priority Title:

Source:

Current Status:

Related Architectural Decisions (mandatory for Priority Assessments)

For each applicable Architectural Decision provide:

- Identifier
- Title
- Relevance

### Audit

Audit Scope:

Audit Focus Areas:

Examples:

- governance
- architecture
- security
- operational procedures
- compliance
- documentation

For each finding provide:

- Description
- Evidence
- Severity
- Impact
- Recommendation

Severity Classification (mandatory for Audits)

Use:

- Informational
- Low
- Medium
- High
- Critical

### Incident Review

Incident Identifier:

Date:

Environment:

Severity:

Executive Summary

Provide a brief description of the incident.

Timeline:

- detection
- escalation
- mitigation
- recovery

Impact Assessment:

Examples:

- operational impact
- service impact
- architectural impact (when applicable)
- customer or user impact (when applicable)
- security impact (when applicable)
- project impact (when applicable)

Root Cause Analysis

Identify:

- Direct Causes
- Contributing Factors
- Missing Controls

Separate:

- Confirmed Causes
- Suspected Causes
- Corrective Actions
- Immediate
- Short-Term
- Long-Term

---

## Required Analysis

The analysis should include, when applicable:

1. Current State Assessment
2. Findings
3. Evidence Assessment
   Include runtime evidence review whenever runtime behaviour is relevant (e.g. runtime inspection).
4. Risk Assessment
5. Architectural Impact
6. Operational Impact
7. Security Impact
8. Options Analysis
9. Recommendation
10. Validation Requirements

    When applicable include:

    - Validation Method
    - Success Criteria
    - Rollback Criteria

11. Rollback Strategy (mandatory for Priority Assessments)
12. Lessons Learned (when applicable)

---

## Finding Classification

Mandatory for Priority Assessments.
Recommended for Audits and Incident Reviews.

Classify findings using the project's Evidence Classification Model.

Examples:

- Confirmed
- Probable
- Unconfirmed
- Incorrect

---

## Expected Deliverable

The deliverable should include, when applicable:

- Executive Summary
- Current State
- Findings
- Risks
- Options
- Recommendation
- Timeline (mandatory for Incident Reviews)
- Root Cause Analysis (mandatory for Incident Reviews)
- Corrective Actions (mandatory for Incident Reviews)
- Validation Requirements
- Rollback Strategy
  Mandatory for Priority Assessments.
  Recommended whenever implementation changes are evaluated.
- Lessons Learned (when applicable)
- Closure Criteria (mandatory for Priority Assessments)

---

## Prohibited Actions

Do not:

- implement changes
- generate implementation code
- redesign architecture
- assume behaviour without evidence
- classify findings without justification
- assign blame during incident reviews
- mix facts with assumptions

Implementation requires a separate Execution Request.
