# ADR-0001: Estrategia de Despliegue: Arquitectura de Microservicios Independientes basados en Maven Multi-Module

## Estado
Approved

## Contexto
El backend de la plataforma GDA está compuesto por múltiples carpetas de negocio diferenciadas (gda-finance, gda-imputacion, gda-persona, etc.). Cada una cuenta de forma nativa con su propio wrapper de Maven (`mvnw`), su directorio de configuración `.mvn` y su archivo `pom.xml` independiente. Esto demuestra que, aunque comparten el mismo repositorio de código (Monorrepo), no están concebidos como un único monolito acoplado en tiempo de compilación.

## Decisión
Establecer un modelo de arquitectura de Microservicios Desacoplados. Cada módulo se tratará como un artefacto con ciclo de vida, compilación y despliegue completamente independiente. Se prohíbe la creación de un `pom.xml` padre en la raíz que fuerce una compilación en bloque reactiva si no es estrictamente necesario para la canalización de CI/CD.

## Consecuencias

### Positivas (+)
- Permite desplegar cambios en un módulo (ej. `gda-finance`) sin necesidad de recompilar, probar o reiniciar los demás módulos (ej. `gda-persona`).
- Escalabilidad horizontal independiente por cada servicio según la carga de trabajo.

### Negativas (-)
- Exige una gestión rigurosa de las versiones de las dependencias de forma externa (o mediante un BOM compartido) para evitar la deriva tecnológica entre servicios.

# ADR-0002: Estructura de Desacoplamiento de Capas mediante el Patrón Módulo-Commons

## Estado
Approved

## Contexto
Se observa que cada dominio de negocio del backend está duplicado sistemáticamente en dos subartefactos emparentados: un módulo principal (ej. `gda-agrupacion`) y un submódulo con el sufijo `-commons` (ej. `gda-agrupacion-commons`). Es necesario fijar la frontera de qué lógica reside en cada lado para evitar el acoplamiento cíclico en el árbol de Maven y la fuga de responsabilidades.

## Decisión
Adoptar el patrón de Aislamiento de Commons. Los módulos independientes de negocio solo expondrán e incluirán en su extensión `-commons` aquellos elementos que requieran ser consumidos por otros servicios del ecosistema.

En `-commons` residirán únicamente:
- DTOs de intercambio.
- Interfaces de clientes de comunicación (Feign/WebClient).
- Excepciones de dominio.
- Constantes globales del módulo.

En el módulo principal residirán:
- La lógica de negocio (Services).
- La capa de persistencia (Entities JPA/Repositories).
- Los controladores REST.
- Las configuraciones del framework.

## Consecuencias

### Positivas (+)
- Evita la fuga de abstracciones y detalles de persistencia (las entidades de base de datos nunca se exponen a terceros).
- Previene dependencias circulares en el árbol de dependencias de Maven.

### Negativas (-)
- Duplica la cantidad de proyectos a gestionar dentro del repositorio.
- Obliga al mapeo constante de objetos (conversión obligatoria de Entity a DTO y viceversa).

# ADR-0003: Centralización de Capas Transversales mediante el uso del Módulo Interno gda-log

## Estado
Approved

## Contexto
El sistema cuenta con un artefacto propio denominado `gda-log`. En arquitecturas distribuidas o modulares, delegar la lógica de traza, auditoría y estructuración de logs exclusivamente a configuraciones locales de Spring Boot (`logback.xml` independientes o duplicados) genera heterogeneidad, asimetría técnica y dificulta la auditoría unificada exigida por los principios corporativos de DevSecOps.

## Decisión
Centralizar la política de observabilidad, auditoría y traza a través del módulo corporativo `gda-log`. Este módulo actuará como una librería interna (starter personalizado) que todos los microservicios y módulos de negocio deberán importar obligatoriamente en sus dependencias. El módulo regulará de manera unificada:
- El formato de salida (JSON estructurado).
- El comportamiento de los niveles de logging según el entorno de ejecución.
- La inyección automática de identificadores de correlación (`TraceID`/`SpanID`).

## Consecuencias

### Positivas (+)
- Consistencia absoluta en el formateo y parseo de logs por parte de las herramientas de infraestructura de monitorización.
- Las modificaciones globales en las políticas de auditoría o cumplimiento de seguridad se resuelven actualizando únicamente el componente centralizado `gda-log`.

### Negativas (-)
- Introduce una dependencia interna acoplada y crítica; un fallo de configuración o un error de código en el módulo `gda-log` puede bloquear el arranque o la estabilidad de todo el ecosistema de backend.

# ADR-0004: Seguridad Perimetral y Enrutamiento Unificado mediante API Gateway y gda-autenticacion

## Estado
Approved

## Contexto
La existencia de los módulos independientes de primer nivel `api-gateway` y `gda-autenticacion` plantea la necesidad de definir de manera estricta cómo se securizan los endpoints del backend, cómo interactúa el tráfico externo con los microservicios internos y dónde se debe realizar la validación de identidad.

## Decisión
Implementar una arquitectura de Seguridad Perimetral en el Gateway bajo los siguientes principios:

