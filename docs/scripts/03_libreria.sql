-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: grupo3
-- ------------------------------------------------------
-- Server version	8.0.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora` (
  `bitacoracod` int NOT NULL AUTO_INCREMENT,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(255) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint DEFAULT NULL,
  PRIMARY KEY (`bitacoracod`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(255) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

LOCK TABLES `funciones` WRITE;
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES ('Controllers\\Funciones\\Funcion','Controllers\\Funciones\\Funcion','ACT','CTR'),('Controllers\\Funciones\\Funciones','Controllers\\Funciones\\Funciones','ACT','CTR'),('Controllers\\Inicio\\Inicio','Controllers\\Inicio\\Inicio','ACT','CTR'),('Controllers\\Menu','Controllers\\Menu','ACT','CTR'),('Controllers\\Products\\Product','Controllers\\Products\\Product','ACT','CTR'),('Controllers\\Products\\Products','Controllers\\Products\\Products','ACT','CTR'),('Controllers\\Purchasedetails\\Purchasedetail','Controllers\\Purchasedetails\\Purchasedetail','ACT','CTR'),('Controllers\\Purchasedetails\\Purchasedetails','Controllers\\Purchasedetails\\Purchasedetails','ACT','CTR'),('Controllers\\Purchases\\Purchase','Controllers\\Purchases\\Purchase','ACT','CTR'),('Controllers\\Purchases\\Purchases','Controllers\\Purchases\\Purchases','ACT','CTR'),('Controllers\\Roles\\Rol','Controllers\\Roles\\Rol','ACT','CTR'),('Controllers\\Roles\\Roles','Controllers\\Roles\\Roles','ACT','CTR'),('Controllers\\Usuarios\\Usuario','Controllers\\Usuarios\\Usuario','ACT','CTR'),('Controllers\\Usuarios\\Usuarios','Controllers\\Usuarios\\Usuarios','ACT','CTR'),('Menu_PaymentCheckout','Menu_PaymentCheckout','ACT','MNU'),('mnt_adm','mnt_adm','ACT','FNC'),('mnt_cln','mnt_cln','ACT','FNC'),('mnt_funciones_del','mnt_funciones_del','ACT','FNC'),('mnt_funciones_new','mnt_funciones_new','ACT','FNC'),('mnt_funciones_upd','mnt_funciones_upd','ACT','FNC'),('mnt_products_del','mnt_products_del','ACT','FNC'),('mnt_products_new','mnt_products_new','ACT','FNC'),('mnt_products_upd','mnt_products_upd','ACT','FNC'),('mnt_purchases','mnt_purchases','ACT','FNC'),('mnt_purchases_del','mnt_purchases_del','ACT','FNC'),('mnt_purchases_new','mnt_purchases_new','ACT','FNC'),('mnt_purchases_upd','mnt_purchases_upd','ACT','FNC'),('mnt_roles_del','mnt_roles_del','ACT','FNC'),('mnt_roles_new','mnt_roles_new','ACT','FNC'),('mnt_roles_upd','mnt_roles_upd','ACT','FNC'),('mnt_users_del','mnt_users_del','ACT','FNC'),('mnt_users_new','mnt_users_new','ACT','FNC'),('mnt_users_upd','mnt_users_upd','ACT','FNC');
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones_roles`
--

DROP TABLE IF EXISTS `funciones_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funciones_roles` (
  `rolescod` varchar(128) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`fncod`),
  KEY `rol_funcion_key_idx` (`fncod`),
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`),
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones_roles`
--

