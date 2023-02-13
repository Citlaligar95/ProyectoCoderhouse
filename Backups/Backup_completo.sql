CREATE DATABASE  IF NOT EXISTS `tienda_regalos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tienda_regalos`;
-- SE AGREGARON LAS TABLAS, VISTAS, FUNCTIONS, STORED PROCEDURES Y TRIGGERS DEL SCHEMA tienda_regalos
-- Nombre de las tablas: cliente, detalle, facturas, forma_pago, new_productos, productos, proveedor  
-- Database: tienda_regalos
-- ------------------------------------------------------
-- 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) NOT NULL,
  `tel_cliente` varchar(15) DEFAULT NULL,
  `direccion_cliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=122811 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (122801,'Sara Teresa Sanchez del Pilar','9531827578','Nacional #28'),(122802,'Juan Fernando Perez del Corral','9536387340','Nuyo #67'),(122803,'Valentina Laverde de la Rosa','9533037747','Zaragoza #34'),(122804,'Julieta Ponce de Leon','9535819552','Nuyo #65'),(122805,'Martin ElÃ­as de los Rios Acosta','9533438211','Prolongacion de Nuyo #8'),(122806,'Matias de Greiff Rincon','9535059563','Allende #80'),(122807,'Ana Maria de la PeÃ±a Posada','9536656133','16 de Septiembre #9'),(122808,'Monica Patricia de Avalos Mendoza','9533625843','Zaragoza #5'),(122809,'Sara Perez Acevedo','9534939577','Nacional #56'),(122810,'Elvia MuÃ±oz Ramirez','9531466083','Nuyo#25');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_factura` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` float NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `FK_detalle_facturas` (`id_factura`),
  KEY `FK_detalle_producto` (`id_producto`),
  CONSTRAINT `FK_detalle_facturas` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`) ON DELETE CASCADE,
  CONSTRAINT `FK_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
INSERT INTO `detalle` VALUES (3,10017,222803,2,15),(4,10017,222804,1,20),(5,10018,222811,1,180),(6,10019,222814,1,150),(7,10020,222817,1,180);
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_pago` int DEFAULT NULL,
  `fecha` date NOT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `facturas_ibfk_1` (`id_cliente`),
  KEY `facturas_ibfk_2` (`id_pago`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE,
  CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`id_pago`) REFERENCES `forma_pago` (`id_pago`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10033 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (10017,122801,1,'2023-01-11',NULL),(10018,122802,1,'2023-01-11',NULL),(10019,122803,2,'2023-01-13',NULL),(10020,122804,1,'2023-01-16',NULL),(10025,122801,1,'2023-01-11',NULL),(10026,122802,1,'2023-01-11',NULL),(10027,122803,2,'2023-01-13',NULL),(10028,122804,1,'2023-01-16',NULL),(10029,122805,2,'2023-01-18',NULL),(10030,122806,2,'2023-01-18',NULL),(10031,122807,1,'2023-01-25',NULL),(10032,122808,2,'2023-01-25',NULL);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pago` (
  `id_pago` int NOT NULL,
  `descripcion_pago` enum('Transferencia','Efectivo') DEFAULT NULL,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (1,'Transferencia'),(2,'Efectivo');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_productos`
--

DROP TABLE IF EXISTS `new_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_productos` (
  `id_new_productos` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `nombre_producto` varchar(50) DEFAULT NULL,
  `fecha_entrada` date DEFAULT NULL,
  `tipo` enum('Juguetes','Recuerdos','Cosmeticos','Papeleria','Ropa','Articulos_hogar') DEFAULT NULL,
  `precio_inicial` float DEFAULT NULL,
  `precio_venta` float DEFAULT NULL,
  `inventario_inicial` int DEFAULT NULL,
  `inventario_final` int DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_new_productos`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_productos`
--

LOCK TABLES `new_productos` WRITE;
/*!40000 ALTER TABLE `new_productos` DISABLE KEYS */;
INSERT INTO `new_productos` VALUES (1,222801,'Bicicleta barbie','2022-01-12','Juguetes',300,450,3,2,'2023-01-17 03:29:49','root@localhost'),(2,222861,'Lapicera nina','2023-01-16','Papeleria',15,25,4,4,'2023-01-17 03:31:24','root@localhost'),(3,222801,'Bicicleta barbie','2022-01-12','Juguetes',300,450,3,2,'2023-01-17 06:27:34','root@localhost'),(4,222802,'Alajero musical','2022-01-13','Recuerdos',80,130,2,1,'2023-01-17 06:34:27','root@localhost'),(5,222802,'Alajero musical','2022-01-13','Recuerdos',80,130,2,1,'2023-01-17 06:35:23','root@localhost'),(6,222802,'Alajero musical','2022-01-13','Recuerdos',80,130,2,-1,'2023-01-17 06:46:30','root@localhost'),(7,222801,'Bicicleta barbie','2022-01-12','Juguetes',300,450,3,0,'2023-01-17 06:47:58','root@localhost'),(8,222801,'Bicicleta barbie','2022-01-12','Juguetes',300,450,3,-1,'2023-01-17 07:03:26','root@localhost'),(9,222802,'Alajero musical','2022-01-13','Recuerdos',80,130,2,-2,'2023-01-17 07:04:13','root@localhost');
/*!40000 ALTER TABLE `new_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `tipo` enum('Juguetes','Recuerdos','Cosmeticos','Papeleria','Ropa','Articulos_hogar') DEFAULT NULL,
  `precio_inicial` float NOT NULL,
  `precio_venta` float NOT NULL,
  `inventario_inicial` int NOT NULL,
  `inventario_final` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=222862 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (222801,2022122801,'Bicicleta barbie','2022-01-12','Juguetes',300,450,3,0),(222802,2022122802,'Alajero musical','2022-01-13','Recuerdos',80,130,2,0),(222803,2022122803,'Labial Bissu','2022-01-14','Cosmeticos',10,15,10,8),(222804,2022122804,'Libreta','2022-01-15','Papeleria',15,20,10,8),(222805,2022122805,'Calceta nino','2022-01-16','Ropa',8,12,12,9),(222806,2022122806,'Jarra vidrio','2022-01-17','Articulos_hogar',120,180,2,2),(222807,2022122807,'Carro control remoto','2022-01-18','Juguetes',200,300,2,2),(222808,2022122808,'Muneca de porcelana','2022-01-19','Recuerdos',50,75,3,3),(222809,2022122809,'Rubor Bissu','2022-01-20','Cosmeticos',20,30,5,5),(222810,2022122810,'Lapicero','2022-01-21','Papeleria',2.5,4,50,40),(222811,2022122801,'Vestido nina bebe','2022-01-22','Ropa',120,180,3,3),(222812,2022122802,'Juego de vasos vidrio','2022-01-23','Articulos_hogar',150,200,2,1),(222813,2022122803,'Barbie Ambulancia Hospital 2 en 1','2022-01-24','Juguetes',250,350,2,1),(222814,2022122804,'Buho porcelana','2022-01-25','Recuerdos',100,150,1,1),(222815,2022122805,'Sombra colores','2022-01-26','Cosmeticos',30,50,5,4),(222816,2022122806,'Goma','2022-01-27','Papeleria',2,3.5,80,65),(222817,2022122807,'Pantalon nino bebe','2022-01-28','Ropa',135,180,2,2),(222818,2022122808,'Juego platos vidrio','2022-01-29','Articulos_hogar',300,400,3,2),(222819,2022122809,'Granja maletin de Playmobil','2022-01-30','Juguetes',150,200,2,1),(222820,2022122810,'Reloj caballero','2022-01-31','Recuerdos',250,300,2,2),(222821,2022122801,'Rubor Elegant','2022-02-01','Cosmeticos',80,120,2,1),(222822,2022122802,'Libreta pasta gruesa','2022-02-02','Papeleria',80,110,5,5),(222823,2022122803,'Calcetin caballero','2022-02-03','Ropa',15,20,10,9),(222824,2022122804,'Juego utensilios','2022-02-04','Articulos_hogar',140,180,3,3),(222825,2022122805,'Monopoly','2022-02-05','Juguetes',280,380,3,3),(222826,2022122806,'Reloj dama','2022-02-06','Recuerdos',260,320,3,3),(222827,2022122807,'Rimel','2022-02-07','Cosmeticos',15,25,15,13),(222828,2022122808,'Sacapuntas','2022-02-08','Papeleria',3,5,20,18),(222829,2022122809,'Gorro bebe','2022-02-09','Ropa',25,35,5,5),(222830,2022122810,'Termo ','2022-02-10','Articulos_hogar',80,120,5,4),(222831,2022122801,'Relojes inteligentes para ninos','2022-02-11','Juguetes',240,340,4,3),(222832,2022122802,'Dalmata metal','2022-02-12','Recuerdos',76.5,120,1,1),(222833,2022122803,'Pestanas postizas','2022-02-13','Cosmeticos',15,25,5,4),(222834,2022122804,'Plumones','2022-02-14','Papeleria',30,45,5,3),(222835,2022122805,'Zapatos bebe','2022-02-15','Ropa',130,170,2,2),(222836,2022122806,'Tupper Paquete 3pzas','2022-02-16','Articulos_hogar',80,120,3,2),(222837,2022122807,'Beyblade Feature Battle Stadium','2022-02-17','Juguetes',60,80,5,4),(222838,2022122808,'Album fotografia','2022-02-18','Recuerdos',89,130,3,3),(222839,2022122809,'Aretes','2022-02-19','Cosmeticos',80,125,4,4),(222840,2022122810,'Agenda','2022-02-20','Papeleria',60,80,4,3),(222841,2022122801,'Mochila nina','2022-02-21','Ropa',250,330,2,1),(222842,2022122802,'Licuadora mini','2022-02-22','Articulos_hogar',65,80,2,2),(222843,2022122803,'Nala Tigre','2022-02-23','Juguetes',50,65,1,1),(222844,2022122804,'Perfume','2022-02-24','Cosmeticos',45,75,3,2),(222845,2022122805,'Camisa nino','2022-02-25','Ropa',60,80,4,4),(222846,2022122806,'Wafflera mini','2022-02-26','Articulos_hogar',65,80,2,2),(222847,2022122807,'Dotty Dalmata','2022-02-27','Juguetes',50,65,1,1),(222848,2022122808,'Enchinador','2022-02-28','Cosmeticos',15,25,5,4),(222849,2022122809,'Baberos','2022-03-01','Ropa',15,25,10,8),(222850,2022122810,'Juego sarten','2022-03-02','Articulos_hogar',200,300,2,1),(222851,2022122801,'Nancy Hadas','2022-03-03','Juguetes',120,180,2,2),(222852,2022122802,'Delineador','2022-03-04','Cosmeticos',15,25,3,3),(222853,2022122803,'Marca texto','2022-03-05','Papeleria',25,35,4,3),(222854,2022122804,'Chamarra nino','2022-03-06','Ropa',150,200,2,2),(222855,2022122805,'Juego cuchillos','2022-03-07','Articulos_hogar',125,175,4,3),(222856,2022122810,'Barbie sirena','2023-01-03','Juguetes',350,450,1,0),(222858,2022122802,'Nintendo mini','2023-01-11','Juguetes',500,650,2,2),(222859,2022122802,'Lapicera nina','2023-01-16','Papeleria',15,25,4,4),(222860,2022122802,'Lapicera nina','2023-01-16','Papeleria',15,25,4,4),(222861,2022122802,'Lapicera nina','2023-01-16','Papeleria',15,25,4,4);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;

-- Trigger 
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_new_producto_after` AFTER INSERT ON `productos` FOR EACH ROW BEGIN
		INSERT INTO new_productos (id_producto, nombre_producto, fecha_entrada, tipo, precio_inicial,
									precio_venta, inventario_inicial, inventario_final, create_date, user)
		VALUES (
			NEW.id_producto, NEW.nombre_producto, NEW.fecha_entrada, NEW.tipo, NEW.precio_inicial, 
            NEW.precio_venta, NEW.inventario_inicial, NEW.inventario_final,current_timestamp(), user()
            );
	END */;;
DELIMITER ;


/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;


-- Trigger
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_producto_before` BEFORE UPDATE ON `productos` FOR EACH ROW BEGIN
    INSERT INTO new_productos (id_producto, nombre_producto, fecha_entrada, tipo, precio_inicial,
									precio_venta, inventario_inicial, inventario_final, create_date, user)
		VALUES (
			NEW.id_producto, NEW.nombre_producto, NEW.fecha_entrada, NEW.tipo, NEW.precio_inicial, 
            NEW.precio_venta, NEW.inventario_inicial, NEW.inventario_final, current_timestamp(), user()
            );
	END */;;
    
    
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;


-- Trigger
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_stock_producto_before` BEFORE UPDATE ON `productos` FOR EACH ROW BEGIN
		IF NEW.inventario_final<0 THEN
        SET NEW.inventario_final =0;
    END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(50) NOT NULL,
  `tel_proveedor` varchar(12) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `direccion_proveedor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2022122811 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (2022122801,'ALGARA SA DE CV','5515201547','cam@mialegria.com','Camino Real de Toluca 154 Col Bellavista CP 01140  Alvaro Obregon Mexico DF'),(2022122802,'BEACH TOYS SA DE CV','5529553178','ammi90@hotmail.com','Paz montes de oca 75 Col General Anaya CP 03340 Benito Juarez Mexico DF'),(2022122803,'BEST CONSUMER DE MEXICO SA DE CV','5587107371','costumer@yahoo.com','Escape 8 1 Col Fraccionamiento Industrial Alce Blanco Naucalpan Edo de Mexico CP 53370'),(2022122804,'BICILEYCA SA DE CV','5550632262','jcka@bicileyla.com','Km127 Carretera Mexico Veracruz  Via Texcoco Col San Lorenzo Tlacualoyan'),(2022122805,'BINNEY SMITH SA DE CV','5516158004','aolmos@crayola.com','Calz De la venta 26 Col Fracc Industrial Cuamantla'),(2022122806,'DISTRIBUIDORA HAG SA DE CV','5511290011','mfreeman@avanel.com','Av Burocratas 619 A Col Burocratas del Estado'),(2022122807,'FOTORAMA DE MEXICO SA DE CV','5548803877','jzabala@fotorama.com','Manuel Avila Camacho 80 402 Col Lomas de Sotelo'),(2022122808,'FABRICA DE JUGUETES PIGO SA DE CV','5593335940','jpgo@fabjug.com','San Esteban 20 Col San Sebastian'),(2022122809,'GLAS FIRMA SA DE CV','5551293413','lvillareal@glasfirma.com','Calle 8 1034 Col Zona Industrial  CP 44940 Guadalajara Jalisco'),(2022122810,'GRUPO INDUSTRIAL FREEMAN SA DE CV','5514688479','bfreeman@hotmail.com','Julian Villareal 1501 A Col Terminal Monterrey CP 64580 Monterrey Nuevo Leon');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_categoria`
--

DROP TABLE IF EXISTS `view_categoria`;
/*!50001 DROP VIEW IF EXISTS `view_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_categoria` AS SELECT 
 1 AS `nombre_proveedor`,
 1 AS `tipo`,
 1 AS `tel_proveedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_compra_cliente`
--

DROP TABLE IF EXISTS `view_compra_cliente`;
/*!50001 DROP VIEW IF EXISTS `view_compra_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_compra_cliente` AS SELECT 
 1 AS `nombre_cliente`,
 1 AS `tel_cliente`,
 1 AS `fecha`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_inventariofinal`
--

DROP TABLE IF EXISTS `view_inventariofinal`;
/*!50001 DROP VIEW IF EXISTS `view_inventariofinal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_inventariofinal` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre_producto`,
 1 AS `tipo`,
 1 AS `inventario_inicial`,
 1 AS `inventario_final`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_productos`
--

DROP TABLE IF EXISTS `view_productos`;
/*!50001 DROP VIEW IF EXISTS `view_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_productos` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre_producto`,
 1 AS `tipo`,
 1 AS `precio_venta`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'tienda_regalos'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_producto_mas_vendido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

-- Function
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_producto_mas_vendido`(tipo_parametro ENUM('Juguetes','Recuerdos','Cosmeticos','Papeleria','Ropa','Articulos_hogar')) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE resultado VARCHAR(50);
    SET resultado = (SELECT p.nombre_producto
					FROM productos p
					INNER JOIN detalle d ON p.id_producto=d.id_producto
					WHERE tipo=tipo_parametro  ORDER BY cantidad DESC 
					LIMIT 1);
	RETURN resultado;
    
END ;;

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_venta_dia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

-- Function
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_venta_dia`(venta_fecha_parametro DATE) RETURNS float
    READS SQL DATA
BEGIN
	DECLARE resultado FLOAT;
    SET resultado= (SELECT SUM(total) FROM facturas 
	WHERE fecha=venta_fecha_parametro);
    RETURN resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserta_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

-- Stored Procedures
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserta_producto`(
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
END ;;

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ventas_por_tipo_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

-- Stored Procedures
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ventas_por_tipo_producto`(IN tipo_parametro ENUM('Juguetes','Recuerdos','Cosmeticos','Papeleria','Ropa','Articulos_hogar'), IN ordenamiento_parametro ENUM('DESC', 'ASC') )
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_categoria`
--

/*!50001 DROP VIEW IF EXISTS `view_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_categoria` AS select distinct `b`.`nombre_proveedor` AS `nombre_proveedor`,`a`.`tipo` AS `tipo`,`b`.`tel_proveedor` AS `tel_proveedor` from (`productos` `a` join `proveedor` `b` on((`a`.`id_proveedor` = `b`.`id_proveedor`))) order by `a`.`tipo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_compra_cliente`
--

/*!50001 DROP VIEW IF EXISTS `view_compra_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_compra_cliente` AS select distinct `c`.`nombre_cliente` AS `nombre_cliente`,`c`.`tel_cliente` AS `tel_cliente`,`f`.`fecha` AS `fecha`,`f`.`total` AS `total` from (`facturas` `f` join `cliente` `c` on((`f`.`id_cliente` = `c`.`id_cliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_inventariofinal`
--

/*!50001 DROP VIEW IF EXISTS `view_inventariofinal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_inventariofinal` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`nombre_producto` AS `nombre_producto`,`productos`.`tipo` AS `tipo`,`productos`.`inventario_inicial` AS `inventario_inicial`,`productos`.`inventario_final` AS `inventario_final` from `productos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_productos`
--

/*!50001 DROP VIEW IF EXISTS `view_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_productos` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`nombre_producto` AS `nombre_producto`,`productos`.`tipo` AS `tipo`,`productos`.`precio_venta` AS `precio_venta` from `productos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-29 19:49:40
