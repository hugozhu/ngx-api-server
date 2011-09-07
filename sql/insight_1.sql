-- MySQL dump 10.13  Distrib 5.5.8, for osx10.6 (i386)
--
-- Host: localhost    Database: insight
-- ------------------------------------------------------
-- Server version	5.5.8

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
-- Table structure for table `t_basic_adgroup_201107`
--

DROP TABLE IF EXISTS `t_basic_adgroup_201107`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_basic_adgroup_201107` (
  `custId` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `adgroupId` bigint(20) NOT NULL,
  `network` int(11) NOT NULL,
  `searchType` int(11) NOT NULL,
  `creativeId` bigint(20) NOT NULL,
  `pv` bigint(20) NOT NULL,
  `click` bigint(20) NOT NULL,
  `cost` bigint(20) NOT NULL,
  `rankSum` bigint(20) NOT NULL,
  `invalidClick` bigint(20) NOT NULL,
  `finClick` bigint(20) NOT NULL,
  `finCost` bigint(20) NOT NULL,
  UNIQUE KEY `idx1_basic_adgroup_201108` (`custId`,`date`,`campaignId`,`adgroupId`,`network`,`searchType`,`creativeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_basic_adgroup_201107`
--

LOCK TABLES `t_basic_adgroup_201107` WRITE;
/*!40000 ALTER TABLE `t_basic_adgroup_201107` DISABLE KEYS */;
INSERT INTO `t_basic_adgroup_201107` VALUES (1,'2011-07-30',2,3,4,4,123,4444,12,0,0,0,0,0);
/*!40000 ALTER TABLE `t_basic_adgroup_201107` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_basic_adgroup_201108`
--

