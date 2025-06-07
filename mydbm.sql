-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `attendence`
--

DROP TABLE IF EXISTS `attendence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendence` (
  `attendence_ID` int NOT NULL,
  `attendence_ver` int NOT NULL,
  `attendence_status` varchar(35) NOT NULL,
  `student_number` int NOT NULL,
  `date_ID` int NOT NULL,
  `lecturer_ID` int NOT NULL,
  PRIMARY KEY (`attendence_ID`,`attendence_ver`),
  KEY `fk_Attendence_Student1_idx` (`student_number`),
  KEY `fk_Attendence_Date1_idx` (`date_ID`),
  KEY `fk_Attendence_Lecturer1_idx` (`lecturer_ID`),
  CONSTRAINT `fk_Attendence_Date1` FOREIGN KEY (`date_ID`) REFERENCES `date` (`date_ID`),
  CONSTRAINT `fk_Attendence_Lecturer1` FOREIGN KEY (`lecturer_ID`) REFERENCES `lecturer` (`lecturer_ID`),
  CONSTRAINT `fk_Attendence_Student1` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendence`
--

LOCK TABLES `attendence` WRITE;
/*!40000 ALTER TABLE `attendence` DISABLE KEYS */;
INSERT INTO `attendence` VALUES (21,4648,'attended',41634802,11,2),(101,1820,'attended',38391716,11,1),(121,2224,'not attended',41634802,11,1),(123,1012,'not attended',37778412,11,1),(123,1416,'attended',38246538,11,1),(123,2468,'attended',38924552,11,1),(123,2628,'not attended',44653603,11,1),(123,3032,'attended',46533605,11,1),(456,3436,'attended',46533605,11,2),(456,3840,'attended',46533605,11,2),(456,4244,'attended',44653603,11,2),(456,5052,'attended',38246538,11,2);
/*!40000 ALTER TABLE `attendence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date` (
  `date_ID` int NOT NULL,
  `attend_day` int NOT NULL,
  `attend_month` int NOT NULL,
  `attend_year` int NOT NULL,
  PRIMARY KEY (`date_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES (11,1,6,2025),(12,2,6,2025);
/*!40000 ALTER TABLE `date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `lecturer_ID` int NOT NULL,
  `lectureer_Fname` varchar(20) NOT NULL,
  `lecturer_Lname` varchar(20) NOT NULL,
  `lecturer_email` varchar(35) NOT NULL,
  PRIMARY KEY (`lecturer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES (1,'Francis','Lugayizi','fracis.lugayizi@nwu.ac.za'),(2,'Reorapetse','Molose','reorapetse.molose@nwu.ac.za');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `report_ID` int NOT NULL,
  `total_absentism` int NOT NULL,
  `total_present` int NOT NULL,
  `date_ID` int NOT NULL,
  `attendendce_ID` int NOT NULL,
  PRIMARY KEY (`report_ID`),
  KEY `fk_Report_Date1_idx` (`date_ID`),
  KEY `fk_Report_Attendence1_idx` (`attendendce_ID`),
  CONSTRAINT `fk_Report_Attendence1` FOREIGN KEY (`attendendce_ID`) REFERENCES `attendence` (`attendence_ID`),
  CONSTRAINT `fk_Report_Date1` FOREIGN KEY (`date_ID`) REFERENCES `date` (`date_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (135,2,3,11,123),(136,0,4,11,456);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_number` int NOT NULL,
  `student_Fname` varchar(20) NOT NULL,
  `student_Lname` varchar(20) NOT NULL,
  `student_email` varchar(35) NOT NULL,
  PRIMARY KEY (`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (37302205,'Junior','Mutisse','juniormutisse@gmail.com'),(37778412,'Layola','Bera','layolabera@gmail.com'),(38246538,'Mbasa','Besong','mbasabesong@gmail.com'),(38391716,'Tsholofelo','Modisapudi','tsholofelomodisapudi@gmail.com'),(38924552,'Oboikanyo','Phiri','phirioboikanyo@gmail.com'),(41634802,'Nqobile','Msiza','nqobilemsiza@gmail.com'),(44653603,'Mpumelelo','Ndlovhu','mpumelelondlochu@gmail.com'),(46533605,'Gert','Moiloa','gertmoiloa@gmail.com');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-11 23:57:10
