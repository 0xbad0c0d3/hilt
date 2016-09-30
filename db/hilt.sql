-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
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
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,0,0,'Одежда и обувь ','clothes-and-shoes','/clothes-and-shoes','70,17,59,47,22,98,71,72,91,96,9,62,69,12,37,66,18,23,121,2,68,78,26,118,116,28,97,75,117,107,65,58,39,74,44,30,80,114,32,20,108,60,84,76,81,5,15,82,99,83,64,57,7,79,119,21,46,88,25,53,48,100,92,93,42,51,104,86,105,16,87,13,89,120,43,50,19,106,85,122,77,52,115,90,111,73,35,123,3,6,31,54,112,11,67,94,109,110,95,8,61,40,63,38,113,34,102,49,33,24,14,4,41,29,27,45,10,103,55,101,56,36','2016-08-05 16:50:11','2016-08-05 16:50:11'),(2,1,0,0,'Он','he','/clothes-and-shoes/he','17,22,21,25,9,42,12,16,37,23,18,13,19,26,35,28,3,6,31,11,39,30,8,32,40,38,20,34,33,24,15,5,14,4,27,41,10,29,36,7','2016-08-05 16:50:11','2016-08-05 16:50:11'),(3,2,0,0,'Одежда','clothing','/clothes-and-shoes/he/clothing','22,21,17,6,9,11,8,16,20,12,13,18,10,19,14,4,5,15,7','2016-08-05 16:50:11','2016-08-05 16:50:11'),(4,3,0,0,'Куртки, плащи','jackets-raincoats','/clothes-and-shoes/he/clothing/jackets-raincoats','4','2016-08-05 16:50:11','2016-08-05 16:50:11'),(5,3,0,0,'Поло','polo','/clothes-and-shoes/he/clothing/polo','5','2016-08-05 16:50:11','2016-08-05 16:50:11'),(6,3,0,0,'Футболки','t-shirt','/clothes-and-shoes/he/clothing/t-shirt','6','2016-08-05 16:50:11','2016-08-05 16:50:11'),(7,3,0,0,'Рубашки','shirt','/clothes-and-shoes/he/clothing/shirt','7','2016-08-05 16:50:12','2016-08-05 16:50:12'),(8,3,0,0,'Пиджаки','jackets','/clothes-and-shoes/he/clothing/jackets','8','2016-08-05 16:50:12','2016-08-05 16:50:12'),(9,3,0,0,'Кофты','jackets','/clothes-and-shoes/he/clothing/jackets','9','2016-08-05 16:50:12','2016-08-05 16:50:12'),(10,3,0,0,'Свитера','sweaters','/clothes-and-shoes/he/clothing/sweaters','10','2016-08-05 16:50:12','2016-08-05 16:50:12'),(11,3,0,0,'Толстовки','hoodies','/clothes-and-shoes/he/clothing/hoodies','11','2016-08-05 16:50:12','2016-08-05 16:50:12'),(12,3,0,0,'Пиджаки, костюмы','jackets-suits','/clothes-and-shoes/he/clothing/jackets-suits','12','2016-08-05 16:50:12','2016-08-05 16:50:12'),(13,3,0,0,'Брюки','pants','/clothes-and-shoes/he/clothing/pants','13','2016-08-05 16:50:12','2016-08-05 16:50:12'),(14,3,0,0,'Джинсы','jeans','/clothes-and-shoes/he/clothing/jeans','14','2016-08-05 16:50:12','2016-08-05 16:50:12'),(15,3,0,0,'Шорты','shorts','/clothes-and-shoes/he/clothing/shorts','15','2016-08-05 16:50:13','2016-08-05 16:50:13'),(16,3,0,0,'Майки','mikey','/clothes-and-shoes/he/clothing/mikey','16','2016-08-05 16:50:13','2016-08-05 16:50:13'),(17,3,0,0,'Тенниски','t-shirt','/clothes-and-shoes/he/clothing/t-shirt','17','2016-08-05 16:50:13','2016-08-05 16:50:13'),(18,3,0,0,'Регланы','jerseys','/clothes-and-shoes/he/clothing/jerseys','18','2016-08-05 16:50:13','2016-08-05 16:50:13'),(19,3,0,0,'Одежда для сна','sleepwear','/clothes-and-shoes/he/clothing/sleepwear','19','2016-08-05 16:50:13','2016-08-05 16:50:13'),(20,3,0,0,'Спортивные костюмы','tracksuits','/clothes-and-shoes/he/clothing/tracksuits','20','2016-08-05 16:50:13','2016-08-05 16:50:13'),(21,3,0,0,'Спортивные штаны','sweat-pants','/clothes-and-shoes/he/clothing/sweat-pants','21','2016-08-05 16:50:13','2016-08-05 16:50:13'),(22,3,0,0,'Трусы, носки','underwear-socks','/clothes-and-shoes/he/clothing/underwear-socks','22','2016-08-05 16:50:14','2016-08-05 16:50:14'),(23,2,0,0,'Обувь','shoes','/clothes-and-shoes/he/shoes','24,30,29,27,28,25,26','2016-08-05 16:50:14','2016-08-05 16:50:14'),(24,23,0,0,'Туфли','shoes','/clothes-and-shoes/he/shoes/shoes','24','2016-08-05 16:50:14','2016-08-05 16:50:14'),(25,23,0,0,'Ботинки','shoes','/clothes-and-shoes/he/shoes/shoes','25','2016-08-05 16:50:14','2016-08-05 16:50:14'),(26,23,0,0,'Кроссовки, кеды','running-shoes-sneakers','/clothes-and-shoes/he/shoes/running-shoes-sneakers','26','2016-08-05 16:50:14','2016-08-05 16:50:14'),(27,23,0,0,'Шлепанцы','slippers','/clothes-and-shoes/he/shoes/slippers','27','2016-08-05 16:50:14','2016-08-05 16:50:14'),(28,23,0,0,'Сандалии','sandals','/clothes-and-shoes/he/shoes/sandals','28','2016-08-05 16:50:14','2016-08-05 16:50:14'),(29,23,0,0,'Сапоги','boots','/clothes-and-shoes/he/shoes/boots','29','2016-08-05 16:50:15','2016-08-05 16:50:15'),(30,23,0,0,'Тапочки','slippers','/clothes-and-shoes/he/shoes/slippers','30','2016-08-05 16:50:15','2016-08-05 16:50:15'),(31,2,0,0,'Аксессуары','accessories','/clothes-and-shoes/he/accessories','40,32,37,38,35,34,39,33,41,42,36','2016-08-05 16:50:15','2016-08-05 16:50:15'),(32,31,0,0,'Головные уборы','hats','/clothes-and-shoes/he/accessories/hats','32','2016-08-05 16:50:15','2016-08-05 16:50:15'),(33,31,0,0,'Галстуки','ties','/clothes-and-shoes/he/accessories/ties','33','2016-08-05 16:50:15','2016-08-05 16:50:15'),(34,31,0,0,'Запонки','cufflinks','/clothes-and-shoes/he/accessories/cufflinks','34','2016-08-05 16:50:15','2016-08-05 16:50:15'),(35,31,0,0,'Зонты','umbrellas','/clothes-and-shoes/he/accessories/umbrellas','35','2016-08-05 16:50:15','2016-08-05 16:50:15'),(36,31,0,0,'Портмоне, обложки для документов, визитницы','purses-covers-for-documents-business-card-holders','/clothes-and-shoes/he/accessories/purses-covers-for-documents-business-card-holders','36','2016-08-05 16:50:15','2016-08-05 16:50:15'),(37,31,0,0,'Очки','glasses','/clothes-and-shoes/he/accessories/glasses','37','2016-08-05 16:50:15','2016-08-05 16:50:15'),(38,31,0,0,'Перчатки','gloves','/clothes-and-shoes/he/accessories/gloves','38','2016-08-05 16:50:16','2016-08-05 16:50:16'),(39,31,0,0,'Ремни','straps','/clothes-and-shoes/he/accessories/straps','39','2016-08-05 16:50:16','2016-08-05 16:50:16'),(40,31,0,0,'Сумки, рюкзаки','bags-backpacks','/clothes-and-shoes/he/accessories/bags-backpacks','40','2016-08-05 16:50:16','2016-08-05 16:50:16'),(41,31,0,0,'Часы','watch','/clothes-and-shoes/he/accessories/watch','41','2016-08-05 16:50:16','2016-08-05 16:50:16'),(42,31,0,0,'Шарфы','scarves','/clothes-and-shoes/he/accessories/scarves','42','2016-08-05 16:50:16','2016-08-05 16:50:16'),(43,1,0,0,'Она','she','/clothes-and-shoes/she','45,82,49,81,64,57,56,83,55,63,61,76,84,60,44,94,74,67,58,80,73,90,65,54,75,50,89,52,78,85,77,68,86,51,66,87,62,72,91,48,69,93,92,47,59,79,70,71,53,88,46','2016-08-05 16:50:16','2016-08-05 16:50:16'),(44,43,0,0,'Одежда','clothing','/clothes-and-shoes/she/clothing','50,49,45,55,52,57,64,56,61,51,63,60,48,58,62,47,59,46,65,53,54','2016-08-05 16:50:16','2016-08-05 16:50:16'),(45,44,0,0,'Куртки и плащи','jackets-and-coats','/clothes-and-shoes/she/clothing/jackets-and-coats','45','2016-08-05 16:50:17','2016-08-05 16:50:17'),(46,44,0,0,'Платья','dresses','/clothes-and-shoes/she/clothing/dresses','46','2016-08-05 16:50:17','2016-08-05 16:50:17'),(47,44,0,0,'Рубашки','shirt','/clothes-and-shoes/she/clothing/shirt','47','2016-08-05 16:50:17','2016-08-05 16:50:17'),(48,44,0,0,'Свитера','sweaters','/clothes-and-shoes/she/clothing/sweaters','48','2016-08-05 16:50:17','2016-08-05 16:50:17'),(49,44,0,0,'Футболки','t-shirt','/clothes-and-shoes/she/clothing/t-shirt','49','2016-08-05 16:50:17','2016-08-05 16:50:17'),(50,44,0,0,'Кофты','jackets','/clothes-and-shoes/she/clothing/jackets','50','2016-08-05 16:50:17','2016-08-05 16:50:17'),(51,44,0,0,'Брюки','pants','/clothes-and-shoes/she/clothing/pants','51','2016-08-05 16:50:17','2016-08-05 16:50:17'),(52,44,0,0,'Джинсы','jeans','/clothes-and-shoes/she/clothing/jeans','52','2016-08-05 16:50:18','2016-08-05 16:50:18'),(53,44,0,0,'Шорты','shorts','/clothes-and-shoes/she/clothing/shorts','53','2016-08-05 16:50:18','2016-08-05 16:50:18'),(54,44,0,0,'Пиджаки','jackets','/clothes-and-shoes/she/clothing/jackets','54','2016-08-05 16:50:18','2016-08-05 16:50:18'),(55,44,0,0,'Блузы','blouses','/clothes-and-shoes/she/clothing/blouses','55','2016-08-05 16:50:18','2016-08-05 16:50:18'),(56,44,0,0,'Юбки','skirts','/clothes-and-shoes/she/clothing/skirts','56','2016-08-05 16:50:18','2016-08-05 16:50:18'),(57,44,0,0,'Леггенсы, лосины','leggins-tights','/clothes-and-shoes/she/clothing/leggins-tights','57','2016-08-05 16:50:18','2016-08-05 16:50:18'),(58,44,0,0,'Белье','linen','/clothes-and-shoes/she/clothing/linen','61,59,60','2016-08-05 16:50:18','2016-08-05 16:50:18'),(59,58,0,0,'Комплекты','kits','/clothes-and-shoes/she/clothing/linen/kits','59','2016-08-05 16:50:18','2016-08-05 16:50:18'),(60,58,0,0,'Бюстгалтеры','bras','/clothes-and-shoes/she/clothing/linen/bras','60','2016-08-05 16:50:19','2016-08-05 16:50:19'),(61,58,0,0,'Трусы','briefs','/clothes-and-shoes/she/clothing/linen/briefs','61','2016-08-05 16:50:19','2016-08-05 16:50:19'),(62,44,0,0,'Колготы, носки','tights-socks','/clothes-and-shoes/she/clothing/tights-socks','62','2016-08-05 16:50:19','2016-08-05 16:50:19'),(63,44,0,0,'Одежда для сна','sleepwear','/clothes-and-shoes/she/clothing/sleepwear','63','2016-08-05 16:50:19','2016-08-05 16:50:19'),(64,44,0,0,'Одежда для дома','clothing-for-home','/clothes-and-shoes/she/clothing/clothing-for-home','64','2016-08-05 16:50:19','2016-08-05 16:50:19'),(65,44,0,0,'Спортивная одежда','sports-wear','/clothes-and-shoes/she/clothing/sports-wear','65','2016-08-05 16:50:19','2016-08-05 16:50:19'),(66,43,0,0,'Обувь','shoes','/clothes-and-shoes/she/shoes','69,68,74,72,67,76,71,75,70,73','2016-08-05 16:50:19','2016-08-05 16:50:19'),(67,66,0,0,'Туфли','shoes','/clothes-and-shoes/she/shoes/shoes','67','2016-08-05 16:50:20','2016-08-05 16:50:20'),(68,66,0,0,'Балетки','ballet-flats','/clothes-and-shoes/she/shoes/ballet-flats','68','2016-08-05 16:50:20','2016-08-05 16:50:20'),(69,66,0,0,'Босоножки, сандалии','lace-up-sandals','/clothes-and-shoes/she/shoes/lace-up-sandals','69','2016-08-05 16:50:20','2016-08-05 16:50:20'),(70,66,0,0,'Ботинки, ботильоны','boots-ankle-boots','/clothes-and-shoes/she/shoes/boots-ankle-boots','70','2016-08-05 16:50:20','2016-08-05 16:50:20'),(71,66,0,0,'Кроссовки, кеды','running-shoes-sneakers','/clothes-and-shoes/she/shoes/running-shoes-sneakers','71','2016-08-05 16:50:20','2016-08-05 16:50:20'),(72,66,0,0,'Мокасины, слипоны','loafers-espadrilles','/clothes-and-shoes/she/shoes/loafers-espadrilles','72','2016-08-05 16:50:20','2016-08-05 16:50:20'),(73,66,0,0,'Пантолеты, шлепанцы','thongs-flip-flops','/clothes-and-shoes/she/shoes/thongs-flip-flops','73','2016-08-05 16:50:21','2016-08-05 16:50:21'),(74,66,0,0,'Резиновые сапоги','rubber-boots','/clothes-and-shoes/she/shoes/rubber-boots','74','2016-08-05 16:50:21','2016-08-05 16:50:21'),(75,66,0,0,'Сапоги','boots','/clothes-and-shoes/she/shoes/boots','75','2016-08-05 16:50:21','2016-08-05 16:50:21'),(76,66,0,0,'Тапочки','slippers','/clothes-and-shoes/she/shoes/slippers','76','2016-08-05 16:50:21','2016-08-05 16:50:21'),(77,43,0,0,'Аксессуары ','accessories','/clothes-and-shoes/she/accessories','86,84,87,82,89,81,78,85,83,79,90,88,94,91,80,93,92','2016-08-05 16:50:21','2016-08-05 16:50:21'),(78,77,0,0,'головные уборы','hats','/clothes-and-shoes/she/accessories/hats','78','2016-08-05 16:50:21','2016-08-05 16:50:21'),(79,77,0,0,'Перчатки','gloves','/clothes-and-shoes/she/accessories/gloves','79','2016-08-05 16:50:21','2016-08-05 16:50:21'),(80,77,0,0,'Варежки','mittens','/clothes-and-shoes/she/accessories/mittens','80','2016-08-05 16:50:21','2016-08-05 16:50:21'),(81,77,0,0,'Платки','shawls','/clothes-and-shoes/she/accessories/shawls','81','2016-08-05 16:50:22','2016-08-05 16:50:22'),(82,77,0,0,'Шарфы','scarves','/clothes-and-shoes/she/accessories/scarves','82','2016-08-05 16:50:22','2016-08-05 16:50:22'),(83,77,0,0,'Шали','shawls','/clothes-and-shoes/she/accessories/shawls','83','2016-08-05 16:50:22','2016-08-05 16:50:22'),(84,77,0,0,'Очки','glasses','/clothes-and-shoes/she/accessories/glasses','84','2016-08-05 16:50:22','2016-08-05 16:50:22'),(85,77,0,0,'Зонты','umbrellas','/clothes-and-shoes/she/accessories/umbrellas','85','2016-08-05 16:50:22','2016-08-05 16:50:22'),(86,77,0,0,'Ремни, пояса','belts-waist-belts','/clothes-and-shoes/she/accessories/belts-waist-belts','86','2016-08-05 16:50:22','2016-08-05 16:50:22'),(87,77,0,0,'Сумки, рюкзаки','bags-backpacks','/clothes-and-shoes/she/accessories/bags-backpacks','87','2016-08-05 16:50:22','2016-08-05 16:50:22'),(88,77,0,0,'Часы','watch','/clothes-and-shoes/she/accessories/watch','88','2016-08-05 16:50:23','2016-08-05 16:50:23'),(89,77,0,0,'Кошельки, обложки для документов, визитницы','purses-covers-for-documents-business-card-holders','/clothes-and-shoes/she/accessories/purses-covers-for-documents-business-card-holders','89','2016-08-05 16:50:23','2016-08-05 16:50:23'),(90,77,0,0,'Бижутерия','jewelry','/clothes-and-shoes/she/accessories/jewelry','91,94,92,93','2016-08-05 16:50:23','2016-08-05 16:50:23'),(91,90,0,0,'Кольца','ring','/clothes-and-shoes/she/accessories/jewelry/ring','91','2016-08-05 16:50:23','2016-08-05 16:50:23'),(92,90,0,0,'Серьги','earrings','/clothes-and-shoes/she/accessories/jewelry/earrings','92','2016-08-05 16:50:23','2016-08-05 16:50:23'),(93,90,0,0,'Подвески','suspension','/clothes-and-shoes/she/accessories/jewelry/suspension','93','2016-08-05 16:50:23','2016-08-05 16:50:23'),(94,90,0,0,'Браслеты','bracelets','/clothes-and-shoes/she/accessories/jewelry/bracelets','94','2016-08-05 16:50:23','2016-08-05 16:50:23'),(95,1,0,0,'Дети','children','/clothes-and-shoes/children','114,110,100,109,96,107,112,117,98,116,119,97,123,111,118,115,101,122,103,99,106,120,121,102,108,113,105,104','2016-08-05 16:50:23','2016-08-05 16:50:23'),(96,95,0,0,'Для малышей','for-kids','/clothes-and-shoes/children/for-kids','96','2016-08-05 16:50:23','2016-08-05 16:50:23'),(97,95,0,0,'Для мальчиков','for-boys','/clothes-and-shoes/children/for-boys','102,98,104,105,101,103,100,99','2016-08-05 16:50:24','2016-08-05 16:50:24'),(98,97,0,0,'Куртки, ветровки','jackets-coats','/clothes-and-shoes/children/for-boys/jackets-coats','98','2016-08-05 16:50:24','2016-08-05 16:50:24'),(99,97,0,0,'Кофты, свитера','jackets-sweaters','/clothes-and-shoes/children/for-boys/jackets-sweaters','99','2016-08-05 16:50:24','2016-08-05 16:50:24'),(100,97,0,0,'Рубашки, футболки, майки','shirts-t-shirts','/clothes-and-shoes/children/for-boys/shirts-t-shirts','100','2016-08-05 16:50:24','2016-08-05 16:50:24'),(101,97,0,0,'Брюки, шорты, джинсы','pants-shorts-jeans','/clothes-and-shoes/children/for-boys/pants-shorts-jeans','101','2016-08-05 16:50:24','2016-08-05 16:50:24'),(102,97,0,0,'Носки','socks','/clothes-and-shoes/children/for-boys/socks','102','2016-08-05 16:50:24','2016-08-05 16:50:24'),(103,97,0,0,'Одежда для сна','sleepwear','/clothes-and-shoes/children/for-boys/sleepwear','103','2016-08-05 16:50:24','2016-08-05 16:50:24'),(104,97,0,0,'Обувь','shoes','/clothes-and-shoes/children/for-boys/shoes','104','2016-08-05 16:50:24','2016-08-05 16:50:24'),(105,97,0,0,'Аксессуары','accessories','/clothes-and-shoes/children/for-boys/accessories','105','2016-08-05 16:50:24','2016-08-05 16:50:24'),(106,95,0,0,'Для девочек','for-girls','/clothes-and-shoes/children/for-girls','111,113,116,108,107,112,110,109,114,115','2016-08-05 16:50:25','2016-08-05 16:50:25'),(107,106,0,0,'Куртки, плащи','jackets-raincoats','/clothes-and-shoes/children/for-girls/jackets-raincoats','107','2016-08-05 16:50:25','2016-08-05 16:50:25'),(108,106,0,0,'Кофты','jackets','/clothes-and-shoes/children/for-girls/jackets','108','2016-08-05 16:50:25','2016-08-05 16:50:25'),(109,106,0,0,'Платья, юбки','dresses-skirts','/clothes-and-shoes/children/for-girls/dresses-skirts','109','2016-08-05 16:50:25','2016-08-05 16:50:25'),(110,106,0,0,'Рубашки, блузы','shirts-blouses','/clothes-and-shoes/children/for-girls/shirts-blouses','110','2016-08-05 16:50:25','2016-08-05 16:50:25'),(111,106,0,0,'Футболки, майки','t-shirts','/clothes-and-shoes/children/for-girls/t-shirts','111','2016-08-05 16:50:25','2016-08-05 16:50:25'),(112,106,0,0,'Брюки, шорты, джинсы','pants-shorts-jeans','/clothes-and-shoes/children/for-girls/pants-shorts-jeans','112','2016-08-05 16:50:25','2016-08-05 16:50:25'),(113,106,0,0,'Колготки, носки','tights-socks','/clothes-and-shoes/children/for-girls/tights-socks','113','2016-08-05 16:50:26','2016-08-05 16:50:26'),(114,106,0,0,'Одежда для сна','sleepwear','/clothes-and-shoes/children/for-girls/sleepwear','114','2016-08-05 16:50:26','2016-08-05 16:50:26'),(115,106,0,0,'Обувь','shoes','/clothes-and-shoes/children/for-girls/shoes','115','2016-08-05 16:50:26','2016-08-05 16:50:26'),(116,106,0,0,'Аксессуары','accessories','/clothes-and-shoes/children/for-girls/accessories','116','2016-08-05 16:50:26','2016-08-05 16:50:26'),(117,95,0,0,'Школа ','school','/clothes-and-shoes/children/school','122,120,121,118,119,123','2016-08-05 16:50:26','2016-08-05 16:50:26'),(118,117,0,0,'Школьные костюмы','school-costumes','/clothes-and-shoes/children/school/school-costumes','118','2016-08-05 16:50:26','2016-08-05 16:50:26'),(119,117,0,0,'Школьные рубашки','school-shirts','/clothes-and-shoes/children/school/school-shirts','119','2016-08-05 16:50:27','2016-08-05 16:50:27'),(120,117,0,0,'Школьные блузки','school-blouses','/clothes-and-shoes/children/school/school-blouses','120','2016-08-05 16:50:27','2016-08-05 16:50:27'),(121,117,0,0,'Школьные пиджаки, жакеты и жилеты','school-blazers-jackets-and-vests','/clothes-and-shoes/children/school/school-blazers-jackets-and-vests','121','2016-08-05 16:50:27','2016-08-05 16:50:27'),(122,117,0,0,'Школьные брюки','school-pants','/clothes-and-shoes/children/school/school-pants','122','2016-08-05 16:50:27','2016-08-05 16:50:27'),(123,117,0,0,'Школьные платья, сарафаны и юбки','school-dresses-tunics-and-skirts','/clothes-and-shoes/children/school/school-dresses-tunics-and-skirts','123','2016-08-05 16:50:27','2016-08-05 16:50:27'),(124,0,0,0,'Товары для дома','the-goods-for-the-house','/the-goods-for-the-house','157,211,231,137,235,134,131,228,181,279,241,153,190,205,259,251,236,262,179,272,226,135,207,202,185,158,214,125,170,188,238,265,237,258,200,269,227,253,274,155,222,182,220,126,203,171,176,223,213,277,162,174,172,252,273,254,192,151,243,218,275,266,197,156,150,208,136,198,242,194,199,225,127,186,264,255,267,270,248,152,129,244,146,212,139,246,221,144,169,247,191,195,149,263,141,278,148,206,168,159,224,154,234,173,217,128,268,165,216,145,167,196,245,257,163,209,219,276,140,232,239,271,132,229,175,204,142,178,166,193,143,189,201,161,256,210,249,250,183,164,184,187,133,138,147,260,180,215,233,130,261,230,177,240,160','2016-08-05 16:50:27','2016-08-05 16:50:27'),(125,124,0,0,'Домашний текстиль ','home-textile','/the-goods-for-the-house/home-textile','136,133,131,138,139,144,135,134,126,137,129,127,143,130,141,132,128,142,140','2016-08-05 16:50:27','2016-08-05 16:50:27'),(126,125,0,0,'Для спальни   ','for-bedroom','/the-goods-for-the-house/home-textile/for-bedroom','132,128,129,130,127,131','2016-08-05 16:50:27','2016-08-05 16:50:27'),(127,126,0,0,'Покрывала','bedspreads','/the-goods-for-the-house/home-textile/for-bedroom/bedspreads','127','2016-08-05 16:50:27','2016-08-05 16:50:27'),(128,126,0,0,'Комплекты постельного белья','bedding-sets','/the-goods-for-the-house/home-textile/for-bedroom/bedding-sets','128','2016-08-05 16:50:28','2016-08-05 16:50:28'),(129,126,0,0,'Одеяла, подушки','blankets-pillows','/the-goods-for-the-house/home-textile/for-bedroom/blankets-pillows','129','2016-08-05 16:50:28','2016-08-05 16:50:28'),(130,126,0,0,'Наволочки, простыни, пододеяльники','pillowcases-sheets-duvet-covers','/the-goods-for-the-house/home-textile/for-bedroom/pillowcases-sheets-duvet-covers','130','2016-08-05 16:50:28','2016-08-05 16:50:28'),(131,126,0,0,'Пледы','blankets','/the-goods-for-the-house/home-textile/for-bedroom/blankets','131','2016-08-05 16:50:28','2016-08-05 16:50:28'),(132,126,0,0,'Шторы и занавеси','blinds-and-curtains','/the-goods-for-the-house/home-textile/for-bedroom/blinds-and-curtains','132','2016-08-05 16:50:28','2016-08-05 16:50:28'),(133,125,0,0,'Для ванной комнаты','for-bathroom','/the-goods-for-the-house/home-textile/for-bathroom','134','2016-08-05 16:50:28','2016-08-05 16:50:28'),(134,133,0,0,'Полотенца','towels','/the-goods-for-the-house/home-textile/for-bathroom/towels','134','2016-08-05 16:50:28','2016-08-05 16:50:28'),(135,125,0,0,'Для кухни','for-kitchen','/the-goods-for-the-house/home-textile/for-kitchen','136,138,139,137,140','2016-08-05 16:50:28','2016-08-05 16:50:28'),(136,135,0,0,'Скатерти и салфетки','tablecloths-and-napkins','/the-goods-for-the-house/home-textile/for-kitchen/tablecloths-and-napkins','136','2016-08-05 16:50:29','2016-08-05 16:50:29'),(137,135,0,0,'Кухонные полотенца','kitchen-towels','/the-goods-for-the-house/home-textile/for-kitchen/kitchen-towels','137','2016-08-05 16:50:29','2016-08-05 16:50:29'),(138,135,0,0,'Фартуки, прихватки','aprons-oven-mitts','/the-goods-for-the-house/home-textile/for-kitchen/aprons-oven-mitts','138','2016-08-05 16:50:29','2016-08-05 16:50:29'),(139,135,0,0,'Чехлы, подушки на стул','covers-pillows-on-the-chair','/the-goods-for-the-house/home-textile/for-kitchen/covers-pillows-on-the-chair','139','2016-08-05 16:50:29','2016-08-05 16:50:29'),(140,135,0,0,'Шторы и занавеси','blinds-and-curtains','/the-goods-for-the-house/home-textile/for-kitchen/blinds-and-curtains','140','2016-08-05 16:50:29','2016-08-05 16:50:29'),(141,125,0,0,'Детская','children-s','/the-goods-for-the-house/home-textile/children-s','142,143,144','2016-08-05 16:50:30','2016-08-05 16:50:30'),(142,141,0,0,'Одеяла, подушки','blankets-pillows','/the-goods-for-the-house/home-textile/children-s/blankets-pillows','142','2016-08-05 16:50:30','2016-08-05 16:50:30'),(143,141,0,0,'Покрывала, пледы','bedspreads-blankets','/the-goods-for-the-house/home-textile/children-s/bedspreads-blankets','143','2016-08-05 16:50:30','2016-08-05 16:50:30'),(144,141,0,0,'Постельное белье','bed-linen','/the-goods-for-the-house/home-textile/children-s/bed-linen','144','2016-08-05 16:50:30','2016-08-05 16:50:30'),(145,124,0,0,'Предметы интерьера ','interior','/the-goods-for-the-house/interior','150,154,151,146,153,149,158,152,155,156,148,157,147','2016-08-05 16:50:30','2016-08-05 16:50:30'),(146,145,0,0,'Вазы, кашпо','vases-pots','/the-goods-for-the-house/interior/vases-pots','146','2016-08-05 16:50:30','2016-08-05 16:50:30'),(147,145,0,0,'Декоративные подушки','decorative-pillows','/the-goods-for-the-house/interior/decorative-pillows','147','2016-08-05 16:50:30','2016-08-05 16:50:30'),(148,145,0,0,'Подсвечники','candlesticks','/the-goods-for-the-house/interior/candlesticks','148','2016-08-05 16:50:30','2016-08-05 16:50:30'),(149,145,0,0,'Свечи, аромадиффузоры','candles-aroma-diffusers','/the-goods-for-the-house/interior/candles-aroma-diffusers','149','2016-08-05 16:50:31','2016-08-05 16:50:31'),(150,145,0,0,'Статуэтки, фигурки','statuettes-figurines','/the-goods-for-the-house/interior/statuettes-figurines','150','2016-08-05 16:50:31','2016-08-05 16:50:31'),(151,145,0,0,'Стильные штучки','stylish','/the-goods-for-the-house/interior/stylish','151','2016-08-05 16:50:31','2016-08-05 16:50:31'),(152,145,0,0,'Часы настенныенапольные','wall-clock-outdoor','/the-goods-for-the-house/interior/wall-clock-outdoor','152','2016-08-05 16:50:31','2016-08-05 16:50:31'),(153,145,0,0,'Шкатулки','box','/the-goods-for-the-house/interior/box','153','2016-08-05 16:50:31','2016-08-05 16:50:31'),(154,145,0,0,'Фоторамки','photo-frames','/the-goods-for-the-house/interior/photo-frames','154','2016-08-05 16:50:31','2016-08-05 16:50:31'),(155,145,0,0,'Дизайнерские вещи','designer-clothes','/the-goods-for-the-house/interior/designer-clothes','155','2016-08-05 16:50:31','2016-08-05 16:50:31'),(156,145,0,0,'Коврики для ванной и туалета','bath-mats-and-toilet','/the-goods-for-the-house/interior/bath-mats-and-toilet','156','2016-08-05 16:50:32','2016-08-05 16:50:32'),(157,145,0,0,'Шторки для душа ','shower-curtain','/the-goods-for-the-house/interior/shower-curtain','157','2016-08-05 16:50:32','2016-08-05 16:50:32'),(158,145,0,0,'Корзины для белья ','laundry-basket','/the-goods-for-the-house/interior/laundry-basket','158','2016-08-05 16:50:32','2016-08-05 16:50:32'),(159,124,0,0,'Все для кухни ','all-for-kitchen','/the-goods-for-the-house/all-for-kitchen','182,196,167,162,181,176,171,190,192,175,195,191,163,174,172,169,201,161,189,166,193,178,187,184,164,183,168,197,180,173,179,170,194,198,185,160,177,200,186,188,165,199','2016-08-05 16:50:32','2016-08-05 16:50:32'),(160,159,0,0,'Посуда для готовки','kitchen-utensils-for-cooking','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking','166,165,163,162,161,164','2016-08-05 16:50:32','2016-08-05 16:50:32'),(161,160,0,0,'Наборы посуды','cookware-sets','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/cookware-sets','161','2016-08-05 16:50:32','2016-08-05 16:50:32'),(162,160,0,0,'Кастрюли','pots','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/pots','162','2016-08-05 16:50:32','2016-08-05 16:50:32'),(163,160,0,0,'Сковородки, сотейники, воки','pans-casseroles-woks','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/pans-casseroles-woks','163','2016-08-05 16:50:32','2016-08-05 16:50:32'),(164,160,0,0,'Посуда из жаропрочного стекла ','cookware-heat-resistant-glass','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/cookware-heat-resistant-glass','164','2016-08-05 16:50:33','2016-08-05 16:50:33'),(165,160,0,0,'Чайники и заварники','teapots-and-tea-kettles','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/teapots-and-tea-kettles','165','2016-08-05 16:50:33','2016-08-05 16:50:33'),(166,160,0,0,'Формы для выпечки и  запекания','bakeware-and-baking','/the-goods-for-the-house/all-for-kitchen/kitchen-utensils-for-cooking/bakeware-and-baking','166','2016-08-05 16:50:33','2016-08-05 16:50:33'),(167,159,0,0,'Кухонные принадлежности','kitchenware','/the-goods-for-the-house/all-for-kitchen/kitchenware','179,178,171,173,176,180,177,181,169,174,172,168,175,170','2016-08-05 16:50:33','2016-08-05 16:50:33'),(168,167,0,0,'Кухонные наборы','kitchen-sets','/the-goods-for-the-house/all-for-kitchen/kitchenware/kitchen-sets','168','2016-08-05 16:50:33','2016-08-05 16:50:33'),(169,167,0,0,'Поварские лопатки, ложки, вилки','chef-s-blades-spoons-forks','/the-goods-for-the-house/all-for-kitchen/kitchenware/chef-s-blades-spoons-forks','169','2016-08-05 16:50:33','2016-08-05 16:50:33'),(170,167,0,0,'Разделочные доски','cutting-boards','/the-goods-for-the-house/all-for-kitchen/kitchenware/cutting-boards','170','2016-08-05 16:50:34','2016-08-05 16:50:34'),(171,167,0,0,'Кондитерские принадлежности','confectionery-supplies','/the-goods-for-the-house/all-for-kitchen/kitchenware/confectionery-supplies','171','2016-08-05 16:50:34','2016-08-05 16:50:34'),(172,167,0,0,'Терки, овощерезки','graters-vegetable-cutters','/the-goods-for-the-house/all-for-kitchen/kitchenware/graters-vegetable-cutters','172','2016-08-05 16:50:34','2016-08-05 16:50:34'),(173,167,0,0,'Миски и емкости для смешивания','bowls-and-containers-for-mixing','/the-goods-for-the-house/all-for-kitchen/kitchenware/bowls-and-containers-for-mixing','173','2016-08-05 16:50:34','2016-08-05 16:50:34'),(174,167,0,0,'Дуршлаги и сито','the-colander-and-sieve','/the-goods-for-the-house/all-for-kitchen/kitchenware/the-colander-and-sieve','174','2016-08-05 16:50:34','2016-08-05 16:50:34'),(175,167,0,0,'Измельчители и прессы','grinders-and-presses','/the-goods-for-the-house/all-for-kitchen/kitchenware/grinders-and-presses','175','2016-08-05 16:50:34','2016-08-05 16:50:34'),(176,167,0,0,'Консервные ножи и ключи','can-openers-and-keys','/the-goods-for-the-house/all-for-kitchen/kitchenware/can-openers-and-keys','176','2016-08-05 16:50:34','2016-08-05 16:50:34'),(177,167,0,0,'Мерная посуда','measuring-utensils','/the-goods-for-the-house/all-for-kitchen/kitchenware/measuring-utensils','177','2016-08-05 16:50:34','2016-08-05 16:50:34'),(178,167,0,0,'Сушки и органайзеры для посуды','drying-and-organizers-for-dishes','/the-goods-for-the-house/all-for-kitchen/kitchenware/drying-and-organizers-for-dishes','178','2016-08-05 16:50:35','2016-08-05 16:50:35'),(179,167,0,0,'Кухонные помощники','kitchen-assistants','/the-goods-for-the-house/all-for-kitchen/kitchenware/kitchen-assistants','179','2016-08-05 16:50:35','2016-08-05 16:50:35'),(180,167,0,0,'Овощечистки','peelers','/the-goods-for-the-house/all-for-kitchen/kitchenware/peelers','180','2016-08-05 16:50:35','2016-08-05 16:50:35'),(181,167,0,0,'Мусаты и точилки','sharpeners-and-sharpeners','/the-goods-for-the-house/all-for-kitchen/kitchenware/sharpeners-and-sharpeners','181','2016-08-05 16:50:35','2016-08-05 16:50:35'),(182,159,0,0,'Сервировка стола','table-setting','/the-goods-for-the-house/all-for-kitchen/table-setting','193,188,186,189,185,197,194,196,195,183,191,190,192,184,187','2016-08-05 16:50:35','2016-08-05 16:50:35'),(183,182,0,0,'Столовые сервизы','dinner-sets','/the-goods-for-the-house/all-for-kitchen/table-setting/dinner-sets','183','2016-08-05 16:50:35','2016-08-05 16:50:35'),(184,182,0,0,'Столовые приборы','cutlery','/the-goods-for-the-house/all-for-kitchen/table-setting/cutlery','184','2016-08-05 16:50:35','2016-08-05 16:50:35'),(185,182,0,0,'мармиты','steam-tables','/the-goods-for-the-house/all-for-kitchen/table-setting/steam-tables','185','2016-08-05 16:50:36','2016-08-05 16:50:36'),(186,182,0,0,'Чайные и кофейные сервизы','tea-and-coffee-sets','/the-goods-for-the-house/all-for-kitchen/table-setting/tea-and-coffee-sets','186','2016-08-05 16:50:36','2016-08-05 16:50:36'),(187,182,0,0,'Бокалы и фужеры','glasses-and-stemware','/the-goods-for-the-house/all-for-kitchen/table-setting/glasses-and-stemware','187','2016-08-05 16:50:36','2016-08-05 16:50:36'),(188,182,0,0,'Стопки и рюмки','stacks-and-glasses','/the-goods-for-the-house/all-for-kitchen/table-setting/stacks-and-glasses','188','2016-08-05 16:50:36','2016-08-05 16:50:36'),(189,182,0,0,'Стаканы','glasses','/the-goods-for-the-house/all-for-kitchen/table-setting/glasses','189','2016-08-05 16:50:36','2016-08-05 16:50:36'),(190,182,0,0,'Кувшины, графины','jugs-carafes','/the-goods-for-the-house/all-for-kitchen/table-setting/jugs-carafes','190','2016-08-05 16:50:36','2016-08-05 16:50:36'),(191,182,0,0,'Чашки    ','cup','/the-goods-for-the-house/all-for-kitchen/table-setting/cup','191','2016-08-05 16:50:36','2016-08-05 16:50:36'),(192,182,0,0,'Тарелки','plates','/the-goods-for-the-house/all-for-kitchen/table-setting/plates','192','2016-08-05 16:50:37','2016-08-05 16:50:37'),(193,182,0,0,'Салатники         ','salad','/the-goods-for-the-house/all-for-kitchen/table-setting/salad','193','2016-08-05 16:50:37','2016-08-05 16:50:37'),(194,182,0,0,'Подносы, коврики','trays-mats','/the-goods-for-the-house/all-for-kitchen/table-setting/trays-mats','194','2016-08-05 16:50:37','2016-08-05 16:50:37'),(195,182,0,0,'Ножи, ножницы, топорики','knives-scissors-hatchets','/the-goods-for-the-house/all-for-kitchen/table-setting/knives-scissors-hatchets','195','2016-08-05 16:50:37','2016-08-05 16:50:37'),(196,182,0,0,'Наборы ножей','knife-sets','/the-goods-for-the-house/all-for-kitchen/table-setting/knife-sets','196','2016-08-05 16:50:37','2016-08-05 16:50:37'),(197,182,0,0,'Подставки и планки','stand-and-strap','/the-goods-for-the-house/all-for-kitchen/table-setting/stand-and-strap','197','2016-08-05 16:50:37','2016-08-05 16:50:37'),(198,159,0,0,'Емкости для хранения','storage-tanks','/the-goods-for-the-house/all-for-kitchen/storage-tanks','201,200,199','2016-08-05 16:50:37','2016-08-05 16:50:37'),(199,198,0,0,'Банки для сыпучих','banks-for-loose','/the-goods-for-the-house/all-for-kitchen/storage-tanks/banks-for-loose','199','2016-08-05 16:50:38','2016-08-05 16:50:38'),(200,198,0,0,'Контейнеры','containers','/the-goods-for-the-house/all-for-kitchen/storage-tanks/containers','200','2016-08-05 16:50:38','2016-08-05 16:50:38'),(201,198,0,0,'Лотки','trays','/the-goods-for-the-house/all-for-kitchen/storage-tanks/trays','201','2016-08-05 16:50:38','2016-08-05 16:50:38'),(202,124,0,0,'Хранение','storage','/the-goods-for-the-house/storage','203,204,205','2016-08-05 16:50:38','2016-08-05 16:50:38'),(203,202,0,0,'Органайзеры','organizers','/the-goods-for-the-house/storage/organizers','203','2016-08-05 16:50:38','2016-08-05 16:50:38'),(204,202,0,0,'Коробки, кузовки','boxes-kuzuki','/the-goods-for-the-house/storage/boxes-kuzuki','204','2016-08-05 16:50:38','2016-08-05 16:50:38'),(205,202,0,0,'Чехлы','covers','/the-goods-for-the-house/storage/covers','205','2016-08-05 16:50:38','2016-08-05 16:50:38'),(206,124,0,0,'Хозтовары','housewares','/the-goods-for-the-house/housewares','207,210,208,209,212,211','2016-08-05 16:50:39','2016-08-05 16:50:39'),(207,206,0,0,'Гладильные доски, сушилки','ironing-boards-dryers','/the-goods-for-the-house/housewares/ironing-boards-dryers','207','2016-08-05 16:50:39','2016-08-05 16:50:39'),(208,206,0,0,'Корзины, короба','baskets-boxes','/the-goods-for-the-house/housewares/baskets-boxes','208','2016-08-05 16:50:39','2016-08-05 16:50:39'),(209,206,0,0,'Щетки, швабры','brushes-mops','/the-goods-for-the-house/housewares/brushes-mops','209','2016-08-05 16:50:39','2016-08-05 16:50:39'),(210,206,0,0,'Ведра, тазы','buckets-basins','/the-goods-for-the-house/housewares/buckets-basins','210','2016-08-05 16:50:39','2016-08-05 16:50:39'),(211,206,0,0,'Вешалки','hanger','/the-goods-for-the-house/housewares/hanger','211','2016-08-05 16:50:39','2016-08-05 16:50:39'),(212,206,0,0,'Придверные коврики','doorway-mats','/the-goods-for-the-house/housewares/doorway-mats','212','2016-08-05 16:50:39','2016-08-05 16:50:39'),(213,124,0,0,'Бытовая химия ','household-chemicals','/the-goods-for-the-house/household-chemicals','218,217,215,216,214','2016-08-05 16:50:40','2016-08-05 16:50:40'),(214,213,0,0,'Средства для мытья посуды','means-for-washing-dishes','/the-goods-for-the-house/household-chemicals/means-for-washing-dishes','214','2016-08-05 16:50:40','2016-08-05 16:50:40'),(215,213,0,0,'Средства для стирки','detergent','/the-goods-for-the-house/household-chemicals/detergent','215','2016-08-05 16:50:40','2016-08-05 16:50:40'),(216,213,0,0,'Средства для уборки','cleaning','/the-goods-for-the-house/household-chemicals/cleaning','216','2016-08-05 16:50:40','2016-08-05 16:50:40'),(217,213,0,0,'Средства по уходу за бытовой техникой','care-for-appliances','/the-goods-for-the-house/household-chemicals/care-for-appliances','217','2016-08-05 16:50:40','2016-08-05 16:50:40'),(218,213,0,0,'Средства борьбы с насекомыми','means-of-struggle-against-insects','/the-goods-for-the-house/household-chemicals/means-of-struggle-against-insects','218','2016-08-05 16:50:40','2016-08-05 16:50:40'),(219,124,0,0,'Освещение ','lighting','/the-goods-for-the-house/lighting','222,224,220,226,225,223,221','2016-08-05 16:50:40','2016-08-05 16:50:40'),(220,219,0,0,'Люстры и подвесы','chandeliers-and-suspensions','/the-goods-for-the-house/lighting/chandeliers-and-suspensions','220','2016-08-05 16:50:40','2016-08-05 16:50:40'),(221,219,0,0,'Бра и настенные светильники','sconces-and-wall-lamps','/the-goods-for-the-house/lighting/sconces-and-wall-lamps','221','2016-08-05 16:50:41','2016-08-05 16:50:41'),(222,219,0,0,'Настольные лампы','table-lamp','/the-goods-for-the-house/lighting/table-lamp','222','2016-08-05 16:50:41','2016-08-05 16:50:41'),(223,219,0,0,'Торшеры','floor-lamps','/the-goods-for-the-house/lighting/floor-lamps','223','2016-08-05 16:50:41','2016-08-05 16:50:41'),(224,219,0,0,'Детские светильники ','children-s-lamps','/the-goods-for-the-house/lighting/children-s-lamps','224','2016-08-05 16:50:41','2016-08-05 16:50:41'),(225,219,0,0,'Садово-парковые светильники','park-and-garden-luminaires','/the-goods-for-the-house/lighting/park-and-garden-luminaires','225','2016-08-05 16:50:41','2016-08-05 16:50:41'),(226,219,0,0,'Лампочки и аксессуары','light-bulbs-and-accessories','/the-goods-for-the-house/lighting/light-bulbs-and-accessories','226','2016-08-05 16:50:41','2016-08-05 16:50:41'),(227,124,0,0,'Мебель ','furniture','/the-goods-for-the-house/furniture','235,229,236,234,233,232,231,228,230','2016-08-05 16:50:41','2016-08-05 16:50:41'),(228,227,0,0,'Бескаркасная мебель','frameless-furniture','/the-goods-for-the-house/furniture/frameless-furniture','228','2016-08-05 16:50:41','2016-08-05 16:50:41'),(229,227,0,0,'Журнальные столы','coffee-tables','/the-goods-for-the-house/furniture/coffee-tables','229','2016-08-05 16:50:42','2016-08-05 16:50:42'),(230,227,0,0,'Кресла','chairs','/the-goods-for-the-house/furniture/chairs','230','2016-08-05 16:50:42','2016-08-05 16:50:42'),(231,227,0,0,'Стулья и табуреты','chairs-and-stools','/the-goods-for-the-house/furniture/chairs-and-stools','231','2016-08-05 16:50:42','2016-08-05 16:50:42'),(232,227,0,0,'Складная мебель','folding-furniture','/the-goods-for-the-house/furniture/folding-furniture','232','2016-08-05 16:50:42','2016-08-05 16:50:42'),(233,227,0,0,'Пластиковая мебель','plastic-furniture','/the-goods-for-the-house/furniture/plastic-furniture','233','2016-08-05 16:50:42','2016-08-05 16:50:42'),(234,227,0,0,'Садовые зонты и подставки','garden-umbrellas-and-stands','/the-goods-for-the-house/furniture/garden-umbrellas-and-stands','234','2016-08-05 16:50:42','2016-08-05 16:50:42'),(235,227,0,0,'Садовые качели','garden-swing','/the-goods-for-the-house/furniture/garden-swing','235','2016-08-05 16:50:42','2016-08-05 16:50:42'),(236,227,0,0,'Столики для ноутбуков и IT-техники','tables-for-laptops-and-it-equipment','/the-goods-for-the-house/furniture/tables-for-laptops-and-it-equipment','236','2016-08-05 16:50:42','2016-08-05 16:50:42'),(237,124,0,0,'Бытовая техника  ','appliances','/the-goods-for-the-house/appliances','257,246,277,248,253,274,245,244,275,263,243,278,266,259,256,252,279,276,273,241,247,239,254,271,272,260,249,251,250,262,268,265,238,261,258,264,255,267,270,269,240,242','2016-08-05 16:50:43','2016-08-05 16:50:43'),(238,237,0,0,'Техника для ухода','technique-to-care','/the-goods-for-the-house/appliances/technique-to-care','240,246,243,244,242,245,239,241','2016-08-05 16:50:43','2016-08-05 16:50:43'),(239,238,0,0,'Бритвы электрические','razor-electric','/the-goods-for-the-house/appliances/technique-to-care/razor-electric','239','2016-08-05 16:50:43','2016-08-05 16:50:43'),(240,238,0,0,'Косметические приборы','care-products','/the-goods-for-the-house/appliances/technique-to-care/care-products','240','2016-08-05 16:50:43','2016-08-05 16:50:43'),(241,238,0,0,'Массажеры электрические','massagers-electric','/the-goods-for-the-house/appliances/technique-to-care/massagers-electric','241','2016-08-05 16:50:43','2016-08-05 16:50:43'),(242,238,0,0,'Медицинские приборы','medical-devices','/the-goods-for-the-house/appliances/technique-to-care/medical-devices','242','2016-08-05 16:50:43','2016-08-05 16:50:43'),(243,238,0,0,'Машинки для стрижки, тримеры','the-clippers-trimers','/the-goods-for-the-house/appliances/technique-to-care/the-clippers-trimers','243','2016-08-05 16:50:43','2016-08-05 16:50:43'),(244,238,0,0,'Приборы для укладки волос','devices-for-hair-styling','/the-goods-for-the-house/appliances/technique-to-care/devices-for-hair-styling','244','2016-08-05 16:50:43','2016-08-05 16:50:43'),(245,238,0,0,'Электрические зубные щетки','electric-toothbrushes','/the-goods-for-the-house/appliances/technique-to-care/electric-toothbrushes','245','2016-08-05 16:50:43','2016-08-05 16:50:43'),(246,238,0,0,'Эпиляторы','epilators','/the-goods-for-the-house/appliances/technique-to-care/epilators','246','2016-08-05 16:50:44','2016-08-05 16:50:44'),(247,237,0,0,'Техника для кухни','kitchen-appliances','/the-goods-for-the-house/appliances/kitchen-appliances','250,251,253,248,249,262,257,260,252,254,261,263,265,268,256,259,267,270,269,255,266,264,258','2016-08-05 16:50:44','2016-08-05 16:50:44'),(248,247,0,0,'Блендеры','blenders','/the-goods-for-the-house/appliances/kitchen-appliances/blenders','248','2016-08-05 16:50:44','2016-08-05 16:50:44'),(249,247,0,0,'Вафельницы','waffle-makers','/the-goods-for-the-house/appliances/kitchen-appliances/waffle-makers','249','2016-08-05 16:50:44','2016-08-05 16:50:44'),(250,247,0,0,'Кофеварки','coffee-makers','/the-goods-for-the-house/appliances/kitchen-appliances/coffee-makers','250','2016-08-05 16:50:44','2016-08-05 16:50:44'),(251,247,0,0,'Кофемолки','grinders','/the-goods-for-the-house/appliances/kitchen-appliances/grinders','251','2016-08-05 16:50:44','2016-08-05 16:50:44'),(252,247,0,0,'Кухонные весы','kitchen-scales','/the-goods-for-the-house/appliances/kitchen-appliances/kitchen-scales','252','2016-08-05 16:50:44','2016-08-05 16:50:44'),(253,247,0,0,'Кухонные комбайны','food-processors','/the-goods-for-the-house/appliances/kitchen-appliances/food-processors','253','2016-08-05 16:50:44','2016-08-05 16:50:44'),(254,247,0,0,'Миксеры','mixers','/the-goods-for-the-house/appliances/kitchen-appliances/mixers','254','2016-08-05 16:50:44','2016-08-05 16:50:44'),(255,247,0,0,'Мультиварки','slow-cooker','/the-goods-for-the-house/appliances/kitchen-appliances/slow-cooker','255','2016-08-05 16:50:45','2016-08-05 16:50:45'),(256,247,0,0,'Мясорубки','grinder','/the-goods-for-the-house/appliances/kitchen-appliances/grinder','256','2016-08-05 16:50:45','2016-08-05 16:50:45'),(257,247,0,0,'Пароварки','steamers','/the-goods-for-the-house/appliances/kitchen-appliances/steamers','257','2016-08-05 16:50:45','2016-08-05 16:50:45'),(258,247,0,0,'Соковыжималки','juicer','/the-goods-for-the-house/appliances/kitchen-appliances/juicer','258','2016-08-05 16:50:45','2016-08-05 16:50:45'),(259,247,0,0,'Тостеры','toasters','/the-goods-for-the-house/appliances/kitchen-appliances/toasters','259','2016-08-05 16:50:45','2016-08-05 16:50:45'),(260,247,0,0,'Хлебопечки','bread-machine','/the-goods-for-the-house/appliances/kitchen-appliances/bread-machine','260','2016-08-05 16:50:45','2016-08-05 16:50:45'),(261,247,0,0,'Чайники электрические','electrical','/the-goods-for-the-house/appliances/kitchen-appliances/electrical','261','2016-08-05 16:50:45','2016-08-05 16:50:45'),(262,247,0,0,'Йогуртницы, творожницы','yogurtnitsy-tvorozhniy','/the-goods-for-the-house/appliances/kitchen-appliances/yogurtnitsy-tvorozhniy','262','2016-08-05 16:50:45','2016-08-05 16:50:45'),(263,247,0,0,'Аерогрили','aerogril','/the-goods-for-the-house/appliances/kitchen-appliances/aerogril','263','2016-08-05 16:50:46','2016-08-05 16:50:46'),(264,247,0,0,'Грили, электрошашлычницы','greeley-electrocasnice','/the-goods-for-the-house/appliances/kitchen-appliances/greeley-electrocasnice','264','2016-08-05 16:50:46','2016-08-05 16:50:46'),(265,247,0,0,'Ломтерезки ','slicer','/the-goods-for-the-house/appliances/kitchen-appliances/slicer','265','2016-08-05 16:50:46','2016-08-05 16:50:46'),(266,247,0,0,'Маринаторы','marinator','/the-goods-for-the-house/appliances/kitchen-appliances/marinator','266','2016-08-05 16:50:46','2016-08-05 16:50:46'),(267,247,0,0,'Настольные плиты','table-plate','/the-goods-for-the-house/appliances/kitchen-appliances/table-plate','267','2016-08-05 16:50:46','2016-08-05 16:50:46'),(268,247,0,0,'Сушилки для овощей и фруктов','dryer-for-vegetables-and-fruits','/the-goods-for-the-house/appliances/kitchen-appliances/dryer-for-vegetables-and-fruits','268','2016-08-05 16:50:46','2016-08-05 16:50:46'),(269,247,0,0,'Фритюрницы','fryer','/the-goods-for-the-house/appliances/kitchen-appliances/fryer','269','2016-08-05 16:50:46','2016-08-05 16:50:46'),(270,247,0,0,'Аксессуары для кухонной техники','accessories-for-kitchen-appliances','/the-goods-for-the-house/appliances/kitchen-appliances/accessories-for-kitchen-appliances','270','2016-08-05 16:50:47','2016-08-05 16:50:47'),(271,237,0,0,'Техника для дома','home-appliances','/the-goods-for-the-house/appliances/home-appliances','278,277,272,275,279,276,273,274','2016-08-05 16:50:47','2016-08-05 16:50:47'),(272,271,0,0,'Весы','libra','/the-goods-for-the-house/appliances/home-appliances/libra','272','2016-08-05 16:50:47','2016-08-05 16:50:47'),(273,271,0,0,'Вентиляторы','fans','/the-goods-for-the-house/appliances/home-appliances/fans','273','2016-08-05 16:50:47','2016-08-05 16:50:47'),(274,271,0,0,'Обогреватели','heaters','/the-goods-for-the-house/appliances/home-appliances/heaters','274','2016-08-05 16:50:47','2016-08-05 16:50:47'),(275,271,0,0,'Пароочистители','steam-cleaners','/the-goods-for-the-house/appliances/home-appliances/steam-cleaners','275','2016-08-05 16:50:47','2016-08-05 16:50:47'),(276,271,0,0,'Пылесосы','vacuum-cleaner','/the-goods-for-the-house/appliances/home-appliances/vacuum-cleaner','276','2016-08-05 16:50:47','2016-08-05 16:50:47'),(277,271,0,0,'Увлажнители воздуха','humidifiers','/the-goods-for-the-house/appliances/home-appliances/humidifiers','277','2016-08-05 16:50:47','2016-08-05 16:50:47'),(278,271,0,0,'Утюги','irons','/the-goods-for-the-house/appliances/home-appliances/irons','278','2016-08-05 16:50:47','2016-08-05 16:50:47'),(279,271,0,0,'Электронные сигареты и аксесуары','electronic-cigarettes-and-accessories','/the-goods-for-the-house/appliances/home-appliances/electronic-cigarettes-and-accessories','279','2016-08-05 16:50:48','2016-08-05 16:50:48'),(280,0,0,0,'Дача, сад, огород ','cottage-garden-kitchen-garden','/cottage-garden-kitchen-garden','283,281,284,286,285,282','2016-08-05 16:50:48','2016-08-05 16:50:48'),(281,280,0,0,'Садовая техника','garden-machinery','/cottage-garden-kitchen-garden/garden-machinery','281','2016-08-05 16:50:48','2016-08-05 16:50:48'),(282,280,0,0,'Садовый инвентарь','garden-tools','/cottage-garden-kitchen-garden/garden-tools','282','2016-08-05 16:50:48','2016-08-05 16:50:48'),(283,280,0,0,'Системы полива','watering-system','/cottage-garden-kitchen-garden/watering-system','283','2016-08-05 16:50:48','2016-08-05 16:50:48'),(284,280,0,0,'Семена и удобрения','seed-and-fertilizer','/cottage-garden-kitchen-garden/seed-and-fertilizer','284','2016-08-05 16:50:48','2016-08-05 16:50:48'),(285,280,0,0,'Садовая мебель','garden-furniture','/cottage-garden-kitchen-garden/garden-furniture','285','2016-08-05 16:50:48','2016-08-05 16:50:48'),(286,280,0,0,'Садовый декор','garden-decor','/cottage-garden-kitchen-garden/garden-decor','286','2016-08-05 16:50:48','2016-08-05 16:50:48'),(287,0,0,0,'Красота и здоровье ','health-and-beauty','/health-and-beauty','331,292,329,337,308,332,317,288,336,334,326,293,303,306,291,325,324,295,320,302,301,297,304,298,323,322,330,333,309,299,310,313,318,289,321,300,296,327,290,305,314,315,311,307,319,328,316,294,335,312','2016-08-05 16:50:49','2016-08-05 16:50:49'),(288,287,0,0,'Уход за волосами','hair-care','/health-and-beauty/hair-care','296,294,290,291,289,293,295,292','2016-08-05 16:50:49','2016-08-05 16:50:49'),(289,288,0,0,'Шампуни, ','shampoos-','/health-and-beauty/hair-care/shampoos-','289','2016-08-05 16:50:49','2016-08-05 16:50:49'),(290,288,0,0,'Кондиционеры','air-conditioning','/health-and-beauty/hair-care/air-conditioning','290','2016-08-05 16:50:49','2016-08-05 16:50:49'),(291,288,0,0,'Бальзамы, ополаскиватели','balms-conditioners','/health-and-beauty/hair-care/balms-conditioners','291','2016-08-05 16:50:49','2016-08-05 16:50:49'),(292,288,0,0,'Маски ','mask','/health-and-beauty/hair-care/mask','292','2016-08-05 16:50:49','2016-08-05 16:50:49'),(293,288,0,0,'Масла, сыворотки','oil-serum','/health-and-beauty/hair-care/oil-serum','293','2016-08-05 16:50:49','2016-08-05 16:50:49'),(294,288,0,0,'Стайлинг','styling','/health-and-beauty/hair-care/styling','294','2016-08-05 16:50:49','2016-08-05 16:50:49'),(295,288,0,0,'Окрашивание ','staining','/health-and-beauty/hair-care/staining','295','2016-08-05 16:50:50','2016-08-05 16:50:50'),(296,288,0,0,'Аксессуары для волос','hair-accessories','/health-and-beauty/hair-care/hair-accessories','296','2016-08-05 16:50:50','2016-08-05 16:50:50'),(297,287,0,0,'Уход за телом','body-care','/health-and-beauty/body-care','302,299,301,305,307,308,303,300,306,304,298','2016-08-05 16:50:50','2016-08-05 16:50:50'),(298,297,0,0,'Кремы, лосьоны','creams-lotions','/health-and-beauty/body-care/creams-lotions','298','2016-08-05 16:50:50','2016-08-05 16:50:50'),(299,297,0,0,'Спреи','sprays','/health-and-beauty/body-care/sprays','299','2016-08-05 16:50:50','2016-08-05 16:50:50'),(300,297,0,0,'Гели для душа','shower-gels','/health-and-beauty/body-care/shower-gels','300','2016-08-05 16:50:50','2016-08-05 16:50:50'),(301,297,0,0,'Мыло','soap','/health-and-beauty/body-care/soap','301','2016-08-05 16:50:50','2016-08-05 16:50:50'),(302,297,0,0,'Масла','oil','/health-and-beauty/body-care/oil','302','2016-08-05 16:50:50','2016-08-05 16:50:50'),(303,297,0,0,'Скрабы, пилинги','scrubs-peels','/health-and-beauty/body-care/scrubs-peels','303','2016-08-05 16:50:51','2016-08-05 16:50:51'),(304,297,0,0,'Средства для ванн','bath-products','/health-and-beauty/body-care/bath-products','304','2016-08-05 16:50:51','2016-08-05 16:50:51'),(305,297,0,0,'Коррекция фигуры','correction','/health-and-beauty/body-care/correction','305','2016-08-05 16:50:51','2016-08-05 16:50:51'),(306,297,0,0,'Депиляция','waxing','/health-and-beauty/body-care/waxing','306','2016-08-05 16:50:51','2016-08-05 16:50:51'),(307,297,0,0,'Интимная гигиена','intimate-hygiene','/health-and-beauty/body-care/intimate-hygiene','307','2016-08-05 16:50:51','2016-08-05 16:50:51'),(308,297,0,0,'Дезодоранты','deodorants','/health-and-beauty/body-care/deodorants','308','2016-08-05 16:50:51','2016-08-05 16:50:51'),(309,287,0,0,'Уход за лицом','facials','/health-and-beauty/facials','311,313,310,314,312','2016-08-05 16:50:51','2016-08-05 16:50:51'),(310,309,0,0,'Демакияж','make-up-remover','/health-and-beauty/facials/make-up-remover','310','2016-08-05 16:50:51','2016-08-05 16:50:51'),(311,309,0,0,'Скрабы, пилинги','scrubs-peels','/health-and-beauty/facials/scrubs-peels','311','2016-08-05 16:50:51','2016-08-05 16:50:51'),(312,309,0,0,'Кремы, гели, ','creams-gels-','/health-and-beauty/facials/creams-gels-','312','2016-08-05 16:50:52','2016-08-05 16:50:52'),(313,309,0,0,'Сыворотки','serum','/health-and-beauty/facials/serum','313','2016-08-05 16:50:52','2016-08-05 16:50:52'),(314,309,0,0,'Маски','mask','/health-and-beauty/facials/mask','314','2016-08-05 16:50:52','2016-08-05 16:50:52'),(315,287,0,0,'Уход за руками, ногами','hand-care-feet','/health-and-beauty/hand-care-feet','317,316,318','2016-08-05 16:50:52','2016-08-05 16:50:52'),(316,315,0,0,'Косметика для рук и ногтей','cosmetics-for-hands-and-nails','/health-and-beauty/hand-care-feet/cosmetics-for-hands-and-nails','316','2016-08-05 16:50:52','2016-08-05 16:50:52'),(317,315,0,0,'Косметика для ног','cosmetics-for-feet','/health-and-beauty/hand-care-feet/cosmetics-for-feet','317','2016-08-05 16:50:52','2016-08-05 16:50:52'),(318,315,0,0,'Средства для маникюра и педикюра','tools-for-manicure-and-pedicure','/health-and-beauty/hand-care-feet/tools-for-manicure-and-pedicure','318','2016-08-05 16:50:52','2016-08-05 16:50:52'),(319,287,0,0,'Парфюмерия','perfume','/health-and-beauty/perfume','322,321,320','2016-08-05 16:50:52','2016-08-05 16:50:52'),(320,319,0,0,'Женские ароматы','women-s-fragrances','/health-and-beauty/perfume/women-s-fragrances','320','2016-08-05 16:50:52','2016-08-05 16:50:52'),(321,319,0,0,'Мужские ароматы','men-s-fragrances','/health-and-beauty/perfume/men-s-fragrances','321','2016-08-05 16:50:53','2016-08-05 16:50:53'),(322,319,0,0,'Унисекс','unisex','/health-and-beauty/perfume/unisex','322','2016-08-05 16:50:53','2016-08-05 16:50:53'),(323,287,0,0,'Декоративная косметика','decorative-cosmetics','/health-and-beauty/decorative-cosmetics','324,325,326','2016-08-05 16:50:53','2016-08-05 16:50:53'),(324,323,0,0,'Для глаз','for-eyes','/health-and-beauty/decorative-cosmetics/for-eyes','324','2016-08-05 16:50:53','2016-08-05 16:50:53'),(325,323,0,0,'Для губ','lip','/health-and-beauty/decorative-cosmetics/lip','325','2016-08-05 16:50:53','2016-08-05 16:50:53'),(326,323,0,0,'Для лица','for-the-face','/health-and-beauty/decorative-cosmetics/for-the-face','326','2016-08-05 16:50:53','2016-08-05 16:50:53'),(327,287,0,0,'Уход за полостью рта','care-for-the-oral-cavity','/health-and-beauty/care-for-the-oral-cavity','328,330,329','2016-08-05 16:50:53','2016-08-05 16:50:53'),(328,327,0,0,'Пасты, порошки','paste-powder','/health-and-beauty/care-for-the-oral-cavity/paste-powder','328','2016-08-05 16:50:53','2016-08-05 16:50:53'),(329,327,0,0,'Ополаскиватели','rinses','/health-and-beauty/care-for-the-oral-cavity/rinses','329','2016-08-05 16:50:54','2016-08-05 16:50:54'),(330,327,0,0,'Щетки, нити','brush-filament','/health-and-beauty/care-for-the-oral-cavity/brush-filament','330','2016-08-05 16:50:54','2016-08-05 16:50:54'),(331,287,0,0,'Мужская линия','the-male-line','/health-and-beauty/the-male-line','332,335,336,334,337,333','2016-08-05 16:50:54','2016-08-05 16:50:54'),(332,331,0,0,'Шампуни, кондиционеры','shampoos-conditioners','/health-and-beauty/the-male-line/shampoos-conditioners','332','2016-08-05 16:50:54','2016-08-05 16:50:54'),(333,331,0,0,'Гели для душа','shower-gels','/health-and-beauty/the-male-line/shower-gels','333','2016-08-05 16:50:54','2016-08-05 16:50:54'),(334,331,0,0,'Антиперспиранты','antiperspirants','/health-and-beauty/the-male-line/antiperspirants','334','2016-08-05 16:50:54','2016-08-05 16:50:54'),(335,331,0,0,'Уход за лицом','facials','/health-and-beauty/the-male-line/facials','335','2016-08-05 16:50:54','2016-08-05 16:50:54'),(336,331,0,0,'Средства для бритья','shaving','/health-and-beauty/the-male-line/shaving','336','2016-08-05 16:50:55','2016-08-05 16:50:55'),(337,331,0,0,'Уход за бородой и усами','care-beard-and-mustache','/health-and-beauty/the-male-line/care-beard-and-mustache','337','2016-08-05 16:50:55','2016-08-05 16:50:55'),(338,0,0,0,'Товары для детей ','products-for-children','/products-for-children','343,361,349,347,366,346,365,367,355,351,362,341,350,342,354,340,364,352,344,360,353,359,345,339,358,348,363,356,357','2016-08-05 16:50:55','2016-08-05 16:50:55'),(339,338,0,0,'Игрушки','toys','/products-for-children/toys','350,342,351,348,345,341,346,344,349,343,347,340','2016-08-05 16:50:55','2016-08-05 16:50:55'),(340,339,0,0,'Игрушки для новорожденных','toys-for-newborns','/products-for-children/toys/toys-for-newborns','340','2016-08-05 16:50:55','2016-08-05 16:50:55'),(341,339,0,0,'Интерактивные игрушки','interactive-toys','/products-for-children/toys/interactive-toys','341','2016-08-05 16:50:55','2016-08-05 16:50:55'),(342,339,0,0,'Куклы','doll','/products-for-children/toys/doll','342','2016-08-05 16:50:55','2016-08-05 16:50:55'),(343,339,0,0,'Игровые наборы и фигурки','playsets-and-figures','/products-for-children/toys/playsets-and-figures','343','2016-08-05 16:50:55','2016-08-05 16:50:55'),(344,339,0,0,'Конструкторы','designers','/products-for-children/toys/designers','344','2016-08-05 16:50:55','2016-08-05 16:50:55'),(345,339,0,0,'Игрушечный транспорт, военная техника','toy-vehicles-military-equipment','/products-for-children/toys/toy-vehicles-military-equipment','345','2016-08-05 16:50:56','2016-08-05 16:50:56'),(346,339,0,0,'Игрушки на радиоуправлении','for-radio-control-toys','/products-for-children/toys/for-radio-control-toys','346','2016-08-05 16:50:56','2016-08-05 16:50:56'),(347,339,0,0,'Мягкие игрушки','soft-toys','/products-for-children/toys/soft-toys','347','2016-08-05 16:50:56','2016-08-05 16:50:56'),(348,339,0,0,'Настольные игры','board-games','/products-for-children/toys/board-games','348','2016-08-05 16:50:56','2016-08-05 16:50:56'),(349,339,0,0,'Спортивные и активные игры','sports-and-active-games','/products-for-children/toys/sports-and-active-games','349','2016-08-05 16:50:56','2016-08-05 16:50:56'),(350,339,0,0,'Развитие и обучение','training-and-development','/products-for-children/toys/training-and-development','350','2016-08-05 16:50:56','2016-08-05 16:50:56'),(351,339,0,0,'Хобби и творчество','hobby-and-creativity','/products-for-children/toys/hobby-and-creativity','351','2016-08-05 16:50:56','2016-08-05 16:50:56'),(352,338,0,0,'Все для школы','school-supply','/products-for-children/school-supply','354,355,353','2016-08-05 16:50:57','2016-08-05 16:50:57'),(353,352,0,0,'Канцелярские наборы','stationery-sets','/products-for-children/school-supply/stationery-sets','353','2016-08-05 16:50:57','2016-08-05 16:50:57'),(354,352,0,0,'Канцтовары','stationery','/products-for-children/school-supply/stationery','354','2016-08-05 16:50:57','2016-08-05 16:50:57'),(355,352,0,0,'Школьные ранцы, рюкзаки, сумки','school-bags-backpacks-bags','/products-for-children/school-supply/school-bags-backpacks-bags','355','2016-08-05 16:50:57','2016-08-05 16:50:57'),(356,338,0,0,'Хобби и Творчество ','hobby-and-creativity','/products-for-children/hobby-and-creativity','358,359,361,360,357','2016-08-05 16:50:57','2016-08-05 16:50:57'),(357,356,0,0,'Рисование','drawing','/products-for-children/hobby-and-creativity/drawing','357','2016-08-05 16:50:57','2016-08-05 16:50:57'),(358,356,0,0,'Вышивание','embroidery','/products-for-children/hobby-and-creativity/embroidery','358','2016-08-05 16:50:57','2016-08-05 16:50:57'),(359,356,0,0,'Скрапбукинг','scrapbooking','/products-for-children/hobby-and-creativity/scrapbooking','359','2016-08-05 16:50:57','2016-08-05 16:50:57'),(360,356,0,0,'Оригами, квиллинг','origami-quilling','/products-for-children/hobby-and-creativity/origami-quilling','360','2016-08-05 16:50:58','2016-08-05 16:50:58'),(361,356,0,0,'Заготовки, декупаж','blanks-decoupage','/products-for-children/hobby-and-creativity/blanks-decoupage','361','2016-08-05 16:50:58','2016-08-05 16:50:58'),(362,338,0,0,'Питание и кормление','food-and-nutrition','/products-for-children/food-and-nutrition','364,363','2016-08-05 16:50:58','2016-08-05 16:50:58'),(363,362,0,0,'Детское питание','baby-food','/products-for-children/food-and-nutrition/baby-food','363','2016-08-05 16:50:58','2016-08-05 16:50:58'),(364,362,0,0,'Аксессуары для кормления','feeding-accessories','/products-for-children/food-and-nutrition/feeding-accessories','364','2016-08-05 16:50:58','2016-08-05 16:50:58'),(365,338,0,0,'Подгузники и гигиена','diapers-and-hygiene','/products-for-children/diapers-and-hygiene','367,366','2016-08-05 16:50:58','2016-08-05 16:50:58'),(366,365,0,0,'Косметика','cosmetics','/products-for-children/diapers-and-hygiene/cosmetics','366','2016-08-05 16:50:58','2016-08-05 16:50:58'),(367,365,0,0,'Для ванной','for-the-bathroom','/products-for-children/diapers-and-hygiene/for-the-bathroom','367','2016-08-05 16:50:58','2016-08-05 16:50:58'),(368,0,0,0,'Спортивные товары','sporting-goods','/sporting-goods','448,388,459,392,385,386,429,409,446,387,427,412,419,370,415,454,401,394,381,406,400,463,453,424,428,373,393,413,456,383,417,414,380,420,405,442,421,460,458,439,407,430,438,464,389,437,374,403,377,436,425,384,426,461,398,397,433,432,395,451,447,396,450,434,462,378,411,371,379,455,452,416,440,390,444,418,375,431,372,382,376,402,408,466,443,465,457,422,369,391,445,410,449,441,399,423,404,435','2016-08-05 16:50:59','2016-08-05 16:50:59'),(369,368,0,0,'Тренажеры и оборудование','simulators-and-equipment','/sporting-goods/simulators-and-equipment','379,371,380,376,381,372,375,378,370,377,373,374','2016-08-05 16:50:59','2016-08-05 16:50:59'),(370,369,0,0,'Беговые дорожки','treadmills','/sporting-goods/simulators-and-equipment/treadmills','370','2016-08-05 16:50:59','2016-08-05 16:50:59'),(371,369,0,0,'Орбитреки','cross-trainers','/sporting-goods/simulators-and-equipment/cross-trainers','371','2016-08-05 16:50:59','2016-08-05 16:50:59'),(372,369,0,0,'Велотренажеры','bicycles','/sporting-goods/simulators-and-equipment/bicycles','372','2016-08-05 16:50:59','2016-08-05 16:50:59'),(373,369,0,0,'Гребные тренажеры','rowing-machines','/sporting-goods/simulators-and-equipment/rowing-machines','373','2016-08-05 16:50:59','2016-08-05 16:50:59'),(374,369,0,0,'Силовые тренажеры','strength-training','/sporting-goods/simulators-and-equipment/strength-training','374','2016-08-05 16:50:59','2016-08-05 16:50:59'),(375,369,0,0,'Степперы','steppers','/sporting-goods/simulators-and-equipment/steppers','375','2016-08-05 16:51:00','2016-08-05 16:51:00'),(376,369,0,0,'Гантели, диски, грифы, замки','dumbbells-discs-bars-locks','/sporting-goods/simulators-and-equipment/dumbbells-discs-bars-locks','376','2016-08-05 16:51:00','2016-08-05 16:51:00'),(377,369,0,0,'Шведские стенки','the-wall','/sporting-goods/simulators-and-equipment/the-wall','377','2016-08-05 16:51:00','2016-08-05 16:51:00'),(378,369,0,0,'Кистевые тренажеры','spray-trainers','/sporting-goods/simulators-and-equipment/spray-trainers','378','2016-08-05 16:51:00','2016-08-05 16:51:00'),(379,369,0,0,'Перчатки и пояса','gloves-and-belt','/sporting-goods/simulators-and-equipment/gloves-and-belt','379','2016-08-05 16:51:00','2016-08-05 16:51:00'),(380,369,0,0,'Батуты и аксессуары','trampolines-and-accessories','/sporting-goods/simulators-and-equipment/trampolines-and-accessories','380','2016-08-05 16:51:00','2016-08-05 16:51:00'),(381,369,0,0,'Массажные столы','massage-tables','/sporting-goods/simulators-and-equipment/massage-tables','381','2016-08-05 16:51:00','2016-08-05 16:51:00'),(382,368,0,0,'Фитнес и аэробика','fitness-and-aerobics','/sporting-goods/fitness-and-aerobics','386,384,385,383','2016-08-05 16:51:00','2016-08-05 16:51:00'),(383,382,0,0,'Массажные обручи','massage-hoops','/sporting-goods/fitness-and-aerobics/massage-hoops','383','2016-08-05 16:51:00','2016-08-05 16:51:00'),(384,382,0,0,'Пояса и перчатки','the-belt-and-gloves','/sporting-goods/fitness-and-aerobics/the-belt-and-gloves','384','2016-08-05 16:51:00','2016-08-05 16:51:00'),(385,382,0,0,'Аксессуары для фитнеса','fitness-accessories','/sporting-goods/fitness-and-aerobics/fitness-accessories','385','2016-08-05 16:51:01','2016-08-05 16:51:01'),(386,382,0,0,'Одежда для фитнеса','clothes-for-fitness','/sporting-goods/fitness-and-aerobics/clothes-for-fitness','386','2016-08-05 16:51:01','2016-08-05 16:51:01'),(387,368,0,0,'Спортивное питание','sports-nutrition','/sporting-goods/sports-nutrition','397,394,389,395,388,393,396,392,390,391','2016-08-05 16:51:01','2016-08-05 16:51:01'),(388,387,0,0,'Аминокислоты','amino-acids','/sporting-goods/sports-nutrition/amino-acids','388','2016-08-05 16:51:01','2016-08-05 16:51:01'),(389,387,0,0,'Витамины','vitamins','/sporting-goods/sports-nutrition/vitamins','389','2016-08-05 16:51:01','2016-08-05 16:51:01'),(390,387,0,0,'Гейнеры','gainers','/sporting-goods/sports-nutrition/gainers','390','2016-08-05 16:51:01','2016-08-05 16:51:01'),(391,387,0,0,'Жиросжигатели','fat-burners','/sporting-goods/sports-nutrition/fat-burners','391','2016-08-05 16:51:01','2016-08-05 16:51:01'),(392,387,0,0,'Креатин','creatine','/sporting-goods/sports-nutrition/creatine','392','2016-08-05 16:51:01','2016-08-05 16:51:01'),(393,387,0,0,'Протеин','protein','/sporting-goods/sports-nutrition/protein','393','2016-08-05 16:51:01','2016-08-05 16:51:01'),(394,387,0,0,'Предтренировочные комплексы','pre-workout-supplement','/sporting-goods/sports-nutrition/pre-workout-supplement','394','2016-08-05 16:51:02','2016-08-05 16:51:02'),(395,387,0,0,'Специальные продукты','special-products','/sporting-goods/sports-nutrition/special-products','395','2016-08-05 16:51:02','2016-08-05 16:51:02'),(396,387,0,0,'Аксессуары для спортивного питания','accessories-for-sports-nutrition','/sporting-goods/sports-nutrition/accessories-for-sports-nutrition','396','2016-08-05 16:51:02','2016-08-05 16:51:02'),(397,387,0,0,'Энергетические батончики и мюсли','energy-bars-and-granola','/sporting-goods/sports-nutrition/energy-bars-and-granola','397','2016-08-05 16:51:02','2016-08-05 16:51:02'),(398,368,0,0,'Велосипеды и аксессуары','bikes-and-accessories','/sporting-goods/bikes-and-accessories','401,410,403,400,408,404,406,405,399,411,402,409,407','2016-08-05 16:51:02','2016-08-05 16:51:02'),(399,398,0,0,'Велосипеды','bikes','/sporting-goods/bikes-and-accessories/bikes','399','2016-08-05 16:51:02','2016-08-05 16:51:02'),(400,398,0,0,'Комплектующие для велосипедов','accessories-for-bicycles','/sporting-goods/bikes-and-accessories/accessories-for-bicycles','400','2016-08-05 16:51:02','2016-08-05 16:51:02'),(401,398,0,0,'Аксессуары для велосипедов','accessories-for-bicycles','/sporting-goods/bikes-and-accessories/accessories-for-bicycles','403,410,407,409,411,402,405,404,406,408','2016-08-05 16:51:02','2016-08-05 16:51:02'),(402,401,0,0,'Велокомпьютеры','tables','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/tables','402','2016-08-05 16:51:02','2016-08-05 16:51:02'),(403,401,0,0,'Велосипедные шлемы','bicycle-helmets','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/bicycle-helmets','403','2016-08-05 16:51:03','2016-08-05 16:51:03'),(404,401,0,0,'Велосипедные перчатки','cycling-gloves','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/cycling-gloves','404','2016-08-05 16:51:03','2016-08-05 16:51:03'),(405,401,0,0,'Велосипедные сумки','bicycle-bags','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/bicycle-bags','405','2016-08-05 16:51:03','2016-08-05 16:51:03'),(406,401,0,0,'Велосипедные фляги и крепления','cycling-and-jar-attachment','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/cycling-and-jar-attachment','406','2016-08-05 16:51:03','2016-08-05 16:51:03'),(407,401,0,0,'Велоодежда','cycling-wear','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/cycling-wear','407','2016-08-05 16:51:03','2016-08-05 16:51:03'),(408,401,0,0,'Велообувь','wellabove','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/wellabove','408','2016-08-05 16:51:03','2016-08-05 16:51:03'),(409,401,0,0,'Велорезина','velodrezina','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/velodrezina','409','2016-08-05 16:51:03','2016-08-05 16:51:03'),(410,401,0,0,'Велохимия для ремонта и ухода','velkymi-for-repairs-and-maintenance','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/velkymi-for-repairs-and-maintenance','410','2016-08-05 16:51:03','2016-08-05 16:51:03'),(411,401,0,0,'Спортивные очки','sports-glasses','/sporting-goods/bikes-and-accessories/accessories-for-bicycles/sports-glasses','411','2016-08-05 16:51:03','2016-08-05 16:51:03'),(412,368,0,0,'Самокаты','scooters','/sporting-goods/scooters','412','2016-08-05 16:51:04','2016-08-05 16:51:04'),(413,368,0,0,'Роликовые коньки','roller-skates','/sporting-goods/roller-skates','413','2016-08-05 16:51:04','2016-08-05 16:51:04'),(414,368,0,0,'Игровые виды спорта','playing-sports','/sporting-goods/playing-sports','416,422,427,415,418,425,419,426,423,417,429,428,421,424,420','2016-08-05 16:51:04','2016-08-05 16:51:04'),(415,414,0,0,'Ракетки для настольного тенниса','racket-for-table-tennis','/sporting-goods/playing-sports/racket-for-table-tennis','415','2016-08-05 16:51:04','2016-08-05 16:51:04'),(416,414,0,0,'Наборы для настольного тенниса','sets-for-table-tennis','/sporting-goods/playing-sports/sets-for-table-tennis','416','2016-08-05 16:51:04','2016-08-05 16:51:04'),(417,414,0,0,'Мячи для настольного тенниса','balls-for-table-tennis','/sporting-goods/playing-sports/balls-for-table-tennis','417','2016-08-05 16:51:04','2016-08-05 16:51:04'),(418,414,0,0,'Столы для настольного тенниса','table-tennis','/sporting-goods/playing-sports/table-tennis','418','2016-08-05 16:51:05','2016-08-05 16:51:05'),(419,414,0,0,'Сетки для настольного тенниса','grid-for-table-tennis','/sporting-goods/playing-sports/grid-for-table-tennis','419','2016-08-05 16:51:05','2016-08-05 16:51:05'),(420,414,0,0,'Ракетки для большого тенниса','racket-for-the-big-tennis','/sporting-goods/playing-sports/racket-for-the-big-tennis','420','2016-08-05 16:51:05','2016-08-05 16:51:05'),(421,414,0,0,'Мячи для большого тенниса','balls-for-tennis','/sporting-goods/playing-sports/balls-for-tennis','421','2016-08-05 16:51:05','2016-08-05 16:51:05'),(422,414,0,0,'Бадминтон и спидминтон','badminton-and-speedminton','/sporting-goods/playing-sports/badminton-and-speedminton','422','2016-08-05 16:51:05','2016-08-05 16:51:05'),(423,414,0,0,'Все для сквоша','all-squash','/sporting-goods/playing-sports/all-squash','423','2016-08-05 16:51:05','2016-08-05 16:51:05'),(424,414,0,0,'Дартс','darts','/sporting-goods/playing-sports/darts','424','2016-08-05 16:51:05','2016-08-05 16:51:05'),(425,414,0,0,'Мячи для командных игр','balls-for-team-games','/sporting-goods/playing-sports/balls-for-team-games','425','2016-08-05 16:51:05','2016-08-05 16:51:05'),(426,414,0,0,'Баскетбольные щиты, кольца и стойки','basketball-backboards-rings-and-stands','/sporting-goods/playing-sports/basketball-backboards-rings-and-stands','426','2016-08-05 16:51:06','2016-08-05 16:51:06'),(427,414,0,0,'Бейсбол','baseball','/sporting-goods/playing-sports/baseball','427','2016-08-05 16:51:06','2016-08-05 16:51:06'),(428,414,0,0,'Одежда и экипировка для игрового спорта','the-clothes-and-equipment-for-playing-sports','/sporting-goods/playing-sports/the-clothes-and-equipment-for-playing-sports','428','2016-08-05 16:51:06','2016-08-05 16:51:06'),(429,414,0,0,'Аксессуары для игрового спорта','gaming-accessories-sports','/sporting-goods/playing-sports/gaming-accessories-sports','429','2016-08-05 16:51:06','2016-08-05 16:51:06'),(430,368,0,0,'Бассейн и аквафитнес','the-pool-and-aquagym','/sporting-goods/the-pool-and-aquagym','434,433,432,431','2016-08-05 16:51:06','2016-08-05 16:51:06'),(431,430,0,0,'Ласты для бассейна','flippers-for-swimming-pool','/sporting-goods/the-pool-and-aquagym/flippers-for-swimming-pool','431','2016-08-05 16:51:06','2016-08-05 16:51:06'),(432,430,0,0,'Очки для плавания','goggles','/sporting-goods/the-pool-and-aquagym/goggles','432','2016-08-05 16:51:06','2016-08-05 16:51:06'),(433,430,0,0,'Шапочки для плавания','a-swim-cap','/sporting-goods/the-pool-and-aquagym/a-swim-cap','433','2016-08-05 16:51:07','2016-08-05 16:51:07'),(434,430,0,0,'Аксессуары для плавания','swimming-accessories','/sporting-goods/the-pool-and-aquagym/swimming-accessories','434','2016-08-05 16:51:07','2016-08-05 16:51:07'),(435,368,0,0,'Зимние виды спорта','winter-sports','/sporting-goods/winter-sports','444,448,440,436,443,446,451,447,442,445,439,450,449,441,438,437','2016-08-05 16:51:07','2016-08-05 16:51:07'),(436,435,0,0,'Лыжи','ski','/sporting-goods/winter-sports/ski','436','2016-08-05 16:51:07','2016-08-05 16:51:07'),(437,435,0,0,'Лыжные палки','ski-poles','/sporting-goods/winter-sports/ski-poles','437','2016-08-05 16:51:07','2016-08-05 16:51:07'),(438,435,0,0,'Беговые ботинки','running-shoes','/sporting-goods/winter-sports/running-shoes','438','2016-08-05 16:51:07','2016-08-05 16:51:07'),(439,435,0,0,'Горнолыжные ботинки','ski-boots','/sporting-goods/winter-sports/ski-boots','439','2016-08-05 16:51:07','2016-08-05 16:51:07'),(440,435,0,0,'Лыжные крепления','ski-bindings','/sporting-goods/winter-sports/ski-bindings','440','2016-08-05 16:51:08','2016-08-05 16:51:08'),(441,435,0,0,'Коньки','skates','/sporting-goods/winter-sports/skates','441','2016-08-05 16:51:08','2016-08-05 16:51:08'),(442,435,0,0,'Клюшки','stick','/sporting-goods/winter-sports/stick','442','2016-08-05 16:51:08','2016-08-05 16:51:08'),(443,435,0,0,'Шайбы','washer','/sporting-goods/winter-sports/washer','443','2016-08-05 16:51:08','2016-08-05 16:51:08'),(444,435,0,0,'Хоккейная защита','hockey-protection','/sporting-goods/winter-sports/hockey-protection','444','2016-08-05 16:51:08','2016-08-05 16:51:08'),(445,435,0,0,'Форма для хоккея','form-for-hockey','/sporting-goods/winter-sports/form-for-hockey','445','2016-08-05 16:51:08','2016-08-05 16:51:08'),(446,435,0,0,'Санки и снегокаты','toboggans-and-kick-sledges','/sporting-goods/winter-sports/toboggans-and-kick-sledges','446','2016-08-05 16:51:08','2016-08-05 16:51:08'),(447,435,0,0,'Снегоступы','snow-boots','/sporting-goods/winter-sports/snow-boots','447','2016-08-05 16:51:08','2016-08-05 16:51:08'),(448,435,0,0,'Сноуборды','snowboards','/sporting-goods/winter-sports/snowboards','448','2016-08-05 16:51:09','2016-08-05 16:51:09'),(449,435,0,0,'Термобелье','underwear','/sporting-goods/winter-sports/underwear','449','2016-08-05 16:51:09','2016-08-05 16:51:09'),(450,435,0,0,'Универсальные головные уборы','universal-headgear','/sporting-goods/winter-sports/universal-headgear','450','2016-08-05 16:51:09','2016-08-05 16:51:09'),(451,435,0,0,'Аксессуары для зимнего спорта','accessories-for-winter-sports','/sporting-goods/winter-sports/accessories-for-winter-sports','451','2016-08-05 16:51:09','2016-08-05 16:51:09'),(452,368,0,0,'Бокс и единоборства','boxing-and-martial-arts','/sporting-goods/boxing-and-martial-arts','453,456,454,457,458,455,459','2016-08-05 16:51:09','2016-08-05 16:51:09'),(453,452,0,0,'Мешки и груши','bags-and-pears','/sporting-goods/boxing-and-martial-arts/bags-and-pears','453','2016-08-05 16:51:09','2016-08-05 16:51:09'),(454,452,0,0,'Лапы, макивары','paws-makivary','/sporting-goods/boxing-and-martial-arts/paws-makivary','454','2016-08-05 16:51:09','2016-08-05 16:51:09'),(455,452,0,0,'Форма','form','/sporting-goods/boxing-and-martial-arts/form','455','2016-08-05 16:51:09','2016-08-05 16:51:09'),(456,452,0,0,'Перчатки','gloves','/sporting-goods/boxing-and-martial-arts/gloves','456','2016-08-05 16:51:10','2016-08-05 16:51:10'),(457,452,0,0,'Шлемы','hats','/sporting-goods/boxing-and-martial-arts/hats','457','2016-08-05 16:51:10','2016-08-05 16:51:10'),(458,452,0,0,'Защита','protection','/sporting-goods/boxing-and-martial-arts/protection','458','2016-08-05 16:51:10','2016-08-05 16:51:10'),(459,452,0,0,'Аксессуары','accessories','/sporting-goods/boxing-and-martial-arts/accessories','459','2016-08-05 16:51:10','2016-08-05 16:51:10'),(460,368,0,0,'Спортивные аксессуары','sports-accessories','/sporting-goods/sports-accessories','465,466,464,463,462,461','2016-08-05 16:51:10','2016-08-05 16:51:10'),(461,460,0,0,'Спортивные сумки и чехлы','sports-bags-and-pouches','/sporting-goods/sports-accessories/sports-bags-and-pouches','461','2016-08-05 16:51:10','2016-08-05 16:51:10'),(462,460,0,0,'Рюкзаки и гермомешки','backpacks-and-waterproof-bags','/sporting-goods/sports-accessories/backpacks-and-waterproof-bags','462','2016-08-05 16:51:10','2016-08-05 16:51:10'),(463,460,0,0,'Спортивные бандажи, фиксаторы, напульсники','sports-braces-retainers-wristbands','/sporting-goods/sports-accessories/sports-braces-retainers-wristbands','463','2016-08-05 16:51:10','2016-08-05 16:51:10'),(464,460,0,0,'Спортивные очки','sports-glasses','/sporting-goods/sports-accessories/sports-glasses','464','2016-08-05 16:51:11','2016-08-05 16:51:11'),(465,460,0,0,'Спортивные чехлы для телефонов','sports-cell-phone-cases','/sporting-goods/sports-accessories/sports-cell-phone-cases','465','2016-08-05 16:51:11','2016-08-05 16:51:11'),(466,460,0,0,'Наушники для спортаТовары для дома','headphones-for-sporttovary-for-home','/sporting-goods/sports-accessories/headphones-for-sporttovary-for-home','466','2016-08-05 16:51:11','2016-08-05 16:51:11'),(467,0,0,0,'Техника','technique','/technique','476,489,483,486,488,479,472,485,473,477,475,481,480,469,471,484,482,478,487,474,490,470,468','2016-08-05 16:51:11','2016-08-05 16:51:11'),(468,467,0,0,'Телефоны и гаджеты','phones-and-gadgets','/technique/phones-and-gadgets','478,474,473,472,477,475,469,471,470,476','2016-08-05 16:51:11','2016-08-05 16:51:11'),(469,468,0,0,'Смартфоны, телефоны','smartphones-phones','/technique/phones-and-gadgets/smartphones-phones','469','2016-08-05 16:51:11','2016-08-05 16:51:11'),(470,468,0,0,'Планшеты','tablets','/technique/phones-and-gadgets/tablets','470','2016-08-05 16:51:11','2016-08-05 16:51:11'),(471,468,0,0,'Смарт-часы','smart-watch','/technique/phones-and-gadgets/smart-watch','471','2016-08-05 16:51:11','2016-08-05 16:51:11'),(472,468,0,0,'Игры и развлечения','games-and-entertainment','/technique/phones-and-gadgets/games-and-entertainment','472','2016-08-05 16:51:11','2016-08-05 16:51:11'),(473,468,0,0,'Игровые консоли','game-console','/technique/phones-and-gadgets/game-console','473','2016-08-05 16:51:12','2016-08-05 16:51:12'),(474,468,0,0,'Игры','game','/technique/phones-and-gadgets/game','474','2016-08-05 16:51:12','2016-08-05 16:51:12'),(475,468,0,0,'Аксессуары','accessories','/technique/phones-and-gadgets/accessories','475','2016-08-05 16:51:12','2016-08-05 16:51:12'),(476,468,0,0,'Мультимедиа','multimedia','/technique/phones-and-gadgets/multimedia','476','2016-08-05 16:51:12','2016-08-05 16:51:12'),(477,468,0,0,'Фото и видео техника','photo-and-video-equipment','/technique/phones-and-gadgets/photo-and-video-equipment','477','2016-08-05 16:51:12','2016-08-05 16:51:12'),(478,468,0,0,'Фотоаппараты','cameras','/technique/phones-and-gadgets/cameras','478','2016-08-05 16:51:12','2016-08-05 16:51:12'),(479,467,0,0,'Аксессуары','accessories','/technique/accessories','488,486,484,482,489,483,485,487,490,480,481','2016-08-05 16:51:12','2016-08-05 16:51:12'),(480,479,0,0,'Чехлы','covers','/technique/accessories/covers','482,481','2016-08-05 16:51:12','2016-08-05 16:51:12'),(481,480,0,0,'Для планшетов','for-tablets','/technique/accessories/covers/for-tablets','481','2016-08-05 16:51:13','2016-08-05 16:51:13'),(482,480,0,0,'Для телефонов','for-phones','/technique/accessories/covers/for-phones','482','2016-08-05 16:51:13','2016-08-05 16:51:13'),(483,479,0,0,'Зарядные устройства','charger','/technique/accessories/charger','483','2016-08-05 16:51:13','2016-08-05 16:51:13'),(484,479,0,0,'Внешние жесткие диски','external-hard-drives','/technique/accessories/external-hard-drives','484','2016-08-05 16:51:13','2016-08-05 16:51:13'),(485,479,0,0,'Кабели','cables','/technique/accessories/cables','485','2016-08-05 16:51:13','2016-08-05 16:51:13'),(486,479,0,0,'Защитные пленки','protective-film','/technique/accessories/protective-film','486','2016-08-05 16:51:13','2016-08-05 16:51:13'),(487,479,0,0,'Гарнитуры','headset','/technique/accessories/headset','487','2016-08-05 16:51:13','2016-08-05 16:51:13'),(488,479,0,0,'Колонки','speakers','/technique/accessories/speakers','488','2016-08-05 16:51:13','2016-08-05 16:51:13'),(489,479,0,0,'Моноподы','monopods','/technique/accessories/monopods','489','2016-08-05 16:51:13','2016-08-05 16:51:13'),(490,479,0,0,'Элементы питания','batteries','/technique/accessories/batteries','490','2016-08-05 16:51:14','2016-08-05 16:51:14'),(491,0,0,0,'Зоотовары','pet-shops','/pet-shops','501,531,500,507,516,494,505,517,502,526,524,528,504,525,535,521,495,503,514,518,519,499,506,527,529,520,513,508,497,496,511,534,509,510,523,512,515,522,498,530,492,532,533,493','2016-08-05 16:51:14','2016-08-05 16:51:14'),(492,491,0,0,'Кормление','feeding','/pet-shops/feeding','497,493,495,494,496','2016-08-05 16:51:14','2016-08-05 16:51:14'),(493,492,0,0,'Сухой корм','dry-food','/pet-shops/feeding/dry-food','493','2016-08-05 16:51:14','2016-08-05 16:51:14'),(494,492,0,0,'Консервы','canned','/pet-shops/feeding/canned','494','2016-08-05 16:51:14','2016-08-05 16:51:14'),(495,492,0,0,'Заменители молока','milk-replacers','/pet-shops/feeding/milk-replacers','495','2016-08-05 16:51:14','2016-08-05 16:51:14'),(496,492,0,0,'Кости и лакомства','bones-and-treats','/pet-shops/feeding/bones-and-treats','496','2016-08-05 16:51:14','2016-08-05 16:51:14'),(497,492,0,0,'Посуда','dishes','/pet-shops/feeding/dishes','497','2016-08-05 16:51:14','2016-08-05 16:51:14'),(498,491,0,0,'Здоровье','health','/pet-shops/health','499,500','2016-08-05 16:51:15','2016-08-05 16:51:15'),(499,498,0,0,'Витамины и добавки','vitamins-and-supplements','/pet-shops/health/vitamins-and-supplements','499','2016-08-05 16:51:15','2016-08-05 16:51:15'),(500,498,0,0,'Средства от блох и клещей','funds-from-fleas-and-ticks','/pet-shops/health/funds-from-fleas-and-ticks','500','2016-08-05 16:51:15','2016-08-05 16:51:15'),(501,491,0,0,'Уход и гигиена','care-and-hygiene','/pet-shops/care-and-hygiene','502,503,504','2016-08-05 16:51:15','2016-08-05 16:51:15'),(502,501,0,0,'Наполнители туалетов','fillers-toilets','/pet-shops/care-and-hygiene/fillers-toilets','502','2016-08-05 16:51:15','2016-08-05 16:51:15'),(503,501,0,0,'Туалеты','toilets','/pet-shops/care-and-hygiene/toilets','503','2016-08-05 16:51:15','2016-08-05 16:51:15'),(504,501,0,0,'Уход за ушами','care-for-the-ears','/pet-shops/care-and-hygiene/care-for-the-ears','504','2016-08-05 16:51:15','2016-08-05 16:51:15'),(505,491,0,0,'Средства по уходу','care','/pet-shops/care','507,508,509,506','2016-08-05 16:51:15','2016-08-05 16:51:15'),(506,505,0,0,'Инструменты по уходу','tools-to-care','/pet-shops/care/tools-to-care','506','2016-08-05 16:51:16','2016-08-05 16:51:16'),(507,505,0,0,'Пеленки и туалеты','diapers-and-toilets','/pet-shops/care/diapers-and-toilets','507','2016-08-05 16:51:16','2016-08-05 16:51:16'),(508,505,0,0,'Уход за полостью рта','care-for-the-oral-cavity','/pet-shops/care/care-for-the-oral-cavity','508','2016-08-05 16:51:16','2016-08-05 16:51:16'),(509,505,0,0,'Уход за ушами','care-for-the-ears','/pet-shops/care/care-for-the-ears','509','2016-08-05 16:51:16','2016-08-05 16:51:16'),(510,491,0,0,'Прогулки и путешествия','trips-and-travel','/pet-shops/trips-and-travel','515,512,514,511,513','2016-08-05 16:51:16','2016-08-05 16:51:16'),(511,510,0,0,'Поводки','leashes','/pet-shops/trips-and-travel/leashes','511','2016-08-05 16:51:16','2016-08-05 16:51:16'),(512,510,0,0,'Ошейники','collars','/pet-shops/trips-and-travel/collars','512','2016-08-05 16:51:16','2016-08-05 16:51:16'),(513,510,0,0,'Переноски и сумки','carrying-bags','/pet-shops/trips-and-travel/carrying-bags','513','2016-08-05 16:51:17','2016-08-05 16:51:17'),(514,510,0,0,'Амуниция и акессуары','ammunition-and-accessories','/pet-shops/trips-and-travel/ammunition-and-accessories','514','2016-08-05 16:51:17','2016-08-05 16:51:17'),(515,510,0,0,'Одежда','clothing','/pet-shops/trips-and-travel/clothing','515','2016-08-05 16:51:17','2016-08-05 16:51:17'),(516,491,0,0,'Дом и уют','home-and-comfort','/pet-shops/home-and-comfort','517,518,520,519,521','2016-08-05 16:51:17','2016-08-05 16:51:17'),(517,516,0,0,'Переноски','carrying','/pet-shops/home-and-comfort/carrying','517','2016-08-05 16:51:17','2016-08-05 16:51:17'),(518,516,0,0,'Будки, вольеры, загоны','kennels-cages-corrals','/pet-shops/home-and-comfort/kennels-cages-corrals','518','2016-08-05 16:51:18','2016-08-05 16:51:18'),(519,516,0,0,'Мягкие места и домики','soft-seats-and-houses','/pet-shops/home-and-comfort/soft-seats-and-houses','519','2016-08-05 16:51:18','2016-08-05 16:51:18'),(520,516,0,0,'Когтеточки','scratching-posts','/pet-shops/home-and-comfort/scratching-posts','520','2016-08-05 16:51:18','2016-08-05 16:51:18'),(521,516,0,0,'Игрушки','toys','/pet-shops/home-and-comfort/toys','521','2016-08-05 16:51:18','2016-08-05 16:51:18'),(522,491,0,0,'Аквариумы','aquariums','/pet-shops/aquariums','523,527,529,531,534,532,533,535,525,526,530,528,524','2016-08-05 16:51:18','2016-08-05 16:51:18'),(523,522,0,0,'Корм','food','/pet-shops/aquariums/food','523','2016-08-05 16:51:18','2016-08-05 16:51:18'),(524,522,0,0,'Аквариумные наборы','aquarium-set','/pet-shops/aquariums/aquarium-set','524','2016-08-05 16:51:18','2016-08-05 16:51:18'),(525,522,0,0,'Тумбы','thumbs','/pet-shops/aquariums/thumbs','525','2016-08-05 16:51:18','2016-08-05 16:51:18'),(526,522,0,0,'Крышки','cover','/pet-shops/aquariums/cover','526','2016-08-05 16:51:18','2016-08-05 16:51:18'),(527,522,0,0,'Обородувание для аквариумов','equipment-for-aquariums','/pet-shops/aquariums/equipment-for-aquariums','527','2016-08-05 16:51:19','2016-08-05 16:51:19'),(528,522,0,0,'Обогрев и охлаждение','heating-and-cooling','/pet-shops/aquariums/heating-and-cooling','528','2016-08-05 16:51:19','2016-08-05 16:51:19'),(529,522,0,0,'Фильтры','filters','/pet-shops/aquariums/filters','529','2016-08-05 16:51:19','2016-08-05 16:51:19'),(530,522,0,0,'Дополнительное оборудование для аквариумов','additional-equipment-for-aquariums','/pet-shops/aquariums/additional-equipment-for-aquariums','530','2016-08-05 16:51:19','2016-08-05 16:51:19'),(531,522,0,0,'Освещение','lighting','/pet-shops/aquariums/lighting','531','2016-08-05 16:51:19','2016-08-05 16:51:19'),(532,522,0,0,'Измерительные приборы','measuring-instruments','/pet-shops/aquariums/measuring-instruments','532','2016-08-05 16:51:19','2016-08-05 16:51:19'),(533,522,0,0,'Аксессуары к аквариумному оборудованию','accessories-aquarium-equipment','/pet-shops/aquariums/accessories-aquarium-equipment','533','2016-08-05 16:51:19','2016-08-05 16:51:19'),(534,522,0,0,'Декорации и грунты','the-scenery-and-soils','/pet-shops/aquariums/the-scenery-and-soils','534','2016-08-05 16:51:20','2016-08-05 16:51:20'),(535,522,0,0,'Аквариумная химия','aquarium-chemistry','/pet-shops/aquariums/aquarium-chemistry','535','2016-08-05 16:51:20','2016-08-05 16:51:20'),(536,0,0,0,'Огртехника','agritechnica','/agritechnica','538,540,539,537,542,541,543','2016-08-05 16:51:20','2016-08-05 16:51:20'),(537,536,0,0,'Клавиатуры','keyboard','/agritechnica/keyboard','537','2016-08-05 16:51:20','2016-08-05 16:51:20'),(538,536,0,0,'Ленты для принтера','ribbon-for-printer','/agritechnica/ribbon-for-printer','538','2016-08-05 16:51:20','2016-08-05 16:51:20'),(539,536,0,0,'Маршрутизаторы','routers','/agritechnica/routers','539','2016-08-05 16:51:20','2016-08-05 16:51:20'),(540,536,0,0,'МФУ','mfp','/agritechnica/mfp','540','2016-08-05 16:51:20','2016-08-05 16:51:20'),(541,536,0,0,'Мыши','mouse','/agritechnica/mouse','541','2016-08-05 16:51:20','2016-08-05 16:51:20'),(542,536,0,0,'Принтеры','printers','/agritechnica/printers','542','2016-08-05 16:51:21','2016-08-05 16:51:21'),(543,536,0,0,'Умный дом','smart-home','/agritechnica/smart-home','543','2016-08-05 16:51:21','2016-08-05 16:51:21'),(544,0,0,0,'Хобби и Творчество','hobby-and-creativity','/hobby-and-creativity','549,546,547,545,548','2016-08-05 16:51:21','2016-08-05 16:51:21'),(545,544,0,0,'Лепка','modeling','/hobby-and-creativity/modeling','545','2016-08-05 16:51:21','2016-08-05 16:51:21'),(546,544,0,0,'Пазлы','puzzles','/hobby-and-creativity/puzzles','546','2016-08-05 16:51:21','2016-08-05 16:51:21'),(547,544,0,0,'Модели для склеивания','models-for-bonding','/hobby-and-creativity/models-for-bonding','547','2016-08-05 16:51:21','2016-08-05 16:51:21'),(548,544,0,0,'Прочие наборы для творчества','other-kits','/hobby-and-creativity/other-kits','548','2016-08-05 16:51:21','2016-08-05 16:51:21'),(549,544,0,0,'Рукоделие','needlework','/hobby-and-creativity/needlework','549','2016-08-05 16:51:21','2016-08-05 16:51:21');
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
  CONSTRAINT `fk_category2feature_group_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (3,'5ea51a4bfa682e218c422513ed258d32',1200,1200,'tower_12345.jpg','tower_12345.jpg','/var/www/hilt.mojo/photo/origin/5e/a5/tower_12345.jpg',1,'2016-07-25 17:53:01'),(4,'77ca01bc2e0f4d802aac72fbe3365923',1200,1200,'logo.png','logo.jpg','/var/www/hilt.mojo/photo/origin/77/ca/logo.png',1,'2016-07-25 17:53:01'),(5,'2ca731e2e40064b0e0c9dc00b9156929',1200,1200,'1920.jpg','1920.jpg','/var/www/hilt.mojo/photo/origin/2c/a7/1920.jpg',1,'2016-07-26 10:54:05'),(6,'ab3cbfd755a38f239826eb6f83355007',1200,1200,'head.jpg','head.jpg','/var/www/hilt.mojo/photo/origin/ab/3c/head.jpg',1,'2016-08-23 11:04:44'),(7,'27b33d47ac407583b9b6ed718ba4c5a5',1200,1200,'2.jpg','2.jpg','/var/www/hilt.mojo/photo/origin/27/b3/2.jpg',1,'2016-08-23 14:30:48'),(8,'2a0d8e36a041fde1d6cbbbb68feceb60',1200,1200,'1.jpg','1.jpg','/var/www/hilt.mojo/photo/origin/2a/0d/1.jpg',1,'2016-08-23 14:30:48'),(9,'ac25fb27be1473f64c4e627691e18eff',1200,1200,'3.jpg','3.jpg','/var/www/hilt.mojo/photo/origin/ac/25/3.jpg',1,'2016-08-23 14:30:49'),(10,'758581b1656b0744226384edc1d11208',1200,1200,'2.jpg','2.jpg','/var/www/hilt.mojo/photo/origin/75/85/2.jpg',1,'2016-08-23 14:47:47'),(11,'7de25b8e6bad40f043d4975f63f7e678',1200,1200,'1.jpg','1.jpg','/var/www/hilt.mojo/photo/origin/7d/e2/1.jpg',1,'2016-08-23 14:47:47'),(12,'fa15c81c505aec494ad7667ab7660c81',1200,1200,'3.jpg','3.jpg','/var/www/hilt.mojo/photo/origin/fa/15/3.jpg',1,'2016-08-23 14:47:48'),(13,'44dc033eb1b1f34411495463c912b535',1200,1200,'4.jpg','4.jpg','/var/www/hilt.mojo/photo/origin/44/dc/4.jpg',1,'2016-08-23 17:05:56'),(14,'bd01655f618f9b801b430f6ae8506cf7',1200,1200,'1.jpg','1.jpg','/var/www/hilt/photo/origin/bd/01/1.jpg',1,'2016-09-21 12:02:59'),(15,'bf9d82f480699bb5c9616c6940886d76',1200,1200,'1_2.jpg','1_2.jpg','/var/www/hilt/photo/origin/bf/9d/1_2.jpg',1,'2016-09-21 12:06:09'),(16,'0e0dd1b5ddd6ffd02b584970de346243',1200,1200,'2.jpg','2.jpg','/var/www/hilt/photo/origin/0e/0d/2.jpg',1,'2016-09-21 13:44:50'),(17,'72d5b9d94976ae1eaf3ec9b8e69d474c',1200,1200,'2_2.jpg','2_2.jpg','/var/www/hilt/photo/origin/72/d5/2_2.jpg',1,'2016-09-21 13:46:57'),(18,'6f55d50581e3dd25207a82d24890f7ac',1200,1200,'3.jpg','3.jpg','/var/www/hilt/photo/origin/6f/55/3.jpg',1,'2016-09-30 16:46:50'),(19,'5bd7104c30f3a5940d4dba9958468ba5',1200,1200,'3_1.jpg','3_1.jpg','/var/www/hilt/photo/origin/5b/d7/3_1.jpg',1,'2016-09-30 16:46:50'),(20,'7ccc93ec6c10229ca40b21cc7b94a027',1200,1200,'3_2.jpg','3_2.jpg','/var/www/hilt/photo/origin/7c/cc/3_2.jpg',1,'2016-09-30 16:46:51');
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
  UNIQUE KEY `md5_hex_UNIQUE` (`md5_hex`,`path`),
  KEY `fk_image2product_1_idx` (`product_id`),
  KEY `index` (`product_id`,`image_id`,`w`,`h`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image2product`
