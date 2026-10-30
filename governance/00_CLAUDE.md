# Claude Code Project Governance

## SYSTEM STOP PROTOCOL (MANDATORY)
> **STOP:** Before any code modification, refactoring, or infrastructure execution, you MUST read and comply with `ai/governance/00_AI_ENTRYPOINT.md`.
> You are strictly required to separate the **Analysis Phase** from the **Execution Phase**. You must present a comprehensive Analysis Report and wait for user confirmation before writing or modifying any code.

## Project Context
- **Architecture:** Monorepo. Backend is a Maven multi-module set of independently-versioned Java/Spring Boot microservices (`GDA/backend/gda-*`), each with its own `mvnw` and `pom.xml` — no reactive parent build (see `docs/decisiones/ADR-0600-estrategia-despliegue.md`). `GDA/api-gateway` (Spring, Maven) composes the backend services for the frontend (see `ADR-0604-patron-composicion-api-gateway.md`). `GDA/frontend` is a Vue 3 + Quasar 2 SPA (Pinia, Vue Router, Vite). Native Windows development environment — no Docker/WSL2.
- **Backend modules:** `GDA/backend/{gda-agrupacion, gda-autenticacion, gda-estructura, gda-finance, gda-imputacion, gda-listado, gda-log, gda-persona}` (`gda-comunicacion` is superseded by `spj-comunicacion`, see ADR-0609)
- **Espacio Justicia (SPJ):** independent backend `GDA/backend/spj-comunicacion` and gateway `GDA/spj-api-gateway` (ADR-0609); frontend `GDA/espacio-justicia`, Vue + Bootstrap (ADR-0804).
- **AI Ecosystem:** Unified Governance across GitHub Copilot and Claude Code, governed by the authoritative definitions in `ai/governance/` (repo `governance_ia_2607`). ADRs live in `docs/decisiones/` (repo `governance_ia_docs_2609`). Claude Code loads this file through the root `CLAUDE.md` import.

## Build and Test Commands
- **Check Environment:** `node -v && npm -v && java -version && mvn -v`
- **Backend module build:** `cd GDA/backend/<module> && ./mvnw clean install` (each module builds and deploys independently — do not assume a root aggregator build)
- **API Gateway build:** `cd GDA/api-gateway && ./mvnw clean install`
- **Frontend dev/build:** `cd GDA/frontend && npm install && npm run dev` / `npm run lint` / `npm run build`

## Development Guidelines
- Always prioritize explicit user instructions and approved ADRs (`docs/decisiones/`) over general defaults.
- Adhere to the principles in `ai/governance/05_ANALYSIS_PROTOCOL.md` and `ai/governance/20_EXECUTION_PROTOCOL.md`.
- Respect microservice independence (ADR-0600): never introduce a root parent `pom.xml` that forces block compilation across modules.
- Respect the Tier classification and layering rules in `ai/governance/04_ARCHITECTURE_GUIDELINES.md` before modifying backend or frontend application code.
