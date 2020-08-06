-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: medlog
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB

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
-- Table structure for table `timezones`
--

DROP TABLE IF EXISTS timezones;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE timezones (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  tz varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY tz (tz)
) ENGINE=InnoDB AUTO_INCREMENT=614 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezones`
--

LOCK TABLES timezones WRITE;
/*!40000 ALTER TABLE timezones DISABLE KEYS */;
INSERT INTO timezones (id, tz) VALUES (2,'Africa');
INSERT INTO timezones (id, tz) VALUES (12,'Africa/Abidjan');
INSERT INTO timezones (id, tz) VALUES (36,'Africa/Accra');
INSERT INTO timezones (id, tz) VALUES (48,'Africa/Addis_Ababa');
INSERT INTO timezones (id, tz) VALUES (52,'Africa/Algiers');
INSERT INTO timezones (id, tz) VALUES (17,'Africa/Asmara');
INSERT INTO timezones (id, tz) VALUES (4,'Africa/Asmera');
INSERT INTO timezones (id, tz) VALUES (24,'Africa/Bamako');
INSERT INTO timezones (id, tz) VALUES (5,'Africa/Bangui');
INSERT INTO timezones (id, tz) VALUES (46,'Africa/Banjul');
INSERT INTO timezones (id, tz) VALUES (35,'Africa/Bissau');
INSERT INTO timezones (id, tz) VALUES (21,'Africa/Blantyre');
INSERT INTO timezones (id, tz) VALUES (44,'Africa/Brazzaville');
INSERT INTO timezones (id, tz) VALUES (43,'Africa/Bujumbura');
INSERT INTO timezones (id, tz) VALUES (30,'Africa/Cairo');
INSERT INTO timezones (id, tz) VALUES (9,'Africa/Casablanca');
INSERT INTO timezones (id, tz) VALUES (7,'Africa/Ceuta');
INSERT INTO timezones (id, tz) VALUES (28,'Africa/Conakry');
INSERT INTO timezones (id, tz) VALUES (18,'Africa/Dakar');
INSERT INTO timezones (id, tz) VALUES (13,'Africa/Dar_es_Salaam');
INSERT INTO timezones (id, tz) VALUES (53,'Africa/Djibouti');
INSERT INTO timezones (id, tz) VALUES (10,'Africa/Douala');
INSERT INTO timezones (id, tz) VALUES (26,'Africa/El_Aaiun');
INSERT INTO timezones (id, tz) VALUES (49,'Africa/Freetown');
INSERT INTO timezones (id, tz) VALUES (38,'Africa/Gaborone');
INSERT INTO timezones (id, tz) VALUES (8,'Africa/Harare');
INSERT INTO timezones (id, tz) VALUES (15,'Africa/Johannesburg');
INSERT INTO timezones (id, tz) VALUES (19,'Africa/Juba');
INSERT INTO timezones (id, tz) VALUES (31,'Africa/Kampala');
INSERT INTO timezones (id, tz) VALUES (3,'Africa/Khartoum');
INSERT INTO timezones (id, tz) VALUES (22,'Africa/Kigali');
INSERT INTO timezones (id, tz) VALUES (29,'Africa/Kinshasa');
INSERT INTO timezones (id, tz) VALUES (6,'Africa/Lagos');
INSERT INTO timezones (id, tz) VALUES (23,'Africa/Libreville');
INSERT INTO timezones (id, tz) VALUES (39,'Africa/Lome');
INSERT INTO timezones (id, tz) VALUES (45,'Africa/Luanda');
INSERT INTO timezones (id, tz) VALUES (37,'Africa/Lubumbashi');
INSERT INTO timezones (id, tz) VALUES (14,'Africa/Lusaka');
INSERT INTO timezones (id, tz) VALUES (55,'Africa/Malabo');
INSERT INTO timezones (id, tz) VALUES (50,'Africa/Maputo');
INSERT INTO timezones (id, tz) VALUES (32,'Africa/Maseru');
INSERT INTO timezones (id, tz) VALUES (33,'Africa/Mbabane');
INSERT INTO timezones (id, tz) VALUES (51,'Africa/Mogadishu');
INSERT INTO timezones (id, tz) VALUES (34,'Africa/Monrovia');
INSERT INTO timezones (id, tz) VALUES (11,'Africa/Nairobi');
INSERT INTO timezones (id, tz) VALUES (47,'Africa/Ndjamena');
INSERT INTO timezones (id, tz) VALUES (41,'Africa/Niamey');
INSERT INTO timezones (id, tz) VALUES (42,'Africa/Nouakchott');
INSERT INTO timezones (id, tz) VALUES (16,'Africa/Ouagadougou');
INSERT INTO timezones (id, tz) VALUES (56,'Africa/Porto-Novo');
INSERT INTO timezones (id, tz) VALUES (54,'Africa/Sao_Tome');
INSERT INTO timezones (id, tz) VALUES (25,'Africa/Timbuktu');
INSERT INTO timezones (id, tz) VALUES (40,'Africa/Tripoli');
INSERT INTO timezones (id, tz) VALUES (20,'Africa/Tunis');
INSERT INTO timezones (id, tz) VALUES (27,'Africa/Windhoek');
INSERT INTO timezones (id, tz) VALUES (145,'America');
INSERT INTO timezones (id, tz) VALUES (314,'America/Adak');
INSERT INTO timezones (id, tz) VALUES (244,'America/Anchorage');
INSERT INTO timezones (id, tz) VALUES (171,'America/Anguilla');
INSERT INTO timezones (id, tz) VALUES (149,'America/Antigua');
INSERT INTO timezones (id, tz) VALUES (299,'America/Araguaina');
INSERT INTO timezones (id, tz) VALUES (278,'America/Argentina');
INSERT INTO timezones (id, tz) VALUES (279,'America/Argentina/Buenos_Aires');
INSERT INTO timezones (id, tz) VALUES (282,'America/Argentina/Catamarca');
INSERT INTO timezones (id, tz) VALUES (290,'America/Argentina/ComodRivadavia');
INSERT INTO timezones (id, tz) VALUES (281,'America/Argentina/Cordoba');
INSERT INTO timezones (id, tz) VALUES (283,'America/Argentina/Jujuy');
INSERT INTO timezones (id, tz) VALUES (289,'America/Argentina/La_Rioja');
INSERT INTO timezones (id, tz) VALUES (287,'America/Argentina/Mendoza');
INSERT INTO timezones (id, tz) VALUES (284,'America/Argentina/Rio_Gallegos');
INSERT INTO timezones (id, tz) VALUES (280,'America/Argentina/Salta');
INSERT INTO timezones (id, tz) VALUES (291,'America/Argentina/San_Juan');
INSERT INTO timezones (id, tz) VALUES (286,'America/Argentina/San_Luis');
INSERT INTO timezones (id, tz) VALUES (285,'America/Argentina/Tucuman');
INSERT INTO timezones (id, tz) VALUES (288,'America/Argentina/Ushuaia');
INSERT INTO timezones (id, tz) VALUES (313,'America/Aruba');
INSERT INTO timezones (id, tz) VALUES (242,'America/Asuncion');
INSERT INTO timezones (id, tz) VALUES (238,'America/Atikokan');
INSERT INTO timezones (id, tz) VALUES (152,'America/Atka');
INSERT INTO timezones (id, tz) VALUES (208,'America/Bahia');
INSERT INTO timezones (id, tz) VALUES (148,'America/Bahia_Banderas');
INSERT INTO timezones (id, tz) VALUES (150,'America/Barbados');
INSERT INTO timezones (id, tz) VALUES (237,'America/Belem');
INSERT INTO timezones (id, tz) VALUES (254,'America/Belize');
INSERT INTO timezones (id, tz) VALUES (213,'America/Blanc-Sablon');
INSERT INTO timezones (id, tz) VALUES (223,'America/Boa_Vista');
INSERT INTO timezones (id, tz) VALUES (205,'America/Bogota');
INSERT INTO timezones (id, tz) VALUES (151,'America/Boise');
INSERT INTO timezones (id, tz) VALUES (168,'America/Buenos_Aires');
INSERT INTO timezones (id, tz) VALUES (160,'America/Cambridge_Bay');
INSERT INTO timezones (id, tz) VALUES (186,'America/Campo_Grande');
INSERT INTO timezones (id, tz) VALUES (296,'America/Cancun');
INSERT INTO timezones (id, tz) VALUES (255,'America/Caracas');
INSERT INTO timezones (id, tz) VALUES (217,'America/Catamarca');
INSERT INTO timezones (id, tz) VALUES (156,'America/Cayenne');
INSERT INTO timezones (id, tz) VALUES (251,'America/Cayman');
INSERT INTO timezones (id, tz) VALUES (158,'America/Chicago');
INSERT INTO timezones (id, tz) VALUES (311,'America/Chihuahua');
INSERT INTO timezones (id, tz) VALUES (220,'America/Coral_Harbour');
INSERT INTO timezones (id, tz) VALUES (189,'America/Cordoba');
INSERT INTO timezones (id, tz) VALUES (146,'America/Costa_Rica');
INSERT INTO timezones (id, tz) VALUES (192,'America/Creston');
INSERT INTO timezones (id, tz) VALUES (243,'America/Cuiaba');
INSERT INTO timezones (id, tz) VALUES (182,'America/Curacao');
INSERT INTO timezones (id, tz) VALUES (253,'America/Danmarkshavn');
INSERT INTO timezones (id, tz) VALUES (300,'America/Dawson');
INSERT INTO timezones (id, tz) VALUES (201,'America/Dawson_Creek');
INSERT INTO timezones (id, tz) VALUES (248,'America/Denver');
INSERT INTO timezones (id, tz) VALUES (252,'America/Detroit');
INSERT INTO timezones (id, tz) VALUES (312,'America/Dominica');
INSERT INTO timezones (id, tz) VALUES (229,'America/Edmonton');
INSERT INTO timezones (id, tz) VALUES (239,'America/Eirunepe');
INSERT INTO timezones (id, tz) VALUES (277,'America/El_Salvador');
INSERT INTO timezones (id, tz) VALUES (210,'America/Ensenada');
INSERT INTO timezones (id, tz) VALUES (222,'America/Fortaleza');
INSERT INTO timezones (id, tz) VALUES (301,'America/Fort_Nelson');
INSERT INTO timezones (id, tz) VALUES (179,'America/Fort_Wayne');
INSERT INTO timezones (id, tz) VALUES (169,'America/Glace_Bay');
INSERT INTO timezones (id, tz) VALUES (292,'America/Godthab');
INSERT INTO timezones (id, tz) VALUES (163,'America/Goose_Bay');
INSERT INTO timezones (id, tz) VALUES (153,'America/Grand_Turk');
INSERT INTO timezones (id, tz) VALUES (297,'America/Grenada');
INSERT INTO timezones (id, tz) VALUES (270,'America/Guadeloupe');
INSERT INTO timezones (id, tz) VALUES (263,'America/Guatemala');
INSERT INTO timezones (id, tz) VALUES (188,'America/Guayaquil');
INSERT INTO timezones (id, tz) VALUES (215,'America/Guyana');
INSERT INTO timezones (id, tz) VALUES (249,'America/Halifax');
INSERT INTO timezones (id, tz) VALUES (161,'America/Havana');
INSERT INTO timezones (id, tz) VALUES (241,'America/Hermosillo');
INSERT INTO timezones (id, tz) VALUES (302,'America/Indiana');
INSERT INTO timezones (id, tz) VALUES (304,'America/Indiana/Indianapolis');
INSERT INTO timezones (id, tz) VALUES (307,'America/Indiana/Knox');
INSERT INTO timezones (id, tz) VALUES (303,'America/Indiana/Marengo');
INSERT INTO timezones (id, tz) VALUES (309,'America/Indiana/Petersburg');
INSERT INTO timezones (id, tz) VALUES (305,'America/Indiana/Tell_City');
INSERT INTO timezones (id, tz) VALUES (310,'America/Indiana/Vevay');
INSERT INTO timezones (id, tz) VALUES (306,'America/Indiana/Vincennes');
INSERT INTO timezones (id, tz) VALUES (308,'America/Indiana/Winamac');
INSERT INTO timezones (id, tz) VALUES (184,'America/Indianapolis');
INSERT INTO timezones (id, tz) VALUES (295,'America/Inuvik');
INSERT INTO timezones (id, tz) VALUES (274,'America/Iqaluit');
INSERT INTO timezones (id, tz) VALUES (261,'America/Jamaica');
INSERT INTO timezones (id, tz) VALUES (221,'America/Jujuy');
INSERT INTO timezones (id, tz) VALUES (233,'America/Juneau');
INSERT INTO timezones (id, tz) VALUES (265,'America/Kentucky');
INSERT INTO timezones (id, tz) VALUES (267,'America/Kentucky/Louisville');
INSERT INTO timezones (id, tz) VALUES (266,'America/Kentucky/Monticello');
INSERT INTO timezones (id, tz) VALUES (185,'America/Knox_IN');
INSERT INTO timezones (id, tz) VALUES (147,'America/Kralendijk');
INSERT INTO timezones (id, tz) VALUES (212,'America/La_Paz');
INSERT INTO timezones (id, tz) VALUES (174,'America/Lima');
INSERT INTO timezones (id, tz) VALUES (218,'America/Los_Angeles');
INSERT INTO timezones (id, tz) VALUES (269,'America/Louisville');
INSERT INTO timezones (id, tz) VALUES (271,'America/Lower_Princes');
INSERT INTO timezones (id, tz) VALUES (224,'America/Maceio');
INSERT INTO timezones (id, tz) VALUES (228,'America/Managua');
INSERT INTO timezones (id, tz) VALUES (202,'America/Manaus');
INSERT INTO timezones (id, tz) VALUES (154,'America/Marigot');
INSERT INTO timezones (id, tz) VALUES (227,'America/Martinique');
INSERT INTO timezones (id, tz) VALUES (187,'America/Matamoros');
INSERT INTO timezones (id, tz) VALUES (195,'America/Mazatlan');
INSERT INTO timezones (id, tz) VALUES (298,'America/Mendoza');
INSERT INTO timezones (id, tz) VALUES (259,'America/Menominee');
INSERT INTO timezones (id, tz) VALUES (234,'America/Merida');
INSERT INTO timezones (id, tz) VALUES (177,'America/Metlakatla');
INSERT INTO timezones (id, tz) VALUES (206,'America/Mexico_City');
INSERT INTO timezones (id, tz) VALUES (226,'America/Miquelon');
INSERT INTO timezones (id, tz) VALUES (315,'America/Moncton');
INSERT INTO timezones (id, tz) VALUES (219,'America/Monterrey');
INSERT INTO timezones (id, tz) VALUES (235,'America/Montevideo');
INSERT INTO timezones (id, tz) VALUES (162,'America/Montreal');
INSERT INTO timezones (id, tz) VALUES (180,'America/Montserrat');
INSERT INTO timezones (id, tz) VALUES (268,'America/Nassau');
INSERT INTO timezones (id, tz) VALUES (273,'America/New_York');
INSERT INTO timezones (id, tz) VALUES (275,'America/Nipigon');
INSERT INTO timezones (id, tz) VALUES (211,'America/Nome');
INSERT INTO timezones (id, tz) VALUES (178,'America/Noronha');
INSERT INTO timezones (id, tz) VALUES (164,'America/North_Dakota');
INSERT INTO timezones (id, tz) VALUES (165,'America/North_Dakota/Beulah');
INSERT INTO timezones (id, tz) VALUES (166,'America/North_Dakota/Center');
INSERT INTO timezones (id, tz) VALUES (167,'America/North_Dakota/New_Salem');
INSERT INTO timezones (id, tz) VALUES (204,'America/Ojinaga');
INSERT INTO timezones (id, tz) VALUES (209,'America/Panama');
INSERT INTO timezones (id, tz) VALUES (240,'America/Pangnirtung');
INSERT INTO timezones (id, tz) VALUES (214,'America/Paramaribo');
INSERT INTO timezones (id, tz) VALUES (155,'America/Phoenix');
INSERT INTO timezones (id, tz) VALUES (294,'America/Port-au-Prince');
INSERT INTO timezones (id, tz) VALUES (232,'America/Porto_Acre');
INSERT INTO timezones (id, tz) VALUES (293,'America/Porto_Velho');
INSERT INTO timezones (id, tz) VALUES (183,'America/Port_of_Spain');
INSERT INTO timezones (id, tz) VALUES (225,'America/Puerto_Rico');
INSERT INTO timezones (id, tz) VALUES (276,'America/Punta_Arenas');
INSERT INTO timezones (id, tz) VALUES (236,'America/Rainy_River');
INSERT INTO timezones (id, tz) VALUES (194,'America/Rankin_Inlet');
INSERT INTO timezones (id, tz) VALUES (191,'America/Recife');
INSERT INTO timezones (id, tz) VALUES (199,'America/Regina');
INSERT INTO timezones (id, tz) VALUES (157,'America/Resolute');
INSERT INTO timezones (id, tz) VALUES (198,'America/Rio_Branco');
INSERT INTO timezones (id, tz) VALUES (200,'America/Rosario');
INSERT INTO timezones (id, tz) VALUES (247,'America/Santarem');
INSERT INTO timezones (id, tz) VALUES (203,'America/Santa_Isabel');
INSERT INTO timezones (id, tz) VALUES (256,'America/Santiago');
INSERT INTO timezones (id, tz) VALUES (262,'America/Santo_Domingo');
INSERT INTO timezones (id, tz) VALUES (190,'America/Sao_Paulo');
INSERT INTO timezones (id, tz) VALUES (246,'America/Scoresbysund');
INSERT INTO timezones (id, tz) VALUES (159,'America/Shiprock');
INSERT INTO timezones (id, tz) VALUES (207,'America/Sitka');
INSERT INTO timezones (id, tz) VALUES (250,'America/St_Barthelemy');
INSERT INTO timezones (id, tz) VALUES (170,'America/St_Johns');
INSERT INTO timezones (id, tz) VALUES (197,'America/St_Kitts');
INSERT INTO timezones (id, tz) VALUES (257,'America/St_Lucia');
INSERT INTO timezones (id, tz) VALUES (258,'America/St_Thomas');
INSERT INTO timezones (id, tz) VALUES (216,'America/St_Vincent');
INSERT INTO timezones (id, tz) VALUES (176,'America/Swift_Current');
INSERT INTO timezones (id, tz) VALUES (172,'America/Tegucigalpa');
INSERT INTO timezones (id, tz) VALUES (231,'America/Thule');
INSERT INTO timezones (id, tz) VALUES (272,'America/Thunder_Bay');
INSERT INTO timezones (id, tz) VALUES (181,'America/Tijuana');
INSERT INTO timezones (id, tz) VALUES (245,'America/Toronto');
INSERT INTO timezones (id, tz) VALUES (193,'America/Tortola');
INSERT INTO timezones (id, tz) VALUES (230,'America/Vancouver');
INSERT INTO timezones (id, tz) VALUES (264,'America/Virgin');
INSERT INTO timezones (id, tz) VALUES (260,'America/Whitehorse');
INSERT INTO timezones (id, tz) VALUES (173,'America/Winnipeg');
INSERT INTO timezones (id, tz) VALUES (175,'America/Yakutat');
INSERT INTO timezones (id, tz) VALUES (196,'America/Yellowknife');
INSERT INTO timezones (id, tz) VALUES (316,'Antarctica');
INSERT INTO timezones (id, tz) VALUES (324,'Antarctica/Casey');
INSERT INTO timezones (id, tz) VALUES (317,'Antarctica/Davis');
INSERT INTO timezones (id, tz) VALUES (323,'Antarctica/DumontDUrville');
INSERT INTO timezones (id, tz) VALUES (325,'Antarctica/Macquarie');
INSERT INTO timezones (id, tz) VALUES (326,'Antarctica/Mawson');
INSERT INTO timezones (id, tz) VALUES (320,'Antarctica/McMurdo');
INSERT INTO timezones (id, tz) VALUES (322,'Antarctica/Palmer');
INSERT INTO timezones (id, tz) VALUES (321,'Antarctica/Rothera');
INSERT INTO timezones (id, tz) VALUES (327,'Antarctica/South_Pole');
INSERT INTO timezones (id, tz) VALUES (318,'Antarctica/Syowa');
INSERT INTO timezones (id, tz) VALUES (328,'Antarctica/Troll');
INSERT INTO timezones (id, tz) VALUES (319,'Antarctica/Vostok');
INSERT INTO timezones (id, tz) VALUES (106,'Arctic');
INSERT INTO timezones (id, tz) VALUES (107,'Arctic/Longyearbyen');
INSERT INTO timezones (id, tz) VALUES (332,'Asia');
INSERT INTO timezones (id, tz) VALUES (383,'Asia/Aden');
INSERT INTO timezones (id, tz) VALUES (389,'Asia/Almaty');
INSERT INTO timezones (id, tz) VALUES (362,'Asia/Amman');
INSERT INTO timezones (id, tz) VALUES (402,'Asia/Anadyr');
INSERT INTO timezones (id, tz) VALUES (335,'Asia/Aqtau');
INSERT INTO timezones (id, tz) VALUES (347,'Asia/Aqtobe');
INSERT INTO timezones (id, tz) VALUES (394,'Asia/Ashgabat');
INSERT INTO timezones (id, tz) VALUES (410,'Asia/Ashkhabad');
INSERT INTO timezones (id, tz) VALUES (388,'Asia/Atyrau');
INSERT INTO timezones (id, tz) VALUES (423,'Asia/Baghdad');
INSERT INTO timezones (id, tz) VALUES (356,'Asia/Bahrain');
INSERT INTO timezones (id, tz) VALUES (351,'Asia/Baku');
INSERT INTO timezones (id, tz) VALUES (387,'Asia/Bangkok');
INSERT INTO timezones (id, tz) VALUES (359,'Asia/Barnaul');
INSERT INTO timezones (id, tz) VALUES (349,'Asia/Beirut');
INSERT INTO timezones (id, tz) VALUES (363,'Asia/Bishkek');
INSERT INTO timezones (id, tz) VALUES (355,'Asia/Brunei');
INSERT INTO timezones (id, tz) VALUES (380,'Asia/Calcutta');
INSERT INTO timezones (id, tz) VALUES (390,'Asia/Chita');
INSERT INTO timezones (id, tz) VALUES (398,'Asia/Choibalsan');
INSERT INTO timezones (id, tz) VALUES (333,'Asia/Chongqing');
INSERT INTO timezones (id, tz) VALUES (384,'Asia/Chungking');
INSERT INTO timezones (id, tz) VALUES (361,'Asia/Colombo');
INSERT INTO timezones (id, tz) VALUES (430,'Asia/Dacca');
INSERT INTO timezones (id, tz) VALUES (403,'Asia/Damascus');
INSERT INTO timezones (id, tz) VALUES (345,'Asia/Dhaka');
INSERT INTO timezones (id, tz) VALUES (421,'Asia/Dili');
INSERT INTO timezones (id, tz) VALUES (372,'Asia/Dubai');
INSERT INTO timezones (id, tz) VALUES (409,'Asia/Dushanbe');
INSERT INTO timezones (id, tz) VALUES (427,'Asia/Famagusta');
INSERT INTO timezones (id, tz) VALUES (342,'Asia/Gaza');
INSERT INTO timezones (id, tz) VALUES (411,'Asia/Harbin');
INSERT INTO timezones (id, tz) VALUES (404,'Asia/Hebron');
INSERT INTO timezones (id, tz) VALUES (413,'Asia/Hong_Kong');
INSERT INTO timezones (id, tz) VALUES (422,'Asia/Hovd');
INSERT INTO timezones (id, tz) VALUES (338,'Asia/Ho_Chi_Minh');
INSERT INTO timezones (id, tz) VALUES (336,'Asia/Irkutsk');
INSERT INTO timezones (id, tz) VALUES (395,'Asia/Istanbul');
INSERT INTO timezones (id, tz) VALUES (367,'Asia/Jakarta');
INSERT INTO timezones (id, tz) VALUES (348,'Asia/Jayapura');
INSERT INTO timezones (id, tz) VALUES (353,'Asia/Jerusalem');
INSERT INTO timezones (id, tz) VALUES (371,'Asia/Kabul');
INSERT INTO timezones (id, tz) VALUES (393,'Asia/Kamchatka');
INSERT INTO timezones (id, tz) VALUES (406,'Asia/Karachi');
INSERT INTO timezones (id, tz) VALUES (340,'Asia/Kashgar');
INSERT INTO timezones (id, tz) VALUES (337,'Asia/Kathmandu');
INSERT INTO timezones (id, tz) VALUES (429,'Asia/Katmandu');
INSERT INTO timezones (id, tz) VALUES (415,'Asia/Khandyga');
INSERT INTO timezones (id, tz) VALUES (381,'Asia/Kolkata');
INSERT INTO timezones (id, tz) VALUES (354,'Asia/Krasnoyarsk');
INSERT INTO timezones (id, tz) VALUES (357,'Asia/Kuala_Lumpur');
INSERT INTO timezones (id, tz) VALUES (368,'Asia/Kuching');
INSERT INTO timezones (id, tz) VALUES (428,'Asia/Kuwait');
INSERT INTO timezones (id, tz) VALUES (374,'Asia/Macao');
INSERT INTO timezones (id, tz) VALUES (344,'Asia/Macau');
INSERT INTO timezones (id, tz) VALUES (382,'Asia/Magadan');
INSERT INTO timezones (id, tz) VALUES (366,'Asia/Makassar');
INSERT INTO timezones (id, tz) VALUES (343,'Asia/Manila');
INSERT INTO timezones (id, tz) VALUES (420,'Asia/Muscat');
INSERT INTO timezones (id, tz) VALUES (379,'Asia/Nicosia');
INSERT INTO timezones (id, tz) VALUES (364,'Asia/Novokuznetsk');
INSERT INTO timezones (id, tz) VALUES (396,'Asia/Novosibirsk');
INSERT INTO timezones (id, tz) VALUES (416,'Asia/Omsk');
INSERT INTO timezones (id, tz) VALUES (375,'Asia/Oral');
INSERT INTO timezones (id, tz) VALUES (424,'Asia/Phnom_Penh');
INSERT INTO timezones (id, tz) VALUES (419,'Asia/Pontianak');
INSERT INTO timezones (id, tz) VALUES (407,'Asia/Pyongyang');
INSERT INTO timezones (id, tz) VALUES (358,'Asia/Qatar');
INSERT INTO timezones (id, tz) VALUES (370,'Asia/Qyzylorda');
INSERT INTO timezones (id, tz) VALUES (412,'Asia/Rangoon');
INSERT INTO timezones (id, tz) VALUES (400,'Asia/Riyadh');
INSERT INTO timezones (id, tz) VALUES (373,'Asia/Saigon');
INSERT INTO timezones (id, tz) VALUES (385,'Asia/Sakhalin');
INSERT INTO timezones (id, tz) VALUES (408,'Asia/Samarkand');
INSERT INTO timezones (id, tz) VALUES (392,'Asia/Seoul');
INSERT INTO timezones (id, tz) VALUES (377,'Asia/Shanghai');
INSERT INTO timezones (id, tz) VALUES (369,'Asia/Singapore');
INSERT INTO timezones (id, tz) VALUES (417,'Asia/Srednekolymsk');
INSERT INTO timezones (id, tz) VALUES (376,'Asia/Taipei');
INSERT INTO timezones (id, tz) VALUES (386,'Asia/Tashkent');
INSERT INTO timezones (id, tz) VALUES (334,'Asia/Tbilisi');
INSERT INTO timezones (id, tz) VALUES (365,'Asia/Tehran');
INSERT INTO timezones (id, tz) VALUES (378,'Asia/Tel_Aviv');
INSERT INTO timezones (id, tz) VALUES (399,'Asia/Thimbu');
INSERT INTO timezones (id, tz) VALUES (346,'Asia/Thimphu');
INSERT INTO timezones (id, tz) VALUES (339,'Asia/Tokyo');
INSERT INTO timezones (id, tz) VALUES (391,'Asia/Tomsk');
INSERT INTO timezones (id, tz) VALUES (426,'Asia/Ujung_Pandang');
INSERT INTO timezones (id, tz) VALUES (360,'Asia/Ulaanbaatar');
INSERT INTO timezones (id, tz) VALUES (405,'Asia/Ulan_Bator');
INSERT INTO timezones (id, tz) VALUES (352,'Asia/Urumqi');
INSERT INTO timezones (id, tz) VALUES (414,'Asia/Ust-Nera');
INSERT INTO timezones (id, tz) VALUES (341,'Asia/Vientiane');
INSERT INTO timezones (id, tz) VALUES (350,'Asia/Vladivostok');
INSERT INTO timezones (id, tz) VALUES (418,'Asia/Yakutsk');
INSERT INTO timezones (id, tz) VALUES (425,'Asia/Yangon');
INSERT INTO timezones (id, tz) VALUES (401,'Asia/Yekaterinburg');
INSERT INTO timezones (id, tz) VALUES (397,'Asia/Yerevan');
INSERT INTO timezones (id, tz) VALUES (503,'Atlantic');
INSERT INTO timezones (id, tz) VALUES (511,'Atlantic/Azores');
INSERT INTO timezones (id, tz) VALUES (513,'Atlantic/Bermuda');
INSERT INTO timezones (id, tz) VALUES (507,'Atlantic/Canary');
INSERT INTO timezones (id, tz) VALUES (510,'Atlantic/Cape_Verde');
INSERT INTO timezones (id, tz) VALUES (514,'Atlantic/Faeroe');
INSERT INTO timezones (id, tz) VALUES (509,'Atlantic/Faroe');
INSERT INTO timezones (id, tz) VALUES (508,'Atlantic/Jan_Mayen');
INSERT INTO timezones (id, tz) VALUES (504,'Atlantic/Madeira');
INSERT INTO timezones (id, tz) VALUES (506,'Atlantic/Reykjavik');
INSERT INTO timezones (id, tz) VALUES (505,'Atlantic/South_Georgia');
INSERT INTO timezones (id, tz) VALUES (515,'Atlantic/Stanley');
INSERT INTO timezones (id, tz) VALUES (512,'Atlantic/St_Helena');
INSERT INTO timezones (id, tz) VALUES (432,'Australia');
INSERT INTO timezones (id, tz) VALUES (438,'Australia/ACT');
INSERT INTO timezones (id, tz) VALUES (433,'Australia/Adelaide');
INSERT INTO timezones (id, tz) VALUES (443,'Australia/Brisbane');
INSERT INTO timezones (id, tz) VALUES (436,'Australia/Broken_Hill');
INSERT INTO timezones (id, tz) VALUES (448,'Australia/Canberra');
INSERT INTO timezones (id, tz) VALUES (442,'Australia/Currie');
INSERT INTO timezones (id, tz) VALUES (452,'Australia/Darwin');
INSERT INTO timezones (id, tz) VALUES (441,'Australia/Eucla');
INSERT INTO timezones (id, tz) VALUES (445,'Australia/Hobart');
INSERT INTO timezones (id, tz) VALUES (434,'Australia/LHI');
INSERT INTO timezones (id, tz) VALUES (439,'Australia/Lindeman');
INSERT INTO timezones (id, tz) VALUES (449,'Australia/Lord_Howe');
INSERT INTO timezones (id, tz) VALUES (453,'Australia/Melbourne');
INSERT INTO timezones (id, tz) VALUES (440,'Australia/North');
INSERT INTO timezones (id, tz) VALUES (435,'Australia/NSW');
INSERT INTO timezones (id, tz) VALUES (451,'Australia/Perth');
INSERT INTO timezones (id, tz) VALUES (444,'Australia/Queensland');
INSERT INTO timezones (id, tz) VALUES (454,'Australia/South');
INSERT INTO timezones (id, tz) VALUES (446,'Australia/Sydney');
INSERT INTO timezones (id, tz) VALUES (455,'Australia/Tasmania');
INSERT INTO timezones (id, tz) VALUES (447,'Australia/Victoria');
INSERT INTO timezones (id, tz) VALUES (450,'Australia/West');
INSERT INTO timezones (id, tz) VALUES (437,'Australia/Yancowinna');
INSERT INTO timezones (id, tz) VALUES (598,'Brazil');
INSERT INTO timezones (id, tz) VALUES (600,'Brazil/Acre');
INSERT INTO timezones (id, tz) VALUES (599,'Brazil/DeNoronha');
INSERT INTO timezones (id, tz) VALUES (601,'Brazil/East');
INSERT INTO timezones (id, tz) VALUES (602,'Brazil/West');
INSERT INTO timezones (id, tz) VALUES (517,'Canada');
INSERT INTO timezones (id, tz) VALUES (523,'Canada/Atlantic');
INSERT INTO timezones (id, tz) VALUES (519,'Canada/Central');
INSERT INTO timezones (id, tz) VALUES (520,'Canada/East-Saskatchewan');
INSERT INTO timezones (id, tz) VALUES (524,'Canada/Eastern');
INSERT INTO timezones (id, tz) VALUES (521,'Canada/Mountain');
INSERT INTO timezones (id, tz) VALUES (526,'Canada/Newfoundland');
INSERT INTO timezones (id, tz) VALUES (518,'Canada/Pacific');
INSERT INTO timezones (id, tz) VALUES (522,'Canada/Saskatchewan');
INSERT INTO timezones (id, tz) VALUES (525,'Canada/Yukon');
INSERT INTO timezones (id, tz) VALUES (531,'CET');
INSERT INTO timezones (id, tz) VALUES (527,'Chile');
INSERT INTO timezones (id, tz) VALUES (529,'Chile/Continental');
INSERT INTO timezones (id, tz) VALUES (528,'Chile/EasterIsland');
INSERT INTO timezones (id, tz) VALUES (456,'CST6CDT');
INSERT INTO timezones (id, tz) VALUES (501,'Cuba');
INSERT INTO timezones (id, tz) VALUES (476,'EET');
INSERT INTO timezones (id, tz) VALUES (497,'Egypt');
INSERT INTO timezones (id, tz) VALUES (60,'Eire');
INSERT INTO timezones (id, tz) VALUES (495,'EST');
INSERT INTO timezones (id, tz) VALUES (108,'EST5EDT');
INSERT INTO timezones (id, tz) VALUES (109,'Etc');
INSERT INTO timezones (id, tz) VALUES (137,'Etc/GMT');
INSERT INTO timezones (id, tz) VALUES (125,'Etc/GMT+0');
INSERT INTO timezones (id, tz) VALUES (127,'Etc/GMT+1');
INSERT INTO timezones (id, tz) VALUES (140,'Etc/GMT+10');
INSERT INTO timezones (id, tz) VALUES (130,'Etc/GMT+11');
INSERT INTO timezones (id, tz) VALUES (117,'Etc/GMT+12');
INSERT INTO timezones (id, tz) VALUES (112,'Etc/GMT+2');
INSERT INTO timezones (id, tz) VALUES (135,'Etc/GMT+3');
INSERT INTO timezones (id, tz) VALUES (138,'Etc/GMT+4');
INSERT INTO timezones (id, tz) VALUES (115,'Etc/GMT+5');
INSERT INTO timezones (id, tz) VALUES (139,'Etc/GMT+6');
INSERT INTO timezones (id, tz) VALUES (143,'Etc/GMT+7');
INSERT INTO timezones (id, tz) VALUES (144,'Etc/GMT+8');
INSERT INTO timezones (id, tz) VALUES (123,'Etc/GMT+9');
INSERT INTO timezones (id, tz) VALUES (111,'Etc/GMT-0');
INSERT INTO timezones (id, tz) VALUES (114,'Etc/GMT-1');
INSERT INTO timezones (id, tz) VALUES (118,'Etc/GMT-10');
INSERT INTO timezones (id, tz) VALUES (116,'Etc/GMT-11');
INSERT INTO timezones (id, tz) VALUES (134,'Etc/GMT-12');
INSERT INTO timezones (id, tz) VALUES (120,'Etc/GMT-13');
INSERT INTO timezones (id, tz) VALUES (122,'Etc/GMT-14');
INSERT INTO timezones (id, tz) VALUES (119,'Etc/GMT-2');
INSERT INTO timezones (id, tz) VALUES (131,'Etc/GMT-3');
INSERT INTO timezones (id, tz) VALUES (141,'Etc/GMT-4');
INSERT INTO timezones (id, tz) VALUES (126,'Etc/GMT-5');
INSERT INTO timezones (id, tz) VALUES (132,'Etc/GMT-6');
INSERT INTO timezones (id, tz) VALUES (129,'Etc/GMT-7');
INSERT INTO timezones (id, tz) VALUES (124,'Etc/GMT-8');
INSERT INTO timezones (id, tz) VALUES (128,'Etc/GMT-9');
INSERT INTO timezones (id, tz) VALUES (133,'Etc/GMT0');
INSERT INTO timezones (id, tz) VALUES (113,'Etc/Greenwich');
INSERT INTO timezones (id, tz) VALUES (142,'Etc/UCT');
INSERT INTO timezones (id, tz) VALUES (121,'Etc/Universal');
INSERT INTO timezones (id, tz) VALUES (136,'Etc/UTC');
INSERT INTO timezones (id, tz) VALUES (110,'Etc/Zulu');
INSERT INTO timezones (id, tz) VALUES (532,'Europe');
INSERT INTO timezones (id, tz) VALUES (551,'Europe/Amsterdam');
INSERT INTO timezones (id, tz) VALUES (592,'Europe/Andorra');
INSERT INTO timezones (id, tz) VALUES (561,'Europe/Astrakhan');
INSERT INTO timezones (id, tz) VALUES (550,'Europe/Athens');
INSERT INTO timezones (id, tz) VALUES (542,'Europe/Belfast');
INSERT INTO timezones (id, tz) VALUES (584,'Europe/Belgrade');
INSERT INTO timezones (id, tz) VALUES (594,'Europe/Berlin');
INSERT INTO timezones (id, tz) VALUES (562,'Europe/Bratislava');
INSERT INTO timezones (id, tz) VALUES (548,'Europe/Brussels');
INSERT INTO timezones (id, tz) VALUES (581,'Europe/Bucharest');
INSERT INTO timezones (id, tz) VALUES (579,'Europe/Budapest');
INSERT INTO timezones (id, tz) VALUES (539,'Europe/Busingen');
INSERT INTO timezones (id, tz) VALUES (563,'Europe/Chisinau');
INSERT INTO timezones (id, tz) VALUES (560,'Europe/Copenhagen');
INSERT INTO timezones (id, tz) VALUES (589,'Europe/Dublin');
INSERT INTO timezones (id, tz) VALUES (540,'Europe/Gibraltar');
INSERT INTO timezones (id, tz) VALUES (546,'Europe/Guernsey');
INSERT INTO timezones (id, tz) VALUES (545,'Europe/Helsinki');
INSERT INTO timezones (id, tz) VALUES (575,'Europe/Isle_of_Man');
INSERT INTO timezones (id, tz) VALUES (574,'Europe/Istanbul');
INSERT INTO timezones (id, tz) VALUES (580,'Europe/Jersey');
INSERT INTO timezones (id, tz) VALUES (577,'Europe/Kaliningrad');
INSERT INTO timezones (id, tz) VALUES (557,'Europe/Kiev');
INSERT INTO timezones (id, tz) VALUES (590,'Europe/Kirov');
INSERT INTO timezones (id, tz) VALUES (547,'Europe/Lisbon');
INSERT INTO timezones (id, tz) VALUES (593,'Europe/Ljubljana');
INSERT INTO timezones (id, tz) VALUES (588,'Europe/London');
INSERT INTO timezones (id, tz) VALUES (578,'Europe/Luxembourg');
INSERT INTO timezones (id, tz) VALUES (541,'Europe/Madrid');
INSERT INTO timezones (id, tz) VALUES (556,'Europe/Malta');
INSERT INTO timezones (id, tz) VALUES (549,'Europe/Mariehamn');
INSERT INTO timezones (id, tz) VALUES (555,'Europe/Minsk');
INSERT INTO timezones (id, tz) VALUES (564,'Europe/Monaco');
INSERT INTO timezones (id, tz) VALUES (595,'Europe/Moscow');
INSERT INTO timezones (id, tz) VALUES (565,'Europe/Nicosia');
INSERT INTO timezones (id, tz) VALUES (587,'Europe/Oslo');
INSERT INTO timezones (id, tz) VALUES (543,'Europe/Paris');
INSERT INTO timezones (id, tz) VALUES (568,'Europe/Podgorica');
INSERT INTO timezones (id, tz) VALUES (567,'Europe/Prague');
INSERT INTO timezones (id, tz) VALUES (591,'Europe/Riga');
INSERT INTO timezones (id, tz) VALUES (538,'Europe/Rome');
INSERT INTO timezones (id, tz) VALUES (570,'Europe/Samara');
INSERT INTO timezones (id, tz) VALUES (533,'Europe/San_Marino');
INSERT INTO timezones (id, tz) VALUES (558,'Europe/Sarajevo');
INSERT INTO timezones (id, tz) VALUES (573,'Europe/Saratov');
INSERT INTO timezones (id, tz) VALUES (544,'Europe/Simferopol');
INSERT INTO timezones (id, tz) VALUES (536,'Europe/Skopje');
INSERT INTO timezones (id, tz) VALUES (553,'Europe/Sofia');
INSERT INTO timezones (id, tz) VALUES (534,'Europe/Stockholm');
INSERT INTO timezones (id, tz) VALUES (583,'Europe/Tallinn');
INSERT INTO timezones (id, tz) VALUES (571,'Europe/Tirane');
INSERT INTO timezones (id, tz) VALUES (552,'Europe/Tiraspol');
INSERT INTO timezones (id, tz) VALUES (586,'Europe/Ulyanovsk');
INSERT INTO timezones (id, tz) VALUES (537,'Europe/Uzhgorod');
INSERT INTO timezones (id, tz) VALUES (572,'Europe/Vaduz');
INSERT INTO timezones (id, tz) VALUES (535,'Europe/Vatican');
INSERT INTO timezones (id, tz) VALUES (554,'Europe/Vienna');
INSERT INTO timezones (id, tz) VALUES (559,'Europe/Vilnius');
INSERT INTO timezones (id, tz) VALUES (576,'Europe/Volgograd');
INSERT INTO timezones (id, tz) VALUES (566,'Europe/Warsaw');
INSERT INTO timezones (id, tz) VALUES (585,'Europe/Zagreb');
INSERT INTO timezones (id, tz) VALUES (582,'Europe/Zaporozhye');
INSERT INTO timezones (id, tz) VALUES (569,'Europe/Zurich');
INSERT INTO timezones (id, tz) VALUES (493,'GB');
INSERT INTO timezones (id, tz) VALUES (605,'GB-Eire');
INSERT INTO timezones (id, tz) VALUES (530,'GMT');
INSERT INTO timezones (id, tz) VALUES (457,'GMT+0');
INSERT INTO timezones (id, tz) VALUES (57,'GMT-0');
INSERT INTO timezones (id, tz) VALUES (498,'GMT0');
INSERT INTO timezones (id, tz) VALUES (59,'Greenwich');
INSERT INTO timezones (id, tz) VALUES (502,'Hongkong');
INSERT INTO timezones (id, tz) VALUES (474,'HST');
INSERT INTO timezones (id, tz) VALUES (612,'Iceland');
INSERT INTO timezones (id, tz) VALUES (459,'Indian');
INSERT INTO timezones (id, tz) VALUES (467,'Indian/Antananarivo');
INSERT INTO timezones (id, tz) VALUES (466,'Indian/Chagos');
INSERT INTO timezones (id, tz) VALUES (470,'Indian/Christmas');
INSERT INTO timezones (id, tz) VALUES (462,'Indian/Cocos');
INSERT INTO timezones (id, tz) VALUES (463,'Indian/Comoro');
INSERT INTO timezones (id, tz) VALUES (464,'Indian/Kerguelen');
INSERT INTO timezones (id, tz) VALUES (465,'Indian/Mahe');
INSERT INTO timezones (id, tz) VALUES (461,'Indian/Maldives');
INSERT INTO timezones (id, tz) VALUES (468,'Indian/Mauritius');
INSERT INTO timezones (id, tz) VALUES (469,'Indian/Mayotte');
INSERT INTO timezones (id, tz) VALUES (460,'Indian/Reunion');
INSERT INTO timezones (id, tz) VALUES (607,'Iran');
INSERT INTO timezones (id, tz) VALUES (331,'Israel');
INSERT INTO timezones (id, tz) VALUES (597,'Jamaica');
INSERT INTO timezones (id, tz) VALUES (330,'Japan');
INSERT INTO timezones (id, tz) VALUES (105,'Kwajalein');
INSERT INTO timezones (id, tz) VALUES (329,'Libya');
INSERT INTO timezones (id, tz) VALUES (604,'MET');
INSERT INTO timezones (id, tz) VALUES (608,'Mexico');
INSERT INTO timezones (id, tz) VALUES (611,'Mexico/BajaNorte');
INSERT INTO timezones (id, tz) VALUES (609,'Mexico/BajaSur');
INSERT INTO timezones (id, tz) VALUES (610,'Mexico/General');
INSERT INTO timezones (id, tz) VALUES (496,'MST');
INSERT INTO timezones (id, tz) VALUES (499,'MST7MDT');
INSERT INTO timezones (id, tz) VALUES (494,'Navajo');
INSERT INTO timezones (id, tz) VALUES (58,'NZ');
INSERT INTO timezones (id, tz) VALUES (500,'NZ-CHAT');
INSERT INTO timezones (id, tz) VALUES (61,'Pacific');
INSERT INTO timezones (id, tz) VALUES (62,'Pacific/Apia');
INSERT INTO timezones (id, tz) VALUES (69,'Pacific/Auckland');
INSERT INTO timezones (id, tz) VALUES (96,'Pacific/Bougainville');
INSERT INTO timezones (id, tz) VALUES (81,'Pacific/Chatham');
INSERT INTO timezones (id, tz) VALUES (85,'Pacific/Chuuk');
INSERT INTO timezones (id, tz) VALUES (95,'Pacific/Easter');
INSERT INTO timezones (id, tz) VALUES (86,'Pacific/Efate');
INSERT INTO timezones (id, tz) VALUES (80,'Pacific/Enderbury');
INSERT INTO timezones (id, tz) VALUES (82,'Pacific/Fakaofo');
INSERT INTO timezones (id, tz) VALUES (70,'Pacific/Fiji');
INSERT INTO timezones (id, tz) VALUES (88,'Pacific/Funafuti');
INSERT INTO timezones (id, tz) VALUES (77,'Pacific/Galapagos');
INSERT INTO timezones (id, tz) VALUES (104,'Pacific/Gambier');
INSERT INTO timezones (id, tz) VALUES (66,'Pacific/Guadalcanal');
INSERT INTO timezones (id, tz) VALUES (99,'Pacific/Guam');
INSERT INTO timezones (id, tz) VALUES (89,'Pacific/Honolulu');
INSERT INTO timezones (id, tz) VALUES (65,'Pacific/Johnston');
INSERT INTO timezones (id, tz) VALUES (101,'Pacific/Kiritimati');
INSERT INTO timezones (id, tz) VALUES (63,'Pacific/Kosrae');
INSERT INTO timezones (id, tz) VALUES (67,'Pacific/Kwajalein');
INSERT INTO timezones (id, tz) VALUES (97,'Pacific/Majuro');
INSERT INTO timezones (id, tz) VALUES (73,'Pacific/Marquesas');
INSERT INTO timezones (id, tz) VALUES (94,'Pacific/Midway');
INSERT INTO timezones (id, tz) VALUES (72,'Pacific/Nauru');
INSERT INTO timezones (id, tz) VALUES (79,'Pacific/Niue');
INSERT INTO timezones (id, tz) VALUES (76,'Pacific/Norfolk');
INSERT INTO timezones (id, tz) VALUES (74,'Pacific/Noumea');
INSERT INTO timezones (id, tz) VALUES (92,'Pacific/Pago_Pago');
INSERT INTO timezones (id, tz) VALUES (102,'Pacific/Palau');
INSERT INTO timezones (id, tz) VALUES (83,'Pacific/Pitcairn');
INSERT INTO timezones (id, tz) VALUES (90,'Pacific/Pohnpei');
INSERT INTO timezones (id, tz) VALUES (78,'Pacific/Ponape');
INSERT INTO timezones (id, tz) VALUES (71,'Pacific/Port_Moresby');
INSERT INTO timezones (id, tz) VALUES (87,'Pacific/Rarotonga');
INSERT INTO timezones (id, tz) VALUES (100,'Pacific/Saipan');
INSERT INTO timezones (id, tz) VALUES (103,'Pacific/Samoa');
INSERT INTO timezones (id, tz) VALUES (84,'Pacific/Tahiti');
INSERT INTO timezones (id, tz) VALUES (93,'Pacific/Tarawa');
INSERT INTO timezones (id, tz) VALUES (98,'Pacific/Tongatapu');
INSERT INTO timezones (id, tz) VALUES (75,'Pacific/Truk');
INSERT INTO timezones (id, tz) VALUES (91,'Pacific/Wake');
INSERT INTO timezones (id, tz) VALUES (68,'Pacific/Wallis');
INSERT INTO timezones (id, tz) VALUES (64,'Pacific/Yap');
INSERT INTO timezones (id, tz) VALUES (475,'Poland');
INSERT INTO timezones (id, tz) VALUES (596,'Portugal');
INSERT INTO timezones (id, tz) VALUES (606,'PRC');
INSERT INTO timezones (id, tz) VALUES (458,'PST8PDT');
INSERT INTO timezones (id, tz) VALUES (477,'ROC');
INSERT INTO timezones (id, tz) VALUES (472,'ROK');
INSERT INTO timezones (id, tz) VALUES (473,'Singapore');
INSERT INTO timezones (id, tz) VALUES (613,'Turkey');
INSERT INTO timezones (id, tz) VALUES (603,'UCT');
INSERT INTO timezones (id, tz) VALUES (431,'Universal');
INSERT INTO timezones (id, tz) VALUES (479,'US');
INSERT INTO timezones (id, tz) VALUES (488,'US/Alaska');
INSERT INTO timezones (id, tz) VALUES (482,'US/Aleutian');
INSERT INTO timezones (id, tz) VALUES (480,'US/Arizona');
INSERT INTO timezones (id, tz) VALUES (484,'US/Central');
INSERT INTO timezones (id, tz) VALUES (485,'US/East-Indiana');
INSERT INTO timezones (id, tz) VALUES (491,'US/Eastern');
INSERT INTO timezones (id, tz) VALUES (489,'US/Hawaii');
INSERT INTO timezones (id, tz) VALUES (481,'US/Indiana-Starke');
INSERT INTO timezones (id, tz) VALUES (486,'US/Michigan');
INSERT INTO timezones (id, tz) VALUES (487,'US/Mountain');
INSERT INTO timezones (id, tz) VALUES (483,'US/Pacific');
INSERT INTO timezones (id, tz) VALUES (490,'US/Pacific-New');
INSERT INTO timezones (id, tz) VALUES (492,'US/Samoa');
INSERT INTO timezones (id, tz) VALUES (516,'UTC');
INSERT INTO timezones (id, tz) VALUES (471,'W-SU');
INSERT INTO timezones (id, tz) VALUES (478,'WET');
INSERT INTO timezones (id, tz) VALUES (1,'Zulu');
/*!40000 ALTER TABLE timezones ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-06 11:17:47
