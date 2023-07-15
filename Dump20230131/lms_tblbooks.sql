-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: lms
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `tblbooks`
--

DROP TABLE IF EXISTS `tblbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblbooks` (
  `BookId` int NOT NULL AUTO_INCREMENT,
  `StudentId` varchar(45) DEFAULT NULL,
  `BookName` varchar(255) NOT NULL,
  `CatId` int NOT NULL,
  `AuthId` int NOT NULL,
  `ISBNNumber` varchar(25) NOT NULL,
  `BookPrice` decimal(10,2) DEFAULT NULL,
  `bookImage` varchar(250) DEFAULT NULL,
  `isIssued` int DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`BookId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbooks`
--

LOCK TABLES `tblbooks` WRITE;
/*!40000 ALTER TABLE `tblbooks` DISABLE KEYS */;
INSERT INTO `tblbooks` VALUES (1,'SID001','God of Small Things',1,10,'BKIN500',500.00,'The-God-of-Small-Things-1.jpg',1,'2023-01-28 13:20:52','2023-01-30 19:06:48'),(2,'SID002','Physics',3,3,'1111',150.00,'dd8267b57e0e4feee5911cb1e1a03a79.jpg',0,'2022-01-22 01:53:03','2023-01-30 18:58:26'),(3,'SID005','Murach\'s MySQL',6,6,'9350237695',455.00,'5939d64655b4d2ae443830d73abc35b6.jpg',1,'2022-01-21 11:12:11','2023-01-27 20:00:12'),(4,'SID004','WordPress for Beginners 2022: A Visual Step-by-Step Guide to Mastering WordPress',6,1,'B019MO3WCM',100.00,'144ab706ba1cb9f6c23fd6ae9c0502b3.jpg',NULL,'2022-01-22 01:46:07','2022-01-22 01:50:49'),(5,'SID004','WordPress Mastery Guide:',6,7,'B09NKWH7NP',53.00,'90083a56014186e88ffca10286172e64.jpg',NULL,'2022-01-22 01:48:03','2022-01-22 01:50:58'),(6,'SID001','Rich Dad Poor Dad: What the Rich Teach Their Kids About Money That the Poor and Middle Class Do Not',1,4,'B07C7M8SX9',120.00,'52411b2bd2a6b2e0df3eb10943a5b640.jpg',NULL,'2022-01-22 01:50:39',NULL),(7,'SID001','The Girl Who Drank the Moon',1,5,'1848126476',200.00,'f05cd198ac9335245e1fdffa793207a7.jpg',NULL,'2022-01-22 01:52:33',NULL),(8,'SID007','C++: The Complete Reference, 4th Edition',6,8,'007053246X',142.00,'36af5de9012bf8c804e499dc3c3b33a5.jpg',0,'2022-01-22 01:53:36','2023-01-28 09:25:03'),(9,'SID003','ASP.NET Core 5 for Beginners',6,9,'GBSJ36344563',422.00,'b1b6788016bbfab12cfd2722604badc9.jpg',0,'2022-01-22 02:44:21','2022-01-22 02:45:23'),(10,'SID006','PHP And MySql programming',6,2,'222333',100.00,'1efecc0ca822e40b7b673c0d79ae943f.jpg',NULL,'2023-01-28 13:20:52','2023-01-30 18:14:21'),(11,'SID001','Shape of good things to Come',7,11,'BKIN111',350.00,'Hgwellsshape.png',0,'2023-01-28 13:20:52','2023-01-30 19:39:09');
/*!40000 ALTER TABLE `tblbooks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-31 23:55:36
