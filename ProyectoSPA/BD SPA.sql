CREATE DATABASE  IF NOT EXISTS `spa` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `spa`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: ruralia
-- ------------------------------------------------------
-- Server version	5.5.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `NifUsuario` varchar(9) NOT NULL DEFAULT '',
  `Nombre` varchar(45) NOT NULL DEFAULT '',
  `Apellidos` varchar(45) NOT NULL DEFAULT '',
  `Direccion` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`NifUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('10101010Z','VICTOR','CARDENAS BERLANGA','Calle Betis'),('11111111Z','EUGENIO','ROLDAN ROMASANTA','Calle Sevilla'),('12121212Z','RUBEN','PEREZ CAÑAS','Calle real'),('12341223Z','JUAN CARLOS','DE BORBON Y BORBON','calle falsa'),('12345234Z','MARIO','VARGAS LLOSA','calle diagonal'),('12456465Z','SHARON','STONE','avenida grande'),('13131313Z','MARIPAZ','CALDERON BENJUMEA','avenida mediana'),('14141414Z','TAMARA','LUMBRERAS SANCHEZ','avenida pequeña'),('15151515Z','PABLO','IGLESIAS RODRIGUEZ','rotonda redonada'),('16161616Z','DANIEL','DIAZ ROMERO','calle 1234'),('17171717Z','FRANCISCO','MARTIN ROMERO','pasaje verde'),('18181818Z','IRENE','NIETO RUIZ','ruta 96');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencias`
--

DROP TABLE IF EXISTS `incidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidencias` (
  `IdIncidencia` int(11) NOT NULL DEFAULT '0',
  `NifUsuario` varchar(9) NOT NULL DEFAULT '',
  `Descripcion` varchar(100) NOT NULL DEFAULT '',
  `Urgente` varchar(1) NOT NULL DEFAULT '',
  `Fecha` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`IdIncidencia`),
  KEY `FK_usuario_1` (`NifUsuario`),
  CONSTRAINT `FK_USUARIO` FOREIGN KEY (`NifUsuario`) REFERENCES `usuarios` (`NifUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias`
--

LOCK TABLES `incidencias` WRITE;
/*!40000 ALTER TABLE `incidencias` DISABLE KEYS */;
INSERT INTO `incidencias` VALUES (0,'11111111Z','caida en casa','N','2006-01-31'),(1,'22222222B','desmayo','S','2012-02-27');
/*!40000 ALTER TABLE `incidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversacion`
--

DROP TABLE IF EXISTS `conversacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversacion` (
  `IdConversacion` int(11) NOT NULL DEFAULT '0',
  `NifUsuario` varchar(9) NOT NULL DEFAULT '',
  `PreguntaUser` varchar(100) NOT NULL DEFAULT '',
  `NifAgente` varchar(1) NOT NULL DEFAULT '',
  `RespuestaAgen` varchar(100) NOT NULL DEFAULT '',

  PRIMARY KEY (`IdConversacion`),
  KEY `FK_usuario_2` (`NifUsuario`),
  CONSTRAINT `FK_USUARIO2` FOREIGN KEY (`NifUsuario`) REFERENCES `usuarios` (`NifUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AGENTE` FOREIGN KEY (`NifAgente`) REFERENCES `agentes` (`NifAgente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversacion`
--

LOCK TABLES `conversacion` WRITE;
/*!40000 ALTER TABLE `conversacion` DISABLE KEYS */;
INSERT INTO `conversacion` VALUES (0,'11111111Z','caida en casa','N','2006-01-31'),(1,'22222222B','desmayo','S','2012-02-27');
/*!40000 ALTER TABLE `conversacion` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `agentes`
--

DROP TABLE IF EXISTS `agentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentes` (
  `NifAgente` varchar(9) NOT NULL DEFAULT '',
  `Nombre` varchar(45) NOT NULL DEFAULT '',
  `Apellidos` varchar(45) NOT NULL DEFAULT '',
  `Direccion` varchar(40) NOT NULL DEFAULT '',
  `Puesto` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`NifAgente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentes`
--

LOCK TABLES `agentes` WRITE;
/*!40000 ALTER TABLE `agentes` DISABLE KEYS */;
INSERT INTO `agentes` VALUES ('22222222Z','CARLOS','ALGECIRAS VILLEGAS','calle 1','cuidador'),('30303030Z','LOLA','\"LA PITONISA\"','calle 2','tratador'),('33333333Z','SALVADOR','GALLEGO MONTERO','calle 3','cargador');
/*!40000 ALTER TABLE `agentes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-11 22:58:44
