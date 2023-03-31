-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: tingle
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB

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
-- Table structure for table `submap`
--

DROP TABLE IF EXISTS `submap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submap` (
  `id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `map_type_id` int(11) NOT NULL DEFAULT 0,
  `mapper_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `tile_url` varchar(250) NOT NULL,
  `tile_ext` char(3) NOT NULL DEFAULT 'png',
  `img404` varchar(10) NOT NULL DEFAULT '404',
  `submap_order` int(11) NOT NULL DEFAULT -1,
  `empty_map` tinyint(1) NOT NULL,
  `opacity` float NOT NULL DEFAULT 1,
  `visible` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_map_game_map_type1_idx` (`map_type_id`),
  KEY `fk_map_mapper1_idx` (`mapper_id`),
  KEY `fk_submap_map1_idx` (`map_id`),
  CONSTRAINT `fk_map_game_map_type10` FOREIGN KEY (`map_type_id`) REFERENCES `map_type` (`id`),
  CONSTRAINT `fk_map_mapper10` FOREIGN KEY (`mapper_id`) REFERENCES `mapper` (`id`),
  CONSTRAINT `fk_submap_map1` FOREIGN KEY (`map_id`) REFERENCES `map` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submap`
--

LOCK TABLES `submap` WRITE;
/*!40000 ALTER TABLE `submap` DISABLE KEYS */;
INSERT INTO `submap` VALUES (140,3,1,NULL,'Light World',1,'alttp/overworld/light/','png','404',0,0,1,1);
INSERT INTO `submap` VALUES (141,3,1,NULL,'Dark World',0,'alttp/overworld/dark/','png','404',1,0,1,1);
INSERT INTO `submap` VALUES (1900,19,1,1,'DO NOT USE',0,'botw/e32016/','png','blank',0,0,1,0);
INSERT INTO `submap` VALUES (1901,19,1,1,'Hyrule',1,'botw/hyrule/','png','blank',0,0,1,1);
INSERT INTO `submap` VALUES (2000,20,1,1,'Koholint Island',1,'la_rmk/koholint_island/','png','blank',0,0,1,1);
INSERT INTO `submap` VALUES (2001,21,1,1,'Tail Cave',1,'la_rmk/1_tail_cave/','png','blank',1,0,1,1);
INSERT INTO `submap` VALUES (2002,22,1,1,'Bottle Grotto',1,'la_rmk/2_bottle_grotto/','png','blank',2,0,1,1);
INSERT INTO `submap` VALUES (2003,23,1,1,'Key Cavern',1,'la_rmk/3_key_cavern/','png','blank',3,0,1,1);
INSERT INTO `submap` VALUES (2004,24,1,1,'Angler`s Tunnel',1,'la_rmk/4_anglers_tunnel/','png','blank',4,0,1,1);
INSERT INTO `submap` VALUES (2005,25,1,1,'Catfish`s Maw',1,'la_rmk/5_catfishs_maw/','png','blank',5,0,1,1);
INSERT INTO `submap` VALUES (2006,26,1,1,'Face Shrine',1,'la_rmk/6_face_shrine/','png','blank',6,0,1,1);
INSERT INTO `submap` VALUES (2007,27,1,1,'Eagle`s Tower',1,'la_rmk/7_eagles_tower/','png','blank',7,0,1,1);
INSERT INTO `submap` VALUES (2008,28,1,1,'Turtle Rock',1,'la_rmk/8_turtle_rock/','png','blank',8,0,1,1);
INSERT INTO `submap` VALUES (2009,29,1,1,'Color Dungeon',1,'la_rmk/0_color_dungeon/','png','blank',9,0,1,1);
/*!40000 ALTER TABLE `submap` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-30 14:31:35
