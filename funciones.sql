												-- **PRIMERA FUNCIÓN**--

-- Creación de una función para consultar las ventas totales en cierta fech
DELIMITER $$
CREATE FUNCTION fn_total_venta_dia (venta_fecha_parametro DATE) RETURNS FLOAT
READS SQL DATA
BEGIN
	DECLARE resultado FLOAT;
    SET resultado= (SELECT SUM(total) FROM facturas 
	WHERE fecha=venta_fecha_parametro);
    RETURN resultado;

END
$$;

-- Consultar la segunda función

SELECT fn_total_venta_dia ('2022-05-25') AS Total_venta;




												-- **SEGUNDA  FUNCIÓN**--
						-- CREACION DE UNA FUNCIÒN PARA SABER EL PRODUCTO MAS VENDIDO

DELIMITER $$
CREATE FUNCTION fn_producto_mas_vendido (tipo_parametro ENUM('Juguetes','Recuerdos','Cosmeticos','Papeleria','Ropa','Articulos_hogar')) RETURNS VARCHAR (50) 
READS SQL DATA
BEGIN
	DECLARE resultado VARCHAR(50);
    SET resultado = (SELECT p.nombre_producto
					FROM productos p
					INNER JOIN detalle d ON p.id_producto=d.id_producto
					WHERE tipo=tipo_parametro  ORDER BY cantidad DESC 
					LIMIT 1);
	RETURN resultado;
    
END
$$;

-- Consultar la segunda función

SELECT fn_producto_mas_vendido  ('Juguetes') AS Producto_mayor_venta;