DROP TABLE IF EXISTS `t_basic_adgroup_201108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_basic_adgroup_201108` (
  `custId` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `adgroupId` bigint(20) NOT NULL,
  `network` int(11) NOT NULL,
  `searchType` int(11) NOT NULL,
  `creativeId` bigint(20) NOT NULL,
  `pv` bigint(20) NOT NULL,
  `click` bigint(20) NOT NULL,
  `cost` bigint(20) NOT NULL,
  `rankSum` bigint(20) NOT NULL,
  `invalidClick` bigint(20) NOT NULL,
  `finClick` bigint(20) NOT NULL,
  `finCost` bigint(20) NOT NULL,
  UNIQUE KEY `idx1_basic_adgroup_201108` (`custId`,`date`,`campaignId`,`adgroupId`,`network`,`searchType`,`creativeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_basic_adgroup_201108`
--

LOCK TABLES `t_basic_adgroup_201108` WRITE;
/*!40000 ALTER TABLE `t_basic_adgroup_201108` DISABLE KEYS */;
INSERT INTO `t_basic_adgroup_201108` VALUES (1,'2011-08-30',2,3,4,4,123,4444,12,0,0,0,0,0);
/*!40000 ALTER TABLE `t_basic_adgroup_201108` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_basic_adgroup_201109`
--

DROP TABLE IF EXISTS `t_basic_adgroup_201109`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_basic_adgroup_201109` (
  `custId` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `adgroupId` bigint(20) NOT NULL,
  `network` int(11) NOT NULL,
  `searchType` int(11) NOT NULL,
  `creativeId` bigint(20) NOT NULL,
  `pv` bigint(20) NOT NULL,
  `click` bigint(20) NOT NULL,
  `cost` bigint(20) NOT NULL,
  `rankSum` bigint(20) NOT NULL,
  `invalidClick` bigint(20) NOT NULL,
  `finClick` bigint(20) NOT NULL,
  `finCost` bigint(20) NOT NULL,
  UNIQUE KEY `idx1_basic_adgroup_201108` (`custId`,`date`,`campaignId`,`adgroupId`,`network`,`searchType`,`creativeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_basic_adgroup_201109`
--

LOCK TABLES `t_basic_adgroup_201109` WRITE;
/*!40000 ALTER TABLE `t_basic_adgroup_201109` DISABLE KEYS */;
INSERT INTO `t_basic_adgroup_201109` VALUES (1,'2011-09-30',2,3,4,4,123,4444,12,0,0,0,0,0),(1,'2011-08-30',4,455557777,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `t_basic_adgroup_201109` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_basic_bidword_201108`
--

DROP TABLE IF EXISTS `t_basic_bidword_201108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_basic_bidword_201108` (
  `custId` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `adgroupId` bigint(20) NOT NULL,
  `bidwordId` bigint(20) NOT NULL,
  `network` int(11) NOT NULL,
  `matchScope` int(11) NOT NULL,
  `creativeId` bigint(20) NOT NULL,
  `pv` bigint(20) NOT NULL,
  `click` bigint(20) NOT NULL,
  `cost` bigint(20) NOT NULL,
  `rankSum` bigint(20) NOT NULL,
  `invalidClick` bigint(20) NOT NULL,
  `finClick` bigint(20) NOT NULL,
  `finCost` bigint(20) NOT NULL,
  `bidwordStr` varchar(256) NOT NULL,
  UNIQUE KEY `idx1_basic_bidword_201108` (`custId`,`date`,`campaignId`,`adgroupId`,`bidwordId`,`network`,`matchScope`,`creativeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_basic_bidword_201108`
--

LOCK TABLES `t_basic_bidword_201108` WRITE;
/*!40000 ALTER TABLE `t_basic_bidword_201108` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_basic_bidword_201108` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_basic_campaign_201108`
--

DROP TABLE IF EXISTS `t_basic_campaign_201108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_basic_campaign_201108` (
  `custId` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `network` int(11) NOT NULL,
  `searchType` int(11) NOT NULL,
  `pv` bigint(20) NOT NULL,
  `click` bigint(20) NOT NULL,
  `cost` bigint(20) NOT NULL,
  `rankSum` bigint(20) NOT NULL,
  `invalidClick` bigint(20) NOT NULL,
  `finClick` bigint(20) NOT NULL,
  `finCost` bigint(20) NOT NULL,
  UNIQUE KEY `idx1_basic_campaign_201108` (`custId`,`date`,`campaignId`,`network`,`searchType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_basic_campaign_201108`
--

LOCK TABLES `t_basic_campaign_201108` WRITE;
/*!40000 ALTER TABLE `t_basic_campaign_201108` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_basic_campaign_201108` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_basic_customer_201108`
--

DROP TABLE IF EXISTS `t_basic_customer_201108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_basic_customer_201108` (
  `custId` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `network` int(11) NOT NULL,
  `searchType` int(11) NOT NULL,
  `pv` bigint(20) NOT NULL,
  `click` bigint(20) NOT NULL,
  `cost` bigint(20) NOT NULL,
  `rankSum` bigint(20) NOT NULL,
  `invalidClick` bigint(20) NOT NULL,
  `finClick` bigint(20) NOT NULL,
  `finCost` bigint(20) NOT NULL,
  UNIQUE KEY `idx1_basic_customer_201108` (`custId`,`date`,`network`,`searchType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_basic_customer_201108`
--

LOCK TABLES `t_basic_customer_201108` WRITE;
/*!40000 ALTER TABLE `t_basic_customer_201108` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_basic_customer_201108` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_effect_adgroup_201108`
--

DROP TABLE IF EXISTS `t_effect_adgroup_201108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_effect_adgroup_201108` (
  `custId` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `adgroupId` bigint(20) NOT NULL,
  `network` int(11) NOT NULL,
  `searchType` int(11) NOT NULL,
  `creativeId` bigint(20) NOT NULL,
  `directPay` bigint(20) NOT NULL,
  `indirectPay` bigint(20) NOT NULL,
  `directPayCount` bigint(20) NOT NULL,
  `indirectPayCount` bigint(20) NOT NULL,
  `favItemCount` bigint(20) NOT NULL,
  `favShopCount` bigint(20) NOT NULL,
  UNIQUE KEY `idx1_effect_adgroup_201108` (`custId`,`date`,`campaignId`,`adgroupId`,`network`,`searchType`,`creativeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_effect_adgroup_201108`
--

LOCK TABLES `t_effect_adgroup_201108` WRITE;
/*!40000 ALTER TABLE `t_effect_adgroup_201108` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_effect_adgroup_201108` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_effect_bidword_201108`
--

DROP TABLE IF EXISTS `t_effect_bidword_201108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_effect_bidword_201108` (
  `custId` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `adgroupId` bigint(20) NOT NULL,
  `bidwordId` bigint(20) NOT NULL,
  `network` int(11) NOT NULL,
  `matchScope` int(11) NOT NULL,
  `creativeId` bigint(20) NOT NULL,
  `directPay` bigint(20) NOT NULL,
  `indirectPay` bigint(20) NOT NULL,
  `directPayCount` bigint(20) NOT NULL,
  `indirectPayCount` bigint(20) NOT NULL,
  `favItemCount` bigint(20) NOT NULL,
  `favShopCount` bigint(20) NOT NULL,
  `bidwordStr` varchar(256) DEFAULT NULL,
  UNIQUE KEY `idx1_effect_bidword_201108` (`custId`,`date`,`campaignId`,`adgroupId`,`bidwordId`,`network`,`matchScope`,`creativeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_effect_bidword_201108`
--

LOCK TABLES `t_effect_bidword_201108` WRITE;
/*!40000 ALTER TABLE `t_effect_bidword_201108` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_effect_bidword_201108` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_effect_campaign_201108`
--

DROP TABLE IF EXISTS `t_effect_campaign_201108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_effect_campaign_201108` (
  `custId` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `network` int(11) NOT NULL,
  `searchType` int(11) NOT NULL,
  `directPay` bigint(20) NOT NULL,
  `indirectPay` bigint(20) NOT NULL,
  `directPayCount` bigint(20) NOT NULL,
  `indirectPayCount` bigint(20) NOT NULL,
  `favItemCount` bigint(20) NOT NULL,
  `favShopCount` bigint(20) NOT NULL,
  UNIQUE KEY `idx1_effect_campaign_201108` (`custId`,`date`,`campaignId`,`network`,`searchType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_effect_campaign_201108`
--

LOCK TABLES `t_effect_campaign_201108` WRITE;
/*!40000 ALTER TABLE `t_effect_campaign_201108` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_effect_campaign_201108` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_effect_customer_201108`
--

DROP TABLE IF EXISTS `t_effect_customer_201108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_effect_customer_201108` (
  `custId` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `network` int(11) NOT NULL,
  `searchType` int(11) NOT NULL,
  `directPay` bigint(20) NOT NULL,
  `indirectPay` bigint(20) NOT NULL,
  `directPayCount` bigint(20) NOT NULL,
  `indirectPayCount` bigint(20) NOT NULL,
  `favItemCount` bigint(20) NOT NULL,
  `favShopCount` bigint(20) NOT NULL,
  UNIQUE KEY `idx1_effect_customer_201108` (`custId`,`date`,`network`,`searchType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_effect_customer_201108`
--

LOCK TABLES `t_effect_customer_201108` WRITE;
/*!40000 ALTER TABLE `t_effect_customer_201108` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_effect_customer_201108` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-09-07 12:10:37
