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

# ADR-0003: Estrategia de Comunicación Inter-Servicio en Arquitectura de Microservicios

## Estado
Proposed

## Contexto
En un Monorrepo Maven Multi-Module con microservicios independientes, es fundamental establecer una estrategia de comunicación inter-servicio que garantice interoperabilidad, escalabilidad y desacoplamiento. Actualmente, no se han definido lineamientos claros sobre cómo los servicios deben interactuar entre sí, lo que puede generar inconsistencias en los contratos de API, problemas de compatibilidad y dificultades para realizar cambios sin afectar a otros servicios.

## Decisión
Adoptar una estrategia de comunicación basada en los siguientes principios:
1. **Contratos REST/JSON:** Cada microservicio expondrá sus APIs mediante REST utilizando JSON como formato de intercambio de datos.
2. **Documentación con OpenAPI:** Todos los servicios deberán documentar sus contratos de API utilizando OpenAPI (Swagger) para garantizar claridad y consistencia.
3. **Desacoplamiento:** Los servicios consumidores no deben depender directamente del código del servicio proveedor. En su lugar, consumirán las APIs a través de clientes generados dinámicamente o librerías desacopladas.
4. **Versionado de APIs:** Se implementará un esquema de versionado para garantizar compatibilidad hacia atrás en los contratos de API.

## Consecuencias

### Positivas (+)
- Garantiza interoperabilidad y claridad en la comunicación entre servicios.
- Facilita la integración con herramientas externas y la generación automática de clientes.
- Reduce el acoplamiento entre servicios, permitiendo cambios independientes.

### Negativas (-)
- Requiere un esfuerzo adicional para mantener actualizada la documentación de las APIs.
- Introduce complejidad en la gestión de versiones y compatibilidad de contratos.

# ADR-0004: Políticas de Gestión de Bases de Datos en Microservicios

## Estado
Proposed

## Contexto
En una arquitectura de microservicios desacoplados, cada servicio debe ser independiente en todos los aspectos, incluida la gestión de datos. Actualmente, no se han definido lineamientos claros sobre cómo los microservicios deben gestionar sus bases de datos, lo que puede llevar a conflictos de acceso, acoplamiento entre servicios y dificultades para escalar.

## Decisión
Adoptar el patrón de "Base de datos por Microservicio" con las siguientes directrices:
1. **Independencia:** Cada microservicio tendrá su propia base de datos, gestionada de forma independiente.
2. **Prohibición de Joins:** No se permitirán uniones (joins) entre bases de datos de distintos servicios. La integración de datos deberá realizarse a través de APIs.
3. **Migraciones de Esquema:** Cada servicio será responsable de gestionar sus propias migraciones de esquema utilizando herramientas como Flyway o Liquibase.
4. **Segregación de Datos:** En entornos compartidos, se utilizarán esquemas o instancias separadas para cada servicio.

## Consecuencias

### Positivas (+)
- Garantiza el desacoplamiento total entre servicios.
- Facilita la escalabilidad y el mantenimiento de cada servicio de forma independiente.
- Reduce el riesgo de conflictos en el acceso a datos.

### Negativas (-)
- Introduce complejidad adicional en la gestión de múltiples bases de datos.
- Requiere un esfuerzo adicional para implementar integraciones entre servicios.

# ADR-0005: Estrategia de Empaquetado y Despliegue con Contenedores Docker

## Estado
Proposed

## Contexto
En un Monorrepo Maven Multi-Module con microservicios independientes, es necesario definir una estrategia de empaquetado y despliegue que garantice consistencia, eficiencia y portabilidad. Actualmente, no se han establecido lineamientos claros sobre cómo se deben construir y desplegar los contenedores Docker para cada microservicio.

