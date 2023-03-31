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
-- Table structure for table `marker_category`
--

DROP TABLE IF EXISTS `marker_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marker_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `marker_category_type_id` int(11) NOT NULL,
  `container_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `default_checked` tinyint(1) NOT NULL DEFAULT 0,
  `img` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL DEFAULT '#000000',
  `visible_zoom` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_marker_category_map_container1_idx` (`container_id`),
  KEY `fk_marker_category_marker_category_type1_idx` (`marker_category_type_id`),
  KEY `fk_marker_category_marker_category1_idx` (`parent_id`),
  CONSTRAINT `fk_marker_category_map_container1` FOREIGN KEY (`container_id`) REFERENCES `container` (`id`),
  CONSTRAINT `fk_marker_category_marker_category1` FOREIGN KEY (`parent_id`) REFERENCES `marker_category` (`id`),
  CONSTRAINT `fk_marker_category_marker_category_type1` FOREIGN KEY (`marker_category_type_id`) REFERENCES `marker_category_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1970 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marker_category`
--

LOCK TABLES `marker_category` WRITE;
/*!40000 ALTER TABLE `marker_category` DISABLE KEYS */;
INSERT INTO `marker_category` VALUES (1,NULL,1,1,'Itens',1,'map_gear','#000000',5,1);
INSERT INTO `marker_category` VALUES (2,1,1,1,'Itens comuns',1,'map_item','#000000',5,1);
INSERT INTO `marker_category` VALUES (3,1,1,1,'Mapa',1,'map_map','#000000',5,1);
INSERT INTO `marker_category` VALUES (4,1,1,1,'Bússola',1,'map_compass','#000000',5,1);
INSERT INTO `marker_category` VALUES (5,1,1,1,'Chave',1,'map_key','#000000',5,1);
INSERT INTO `marker_category` VALUES (6,1,1,1,'Coração',1,'map_heart','#000000',5,1);
INSERT INTO `marker_category` VALUES (7,1,1,1,'Triforce',1,'map_triforce','#000000',5,1);
INSERT INTO `marker_category` VALUES (8,NULL,1,1,'Lojas',1,'map_shop','#000000',5,1);
INSERT INTO `marker_category` VALUES (9,8,1,1,'Loja A',1,'placeholder','#000000',5,1);
INSERT INTO `marker_category` VALUES (10,8,1,1,'Loja B',1,'placeholder','#000000',5,1);
INSERT INTO `marker_category` VALUES (11,8,1,1,'Loja C',1,'placeholder','#000000',5,1);
INSERT INTO `marker_category` VALUES (12,8,1,1,'Loja Poções',1,'map_potion','#000000',5,1);
INSERT INTO `marker_category` VALUES (13,NULL,1,1,'Segredos',1,'map_secret','#000000',5,1);
INSERT INTO `marker_category` VALUES (14,13,1,1,'Ganhar Rupees ',1,'map_rupee','#000000',5,1);
INSERT INTO `marker_category` VALUES (15,13,1,1,'Perder Rupees',1,'placeholder','#000000',5,1);
INSERT INTO `marker_category` VALUES (16,13,1,1,'Jogo de Apostas ',1,'map_gambling','#000000',5,1);
INSERT INTO `marker_category` VALUES (17,13,1,1,'Blocos Móveis',1,'map_move','#000000',5,1);
INSERT INTO `marker_category` VALUES (18,13,1,1,'Paredes Falsas ',1,'placeholder','#000000',5,1);
INSERT INTO `marker_category` VALUES (19,13,1,1,'Portais',1,'map_tloz_warp','#000000',5,1);
INSERT INTO `marker_category` VALUES (20,NULL,1,1,'Pontos de Interesse ',1,'map_poi','#000000',5,1);
INSERT INTO `marker_category` VALUES (21,20,1,1,'Informação',1,'map_info','#000000',5,1);
INSERT INTO `marker_category` VALUES (22,20,1,1,'Fontes de Fada',1,'map_fairy','#000000',5,1);
INSERT INTO `marker_category` VALUES (23,20,1,1,'Level',1,'map_dungeon','#000000',5,1);
INSERT INTO `marker_category` VALUES (24,20,1,1,'Chefe',1,'map_boss','#000000',5,1);
INSERT INTO `marker_category` VALUES (25,20,3,1,'Lugares',1,'map_places','#000000',5,1);
INSERT INTO `marker_category` VALUES (26,20,2,1,'Marcadores de Pulo',1,'map_jump','#000000',5,1);
INSERT INTO `marker_category` VALUES (300,NULL,1,3,'Itens',1,'map_gear','#000000',5,1);
INSERT INTO `marker_category` VALUES (301,300,1,3,'Itens comuns',1,'map_item','#000000',5,1);
INSERT INTO `marker_category` VALUES (302,300,1,3,'Garrafa',1,'map_bottle','#000000',5,1);
INSERT INTO `marker_category` VALUES (303,300,1,3,'Coração',1,'map_heart','#000000',5,1);
INSERT INTO `marker_category` VALUES (304,300,1,3,'Mapa',1,'map_map','#000000',5,1);
INSERT INTO `marker_category` VALUES (305,300,1,3,'Bússola',1,'map_compass','#000000',5,1);
INSERT INTO `marker_category` VALUES (306,300,1,3,'Chave',1,'map_key','#000000',5,1);
INSERT INTO `marker_category` VALUES (307,NULL,1,3,'Loja',1,'map_shop','#000000',5,1);
INSERT INTO `marker_category` VALUES (308,307,1,3,'Loja de Suprimentos',1,'map_shop','#000000',5,1);
INSERT INTO `marker_category` VALUES (309,307,1,3,'Quiromante',1,'map_alttp_fortuneteller','#000000',5,1);
INSERT INTO `marker_category` VALUES (310,NULL,1,3,'Minigames',1,'map_minigame','#000000',5,1);
INSERT INTO `marker_category` VALUES (311,310,1,3,'Minigames em Geral',1,'map_minigame','#000000',5,1);
INSERT INTO `marker_category` VALUES (312,310,1,3,'Jogos de aposta',1,'map_gambling','#000000',5,1);
INSERT INTO `marker_category` VALUES (313,NULL,1,3,'Sidequest',1,'map_sidequest','#000000',5,1);
INSERT INTO `marker_category` VALUES (314,313,1,3,'Riddle Quest (GBA)',1,'map_alttp_basket','#000000',5,1);
INSERT INTO `marker_category` VALUES (315,NULL,1,3,'Segredos',1,'map_secret','#000000',5,1);
INSERT INTO `marker_category` VALUES (316,315,1,3,'Passagens abertas com bomba',1,'map_bomb_wall','#000000',5,1);
INSERT INTO `marker_category` VALUES (317,315,1,3,'Passagens abertas com Pegasus boots',1,'map_alttp_pegasusboots','#000000',5,1);
INSERT INTO `marker_category` VALUES (318,315,1,3,'Outras passagens ocultas',1,'map_tloz_warp','#000000',5,1);
INSERT INTO `marker_category` VALUES (319,315,1,3,'Rupees',1,'map_rupee','#000000',5,1);
INSERT INTO `marker_category` VALUES (320,315,1,3,'Fairy Fountains',1,'map_fairy','#000000',5,1);
INSERT INTO `marker_category` VALUES (321,315,1,3,'Baús',1,'map_chest','#000000',5,1);
INSERT INTO `marker_category` VALUES (322,NULL,1,3,'POI',1,'map_info','#000000',5,1);
INSERT INTO `marker_category` VALUES (323,322,1,3,'Warp (pato)',1,'map_alttp_bird','#000000',5,1);
INSERT INTO `marker_category` VALUES (324,322,2,3,'Warp (redemoinho)',1,'map_whirlpool','#000000',5,1);
INSERT INTO `marker_category` VALUES (325,322,1,3,'Warp (Portais para o Dark World)',1,'map_alttp_warp','#000000',5,1);
INSERT INTO `marker_category` VALUES (326,322,1,3,'Informações gerais',1,'map_info','#000000',5,1);
INSERT INTO `marker_category` VALUES (327,322,1,3,'Dungeons',1,'map_dungeon','#000000',5,1);
INSERT INTO `marker_category` VALUES (328,322,1,3,'Chefes',1,'map_boss','#000000',5,1);
INSERT INTO `marker_category` VALUES (329,322,2,3,'Marcadores de Pulo',1,'map_jump','#000000',5,1);
INSERT INTO `marker_category` VALUES (330,322,3,3,'Lugares',1,'map_places','#000000',5,1);
INSERT INTO `marker_category` VALUES (400,NULL,1,4,'Itens',1,'map_item','#000000',5,1);
INSERT INTO `marker_category` VALUES (401,400,1,4,'Itens comuns',1,'map_item','#000000',5,1);
INSERT INTO `marker_category` VALUES (402,400,1,4,'Mapa',1,'map_map','#000000',5,1);
INSERT INTO `marker_category` VALUES (403,400,1,4,'Bússola',1,'map_compass','#000000',5,1);
INSERT INTO `marker_category` VALUES (404,400,1,4,'Chave',1,'map_key','#000000',5,1);
INSERT INTO `marker_category` VALUES (405,400,1,4,'Coração',1,'map_heart','#000000',5,1);
INSERT INTO `marker_category` VALUES (415,NULL,1,4,'Segredos',1,'map_secret','#000000',5,1);
INSERT INTO `marker_category` VALUES (416,415,1,4,'Secret Seashell ',1,'placeholder','#000000',5,1);
INSERT INTO `marker_category` VALUES (417,415,1,4,'Mad Batter',1,'placeholder','#000000',5,1);
INSERT INTO `marker_category` VALUES (418,415,1,4,'Easter Egg ',1,'map_gambling','#000000',5,1);
INSERT INTO `marker_category` VALUES (419,415,1,4,'Trocas',1,'map_move','#000000',5,1);
INSERT INTO `marker_category` VALUES (420,415,1,4,'Portal',1,'map_tloz_warp','#000000',5,1);
INSERT INTO `marker_category` VALUES (421,415,1,4,'Rupees',1,'map_rupee','#000000',5,1);
INSERT INTO `marker_category` VALUES (430,NULL,1,4,'Pontos de Interesse ',1,'map_poi','#000000',5,1);
INSERT INTO `marker_category` VALUES (431,430,1,4,'Informação',1,'map_info','#000000',5,1);
INSERT INTO `marker_category` VALUES (432,430,1,4,'Level',1,'map_dungeon','#000000',5,1);
INSERT INTO `marker_category` VALUES (433,430,1,4,'Chefe',1,'map_boss','#000000',5,1);
INSERT INTO `marker_category` VALUES (434,430,3,4,'Lugares',1,'map_places','#000000',5,1);
INSERT INTO `marker_category` VALUES (435,430,2,4,'Marcadores de Pulo',1,'map_jump','#000000',5,1);
INSERT INTO `marker_category` VALUES (500,NULL,1,5,'Itens',1,'map_item','#000000',5,1);
INSERT INTO `marker_category` VALUES (501,500,1,5,'Itens comuns',1,'map_item','#000000',5,1);
INSERT INTO `marker_category` VALUES (502,500,1,5,'Garrafa',1,'map_bottle','#000000',5,1);
INSERT INTO `marker_category` VALUES (503,500,1,5,'Coração',1,'map_heart','#000000',5,1);
INSERT INTO `marker_category` VALUES (504,500,1,5,'Mapa',1,'map_map','#000000',5,1);
INSERT INTO `marker_category` VALUES (505,500,1,5,'Bússola',1,'map_compass','#000000',5,1);
INSERT INTO `marker_category` VALUES (506,500,1,5,'Chave',1,'map_key','#000000',5,1);
INSERT INTO `marker_category` VALUES (507,NULL,1,5,'Sidequest',1,'map_sidequest','#000000',5,1);
INSERT INTO `marker_category` VALUES (508,507,1,5,'Gold Skulltullas',1,'map_goldskulltulla','#000000',5,1);
INSERT INTO `marker_category` VALUES (509,507,1,5,'Great Fairies',1,'map_greatfairy','#000000',5,1);
INSERT INTO `marker_category` VALUES (510,507,1,5,'Terras Fofas',1,'map_softsoil','#000000',5,1);
INSERT INTO `marker_category` VALUES (511,507,1,5,'Galinhas perdidas',1,'map_lostchicken','#000000',5,1);
INSERT INTO `marker_category` VALUES (512,507,1,5,'Big Poe',1,'map_bigpoe','#000000',5,1);
INSERT INTO `marker_category` VALUES (513,507,1,5,'Trocas Máscara',1,'map_masks','#000000',5,1);
INSERT INTO `marker_category` VALUES (514,507,1,5,'Trocas Biggoron Sword',1,'map_biggoron_sword','#000000',5,1);
INSERT INTO `marker_category` VALUES (515,NULL,1,5,'Segredos',1,'map_secret','#000000',5,1);
INSERT INTO `marker_category` VALUES (516,515,1,5,'Passagens Secretas',1,'map_bomb_wall','#000000',5,1);
INSERT INTO `marker_category` VALUES (517,515,1,5,'Rupees',1,'map_rupee','#000000',5,1);
INSERT INTO `marker_category` VALUES (518,515,1,5,'Fairy Fountains',1,'map_fairy','#000000',5,1);
INSERT INTO `marker_category` VALUES (519,515,1,5,'Baús',1,'map_chest','#000000',5,1);
INSERT INTO `marker_category` VALUES (520,NULL,1,5,'POI',1,'map_poi','#000000',5,1);
INSERT INTO `marker_category` VALUES (521,520,1,5,'Loja',1,'map_shop','#000000',5,1);
INSERT INTO `marker_category` VALUES (526,520,1,5,'Informações gerais',1,'map_info','#000000',5,1);
INSERT INTO `marker_category` VALUES (527,520,1,5,'Gossip Stones',1,'map_gossip_stone','#000000',5,1);
INSERT INTO `marker_category` VALUES (528,520,1,5,'Dungeons',1,'map_dungeon','#000000',5,1);
INSERT INTO `marker_category` VALUES (529,520,1,5,'Chefes',1,'map_boss','#000000',5,1);
INSERT INTO `marker_category` VALUES (530,520,2,5,'Marcadores de Pulo',1,'map_jump','#000000',5,1);
INSERT INTO `marker_category` VALUES (531,520,3,5,'Lugares',1,'map_places','#000000',5,1);
INSERT INTO `marker_category` VALUES (1601,NULL,1,16,'Itens',1,'map_item','#000000',5,1);
INSERT INTO `marker_category` VALUES (1602,1601,1,16,'Equipamento',1,'map_gear','#000000',5,1);
INSERT INTO `marker_category` VALUES (1603,1601,1,16,'Item',1,'map_item','#000000',5,1);
INSERT INTO `marker_category` VALUES (1604,1601,1,16,'Mapa',1,'map_map','#000000',5,1);
INSERT INTO `marker_category` VALUES (1605,1601,1,16,'Chave',1,'map_key','#000000',5,1);
INSERT INTO `marker_category` VALUES (1606,1601,1,16,'Chave Grande',1,'map_bigkey','#000000',5,1);
INSERT INTO `marker_category` VALUES (1607,1601,1,16,'Pedaço de Coração',1,'map_heart','#000000',5,1);
INSERT INTO `marker_category` VALUES (1608,1601,1,16,'Garrafa',1,'map_bottle','#000000',5,1);
INSERT INTO `marker_category` VALUES (1609,1601,1,16,'Trifoce',1,'map_triforce','#000000',5,1);
INSERT INTO `marker_category` VALUES (1610,NULL,1,16,'Segredos',1,'map_secret','#000000',5,1);
INSERT INTO `marker_category` VALUES (1611,1610,1,16,'Paredes destrutíveis ',1,'map_bomb_wall','#000000',5,1);
INSERT INTO `marker_category` VALUES (1612,1610,1,16,'Baús',1,'map_chest','#000000',5,1);
INSERT INTO `marker_category` VALUES (1613,1610,1,16,'Tesouros',1,'map_ss_treasure','#000000',5,1);
INSERT INTO `marker_category` VALUES (1614,1610,1,16,'Insetos ',1,'map_ss_bug','#000000',5,1);
INSERT INTO `marker_category` VALUES (1615,1610,1,16,'Goddess Cube',1,'map_goddess_cube','#000000',5,1);
INSERT INTO `marker_category` VALUES (1616,1610,1,16,'Gratitue Crystal',1,'map_gratitude_crystal','#000000',5,1);
INSERT INTO `marker_category` VALUES (1617,1610,1,16,'Tears of Light',1,'map_ss_tear','#000000',5,1);
INSERT INTO `marker_category` VALUES (1618,1610,1,16,'Medals',1,'map_ss_medal','#000000',5,1);
INSERT INTO `marker_category` VALUES (1619,1610,1,16,'Side-Quests',1,'map_ss_sidequest','#000000',5,1);
INSERT INTO `marker_category` VALUES (1620,1610,1,16,'Mini-games',1,'map_minigame','#000000',5,1);
INSERT INTO `marker_category` VALUES (1621,NULL,1,16,'Pontos de Interesse ',1,'map_poi','#000000',5,1);
INSERT INTO `marker_category` VALUES (1622,1621,1,16,'Informação',1,'map_info','#000000',5,1);
INSERT INTO `marker_category` VALUES (1623,1621,1,16,'Loja',1,'map_shop','#000000',5,1);
INSERT INTO `marker_category` VALUES (1624,1621,1,16,'Informação',1,'map_info','#000000',5,1);
INSERT INTO `marker_category` VALUES (1625,1621,1,16,'Dungeon',1,'map_dungeon','#000000',5,1);
INSERT INTO `marker_category` VALUES (1626,1621,1,16,'Chefe',1,'map_boss','#000000',5,1);
INSERT INTO `marker_category` VALUES (1627,1621,3,16,'Lugares',1,'map_places','#000000',5,1);
INSERT INTO `marker_category` VALUES (1901,NULL,1,19,'Point of Interest',1,'BotW_Points-of-Interest','#4bc5ee',5,1);
INSERT INTO `marker_category` VALUES (1902,NULL,1,19,'Equipment',1,'BotW_Equipment','#ffad48',7,1);
INSERT INTO `marker_category` VALUES (1903,1902,1,19,'Weapons',1,'BotW_Weapons','#ffad48',7,1);
INSERT INTO `marker_category` VALUES (1904,1902,1,19,'Bows & Arrows',1,'BotW_Bow-n-Arrows','#ffad48',7,1);
INSERT INTO `marker_category` VALUES (1905,1902,1,19,'Shields',1,'BotW_Shields','#ffad48',7,1);
INSERT INTO `marker_category` VALUES (1906,1902,1,19,'Armor',1,'BotW_Armor','#ffad48',7,0);
INSERT INTO `marker_category` VALUES (1910,NULL,1,19,'Items',1,'BotW_Items','#3cbc75',7,1);
INSERT INTO `marker_category` VALUES (1911,1910,1,19,'Food (Beef)',1,'BotW_Meat','#3cbc75',7,0);
INSERT INTO `marker_category` VALUES (1912,1910,1,19,'Food (Fish)',1,'BotW_Fish','#3cbc75',7,0);
INSERT INTO `marker_category` VALUES (1913,1910,1,19,'Herbs',1,'BotW_Herb','#3cbc75',7,0);
INSERT INTO `marker_category` VALUES (1914,1910,1,19,'Mushrooms',1,'BotW_Mushroom','#3cbc75',7,0);
INSERT INTO `marker_category` VALUES (1915,1910,1,19,'Materials',1,'BotW_Materials','#3cbc75',7,0);
INSERT INTO `marker_category` VALUES (1916,1910,1,19,'Korok Seeds',1,'BotW_Korok-Seeds','#3cbc75',4,1);
INSERT INTO `marker_category` VALUES (1920,NULL,1,19,'Locations',1,'BotW_Locations','#8e72b9',5,1);
INSERT INTO `marker_category` VALUES (1921,1920,1,19,'Village',1,'BotW_Village','#8e72b9',5,1);
INSERT INTO `marker_category` VALUES (1922,1920,1,19,'Town (House)',1,'BotW_Farm','#8e72b9',5,0);
INSERT INTO `marker_category` VALUES (1923,1920,1,19,'Sheikah Tower',1,'BotW_Sheikah-Tower','#8e72b9',0,1);
INSERT INTO `marker_category` VALUES (1924,1920,1,19,'Shrine of Resurrection',1,'BotW_Shrine-of-Resurrection','#8e72b9',5,0);
INSERT INTO `marker_category` VALUES (1925,1920,1,19,'Shrine of Trials',1,'BotW_Shrines-of-Trials','#8e72b9',2,1);
INSERT INTO `marker_category` VALUES (1926,1920,1,19,'Divine Beast',1,'BotW_Dungeon','#8e72b9',5,1);
INSERT INTO `marker_category` VALUES (1927,1920,1,19,'Temple of Time',1,'BotW_The-Temple-of-Time','#8e72b9',5,0);
INSERT INTO `marker_category` VALUES (1930,NULL,1,19,'Enemies',1,'BotW_Enemies','#ff422e',5,1);
INSERT INTO `marker_category` VALUES (1931,1930,1,19,'Enemy Camp',1,'BotW_Enemy-Camp','#ff422e',5,1);
INSERT INTO `marker_category` VALUES (1932,1930,1,19,'Guardian',1,'BotW_Guardian','#ff422e',5,1);
INSERT INTO `marker_category` VALUES (1933,1930,1,19,'Boss',1,'BotW_Boss','#ff422e',6,0);
INSERT INTO `marker_category` VALUES (1934,1901,1,19,'Memories',1,'BotW_Memories','#4bc5ee',6,1);
INSERT INTO `marker_category` VALUES (1935,1901,1,19,'Side-Quests',1,'BotW_Side-Quest','#4bc5ee',6,1);
INSERT INTO `marker_category` VALUES (1936,1901,1,19,'Cracked Walls',1,'BotW_Bomb','#4bc5ee',8,1);
INSERT INTO `marker_category` VALUES (1937,1920,1,19,'Great Fairy',1,'BotW_Great-Fairy','#8e72b9',5,1);
INSERT INTO `marker_category` VALUES (1938,1920,1,19,'Stables',1,'BotW_Stables','#8e72b9',5,1);
INSERT INTO `marker_category` VALUES (1939,1930,1,19,'Wizzrobe',1,'BotW_Wizzrobe','#ff422e',6,1);
INSERT INTO `marker_category` VALUES (1940,1930,1,19,'Lynel',1,'BotW_Lynel','#ff422e',6,1);
INSERT INTO `marker_category` VALUES (1941,1930,1,19,'Talus',1,'BotW_Boss','#ff422e',6,1);
INSERT INTO `marker_category` VALUES (1942,1930,1,19,'Hinox',1,'BotW_Hinox','#ff422e',6,1);
INSERT INTO `marker_category` VALUES (1943,1910,1,19,'Treasure Chest (Non-Equip.)',1,'BotW_Treasure-Chest','#3cbc75',6,1);
INSERT INTO `marker_category` VALUES (1944,1902,1,19,'Treasure Chest (Equip.)',1,'BotW_Treasure-Chest','#ffad48',6,1);
INSERT INTO `marker_category` VALUES (1945,1910,1,19,'Blupee',1,'BotW_Blupee','#3cbc75',7,1);
INSERT INTO `marker_category` VALUES (1946,1901,1,19,'Diary & Books',1,'BotW_Book','#4bc5ee',8,1);
INSERT INTO `marker_category` VALUES (1947,1930,1,19,'Molduga',1,'BotW_Boss','#ff422e',6,1);
INSERT INTO `marker_category` VALUES (1948,1901,1,19,'Cooking Pot',1,'BotW_Cooking_Pot','#4bc5ee',8,1);
INSERT INTO `marker_category` VALUES (1949,1901,1,19,'Goddess Statue',1,'BotW_Goddess_Statue','#4bc5ee',6,1);
INSERT INTO `marker_category` VALUES (1950,NULL,1,4,'Point of Interest',1,'BotW_Points-of-Interest','#4bc5ee',0,1);
INSERT INTO `marker_category` VALUES (1951,1950,1,4,'Cracked Walls',1,'BotW_Bomb','#4bc5ee',0,1);
INSERT INTO `marker_category` VALUES (1952,1950,1,4,'Trading Sequence',1,'BotW_Side-Quest','#4bc5ee',0,1);
INSERT INTO `marker_category` VALUES (1953,1950,1,4,'Minigame',1,'BotW_Mini-Game','#4bc5ee',0,1);
INSERT INTO `marker_category` VALUES (1954,1950,1,4,'Easter Eggs',1,'General_Info','#4bc5ee',0,0);
INSERT INTO `marker_category` VALUES (1955,NULL,1,4,'Items',1,'BotW_Items','#ffad48',0,1);
INSERT INTO `marker_category` VALUES (1956,1955,1,4,'Pieces of Heart',1,'General_Heart','#ffad48',0,1);
INSERT INTO `marker_category` VALUES (1957,1955,1,4,'Seashells',1,'LA_Secret-Seashell','#ffad48',0,1);
INSERT INTO `marker_category` VALUES (1958,1955,1,4,'Bottles',1,'General_Bottle','#ffad48',0,1);
INSERT INTO `marker_category` VALUES (1960,1955,1,4,'Map',1,'General_Map','#ffad48',0,1);
INSERT INTO `marker_category` VALUES (1961,1955,1,4,'Compass',1,'General_Compass','#ffad48',0,1);
INSERT INTO `marker_category` VALUES (1962,1955,1,4,'Keys',1,'General_Key','#ffad48',0,1);
INSERT INTO `marker_category` VALUES (1963,NULL,1,4,'Locations',1,'BotW_Locations','#8e72b9',0,1);
INSERT INTO `marker_category` VALUES (1964,1963,1,4,'Houses',1,'General_House','#8e72b9',0,1);
INSERT INTO `marker_category` VALUES (1965,1963,1,4,'Shops',1,'General_Store','#8e72b9',0,1);
INSERT INTO `marker_category` VALUES (1966,1963,1,4,'Dungeons',1,'BotW_Dungeon','#8e72b9',0,1);
INSERT INTO `marker_category` VALUES (1967,NULL,1,4,'Enemies',1,'BotW_Enemies','#ff422e',0,1);
INSERT INTO `marker_category` VALUES (1968,1967,1,4,'Boss',1,'BotW_Boss','#ff422e',0,1);
INSERT INTO `marker_category` VALUES (1969,1963,1,4,'Fairy Fountains',1,'BotW_Great-Fairy','#8e72b9',3,1);
/*!40000 ALTER TABLE `marker_category` ENABLE KEYS */;
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
