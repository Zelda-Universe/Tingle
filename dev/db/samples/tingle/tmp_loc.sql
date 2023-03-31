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
-- Table structure for table `tmp_loc`
--

DROP TABLE IF EXISTS `tmp_loc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_loc` (
  `X` double DEFAULT NULL,
  `Y` double DEFAULT NULL,
  `DungeonName` varchar(100) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `adjX` double DEFAULT NULL,
  `adjY` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_loc`
--

LOCK TABLES `tmp_loc` WRITE;
/*!40000 ALTER TABLE `tmp_loc` DISABLE KEYS */;
INSERT INTO `tmp_loc` VALUES (-4022.127,-3711.697,'To Quomo Shrine',1925,65.154265625,-70.004734375);
INSERT INTO `tmp_loc` VALUES (-4446.018,-3802.419,'Hia Miu Shrine',1925,58.53096875,-68.587203125);
INSERT INTO `tmp_loc` VALUES (-4058.835,-2508.257,'Maka Rah Shrine',1925,64.580703125,-88.808484375);
INSERT INTO `tmp_loc` VALUES (-4015.362,-1722.486,'Voo Lota Shrine',1925,65.25996875,-101.08615625);
INSERT INTO `tmp_loc` VALUES (-4121.399,-414.1998,'Kah Okeo Shrine',1925,63.603140624999995,-121.528128125);
INSERT INTO `tmp_loc` VALUES (-4657.493,904.9697,'Kema Kosassa Shrine',1925,55.226671874999994,-142.1401515625);
INSERT INTO `tmp_loc` VALUES (-4673.53,1968.79,'Kema Zoos Shrine',1925,54.976093750000004,-158.76234375);
INSERT INTO `tmp_loc` VALUES (-4798.148,2800.031,'Tho Kayu Shrine',1925,53.0289375,-171.75048437499998);
INSERT INTO `tmp_loc` VALUES (-4847.434,3773.548,'Hawa Koth Shrine',1925,52.25884375,-186.96168749999998);
INSERT INTO `tmp_loc` VALUES (-3626.71,-3038.259,'Mozo Shenno Shrine',1925,71.33265625,-80.527203125);
INSERT INTO `tmp_loc` VALUES (-3822.237,-2206.896,'Sha Warvo Shrine',1925,68.277546875,-93.51724999999999);
INSERT INTO `tmp_loc` VALUES (-3618.109,-1807.609,'Rito Village',1921,71.467046875,-99.756109375);
INSERT INTO `tmp_loc` VALUES (-3255.571,-1757.625,'Rito Stable',1938,77.131703125,-100.537109375);
INSERT INTO `tmp_loc` VALUES (-3656.033,-1757.7,'Akh Va\'quot Shrine',1925,70.87448437500001,-100.5359375);
INSERT INTO `tmp_loc` VALUES (-3608.986,-1516.377,'Bareeda Naag Shrine',1925,71.60959375,-104.306609375);
INSERT INTO `tmp_loc` VALUES (-3466.357,-447.4994,'Tena Ko\'sah Shrine',1925,73.838171875,-121.007821875);
INSERT INTO `tmp_loc` VALUES (-3613.748,-990.1647,'Tabantha Tower',1923,71.5351875,-112.52867656250001);
INSERT INTO `tmp_loc` VALUES (-3852.46,716.358,'Keeha Yoog Shrine',1925,67.8053125,-139.19309375);
INSERT INTO `tmp_loc` VALUES (-3666,1828.6,'Gerudo Tower',1923,70.71875,-156.571875);
INSERT INTO `tmp_loc` VALUES (-3083.613,1221.79,'Kuh Takkar Shrine',1925,79.81854687500001,-147.09046875);
INSERT INTO `tmp_loc` VALUES (-3910.613,1653.031,'Sho Dantu Shrine',1925,66.89667187500001,-153.82860937499998);
INSERT INTO `tmp_loc` VALUES (-3560.287,1953.873,'Sasa Kai Shrine',1925,72.370515625,-158.529265625);
INSERT INTO `tmp_loc` VALUES (-3835,2915,'Gerudo Town',1921,68.078125,-173.546875);
INSERT INTO `tmp_loc` VALUES (-3316.802,2162.679,'Dako Tah Shrine',1925,76.17496875,-161.791859375);
INSERT INTO `tmp_loc` VALUES (-3816.314,2819.157,'Daqo Chisay Shrine',1925,68.37009375,-172.049328125);
INSERT INTO `tmp_loc` VALUES (-3809.56,3126.858,'Raqa Zunzo Shrine',1925,68.47562500000001,-176.85715625);
INSERT INTO `tmp_loc` VALUES (-2998.305,-3220.635,'Shada Naw Shrine',1925,81.151484375,-77.677578125);
INSERT INTO `tmp_loc` VALUES (-2377.017,-3224.61,'Rok Uwog Shrine',1925,90.859109375,-77.61546875);
INSERT INTO `tmp_loc` VALUES (-2636.745,-2061.288,'Lanno Kooh Shrine',1925,86.800859375,-95.79237499999999);
INSERT INTO `tmp_loc` VALUES (-2173,-2034,'Hebra Tower',1923,94.046875,-96.21875);
INSERT INTO `tmp_loc` VALUES (-2380.419,-2255.404,'Gee Ha\'rah Shrine',1925,90.805953125,-92.7593125);
INSERT INTO `tmp_loc` VALUES (-2793.274,-2882.063,'Goma Asaagh Shrine',1925,84.35509375000001,-82.967765625);
INSERT INTO `tmp_loc` VALUES (-2832.063,-1577.131,'Dunba Taag Shrine',1925,83.749015625,-103.35732812500001);
INSERT INTO `tmp_loc` VALUES (-2931.568,-547.598,'Tabantha Bridge Stable',1938,82.19425,-119.44378125);
INSERT INTO `tmp_loc` VALUES (-2930.76,-433.0385,'Shae Loya Shrine',1925,82.206875,-121.2337734375);
INSERT INTO `tmp_loc` VALUES (-2269.1,-901.1,'Toh Yahsa Shrine',1925,92.5453125,-113.9203125);
INSERT INTO `tmp_loc` VALUES (-2297.784,461.6641,'Mogg Latan Shrine',1925,92.097125,-135.2135015625);
INSERT INTO `tmp_loc` VALUES (-2743.992,225.7467,'Mijah Rokee Shrine',1925,85.125125,-131.5272921875);
INSERT INTO `tmp_loc` VALUES (-2004.008,1675.263,'Joloo Nah Shrine',1925,96.687375,-154.17598437499998);
INSERT INTO `tmp_loc` VALUES (-2803.812,2225.765,'Gerudo Canyon Stable',1938,84.1904375,-162.777578125);
INSERT INTO `tmp_loc` VALUES (-2306.836,2437.32,'Wasteland Tower',1923,91.95568750000001,-166.083125);
INSERT INTO `tmp_loc` VALUES (-2809.968,2300.177,'Kay Noh Shrine',1925,84.09425,-163.940265625);
INSERT INTO `tmp_loc` VALUES (-2689.307,2811.907,'Korsh O\'hu Shrine',1925,85.979578125,-171.936046875);
INSERT INTO `tmp_loc` VALUES (-2969.8,3780.634,'Misae Suma Shrine',1925,81.596875,-187.07240625);
INSERT INTO `tmp_loc` VALUES (-1672.356,-3759.028,'Sha Gehma Shrine',1925,101.8694375,-69.2651875);
INSERT INTO `tmp_loc` VALUES (-1654.883,-2572.156,'Snowfield Stable',1938,102.142453125,-87.8100625);
INSERT INTO `tmp_loc` VALUES (-1720.389,-2554.626,'Rin Oyaa Shrine',1925,101.118921875,-88.08396875);
INSERT INTO `tmp_loc` VALUES (-1088.8,-2660.744,'Rona Kachta Shrine',1925,110.9875,-86.42587499999999);
INSERT INTO `tmp_loc` VALUES (-1559.375,-1799.053,'Serenne Stable',1938,103.634765625,-99.889796875);
INSERT INTO `tmp_loc` VALUES (-1940.474,-1459.019,'Maag No\'rah Shrine',1925,97.68009375,-105.202828125);
INSERT INTO `tmp_loc` VALUES (-1489.24,-1473.803,'Monya Toma Shrine',1925,104.730625,-104.971828125);
INSERT INTO `tmp_loc` VALUES (-1432.615,-593.246,'Zalta Wa Shrine',1925,105.615390625,-118.73053125);
INSERT INTO `tmp_loc` VALUES (-1755.3,-774.3,'Ridgeland Tower',1923,100.5734375,-115.9015625);
INSERT INTO `tmp_loc` VALUES (-1892.417,91.03052,'Sheem Dagoze Shrine',1925,98.43098437500001,-129.422351875);
INSERT INTO `tmp_loc` VALUES (-1102.233,1880.131,'Shrine of Resurrection',1924,110.777609375,-157.37704687500002);
INSERT INTO `tmp_loc` VALUES (-1449.493,1269.011,'Outskirt Stable',1938,105.351671875,-147.828296875);
INSERT INTO `tmp_loc` VALUES (-1562.293,1309.783,'Rota Ooh Shrine',1925,103.589171875,-148.465359375);
INSERT INTO `tmp_loc` VALUES (-1695.714,1701.026,'Dah Kaso Shrine',1925,101.50446875,-154.57853125);
INSERT INTO `tmp_loc` VALUES (-1435.387,1990.706,'Keh Namut Shrine',1925,105.572078125,-159.10478125);
INSERT INTO `tmp_loc` VALUES (-1793.255,2422.486,'Jee Noh Shrine',1925,99.980390625,-165.85134375);
INSERT INTO `tmp_loc` VALUES (-1417.777,3449.206,'Suma Sahma Shrine',1925,105.847234375,-181.89384375);
INSERT INTO `tmp_loc` VALUES (-1795,3464.391,'Dila Maag Shrine',1925,99.953125,-182.131109375);
INSERT INTO `tmp_loc` VALUES (-821.5,-3535,'Qaza Tokki Shrine',1925,115.1640625,-72.765625);
INSERT INTO `tmp_loc` VALUES (-26.08035,-2457.688,'Daag Chokah Shrine',1925,127.59249453125,-89.598625);
INSERT INTO `tmp_loc` VALUES (-148.3952,-1159.346,'Saas Ko\'sah Shrine',1925,125.68132499999999,-109.88521875);
INSERT INTO `tmp_loc` VALUES (-952.1733,-623.8846,'Noya Neha Shrine',1925,113.1222921875,-118.251803125);
INSERT INTO `tmp_loc` VALUES (-636.0839,-344.1649,'Katah Chuki Shrine',1925,118.0611890625,-122.6224234375);
INSERT INTO `tmp_loc` VALUES (-967.6394,716.8793,'Kaam Ya\'tak Shrine',1925,112.880634375,-139.2012390625);
INSERT INTO `tmp_loc` VALUES (-788.645,442.0306,'Central Tower',1923,115.677421875,-134.906728125);
INSERT INTO `tmp_loc` VALUES (-447.6951,1990.182,'Ja Baij Shrine',1925,121.0047640625,-159.09659375);
INSERT INTO `tmp_loc` VALUES (-672.4623,1513.63,'Oman Au Shrine',1925,117.4927765625,-151.65046875000002);
INSERT INTO `tmp_loc` VALUES (-560.0352,1694.863,'Great Plateau Tower',1923,119.24945,-154.48223437500002);
INSERT INTO `tmp_loc` VALUES (-31.81555,2961.601,'Lake Tower',1923,127.50288203124998,-174.27501562499998);
INSERT INTO `tmp_loc` VALUES (-925.0303,2320.229,'Owa Daim Shrine',1925,113.5464015625,-164.253578125);
INSERT INTO `tmp_loc` VALUES (-329.1666,2600.119,'Ya Naga Shrine',1925,122.85677187499999,-168.62685937499998);
INSERT INTO `tmp_loc` VALUES (-985.7891,3564.978,'Ishto Soh Shrine',1925,112.5970453125,-183.70278125);
INSERT INTO `tmp_loc` VALUES (284.4,-3119.6,'Ketoh Wawai Shrine',1925,132.44375,-79.25625);
INSERT INTO `tmp_loc` VALUES (427.9911,-2137.471,'Korok Forest',1921,134.6873609375,-94.602015625);
INSERT INTO `tmp_loc` VALUES (470.9549,-2167.817,'Keo Ruug Shrine',1925,135.3586703125,-94.127859375);
INSERT INTO `tmp_loc` VALUES (836.6338,-2418.811,'Maag Halan Shrine',1925,141.072403125,-90.206078125);
INSERT INTO `tmp_loc` VALUES (883.8843,-1605.71,'Woodland Tower',1923,141.8106921875,-102.91078125);
INSERT INTO `tmp_loc` VALUES (18.44452,-1943.704,'Kuhn Sidajj Shrine',1925,128.288195625,-97.629625);
INSERT INTO `tmp_loc` VALUES (760.2905,-821.3871,'Namika Ozz Shrine',1925,139.8795390625,-115.1658265625);
INSERT INTO `tmp_loc` VALUES (888.0616,173.6723,'Wetland Stable',1938,141.8759625,-130.7136296875);
INSERT INTO `tmp_loc` VALUES (825.1654,187.509,'Kaya Wan Shrine',1925,140.893209375,-130.929828125);
INSERT INTO `tmp_loc` VALUES (854.0031,838.7382,'Hila Rao Shrine',1925,141.3437984375,-141.105284375);
INSERT INTO `tmp_loc` VALUES (339.2324,1095.297,'Riverside Stable',1938,133.30050625,-145.114015625);
INSERT INTO `tmp_loc` VALUES (345.5874,1007.769,'Wahgo Katta Shrine',1925,133.399803125,-143.746390625);
INSERT INTO `tmp_loc` VALUES (87.01651,1657.706,'Bosh Kala Shrine',1925,129.35963296875002,-153.90165625);
INSERT INTO `tmp_loc` VALUES (559.364,2991.178,'Pumaag Nitae Shrine',1925,136.7400625,-174.73715625);
INSERT INTO `tmp_loc` VALUES (870.4947,2329.528,'Shae Katha Shrine',1925,141.6014796875,-164.398875);
INSERT INTO `tmp_loc` VALUES (529.6001,3450.883,'Highland Stable',1938,136.2750015625,-181.920046875);
INSERT INTO `tmp_loc` VALUES (522.9542,3525.324,'Ka\'o Makagh Shrine',1925,136.171159375,-183.0831875);
INSERT INTO `tmp_loc` VALUES (94.99838,3840.943,'Shoqa Tatone Shrine',1925,129.4843496875,-188.014734375);
INSERT INTO `tmp_loc` VALUES (1536.209,-3117.468,'Shora Hah Shrine',1925,152.00326562499998,-79.2895625);
INSERT INTO `tmp_loc` VALUES (1685.152,-2467.495,'Goron City',1921,154.3305,-89.445390625);
INSERT INTO `tmp_loc` VALUES (1756.571,-2561.701,'Shae Mo\'sah Shrine',1925,155.446421875,-87.973421875);
INSERT INTO `tmp_loc` VALUES (1065.67,-1141.583,'Woodland Stable',1938,144.65109375,-110.16276562499999);
INSERT INTO `tmp_loc` VALUES (1230.997,-1212.728,'Mirro Shaz Shrine',1925,147.234328125,-109.051125);
INSERT INTO `tmp_loc` VALUES (1820.241,-1517.903,'Qua Raym Shrine',1925,156.441265625,-104.282765625);
INSERT INTO `tmp_loc` VALUES (1509.48,-377.219,'Sheh Rata Shrine',1925,151.585625,-122.105953125);
INSERT INTO `tmp_loc` VALUES (1601.833,462.7538,'Daka Tuss Shrine',1925,153.02864062499998,-135.230528125);
INSERT INTO `tmp_loc` VALUES (1841.225,891.1125,'Ta\'loh Naeg Shrine',1925,156.769140625,-141.9236328125);
INSERT INTO `tmp_loc` VALUES (1806.003,984.7596,'Kakariko Village',1921,156.218796875,-143.38686875000002);
INSERT INTO `tmp_loc` VALUES (1016.777,1714.082,'Dueling Peaks Tower',1923,143.887140625,-154.78253125);
INSERT INTO `tmp_loc` VALUES (1245.118,1850.441,'Shee Venath Shrine',1925,147.45496875,-156.91314062499998);
INSERT INTO `tmp_loc` VALUES (1266.269,1938.7,'Shee Vaneer Shrine',1925,147.785453125,-158.2921875);
INSERT INTO `tmp_loc` VALUES (1662.967,1922.396,'Ha Dahamar Shrine',1925,153.983859375,-158.0374375);
INSERT INTO `tmp_loc` VALUES (1272.917,1843.91,'Ree Dahee Shrine',1925,147.88932812500002,-156.81109375);
INSERT INTO `tmp_loc` VALUES (1761.314,1926.244,'Dueling Peaks Stable',1938,155.52053125,-158.09756249999998);
INSERT INTO `tmp_loc` VALUES (1846.561,2473.726,'Toto Sah Shrine',1925,156.852515625,-166.65196874999998);
INSERT INTO `tmp_loc` VALUES (1790.257,2992.864,'Shoda Sah Shrine',1925,155.972765625,-174.7635);
INSERT INTO `tmp_loc` VALUES (1552.023,3537.839,'Lakeside Stable',1938,152.25035937500002,-183.278734375);
INSERT INTO `tmp_loc` VALUES (1586.375,3613.992,'Shai Utoh Shrine',1925,152.787109375,-184.468625);
INSERT INTO `tmp_loc` VALUES (1331.203,3273.723,'Faron Tower',1923,148.80004687500002,-179.151921875);
INSERT INTO `tmp_loc` VALUES (2662.707,-3457.207,'Gorae Torr Shrine',1925,169.604796875,-73.981140625);
INSERT INTO `tmp_loc` VALUES (2064.973,-2327.874,'Daqa Koh Shrine',1925,160.265203125,-91.62696875);
INSERT INTO `tmp_loc` VALUES (2075.823,-2039.718,'Kayra Mah Shrine',1925,160.434734375,-96.12940625);
INSERT INTO `tmp_loc` VALUES (2613.332,-1143.513,'Foothill Stable',1938,168.8333125,-110.132609375);
INSERT INTO `tmp_loc` VALUES (2174.151,-1556.781,'Eldin Tower',1923,161.971109375,-103.675296875);
INSERT INTO `tmp_loc` VALUES (2723.078,-1165.168,'Mo\'a Keet Shrine',1925,170.54809375,-109.79425);
INSERT INTO `tmp_loc` VALUES (2666.12,-1580.328,'Sah Dahaj Shrine',1925,169.65812499999998,-103.30737500000001);
INSERT INTO `tmp_loc` VALUES (2301.462,-940.7258,'Tah Muhl Shrine',1925,163.96034375,-113.301159375);
INSERT INTO `tmp_loc` VALUES (2239.213,-292.43,'Soh Kofi Shrine',1925,162.987703125,-123.43078125);
INSERT INTO `tmp_loc` VALUES (2258,-109,'Lanayru Tower',1923,163.28125,-126.296875);
INSERT INTO `tmp_loc` VALUES (2039.633,971.7044,'Lakna Rokee Shrine',1925,159.869265625,-143.18288124999998);
INSERT INTO `tmp_loc` VALUES (2621.62,379.2342,'Mezza Lo Shrine',1925,168.96281249999998,-133.92553437499998);
INSERT INTO `tmp_loc` VALUES (2696.768,1333.017,'Dow Na\'eh Shrine',1925,170.137,-148.828390625);
INSERT INTO `tmp_loc` VALUES (2501.7,1495.582,'Kam Urog Shrine',1925,167.0890625,-151.36846875);
INSERT INTO `tmp_loc` VALUES (2735.5,2133.5,'Hateno Tower',1923,170.7421875,-161.3359375);
INSERT INTO `tmp_loc` VALUES (2636.691,2833.854,'Tawa Jinn Shrine',1925,169.19829687499998,-172.27896875);
INSERT INTO `tmp_loc` VALUES (2833.533,3311.958,'Yah Rin Shrine',1925,172.273953125,-179.74934375);
INSERT INTO `tmp_loc` VALUES (2007.901,3284.566,'Qukah Nata Shrine',1925,159.373453125,-179.32134374999998);
INSERT INTO `tmp_loc` VALUES (3324.085,-3421.369,'Zuna Kai Shrine',1925,179.938828125,-74.54110937499999);
INSERT INTO `tmp_loc` VALUES (3777.255,-2704.069,'Tutsuwa Nima Shrine',1925,187.01960937500002,-85.74892187500001);
INSERT INTO `tmp_loc` VALUES (3149.832,-1692.647,'South Akkala Stable',1938,177.216125,-101.552390625);
INSERT INTO `tmp_loc` VALUES (3308,-1500.1,'Akkala Tower',1923,179.6875,-104.5609375);
INSERT INTO `tmp_loc` VALUES (3899.691,-1303.794,'Dah Hesho Shrine',1925,188.93267187499998,-107.62821875);
INSERT INTO `tmp_loc` VALUES (3028.298,-1668.015,'Ze Kasho Shrine',1925,175.31715624999998,-101.937265625);
INSERT INTO `tmp_loc` VALUES (3964.896,-1615.017,'Tarrey Town',1921,189.9515,-102.765359375);
INSERT INTO `tmp_loc` VALUES (3271.865,-401.4883,'Zora\'s Domain',1921,179.122890625,-121.7267453125);
INSERT INTO `tmp_loc` VALUES (3323.169,-517.9188,'Ne\'ez Yohma Shrine',1925,179.924515625,-119.90751875);
INSERT INTO `tmp_loc` VALUES (3148.852,-417.3299,'Dagah Keek Shrine',1925,177.20081249999998,-121.4792203125);
INSERT INTO `tmp_loc` VALUES (3333.5,402.5,'Rucco Maag Shrine',1925,180.0859375,-134.2890625);
INSERT INTO `tmp_loc` VALUES (3883.028,1315.361,'Jitan Sa\'mi Shrine',1925,188.6723125,-148.552515625);
INSERT INTO `tmp_loc` VALUES (3592.743,2121.852,'Hateno Village',1921,184.136609375,-161.15393749999998);
INSERT INTO `tmp_loc` VALUES (3387.707,2215.13,'Myahm Agana Shrine',1925,180.932921875,-162.61140625000002);
INSERT INTO `tmp_loc` VALUES (3009.469,3477.873,'Lurelin Village',1921,175.02295312500002,-182.341765625);
INSERT INTO `tmp_loc` VALUES (3657.167,3307.993,'Muwo Jeem Shrine',1925,185.143234375,-179.687390625);
INSERT INTO `tmp_loc` VALUES (3437.285,3317.196,'Kah Yah Shrine',1925,181.707578125,-179.8311875);
INSERT INTO `tmp_loc` VALUES (4655,-3709,'Tu Ka\'loh Shrine',1925,200.734375,-70.046875);
INSERT INTO `tmp_loc` VALUES (4227.82,-2747.769,'East Akkala Stable',1938,194.0596875,-85.066109375);
INSERT INTO `tmp_loc` VALUES (4294.901,-2729.875,'Katosa Aug Shrine',1925,195.107828125,-85.345703125);
INSERT INTO `tmp_loc` VALUES (4525.04,-2128.393,'Ritaag Zumo Shrine',1925,198.70375,-94.743859375);
INSERT INTO `tmp_loc` VALUES (4708.564,-1309.511,'Kah Mael Shrine',1925,201.5713125,-107.538890625);
INSERT INTO `tmp_loc` VALUES (4194.714,-855.908,'Ke\'nai Shakah Shrine',1925,193.54240625,-114.6264375);
INSERT INTO `tmp_loc` VALUES (4245.246,253.9076,'Shai Yota Shrine',1925,194.33196875,-131.96730625);
INSERT INTO `tmp_loc` VALUES (4182.765,1686.558,'Tahno O\'ah Shrine',1925,193.355703125,-154.35246875);
INSERT INTO `tmp_loc` VALUES (4011.483,2989.831,'Chaas Qeta Shrine',1925,190.679421875,-174.716109375);
INSERT INTO `tmp_loc` VALUES (4736.618,3771.592,'Korgu Chideh Shrine',1925,202.00965625,-186.931125);
/*!40000 ALTER TABLE `tmp_loc` ENABLE KEYS */;
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
