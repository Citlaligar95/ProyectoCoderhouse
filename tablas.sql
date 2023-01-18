CREATE SCHEMA tienda_regalos;
USE tienda_regalos;

CREATE TABLE proveedor (
	id_proveedor INT NOT NULL auto_increment,
    nombre_proveedor VARCHAR(50) NOT NULL,
    tel_proveedor VARCHAR(12),
    email VARCHAR(30) NOT NULL,
    direccion_proveedor VARCHAR(100) ,
    primary key (id_proveedor)
    );
    
CREATE TABLE productos (
	id_producto INT NOT NULL auto_increment,
    id_proveedor INT NOT NULL,
    nombre_producto VARCHAR(50) NOT NULL,
	fecha_entrada DATE NOT NULL,
    tipo ENUM ('Juguetes', 'Recuerdos', 'Cosmeticos', 'Papeleria',
    'Ropa','Articulos_hogar'),
    precio_inicial FLOAT NOT NULL,
    precio_venta FLOAT NOT NULL,
    inventario_inicial INT NOT NULL, 
    inventario_final INT NOT NULL, 
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

CREATE TABLE forma_pago (
	id_pago INT NOT NULL,
    descripcion_pago ENUM ('Transferencia', 'Efectivo'),
	PRIMARY KEY (id_pago)
);

CREATE TABLE cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR (50) NOT NULL,
    tel_cliente VARCHAR(12), 
    direccion_cliente VARCHAR(100),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE facturas (
	id_factura INT NOT NULL AUTO_INCREMENT,
    id_cliente INT,
    id_pago INT,
    fecha DATE NOT NULL,
    total FLOAT NOT NULL,
    PRIMARY KEY (id_factura),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_pago) REFERENCES forma_pago(id_pago)
);

CREATE TABLE detalle (
	id_detalle INT NOT NULL AUTO_INCREMENT,
	id_factura INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario FLOAT NOT NULL,
    PRIMARY KEY (id_detalle),
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);