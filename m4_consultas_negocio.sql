-- ============================================================
-- Módulo 4: Pre-entrega — Consultas SQL de Negocio
-- Proyecto: RetailPro
-- Base de Datos: Ventas_Tech_DB
-- Archivo: m4_consultas_negocio.sql
-- ============================================================

---------------------------------------------------------------
-- CONSULTA 1: Resumen Ejecutivo Mensual
-- Muestra el total facturado, cantidad de pedidos y ticket promedio por mes.
---------------------------------------------------------------

SELECT 
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_facturado,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
ORDER BY mes ASC;


---------------------------------------------------------------
-- CONSULTA 2: Ranking de Productos (Top 5)
-- Muestra los 5 productos con mayor facturación y sus unidades vendidas.
---------------------------------------------------------------

SELECT 
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC
LIMIT 5;


---------------------------------------------------------------
-- CONSULTA 3: Clientes Recurrentes
-- Filtra id_cliente que hayan realizado más de un pedido.
---------------------------------------------------------------

SELECT 
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY cantidad_pedidos DESC;


---------------------------------------------------------------
-- CONSULTA 4: Meses Por Encima/Por Debajo del Promedio
-- Compara la facturación mensual contra el promedio mensual general.
---------------------------------------------------------------

WITH facturacion_mensual AS (
    SELECT 
        EXTRACT(MONTH FROM fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado_mes
    FROM ventas
    GROUP BY EXTRACT(MONTH FROM fecha_venta)
)
SELECT 
    mes,
    total_facturado_mes,
    CASE 
        WHEN total_facturado_mes > (SELECT AVG(total_facturado_mes) FROM facturacion_mensual) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparativa_promedio
FROM facturacion_mensual
ORDER BY mes ASC;


-- ============================================================
-- BLOQUE DE CIERRE: Hallazgos Concretos de Negocio
-- Base de Datos: Ventas_Tech_DB
-- ============================================================
/*

HALLAZGOS CONCRETOS DE NEGOCIO:

1. Concentración de Facturación en Producto Estrella:
   El producto 1: Laptop Pro 15; es el principal motor de ingresos del negocio, 
   generando $3,600.00 USD en solo 2 transacciones. Representa más del 43% de la 
   facturación total del mes de marzo, $8,334.00 USD.

2. Alta Recurrencia de Clientes Clave:
   El 100% de la base activa de clientes registrados los IDs 1 al 5 ha realizado 
   exactamente 2 pedidos en el periodo analizado. Los clientes 
   1 y 5 destacan como los MVP, de mayor valor acumulado debido a la compra de equipos de gama alta.

3. Distribución y Ticket Promedio de Marzo:
   En este mes se registraron 10 transacciones con una facturación global de 
   $8,334.00 USD y un ticket promedio por pedido de $833.40 USD.

*/
