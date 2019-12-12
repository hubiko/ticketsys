-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tickety
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `autorizace`
--

DROP TABLE IF EXISTS `autorizace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorizace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(30) NOT NULL,
  `barva` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizace`
--

LOCK TABLES `autorizace` WRITE;
/*!40000 ALTER TABLE `autorizace` DISABLE KEYS */;
INSERT INTO `autorizace` VALUES (1,'správce','#ff8d00'),(2,'admin','#59afff'),(3,'uživatel','#66fbb3');
/*!40000 ALTER TABLE `autorizace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorie`
--

DROP TABLE IF EXISTS `kategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typ` varchar(20) NOT NULL DEFAULT 'Obecné',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorie`
--

LOCK TABLES `kategorie` WRITE;
/*!40000 ALTER TABLE `kategorie` DISABLE KEYS */;
INSERT INTO `kategorie` VALUES (1,'obecné'),(2,'hardware'),(3,'software');
/*!40000 ALTER TABLE `kategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spolecnost`
--

DROP TABLE IF EXISTS `spolecnost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spolecnost` (
  `id_spol` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(50) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  PRIMARY KEY (`id_spol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spolecnost`
--

LOCK TABLES `spolecnost` WRITE;
/*!40000 ALTER TABLE `spolecnost` DISABLE KEYS */;
INSERT INTO `spolecnost` VALUES (1,'BMW','1234','bmw@gmail.com');
/*!40000 ALTER TABLE `spolecnost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusy`
--

DROP TABLE IF EXISTS `statusy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statusy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(15) NOT NULL,
  `barva` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusy`
--

LOCK TABLES `statusy` WRITE;
/*!40000 ALTER TABLE `statusy` DISABLE KEYS */;
INSERT INTO `statusy` VALUES (1,'otevřený','#ff0000'),(2,'probíhající','#e8ea2c'),(3,'uzavřený','#66fbb3');
/*!40000 ALTER TABLE `statusy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickety`
--

DROP TABLE IF EXISTS `tickety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predmet` varchar(50) NOT NULL,
  `popisek` varchar(100) NOT NULL,
  `kategorizuje_id` int(11) NOT NULL,
  `ma_uzivatele_id` int(11) NOT NULL,
  `ma_uzivatele_autorizuje_id` int(11) NOT NULL,
  `statusuje_id` int(11) NOT NULL,
  `mailsys` int(11) NOT NULL DEFAULT '0',
  `datum` varchar(50) NOT NULL,
  `pridelen` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickety`
--

LOCK TABLES `tickety` WRITE;
/*!40000 ALTER TABLE `tickety` DISABLE KEYS */;
INSERT INTO `tickety` VALUES (1,'TestWeb','fasdfasdf',1,2,3,1,0,'2018/08/12 08:02:59',0),(2,'Petr test XXXX','Mám problém s myší',2,2,3,1,0,'2018/08/19 08:00:06',0),(3,'WebMail','Jde mail?',3,2,3,1,1,'2018/08/19 08:37:19',0),(4,'Chobot','Nefunguje mi kokot',2,2,3,1,0,'2018/08/30 09:13:53',0);
/*!40000 ALTER TABLE `tickety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzivatele`
--

DROP TABLE IF EXISTS `uzivatele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uzivatele` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jmeno` varchar(20) NOT NULL,
  `prijmeni` varchar(30) NOT NULL,
  `nick` varchar(30) NOT NULL,
  `heslo` varchar(60) NOT NULL,
  `email` varchar(30) NOT NULL,
  `autorizuje_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzivatele`
--

LOCK TABLES `uzivatele` WRITE;
/*!40000 ALTER TABLE `uzivatele` DISABLE KEYS */;
INSERT INTO `uzivatele` VALUES (1,'Ondřej','Hubík','hubiko','1b929b62a2c822c4a59e688fde2a3a0b','hubikorg@gmail.com',1),(2,'Petr','Novák','novakp','d2dcd8a64a032046c044afcb69a18e77','novakp@spsoafm.cz',3),(3,'Vojta','Herman','','','hermanv@spsoafm.cz',3),(4,'Warcius','Herman','fadsfsdafasdf','','fsdafds',3);
/*!40000 ALTER TABLE `uzivatele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zpravy`
--

DROP TABLE IF EXISTS `zpravy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zpravy` (
  `id_zpravy` int(11) NOT NULL AUTO_INCREMENT,
  `id_ticketu` int(11) NOT NULL,
  `id_uzivatele` int(11) NOT NULL,
  `id_autorizace` int(11) NOT NULL,
  `datum` varchar(30) NOT NULL,
  `zprava` varchar(500) NOT NULL,
  PRIMARY KEY (`id_zpravy`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zpravy`
--

LOCK TABLES `zpravy` WRITE;
/*!40000 ALTER TABLE `zpravy` DISABLE KEYS */;
INSERT INTO `zpravy` VALUES (1,2,2,1,'2018/08/19 08:00:06',' \r\n Nemáš tam baterku.    '),(2,2,2,1,'2018/08/19 08:00:06',' \r\n            Máš mail?    '),(3,3,2,1,'2018/08/19 08:37:19',' \r\n              Tak schválně  '),(4,3,2,1,'2018/08/19 08:37:19',' \r\n              Tak schválně  '),(5,3,2,1,'2018/08/19 08:37:19',' \r\n        Ještě jednou        '),(6,3,2,1,'2018/08/19 08:37:19',' \r\n        Ještě jednou        '),(7,4,2,3,'2018/08/30 09:13:53','Porádíš mi?\r\n                ');
/*!40000 ALTER TABLE `zpravy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-12 22:06:21
