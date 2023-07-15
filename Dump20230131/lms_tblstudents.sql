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
-- Table structure for table `tblstudents`
--

DROP TABLE IF EXISTS `tblstudents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblstudents` (
  `StudentId` varchar(100) NOT NULL,
  `FullName` varchar(120) NOT NULL,
  `EmailId` varchar(120) NOT NULL,
  `MobileNumber` varchar(120) NOT NULL,
  `Password` varchar(120) NOT NULL,
  `Status` int DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`StudentId`),
  UNIQUE KEY `StudentId_UNIQUE` (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstudents`
--

LOCK TABLES `tblstudents` WRITE;
/*!40000 ALTER TABLE `tblstudents` DISABLE KEYS */;
INSERT INTO `tblstudents` VALUES ('SID001','Mandar More','morem009@gmail.com','8097494627','1234',1,'2023-01-19 16:55:55','2023-01-31 17:56:31'),('SID002','Raj Wagholikar','rajw@gmail.com','9865472555','1234',1,'2022-01-02 01:53:03','2023-01-19 17:00:54'),('SID003','Siddhesh Ghule','sidg@gmail.com','8569710025','1234',1,'2022-01-02 01:53:03','2023-01-19 17:19:57'),('SID004','Sarang Waje','sarangw@gmail.com','2359874527','1234',1,'2022-01-02 01:53:03','2023-01-19 17:19:57'),('SID005','Krunal Raut','krunalr@gmail.com','8585856224','1234',1,'2022-01-02 01:53:03','2023-01-19 17:19:57'),('SID006','Piyush Vaidya','piyushv@gmail.com','4672423754','1234',1,'2022-01-02 01:53:03','2023-01-28 09:17:44'),('SID007','Yash Pednekar','yashp@gmail.com','1234569870','1234',1,'2022-01-22 02:46:18','2023-01-19 17:19:57');
/*!40000 ALTER TABLE `tblstudents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-31 23:55:35
