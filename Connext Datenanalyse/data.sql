-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dbo.DIAGNOSEN`
--

DROP TABLE IF EXISTS `dbo.DIAGNOSEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
--!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.DIAGNOSEN` (
  `Id` varchar(0) DEFAULT NULL,
  `KlientId` varchar(0) DEFAULT NULL,
  `GiltAb` varchar(0) DEFAULT NULL,
  `GiltBis` varchar(0) DEFAULT NULL,
  `Bezeichnung` varchar(0) DEFAULT NULL,
  `Code` varchar(0) DEFAULT NULL,
  `Status` varchar(0) DEFAULT NULL,
  `StatusName` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.DIAGNOSEN`
--

LOCK TABLES `dbo.DIAGNOSEN` WRITE;
/*!40000 ALTER TABLE `dbo.DIAGNOSEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbo.DIAGNOSEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.MEDIKAMENTGABEN`
--

DROP TABLE IF EXISTS `dbo.MEDIKAMENTGABEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.MEDIKAMENTGABEN` (
  `Id` int(11) DEFAULT NULL,
  `KlientId` mediumint(9) DEFAULT NULL,
  `Datum` varchar(19) DEFAULT NULL,
  `Zeitpunkt` varchar(19) DEFAULT NULL,
  `Bezeichnung` varchar(115) DEFAULT NULL,
  `PZN` varchar(9) DEFAULT NULL,
  `Menge` mediumint(9) DEFAULT NULL,
  `Einheit` varchar(9) DEFAULT NULL,
  `AtcCode` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.MEDIKAMENTGABEN`
--

LOCK TABLES `dbo.MEDIKAMENTGABEN` WRITE;
/*!40000 ALTER TABLE `dbo.MEDIKAMENTGABEN` DISABLE KEYS */;
INSERT INTO `dbo.MEDIKAMENTGABEN` VALUES (1,510,'2007-07-09 00:00:00','2007-07-09 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(2,510,'2007-07-09 00:00:00','2007-07-09 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(3,510,'2007-07-09 00:00:00','2007-07-09 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(4,510,'2007-07-10 00:00:00','2007-07-10 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(5,510,'2007-07-10 00:00:00','2007-07-10 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(6,510,'2007-07-10 00:00:00','2007-07-10 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(7,510,'2007-07-11 00:00:00','2007-07-11 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(8,510,'2007-07-12 00:00:00','2007-07-12 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(9,510,'2007-07-12 00:00:00','2007-07-12 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(10,510,'2007-07-12 00:00:00','2007-07-12 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(11,510,'2007-07-13 00:00:00','2007-07-13 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(12,510,'2007-07-13 00:00:00','2007-07-13 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(13,510,'2007-07-14 00:00:00','2007-07-14 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(14,510,'2007-07-14 00:00:00','2007-07-14 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(15,510,'2007-07-14 00:00:00','2007-07-14 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(16,510,'2007-07-15 00:00:00','2007-07-15 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(17,510,'2007-07-15 00:00:00','2007-07-15 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(18,510,'2007-07-15 00:00:00','2007-07-15 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(19,510,'2007-07-16 00:00:00','2007-07-16 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(20,510,'2007-07-08 00:00:00','2007-07-08 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(21,510,'2007-07-08 00:00:00','2007-07-08 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(22,510,'2007-07-08 00:00:00','2007-07-08 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(23,510,'2007-07-07 00:00:00','2007-07-07 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(24,510,'2007-07-07 00:00:00','2007-07-07 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(25,510,'2007-07-07 00:00:00','2007-07-07 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(26,510,'2007-07-06 00:00:00','2007-07-06 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(27,510,'2007-07-06 00:00:00','2007-07-06 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(28,510,'2007-07-06 00:00:00','2007-07-06 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(29,510,'2007-07-05 00:00:00','2007-07-05 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(30,510,'2007-07-05 00:00:00','2007-07-05 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(31,510,'2007-07-05 00:00:00','2007-07-05 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(32,510,'2007-07-04 00:00:00','2007-07-04 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(33,510,'2007-07-04 00:00:00','2007-07-04 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(34,510,'2007-07-04 00:00:00','2007-07-04 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(35,510,'2007-07-03 00:00:00','2007-07-03 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(36,510,'2007-07-03 00:00:00','2007-07-03 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(37,510,'2007-07-03 00:00:00','2007-07-03 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(38,510,'2007-07-02 00:00:00','2007-07-02 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(39,510,'2007-07-02 00:00:00','2007-07-02 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(40,510,'2007-07-02 00:00:00','2007-07-02 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(41,510,'2007-07-01 00:00:00','2007-07-01 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(42,510,'2007-07-01 00:00:00','2007-07-01 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(43,510,'2007-07-01 00:00:00','2007-07-01 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(44,510,'2007-07-17 00:00:00','2007-07-17 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(45,510,'2007-07-17 00:00:00','2007-07-17 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(46,510,'2007-07-17 00:00:00','2007-07-17 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(47,510,'2007-07-18 00:00:00','2007-07-18 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(48,510,'2007-07-19 00:00:00','2007-07-19 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(49,510,'2007-07-19 00:00:00','2007-07-19 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(50,510,'2007-07-19 00:00:00','2007-07-19 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(51,510,'2007-07-20 00:00:00','2007-07-20 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(52,510,'2007-07-26 00:00:00','2007-07-26 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(53,510,'2007-07-27 00:00:00','2007-07-27 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(54,510,'2007-07-27 00:00:00','2007-07-27 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(55,510,'2007-07-27 00:00:00','2007-07-27 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(56,510,'2007-07-20 00:00:00','2007-07-20 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(57,510,'2007-07-20 00:00:00','2007-07-20 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(58,510,'2007-07-21 00:00:00','2007-07-21 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(59,510,'2007-07-31 00:00:00','2007-07-31 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(60,510,'2007-07-31 00:00:00','2007-07-31 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(61,510,'2007-07-21 00:00:00','2007-07-21 18:00:00','Insuman Comb 25/75 100I.E./ml Patrone ZAM','08922897',20,'IE',''),(62,510,'2007-07-21 00:00:00','2007-07-21 18:00:00','Betagalen 0,1% SAL','06880338',1,'g',''),(63,510,'2007-07-22 00:00:00','2007-07-22 06:30:00','Betagalen 0,1% SAL','06880338',1,'g',''),(64,690,'2007-07-03 00:00:00','2007-07-03 06:30:00','Digimerck minor 0,07mg TAB','02204770',1,'Stck',''),(65,690,'2007-07-03 00:00:00','2007-07-03 06:30:00','Acerbon 10 TAB','03557708',1,'Stck',''),(66,690,'2007-07-04 00:00:00','2007-07-04 06:30:00','Digimerck minor 0,07mg TAB','02204770',1,'Stck',''),(67,690,'2007-07-04 00:00:00','2007-07-04 06:30:00','Acerbon 10 TAB','03557708',1,'Stck',''),(68,690,'2007-07-05 00:00:00','2007-07-05 06:30:00','Digimerck minor 0,07mg TAB','02204770',1,'Stck',''),(69,476,'2007-07-14 00:00:00','2007-07-14 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(70,476,'2007-07-14 00:00:00','2007-07-14 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(71,476,'2007-07-15 00:00:00','2007-07-15 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(72,476,'2007-07-15 00:00:00','2007-07-15 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(73,476,'2007-07-16 00:00:00','2007-07-16 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(74,476,'2007-07-16 00:00:00','2007-07-16 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(75,476,'2007-07-17 00:00:00','2007-07-17 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(76,476,'2007-07-17 00:00:00','2007-07-17 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(77,476,'2007-07-18 00:00:00','2007-07-18 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(78,476,'2007-07-18 00:00:00','2007-07-18 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(79,476,'2007-07-19 00:00:00','2007-07-19 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(80,476,'2007-07-19 00:00:00','2007-07-19 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(81,476,'2007-07-13 00:00:00','2007-07-13 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(82,476,'2007-07-13 00:00:00','2007-07-13 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(83,476,'2007-07-12 00:00:00','2007-07-12 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(84,476,'2007-07-12 00:00:00','2007-07-12 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(85,476,'2007-07-20 00:00:00','2007-07-20 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(86,476,'2007-07-22 00:00:00','2007-07-22 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(87,476,'2007-07-23 00:00:00','2007-07-23 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(88,476,'2007-07-23 00:00:00','2007-07-23 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(89,476,'2007-07-24 00:00:00','2007-07-24 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(90,476,'2007-07-24 00:00:00','2007-07-24 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(91,476,'2007-07-25 00:00:00','2007-07-25 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(92,476,'2007-07-25 00:00:00','2007-07-25 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(93,476,'2007-07-26 00:00:00','2007-07-26 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(94,476,'2007-07-26 00:00:00','2007-07-26 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(95,476,'2007-07-27 00:00:00','2007-07-27 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(96,476,'2007-07-27 00:00:00','2007-07-27 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(97,476,'2007-07-28 00:00:00','2007-07-28 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(98,476,'2007-07-28 00:00:00','2007-07-28 18:00:00','Vagantin UTA','01071054',1,'Stck',''),(99,476,'2007-07-29 00:00:00','2007-07-29 06:30:00','Vagantin UTA','01071054',1,'Stck',''),(100,476,'2007-07-29 00:00:00','2007-07-29 18:00:00','Vagantin UTA','01071054',1,'Stck','');
/*!40000 ALTER TABLE `dbo.MEDIKAMENTGABEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.MEDIKAMENTINHALTSSTOFFE`
--

DROP TABLE IF EXISTS `dbo.MEDIKAMENTINHALTSSTOFFE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.MEDIKAMENTINHALTSSTOFFE` (
  `Id` mediumint(9) DEFAULT NULL,
  `PZN` int(11) DEFAULT NULL,
  `Bezeichnung` varchar(138) DEFAULT NULL,
  `Menge` varchar(8) DEFAULT NULL,
  `Einheit` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.MEDIKAMENTINHALTSSTOFFE`
--

LOCK TABLES `dbo.MEDIKAMENTINHALTSSTOFFE` WRITE;
/*!40000 ALTER TABLE `dbo.MEDIKAMENTINHALTSSTOFFE` DISABLE KEYS */;
INSERT INTO `dbo.MEDIKAMENTINHALTSSTOFFE` VALUES (1,599907,'Enalapril maleat','5.0','mg'),(2,600651,'Clemastin fumarat','1.338','mg'),(3,601432,'Lisinopril-2-Wasser','5.44','mg'),(4,605772,'Carbamazepin','200.0','mg'),(5,607417,'Carbamazepin','200.0','mg'),(6,612275,'Risperidon','37.5','mg'),(7,614096,'Carbamazepin','400.0','mg'),(8,624373,'Carbidopa-1-Wasser','26.99','mg'),(9,624373,'Levodopa','100.0','mg'),(10,634271,'Trimipramin mesilat','53.06','mg'),(11,636287,'Calcium pantothenat','0.0',''),(12,636287,'Thiamin','4.2','mg'),(13,636287,'Riboflavin','4.8','mg'),(14,636287,'Pyridoxin','6.0','mg'),(15,636287,'Cyanocobalamin','0.003','mg'),(16,636287,'Folsäure','0.4','mg'),(17,636287,'Nicotinamid','0.0',''),(18,638234,'Enalapril maleat','10.0','mg'),(19,647078,'Flecainid acetat','100.0','mg'),(20,659727,'Melperon hydrochlorid','25.0','mg'),(21,663344,'Enalapril maleat','10.0','mg'),(22,668732,'Ipratropium bromid-1-Wasser','0.261','mg'),(23,672194,'Brinzolamid','10.0','mg'),(24,672194,'Timolol hydrogenmaleat','6.83','mg'),(25,679374,'Eucalyptusöl','100.0','mg'),(26,679374,'Kiefernnadelöl','30.0','mg'),(27,679612,'Bifonazol','10.0','mg'),(28,682761,'Clozapin','200.0','mg'),(29,683499,'Fentanyl','17.34','mg'),(30,1894117,'Glycopyrronium bromid','0.2','mg'),(31,1894962,'Betamethason dipropionat','0.64','mg'),(32,1894962,'Gentamicin sulfat','1.67','mg'),(33,1900332,'Ethacridin lactat-1-Wasser','50.0','mg'),(34,1900332,'Tannin-Eiweiß','500.0','mg'),(35,1900349,'Tannin-Eiweiß','500.0','mg'),(36,1900349,'Ethacridin lactat-1-Wasser','50.0','mg'),(37,1900527,'Finasterid','5.0','mg'),(38,1909126,'Hydromorphon hydrochlorid','8.72','mg'),(39,1912074,'Oxycodon hydrochlorid','20.0','mg'),(40,1959242,'Ofloxacin','3.0','mg'),(41,1969973,'Ciprofloxacin hydrochlorid-1-Wasser','582.21','mg'),(42,1970574,'Moxifloxacin hydrochlorid','436.33','mg'),(43,1975206,'Zolpidem hemitartrat','10.0','mg'),(44,1983625,'Ramipril','5.0','mg'),(45,1983654,'Ramipril','10.0','mg'),(46,1986664,'Naloxon hydrochlorid-2-Wasser','4.4','mg'),(47,1986664,'Tilidin hydrochlorid-0,5-Wasser','51.45','mg'),(48,1993753,'Isosorbid dinitrat','40.0','mg'),(49,2004143,'Naloxon hydrochlorid-2-Wasser','8.8','mg'),(50,2004143,'Tilidin hydrochlorid-0,5-Wasser','102.91','mg'),(51,2011901,'Fluoxetin hydrochlorid','22.36','mg'),(52,3409847,'Cineol','150.0','mg'),(53,3417858,'Clindamycin hydrochlorid-1-Wasser','0.0',''),(54,3417976,'Pravastatin natrium','20.0','mg'),(55,3420613,'Dabigatran etexilat mesilat','86.48','mg'),(56,3429005,'Formoterol hemifumarat-1-Wasser','12.5','µg'),(57,3442017,'Betamethason valerat','1.214','mg'),(58,3448681,'Mirtazapin-0,5-Wasser','46.53','mg'),(59,3480147,'Opipramol dihydrochlorid','150.0','mg'),(60,3491487,'Dexpanthenol','50.0','mg'),(61,4885395,'Amitriptylin hydrochlorid','75.0','mg'),(62,4890172,'Azithromycin-1-Wasser','512.03','mg'),(63,4891875,'Flohsamenschalen, indische','3.25','g'),(64,4893070,'Pankreas-Pulver vom Schwein','210.8','mg'),(65,4897731,'Pyridoxin hydrochlorid','100.0','mg'),(66,4899859,'Aciclovir','200.0','mg'),(67,4901674,'Meloxicam','15.0','mg'),(68,4906200,'Calciumcarbonat','300.0','mg'),(69,4906200,'Calcium-D-gluconat-Calciumlactat-Gemisch (2:3)-2-Wasser','2945.15','mg'),(70,4907487,'Magnesium DL-hydrogenaspartat 4-Wasser','1803.0','mg'),(71,4908311,'Ondansetron hydrochlorid-2-Wasser','10.0','mg'),(72,4909919,'Magnesiumbis(hydrogenaspartat) dihydrat','1622.69','mg'),(73,4913588,'Tiotropium bromid-1-Wasser','3.12','µg'),(74,4916546,'Furosemid','40.0','mg'),(75,4916983,'Perazin dimalonat','40.32','mg'),(76,4921760,'Midazolam hydrochlorid','5.56','mg'),(77,4923227,'Povidon iod','75.0','mg'),(78,4927053,'Torasemid','5.0','mg'),(79,4927099,'Torasemid','10.0','mg'),(80,4930606,'Co-trimoxazol','480.0','mg'),(81,4944910,'Alfuzosin hydrochlorid','10.0','mg'),(82,4946263,'Morphin sulfat','10.0','mg'),(83,4950773,'Fluticason 17-propionat','0.5','mg'),(84,7668652,'Bromocriptin mesilat','5.73','mg'),(85,7707211,'Carbomer','2.0','mg'),(86,7712436,'Amitriptylin hydrochlorid','28.3','mg'),(87,7712896,'Kaliumcitrat-1-Wasser','2157.3','mg'),(88,7713507,'Risperidon','1.0','mg'),(89,7745861,'Omeprazol','20.0','mg'),(90,7745921,'Omeprazol','40.0','mg'),(91,7757999,'Gabapentin','100.0','mg'),(92,7758585,'Valsartan','320.0','mg'),(93,7758585,'Hydrochlorothiazid','25.0','mg'),(94,7767874,'Epoetin alfa','4000.0','I.E.'),(95,7768431,'Atorvastatin Calcium 3-Wasser','43.3','mg'),(96,7769577,'Duloxetin hydrochlorid','33.68','mg'),(97,7794730,'Dorzolamid hydrochlorid','22.25','mg'),(98,7794730,'Timolol hydrogenmaleat','6.83','mg'),(99,7795209,'Tiotropium bromid-1-Wasser','22.49','µg'),(100,8414184,'Diclofenac natrium','75.0','mg');
/*!40000 ALTER TABLE `dbo.MEDIKAMENTINHALTSSTOFFE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.VITALWERTE`
--

DROP TABLE IF EXISTS `dbo.VITALWERTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.VITALWERTE` (
  `Id` int(11) DEFAULT NULL,
  `KlientId` mediumint(9) DEFAULT NULL,
  `Datum` varchar(19) DEFAULT NULL,
  `Bezeichnung` varchar(13) DEFAULT NULL,
  `Wert` varchar(8) DEFAULT NULL,
  `Einheit` varchar(8) DEFAULT NULL,
  `WurdeUnterschritten` tinyint(4) DEFAULT NULL,
  `WurdeUeberschritten` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.VITALWERTE`
--

LOCK TABLES `dbo.VITALWERTE` WRITE;
/*!40000 ALTER TABLE `dbo.VITALWERTE` DISABLE KEYS */;
INSERT INTO `dbo.VITALWERTE` VALUES (1,1536,'2007-12-20 07:30:00','Blutzucker','120','mg/dl',0,0),(2,1536,'2007-12-24 09:30:00','Blutzucker','188','mg/dl',0,0),(3,1536,'2007-12-27 07:30:00','Blutzucker','113','mg/dl',0,0),(4,1536,'2007-12-31 06:30:00','Blutzucker','126','mg/dl',0,0),(5,1536,'2008-01-01 07:30:00','Blutdruck','140/80','mm Hg',0,0),(6,1536,'2008-01-04 07:48:00','Blutzucker','154','mg/dl',0,0),(7,1536,'2008-01-08 13:41:00','Blutzucker','147','mg/dl',0,0),(8,1536,'2008-01-10 11:00:00','Blutzucker','184','mg/dl',0,0),(9,1536,'2008-01-14 06:30:00','Blutzucker','132','mg/dl',0,0),(10,1536,'2008-01-15 06:30:00','Blutdruck','140/80','mm Hg',0,0),(11,1536,'2008-01-21 06:30:00','Blutzucker','187','mg/dl',0,0),(12,1536,'2008-01-21 08:19:00','Blutzucker','187','mg/dl',0,0),(13,1536,'2008-01-22 07:30:00','Blutdruck','140/90','mm Hg',0,0),(14,1536,'2008-01-24 07:50:00','Blutzucker','188','mg/dl',0,0),(15,1536,'2008-01-25 17:48:00','Gewicht','74,0','kg',0,0),(16,1536,'2008-01-25 17:48:00','BMI','26,22','BMI',0,0),(17,1536,'2008-01-28 07:30:00','Blutzucker','123','mg/dl',0,0),(18,1536,'2008-01-29 08:30:00','Blutdruck','130/80','mm Hg',0,0),(19,1536,'2008-01-29 09:12:00','Blutdruck','130/80','mm Hg',0,0),(20,1536,'2008-01-31 07:30:00','Blutzucker','121','mg/dl',0,0),(21,1536,'2008-01-31 15:12:00','Blutdruck','110/80','mm Hg',0,0),(22,1536,'2008-01-31 15:12:00','Blutzucker','324','mg/dl',0,0),(23,1536,'2008-01-31 16:22:00','Blutzucker','299','mg/dl',0,0),(24,1536,'2008-01-31 17:43:00','Blutzucker','292','mg/dl',0,0),(25,1536,'2008-01-31 20:00:00','Blutzucker','234','mg/dl',0,0),(26,1536,'2008-01-31 21:23:00','Blutzucker','190','mg/dl',0,0),(27,1536,'2008-02-01 08:03:00','Blutdruck','130/80','mm Hg',0,0),(28,1536,'2008-02-01 08:03:00','Blutzucker','165','mg/dl',0,0),(29,1536,'2008-02-01 16:54:00','Blutzucker','170','mg/dl',0,0),(30,1536,'2008-02-03 07:28:00','Blutzucker','124','mg/dl',0,0),(31,1536,'2008-02-04 06:30:00','Blutzucker','165','mg/dl',0,0),(32,1536,'2008-02-05 06:30:00','Blutdruck','130/80','mm Hg',0,0),(33,1536,'2008-02-07 06:30:00','Blutzucker','121','mg/dl',0,0),(34,1536,'2008-02-10 20:39:00','Blutzucker','176','mg/dl',0,0),(35,1536,'2008-02-12 06:30:00','Blutdruck','130/70','mm Hg',0,0),(36,1536,'2008-02-14 08:45:00','Blutzucker','118','mg/dl',0,0),(37,1536,'2008-02-18 06:30:00','Blutzucker','146','mg/dl',0,0),(38,1536,'2008-02-19 06:30:00','Blutdruck','120/90','mm Hg',0,0),(39,1536,'2008-02-21 07:30:00','Blutzucker','181','mg/dl',0,0),(40,1536,'2008-02-25 06:30:00','Blutzucker','156','mg/dl',0,0),(41,1536,'2008-02-26 06:30:00','Blutdruck','140/80','mm Hg',0,0),(42,1536,'2008-02-28 06:30:00','Blutzucker','152','mg/dl',0,0),(43,1536,'2008-02-28 23:46:00','Blutdruck','150/80','mm Hg',0,0),(44,1536,'2008-03-03 07:30:00','Blutzucker','163','mg/dl',0,0),(45,1536,'2008-03-04 08:55:00','Blutdruck','100/80','mm Hg',0,0),(46,1536,'2008-03-05 08:29:00','Blutdruck','120/80','mm Hg',0,0),(47,1536,'2008-03-05 08:29:00','Blutzucker','139','mg/dl',0,0),(48,1536,'2008-03-06 06:30:00','Blutzucker','143','mg/dl',0,0),(49,1536,'2008-03-11 09:00:00','Blutdruck','120/80','mm Hg',0,0),(50,1536,'2008-03-11 09:00:00','Blutzucker','146','mg/dl',0,0),(51,1536,'2008-03-13 06:30:00','Blutzucker','148','mg/dl',0,0),(52,1536,'2008-03-13 11:05:00','Gewicht','65,7','kg',0,0),(53,1536,'2008-03-13 11:05:00','BMI','23,28','BMI',0,0),(54,1536,'2008-03-17 06:30:00','Blutzucker','137','mg/dl',0,0),(55,1536,'2008-03-18 06:30:00','Blutdruck','130/80','mm Hg',0,0),(56,1536,'2008-03-20 06:30:00','Blutzucker','136','mg/dl',0,0),(57,1536,'2008-03-24 08:00:00','Blutzucker','125','mg/dl',0,0),(58,1536,'2008-03-25 08:30:00','Blutdruck','120/80','mm Hg',0,0),(59,1536,'2008-03-26 17:21:00','Blutdruck','139/90','mm Hg',0,0),(60,1536,'2008-03-26 17:22:00','Puls','121','/Min.',0,0),(61,1536,'2008-03-26 17:22:00','Blutzucker','159','mg/dl',0,0),(62,1536,'2008-03-26 20:45:00','Blutdruck','157/98','mm Hg',0,0),(63,1536,'2008-03-26 20:46:00','Puls','124','/Min.',0,0),(64,1536,'2008-03-27 00:30:00','Blutdruck','113/78','mm Hg',0,0),(65,1536,'2008-03-27 00:30:00','Puls','76','/Min.',0,0),(66,1536,'2008-03-27 06:30:00','Blutzucker','146','mg/dl',0,0),(67,1536,'2008-03-31 06:30:00','Blutzucker','164','mg/dl',0,0),(68,1536,'2008-04-01 06:30:00','Blutdruck','127/81','mm Hg',0,0),(69,1536,'2008-04-03 06:30:00','Blutzucker','128','mg/dl',0,0),(70,1536,'2008-04-07 07:30:00','Blutzucker','177','mg/dl',0,0),(71,1536,'2008-04-08 06:30:00','Blutdruck','142/80','mm Hg',0,0),(72,1536,'2008-04-10 08:30:00','Blutzucker','132','mg/dl',0,0),(73,1536,'2008-04-10 09:44:00','Blutdruck','120/80','mm Hg',0,0),(74,1536,'2008-04-12 19:30:00','Blutdruck','148/90','mm Hg',0,0),(75,1536,'2008-04-12 20:00:00','Blutdruck','115/72','mm Hg',0,0),(76,1536,'2008-04-15 06:30:00','Blutdruck','124/81','mm Hg',0,0),(77,1536,'2008-04-15 13:31:00','Blutzucker','268','mg/dl',0,0),(78,1536,'2008-04-16 13:32:00','Gewicht','72,9','kg',0,0),(79,1536,'2008-04-16 13:32:00','BMI','25,83','BMI',0,0),(80,1536,'2008-04-17 06:30:00','Blutzucker','257','mg/dl',0,0),(81,1536,'2008-04-17 20:20:00','Gewicht','70,9','kg',0,0),(82,1536,'2008-04-17 20:20:00','BMI','25,12','BMI',0,0),(83,1536,'2008-04-21 08:00:00','Blutzucker','159','mg/dl',0,0),(84,1536,'2008-04-21 11:13:00','Gewicht','72,5','kg',0,0),(85,1536,'2008-04-21 11:13:00','BMI','25,69','BMI',0,0),(86,1536,'2008-04-22 06:30:00','Blutdruck','135/75','mm Hg',0,0),(87,1536,'2008-04-22 09:41:00','Blutdruck','130/75','mm Hg',0,0),(88,1536,'2008-04-22 13:27:00','Gewicht','70,6','kg',0,0),(89,1536,'2008-04-22 13:27:00','BMI','25,01','BMI',0,0),(90,1536,'2008-04-24 06:30:00','Blutzucker','148','mg/dl',0,0),(91,1536,'2008-04-28 06:30:00','Blutzucker','153','mg/dl',0,0),(92,1536,'2008-04-29 08:00:00','Blutdruck','130/80','mm Hg',0,0),(93,1536,'2008-05-01 06:30:00','Blutzucker','151','mg/dl',0,0),(94,1536,'2008-05-05 07:30:00','Blutzucker','184','mg/dl',0,0),(95,1536,'2008-05-06 10:35:00','Blutdruck','179/74','mm Hg',0,0),(96,1536,'2008-05-06 10:36:00','Puls','114','/Min.',0,0),(97,1536,'2008-05-06 12:25:00','Blutdruck','150/70','mm Hg',0,0),(98,1536,'2008-05-06 12:25:00','Puls','82','/Min.',0,0),(99,1536,'2008-05-08 06:30:00','Blutzucker','150','mg/dl',0,0),(100,1536,'2008-05-08 07:57:00','Blutzucker','150','mg/dl',0,0);
/*!40000 ALTER TABLE `dbo.VITALWERTE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-22 15:20:25
