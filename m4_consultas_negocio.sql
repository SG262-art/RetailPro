-- ============================================================
-- Módulo 4: Pre-entrega — Consultas SQL de Negocio
-- Proyecto: RetailPro
-- Base de Datos: Ventas_Tech_DB
-- Archivo: m4_consultas_negocio.sql
-- ============================================================

---------------------------------------------------------------
-- CONSULTA 1: Resumen Ejecutivo Mensual
---------------------------------------------------------------

SELECT --  Total facturado, cantidad de pedidos y ticket promedio por mes.
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_facturado,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
ORDER BY mes ASC;


---------------------------------------------------------------
-- CONSULTA 2: Ranking de Productos (Top 5)
---------------------------------------------------------------

SELECT  -- TOP 5 productos con mayor facturación y unidades vendidas.
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC
LIMIT 5;


---------------------------------------------------------------
-- CONSULTA 3: Clientes Recurrentes
---------------------------------------------------------------

SELECT -- Clientes que hayan realizado más de un pedido.
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY cantidad_pedidos DESC;


---------------------------------------------------------------
-- CONSULTA 4: Meses Por Encima/Por Debajo del Promedio
---------------------------------------------------------------

WITH facturacion_mensual AS ( -- Comparativa de facturación mensual contra el promedio mensual general.
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
-- ============================================================

/*
HALLAZGOS CONCRETOS DE NEGOCIO:

1. Concentración de Facturación en Producto Estrella:
   El producto 1: Laptop Pro 15; es el principal motor de ingresos del negocio, 
   generando $3600.00 en solo 2 transacciones. Representa más del 43% de la 
   facturación total del mes de marzo; de $8334.00 total.

2. Alta Recurrencia de Clientes Clave:
   El 100% de la base activa de clientes registrados ha realizado 
   exactamente 2 pedidos en el periodo analizado. Los clientes 
   1 y 5 destacan como los de mayor valor acumulado debido a la compra de equipos de gama alta.

3. Distribución y Ticket Promedio de Marzo:
   En el mes de marzo 2024, se registraron 10 transacciones con una facturación global de 
   $8334.00 y un ticket promedio por pedido de $833.40 .
*/

