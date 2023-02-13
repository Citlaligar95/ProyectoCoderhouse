-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tienda_regalos
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (122801,'Sara Teresa Sanchez del Pilar','9531827578','Nacional #28'),(122802,'Juan Fernando Perez del Corral','9536387340','Nuyo #67'),(122803,'Valentina Laverde de la Rosa','9533037747','Zaragoza #34'),(122804,'Julieta Ponce de Leon','9535819552','Nuyo #65'),(122805,'Martin ElÃ­as de los Rios Acosta','9533438211','Prolongacion de Nuyo #8'),(122806,'Matias de Greiff Rincon','9535059563','Allende #80'),(122807,'Ana Maria de la PeÃ±a Posada','9536656133','16 de Septiembre #9'),(122808,'Monica Patricia de Avalos Mendoza','9533625843','Zaragoza #5'),(122809,'Sara Perez Acevedo','9534939577','Nacional #56'),(122810,'Elvia MuÃ±oz Ramirez','9531466083','Nuyo#25');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
INSERT INTO `detalle` VALUES (3,10017,222803,2,15),(4,10017,222804,1,20),(5,10018,222811,1,180),(6,10019,222814,1,150),(7,10020,222817,1,180);
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (10017,122801,1,'2023-01-11',NULL),(10018,122802,1,'2023-01-11',NULL),(10019,122803,2,'2023-01-13',NULL),(10020,122804,1,'2023-01-16',NULL),(10025,122801,1,'2023-01-11',NULL),(10026,122802,1,'2023-01-11',NULL),(10027,122803,2,'2023-01-13',NULL),(10028,122804,1,'2023-01-16',NULL),(10029,122805,2,'2023-01-18',NULL),(10030,122806,2,'2023-01-18',NULL),(10031,122807,1,'2023-01-25',NULL),(10032,122808,2,'2023-01-25',NULL);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (1,'Transferencia'),(2,'Efectivo');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `new_productos`
--

