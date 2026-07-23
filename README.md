
# RetailPro 

# Repositorio del Proyecto de Data Analytics
# Base de Datos: PostgreSQL
# Herramienta SQL: VS Code - Extensión PostgreSQL (por Chris Kolkman)
# Control de Versiones: Git & GitHub

Este repositorio contiene la solución completa para la extracción de datos, modelado relacional y análisis de métricas clave de negocio para el equipo comercial y financiero de RetailPro, utilizando PostgreSQL sobre la base de datos Ventas_Tech_DB.

---

## Estructura del Repositorio

Data-Analytics/
RetailPro/
    Ventas_Tech_DB.sql
    m4_consultas_negocio.sql
Optimizacion/
    optimizacion_y_consultas.sql
Ejercicios_Previos/
    consultas_basicas.sql
README.md

---

## Módulos Desarrollados

### Módulo 3: Ingeniería y Modelo de Datos.

* Diseño e implementación DDL de la base de datos relacional `Ventas_Tech_DB` en PostgreSQL.


* Creación de las tablas `categorias`, `clientes`, `productos` y `ventas` garantizando la integridad referencial mediante claves PK y FK.


* Carga masiva de datos iniciales DML para simular transacciones reales de comercio electrónico.



### Módulo 4: Consultas de Negocio y Resumen.

Desarrollo del script `m4_consultas_negocio.sql` orientado a responder preguntas estratégicas mediante las funciones de: agregar `COUNT`, `SUM`, `AVG`, agrupar `GROUP BY`, `HAVING` y condición `CASE WHEN`.

1. **Resumen Ejecutivo Mensual:** Cálculo del total facturado, cantidad de pedidos y ticket promedio por mes.
2. **Ranking de Productos Top 5:** Identificación de los 5 productos con mayor facturación y volumen de unidades vendidas.
3. **Clientes Recurrentes:** Filtrado de clientes con más de un pedido registrado para medir la fidelidad.
4. **Comparativa de Performance Mensual:** Clasificación de los meses que quedaron de más o ménos del promedio mensual general utilizando `WITH`.
5. **Hallazgos de Negocio:** Documentación analítica con 3 conclusiones clave derivadas de las consultas.

---

## Respuestas Técnicas

### 1. ¿Por qué evitar `SELECT *` en producción?

* **Rendimiento:** Sobrecarga el disco y la red al traer datos innecesarios.
* **Fragilidad:** Si la tabla cambia de estructura, las aplicaciones asociadas se rompen.
* **Seguridad:** Expone campos sensibles o confidenciales innecesariamente.

### 2. ¿Por qué usar alias `AS` para el negocio?

Simple. Traducen términos técnicos a un lenguaje claro para los analistas y gerentes.

* **Sin alias:** `total_amount` que genera ambigüedad.
* **Con alias:** `total_amount AS total_facturado` es claro, directo e inconfundible.

---








