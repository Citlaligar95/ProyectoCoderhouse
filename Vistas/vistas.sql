CREATE OR REPLACE VIEW view_productos AS
(SELECT id_producto, nombre_producto, tipo, precio_venta FROM productos);

CREATE OR REPLACE VIEW view_inventariofinal AS
(SELECT id_producto, nombre_producto, tipo, inventario_inicial, inventario_final FROM productos);

CREATE OR REPLACE VIEW view_categoria AS
(SELECT DISTINCT nombre_proveedor,tipo, tel_proveedor 
FROM productos a
JOIN proveedor b ON (a.id_proveedor=b.id_proveedor)
ORDER BY tipo);

CREATE OR REPLACE VIEW view_compra_cliente AS
(SELECT DISTINCT nombre_cliente, tel_cliente, fecha, total 
FROM facturas f
JOIN cliente c ON (f.id_cliente=c.id_cliente));