LOCK TABLES `funciones_roles` WRITE;
/*!40000 ALTER TABLE `funciones_roles` DISABLE KEYS */;
INSERT INTO `funciones_roles` VALUES ('Admin','Controllers\\Funciones\\Funcion','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Funciones\\Funciones','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Inicio\\Inicio','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Menu','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Products\\Product','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Products\\Products','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Purchasedetails\\Purchasedetail','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Purchasedetails\\Purchasedetails','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Purchases\\Purchase','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Purchases\\Purchases','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Roles\\Rol','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Roles\\Roles','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Usuarios\\Usuario','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Usuarios\\Usuarios','ACT','2024-12-31 00:00:00'),('Admin','Menu_PaymentCheckout','ACT','2024-12-31 00:00:00'),('Admin','mnt_adm','ACT','2024-12-31 00:00:00'),('Admin','mnt_funciones_del','ACT','2024-12-31 00:00:00'),('Admin','mnt_funciones_new','ACT','2024-12-31 00:00:00'),('Admin','mnt_funciones_upd','ACT','2024-12-31 00:00:00'),('Admin','mnt_products_del','ACT','2024-12-31 00:00:00'),('Admin','mnt_products_new','ACT','2024-12-31 00:00:00'),('Admin','mnt_products_upd','ACT','2024-12-31 00:00:00'),('Admin','mnt_purchases_del','ACT','2024-12-31 00:00:00'),('Admin','mnt_purchases_new','ACT','2024-12-31 00:00:00'),('Admin','mnt_purchases_upd','ACT','2024-12-31 00:00:00'),('Admin','mnt_roles_del','ACT','2024-12-31 00:00:00'),('Admin','mnt_roles_new','ACT','2024-12-31 00:00:00'),('Admin','mnt_roles_upd','ACT','2024-12-31 00:00:00'),('Admin','mnt_users_del','ACT','2024-12-31 00:00:00'),('Admin','mnt_users_new','ACT','2024-12-31 00:00:00'),('Admin','mnt_users_upd','ACT','2024-12-31 00:00:00'),('Cliente','Controllers\\Inicio\\Inicio','ACT','2024-12-31 00:00:00'),('Cliente','Menu_PaymentCheckout','ACT','2024-12-31 00:00:00'),('Cliente','mnt_cln','ACT','2024-12-31 00:00:00');
/*!40000 ALTER TABLE `funciones_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `productDescription` text COLLATE utf8mb4_general_ci NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productImgUrl` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `productStock` int NOT NULL DEFAULT '0',
  `productStatus` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Cien Años de Soledad','Una obra maestra de Gabriel García Márquez que relata la historia de la familia Buendía a lo largo de varias generaciones en el pueblo ficticio de Macondo.',15.99,'https://th.bing.com/th/id/R.b914bed567ef08c11a012c3f40dc8820?rik=gPlclO%2b%2bwpfvng&pid=ImgRaw&r=0',10,'ACT'),(2,'El Quijote de la Mancha','La famosa novela de Miguel de Cervantes que narra las aventuras de Don Quijote y su fiel escudero Sancho Panza.',12.99,'https://www.marcialpons.es/media/img/portadas/2023/4/18/9788408270881jfif',8,'ACT'),(3,'1984','Una novela distópica escrita por George Orwell que presenta un mundo totalitario bajo la constante vigilancia del Gran Hermano.',14.50,'https://th.bing.com/th/id/R.f1b4e91832c4615a43955f2d0f5d1795?rik=MW2%2bzNXYZBR9hw&riu=http%3a%2f%2fwww.bookerworm.com%2fimages%2f1984.jpg&ehk=l8MIFhiWt69hsoMix5qeAYOzlObLECDEUWhhsiywKk4%3d&risl=&pid=ImgRaw&r=0',5,'ACT'),(4,'Matar a un Ruiseñor','Un clásico de la literatura estadounidense escrito por Harper Lee, que aborda temas de racismo y justicia en el sur de Estados Unidos.',13.75,'https://th.bing.com/th/id/R.7650f2046bf0f059370df6f8074e6e02?rik=NiAnP9x8f%2fXGQw&riu=http%3a%2f%2fquelibroleo.com%2fimages%2flibros%2f9%2f978%2f978841%2f9788417247201.jpg&ehk=ETEhY0JRUUtGW7v3tbHTsAdGx%2f48AfG0jUsuv%2ftRh6g%3d&risl=&pid=ImgRaw&r=0',7,'ACT'),(5,'Orgullo y Prejuicio','Una novela de Jane Austen que trata sobre las complejidades de las relaciones humanas y las diferencias de clase en la sociedad inglesa del siglo XIX.',11.25,'https://imagessl2.casadellibro.com/a/l/t0/82/9788415618782.jpg',6,'ACT'),(6,'El Principito','Una obra escrita por Antoine de Saint-Exupéry que cuenta la historia de un pequeño príncipe que viaja de planeta en planeta en busca de sabiduría.',10.99,'https://th.bing.com/th/id/R.64c72bde2d6f6a665019e16b70b1c28f?rik=4n%2fWUOSZ4f7n7w&pid=ImgRaw&r=0',12,'ACT'),(7,'El Señor de los Anillos: La Comunidad del Anillo','La primera parte de la épica trilogía de J.R.R. Tolkien, donde un joven hobbit llamado Frodo emprende una misión para destruir un poderoso anillo.',18.99,'https://images-na.ssl-images-amazon.com/images/I/91b0C2YNSrL.jpg',9,'ACT'),(8,'Crimen y Castigo','Una novela de Fyodor Dostoevsky que explora la moralidad y la psicología del crimen a través de la historia del joven estudiante Raskolnikov.',16.50,'https://th.bing.com/th/id/R.d024282024655c7c3356e567d3064b5d?rik=BCCIf0fDkny%2fQw&pid=ImgRaw&r=0',4,'ACT');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `id_purchase` varchar(450) COLLATE utf8mb4_general_ci NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `details` varchar(450) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usercod` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payments` mediumtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id_purchase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES ('1','2024-07-29',100.00,'Leche ','1','aaaa'),('2','2024-07-29',12.99,'El Quijote de la mancha','2','Paypal');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasedetail`
--

DROP TABLE IF EXISTS `purchasedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchasedetail` (
  `id_purchase` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `id_item_reference` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `unitary_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasedetail`
--

LOCK TABLES `purchasedetail` WRITE;
/*!40000 ALTER TABLE `purchasedetail` DISABLE KEYS */;
INSERT INTO `purchasedetail` VALUES ('1','Hola Hola',1000,100.00);
/*!40000 ALTER TABLE `purchasedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `rolescod` varchar(128) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('Admin','Administrador de la pagina','ACT'),('Cliente','Cliente de la pagina','ACT');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_usuarios` (
  `usercod` bigint NOT NULL,
  `rolescod` varchar(128) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usercod`,`rolescod`),
  KEY `rol_usuario_key_idx` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`),
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

LOCK TABLES `roles_usuarios` WRITE;
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
INSERT INTO `roles_usuarios` VALUES (1,'Admin','ACT','2024-03-19 00:00:00','2024-12-30 00:00:00'),(2,'Cliente','ACT','2024-03-19 00:00:00','2024-12-30 00:00:00');
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usercod` bigint NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'jerejere@gmail.com','John Doe','$2y$10$JY1BI5r1iSgcetqhXqFv8uGVmc3PfvPtctcE76XlqyItdiCn520J6','2024-07-31 15:46:57','ACT','2024-10-29 00:00:00','ACT','869c4a6db412b0fcc6314e0f6a451eb9d8a61adee6af38b4d1b8ad423e9250dc','2024-07-31 15:46:57','PBL'),(2,'fabio1@gmail.com','John Doe','$2y$10$9N7.EqSWWEG1bWZlsTDHwOXlLle1iwkHrsW4pYcm0MhLw.fxfX5T2','2024-08-01 00:24:07','ACT','2024-10-30 00:00:00','ACT','8ebc31b47a1d4582d6211d2db5b2e11610fb496d0bab2d2f467fce7df2fb51d3','2024-08-01 00:24:07','PBL');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-01  9:59:52