## Decisión
Adoptar una estrategia de empaquetado basada en los siguientes principios:
1. **Dockerfiles Independientes:** Cada módulo Maven tendrá su propio Dockerfile, ubicado en la raíz del módulo.
2. **Builds Multi-Etapa:** Se utilizarán builds multi-etapa para optimizar el tamaño de las imágenes y mejorar la seguridad.
3. **Etiquetado Consistente:** Las imágenes Docker deberán seguir un esquema de etiquetado consistente que incluya el número de versión del servicio y el entorno de despliegue.
4. **Orquestación:** Se utilizarán herramientas de orquestación (ej. Kubernetes) para gestionar el despliegue de los contenedores.

## Consecuencias

### Positivas (+)
- Garantiza consistencia y portabilidad en los despliegues.
- Optimiza el tamaño de las imágenes Docker, reduciendo el tiempo de despliegue.
- Facilita la gestión de múltiples servicios en entornos distribuidos.

### Negativas (-)
- Requiere un esfuerzo inicial para configurar y mantener los Dockerfiles.
- Introduce complejidad en la gestión de múltiples imágenes y su orquestación.

# ADR-0006: Lineamientos de Integración Frontend con Microservicios Backend

## Estado
Proposed

## Contexto
El frontend del proyecto debe interactuar con múltiples microservicios backend, lo que introduce desafíos en la gestión de llamadas, manejo de errores y consistencia en la comunicación. Actualmente, no se han definido lineamientos claros para esta integración, lo que puede generar inconsistencias y dificultades en el desarrollo.

## Decisión
Adoptar los siguientes lineamientos para la integración del frontend con los microservicios backend:
1. **Uso de API Gateway:** Todas las llamadas del frontend a los microservicios pasarán a través de un API Gateway para centralizar la gestión de rutas y seguridad.
2. **CORS Configurado:** Configurar CORS en el API Gateway para permitir el acceso desde el frontend.
3. **Manejo de Errores:** Implementar un sistema centralizado de manejo de errores en el frontend para gestionar respuestas de los microservicios.
4. **Clientes HTTP:** Utilizar una librería estándar (ej. Axios) para realizar las llamadas HTTP desde el frontend.

## Consecuencias

### Positivas (+)
- Centraliza la gestión de rutas y seguridad en el API Gateway.
- Mejora la consistencia en la comunicación entre el frontend y el backend.
- Facilita el manejo de errores y la depuración.

### Negativas (-)
- Introduce una dependencia adicional en el API Gateway.
- Requiere un esfuerzo inicial para configurar CORS y manejar errores de forma centralizada.

# ADR-0007: Estrategias de Seguridad y Gestión de Secretos en Microservicios

## Estado
Proposed

## Contexto
En un ecosistema de microservicios, la seguridad y la gestión de secretos son fundamentales para proteger datos sensibles y garantizar la confiabilidad del sistema. Actualmente, no se han definido lineamientos claros sobre cómo manejar variables de entorno, secretos y autenticación entre servicios.

## Decisión
Adoptar las siguientes estrategias de seguridad y gestión de secretos:
1. **Variables de Entorno Seguras:** Utilizar archivos `.env` para gestionar configuraciones sensibles en entornos locales y bóvedas de secretos (ej. HashiCorp Vault) en producción.
2. **Autenticación Stateless:** Implementar autenticación basada en tokens JWT para garantizar sesiones seguras y escalables.
3. **Rotación de Secretos:** Establecer políticas de rotación periódica de secretos para minimizar riesgos.
4. **Cifrado de Datos Sensibles:** Asegurar que todos los datos sensibles almacenados estén cifrados tanto en tránsito como en reposo.

## Consecuencias

### Positivas (+)
- Mejora la seguridad del sistema al proteger datos sensibles.
- Facilita la escalabilidad mediante autenticación stateless.
- Reduce el riesgo de exposición de secretos mediante bóvedas seguras.

### Negativas (-)
- Introduce complejidad adicional en la configuración y gestión de secretos.
- Requiere capacitación para los desarrolladores sobre el uso de bóvedas y autenticación JWT.


