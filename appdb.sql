CREATE DATABASE  IF NOT EXISTS `appdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `appdb`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: appdb
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `asignado`
--

DROP TABLE IF EXISTS `asignado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignado` (
  `chr_asigcodigo` char(6) NOT NULL,
  `chr_sucucodigo` char(3) NOT NULL,
  `chr_emplcodigo` char(4) NOT NULL,
  `dtt_asigfechaalta` date NOT NULL,
  `dtt_asigfechabaja` date DEFAULT NULL,
  PRIMARY KEY (`chr_asigcodigo`),
  KEY `idx_asignado01` (`chr_emplcodigo`),
  KEY `idx_asignado02` (`chr_sucucodigo`),
  CONSTRAINT `fk_asignado_empleado` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `empleado` (`chr_emplcodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_asignado_sucursal` FOREIGN KEY (`chr_sucucodigo`) REFERENCES `sucursal` (`chr_sucucodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignado`
--

LOCK TABLES `asignado` WRITE;
/*!40000 ALTER TABLE `asignado` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargomantenimiento`
--

DROP TABLE IF EXISTS `cargomantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargomantenimiento` (
  `chr_monecodigo` char(2) NOT NULL,
  `dec_cargMontoMaximo` decimal(12,2) NOT NULL,
  `dec_cargImporte` decimal(12,2) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`),
  KEY `idx_cargomantenimiento01` (`chr_monecodigo`),
  CONSTRAINT `fk_cargomantenimiento_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `moneda` (`chr_monecodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargomantenimiento`
--

LOCK TABLES `cargomantenimiento` WRITE;
/*!40000 ALTER TABLE `cargomantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargomantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `chr_cliecodigo` char(5) NOT NULL,
  `vch_cliepaterno` varchar(255) DEFAULT NULL,
  `vch_cliematerno` varchar(255) DEFAULT NULL,
  `vch_clienombre` varchar(255) DEFAULT NULL,
  `chr_cliedni` varchar(255) DEFAULT NULL,
  `vch_clieciudad` varchar(255) DEFAULT NULL,
  `vch_cliedireccion` varchar(255) DEFAULT NULL,
  `vch_clietelefono` varchar(255) DEFAULT NULL,
  `vch_clieemail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`chr_cliecodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('1','Pérez','González','Luis','123456789','Quito','Av. Amazonas 123','0987654321','cliente@example.com'),('10',NULL,NULL,'Pirlo',NULL,NULL,NULL,'0993396357','pirlo@gmail.com'),('2','Perez','Gonzales','Luis','12345678','Quito','Av. Amazonas 123','0987654321','cliente@example.com'),('3','Abad','Gonzales','Daniel','12345678','Quito','Av. Amazonas 123','0987654321','cliente@example.com'),('4','Ramirez','Gonzales','Jose','12345678','Quito','Av. Amazonas 123','0987654321','cliente@example.com'),('5','Ramirez','González','Jose','12345678','Quito','Av. Amazonas 123','0987654321','cliente@example.com'),('6','Abad',NULL,'Daniel',NULL,NULL,NULL,'0993396358','dani.patino902@gmail.com'),('7',NULL,NULL,'Prueba',NULL,NULL,NULL,'099785236','prueba@gmail.com'),('8',NULL,NULL,'prueba2',NULL,NULL,NULL,'012345678','prueba2@gmail.com'),('9',NULL,NULL,'Daniel',NULL,NULL,NULL,'0993396358','danielabad@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contador`
--

DROP TABLE IF EXISTS `contador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contador` (
  `vch_conttabla` varchar(30) NOT NULL,
  `int_contitem` int NOT NULL,
  `int_contlongitud` int NOT NULL,
  PRIMARY KEY (`vch_conttabla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contador`
--

LOCK TABLES `contador` WRITE;
/*!40000 ALTER TABLE `contador` DISABLE KEYS */;
/*!40000 ALTER TABLE `contador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costomovimiento`
--

DROP TABLE IF EXISTS `costomovimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costomovimiento` (
  `chr_monecodigo` char(2) NOT NULL,
  `dec_costimporte` decimal(12,2) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`),
  KEY `idx_costomovimiento` (`chr_monecodigo`),
  CONSTRAINT `fk_costomovimiento_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `moneda` (`chr_monecodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costomovimiento`
--

LOCK TABLES `costomovimiento` WRITE;
/*!40000 ALTER TABLE `costomovimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `costomovimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `chr_cuencodigo` char(8) NOT NULL,
  `chr_monecodigo` char(2) NOT NULL,
  `chr_sucucodigo` char(3) NOT NULL,
  `chr_emplcreacuenta` char(4) NOT NULL,
  `chr_cliecodigo` char(5) NOT NULL,
  `dec_cuensaldo` decimal(12,2) NOT NULL,
  `dtt_cuenfechacreacion` date NOT NULL,
  `vch_cuenestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `int_cuencontmov` int NOT NULL,
  `chr_cuenclave` varchar(6) NOT NULL,
  PRIMARY KEY (`chr_cuencodigo`),
  KEY `idx_cuenta01` (`chr_cliecodigo`),
  KEY `idx_cuenta02` (`chr_emplcreacuenta`),
  KEY `idx_cuenta03` (`chr_sucucodigo`),
  KEY `idx_cuenta04` (`chr_monecodigo`),
  CONSTRAINT `fk_cuenta_cliente` FOREIGN KEY (`chr_cliecodigo`) REFERENCES `cliente` (`chr_cliecodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cuenta_empleado` FOREIGN KEY (`chr_emplcreacuenta`) REFERENCES `empleado` (`chr_emplcodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cuenta_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `moneda` (`chr_monecodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cuenta_sucursal` FOREIGN KEY (`chr_sucucodigo`) REFERENCES `sucursal` (`chr_sucucodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_cuenta_vch_cuenestado` CHECK ((`vch_cuenestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES ('123412','02','001','0002','3',1000.00,'2025-02-11','ACTIVO',0,'123456'),('123418','02','001','0002','5',1000.00,'2025-02-15','ACTIVO',0,'123456'),('12346','02','001','0002','2',1000.00,'2025-02-11','ACTIVO',0,'123456'),('123469','02','001','0002','1',1000.00,'2025-02-11','ACTIVO',0,'123456'),('12378','02','001','0002','4',1000.00,'2025-02-11','ACTIVO',0,'123456');
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `chr_emplcodigo` char(4) NOT NULL,
  `vch_emplpaterno` varchar(25) NOT NULL,
  `vch_emplmaterno` varchar(25) NOT NULL,
  `vch_emplnombre` varchar(30) NOT NULL,
  `vch_emplciudad` varchar(30) NOT NULL,
  `vch_empldireccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chr_emplcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('0002','Perez','Gomez','Juan','Quito','Av. 6 de Diciembre'),('0009','Ramirez','Lopes','Carlos','Quito','Av. 6 de Diciembre'),('1','Perez','Gomez','Juan','Quito','Av. 6 de Diciembre'),('2','Perez','Gomez','Juan','Quito','Av. 6 de Diciembre'),('3','Ramirez','Lopez','Carlos','Guayaquil','Av. 9 de Octubre'),('4','Fernandez','Torres','Maria','Cuenca','Av. Solano'),('5','Sanchez','Molina','Luis','Ambato','Av. Cevallos'),('6','Vargas','Jimenez','Ana','Loja','Av. Universitaria'),('7','Ortega','Castillo','Pedro','Manta','Calle Flavio Reyes'),('8','Castro','Chavez','Daniela','Esmeraldas','Calle Sucre');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interesmensual`
--

DROP TABLE IF EXISTS `interesmensual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interesmensual` (
  `chr_monecodigo` char(2) NOT NULL,
  `dec_inteimporte` decimal(12,2) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`),
  KEY `idx_interesmensual01` (`chr_monecodigo`),
  CONSTRAINT `fk_interesmensual_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `moneda` (`chr_monecodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interesmensual`
--

LOCK TABLES `interesmensual` WRITE;
/*!40000 ALTER TABLE `interesmensual` DISABLE KEYS */;
/*!40000 ALTER TABLE `interesmensual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logsession`
--

DROP TABLE IF EXISTS `logsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logsession` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `chr_emplcodigo` char(4) NOT NULL,
  `fec_ingreso` datetime NOT NULL,
  `fec_salida` datetime DEFAULT NULL,
  `ip` varchar(20) NOT NULL DEFAULT 'NONE',
  `hostname` varchar(100) NOT NULL DEFAULT 'NONE',
  PRIMARY KEY (`ID`),
  KEY `fk_log_session_empleado` (`chr_emplcodigo`),
  CONSTRAINT `fk_log_session_empleado` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `empleado` (`chr_emplcodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logsession`
--

LOCK TABLES `logsession` WRITE;
/*!40000 ALTER TABLE `logsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `logsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `int_moducodigo` int NOT NULL,
  `vch_modunombre` varchar(50) DEFAULT NULL,
  `vch_moduestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`int_moducodigo`),
  CONSTRAINT `chk_modulo_vch_moduestado` CHECK ((`vch_moduestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moneda` (
  `chr_monecodigo` char(2) NOT NULL,
  `vch_monedescripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` VALUES ('01','Soles'),('02','Dolares');
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `chr_cuencodigo` char(8) NOT NULL,
  `int_movinumero` int NOT NULL,
  `dtt_movifecha` datetime(6) DEFAULT NULL,
  `chr_emplcodigo` char(4) NOT NULL,
  `chr_tipocodigo` char(3) NOT NULL,
  `dec_moviimporte` decimal(38,2) DEFAULT NULL,
  `chr_cuenreferencia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`chr_cuencodigo`,`int_movinumero`),
  KEY `idx_movimiento01` (`chr_tipocodigo`),
  KEY `idx_movimiento02` (`chr_emplcodigo`),
  KEY `idx_movimiento03` (`chr_cuencodigo`),
  CONSTRAINT `fk_movimiento_cuenta` FOREIGN KEY (`chr_cuencodigo`) REFERENCES `cuenta` (`chr_cuencodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_movimiento_empleado` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `empleado` (`chr_emplcodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_movimiento_tipomovimiento` FOREIGN KEY (`chr_tipocodigo`) REFERENCES `tipomovimiento` (`chr_tipocodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_movimiento_dec_moviimporte` CHECK ((`dec_moviimporte` >= 0.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES ('123412',1,'2025-02-11 22:43:47.261000','0002','001',1000.00,NULL),('123418',1,'2025-02-15 19:22:11.592000','0002','001',1000.00,NULL),('12346',1,'2025-02-11 22:40:09.486000','0002','001',1000.00,NULL),('123469',1,'2025-02-11 22:18:14.961000','0002','001',1000.00,NULL),('12378',1,'2025-02-11 22:46:56.781000','0002','001',1000.00,NULL);
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro`
--

DROP TABLE IF EXISTS `parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametro` (
  `chr_paracodigo` char(3) NOT NULL,
  `vch_paradescripcion` varchar(50) NOT NULL,
  `vch_paravalor` varchar(70) NOT NULL,
  `vch_paraestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_paracodigo`),
  CONSTRAINT `chk_parametro_vch_paraestado` CHECK ((`vch_paraestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro`
--

LOCK TABLES `parametro` WRITE;
/*!40000 ALTER TABLE `parametro` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `chr_emplcodigo` char(4) NOT NULL,
  `int_moducodigo` int NOT NULL,
  `vch_permestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_emplcodigo`,`int_moducodigo`),
  KEY `int_moducodigo` (`int_moducodigo`),
  CONSTRAINT `permiso_ibfk_1` FOREIGN KEY (`int_moducodigo`) REFERENCES `modulo` (`int_moducodigo`),
  CONSTRAINT `permiso_ibfk_2` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `usuario` (`chr_emplcodigo`),
  CONSTRAINT `chk_permiso_vch_permestado` CHECK ((`vch_permestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `chr_sucucodigo` char(3) NOT NULL,
  `vch_sucunombre` varchar(50) NOT NULL,
  `vch_sucuciudad` varchar(30) NOT NULL,
  `vch_sucudireccion` varchar(50) DEFAULT NULL,
  `int_sucucontcuenta` int NOT NULL,
  PRIMARY KEY (`chr_sucucodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES ('001','Sucursal Quito Centro','Quito','Av. Amazonas 321',0);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomovimiento`
--

DROP TABLE IF EXISTS `tipomovimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipomovimiento` (
  `chr_tipocodigo` char(3) NOT NULL,
  `vch_tipodescripcion` varchar(40) NOT NULL,
  `vch_tipoaccion` varchar(10) NOT NULL,
  `vch_tipoestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_tipocodigo`),
  CONSTRAINT `chk_tipomovimiento_vch_tipoaccion` CHECK ((`vch_tipoaccion` in (_utf8mb4'INGRESO',_utf8mb4'SALIDA'))),
  CONSTRAINT `chk_tipomovimiento_vch_tipoestado` CHECK ((`vch_tipoestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomovimiento`
--

LOCK TABLES `tipomovimiento` WRITE;
/*!40000 ALTER TABLE `tipomovimiento` DISABLE KEYS */;
INSERT INTO `tipomovimiento` VALUES ('001','Apertura de Cuenta','INGRESO','ACTIVO'),('002','Cancelar Cuenta','SALIDA','ACTIVO'),('003','Deposito','INGRESO','ACTIVO'),('004','Retiro','SALIDA','ACTIVO'),('005','Interes','INGRESO','ACTIVO'),('006','Mantenimiento','SALIDA','ACTIVO'),('007','ITF','SALIDA','ACTIVO'),('008','Transferencia','INGRESO','ACTIVO'),('009','Transferencia','SALIDA','ACTIVO'),('010','Cargo por Movimiento','SALIDA','ACTIVO');
/*!40000 ALTER TABLE `tipomovimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `chr_emplcodigo` char(4) NOT NULL,
  `vch_emplusuario` varchar(20) NOT NULL,
  `vch_emplclave` varchar(50) NOT NULL,
  `vch_emplestado` varchar(15) DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_emplcodigo`),
  UNIQUE KEY `U_Usuario_vch_emplusuario` (`vch_emplusuario`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `empleado` (`chr_emplcodigo`),
  CONSTRAINT `chk_usuario_vch_emplestado` CHECK ((`vch_emplestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('0002','MONSTER9','6C3F6757E773775FD059E2F025BD14BA','ACTIVO'),('0009','Daniel2','262031397020FD8DF478EC13B4B096C5','ACTIVO'),('1','MONSTER','C893BAD68927B457DBED39460E6AFD62','ACTIVO');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'appdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-18  8:25:56
