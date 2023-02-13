/* Se creo el usuario alanfernando*/
CREATE USER 'alanfernando' IDENTIFIED BY 'HB300398'; 

/* Se le asignan permisos de solo lectura para las tablas y vistas del Schema tienda_regalos, el usuario no podrá eliminar información*/
GRANT SELECT ON tienda_regalos.cliente TO 'alanfernando';
GRANT SELECT ON tienda_regalos.detalle TO 'alanfernando';
GRANT SELECT ON tienda_regalos.facturas TO 'alanfernando';
GRANT SELECT ON tienda_regalos.forma_pago TO 'alanfernando';
GRANT SELECT ON tienda_regalos.new_productos TO 'alanfernando';
GRANT SELECT ON tienda_regalos.productos TO 'alanfernando';
GRANT SELECT ON tienda_regalos.proveedor TO 'alanfernando';
GRANT SELECT ON tienda_regalos.view_categoria TO 'alanfernando';
GRANT SELECT ON tienda_regalos.view_compra_cliente TO 'alanfernando';
GRANT SELECT ON tienda_regalos.view_inventariofinal TO 'alanfernando';
GRANT SELECT ON tienda_regalos.view_productos TO 'alanfernando';

SHOW GRANTS FOR 'alanfernando';

/*Se crea el usuario uligagu*/
CREATE USER 'uligagu' IDENTIFIED BY '061190';

/*Tendrá permisos de lectura, inserción y Modificación de datos, no podrá eliminar registros*/

GRANT SELECT, INSERT, UPDATE ON  tienda_regalos.cliente TO 'uligagu';
GRANT SELECT, INSERT, UPDATE ON  tienda_regalos.detalle TO 'uligagu';
GRANT SELECT, INSERT, UPDATE ON  tienda_regalos.facturas TO 'uligagu';
GRANT SELECT, INSERT, UPDATE ON  tienda_regalos.forma_pago TO 'uligagu';
GRANT SELECT, INSERT, UPDATE ON  tienda_regalos.new_productos TO 'uligagu';
GRANT SELECT, INSERT, UPDATE ON  tienda_regalos.productos TO 'uligagu';
GRANT SELECT, INSERT, UPDATE ON  tienda_regalos.proveedor TO 'uligagu';
GRANT SELECT, INSERT, UPDATE ON  tienda_regalos.view_categoria TO 'uligagu';
GRANT SELECT, INSERT, UPDATE ON  tienda_regalos.view_compra_cliente TO 'uligagu';
GRANT SELECT, INSERT, UPDATE ON  tienda_regalos.view_inventariofinal TO 'uligagu';
GRANT SELECT, INSERT, UPDATE ON  tienda_regalos.view_productos TO 'uligagu';


SHOW GRANTS FOR 'uligagu';