LOCK TABLES `new_productos` WRITE;
/*!40000 ALTER TABLE `new_productos` DISABLE KEYS */;
INSERT INTO `new_productos` VALUES (1,222801,'Bicicleta barbie','2022-01-12','Juguetes',300,450,3,2,'2023-01-17 03:29:49','root@localhost'),(2,222861,'Lapicera nina','2023-01-16','Papeleria',15,25,4,4,'2023-01-17 03:31:24','root@localhost'),(3,222801,'Bicicleta barbie','2022-01-12','Juguetes',300,450,3,2,'2023-01-17 06:27:34','root@localhost'),(4,222802,'Alajero musical','2022-01-13','Recuerdos',80,130,2,1,'2023-01-17 06:34:27','root@localhost'),(5,222802,'Alajero musical','2022-01-13','Recuerdos',80,130,2,1,'2023-01-17 06:35:23','root@localhost'),(6,222802,'Alajero musical','2022-01-13','Recuerdos',80,130,2,-1,'2023-01-17 06:46:30','root@localhost'),(7,222801,'Bicicleta barbie','2022-01-12','Juguetes',300,450,3,0,'2023-01-17 06:47:58','root@localhost'),(8,222801,'Bicicleta barbie','2022-01-12','Juguetes',300,450,3,-1,'2023-01-17 07:03:26','root@localhost'),(9,222802,'Alajero musical','2022-01-13','Recuerdos',80,130,2,-2,'2023-01-17 07:04:13','root@localhost');
/*!40000 ALTER TABLE `new_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (222801,2022122801,'Bicicleta barbie','2022-01-12','Juguetes',300,450,3,0),(222802,2022122802,'Alajero musical','2022-01-13','Recuerdos',80,130,2,0),(222803,2022122803,'Labial Bissu','2022-01-14','Cosmeticos',10,15,10,8),(222804,2022122804,'Libreta','2022-01-15','Papeleria',15,20,10,8),(222805,2022122805,'Calceta nino','2022-01-16','Ropa',8,12,12,9),(222806,2022122806,'Jarra vidrio','2022-01-17','Articulos_hogar',120,180,2,2),(222807,2022122807,'Carro control remoto','2022-01-18','Juguetes',200,300,2,2),(222808,2022122808,'Muneca de porcelana','2022-01-19','Recuerdos',50,75,3,3),(222809,2022122809,'Rubor Bissu','2022-01-20','Cosmeticos',20,30,5,5),(222810,2022122810,'Lapicero','2022-01-21','Papeleria',2.5,4,50,40),(222811,2022122801,'Vestido nina bebe','2022-01-22','Ropa',120,180,3,3),(222812,2022122802,'Juego de vasos vidrio','2022-01-23','Articulos_hogar',150,200,2,1),(222813,2022122803,'Barbie Ambulancia Hospital 2 en 1','2022-01-24','Juguetes',250,350,2,1),(222814,2022122804,'Buho porcelana','2022-01-25','Recuerdos',100,150,1,1),(222815,2022122805,'Sombra colores','2022-01-26','Cosmeticos',30,50,5,4),(222816,2022122806,'Goma','2022-01-27','Papeleria',2,3.5,80,65),(222817,2022122807,'Pantalon nino bebe','2022-01-28','Ropa',135,180,2,2),(222818,2022122808,'Juego platos vidrio','2022-01-29','Articulos_hogar',300,400,3,2),(222819,2022122809,'Granja maletin de Playmobil','2022-01-30','Juguetes',150,200,2,1),(222820,2022122810,'Reloj caballero','2022-01-31','Recuerdos',250,300,2,2),(222821,2022122801,'Rubor Elegant','2022-02-01','Cosmeticos',80,120,2,1),(222822,2022122802,'Libreta pasta gruesa','2022-02-02','Papeleria',80,110,5,5),(222823,2022122803,'Calcetin caballero','2022-02-03','Ropa',15,20,10,9),(222824,2022122804,'Juego utensilios','2022-02-04','Articulos_hogar',140,180,3,3),(222825,2022122805,'Monopoly','2022-02-05','Juguetes',280,380,3,3),(222826,2022122806,'Reloj dama','2022-02-06','Recuerdos',260,320,3,3),(222827,2022122807,'Rimel','2022-02-07','Cosmeticos',15,25,15,13),(222828,2022122808,'Sacapuntas','2022-02-08','Papeleria',3,5,20,18),(222829,2022122809,'Gorro bebe','2022-02-09','Ropa',25,35,5,5),(222830,2022122810,'Termo ','2022-02-10','Articulos_hogar',80,120,5,4),(222831,2022122801,'Relojes inteligentes para ninos','2022-02-11','Juguetes',240,340,4,3),(222832,2022122802,'Dalmata metal','2022-02-12','Recuerdos',76.5,120,1,1),(222833,2022122803,'Pestanas postizas','2022-02-13','Cosmeticos',15,25,5,4),(222834,2022122804,'Plumones','2022-02-14','Papeleria',30,45,5,3),(222835,2022122805,'Zapatos bebe','2022-02-15','Ropa',130,170,2,2),(222836,2022122806,'Tupper Paquete 3pzas','2022-02-16','Articulos_hogar',80,120,3,2),(222837,2022122807,'Beyblade Feature Battle Stadium','2022-02-17','Juguetes',60,80,5,4),(222838,2022122808,'Album fotografia','2022-02-18','Recuerdos',89,130,3,3),(222839,2022122809,'Aretes','2022-02-19','Cosmeticos',80,125,4,4),(222840,2022122810,'Agenda','2022-02-20','Papeleria',60,80,4,3),(222841,2022122801,'Mochila nina','2022-02-21','Ropa',250,330,2,1),(222842,2022122802,'Licuadora mini','2022-02-22','Articulos_hogar',65,80,2,2),(222843,2022122803,'Nala Tigre','2022-02-23','Juguetes',50,65,1,1),(222844,2022122804,'Perfume','2022-02-24','Cosmeticos',45,75,3,2),(222845,2022122805,'Camisa nino','2022-02-25','Ropa',60,80,4,4),(222846,2022122806,'Wafflera mini','2022-02-26','Articulos_hogar',65,80,2,2),(222847,2022122807,'Dotty Dalmata','2022-02-27','Juguetes',50,65,1,1),(222848,2022122808,'Enchinador','2022-02-28','Cosmeticos',15,25,5,4),(222849,2022122809,'Baberos','2022-03-01','Ropa',15,25,10,8),(222850,2022122810,'Juego sarten','2022-03-02','Articulos_hogar',200,300,2,1),(222851,2022122801,'Nancy Hadas','2022-03-03','Juguetes',120,180,2,2),(222852,2022122802,'Delineador','2022-03-04','Cosmeticos',15,25,3,3),(222853,2022122803,'Marca texto','2022-03-05','Papeleria',25,35,4,3),(222854,2022122804,'Chamarra nino','2022-03-06','Ropa',150,200,2,2),(222855,2022122805,'Juego cuchillos','2022-03-07','Articulos_hogar',125,175,4,3),(222856,2022122810,'Barbie sirena','2023-01-03','Juguetes',350,450,1,0),(222858,2022122802,'Nintendo mini','2023-01-11','Juguetes',500,650,2,2),(222859,2022122802,'Lapicera nina','2023-01-16','Papeleria',15,25,4,4),(222860,2022122802,'Lapicera nina','2023-01-16','Papeleria',15,25,4,4),(222861,2022122802,'Lapicera nina','2023-01-16','Papeleria',15,25,4,4);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (2022122801,'ALGARA SA DE CV','5515201547','cam@mialegria.com','Camino Real de Toluca 154 Col Bellavista CP 01140  Alvaro Obregon Mexico DF'),(2022122802,'BEACH TOYS SA DE CV','5529553178','ammi90@hotmail.com','Paz montes de oca 75 Col General Anaya CP 03340 Benito Juarez Mexico DF'),(2022122803,'BEST CONSUMER DE MEXICO SA DE CV','5587107371','costumer@yahoo.com','Escape 8 1 Col Fraccionamiento Industrial Alce Blanco Naucalpan Edo de Mexico CP 53370'),(2022122804,'BICILEYCA SA DE CV','5550632262','jcka@bicileyla.com','Km127 Carretera Mexico Veracruz  Via Texcoco Col San Lorenzo Tlacualoyan'),(2022122805,'BINNEY SMITH SA DE CV','5516158004','aolmos@crayola.com','Calz De la venta 26 Col Fracc Industrial Cuamantla'),(2022122806,'DISTRIBUIDORA HAG SA DE CV','5511290011','mfreeman@avanel.com','Av Burocratas 619 A Col Burocratas del Estado'),(2022122807,'FOTORAMA DE MEXICO SA DE CV','5548803877','jzabala@fotorama.com','Manuel Avila Camacho 80 402 Col Lomas de Sotelo'),(2022122808,'FABRICA DE JUGUETES PIGO SA DE CV','5593335940','jpgo@fabjug.com','San Esteban 20 Col San Sebastian'),(2022122809,'GLAS FIRMA SA DE CV','5551293413','lvillareal@glasfirma.com','Calle 8 1034 Col Zona Industrial  CP 44940 Guadalajara Jalisco'),(2022122810,'GRUPO INDUSTRIAL FREEMAN SA DE CV','5514688479','bfreeman@hotmail.com','Julian Villareal 1501 A Col Terminal Monterrey CP 64580 Monterrey Nuevo Leon');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-29 19:45:09
