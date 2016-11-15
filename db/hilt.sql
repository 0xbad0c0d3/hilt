-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: hilt
-- ------------------------------------------------------
-- Server version	5.6.22-71.0

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand2product`
--

DROP TABLE IF EXISTS `brand2product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand2product` (
  `brand2product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `brand_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`brand2product_id`),
  KEY `index` (`product_id`,`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand2product`
--

LOCK TABLES `brand2product` WRITE;
/*!40000 ALTER TABLE `brand2product` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand2product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `overflow` int(1) unsigned NOT NULL DEFAULT '0',
  `is_catalog` int(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `url2site` varchar(1000) NOT NULL,
  `instr` text NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  KEY `index2` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=691 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,0,0,1,'Одежда и обувь','odezhda-i-obuv','/odezhda-i-obuv','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,3,27,28,29,30,31,32,33,34,26,36,37,38,39,40,41,42,43,44,45,46,47,48,49,35,2,52,53,54,55,56,57,58,59,60,61,62,63,64,65,67,68,69,66,70,71,72,73,74,51,76,77,78,79,80,81,82,83,84,85,86,87,88,89,75,91,92,93,94,95,96,97,98,99,101,102,103,100,104,105,106,107,108,110,111,112,113,109,90,50,115,117,118,119,120,121,122,123,124,125,126,127,128,129,130,116,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,131,150,151,152,153,154,155,156,157,158,149,114,1','2016-11-04 11:15:40','2016-11-04 11:15:40'),(2,1,0,0,1,'Мужская','muzhskaya','/odezhda-i-obuv/muzhskaya','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,3,27,28,29,30,31,32,33,34,26,36,37,38,39,40,41,42,43,44,45,46,47,48,49,35,2','2016-11-04 11:16:17','2016-11-04 11:16:17'),(3,2,0,0,1,'Одежда','muzhskaya-odezhda','/odezhda-i-obuv/muzhskaya-odezhda','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,3','2016-11-04 11:16:38','2016-11-04 11:16:38'),(4,3,0,0,1,'Куртки','kurtki','/odezhda-i-obuv/muzhskaya-odezhda/kurtki','4','2016-11-04 11:20:18','2016-11-04 11:20:18'),(5,3,0,0,1,'Плащи','plashhi','/odezhda-i-obuv/muzhskaya-odezhda/plashhi','5','2016-11-04 11:20:19','2016-11-04 11:20:19'),(6,3,0,0,1,'Поло','polo','/odezhda-i-obuv/muzhskaya-odezhda/polo','6','2016-11-04 11:20:19','2016-11-04 11:20:19'),(7,3,0,0,1,'Футболки','futbolki','/odezhda-i-obuv/muzhskaya-odezhda/futbolki','7','2016-11-04 11:20:19','2016-11-04 11:20:19'),(8,3,0,0,1,'Рубашки','rubashki','/odezhda-i-obuv/muzhskaya-odezhda/rubashki','8','2016-11-04 11:20:19','2016-11-04 11:20:19'),(9,3,0,0,1,'Пиджаки','pidzhaki','/odezhda-i-obuv/muzhskaya-odezhda/pidzhaki','9','2016-11-04 11:20:19','2016-11-04 11:20:19'),(10,3,0,0,1,'Кофты','kofty','/odezhda-i-obuv/muzhskaya-odezhda/kofty','10','2016-11-04 11:20:19','2016-11-04 11:20:19'),(11,3,0,0,1,'Свитера','svitera','/odezhda-i-obuv/muzhskaya-odezhda/svitera','11','2016-11-04 11:20:19','2016-11-04 11:20:19'),(12,3,0,0,1,'Толстовки','tolstovki','/odezhda-i-obuv/muzhskaya-odezhda/tolstovki','12','2016-11-04 11:20:19','2016-11-04 11:20:19'),(13,3,0,0,1,'Пиджаки','pidzhaki','/odezhda-i-obuv/muzhskaya-odezhda/pidzhaki','13','2016-11-04 11:20:19','2016-11-04 11:20:19'),(14,3,0,0,1,'Костюмы','kostyumy','/odezhda-i-obuv/muzhskaya-odezhda/kostyumy','14','2016-11-04 11:20:19','2016-11-04 11:20:19'),(15,3,0,0,1,'Брюки','bryuki','/odezhda-i-obuv/muzhskaya-odezhda/bryuki','15','2016-11-04 11:20:19','2016-11-04 11:20:19'),(16,3,0,0,1,'Джинсы','dzhinsy','/odezhda-i-obuv/muzhskaya-odezhda/dzhinsy','16','2016-11-04 11:20:19','2016-11-04 11:20:19'),(17,3,0,0,1,'Шорты','shorty','/odezhda-i-obuv/muzhskaya-odezhda/shorty','17','2016-11-04 11:20:19','2016-11-04 11:20:19'),(18,3,0,0,1,'Майки','majki','/odezhda-i-obuv/muzhskaya-odezhda/majki','18','2016-11-04 11:20:19','2016-11-04 11:20:19'),(19,3,0,0,1,'Тенниски','tenniski','/odezhda-i-obuv/muzhskaya-odezhda/tenniski','19','2016-11-04 11:20:19','2016-11-04 11:20:19'),(20,3,0,0,1,'Регланы','reglany','/odezhda-i-obuv/muzhskaya-odezhda/reglany','20','2016-11-04 11:20:19','2016-11-04 11:20:19'),(21,3,0,0,1,'Одежда для сна','odezhda-dlya-sna','/odezhda-i-obuv/muzhskaya-odezhda/odezhda-dlya-sna','21','2016-11-04 11:20:20','2016-11-04 11:20:20'),(22,3,0,0,1,'Спортивные костюмы','sportivnye-kostyumy','/odezhda-i-obuv/muzhskaya-odezhda/sportivnye-kostyumy','22','2016-11-04 11:20:20','2016-11-04 11:20:20'),(23,3,0,0,1,'Спортивные штаны','sportivnye-shtany','/odezhda-i-obuv/muzhskaya-odezhda/sportivnye-shtany','23','2016-11-04 11:20:20','2016-11-04 11:20:20'),(24,3,0,0,1,'Белье','bele','/odezhda-i-obuv/muzhskaya-odezhda/bele','24','2016-11-04 11:20:20','2016-11-04 11:20:20'),(25,3,0,0,1,'Носки','noski','/odezhda-i-obuv/muzhskaya-odezhda/noski','25','2016-11-04 11:20:20','2016-11-04 11:20:20'),(26,2,0,0,1,'Обувь','muzhskaya-obuv','/odezhda-i-obuv/muzhskaya-obuv','27,28,29,30,31,32,33,34,26','2016-11-04 11:23:14','2016-11-04 11:23:14'),(27,26,0,0,1,'Туфли','tufli','/odezhda-i-obuv/muzhskaya-obuv/tufli','27','2016-11-04 11:25:08','2016-11-04 11:25:08'),(28,26,0,0,1,'Ботинки','botinki','/odezhda-i-obuv/muzhskaya-obuv/botinki','28','2016-11-04 11:25:08','2016-11-04 11:25:08'),(29,26,0,0,1,'Кроссовки','krossovki','/odezhda-i-obuv/muzhskaya-obuv/krossovki','29','2016-11-04 11:25:09','2016-11-04 11:25:09'),(30,26,0,0,1,'Кеды','kedy','/odezhda-i-obuv/muzhskaya-obuv/kedy','30','2016-11-04 11:25:09','2016-11-04 11:25:09'),(31,26,0,0,1,'Шлепанцы','shlepancy','/odezhda-i-obuv/muzhskaya-obuv/shlepancy','31','2016-11-04 11:25:09','2016-11-04 11:25:09'),(32,26,0,0,1,'Сандали','sandali','/odezhda-i-obuv/muzhskaya-obuv/sandali','32','2016-11-04 11:25:09','2016-11-04 11:25:09'),(33,26,0,0,1,'Сапоги','sapogi','/odezhda-i-obuv/muzhskaya-obuv/sapogi','33','2016-11-04 11:25:09','2016-11-04 11:25:09'),(34,26,0,0,1,'Тапочки','tapochki','/odezhda-i-obuv/muzhskaya-obuv/tapochki','34','2016-11-04 11:25:09','2016-11-04 11:25:09'),(35,2,0,0,1,'Аксессуары ','muzhskie-aksessuary','/odezhda-i-obuv/muzhskie-aksessuary','36,37,38,39,40,41,42,43,44,45,46,47,48,49,35','2016-11-04 12:21:34','2016-11-04 12:21:34'),(36,35,0,0,1,'Головные уборы','golovnye-ubory','/odezhda-i-obuv/muzhskie-aksessuary/golovnye-ubory','36','2016-11-04 12:23:45','2016-11-04 12:23:45'),(37,35,0,0,1,'Галстуки','galstuki','/odezhda-i-obuv/muzhskie-aksessuary/galstuki','37','2016-11-04 12:23:45','2016-11-04 12:23:45'),(38,35,0,0,1,'Запонки','zaponki','/odezhda-i-obuv/muzhskie-aksessuary/zaponki','38','2016-11-04 12:23:45','2016-11-04 12:23:45'),(39,35,0,0,1,'Зонты','zonty','/odezhda-i-obuv/muzhskie-aksessuary/zonty','39','2016-11-04 12:23:45','2016-11-04 12:23:45'),(40,35,0,0,1,'Портмоне','portmone','/odezhda-i-obuv/muzhskie-aksessuary/portmone','40','2016-11-04 12:23:45','2016-11-04 12:23:45'),(41,35,0,0,1,'Обложки для документов','oblozhki-dlya-dokumentov','/odezhda-i-obuv/muzhskie-aksessuary/oblozhki-dlya-dokumentov','41','2016-11-04 12:23:45','2016-11-04 12:23:45'),(42,35,0,0,1,'Визитницы','vizitnicy','/odezhda-i-obuv/muzhskie-aksessuary/vizitnicy','42','2016-11-04 12:23:45','2016-11-04 12:23:45'),(43,35,0,0,1,'Очки','ochki','/odezhda-i-obuv/muzhskie-aksessuary/ochki','43','2016-11-04 12:23:45','2016-11-04 12:23:45'),(44,35,0,0,1,'Перчатки','perchatki','/odezhda-i-obuv/muzhskie-aksessuary/perchatki','44','2016-11-04 12:23:45','2016-11-04 12:23:45'),(45,35,0,0,1,'Ремни','remni','/odezhda-i-obuv/muzhskie-aksessuary/remni','45','2016-11-04 12:23:45','2016-11-04 12:23:45'),(46,35,0,0,1,'Сумки','sumki','/odezhda-i-obuv/muzhskie-aksessuary/sumki','46','2016-11-04 12:23:45','2016-11-04 12:23:45'),(47,35,0,0,1,'Рюкзаки','ryukzaki','/odezhda-i-obuv/muzhskie-aksessuary/ryukzaki','47','2016-11-04 12:23:46','2016-11-04 12:23:46'),(48,35,0,0,1,'Часы','chasy','/odezhda-i-obuv/muzhskie-aksessuary/chasy','48','2016-11-04 12:23:46','2016-11-04 12:23:46'),(49,35,0,0,1,'Шарфы','sharfy','/odezhda-i-obuv/muzhskie-aksessuary/sharfy','49','2016-11-04 12:23:46','2016-11-04 12:23:46'),(50,1,0,0,1,'Женская','zhenskaya','/odezhda-i-obuv/zhenskaya','52,53,54,55,56,57,58,59,60,61,62,63,64,65,67,68,69,66,70,71,72,73,74,51,76,77,78,79,80,81,82,83,84,85,86,87,88,89,75,91,92,93,94,95,96,97,98,99,101,102,103,100,104,105,106,107,108,110,111,112,113,109,90,50','2016-11-04 12:25:17','2016-11-04 12:25:17'),(51,50,0,0,1,'Одежда','zhenskaya-odezhda','/odezhda-i-obuv/zhenskaya-odezhda','52,53,54,55,56,57,58,59,60,61,62,63,64,65,67,68,69,66,70,71,72,73,74,51','2016-11-04 12:26:08','2016-11-04 12:26:08'),(52,51,0,0,1,'Куртки','kurtki','/odezhda-i-obuv/zhenskaya-odezhda/kurtki','52','2016-11-04 12:29:01','2016-11-04 12:29:01'),(53,51,0,0,1,'Плащи','plashhi','/odezhda-i-obuv/zhenskaya-odezhda/plashhi','53','2016-11-04 12:29:01','2016-11-04 12:29:01'),(54,51,0,0,1,'Платья','platya','/odezhda-i-obuv/zhenskaya-odezhda/platya','54','2016-11-04 12:29:01','2016-11-04 12:29:01'),(55,51,0,0,1,'Рубашки','rubashki','/odezhda-i-obuv/zhenskaya-odezhda/rubashki','55','2016-11-04 12:29:01','2016-11-04 12:29:01'),(56,51,0,0,1,'Свитера','svitera','/odezhda-i-obuv/zhenskaya-odezhda/svitera','56','2016-11-04 12:29:01','2016-11-04 12:29:01'),(57,51,0,0,1,'Футболки','futbolki','/odezhda-i-obuv/zhenskaya-odezhda/futbolki','57','2016-11-04 12:29:01','2016-11-04 12:29:01'),(58,51,0,0,1,'Кофты','kofty','/odezhda-i-obuv/zhenskaya-odezhda/kofty','58','2016-11-04 12:29:01','2016-11-04 12:29:01'),(59,51,0,0,1,'Брюки','bryuki','/odezhda-i-obuv/zhenskaya-odezhda/bryuki','59','2016-11-04 12:29:02','2016-11-04 12:29:02'),(60,51,0,0,1,'Джинсы','dzhinsy','/odezhda-i-obuv/zhenskaya-odezhda/dzhinsy','60','2016-11-04 12:29:02','2016-11-04 12:29:02'),(61,51,0,0,1,'Шорты','shorty','/odezhda-i-obuv/zhenskaya-odezhda/shorty','61','2016-11-04 12:29:02','2016-11-04 12:29:02'),(62,51,0,0,1,'Пиджаки','pidzhaki','/odezhda-i-obuv/zhenskaya-odezhda/pidzhaki','62','2016-11-04 12:29:02','2016-11-04 12:29:02'),(63,51,0,0,1,'Блузы','bluzy','/odezhda-i-obuv/zhenskaya-odezhda/bluzy','63','2016-11-04 12:29:02','2016-11-04 12:29:02'),(64,51,0,0,1,'Юбки','yubki','/odezhda-i-obuv/zhenskaya-odezhda/yubki','64','2016-11-04 12:29:02','2016-11-04 12:29:02'),(65,51,0,0,1,'Леггинсы и лосины','legginsy-i-losiny','/odezhda-i-obuv/zhenskaya-odezhda/legginsy-i-losiny','65','2016-11-04 12:29:02','2016-11-04 12:29:02'),(66,51,0,0,1,'Нижнее белье','nizhnee-bele','/odezhda-i-obuv/zhenskaya-odezhda/nizhnee-bele','67,68,69,66','2016-11-04 12:29:02','2016-11-04 12:29:02'),(67,66,0,0,1,'Комплекты','komplekty','/odezhda-i-obuv/zhenskaya-odezhda/nizhnee-bele/komplekty','67','2016-11-04 12:31:03','2016-11-04 12:31:03'),(68,66,0,0,1,'Бюстгалтеры','byustgaltery','/odezhda-i-obuv/zhenskaya-odezhda/nizhnee-bele/byustgaltery','68','2016-11-04 12:31:03','2016-11-04 12:31:03'),(69,66,0,0,1,'Трусы','trusy','/odezhda-i-obuv/zhenskaya-odezhda/nizhnee-bele/trusy','69','2016-11-04 12:31:03','2016-11-04 12:31:03'),(70,51,0,0,1,'Колготы и чулки','kolgoty-i-chulki','/odezhda-i-obuv/zhenskaya-odezhda/kolgoty-i-chulki','70','2016-11-04 12:37:16','2016-11-04 12:37:16'),(71,51,0,0,1,'Носки','noski','/odezhda-i-obuv/zhenskaya-odezhda/noski','71','2016-11-04 12:37:16','2016-11-04 12:37:16'),(72,51,0,0,1,'Одежда для сна','odezhda-dlya-sna','/odezhda-i-obuv/zhenskaya-odezhda/odezhda-dlya-sna','72','2016-11-04 12:37:16','2016-11-04 12:37:16'),(73,51,0,0,1,'Одежда для дома','odezhda-dlya-doma','/odezhda-i-obuv/zhenskaya-odezhda/odezhda-dlya-doma','73','2016-11-04 12:37:16','2016-11-04 12:37:16'),(74,51,0,0,1,'Спортивная одежда','sportivnaya-odezhda','/odezhda-i-obuv/zhenskaya-odezhda/sportivnaya-odezhda','74','2016-11-04 12:37:16','2016-11-04 12:37:16'),(75,50,0,0,1,'Обувь','zhenskaya-obuv','/odezhda-i-obuv/zhenskaya-obuv','76,77,78,79,80,81,82,83,84,85,86,87,88,89,75','2016-11-04 14:41:08','2016-11-04 14:41:08'),(76,75,0,0,1,'Туфли','tufli','/odezhda-i-obuv/zhenskaya-obuv/tufli','76','2016-11-04 14:43:13','2016-11-04 14:43:13'),(77,75,0,0,1,'Балетки','baletki','/odezhda-i-obuv/zhenskaya-obuv/baletki','77','2016-11-04 14:43:13','2016-11-04 14:43:13'),(78,75,0,0,1,'Босоножки','bosonozhki','/odezhda-i-obuv/zhenskaya-obuv/bosonozhki','78','2016-11-04 14:43:13','2016-11-04 14:43:13'),(79,75,0,0,1,'Сандали','sandali','/odezhda-i-obuv/zhenskaya-obuv/sandali','79','2016-11-04 14:43:13','2016-11-04 14:43:13'),(80,75,0,0,1,'Ботинки','botinki','/odezhda-i-obuv/zhenskaya-obuv/botinki','80','2016-11-04 14:43:13','2016-11-04 14:43:13'),(81,75,0,0,1,'Ботильоны','botilony','/odezhda-i-obuv/zhenskaya-obuv/botilony','81','2016-11-04 14:43:13','2016-11-04 14:43:13'),(82,75,0,0,1,'Кроссовки','krossovki','/odezhda-i-obuv/zhenskaya-obuv/krossovki','82','2016-11-04 14:43:13','2016-11-04 14:43:13'),(83,75,0,0,1,'Кеды','kedy','/odezhda-i-obuv/zhenskaya-obuv/kedy','83','2016-11-04 14:43:13','2016-11-04 14:43:13'),(84,75,0,0,1,'Мокасины','mokasiny','/odezhda-i-obuv/zhenskaya-obuv/mokasiny','84','2016-11-04 14:43:14','2016-11-04 14:43:14'),(85,75,0,0,1,'Слипоны','slipony','/odezhda-i-obuv/zhenskaya-obuv/slipony','85','2016-11-04 14:43:14','2016-11-04 14:43:14'),(86,75,0,0,1,'Шлепанцы','shlepancy','/odezhda-i-obuv/zhenskaya-obuv/shlepancy','86','2016-11-04 14:43:14','2016-11-04 14:43:14'),(87,75,0,0,1,'Сапоги','sapogi','/odezhda-i-obuv/zhenskaya-obuv/sapogi','87','2016-11-04 14:43:14','2016-11-04 14:43:14'),(88,75,0,0,1,'Резиновые сапоги','rezinovye-sapogi','/odezhda-i-obuv/zhenskaya-obuv/rezinovye-sapogi','88','2016-11-04 14:43:14','2016-11-04 14:43:14'),(89,75,0,0,1,'Тапочки','tapochki','/odezhda-i-obuv/zhenskaya-obuv/tapochki','89','2016-11-04 14:43:14','2016-11-04 14:43:14'),(90,50,0,0,1,'Аксессуары ','zhenskie-aksessuary','/odezhda-i-obuv/zhenskie-aksessuary','91,92,93,94,95,96,97,98,99,101,102,103,100,104,105,106,107,108,110,111,112,113,109,90','2016-11-04 14:45:07','2016-11-04 14:45:07'),(91,90,0,0,1,'Головные уборы','golovnye-ubory','/odezhda-i-obuv/zhenskie-aksessuary/golovnye-ubory','91','2016-11-04 14:46:41','2016-11-04 14:46:41'),(92,90,0,0,1,'Перчатки','perchatki','/odezhda-i-obuv/zhenskie-aksessuary/perchatki','92','2016-11-04 14:46:41','2016-11-04 14:46:41'),(93,90,0,0,1,'Варежки','varezhki','/odezhda-i-obuv/zhenskie-aksessuary/varezhki','93','2016-11-04 14:46:41','2016-11-04 14:46:41'),(94,90,0,0,1,'Платки','platki','/odezhda-i-obuv/zhenskie-aksessuary/platki','94','2016-11-04 14:46:41','2016-11-04 14:46:41'),(95,90,0,0,1,'Шарфы','sharfy','/odezhda-i-obuv/zhenskie-aksessuary/sharfy','95','2016-11-04 14:46:41','2016-11-04 14:46:41'),(96,90,0,0,1,'Шали','shali','/odezhda-i-obuv/zhenskie-aksessuary/shali','96','2016-11-04 14:46:41','2016-11-04 14:46:41'),(97,90,0,0,1,'Очки','ochki','/odezhda-i-obuv/zhenskie-aksessuary/ochki','97','2016-11-04 14:46:41','2016-11-04 14:46:41'),(98,90,0,0,1,'Зонты','zonty','/odezhda-i-obuv/zhenskie-aksessuary/zonty','98','2016-11-04 14:46:41','2016-11-04 14:46:41'),(99,90,0,0,1,'Ремни и пояса','remni-i-poyasa','/odezhda-i-obuv/zhenskie-aksessuary/remni-i-poyasa','99','2016-11-04 14:46:41','2016-11-04 14:46:41'),(100,90,0,0,1,'Сумки','sumki','/odezhda-i-obuv/zhenskie-aksessuary/sumki','101,102,103,100','2016-11-04 14:47:24','2016-11-04 14:47:24'),(101,100,0,0,1,'Деловые','delovye','/odezhda-i-obuv/zhenskie-aksessuary/sumki/delovye','101','2016-11-04 14:49:10','2016-11-04 14:49:10'),(102,100,0,0,1,'Дорожные','dorozhnye','/odezhda-i-obuv/zhenskie-aksessuary/sumki/dorozhnye','102','2016-11-04 14:49:10','2016-11-04 14:49:10'),(103,100,0,0,1,'Клатчи','klatchi','/odezhda-i-obuv/zhenskie-aksessuary/sumki/klatchi','103','2016-11-04 14:49:11','2016-11-04 14:49:11'),(104,90,0,0,1,'Рюкзаки','ryukzaki','/odezhda-i-obuv/zhenskie-aksessuary/ryukzaki','104','2016-11-04 14:50:41','2016-11-04 14:50:41'),(105,90,0,0,1,'Часы','chasy','/odezhda-i-obuv/zhenskie-aksessuary/chasy','105','2016-11-04 14:50:41','2016-11-04 14:50:41'),(106,90,0,0,1,'Кошельки','koshelki','/odezhda-i-obuv/zhenskie-aksessuary/koshelki','106','2016-11-04 14:50:41','2016-11-04 14:50:41'),(107,90,0,0,1,'Обложки для документов','oblozhki-dlya-dokumentov','/odezhda-i-obuv/zhenskie-aksessuary/oblozhki-dlya-dokumentov','107','2016-11-04 14:50:41','2016-11-04 14:50:41'),(108,90,0,0,1,'Визитницы','vizitnicy','/odezhda-i-obuv/zhenskie-aksessuary/vizitnicy','108','2016-11-04 14:50:41','2016-11-04 14:50:41'),(109,90,0,0,1,'Бижутерия','bizhuteriya','/odezhda-i-obuv/zhenskie-aksessuary/bizhuteriya','110,111,112,113,109','2016-11-04 14:50:41','2016-11-04 14:50:41'),(110,109,0,0,1,'Кольца','kolcza','/odezhda-i-obuv/zhenskie-aksessuary/bizhuteriya/kolcza','110','2016-11-04 14:52:35','2016-11-04 14:52:35'),(111,109,0,0,1,'Серьги','sergi','/odezhda-i-obuv/zhenskie-aksessuary/bizhuteriya/sergi','111','2016-11-04 14:52:35','2016-11-04 14:52:35'),(112,109,0,0,1,'Подвески','podveski','/odezhda-i-obuv/zhenskie-aksessuary/bizhuteriya/podveski','112','2016-11-04 14:52:35','2016-11-04 14:52:35'),(113,109,0,0,1,'Браслеты','braslety','/odezhda-i-obuv/zhenskie-aksessuary/bizhuteriya/braslety','113','2016-11-04 14:52:35','2016-11-04 14:52:35'),(114,1,0,0,1,'Детская','detskaya','/odezhda-i-obuv/detskaya','115,117,118,119,120,121,122,123,124,125,126,127,128,129,130,116,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,131,150,151,152,153,154,155,156,157,158,149,114','2016-11-04 14:55:12','2016-11-04 14:55:12'),(115,114,0,0,1,'Для новорожденных ','dlya-novorozhdennyh','/odezhda-i-obuv/detskaya/dlya-novorozhdennyh','115','2016-11-04 14:56:03','2016-11-04 14:56:03'),(116,114,0,0,1,'Для мальчиков','dlya-malchikov','/odezhda-i-obuv/detskaya/dlya-malchikov','117,118,119,120,121,122,123,124,125,126,127,128,129,130,116','2016-11-04 14:56:55','2016-11-04 14:56:55'),(117,116,0,0,1,'Куртки','kurtki','/odezhda-i-obuv/detskaya/dlya-malchikov/kurtki','117','2016-11-04 14:59:19','2016-11-04 14:59:19'),(118,116,0,0,1,'Ветровки','vetrovki','/odezhda-i-obuv/detskaya/dlya-malchikov/vetrovki','118','2016-11-04 14:59:19','2016-11-04 14:59:19'),(119,116,0,0,1,'Кофты','kofty','/odezhda-i-obuv/detskaya/dlya-malchikov/kofty','119','2016-11-04 14:59:19','2016-11-04 14:59:19'),(120,116,0,0,1,'Свитера','svitera','/odezhda-i-obuv/detskaya/dlya-malchikov/svitera','120','2016-11-04 14:59:19','2016-11-04 14:59:19'),(121,116,0,0,1,'Рубашки','rubashki','/odezhda-i-obuv/detskaya/dlya-malchikov/rubashki','121','2016-11-04 14:59:19','2016-11-04 14:59:19'),(122,116,0,0,1,'Футболки','futbolki','/odezhda-i-obuv/detskaya/dlya-malchikov/futbolki','122','2016-11-04 14:59:19','2016-11-04 14:59:19'),(123,116,0,0,1,'Майки','majki','/odezhda-i-obuv/detskaya/dlya-malchikov/majki','123','2016-11-04 14:59:19','2016-11-04 14:59:19'),(124,116,0,0,1,'Брюки','bryuki','/odezhda-i-obuv/detskaya/dlya-malchikov/bryuki','124','2016-11-04 14:59:20','2016-11-04 14:59:20'),(125,116,0,0,1,'Шорты','shorty','/odezhda-i-obuv/detskaya/dlya-malchikov/shorty','125','2016-11-04 14:59:20','2016-11-04 14:59:20'),(126,116,0,0,1,'Джинсы','dzhinsy','/odezhda-i-obuv/detskaya/dlya-malchikov/dzhinsy','126','2016-11-04 14:59:20','2016-11-04 14:59:20'),(127,116,0,0,1,'Носки','noski','/odezhda-i-obuv/detskaya/dlya-malchikov/noski','127','2016-11-04 14:59:20','2016-11-04 14:59:20'),(128,116,0,0,1,'Одежда для сна','odezhda-dlya-sna','/odezhda-i-obuv/detskaya/dlya-malchikov/odezhda-dlya-sna','128','2016-11-04 14:59:20','2016-11-04 14:59:20'),(129,116,0,0,1,'Обувь','obuv','/odezhda-i-obuv/detskaya/dlya-malchikov/obuv','129','2016-11-04 14:59:20','2016-11-04 14:59:20'),(130,116,0,0,1,'Аксессуары','aksessuary','/odezhda-i-obuv/detskaya/dlya-malchikov/aksessuary','130','2016-11-04 14:59:20','2016-11-04 14:59:20'),(131,114,0,0,1,'Для девочек','dlya-devochek','/odezhda-i-obuv/detskaya/dlya-devochek','132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,131','2016-11-04 15:00:19','2016-11-04 15:00:19'),(132,131,0,0,1,'Куртки','kurtki','/odezhda-i-obuv/detskaya/dlya-devochek/kurtki','132','2016-11-04 15:02:29','2016-11-04 15:02:29'),(133,131,0,0,1,'Плащи','plashhi','/odezhda-i-obuv/detskaya/dlya-devochek/plashhi','133','2016-11-04 15:02:29','2016-11-04 15:02:29'),(134,131,0,0,1,'Кофты','kofty','/odezhda-i-obuv/detskaya/dlya-devochek/kofty','134','2016-11-04 15:02:29','2016-11-04 15:02:29'),(135,131,0,0,1,'Платья','platya','/odezhda-i-obuv/detskaya/dlya-devochek/platya','135','2016-11-04 15:02:29','2016-11-04 15:02:29'),(136,131,0,0,1,'Юбки','yubki','/odezhda-i-obuv/detskaya/dlya-devochek/yubki','136','2016-11-04 15:02:29','2016-11-04 15:02:29'),(137,131,0,0,1,'Рубашки','rubashki','/odezhda-i-obuv/detskaya/dlya-devochek/rubashki','137','2016-11-04 15:02:29','2016-11-04 15:02:29'),(138,131,0,0,1,'Блузы','bluzy','/odezhda-i-obuv/detskaya/dlya-devochek/bluzy','138','2016-11-04 15:02:29','2016-11-04 15:02:29'),(139,131,0,0,1,'Футболки','futbolki','/odezhda-i-obuv/detskaya/dlya-devochek/futbolki','139','2016-11-04 15:02:29','2016-11-04 15:02:29'),(140,131,0,0,1,'Майки','majki','/odezhda-i-obuv/detskaya/dlya-devochek/majki','140','2016-11-04 15:02:29','2016-11-04 15:02:29'),(141,131,0,0,1,'Брюки','bryuki','/odezhda-i-obuv/detskaya/dlya-devochek/bryuki','141','2016-11-04 15:02:29','2016-11-04 15:02:29'),(142,131,0,0,1,'Шорты','shorty','/odezhda-i-obuv/detskaya/dlya-devochek/shorty','142','2016-11-04 15:02:29','2016-11-04 15:02:29'),(143,131,0,0,1,'Джинсы','dzhinsy','/odezhda-i-obuv/detskaya/dlya-devochek/dzhinsy','143','2016-11-04 15:02:29','2016-11-04 15:02:29'),(144,131,0,0,1,'Колготки','kolgotki','/odezhda-i-obuv/detskaya/dlya-devochek/kolgotki','144','2016-11-04 15:02:29','2016-11-04 15:02:29'),(145,131,0,0,1,'Носки','noski','/odezhda-i-obuv/detskaya/dlya-devochek/noski','145','2016-11-04 15:02:29','2016-11-04 15:02:29'),(146,131,0,0,1,'Одежда для сна','odezhda-dlya-sna','/odezhda-i-obuv/detskaya/dlya-devochek/odezhda-dlya-sna','146','2016-11-04 15:02:29','2016-11-04 15:02:29'),(147,131,0,0,1,'Обувь','obuv','/odezhda-i-obuv/detskaya/dlya-devochek/obuv','147','2016-11-04 15:02:30','2016-11-04 15:02:30'),(148,131,0,0,1,'Аксессуары','aksessuary','/odezhda-i-obuv/detskaya/dlya-devochek/aksessuary','148','2016-11-04 15:02:30','2016-11-04 15:02:30'),(149,114,0,0,1,'Школьная форма','shkolnaya-forma','/odezhda-i-obuv/detskaya/shkolnaya-forma','150,151,152,153,154,155,156,157,158,149','2016-11-04 15:03:44','2016-11-04 15:03:44'),(150,149,0,0,1,'Костюмы','kostyumy','/odezhda-i-obuv/detskaya/shkolnaya-forma/kostyumy','150','2016-11-04 15:21:07','2016-11-04 15:21:07'),(151,149,0,0,1,'Рубашки','rubashki','/odezhda-i-obuv/detskaya/shkolnaya-forma/rubashki','151','2016-11-04 15:21:07','2016-11-04 15:21:07'),(152,149,0,0,1,'Школьные блузки','shkolnye-bluzki','/odezhda-i-obuv/detskaya/shkolnaya-forma/shkolnye-bluzki','152','2016-11-04 15:21:07','2016-11-04 15:21:07'),(153,149,0,0,1,'Пиджаки','pidzhaki','/odezhda-i-obuv/detskaya/shkolnaya-forma/pidzhaki','153','2016-11-04 15:21:07','2016-11-04 15:21:07'),(154,149,0,0,1,'Жакеты и жилеты','zhakety-i-zhilety','/odezhda-i-obuv/detskaya/shkolnaya-forma/zhakety-i-zhilety','154','2016-11-04 15:21:07','2016-11-04 15:21:07'),(155,149,0,0,1,'Брюки','bryuki','/odezhda-i-obuv/detskaya/shkolnaya-forma/bryuki','155','2016-11-04 15:21:08','2016-11-04 15:21:08'),(156,149,0,0,1,'Платья','platya','/odezhda-i-obuv/detskaya/shkolnaya-forma/platya','156','2016-11-04 15:21:08','2016-11-04 15:21:08'),(157,149,0,0,1,'Сарафаны','sarafany','/odezhda-i-obuv/detskaya/shkolnaya-forma/sarafany','157','2016-11-04 15:21:08','2016-11-04 15:21:08'),(158,149,0,0,1,'Юбки','yubki','/odezhda-i-obuv/detskaya/shkolnaya-forma/yubki','158','2016-11-04 15:21:08','2016-11-04 15:21:08'),(159,0,0,0,1,'Товары для дома','tovary-dlya-doma','/tovary-dlya-doma','162,163,164,165,166,168,169,170,167,171,172,161,174,173,176,177,178,179,180,181,182,175,184,185,186,187,188,183,160,190,191,192,193,194,195,196,197,198,206,207,199,200,201,202,203,204,205,189,210,211,212,213,214,215,216,217,218,219,209,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,220,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,238,260,261,262,259,208,265,266,267,263,269,270,271,272,273,274,275,276,268,278,279,280,281,282,277,284,285,286,287,288,289,290,291,283,293,294,295,296,297,298,299,300,301,302,303,292,306,307,308,309,310,311,312,313,305,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,314,341,342,343,344,345,346,347,348,349,340,304,159','2016-11-04 15:22:14','2016-11-04 15:22:14'),(160,159,0,0,1,'Домашний текстиль ','domashniy-tekstil','/tovary-dlya-doma/domashniy-tekstil','162,163,164,165,166,168,169,170,167,171,172,161,174,173,176,177,178,179,180,181,182,175,184,185,186,187,188,183,160','2016-11-04 15:22:59','2016-11-04 15:22:59'),(161,160,0,0,1,'Для спальни','dlya-spalni','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni','162,163,164,165,166,168,169,170,167,171,172,161','2016-11-04 15:23:52','2016-11-04 15:23:52'),(162,161,0,0,1,'Покрывала','pokryvala','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni/pokryvala','162','2016-11-04 15:25:16','2016-11-04 15:25:16'),(163,161,0,0,1,'Комплекты постельного белья','komplekty-postelnogo-belya','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni/komplekty-postelnogo-belya','163','2016-11-04 15:25:16','2016-11-04 15:25:16'),(164,161,0,0,1,'Одеяла','odeyala','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni/odeyala','164','2016-11-04 15:25:16','2016-11-04 15:25:16'),(165,161,0,0,1,'Подушки','podushki','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni/podushki','165','2016-11-04 15:25:16','2016-11-04 15:25:16'),(166,161,0,0,1,'Наматрасники','namatrasniki','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni/namatrasniki','166','2016-11-04 15:25:16','2016-11-04 15:25:16'),(167,161,0,0,1,'Постельное белье','postelnoe-bele','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni/postelnoe-bele','168,169,170,167','2016-11-04 15:25:16','2016-11-04 15:25:16'),(168,167,0,0,1,'Наволочки','navolochki','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni/postelnoe-bele/navolochki','168','2016-11-04 15:26:34','2016-11-04 15:26:34'),(169,167,0,0,1,'Простыни','prostyni','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni/postelnoe-bele/prostyni','169','2016-11-04 15:26:34','2016-11-04 15:26:34'),(170,167,0,0,1,'Пододеяльники','pododeyalniki','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni/postelnoe-bele/pododeyalniki','170','2016-11-04 15:26:34','2016-11-04 15:26:34'),(171,161,0,0,1,'Пледы','pledy','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni/pledy','171','2016-11-04 15:28:33','2016-11-04 15:28:33'),(172,161,0,0,1,'Шторы и занавеси','shtory-i-zanavesi','/tovary-dlya-doma/domashniy-tekstil/dlya-spalni/shtory-i-zanavesi','172','2016-11-04 15:28:33','2016-11-04 15:28:33'),(173,160,0,0,1,'Для ванной комнаты','dlya-vannoj-komnaty','/tovary-dlya-doma/domashniy-tekstil/dlya-vannoj-komnaty','174,173','2016-11-04 15:29:47','2016-11-04 15:29:47'),(174,173,0,0,1,'Полотенца','polotencza','/tovary-dlya-doma/domashniy-tekstil/dlya-vannoj-komnaty/polotencza','174','2016-11-04 15:34:40','2016-11-04 15:34:40'),(175,160,0,0,1,'Для кухни','dlya-kuxni','/tovary-dlya-doma/domashniy-tekstil/dlya-kuxni','176,177,178,179,180,181,182,175','2016-11-04 15:36:15','2016-11-04 15:36:15'),(176,175,0,0,1,'Скатерти','skaterti','/tovary-dlya-doma/domashniy-tekstil/dlya-kuxni/skaterti','176','2016-11-04 15:37:36','2016-11-04 15:37:36'),(177,175,0,0,1,'Салфетки','salfetki','/tovary-dlya-doma/domashniy-tekstil/dlya-kuxni/salfetki','177','2016-11-04 15:37:36','2016-11-04 15:37:36'),(178,175,0,0,1,'Кухонные полотенца','kuxonnye-polotencza','/tovary-dlya-doma/domashniy-tekstil/dlya-kuxni/kuxonnye-polotencza','178','2016-11-04 15:37:36','2016-11-04 15:37:36'),(179,175,0,0,1,'Фартуки','fartuki','/tovary-dlya-doma/domashniy-tekstil/dlya-kuxni/fartuki','179','2016-11-04 15:37:36','2016-11-04 15:37:36'),(180,175,0,0,1,'Прихватки','prixvatki','/tovary-dlya-doma/domashniy-tekstil/dlya-kuxni/prixvatki','180','2016-11-04 15:37:36','2016-11-04 15:37:36'),(181,175,0,0,1,'Чехлы, подушки на стул','chexly-podushki-na-stul','/tovary-dlya-doma/domashniy-tekstil/dlya-kuxni/chexly-podushki-na-stul','181','2016-11-04 15:37:36','2016-11-04 15:37:36'),(182,175,0,0,1,'Шторы и занавеси','shtory-i-zanavesi','/tovary-dlya-doma/domashniy-tekstil/dlya-kuxni/shtory-i-zanavesi','182','2016-11-04 15:37:36','2016-11-04 15:37:36'),(183,160,0,0,1,'Детская','detskaya','/tovary-dlya-doma/domashniy-tekstil/detskaya','184,185,186,187,188,183','2016-11-04 15:38:35','2016-11-04 15:38:35'),(184,183,0,0,1,'Одеяла','odeyala','/tovary-dlya-doma/domashniy-tekstil/detskaya/odeyala','184','2016-11-04 15:40:42','2016-11-04 15:40:42'),(185,183,0,0,1,'Подушки','podushki','/tovary-dlya-doma/domashniy-tekstil/detskaya/podushki','185','2016-11-04 15:40:42','2016-11-04 15:40:42'),(186,183,0,0,1,'Покрывала','pokryvala','/tovary-dlya-doma/domashniy-tekstil/detskaya/pokryvala','186','2016-11-04 15:40:42','2016-11-04 15:40:42'),(187,183,0,0,1,'Пледы','pledy','/tovary-dlya-doma/domashniy-tekstil/detskaya/pledy','187','2016-11-04 15:40:42','2016-11-04 15:40:42'),(188,183,0,0,1,'Постельное белье','postelnoe-bele','/tovary-dlya-doma/domashniy-tekstil/detskaya/postelnoe-bele','188','2016-11-04 15:40:42','2016-11-04 15:40:42'),(189,159,0,0,1,'Предметы интерьера','predmety-interera','/tovary-dlya-doma/predmety-interera','190,191,192,193,194,195,196,197,198,206,207,199,200,201,202,203,204,205,189','2016-11-04 15:41:51','2016-11-04 15:41:51'),(190,189,0,0,1,'Вазы','vazy','/tovary-dlya-doma/predmety-interera/vazy','190','2016-11-04 15:44:28','2016-11-04 15:44:28'),(191,189,0,0,1,'Кашпо','kashpo','/tovary-dlya-doma/predmety-interera/kashpo','191','2016-11-04 15:44:28','2016-11-04 15:44:28'),(192,189,0,0,1,'Декоративные подушки','dekorativnye-podushki','/tovary-dlya-doma/predmety-interera/dekorativnye-podushki','192','2016-11-04 15:44:28','2016-11-04 15:44:28'),(193,189,0,0,1,'Подсвечники','podsvechniki','/tovary-dlya-doma/predmety-interera/podsvechniki','193','2016-11-04 15:44:28','2016-11-04 15:44:28'),(194,189,0,0,1,'Свечи','svechi','/tovary-dlya-doma/predmety-interera/svechi','194','2016-11-04 15:44:28','2016-11-04 15:44:28'),(195,189,0,0,1,'Аромадиффузоры','aromadiffuzory','/tovary-dlya-doma/predmety-interera/aromadiffuzory','195','2016-11-04 15:44:28','2016-11-04 15:44:28'),(196,189,0,0,1,'Статуэтки','statuetki','/tovary-dlya-doma/predmety-interera/statuetki','196','2016-11-04 15:44:28','2016-11-04 15:44:28'),(197,189,0,0,1,'Фигурки','figurki','/tovary-dlya-doma/predmety-interera/figurki','197','2016-11-04 15:44:28','2016-11-04 15:44:28'),(198,189,0,0,1,'Стильные штучки','stilnye-shtuchki','/tovary-dlya-doma/predmety-interera/stilnye-shtuchki','198','2016-11-04 15:44:28','2016-11-04 15:44:28'),(199,189,0,0,1,'Часы','chasy','/tovary-dlya-doma/predmety-interera/chasy','206,207,199','2016-11-04 15:44:28','2016-11-04 15:44:28'),(200,189,0,0,1,'Шкатулки','shkatulki','/tovary-dlya-doma/predmety-interera/shkatulki','200','2016-11-04 15:44:28','2016-11-04 15:44:28'),(201,189,0,0,1,'Фоторамки','fotoramki','/tovary-dlya-doma/predmety-interera/fotoramki','201','2016-11-04 15:44:28','2016-11-04 15:44:28'),(202,189,0,0,1,'Дизайнерские вещи','dizajnerskie-veshhi','/tovary-dlya-doma/predmety-interera/dizajnerskie-veshhi','202','2016-11-04 15:44:28','2016-11-04 15:44:28'),(203,189,0,0,1,'Коврики для ванной и туалета','kovriki-dlya-vannoj-i-tualeta','/tovary-dlya-doma/predmety-interera/kovriki-dlya-vannoj-i-tualeta','203','2016-11-04 15:44:28','2016-11-04 15:44:28'),(204,189,0,0,1,'Шторки для душа','shtorki-dlya-dusha','/tovary-dlya-doma/predmety-interera/shtorki-dlya-dusha','204','2016-11-04 15:44:28','2016-11-04 15:44:28'),(205,189,0,0,1,'Корзины для белья','korziny-dlya-belya','/tovary-dlya-doma/predmety-interera/korziny-dlya-belya','205','2016-11-04 15:44:28','2016-11-04 15:44:28'),(206,199,0,0,1,'Настенные','nastennye','/tovary-dlya-doma/predmety-interera/chasy/nastennye','206','2016-11-04 15:45:47','2016-11-04 15:45:47'),(207,199,0,0,1,'Напольные','napolnye','/tovary-dlya-doma/predmety-interera/chasy/napolnye','207','2016-11-04 15:45:47','2016-11-04 15:45:47'),(208,159,0,0,1,'Все для кухни','vse-dlya-kuxni','/tovary-dlya-doma/vse-dlya-kuxni','210,211,212,213,214,215,216,217,218,219,209,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,220,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,238,260,261,262,259,208','2016-11-04 15:47:21','2016-11-04 15:47:21'),(209,208,0,0,1,'Посуда для готовки','posuda-dlya-gotovki','/tovary-dlya-doma/vse-dlya-kuxni/posuda-dlya-gotovki','210,211,212,213,214,215,216,217,218,219,209','2016-11-04 15:48:44','2016-11-04 15:48:44'),(210,209,0,0,1,'Наборы посуды','nabory-posudy','/tovary-dlya-doma/vse-dlya-kuxni/posuda-dlya-gotovki/nabory-posudy','210','2016-11-04 15:50:11','2016-11-04 15:50:11'),(211,209,0,0,1,'Кастрюли','kastryuli','/tovary-dlya-doma/vse-dlya-kuxni/posuda-dlya-gotovki/kastryuli','211','2016-11-04 15:50:11','2016-11-04 15:50:11'),(212,209,0,0,1,'Сковородки','skovorodki','/tovary-dlya-doma/vse-dlya-kuxni/posuda-dlya-gotovki/skovorodki','212','2016-11-04 15:50:11','2016-11-04 15:50:11'),(213,209,0,0,1,'Сотейники','sotejniki','/tovary-dlya-doma/vse-dlya-kuxni/posuda-dlya-gotovki/sotejniki','213','2016-11-04 15:50:11','2016-11-04 15:50:11'),(214,209,0,0,1,'Воки','voki','/tovary-dlya-doma/vse-dlya-kuxni/posuda-dlya-gotovki/voki','214','2016-11-04 15:50:11','2016-11-04 15:50:11'),(215,209,0,0,1,'Посуда из жаропрочного стекла','posuda-iz-zharoprochnogo-stekla','/tovary-dlya-doma/vse-dlya-kuxni/posuda-dlya-gotovki/posuda-iz-zharoprochnogo-stekla','215','2016-11-04 15:50:11','2016-11-04 15:50:11'),(216,209,0,0,1,'Чайники','chajniki','/tovary-dlya-doma/vse-dlya-kuxni/posuda-dlya-gotovki/chajniki','216','2016-11-04 15:50:12','2016-11-04 15:50:12'),(217,209,0,0,1,'Заварники','zavarniki','/tovary-dlya-doma/vse-dlya-kuxni/posuda-dlya-gotovki/zavarniki','217','2016-11-04 15:50:12','2016-11-04 15:50:12'),(218,209,0,0,1,'Формы для выпечки','formy-dlya-vypechki','/tovary-dlya-doma/vse-dlya-kuxni/posuda-dlya-gotovki/formy-dlya-vypechki','218','2016-11-04 15:50:12','2016-11-04 15:50:12'),(219,209,0,0,1,'Формы для запекания','formy-dlya-zapekaniya','/tovary-dlya-doma/vse-dlya-kuxni/posuda-dlya-gotovki/formy-dlya-zapekaniya','219','2016-11-04 15:50:12','2016-11-04 15:50:12'),(220,208,0,0,1,'Кухонные принадлежности','kuxonnye-prinadlezhnosti','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti','221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,220','2016-11-04 15:56:57','2016-11-04 15:56:57'),(221,220,0,0,1,'Кухонные наборы','kuxonnye-nabory','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/kuxonnye-nabory','221','2016-11-04 15:58:51','2016-11-04 15:58:51'),(222,220,0,0,1,'Поварские лопатки','povarskie-lopatki','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/povarskie-lopatki','222','2016-11-04 15:58:51','2016-11-04 15:58:51'),(223,220,0,0,1,'Ложки','lozhki','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/lozhki','223','2016-11-04 15:58:51','2016-11-04 15:58:51'),(224,220,0,0,1,'Вилки','vilki','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/vilki','224','2016-11-04 15:58:51','2016-11-04 15:58:51'),(225,220,0,0,1,'Разделочные доски','razdelochnye-doski','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/razdelochnye-doski','225','2016-11-04 15:58:51','2016-11-04 15:58:51'),(226,220,0,0,1,'Кондитерские принадлежности','konditerskie-prinadlezhnosti','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/konditerskie-prinadlezhnosti','226','2016-11-04 15:58:51','2016-11-04 15:58:51'),(227,220,0,0,1,'Терки','terki','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/terki','227','2016-11-04 15:58:51','2016-11-04 15:58:51'),(228,220,0,0,1,'Овощерезки','ovoshherezki','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/ovoshherezki','228','2016-11-04 15:58:51','2016-11-04 15:58:51'),(229,220,0,0,1,'Миски и емкости для смешивания','miski-i-emkosti-dlya-smeshivaniya','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/miski-i-emkosti-dlya-smeshivaniya','229','2016-11-04 15:58:51','2016-11-04 15:58:51'),(230,220,0,0,1,'Дуршлаги и сито','durshlagi-i-sito','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/durshlagi-i-sito','230','2016-11-04 15:58:51','2016-11-04 15:58:51'),(231,220,0,0,1,'Измельчители и прессы','izmelchiteli-i-pressy','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/izmelchiteli-i-pressy','231','2016-11-04 15:58:51','2016-11-04 15:58:51'),(232,220,0,0,1,'Консервные ножи и ключи','konservnye-nozhi-i-klyuchi','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/konservnye-nozhi-i-klyuchi','232','2016-11-04 15:58:51','2016-11-04 15:58:51'),(233,220,0,0,1,'Мерная посуда','mernaya-posuda','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/mernaya-posuda','233','2016-11-04 15:58:51','2016-11-04 15:58:51'),(234,220,0,0,1,'Сушки и органайзеры для посуды','sushki-i-organajzery-dlya-posudy','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/sushki-i-organajzery-dlya-posudy','234','2016-11-04 15:58:51','2016-11-04 15:58:51'),(235,220,0,0,1,'Кухонные помощники','kuxonnye-pomoshhniki','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/kuxonnye-pomoshhniki','235','2016-11-04 15:58:51','2016-11-04 15:58:51'),(236,220,0,0,1,'Овощечистки','ovoshhechistki','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/ovoshhechistki','236','2016-11-04 15:58:51','2016-11-04 15:58:51'),(237,220,0,0,1,'Мусаты и точилки','musaty-i-tochilki','/tovary-dlya-doma/vse-dlya-kuxni/kuxonnye-prinadlezhnosti/musaty-i-tochilki','237','2016-11-04 15:58:52','2016-11-04 15:58:52'),(238,208,0,0,1,'Сервировка стола','servirovka-stola','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola','239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,238','2016-11-04 16:00:24','2016-11-04 16:00:24'),(239,238,0,0,1,'Столовые сервизы','stolovye-servizy','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/stolovye-servizy','239','2016-11-04 16:02:36','2016-11-04 16:02:36'),(240,238,0,0,1,'Столовые приборы','stolovye-pribory','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/stolovye-pribory','240','2016-11-04 16:02:36','2016-11-04 16:02:36'),(241,238,0,0,1,'Мармиты','marmity','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/marmity','241','2016-11-04 16:02:36','2016-11-04 16:02:36'),(242,238,0,0,1,'Чайные и кофейные сервизы','chajnye-i-kofejnye-servizy','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/chajnye-i-kofejnye-servizy','242','2016-11-04 16:02:36','2016-11-04 16:02:36'),(243,238,0,0,1,'Бокалы','bokaly','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/bokaly','243','2016-11-04 16:02:36','2016-11-04 16:02:36'),(244,238,0,0,1,'Фужеры','fuzhery','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/fuzhery','244','2016-11-04 16:02:36','2016-11-04 16:02:36'),(245,238,0,0,1,'Стопки и рюмки','stopki-i-ryumki','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/stopki-i-ryumki','245','2016-11-04 16:02:36','2016-11-04 16:02:36'),(246,238,0,0,1,'Стаканы','stakany','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/stakany','246','2016-11-04 16:02:36','2016-11-04 16:02:36'),(247,238,0,0,1,'Кувшины','kuvshiny','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/kuvshiny','247','2016-11-04 16:02:36','2016-11-04 16:02:36'),(248,238,0,0,1,'Графины','grafiny','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/grafiny','248','2016-11-04 16:02:36','2016-11-04 16:02:36'),(249,238,0,0,1,'Чашки','chashki','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/chashki','249','2016-11-04 16:02:36','2016-11-04 16:02:36'),(250,238,0,0,1,'Тарелки','tarelki','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/tarelki','250','2016-11-04 16:02:36','2016-11-04 16:02:36'),(251,238,0,0,1,'Салатники','salatniki','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/salatniki','251','2016-11-04 16:02:36','2016-11-04 16:02:36'),(252,238,0,0,1,'Подносы','podnosy','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/podnosy','252','2016-11-04 16:02:36','2016-11-04 16:02:36'),(253,238,0,0,1,'Коврики','kovriki','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/kovriki','253','2016-11-04 16:02:37','2016-11-04 16:02:37'),(254,238,0,0,1,'Ножи','nozhi','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/nozhi','254','2016-11-04 16:02:37','2016-11-04 16:02:37'),(255,238,0,0,1,'Ножницы','nozhnicy','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/nozhnicy','255','2016-11-04 16:02:37','2016-11-04 16:02:37'),(256,238,0,0,1,'Топорики','toporiki','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/toporiki','256','2016-11-04 16:02:37','2016-11-04 16:02:37'),(257,238,0,0,1,'Наборы ножей','nabory-nozhej','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/nabory-nozhej','257','2016-11-04 16:02:37','2016-11-04 16:02:37'),(258,238,0,0,1,'Подставки и планки','podstavki-i-planki','/tovary-dlya-doma/vse-dlya-kuxni/servirovka-stola/podstavki-i-planki','258','2016-11-04 16:02:37','2016-11-04 16:02:37'),(259,208,0,0,1,'Емкости для хранения','emkosti-dlya-xraneniya','/tovary-dlya-doma/vse-dlya-kuxni/emkosti-dlya-xraneniya','260,261,262,259','2016-11-04 16:03:37','2016-11-04 16:03:37'),(260,259,0,0,1,'Банки для сыпучих','banki-dlya-sypuchix','/tovary-dlya-doma/vse-dlya-kuxni/emkosti-dlya-xraneniya/banki-dlya-sypuchix','260','2016-11-04 16:04:45','2016-11-04 16:04:45'),(261,259,0,0,1,'Контейнеры','kontejnery','/tovary-dlya-doma/vse-dlya-kuxni/emkosti-dlya-xraneniya/kontejnery','261','2016-11-04 16:04:45','2016-11-04 16:04:45'),(262,259,0,0,1,'Лотки','lotki','/tovary-dlya-doma/vse-dlya-kuxni/emkosti-dlya-xraneniya/lotki','262','2016-11-04 16:04:45','2016-11-04 16:04:45'),(263,159,0,0,1,'Хранение','xranenie','/tovary-dlya-doma/xranenie','265,266,267,263','2016-11-04 16:06:06','2016-11-04 16:06:06'),(265,263,0,0,1,'Органайзеры','organajzery','/tovary-dlya-doma/xranenie/organajzery','265','2016-11-04 16:07:55','2016-11-04 16:07:55'),(266,263,0,0,1,'Коробки','korobki','/tovary-dlya-doma/xranenie/korobki','266','2016-11-04 16:07:55','2016-11-04 16:07:55'),(267,263,0,0,1,'Чехлы','chexly','/tovary-dlya-doma/xranenie/chexly','267','2016-11-04 16:07:55','2016-11-04 16:07:55'),(268,159,0,0,1,'Хозтовары','xoztovary','/tovary-dlya-doma/xoztovary','269,270,271,272,273,274,275,276,268','2016-11-04 16:08:47','2016-11-04 16:08:47'),(269,268,0,0,1,'Гладильные доски','gladilnye-doski','/tovary-dlya-doma/xoztovary/gladilnye-doski','269','2016-11-04 16:10:15','2016-11-04 16:10:15'),(270,268,0,0,1,'Сушилки','sushilki','/tovary-dlya-doma/xoztovary/sushilki','270','2016-11-04 16:10:15','2016-11-04 16:10:15'),(271,268,0,0,1,'Корзины и короба','korziny-i-koroba','/tovary-dlya-doma/xoztovary/korziny-i-koroba','271','2016-11-04 16:10:15','2016-11-04 16:10:15'),(272,268,0,0,1,'Щетки и швабры','shhetki-i-shvabry','/tovary-dlya-doma/xoztovary/shhetki-i-shvabry','272','2016-11-04 16:10:15','2016-11-04 16:10:15'),(273,268,0,0,1,'Ведра','vedra','/tovary-dlya-doma/xoztovary/vedra','273','2016-11-04 16:10:15','2016-11-04 16:10:15'),(274,268,0,0,1,'Тазы','tazy','/tovary-dlya-doma/xoztovary/tazy','274','2016-11-04 16:10:15','2016-11-04 16:10:15'),(275,268,0,0,1,'Вешалки','veshalki','/tovary-dlya-doma/xoztovary/veshalki','275','2016-11-04 16:10:15','2016-11-04 16:10:15'),(276,268,0,0,1,'Придверные коврики','pridvernye-kovriki','/tovary-dlya-doma/xoztovary/pridvernye-kovriki','276','2016-11-04 16:10:15','2016-11-04 16:10:15'),(277,159,0,0,1,'Бытовая химия','bytovaya-ximiya','/tovary-dlya-doma/bytovaya-ximiya','278,279,280,281,282,277','2016-11-04 16:12:08','2016-11-04 16:12:08'),(278,277,0,0,1,'Для мытья посуды','dlya-mytya-posudy','/tovary-dlya-doma/bytovaya-ximiya/dlya-mytya-posudy','278','2016-11-04 16:13:22','2016-11-04 16:13:22'),(279,277,0,0,1,'Для стирки','dlya-stirki','/tovary-dlya-doma/bytovaya-ximiya/dlya-stirki','279','2016-11-04 16:13:22','2016-11-04 16:13:22'),(280,277,0,0,1,'Для уборки','dlya-uborki','/tovary-dlya-doma/bytovaya-ximiya/dlya-uborki','280','2016-11-04 16:13:22','2016-11-04 16:13:22'),(281,277,0,0,1,'По уходу за бытовой техникой','po-uxodu-za-bytovoj-texnikoj','/tovary-dlya-doma/bytovaya-ximiya/po-uxodu-za-bytovoj-texnikoj','281','2016-11-04 16:13:22','2016-11-04 16:13:22'),(282,277,0,0,1,'Средства борьбы с насекомыми','sredstva-borby-s-nasekomymi','/tovary-dlya-doma/bytovaya-ximiya/sredstva-borby-s-nasekomymi','282','2016-11-04 16:13:22','2016-11-04 16:13:22'),(283,159,0,0,1,'Освещение','osveshhenie','/tovary-dlya-doma/osveshhenie','284,285,286,287,288,289,290,291,283','2016-11-04 16:13:59','2016-11-04 16:13:59'),(284,283,0,0,1,'Люстры','lyustry','/tovary-dlya-doma/osveshhenie/lyustry','284','2016-11-04 16:15:08','2016-11-04 16:15:08'),(285,283,0,0,1,'Подвесы','podvesy','/tovary-dlya-doma/osveshhenie/podvesy','285','2016-11-04 16:15:08','2016-11-04 16:15:08'),(286,283,0,0,1,'Бра и настенные светильники','bra-i-nastennye-svetilniki','/tovary-dlya-doma/osveshhenie/bra-i-nastennye-svetilniki','286','2016-11-04 16:15:09','2016-11-04 16:15:09'),(287,283,0,0,1,'Настольные лампы','nastolnye-lampy','/tovary-dlya-doma/osveshhenie/nastolnye-lampy','287','2016-11-04 16:15:09','2016-11-04 16:15:09'),(288,283,0,0,1,'Торшеры','torshery','/tovary-dlya-doma/osveshhenie/torshery','288','2016-11-04 16:15:09','2016-11-04 16:15:09'),(289,283,0,0,1,'Детские светильники','detskie-svetilniki','/tovary-dlya-doma/osveshhenie/detskie-svetilniki','289','2016-11-04 16:15:09','2016-11-04 16:15:09'),(290,283,0,0,1,'Садово-парковые светильники','sadovo-parkovye-svetilniki','/tovary-dlya-doma/osveshhenie/sadovo-parkovye-svetilniki','290','2016-11-04 16:15:09','2016-11-04 16:15:09'),(291,283,0,0,1,'Лампочки и аксессуары','lampochki-i-aksessuary','/tovary-dlya-doma/osveshhenie/lampochki-i-aksessuary','291','2016-11-04 16:15:09','2016-11-04 16:15:09'),(292,159,0,0,1,'Мебель','mebel','/tovary-dlya-doma/mebel','293,294,295,296,297,298,299,300,301,302,303,292','2016-11-04 16:16:00','2016-11-04 16:16:00'),(293,292,0,0,1,'Бескаркасная мебель','beskarkasnaya-mebel','/tovary-dlya-doma/mebel/beskarkasnaya-mebel','293','2016-11-04 16:17:04','2016-11-04 16:17:04'),(294,292,0,0,1,'Журнальные столы','zhurnalnye-stoly','/tovary-dlya-doma/mebel/zhurnalnye-stoly','294','2016-11-04 16:17:04','2016-11-04 16:17:04'),(295,292,0,0,1,'Кресла','kresla','/tovary-dlya-doma/mebel/kresla','295','2016-11-04 16:17:04','2016-11-04 16:17:04'),(296,292,0,0,1,'Стулья','stulya','/tovary-dlya-doma/mebel/stulya','296','2016-11-04 16:17:04','2016-11-04 16:17:04'),(297,292,0,0,1,'Табуреты','taburety','/tovary-dlya-doma/mebel/taburety','297','2016-11-04 16:17:04','2016-11-04 16:17:04'),(298,292,0,0,1,'Складная мебель','skladnaya-mebel','/tovary-dlya-doma/mebel/skladnaya-mebel','298','2016-11-04 16:17:04','2016-11-04 16:17:04'),(299,292,0,0,1,'Пластиковая мебель','plastikovaya-mebel','/tovary-dlya-doma/mebel/plastikovaya-mebel','299','2016-11-04 16:17:04','2016-11-04 16:17:04'),(300,292,0,0,1,'Садовые зонты','sadovye-zonty','/tovary-dlya-doma/mebel/sadovye-zonty','300','2016-11-04 16:17:04','2016-11-04 16:17:04'),(301,292,0,0,1,'Садовые подставки','sadovye-podstavki','/tovary-dlya-doma/mebel/sadovye-podstavki','301','2016-11-04 16:17:05','2016-11-04 16:17:05'),(302,292,0,0,1,'Садовые качели','sadovye-kacheli','/tovary-dlya-doma/mebel/sadovye-kacheli','302','2016-11-04 16:17:05','2016-11-04 16:17:05'),(303,292,0,0,1,'Столики для ноутбуков и IT-техники','stoliki-dlya-noutbukov-i-it-texniki','/tovary-dlya-doma/mebel/stoliki-dlya-noutbukov-i-it-texniki','303','2016-11-04 16:17:05','2016-11-04 16:17:05'),(304,159,0,0,1,'Бытовая техника','bytovaya-texnika','/tovary-dlya-doma/bytovaya-texnika','306,307,308,309,310,311,312,313,305,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,314,341,342,343,344,345,346,347,348,349,340,304','2016-11-04 16:17:42','2016-11-04 16:17:42'),(305,304,0,0,1,'Техника для ухода','texnika-dlya-uxoda','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-uxoda','306,307,308,309,310,311,312,313,305','2016-11-04 16:18:39','2016-11-04 16:18:39'),(306,305,0,0,1,'Бритвы электрические','britvy-elektricheskie','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-uxoda/britvy-elektricheskie','306','2016-11-04 16:20:01','2016-11-04 16:20:01'),(307,305,0,0,1,'Косметические приборы','kosmeticheskie-pribory','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-uxoda/kosmeticheskie-pribory','307','2016-11-04 16:20:01','2016-11-04 16:20:01'),(308,305,0,0,1,'Массажеры электрические','massazhery-elektricheskie','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-uxoda/massazhery-elektricheskie','308','2016-11-04 16:20:01','2016-11-04 16:20:01'),(309,305,0,0,1,'Медицинские приборы','medicinskie-pribory','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-uxoda/medicinskie-pribory','309','2016-11-04 16:20:01','2016-11-04 16:20:01'),(310,305,0,0,1,'Машинки для стрижки и триммеры','mashinki-dlya-strizhki-i-trimmery','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-uxoda/mashinki-dlya-strizhki-i-trimmery','310','2016-11-04 16:20:01','2016-11-04 16:20:01'),(311,305,0,0,1,'Приборы для укладки волос','pribory-dlya-ukladki-volos','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-uxoda/pribory-dlya-ukladki-volos','311','2016-11-04 16:20:01','2016-11-04 16:20:01'),(312,305,0,0,1,'Электрические зубные щетки','elektricheskie-zubnye-shhetki','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-uxoda/elektricheskie-zubnye-shhetki','312','2016-11-04 16:20:01','2016-11-04 16:20:01'),(313,305,0,0,1,'Эпиляторы','epilyatory','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-uxoda/epilyatory','313','2016-11-04 16:20:01','2016-11-04 16:20:01'),(314,304,0,0,1,'Техника для кухни','texnika-dlya-kuxni','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni','315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,314','2016-11-04 17:26:54','2016-11-04 17:26:54'),(315,314,0,0,1,'Блендеры','blendery','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/blendery','315','2016-11-04 17:28:55','2016-11-04 17:28:55'),(316,314,0,0,1,'Вафельницы','vafelnicy','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/vafelnicy','316','2016-11-04 17:28:55','2016-11-04 17:28:55'),(317,314,0,0,1,'Кофеварки','kofevarki','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/kofevarki','317','2016-11-04 17:28:55','2016-11-04 17:28:55'),(318,314,0,0,1,'Кофемолки','kofemolki','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/kofemolki','318','2016-11-04 17:28:55','2016-11-04 17:28:55'),(319,314,0,0,1,'Кухонные весы','kuxonnye-vesy','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/kuxonnye-vesy','319','2016-11-04 17:28:55','2016-11-04 17:28:55'),(320,314,0,0,1,'Кухонные комбайны','kuxonnye-kombajny','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/kuxonnye-kombajny','320','2016-11-04 17:28:55','2016-11-04 17:28:55'),(321,314,0,0,1,'Миксеры','miksery','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/miksery','321','2016-11-04 17:28:55','2016-11-04 17:28:55'),(322,314,0,0,1,'Мультиварки','multivarki','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/multivarki','322','2016-11-04 17:28:55','2016-11-04 17:28:55'),(323,314,0,0,1,'Мясорубки','myasorubki','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/myasorubki','323','2016-11-04 17:28:55','2016-11-04 17:28:55'),(324,314,0,0,1,'Пароварки','parovarki','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/parovarki','324','2016-11-04 17:28:55','2016-11-04 17:28:55'),(325,314,0,0,1,'Соковыжималки','sokovyzhimalki','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/sokovyzhimalki','325','2016-11-04 17:28:55','2016-11-04 17:28:55'),(326,314,0,0,1,'Тостеры','tostery','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/tostery','326','2016-11-04 17:28:55','2016-11-04 17:28:55'),(327,314,0,0,1,'Хлебопечки','xlebopechki','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/xlebopechki','327','2016-11-04 17:28:55','2016-11-04 17:28:55'),(328,314,0,0,1,'Чайники электрические','chajniki-elektricheskie','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/chajniki-elektricheskie','328','2016-11-04 17:28:55','2016-11-04 17:28:55'),(329,314,0,0,1,'Йогуртницы','jogurtnicy','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/jogurtnicy','329','2016-11-04 17:28:55','2016-11-04 17:28:55'),(330,314,0,0,1,'Творожницы','tvorozhnicy','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/tvorozhnicy','330','2016-11-04 17:28:56','2016-11-04 17:28:56'),(331,314,0,0,1,'Аэрогрили','aerogrili','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/aerogrili','331','2016-11-04 17:28:56','2016-11-04 17:28:56'),(332,314,0,0,1,'Грили','grili','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/grili','332','2016-11-04 17:28:56','2016-11-04 17:28:56'),(333,314,0,0,1,'Электрошашлычницы','elektroshashlychnicy','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/elektroshashlychnicy','333','2016-11-04 17:28:56','2016-11-04 17:28:56'),(334,314,0,0,1,'Ломтерезки','lomterezki','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/lomterezki','334','2016-11-04 17:28:56','2016-11-04 17:28:56'),(335,314,0,0,1,'Маринаторы','marinatory','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/marinatory','335','2016-11-04 17:28:56','2016-11-04 17:28:56'),(336,314,0,0,1,'Настольные плиты','nastolnye-plity','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/nastolnye-plity','336','2016-11-04 17:28:56','2016-11-04 17:28:56'),(337,314,0,0,1,'Сушилки для овощей и фруктов','sushilki-dlya-ovoshhej-i-fruktov','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/sushilki-dlya-ovoshhej-i-fruktov','337','2016-11-04 17:28:56','2016-11-04 17:28:56'),(338,314,0,0,1,'Фритюрницы','frityurnicy','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/frityurnicy','338','2016-11-04 17:28:56','2016-11-04 17:28:56'),(339,314,0,0,1,'Аксессуары для кухонной техники','aksessuary-dlya-kuxonnoj-texniki','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-kuxni/aksessuary-dlya-kuxonnoj-texniki','339','2016-11-04 17:28:56','2016-11-04 17:28:56'),(340,304,0,0,1,'Техника для дома','texnika-dlya-doma','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-doma','341,342,343,344,345,346,347,348,349,340','2016-11-04 17:38:07','2016-11-04 17:38:07'),(341,340,0,0,1,'Весы','vesy','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-doma/vesy','341','2016-11-04 17:39:56','2016-11-04 17:39:56'),(342,340,0,0,1,'Вентиляторы','ventilyatory','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-doma/ventilyatory','342','2016-11-04 17:39:56','2016-11-04 17:39:56'),(343,340,0,0,1,'Обогреватели','obogrevateli','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-doma/obogrevateli','343','2016-11-04 17:39:56','2016-11-04 17:39:56'),(344,340,0,0,1,'Пароочистители','paroochistiteli','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-doma/paroochistiteli','344','2016-11-04 17:39:56','2016-11-04 17:39:56'),(345,340,0,0,1,'Пылесосы','pylesosy','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-doma/pylesosy','345','2016-11-04 17:39:56','2016-11-04 17:39:56'),(346,340,0,0,1,'Увлажнители воздуха','uvlazhniteli-vozduxa','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-doma/uvlazhniteli-vozduxa','346','2016-11-04 17:39:56','2016-11-04 17:39:56'),(347,340,0,0,1,'Утюги','utyugi','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-doma/utyugi','347','2016-11-04 17:39:56','2016-11-04 17:39:56'),(348,340,0,0,1,'Электронные сигареты','elektronnye-sigarety','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-doma/elektronnye-sigarety','348','2016-11-04 17:39:56','2016-11-04 17:39:56'),(349,340,0,0,1,'Аксессуары для сигарет','aksessuary-dlya-sigaret','/tovary-dlya-doma/bytovaya-texnika/texnika-dlya-doma/aksessuary-dlya-sigaret','349','2016-11-04 17:39:57','2016-11-04 17:39:57'),(350,0,0,0,1,'Все для сада','vse-dlya-sada','/vse-dlya-sada','351,352,353,355,356,357,354,358,359,350','2016-11-05 16:27:07','2016-11-05 16:27:07'),(351,350,0,0,1,'Садовая техника','sadovaya-texnika','/vse-dlya-sada/sadovaya-texnika','351','2016-11-05 16:28:49','2016-11-05 16:28:49'),(352,350,0,0,1,'Садовый инвентарь','sadovyj-inventar','/vse-dlya-sada/sadovyj-inventar','352','2016-11-05 16:28:49','2016-11-05 16:28:49'),(353,350,0,0,1,'Системы полива','sistemy-poliva','/vse-dlya-sada/sistemy-poliva','353','2016-11-05 16:28:49','2016-11-05 16:28:49'),(354,350,0,0,1,'Семена и удобрения','semena-i-udobreniya','/vse-dlya-sada/semena-i-udobreniya','355,356,357,354','2016-11-05 16:28:49','2016-11-05 16:28:49'),(355,354,0,0,1,'Семена','semena','/vse-dlya-sada/semena-i-udobreniya/semena','355','2016-11-05 16:29:41','2016-11-05 16:29:41'),(356,354,0,0,1,'Удобрения','udobreniya','/vse-dlya-sada/semena-i-udobreniya/udobreniya','356','2016-11-05 16:29:41','2016-11-05 16:29:41'),(357,354,0,0,1,'Саженцы','sazhency','/vse-dlya-sada/semena-i-udobreniya/sazhency','357','2016-11-05 16:29:42','2016-11-05 16:29:42'),(358,350,0,0,1,'Садовая мебель','sadovaya-mebel','/vse-dlya-sada/sadovaya-mebel','358','2016-11-05 16:30:34','2016-11-05 16:30:34'),(359,350,0,0,1,'Садовый декор','sadovyj-dekor','/vse-dlya-sada/sadovyj-dekor','359','2016-11-05 16:30:34','2016-11-05 16:30:34'),(360,0,0,0,1,'Красота и здоровье','krasota-i-zdorove','/krasota-i-zdorove','362,363,364,365,366,367,368,369,370,361,372,373,374,375,376,377,378,379,380,381,382,383,384,371,386,387,388,389,390,391,392,385,394,395,396,393,398,399,400,397,402,403,404,401,406,407,408,409,410,405,412,413,414,415,416,417,418,411,360','2016-11-05 16:31:23','2016-11-05 16:31:23'),(361,360,0,0,1,'Уход за волосами','uxod-za-volosami','/krasota-i-zdorove/uxod-za-volosami','362,363,364,365,366,367,368,369,370,361','2016-11-05 16:32:15','2016-11-05 16:32:15'),(362,361,0,0,1,'Шампуни','shampuni','/krasota-i-zdorove/uxod-za-volosami/shampuni','362','2016-11-05 16:33:50','2016-11-05 16:33:50'),(363,361,0,0,1,'Кондиционеры','kondicionery','/krasota-i-zdorove/uxod-za-volosami/kondicionery','363','2016-11-05 16:33:50','2016-11-05 16:33:50'),(364,361,0,0,1,'Бальзамы ополаскиватели','balzamy-opolaskivateli','/krasota-i-zdorove/uxod-za-volosami/balzamy-opolaskivateli','364','2016-11-05 16:33:50','2016-11-05 16:33:50'),(365,361,0,0,1,'Спреи','sprei','/krasota-i-zdorove/uxod-za-volosami/sprei','365','2016-11-05 16:33:50','2016-11-05 16:33:50'),(366,361,0,0,1,'Маски','maski','/krasota-i-zdorove/uxod-za-volosami/maski','366','2016-11-05 16:33:50','2016-11-05 16:33:50'),(367,361,0,0,1,'Масла сыворотки','masla-syvorotki','/krasota-i-zdorove/uxod-za-volosami/masla-syvorotki','367','2016-11-05 16:33:50','2016-11-05 16:33:50'),(368,361,0,0,1,'Стайлинг','stajling','/krasota-i-zdorove/uxod-za-volosami/stajling','368','2016-11-05 16:33:50','2016-11-05 16:33:50'),(369,361,0,0,1,'Окрашивание','okrashivanie','/krasota-i-zdorove/uxod-za-volosami/okrashivanie','369','2016-11-05 16:33:50','2016-11-05 16:33:50'),(370,361,0,0,1,'Аксессуары для волос','aksessuary-dlya-volos','/krasota-i-zdorove/uxod-za-volosami/aksessuary-dlya-volos','370','2016-11-05 16:33:50','2016-11-05 16:33:50'),(371,360,0,0,1,'Уход за телом','uxod-za-telom','/krasota-i-zdorove/uxod-za-telom','372,373,374,375,376,377,378,379,380,381,382,383,384,371','2016-11-05 16:34:40','2016-11-05 16:34:40'),(372,371,0,0,1,'Крема','krema','/krasota-i-zdorove/uxod-za-telom/krema','372','2016-11-05 16:36:03','2016-11-05 16:36:03'),(373,371,0,0,1,'Лосьоны','losony','/krasota-i-zdorove/uxod-za-telom/losony','373','2016-11-05 16:36:03','2016-11-05 16:36:03'),(374,371,0,0,1,'Спреи','sprei','/krasota-i-zdorove/uxod-za-telom/sprei','374','2016-11-05 16:36:03','2016-11-05 16:36:03'),(375,371,0,0,1,'Гели для душа','geli-dlya-dusha','/krasota-i-zdorove/uxod-za-telom/geli-dlya-dusha','375','2016-11-05 16:36:03','2016-11-05 16:36:03'),(376,371,0,0,1,'Мыло','mylo','/krasota-i-zdorove/uxod-za-telom/mylo','376','2016-11-05 16:36:03','2016-11-05 16:36:03'),(377,371,0,0,1,'Масла','masla','/krasota-i-zdorove/uxod-za-telom/masla','377','2016-11-05 16:36:03','2016-11-05 16:36:03'),(378,371,0,0,1,'Скрабы','skraby','/krasota-i-zdorove/uxod-za-telom/skraby','378','2016-11-05 16:36:03','2016-11-05 16:36:03'),(379,371,0,0,1,'Пилинги','pilingi','/krasota-i-zdorove/uxod-za-telom/pilingi','379','2016-11-05 16:36:04','2016-11-05 16:36:04'),(380,371,0,0,1,'Средства для ванн','sredstva-dlya-vann','/krasota-i-zdorove/uxod-za-telom/sredstva-dlya-vann','380','2016-11-05 16:36:04','2016-11-05 16:36:04'),(381,371,0,0,1,'Коррекция фигуры','korrekciya-figury','/krasota-i-zdorove/uxod-za-telom/korrekciya-figury','381','2016-11-05 16:36:04','2016-11-05 16:36:04'),(382,371,0,0,1,'Депиляция','depilyaciya','/krasota-i-zdorove/uxod-za-telom/depilyaciya','382','2016-11-05 16:36:04','2016-11-05 16:36:04'),(383,371,0,0,1,'Интимная гигиена','intimnaya-gigiena','/krasota-i-zdorove/uxod-za-telom/intimnaya-gigiena','383','2016-11-05 16:36:04','2016-11-05 16:36:04'),(384,371,0,0,1,'Дезодоранты','dezodoranty','/krasota-i-zdorove/uxod-za-telom/dezodoranty','384','2016-11-05 16:36:04','2016-11-05 16:36:04'),(385,360,0,0,1,'Уход за лицом','uxod-za-liczom','/krasota-i-zdorove/uxod-za-liczom','386,387,388,389,390,391,392,385','2016-11-05 16:37:14','2016-11-05 16:37:14'),(386,385,0,0,1,'Демакияж','demakiyazh','/krasota-i-zdorove/uxod-za-liczom/demakiyazh','386','2016-11-05 16:38:22','2016-11-05 16:38:22'),(387,385,0,0,1,'Скрабы','skraby','/krasota-i-zdorove/uxod-za-liczom/skraby','387','2016-11-05 16:38:22','2016-11-05 16:38:22'),(388,385,0,0,1,'Пилинги','pilingi','/krasota-i-zdorove/uxod-za-liczom/pilingi','388','2016-11-05 16:38:22','2016-11-05 16:38:22'),(389,385,0,0,1,'Крема','krema','/krasota-i-zdorove/uxod-za-liczom/krema','389','2016-11-05 16:38:22','2016-11-05 16:38:22'),(390,385,0,0,1,'Гели','geli','/krasota-i-zdorove/uxod-za-liczom/geli','390','2016-11-05 16:38:23','2016-11-05 16:38:23'),(391,385,0,0,1,'Сыворотки','syvorotki','/krasota-i-zdorove/uxod-za-liczom/syvorotki','391','2016-11-05 16:38:23','2016-11-05 16:38:23'),(392,385,0,0,1,'Маски','maski','/krasota-i-zdorove/uxod-za-liczom/maski','392','2016-11-05 16:38:23','2016-11-05 16:38:23'),(393,360,0,0,1,'Уход за руками и ногами','uxod-za-rukami-i-nogami','/krasota-i-zdorove/uxod-za-rukami-i-nogami','394,395,396,393','2016-11-05 16:38:55','2016-11-05 16:38:55'),(394,393,0,0,1,'Косметика для рук','kosmetika-dlya-ruk','/krasota-i-zdorove/uxod-za-rukami-i-nogami/kosmetika-dlya-ruk','394','2016-11-05 16:39:40','2016-11-05 16:39:40'),(395,393,0,0,1,'Косметика для ног','kosmetika-dlya-nog','/krasota-i-zdorove/uxod-za-rukami-i-nogami/kosmetika-dlya-nog','395','2016-11-05 16:39:40','2016-11-05 16:39:40'),(396,393,0,0,1,'Средства для маникюра и педикюра','sredstva-dlya-manikyura-i-pedikyura','/krasota-i-zdorove/uxod-za-rukami-i-nogami/sredstva-dlya-manikyura-i-pedikyura','396','2016-11-05 16:39:40','2016-11-05 16:39:40'),(397,360,0,0,1,'Парфюмерия','parfyumeriya','/krasota-i-zdorove/parfyumeriya','398,399,400,397','2016-11-05 16:40:11','2016-11-05 16:40:11'),(398,397,0,0,1,'Женские ароматы','zhenskie-aromaty','/krasota-i-zdorove/parfyumeriya/zhenskie-aromaty','398','2016-11-05 16:41:00','2016-11-05 16:41:00'),(399,397,0,0,1,'Мужские ароматы','muzhskie-aromaty','/krasota-i-zdorove/parfyumeriya/muzhskie-aromaty','399','2016-11-05 16:41:00','2016-11-05 16:41:00'),(400,397,0,0,1,'Унисекс','uniseks','/krasota-i-zdorove/parfyumeriya/uniseks','400','2016-11-05 16:41:00','2016-11-05 16:41:00'),(401,360,0,0,1,'Декоративная косметика','dekorativnaya-kosmetika','/krasota-i-zdorove/dekorativnaya-kosmetika','402,403,404,401','2016-11-05 16:41:26','2016-11-05 16:41:26'),(402,401,0,0,1,'Для глаз','dlya-glaz','/krasota-i-zdorove/dekorativnaya-kosmetika/dlya-glaz','402','2016-11-05 16:42:10','2016-11-05 16:42:10'),(403,401,0,0,1,'Для губ','dlya-gub','/krasota-i-zdorove/dekorativnaya-kosmetika/dlya-gub','403','2016-11-05 16:42:10','2016-11-05 16:42:10'),(404,401,0,0,1,'Для лица','dlya-licza','/krasota-i-zdorove/dekorativnaya-kosmetika/dlya-licza','404','2016-11-05 16:42:10','2016-11-05 16:42:10'),(405,360,0,0,1,'Уход за полостью рта','uxod-za-polostyu-rta','/krasota-i-zdorove/uxod-za-polostyu-rta','406,407,408,409,410,405','2016-11-05 16:43:02','2016-11-05 16:43:02'),(406,405,0,0,1,'Пасты','pasty','/krasota-i-zdorove/uxod-za-polostyu-rta/pasty','406','2016-11-05 16:44:08','2016-11-05 16:44:08'),(407,405,0,0,1,'Порошки','poroshki','/krasota-i-zdorove/uxod-za-polostyu-rta/poroshki','407','2016-11-05 16:44:08','2016-11-05 16:44:08'),(408,405,0,0,1,'Ополаскиватели','opolaskivateli','/krasota-i-zdorove/uxod-za-polostyu-rta/opolaskivateli','408','2016-11-05 16:44:08','2016-11-05 16:44:08'),(409,405,0,0,1,'Щетки','shhetki','/krasota-i-zdorove/uxod-za-polostyu-rta/shhetki','409','2016-11-05 16:44:08','2016-11-05 16:44:08'),(410,405,0,0,1,'Нити','niti','/krasota-i-zdorove/uxod-za-polostyu-rta/niti','410','2016-11-05 16:44:08','2016-11-05 16:44:08'),(411,360,0,0,1,'Мужская линия','muzhskaya-liniya','/krasota-i-zdorove/muzhskaya-liniya','412,413,414,415,416,417,418,411','2016-11-05 16:44:45','2016-11-05 16:44:45'),(412,411,0,0,1,'Шампуни','shampuni','/krasota-i-zdorove/muzhskaya-liniya/shampuni','412','2016-11-05 16:45:45','2016-11-05 16:45:45'),(413,411,0,0,1,'Кондиционеры','kondicionery','/krasota-i-zdorove/muzhskaya-liniya/kondicionery','413','2016-11-05 16:45:45','2016-11-05 16:45:45'),(414,411,0,0,1,'Гели для душа','geli-dlya-dusha','/krasota-i-zdorove/muzhskaya-liniya/geli-dlya-dusha','414','2016-11-05 16:45:45','2016-11-05 16:45:45'),(415,411,0,0,1,'Антиперспиранты','antiperspiranty','/krasota-i-zdorove/muzhskaya-liniya/antiperspiranty','415','2016-11-05 16:45:45','2016-11-05 16:45:45'),(416,411,0,0,1,'Уход за лицом','uxod-za-liczom','/krasota-i-zdorove/muzhskaya-liniya/uxod-za-liczom','416','2016-11-05 16:45:45','2016-11-05 16:45:45'),(417,411,0,0,1,'Средства для бритья','sredstva-dlya-britya','/krasota-i-zdorove/muzhskaya-liniya/sredstva-dlya-britya','417','2016-11-05 16:45:45','2016-11-05 16:45:45'),(418,411,0,0,1,'Уход за бородой и усами','uxod-za-borodoj-i-usami','/krasota-i-zdorove/muzhskaya-liniya/uxod-za-borodoj-i-usami','418','2016-11-05 16:45:45','2016-11-05 16:45:45'),(419,0,0,0,1,'Товары для детей','tovary-dlya-detej','/tovary-dlya-detej','421,422,423,424,425,426,427,428,429,430,420,431,432,433,435,436,437,438,439,434,441,442,443,444,445,446,440,448,449,447,451,452,450,419','2016-11-05 16:46:29','2016-11-05 16:46:29'),(420,419,0,0,1,'Игрушки','igrushki','/tovary-dlya-detej/igrushki','421,422,423,424,425,426,427,428,429,430,420','2016-11-05 16:47:28','2016-11-05 16:47:28'),(421,420,0,0,1,'Игрушки для новорожденных','igrushki-dlya-novorozhdennyx','/tovary-dlya-detej/igrushki/igrushki-dlya-novorozhdennyx','421','2016-11-05 16:48:50','2016-11-05 16:48:50'),(422,420,0,0,1,'Интерактивные игрушки','interaktivnye-igrushki','/tovary-dlya-detej/igrushki/interaktivnye-igrushki','422','2016-11-05 16:48:51','2016-11-05 16:48:51'),(423,420,0,0,1,'Куклы','kukly','/tovary-dlya-detej/igrushki/kukly','423','2016-11-05 16:48:51','2016-11-05 16:48:51'),(424,420,0,0,1,'Игровые наборы','igrovye-nabory','/tovary-dlya-detej/igrushki/igrovye-nabory','424','2016-11-05 16:48:51','2016-11-05 16:48:51'),(425,420,0,0,1,'Фигурки','figurki','/tovary-dlya-detej/igrushki/figurki','425','2016-11-05 16:48:51','2016-11-05 16:48:51'),(426,420,0,0,1,'Конструкторы','konstruktory','/tovary-dlya-detej/igrushki/konstruktory','426','2016-11-05 16:48:51','2016-11-05 16:48:51'),(427,420,0,0,1,'Игрушечный транспорт, военная техника','igrushechnyj-transport-voennaya-texnika','/tovary-dlya-detej/igrushki/igrushechnyj-transport-voennaya-texnika','427','2016-11-05 16:48:51','2016-11-05 16:48:51'),(428,420,0,0,1,'Игрушки на радиоуправлении','igrushki-na-radioupravlenii','/tovary-dlya-detej/igrushki/igrushki-na-radioupravlenii','428','2016-11-05 16:48:51','2016-11-05 16:48:51'),(429,420,0,0,1,'Мягкие игрушки','myagkie-igrushki','/tovary-dlya-detej/igrushki/myagkie-igrushki','429','2016-11-05 16:48:51','2016-11-05 16:48:51'),(430,420,0,0,1,'Развитие и обучение','razvitie-i-obuchenie','/tovary-dlya-detej/igrushki/razvitie-i-obuchenie','430','2016-11-05 16:48:51','2016-11-05 16:48:51'),(431,419,0,0,1,'Настольные игры','nastolnye-igry','/tovary-dlya-detej/nastolnye-igry','431','2016-11-05 16:50:18','2016-11-05 16:50:18'),(432,419,0,0,1,'Спортивные и активные игры','sportivnye-i-aktivnye-igry','/tovary-dlya-detej/sportivnye-i-aktivnye-igry','432','2016-11-05 16:50:18','2016-11-05 16:50:18'),(433,419,0,0,1,'Хобби и творчество','xobbi-i-tvorchestvo','/tovary-dlya-detej/xobbi-i-tvorchestvo','433','2016-11-05 16:50:18','2016-11-05 16:50:18'),(434,419,0,0,1,'Все для школы','vse-dlya-shkoly','/tovary-dlya-detej/vse-dlya-shkoly','435,436,437,438,439,434','2016-11-05 16:50:18','2016-11-05 16:50:18'),(435,434,0,0,1,'Канцелярские наборы','kancelyarskie-nabory','/tovary-dlya-detej/vse-dlya-shkoly/kancelyarskie-nabory','435','2016-11-05 16:51:20','2016-11-05 16:51:20'),(436,434,0,0,1,'Канцтовары','kancztovary','/tovary-dlya-detej/vse-dlya-shkoly/kancztovary','436','2016-11-05 16:51:20','2016-11-05 16:51:20'),(437,434,0,0,1,'Школьные ранцы','shkolnye-rancy','/tovary-dlya-detej/vse-dlya-shkoly/shkolnye-rancy','437','2016-11-05 16:51:20','2016-11-05 16:51:20'),(438,434,0,0,1,'Рюкзаки','ryukzaki','/tovary-dlya-detej/vse-dlya-shkoly/ryukzaki','438','2016-11-05 16:51:20','2016-11-05 16:51:20'),(439,434,0,0,1,'Сумки','sumki','/tovary-dlya-detej/vse-dlya-shkoly/sumki','439','2016-11-05 16:51:20','2016-11-05 16:51:20'),(440,419,0,0,1,'Хобби и Творчество','xobbi-i-tvorchestvo','/tovary-dlya-detej/xobbi-i-tvorchestvo','441,442,443,444,445,446,440','2016-11-05 16:51:49','2016-11-05 16:51:49'),(441,440,0,0,1,'Рисование','risovanie','/tovary-dlya-detej/xobbi-i-tvorchestvo/risovanie','441','2016-11-05 16:52:49','2016-11-05 16:52:49'),(442,440,0,0,1,'Вышивание','vyshivanie','/tovary-dlya-detej/xobbi-i-tvorchestvo/vyshivanie','442','2016-11-05 16:52:49','2016-11-05 16:52:49'),(443,440,0,0,1,'Скрапбукинг','skrapbuking','/tovary-dlya-detej/xobbi-i-tvorchestvo/skrapbuking','443','2016-11-05 16:52:49','2016-11-05 16:52:49'),(444,440,0,0,1,'Оригами','origami','/tovary-dlya-detej/xobbi-i-tvorchestvo/origami','444','2016-11-05 16:52:49','2016-11-05 16:52:49'),(445,440,0,0,1,'Квиллинг','kvilling','/tovary-dlya-detej/xobbi-i-tvorchestvo/kvilling','445','2016-11-05 16:52:49','2016-11-05 16:52:49'),(446,440,0,0,1,'Заготовки, декупаж','zagotovki-dekupazh','/tovary-dlya-detej/xobbi-i-tvorchestvo/zagotovki-dekupazh','446','2016-11-05 16:52:50','2016-11-05 16:52:50'),(447,419,0,0,1,'Питание и кормление','pitanie-i-kormlenie','/tovary-dlya-detej/pitanie-i-kormlenie','448,449,447','2016-11-05 16:53:16','2016-11-05 16:53:16'),(448,447,0,0,1,'Детское питание','detskoe-pitanie','/tovary-dlya-detej/pitanie-i-kormlenie/detskoe-pitanie','448','2016-11-05 16:54:16','2016-11-05 16:54:16'),(449,447,0,0,1,'Аксессуары для кормления','aksessuary-dlya-kormleniya','/tovary-dlya-detej/pitanie-i-kormlenie/aksessuary-dlya-kormleniya','449','2016-11-05 16:54:16','2016-11-05 16:54:16'),(450,419,0,0,1,'Подгузники и гигиена','podguzniki-i-gigiena','/tovary-dlya-detej/podguzniki-i-gigiena','451,452,450','2016-11-05 16:54:58','2016-11-05 16:54:58'),(451,450,0,0,1,'Косметика','kosmetika','/tovary-dlya-detej/podguzniki-i-gigiena/kosmetika','451','2016-11-05 16:55:48','2016-11-05 16:55:48'),(452,450,0,0,1,'Для ванной','dlya-vannoj','/tovary-dlya-detej/podguzniki-i-gigiena/dlya-vannoj','452','2016-11-05 16:55:48','2016-11-05 16:55:48'),(453,0,0,0,1,'Спортивные товары','sportivnye-tovary','/sportivnye-tovary','455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,454,472,473,474,475,476,471,478,479,480,481,482,483,484,485,486,487,477,489,490,492,493,494,495,496,497,498,499,500,501,502,491,488,503,504,505,508,509,510,511,512,507,514,515,513,516,517,518,519,521,522,523,520,524,525,526,506,528,529,530,531,527,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,532,550,551,552,553,554,555,556,557,549,559,560,561,562,563,564,565,566,567,558,453','2016-11-05 16:56:36','2016-11-05 16:56:36'),(454,453,0,0,1,'Тренажеры и оборудование','trenazhery-i-oborudovanie','/sportivnye-tovary/trenazhery-i-oborudovanie','455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,454','2016-11-05 16:57:27','2016-11-05 16:57:27'),(455,454,0,0,1,'Беговые дорожки','begovye-dorozhki','/sportivnye-tovary/trenazhery-i-oborudovanie/begovye-dorozhki','455','2016-11-05 16:59:07','2016-11-05 16:59:07'),(456,454,0,0,1,'Орбитреки','orbitreki','/sportivnye-tovary/trenazhery-i-oborudovanie/orbitreki','456','2016-11-05 16:59:07','2016-11-05 16:59:07'),(457,454,0,0,1,'Велотренажеры','velotrenazhery','/sportivnye-tovary/trenazhery-i-oborudovanie/velotrenazhery','457','2016-11-05 16:59:07','2016-11-05 16:59:07'),(458,454,0,0,1,'Гребные тренажеры','grebnye-trenazhery','/sportivnye-tovary/trenazhery-i-oborudovanie/grebnye-trenazhery','458','2016-11-05 16:59:07','2016-11-05 16:59:07'),(459,454,0,0,1,'Силовые тренажеры','silovye-trenazhery','/sportivnye-tovary/trenazhery-i-oborudovanie/silovye-trenazhery','459','2016-11-05 16:59:07','2016-11-05 16:59:07'),(460,454,0,0,1,'Степперы','steppery','/sportivnye-tovary/trenazhery-i-oborudovanie/steppery','460','2016-11-05 16:59:07','2016-11-05 16:59:07'),(461,454,0,0,1,'Гантели','ganteli','/sportivnye-tovary/trenazhery-i-oborudovanie/ganteli','461','2016-11-05 16:59:07','2016-11-05 16:59:07'),(462,454,0,0,1,'Диски','diski','/sportivnye-tovary/trenazhery-i-oborudovanie/diski','462','2016-11-05 16:59:07','2016-11-05 16:59:07'),(463,454,0,0,1,'Грифы','grify','/sportivnye-tovary/trenazhery-i-oborudovanie/grify','463','2016-11-05 16:59:07','2016-11-05 16:59:07'),(464,454,0,0,1,'Замки','zamki','/sportivnye-tovary/trenazhery-i-oborudovanie/zamki','464','2016-11-05 16:59:07','2016-11-05 16:59:07'),(465,454,0,0,1,'Шведские стенки','shvedskie-stenki','/sportivnye-tovary/trenazhery-i-oborudovanie/shvedskie-stenki','465','2016-11-05 16:59:08','2016-11-05 16:59:08'),(466,454,0,0,1,'Кистевые тренажеры','kistevye-trenazhery','/sportivnye-tovary/trenazhery-i-oborudovanie/kistevye-trenazhery','466','2016-11-05 16:59:08','2016-11-05 16:59:08'),(467,454,0,0,1,'Перчатки','perchatki','/sportivnye-tovary/trenazhery-i-oborudovanie/perchatki','467','2016-11-05 16:59:08','2016-11-05 16:59:08'),(468,454,0,0,1,'Пояса','poyasa','/sportivnye-tovary/trenazhery-i-oborudovanie/poyasa','468','2016-11-05 16:59:08','2016-11-05 16:59:08'),(469,454,0,0,1,'Батуты и аксессуары','batuty-i-aksessuary','/sportivnye-tovary/trenazhery-i-oborudovanie/batuty-i-aksessuary','469','2016-11-05 16:59:08','2016-11-05 16:59:08'),(470,454,0,0,1,'Массажные столы','massazhnye-stoly','/sportivnye-tovary/trenazhery-i-oborudovanie/massazhnye-stoly','470','2016-11-05 16:59:08','2016-11-05 16:59:08'),(471,453,0,0,1,'Фитнес и аэробика','fitnes-i-aerobika','/sportivnye-tovary/fitnes-i-aerobika','472,473,474,475,476,471','2016-11-05 16:59:45','2016-11-05 16:59:45'),(472,471,0,0,1,'Массажные обручи','massazhnye-obruchi','/sportivnye-tovary/fitnes-i-aerobika/massazhnye-obruchi','472','2016-11-05 17:00:43','2016-11-05 17:00:43'),(473,471,0,0,1,'Пояса','poyasa','/sportivnye-tovary/fitnes-i-aerobika/poyasa','473','2016-11-05 17:00:43','2016-11-05 17:00:43'),(474,471,0,0,1,'Перчатки','perchatki','/sportivnye-tovary/fitnes-i-aerobika/perchatki','474','2016-11-05 17:00:43','2016-11-05 17:00:43'),(475,471,0,0,1,'Аксессуары для фитнеса','aksessuary-dlya-fitnesa','/sportivnye-tovary/fitnes-i-aerobika/aksessuary-dlya-fitnesa','475','2016-11-05 17:00:43','2016-11-05 17:00:43'),(476,471,0,0,1,'Одежда для фитнеса','odezhda-dlya-fitnesa','/sportivnye-tovary/fitnes-i-aerobika/odezhda-dlya-fitnesa','476','2016-11-05 17:00:43','2016-11-05 17:00:43'),(477,453,0,0,1,'Спортивное питание','sportivnoe-pitanie','/sportivnye-tovary/sportivnoe-pitanie','478,479,480,481,482,483,484,485,486,487,477','2016-11-05 17:01:14','2016-11-05 17:01:14'),(478,477,0,0,1,'Аминокислоты','aminokisloty','/sportivnye-tovary/sportivnoe-pitanie/aminokisloty','478','2016-11-05 17:02:41','2016-11-05 17:02:41'),(479,477,0,0,1,'Витамины','vitaminy','/sportivnye-tovary/sportivnoe-pitanie/vitaminy','479','2016-11-05 17:02:41','2016-11-05 17:02:41'),(480,477,0,0,1,'Гейнеры','gejnery','/sportivnye-tovary/sportivnoe-pitanie/gejnery','480','2016-11-05 17:02:41','2016-11-05 17:02:41'),(481,477,0,0,1,'Жиросжигатели','zhiroszhigateli','/sportivnye-tovary/sportivnoe-pitanie/zhiroszhigateli','481','2016-11-05 17:02:41','2016-11-05 17:02:41'),(482,477,0,0,1,'Креатин','kreatin','/sportivnye-tovary/sportivnoe-pitanie/kreatin','482','2016-11-05 17:02:42','2016-11-05 17:02:42'),(483,477,0,0,1,'Протеин','protein','/sportivnye-tovary/sportivnoe-pitanie/protein','483','2016-11-05 17:02:42','2016-11-05 17:02:42'),(484,477,0,0,1,'Предтренировочные комплексы','predtrenirovochnye-kompleksy','/sportivnye-tovary/sportivnoe-pitanie/predtrenirovochnye-kompleksy','484','2016-11-05 17:02:42','2016-11-05 17:02:42'),(485,477,0,0,1,'Специальные продукты','specialnye-produkty','/sportivnye-tovary/sportivnoe-pitanie/specialnye-produkty','485','2016-11-05 17:02:42','2016-11-05 17:02:42'),(486,477,0,0,1,'Аксессуары для спортивного питания','aksessuary-dlya-sportivnogo-pitaniya','/sportivnye-tovary/sportivnoe-pitanie/aksessuary-dlya-sportivnogo-pitaniya','486','2016-11-05 17:02:42','2016-11-05 17:02:42'),(487,477,0,0,1,'Энергетические батончики и мюсли','energeticheskie-batonchiki-i-myusli','/sportivnye-tovary/sportivnoe-pitanie/energeticheskie-batonchiki-i-myusli','487','2016-11-05 17:02:42','2016-11-05 17:02:42'),(488,453,0,0,1,'Велосипеды и аксессуары','velosipedy-i-aksessuary','/sportivnye-tovary/velosipedy-i-aksessuary','489,490,492,493,494,495,496,497,498,499,500,501,502,491,488','2016-11-05 17:03:24','2016-11-05 17:03:24'),(489,488,0,0,1,'Велосипеды','velosipedy','/sportivnye-tovary/velosipedy-i-aksessuary/velosipedy','489','2016-11-05 17:04:48','2016-11-05 17:04:48'),(490,488,0,0,1,'Комплектующие для велосипедов','komplektuyushhie-dlya-velosipedov','/sportivnye-tovary/velosipedy-i-aksessuary/komplektuyushhie-dlya-velosipedov','490','2016-11-05 17:04:48','2016-11-05 17:04:48'),(491,488,0,0,1,'Аксессуары для велосипедов','aksessuary-dlya-velosipedov','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov','492,493,494,495,496,497,498,499,500,501,502,491','2016-11-05 17:04:49','2016-11-05 17:04:49'),(492,491,0,0,1,'Велокомпьютеры','velokompyutery','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov/velokompyutery','492','2016-11-05 17:05:59','2016-11-05 17:05:59'),(493,491,0,0,1,'Шлемы','shlemy','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov/shlemy','493','2016-11-05 17:05:59','2016-11-05 17:05:59'),(494,491,0,0,1,'Перчатки','perchatki','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov/perchatki','494','2016-11-05 17:05:59','2016-11-05 17:05:59'),(495,491,0,0,1,'Сумки','sumki','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov/sumki','495','2016-11-05 17:05:59','2016-11-05 17:05:59'),(496,491,0,0,1,'Фляги','flyagi','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov/flyagi','496','2016-11-05 17:06:00','2016-11-05 17:06:00'),(497,491,0,0,1,'Крепления','krepleniya','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov/krepleniya','497','2016-11-05 17:06:00','2016-11-05 17:06:00'),(498,491,0,0,1,'Велоодежда','veloodezhda','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov/veloodezhda','498','2016-11-05 17:06:00','2016-11-05 17:06:00'),(499,491,0,0,1,'Велообувь','veloobuv','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov/veloobuv','499','2016-11-05 17:06:00','2016-11-05 17:06:00'),(500,491,0,0,1,'Велорезина','velorezina','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov/velorezina','500','2016-11-05 17:06:00','2016-11-05 17:06:00'),(501,491,0,0,1,'Велохимия для ремонта и ухода','veloximiya-dlya-remonta-i-uxoda','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov/veloximiya-dlya-remonta-i-uxoda','501','2016-11-05 17:06:00','2016-11-05 17:06:00'),(502,491,0,0,1,'Спортивные очки','sportivnye-ochki','/sportivnye-tovary/velosipedy-i-aksessuary/aksessuary-dlya-velosipedov/sportivnye-ochki','502','2016-11-05 17:06:00','2016-11-05 17:06:00'),(503,453,0,0,1,'Самокаты','samokaty','/sportivnye-tovary/samokaty','503','2016-11-05 17:09:02','2016-11-05 17:09:02'),(504,453,0,0,1,'Роликовые коньки','rolikovye-konki','/sportivnye-tovary/rolikovye-konki','504','2016-11-05 17:09:02','2016-11-05 17:09:02'),(505,453,0,0,1,'Скейты','skejty','/sportivnye-tovary/skejty','505','2016-11-05 17:09:02','2016-11-05 17:09:02'),(506,453,0,0,1,'Игровые виды спорта','igrovye-vidy-sporta','/sportivnye-tovary/igrovye-vidy-sporta','508,509,510,511,512,507,514,515,513,516,517,518,519,521,522,523,520,524,525,526,506','2016-11-05 17:09:02','2016-11-05 17:09:02'),(507,506,0,0,1,'Для настольного тенниса','dlya-nastolnogo-tennisa','/sportivnye-tovary/igrovye-vidy-sporta/dlya-nastolnogo-tennisa','508,509,510,511,512,507','2016-11-05 17:10:42','2016-11-05 17:10:42'),(508,507,0,0,1,'Ракетки','raketki','/sportivnye-tovary/igrovye-vidy-sporta/dlya-nastolnogo-tennisa/raketki','508','2016-11-05 17:11:35','2016-11-05 17:11:35'),(509,507,0,0,1,'Наборы','nabory','/sportivnye-tovary/igrovye-vidy-sporta/dlya-nastolnogo-tennisa/nabory','509','2016-11-05 17:11:35','2016-11-05 17:11:35'),(510,507,0,0,1,'Мячи','myachi','/sportivnye-tovary/igrovye-vidy-sporta/dlya-nastolnogo-tennisa/myachi','510','2016-11-05 17:11:35','2016-11-05 17:11:35'),(511,507,0,0,1,'Столы','stoly','/sportivnye-tovary/igrovye-vidy-sporta/dlya-nastolnogo-tennisa/stoly','511','2016-11-05 17:11:35','2016-11-05 17:11:35'),(512,507,0,0,1,'Сетки','setki','/sportivnye-tovary/igrovye-vidy-sporta/dlya-nastolnogo-tennisa/setki','512','2016-11-05 17:11:35','2016-11-05 17:11:35'),(513,506,0,0,1,'Для большого тенниса','dlya-bolshogo-tennisa','/sportivnye-tovary/igrovye-vidy-sporta/dlya-bolshogo-tennisa','514,515,513','2016-11-05 17:12:17','2016-11-05 17:12:17'),(514,513,0,0,1,'Ракетки для большого тенниса','raketki-dlya-bolshogo-tennisa','/sportivnye-tovary/igrovye-vidy-sporta/dlya-bolshogo-tennisa/raketki-dlya-bolshogo-tennisa','514','2016-11-05 17:12:53','2016-11-05 17:12:53'),(515,513,0,0,1,'Мячи для большого тенниса','myachi-dlya-bolshogo-tennisa','/sportivnye-tovary/igrovye-vidy-sporta/dlya-bolshogo-tennisa/myachi-dlya-bolshogo-tennisa','515','2016-11-05 17:12:53','2016-11-05 17:12:53'),(516,506,0,0,1,'Бадминтон и спидминтон','badminton-i-spidminton','/sportivnye-tovary/igrovye-vidy-sporta/badminton-i-spidminton','516','2016-11-05 17:13:53','2016-11-05 17:13:53'),(517,506,0,0,1,'Все для сквоша','vse-dlya-skvosha','/sportivnye-tovary/igrovye-vidy-sporta/vse-dlya-skvosha','517','2016-11-05 17:13:53','2016-11-05 17:13:53'),(518,506,0,0,1,'Дартс','darts','/sportivnye-tovary/igrovye-vidy-sporta/darts','518','2016-11-05 17:13:53','2016-11-05 17:13:53'),(519,506,0,0,1,'Мячи для командных игр','myachi-dlya-komandnyx-igr','/sportivnye-tovary/igrovye-vidy-sporta/myachi-dlya-komandnyx-igr','519','2016-11-05 17:13:54','2016-11-05 17:13:54'),(520,506,0,0,1,'Для баскетбола','dlya-basketbola','/sportivnye-tovary/igrovye-vidy-sporta/dlya-basketbola','521,522,523,520','2016-11-05 17:13:54','2016-11-05 17:13:54'),(521,520,0,0,1,'Щиты','shhity','/sportivnye-tovary/igrovye-vidy-sporta/dlya-basketbola/shhity','521','2016-11-05 17:14:45','2016-11-05 17:14:45'),(522,520,0,0,1,'Кольца','kolcza','/sportivnye-tovary/igrovye-vidy-sporta/dlya-basketbola/kolcza','522','2016-11-05 17:14:45','2016-11-05 17:14:45'),(523,520,0,0,1,'Стойки','stojki','/sportivnye-tovary/igrovye-vidy-sporta/dlya-basketbola/stojki','523','2016-11-05 17:14:45','2016-11-05 17:14:45'),(524,506,0,0,1,'Бейсбол','bejsbol','/sportivnye-tovary/igrovye-vidy-sporta/bejsbol','524','2016-11-05 17:15:30','2016-11-05 17:15:30'),(525,506,0,0,1,'Одежда и экипировка для игрового спорта','odezhda-i-ekipirovka-dlya-igrovogo-sporta','/sportivnye-tovary/igrovye-vidy-sporta/odezhda-i-ekipirovka-dlya-igrovogo-sporta','525','2016-11-05 17:15:30','2016-11-05 17:15:30'),(526,506,0,0,1,'Аксессуары для игрового спорта','aksessuary-dlya-igrovogo-sporta','/sportivnye-tovary/igrovye-vidy-sporta/aksessuary-dlya-igrovogo-sporta','526','2016-11-05 17:15:30','2016-11-05 17:15:30'),(527,453,0,0,1,'Бассейн и аквафитнес','bassejn-i-akvafitnes','/sportivnye-tovary/bassejn-i-akvafitnes','528,529,530,531,527','2016-11-05 17:16:13','2016-11-05 17:16:13'),(528,527,0,0,1,'Ласты для бассейна','lasty-dlya-bassejna','/sportivnye-tovary/bassejn-i-akvafitnes/lasty-dlya-bassejna','528','2016-11-05 17:17:25','2016-11-05 17:17:25'),(529,527,0,0,1,'Очки для плавания','ochki-dlya-plavaniya','/sportivnye-tovary/bassejn-i-akvafitnes/ochki-dlya-plavaniya','529','2016-11-05 17:17:25','2016-11-05 17:17:25'),(530,527,0,0,1,'Шапочки для плавания','shapochki-dlya-plavaniya','/sportivnye-tovary/bassejn-i-akvafitnes/shapochki-dlya-plavaniya','530','2016-11-05 17:17:25','2016-11-05 17:17:25'),(531,527,0,0,1,'Аксессуары для плавания','aksessuary-dlya-plavaniya','/sportivnye-tovary/bassejn-i-akvafitnes/aksessuary-dlya-plavaniya','531','2016-11-05 17:17:25','2016-11-05 17:17:25'),(532,453,0,0,1,'Зимние виды спорта','zimnie-vidy-sporta','/sportivnye-tovary/zimnie-vidy-sporta','533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,532','2016-11-05 17:17:58','2016-11-05 17:17:58'),(533,532,0,0,1,'Лыжи','lyzhi','/sportivnye-tovary/zimnie-vidy-sporta/lyzhi','533','2016-11-05 17:19:21','2016-11-05 17:19:21'),(534,532,0,0,1,'Лыжные палки','lyzhnye-palki','/sportivnye-tovary/zimnie-vidy-sporta/lyzhnye-palki','534','2016-11-05 17:19:21','2016-11-05 17:19:21'),(535,532,0,0,1,'Беговые ботинки','begovye-botinki','/sportivnye-tovary/zimnie-vidy-sporta/begovye-botinki','535','2016-11-05 17:19:21','2016-11-05 17:19:21'),(536,532,0,0,1,'Горнолыжные ботинки','gornolyzhnye-botinki','/sportivnye-tovary/zimnie-vidy-sporta/gornolyzhnye-botinki','536','2016-11-05 17:19:21','2016-11-05 17:19:21'),(537,532,0,0,1,'Лыжные крепления','lyzhnye-krepleniya','/sportivnye-tovary/zimnie-vidy-sporta/lyzhnye-krepleniya','537','2016-11-05 17:19:21','2016-11-05 17:19:21'),(538,532,0,0,1,'Коньки','konki','/sportivnye-tovary/zimnie-vidy-sporta/konki','538','2016-11-05 17:19:21','2016-11-05 17:19:21'),(539,532,0,0,1,'Клюшки','klyushki','/sportivnye-tovary/zimnie-vidy-sporta/klyushki','539','2016-11-05 17:19:21','2016-11-05 17:19:21'),(540,532,0,0,1,'Шайбы','shajby','/sportivnye-tovary/zimnie-vidy-sporta/shajby','540','2016-11-05 17:19:21','2016-11-05 17:19:21'),(541,532,0,0,1,'Хоккейная защита','xokkejnaya-zashhita','/sportivnye-tovary/zimnie-vidy-sporta/xokkejnaya-zashhita','541','2016-11-05 17:19:21','2016-11-05 17:19:21'),(542,532,0,0,1,'Форма для хоккея','forma-dlya-xokkeya','/sportivnye-tovary/zimnie-vidy-sporta/forma-dlya-xokkeya','542','2016-11-05 17:19:21','2016-11-05 17:19:21'),(543,532,0,0,1,'Санки и снегокаты','sanki-i-snegokaty','/sportivnye-tovary/zimnie-vidy-sporta/sanki-i-snegokaty','543','2016-11-05 17:19:21','2016-11-05 17:19:21'),(544,532,0,0,1,'Снегоступы','snegostupy','/sportivnye-tovary/zimnie-vidy-sporta/snegostupy','544','2016-11-05 17:19:21','2016-11-05 17:19:21'),(545,532,0,0,1,'Сноуборды','snoubordy','/sportivnye-tovary/zimnie-vidy-sporta/snoubordy','545','2016-11-05 17:19:22','2016-11-05 17:19:22'),(546,532,0,0,1,'Термобелье','termobele','/sportivnye-tovary/zimnie-vidy-sporta/termobele','546','2016-11-05 17:19:22','2016-11-05 17:19:22'),(547,532,0,0,1,'Универсальные головные уборы','universalnye-golovnye-ubory','/sportivnye-tovary/zimnie-vidy-sporta/universalnye-golovnye-ubory','547','2016-11-05 17:19:22','2016-11-05 17:19:22'),(548,532,0,0,1,'Аксессуары для зимнего спорта','aksessuary-dlya-zimnego-sporta','/sportivnye-tovary/zimnie-vidy-sporta/aksessuary-dlya-zimnego-sporta','548','2016-11-05 17:19:22','2016-11-05 17:19:22'),(549,453,0,0,1,'Бокс и единоборства','boks-i-edinoborstva','/sportivnye-tovary/boks-i-edinoborstva','550,551,552,553,554,555,556,557,549','2016-11-05 17:24:46','2016-11-05 17:24:46'),(550,549,0,0,1,'Мешки','meshki','/sportivnye-tovary/boks-i-edinoborstva/meshki','550','2016-11-05 17:25:45','2016-11-05 17:25:45'),(551,549,0,0,1,'Груши','grushi','/sportivnye-tovary/boks-i-edinoborstva/grushi','551','2016-11-05 17:25:45','2016-11-05 17:25:45'),(552,549,0,0,1,'Лапы, макивары','lapy-makivary','/sportivnye-tovary/boks-i-edinoborstva/lapy-makivary','552','2016-11-05 17:25:45','2016-11-05 17:25:45'),(553,549,0,0,1,'Формы','formy','/sportivnye-tovary/boks-i-edinoborstva/formy','553','2016-11-05 17:25:45','2016-11-05 17:25:45'),(554,549,0,0,1,'Перчатки','perchatki','/sportivnye-tovary/boks-i-edinoborstva/perchatki','554','2016-11-05 17:25:45','2016-11-05 17:25:45'),(555,549,0,0,1,'Шлемы','shlemy','/sportivnye-tovary/boks-i-edinoborstva/shlemy','555','2016-11-05 17:25:45','2016-11-05 17:25:45'),(556,549,0,0,1,'Защита','zashhita','/sportivnye-tovary/boks-i-edinoborstva/zashhita','556','2016-11-05 17:25:45','2016-11-05 17:25:45'),(557,549,0,0,1,'Аксессуары','aksessuary','/sportivnye-tovary/boks-i-edinoborstva/aksessuary','557','2016-11-05 17:25:45','2016-11-05 17:25:45'),(558,453,0,0,1,'Спортивные аксессуары','sportivnye-aksessuary','/sportivnye-tovary/sportivnye-aksessuary','559,560,561,562,563,564,565,566,567,558','2016-11-05 17:26:22','2016-11-05 17:26:22'),(559,558,0,0,1,'Спортивные сумки','sportivnye-sumki','/sportivnye-tovary/sportivnye-aksessuary/sportivnye-sumki','559','2016-11-05 17:27:27','2016-11-05 17:27:27'),(560,558,0,0,1,'Чехлы','chexly','/sportivnye-tovary/sportivnye-aksessuary/chexly','560','2016-11-05 17:27:27','2016-11-05 17:27:27'),(561,558,0,0,1,'Рюкзаки','ryukzaki','/sportivnye-tovary/sportivnye-aksessuary/ryukzaki','561','2016-11-05 17:27:27','2016-11-05 17:27:27'),(562,558,0,0,1,'Гермомешки','germomeshki','/sportivnye-tovary/sportivnye-aksessuary/germomeshki','562','2016-11-05 17:27:27','2016-11-05 17:27:27'),(563,558,0,0,1,'Спортивные бандажи, фиксаторы','sportivnye-bandazhi-fiksatory','/sportivnye-tovary/sportivnye-aksessuary/sportivnye-bandazhi-fiksatory','563','2016-11-05 17:27:27','2016-11-05 17:27:27'),(564,558,0,0,1,'Напульсники','napulsniki','/sportivnye-tovary/sportivnye-aksessuary/napulsniki','564','2016-11-05 17:27:27','2016-11-05 17:27:27'),(565,558,0,0,1,'Спортивные очки','sportivnye-ochki','/sportivnye-tovary/sportivnye-aksessuary/sportivnye-ochki','565','2016-11-05 17:27:28','2016-11-05 17:27:28'),(566,558,0,0,1,'Спортивные чехлы для телефонов','sportivnye-chexly-dlya-telefonov','/sportivnye-tovary/sportivnye-aksessuary/sportivnye-chexly-dlya-telefonov','566','2016-11-05 17:27:28','2016-11-05 17:27:28'),(567,558,0,0,1,'Наушники для спорта','naushniki-dlya-sporta','/sportivnye-tovary/sportivnye-aksessuary/naushniki-dlya-sporta','567','2016-11-05 17:27:28','2016-11-05 17:27:28'),(568,0,0,0,1,'Техника','texnika','/texnika','570,571,572,573,574,575,576,577,578,580,581,579,569,584,585,583,586,587,588,589,590,591,592,593,582,568','2016-11-05 17:28:52','2016-11-05 17:28:52'),(569,568,0,0,1,'Телефоны и гаджеты','telefony-i-gadzhety','/texnika/telefony-i-gadzhety','570,571,572,573,574,575,576,577,578,580,581,579,569','2016-11-05 17:29:48','2016-11-05 17:29:48'),(570,569,0,0,1,'Смартфоны','smartfony','/texnika/telefony-i-gadzhety/smartfony','570','2016-11-05 17:31:23','2016-11-05 17:31:23'),(571,569,0,0,1,'Мобильные телефоны','mobilnye-telefony','/texnika/telefony-i-gadzhety/mobilnye-telefony','571','2016-11-05 17:31:23','2016-11-05 17:31:23'),(572,569,0,0,1,'Планшеты','planshety','/texnika/telefony-i-gadzhety/planshety','572','2016-11-05 17:31:23','2016-11-05 17:31:23'),(573,569,0,0,1,'Смарт-часы','smart-chasy','/texnika/telefony-i-gadzhety/smart-chasy','573','2016-11-05 17:31:23','2016-11-05 17:31:23'),(574,569,0,0,1,'Игры и развлечения','igry-i-razvlecheniya','/texnika/telefony-i-gadzhety/igry-i-razvlecheniya','574','2016-11-05 17:31:23','2016-11-05 17:31:23'),(575,569,0,0,1,'Игровые консоли','igrovye-konsoli','/texnika/telefony-i-gadzhety/igrovye-konsoli','575','2016-11-05 17:31:23','2016-11-05 17:31:23'),(576,569,0,0,1,'Игры','igry','/texnika/telefony-i-gadzhety/igry','576','2016-11-05 17:31:23','2016-11-05 17:31:23'),(577,569,0,0,1,'Аксессуары','aksessuary','/texnika/telefony-i-gadzhety/aksessuary','577','2016-11-05 17:31:23','2016-11-05 17:31:23'),(578,569,0,0,1,'Мультимедиа','multimedia','/texnika/telefony-i-gadzhety/multimedia','578','2016-11-05 17:31:23','2016-11-05 17:31:23'),(579,569,0,0,1,'Фото и видео техника','foto-i-video-texnika','/texnika/telefony-i-gadzhety/foto-i-video-texnika','580,581,579','2016-11-05 17:31:23','2016-11-05 17:31:23'),(580,579,0,0,1,'Фотоаппараты','fotoapparaty','/texnika/telefony-i-gadzhety/foto-i-video-texnika/fotoapparaty','580','2016-11-05 17:32:15','2016-11-05 17:32:15'),(581,579,0,0,1,'Видеокамеры','videokamery','/texnika/telefony-i-gadzhety/foto-i-video-texnika/videokamery','581','2016-11-05 17:32:15','2016-11-05 17:32:15'),(582,568,0,0,1,'Аксессуары','aksessuary','/texnika/aksessuary','584,585,583,586,587,588,589,590,591,592,593,582','2016-11-05 17:33:11','2016-11-05 17:33:11'),(583,582,0,0,1,'Чехлы','chexly','/texnika/aksessuary/chexly','584,585,583','2016-11-05 17:34:26','2016-11-05 17:34:26'),(584,583,0,0,1,'Для планшетов','dlya-planshetov','/texnika/aksessuary/chexly/dlya-planshetov','584','2016-11-05 17:35:06','2016-11-05 17:35:06'),(585,583,0,0,1,'Для телефонов','dlya-telefonov','/texnika/aksessuary/chexly/dlya-telefonov','585','2016-11-05 17:35:06','2016-11-05 17:35:06'),(586,582,0,0,1,'Зарядные устройства','zaryadnye-ustrojstva','/texnika/aksessuary/zaryadnye-ustrojstva','586','2016-11-05 17:36:07','2016-11-05 17:36:07'),(587,582,0,0,1,'Внешние жесткие диски','vneshnie-zhestkie-diski','/texnika/aksessuary/vneshnie-zhestkie-diski','587','2016-11-05 17:36:07','2016-11-05 17:36:07'),(588,582,0,0,1,'Кабели','kabeli','/texnika/aksessuary/kabeli','588','2016-11-05 17:36:07','2016-11-05 17:36:07'),(589,582,0,0,1,'Защитные пленки','zashhitnye-plenki','/texnika/aksessuary/zashhitnye-plenki','589','2016-11-05 17:36:07','2016-11-05 17:36:07'),(590,582,0,0,1,'Гарнитуры','garnitury','/texnika/aksessuary/garnitury','590','2016-11-05 17:36:07','2016-11-05 17:36:07'),(591,582,0,0,1,'Колонки','kolonki','/texnika/aksessuary/kolonki','591','2016-11-05 17:36:07','2016-11-05 17:36:07'),(592,582,0,0,1,'Моноподы','monopody','/texnika/aksessuary/monopody','592','2016-11-05 17:36:07','2016-11-05 17:36:07'),(593,582,0,0,1,'Элементы питания','elementy-pitaniya','/texnika/aksessuary/elementy-pitaniya','593','2016-11-05 17:36:07','2016-11-05 17:36:07'),(594,0,0,0,1,'Табачные изделия','tabachnye-izdeliya','/tabachnye-izdeliya','595,596,594','2016-11-05 17:36:53','2016-11-05 17:36:53'),(595,594,0,0,1,'Электронные сигареты','elektronnye-sigarety','/tabachnye-izdeliya/elektronnye-sigarety','595','2016-11-05 17:37:46','2016-11-05 17:37:46'),(596,594,0,0,1,'Аксессуары для сигарет','aksessuary-dlya-sigaret','/tabachnye-izdeliya/aksessuary-dlya-sigaret','596','2016-11-05 17:37:46','2016-11-05 17:37:46'),(597,0,0,0,1,'Зоотовары','zootovary','/zootovary','600,601,602,603,604,599,606,607,605,609,610,611,608,613,614,615,612,617,618,619,620,621,616,623,624,625,626,627,628,629,663,664,665,666,667,668,669,670,671,672,673,674,675,676,622,598,638,639,637,641,642,643,640,645,646,647,644,649,650,651,652,653,648,655,656,657,658,659,660,661,654,630,632,633,634,635,636,631,662,597','2016-11-05 17:38:19','2016-11-05 17:38:19'),(598,597,0,0,1,'Для котов','dlya-kotov','/zootovary/dlya-kotov','600,601,602,603,604,599,606,607,605,609,610,611,608,613,614,615,612,617,618,619,620,621,616,623,624,625,626,627,628,629,663,664,665,666,667,668,669,670,671,672,673,674,675,676,622,598','2016-11-05 17:39:21','2016-11-05 17:39:21'),(599,598,0,0,1,'Кормление','kormlenie','/zootovary/dlya-kotov/kormlenie','600,601,602,603,604,599','2016-11-05 17:40:29','2016-11-05 17:40:29'),(600,599,0,0,1,'Сухой корм','suxoj-korm','/zootovary/dlya-kotov/kormlenie/suxoj-korm','600','2016-11-05 17:41:22','2016-11-05 17:41:22'),(601,599,0,0,1,'Консервы','konservy','/zootovary/dlya-kotov/kormlenie/konservy','601','2016-11-05 17:41:22','2016-11-05 17:41:22'),(602,599,0,0,1,'Заменители молока','zameniteli-moloka','/zootovary/dlya-kotov/kormlenie/zameniteli-moloka','602','2016-11-05 17:41:22','2016-11-05 17:41:22'),(603,599,0,0,1,'Кости и лакомства','kosti-i-lakomstva','/zootovary/dlya-kotov/kormlenie/kosti-i-lakomstva','603','2016-11-05 17:41:22','2016-11-05 17:41:22'),(604,599,0,0,1,'Посуда','posuda','/zootovary/dlya-kotov/kormlenie/posuda','604','2016-11-05 17:41:22','2016-11-05 17:41:22'),(605,598,0,0,1,'Здоровье','zdorove','/zootovary/dlya-kotov/zdorove','606,607,605','2016-11-05 17:41:56','2016-11-05 17:41:56'),(606,605,0,0,1,'Витамины и добавки','vitaminy-i-dobavki','/zootovary/dlya-kotov/zdorove/vitaminy-i-dobavki','606','2016-11-05 17:42:39','2016-11-05 17:42:39'),(607,605,0,0,1,'Средства от блох и клещей','sredstva-ot-blox-i-kleshhej','/zootovary/dlya-kotov/zdorove/sredstva-ot-blox-i-kleshhej','607','2016-11-05 17:42:39','2016-11-05 17:42:39'),(608,598,0,0,1,'Лотки','lotki','/zootovary/dlya-kotov/lotki','609,610,611,608','2016-11-05 17:44:19','2016-11-05 17:44:19'),(609,608,0,0,1,'Наполнители туалетов','napolniteli-tualetov','/zootovary/dlya-kotov/lotki/napolniteli-tualetov','609','2016-11-05 17:45:00','2016-11-05 17:45:00'),(610,608,0,0,1,'Туалеты','tualety','/zootovary/dlya-kotov/lotki/tualety','610','2016-11-05 17:45:00','2016-11-05 17:45:00'),(611,608,0,0,1,'Пленки','plenki','/zootovary/dlya-kotov/lotki/plenki','611','2016-11-05 17:45:01','2016-11-05 17:45:01'),(612,598,0,0,1,'Средства по уходу','sredstva-po-uxodu','/zootovary/dlya-kotov/sredstva-po-uxodu','613,614,615,612','2016-11-05 17:45:32','2016-11-05 17:45:32'),(613,612,0,0,1,'Уход за шерстью и когтями','uxod-za-sherstyu-i-kogtyami','/zootovary/dlya-kotov/sredstva-po-uxodu/uxod-za-sherstyu-i-kogtyami','613','2016-11-05 17:46:20','2016-11-05 17:46:20'),(614,612,0,0,1,'Уход за полостью рта','uxod-za-polostyu-rta','/zootovary/dlya-kotov/sredstva-po-uxodu/uxod-za-polostyu-rta','614','2016-11-05 17:46:20','2016-11-05 17:46:20'),(615,612,0,0,1,'Уход за ушами','uxod-za-ushami','/zootovary/dlya-kotov/sredstva-po-uxodu/uxod-za-ushami','615','2016-11-05 17:46:20','2016-11-05 17:46:20'),(616,598,0,0,1,'Для прогулок и путешествий','dlya-progulok-i-puteshestvij','/zootovary/dlya-kotov/dlya-progulok-i-puteshestvij','617,618,619,620,621,616','2016-11-05 17:46:51','2016-11-05 17:46:51'),(617,616,0,0,1,'Поводки','povodki','/zootovary/dlya-kotov/dlya-progulok-i-puteshestvij/povodki','617','2016-11-05 17:47:50','2016-11-05 17:47:50'),(618,616,0,0,1,'Ошейники','oshejniki','/zootovary/dlya-kotov/dlya-progulok-i-puteshestvij/oshejniki','618','2016-11-05 17:47:50','2016-11-05 17:47:50'),(619,616,0,0,1,'Переноски и сумки','perenoski-i-sumki','/zootovary/dlya-kotov/dlya-progulok-i-puteshestvij/perenoski-i-sumki','619','2016-11-05 17:47:50','2016-11-05 17:47:50'),(620,616,0,0,1,'Амуниция и аксессуары','amuniciya-i-aksessuary','/zootovary/dlya-kotov/dlya-progulok-i-puteshestvij/amuniciya-i-aksessuary','620','2016-11-05 17:47:50','2016-11-05 17:47:50'),(621,616,0,0,1,'Одежда','odezhda','/zootovary/dlya-kotov/dlya-progulok-i-puteshestvij/odezhda','621','2016-11-05 17:47:51','2016-11-05 17:47:51'),(622,598,0,0,1,'Дом и уют','dom-i-uyut','/zootovary/dlya-kotov/dom-i-uyut','623,624,625,626,627,628,629,663,664,665,666,667,668,669,670,671,672,673,674,675,676,622','2016-11-05 17:48:26','2016-11-05 17:48:26'),(623,622,0,0,1,'Переноски','perenoski','/zootovary/dlya-kotov/dom-i-uyut/perenoski','623','2016-11-05 17:49:18','2016-11-05 17:49:18'),(624,622,0,0,1,'Будки','budki','/zootovary/dlya-kotov/dom-i-uyut/budki','624','2016-11-05 17:49:18','2016-11-05 17:49:18'),(625,622,0,0,1,'Вольеры','volery','/zootovary/dlya-kotov/dom-i-uyut/volery','625','2016-11-05 17:49:18','2016-11-05 17:49:18'),(626,622,0,0,1,'Загоны','zagony','/zootovary/dlya-kotov/dom-i-uyut/zagony','626','2016-11-05 17:49:18','2016-11-05 17:49:18'),(627,622,0,0,1,'Мягкие места и домики','myagkie-mesta-i-domiki','/zootovary/dlya-kotov/dom-i-uyut/myagkie-mesta-i-domiki','627','2016-11-05 17:49:18','2016-11-05 17:49:18'),(628,622,0,0,1,'Когтеточки','kogtetochki','/zootovary/dlya-kotov/dom-i-uyut/kogtetochki','628','2016-11-05 17:49:18','2016-11-05 17:49:18'),(629,622,0,0,1,'Игрушки','igrushki','/zootovary/dlya-kotov/dom-i-uyut/igrushki','629','2016-11-05 17:49:18','2016-11-05 17:49:18'),(630,597,0,0,1,'Для собак','dlya-sobak','/zootovary/dlya-sobak','638,639,637,641,642,643,640,645,646,647,644,649,650,651,652,653,648,655,656,657,658,659,660,661,654,630','2016-11-05 17:50:04','2016-11-05 17:50:04'),(631,597,0,0,1,'Кормление','kormlenie','/zootovary/dlya-sobak/kormlenie','632,633,634,635,636,631','2016-11-05 17:50:49','2016-11-05 17:50:49'),(632,631,0,0,1,'Сухой корм','suxoj-korm','/zootovary/dlya-sobak/kormlenie/suxoj-korm','632','2016-11-05 17:51:43','2016-11-05 17:51:43'),(633,631,0,0,1,'Консервы','konservy','/zootovary/dlya-sobak/kormlenie/konservy','633','2016-11-05 17:51:43','2016-11-05 17:51:43'),(634,631,0,0,1,'Заменители молока','zameniteli-moloka','/zootovary/dlya-sobak/kormlenie/zameniteli-moloka','634','2016-11-05 17:51:43','2016-11-05 17:51:43'),(635,631,0,0,1,'Кости и лакомства','kosti-i-lakomstva','/zootovary/dlya-sobak/kormlenie/kosti-i-lakomstva','635','2016-11-05 17:51:43','2016-11-05 17:51:43'),(636,631,0,0,1,'Посуда','posuda','/zootovary/dlya-sobak/kormlenie/posuda','636','2016-11-05 17:51:43','2016-11-05 17:51:43'),(637,630,0,0,1,'Здоровье','zdorove','/zootovary/dlya-sobak/zdorove','638,639,637','2016-11-05 17:52:14','2016-11-05 17:52:14'),(638,637,0,0,1,'Витамины и добавки','vitaminy-i-dobavki','/zootovary/dlya-sobak/zdorove/vitaminy-i-dobavki','638','2016-11-05 17:52:53','2016-11-05 17:52:53'),(639,637,0,0,1,'Средства от блох и клещей','sredstva-ot-blox-i-kleshhej','/zootovary/dlya-sobak/zdorove/sredstva-ot-blox-i-kleshhej','639','2016-11-05 17:52:53','2016-11-05 17:52:53'),(640,630,0,0,1,'Лотки','lotki','/zootovary/dlya-sobak/lotki','641,642,643,640','2016-11-05 17:53:21','2016-11-05 17:53:21'),(641,640,0,0,1,'Наполнители туалетов','napolniteli-tualetov','/zootovary/dlya-sobak/lotki/napolniteli-tualetov','641','2016-11-05 17:54:00','2016-11-05 17:54:00'),(642,640,0,0,1,'Туалеты','tualety','/zootovary/dlya-sobak/lotki/tualety','642','2016-11-05 17:54:00','2016-11-05 17:54:00'),(643,640,0,0,1,'Пленки','plenki','/zootovary/dlya-sobak/lotki/plenki','643','2016-11-05 17:54:01','2016-11-05 17:54:01'),(644,630,0,0,1,'Средства по уходу','sredstva-po-uxodu','/zootovary/dlya-sobak/sredstva-po-uxodu','645,646,647,644','2016-11-05 17:54:28','2016-11-05 17:54:28'),(645,644,0,0,1,'Уход за шерстью и когтями','uxod-za-sherstyu-i-kogtyami','/zootovary/dlya-sobak/sredstva-po-uxodu/uxod-za-sherstyu-i-kogtyami','645','2016-11-05 17:55:04','2016-11-05 17:55:04'),(646,644,0,0,1,'Уход за полостью рта','uxod-za-polostyu-rta','/zootovary/dlya-sobak/sredstva-po-uxodu/uxod-za-polostyu-rta','646','2016-11-05 17:55:04','2016-11-05 17:55:04'),(647,644,0,0,1,'Уход за ушами','uxod-za-ushami','/zootovary/dlya-sobak/sredstva-po-uxodu/uxod-za-ushami','647','2016-11-05 17:55:04','2016-11-05 17:55:04'),(648,630,0,0,1,'Для прогулок и путешествий','dlya-progulok-i-puteshestvij','/zootovary/dlya-sobak/dlya-progulok-i-puteshestvij','649,650,651,652,653,648','2016-11-05 17:55:36','2016-11-05 17:55:36'),(649,648,0,0,1,'Поводки','povodki','/zootovary/dlya-sobak/dlya-progulok-i-puteshestvij/povodki','649','2016-11-05 17:56:28','2016-11-05 17:56:28'),(650,648,0,0,1,'Ошейники','oshejniki','/zootovary/dlya-sobak/dlya-progulok-i-puteshestvij/oshejniki','650','2016-11-05 17:56:28','2016-11-05 17:56:28'),(651,648,0,0,1,'Переноски и сумки','perenoski-i-sumki','/zootovary/dlya-sobak/dlya-progulok-i-puteshestvij/perenoski-i-sumki','651','2016-11-05 17:56:28','2016-11-05 17:56:28'),(652,648,0,0,1,'Амуниция и аксессуары','amuniciya-i-aksessuary','/zootovary/dlya-sobak/dlya-progulok-i-puteshestvij/amuniciya-i-aksessuary','652','2016-11-05 17:56:28','2016-11-05 17:56:28'),(653,648,0,0,1,'Одежда','odezhda','/zootovary/dlya-sobak/dlya-progulok-i-puteshestvij/odezhda','653','2016-11-05 17:56:28','2016-11-05 17:56:28'),(654,630,0,0,1,'Дом и уют','dom-i-uyut','/zootovary/dlya-sobak/dom-i-uyut','655,656,657,658,659,660,661,654','2016-11-05 17:56:55','2016-11-05 17:56:55'),(655,654,0,0,1,'Переноски','perenoski','/zootovary/dlya-sobak/dom-i-uyut/perenoski','655','2016-11-05 17:58:22','2016-11-05 17:58:22'),(656,654,0,0,1,'Будки','budki','/zootovary/dlya-sobak/dom-i-uyut/budki','656','2016-11-05 17:58:22','2016-11-05 17:58:22'),(657,654,0,0,1,'Вольеры','volery','/zootovary/dlya-sobak/dom-i-uyut/volery','657','2016-11-05 17:58:22','2016-11-05 17:58:22'),(658,654,0,0,1,'Загоны','zagony','/zootovary/dlya-sobak/dom-i-uyut/zagony','658','2016-11-05 17:58:22','2016-11-05 17:58:22'),(659,654,0,0,1,'Мягкие места и домики','myagkie-mesta-i-domiki','/zootovary/dlya-sobak/dom-i-uyut/myagkie-mesta-i-domiki','659','2016-11-05 17:58:22','2016-11-05 17:58:22'),(660,654,0,0,1,'Когтеточки','kogtetochki','/zootovary/dlya-sobak/dom-i-uyut/kogtetochki','660','2016-11-05 17:58:22','2016-11-05 17:58:22'),(661,654,0,0,1,'Игрушки','igrushki','/zootovary/dlya-sobak/dom-i-uyut/igrushki','661','2016-11-05 17:58:22','2016-11-05 17:58:22'),(662,597,0,0,1,'Аквариумы','akvariumy','/zootovary/akvariumy','662','2016-11-05 17:59:04','2016-11-05 17:59:04'),(663,622,0,0,1,'Корм','korm','/zootovary/akvariumy/korm','663','2016-11-05 18:00:21','2016-11-05 18:00:21'),(664,622,0,0,1,'Аквариумные наборы','akvariumnye-nabory','/zootovary/akvariumy/akvariumnye-nabory','664','2016-11-05 18:00:21','2016-11-05 18:00:21'),(665,622,0,0,1,'Тумбы','tumby','/zootovary/akvariumy/tumby','665','2016-11-05 18:00:21','2016-11-05 18:00:21'),(666,622,0,0,1,'Крышки','kryshki','/zootovary/akvariumy/kryshki','666','2016-11-05 18:00:21','2016-11-05 18:00:21'),(667,622,0,0,1,'Оборудование для аквариумов','oborudovanie-dlya-akvariumov','/zootovary/akvariumy/oborudovanie-dlya-akvariumov','667','2016-11-05 18:00:21','2016-11-05 18:00:21'),(668,622,0,0,1,'Обогрев и охлаждение','obogrev-i-oxlazhdenie','/zootovary/akvariumy/obogrev-i-oxlazhdenie','668','2016-11-05 18:00:21','2016-11-05 18:00:21'),(669,622,0,0,1,'Фильтры','filtry','/zootovary/akvariumy/filtry','669','2016-11-05 18:00:21','2016-11-05 18:00:21'),(670,622,0,0,1,'Дополнительное оборудование для аквариумов','dopolnitelnoe-oborudovanie-dlya-akvariumov','/zootovary/akvariumy/dopolnitelnoe-oborudovanie-dlya-akvariumov','670','2016-11-05 18:00:21','2016-11-05 18:00:21'),(671,622,0,0,1,'Освещение','osveshhenie','/zootovary/akvariumy/osveshhenie','671','2016-11-05 18:00:21','2016-11-05 18:00:21'),(672,622,0,0,1,'Измерительные приборы','izmeritelnye-pribory','/zootovary/akvariumy/izmeritelnye-pribory','672','2016-11-05 18:00:21','2016-11-05 18:00:21'),(673,622,0,0,1,'Аксессуары к аквариумному оборудованию','aksessuary-k-akvariumnomu-oborudovaniyu','/zootovary/akvariumy/aksessuary-k-akvariumnomu-oborudovaniyu','673','2016-11-05 18:00:21','2016-11-05 18:00:21'),(674,622,0,0,1,'Декорации','dekoracii','/zootovary/akvariumy/dekoracii','674','2016-11-05 18:00:21','2016-11-05 18:00:21'),(675,622,0,0,1,'Грунты','grunty','/zootovary/akvariumy/grunty','675','2016-11-05 18:00:21','2016-11-05 18:00:21'),(676,622,0,0,1,'Аквариумная химия','akvariumnaya-ximiya','/zootovary/akvariumy/akvariumnaya-ximiya','676','2016-11-05 18:00:21','2016-11-05 18:00:21'),(677,0,0,0,1,'Огртехника','ogrtexnika','/ogrtexnika','678,679,680,681,682,683,684,677','2016-11-05 18:01:08','2016-11-05 18:01:08'),(678,677,0,0,1,'Клавиатуры','klaviatury','/ogrtexnika/klaviatury','678','2016-11-05 18:02:11','2016-11-05 18:02:11'),(679,677,0,0,1,'Ленты для принтера','lenty-dlya-printera','/ogrtexnika/lenty-dlya-printera','679','2016-11-05 18:02:11','2016-11-05 18:02:11'),(680,677,0,0,1,'Маршрутизаторы','marshrutizatory','/ogrtexnika/marshrutizatory','680','2016-11-05 18:02:11','2016-11-05 18:02:11'),(681,677,0,0,1,'МФУ','mfu','/ogrtexnika/mfu','681','2016-11-05 18:02:11','2016-11-05 18:02:11'),(682,677,0,0,1,'Мыши','myshi','/ogrtexnika/myshi','682','2016-11-05 18:02:11','2016-11-05 18:02:11'),(683,677,0,0,1,'Принтеры','printery','/ogrtexnika/printery','683','2016-11-05 18:02:11','2016-11-05 18:02:11'),(684,677,0,0,1,'Умный дом','umnyj-dom','/ogrtexnika/umnyj-dom','684','2016-11-05 18:02:11','2016-11-05 18:02:11'),(685,0,0,0,1,'Хобби и Творчество','xobbi-i-tvorchestvo','/xobbi-i-tvorchestvo','686,687,688,689,690,685','2016-11-05 18:03:14','2016-11-05 18:03:14'),(686,685,0,0,1,'Лепка','lepka','/xobbi-i-tvorchestvo/lepka','686','2016-11-05 18:04:09','2016-11-05 18:04:09'),(687,685,0,0,1,'Пазлы','pazly','/xobbi-i-tvorchestvo/pazly','687','2016-11-05 18:04:09','2016-11-05 18:04:09'),(688,685,0,0,1,'Модели для склеивания','modeli-dlya-skleivaniya','/xobbi-i-tvorchestvo/modeli-dlya-skleivaniya','688','2016-11-05 18:04:09','2016-11-05 18:04:09'),(689,685,0,0,1,'Прочие наборы для творчества','prochie-nabory-dlya-tvorchestva','/xobbi-i-tvorchestvo/prochie-nabory-dlya-tvorchestva','689','2016-11-05 18:04:09','2016-11-05 18:04:09'),(690,685,0,0,1,'Рукоделие','rukodelie','/xobbi-i-tvorchestvo/rukodelie','690','2016-11-05 18:04:09','2016-11-05 18:04:09');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category2feature_group`
