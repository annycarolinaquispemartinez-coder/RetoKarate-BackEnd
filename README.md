# Reto Backend - API ServeRest

## Descripción
Este proyecto contiene pruebas automatizadas para la API ServeRest utilizando Karate DSL y JUnit. Incluye escenarios de creación, actualización, eliminación, login y consulta de usuarios, cubriendo casos positivos y negativos según los contratos de la API.

## Requisitos
- Java 8 o superior
- Maven 3.6+
- Acceso a internet para consumir la API pública https://serverest.dev

## Instalación y configuración
1. Clona este repositorio:
   ```sh
   git clone <URL-del-repositorio>
   ```
2. Ingresa al directorio del proyecto:
   ```sh
   cd reto_backend/reto_backend
   ```
3. Verifica que el archivo `pom.xml` esté presente y correctamente configurado para Karate y JUnit.

## Estructura del proyecto
- `src/test/java/serveRest/features/` : Features de Karate organizados por funcionalidad.
- `src/test/java/serveRest/request/` : Cuerpos de request en formato JSON.
- `src/test/java/serveRest/helpers/` : Features auxiliares para la preparación de datos.
- `RunnerTest.java` : Clase para ejecutar los tests en paralelo.

## Ejecución de pruebas
Puedes ejecutar todos los tests con Maven:
```sh
mvn test
```

O ejecutar solo los escenarios con un tag específico (por ejemplo, @login):
```sh
mvn test -Dkarate.options="--tags @login"
```

Los reportes se generan en la carpeta `target/karate-reports`.

# Instrucciones rápidas para ejecutar los tests

1. Abre una terminal en la raíz del proyecto (donde está este README).
2. Ejecuta el siguiente comando para correr todos los tests:
   ```sh
   mvn test
   ```
3. Para ejecutar solo los tests con un tag específico (por ejemplo, @login):
   ```sh
   mvn test -Dkarate.options="--tags @login"
   ```
4. Los reportes se generarán en la carpeta `target/karate-reports`.

## Notas
- Asegúrate de que la API https://serverest.dev esté disponible antes de ejecutar las pruebas.
- Los datos de usuario se generan aleatoriamente para evitar conflictos de duplicidad.
- Consulta los features para ver ejemplos de casos positivos y negativos.

---

QA Automation
Victoria Ravello