- El módulo `api-gateway` será el único punto de entrada expuesto hacia el exterior del clúster. Se encargará de interceptar todas las peticiones entrantes e interactuar con `gda-autenticacion` para verificar la validez de los tokens de seguridad (JWT).
- Los microservicios internos (`gda-finance`, `gda-persona`, `gda-estructura`, etc.) asumirán un modelo de confianza perimetral, asumiendo que cualquier petición que les alcance ya ha sido autenticada y propagada por el Gateway. Su responsabilidad se limitará a validar de manera interna los roles o permisos específicos embebidos en los claims del token.

## Consecuencias

### Positivas (+)
- Descarga a los microservicios de negocio de la complejidad técnica de validar firmas de criptografía o tokens en cada petición individual.
- Oculta por completo la topología interna de la red, impidiendo que clientes externos conozcan las ubicaciones físicas o URLs reales de los servicios internos.

### Negativas (-)
- El API Gateway se transforma en un punto único de fallo (Single Point of Failure); un problema de disponibilidad en este componente deja la plataforma entera inaccesible.
- Requiere configuraciones de red estrictas para asegurar que ningún tráfico externo pueda saltarse el Gateway y atacar directamente a los microservicios internos.

# ADR-005: Estrategia de Persistencia y Acceso a Datos en Monorrepo

## Estado
Proposed

## Contexto
El proyecto FullStack utiliza un monorrepo que incluye múltiples módulos de backend con dominios de negocio independientes (`gda-finance`, `gda-persona`, etc.). Actualmente, no se ha definido una estrategia clara para la gestión de la persistencia, lo que genera riesgos de inconsistencia y conflictos en los siguientes aspectos:
- Uso de JPA y entidades compartidas entre módulos.
- Gestión de transacciones distribuidas en operaciones que involucren múltiples módulos.
- Configuración de bases de datos en entornos locales y de producción.
- Prevención de conflictos entre módulos que compartan la misma base de datos.

## Decisión
Adoptar una estrategia de persistencia y acceso a datos basada en los siguientes principios:
1. **Independencia Modular:** Cada módulo gestionará sus propias entidades JPA y repositorios, evitando dependencias cruzadas entre módulos.
2. **Esquemas Aislados:** En entornos compartidos, cada módulo utilizará un esquema de base de datos independiente para evitar conflictos.
3. **Transacciones Distribuidas:** Las operaciones que involucren múltiples módulos se gestionarán mediante un coordinador de transacciones (ej. Spring Transaction Management con soporte para XA).
4. **Configuración Centralizada:** Las configuraciones de conexión a la base de datos se centralizarán en un archivo común, con soporte para sobreescritura por módulo según el entorno.
5. **Estrategia de Versionado:** Se implementará un control estricto de versiones de las entidades y migraciones de base de datos (ej. Flyway o Liquibase) para garantizar consistencia en los despliegues.

## Consecuencias

### Positivas (+)
- Asegura la independencia de los módulos en la gestión de datos, reduciendo el acoplamiento.
- Facilita el desarrollo y pruebas locales al permitir configuraciones aisladas por módulo.
- Reduce el riesgo de conflictos en entornos compartidos mediante esquemas independientes.
- Mejora la trazabilidad y control de cambios en las estructuras de datos.

### Negativas (-)
- Introduce complejidad adicional al gestionar múltiples esquemas o bases de datos.
- Requiere un esfuerzo adicional para implementar y mantener transacciones distribuidas.
- Incrementa la carga operativa al manejar configuraciones específicas por módulo y entorno.

# ADR-006: Arquitectura del Frontend y Gestión de Estado

## Estado
Proposed

## Contexto
El proyecto FullStack utiliza un monorrepo que incluye tanto módulos de backend como un módulo de frontend. Actualmente, no se han definido lineamientos claros para la arquitectura del frontend, lo que puede generar inconsistencias en la gestión de estado, validaciones y comunicación con el backend. Los principales riesgos identificados son:
- Falta de un estándar para la gestión de estado global (ej. Redux, Zustand, Context API).
- Ausencia de lineamientos para desacoplar el frontend del API Gateway y manejar errores de red de forma uniforme.
- Validaciones redundantes o inconsistentes entre el cliente y el servidor.
- Dificultad para escalar la arquitectura del frontend en equipos distribuidos.

## Decisión
Adoptar una arquitectura de frontend basada en los siguientes principios:
1. **Gestión de Estado Global:** Utilizar una librería de gestión de estado centralizada (ej. Redux Toolkit) para manejar el estado compartido entre componentes y evitar inconsistencias.
2. **Desacoplamiento del API Gateway:** Implementar un servicio de cliente HTTP (ej. Axios o Fetch encapsulado) que centralice la comunicación con el API Gateway, incluyendo manejo de errores, autenticación y reintentos.
3. **Validaciones en Cliente y Servidor:** Definir un esquema de validación compartido (ej. JSON Schema o librerías como Yup) para garantizar consistencia entre las validaciones del cliente y el servidor.
4. **Modularidad:** Organizar el código del frontend en módulos funcionales (feature-based architecture) para facilitar la escalabilidad y el trabajo en equipo.

