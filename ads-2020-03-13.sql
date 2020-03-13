-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ads
-- ------------------------------------------------------
-- Server version	5.5.64-MariaDB

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
-- Table structure for table `adsapp_amenities`
--

DROP TABLE IF EXISTS `adsapp_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsapp_amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `types` varchar(50) DEFAULT NULL,
  `icon` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsapp_amenities`
--

LOCK TABLES `adsapp_amenities` WRITE;
/*!40000 ALTER TABLE `adsapp_amenities` DISABLE KEYS */;
INSERT INTO `adsapp_amenities` VALUES (1,'Bed','fa fa-bed','2 Queen Size Beds'),(2,'Bed','fa fa-bed','1 Double Size Bed'),(3,'Bed','fa fa-bed','1 King Size Bed'),(4,'Bed','fa fa-bed','1 Queen Size Bed'),(5,'Bed','fa fa-bed','1 Single Size Bed'),(6,'Bed','fa fa-bed','2 Double Size Beds'),(7,'Balcony','fa fa-slideshare','Balcony'),(8,'Bath robe','icon-robe','Bath robe'),(9,'Towels','fa fa-star','Bath Towels'),(10,'Bath tub','fa fa-bath','Bath tub'),(11,'Cable','fa fa-signal','Cable TV'),(12,'Key','fa fa-key','Electrical Key Card System'),(13,'TV','fa fa-television','Flat screen 43 Inch TV'),(14,'TV','fa fa-television','Flat screen 54 Inch TV'),(15,'Hairdryer','fa fa-sun-o','Hairdryer'),(16,'Water','fa fa-thermometer','Hot and Cold water'),(17,'AC','fa fa-asterisk','Individually Controlled A/C'),(18,'Iron','fa fa-space-shuttle','Iron and Ironing Board'),(19,'MiniBar','fa fa-rocket','MiniBar'),(20,'Balcony','fa fa-slideshare','Private Balcony'),(21,'Safety','fa fa-key','Safe Deposit Box'),(22,'Coffee','fa fa-coffee','Tea and Coffee making facilities'),(23,'WiFi','fa fa-wifi','WiFI');
/*!40000 ALTER TABLE `adsapp_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adsapp_booking`
--

DROP TABLE IF EXISTS `adsapp_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsapp_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkout` date NOT NULL,
  `checkin` date NOT NULL,
  `amount` int(11) NOT NULL,
  `notes` varchar(500) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adsapp_booking_customer_id_42ddd04e_fk_adsapp_customer_id` (`customer_id`),
  KEY `adsapp_booking_room_id_7ab77b36_fk_adsapp_room_id` (`room_id`),
  CONSTRAINT `adsapp_booking_customer_id_42ddd04e_fk_adsapp_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `adsapp_customer` (`id`),
  CONSTRAINT `adsapp_booking_room_id_7ab77b36_fk_adsapp_room_id` FOREIGN KEY (`room_id`) REFERENCES `adsapp_room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsapp_booking`
--

LOCK TABLES `adsapp_booking` WRITE;
/*!40000 ALTER TABLE `adsapp_booking` DISABLE KEYS */;
INSERT INTO `adsapp_booking` VALUES (1,'2019-05-01','2019-04-30',25000,'Free Parking','Paypal','Paid',1,1,'2019-04-30 09:35:35'),(2,'2019-05-05','2019-05-01',30000,'Free Breakfast','Paypal','Paid',2,2,'2019-04-30 09:35:35');
/*!40000 ALTER TABLE `adsapp_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adsapp_customer`
--

DROP TABLE IF EXISTS `adsapp_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsapp_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `number` varchar(80) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsapp_customer`
--

LOCK TABLES `adsapp_customer` WRITE;
/*!40000 ALTER TABLE `adsapp_customer` DISABLE KEYS */;
INSERT INTO `adsapp_customer` VALUES (1,'Joven','Tan','jovenntann@gmail.com','+639062131607','2019-04-30 09:35:35'),(2,'Princess','Soriano','princesssoriano@gmail.com','+639360331737','2019-04-30 09:35:35');
/*!40000 ALTER TABLE `adsapp_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adsapp_daterange`
--

DROP TABLE IF EXISTS `adsapp_daterange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsapp_daterange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adsapp_daterange_user_id_c4d29dec_fk_auth_user_id` (`user_id`),
  CONSTRAINT `adsapp_daterange_user_id_c4d29dec_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsapp_daterange`
--

LOCK TABLES `adsapp_daterange` WRITE;
/*!40000 ALTER TABLE `adsapp_daterange` DISABLE KEYS */;
INSERT INTO `adsapp_daterange` VALUES (1,'2019-05-01','2019-05-31',1);
/*!40000 ALTER TABLE `adsapp_daterange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adsapp_inquiry`
--

DROP TABLE IF EXISTS `adsapp_inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsapp_inquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `email` varchar(70) NOT NULL,
  `number` varchar(80) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `created` datetime NOT NULL,
  `lastname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsapp_inquiry`
--

LOCK TABLES `adsapp_inquiry` WRITE;
/*!40000 ALTER TABLE `adsapp_inquiry` DISABLE KEYS */;
INSERT INTO `adsapp_inquiry` VALUES (1,'Joven Tan','jovenntann@gmail.com','+639062131607','Inquiry','How much is the room per night?','2019-05-13 06:09:23','Ako'),(2,'Joven Tan','jovenntann@gmail.com','+639062131607','Map','where is your office located?','2019-05-13 06:40:54','Ako'),(3,'Princess Tan','princessbagualsoriano@gmail.com','+6390621310607','Enquiry','Please send us the updated pricing','2019-05-13 06:44:23','Ako'),(4,'Jared Tan','jaredtan@gmail.com','+639062131607','talk','Talk2US','2019-05-13 06:47:34','Ako'),(5,'Jared Tan','jaredtan@gmail.com','+639062131607','talk','Talk2US','2019-05-13 06:47:48','Ako'),(6,'Jared Tan','jaredtan@gmail.com','+639062131607','talk','Talk2US','2019-05-13 06:47:48','Ako'),(7,'Jared Tan','jaredtan@gmail.com','+639062131607','talk','Talk2US','2019-05-13 06:48:17','Ako'),(8,'Chinkee Tan','chinkeetan@gmail.com','+639062131607','Chinkee','I want to Book!','2019-05-13 06:53:44','Ako'),(9,'Chinkee Tan','chinkeetan@gmail.com','+639062131607','Chinkee','I want to Book!','2019-05-13 06:57:36','Ako'),(10,'Michael Chua','michael.chua@gmail.com','+639062131607','Pricing','Hi, I would like to inquire  how much it will costs for 12 Pax for 3 days vacation?','2019-05-13 07:18:30','Ako'),(11,'Michael Chua','michael.chua@gmail.com','+639062131607','Pricing','Hi, I would like to inquire  how much it will costs for 12 Pax for 3 days vacation?','2019-05-13 07:19:39','Ako'),(12,'Michael Chua','michael.chua@gmail.com','+639062131607','Pricing','Hi, I would like to inquire  how much it will costs for 12 Pax for 3 days vacation?','2019-05-13 08:25:29','Ako'),(13,'James Chan','james.chan@gmail.com','+639239108311','Amenities','Hi, I just have some question with the amenities.','2019-05-13 09:52:34','Ako'),(14,'Joven Tan','jovenntann@gmail.com','+639062131608','Testing','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2019-05-13 13:28:52','Ako'),(15,'Janneth','janneth@outlook.com','+1234567890','Test','Testing ','2019-05-13 14:58:36','Ako'),(16,'Miguel Sotto','miguel.sotto@gmail.com','+639239108311','Pricing','How much is the rate per night?','2019-05-14 02:24:22','Ako'),(17,'Miguel Sotto','miguel.sotto@gmail.com','+639239108311','Pricing','How much is the rate per night?','2019-05-14 02:24:43','Ako'),(18,'DJ Arris','djarrishz@gmail.com','+639301234567','Inquiry','How much is the rate per night?','2019-05-15 05:25:18','Ako'),(19,'','','','','','2019-05-15 05:26:51','Ako'),(20,'Joven','jovenntann@gmail.com','+639062131607','Pricing','How much is the rate per night?','2019-05-17 03:39:32','Tan'),(21,'Joven','jovenntann@gmail.com','+639062131607','Pricing','How much is the rate per night?','2019-05-17 03:39:59','Tan'),(22,'Joven','jovenntann@gmail.com','+639062131607','Pricing','How much is the rate per night?','2019-05-17 03:40:18','Tan'),(23,'Joven','jovenntann@gmail.com','9062131607','Inquiry','Please send the invoice','2019-05-17 07:29:43','Tan'),(24,'Joven','jovenntann@gmail.com','9062131607','Inquiry','Testing 123','2019-05-17 11:01:50','Tan'),(25,'Joven','jovenntann@gmail.com','9062131607','Princing','How much?','2019-05-19 10:33:58','Tan'),(26,'Joven','jovenntann@gmail.com','9062131607','Test','Testing','2019-05-22 03:13:53','Tan'),(27,'Joven','jovenntann@gmail.com','9062131607','Test','Testing 101','2019-05-22 03:17:09','Tan'),(28,'Joven','jovenntann@gmail.com','9062131607','TEST','TESTING','2019-05-22 03:21:51','Tan'),(29,'Joven','jovenntann@gmail.com','9062131607','Greetings','Hello There!','2019-05-22 03:31:53','Tan'),(30,'Joven','jovenntann@gmail.com','9062131607','Greetings','Hello There!','2019-05-22 03:32:08','Tan'),(31,'Joven','jovenntann@gmail.com','9062131607','Greetings','Hello There!','2019-05-22 03:32:55','Tan'),(32,'Joven','jovenntann@gmail.com','9062131607','Greetings','Hello There!','2019-05-22 03:33:08','Tan'),(33,'Joven','jovenntann@gmail.com','+639062131607','Greetings!!','Hello there!!','2019-05-22 03:34:02','Tan'),(34,'Joven','jovenntann@gmail.com','+6532140215','Greetings!!','Hello there!!','2019-05-22 03:34:19','Tan'),(35,'Joven','jovenntann@gmail.com','+639062131607','Index','Index Page Testing!','2019-05-22 03:36:00','Tan'),(36,'Joven','jovenntann@gmail.com','+639062131607','Hi','Hello','2020-02-03 23:17:13','Tan');
/*!40000 ALTER TABLE `adsapp_inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adsapp_room`
--

DROP TABLE IF EXISTS `adsapp_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsapp_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room` varchar(50) NOT NULL,
  `types` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `bed` varchar(50) NOT NULL,
  `bed_quantity` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `thumbnail` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsapp_room`
--

LOCK TABLES `adsapp_room` WRITE;
/*!40000 ALTER TABLE `adsapp_room` DISABLE KEYS */;
INSERT INTO `adsapp_room` VALUES (1,'1A','Family','Mountain View with Semi-private terrace','Double','2','Double-Double',2500,'/static/public/images/rooms/family/family.jpg'),(2,'1B','Couple','Mountain View, Sea View , Poolside View with Semi-private terrace','Queen','1','Queen Room',2500,'/static/public/images/rooms/honeymoon/honeymoon.jpg'),(3,'1D','Couple','Mountain View, Sea View , Poolside View','King','1','Premium Room',2500,'/static/public/images/rooms/deluxe/deluxe.jpg'),(4,'1E','Family','Sea View with Semi-private terrace','Double','2','Double-Double',2500,'/static/public/images/rooms/double/double.jpg'),(5,'1F','Couple','Sea View, Poolside View with Semi-private terrace','Queen','1','Queen Room',2500,'/static/public/images/rooms/honeymoon/honeymoon.jpg'),(6,'2A','Family','Mountain View with private terrace','Double & Single','2','Twin Room',2500,'/static/public/images/rooms/family/family.jpg'),(7,'2B','Couple','Mountain View, Sea View , Poolside View with private terrace','Queen','1','Queen Room',2500,'/static/public/images/rooms/view/view.jpg'),(8,'2C','Couple','Sea View with private terrace','Queen','1','Queen Room',2500,'/static/public/images/rooms/honeymoon/honeymoon.jpg'),(9,'2D','Couple','Sea View, Poolside View with private terrace','Queen','1','Queen Room',2500,'/static/public/images/rooms/small/small.jpg'),(10,'3A','Family','Mountain View with private terrace','Queen','2','Premium Room',2500,'/static/public/images/rooms/family/family.jpg'),(11,'3B','Couple','Mountain View, Landscape Sea View , Poolside View with Private terrace','King','1','Premium Room',2500,'/static/public/images/rooms/king/king.jpg'),(12,'3C','Family','Sea View with Private terrace','Queen (54 Inch)','2','Premium Room',2500,'/static/public/images/rooms/luxury/luxury.jpg'),(13,'3D','Couple','Landscape Sea View , Poolside View with Private terrace','King','1','Premium Room',2500,'/static/public/images/rooms/double/double.jpg');
/*!40000 ALTER TABLE `adsapp_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adsapp_room_amenities`
--

DROP TABLE IF EXISTS `adsapp_room_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsapp_room_amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amenities_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adsapp_room_amenitie_amenities_id_c5180d27_fk_adsapp_am` (`amenities_id`),
  KEY `adsapp_room_amenities_room_id_ce630563_fk_adsapp_room_id` (`room_id`),
  CONSTRAINT `adsapp_room_amenities_room_id_ce630563_fk_adsapp_room_id` FOREIGN KEY (`room_id`) REFERENCES `adsapp_room` (`id`),
  CONSTRAINT `adsapp_room_amenitie_amenities_id_c5180d27_fk_adsapp_am` FOREIGN KEY (`amenities_id`) REFERENCES `adsapp_amenities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsapp_room_amenities`
--

LOCK TABLES `adsapp_room_amenities` WRITE;
/*!40000 ALTER TABLE `adsapp_room_amenities` DISABLE KEYS */;
INSERT INTO `adsapp_room_amenities` VALUES (4,6,1),(5,11,1),(6,13,1),(7,17,1),(8,7,1),(9,12,1),(10,19,1),(11,23,1),(12,9,1),(13,4,2),(14,11,2),(15,13,2),(16,16,2),(17,17,2),(18,7,2),(19,12,2),(20,19,2),(21,23,2),(22,9,2),(23,3,3),(24,11,3),(25,18,3),(26,1,4),(27,11,4),(28,13,4),(29,16,4),(30,17,4),(31,7,4),(32,12,4),(33,19,4),(34,23,4),(35,9,4),(36,4,5),(37,11,5),(38,13,5),(39,16,5),(40,17,5),(41,7,5),(42,12,5),(43,19,5),(44,23,5),(45,9,5),(46,2,6),(47,5,6),(48,11,6),(49,13,6),(50,16,6),(51,17,6),(52,20,6),(53,12,6),(54,19,6),(55,23,6),(56,9,6),(57,4,7),(58,11,7),(59,13,7),(60,16,7),(61,17,7),(62,7,7),(63,12,7),(65,19,7),(66,23,7),(67,9,7),(68,4,8),(69,11,8),(70,13,8),(71,16,8),(72,17,8),(73,7,8),(74,12,8),(75,19,8),(76,23,8),(77,9,8),(78,1,10),(79,11,10),(80,13,10),(81,16,10),(82,10,10),(83,8,10),(84,9,10),(85,17,10),(86,7,10),(87,12,10),(88,19,10),(89,22,10),(90,23,10),(91,21,10),(92,15,10),(93,18,10),(94,3,11),(95,11,11),(96,13,11),(97,10,11),(98,8,11),(99,9,11),(100,17,11),(101,7,11),(102,12,11),(104,19,11),(105,22,11),(106,23,11),(107,21,11),(108,15,11),(109,18,11),(110,1,12),(111,11,12),(112,14,12),(113,16,12),(114,10,12),(115,8,12),(116,17,12),(117,7,12),(118,12,12),(119,19,12),(120,22,12),(121,23,12),(122,21,12),(123,15,12),(124,18,12),(125,3,13),(126,11,13),(127,14,13),(128,16,13),(129,10,13),(130,8,13),(131,9,13),(132,17,13),(133,7,13),(134,12,13),(135,19,13),(136,22,13),(137,23,13),(138,21,13),(139,15,13),(140,18,13);
/*!40000 ALTER TABLE `adsapp_room_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adsapp_room_gallery`
--

DROP TABLE IF EXISTS `adsapp_room_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsapp_room_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(250) NOT NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adsapp_room_gallery_room_id_08b25dce_fk_adsapp_room_id` (`room_id`),
  CONSTRAINT `adsapp_room_gallery_room_id_08b25dce_fk_adsapp_room_id` FOREIGN KEY (`room_id`) REFERENCES `adsapp_room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsapp_room_gallery`
--

LOCK TABLES `adsapp_room_gallery` WRITE;
/*!40000 ALTER TABLE `adsapp_room_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `adsapp_room_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adsapp_setting`
--

DROP TABLE IF EXISTS `adsapp_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsapp_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `value` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsapp_setting`
--

LOCK TABLES `adsapp_setting` WRITE;
/*!40000 ALTER TABLE `adsapp_setting` DISABLE KEYS */;
INSERT INTO `adsapp_setting` VALUES (1,'website','www.amihandelsol.com'),(2,'phone','+639175620345'),(3,'address','Brgy Aninuan, Puerto Galera, Oriental Mindoro, 5203'),(4,'email','enquiries@amihandelsol.com');
/*!40000 ALTER TABLE `adsapp_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add room_ amenities',7,'add_room_amenities'),(20,'Can change room_ amenities',7,'change_room_amenities'),(21,'Can delete room_ amenities',7,'delete_room_amenities'),(22,'Can add room_ gallery',8,'add_room_gallery'),(23,'Can change room_ gallery',8,'change_room_gallery'),(24,'Can delete room_ gallery',8,'delete_room_gallery'),(25,'Can add room',9,'add_room'),(26,'Can change room',9,'change_room'),(27,'Can delete room',9,'delete_room'),(28,'Can add booking',10,'add_booking'),(29,'Can change booking',10,'change_booking'),(30,'Can delete booking',10,'delete_booking'),(31,'Can add amenities',11,'add_amenities'),(32,'Can change amenities',11,'change_amenities'),(33,'Can delete amenities',11,'delete_amenities'),(34,'Can add customer',12,'add_customer'),(35,'Can change customer',12,'change_customer'),(36,'Can delete customer',12,'delete_customer'),(37,'Can add PayPal IPN',13,'add_paypalipn'),(38,'Can change PayPal IPN',13,'change_paypalipn'),(39,'Can delete PayPal IPN',13,'delete_paypalipn'),(40,'Can add date range',14,'add_daterange'),(41,'Can change date range',14,'change_daterange'),(42,'Can delete date range',14,'delete_daterange'),(43,'Can add inquiry',15,'add_inquiry'),(44,'Can change inquiry',15,'change_inquiry'),(45,'Can delete inquiry',15,'delete_inquiry'),(46,'Can add setting',16,'add_setting'),(47,'Can change setting',16,'change_setting'),(48,'Can delete setting',16,'delete_setting');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$ndzfswLjIAkN$c4I4l857p77i2U6hjD4rhnw2aCv3LrDFYKAALiWliCk=','2020-02-18 05:50:01',1,'root','','','jovenntann@gmail.com',1,1,'2019-04-30 03:25:15'),(2,'pbkdf2_sha256$36000$UQLJXGXF7IHU$ocuwDMxKbC7DAxoe7y84RagHtMk0uW8+DJ1xF1pLDow=',NULL,0,'test','','','',0,1,'2019-05-06 10:06:41'),(3,'pbkdf2_sha256$36000$GmRJRl3DR4nm$0loItzDOho5Z9lRTlNoQ4cy9cMkmTkmYW2AzY62BrRA=',NULL,0,'joven','','','',0,1,'2019-05-06 10:08:28'),(4,'pbkdf2_sha256$36000$frrEGfy4odNV$uYONme+VF0eDbEjd/5Z1hRqt0zKds0t0SgfThd+3jWs=',NULL,0,'karen','','','',0,1,'2019-05-06 10:10:45'),(5,'pbkdf2_sha256$36000$3EawjwfmXdQq$ydUkKXo15O3WmaUV5epyPEqGPx1apb+gU3WNOChULlw=',NULL,0,'chance','','','',0,1,'2019-05-06 15:49:48'),(6,'pbkdf2_sha256$36000$T97kIcFAD5LX$10CxnOnLjgieqLShIhUnZB2w7RAEuYp5kI69zGgfqmU=',NULL,0,'khai','','','',0,1,'2019-05-09 06:45:03');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-04-30 09:05:41','1','Joven Tan',1,'[{\"added\": {}}]',12,1),(2,'2019-04-30 09:06:15','1','JovenTan',1,'[{\"added\": {}}]',10,1),(3,'2019-04-30 09:06:40','2','Princess Soriano',1,'[{\"added\": {}}]',12,1),(4,'2019-04-30 09:07:18','2','PrincessSoriano',1,'[{\"added\": {}}]',10,1),(5,'2019-04-30 09:42:52','1','root',1,'[{\"added\": {}}]',14,1),(6,'2019-05-03 11:09:09','1','1A | 2 Queen Size Beds',1,'[{\"added\": {}}]',7,1),(7,'2019-05-03 11:09:13','2','1A | 1 Double Size Bed',1,'[{\"added\": {}}]',7,1),(8,'2019-05-03 11:09:17','3','1A | 1 King Size Bed',1,'[{\"added\": {}}]',7,1),(9,'2019-05-06 10:06:41','2','test',1,'[{\"added\": {}}]',4,1),(10,'2019-05-06 10:08:28','3','joven',1,'[{\"added\": {}}]',4,1),(11,'2019-05-06 10:10:45','4','karen',1,'[{\"added\": {}}]',4,1),(12,'2019-05-06 15:49:48','5','chance',1,'[{\"added\": {}}]',4,1),(13,'2019-05-09 06:45:03','6','khai',1,'[{\"added\": {}}]',4,1),(14,'2019-05-13 02:43:05','1','1A - Family - Double-Double',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(15,'2019-05-13 02:43:38','2','1B - Couple - Queen Room',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(16,'2019-05-13 02:45:46','3','1D - Couple - Premium Room',2,'[{\"changed\": {\"fields\": [\"description\", \"thumbnail\"]}}]',9,1),(17,'2019-05-13 02:50:40','4','1E - Family - Double-Double',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(18,'2019-05-13 02:50:50','5','1F - Couple - Queen Room',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(19,'2019-05-13 02:50:57','6','2A - Family - Twin Room',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(20,'2019-05-13 02:51:04','7','2B - Couple - Queen Room',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(21,'2019-05-13 02:51:15','8','2C - Couple - Queen Room',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(22,'2019-05-13 02:51:26','9','2D - Couple - Queen Room',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(23,'2019-05-13 02:51:53','10','3A - Family - Premium Room',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(24,'2019-05-13 02:52:05','11','3B - Couple - Premium Room',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(25,'2019-05-13 02:52:11','12','3C - Family - Premium Room',2,'[{\"changed\": {\"fields\": [\"room\", \"thumbnail\"]}}]',9,1),(26,'2019-05-13 02:52:16','13','3D - Couple - Premium Room',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(27,'2019-05-13 10:01:07','23','WiFi (icon-wifi)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',11,1),(28,'2019-05-13 10:01:14','22','Coffee (icon-tea)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(29,'2019-05-13 10:01:26','21','Safety (icon-safe)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(30,'2019-05-13 10:01:33','20','Balcony (icon-balcony)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(31,'2019-05-13 10:01:41','19','MiniBar (icon-mini-bar)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',11,1),(32,'2019-05-13 10:01:47','18','Iron (icon-iron)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(33,'2019-05-13 10:04:19','17','AC (icon-ac)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(34,'2019-05-13 10:04:24','16','Water (icon-water)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(35,'2019-05-13 10:04:30','15','Hairdryer (icon-hair-dryer)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',11,1),(36,'2019-05-13 10:04:34','14','TV (icon-tv)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(37,'2019-05-13 10:04:39','13','TV (icon-tv)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(38,'2019-05-13 10:04:44','12','Key (icon-card)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(39,'2019-05-13 10:04:51','11','Cable (icon-tv)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(40,'2019-05-13 10:04:54','10','Bath tub (icon-bath-tub)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',11,1),(41,'2019-05-13 10:04:59','9','Towels (icon-tower)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(42,'2019-05-13 10:05:03','8','Bath robe (icon-robe)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',11,1),(43,'2019-05-13 10:05:06','7','Balcony (icon-balcony)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',11,1),(44,'2019-05-13 10:05:12','6','Bed (icon-bed)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(45,'2019-05-13 10:05:18','5','Bed (icon-bed)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(46,'2019-05-13 10:05:23','4','Bed (icon-bed)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(47,'2019-05-13 10:05:27','3','Bed (icon-bed)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(48,'2019-05-13 10:05:31','2','Bed (icon-bed)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(49,'2019-05-13 10:05:35','1','Bed (icon-bed)',2,'[{\"changed\": {\"fields\": [\"_type\", \"description\"]}}]',11,1),(50,'2019-05-13 10:07:35','3','1A | 1 King Size Bed',3,'',7,1),(51,'2019-05-13 10:07:35','2','1A | 1 Double Size Bed',3,'',7,1),(52,'2019-05-13 10:07:35','1','1A | 2 Queen Size Beds',3,'',7,1),(53,'2019-05-13 10:08:17','4','1A | 2 Double Size Beds',1,'[{\"added\": {}}]',7,1),(54,'2019-05-13 10:08:25','5','1A | Cable TV',1,'[{\"added\": {}}]',7,1),(55,'2019-05-13 10:08:36','6','1A | Flat screen 43 Inch TV',1,'[{\"added\": {}}]',7,1),(56,'2019-05-13 10:08:45','7','1A | Individually Controlled A/C',1,'[{\"added\": {}}]',7,1),(57,'2019-05-13 10:08:50','8','1A | Balcony',1,'[{\"added\": {}}]',7,1),(58,'2019-05-13 10:08:55','9','1A | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(59,'2019-05-13 10:09:00','10','1A | MiniBar',1,'[{\"added\": {}}]',7,1),(60,'2019-05-13 10:09:07','11','1A | WiFI',1,'[{\"added\": {}}]',7,1),(61,'2019-05-13 10:09:12','12','1A | Bath Towels',1,'[{\"added\": {}}]',7,1),(62,'2019-05-13 10:09:24','13','1B | 1 Queen Size Bed',1,'[{\"added\": {}}]',7,1),(63,'2019-05-13 10:09:30','14','1A | Cable TV',1,'[{\"added\": {}}]',7,1),(64,'2019-05-13 10:09:35','15','1A | Flat screen 43 Inch TV',1,'[{\"added\": {}}]',7,1),(65,'2019-05-13 10:09:40','16','1A | Hot and Cold water',1,'[{\"added\": {}}]',7,1),(66,'2019-05-13 10:09:45','17','1A | Individually Controlled A/C',1,'[{\"added\": {}}]',7,1),(67,'2019-05-13 10:09:51','18','1A | Balcony',1,'[{\"added\": {}}]',7,1),(68,'2019-05-13 10:09:56','19','1A | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(69,'2019-05-13 10:10:01','20','1A | MiniBar',1,'[{\"added\": {}}]',7,1),(70,'2019-05-13 10:10:06','21','1A | WiFI',1,'[{\"added\": {}}]',7,1),(71,'2019-05-13 10:10:12','22','1B | Bath Towels',1,'[{\"added\": {}}]',7,1),(72,'2019-05-13 10:10:27','15','1B | Flat screen 43 Inch TV',2,'[{\"changed\": {\"fields\": [\"room\"]}}]',7,1),(73,'2019-05-13 10:10:30','16','1B | Hot and Cold water',2,'[{\"changed\": {\"fields\": [\"room\"]}}]',7,1),(74,'2019-05-13 10:10:32','17','1B | Individually Controlled A/C',2,'[{\"changed\": {\"fields\": [\"room\"]}}]',7,1),(75,'2019-05-13 10:10:34','18','1B | Balcony',2,'[{\"changed\": {\"fields\": [\"room\"]}}]',7,1),(76,'2019-05-13 10:10:37','19','1B | Electrical Key Card System',2,'[{\"changed\": {\"fields\": [\"room\"]}}]',7,1),(77,'2019-05-13 10:10:39','20','1B | MiniBar',2,'[{\"changed\": {\"fields\": [\"room\"]}}]',7,1),(78,'2019-05-13 10:10:41','21','1B | WiFI',2,'[{\"changed\": {\"fields\": [\"room\"]}}]',7,1),(79,'2019-05-13 10:11:04','14','1B | Cable TV',2,'[{\"changed\": {\"fields\": [\"room\"]}}]',7,1),(80,'2019-05-13 10:11:29','23','1D | 1 King Size Bed',1,'[{\"added\": {}}]',7,1),(81,'2019-05-13 10:11:36','24','1D | Cable TV',1,'[{\"added\": {}}]',7,1),(82,'2019-05-13 10:11:53','25','1D | Flat screen 43 Inch TV',1,'[{\"added\": {}}]',7,1),(83,'2019-05-13 10:12:03','25','1D | Flat screen 54 Inch TV',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(84,'2019-05-13 10:12:15','25','1D | Hot and Cold water',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(85,'2019-05-13 10:12:26','25','1D | Bath robe',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(86,'2019-05-13 10:12:31','25','1D | Bath Towels',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(87,'2019-05-13 10:12:37','25','1D | Individually Controlled A/C',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(88,'2019-05-13 10:12:43','25','1D | Balcony',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(89,'2019-05-13 10:12:50','25','1D | Electrical Key Card System',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(90,'2019-05-13 10:12:59','25','1D | MiniBar',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(91,'2019-05-13 10:13:09','25','1D | Tea and Coffee making facilities',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(92,'2019-05-13 10:13:15','25','1D | WiFI',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(93,'2019-05-13 10:13:20','25','1D | Safe Deposit Box',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(94,'2019-05-13 10:13:27','25','1D | Hairdryer',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(95,'2019-05-13 10:13:35','25','1D | Iron and Ironing Board',2,'[{\"changed\": {\"fields\": [\"amenities\"]}}]',7,1),(96,'2019-05-13 10:14:00','26','1E | 2 Queen Size Beds',1,'[{\"added\": {}}]',7,1),(97,'2019-05-13 10:14:05','27','1E | Cable TV',1,'[{\"added\": {}}]',7,1),(98,'2019-05-13 10:14:11','28','1E | Flat screen 43 Inch TV',1,'[{\"added\": {}}]',7,1),(99,'2019-05-13 10:14:17','29','1E | Hot and Cold water',1,'[{\"added\": {}}]',7,1),(100,'2019-05-13 10:14:23','30','1E | Individually Controlled A/C',1,'[{\"added\": {}}]',7,1),(101,'2019-05-13 10:14:29','31','1E | Balcony',1,'[{\"added\": {}}]',7,1),(102,'2019-05-13 10:14:35','32','1E | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(103,'2019-05-13 10:14:42','33','1E | MiniBar',1,'[{\"added\": {}}]',7,1),(104,'2019-05-13 10:14:54','34','1E | WiFI',1,'[{\"added\": {}}]',7,1),(105,'2019-05-13 10:15:00','35','1E | Bath Towels',1,'[{\"added\": {}}]',7,1),(106,'2019-05-13 10:15:12','36','1F | 1 Queen Size Bed',1,'[{\"added\": {}}]',7,1),(107,'2019-05-13 10:15:22','37','1F | Cable TV',1,'[{\"added\": {}}]',7,1),(108,'2019-05-13 10:15:29','38','1F | Flat screen 43 Inch TV',1,'[{\"added\": {}}]',7,1),(109,'2019-05-13 10:15:35','39','1F | Hot and Cold water',1,'[{\"added\": {}}]',7,1),(110,'2019-05-13 10:15:41','40','1F | Individually Controlled A/C',1,'[{\"added\": {}}]',7,1),(111,'2019-05-13 10:15:50','41','1F | Balcony',1,'[{\"added\": {}}]',7,1),(112,'2019-05-13 10:15:55','42','1F | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(113,'2019-05-13 10:16:01','43','1F | MiniBar',1,'[{\"added\": {}}]',7,1),(114,'2019-05-13 10:16:07','44','1F | WiFI',1,'[{\"added\": {}}]',7,1),(115,'2019-05-13 10:16:37','45','1F | Bath Towels',1,'[{\"added\": {}}]',7,1),(116,'2019-05-13 10:17:33','46','2A | 1 Double Size Bed',1,'[{\"added\": {}}]',7,1),(117,'2019-05-13 10:18:16','47','2A | 1 Single Size Bed',1,'[{\"added\": {}}]',7,1),(118,'2019-05-13 10:18:16','48','2A | Cable TV',1,'[{\"added\": {}}]',7,1),(119,'2019-05-13 10:18:17','49','2A | Flat screen 43 Inch TV',1,'[{\"added\": {}}]',7,1),(120,'2019-05-13 10:18:18','50','2A | Hot and Cold water',1,'[{\"added\": {}}]',7,1),(121,'2019-05-13 10:18:18','51','2A | Individually Controlled A/C',1,'[{\"added\": {}}]',7,1),(122,'2019-05-13 10:18:19','52','2A | Private Balcony',1,'[{\"added\": {}}]',7,1),(123,'2019-05-13 10:18:20','53','2A | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(124,'2019-05-13 10:18:58','54','2A | MiniBar',1,'[{\"added\": {}}]',7,1),(125,'2019-05-13 10:18:59','55','2A | WiFI',1,'[{\"added\": {}}]',7,1),(126,'2019-05-13 10:19:00','56','2A | Bath Towels',1,'[{\"added\": {}}]',7,1),(127,'2019-05-13 10:20:06','57','2B | 1 Queen Size Bed',1,'[{\"added\": {}}]',7,1),(128,'2019-05-13 10:20:17','58','2B | Cable TV',1,'[{\"added\": {}}]',7,1),(129,'2019-05-13 10:20:22','59','2B | Flat screen 43 Inch TV',1,'[{\"added\": {}}]',7,1),(130,'2019-05-13 10:20:28','60','2B | Hot and Cold water',1,'[{\"added\": {}}]',7,1),(131,'2019-05-13 10:20:35','61','2B | Individually Controlled A/C',1,'[{\"added\": {}}]',7,1),(132,'2019-05-13 10:20:39','62','2B | Balcony',1,'[{\"added\": {}}]',7,1),(133,'2019-05-13 10:20:46','63','2B | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(134,'2019-05-13 10:20:50','64','2B | Balcony',1,'[{\"added\": {}}]',7,1),(135,'2019-05-13 10:21:23','64','2B | Balcony',3,'',7,1),(136,'2019-05-13 10:21:35','65','2B | MiniBar',1,'[{\"added\": {}}]',7,1),(137,'2019-05-13 10:21:41','66','2B | WiFI',1,'[{\"added\": {}}]',7,1),(138,'2019-05-13 10:21:47','67','2B | Bath Towels',1,'[{\"added\": {}}]',7,1),(139,'2019-05-13 10:22:20','68','2C | 1 Queen Size Bed',1,'[{\"added\": {}}]',7,1),(140,'2019-05-13 10:22:27','69','2C | Cable TV',1,'[{\"added\": {}}]',7,1),(141,'2019-05-13 10:22:32','70','2C | Flat screen 43 Inch TV',1,'[{\"added\": {}}]',7,1),(142,'2019-05-13 10:22:37','71','2C | Hot and Cold water',1,'[{\"added\": {}}]',7,1),(143,'2019-05-13 10:22:43','72','2C | Individually Controlled A/C',1,'[{\"added\": {}}]',7,1),(144,'2019-05-13 10:22:48','73','2C | Balcony',1,'[{\"added\": {}}]',7,1),(145,'2019-05-13 10:22:53','74','2C | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(146,'2019-05-13 10:23:01','75','2C | MiniBar',1,'[{\"added\": {}}]',7,1),(147,'2019-05-13 10:23:07','76','2C | WiFI',1,'[{\"added\": {}}]',7,1),(148,'2019-05-13 10:23:12','77','2C | Bath Towels',1,'[{\"added\": {}}]',7,1),(149,'2019-05-13 10:23:29','78','2D | 2 Queen Size Beds',1,'[{\"added\": {}}]',7,1),(150,'2019-05-13 10:23:33','78','3A | 2 Queen Size Beds',2,'[{\"changed\": {\"fields\": [\"room\"]}}]',7,1),(151,'2019-05-13 10:23:43','79','3A | Cable TV',1,'[{\"added\": {}}]',7,1),(152,'2019-05-13 10:23:49','80','3A | Flat screen 43 Inch TV',1,'[{\"added\": {}}]',7,1),(153,'2019-05-13 10:23:55','81','3A | Hot and Cold water',1,'[{\"added\": {}}]',7,1),(154,'2019-05-13 10:24:01','82','3A | Bath tub',1,'[{\"added\": {}}]',7,1),(155,'2019-05-13 10:24:08','83','3A | Bath robe',1,'[{\"added\": {}}]',7,1),(156,'2019-05-13 10:24:13','84','3A | Bath Towels',1,'[{\"added\": {}}]',7,1),(157,'2019-05-13 10:24:19','85','3A | Individually Controlled A/C',1,'[{\"added\": {}}]',7,1),(158,'2019-05-13 10:24:26','86','3A | Balcony',1,'[{\"added\": {}}]',7,1),(159,'2019-05-13 10:24:32','87','3A | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(160,'2019-05-13 10:24:40','88','3A | MiniBar',1,'[{\"added\": {}}]',7,1),(161,'2019-05-13 10:24:47','89','3A | Tea and Coffee making facilities',1,'[{\"added\": {}}]',7,1),(162,'2019-05-13 10:24:53','90','3A | WiFI',1,'[{\"added\": {}}]',7,1),(163,'2019-05-13 10:24:59','91','3A | Safe Deposit Box',1,'[{\"added\": {}}]',7,1),(164,'2019-05-13 10:25:04','92','3A | Hairdryer',1,'[{\"added\": {}}]',7,1),(165,'2019-05-13 10:25:12','93','3A | Iron and Ironing Board',1,'[{\"added\": {}}]',7,1),(166,'2019-05-13 10:25:35','94','3B | 1 King Size Bed',1,'[{\"added\": {}}]',7,1),(167,'2019-05-13 10:25:41','95','3B | Cable TV',1,'[{\"added\": {}}]',7,1),(168,'2019-05-13 10:25:47','96','3B | Flat screen 43 Inch TV',1,'[{\"added\": {}}]',7,1),(169,'2019-05-13 10:25:53','97','3B | Bath tub',1,'[{\"added\": {}}]',7,1),(170,'2019-05-13 10:25:59','98','3B | Bath robe',1,'[{\"added\": {}}]',7,1),(171,'2019-05-13 10:26:07','99','3B | Bath Towels',1,'[{\"added\": {}}]',7,1),(172,'2019-05-13 10:26:14','100','3B | Individually Controlled A/C',1,'[{\"added\": {}}]',7,1),(173,'2019-05-13 10:26:22','101','3B | Balcony',1,'[{\"added\": {}}]',7,1),(174,'2019-05-13 10:26:28','102','3B | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(175,'2019-05-13 10:26:36','103','3B | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(176,'2019-05-13 10:26:42','104','3B | MiniBar',1,'[{\"added\": {}}]',7,1),(177,'2019-05-13 10:26:47','105','3B | Tea and Coffee making facilities',1,'[{\"added\": {}}]',7,1),(178,'2019-05-13 10:26:53','106','3B | WiFI',1,'[{\"added\": {}}]',7,1),(179,'2019-05-13 10:27:00','107','3B | Safe Deposit Box',1,'[{\"added\": {}}]',7,1),(180,'2019-05-13 10:27:05','108','3B | Hairdryer',1,'[{\"added\": {}}]',7,1),(181,'2019-05-13 10:27:12','109','3B | Iron and Ironing Board',1,'[{\"added\": {}}]',7,1),(182,'2019-05-13 10:27:35','103','3B | Electrical Key Card System',3,'',7,1),(183,'2019-05-13 10:27:52','110','3C | 2 Queen Size Beds',1,'[{\"added\": {}}]',7,1),(184,'2019-05-13 10:27:59','111','3C | Cable TV',1,'[{\"added\": {}}]',7,1),(185,'2019-05-13 10:28:06','112','3C | Flat screen 54 Inch TV',1,'[{\"added\": {}}]',7,1),(186,'2019-05-13 10:28:17','113','3C | Hot and Cold water',1,'[{\"added\": {}}]',7,1),(187,'2019-05-13 10:28:24','114','3C | Bath tub',1,'[{\"added\": {}}]',7,1),(188,'2019-05-13 10:28:31','115','3C | Bath robe',1,'[{\"added\": {}}]',7,1),(189,'2019-05-13 10:28:39','116','3C | Individually Controlled A/C',1,'[{\"added\": {}}]',7,1),(190,'2019-05-13 10:28:44','117','3C | Balcony',1,'[{\"added\": {}}]',7,1),(191,'2019-05-13 10:28:51','118','3C | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(192,'2019-05-13 10:28:57','119','3C | MiniBar',1,'[{\"added\": {}}]',7,1),(193,'2019-05-13 10:29:03','120','3C | Tea and Coffee making facilities',1,'[{\"added\": {}}]',7,1),(194,'2019-05-13 10:29:12','121','3C | WiFI',1,'[{\"added\": {}}]',7,1),(195,'2019-05-13 10:29:18','122','3C | Safe Deposit Box',1,'[{\"added\": {}}]',7,1),(196,'2019-05-13 10:29:23','123','3C | Hairdryer',1,'[{\"added\": {}}]',7,1),(197,'2019-05-13 10:29:32','124','3C | Iron and Ironing Board',1,'[{\"added\": {}}]',7,1),(198,'2019-05-13 10:29:43','125','3D | 1 King Size Bed',1,'[{\"added\": {}}]',7,1),(199,'2019-05-13 10:29:48','126','3D | Cable TV',1,'[{\"added\": {}}]',7,1),(200,'2019-05-13 10:29:57','127','3D | Flat screen 54 Inch TV',1,'[{\"added\": {}}]',7,1),(201,'2019-05-13 10:30:08','128','3D | Hot and Cold water',1,'[{\"added\": {}}]',7,1),(202,'2019-05-13 10:30:14','129','3D | Bath tub',1,'[{\"added\": {}}]',7,1),(203,'2019-05-13 10:30:21','130','3D | Bath robe',1,'[{\"added\": {}}]',7,1),(204,'2019-05-13 10:30:29','131','3D | Bath Towels',1,'[{\"added\": {}}]',7,1),(205,'2019-05-13 10:30:35','132','3D | Individually Controlled A/C',1,'[{\"added\": {}}]',7,1),(206,'2019-05-13 10:30:44','133','3D | Balcony',1,'[{\"added\": {}}]',7,1),(207,'2019-05-13 10:30:49','134','3D | Electrical Key Card System',1,'[{\"added\": {}}]',7,1),(208,'2019-05-13 10:30:58','135','3D | MiniBar',1,'[{\"added\": {}}]',7,1),(209,'2019-05-13 10:31:03','136','3D | Tea and Coffee making facilities',1,'[{\"added\": {}}]',7,1),(210,'2019-05-13 10:31:11','137','3D | WiFI',1,'[{\"added\": {}}]',7,1),(211,'2019-05-13 10:31:18','138','3D | Safe Deposit Box',1,'[{\"added\": {}}]',7,1),(212,'2019-05-13 10:31:24','139','3D | Hairdryer',1,'[{\"added\": {}}]',7,1),(213,'2019-05-13 10:31:32','140','3D | Iron and Ironing Board',1,'[{\"added\": {}}]',7,1),(214,'2019-05-13 10:52:36','23','WiFI (fa fa-wifi)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(215,'2019-05-13 10:53:14','14','Flat screen 54 Inch TV (fa fa-television)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(216,'2019-05-13 10:53:39','13','Flat screen 43 Inch TV (fa fa-television)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(217,'2019-05-13 10:53:51','22','Tea and Coffee making facilities (fa fa-coffee)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(218,'2019-05-13 10:54:10','1','2 Queen Size Beds (fa fa-bed)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(219,'2019-05-13 10:54:26','2','1 Double Size Bed (fa fa-bed)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(220,'2019-05-13 10:54:28','3','1 King Size Bed (fa fa-bed)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(221,'2019-05-13 10:54:29','4','1 Queen Size Bed (fa fa-bed)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(222,'2019-05-13 10:54:31','5','1 Single Size Bed (fa fa-bed)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(223,'2019-05-13 10:54:33','6','2 Double Size Beds (fa fa-bed)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(224,'2019-05-13 10:55:21','10','Bath tub (fa fa-bath)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(225,'2019-05-13 10:55:44','11','Cable TV (fa fa-tv)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(226,'2019-05-13 10:56:06','11','Cable TV (fa fa-signal)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(227,'2019-05-13 10:56:54','12','Electrical Key Card System (fa fa-key)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(228,'2019-05-13 10:57:06','21','Safe Deposit Box (fa fa-key)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(229,'2019-05-13 14:48:37','20','Private Balcony (fa fa-slideshare)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(230,'2019-05-13 16:00:57','16','Hot and Cold water (fa fa-shower)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(231,'2019-05-13 16:01:50','17','Individually Controlled A/C (fa fa-snowflakes-o)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(232,'2019-05-13 16:02:34','16','Hot and Cold water (fa fa-thermometer)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(233,'2019-05-13 16:03:14','17','Individually Controlled A/C (fa fa-asterisk)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(234,'2019-05-13 16:04:15','7','Balcony (fa fa-slideshare)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(235,'2019-05-13 16:06:18','9','Bath Towels (fa fa-star)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(236,'2019-05-13 16:06:18','9','Bath Towels (fa fa-star)',2,'[]',11,1),(237,'2019-05-13 16:06:18','9','Bath Towels (fa fa-star)',2,'[]',11,1),(238,'2019-05-13 16:07:00','19','MiniBar (fa fa-rocket)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(239,'2019-05-13 16:07:40','15','Hairdryer (fa fa-sun-o)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(240,'2019-05-13 16:08:07','18','Iron and Ironing Board (fa fa-space-shuttle)',2,'[{\"changed\": {\"fields\": [\"icon\"]}}]',11,1),(241,'2019-05-14 02:52:05','1','website',1,'[{\"added\": {}}]',16,1),(242,'2019-05-14 02:52:17','2','phone',1,'[{\"added\": {}}]',16,1),(243,'2019-05-14 02:52:26','3','address',1,'[{\"added\": {}}]',16,1),(244,'2019-05-14 02:52:35','4','email',1,'[{\"added\": {}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(11,'adsapp','amenities'),(10,'adsapp','booking'),(12,'adsapp','customer'),(14,'adsapp','daterange'),(15,'adsapp','inquiry'),(9,'adsapp','room'),(7,'adsapp','room_amenities'),(8,'adsapp','room_gallery'),(16,'adsapp','setting'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'ipn','paypalipn'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-30 03:24:48'),(2,'auth','0001_initial','2019-04-30 03:24:48'),(3,'admin','0001_initial','2019-04-30 03:24:48'),(4,'admin','0002_logentry_remove_auto_add','2019-04-30 03:24:48'),(5,'adsapp','0001_initial','2019-04-30 03:24:48'),(6,'adsapp','0002_room','2019-04-30 03:24:48'),(7,'adsapp','0003_auto_20190425_2342','2019-04-30 03:24:48'),(8,'adsapp','0004_auto_20190426_0005','2019-04-30 03:24:48'),(9,'adsapp','0005_auto_20190426_0036','2019-04-30 03:24:48'),(10,'adsapp','0006_booking','2019-04-30 03:24:48'),(11,'adsapp','0007_room_gallery','2019-04-30 03:24:48'),(12,'adsapp','0008_auto_20190426_1730','2019-04-30 03:24:48'),(13,'adsapp','0009_room_price','2019-04-30 03:24:48'),(14,'adsapp','0010_auto_20190426_1750','2019-04-30 03:24:48'),(15,'adsapp','0011_auto_20190426_1751','2019-04-30 03:24:48'),(16,'contenttypes','0002_remove_content_type_name','2019-04-30 03:24:48'),(17,'auth','0002_alter_permission_name_max_length','2019-04-30 03:24:48'),(18,'auth','0003_alter_user_email_max_length','2019-04-30 03:24:48'),(19,'auth','0004_alter_user_username_opts','2019-04-30 03:24:48'),(20,'auth','0005_alter_user_last_login_null','2019-04-30 03:24:48'),(21,'auth','0006_require_contenttypes_0002','2019-04-30 03:24:48'),(22,'auth','0007_alter_validators_add_error_messages','2019-04-30 03:24:48'),(23,'auth','0008_alter_user_username_max_length','2019-04-30 03:24:48'),(24,'ipn','0001_initial','2019-04-30 03:24:48'),(25,'ipn','0002_paypalipn_mp_id','2019-04-30 03:24:49'),(26,'ipn','0003_auto_20141117_1647','2019-04-30 03:24:49'),(27,'ipn','0004_auto_20150612_1826','2019-04-30 03:24:49'),(28,'ipn','0005_auto_20151217_0948','2019-04-30 03:24:49'),(29,'ipn','0006_auto_20160108_1112','2019-04-30 03:24:49'),(30,'ipn','0007_auto_20160219_1135','2019-04-30 03:24:49'),(31,'ipn','0008_auto_20181128_1032','2019-04-30 03:24:49'),(32,'sessions','0001_initial','2019-04-30 03:24:49'),(33,'adsapp','0012_auto_20190430_1735','2019-04-30 09:35:35'),(34,'adsapp','0013_daterange','2019-04-30 09:42:22'),(35,'adsapp','0014_room_thumbnail','2019-05-13 02:41:40'),(36,'adsapp','0015_inquiry','2019-05-13 05:08:00'),(37,'adsapp','0016_auto_20190513_1758','2019-05-13 09:58:27'),(38,'adsapp','0017_auto_20190513_1851','2019-05-13 10:52:01'),(39,'adsapp','0018_setting','2019-05-14 02:51:33'),(40,'adsapp','0019_auto_20190517_1136','2019-05-17 03:38:26');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4fpfftrigu9k3o5avzorwfe6ojf2e56x','ZTkzMGE2OTkwMzMwNzg5YzU1MzBmNmUxMjY5ZDg1ZmNmNjhhNjExZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjczYTU3Mzk4ZjU4ZTBhMjdiZTE2N2NjZmUzNDRhMWI4NjM2ZmIxIn0=','2019-08-21 11:21:26'),('5pecpm7s1o9or2wwfe5j7fgtpwgexbjc','ZTkzMGE2OTkwMzMwNzg5YzU1MzBmNmUxMjY5ZDg1ZmNmNjhhNjExZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjczYTU3Mzk4ZjU4ZTBhMjdiZTE2N2NjZmUzNDRhMWI4NjM2ZmIxIn0=','2019-05-28 03:57:29'),('awsqovhg63uvao86kh3sutrirc2b7tc5','ZTkzMGE2OTkwMzMwNzg5YzU1MzBmNmUxMjY5ZDg1ZmNmNjhhNjExZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjczYTU3Mzk4ZjU4ZTBhMjdiZTE2N2NjZmUzNDRhMWI4NjM2ZmIxIn0=','2020-02-20 15:32:40'),('bb7q1ixst81p7vxm745m56m1juxxi5vc','ZTkzMGE2OTkwMzMwNzg5YzU1MzBmNmUxMjY5ZDg1ZmNmNjhhNjExZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjczYTU3Mzk4ZjU4ZTBhMjdiZTE2N2NjZmUzNDRhMWI4NjM2ZmIxIn0=','2019-06-04 10:53:50'),('ojal15wa7ngijuc68rpf8b53umbxcjgy','YjdkMzg3MGVmNjhiZGM0NTk0NDI0MWQwZjI5NjM0MzJmMmFiY2E2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2NzNhNTczOThmNThlMGEyN2JlMTY3Y2NmZTM0NGExYjg2MzZmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-17 14:31:47'),('swk7o3p9tjvm5edh2mcquc585d0in88w','YjdkMzg3MGVmNjhiZGM0NTk0NDI0MWQwZjI5NjM0MzJmMmFiY2E2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2NzNhNTczOThmNThlMGEyN2JlMTY3Y2NmZTM0NGExYjg2MzZmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-17 12:34:38'),('ucm9lnrrm7ytdo7gm5y7fhjorgsm92ma','ZTkzMGE2OTkwMzMwNzg5YzU1MzBmNmUxMjY5ZDg1ZmNmNjhhNjExZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjczYTU3Mzk4ZjU4ZTBhMjdiZTE2N2NjZmUzNDRhMWI4NjM2ZmIxIn0=','2019-05-31 03:46:41'),('zxkro0koxhff87x7hu98yth3l3y0z8la','YjdkMzg3MGVmNjhiZGM0NTk0NDI0MWQwZjI5NjM0MzJmMmFiY2E2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2NzNhNTczOThmNThlMGEyN2JlMTY3Y2NmZTM0NGExYjg2MzZmYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-16 09:55:00');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_ipn`
--

DROP TABLE IF EXISTS `paypal_ipn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime DEFAULT NULL,
  `subscr_date` datetime DEFAULT NULL,
  `subscr_effective` datetime DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn`
--

LOCK TABLES `paypal_ipn` WRITE;
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-13 14:24:41
