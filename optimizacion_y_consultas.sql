-- ════════════════════════════════════════════════════════════════════════════
-- TechStore — Script de Optimización y Consultas Avanzadas (Módulo 3 - Extra)
-- Propósito: Implementación de sugerencias de mejora del evaluador para el archivo Ventas_Tech_DB.sql
-- ════════════════════════════════════════════════════════════════════════════

-- CREACIÓN DE ÍNDICES

CREATE INDEX idx_clientes_email -- Búsquedas frecuentes por correo electrónico.
ON clientes(email);

CREATE INDEX idx_productos_nombre -- Búsquedas en el catálogo de productos
ON productos(nombre_producto);


-- CONSULTAS COMPLEJAS 

-- PRÁCTICA 1: Reporte Maestro de Ventas: consolida hechos numéricos con sus descripciones, calculando el subtotal de cada transacción.
-- Utilicé: SELECT, FROM/JOIN y ORDER BY. Para el alias de las atblas, letra antes del punto v., c. y p.

SELECT 
    v.id_venta,
    v.fecha_venta,
    c.nombre AS nombre_cliente,
    c.ciudad,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS subtotal_calculado
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
JOIN categorias cat ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta DESC;
-- El SELECT, define el contenido del reporte. Se elige por ejemplo el datos específico que se requiere ver como el nombre del cliente, y calcula los totales. 
-- Es como armar la lista de las columnas que va a tener tu tabla final.
-- El FROM y los JOIN, es la que une la información dispersa en las cuatro tablas. El nombre real de un cliente en su respectiva tabla y lo muestre en el reporte en lugar de ver solo su número de ID.

-- PRÁCTICA 2: Auditoría de Segmento de Alta Gama por Categoría


SELECT 
    c.nombre AS cliente,
    c.email,
    p.nombre_producto,
    p.precio,
    v.cantidad,
    v.fecha_venta
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE cat.nombre_categoria = 'Computación' 
  AND p.precio > 400.00;
-- Ejemplo: Filtra transacciones enfocadas en la categoría de Computación con precios de lista superiores a los 400.00 USD para identificar compras críticas.
-- El SELECT, define los datos específicos qpara inspeccionar, seleccionando únicamente el nombre del cliente, su correo de contacto, qué producto compró, 
-- cuánto cuesta de lista, cuántas unidades se llevó y el día exacto de la transacción.
-- El FROM y los JOIN, cruza las tablas para reconstruir la historia del producto. 
-- Conecta la tabla de hechos ventas con los catálogos de clientes, productos y categorias, para verificar simultáneamente toda la relación comercial del articulo en un solo paso.

