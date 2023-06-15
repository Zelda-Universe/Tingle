-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: zeldamaps
-- ------------------------------------------------------
-- Server version	10.5.19-MariaDB

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
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `id` int(11) NOT NULL,
  `container_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `default_zoom` tinyint(2) NOT NULL DEFAULT '1',
  `max_zoom` tinyint(1) NOT NULL,
  `map_copyright` varchar(250) NOT NULL,
  `map_order` tinyint(2) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_map_project1_idx` (`container_id`),
  CONSTRAINT `fk_map_project1` FOREIGN KEY (`container_id`) REFERENCES `container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES
  (3,3,'Overworld',0,2,6,'(c) Nintendo',0,1),
  (19,19,'Hyrule',0,2,8,'(c) Nintendo',1,1),
  (20,4,'Koholint Island',1,2,4,'(c) Nintendo',0,1),
  (21,4,'Tail Cave',1,2,4,'(c) Nintendo',1,1),
  (22,4,'Bottle Grotto',1,2,4,'(c) Nintendo',2,1),
  (23,4,'Key Cavern',1,2,4,'(c) Nintendo',3,1),
  (24,4,'Angler`s Tunnel',1,2,4,'(c) Nintendo',4,1),
  (25,4,'Catfish`s Maw',1,2,4,'(c) Nintendo',5,1),
  (26,4,'Face Shrine',1,2,4,'(c) Nintendo',6,1),
  (27,4,'Eagle`s Tower',1,2,4,'(c) Nintendo',7,1),
  (28,4,'Turtle Rock',1,2,4,'(c) Nintendo',8,1),
  (29,4,'Color Dungeon',1,2,4,'(c) Nintendo',9,1),
  (2101,21,'Surface',0,1,8,'',1,1),
  (2102,21,'Sky',1,1,8,'',0,1),
  (2103,21,'Depths',0,1,8,'',1,1)
;
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-07 12:49:53
