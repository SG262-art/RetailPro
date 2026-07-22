TechStore
MODULO 4 - UNIDAD 1

SQL SELECT Fundamentals
Este repositorio contiene la solución a la práctica guiada de extracción de datos y formateo con consultas SQL (SELECT) para el equipo de Finanzas de TechStore.

Estructura del Repositorio
sql-select-fundamentals/
├── consultas_basicas.sql
└── README.md

Respuestas a Preguntas Técnicas y Documentación
1. ¿Por qué es una mala práctica utilizar SELECT * en entornos de producción?

    Aunque SELECT * es una herramienta útil para explorar la estructura de una tabla durante la fase de desarrollo local, su uso en entornos productivos se considera una mala práctica debido a tres razones fundamentales:

    Impacto en el Rendimiento y Uso de Memoria: Al solicitar todas las columnas de una tabla, el motor de la base de datos debe realizar operaciones de lectura adicionales en disco y transferir más datos a través de la red. Si la tabla contiene millones de registros o campos pesados, esto degrada severamente el tiempo de respuesta.

    Fragilidad del Código y Mantenibilidad: Si la estructura de la tabla cambia en el futuro (por ejemplo, si se agregan, eliminan o reordenan columnas), las aplicaciones que consuman la consulta pueden romper sus procesos automáticos al recibir un número inesperado de campos.

    Seguridad e Integridad de Datos: SELECT * expone la totalidad de la tabla, lo que podría filtrar involuntariamente campos sensibles o confidenciales a usuarios o reportes que no deberían tener acceso a ellos.

2. ¿Por qué son importantes los alias (AS) para un stakeholder no técnico?
   
   Los stakeholders de negocio (como los analistas del área financiera) no están obligados a conocer las convenciones de nombres técnicas, abreviaciones o códigos de las bases de datos. Los alias (AS) permiten traducir términos de desarrollo a un lenguaje comprensible de cara al negocio.

Ejemplo:

    Sin alias: Si ejecutamos "SELECT total_amount FROM sales;", el reporte mostrará en la cabecera "total_amount". Para un analista financiero, esto puede prestarse a ambigüedades: ¿es el monto bruto, el monto con impuestos o el costo de producción?

    Con alias: Si ejecutamos "SELECT total_amount AS monto_total_facturado FROM sales;", el reporte presenta una etiqueta clara e inconfundible en español: monto_total_facturado, eliminando la necesidad de explicaciones adicionales y permitiendo que Finanzas tome decisiones de forma directa.

