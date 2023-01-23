DROP TRIGGER tr_stock_producto_after;

-- CREAR TRIGGER BEFORE PARA SUSTITUIR VALORES EN INVENTARIO_FINAL <0 
DELIMITER $$
	CREATE TRIGGER tr_stock_producto_before
    BEFORE UPDATE ON productos
    FOR EACH ROW
    BEGIN
		IF NEW.inventario_final<0 THEN
        SET NEW.inventario_final =0;
    END IF;
    END;
   
-- CREAR TRIGGER AFTER PARA DESCONTAR PRODUCTOS VENDIDOS DE LA TABLA PRODUCTOS
DELIMITER $$
    CREATE TRIGGER tr_stock_producto_after
    AFTER INSERT ON detalle
    FOR EACH ROW
    BEGIN
		DECLARE idP int default 0;
        DECLARE unid int default 0;
        set idP=NEW.id_producto;
        set unid= (SELECT SUM(cantidad) FROM detalle WHERE id_producto=idP);
        
        UPDATE productos set inventario_final= inventario_inicial-unid WHERE id_producto=idP;

	END
    $$;
    
    -- CREAR TRIGGER AFTER PARA SUMATORIA DEL TOTAL DE CADA FACTURA , CUANDO SE REGISTRE EL PRODUCTO EN LA PESTAÑA DETALLE
USE tienda_regalos;

DELIMITER $$
    CREATE TRIGGER tr_suma_factura
    AFTER INSERT ON detalle
    FOR EACH ROW
    BEGIN
		DECLARE idFact int default 0;
        DECLARE cant_total int default 0;
        set idFact=NEW.id_factura;
        set cant_total= (SELECT SUM(precio_unitario) FROM detalle WHERE id_factura=idFact);
        
        UPDATE facturas set total= cant_total WHERE id_factura=idFact;
	END
    $$;
    

    
