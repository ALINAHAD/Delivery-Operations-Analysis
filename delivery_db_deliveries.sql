-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: delivery_db
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
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `shipment_id` text,
  `order_id` text,
  `order_date` text,
  `origin_city` text,
  `origin_pincode` int DEFAULT NULL,
  `destination_city` text,
  `destination_pincode` int DEFAULT NULL,
  `partner_id` text,
  `pickup_time` text,
  `processing_center_time` text,
  `dispatch_time` text,
  `out_for_delivery_time` text,
  `delivered_time` text,
  `delivery_status` text,
  `distance_km` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES ('SHP0001','ORD1001','2025-09-01 08:12:00','Delhi',110001,'Mumbai',400001,'PRT01','2025-09-01 10:30:00','2025-09-01 14:00:00','2025-09-02 06:00:00','2025-09-02 09:30:00','2025-09-02 15:10:00','Delivered',1420),('SHP0002','ORD1002','2025-09-01 09:00:00','Delhi',110002,'Chennai',600001,'PRT02','2025-09-01 13:00:00','2025-09-01 18:00:00','2025-09-02 07:00:00','2025-09-02 12:00:00','','Failed',2180),('SHP0003','ORD1003','2025-09-02 11:20:00','Noida',201301,'Ahmedabad',380001,'PRT03','2025-09-02 15:00:00','2025-09-02 20:00:00','2025-09-03 05:30:00','2025-09-03 09:00:00','2025-09-03 11:45:00','Delivered',900),('SHP0004','ORD1004','2025-09-03 07:45:00','Gurgaon',122001,'Jaipur',302001,'PRT01','2025-09-03 09:00:00','2025-09-03 12:45:00','2025-09-03 20:00:00','2025-09-04 08:00:00','2025-09-04 10:00:00','Delivered',300);
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-23 16:11:05
