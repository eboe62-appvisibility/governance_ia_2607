# Architecture Guidelines
((Mainly focus on DevSecOps: Mandatory architectural and implementation conventions)

This document defines the mandatory architectural, implementation and coding conventions for this project.

The examples provided are project-specific.

AI assistants and development teams must follow these guidelines whenever they are applicable within this project.

---

## 1. Backend Micro-Architecture: Service Classification by Impact Levels (Tiers)

When microservice architectures are used, services should be classified into implementation tiers according to their business impact and operational complexity.

### Tier 1: Core Business Modules
- **Description:** Critical microservices that process core business logic and manage sensitive, complex, or domain-heavy data.
- **Architectural Requirements:**
  - Strict multi-layered package structure: `application`, `domain`, and `infrastructure`.
  - Mandatory use of Data Transfer Objects (DTOs) to decouple internal JPA entities from public API endpoints.
  - Mandatory use of MapStruct to handle all transformations between domain models, entities, and DTOs.
  - Absolute separation of concerns across all development layers.
- **Target Examples:** `gda-persona`, `gda-agrupacion`.

### Tier 3: Utility and Support Modules
- **Description:** Cross-cutting, technical support, or utility microservices with minimal to no direct impact on core business rules.
- **Architectural Requirements:**
  - Flat architectural pattern is permitted: `Controller -> Repository/Entity`.
  - Permission to centralize JPA entities, Spring Data repositories, and API data contracts directly inside the `-commons` submodule to reduce redundant boilerplate code.
  - MapStruct and DTO definitions are optional, provided their absence does not cause leakage across core business domains.
- **Target Examples:** `gda-log`.

### General Considerations
- All new services should be evaluated and assigned to their appropriate architectural tier during the initial design phase.

- Changes affecting architectural classification should be reviewed according to the project's governance and documented through the applicable Architectural Decision process (e.g. ADRs when used).

---

## 2. Frontend Micro-Architecture: Vue.js & Quasar Framework

### Project Structure
This example uses Vue.js and the Quasar Framework with a highly scalable **Feature-Driven Layout (Domain-Driven Structure)**.

Equivalent project-specific structures may be used when justified.

The codebase must be organized as follows:

- **`src/modules/`:**
  The core directory where each folder represents an isolated system feature or business capability. Every feature module must strictly contain:
  - `views/`: Main pages, layout wrappers, and screen entry points tied to application routes.
  - `components/`: Highly reusable UI components scoped exclusively to that specific feature.
  - `composables/`: Vue 3 Composition API reactive functions encapsulating state, local business constraints, and lifecycle logic.

- **`src/boot/axios.js`:**
  The centralized HTTP client configuration bootstrap file. It registers global Axios settings and implements global request interceptors to automatically capture and inject the JWT Authorization header.

- **`src/utils/axiosCall.js`:**
  A wrapper utility that encapsulates asynchronous HTTP requests. It reuses the core Axios boot configuration to expose standard, predictable fetch/mutation routines across the interface layer.

- **`src/models/`:**
  The centralized directory for data schemas and structural representations (e.g., `person.js`, `group.js`). These objects act as the frontend mirrors for the backend DTO contracts, enforcing structural data validation.

### API Consumption Rules
- Direct HTTP calls from presentation components should be avoided. For example, network calls using raw fetch or local Axios instances inside views are strictly prohibited. All requests must be handled via `src/utils/axiosCall.js`.

- Project-approved abstraction layers should be used whenever available. For example, security tokens (JWT) must never be managed manually per request; they must be appended via the central request interceptors in `src/boot/axios.js`.

### Development Best Practices
- **Logic Isolation:** Keep layout files clean; all feature-specific logic, computational expressions, and asynchronous data orchestration must reside inside local composables (`src/modules/[module]/composables/`).
- **Data Integrity:** Always validate or map exchanged data using the project's approved data models or contracts. For example, always instantiate or parse network payloads using the schemas defined in `src/models/` to safeguard component rendering against unexpected structural schema changes from backend APIs.
- **Zero Boilerplate in Views:** Avoid embedding inline state mutations or redundant HTTP handlers within `.vue` templates or script blocks.
