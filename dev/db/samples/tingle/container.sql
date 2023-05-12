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
-- Table structure for table `container`
--

DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `marker_url` varchar(250) NOT NULL DEFAULT 'markers/' COMMENT 'Each map can have a set of different markers icons just by changing the marker url',
  `marker_ext` char(3) NOT NULL DEFAULT 'png',
  `background_color` char(7) NOT NULL DEFAULT '#DEECFD',
  `icon` varchar(60) NOT NULL,
  `show_street_view` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Only for googlemaps (for now)',
  `show_map_control` tinyint(1) NOT NULL DEFAULT 1,
  `show_zoom_control` tinyint(1) NOT NULL DEFAULT 1,
  `show_pan_control` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Only for googlemaps (for now)',
  `show_category_menu` tinyint(1) DEFAULT 1,
  `default_pos_x` float NOT NULL DEFAULT 128 COMMENT '0 for googlemap, 128 for leaflet',
  `default_pos_y` float NOT NULL DEFAULT -128 COMMENT '0 for googlemap, -128 for leaflet',
  `bound_top_pos_x` float NOT NULL DEFAULT 0,
  `bound_top_pos_y` float NOT NULL DEFAULT 0,
  `bound_bottom_pos_x` float NOT NULL DEFAULT -256,
  `bound_bottom_pos_y` float NOT NULL DEFAULT 256,
  `max_zoom` int(11) DEFAULT 6,
  `cluster_max_zoom` int(11) NOT NULL DEFAULT 4 COMMENT 'Max zoom to cluster the markers. Best -2 from the max zoom allowed (if 6 is the max, cluster should be 4)',
  `cluster_grid_size` int(11) NOT NULL DEFAULT 30 COMMENT 'Pixel size of grid (default 30)',
  `tile_size` int(11) NOT NULL DEFAULT 256 COMMENT 'Internet default is 256',
  `icon_width` int(11) NOT NULL DEFAULT 23,
  `icon_height` int(11) NOT NULL DEFAULT 23,
  `icon_small_width` int(11) NOT NULL DEFAULT 16,
  `icon_small_height` int(11) NOT NULL DEFAULT 16,
  `switch_icons_at_zoom` int(11) NOT NULL DEFAULT 5,
  `visible` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'If map can be viewed',
  `default_zoom` int(11) NOT NULL DEFAULT 3,
  PRIMARY KEY (`id`),
  UNIQUE KEY `map_id_UNIQUE` (`id`),
  UNIQUE KEY `short_name_UNIQUE` (`short_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
INSERT INTO `container` VALUES 
  (1,'TLoZ','The Legend of Zelda','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (2,'AoL','Zelda 2: Adventure of Link','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (3,'ALttP','A Link to the Past','markers/','png','#000000','',0,1,1,0,1,128,-128,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (4,'LA','Link\'s Awakening','markers/','png','#000000','Links-Awakening',0,1,1,0,1,128,-128,-50,-80,-226,306,6,4,30,256,23,23,16,16,-1,1,3),
  (5,'OoT','Ocarina Of Time','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (6,'MM','Majora\'s Mask','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (7,'OoS','Oracle of Seasons','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (8,'OoA','Oracle of Ages','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (9,'TWW','The Wind Waker','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (10,'FSS','Four Swords','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (11,'FSA','Four Swords Adventures','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (12,'TMC','The Minish Cap','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (13,'TP','Twilight Princess','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (14,'PH','Phantom Hourglass','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (15,'ST','Spirit Tracks','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (16,'SS','Skyward Sword','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (17,'ALBW','A Link Between Worlds','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (18,'TFH','Tri Force Heroes','markers/','png','#000000','',0,1,1,0,1,0,0,0,0,-256,256,6,4,30,256,23,23,16,16,5,0,3),
  (19,'BotW','Breath of the Wild','markers/','png','#000000','Breath-of-the-Wild',0,1,1,0,1,112,-159,-49.875,34.25,-206,221,8,9,50,256,23,23,16,16,5,1,5),
  (21,'TotK','Tears of the Kingdom','/markers/','png','#DEECFD','Breath-of-the-Wild',0,1,1,0,1,70,-59,0,0,-118,141,8,9,50,256,23,23,16,16,5,1,4)
;
/*!40000 ALTER TABLE `container` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-09 14:55:21
