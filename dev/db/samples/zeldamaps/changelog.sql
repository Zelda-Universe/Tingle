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
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS `changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changelog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_major` int(11) NOT NULL,
  `version_minor` int(11) NOT NULL,
  `version_patch` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelog`
--

LOCK TABLES `changelog` WRITE;
/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;
INSERT INTO `changelog` VALUES
  (1,0,0,0,0,'The fabled start of the project!'),
  (2,0,0,1,0,'Finally, an app to work with :).'),
  (3,0,2,0,0,'You can now add your own markers! Right click on the map and log in / create an account to start adding (best suited for desktop).'),
  (4,0,2,0,0,'Optimizations for mobile devices.'),
  (5,0,2,0,0,'Tons of new markers everyday!'),
  (6,0,3,0,0,'Mark as complete! You can now right-click a marker (desktop only) to hide a marker indefinitely. You can undo this by using ctrl + z in case of a mistake. This shall help you in the quest to get all koroks, making it much easier to see what you\'re missing. This feature uses cookies, so please don\'t clean it.'),
  (7,0,3,0,0,'Don\'t show this again has been fixed. Sorry if you read the intro everytime :).'),
  (8,0,3,0,0,'(Admins only) Ability to draw lines and polygons. Soon, we will have paths for Koroks, side-quests, etc.'),
  (9,0,3,0,0,'The following markers were extracted from the game files and their position are considered final: Koroks, Shrines, Towers, Villages, Stables, Great Fairies! More to come...'),
  (10,0,4,0,0,'Remember to right-click (Desktop) or long press (Mobile) to set a marker as complete!'),
  (11,0,4,0,0,'1400+ new markers! This time we added Treasure Chests (with contents), Blupees, Goddess Statues, Memories, Diaries & Books, and Cooking Pots. These markers were extracted from the game files and their position are considered final, along with Koroks, Shrines, Towers, Villages, Stables, Great Fairies!'),
  (12,0,5,0,0,'Completed markers are tied to your account!'),
  (13,0,5,0,0,'You can now select multiple categories at the same time.'),
  (14,0,5,0,0,'The top left box can now be collapsed.'),
  (15,0,5,0,0,'Marker clustering has been disabled (experimental?).'),
  (16,0,5,0,0,'Markers now show up according to zoom.'),
  (17,0,5,0,0,'Usability fixes and improvements all over the place.'),
  (18,0,6,0,1,'Added login button for more obvious accessibility.'),
  (19,0,6,0,1,'Incremental search with type icons, visual and textual relevancy, jump-to navigation, auto-focus, and quick clear!\nWatch out, the first release of this may be wonky.\nMobile gets a separate-looking search bar.'),
  (20,0,6,0,1,'Slippery fast \'Escape\' hotkey now works for clearing the drawer and toggling its presence.\nThe undo marker completion hotkey was updated to be more intelligent per-OS.'),
  (21,0,6,0,1,'More account features such as recovering a lost password through a reset email, and changing an existing password.'),
  (22,0,6,0,1,'Able to set a starting area to focus the map on page load!\nDynamic controls available upon request to help identify the intended coordinates.\nAlso comes with some new configurable zoom parameters for snap enforcement and change interval amount.'),
  (23,0,6,0,1,'Made top drawer buttons have a larger link area and with highlighting background for representing the current state.'),
  (24,0,6,0,1,'Stylistic updates to more closely match final vision.'),
  (25,0,6,0,1,'A lot of internal system, documentation, and tooling updates!!'),
  (26,0,6,0,0,'New logo by the Zelda Universe design team!'),
  (27,0,6,0,0,'Added Login/Account button'),
  (28,0,6,0,0,'Added Lost Password and Change Password functionality'),
  (29,0,6,0,0,'Added search with live results, category icons, relevancy indicators, jump-to navigation, auto-focus, and quick clear!'),
  (30,0,6,0,0,'Removed button to collapse the sidebar on desktop in favor of hotkey (esc)'),
  (31,0,6,0,0,'Made marker completion hotkeys more intelligent per-OS'),
  (32,0,6,0,0,'Lots of small interface improvements'),
  (33,0,6,0,0,'Internal prep work and documentation for the upcoming Zelda Maps open source project'),
  (34,0,7,0,0,'<b>Multi-game support with Link\'s Awakening:</b> More maps for more Zelda games are on the way.'),
  (35,0,7,0,0,'<b>Sub-map support:</b> Sub-maps cover areas like dungeons. You can view a list of all sub-maps for a given game by clicking on \"Switch Maps\". For LA, we\'ve got maps for every dungeon. We\'re looking into ways to incorporate sub-maps into the Breath of the Wild side of things, too.'),
  (36,0,7,0,0,'<b>Reset completed markers:</b> You can now reset your completed marker progress from your account settings. Super useful if you\'re starting a new run.'),
  (37,0,7,0,0,'<b>Category completion progress:</b> Hovering over marker categories will now show you how many markers you\'ve completed out of the category total.'),
  (38,0,7,0,0,'<b>Embed codes for markers:</b> In addition to being able to get a permalink for each marker, you can now get an iframe embed code. Embeds show a nice zoomed in view of the selected marker.'),
  (39,0,8,0,0,'<b>Tears of the Kingdom is here!</b> Please take notice of the Switch Maps option in order to access other areas'),
  (40,0,8,0,0,'<b>5,182 markers added!</b> We are still 8 Koroks short, so let us know if you find them!'),
  (41,0,8,1,0,'<b>Region Labels added!</b> Should make your life easy on your quest for 100%'),
  (42,0,8,1,0,'<span color=\"red\"><b>Did you know?</b></span> On Desktop, you can press ESC key to hide the category menu! Also, logged in users don\'t see ads!'),
  (43,0,8,1,0,'<span color=\"red\"><b>Any feedback?</b></span> Please send a tweet to our dev: https://twitter.com/ninzel !'),
  (44,0,8,4,0,'Fixed marker link automatic map viewing.'),
  (45,0,9,0,0,'Added ability to specify selected categories.'),
  (46,0,9,1,0,'Added links to control category selection.'),
  (47,0,9,2,0,'Fixed marker form complete icon presence.'),
  (48,0,10,0,0,'Add account deletion capability.')
;
/*!40000 ALTER TABLE `changelog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-03 19:10:00