## Consecuencias

### Positivas (+)
- Asegura consistencia en la gestión de estado y comunicación con el backend.
- Reduce la duplicación de lógica de validación entre el cliente y el servidor.
- Facilita la escalabilidad del frontend en equipos distribuidos.
- Mejora la mantenibilidad al centralizar la lógica de comunicación con el API Gateway.

### Negativas (-)
- Introduce una curva de aprendizaje para los desarrolladores que no estén familiarizados con la librería de gestión de estado seleccionada.
- Requiere un esfuerzo inicial para implementar y documentar las abstracciones necesarias (servicio HTTP, validaciones compartidas, etc.).

# ADR-007: Gestión de Configuraciones y Secretos

## Estado
Proposed

## Contexto
El proyecto FullStack utiliza un monorrepo que incluye múltiples módulos de backend y frontend, cada uno con necesidades específicas de configuración y manejo de secretos. Actualmente, no se ha definido una estrategia clara para:
- Gestionar configuraciones sensibles (como claves API, credenciales de bases de datos, etc.) de manera segura.
- Diferenciar configuraciones entre entornos (desarrollo, pruebas, producción).
- Evitar la exposición accidental de secretos en el repositorio de código.

La ausencia de una estrategia unificada puede generar riesgos de seguridad, inconsistencias entre entornos y dificultades en el despliegue.

## Decisión
Adoptar una estrategia de gestión de configuraciones y secretos basada en los siguientes principios:
1. **Segregación de Entornos:** Mantener configuraciones específicas para cada entorno (desarrollo, pruebas, producción) utilizando herramientas como Spring Profiles (backend) y variables de entorno (frontend).
2. **Almacenamiento Seguro de Secretos:** Utilizar un gestor de secretos centralizado (ej. HashiCorp Vault, AWS Secrets Manager o Azure Key Vault) para almacenar y acceder a secretos sensibles.
3. **Evitar Configuraciones en el Código:** Prohibir la inclusión de configuraciones sensibles directamente en el código fuente. En su lugar, utilizar archivos de configuración externos o variables de entorno.
4. **Automatización:** Integrar la gestión de configuraciones y secretos en la canalización de CI/CD para garantizar que los secretos se inyecten de manera segura durante el despliegue.

## Consecuencias

### Positivas (+)
- Mejora la seguridad al evitar la exposición de secretos en el repositorio de código.
- Facilita la gestión de configuraciones específicas por entorno, reduciendo errores en despliegues.
- Permite la rotación de secretos sin necesidad de modificar el código fuente.
- Asegura consistencia en la configuración entre entornos mediante la automatización.

### Negativas (-)
- Introduce complejidad adicional al integrar y mantener un gestor de secretos centralizado.
- Requiere capacitación para los desarrolladores y operadores sobre el uso de herramientas de gestión de secretos.
- Puede aumentar el tiempo inicial de configuración en la canalización de CI/CD.

# ADR-008: Gobernanza de IA en el Workspace

## Estado
Proposed

## Contexto
El proyecto FullStack utiliza herramientas de Inteligencia Artificial (IA) para asistir en tareas de desarrollo, análisis y generación de contenido. Sin embargo, no se han definido lineamientos claros para garantizar que el uso de estas herramientas cumpla con los principios de gobernanza, seguridad y consistencia del proyecto. Los principales riesgos identificados son:
- Uso indebido de herramientas de IA que pueda introducir vulnerabilidades o inconsistencias en el código.
- Falta de control sobre los puntos de entrada y el contexto en el que se utilizan las herramientas de IA.
- Ausencia de restricciones para evitar la generación de contenido que no cumpla con las políticas corporativas.

## Decisión
Implementar un modelo de Gobernanza de IA en el workspace basado en los siguientes principios:
1. **Puntos de Entrada Controlados:** Definir y documentar los puntos de entrada permitidos para el uso de herramientas de IA, asegurando que estén alineados con las necesidades del proyecto.
2. **Restricciones de Contexto:** Limitar el acceso de las herramientas de IA a contextos específicos del proyecto, evitando el uso de información sensible o confidencial.
3. **Validación de Resultados:** Establecer un proceso de revisión obligatorio para cualquier contenido generado por IA antes de su integración en el código base o documentación oficial.
4. **Cumplimiento de Políticas:** Asegurar que las herramientas de IA utilizadas cumplan con las políticas corporativas de seguridad, privacidad y ética.

## Consecuencias

### Positivas (+)
- Garantiza que el uso de herramientas de IA esté alineado con los principios de gobernanza y seguridad del proyecto.
- Reduce el riesgo de introducir vulnerabilidades o inconsistencias en el código generado por IA.
- Aumenta la confianza en los resultados generados por IA al establecer un proceso de validación.

### Negativas (-)
- Introduce un proceso adicional de revisión que puede aumentar el tiempo necesario para integrar contenido generado por IA.
- Requiere capacitación para los desarrolladores sobre las políticas y restricciones relacionadas con el uso de IA.
- Puede limitar la flexibilidad en el uso de herramientas de IA en contextos no previstos inicialmente.
