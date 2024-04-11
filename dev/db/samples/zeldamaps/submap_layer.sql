-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB-1~jessie

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
-- Table structure for table `submap_layer`
--

DROP TABLE IF EXISTS `submap_layer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submap_layer` (
  `id` int(11) NOT NULL,
  `submap_id` int(11) NOT NULL,
  `mapper_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `tile_url` varchar(250) DEFAULT NULL,
  `tile_ext` char(3) DEFAULT NULL,
  `img404` varchar(10) DEFAULT NULL,
  `control_visible` tinyint(1) DEFAULT NULL COMMENT '''If the layer can be visible on the layer control''',
  `control_checked` tinyint(1) DEFAULT NULL COMMENT '''If the layer is default visible or not''',
  `type` char(1) DEFAULT NULL COMMENT '''F - Foreground / B - Background''',
  `layer_order` int(11) DEFAULT NULL,
  `opacity` float NOT NULL DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_map_layer_submap1_idx` (`submap_id`),
  KEY `fk_submap_layer_mapper1_idx` (`mapper_id`),
  CONSTRAINT `fk_map_layer_submap1` FOREIGN KEY (`submap_id`) REFERENCES `submap` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_submap_layer_mapper1` FOREIGN KEY (`mapper_id`) REFERENCES `mapper` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submap_layer`
--

LOCK TABLES `submap_layer` WRITE;
/*!40000 ALTER TABLE `submap_layer` DISABLE KEYS */;
INSERT INTO `submap_layer` VALUES
  (190019010,1900,NULL,'VGA 2016','botw/vga2014/','png','blank',1,0,'F',2,0.4,1),
  (190019011,1900,2,'Hand Drawn','botw/zu/','png','blank',1,1,'F',1,1,1),
  (190019012,1901,2,'Labels','botw/hyrule_labels/','png','blank',1,1,'F',1,1,0)
;
/*!40000 ALTER TABLE `submap_layer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-30 21:07:35
