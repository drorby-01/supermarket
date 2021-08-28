CREATE DATABASE  IF NOT EXISTS `supermarket` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `supermarket`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: supermarket
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_identity` int NOT NULL,
  `cart_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_open` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `client_identity` (`client_identity`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2,316048750,'2021-08-06 17:45:55',0),(30,316048750,'2021-08-20 19:51:08',0),(32,316048750,'2021-08-21 13:09:33',0),(33,316048750,'2021-08-21 13:15:18',0),(34,316048750,'2021-08-21 14:04:08',0),(35,316048750,'2021-08-27 19:16:08',0),(36,316048750,'2021-08-27 19:27:07',0),(37,316048750,'2021-08-27 19:38:09',0),(38,316048750,'2021-08-27 19:41:25',0),(39,316048750,'2021-08-27 19:44:59',0),(40,316048750,'2021-08-27 19:51:52',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartproduct`
--

DROP TABLE IF EXISTS `cartproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartproduct` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `capacity` int NOT NULL,
  `cart_id` int NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `cartproduct_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `cartproduct_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartproduct`
--

LOCK TABLES `cartproduct` WRITE;
/*!40000 ALTER TABLE `cartproduct` DISABLE KEYS */;
INSERT INTO `cartproduct` VALUES (47,1,3,2,'27'),(49,3,9,2,'45'),(50,5,3,2,'18'),(52,1,3,30,'24'),(53,3,5,30,'15'),(54,19,10,30,'80'),(55,1,2,32,'16'),(56,2,4,32,'24'),(57,3,6,32,'18'),(58,4,3,32,'30'),(59,7,2,32,'30'),(61,1,2,33,'16'),(62,1,2,34,'16'),(63,2,4,34,'24'),(64,1,3,35,'24'),(65,1,3,36,'24'),(66,1,2,37,'16'),(67,1,3,38,'24'),(68,1,2,39,'16');
/*!40000 ALTER TABLE `cartproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Milk & Eggs'),(2,'Vegetables & Fruits'),(3,'Meat & Fish');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `identity` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `city` varchar(30) NOT NULL,
  `street` varchar(30) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`identity`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `identity` (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('dror','ben','drorby1997@walla.com','316048750','$2b$10$6e9AwCBhMhDxnJIrNPQcdu4WHca/R5y57XQyjxnIy0GDdeb6xbowy','holon','aaron yariv 12',0),('dror','cohen','drorby1997@gmail.com','316048751','$2b$10$C4af/Isjq4VB3o/O.huQvOVR5Ibj3rVQPviuTWUAAtEgcbx9G9nCq','bat yam','boli 12',1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_identity` varchar(30) NOT NULL,
  `cart_id` int NOT NULL,
  `total_price` int NOT NULL,
  `shipping_city` varchar(40) NOT NULL,
  `shipping_address` varchar(40) NOT NULL,
  `ship_date` date NOT NULL,
  `order_made` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `credit_card` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invitation_ibfk_1` (`cart_id`),
  KEY `client_identity` (`client_identity`),
  CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `invitation_ibfk_2` FOREIGN KEY (`client_identity`) REFERENCES `client` (`identity`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
INSERT INTO `invitation` VALUES (10,'316048750',2,90,'holon','aaron yariv 12','2021-08-21','2021-08-20 19:29:01','4567'),(11,'316048750',30,119,'holon','aaron yariv 12','2021-08-28','2021-08-21 12:43:42','4567'),(12,'316048750',32,118,'holon','aaron yariv 12','2021-08-28','2021-08-21 13:15:06','4567'),(13,'316048750',33,16,'holon','aaron yariv 12','2021-08-28','2021-08-21 14:03:47','2222'),(19,'316048750',39,16,'holon','aaron yariv 12','2021-08-28','2021-08-27 19:45:48','0000');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(30) NOT NULL,
  `category_id` int NOT NULL,
  `price` int NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'milk 3%',1,8,'https://nfarm.co.il/wp-content/uploads/2020/04/%D7%97%D7%9C%D7%91-3-%D7%90%D7%97%D7%95%D7%96.jpg'),(2,'milk 1%',1,6,'https://royalshop.co.il/wp-content/uploads/2020/04/f_5e022dcb9490d_1577201099.jpg'),(3,'milki',1,3,'https://www.strauss-group.co.il/wp-content/blogs.dir/1/files/Milky_shokolad_446x302.jpg'),(4,'Dark Chocolate',1,10,'https://www.amihaimcandies.com/wp-content/uploads/2017/06/7290000170077.jpg'),(5,'Cream cheese 5%',1,6,'https://www.tnuva.co.il/uploads/f_5ed4a98ebd9d6_1590995342.jpg'),(6,'cottage 5%',1,7,'https://chen-chesed.com/wp-content/uploads/2018/03/003754.jpg'),(7,'banana',2,15,'https://st1.foodsd.co.il/Images/Products/large/TeG0ALq4Q0.jpg'),(8,'red apple',2,10,'https://www.shefab.co.il/files/products/product25_image1_2020-08-31_15-13-37.jpg'),(9,'green apple',2,9,'https://d3m9l0v76dty0.cloudfront.net/system/photos/5379472/large/7e7e4c12ee4c4017ee9ce012a311d5d3.jpg'),(10,'strawberry',2,20,'https://st1.foodsd.co.il/Images/Articles/xxl/ediuesa8ll6trsj0.jpg'),(11,'cucumber',2,7,'https://d3m9l0v76dty0.cloudfront.net/system/photos/3809886/large/aad0fb68c0eb3b4eaa236c46b1a81414.jpg'),(12,'lettuce',2,8,'https://www.alehonline.co.il/Images/IMG_5388(1).jpg'),(13,'Steak and chicken',3,30,'https://freshiz.co.il/images/detailed/3/%D7%A1%D7%98%D7%99%D7%99%D7%A7-%D7%A4%D7%A8%D7%92%D7%99%D7%AA.jpg'),(14,'Foie gras',3,40,'https://baladimeat.co.il/wp-content/uploads/2020/10/%D7%9B%D7%91%D7%93-%D7%90%D7%95%D7%95%D7%96.jpg'),(15,'Salmon',3,50,'https://www.ameat.co.il/images/itempics/1254_07092020094425_large.jpg'),(16,'Fillet sol',3,70,'https://www.paskovich.co.il/Warehouse/catalog/items/2c710751-3fec-4fdf-bab4-facc70c3a854.jpg'),(17,'chicken hearts',3,50,'http://www.ynet.co.il/PicServer2/24012010/3076369/shutterstock_6051793_wa.jpg'),(18,'Chicken thighs',3,45,'https://i2.wp.com/www.primaverakitchen.com/wp-content/uploads/2021/05/Garlic-Butter-Chicken-Thighs-Primavera-Kitchen-2.jpg'),(19,'chocolate milk',1,8,'https://www.strauss-group.co.il/wp-content/blogs.dir/1/files/7290003029433-1.png'),(20,'egg',1,2,'https://www.wattagnet.com/ext/resources/Images-by-month-year/19_07/poultry/white-egg-white-bkgrnd.jpg?1562866436');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-28 11:55:58
