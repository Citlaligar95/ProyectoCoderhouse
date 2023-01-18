	-- ** PRIMER EJERCICIO DE STORE PROCEDURE ** --

-- El SP se realizo para visualizar los productos con mayores o menores ventas por tipo de producto
DELIMITER $$
CREATE PROCEDURE sp_ventas_por_tipo_producto (IN tipo_parametro ENUM('Juguetes','Recuerdos','Cosmeticos','Papeleria','Ropa','Articulos_hogar'), IN ordenamiento_parametro ENUM('DESC', 'ASC') ) 
BEGIN
	IF ordenamiento_parametro = 'DESC' THEN
		SELECT nombre_producto, d.id_producto, inventario_inicial, inventario_final, cantidad AS ventas, precio_unitario
		FROM productos p
		INNER JOIN detalle d ON p.id_producto=d.id_producto
		WHERE tipo=tipo_parametro ORDER BY cantidad DESC ;
	ELSE 
		SELECT nombre_producto, d.id_producto, inventario_inicial, inventario_final, cantidad AS ventas, precio_unitario
		FROM productos p
		INNER JOIN detalle d ON p.id_producto=d.id_producto
		WHERE tipo=tipo_parametro ORDER BY cantidad;
	END IF;
END
$$

-- Para mandar a llamar el store procedure del ejercicio 1

CALL sp_ventas_por_tipo_producto ('Papeleria', 'DESC')




							-- ** SEGUNDO EJERCICIO DE STORE PROCEDURE ** --


-- Crear un procedimiento almacenado para agregar un nuevo producto
-- sp_inserta_producto (id_producto, id_proveedor, nombre_producto, fecha_entrada
--  tipo, precio_inicial, precio_venta, inventario_inicial, inventario_final)

DELIMITER $$
CREATE PROCEDURE sp_inserta_producto(
		IN id_producto_parametro INT,
        IN id_proveedor_parametro INT,
        IN nombre_producto_parametro VARCHAR(50),
        IN fecha_entrada_parametro DATE,
        IN tipo_parametro ENUM ('Juguetes','Recuerdos','Cosmeticos','Papeleria','Ropa','Articulos_hogar'),
        IN precio_inicial_parametro FLOAT,
        IN precio_venta_parametro FLOAT,
        IN inventario_inicial_parametro INT,
        IN inventario_final_parametro INT
)
BEGIN
	INSERT INTO productos (
		id_producto,
        id_proveedor,
        nombre_producto,
        fecha_entrada,
        tipo,
        precio_inicial,
        precio_venta,
        inventario_inicial,
        inventario_final
	)
	VALUES (
		id_producto_parametro,
        id_proveedor_parametro,
        nombre_producto_parametro,
        fecha_entrada_parametro,
        tipo_parametro,
        precio_inicial_parametro,
        precio_venta_parametro,
        inventario_inicial_parametro,
        inventario_final_parametro
	);
    SELECT 'Producto ingresado correctamente....';
END
$$;

-- Invocar sp
CALL sp_inserta_producto (
		NULL,
        2022122802,
        'Nintendo mini',
        '2023-01-11',
        'Juguetes',
        500,
        650,
        2,
        2
);

-- Revisar datos
SELECT*FROM productos ORDER BY id_producto DESC;
        
SELECT*FROM productos;

