-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: examination_system
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `C_CODE` int NOT NULL,
  `D_ID` int DEFAULT NULL,
  `Course_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`C_CODE`),
  KEY `D_ID` (`D_ID`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`D_ID`) REFERENCES `department` (`D_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,1,'database'),(2,1,'html'),(3,2,'css'),(4,2,'css3'),(5,3,'html5');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_student`
--

DROP TABLE IF EXISTS `course_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_student` (
  `ST_ID` int NOT NULL,
  `C_CODE` int NOT NULL,
  `C_evaluate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`C_CODE`,`ST_ID`),
  KEY `ST_ID` (`ST_ID`),
  CONSTRAINT `course_student_ibfk_1` FOREIGN KEY (`ST_ID`) REFERENCES `student` (`ST_ID`),
  CONSTRAINT `course_student_ibfk_2` FOREIGN KEY (`C_CODE`) REFERENCES `course` (`C_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_student`
--

LOCK TABLES `course_student` WRITE;
/*!40000 ALTER TABLE `course_student` DISABLE KEYS */;
INSERT INTO `course_student` VALUES (1,1,'50'),(2,2,'60'),(3,3,'30'),(4,4,'45');
/*!40000 ALTER TABLE `course_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cps`
--

DROP TABLE IF EXISTS `cps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cps` (
  `P_ID` int DEFAULT NULL,
  `ST_ID` int DEFAULT NULL,
  `C_CODE` int DEFAULT NULL,
  `EX_ID` int NOT NULL,
  `EX_Place` varchar(255) DEFAULT NULL,
  `EX_Time` timestamp NULL DEFAULT NULL,
  `c_result` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EX_ID`),
  KEY `C_CODE` (`C_CODE`),
  KEY `P_ID` (`P_ID`),
  KEY `ST_ID` (`ST_ID`),
  CONSTRAINT `cps_ibfk_1` FOREIGN KEY (`C_CODE`) REFERENCES `course` (`C_CODE`),
  CONSTRAINT `cps_ibfk_2` FOREIGN KEY (`P_ID`) REFERENCES `professor` (`P_ID`),
  CONSTRAINT `cps_ibfk_3` FOREIGN KEY (`ST_ID`) REFERENCES `student` (`ST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cps`
--

LOCK TABLES `cps` WRITE;
/*!40000 ALTER TABLE `cps` DISABLE KEYS */;
INSERT INTO `cps` VALUES (1,1,1,1,NULL,NULL,'50'),(1,1,2,2,NULL,NULL,'60'),(1,1,3,3,NULL,NULL,'70'),(1,1,4,4,NULL,NULL,'20'),(1,1,5,5,NULL,NULL,'10'),(2,2,6,6,NULL,NULL,'15');
/*!40000 ALTER TABLE `cps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `D_ID` int NOT NULL,
  `F_ID` int NOT NULL,
  `P_ID_head` int DEFAULT NULL,
  `D_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`D_ID`,`F_ID`),
  KEY `P_ID_head` (`P_ID_head`),
  KEY `F_ID` (`F_ID`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`P_ID_head`) REFERENCES `professor` (`P_ID`),
  CONSTRAINT `department_ibfk_2` FOREIGN KEY (`F_ID`) REFERENCES `faculty` (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,2,1,'mohamed'),(2,3,NULL,'mohamedr'),(3,2,NULL,'mahmoud');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `F_ID` int NOT NULL,
  `F_name` varchar(255) NOT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'ali'),(2,'mohamed'),(3,'islam'),(4,'mahmoud'),(5,'ramy');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `P_ID` int NOT NULL,
  `F_ID` int NOT NULL,
  `D_ID` int DEFAULT NULL,
  `D_name` varchar(255) DEFAULT NULL,
  `P_name` varchar(255) DEFAULT NULL,
  `P_level` varchar(255) DEFAULT NULL,
  `Study_Stage` varchar(255) DEFAULT NULL,
  `Scientific_degree` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`P_ID`,`F_ID`),
  KEY `D_ID` (`D_ID`),
  KEY `F_ID` (`F_ID`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`D_ID`) REFERENCES `department` (`D_ID`),
  CONSTRAINT `professor_ibfk_2` FOREIGN KEY (`F_ID`) REFERENCES `faculty` (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,1,1,'it','ahmed','thired','one','30'),(2,2,2,'itt','ahmedr','thiredf','oner','303'),(4,2,NULL,'itt','ahmedr','thiredf','oner','303');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_student`
--

DROP TABLE IF EXISTS `professor_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_student` (
  `ST_ID` int NOT NULL,
  `P_ID` int NOT NULL,
  `P_evaluate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ST_ID`,`P_ID`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `professor_student_ibfk_1` FOREIGN KEY (`ST_ID`) REFERENCES `student` (`ST_ID`),
  CONSTRAINT `professor_student_ibfk_2` FOREIGN KEY (`P_ID`) REFERENCES `professor` (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_student`
--

LOCK TABLES `professor_student` WRITE;
/*!40000 ALTER TABLE `professor_student` DISABLE KEYS */;
INSERT INTO `professor_student` VALUES (1,1,'68'),(2,2,'74'),(3,3,'49'),(4,4,'96');
/*!40000 ALTER TABLE `professor_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_bank`
--

DROP TABLE IF EXISTS `question_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_bank` (
  `C_CODE` int NOT NULL,
  `Q_ID` int NOT NULL,
  `Q_A` varchar(255) DEFAULT NULL,
  `Q_B` varchar(255) DEFAULT NULL,
  `Q_C` varchar(255) DEFAULT NULL,
  `Correct_Choose` varchar(255) NOT NULL,
  PRIMARY KEY (`C_CODE`,`Q_ID`),
  CONSTRAINT `question_bank_ibfk_1` FOREIGN KEY (`C_CODE`) REFERENCES `course` (`C_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_bank`
--

LOCK TABLES `question_bank` WRITE;
/*!40000 ALTER TABLE `question_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ST_ID` int NOT NULL,
  `F_ID` int NOT NULL,
  `ST_name` varchar(255) DEFAULT NULL,
  `ST_level` varchar(255) DEFAULT NULL,
  `ST_Study_Stage` varchar(255) DEFAULT NULL,
  `ST_Scientific_degree` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ST_ID`,`F_ID`),
  KEY `F_ID` (`F_ID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`F_ID`) REFERENCES `faculty` (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,1,'islam',NULL,NULL,'50'),(2,2,'mohamed',NULL,NULL,'60'),(3,3,'kero',NULL,NULL,'70'),(4,4,'seham',NULL,NULL,'80'),(5,5,'nashaat',NULL,NULL,'10');
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

-- Dump completed on 2022-05-30  0:02:28
