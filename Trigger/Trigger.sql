-- Se crea una tabla bitacora llamada new_productos, en la cual se iran ingresando los nuevos productos

CREATE TABLE new_productos (
	id_new_productos INT PRIMARY KEY auto_increment,
	id_producto INT,
    nombre_producto VARCHAR(50),
    fecha_entrada DATE,
    tipo ENUM('Juguetes','Recuerdos','Cosmeticos','Papeleria','Ropa','Articulos_hogar'),
    precio_inicial FLOAT,
    precio_venta FLOAT,
    inventario_inicial INT,
    inventario_final INT,
    create_date TIMESTAMP,
    user VARCHAR(50)
    );
    
   -- TRIGGER BEFORE
   -- Registrara informaciòn de las actualizaciones de productos en la tabla new_productos
   
   DELIMITER $$
    CREATE TRIGGER tr_update_producto_before
    BEFORE UPDATE ON productos
    FOR EACH ROW
    BEGIN
    INSERT INTO new_productos (id_producto, nombre_producto, fecha_entrada, tipo, precio_inicial,
									precio_venta, inventario_inicial, inventario_final, create_date, user)
		VALUES (
			NEW.id_producto, NEW.nombre_producto, NEW.fecha_entrada, NEW.tipo, NEW.precio_inicial, 
            NEW.precio_venta, NEW.inventario_inicial, NEW.inventario_final, current_timestamp(), user()
            );
	END
    $$;
    
    -- Realizar una actualización de la tabla productos
    UPDATE productos
		SET nombre_producto='Bicicleta barbie'
        WHERE id_producto=222801;
        
	-- Validar que se reflejo la actualizaciòn en ambas tablas
	SELECT*FROM productos;
    SELECT*FROM new_productos;
    
    
    
    -- TRIGGER AFTER --
    -- Se registra en la tabla bitacora los registros de los nuevos productos agregados recientemente, esto para llevar un control.
      
   DELIMITER $$
    CREATE TRIGGER tr_insert_new_producto_after
    AFTER INSERT ON productos
    FOR EACH ROW
    BEGIN
		INSERT INTO new_productos (id_producto, nombre_producto, fecha_entrada, tipo, precio_inicial,
									precio_venta, inventario_inicial, inventario_final, create_date, user)
		VALUES (
			NEW.id_producto, NEW.nombre_producto, NEW.fecha_entrada, NEW.tipo, NEW.precio_inicial, 
            NEW.precio_venta, NEW.inventario_inicial, NEW.inventario_final,current_timestamp(), user()
            );
	END
    $$;
    
    -- Revisar ambas tablas, la tabla new_productos debe mostrarse vacía ya que aun no se agregan nuevos productos
    SELECT*FROM productos;
    SELECT*FROM new_productos;
    
    -- Se agrega un nuevo producto a la tabla Productos 
    INSERT INTO productos (id_producto, id_proveedor, nombre_producto,
							fecha_entrada, tipo, precio_inicial,
							precio_venta, inventario_inicial, 
                            inventario_final)
				VALUES (NULL, 2022122802, 'Lapicera nina',
						'2023-01-16', 'Papeleria', 15, 25, 4, 4);
                        
    -- Revisar ambas tablas, la tabla new_producto muestra el nuevo producto agregado
     SELECT*FROM productos;
    SELECT*FROM new_productos;
 

 
 
