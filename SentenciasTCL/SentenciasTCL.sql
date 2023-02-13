-- Eliminar registro de la tabla detalle y eliminar las facturas

START TRANSACTION;
	TRUNCATE TABLE
    detalle;
    
    UPDATE facturas
		SET total=0
    WHERE id_pago IN (1,2);
    
     DELETE FROM
    facturas 
    WHERE id_factura >10000;


ROLLBACK;
COMMIT;
SELECT*FROM facturas WHERE id_factura >10000;
SELECT*FROM facturas;
SELECT*FROM detalle;


-- INSERTAR REGISTRO EN FACTURAS Y TABLA DETALLE

START TRANSACTION; 
	INSERT INTO facturas (id_factura, id_cliente, id_pago, fecha,total) VALUES
						(NULL, 122801, 1, '2023-01-11', NULL);
	INSERT INTO facturas (id_factura, id_cliente, id_pago, fecha,total) VALUES
						(NULL, 122802, 1, '2023-01-11', NULL);
	INSERT INTO facturas (id_factura, id_cliente, id_pago, fecha,total) VALUES
						(NULL, 122803, 2, '2023-01-13', NULL);
	INSERT INTO facturas (id_factura, id_cliente, id_pago, fecha,total) VALUES
						(NULL, 122804, 1, '2023-01-16', NULL);
	SAVEPOINT facturas_1;
	INSERT INTO facturas (id_factura, id_cliente, id_pago, fecha,total) VALUES
						(NULL, 122805, 2, '2023-01-18', NULL);
	INSERT INTO facturas (id_factura, id_cliente, id_pago, fecha,total) VALUES
						(NULL, 122806, 2, '2023-01-18', NULL);
	INSERT INTO facturas (id_factura, id_cliente, id_pago, fecha,total) VALUES
						(NULL, 122807, 1, '2023-01-25', NULL);
	INSERT INTO facturas (id_factura, id_cliente, id_pago, fecha,total) VALUES
						(NULL, 122808, 2, '2023-01-25', NULL);
	SAVEPOINT facturas_2;
    
    ROLLBACK TO facturas_1; -- Se elimina el primer savepoint y solo se muestran los registros hasta el guardado de las facturas_1.
	

    