-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: company
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
  `dname` varchar(64) DEFAULT NULL,
  `dno` int(11) NOT NULL,
  `mgr_ssn` int(11) DEFAULT NULL,
  `mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`dno`),
  KEY `mgr_ssn` (`mgr_ssn`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`mgr_ssn`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Headquarters',1,888665555,'1981-06-19'),('Administration',4,987654321,'1995-01-01'),('Research',5,333445555,'1988-05-22');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependent` (
  `essn` int(11) DEFAULT NULL,
  `dependent_name` varchar(64) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `relationship` varchar(64) DEFAULT NULL,
  KEY `essn` (`essn`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES (333445555,'Alice','F','1986-04-05','D'),(333445555,'Theodore','M','1983-04-05','S'),(333445555,'Joy','F','1958-04-05','Spouse'),(987654321,'Abner','M','1942-04-05','Spouse'),(123456789,'Michael','M','1988-04-05','S'),(123456789,'Alice','F','1988-12-05','D'),(123456789,'Elizabeth','F','1967-12-05','Spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept_locations` (
  `dno` int(11) DEFAULT NULL,
  `dlocation` varchar(64) DEFAULT NULL,
  KEY `dno` (`dno`),
  CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Houston'),(4,'Stafford'),(5,'Bellaire'),(5,'Sugarland'),(5,'Houston');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `fname` varchar(64) DEFAULT NULL,
  `minit` varchar(2) DEFAULT NULL,
  `lname` varchar(64) DEFAULT NULL,
  `ssn` int(11) NOT NULL,
  `bdate` date DEFAULT NULL,
  `address` text,
  `sex` varchar(2) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `super_ssn` int(11) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('John','B','Smith',123456789,'1965-01-09','johns add','M',30000,333445555,5),('Franklin','T','Wong',333445555,'1955-12-08','franks add','M',40000,888665555,5),('Joyce','A','English',453453453,'1972-01-19','joyce address','M',25000,333445555,5),('Ramesh','K','Narayan',666884444,'1962-01-19','rameshs address','M',38000,333445555,5),('James','E','Borg',888665555,'1937-11-10','james add','M',55000,NULL,1),('Jennifer','S','W',987654321,'1948-01-19','jenns address','F',43000,888665555,4),('Ahmad','V','Jabbar',987987987,'1969-01-19','ahmads address','M',25000,987654321,4),('Alicia','J','Zelaya',999887777,'1968-01-19','alicias address','F',25000,987654321,4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `pname` varchar(64) DEFAULT NULL,
  `pno` int(11) NOT NULL,
  `plocation` varchar(64) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`pno`),
  KEY `dno` (`dno`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('X',1,'Bellaire',5),('Y',2,'Sugarland',5),('Z',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganisation',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works_on` (
  `essn` int(11) DEFAULT NULL,
  `pno` int(11) DEFAULT NULL,
  `hours` float DEFAULT NULL,
  KEY `pno` (`pno`),
  KEY `essn` (`essn`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`pno`) REFERENCES `project` (`pno`),
  CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES (666884444,3,40),(123456789,1,32.5),(123456789,2,7.5),(453453453,1,20),(453453453,2,20),(333445555,2,10),(333445555,3,10),(333445555,10,10),(333445555,20,10),(999887777,30,30),(999887777,10,10),(987987987,30,5),(987987987,10,35),(987987987,30,20),(987987987,20,15),(888665555,20,NULL);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-26 20:39:10
