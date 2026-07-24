# Repository Event Template
(Template for documenting repository commits and pull requests)

## Purpose

Document repository changes in a consistent, factual, and traceable manner.

Repository events should accurately describe implemented changes without introducing unsupported claims or undocumented scope.

This template may be used for different repository events, including:

- commit messages
- pull request descriptions

Complete only the sections applicable to the selected repository event.

## Repository Event Type

Select one:

- Commit Message
- Pull Request

## Objective

Describe the purpose of the completed change.

Focus on what has actually been implemented or documented.

## Scope

Describe the approved scope of the change.

Examples:

- modified documents
- affected components
- knowledge assets
- implementation changes
- governance updates
- research documentation

Do not describe work outside the approved scope.

## Repository Changes

List the modified repository artifacts.

Examples:

- files
- directories
- documentation
- configuration
- knowledge assets
- reference material

## Governance Validation

Mandatory for Pull Requests.

Recommended whenever repository changes modify project decisions, governance, architecture, methodology, or implementation.

Confirm compliance with applicable project governance.

Examples:

- approved Architectural Decisions
- project governance documents (e.g. AI Constitution, DevSecOps Principles)
- implementation constraints
- documentation requirements
- review outcomes

## Risks

Mandatory for Pull Requests.

Describe any relevant risks introduced by the change.

Examples:

- runtime risks
- operational risks
- deployment risks
- implementation risks
- documentation inconsistencies
- knowledge integrity risks
- compatibility risks

Only include risks supported by available evidence.

## Rollback

Mandatory for Pull Requests.

Recommended whenever repository changes may require reversion.

Describe how the change can be reverted if necessary.

Include:

- rollback method
- affected artifacts
- limitations (if any)

## Validation

Confirm how the completed change was verified.

Examples:

- documentation review
- implementation validation
- evidence verification
- governance compliance review
- testing performed (when applicable)

## Output

### Commit Message

Return only:

<branch_name>: <short factual description>

The commit message must always begin with the repository branch name.

The branch name should follow the project's approved branch naming conventions.

Examples:

- governance: update execution template
- documentation: reorganize ADR taxonomy
- knowledge: add HSK vocabulary references
- research: classify historical sources
- security: restrict SMTP container capabilities
- ci: add compose validation workflow

## Pull Request

Provide:

- Objective
- Scope
- Repository Changes
- Governance Validation
- Risks
- Rollback
- Validation

Include only information supported by repository evidence.

## Writing Rules

Always:

- be concise
- be factual
- describe completed work
- respect the approved scope
- align with applicable governance
- use evidence-based language

Avoid:

- intentions
- future work
- marketing language
- unsupported claims
- exaggerated impact
- undocumented architectural or methodological changes
- hidden scope
- optimistic refactor language
- vague descriptions

Avoid terms such as:

- improved
- enhanced
- optimized
- modernized
- refactored (unless an actual refactor occurred)
- fixed everything
- cleanup

Prefer objective descriptions supported by repository evidence over subjective evaluations.

## Final Verification

Before completing the repository event, verify that:

- the description reflects completed work only
- the approved scope has not been expanded
- affected components, services, documents, or knowledge assets have been identified
- governance requirements have been respected
- repository changes are accurately described
- the commit message begins with the repository branch name using the project's approved branch naming  conventions
- risks are documented when required
- rollback information is included when required
- no unsupported claims or assumptions are presented
