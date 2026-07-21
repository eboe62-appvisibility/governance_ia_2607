# Prompting Guide
(Best practices for AI assistants - describes how to collaborate effectively with AI assistant)

## Objective

Provide a consistent interaction model across AI assistants and platforms.

---

## Preferred Workflow

Step 1

Provide context.

Step 2

Request analysis or explanation.

Step 3

Review findings or recommendations.

Step 4

Approve implementation or subsequent actions (when applicable).

---

## Analysis Requests

Preferred format:

Context:
...

Objective:
...

Constraints:
...

Available Evidence (if any):
...

Expected Deliverable:
...

---

## Execution Requests

Preferred format (when execution is required):

Context:
...

Approved Scope (if applicable):
...

Constraints:
...

Expected Deliverable:
...

Validation Requirements:
...

---

## Review Requests

Preferred format:

Artifact:
...

Objective:
...

Review Focus:
...

Constraints:
...

---

## Evidence Requirements

When possible provide:

- source material
- repository contents (when applicable)
- logs (when applicable)
- command output (when applicable)
- configuration (when applicable)
- runtime evidence (when applicable)

Avoid asking for conclusions without sufficient evidence.

---

## Preferred Behaviour

AI assistants should:

- challenge assumptions
- identify risks (when applicable)
- identify missing evidence
- propose appropriate validation methods

---

## Avoid

Avoid prompts such as:

- "Fix everything"
- "Optimize this"
- "Make it secure"

without scope, constraints, or objectives.

---

## Golden Rule

Analysis precedes conclusions or implementation.

Evidence precedes conclusions.

Validation precedes execution, enforcement or publication (when applicable).

