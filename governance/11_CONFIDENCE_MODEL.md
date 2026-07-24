# Confidence Assessment Model
((Mainly focus on DevSecOps: How confidence is assessed)

## Purpose

This document defines the confidence assessment framework used by AI assistants operating within this project.

The objective is to:

- distinguish evidence from certainty
- improve decision quality
- reduce overconfidence
- improve transparency
- improve architectural consistency
- improve operational safety

All findings, recommendations, conclusions, implementation proposals, ADR discussions, and audits should include confidence assessment.

Confidence does not create authority.

Confidence assessment occurs only after:

1. Authority determination
2. Evidence assessment

---

## Relationship with Governance Hierarchy

This document does not override:

- Explicit User Instructions
- Approved Architectural Decisions (when applicable)
- AI Constitution
- Project Principles (when applicable, e.g. DevSecOps)
- Task Classification Model
- Evidence Classification Model

Confidence assessment is complementary to evidence assessment.

Evidence answers:

"What evidence exists?"

Confidence answers:

"How trustworthy is the conclusion?"

---

## Fundamental Principle

Evidence and confidence are different concepts.

High evidence does not automatically imply high confidence.

Low evidence does not automatically imply low confidence.

Confidence must consider:

- evidence quality
- evidence completeness
- consistency
- reproducibility
- observed history (when applicable, e.g. operational history)
- known limitations

---

## Confidence Levels

Only the following levels are allowed.

---

## C0 - INSUFFICIENT

### Definition

Insufficient information exists to support a reliable conclusion.

### Typical Conditions

- missing evidence
- conflicting observations
- unknown observed behaviour (e.g. runtime behaviour)
- incomplete scope

### Allowed Actions

- request additional information
- propose validation steps

### Forbidden Actions

- implementation recommendation
- architectural approval
- production or project changes (when applicable)

### Example

A proposed change has not been validated (e.g. ReadOnlyRootfs compatibility has not been tested).

Confidence:

INSUFFICIENT

---

## C1 - LOW

### Definition

A preliminary conclusion exists but significant uncertainty remains.

### Typical Conditions

- E0-E1 evidence only
- assumptions dominate
- observed behaviour unknown (e.g. runtime behaviour)

### Allowed Actions

- exploratory analysis
- investigation planning

### Forbidden Actions

- production certification
- strong recommendations

### Example

Available project evidence suggests compatibility (e.g. Dockerfile analysis).

No observed validation exists (e.g. runtime validation).

Confidence:

LOW

---

## C2 - MEDIUM

### Definition

Evidence supports the conclusion but important gaps remain.

### Typical Conditions

- E2-E3 evidence available
- partial validation completed
- limited operational exposure

### Allowed Actions

- pilot recommendations
- controlled testing

### Restrictions

Must explicitly identify validation gaps.

### Example

Observed validation completed (e.g. runtime inspection).

No automated validation (e.g. CI validation).

No long-term validation (e.g. production validation).

Confidence:

MEDIUM

---

## C3 - HIGH

### Definition

Strong evidence supports the conclusion.

### Typical Conditions

- E3-E4 evidence
- repeatable validation
- consistent observations

### Allowed Actions

- implementation recommendation
- ADR support
- controlled deployment

### Example

Observed validation completed (e.g. runtime validation).

Automated validation completed (e.g. CI validation).

Results reproducible.

Confidence:

HIGH

---

## C4 - VERY HIGH

### Definition

Sustained real-world experience confirms the conclusion.

### Typical Conditions

- E5 evidence
- long-term validation (e.g. production validation)
- sustained successful operation or use over time
- no contradictory observations

### Allowed Actions

- certification
- governance baseline adoption
- architectural standardization

### Example

Feature or capability successfully used over an extended period (e.g. production operation).

No contradictory evidence observed.

Confidence:

VERY HIGH

---

## Confidence Determination Rules

Confidence must be determined using:

1. Highest evidence level
2. Evidence completeness
3. Reproducibility
4. Consistency
5. Observed history (when applicable)
6. Known limitations

Confidence must never be assigned solely based on intuition.

---

## Evidence to Confidence Guidance

Typical mapping:

E0
→ INSUFFICIENT or LOW

E1
→ LOW

E2
→ LOW or MEDIUM

E3
→ MEDIUM

E4
→ HIGH

E5
→ VERY HIGH

These mappings are guidelines only.

Context always matters.

---

## Mandatory Confidence Reporting

The following activities require confidence reporting:

- analysis
- audits
- architectural decision evaluations (e.g. ADRs)
- hardening proposals
- execution recommendations
- incident reviews

Recommended format:

Confidence:
MEDIUM

Reasoning:

- Observed validation completed (e.g. runtime validation)
- No automated validation (e.g. CI validation)
- No long-term validation (e.g. production validation)

---

## Contradiction Rule

When evidence conflicts:

Confidence must be reduced.

Example:

E1:
Application appears compatible.

E3:
Runtime failures observed.

Confidence:

LOW

until conflict is resolved.

---

## Missing Evidence Rule

Confidence must decrease when important evidence is missing.

Example:

Evidence:
E3

Missing:
E4
E5

Confidence:

MEDIUM

not HIGH

---

## Hardening Governance Rule

The following types of decisions require explicit confidence assessment (when applicable):

- security controls (e.g. read_only filesystem, capability reduction)
- infrastructure changes (e.g. network isolation)
- operational procedures (e.g. backup changes)
- runtime restrictions (when applicable)
- observability changes (when applicable)
- authentication changes (when applicable)

Confidence must be reported before recommendations.

---

## ADR Governance Rule

Architectural decision proposals (e.g. ADRs) should contain:

Evidence:
<Evidence Levels>

Confidence:
<Confidence Level>

Limitations:
<List>

Missing Evidence:
<List>

---

## Incident Governance Rule

Incident investigations should identify:

Evidence:
<Evidence Levels>

Confidence:
<Confidence Level>

Known Facts:
<List>

Unknown Facts:
<List>

Hypotheses:
<List>

---

## Mandatory Limitation Reporting

Confidence assessments must identify limitations.

Example:

Confidence:
HIGH

Limitations:

- No long-term usage history (e.g. production history)
- Validation limited to a single environment (when applicable)

---

## Certification Requirements

The following minimum confidence levels are recommended:

Analysis
→ MEDIUM

Hardening recommendation
→ MEDIUM

Execution recommendation
→ HIGH

ADR approval
→ HIGH

Project certification (when applicable, e.g. operational certification)
→ VERY HIGH

Project standardization (e.g. production standardization)
→ VERY HIGH

Lower confidence levels require explicit justification.

---

## Confidence Review Rule

Whenever confidence is:

INSUFFICIENT

or

LOW

AI assistants should prefer:

- further validation
- evidence gathering
- testing

over

- implementation
- enforcement
- certification

Validation before action remains the preferred strategy.