--

DROP TABLE IF EXISTS `category2feature_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category2feature_group` (
  `category_id` int(10) unsigned NOT NULL,
  `feature_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `fk_category2feature_group_2_idx` (`feature_group_id`),
  CONSTRAINT `fk_category2feature_group_1` FOREIGN KEY (`category_id`) REFERENCES `category3` (`category_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_category2feature_group_2` FOREIGN KEY (`feature_group_id`) REFERENCES `feature_group` (`feature_group_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category2feature_group`
--

LOCK TABLES `category2feature_group` WRITE;
/*!40000 ALTER TABLE `category2feature_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `category2feature_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category3`
--

DROP TABLE IF EXISTS `category3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category3` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `overflow` int(1) NOT NULL DEFAULT '0' COMMENT '0 - hidden\n1 - visible',
  `title` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `url2site` varchar(1000) NOT NULL,
  `instr` text NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  KEY `index2` (`category_id`,`parent_id`,`overflow`,`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category3`
--

LOCK TABLES `category3` WRITE;
/*!40000 ALTER TABLE `category3` DISABLE KEYS */;
INSERT INTO `category3` VALUES (1,0,0,0,'Одежда и обувь ','clothes-and-shoes','/clothes-and-shoes','70,17,59,47,22,98,71,72,91,96,9,62,69,12,37,66,18,23,121,2,68,78,26,118,116,28,97,75,117,107,65,58,39,74,44,30,80,114,32,20,108,60,84,76,81,5,15,82,99,83,64,57,7,79,119,21,46,88,25,53,48,100,92,93,42,51,104,86,105,16,87,13,89,120,43,50,19,106,85,122,77,52,115,90,111,73,35,123,3,6,31,54,112,11,67,94,109,110,95,8,61,40,63,38,113,34,102,49,33,24,14,4,41,29,27,45,10,103,55,101,56,36','2016-08-05 16:50:11','2016-08-05 16:50:11'),(2,1,0,0,'Он','he','/clothes-and-shoes/he','17,22,21,25,9,42,12,16,37,23,18,13,19,26,35,28,3,6,31,11,39,30,8,32,40,38,20,34,33,24,15,5,14,4,27,41,10,29,36,7','2016-08-05 16:50:11','2016-08-05 16:50:11'),(3,2,0,0,'Одежда','clothing','/clothes-and-shoes/he/clothing','22,21,17,6,9,11,8,16,20,12,13,18,10,19,14,4,5,15,7','2016-08-05 16:50:11','2016-08-05 16:50:11'),(4,3,0,0,'Куртки, плащи','jackets-raincoats','/clothes-and-shoes/he/clothing/jackets-raincoats','4','2016-08-05 16:50:11','2016-08-05 16:50:11'),(5,3,0,0,'Поло','polo','/clothes-and-shoes/he/clothing/polo','5','2016-08-05 16:50:11','2016-08-05 16:50:11'),(6,3,0,0,'Футболки','t-shirt','/clothes-and-shoes/he/clothing/t-shirt','6','2016-08-05 16:50:11','2016-08-05 16:50:11'),(7,3,0,0,'Рубашки','shirt','/clothes-and-shoes/he/clothing/shirt','7','2016-08-05 16:50:12','2016-08-05 16:50:12'),(8,3,0,0,'Пиджаки','jackets','/clothes-and-shoes/he/clothing/jackets','8','2016-08-05 16:50:12','2016-08-05 16:50:12'),(9,3,0,0,'Кофты','jackets','/clothes-and-shoes/he/clothing/jackets','9','2016-08-05 16:50:12','2016-08-05 16:50:12'),(10,3,0,0,'Свитера','sweaters','/clothes-and-shoes/he/clothing/sweaters','10','2016-08-05 16:50:12','2016-08-05 16:50:12'),(11,3,0,0,'Толстовки','hoodies','/clothes-and-shoes/he/clothing/hoodies','11','2016-08-05 16:50:12','2016-08-05 16:50:12'),(12,3,0,0,'Пиджаки, костюмы','jackets-suits','/clothes-and-shoes/he/clothing/jackets-suits','12','2016-08-05 16:50:12','2016-08-05 16:50:12'),(13,3,0,0,'Брюки','pants','/clothes-and-shoes/he/clothing/pants','13','2016-08-05 16:50:12','2016-08-05 16:50:12'),(14,3,0,0,'Джинсы','jeans','/clothes-and-shoes/he/clothing/jeans','14','2016-08-05 16:50:12','2016-08-05 16:50:12'),(15,3,0,0,'Шорты','shorts','/clothes-and-shoes/he/clothing/shorts','15','2016-08-05 16:50:13','2016-08-05 16:50:13'),(16,3,0,0,'Майки','mikey','/clothes-and-shoes/he/clothing/mikey','16','2016-08-05 16:50:13','2016-08-05 16:50:13'),(17,3,0,0,'Тенниски','t-shirt','/clothes-and-shoes/he/clothing/t-shirt','17','2016-08-05 16:50:13','2016-08-05 16:50:13'),(18,3,0,0,'Регланы','jerseys','/clothes-and-shoes/he/clothing/jerseys','18','2016-08-05 16:50:13','2016-08-05 16:50:13'),(19,3,0,0,'Одежда для сна','sleepwear','/clothes-and-shoes/he/clothing/sleepwear','19','2016-08-05 16:50:13','2016-08-05 16:50:13'),(20,3,0,0,'Спортивные костюмы','tracksuits','/clothes-and-shoes/he/clothing/tracksuits','20','2016-08-05 16:50:13','2016-08-05 16:50:13'),(21,3,0,0,'Спортивные штаны','sweat-pants','/clothes-and-shoes/he/clothing/sweat-pants','21','2016-08-05 16:50:13','2016-08-05 16:50:13'),(22,3,0,0,'Трусы, носки','underwear-socks','/clothes-and-shoes/he/clothing/underwear-socks','22','2016-08-05 16:50:14','2016-08-05 16:50:14'),(23,2,0,0,'Обувь','shoes','/clothes-and-shoes/he/shoes','24,30,29,27,28,25,26','2016-08-05 16:50:14','2016-08-05 16:50:14'),(24,23,0,0,'Туфли','shoes','/clothes-and-shoes/he/shoes/shoes','24','2016-08-05 16:50:14','2016-08-05 16:50:14'),(25,23,0,0,'Ботинки','shoes','/clothes-and-shoes/he/shoes/shoes','25','2016-08-05 16:50:14','2016-08-05 16:50:14'),(26,23,0,0,'Кроссовки, кеды','running-shoes-sneakers','/clothes-and-shoes/he/shoes/running-shoes-sneakers','26','2016-08-05 16:50:14','2016-08-05 16:50:14'),(27,23,0,0,'Шлепанцы','slippers','/clothes-and-shoes/he/shoes/slippers','27','2016-08-05 16:50:14','2016-08-05 16:50:14'),(28,23,0,0,'Сандалии','sandals','/clothes-and-shoes/he/shoes/sandals','28','2016-08-05 16:50:14','2016-08-05 16:50:14'),(29,23,0,0,'Сапоги','boots','/clothes-and-shoes/he/shoes/boots','29','2016-08-05 16:50:15','2016-08-05 16:50:15'),(30,23,0,0,'Тапочки','slippers','/clothes-and-shoes/he/shoes/slippers','30','2016-08-05 16:50:15','2016-08-05 16:50:15'),(31,2,0,0,'Аксессуары','accessories','/clothes-and-shoes/he/accessories','40,32,37,38,35,34,39,33,41,42,36','2016-08-05 16:50:15','2016-08-05 16:50:15'),(32,31,0,0,'Головные уборы','hats','/clothes-and-shoes/he/accessories/hats','32','2016-08-05 16:50:15','2016-08-05 16:50:15'),(33,31,0,0,'Галстуки','ties','/clothes-and-shoes/he/accessories/ties','33','2016-08-05 16:50:15','2016-08-05 16:50:15'),(34,31,0,0,'Запонки','cufflinks','/clothes-and-shoes/he/accessories/cufflinks','34','2016-08-05 16:50:15','2016-08-05 16:50:15'),(35,31,0,0,'Зонты','umbrellas','/clothes-and-shoes/he/accessories/umbrellas','35','2016-08-05 16:50:15','2016-08-05 16:50:15'),(36,31,0,0,'Портмоне, обложки для документов, визитницы','purses-covers-for-documents-business-card-holders','/clothes-and-shoes/he/accessories/purses-covers-for-documents-business-card-holders','36','2016-08-05 16:50:15','2016-08-05 16:50:15'),(37,31,0,0,'Очки','glasses','/clothes-and-shoes/he/accessories/glasses','37','2016-08-05 16:50:15','2016-08-05 16:50:15'),(38,31,0,0,'Перчатки','gloves','/clothes-and-shoes/he/accessories/gloves','38','2016-08-05 16:50:16','2016-08-05 16:50:16'),(39,31,0,0,'Ремни','straps','/clothes-and-shoes/he/accessories/straps','39','2016-08-05 16:50:16','2016-08-05 16:50:16'),(40,31,0,0,'Сумки, рюкзаки','bags-backpacks','/clothes-and-shoes/he/accessories/bags-backpacks','40','2016-08-05 16:50:16','2016-08-05 16:50:16'),(41,31,0,0,'Часы','watch','/clothes-and-shoes/he/accessories/watch','41','2016-08-05 16:50:16','2016-08-05 16:50:16'),(42,31,0,0,'Шарфы','scarves','/clothes-and-shoes/he/accessories/scarves','42','2016-08-05 16:50:16','2016-08-05 16:50:16'),(43,1,0,0,'Она','she','/clothes-and-shoes/she','45,82,49,81,64,57,56,83,55,63,61,76,84,60,44,94,74,67,58,80,73,90,65,54,75,50,89,52,78,85,77,68,86,51,66,87,62,72,91,48,69,93,92,47,59,79,70,71,53,88,46','2016-08-05 16:50:16','2016-08-05 16:50:16'),(44,43,0,0,'Одежда','clothing','/clothes-and-shoes/she/clothing','50,49,45,55,52,57,64,56,61,51,63,60,48,58,62,47,59,46,65,53,54','2016-08-05 16:50:16','2016-08-05 16:50:16'),(45,44,0,0,'Куртки и плащи','jackets-and-coats','/clothes-and-shoes/she/clothing/jackets-and-coats','45','2016-08-05 16:50:17','2016-08-05 16:50:17'),(46,44,0,0,'Платья','dresses','/clothes-and-shoes/she/clothing/dresses','46','2016-08-05 16:50:17','2016-08-05 16:50:17'),(47,44,0,0,'Рубашки','shirt','/clothes-and-shoes/she/clothing/shirt','47','2016-08-05 16:50:17','2016-08-05 16:50:17'),(48,44,0,0,'Свитера','sweaters','/clothes-and-shoes/she/clothing/sweaters','48','2016-08-05 16:50:17','2016-08-05 16:50:17'),(49,44,0,0,'Футболки','t-shirt','/clothes-and-shoes/she/clothing/t-shirt','49','2016-08-05 16:50:17','2016-08-05 16:50:17'),(50,44,0,0,'Кофты','jackets','/clothes-and-shoes/she/clothing/jackets','50','2016-08-05 16:50:17','2016-08-05 16:50:17'),(51,44,0,0,'Брюки','pants','/clothes-and-shoes/she/clothing/pants','51','2016-08-05 16:50:17','2016-08-05 16:50:17'),(52,44,0,0,'Джинсы','jeans','/clothes-and-shoes/she/clothing/jeans','52','2016-08-05 16:50:18','2016-08-05 16:50:18'),(53,44,0,0,'Шорты','shorts','/clothes-and-shoes/she/clothing/shorts','53','2016-08-05 16:50:18','2016-08-05 16:50:18'),(54,44,0,0,'Пиджаки','jackets','/clothes-and-shoes/she/clothing/jackets','54','2016-08-05 16:50:18','2016-08-05 16:50:18'),(55,44,0,0,'Блузы','blouses','/clothes-and-shoes/she/clothing/blouses','55','2016-08-05 16:50:18','2016-08-05 16:50:18'),(56,44,0,0,'Юбки','skirts','/clothes-and-shoes/she/clothing/skirts','56','2016-08-05 16:50:18','2016-08-05 16:50:18'),(57,44,0,0,'Леггенсы, лосины','leggins-tights','/clothes-and-shoes/she/clothing/leggins-tights','57','2016-08-05 16:50:18','2016-08-05 16:50:18'),(58,44,0,0,'Белье','linen','/clothes-and-shoes/she/clothing/linen','61,59,60','2016-08-05 16:50:18','2016-08-05 16:50:18'),(59,58,0,0,'Комплекты','kits','/clothes-and-shoes/she/clothing/linen/kits','59','2016-08-05 16:50:18','2016-08-05 16:50:18'),(60,58,0,0,'Бюстгалтеры','bras','/clothes-and-shoes/she/clothing/linen/bras','60','2016-08-05 16:50:19','2016-08-05 16:50:19'),(61,58,0,0,'Трусы','briefs','/clothes-and-shoes/she/clothing/linen/briefs','61','2016-08-05 16:50:19','2016-08-05 16:50:19'),(62,44,0,0,'Колготы, носки','tights-socks','/clothes-and-shoes/she/clothing/tights-socks','62','2016-08-05 16:50:19','2016-08-05 16:50:19'),(63,44,0,0,'Одежда для сна','sleepwear','/clothes-and-shoes/she/clothing/sleepwear','63','2016-08-05 16:50:19','2016-08-05 16:50:19'),(64,44,0,0,'Одежда для дома','clothing-for-home','/clothes-and-shoes/she/clothing/clothing-for-home','64','2016-08-05 16:50:19','2016-08-05 16:50:19'),(65,44,0,0,'Спортивная одежда','sports-wear','/clothes-and-shoes/she/clothing/sports-wear','65','2016-08-05 16:50:19','2016-08-05 16:50:19'),(66,43,0,0,'Обувь','shoes','/clothes-and-shoes/she/shoes','69,68,74,72,67,76,71,75,70,73','2016-08-05 16:50:19','2016-08-05 16:50:19'),(67,66,0,0,'Туфли','shoes','/clothes-and-shoes/she/shoes/shoes','67','2016-08-05 16:50:20','2016-08-05 16:50:20'),(68,66,0,0,'Балетки','ballet-flats','/clothes-and-shoes/she/shoes/ballet-flats','68','2016-08-05 16:50:20','2016-08-05 16:50:20'),(69,66,0,0,'Босоножки, сандалии','lace-up-sandals','/clothes-and-shoes/she/shoes/lace-up-sandals','69','2016-08-05 16:50:20','2016-08-05 16:50:20'),(70,66,0,0,'Ботинки, ботильоны','boots-ankle-boots','/clothes-and-shoes/she/shoes/boots-ankle-boots','70','2016-08-05 16:50:20','2016-08-05 16:50:20'),(71,66,0,0,'Кроссовки, кеды','running-shoes-sneakers','/clothes-and-shoes/she/shoes/running-shoes-sneakers','71','2016-08-05 16:50:20','2016-08-05 16:50:20'),(72,66,0,0,'Мокасины, слипоны','loafers-espadrilles','/clothes-and-shoes/she/shoes/loafers-espadrilles','72','2016-08-05 16:50:20','2016-08-05 16:50:20'),(73,66,0,0,'Пантолеты, шлепанцы','thongs-flip-flops','/clothes-and-shoes/she/shoes/thongs-flip-flops','73','2016-08-05 16:50:21','2016-08-05 16:50:21'),(74,66,0,0,'Резиновые сапоги','rubber-boots','/clothes-and-shoes/she/shoes/rubber-boots','74','2016-08-05 16:50:21','2016-08-05 16:50:21'),(75,66,0,0,'Сапоги','boots','/clothes-and-shoes/she/shoes/boots','75','2016-08-05 16:50:21','2016-08-05 16:50:21'),(76,66,0,0,'Тапочки','slippers','/clothes-and-shoes/she/shoes/slippers','76','2016-08-05 16:50:21','2016-08-05 16:50:21'),(77,43,0,0,'Аксессуары ','accessories','/clothes-and-shoes/she/accessories','86,84,87,82,89,81,78,85,83,79,90,88,94,91,80,93,92','2016-08-05 16:50:21','2016-08-05 16:50:21'),(78,77,0,0,'головные уборы','hats','/clothes-and-shoes/she/accessories/hats','78','2016-08-05 16:50:21','2016-08-05 16:50:21'),(79,77,0,0,'Перчатки','gloves','/clothes-and-shoes/she/accessories/gloves','79','2016-08-05 16:50:21','2016-08-05 16:50:21'),(80,77,0,0,'Варежки','mittens','/clothes-and-shoes/she/accessories/mittens','80','2016-08-05 16:50:21','2016-08-05 16:50:21'),(81,77,0,0,'Платки','shawls','/clothes-and-shoes/she/accessories/shawls','81','2016-08-05 16:50:22','2016-08-05 16:50:22'),(82,77,0,0,'Шарфы','scarves','/clothes-and-shoes/she/accessories/scarves','82','2016-08-05 16:50:22','2016-08-05 16:50:22'),(83,77,0,0,'Шали','shawls','/clothes-and-shoes/she/accessories/shawls','83','2016-08-05 16:50:22','2016-08-05 16:50:22'),(84,77,0,0,'Очки','glasses','/clothes-and-shoes/she/accessories/glasses','84','2016-08-05 16:50:22','2016-08-05 16:50:22'),(85,77,0,0,'Зонты','umbrellas','/clothes-and-shoes/she/accessories/umbrellas','85','2016-08-05 16:50:22','2016-08-05 16:50:22'),(86,77,0,0,'Ремни, пояса','belts-waist-belts','/clothes-and-shoes/she/accessories/belts-waist-belts','86','2016-08-05 16:50:22','2016-08-05 16:50:22'),(87,77,0,0,'Сумки, рюкзаки','bags-backpacks','/clothes-and-shoes/she/accessories/bags-backpacks','87','2016-08-05 16:50:22','2016-08-05 16:50:22'),(88,77,0,0,'Часы','watch','/clothes-and-shoes/she/accessories/watch','88','2016-08-05 16:50:23','2016-08-05 16:50:23'),(89,77,0,0,'Кошельки, обложки для документов, визитницы','purses-covers-for-documents-business-card-holders','/clothes-and-shoes/she/accessories/purses-covers-for-documents-business-card-holders','89','2016-08-05 16:50:23','2016-08-05 16:50:23'),(90,77,0,0,'Бижутерия','jewelry','/clothes-and-shoes/she/accessories/jewelry','91,94,92,93','2016-08-05 16:50:23','2016-08-05 16:50:23'),(91,90,0,0,'Кольца','ring','/clothes-and-shoes/she/accessories/jewelry/ring','91','2016-08-05 16:50:23','2016-08-05 16:50:23'),(92,90,0,0,'Серьги','earrings','/clothes-and-shoes/she/accessories/jewelry/earrings','92','2016-08-05 16:50:23','2016-08-05 16:50:23'),(93,90,0,0,'Подвески','suspension','/clothes-and-shoes/she/accessories/jewelry/suspension','93','2016-08-05 16:50:23','2016-08-05 16:50:23'),(94,90,0,0,'Браслеты','bracelets','/clothes-and-shoes/she/accessories/jewelry/bracelets','94','2016-08-05 16:50:23','2016-08-05 16:50:23'),(95,1,0,0,'Дети','children','/clothes-and-shoes/children','114,110,100,109,96,107,112,117,98,116,119,97,123,111,118,115,101,122,103,99,106,120,121,102,108,113,105,104','2016-08-05 16:50:23','2016-08-05 16:50:23'),(96,95,0,0,'Для малышей','for-kids','/clothes-and-shoes/children/for-kids','96','2016-08-05 16:50:23','2016-08-05 16:50:23'),(97,95,0,0,'Для мальчиков','for-boys','/clothes-and-shoes/children/for-boys','102,98,104,105,101,103,100,99','2016-08-05 16:50:24','2016-08-05 16:50:24'),(98,97,0,0,'Куртки, ветровки','jackets-coats','/clothes-and-shoes/children/for-boys/jackets-coats','98','2016-08-05 16:50:24','2016-08-05 16:50:24'),(99,97,0,0,'Кофты, свитера','jackets-sweaters','/clothes-and-shoes/children/for-boys/jackets-sweaters','99','2016-08-05 16:50:24','2016-08-05 16:50:24'),(100,97,0,0,'Рубашки, футболки, майки','shirts-t-shirts','/clothes-and-shoes/children/for-boys/shirts-t-shirts','100','2016-08-05 16:50:24','2016-08-05 16:50:24'),(101,97,0,0,'Брюки, шорты, джинсы','pants-shorts-jeans','/clothes-and-shoes/children/for-boys/pants-shorts-jeans','101','2016-08-05 16:50:24','2016-08-05 16:50:24'),(102,97,0,0,'Носки','socks','/clothes-and-shoes/children/for-boys/socks','102','2016-08-05 16:50:24','2016-08-05 16:50:24'),(103,97,0,0,'Одежда для сна','sleepwear','/clothes-and-shoes/children/for-boys/sleepwear','103','2016-08-05 16:50:24','2016-08-05 16:50:24'),(104,97,0,0,'Обувь','shoes','/clothes-and-shoes/children/for-boys/shoes','104','2016-08-05 16:50:24','2016-08-05 16:50:24'),(105,97,0,0,'Аксессуары','accessories','/clothes-and-shoes/children/for-boys/accessories','105','2016-08-05 16:50:24','2016-08-05 16:50:24'),(106,95,0,0,'Для девочек','for-girls','/clothes-and-shoes/children/for-girls','111,113,116,108,107,112,110,109,114,115','2016-08-05 16:50:25','2016-08-05 16:50:25'),(107,106,0,0,'Куртки, плащи','jackets-raincoats','/clothes-and-shoes/children/for-girls/jackets-raincoats','107','2016-08-05 16:50:25','2016-08-05 16:50:25'),(108,106,0,0,'Кофты','jackets','/clothes-and-shoes/children/for-girls/jackets','108','2016-08-05 16:50:25','2016-08-05 16:50:25'),(109,106,0,0,'Платья, юбки','dresses-skirts','/clothes-and-shoes/children/for-girls/dresses-skirts','109','2016-08-05 16:50:25','2016-08-05 16:50:25'),(110,106,0,0,'Рубашки, блузы','shirts-blouses','/clothes-and-shoes/children/for-girls/shirts-blouses','110','2016-08-05 16:50:25','2016-08-05 16:50:25'),(111,106,0,0,'Футболки, майки','t-shirts','/clothes-and-shoes/children/for-girls/t-shirts','111','2016-08-05 16:50:25','2016-08-05 16:50:25'),(112,106,0,0,'Брюки, шорты, джинсы','pants-shorts-jeans','/clothes-and-shoes/children/for-girls/pants-shorts-jeans','112','2016-08-05 16:50:25','2016-08-05 16:50:25'),(113,106,0,0,'Колготки, носки','tights-socks','/clothes-and-shoes/children/for-girls/tights-socks','113','2016-08-05 16:50:26','2016-08-05 16:50:26'),(114,106,0,0,'Одежда для сна','sleepwear','/clothes-and-shoes/children/for-girls/sleepwear','114','2016-08-05 16:50:26','2016-08-05 16:50:26'),(115,106,0,0,'Обувь','shoes','/clothes-and-shoes/children/for-girls/shoes','115','2016-08-05 16:50:26','2016-08-05 16:50:26'),(116,106,0,0,'Аксессуары','accessories','/clothes-and-shoes/children/for-girls/accessories','116','2016-08-05 16:50:26','2016-08-05 16:50:26'),(117,95,0,0,'Школа ','school','/clothes-and-shoes/children/school','122,120,121,118,119,123','2016-08-05 16:50:26','2016-08-05 16:50:26'),(118,117,0,0,'Школьные костюмы','school-costumes','/clothes-and-shoes/children/school/school-costumes','118','2016-08-05 16:50:26','2016-08-05 16:50:26'),(119,117,0,0,'Школьные рубашки','school-shirts','/clothes-and-shoes/children/school/school-shirts','119','2016-08-05 16:50:27','2016-08-05 16:50:27'),(120,117,0,0,'Школьные блузки','school-blouses','/clothes-and-shoes/children/school/school-blouses','120','2016-08-05 16:50:27','2016-08-05 16:50:27'),(121,117,0,0,'Школьные пиджаки, жакеты и жилеты','school-blazers-jackets-and-vests','/clothes-and-shoes/children/school/school-blazers-jackets-and-vests','121','2016-08-05 16:50:27','2016-08-05 16:50:27'),(122,117,0,0,'Школьные брюки','school-pants','/clothes-and-shoes/children/school/school-pants','122','2016-08-05 16:50:27','2016-08-05 16:50:27'),(123,117,0,0,'Школьные платья, сарафаны и юбки','school-dresses-tunics-and-skirts','/clothes-and-shoes/children/school/school-dresses-tunics-and-skirts','123','2016-08-05 16:50:27','2016-08-05 16:50:27'),(124,0,0,0,'Товары для дома','the-goods-for-the-house','/the-goods-for-the-house','157,211,231,137,235,134,131,228,181,279,241,153,190,205,259,251,236,262,179,272,226,135,207,202,185,158,214,125,170,188,238,265,237,258,200,269,227,253,274,155,222,182,220,126,203,171,176,223,213,277,162,174,172,252,273,254,192,151,243,218,275,266,197,156,150,208,136,198,242,194,199,225,127,186,264,255,267,270,248,152,129,244,146,212,139,246,221,144,169,247,191,195,149,263,141,278,148,206,168,159,224,154,234,173,217,128,268,165,216,145,167,196,245,257,163,209,219,276,140,232,239,271,132,229,175,204,142,178,166,193,143,189,201,161,256,210,249,250,183,164,184,187,133,138,147,260,180,215,233,130,261,230,177,240,160','2016-08-05 16:50:27','2016-08-05 16:50:27'),(125,124,0,0,'Домашний текстиль ','home-textile','/the-goods-for-the-house/home-textile','136,133,131,138,139,144,135,134,126,137,129,127,143,130,141,132,128,142,140','2016-08-05 16:50:27','2016-08-05 16:50:27'),(126,125,0,0,'Для спальни   ','for-bedroom','/the-goods-for-the-house/home-textile/for-bedroom','132,128,129,130,127,131','2016-08-05 16:50:27','2016-08-05 16:50:27'),(127,126,0,0,'Покрывала','bedspreads','/the-goods-for-the-house/home-textile/for-bedroom/bedspreads','127','2016-08-05 16:50:27','2016-08-05 16:50:27'),(128,126,0,0,'Комплекты постельного белья','bedding-sets','/the-goods-for-the-house/home-textile/for-bedroom/bedding-sets','128','2016-08-05 16:50:28','2016-08-05 16:50:28'),(129,126,0,0,'Одеяла, подушки','blankets-pillows','/the-goods-for-the-house/home-textile/for-bedroom/blankets-pillows','129','2016-08-05 16:50:28','2016-08-05 16:50:28'),(130,126,0,0,'Наволочки, простыни, пододеяльники','pillowcases-sheets-duvet-covers','/the-goods-for-the-house/home-textile/for-bedroom/pillowcases-sheets-duvet-covers','130','2016-08-05 16:50:28','2016-08-05 16:50:28'),(131,126,0,0,'Пледы','blankets','/the-goods-for-the-house/home-textile/for-bedroom/blankets','131','2016-08-05 16:50:28','2016-08-05 16:50:28'),(132,126,0,0,'Шторы и занавеси','blinds-and-curtains','/the-goods-for-the-house/home-textile/for-bedroom/blinds-and-curtains','132','2016-08-05 16:50:28','2016-08-05 16:50:28'),(133,125,0,0,'Для ванной комнаты','for-bathroom','/the-goods-for-the-house/home-textile/for-bathroom','134','2016-08-05 16:50:28','2016-08-05 16:50:28'),(134,133,0,0,'Полотенца','towels','/the-goods-for-the-house/home-textile/for-bathroom/towels','134','2016-08-05 16:50:28','2016-08-05 16:50:28'),(135,125,0,0,'Для кухни','for-kitchen','/the-goods-for-the-house/home-textile/for-kitchen','136,138,139,137,140','2016-08-05 16:50:28','2016-08-05 16:50:28'),(136,135,0,0,'Скатерти и салфетки','tablecloths-and-napkins','/the-goods-for-the-house/home-textile/for-kitchen/tablecloths-and-napkins','136','2016-08-05 16:50:29','2016-08-05 16:50:29'),(137,135,0,0,'Кухонные полотенца','kitchen-towels','/the-goods-for-the-house/home-textile/for-kitchen/kitchen-towels','137','2016-08-05 16:50:29','2016-08-05 16:50:29'),(138,135,0,0,'Фартуки, прихватки','aprons-oven-mitts','/the-goods-for-the-house/home-textile/for-kitchen/aprons-oven-mitts','138','2016-08-05 16:50:29','2016-08-05 16:50:29'),(139,135,0,0,'Чехлы, подушки на стул','covers-pillows-on-the-chair','/the-goods-for-the-house/home-textile/for-kitchen/covers-pillows-on-the-chair','139','2016-08-05 16:50:29','2016-08-05 16:50:29'),(140,135,0,0,'Шторы и занавеси','blinds-and-curtains','/the-goods-for-the-house/home-textile/for-kitchen/blinds-and-curtains','140','2016-08-05 16:50:29','2016-08-05 16:50:29'),(141,125,0,0,'Детская','children-s','/the-goods-for-the-house/home-textile/children-s','142,143,144','2016-08-05 16:50:30','2016-08-05 16:50:30'),(142,141,0,0,'Одеяла, подушки','blankets-pillows','/the-goods-for-the-house/home-textile/children-s/blankets-pillows','142','2016-08-05 16:50:30','2016-08-05 16:50:30'),(143,141,0,0,'Покрывала, пледы','bedspreads-blankets','/the-goods-for-the-house/home-textile/children-s/bedspreads-blankets','143','2016-08-05 16:50:30','2016-08-05 16:50:30'),(144,141,0,0,'Постельное белье','bed-linen','/the-goods-for-the-house/home-textile/children-s/bed-linen','144','2016-08-05 16:50:30','2016-08-05 16:50:30'),(145,124,0,0,'Предметы интерьера ','interior','/the-goods-for-the-house/interior','150,154,151,146,153,149,158,152,155,156,148,157,147','2016-08-05 16:50:30','2016-08-05 16:50:30'),(146,145,0,0,'Вазы, кашпо','vases-pots','/the-goods-for-the-house/interior/vases-pots','146','2016-08-05 16:50:30','2016-08-05 16:50:30'),(147,145,0,0,'Декоративные подушки','decorative-pillows','/the-goods-for-the-house/interior/decorative-pillows','147','2016-08-05 16:50:30','2016-08-05 16:50:30'),(148,145,0,0,'Подсвечники','candlesticks','/the-goods-for-the-house/interior/candlesticks','148','2016-08-05 16:50:30','2016-08-05 16:50:30'),(149,145,0,0,'Свечи, аромадиффузоры','candles-aroma-diffusers','/the-goods-for-the-house/interior/candles-aroma-diffusers','149','2016-08-05 16:50:31','2016-08-05 16:50:31'),(150,145,0,0,'Статуэтки, фигурки','statuettes-figurines','/the-goods-for-the-house/interior/statuettes-figurines','150','2016-08-05 16:50:31','2016-08-05 16:50:31'),(151,145,0,0,'Стильные штучки','stylish','/the-goods-for-the-house/interior/stylish','151','2016-08-05 16:50:31','2016-08-05 16:50:31'),(152,145,0,0,'Часы настенныенапольные','wall-clock-outdoor','/the-goods-for-the-house/interior/wall-clock-outdoor','152','2016-08-05 16:50:31','2016-08-05 16:50:31'),(153,145,0,0,'Шкатулки','box','/the-goods-for-the-house/interior/box','153','2016-08-05 16:50:31','2016-08-05 16:50:31'),(154,145,0,0,'Фоторамки','photo-frames','/the-goods-for-the-house/interior/photo-frames','154','2016-08-05 16:50:31','2016-08-05 16:50:31'),(155,145,0,0,'Дизайнерские вещи','designer-clothes','/the-goods-for-the-house/interior/designer-clothes','155','2016-08-05 16:50:31','2016-08-05 16:50:31'),(156,145,0,0,'Коврики для ванной и туалета','bath-mats-and-toilet','/the-goods-for-the-house/interior/bath-mats-and-toilet','156','2016-08-05 16:50:32','2016-08-05 16:50:32'),(157,145,0,0,'Шторки для душа ','shower-curtain','/the-goods-for-the-house/interior/shower-curtain','157','2016-08-05 16:50:32','2016-08-05 16:50:32'),(158,145,0,0,'Корзины для белья ','laundry-basket','/the-goods-for-the-house/interior/laundry-basket','158','2016-08-05 16:50:32','2016-08-05 16:50:32'),(159,124,0,0,'Все для кухни ','all-for-kitchen','/the-goods-for-the-house/all-for-kitchen','182,196,167,162,181,176,171,190,192,175,195,191,163,174,172,169,201,161,189,166,193,178,187,184,164,183,168,197,180,173,179,170,194,198,185,160,177,200,186,188,165,199','2016-08-05 16:50:32','2016-08-05 16:50:32'),(160,159,0,0,'Посуда для готовки','kitchen-utensils-for-cooking','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking','166,165,163,162,161,164','2016-08-05 16:50:32','2016-08-05 16:50:32'),(161,160,0,0,'Наборы посуды','cookware-sets','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/cookware-sets','161','2016-08-05 16:50:32','2016-08-05 16:50:32'),(162,160,0,0,'Кастрюли','pots','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/pots','162','2016-08-05 16:50:32','2016-08-05 16:50:32'),(163,160,0,0,'Сковородки, сотейники, воки','pans-casseroles-woks','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/pans-casseroles-woks','163','2016-08-05 16:50:32','2016-08-05 16:50:32'),(164,160,0,0,'Посуда из жаропрочного стекла ','cookware-heat-resistant-glass','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/cookware-heat-resistant-glass','164','2016-08-05 16:50:33','2016-08-05 16:50:33'),(165,160,0,0,'Чайники и заварники','teapots-and-tea-kettles','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/teapots-and-tea-kettles','165','2016-08-05 16:50:33','2016-08-05 16:50:33'),(166,160,0,0,'Формы для выпечки и  запекания','bakeware-and-baking','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/bakeware-and-baking','166','2016-08-05 16:50:33','2016-08-05 16:50:33'),(167,159,0,0,'Кухонные принадлежности','kitchenware','/the-goods-for-the-house/all-for-kitchen/kitchenware','179,178,171,173,176,180,177,181,169,174,172,168,175,170','2016-08-05 16:50:33','2016-08-05 16:50:33'),(168,167,0,0,'Кухонные наборы','kitchen-sets','/the-goods-for-the-house/all-for-kitchen/kitchenware/kitchen-sets','168','2016-08-05 16:50:33','2016-08-05 16:50:33'),(169,167,0,0,'Поварские лопатки, ложки, вилки','chef-s-blades-spoons-forks','/the-goods-for-the-house/all-for-kitchen/kitchenware/chef-s-blades-spoons-forks','169','2016-08-05 16:50:33','2016-08-05 16:50:33'),(170,167,0,0,'Разделочные доски','cutting-boards','/the-goods-for-the-house/all-for-kitchen/kitchenware/cutting-boards','170','2016-08-05 16:50:34','2016-08-05 16:50:34'),(171,167,0,0,'Кондитерские принадлежности','confectionery-supplies','/the-goods-for-the-house/all-for-kitchen/kitchenware/confectionery-supplies','171','2016-08-05 16:50:34','2016-08-05 16:50:34'),(172,167,0,0,'Терки, овощерезки','graters-vegetable-cutters','/the-goods-for-the-house/all-for-kitchen/kitchenware/graters-vegetable-cutters','172','2016-08-05 16:50:34','2016-08-05 16:50:34'),(173,167,0,0,'Миски и емкости для смешивания','bowls-and-containers-for-mixing','/the-goods-for-the-house/all-for-kitchen/kitchenware/bowls-and-containers-for-mixing','173','2016-08-05 16:50:34','2016-08-05 16:50:34'),(174,167,0,0,'Дуршлаги и сито','the-colander-and-sieve','/the-goods-for-the-house/all-for-kitchen/kitchenware/the-colander-and-sieve','174','2016-08-05 16:50:34','2016-08-05 16:50:34'),(175,167,0,0,'Измельчители и прессы','grinders-and-presses','/the-goods-for-the-house/all-for-kitchen/kitchenware/grinders-and-presses','175','2016-08-05 16:50:34','2016-08-05 16:50:34'),(176,167,0,0,'Консервные ножи и ключи','can-openers-and-keys','/the-goods-for-the-house/all-for-kitchen/kitchenware/can-openers-and-keys','176','2016-08-05 16:50:34','2016-08-05 16:50:34'),(177,167,0,0,'Мерная посуда','measuring-utensils','/the-goods-for-the-house/all-for-kitchen/kitchenware/measuring-utensils','177','2016-08-05 16:50:34','2016-08-05 16:50:34'),(178,167,0,0,'Сушки и органайзеры для посуды','drying-and-organizers-for-dishes','/the-goods-for-the-house/all-for-kitchen/kitchenware/drying-and-organizers-for-dishes','178','2016-08-05 16:50:35','2016-08-05 16:50:35'),(179,167,0,0,'Кухонные помощники','kitchen-assistants','/the-goods-for-the-house/all-for-kitchen/kitchenware/kitchen-assistants','179','2016-08-05 16:50:35','2016-08-05 16:50:35'),(180,167,0,0,'Овощечистки','peelers','/the-goods-for-the-house/all-for-kitchen/kitchenware/peelers','180','2016-08-05 16:50:35','2016-08-05 16:50:35'),(181,167,0,0,'Мусаты и точилки','sharpeners-and-sharpeners','/the-goods-for-the-house/all-for-kitchen/kitchenware/sharpeners-and-sharpeners','181','2016-08-05 16:50:35','2016-08-05 16:50:35'),(182,159,0,0,'Сервировка стола','table-setting','/the-goods-for-the-house/all-for-kitchen/table-setting','193,188,186,189,185,197,194,196,195,183,191,190,192,184,187','2016-08-05 16:50:35','2016-08-05 16:50:35'),(183,182,0,0,'Столовые сервизы','dinner-sets','/the-goods-for-the-house/all-for-kitchen/table-setting/dinner-sets','183','2016-08-05 16:50:35','2016-08-05 16:50:35'),(184,182,0,0,'Столовые приборы','cutlery','/the-goods-for-the-house/all-for-kitchen/table-setting/cutlery','184','2016-08-05 16:50:35','2016-08-05 16:50:35'),(185,182,0,0,'мармиты','steam-tables','/the-goods-for-the-house/all-for-kitchen/table-setting/steam-tables','185','2016-08-05 16:50:36','2016-08-05 16:50:36'),(186,182,0,0,'Чайные и кофейные сервизы','tea-and-coffee-sets','/the-goods-for-the-house/all-for-kitchen/table-setting/tea-and-coffee-sets','186','2016-08-05 16:50:36','2016-08-05 16:50:36'),(187,182,0,0,'Бокалы и фужеры','glasses-and-stemware','/the-goods-for-the-house/all-for-kitchen/table-setting/glasses-and-stemware','187','2016-08-05 16:50:36','2016-08-05 16:50:36'),(188,182,0,0,'Стопки и рюмки','stacks-and-glasses','/the-goods-for-the-house/all-for-kitchen/table-setting/stacks-and-glasses','188','2016-08-05 16:50:36','2016-08-05 16:50:36'),(189,182,0,0,'Стаканы','glasses','/the-goods-for-the-house/all-for-kitchen/table-setting/glasses','189','2016-08-05 16:50:36','2016-08-05 16:50:36'),(190,182,0,0,'Кувшины, графины','jugs-carafes','/the-goods-for-the-house/all-for-kitchen/table-setting/jugs-carafes','190','2016-08-05 16:50:36','2016-08-05 16:50:36'),(191,182,0,0,'Чашки    ','cup','/the-goods-for-the-house/all-for-kitchen/table-setting/cup','191','2016-08-05 16:50:36','2016-08-05 16:50:36'),(192,182,0,0,'Тарелки','plates','/the-goods-for-the-house/all-for-kitchen/table-setting/plates','192','2016-08-05 16:50:37','2016-08-05 16:50:37'),(193,182,0,0,'Салатники         ','salad','/the-goods-for-the-house/all-for-kitchen/table-setting/salad','193','2016-08-05 16:50:37','2016-08-05 16:50:37'),(194,182,0,0,'Подносы, коврики','trays-mats','/the-goods-for-the-house/all-for-kitchen/table-setting/trays-mats','194','2016-08-05 16:50:37','2016-08-05 16:50:37'),(195,182,0,0,'Ножи, ножницы, топорики','knives-scissors-hatchets','/the-goods-for-the-house/all-for-kitchen/table-setting/knives-scissors-hatchets','195','2016-08-05 16:50:37','2016-08-05 16:50:37'),(196,182,0,0,'Наборы ножей','knife-sets','/the-goods-for-the-house/all-for-kitchen/table-setting/knife-sets','196','2016-08-05 16:50:37','2016-08-05 16:50:37'),(197,182,0,0,'Подставки и планки','stand-and-strap','/the-goods-for-the-house/all-for-kitchen/table-setting/stand-and-strap','197','2016-08-05 16:50:37','2016-08-05 16:50:37'),(198,159,0,0,'Емкости для хранения','storage-tanks','/the-goods-for-the-house/all-for-kitchen/storage-tanks','201,200,199','2016-08-05 16:50:37','2016-08-05 16:50:37'),(199,198,0,0,'Банки для сыпучих','banks-for-loose','/the-goods-for-the-house/all-for-kitchen/storage-tanks/banks-for-loose','199','2016-08-05 16:50:38','2016-08-05 16:50:38'),(200,198,0,0,'Контейнеры','containers','/the-goods-for-the-house/all-for-kitchen/storage-tanks/containers','200','2016-08-05 16:50:38','2016-08-05 16:50:38'),(201,198,0,0,'Лотки','trays','/the-goods-for-the-house/all-for-kitchen/storage-tanks/trays','201','2016-08-05 16:50:38','2016-08-05 16:50:38'),(202,124,0,0,'Хранение','storage','/the-goods-for-the-house/storage','203,204,205','2016-08-05 16:50:38','2016-08-05 16:50:38'),(203,202,0,0,'Органайзеры','organizers','/the-goods-for-the-house/storage/organizers','203','2016-08-05 16:50:38','2016-08-05 16:50:38'),(204,202,0,0,'Коробки, кузовки','boxes-kuzuki','/the-goods-for-the-house/storage/boxes-kuzuki','204','2016-08-05 16:50:38','2016-08-05 16:50:38'),(205,202,0,0,'Чехлы','covers','/the-goods-for-the-house/storage/covers','205','2016-08-05 16:50:38','2016-08-05 16:50:38'),(206,124,0,0,'Хозтовары','housewares','/the-goods-for-the-house/housewares','207,210,208,209,212,211','2016-08-05 16:50:39','2016-08-05 16:50:39'),(207,206,0,0,'Гладильные доски, сушилки','ironing-boards-dryers','/the-goods-for-the-house/housewares/ironing-boards-dryers','207','2016-08-05 16:50:39','2016-08-05 16:50:39'),(208,206,0,0,'Корзины, короба','baskets-boxes','/the-goods-for-the-house/housewares/baskets-boxes','208','2016-08-05 16:50:39','2016-08-05 16:50:39'),(209,206,0,0,'Щетки, швабры','brushes-mops','/the-goods-for-the-house/housewares/brushes-mops','209','2016-08-05 16:50:39','2016-08-05 16:50:39'),(210,206,0,0,'Ведра, тазы','buckets-basins','/the-goods-for-the-house/housewares/buckets-basins','210','2016-08-05 16:50:39','2016-08-05 16:50:39'),(211,206,0,0,'Вешалки','hanger','/the-goods-for-the-house/housewares/hanger','211','2016-08-05 16:50:39','2016-08-05 16:50:39'),(212,206,0,0,'Придверные коврики','doorway-mats','/the-goods-for-the-house/housewares/doorway-mats','212','2016-08-05 16:50:39','2016-08-05 16:50:39'),(213,124,0,0,'Бытовая химия ','household-chemicals','/the-goods-for-the-house/household-chemicals','218,217,215,216,214','2016-08-05 16:50:40','2016-08-05 16:50:40'),(214,213,0,0,'Средства для мытья посуды','means-for-washing-dishes','/the-goods-for-the-house/household-chemicals/means-for-washing-dishes','214','2016-08-05 16:50:40','2016-08-05 16:50:40'),(215,213,0,0,'Средства для стирки','detergent','/the-goods-for-the-house/household-chemicals/detergent','215','2016-08-05 16:50:40','2016-08-05 16:50:40'),(216,213,0,0,'Средства для уборки','cleaning','/the-goods-for-the-house/household-chemicals/cleaning','216','2016-08-05 16:50:40','2016-08-05 16:50:40'),(217,213,0,0,'Средства по уходу за бытовой техникой','care-for-appliances','/the-goods-for-the-house/household-chemicals/care-for-appliances','217','2016-08-05 16:50:40','2016-08-05 16:50:40'),(218,213,0,0,'Средства борьбы с насекомыми','means-of-struggle-against-insects','/the-goods-for-the-house/household-chemicals/means-of-struggle-against-insects','218','2016-08-05 16:50:40','2016-08-05 16:50:40'),(219,124,0,0,'Освещение ','lighting','/the-goods-for-the-house/lighting','222,224,220,226,225,223,221','2016-08-05 16:50:40','2016-08-05 16:50:40'),(220,219,0,0,'Люстры и подвесы','chandeliers-and-suspensions','/the-goods-for-the-house/lighting/chandeliers-and-suspensions','220','2016-08-05 16:50:40','2016-08-05 16:50:40'),(221,219,0,0,'Бра и настенные светильники','sconces-and-wall-lamps','/the-goods-for-the-house/lighting/sconces-and-wall-lamps','221','2016-08-05 16:50:41','2016-08-05 16:50:41'),(222,219,0,0,'Настольные лампы','table-lamp','/the-goods-for-the-house/lighting/table-lamp','222','2016-08-05 16:50:41','2016-08-05 16:50:41'),(223,219,0,0,'Торшеры','floor-lamps','/the-goods-for-the-house/lighting/floor-lamps','223','2016-08-05 16:50:41','2016-08-05 16:50:41'),(224,219,0,0,'Детские светильники ','children-s-lamps','/the-goods-for-the-house/lighting/children-s-lamps','224','2016-08-05 16:50:41','2016-08-05 16:50:41'),(225,219,0,0,'Садово-парковые светильники','park-and-garden-luminaires','/the-goods-for-the-house/lighting/park-and-garden-luminaires','225','2016-08-05 16:50:41','2016-08-05 16:50:41'),(226,219,0,0,'Лампочки и аксессуары','light-bulbs-and-accessories','/the-goods-for-the-house/lighting/light-bulbs-and-accessories','226','2016-08-05 16:50:41','2016-08-05 16:50:41'),(227,124,0,0,'Мебель ','furniture','/the-goods-for-the-house/furniture','235,229,236,234,233,232,231,228,230','2016-08-05 16:50:41','2016-08-05 16:50:41'),(228,227,0,0,'Бескаркасная мебель','frameless-furniture','/the-goods-for-the-house/furniture/frameless-furniture','228','2016-08-05 16:50:41','2016-08-05 16:50:41'),(229,227,0,0,'Журнальные столы','coffee-tables','/the-goods-for-the-house/furniture/coffee-tables','229','2016-08-05 16:50:42','2016-08-05 16:50:42'),(230,227,0,0,'Кресла','chairs','/the-goods-for-the-house/furniture/chairs','230','2016-08-05 16:50:42','2016-08-05 16:50:42'),(231,227,0,0,'Стулья и табуреты','chairs-and-stools','/the-goods-for-the-house/furniture/chairs-and-stools','231','2016-08-05 16:50:42','2016-08-05 16:50:42'),(232,227,0,0,'Складная мебель','folding-furniture','/the-goods-for-the-house/furniture/folding-furniture','232','2016-08-05 16:50:42','2016-08-05 16:50:42'),(233,227,0,0,'Пластиковая мебель','plastic-furniture','/the-goods-for-the-house/furniture/plastic-furniture','233','2016-08-05 16:50:42','2016-08-05 16:50:42'),(234,227,0,0,'Садовые зонты и подставки','garden-umbrellas-and-stands','/the-goods-for-the-house/furniture/garden-umbrellas-and-stands','234','2016-08-05 16:50:42','2016-08-05 16:50:42'),(235,227,0,0,'Садовые качели','garden-swing','/the-goods-for-the-house/furniture/garden-swing','235','2016-08-05 16:50:42','2016-08-05 16:50:42'),(236,227,0,0,'Столики для ноутбуков и IT-техники','tables-for-laptops-and-it-equipment','/the-goods-for-the-house/furniture/tables-for-laptops-and-it-equipment','236','2016-08-05 16:50:42','2016-08-05 16:50:42'),(237,124,0,0,'Бытовая техника  ','appliances','/the-goods-for-the-house/appliances','257,246,277,248,253,274,245,244,275,263,243,278,266,259,256,252,279,276,273,241,247,239,254,271,272,260,249,251,250,262,268,265,238,261,258,264,255,267,270,269,240,242','2016-08-05 16:50:43','2016-08-05 16:50:43'),(238,237,0,0,'Техника для ухода','technique-to-care','/the-goods-for-the-house/appliances/technique-to-care','240,246,243,244,242,245,239,241','2016-08-05 16:50:43','2016-08-05 16:50:43'),(239,238,0,0,'Бритвы электрические','razor-electric','/the-goods-for-the-house/appliances/technique-to-care/razor-electric','239','2016-08-05 16:50:43','2016-08-05 16:50:43'),(240,238,0,0,'Косметические приборы','care-products','/the-goods-for-the-house/appliances/technique-to-care/care-products','240','2016-08-05 16:50:43','2016-08-05 16:50:43'),(241,238,0,0,'Массажеры электрические','massagers-electric','/the-goods-for-the-house/appliances/technique-to-care/massagers-electric','241','2016-08-05 16:50:43','2016-08-05 16:50:43'),(242,238,0,0,'Медицинские приборы','medical-devices','/the-goods-for-the-house/appliances/technique-to-care/medical-devices','242','2016-08-05 16:50:43','2016-08-05 16:50:43'),(243,238,0,0,'Машинки для стрижки, тримеры','the-clippers-trimers','/the-goods-for-the-house/appliances/technique-to-care/the-clippers-trimers','243','2016-08-05 16:50:43','2016-08-05 16:50:43'),(244,238,0,0,'Приборы для укладки волос','devices-for-hair-styling','/the-goods-for-the-house/appliances/technique-to-care/devices-for-hair-styling','244','2016-08-05 16:50:43','2016-08-05 16:50:43'),(245,238,0,0,'Электрические зубные щетки','electric-toothbrushes','/the-goods-for-the-house/appliances/technique-to-care/electric-toothbrushes','245','2016-08-05 16:50:43','2016-08-05 16:50:43'),(246,238,0,0,'Эпиляторы','epilators','/the-goods-for-the-house/appliances/technique-to-care/epilators','246','2016-08-05 16:50:44','2016-08-05 16:50:44'),(247,237,0,0,'Техника для кухни','kitchen-appliances','/the-goods-for-the-house/appliances/kitchen-appliances','250,251,253,248,249,262,257,260,252,254,261,263,265,268,256,259,267,270,269,255,266,264,258','2016-08-05 16:50:44','2016-08-05 16:50:44'),(248,247,0,0,'Блендеры','blenders','/the-goods-for-the-house/appliances/kitchen-appliances/blenders','248','2016-08-05 16:50:44','2016-08-05 16:50:44'),(249,247,0,0,'Вафельницы','waffle-makers','/the-goods-for-the-house/appliances/kitchen-appliances/waffle-makers','249','2016-08-05 16:50:44','2016-08-05 16:50:44'),(250,247,0,0,'Кофеварки','coffee-makers','/the-goods-for-the-house/appliances/kitchen-appliances/coffee-makers','250','2016-08-05 16:50:44','2016-08-05 16:50:44'),(251,247,0,0,'Кофемолки','grinders','/the-goods-for-the-house/appliances/kitchen-appliances/grinders','251','2016-08-05 16:50:44','2016-08-05 16:50:44'),(252,247,0,0,'Кухонные весы','kitchen-scales','/the-goods-for-the-house/appliances/kitchen-appliances/kitchen-scales','252','2016-08-05 16:50:44','2016-08-05 16:50:44'),(253,247,0,0,'Кухонные комбайны','food-processors','/the-goods-for-the-house/appliances/kitchen-appliances/food-processors','253','2016-08-05 16:50:44','2016-08-05 16:50:44'),(254,247,0,0,'Миксеры','mixers','/the-goods-for-the-house/appliances/kitchen-appliances/mixers','254','2016-08-05 16:50:44','2016-08-05 16:50:44'),(255,247,0,0,'Мультиварки','slow-cooker','/the-goods-for-the-house/appliances/kitchen-appliances/slow-cooker','255','2016-08-05 16:50:45','2016-08-05 16:50:45'),(256,247,0,0,'Мясорубки','grinder','/the-goods-for-the-house/appliances/kitchen-appliances/grinder','256','2016-08-05 16:50:45','2016-08-05 16:50:45'),(257,247,0,0,'Пароварки','steamers','/the-goods-for-the-house/appliances/kitchen-appliances/steamers','257','2016-08-05 16:50:45','2016-08-05 16:50:45'),(258,247,0,0,'Соковыжималки','juicer','/the-goods-for-the-house/appliances/kitchen-appliances/juicer','258','2016-08-05 16:50:45','2016-08-05 16:50:45'),(259,247,0,0,'Тостеры','toasters','/the-goods-for-the-house/appliances/kitchen-appliances/toasters','259','2016-08-05 16:50:45','2016-08-05 16:50:45'),(260,247,0,0,'Хлебопечки','bread-machine','/the-goods-for-the-house/appliances/kitchen-appliances/bread-machine','260','2016-08-05 16:50:45','2016-08-05 16:50:45'),(261,247,0,0,'Чайники электрические','electrical','/the-goods-for-the-house/appliances/kitchen-appliances/electrical','261','2016-08-05 16:50:45','2016-08-05 16:50:45'),(262,247,0,0,'Йогуртницы, творожницы','yogurtnitsy-tvorozhniy','/the-goods-for-the-house/appliances/kitchen-appliances/yogurtnitsy-tvorozhniy','262','2016-08-05 16:50:45','2016-08-05 16:50:45'),(263,247,0,0,'Аерогрили','aerogril','/the-goods-for-the-house/appliances/kitchen-appliances/aerogril','263','2016-08-05 16:50:46','2016-08-05 16:50:46'),(264,247,0,0,'Грили, электрошашлычницы','greeley-electrocasnice','/the-goods-for-the-house/appliances/kitchen-appliances/greeley-electrocasnice','264','2016-08-05 16:50:46','2016-08-05 16:50:46'),(265,247,0,0,'Ломтерезки ','slicer','/the-goods-for-the-house/appliances/kitchen-appliances/slicer','265','2016-08-05 16:50:46','2016-08-05 16:50:46'),(266,247,0,0,'Маринаторы','marinator','/the-goods-for-the-house/appliances/kitchen-appliances/marinator','266','2016-08-05 16:50:46','2016-08-05 16:50:46'),(267,247,0,0,'Настольные плиты','table-plate','/the-goods-for-the-house/appliances/kitchen-appliances/table-plate','267','2016-08-05 16:50:46','2016-08-05 16:50:46'),(268,247,0,0,'Сушилки для овощей и фруктов','dryer-for-vegetables-and-fruits','/the-goods-for-the-house/appliances/kitchen-appliances/dryer-for-vegetables-and-fruits','268','2016-08-05 16:50:46','2016-08-05 16:50:46'),(269,247,0,0,'Фритюрницы','fryer','/the-goods-for-the-house/appliances/kitchen-appliances/fryer','269','2016-08-05 16:50:46','2016-08-05 16:50:46'),(270,247,0,0,'Аксессуары для кухонной техники','accessories-for-kitchen-appliances','/the-goods-for-the-house/appliances/kitchen-appliances/accessories-for-kitchen-appliances','270','2016-08-05 16:50:47','2016-08-05 16:50:47'),(271,237,0,0,'Техника для дома','home-appliances','/the-goods-for-the-house/appliances/home-appliances','278,277,272,275,279,276,273,274','2016-08-05 16:50:47','2016-08-05 16:50:47'),(272,271,0,0,'Весы','libra','/the-goods-for-the-house/appliances/home-appliances/libra','272','2016-08-05 16:50:47','2016-08-05 16:50:47'),(273,271,0,0,'Вентиляторы','fans','/the-goods-for-the-house/appliances/home-appliances/fans','273','2016-08-05 16:50:47','2016-08-05 16:50:47'),(274,271,0,0,'Обогреватели','heaters','/the-goods-for-the-house/appliances/home-appliances/heaters','274','2016-08-05 16:50:47','2016-08-05 16:50:47'),(275,271,0,0,'Пароочистители','steam-cleaners','/the-goods-for-the-house/appliances/home-appliances/steam-cleaners','275','2016-08-05 16:50:47','2016-08-05 16:50:47'),(276,271,0,0,'Пылесосы','vacuum-cleaner','/the-goods-for-the-house/appliances/home-appliances/vacuum-cleaner','276','2016-08-05 16:50:47','2016-08-05 16:50:47'),(277,271,0,0,'Увлажнители воздуха','humidifiers','/the-goods-for-the-house/appliances/home-appliances/humidifiers','277','2016-08-05 16:50:47','2016-08-05 16:50:47'),(278,271,0,0,'Утюги','irons','/the-goods-for-the-house/appliances/home-appliances/irons','278','2016-08-05 16:50:47','2016-08-05 16:50:47'),(279,271,0,0,'Электронные сигареты и аксесуары','electronic-cigarettes-and-accessories','/the-goods-for-the-house/appliances/home-appliances/electronic-cigarettes-and-accessories','279','2016-08-05 16:50:48','2016-08-05 16:50:48'),(280,0,0,0,'Дача, сад, огород ','cottage-garden-kitchen-garden','/cottage-garden-kitchen-garden','283,281,284,286,285,282','2016-08-05 16:50:48','2016-08-05 16:50:48'),(281,280,0,0,'Садовая техника','garden-machinery','/cottage-garden-kitchen-garden/garden-machinery','281','2016-08-05 16:50:48','2016-08-05 16:50:48'),(282,280,0,0,'Садовый инвентарь','garden-tools','/cottage-garden-kitchen-garden/garden-tools','282','2016-08-05 16:50:48','2016-08-05 16:50:48'),(283,280,0,0,'Системы полива','watering-system','/cottage-garden-kitchen-garden/watering-system','283','2016-08-05 16:50:48','2016-08-05 16:50:48'),(284,280,0,0,'Семена и удобрения','seed-and-fertilizer','/cottage-garden-kitchen-garden/seed-and-fertilizer','284','2016-08-05 16:50:48','2016-08-05 16:50:48'),(285,280,0,0,'Садовая мебель','garden-furniture','/cottage-garden-kitchen-garden/garden-furniture','285','2016-08-05 16:50:48','2016-08-05 16:50:48'),(286,280,0,0,'Садовый декор','garden-decor','/cottage-garden-kitchen-garden/garden-decor','286','2016-08-05 16:50:48','2016-08-05 16:50:48'),(287,0,0,0,'Красота и здоровье ','health-and-beauty','/health-and-beauty','331,292,329,337,308,332,317,288,336,334,326,293,303,306,291,325,324,295,320,302,301,297,304,298,323,322,330,333,309,299,310,313,318,289,321,300,296,327,290,305,314,315,311,307,319,328,316,294,335,312','2016-08-05 16:50:49','2016-08-05 16:50:49'),(288,287,0,0,'Уход за волосами','hair-care','/health-and-beauty/hair-care','296,294,290,291,289,293,295,292','2016-08-05 16:50:49','2016-08-05 16:50:49'),(289,288,0,0,'Шампуни, ','shampoos-','/health-and-beauty/hair-care/shampoos-','289','2016-08-05 16:50:49','2016-08-05 16:50:49'),(290,288,0,0,'Кондиционеры','air-conditioning','/health-and-beauty/hair-care/air-conditioning','290','2016-08-05 16:50:49','2016-08-05 16:50:49'),(291,288,0,0,'Бальзамы, ополаскиватели','balms-conditioners','/health-and-beauty/hair-care/balms-conditioners','291','2016-08-05 16:50:49','2016-08-05 16:50:49'),(292,288,0,0,'Маски ','mask','/health-and-beauty/hair-care/mask','292','2016-08-05 16:50:49','2016-08-05 16:50:49'),(293,288,0,0,'Масла, сыворотки','oil-serum','/health-and-beauty/hair-care/oil-serum','293','2016-08-05 16:50:49','2016-08-05 16:50:49'),(294,288,0,0,'Стайлинг','styling','/health-and-beauty/hair-care/styling','294','2016-08-05 16:50:49','2016-08-05 16:50:49'),(295,288,0,0,'Окрашивание ','staining','/health-and-beauty/hair-care/staining','295','2016-08-05 16:50:50','2016-08-05 16:50:50'),(296,288,0,0,'Аксессуары для волос','hair-accessories','/health-and-beauty/hair-care/hair-accessories','296','2016-08-05 16:50:50','2016-08-05 16:50:50'),(297,287,0,0,'Уход за телом','body-care','/health-and-beauty/body-care','302,299,301,305,307,308,303,300,306,304,298','2016-08-05 16:50:50','2016-08-05 16:50:50'),(298,297,0,0,'Кремы, лосьоны','creams-lotions','/health-and-beauty/body-care/creams-lotions','298','2016-08-05 16:50:50','2016-08-05 16:50:50'),(299,297,0,0,'Спреи','sprays','/health-and-beauty/body-care/sprays','299','2016-08-05 16:50:50','2016-08-05 16:50:50'),(300,297,0,0,'Гели для душа','shower-gels','/health-and-beauty/body-care/shower-gels','300','2016-08-05 16:50:50','2016-08-05 16:50:50'),(301,297,0,0,'Мыло','soap','/health-and-beauty/body-care/soap','301','2016-08-05 16:50:50','2016-08-05 16:50:50'),(302,297,0,0,'Масла','oil','/health-and-beauty/body-care/oil','302','2016-08-05 16:50:50','2016-08-05 16:50:50'),(303,297,0,0,'Скрабы, пилинги','scrubs-peels','/health-and-beauty/body-care/scrubs-peels','303','2016-08-05 16:50:51','2016-08-05 16:50:51'),(304,297,0,0,'Средства для ванн','bath-products','/health-and-beauty/body-care/bath-products','304','2016-08-05 16:50:51','2016-08-05 16:50:51'),(305,297,0,0,'Коррекция фигуры','correction','/health-and-beauty/body-care/correction','305','2016-08-05 16:50:51','2016-08-05 16:50:51'),(306,297,0,0,'Депиляция','waxing','/health-and-beauty/body-care/waxing','306','2016-08-05 16:50:51','2016-08-05 16:50:51'),(307,297,0,0,'Интимная гигиена','intimate-hygiene','/health-and-beauty/body-care/intimate-hygiene','307','2016-08-05 16:50:51','2016-08-05 16:50:51'),(308,297,0,0,'Дезодоранты','deodorants','/health-and-beauty/body-care/deodorants','308','2016-08-05 16:50:51','2016-08-05 16:50:51'),(309,287,0,0,'Уход за лицом','facials','/health-and-beauty/facials','311,313,310,314,312','2016-08-05 16:50:51','2016-08-05 16:50:51'),(310,309,0,0,'Демакияж','make-up-remover','/health-and-beauty/facials/make-up-remover','310','2016-08-05 16:50:51','2016-08-05 16:50:51'),(311,309,0,0,'Скрабы, пилинги','scrubs-peels','/health-and-beauty/facials/scrubs-peels','311','2016-08-05 16:50:51','2016-08-05 16:50:51'),(312,309,0,0,'Кремы, гели, ','creams-gels-','/health-and-beauty/facials/creams-gels-','312','2016-08-05 16:50:52','2016-08-05 16:50:52'),(313,309,0,0,'Сыворотки','serum','/health-and-beauty/facials/serum','313','2016-08-05 16:50:52','2016-08-05 16:50:52'),(314,309,0,0,'Маски','mask','/health-and-beauty/facials/mask','314','2016-08-05 16:50:52','2016-08-05 16:50:52'),(315,287,0,0,'Уход за руками, ногами','hand-care-feet','/health-and-beauty/hand-care-feet','317,316,318','2016-08-05 16:50:52','2016-08-05 16:50:52'),(316,315,0,0,'Косметика для рук и ногтей','cosmetics-for-hands-and-nails','/health-and-beauty/hand-care-feet/cosmetics-for-hands-and-nails','316','2016-08-05 16:50:52','2016-08-05 16:50:52'),(317,315,0,0,'Косметика для ног','cosmetics-for-feet','/health-and-beauty/hand-care-feet/cosmetics-for-feet','317','2016-08-05 16:50:52','2016-08-05 16:50:52'),(318,315,0,0,'Средства для маникюра и педикюра','tools-for-manicure-and-pedicure','/health-and-beauty/hand-care-feet/tools-for-manicure-and-pedicure','318','2016-08-05 16:50:52','2016-08-05 16:50:52'),(319,287,0,0,'Парфюмерия','perfume','/health-and-beauty/perfume','322,321,320','2016-08-05 16:50:52','2016-08-05 16:50:52'),(320,319,0,0,'Женские ароматы','women-s-fragrances','/health-and-beauty/perfume/women-s-fragrances','320','2016-08-05 16:50:52','2016-08-05 16:50:52'),(321,319,0,0,'Мужские ароматы','men-s-fragrances','/health-and-beauty/perfume/men-s-fragrances','321','2016-08-05 16:50:53','2016-08-05 16:50:53'),(322,319,0,0,'Унисекс','unisex','/health-and-beauty/perfume/unisex','322','2016-08-05 16:50:53','2016-08-05 16:50:53'),(323,287,0,0,'Декоративная косметика','decorative-cosmetics','/health-and-beauty/decorative-cosmetics','324,325,326','2016-08-05 16:50:53','2016-08-05 16:50:53'),(324,323,0,0,'Для глаз','for-eyes','/health-and-beauty/decorative-cosmetics/for-eyes','324','2016-08-05 16:50:53','2016-08-05 16:50:53'),(325,323,0,0,'Для губ','lip','/health-and-beauty/decorative-cosmetics/lip','325','2016-08-05 16:50:53','2016-08-05 16:50:53'),(326,323,0,0,'Для лица','for-the-face','/health-and-beauty/decorative-cosmetics/for-the-face','326','2016-08-05 16:50:53','2016-08-05 16:50:53'),(327,287,0,0,'Уход за полостью рта','care-for-the-oral-cavity','/health-and-beauty/care-for-the-oral-cavity','328,330,329','2016-08-05 16:50:53','2016-08-05 16:50:53'),(328,327,0,0,'Пасты, порошки','paste-powder','/health-and-beauty/care-for-the-oral-cavity/paste-powder','328','2016-08-05 16:50:53','2016-08-05 16:50:53'),(329,327,0,0,'Ополаскиватели','rinses','/health-and-beauty/care-for-the-oral-cavity/rinses','329','2016-08-05 16:50:54','2016-08-05 16:50:54'),(330,327,0,0,'Щетки, нити','brush-filament','/health-and-beauty/care-for-the-oral-cavity/brush-filament','330','2016-08-05 16:50:54','2016-08-05 16:50:54'),(331,287,0,0,'Мужская линия','the-male-line','/health-and-beauty/the-male-line','332,335,336,334,337,333','2016-08-05 16:50:54','2016-08-05 16:50:54'),(332,331,0,0,'Шампуни, кондиционеры','shampoos-conditioners','/health-and-beauty/the-male-line/shampoos-conditioners','332','2016-08-05 16:50:54','2016-08-05 16:50:54'),(333,331,0,0,'Гели для душа','shower-gels','/health-and-beauty/the-male-line/shower-gels','333','2016-08-05 16:50:54','2016-08-05 16:50:54'),(334,331,0,0,'Антиперспиранты','antiperspirants','/health-and-beauty/the-male-line/antiperspirants','334','2016-08-05 16:50:54','2016-08-05 16:50:54'),(335,331,0,0,'Уход за лицом','facials','/health-and-beauty/the-male-line/facials','335','2016-08-05 16:50:54','2016-08-05 16:50:54'),(336,331,0,0,'Средства для бритья','shaving','/health-and-beauty/the-male-line/shaving','336','2016-08-05 16:50:55','2016-08-05 16:50:55'),(337,331,0,0,'Уход за бородой и усами','care-beard-and-mustache','/health-and-beauty/the-male-line/care-beard-and-mustache','337','2016-08-05 16:50:55','2016-08-05 16:50:55'),(338,0,0,0,'Товары для детей ','products-for-children','/products-for-children','343,361,349,347,366,346,365,367,355,351,362,341,350,342,354,340,364,352,344,360,353,359,345,339,358,348,363,356,357','2016-08-05 16:50:55','2016-08-05 16:50:55'),(339,338,0,0,'Игрушки','toys','/products-for-children/toys','350,342,351,348,345,341,346,344,349,343,347,340','2016-08-05 16:50:55','2016-08-05 16:50:55'),(340,339,0,0,'Игрушки для новорожденных','toys-for-newborns','/products-for-children/toys/toys-for-newborns','340','2016-08-05 16:50:55','2016-08-05 16:50:55'),(341,339,0,0,'Интерактивные игрушки','interactive-toys','/products-for-children/toys/interactive-toys','341','2016-08-05 16:50:55','2016-08-05 16:50:55'),(342,339,0,0,'Куклы','doll','/products-for-children/toys/doll','342','2016-08-05 16:50:55','2016-08-05 16:50:55'),(343,339,0,0,'Игровые наборы и фигурки','playsets-and-figures','/products-for-children/toys/playsets-and-figures','343','2016-08-05 16:50:55','2016-08-05 16:50:55'),(344,339,0,0,'Конструкторы','designers','/products-for-children/toys/designers','344','2016-08-05 16:50:55','2016-08-05 16:50:55'),(345,339,0,0,'Игрушечный транспорт, военная техника','toy-vehicles-military-equipment','/products-for-children/toys/toy-vehicles-military-equipment','345','2016-08-05 16:50:56','2016-08-05 16:50:56'),(346,339,0,0,'Игрушки на радиоуправлении','for-radio-control-toys','/products-for-children/toys/for-radio-control-toys','346','2016-08-05 16:50:56','2016-08-05 16:50:56'),(347,339,0,0,'Мягкие игрушки','soft-toys','/products-for-children/toys/soft-toys','347','2016-08-05 16:50:56','2016-08-05 16:50:56'),(348,339,0,0,'Настольные игры','board-games','/products-for-children/toys/board-games','348','2016-08-05 16:50:56','2016-08-05 16:50:56'),(349,339,0,0,'Спортивные и активные игры','sports-and-active-games','/products-for-children/toys/sports-and-active-games','349','2016-08-05 16:50:56','2016-08-05 16:50:56'),(350,339,0,0,'Развитие и обучение','training-and-development','/products-for-children/toys/training-and-development','350','2016-08-05 16:50:56','2016-08-05 16:50:56'),(351,339,0,0,'Хобби и творчество','hobby-and-creativity','/products-for-children/toys/hobby-and-creativity','351','2016-08-05 16:50:56','2016-08-05 16:50:56'),(352,338,0,0,'Все для школы','school-supply','/products-for-children/school-supply','354,355,353','2016-08-05 16:50:57','2016-08-05 16:50:57'),(353,352,0,0,'Канцелярские наборы','stationery-sets','/products-for-children/school-supply/stationery-sets','353','2016-08-05 16:50:57','2016-08-05 16:50:57'),(354,352,0,0,'Канцтовары','stationery','/products-for-children/school-supply/stationery','354','2016-08-05 16:50:57','2016-08-05 16:50:57'),(355,352,0,0,'Школьные ранцы, рюкзаки, сумки','school-bags-backpacks-bags','/products-for-children/school-supply/school-bags-backpacks-bags','355','2016-08-05 16:50:57','2016-08-05 16:50:57'),(356,338,0,0,'Хобби и Творчество ','hobby-and-creativity','/products-for-children/hobby-and-creativity','358,359,361,360,357','2016-08-05 16:50:57','2016-08-05 16:50:57'),(357,356,0,0,'Рисование','drawing','/products-for-children/hobby-and-creativity/drawing','357','2016-08-05 16:50:57','2016-08-05 16:50:57'),(358,356,0,0,'Вышивание','embroidery','/products-for-children/hobby-and-creativity/embroidery','358','2016-08-05 16:50:57','2016-08-05 16:50:57'),(359,356,0,0,'Скрапбукинг','scrapbooking','/products-for-children/hobby-and-creativity/scrapbooking','359','2016-08-05 16:50:57','2016-08-05 16:50:57'),(360,356,0,0,'Оригами, квиллинг','origami-quilling','/products-for-children/hobby-and-creativity/origami-quilling','360','2016-08-05 16:50:58','2016-08-05 16:50:58'),(361,356,0,0,'Заготовки, декупаж','blanks-decoupage','/products-for-children/hobby-and-creativity/blanks-decoupage','361','2016-08-05 16:50:58','2016-08-05 16:50:58'),(362,338,0,0,'Питание и кормление','food-and-nutrition','/products-for-children/food-and-nutrition','364,363','2016-08-05 16:50:58','2016-08-05 16:50:58'),(363,362,0,0,'Детское питание','baby-food','/products-for-children/food-and-nutrition/baby-food','363','2016-08-05 16:50:58','2016-08-05 16:50:58'),(364,362,0,0,'Аксессуары для кормления','feeding-accessories','/products-for-children/food-and-nutrition/feeding-accessories','364','2016-08-05 16:50:58','2016-08-05 16:50:58'),(365,338,0,0,'Подгузники и гигиена','diapers-and-hygiene','/products-for-children/diapers-and-hygiene','367,366','2016-08-05 16:50:58','2016-08-05 16:50:58'),(366,365,0,0,'Косметика','cosmetics','/products-for-children/diapers-and-hygiene/cosmetics','366','2016-08-05 16:50:58','2016-08-05 16:50:58'),(367,365,0,0,'Для ванной','for-the-bathroom','/products-for-children/diapers-and-hygiene/for-the-bathroom','367','2016-08-05 16:50:58','2016-08-05 16:50:58'),(368,0,0,0,'Спортивные товары','sporting-goods','/sporting-goods','448,388,459,392,385,386,429,409,446,387,427,412,419,370,415,454,401,394,381,406,400,463,453,424,428,373,393,413,456,383,417,414,380,420,405,442,421,460,458,439,407,430,438,464,389,437,374,403,377,436,425,384,426,461,398,397,433,432,395,451,447,396,450,434,462,378,411,371,379,455,452,416,440,390,444,418,375,431,372,382,376,402,408,466,443,465,457,422,369,391,445,410,449,441,399,423,404,435','2016-08-05 16:50:59','2016-08-05 16:50:59'),(369,368,0,0,'Тренажеры и оборудование','simulators-and-equipment','/sporting-goods/simulators-and-equipment','379,371,380,376,381,372,375,378,370,377,373,374','2016-08-05 16:50:59','2016-08-05 16:50:59'),(370,369,0,0,'Беговые дорожки','treadmills','/sporting-goods/simulators-and-equipment/treadmills','370','2016-08-05 16:50:59','2016-08-05 16:50:59'),(371,369,0,0,'Орбитреки','cross-trainers','/sporting-goods/simulators-and-equipment/cross-trainers','371','2016-08-05 16:50:59','2016-08-05 16:50:59'),(372,369,0,0,'Велотренажеры','bicycles','/sporting-goods/simulators-and-equipment/bicycles','372','2016-08-05 16:50:59','2016-08-05 16:50:59'),(373,369,0,0,'Гребные тренажеры','rowing-machines','/sporting-goods/simulators-and-equipment/rowing-machines','373','2016-08-05 16:50:59','2016-08-05 16:50:59'),(374,369,0,0,'Силовые тренажеры','strength-training','/sporting-goods/simulators-and-equipment/strength-training','374','2016-08-05 16:50:59','2016-08-05 16:50:59'),(375,369,0,0,'Степперы','steppers','/sporting-goods/simulators-and-equipment/steppers','375','2016-08-05 16:51:00','2016-08-05 16:51:00'),(376,369,0,0,'Гантели, диски, грифы, замки','dumbbells-discs-bars-locks','/sporting-goods/simulators-and-equipment/dumbbells-discs-bars-locks','376','2016-08-05 16:51:00','2016-08-05 16:51:00'),(377,369,0,0,'Шведские стенки','the-wall','/sporting-goods/simulators-and-equipment/the-wall','377','2016-08-05 16:51:00','2016-08-05 16:51:00'),(378,369,0,0,'Кистевые тренажеры','spray-trainers','/sporting-goods/simulators-and-equipment/spray-trainers','378','2016-08-05 16:51:00','2016-08-05 16:51:00'),(379,369,0,0,'Перчатки и пояса','gloves-and-belt','/sporting-goods/simulators-and-equipment/gloves-and-belt','379','2016-08-05 16:51:00','2016-08-05 16:51:00'),(380,369,0,0,'Батуты и аксессуары','trampolines-and-accessories','/sporting-goods/simulators-and-equipment/trampolines-and-accessories','380','2016-08-05 16:51:00','2016-08-05 16:51:00'),(381,369,0,0,'Массажные столы','massage-tables','/sporting-goods/simulators-and-equipment/massage-tables','381','2016-08-05 16:51:00','2016-08-05 16:51:00'),(382,368,0,0,'Фитнес и аэробика','fitness-and-aerobics','/sporting-goods/fitness-and-aerobics','386,384,385,383','2016-08-05 16:51:00','2016-08-05 16:51:00'),(383,382,0,0,'Массажные обручи','massage-hoops','/sporting-goods/fitness-and-aerobics/massage-hoops','383','2016-08-05 16:51:00','2016-08-05 16:51:00'),(384,382,0,0,'Пояса и перчатки','the-belt-and-gloves','/sporting-goods/fitness-and-aerobics/the-belt-and-gloves','384','2016-08-05 16:51:00','2016-08-05 16:51:00'),(385,382,0,0,'Аксессуары для фитнеса','fitness-accessories','/sporting-goods/fitness-and-aerobics/fitness-accessories','385','2016-08-05 16:51:01','2016-08-05 16:51:01'),(386,382,0,0,'Одежда для фитнеса','clothes-for-fitness','/sporting-goods/fitness-and-aerobics/clothes-for-fitness','386','2016-08-05 16:51:01','2016-08-05 16:51:01'),(387,368,0,0,'Спортивное питание','sports-nutrition','/sporting-goods/sports-nutrition','397,394,389,395,388,393,396,392,390,391','2016-08-05 16:51:01','2016-08-05 16:51:01'),(388,387,0,0,'Аминокислоты','amino-acids','/sporting-goods/sports-nutrition/amino-acids','388','2016-08-05 16:51:01','2016-08-05 16:51:01'),(389,387,0,0,'Витамины','vitamins','/sporting-goods/sports-nutrition/vitamins','389','2016-08-05 16:51:01','2016-08-05 16:51:01'),(390,387,0,0,'Гейнеры','gainers','/sporting-goods/sports-nutrition/gainers','390','2016-08-05 16:51:01','2016-08-05 16:51:01'),(391,387,0,0,'Жиросжигатели','fat-burners','/sporting-goods/sports-nutrition/fat-burners','391','2016-08-05 16:51:01','2016-08-05 16:51:01'),(392,387,0,0,'Креатин','creatine','/sporting-goods/sports-nutrition/creatine','392','2016-08-05 16:51:01','2016-08-05 16:51:01'),(393,387,0,0,'Протеин','protein','/sporting-goods/sports-nutrition/protein','393','2016-08-05 16:51:01','2016-08-05 16:51:01'),(394,387,0,0,'Предтренировочные комплексы','pre-workout-supplement','/sporting-goods/sports-nutrition/pre-workout-supplement','394','2016-08-05 16:51:02','2016-08-05 16:51:02'),(395,387,0,0,'Специальные продукты','special-products','/sporting-goods/sports-nutrition/special-products','395','2016-08-05 16:51:02','2016-08-05 16:51:02'),(396,387,0,0,'Аксессуары для спортивного питания','accessories-for-sports-nutrition','/sporting-goods/sports-nutrition/accessories-for-sports-nutrition','396','2016-08-05 16:51:02','2016-08-05 16:51:02'),(397,387,0,0,'Энергетические батончики и мюсли','energy-bars-and-granola','/sporting-goods/sports-nutrition/energy-bars-and-granola','397','2016-08-05 16:51:02','2016-08-05 16:51:02'),(398,368,0,0,'Велосипеды и аксессуары','bikes-and-accessories','/sporting-goods/bikes-and-accessories','401,410,403,400,408,404,406,405,399,411,402,409,407','2016-08-05 16:51:02','2016-08-05 16:51:02'),(399,398,0,0,'Велосипеды','bikes','/sporting-goods/bikes-and-accessories/bikes','399','2016-08-05 16:51:02','2016-08-05 16:51:02'),(400,398,0,0,'Комплектующие для велосипедов','accessories-for-bicycles','/sporting-goods/bikes-and-accessories/accessories-for-bicycles','400','2016-08-05 16:51:02','2016-08-05 16:51:02'),(401,398,0,0,'Аксессуары для велосипедов','accessories-for-bicycles','/sporting-goods/bikes-and-accessories/accessories-for-bicycles','403,410,407,409,411,402,405,404,406,408','2016-08-05 16:51:02','2016-08-05 16:51:02'),(402,401,0,0,'Велокомпьютеры','tables','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/tables','402','2016-08-05 16:51:02','2016-08-05 16:51:02'),(403,401,0,0,'Велосипедные шлемы','bicycle-helmets','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/bicycle-helmets','403','2016-08-05 16:51:03','2016-08-05 16:51:03'),(404,401,0,0,'Велосипедные перчатки','cycling-gloves','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/cycling-gloves','404','2016-08-05 16:51:03','2016-08-05 16:51:03'),(405,401,0,0,'Велосипедные сумки','bicycle-bags','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/bicycle-bags','405','2016-08-05 16:51:03','2016-08-05 16:51:03'),(406,401,0,0,'Велосипедные фляги и крепления','cycling-and-jar-attachment','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/cycling-and-jar-attachment','406','2016-08-05 16:51:03','2016-08-05 16:51:03'),(407,401,0,0,'Велоодежда','cycling-wear','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/cycling-wear','407','2016-08-05 16:51:03','2016-08-05 16:51:03'),(408,401,0,0,'Велообувь','wellabove','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/wellabove','408','2016-08-05 16:51:03','2016-08-05 16:51:03'),(409,401,0,0,'Велорезина','velodrezina','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/velodrezina','409','2016-08-05 16:51:03','2016-08-05 16:51:03'),(410,401,0,0,'Велохимия для ремонта и ухода','velkymi-for-repairs-and-maintenance','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/velkymi-for-repairs-and-maintenance','410','2016-08-05 16:51:03','2016-08-05 16:51:03'),(411,401,0,0,'Спортивные очки','sports-glasses','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/sports-glasses','411','2016-08-05 16:51:03','2016-08-05 16:51:03'),(412,368,0,0,'Самокаты','scooters','/sporting-goods/scooters','412','2016-08-05 16:51:04','2016-08-05 16:51:04'),(413,368,0,0,'Роликовые коньки','roller-skates','/sporting-goods/roller-skates','413','2016-08-05 16:51:04','2016-08-05 16:51:04'),(414,368,0,0,'Игровые виды спорта','playing-sports','/sporting-goods/playing-sports','416,422,427,415,418,425,419,426,423,417,429,428,421,424,420','2016-08-05 16:51:04','2016-08-05 16:51:04'),(415,414,0,0,'Ракетки для настольного тенниса','racket-for-table-tennis','/sporting-goods/playing-sports/racket-for-table-tennis','415','2016-08-05 16:51:04','2016-08-05 16:51:04'),(416,414,0,0,'Наборы для настольного тенниса','sets-for-table-tennis','/sporting-goods/playing-sports/sets-for-table-tennis','416','2016-08-05 16:51:04','2016-08-05 16:51:04'),(417,414,0,0,'Мячи для настольного тенниса','balls-for-table-tennis','/sporting-goods/playing-sports/balls-for-table-tennis','417','2016-08-05 16:51:04','2016-08-05 16:51:04'),(418,414,0,0,'Столы для настольного тенниса','table-tennis','/sporting-goods/playing-sports/table-tennis','418','2016-08-05 16:51:05','2016-08-05 16:51:05'),(419,414,0,0,'Сетки для настольного тенниса','grid-for-table-tennis','/sporting-goods/playing-sports/grid-for-table-tennis','419','2016-08-05 16:51:05','2016-08-05 16:51:05'),(420,414,0,0,'Ракетки для большого тенниса','racket-for-the-big-tennis','/sporting-goods/playing-sports/racket-for-the-big-tennis','420','2016-08-05 16:51:05','2016-08-05 16:51:05'),(421,414,0,0,'Мячи для большого тенниса','balls-for-tennis','/sporting-goods/playing-sports/balls-for-tennis','421','2016-08-05 16:51:05','2016-08-05 16:51:05'),(422,414,0,0,'Бадминтон и спидминтон','badminton-and-speedminton','/sporting-goods/playing-sports/badminton-and-speedminton','422','2016-08-05 16:51:05','2016-08-05 16:51:05'),(423,414,0,0,'Все для сквоша','all-squash','/sporting-goods/playing-sports/all-squash','423','2016-08-05 16:51:05','2016-08-05 16:51:05'),(424,414,0,0,'Дартс','darts','/sporting-goods/playing-sports/darts','424','2016-08-05 16:51:05','2016-08-05 16:51:05'),(425,414,0,0,'Мячи для командных игр','balls-for-team-games','/sporting-goods/playing-sports/balls-for-team-games','425','2016-08-05 16:51:05','2016-08-05 16:51:05'),(426,414,0,0,'Баскетбольные щиты, кольца и стойки','basketball-backboards-rings-and-stands','/sporting-goods/playing-sports/basketball-backboards-rings-and-stands','426','2016-08-05 16:51:06','2016-08-05 16:51:06'),(427,414,0,0,'Бейсбол','baseball','/sporting-goods/playing-sports/baseball','427','2016-08-05 16:51:06','2016-08-05 16:51:06'),(428,414,0,0,'Одежда и экипировка для игрового спорта','the-clothes-and-equipment-for-playing-sports','/sporting-goods/playing-sports/the-clothes-and-equipment-for-playing-sports','428','2016-08-05 16:51:06','2016-08-05 16:51:06'),(429,414,0,0,'Аксессуары для игрового спорта','gaming-accessories-sports','/sporting-goods/playing-sports/gaming-accessories-sports','429','2016-08-05 16:51:06','2016-08-05 16:51:06'),(430,368,0,0,'Бассейн и аквафитнес','the-pool-and-aquagym','/sporting-goods/the-pool-and-aquagym','434,433,432,431','2016-08-05 16:51:06','2016-08-05 16:51:06'),(431,430,0,0,'Ласты для бассейна','flippers-for-swimming-pool','/sporting-goods/the-pool-and-aquagym/flippers-for-swimming-pool','431','2016-08-05 16:51:06','2016-08-05 16:51:06'),(432,430,0,0,'Очки для плавания','goggles','/sporting-goods/the-pool-and-aquagym/goggles','432','2016-08-05 16:51:06','2016-08-05 16:51:06'),(433,430,0,0,'Шапочки для плавания','a-swim-cap','/sporting-goods/the-pool-and-aquagym/a-swim-cap','433','2016-08-05 16:51:07','2016-08-05 16:51:07'),(434,430,0,0,'Аксессуары для плавания','swimming-accessories','/sporting-goods/the-pool-and-aquagym/swimming-accessories','434','2016-08-05 16:51:07','2016-08-05 16:51:07'),(435,368,0,0,'Зимние виды спорта','winter-sports','/sporting-goods/winter-sports','444,448,440,436,443,446,451,447,442,445,439,450,449,441,438,437','2016-08-05 16:51:07','2016-08-05 16:51:07'),(436,435,0,0,'Лыжи','ski','/sporting-goods/winter-sports/ski','436','2016-08-05 16:51:07','2016-08-05 16:51:07'),(437,435,0,0,'Лыжные палки','ski-poles','/sporting-goods/winter-sports/ski-poles','437','2016-08-05 16:51:07','2016-08-05 16:51:07'),(438,435,0,0,'Беговые ботинки','running-shoes','/sporting-goods/winter-sports/running-shoes','438','2016-08-05 16:51:07','2016-08-05 16:51:07'),(439,435,0,0,'Горнолыжные ботинки','ski-boots','/sporting-goods/winter-sports/ski-boots','439','2016-08-05 16:51:07','2016-08-05 16:51:07'),(440,435,0,0,'Лыжные крепления','ski-bindings','/sporting-goods/winter-sports/ski-bindings','440','2016-08-05 16:51:08','2016-08-05 16:51:08'),(441,435,0,0,'Коньки','skates','/sporting-goods/winter-sports/skates','441','2016-08-05 16:51:08','2016-08-05 16:51:08'),(442,435,0,0,'Клюшки','stick','/sporting-goods/winter-sports/stick','442','2016-08-05 16:51:08','2016-08-05 16:51:08'),(443,435,0,0,'Шайбы','washer','/sporting-goods/winter-sports/washer','443','2016-08-05 16:51:08','2016-08-05 16:51:08'),(444,435,0,0,'Хоккейная защита','hockey-protection','/sporting-goods/winter-sports/hockey-protection','444','2016-08-05 16:51:08','2016-08-05 16:51:08'),(445,435,0,0,'Форма для хоккея','form-for-hockey','/sporting-goods/winter-sports/form-for-hockey','445','2016-08-05 16:51:08','2016-08-05 16:51:08'),(446,435,0,0,'Санки и снегокаты','toboggans-and-kick-sledges','/sporting-goods/winter-sports/toboggans-and-kick-sledges','446','2016-08-05 16:51:08','2016-08-05 16:51:08'),(447,435,0,0,'Снегоступы','snow-boots','/sporting-goods/winter-sports/snow-boots','447','2016-08-05 16:51:08','2016-08-05 16:51:08'),(448,435,0,0,'Сноуборды','snowboards','/sporting-goods/winter-sports/snowboards','448','2016-08-05 16:51:09','2016-08-05 16:51:09'),(449,435,0,0,'Термобелье','underwear','/sporting-goods/winter-sports/underwear','449','2016-08-05 16:51:09','2016-08-05 16:51:09'),(450,435,0,0,'Универсальные головные уборы','universal-headgear','/sporting-goods/winter-sports/universal-headgear','450','2016-08-05 16:51:09','2016-08-05 16:51:09'),(451,435,0,0,'Аксессуары для зимнего спорта','accessories-for-winter-sports','/sporting-goods/winter-sports/accessories-for-winter-sports','451','2016-08-05 16:51:09','2016-08-05 16:51:09'),(452,368,0,0,'Бокс и единоборства','boxing-and-martial-arts','/sporting-goods/boxing-and-martial-arts','453,456,454,457,458,455,459','2016-08-05 16:51:09','2016-08-05 16:51:09'),(453,452,0,0,'Мешки и груши','bags-and-pears','/sporting-goods/boxing-and-martial-arts/bags-and-pears','453','2016-08-05 16:51:09','2016-08-05 16:51:09'),(454,452,0,0,'Лапы, макивары','paws-makivary','/sporting-goods/boxing-and-martial-arts/paws-makivary','454','2016-08-05 16:51:09','2016-08-05 16:51:09'),(455,452,0,0,'Форма','form','/sporting-goods/boxing-and-martial-arts/form','455','2016-08-05 16:51:09','2016-08-05 16:51:09'),(456,452,0,0,'Перчатки','gloves','/sporting-goods/boxing-and-martial-arts/gloves','456','2016-08-05 16:51:10','2016-08-05 16:51:10'),(457,452,0,0,'Шлемы','hats','/sporting-goods/boxing-and-martial-arts/hats','457','2016-08-05 16:51:10','2016-08-05 16:51:10'),(458,452,0,0,'Защита','protection','/sporting-goods/boxing-and-martial-arts/protection','458','2016-08-05 16:51:10','2016-08-05 16:51:10'),(459,452,0,0,'Аксессуары','accessories','/sporting-goods/boxing-and-martial-arts/accessories','459','2016-08-05 16:51:10','2016-08-05 16:51:10'),(460,368,0,0,'Спортивные аксессуары','sports-accessories','/sporting-goods/sports-accessories','465,466,464,463,462,461','2016-08-05 16:51:10','2016-08-05 16:51:10'),(461,460,0,0,'Спортивные сумки и чехлы','sports-bags-and-pouches','/sporting-goods/sports-accessories/sports-bags-and-pouches','461','2016-08-05 16:51:10','2016-08-05 16:51:10'),(462,460,0,0,'Рюкзаки и гермомешки','backpacks-and-waterproof-bags','/sporting-goods/sports-accessories/backpacks-and-waterproof-bags','462','2016-08-05 16:51:10','2016-08-05 16:51:10'),(463,460,0,0,'Спортивные бандажи, фиксаторы, напульсники','sports-braces-retainers-wristbands','/sporting-goods/sports-accessories/sports-braces-retainers-wristbands','463','2016-08-05 16:51:10','2016-08-05 16:51:10'),(464,460,0,0,'Спортивные очки','sports-glasses','/sporting-goods/sports-accessories/sports-glasses','464','2016-08-05 16:51:11','2016-08-05 16:51:11'),(465,460,0,0,'Спортивные чехлы для телефонов','sports-cell-phone-cases','/sporting-goods/sports-accessories/sports-cell-phone-cases','465','2016-08-05 16:51:11','2016-08-05 16:51:11'),(466,460,0,0,'Наушники для спортаТовары для дома','headphones-for-sporttovary-for-home','/sporting-goods/sports-accessories/headphones-for-sporttovary-for-home','466','2016-08-05 16:51:11','2016-08-05 16:51:11'),(467,0,0,0,'Техника','technique','/technique','476,489,483,486,488,479,472,485,473,477,475,481,480,469,471,484,482,478,487,474,490,470,468','2016-08-05 16:51:11','2016-08-05 16:51:11'),(468,467,0,0,'Телефоны и гаджеты','phones-and-gadgets','/technique/phones-and-gadgets','478,474,473,472,477,475,469,471,470,476','2016-08-05 16:51:11','2016-08-05 16:51:11'),(469,468,0,0,'Смартфоны, телефоны','smartphones-phones','/technique/phones-and-gadgets/smartphones-phones','469','2016-08-05 16:51:11','2016-08-05 16:51:11'),(470,468,0,0,'Планшеты','tablets','/technique/phones-and-gadgets/tablets','470','2016-08-05 16:51:11','2016-08-05 16:51:11'),(471,468,0,0,'Смарт-часы','smart-watch','/technique/phones-and-gadgets/smart-watch','471','2016-08-05 16:51:11','2016-08-05 16:51:11'),(472,468,0,0,'Игры и развлечения','games-and-entertainment','/technique/phones-and-gadgets/games-and-entertainment','472','2016-08-05 16:51:11','2016-08-05 16:51:11'),(473,468,0,0,'Игровые консоли','game-console','/technique/phones-and-gadgets/game-console','473','2016-08-05 16:51:12','2016-08-05 16:51:12'),(474,468,0,0,'Игры','game','/technique/phones-and-gadgets/game','474','2016-08-05 16:51:12','2016-08-05 16:51:12'),(475,468,0,0,'Аксессуары','accessories','/technique/phones-and-gadgets/accessories','475','2016-08-05 16:51:12','2016-08-05 16:51:12'),(476,468,0,0,'Мультимедиа','multimedia','/technique/phones-and-gadgets/multimedia','476','2016-08-05 16:51:12','2016-08-05 16:51:12'),(477,468,0,0,'Фото и видео техника','photo-and-video-equipment','/technique/phones-and-gadgets/photo-and-video-equipment','477','2016-08-05 16:51:12','2016-08-05 16:51:12'),(478,468,0,0,'Фотоаппараты','cameras','/technique/phones-and-gadgets/cameras','478','2016-08-05 16:51:12','2016-08-05 16:51:12'),(479,467,0,0,'Аксессуары','accessories','/technique/accessories','488,486,484,482,489,483,485,487,490,480,481','2016-08-05 16:51:12','2016-08-05 16:51:12'),(480,479,0,0,'Чехлы','covers','/technique/accessories/covers','482,481','2016-08-05 16:51:12','2016-08-05 16:51:12'),(481,480,0,0,'Для планшетов','for-tablets','/technique/accessories/covers/for-tablets','481','2016-08-05 16:51:13','2016-08-05 16:51:13'),(482,480,0,0,'Для телефонов','for-phones','/technique/accessories/covers/for-phones','482','2016-08-05 16:51:13','2016-08-05 16:51:13'),(483,479,0,0,'Зарядные устройства','charger','/technique/accessories/charger','483','2016-08-05 16:51:13','2016-08-05 16:51:13'),(484,479,0,0,'Внешние жесткие диски','external-hard-drives','/technique/accessories/external-hard-drives','484','2016-08-05 16:51:13','2016-08-05 16:51:13'),(485,479,0,0,'Кабели','cables','/technique/accessories/cables','485','2016-08-05 16:51:13','2016-08-05 16:51:13'),(486,479,0,0,'Защитные пленки','protective-film','/technique/accessories/protective-film','486','2016-08-05 16:51:13','2016-08-05 16:51:13'),(487,479,0,0,'Гарнитуры','headset','/technique/accessories/headset','487','2016-08-05 16:51:13','2016-08-05 16:51:13'),(488,479,0,0,'Колонки','speakers','/technique/accessories/speakers','488','2016-08-05 16:51:13','2016-08-05 16:51:13'),(489,479,0,0,'Моноподы','monopods','/technique/accessories/monopods','489','2016-08-05 16:51:13','2016-08-05 16:51:13'),(490,479,0,0,'Элементы питания','batteries','/technique/accessories/batteries','490','2016-08-05 16:51:14','2016-08-05 16:51:14'),(491,0,0,0,'Зоотовары','pet-shops','/pet-shops','501,531,500,507,516,494,505,517,502,526,524,528,504,525,535,521,495,503,514,518,519,499,506,527,529,520,513,508,497,496,511,534,509,510,523,512,515,522,498,530,492,532,533,493','2016-08-05 16:51:14','2016-08-05 16:51:14'),(492,491,0,0,'Кормление','feeding','/pet-shops/feeding','497,493,495,494,496','2016-08-05 16:51:14','2016-08-05 16:51:14'),(493,492,0,0,'Сухой корм','dry-food','/pet-shops/feeding/dry-food','493','2016-08-05 16:51:14','2016-08-05 16:51:14'),(494,492,0,0,'Консервы','canned','/pet-shops/feeding/canned','494','2016-08-05 16:51:14','2016-08-05 16:51:14'),(495,492,0,0,'Заменители молока','milk-replacers','/pet-shops/feeding/milk-replacers','495','2016-08-05 16:51:14','2016-08-05 16:51:14'),(496,492,0,0,'Кости и лакомства','bones-and-treats','/pet-shops/feeding/bones-and-treats','496','2016-08-05 16:51:14','2016-08-05 16:51:14'),(497,492,0,0,'Посуда','dishes','/pet-shops/feeding/dishes','497','2016-08-05 16:51:14','2016-08-05 16:51:14'),(498,491,0,0,'Здоровье','health','/pet-shops/health','499,500','2016-08-05 16:51:15','2016-08-05 16:51:15'),(499,498,0,0,'Витамины и добавки','vitamins-and-supplements','/pet-shops/health/vitamins-and-supplements','499','2016-08-05 16:51:15','2016-08-05 16:51:15'),(500,498,0,0,'Средства от блох и клещей','funds-from-fleas-and-ticks','/pet-shops/health/funds-from-fleas-and-ticks','500','2016-08-05 16:51:15','2016-08-05 16:51:15'),(501,491,0,0,'Уход и гигиена','care-and-hygiene','/pet-shops/care-and-hygiene','502,503,504','2016-08-05 16:51:15','2016-08-05 16:51:15'),(502,501,0,0,'Наполнители туалетов','fillers-toilets','/pet-shops/care-and-hygiene/fillers-toilets','502','2016-08-05 16:51:15','2016-08-05 16:51:15'),(503,501,0,0,'Туалеты','toilets','/pet-shops/care-and-hygiene/toilets','503','2016-08-05 16:51:15','2016-08-05 16:51:15'),(504,501,0,0,'Уход за ушами','care-for-the-ears','/pet-shops/care-and-hygiene/care-for-the-ears','504','2016-08-05 16:51:15','2016-08-05 16:51:15'),(505,491,0,0,'Средства по уходу','care','/pet-shops/care','507,508,509,506','2016-08-05 16:51:15','2016-08-05 16:51:15'),(506,505,0,0,'Инструменты по уходу','tools-to-care','/pet-shops/care/tools-to-care','506','2016-08-05 16:51:16','2016-08-05 16:51:16'),(507,505,0,0,'Пеленки и туалеты','diapers-and-toilets','/pet-shops/care/diapers-and-toilets','507','2016-08-05 16:51:16','2016-08-05 16:51:16'),(508,505,0,0,'Уход за полостью рта','care-for-the-oral-cavity','/pet-shops/care/care-for-the-oral-cavity','508','2016-08-05 16:51:16','2016-08-05 16:51:16'),(509,505,0,0,'Уход за ушами','care-for-the-ears','/pet-shops/care/care-for-the-ears','509','2016-08-05 16:51:16','2016-08-05 16:51:16'),(510,491,0,0,'Прогулки и путешествия','trips-and-travel','/pet-shops/trips-and-travel','515,512,514,511,513','2016-08-05 16:51:16','2016-08-05 16:51:16'),(511,510,0,0,'Поводки','leashes','/pet-shops/trips-and-travel/leashes','511','2016-08-05 16:51:16','2016-08-05 16:51:16'),(512,510,0,0,'Ошейники','collars','/pet-shops/trips-and-travel/collars','512','2016-08-05 16:51:16','2016-08-05 16:51:16'),(513,510,0,0,'Переноски и сумки','carrying-bags','/pet-shops/trips-and-travel/carrying-bags','513','2016-08-05 16:51:17','2016-08-05 16:51:17'),(514,510,0,0,'Амуниция и акессуары','ammunition-and-accessories','/pet-shops/trips-and-travel/ammunition-and-accessories','514','2016-08-05 16:51:17','2016-08-05 16:51:17'),(515,510,0,0,'Одежда','clothing','/pet-shops/trips-and-travel/clothing','515','2016-08-05 16:51:17','2016-08-05 16:51:17'),(516,491,0,0,'Дом и уют','home-and-comfort','/pet-shops/home-and-comfort','517,518,520,519,521','2016-08-05 16:51:17','2016-08-05 16:51:17'),(517,516,0,0,'Переноски','carrying','/pet-shops/home-and-comfort/carrying','517','2016-08-05 16:51:17','2016-08-05 16:51:17'),(518,516,0,0,'Будки, вольеры, загоны','kennels-cages-corrals','/pet-shops/home-and-comfort/kennels-cages-corrals','518','2016-08-05 16:51:18','2016-08-05 16:51:18'),(519,516,0,0,'Мягкие места и домики','soft-seats-and-houses','/pet-shops/home-and-comfort/soft-seats-and-houses','519','2016-08-05 16:51:18','2016-08-05 16:51:18'),(520,516,0,0,'Когтеточки','scratching-posts','/pet-shops/home-and-comfort/scratching-posts','520','2016-08-05 16:51:18','2016-08-05 16:51:18'),(521,516,0,0,'Игрушки','toys','/pet-shops/home-and-comfort/toys','521','2016-08-05 16:51:18','2016-08-05 16:51:18'),(522,491,0,0,'Аквариумы','aquariums','/pet-shops/aquariums','523,527,529,531,534,532,533,535,525,526,530,528,524','2016-08-05 16:51:18','2016-08-05 16:51:18'),(523,522,0,0,'Корм','food','/pet-shops/aquariums/food','523','2016-08-05 16:51:18','2016-08-05 16:51:18'),(524,522,0,0,'Аквариумные наборы','aquarium-set','/pet-shops/aquariums/aquarium-set','524','2016-08-05 16:51:18','2016-08-05 16:51:18'),(525,522,0,0,'Тумбы','thumbs','/pet-shops/aquariums/thumbs','525','2016-08-05 16:51:18','2016-08-05 16:51:18'),(526,522,0,0,'Крышки','cover','/pet-shops/aquariums/cover','526','2016-08-05 16:51:18','2016-08-05 16:51:18'),(527,522,0,0,'Обородувание для аквариумов','equipment-for-aquariums','/pet-shops/aquariums/equipment-for-aquariums','527','2016-08-05 16:51:19','2016-08-05 16:51:19'),(528,522,0,0,'Обогрев и охлаждение','heating-and-cooling','/pet-shops/aquariums/heating-and-cooling','528','2016-08-05 16:51:19','2016-08-05 16:51:19'),(529,522,0,0,'Фильтры','filters','/pet-shops/aquariums/filters','529','2016-08-05 16:51:19','2016-08-05 16:51:19'),(530,522,0,0,'Дополнительное оборудование для аквариумов','additional-equipment-for-aquariums','/pet-shops/aquariums/additional-equipment-for-aquariums','530','2016-08-05 16:51:19','2016-08-05 16:51:19'),(531,522,0,0,'Освещение','lighting','/pet-shops/aquariums/lighting','531','2016-08-05 16:51:19','2016-08-05 16:51:19'),(532,522,0,0,'Измерительные приборы','measuring-instruments','/pet-shops/aquariums/measuring-instruments','532','2016-08-05 16:51:19','2016-08-05 16:51:19'),(533,522,0,0,'Аксессуары к аквариумному оборудованию','accessories-aquarium-equipment','/pet-shops/aquariums/accessories-aquarium-equipment','533','2016-08-05 16:51:19','2016-08-05 16:51:19'),(534,522,0,0,'Декорации и грунты','the-scenery-and-soils','/pet-shops/aquariums/the-scenery-and-soils','534','2016-08-05 16:51:20','2016-08-05 16:51:20'),(535,522,0,0,'Аквариумная химия','aquarium-chemistry','/pet-shops/aquariums/aquarium-chemistry','535','2016-08-05 16:51:20','2016-08-05 16:51:20'),(536,0,0,0,'Огртехника','agritechnica','/agritechnica','538,540,539,537,542,541,543','2016-08-05 16:51:20','2016-08-05 16:51:20'),(537,536,0,0,'Клавиатуры','keyboard','/agritechnica/keyboard','537','2016-08-05 16:51:20','2016-08-05 16:51:20'),(538,536,0,0,'Ленты для принтера','ribbon-for-printer','/agritechnica/ribbon-for-printer','538','2016-08-05 16:51:20','2016-08-05 16:51:20'),(539,536,0,0,'Маршрутизаторы','routers','/agritechnica/routers','539','2016-08-05 16:51:20','2016-08-05 16:51:20'),(540,536,0,0,'МФУ','mfp','/agritechnica/mfp','540','2016-08-05 16:51:20','2016-08-05 16:51:20'),(541,536,0,0,'Мыши','mouse','/agritechnica/mouse','541','2016-08-05 16:51:20','2016-08-05 16:51:20'),(542,536,0,0,'Принтеры','printers','/agritechnica/printers','542','2016-08-05 16:51:21','2016-08-05 16:51:21'),(543,536,0,0,'Умный дом','smart-home','/agritechnica/smart-home','543','2016-08-05 16:51:21','2016-08-05 16:51:21'),(544,0,0,0,'Хобби и Творчество','hobby-and-creativity','/hobby-and-creativity','549,546,547,545,548','2016-08-05 16:51:21','2016-08-05 16:51:21'),(545,544,0,0,'Лепка','modeling','/hobby-and-creativity/modeling','545','2016-08-05 16:51:21','2016-08-05 16:51:21'),(546,544,0,0,'Пазлы','puzzles','/hobby-and-creativity/puzzles','546','2016-08-05 16:51:21','2016-08-05 16:51:21'),(547,544,0,0,'Модели для склеивания','models-for-bonding','/hobby-and-creativity/models-for-bonding','547','2016-08-05 16:51:21','2016-08-05 16:51:21'),(548,544,0,0,'Прочие наборы для творчества','other-kits','/hobby-and-creativity/other-kits','548','2016-08-05 16:51:21','2016-08-05 16:51:21'),(549,544,0,0,'Рукоделие','needlework','/hobby-and-creativity/needlework','549','2016-08-05 16:51:21','2016-08-05 16:51:21');
/*!40000 ALTER TABLE `category3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `currency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `default` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'HILT','HILT',1),(2,'Гривна','UAH',0),(3,'Доллар США','USD',0),(4,'Евро','EUR',0);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_exchange_rates`
--

DROP TABLE IF EXISTS `currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_exchange_rates` (
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currency_id` int(10) unsigned NOT NULL,
  `val` int(10) unsigned NOT NULL,
  KEY `index1` (`date_create`,`currency_id`,`val`),
  KEY `fk_currency_exchange_rates_1_idx` (`currency_id`),
  CONSTRAINT `fk_currency_exchange_rates_1` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_exchange_rates`
--

LOCK TABLES `currency_exchange_rates` WRITE;
/*!40000 ALTER TABLE `currency_exchange_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `delivery_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `default_cost` int(11) unsigned NOT NULL DEFAULT '45',
  `url` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`delivery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Новая почта по Киеву',45,'','Ваш заказ будет доставлен в удобное для Вас время c понедельника по субботу в течении дня с 9:00 до 18:00'),(2,'Мост экспресс из отделения',45,'https://meest-express.com.ua/ua/branches',''),(3,'Курьер по Киеву',45,'',''),(4,'Новая почта из отделения',45,'https://novaposhta.ua/ru/office',''),(5,'Укрпочта из отделения',35,'','ВНИМАНИЕ! Отправка товара Укрпочтой только по предварительной оплате. Квитанцию на оплату Вам вышлет наш оператор после подтверждения заказа.');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_product_1c`
--

DROP TABLE IF EXISTS `export_product_1c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_product_1c` (
  `export_product_1c_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`export_product_1c_id`),
  KEY `fk_1c_export_product_1_idx` (`product_id`),
  CONSTRAINT `fk_1c_export_product_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_product_1c`
--

LOCK TABLES `export_product_1c` WRITE;
/*!40000 ALTER TABLE `export_product_1c` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_product_1c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature` (
  `feature_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `overflow` int(1) NOT NULL DEFAULT '0' COMMENT '0 - не активна на сайте\n1 - активна главная ( есть в фильтр и в продукте )\n2 - активна простая ( скрыта фильтре и есть в продукте )',
  `title` varchar(90) NOT NULL,
  `title_en` varchar(90) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '\n',
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES (1,1,1,'Цвет','color','2016-06-06 09:56:33'),(2,1,1,'Размер','size','2016-06-06 10:10:40'),(3,1,1,'Бренд','brand','2016-06-06 10:19:43'),(4,1,1,'Страна производитель','manufacturer country','2016-06-06 10:21:36'),(5,1,1,'Материал','material','2016-08-05 14:14:32'),(6,1,1,'Пол','sex','2016-08-05 14:16:28'),(8,1,1,'Литраж','displacement','2016-08-05 16:01:49'),(9,1,1,'Фосфатая','fosfatny','2016-08-05 16:05:25'),(10,1,1,'Бесфосфатная','besfosfatny','2016-08-05 16:05:25'),(11,1,1,'Обьем','bulk','2016-08-05 16:07:06'),(12,1,1,'Состав','composition','2016-08-05 16:11:09'),(13,1,1,'Цоколь','plinth','2016-08-05 16:13:49'),(20,1,0,'Уход за изделием','','2016-09-22 17:39:52'),(21,1,0,'Параметры','','2016-09-30 16:26:08');
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature2group`
--

DROP TABLE IF EXISTS `feature2group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature2group` (
  `feature_group_id` int(10) unsigned NOT NULL,
  `feature_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`feature_group_id`),
  KEY `index2` (`feature_group_id`,`feature_id`),
  KEY `fk_feature2group_2_idx` (`feature_id`),
  CONSTRAINT `fk_feature2group_1` FOREIGN KEY (`feature_group_id`) REFERENCES `feature_group` (`feature_group_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_feature2group_2` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature2group`
--

LOCK TABLES `feature2group` WRITE;
/*!40000 ALTER TABLE `feature2group` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature2group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature2value`
--

DROP TABLE IF EXISTS `feature2value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature2value` (
  `feature2value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `feature_id` int(10) unsigned NOT NULL,
  `default` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 - нет\n1 - да',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`feature2value_id`),
  KEY `feature_id_UNIQUE` (`feature_id`,`value`),
  CONSTRAINT `fk_feature2value_1` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature2value`
--

LOCK TABLES `feature2value` WRITE;
/*!40000 ALTER TABLE `feature2value` DISABLE KEYS */;
INSERT INTO `feature2value` VALUES (29,1,0,'Синий'),(30,5,0,'Хлопок'),(31,5,0,'Спандекс'),(32,3,0,'Adelin Fostayn'),(33,20,0,'Деликатная машинная и ручная стирка 30С, без сушки в центрафуге. Гладить можно с увлажнителем.'),(34,4,0,'Венгрия'),(35,2,0,'XL'),(36,2,0,'L'),(37,5,0,'Полиэстер'),(38,5,0,'Вискоза'),(39,4,0,'Украина'),(40,1,0,'Бежевый'),(41,21,0,'Ткань - французский трикотаж, турецкая двунитка. Сзади потайная змейка. Длина - 105см.'),(42,3,0,'Azuri'),(43,2,0,'S'),(44,2,0,'M'),(45,5,0,'Шерсть');
/*!40000 ALTER TABLE `feature2value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_group`
--

DROP TABLE IF EXISTS `feature_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature_group` (
  `feature_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `overflow` int(1) NOT NULL DEFAULT '0' COMMENT '0 - скрыта на сайте (визуально)\n1 - активна на сайте',
  `title` varchar(255) NOT NULL DEFAULT '',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`feature_group_id`,`overflow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_group`
--

LOCK TABLES `feature_group` WRITE;
/*!40000 ALTER TABLE `feature_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_type`
--

DROP TABLE IF EXISTS `feature_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature_type` (
  `feature_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `class` varchar(128) DEFAULT NULL,
  `item_class` varchar(128) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`feature_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_type`
--

LOCK TABLES `feature_type` WRITE;
/*!40000 ALTER TABLE `feature_type` DISABLE KEYS */;
INSERT INTO `feature_type` VALUES (1,'Цвет','color-selector detail-info-entry','entry',NULL);
/*!40000 ALTER TABLE `feature_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `md5_hex` varchar(45) NOT NULL,
  `w` int(4) NOT NULL,
  `h` int(4) NOT NULL,
  `origin_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `md5_UNIQUE` (`md5_hex`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (21,'bd01655f618f9b801b430f6ae8506cf7',1200,1200,'1.jpg','1.jpg','bd/01/1.jpg',1,'2016-10-05 14:35:54'),(22,'bf9d82f480699bb5c9616c6940886d76',1200,1200,'1_2.jpg','1_2.jpg','bf/9d/1_2.jpg',1,'2016-10-05 14:35:54'),(23,'0e0dd1b5ddd6ffd02b584970de346243',1200,1200,'2.jpg','2.jpg','0e/0d/2.jpg',1,'2016-10-05 14:35:57'),(24,'72d5b9d94976ae1eaf3ec9b8e69d474c',1200,1200,'2_2.jpg','2_2.jpg','72/d5/2_2.jpg',1,'2016-10-05 14:35:57'),(25,'6f55d50581e3dd25207a82d24890f7ac',1200,1200,'3.jpg','3.jpg','6f/55/3.jpg',1,'2016-10-05 14:35:58'),(26,'5bd7104c30f3a5940d4dba9958468ba5',1200,1200,'3_1.jpg','3_1.jpg','5b/d7/3_1.jpg',1,'2016-10-05 14:35:59'),(27,'7ccc93ec6c10229ca40b21cc7b94a027',1200,1200,'3_2.jpg','3_2.jpg','7c/cc/3_2.jpg',1,'2016-10-05 14:35:59');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image2product`
--

DROP TABLE IF EXISTS `image2product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image2product` (
  `image2product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image_id` int(10) unsigned NOT NULL,
  `w` int(4) unsigned NOT NULL,
  `h` int(4) unsigned NOT NULL,
  `md5_hex` varchar(45) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `origin_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`image2product_id`),
  UNIQUE KEY `md5_hex_UNIQUE` (`md5_hex`),
  KEY `fk_image2product_1_idx` (`product_id`),
  KEY `index` (`product_id`,`image_id`,`w`,`h`),
  KEY `fk_image2product_1_idx1` (`image_id`),
  CONSTRAINT `fk_image2product_1` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_image2product_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image2product`
--

LOCK TABLES `image2product` WRITE;
/*!40000 ALTER TABLE `image2product` DISABLE KEYS */;
INSERT INTO `image2product` VALUES (22,7,21,121,141,'d6e164de850007a388ba18fac15367bb','d6/e1/1.jpg','2016-10-05 14:35:55',1,'1.jpg','1.jpg'),(23,7,22,121,141,'977092e2c033c0479143c16df3c805b7','97/70/1_2.jpg','2016-10-05 14:35:55',1,'1_2.jpg','1_2.jpg'),(24,7,21,465,624,'49827628c19b3ab2bef12510a3a0a559','49/82/1.jpg','2016-10-05 14:35:55',1,'1.jpg','1.jpg'),(25,7,22,465,624,'982563076df5bbc1eb209f8c77328380','98/25/1_2.jpg','2016-10-05 14:35:55',1,'1_2.jpg','1_2.jpg'),(26,7,21,192,265,'b82857f2915e835e93241abd832a2e27','b8/28/1.jpg','2016-10-05 14:35:55',1,'1.jpg','1.jpg'),(27,7,22,192,265,'819c493072e29e1c1b8d7297383a96dd','81/9c/1_2.jpg','2016-10-05 14:35:55',1,'1_2.jpg','1_2.jpg'),(28,8,23,121,141,'d7753ffd51075b53ed958131c4634adb','d7/75/2.jpg','2016-10-05 14:35:57',1,'2.jpg','2.jpg'),(29,8,24,121,141,'114645493a002c94951af24406326916','11/46/2_2.jpg','2016-10-05 14:35:57',1,'2_2.jpg','2_2.jpg'),(30,8,23,465,624,'6e8e4f6531eacbb348cebb8beccf73de','6e/8e/2.jpg','2016-10-05 14:35:57',1,'2.jpg','2.jpg'),(31,8,24,465,624,'674e5e98582f3492042ada676368ad67','67/4e/2_2.jpg','2016-10-05 14:35:57',1,'2_2.jpg','2_2.jpg'),(32,8,23,192,265,'157f113d93ad8ddf0ec69e62fa8137bf','15/7f/2.jpg','2016-10-05 14:35:57',1,'2.jpg','2.jpg'),(33,8,24,192,265,'2911e258fc6653906f77dd4252839840','29/11/2_2.jpg','2016-10-05 14:35:57',1,'2_2.jpg','2_2.jpg'),(34,9,25,121,141,'4e8657d3fbea17e8c46b2cfd0f05c71e','4e/86/3.jpg','2016-10-05 14:35:59',1,'3.jpg','3.jpg'),(35,9,26,121,141,'37cfd7edbe6f00995d633b66387649ad','37/cf/3_1.jpg','2016-10-05 14:35:59',1,'3_1.jpg','3_1.jpg'),(36,9,27,121,141,'de11e75f79ea375081e46b0cb6139582','de/11/3_2.jpg','2016-10-05 14:35:59',1,'3_2.jpg','3_2.jpg'),(37,9,25,465,624,'004d6be89f0818ffa3de7ab1054d1ef5','00/4d/3.jpg','2016-10-05 14:35:59',1,'3.jpg','3.jpg'),(38,9,26,465,624,'6a61279be75814f0cdfd00f5355b6db8','6a/61/3_1.jpg','2016-10-05 14:35:59',1,'3_1.jpg','3_1.jpg'),(39,9,27,465,624,'b1152d4eebca8579cc2329f35ca2daf0','b1/15/3_2.jpg','2016-10-05 14:35:59',1,'3_2.jpg','3_2.jpg'),(40,9,25,192,265,'1f4aa82611b73ccce34f6d3141a7c011','1f/4a/3.jpg','2016-10-05 14:35:59',1,'3.jpg','3.jpg'),(41,9,26,192,265,'0cffad599f205741edd87a9abbf928fa','0c/ff/3_1.jpg','2016-10-05 14:35:59',1,'3_1.jpg','3_1.jpg'),(42,9,27,192,265,'7308f3f9c632da9e42e36fc34a5d9ee3','73/08/3_2.jpg','2016-10-05 14:35:59',1,'3_2.jpg','3_2.jpg');
/*!40000 ALTER TABLE `image2product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `manager_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`manager_id`),
  KEY `fk_new_table_1_idx` (`user_id`),
  CONSTRAINT `fk_new_table_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status_id` int(3) unsigned NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `index2` (`user_id`,`status_id`),
  KEY `fk_order_2_idx` (`status_id`),
  CONSTRAINT `fk_order_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`order_status_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order2product`
--

DROP TABLE IF EXISTS `order2product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order2product` (
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `status_id` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 - не укомплектован\n2 - укомплектован\n3 - отмена',
  `description` varchar(500) DEFAULT NULL COMMENT 'для адинистрирования',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price_usd` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price_eur` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order2product`
--

LOCK TABLES `order2product` WRITE;
/*!40000 ALTER TABLE `order2product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order2product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `order_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_auto` int(1) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT 'Кто завел продукт',
  `depth` int(10) unsigned NOT NULL DEFAULT '0',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `heigth` int(10) unsigned NOT NULL DEFAULT '0',
  `weight` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_id` int(10) unsigned NOT NULL DEFAULT '1',
  `rating` int(1) NOT NULL DEFAULT '0',
  `barcode` varchar(32) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `tag_title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL,
  `tag_description` varchar(255) NOT NULL DEFAULT '',
  `tag_keywords` varchar(255) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `fk_product_1_idx` (`unit_id`),
  KEY `fk_product_2_idx` (`user_id`),
  KEY `index5` (`barcode`),
  CONSTRAINT `fk_product_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (7,1,0,0,0,0,5,1,2,'34567','kardigan-rouz','Кардиган Роуз','','Комфортный кардиган свободного силуэта с рукавом 7/8. По полочке для удобства предусмотрены накладные карманы. Изделие украшает контрастная отделка. Комфортен и практичен в ношении.','','','2016-10-05 14:35:25','2016-10-25 16:30:21'),(8,1,0,0,0,0,5,1,2,'34568','kardigan-emmi','Кардиган Эмми','','Стильный кардиган свободного силуэта с отворотами, выполненный из качественного материала. Модель с укороченным рукавом, без застежки. Отличный вариант для повседневного гардероба!','','','2016-10-05 14:35:26','2016-10-25 16:30:41'),(9,1,0,0,0,0,30,1,5,'34569','plate-miranda-bezhevoe','Платье Миранда бежевое','','Невероятно легкая, стильная одежда для настоящих модниц. Украсьте свое лето с яркой одеждой производителя качественной современной одежды!','','','2016-10-05 14:35:26','2016-10-25 16:30:44');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product2category`
--

DROP TABLE IF EXISTS `product2category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product2category` (
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`,`product_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`,`product_id`),
  KEY `fk_product2category_1_idx` (`product_id`),
  CONSTRAINT `fk_product2category_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_product2category_2` FOREIGN KEY (`category_id`) REFERENCES `category3` (`category_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product2category`
--

LOCK TABLES `product2category` WRITE;
/*!40000 ALTER TABLE `product2category` DISABLE KEYS */;
INSERT INTO `product2category` VALUES (46,7,'2016-10-25 16:30:27'),(46,8,'2016-10-25 16:30:41'),(46,9,'2016-10-25 16:30:44');
/*!40000 ALTER TABLE `product2category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product2feature2value`
--

DROP TABLE IF EXISTS `product2feature2value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product2feature2value` (
  `product2feature2value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `feature2value_id` int(10) unsigned NOT NULL,
  `sub_value` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`product2feature2value_id`),
  UNIQUE KEY `product_id_UNIQUE` (`product_id`,`feature2value_id`),
  KEY `fk_product2feature2value_2_idx` (`feature2value_id`),
  CONSTRAINT `fk_product2feature2value_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_product2feature2value_2` FOREIGN KEY (`feature2value_id`) REFERENCES `feature2value` (`feature2value_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product2feature2value`
--

LOCK TABLES `product2feature2value` WRITE;
/*!40000 ALTER TABLE `product2feature2value` DISABLE KEYS */;
INSERT INTO `product2feature2value` VALUES (148,7,33,''),(149,7,32,''),(150,7,34,''),(151,7,30,'97'),(152,7,31,'3'),(153,7,36,'3'),(154,7,35,'2'),(155,7,29,''),(158,8,36,'3'),(159,8,35,'2'),(160,8,32,''),(161,8,34,''),(162,8,31,'3'),(163,8,30,'97'),(164,8,33,''),(165,9,42,''),(166,9,38,'40'),(167,9,37,'55'),(168,9,45,'5'),(169,9,39,''),(170,9,40,''),(172,9,41,''),(173,9,43,'10'),(174,9,36,'5'),(175,9,35,'12'),(176,9,44,'3');
/*!40000 ALTER TABLE `product2feature2value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product2sale`
--

DROP TABLE IF EXISTS `product2sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product2sale` (
  `product2sale_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `price` int(11) unsigned NOT NULL DEFAULT '0',
  `price_after` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product2sale_id`),
  KEY `fk_product2sale_1_idx` (`sale_id`),
  KEY `fk_product2sale_2_idx` (`product_id`),
  CONSTRAINT `fk_product2sale_1` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`sale_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_product2sale_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product2sale`
--

LOCK TABLES `product2sale` WRITE;
/*!40000 ALTER TABLE `product2sale` DISABLE KEYS */;
INSERT INTO `product2sale` VALUES (1,1,7,10000,10000),(2,2,8,90000,95000),(3,2,9,40000,513000);
/*!40000 ALTER TABLE `product2sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price` (
  `product_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL DEFAULT '2',
  `current` int(10) unsigned NOT NULL DEFAULT '0',
  `prev` int(10) unsigned NOT NULL DEFAULT '0',
  `supplier` int(10) unsigned NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `fk_product_price_1_idx` (`currency_id`),
  KEY `index3` (`currency_id`,`current`),
  CONSTRAINT `fk_product_price_1` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_price_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price`
--

LOCK TABLES `product_price` WRITE;
/*!40000 ALTER TABLE `product_price` DISABLE KEYS */;
INSERT INTO `product_price` VALUES (7,2,84000,0,0,'2016-10-05 14:35:26','2016-10-25 16:30:28'),(8,2,94000,0,0,'2016-10-05 14:35:26','2016-10-25 16:30:41'),(9,2,51300,0,0,'2016-10-05 14:35:26','2016-10-25 16:30:44');
/*!40000 ALTER TABLE `product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `sale_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `saletype_id` int(10) unsigned NOT NULL DEFAULT '1',
  `value` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_end` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `url` varchar(1000) NOT NULL DEFAULT '',
  `url_md5` varchar(45) NOT NULL,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `index3` (`url_md5`),
  KEY `fk_sale_1_idx` (`saletype_id`),
  CONSTRAINT `fk_sale_1` FOREIGN KEY (`saletype_id`) REFERENCES `sale_type` (`saletype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,1,40,1,'2016-10-17 13:03:07','2016-10-21 16:03:07','Натуральная индийская косметика для волос: масла, шампуни, кондиционеры от 30 грн','Косметические средства для ухода за волосами и кожей головы от индийских брендов Parachute, Mayur и Hair&Care помогут славянским красавицам отрастить обалденную шевелюру на зависть соперницам. С косметикой из нашей коллекции Вы:\n\n- восстановите ослабленные и тусклые волосы, вернёте им утраченную силу,\n\n-избавитесь от сезонного выпадения волос,\n\n-облегчите расчесывание,\n\n-нормализуете жирность кожи головы и волос,\n\n- сделаете волосы более блестящими.\n\nМасла содержат большое количество природных веществ, необходимых для здоровья и красоты, витамины и микроэлементы. Благодаря этому они эффективно защитят волосы от ломкости, обеспечат термозащиту при укладке и предотвратят образование секущихся кончиков.\n\nВ комплексе с уникальными индийскими травами масла ухаживают за волосами, не утяжеляя их и не увеличивая жирность кожи головы.','naturalnaya-indijskaya-kosmetika-dlya-volos-masla-shampuni-kondicionery-ot-30-grn','b87dfa7243f7b0c43771ad3093cd0a13'),(2,1,20,1,'2016-10-17 14:03:41','2016-10-18 14:03:41','СТОК - женские ремни Zara, Stradivarius, Next и другие бренды от 99 грн','Стильные женские ремни и пояса – неотъемлемые предметы женского гардероба, которые выполняют не только практичные функции, но используются как значимые, декоративные аксессуары. Правильно подобранный ремень выгодно подчеркнет талию, придаст имиджу новые оттенки и продемонстрирует утонченный вкус своей обладательницы.\n\nВ этой коллекции представлены женские ремни от известных брендов, среди которых Zara, Stradivarius, Next, изготовлены из полиуретана, кожзама и кожи. Такие аксессуары гармонично смотрятся со свободными и слегка удлиненными блузами, платьями и туниками. Благодаря своей лаконичности, все модели будут хорошо носиться с брюками или джансами. Ремни из этой акции различны, присутствуют модели с имитацией кожи рептилий, с кожаными узорами и тиснениями, художественной перфорацией и плетеными элементами. Они выгодно украсят и оживят наряд.','stok-zhenskie-remni-zara-stradivarius-next-i-drugie-brendy-ot-99-grn','af027ea47fe38e2c45dd2c2d86cf5134');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_type`
--

DROP TABLE IF EXISTS `sale_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_type` (
  `saletype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`saletype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_type`
--

LOCK TABLES `sale_type` WRITE;
/*!40000 ALTER TABLE `sale_type` DISABLE KEYS */;
INSERT INTO `sale_type` VALUES (1,'Скидка %'),(2,'Скидка грн'),(3,'Подарок');
/*!40000 ALTER TABLE `sale_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_user2source`
--

DROP TABLE IF EXISTS `stat_user2source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_user2source` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Каналы входа',
  `source` varchar(500) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `index2` (`user_id`,`source`(255)),
  CONSTRAINT `fk_stat_user2source_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_user2source`
--

LOCK TABLES `stat_user2source` WRITE;
/*!40000 ALTER TABLE `stat_user2source` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_user2source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplier_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `fk_supplier_1_idx` (`user_id`),
  CONSTRAINT `fk_supplier_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Hilt','2016-08-17 11:50:24',1);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier2manager`
--

DROP TABLE IF EXISTS `supplier2manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier2manager` (
  `supplier2manager_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) unsigned NOT NULL,
  `manager_id` int(10) unsigned NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier2manager_id`),
  KEY `fk_supplier2manager_1_idx` (`supplier_id`),
  KEY `fk_supplier2manager_2_idx` (`manager_id`),
  CONSTRAINT `fk_supplier2manager_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier2manager_2` FOREIGN KEY (`manager_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier2manager`
--

LOCK TABLES `supplier2manager` WRITE;
/*!40000 ALTER TABLE `supplier2manager` DISABLE KEYS */;
INSERT INTO `supplier2manager` VALUES (1,1,3,'2016-08-17 11:54:49');
/*!40000 ALTER TABLE `supplier2manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `unit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `default` int(1) unsigned NOT NULL DEFAULT '0',
  `code` varchar(10) NOT NULL,
  `code2` varchar(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,1,'2009','0796','Штука'),(2,0,'2010','0783','Десять штук'),(3,0,'2123','0704','Набoр (товару)');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_product_1c`
--

DROP TABLE IF EXISTS `update_product_1c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_product_1c` (
  `update_product_1c_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`update_product_1c_id`),
  KEY `fk_1c_update_product_1_idx` (`product_id`),
  CONSTRAINT `fk_1c_update_product_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_product_1c`
--

LOCK TABLES `update_product_1c` WRITE;
/*!40000 ALTER TABLE `update_product_1c` DISABLE KEYS */;
/*!40000 ALTER TABLE `update_product_1c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_id` int(10) unsigned NOT NULL,
  `sex` int(1) DEFAULT NULL COMMENT '0 - male\n1 - femail',
  `access` int(1) NOT NULL DEFAULT '0' COMMENT '0 -  доступ закрыт\n1 - доступ открыт\n2 - доступ заблокирован',
  `access_delete` int(1) NOT NULL DEFAULT '1',
  `mail` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Имя',
  `last_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Фамилия',
  `patronymic` varchar(255) NOT NULL DEFAULT '',
  `fio` varchar(500) NOT NULL COMMENT 'Со старого сайта',
  `address` varchar(500) NOT NULL DEFAULT '' COMMENT 'Адрес доставки\n',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Отчество',
  PRIMARY KEY (`user_id`,`mail`),
  UNIQUE KEY `mail_UNIQUE` (`mail`),
  KEY `index4` (`access`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,0,1,1,0,'hotjobs@yandex.ru','Сергей','Штогаренко','Андреевич','','','2016-05-24 16:50:46','2016-05-26 16:04:11'),(3,0,1,1,1,'flashersha@gmail.com','Пупкин-2','Баер','','','','2016-05-25 17:52:48','2016-05-26 16:04:11'),(14,0,1,1,1,'hotjobs@ya.ru','Пупкин-4','Контенщик','','','','2016-05-26 16:32:59','2016-05-26 16:32:59'),(15,0,1,1,1,'andrey@shtogarenko.pp.ua','Сергей','Копирайтер','','','','2016-05-26 17:00:59','2016-05-26 17:00:59');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user2admin`
--

DROP TABLE IF EXISTS `user2admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user2admin` (
  `user_id` int(10) unsigned NOT NULL,
  `access_id` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '0 - не активна\n1 - активна\n2 - заблокирован',
  `user_admin_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user2admin_1_idx` (`user_admin_group_id`),
  CONSTRAINT `fk_user2admin_1` FOREIGN KEY (`user_admin_group_id`) REFERENCES `user_admin_group` (`user_admin_group_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user2admin_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user2admin`
--

LOCK TABLES `user2admin` WRITE;
/*!40000 ALTER TABLE `user2admin` DISABLE KEYS */;
INSERT INTO `user2admin` VALUES (1,1,1),(3,1,2),(14,1,4),(15,1,3);
/*!40000 ALTER TABLE `user2admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user2phone`
--

DROP TABLE IF EXISTS `user2phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user2phone` (
  `user_id` int(10) unsigned NOT NULL,
  `number` varchar(45) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `index2` (`user_id`,`number`),
  CONSTRAINT `fk_user2phone_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user2phone`
--

LOCK TABLES `user2phone` WRITE;
/*!40000 ALTER TABLE `user2phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `user2phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user2session`
--

DROP TABLE IF EXISTS `user2session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user2session` (
  `session` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(128) NOT NULL,
  `confirm` int(1) NOT NULL DEFAULT '0',
  `user_agent_md5` varchar(45) NOT NULL,
  `user_agent` varchar(500) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`session`),
  UNIQUE KEY `session_UNIQUE` (`session`,`user_id`,`ip`,`user_agent_md5`),
  KEY `fk_user2session_1_idx` (`user_id`),
  CONSTRAINT `fk_user2session_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user2session`
--

LOCK TABLES `user2session` WRITE;
/*!40000 ALTER TABLE `user2session` DISABLE KEYS */;
INSERT INTO `user2session` VALUES ('0b17168ccdec757b92828a4c59b442c3',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:44:47'),('170500b30cb904b00e5e13b3c77be948',1,'127.0.0.1',0,'6bc7f39a49172c82ff5afb2d951d8bc3','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.113 Safari/537.36','2016-09-14 13:56:07'),('2a9cb24f0dfa3aab4c43ff93f3466873',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:15:55'),('35a6a2ab9a2dab149e981ba239f118c8',1,'127.0.0.1',0,'4997998da8e02aa049e9dbdf3d1cb200','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36','2016-09-14 14:05:55'),('3fb50e6b50719e3b9bc50304084baafb',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:59:34'),('520bc710c6b3211f4b6c6bdba5b2c506',1,'127.0.0.1',0,'4997998da8e02aa049e9dbdf3d1cb200','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36','2016-09-19 14:07:20'),('642b236a66539738b641fc3ded96c00f',1,'192.168.1.3',0,'5edaa0d7cdcfd01ae7718147b0d7ba2c','Mozilla/5.0 (Linux; Android 4.4.2; YOGA Tablet 2-1050L Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.89 Safari/537.36','2016-08-25 13:30:38'),('6df6131051142ba4efecee366a0c431b',1,'127.0.0.1',0,'77d4665d09fc560e08b87156fefd27a8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','2016-09-06 09:20:54'),('8127daca894257ee203631a2bfb0db4a',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:20:26'),('93eac93b672db866cc7736af0a3f0bbe',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 16:51:31'),('9754519613793723ad254811aac2dea7',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-12 14:36:36'),('ada9ae62ee49bc19b288ed526c6a0c0a',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-12 14:15:33'),('b2ff380148cadb4122448c723ae25a31',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:50:32'),('b892174d6efdc8f88742235c07beabd7',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:22:11'),('bd52762bf1a2451aefbb1342e5888cad',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-12 14:24:01'),('c05fb6ad8548b443b16c43ee0253520f',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-21 16:56:12'),('d5608caa34d0d5061e87ac8b89b3144c',1,'127.0.0.1',0,'77d4665d09fc560e08b87156fefd27a8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','2016-08-23 18:05:43'),('db19d00ba6d8bc4293acec3d4b8c6e12',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 16:06:13'),('e4f12c50538ebdf6040d0a741d2d521c',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 16:34:29'),('e8deb2b1ee68f87e98484e746958db1d',1,'127.0.0.1',0,'e98787bd8e728c47faf5d26e5d6c4cb5','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36','2016-10-10 08:27:34');
/*!40000 ALTER TABLE `user2session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_admin_group`
--

DROP TABLE IF EXISTS `user_admin_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_admin_group` (
  `user_admin_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_admin_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_admin_group`
--

LOCK TABLES `user_admin_group` WRITE;
/*!40000 ALTER TABLE `user_admin_group` DISABLE KEYS */;
INSERT INTO `user_admin_group` VALUES (1,'root','2016-05-24 16:46:43'),(2,'Баеры','2016-08-16 08:43:51'),(3,'Копирайтеры','2016-08-16 08:44:04'),(4,'Контенщики','2016-08-16 08:44:24');
/*!40000 ALTER TABLE `user_admin_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_get_product_1c_export`
--

DROP TABLE IF EXISTS `v_get_product_1c_export`;
/*!50001 DROP VIEW IF EXISTS `v_get_product_1c_export`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_get_product_1c_export` AS SELECT 
 1 AS `category_id`,
 1 AS `product_id`,
 1 AS `user_id`,
 1 AS `depth`,
 1 AS `width`,
 1 AS `heigth`,
 1 AS `weight`,
 1 AS `quantity`,
 1 AS `unit_id`,
 1 AS `barcode`,
 1 AS `rating`,
 1 AS `url`,
 1 AS `title`,
 1 AS `tag_title`,
 1 AS `description`,
 1 AS `tag_description`,
 1 AS `tag_keywords`,
 1 AS `date_create`,
 1 AS `date_update`,
 1 AS `category_name`,
 1 AS `url2site`,
 1 AS `instr`,
 1 AS `caterory_url`,
 1 AS `unit_code`,
 1 AS `unit_code2`,
 1 AS `unit_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_product2feature`
--

DROP TABLE IF EXISTS `v_product2feature`;
/*!50001 DROP VIEW IF EXISTS `v_product2feature`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_product2feature` AS SELECT 
 1 AS `feature_id`,
 1 AS `title`,
 1 AS `title_en`,
 1 AS `feature2value_id`,
 1 AS `default`,
 1 AS `value`,
 1 AS `product_id`,
 1 AS `sub_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_product2sale`
--

DROP TABLE IF EXISTS `v_product2sale`;
/*!50001 DROP VIEW IF EXISTS `v_product2sale`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_product2sale` AS SELECT 
 1 AS `category_id`,
 1 AS `product_id`,
 1 AS `user_id`,
 1 AS `depth`,
 1 AS `width`,
 1 AS `heigth`,
 1 AS `weight`,
 1 AS `quantity`,
 1 AS `unit_id`,
 1 AS `barcode`,
 1 AS `rating`,
 1 AS `url`,
 1 AS `title`,
 1 AS `tag_title`,
 1 AS `description`,
 1 AS `tag_description`,
 1 AS `tag_keywords`,
 1 AS `date_create`,
 1 AS `date_update`,
 1 AS `category_name`,
 1 AS `url2site`,
 1 AS `instr`,
 1 AS `caterory_url`,
 1 AS `unit_code`,
 1 AS `unit_code2`,
 1 AS `unit_name`,
 1 AS `sale_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_product_info`
--

DROP TABLE IF EXISTS `v_product_info`;
/*!50001 DROP VIEW IF EXISTS `v_product_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_product_info` AS SELECT 
 1 AS `category_id`,
 1 AS `product_id`,
 1 AS `user_id`,
 1 AS `depth`,
 1 AS `width`,
 1 AS `heigth`,
 1 AS `weight`,
 1 AS `quantity`,
 1 AS `unit_id`,
 1 AS `barcode`,
 1 AS `rating`,
 1 AS `url`,
 1 AS `title`,
 1 AS `tag_title`,
 1 AS `description`,
 1 AS `tag_description`,
 1 AS `tag_keywords`,
 1 AS `date_create`,
 1 AS `date_update`,
 1 AS `category_name`,
 1 AS `url2site`,
 1 AS `instr`,
 1 AS `caterory_url`,
 1 AS `unit_code`,
 1 AS `unit_code2`,
 1 AS `unit_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_sale_info`
--

DROP TABLE IF EXISTS `v_sale_info`;
/*!50001 DROP VIEW IF EXISTS `v_sale_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sale_info` AS SELECT 
 1 AS `day`,
 1 AS `time`,
 1 AS `sale_id`,
 1 AS `saletype_id`,
 1 AS `value`,
 1 AS `user_id`,
 1 AS `date_start`,
 1 AS `date_end`,
 1 AS `title`,
 1 AS `description`,
 1 AS `url_md5`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_user_info`
--

DROP TABLE IF EXISTS `v_user_info`;
/*!50001 DROP VIEW IF EXISTS `v_user_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_user_info` AS SELECT 
 1 AS `user_id`,
 1 AS `old_id`,
 1 AS `sex`,
 1 AS `access`,
 1 AS `mail`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `patronymic`,
 1 AS `fio`,
 1 AS `address`,
 1 AS `date_create`,
 1 AS `date_update`,
 1 AS `access_delete`,
 1 AS `access_id`,
 1 AS `user_admin_group_id`,
 1 AS `manager_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_get_product_1c_export`
--

/*!50001 DROP VIEW IF EXISTS `v_get_product_1c_export`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_get_product_1c_export` AS select `tb1`.`category_id` AS `category_id`,`tb1`.`product_id` AS `product_id`,`tb1`.`user_id` AS `user_id`,`tb1`.`depth` AS `depth`,`tb1`.`width` AS `width`,`tb1`.`heigth` AS `heigth`,`tb1`.`weight` AS `weight`,`tb1`.`quantity` AS `quantity`,`tb1`.`unit_id` AS `unit_id`,`tb1`.`barcode` AS `barcode`,`tb1`.`rating` AS `rating`,`tb1`.`url` AS `url`,`tb1`.`title` AS `title`,`tb1`.`tag_title` AS `tag_title`,`tb1`.`description` AS `description`,`tb1`.`tag_description` AS `tag_description`,`tb1`.`tag_keywords` AS `tag_keywords`,`tb1`.`date_create` AS `date_create`,`tb1`.`date_update` AS `date_update`,`tb1`.`category_name` AS `category_name`,`tb1`.`url2site` AS `url2site`,`tb1`.`instr` AS `instr`,`tb1`.`caterory_url` AS `caterory_url`,`tb1`.`unit_code` AS `unit_code`,`tb1`.`unit_code2` AS `unit_code2`,`tb1`.`unit_name` AS `unit_name` from `v_product_info` `tb1` where (not(`tb1`.`product_id` in (select `export_product_1c`.`product_id` from `export_product_1c`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_product2feature`
--

/*!50001 DROP VIEW IF EXISTS `v_product2feature`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_product2feature` AS select `tb1`.`feature_id` AS `feature_id`,`tb1`.`title` AS `title`,`tb1`.`title_en` AS `title_en`,`tb2`.`feature2value_id` AS `feature2value_id`,`tb2`.`default` AS `default`,`tb2`.`value` AS `value`,`tb3`.`product_id` AS `product_id`,`tb3`.`sub_value` AS `sub_value` from ((`feature` `tb1` left join `feature2value` `tb2` on((`tb1`.`feature_id` = `tb2`.`feature_id`))) left join `product2feature2value` `tb3` on((`tb2`.`feature2value_id` = `tb3`.`feature2value_id`))) where (`tb3`.`product_id` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_product2sale`
--

/*!50001 DROP VIEW IF EXISTS `v_product2sale`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_product2sale` AS select `tb1`.`category_id` AS `category_id`,`tb1`.`product_id` AS `product_id`,`tb1`.`user_id` AS `user_id`,`tb1`.`depth` AS `depth`,`tb1`.`width` AS `width`,`tb1`.`heigth` AS `heigth`,`tb1`.`weight` AS `weight`,`tb1`.`quantity` AS `quantity`,`tb1`.`unit_id` AS `unit_id`,`tb1`.`barcode` AS `barcode`,`tb1`.`rating` AS `rating`,`tb1`.`url` AS `url`,`tb1`.`title` AS `title`,`tb1`.`tag_title` AS `tag_title`,`tb1`.`description` AS `description`,`tb1`.`tag_description` AS `tag_description`,`tb1`.`tag_keywords` AS `tag_keywords`,`tb1`.`date_create` AS `date_create`,`tb1`.`date_update` AS `date_update`,`tb1`.`category_name` AS `category_name`,`tb1`.`url2site` AS `url2site`,`tb1`.`instr` AS `instr`,`tb1`.`caterory_url` AS `caterory_url`,`tb1`.`unit_code` AS `unit_code`,`tb1`.`unit_code2` AS `unit_code2`,`tb1`.`unit_name` AS `unit_name`,`tb2`.`sale_id` AS `sale_id` from (`v_product_info` `tb1` join `product2sale` `tb2` on((`tb1`.`product_id` = `tb2`.`product_id`))) group by `tb1`.`product_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_product_info`
--

/*!50001 DROP VIEW IF EXISTS `v_product_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_product_info` AS select `tb1`.`category_id` AS `category_id`,`tb2`.`product_id` AS `product_id`,`tb2`.`user_id` AS `user_id`,`tb2`.`depth` AS `depth`,`tb2`.`width` AS `width`,`tb2`.`heigth` AS `heigth`,`tb2`.`weight` AS `weight`,`tb2`.`quantity` AS `quantity`,`tb2`.`unit_id` AS `unit_id`,`tb2`.`barcode` AS `barcode`,`tb2`.`rating` AS `rating`,`tb2`.`url` AS `url`,`tb2`.`title` AS `title`,`tb2`.`tag_title` AS `tag_title`,`tb2`.`description` AS `description`,`tb2`.`tag_description` AS `tag_description`,`tb2`.`tag_keywords` AS `tag_keywords`,`tb2`.`date_create` AS `date_create`,`tb2`.`date_update` AS `date_update`,`tb3`.`title` AS `category_name`,`tb3`.`url2site` AS `url2site`,`tb3`.`instr` AS `instr`,`tb3`.`url` AS `caterory_url`,`tb4`.`code` AS `unit_code`,`tb4`.`code2` AS `unit_code2`,`tb4`.`name` AS `unit_name` from (((`product2category` `tb1` join `product` `tb2` on((`tb1`.`product_id` = `tb2`.`product_id`))) join `category` `tb3` on((`tb1`.`category_id` = `tb3`.`category_id`))) join `unit` `tb4` on((`tb2`.`unit_id` = `tb4`.`unit_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sale_info`
--

/*!50001 DROP VIEW IF EXISTS `v_sale_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sale_info` AS select (to_days(`tb1`.`date_end`) - to_days(now())) AS `day`,sec_to_time((time_to_sec(`tb1`.`date_end`) - time_to_sec(now()))) AS `time`,`tb1`.`sale_id` AS `sale_id`,`tb1`.`saletype_id` AS `saletype_id`,`tb1`.`value` AS `value`,`tb1`.`user_id` AS `user_id`,`tb1`.`date_start` AS `date_start`,`tb1`.`date_end` AS `date_end`,`tb1`.`title` AS `title`,`tb1`.`description` AS `description`,`tb1`.`url_md5` AS `url_md5` from `sale` `tb1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_user_info`
--

/*!50001 DROP VIEW IF EXISTS `v_user_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_user_info` AS select `tb1`.`user_id` AS `user_id`,`tb1`.`old_id` AS `old_id`,`tb1`.`sex` AS `sex`,`tb1`.`access` AS `access`,`tb1`.`mail` AS `mail`,`tb1`.`first_name` AS `first_name`,`tb1`.`last_name` AS `last_name`,`tb1`.`patronymic` AS `patronymic`,`tb1`.`fio` AS `fio`,`tb1`.`address` AS `address`,`tb1`.`date_create` AS `date_create`,`tb1`.`date_update` AS `date_update`,`tb1`.`access_delete` AS `access_delete`,`tb2`.`access_id` AS `access_id`,`tb2`.`user_admin_group_id` AS `user_admin_group_id`,`tb3`.`manager_id` AS `manager_id` from ((`user` `tb1` left join `user2admin` `tb2` on((`tb1`.`user_id` = `tb2`.`user_id`))) left join `manager` `tb3` on((`tb1`.`user_id` = `tb3`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-15 12:27:24
