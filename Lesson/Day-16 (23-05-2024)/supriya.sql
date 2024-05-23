-- MySQL dump 10.13  Distrib 5.5.35, for Win64 (x86)
--
-- Host: localhost    Database: supriya
-- ------------------------------------------------------
-- Server version	5.5.35

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(15) NOT NULL,
  `dept_abbr` varchar(15) NOT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`),
  UNIQUE KEY `dept_abbr` (`dept_abbr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designation` (
  `desig_id` int(10) NOT NULL AUTO_INCREMENT,
  `desig_desc` varchar(15) NOT NULL,
  `desig_abbr` varchar(15) NOT NULL,
  PRIMARY KEY (`desig_id`),
  UNIQUE KEY `desig_desc` (`desig_desc`),
  UNIQUE KEY `desig_abbr` (`desig_abbr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `emp_id` int(6) DEFAULT NULL,
  `emp_name` varchar(15) DEFAULT NULL,
  `gender` enum('F','M','O') DEFAULT NULL,
  `desig_id` int(10) DEFAULT NULL,
  `dept_id` int(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `high_qualif` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `lang_id` int(6) NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(30) NOT NULL,
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `lang_name` (`lang_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'English'),(5,'Gujrati'),(2,'Hindi'),(3,'Odia'),(4,'Tamil');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualification` (
  `qualif_id` int(6) NOT NULL AUTO_INCREMENT,
  `qualif_desc` varchar(30) NOT NULL,
  `qualif_abbr` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`qualif_id`),
  UNIQUE KEY `qualif_desc` (`qualif_desc`),
  UNIQUE KEY `qualif_abbr` (`qualif_abbr`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification`
--

LOCK TABLES `qualification` WRITE;
/*!40000 ALTER TABLE `qualification` DISABLE KEYS */;
INSERT INTO `qualification` VALUES (1,'Under class 10','<10'),(2,'Higher Secondary Certificate','HSC'),(3,'Intermediate','+2'),(4,'Bachelor Degree','+3'),(5,'Master Degree','Mast'),(6,'Doctrate Degree','PhD');
/*!40000 ALTER TABLE `qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume`
--

DROP TABLE IF EXISTS `resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resume` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Father` varchar(30) DEFAULT NULL,
  `Gender` enum('F','M','O') DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  `Photo` longblob,
  `Mobile` varchar(10) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `qualif_id` int(6) NOT NULL,
  `lang_id` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume`
--

LOCK TABLES `resume` WRITE;
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
INSERT INTO `resume` VALUES (1,'Milan Das','Suryanarayan Das','M','1990-10-05',NULL,'8249889624','Bhubaneswar',6,1),(2,'Pooja Singh','Ajay Kumar Singh','F','1996-02-16',NULL,'8249876924','Angul',5,2),(3,'Sunita Behera','Jyoti Ranjan Behera','M','1992-04-08',NULL,'9938410769','Talchar',4,3),(4,'Abhishek Pradhan','Satyabrat Pradhan','M','1998-03-10',NULL,'7008610537','Koraput',3,4),(5,'Riya Gupta','Virendra Gupta','M','1989-01-12',NULL,'7009610352','Delhi',2,5);
/*!40000 ALTER TABLE `resume` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 10:28:52