--

LOCK TABLES `image2product` WRITE;
/*!40000 ALTER TABLE `image2product` DISABLE KEYS */;
INSERT INTO `image2product` VALUES (1,3,14,465,624,'49827628c19b3ab2bef12510a3a0a559','/var/www/hilt/photo/465_624/49/82/1.jpg','2016-09-21 12:02:59',1,'1.jpg','1.jpg'),(2,3,14,192,265,'b82857f2915e835e93241abd832a2e27','/var/www/hilt/photo/192_265/b8/28/1.jpg','2016-09-21 12:02:59',1,'1.jpg','1.jpg'),(3,3,14,121,141,'d6e164de850007a388ba18fac15367bb','/var/www/hilt/photo/121_141/d6/e1/1.jpg','2016-09-21 12:02:59',1,'1.jpg','1.jpg'),(4,3,15,465,624,'982563076df5bbc1eb209f8c77328380','/var/www/hilt/photo/465_624/98/25/1_2.jpg','2016-09-21 12:06:10',1,'1_2.jpg','1_2.jpg'),(5,3,15,192,265,'819c493072e29e1c1b8d7297383a96dd','/var/www/hilt/photo/192_265/81/9c/1_2.jpg','2016-09-21 12:06:10',1,'1_2.jpg','1_2.jpg'),(6,3,15,121,141,'977092e2c033c0479143c16df3c805b7','/var/www/hilt/photo/121_141/97/70/1_2.jpg','2016-09-21 12:06:10',1,'1_2.jpg','1_2.jpg'),(7,5,16,465,624,'6e8e4f6531eacbb348cebb8beccf73de','/var/www/hilt/photo/465_624/6e/8e/2.jpg','2016-09-21 13:44:51',1,'2.jpg','2.jpg'),(8,5,16,192,265,'157f113d93ad8ddf0ec69e62fa8137bf','/var/www/hilt/photo/192_265/15/7f/2.jpg','2016-09-21 13:44:51',1,'2.jpg','2.jpg'),(9,5,16,121,141,'d7753ffd51075b53ed958131c4634adb','/var/www/hilt/photo/121_141/d7/75/2.jpg','2016-09-21 13:44:51',1,'2.jpg','2.jpg'),(10,5,17,465,624,'674e5e98582f3492042ada676368ad67','/var/www/hilt/photo/465_624/67/4e/2_2.jpg','2016-09-21 13:46:58',1,'2_2.jpg','2_2.jpg'),(11,5,17,192,265,'2911e258fc6653906f77dd4252839840','/var/www/hilt/photo/192_265/29/11/2_2.jpg','2016-09-21 13:46:58',1,'2_2.jpg','2_2.jpg'),(12,5,17,121,141,'114645493a002c94951af24406326916','/var/www/hilt/photo/121_141/11/46/2_2.jpg','2016-09-21 13:46:58',1,'2_2.jpg','2_2.jpg'),(13,6,18,192,265,'1f4aa82611b73ccce34f6d3141a7c011','/var/www/hilt/photo/192_265/1f/4a/3.jpg','2016-09-30 16:46:51',1,'3.jpg','3.jpg'),(14,6,19,192,265,'0cffad599f205741edd87a9abbf928fa','/var/www/hilt/photo/192_265/0c/ff/3_1.jpg','2016-09-30 16:46:51',1,'3_1.jpg','3_1.jpg'),(15,6,20,192,265,'7308f3f9c632da9e42e36fc34a5d9ee3','/var/www/hilt/photo/192_265/73/08/3_2.jpg','2016-09-30 16:46:51',1,'3_2.jpg','3_2.jpg'),(16,6,18,465,624,'004d6be89f0818ffa3de7ab1054d1ef5','/var/www/hilt/photo/465_624/00/4d/3.jpg','2016-09-30 16:46:51',1,'3.jpg','3.jpg'),(17,6,19,465,624,'6a61279be75814f0cdfd00f5355b6db8','/var/www/hilt/photo/465_624/6a/61/3_1.jpg','2016-09-30 16:46:51',1,'3_1.jpg','3_1.jpg'),(18,6,20,465,624,'b1152d4eebca8579cc2329f35ca2daf0','/var/www/hilt/photo/465_624/b1/15/3_2.jpg','2016-09-30 16:46:51',1,'3_2.jpg','3_2.jpg'),(19,6,18,121,141,'4e8657d3fbea17e8c46b2cfd0f05c71e','/var/www/hilt/photo/121_141/4e/86/3.jpg','2016-09-30 16:46:51',1,'3.jpg','3.jpg'),(20,6,19,121,141,'37cfd7edbe6f00995d633b66387649ad','/var/www/hilt/photo/121_141/37/cf/3_1.jpg','2016-09-30 16:46:51',1,'3_1.jpg','3_1.jpg'),(21,6,20,121,141,'de11e75f79ea375081e46b0cb6139582','/var/www/hilt/photo/121_141/de/11/3_2.jpg','2016-09-30 16:46:51',1,'3_2.jpg','3_2.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,1,0,0,0,0,5,1,2,'34567','kardigan-rouz','Кардиган Роуз','','Комфортный кардиган свободного силуэта с рукавом 7/8. По полочке для удобства предусмотрены накладные карманы. Изделие украшает контрастная отделка. Комфортен и практичен в ношении.','','','2016-09-20 15:42:24','2016-09-30 17:19:28'),(5,1,0,0,0,0,5,1,2,'34568','kardigan-emmi','Кардиган Эмми','','Стильный кардиган свободного силуэта с отворотами, выполненный из качественного материала. Модель с укороченным рукавом, без застежки. Отличный вариант для повседневного гардероба!','','','2016-09-21 13:19:22','2016-09-30 17:19:30'),(6,1,0,0,0,0,30,1,5,'34569','plate-miranda-bezhevoe','Платье Миранда бежевое','','Невероятно легкая, стильная одежда для настоящих модниц. Украсьте свое лето с яркой одеждой производителя качественной современной одежды!','','','2016-09-30 16:26:06','2016-09-30 17:19:30');
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
  CONSTRAINT `fk_product2category_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product2category`
--

LOCK TABLES `product2category` WRITE;
/*!40000 ALTER TABLE `product2category` DISABLE KEYS */;
INSERT INTO `product2category` VALUES (46,3,'2016-09-30 17:19:29'),(46,5,'2016-09-30 17:19:30'),(46,6,'2016-09-30 17:19:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product2feature2value`
--

LOCK TABLES `product2feature2value` WRITE;
/*!40000 ALTER TABLE `product2feature2value` DISABLE KEYS */;
INSERT INTO `product2feature2value` VALUES (94,3,32,''),(95,3,33,''),(96,3,35,'2'),(97,3,36,'3'),(98,3,34,''),(99,3,29,'red'),(100,3,31,'3'),(101,3,30,'97'),(102,5,31,'3'),(103,5,30,'97'),(104,5,34,''),(105,5,36,'3'),(106,5,35,'2'),(107,5,33,''),(108,5,32,''),(116,6,37,'55'),(117,6,38,'40'),(118,6,39,''),(119,6,40,'#F5F5DC'),(120,6,41,''),(121,6,42,''),(122,6,35,'12'),(123,6,43,'10'),(124,6,44,'3'),(125,6,36,'5'),(147,6,45,'5');
/*!40000 ALTER TABLE `product2feature2value` ENABLE KEYS */;
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
INSERT INTO `product_price` VALUES (3,2,84000,0,0,'2016-09-21 14:40:44','2016-09-30 17:19:30'),(5,2,94000,0,0,'2016-09-21 14:40:46','2016-09-30 17:19:30'),(6,2,51300,0,0,'2016-09-30 17:19:31','2016-09-30 17:19:31');
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
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'Скидка %'),(2,'Скидка грн'),(3,'Подарок');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
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
INSERT INTO `user2session` VALUES ('0b17168ccdec757b92828a4c59b442c3',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:44:47'),('170500b30cb904b00e5e13b3c77be948',1,'127.0.0.1',0,'6bc7f39a49172c82ff5afb2d951d8bc3','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.113 Safari/537.36','2016-09-14 13:56:07'),('2a9cb24f0dfa3aab4c43ff93f3466873',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:15:55'),('35a6a2ab9a2dab149e981ba239f118c8',1,'127.0.0.1',0,'4997998da8e02aa049e9dbdf3d1cb200','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36','2016-09-14 14:05:55'),('3fb50e6b50719e3b9bc50304084baafb',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:59:34'),('520bc710c6b3211f4b6c6bdba5b2c506',1,'127.0.0.1',0,'4997998da8e02aa049e9dbdf3d1cb200','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36','2016-09-19 14:07:20'),('642b236a66539738b641fc3ded96c00f',1,'192.168.1.3',0,'5edaa0d7cdcfd01ae7718147b0d7ba2c','Mozilla/5.0 (Linux; Android 4.4.2; YOGA Tablet 2-1050L Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.89 Safari/537.36','2016-08-25 13:30:38'),('6df6131051142ba4efecee366a0c431b',1,'127.0.0.1',0,'77d4665d09fc560e08b87156fefd27a8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','2016-09-06 09:20:54'),('8127daca894257ee203631a2bfb0db4a',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:20:26'),('93eac93b672db866cc7736af0a3f0bbe',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 16:51:31'),('9754519613793723ad254811aac2dea7',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-12 14:36:36'),('ada9ae62ee49bc19b288ed526c6a0c0a',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-12 14:15:33'),('b2ff380148cadb4122448c723ae25a31',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:50:32'),('b892174d6efdc8f88742235c07beabd7',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 15:22:11'),('bd52762bf1a2451aefbb1342e5888cad',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-12 14:24:01'),('c05fb6ad8548b443b16c43ee0253520f',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-21 16:56:12'),('d5608caa34d0d5061e87ac8b89b3144c',1,'127.0.0.1',0,'77d4665d09fc560e08b87156fefd27a8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','2016-08-23 18:05:43'),('db19d00ba6d8bc4293acec3d4b8c6e12',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 16:06:13'),('e4f12c50538ebdf6040d0a741d2d521c',1,'127.0.0.1',0,'5a243ddaa41c25c28bf4d3a7849af769','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','2016-07-05 16:34:29');
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

-- Dump completed on 2016-09-30 17:52:15
