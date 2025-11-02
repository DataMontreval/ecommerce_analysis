-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_analysis
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `signup_date` date DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Alice','Johnson','alice.johnson@example.com','2023-01-15','North America'),(2,'Bob','Smith','bob.smith@example.com','2023-02-20','Europe'),(3,'Clara','Brown','clara.brown@example.com','2023-03-12','Asia'),(4,'David','Miller','david.miller@example.com','2023-04-08','South America'),(5,'Emma','Davis','emma.davis@example.com','2023-05-19','Europe'),(6,'Frank','Wilson','frank.wilson@example.com','2023-06-03','North America'),(7,'Grace','Taylor','grace.taylor@example.com','2023-07-07','Oceania'),(8,'Henry','Anderson','henry.anderson@example.com','2023-08-12','Asia'),(9,'Ivy','Clark','ivy.clark@example.com','2023-09-15','North America'),(10,'Jack','Lopez','jack.lopez@example.com','2023-10-10','Europe'),(11,'Kylie','White','kylie.white@example.com','2023-11-01','South America'),(12,'Liam','Hall','liam.hall@example.com','2023-11-05','Europe');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,89.99),(2,1,9,2,29.99),(3,2,2,1,59.99),(4,3,6,1,39.99),(5,3,1,1,89.99),(6,4,11,2,22.50),(7,4,12,1,29.99),(8,5,13,1,27.75),(9,5,1,1,89.99),(10,6,7,1,54.99),(11,6,6,1,39.99),(12,7,10,1,129.99),(13,8,2,2,59.99),(14,9,5,2,24.99),(15,10,13,1,27.75),(16,10,3,1,39.99),(17,11,12,1,29.99),(18,11,7,1,54.99),(19,12,1,2,89.99),(20,13,1,1,89.99),(21,14,2,2,59.99),(22,14,13,1,27.75),(23,15,6,3,39.99),(24,15,9,1,29.99),(25,16,4,1,49.99),(26,17,8,2,22.50),(27,17,2,1,59.99),(28,18,11,1,22.50),(29,19,12,1,29.99),(30,20,3,1,39.99),(31,21,10,1,129.99),(32,21,1,1,89.99),(33,22,5,2,24.99),(34,23,13,1,27.75),(35,23,4,1,49.99),(36,24,2,1,59.99),(37,25,6,1,39.99),(38,26,9,1,29.99),(39,27,3,1,39.99),(40,28,1,2,89.99),(41,29,8,1,22.50),(42,30,2,2,59.99),(43,30,11,1,22.50),(44,30,13,1,27.75),(45,29,5,1,24.99),(46,28,12,1,29.99);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2024-01-20',149.98,'Completed'),(2,2,'2024-02-25',59.99,'Completed'),(3,3,'2024-03-18',129.98,'Completed'),(4,4,'2024-04-12',79.98,'Completed'),(5,5,'2024-05-22',350.00,'Completed'),(6,6,'2024-06-08',210.00,'Completed'),(7,7,'2024-07-15',159.99,'Pending'),(8,8,'2024-08-18',134.49,'Completed'),(9,9,'2024-09-19',59.98,'Completed'),(10,10,'2024-10-14',249.99,'Completed'),(11,11,'2024-11-02',375.00,'Pending'),(12,12,'2024-11-08',260.00,'Completed'),(13,1,'2024-12-01',89.99,'Completed'),(14,5,'2024-12-10',129.98,'Completed'),(15,7,'2024-12-20',229.97,'Completed'),(16,3,'2024-11-21',59.98,'Completed'),(17,8,'2024-10-30',199.98,'Completed'),(18,2,'2024-09-05',49.99,'Completed'),(19,4,'2024-08-08',119.97,'Completed'),(20,6,'2024-07-22',90.00,'Completed'),(21,9,'2024-06-11',59.99,'Completed'),(22,10,'2024-05-30',159.98,'Completed'),(23,11,'2024-04-25',89.98,'Completed'),(24,12,'2024-03-02',29.99,'Completed'),(25,1,'2024-02-05',59.98,'Completed'),(26,2,'2024-03-14',199.97,'Completed'),(27,3,'2024-04-01',329.97,'Completed'),(28,4,'2024-05-11',89.99,'Completed'),(29,5,'2024-06-01',45.98,'Completed'),(30,6,'2024-07-01',119.99,'Completed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(30) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `category` varchar(80) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'ELEC001','Wireless Headphones','Electronics',89.99),(2,'ELEC002','Bluetooth Speaker','Electronics',59.99),(3,'HOME001','Aroma Diffuser','Home',39.99),(4,'HOME002','Smart Lamp','Home',49.99),(5,'SPORT001','Yoga Mat','Sports',24.99),(6,'SPORT002','Water Bottle','Sports',19.99),(7,'CLOTH001','Hoodie','Clothing',54.99),(8,'CLOTH002','Sneakers','Clothing',79.99),(9,'TECH001','Power Bank','Electronics',29.99),(10,'TECH002','Smart Watch','Electronics',129.99),(11,'OFF001','Desk Organizer','Office',22.50),(12,'OFF002','Laptop Stand','Office',29.99),(13,'GADG001','Wireless Charger','Gadgets',27.75);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-02 19:32:08
