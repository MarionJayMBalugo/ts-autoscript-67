-- MySQL dump 10.13  Distrib 8.4.7, for Linux (x86_64)
--
-- Host: localhost    Database: platform
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int unsigned NOT NULL AUTO_INCREMENT,
  `userLoginBarcode` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userRemoteLoginUsername` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userForcePWChange` date NOT NULL DEFAULT '0000-00-00',
  `userRoleID` smallint unsigned NOT NULL,
  `userActive` int unsigned NOT NULL DEFAULT '0',
  `userFirstName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userLastName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userDefaultPrinter` int unsigned NOT NULL DEFAULT '0',
  `userLoginRedirect` int unsigned NOT NULL DEFAULT '0',
  `userHospital` int unsigned NOT NULL DEFAULT '1',
  `userUnit` int unsigned DEFAULT NULL,
  `userPasswordChange` tinyint unsigned NOT NULL DEFAULT '0',
  `userLastIPAddress` char(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userLastSessionID` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userLastActivity` datetime DEFAULT NULL,
  `userIncorrectLogins` int unsigned NOT NULL DEFAULT '0',
  `userAlwaysLocalLogin` tinyint(1) DEFAULT NULL,
  `userHL7Reference` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userLanguage` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `userEmail` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `userLoginBarcode` (`userLoginBarcode`),
  KEY `userRemoteLoginUsername` (`userRemoteLoginUsername`),
  KEY `RoleID` (`userRoleID`),
  KEY `userActive` (`userActive`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'USR000001','Timeless.Admin',NULL,'$2y$10$Fy0T1i9tapFhJCBeEF2M9O8kFuz0foaTUigc3Rj6Y8uf1URm43B4u','2022-06-07',8,1,'Admin','Timeless',1,0,1,0,0,'::1','6GwCv03xR4ezMOOVfjRoqIshaY2pPJww','2025-01-21 08:36:06',0,0,' ','en','tlaaroussi@timelessmedical.com',NULL,NULL,NULL,'2026-01-08 16:46:14',NULL),(2,'Acctmanager','Timeless.Acctmanager',NULL,'$2y$10$Fy0T1i9tapFhJCBeEF2M9O8kFuz0foaTUigc3Rj6Y8uf1URm43B4u','2022-06-07',1,1,'Acctmanager','Timeless',1,0,1,0,0,'::1','6h72p1bd34sc4gnsh5nlff29id','2023-05-31 13:42:11',0,0,' ','en','tlaaroussi@timelessmedical.com',NULL,NULL,NULL,NULL,NULL),(3,'Receiver','Timeless.Receiver',NULL,'$2y$10$Fy0T1i9tapFhJCBeEF2M9O8kFuz0foaTUigc3Rj6Y8uf1URm43B4u','2022-06-07',2,1,'Receiver','Timeless',1,0,1,0,0,'::1','6h72p1bd34sc4gnsh5nlff29id','2023-05-31 13:42:11',0,0,' ','en','tlaaroussi@timelessmedical.com',NULL,NULL,NULL,NULL,NULL),(4,'Therapyfeed','Timeless.Therapyfeed',NULL,'$2y$10$Fy0T1i9tapFhJCBeEF2M9O8kFuz0foaTUigc3Rj6Y8uf1URm43B4u','2022-06-07',3,1,'Therapyfeed','Timeless',1,0,1,0,0,'::1','6h72p1bd34sc4gnsh5nlff29id','2023-05-31 13:42:11',0,0,' ','en','tlaaroussi@timelessmedical.com',NULL,NULL,NULL,NULL,NULL),(5,'PCT','PCT',NULL,'$2y$10$Fy0T1i9tapFhJCBeEF2M9O8kFuz0foaTUigc3Rj6Y8uf1URm43B4u','2022-06-07',4,1,'Prep','Timeless',1,0,1,0,0,'::1','w4GfhFttUqMjR9ViFRiE8BQCdXkZiFS7','2025-01-21 08:38:30',0,0,' ','en','tlaaroussi@timelessmedical.com',NULL,NULL,NULL,'2025-01-21 08:38:02',NULL),(6,'PrepTech','PrepTech',NULL,'$2y$10$HMVnDyeg.T0n.05KZ3QJZOv6vzhj0bmqTZxrjpA9e1KbXKmn.o6XO','2022-06-07',5,1,'Nurse','Timeless',1,0,1,2,0,'::1','iM83Mk5USEpO9ggPmrqVD1uey0UFXJsE','2023-06-22 17:58:50',0,0,' ','en','tlaaroussi@timelessmedical.com',NULL,NULL,NULL,'2025-01-21 08:37:45',NULL),(7,'Sysadmin','Sysadmin',NULL,'$2y$10$rBVFmVin/2fbw2qCPnNs/eLq30OIHBA9xw91vrvtjzrcPmdglV.si','2022-06-07',8,1,'Sysadmin','Timeless',1,0,1,0,0,'::1','cqm28s6pfnkqctxBnz6EWKbeGxAyUfYO','2023-05-31 13:42:11',0,0,' ','en','tlaaroussi@timelessmedical.com',NULL,NULL,NULL,'2025-01-21 08:25:24',NULL),(8,'NursePrep','NursePrep',NULL,'$2y$10$5KNdw4B06VOksgvY5sGm4OvAtIszlCl45BXLIo2tdWsXG7M2ZT0ZK','2025-01-21',7,1,'Nurse Prep','Timeless',1,0,1,0,0,'','uYEgfFSbcEDN2Q3dFYkVaWfMliLzsQ2W','2025-01-21 08:39:09',0,NULL,NULL,'en','',NULL,NULL,NULL,'2025-01-21 08:39:06',NULL),(9,'NurseNoprep','NurseNoprep',NULL,'$2y$10$X.36UnGuOWovThtokrGwQ.k8a3XZ2xisnRHLGc6QcvEMKgRpYD/Eq','2025-01-21',6,1,'Nurse No Prep','Timeless',1,0,1,0,0,'','ZQF0r93RSdQOJ3jCmOwRhCjoWgVW1hV7','2025-01-21 08:39:37',0,NULL,NULL,'en','',NULL,NULL,NULL,'2025-01-21 08:39:28',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'platform'
--

--
-- Dumping routines for database 'platform'
--
/*!50003 DROP FUNCTION IF EXISTS `SFUNC_actionOpensBottle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `SFUNC_actionOpensBottle`(
  `actionCode` INT
) RETURNS tinyint(1)
    COMMENT 'Determines if a bottle history action results in a bottle history action being opened.'
BEGIN
    RETURN (actionCode IN(41,50,53,60,65,70,75,90));
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPROC_bottleHistoryReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SPROC_bottleHistoryReport`(
	IN `p_bottleaction` VARCHAR(50),
	IN `p_bottle` VARCHAR(50),
	IN `p_displayAllBottleHistory` TINYINT,
	IN `p_dateFrom` VARCHAR(50),
	IN `p_dateTo` VARCHAR(50),
	IN `p_User` VARCHAR(50),
	IN `p_motherBarcode` VARCHAR(50),
	IN `p_printedFor` VARCHAR(1000),
	IN `p_location` VARCHAR(250),
	IN `p_bin` VARCHAR(250),
	IN `p_category` VARCHAR(250),
	IN `p_limit` VARCHAR(20),
	IN `p_usingLDAP` TINYINT
)
    COMMENT 'Bottle history processing to return result sets based on parameter'
BEGIN
	SET @queryResultSet = CONCAT('
				SELECT
				  bottlehistory.bothistID,
				  bottlehistory.bothistBottle,
				  bottlehistory.bothistDateTime,
				  bottlehistory.bothistAction,
				  bottlehistory.bothistLocation,
				  bottlehistory.bothistBin,
				  bottlehistory.bothistFromLocation,
				  bottlehistory.bothistFromBin,
				  bottles.bottleBarcode,
				  bottles.bottleID,
				  bottles.bottlePercentDBM,
				  bottles.bottleDateTimePumped,
				  nutrition_product_types.formtypeCategoryID,
				  babies.babyRoom,
				  babies.babyBedNumber,
				  bottlehistory.bothistVolume,
				  units.unitName,
				  -- Get Bottle Fortifications
				  fortCalPerOz,
				  (CASE WHEN bottlehistory.bothistAction = 50 and fortCalPerOz > 0 THEN (SELECT  GROUP_CONCAT(CONCAT_WS(\'|\',fortification_entries.fortentryAdditiveLot,fortification_types.forttypeName,fortification_entries.fortentryUOMMeasurement,fortification_types.forttypeMeasurement) SEPARATOR \'~\') FROM fortification_entries  INNER JOIN fortification_types ON fortification_entries.fortentryFortificationType = fortification_types.forttypeID WHERE fortification_entries.fortentryFortification = fortifications.fortID GROUP BY fortification_entries.fortentryFortification ) ELSE NULL END) as bottleFortifier,
				  -- Get the bottle baby info (ID|BARCODE|NAME) priority 1: get from the bottle history | priority 2: Get from the bottle | priority 3: Get from the mother
				  (CASE WHEN bothistBaby > 0 THEN (Concat(Concat(babies.babyLastName, \', \', babies.babyFirstName, \' \',  babies.babyMiddleName),\'|\',babies.babyID, \'|\', babies.babyBarcode )) -- there is baby in history
				  		  WHEN bottles.bottlePrintedForBaby > 0 THEN (Concat(Concat(bp.babyLastName, \', \', bp.babyFirstName, \' \',  bp.babyMiddleName),\'|\',bp.babyID, \'|\', bp.babyBarcode)) -- baby only reflects in the bottle table
				  		  WHEN bottleOrder > 0 AND (SELECT orderBaby from orders where orderID = orderBaby) < 1 THEN \'-- Prepared to Community Order --\' -- botle is a community order
				  		  WHEN bothistMother > 0 OR bottlePrintedForMother > 0 THEN (CASE WHEN (SELECT Count(b.babyID) FROM babies b WHERE b.babyMother = IFNULL(bothistMother,bottlePrintedForMother)) > 1 THEN \'Any Sibling\' ELSE (CASE WHEN (SELECT Count(b.babyID) FROM babies b WHERE b.babyMother = IFNULL(bothistMother,bottlePrintedForMother)) = 1 THEN (SELECT Concat(Concat(b1.babyLastName, \', \', b1.babyFirstName, \' \',  b1.babyMiddleName),\'|\',b1.babyID, \'|\', b1.babyBarcode ) FROM babies b1 WHERE b1.babyMother = IFNULL(bothistMother,bottlePrintedForMother) LIMIT 1) ELSE \'This bottle is assigned to a mother with no children\' END) END) -- only the mother is specified for this bottle
				  		  WHEN bottlePercentDBM > 0 THEN \'-- Any Donor Child --\'
				  		  WHEN formtypeCategoryID = 3 THEN \'-- Any Formula Child --\'
				  		  WHEN formtypeCategoryID = 4 THEN \'-- Any Medolac Child --\'
				  		  WHEN formtypeCategoryID = 6 THEN \'-- Any Prolacta Child --\'
				  		  WHEN formtypeCategoryID = 7 THEN \'-- Any Ni-Q Child --\'
				   ELSE \'-- All Children --\' END) as theBabyInfo,
				  -- Get the name of the mother (ID|BARCODE|NAME) priority 1: get from the bottle history | priority 2: Get from the bottle
				  (CASE WHEN bothistMother > 0 THEN ( Concat(Concat(mothers.motherLastName, \', \', mothers.motherFirstName),\'|\',mothers.motherID, \'|\', mothers.motherBarcode ) ) -- there is mother in history
				  		  WHEN bottles.bottlePrintedForMother > 0 THEN (SELECT Concat(Concat(mp.motherLastName, \', \', mp.motherFirstName),\'|\',mp.motherID, \'|\', mp.motherAccountNumber )) -- mother only reflects in the bottle table
				  		  WHEN bottlePercentDBM > 0 THEN \'-- Donor --\'
				  		  WHEN formtypeCategoryID = 3 THEN \'-- Formula --\'
				  		  WHEN formtypeCategoryID = 4 THEN \'-- Medolac --\'
				  		  WHEN formtypeCategoryID = 6 THEN \'-- Prolacta --\'
				  		  WHEN formtypeCategoryID = 7 THEN \'-- Ni-Q --\'
				   ELSE \'&nbsp;\' END) as theMotherInfo,
				  IfNull((CASE
                 WHEN (bottlehistory.bothistUserType = 2 OR (bottlehistory.bothistUserType = 3 AND bottlehistory.bothistuser = 0))
				    THEN Concat(mothers.motherLastName, \', \', mothers.motherFirstName)
				    ELSE Concat(users.userLastName, \', \', users.userFirstName)
				  END), \'Invalid\') AS userName,
				  (CASE
               WHEN (bottlehistory.bothistUserType = 2 OR (bottlehistory.bothistUserType = 3 AND bottlehistory.bothistuser = 0))
				    THEN mothers.motherBarcode
				    ELSE ',IF(p_usingLDAP = 1, 'userRemoteLoginUsername', 'userLoginBarcode'),'
				  END) AS userBarcode,
				  -- Get the bottles for Split and Combine sources from bottle sources
				  (CASE
				    WHEN bottlehistory.bothistAction = 60 OR bottlehistory.bothistAction = 70
				    THEN (SELECT
				          GROUP_CONCAT(bots.bottleBarcode SEPARATOR \',\')
				        FROM
				          bottlesources botsour
				          INNER JOIN bottles bots ON bots.bottleID = botsour.bottlesourceSourceID
				          INNER JOIN bottlehistory bothiss ON bothiss.bothistBottle = bots.bottleID
				        WHERE
				          botsour.bottlesourceOmittedByUser = 0 AND
				          botsour.bottlesourceTargetID = bottles.bottleID AND
				          bothiss.bothistAction = 65 AND
				          bothiss.bothistDateTime BETWEEN Date_Add(bottlehistory.bothistDateTime, INTERVAL -8 SECOND) AND
				          Date_Add(bottlehistory.bothistDateTime, INTERVAL +8 SECOND))
				   WHEN bottlehistory.bothistAction = 92
				    THEN (SELECT
				          GROUP_CONCAT(bots.bottleBarcode SEPARATOR \',\')
				        FROM
				          bottlesources botsour
				          INNER JOIN bottles bots ON bots.bottleID = botsour.bottlesourceSourceID
				        WHERE
				          botsour.bottlesourceOmittedByUser = 0 AND
				          botsour.bottlesourceTargetID = bottles.bottleID)
				    WHEN bottlehistory.bothistAction = 65 OR bottlehistory.bothistAction = 75
				    THEN (SELECT
				          GROUP_CONCAT(botstar.bottleBarcode SEPARATOR \',\')
				        FROM
				          bottlesources bottar
				          INNER JOIN bottles botstar ON botstar.bottleID = bottar.bottlesourceTargetID
				          INNER JOIN bottlehistory bothisstar ON bothisstar.bothistBottle = botstar.bottleID
				        WHERE
				          bottar.bottlesourceOmittedByUser = 0 AND
				          bottar.bottlesourceSourceID = bottles.bottleID AND
				          bothisstar.bothistAction = 60 AND
				          bothisstar.bothistDateTime BETWEEN Date_Add(bottlehistory.bothistDateTime, INTERVAL -8 SECOND) AND
				          Date_Add(bottlehistory.bothistDateTime, INTERVAL +8 SECOND))
				    ELSE \'\'
				  END) AS bottlesInvolved,
				  disposalreasons.reasonName,
				  disposal_notes.disposalNoteText,
				  from_bin.binBarcode AS from_bin_binBarcode,
				  from_location.locationName AS from_location_locationName,
				  to_bin.binBarcode AS to_bin_binBarcode,
				  to_location.locationName AS to_location_locationName,
				  IfNull((SELECT Concat(babyhistory.babyhistBarcode, \'|\', Concat(babyhistory.babyhistLastName, \', \', babyhistory.babyhistFirstName,\' \', babyhistory.babyhistMiddleName)) FROM babyhistory WHERE babyhistory.babyhistBaby = bottlehistory.bothistBaby AND babyhistory.babyhistDateTime > bottlehistory.bothistDateTime ORDER BY babyhistory.babyhistDateTime LIMIT 1), \'SAMEBABYNAME\') AS historicBaby,
				  bottlehistory.bothistRemarks
				  -- Check bottle if already been released
				   -- ,(CASE WHEN bottlehistory.bothistAction = 100 THEN (SELECT Count(bothis1.bothistBottle) FROM bottlehistory bothis1 WHERE bothis1.bothistBottle = bottlehistory.bothistBottle AND bothis1.bothistAction = 110) ELSE 0 END) AS isDisposedAndReleased  -- WS-3732 in case we will remove the where clause, we can use this field in the php script row validation

				FROM
				  bottlehistory
				  LEFT JOIN bottles ON bottlehistory.bothistBottle = bottles.bottleID
				  LEFT JOIN nutrition_product_types ON nutrition_product_types.formtypeID = bottles.bottleFormulaType
				  LEFT JOIN fortifications ON bottles.bottleFortification = fortifications.fortID
				  LEFT JOIN babies ON bottlehistory.bothistBaby = babies.babyID
				  LEFT JOIN mothers ON bottlehistory.bothistMother = mothers.motherID
				  LEFT JOIN babies bp ON bp.babyID = bottles.bottlePrintedForBaby
				  LEFT JOIN mothers mp ON mp.motherID = bottles.bottlePrintedForMother
				  LEFT JOIN users ON bottlehistory.bothistUser = users.userID
				  LEFT JOIN units ON units.unitID = babies.babyUnit
				  LEFT JOIN disposalreasons ON disposalreasons.reasonID = bottles.bottleDisposalReason
				  LEFT JOIN bottle_disposal_notes ON bottle_disposal_notes.bottleDisposalNotesBottleID = bottles.bottleID
				  LEFT JOIN disposal_notes ON disposal_notes.disposalNoteID = bottle_disposal_notes.bottleDisposalNotesNoteID
				  LEFT JOIN bins from_bin ON from_bin.binID = bottlehistory.bothistFromBin
				  LEFT JOIN bins to_bin ON to_bin.binID = bottlehistory.bothistBin
				  LEFT JOIN locations from_location ON from_location.locationID = bottlehistory.bothistFromLocation
				  LEFT JOIN locations to_location ON to_location.locationID = bottlehistory.bothistLocation
				  WHERE NOT ((bottlehistory.bothistAction = 100) AND (SELECT      Count(bothis1.bothistBottle)    FROM      bottlehistory bothis1    WHERE      bothis1.bothistBottle = bottlehistory.bothistBottle AND      bothis1.bothistAction = 110) > 0) -- WS-3732 excluding disposed but released bottle
				 ');
	SET @queryOrder	= 'bothistDateTime, bothistID ASC ';

	SET @queryParameter = CONCAT_WS(' ',p_bottleaction);

	IF (p_bottle <> '') THEN
		SET @bottleID = (Select GROUP_CONCAT( bottleID SEPARATOR ',') from bottles where bottleBarcode =  p_bottle GROUP BY p_bottle);
		SET @queryParameter = CONCAT_WS(' ',@queryParameter,' AND bottleID IN (', @bottleID);
		IF (p_displayAllBottleHistory = 1) THEN
			SET @queryParameter = CONCAT_WS(',',@queryParameter,
															(SELECT GROUP_CONCAT(bottlesourceSourceID SEPARATOR ',' ) from bottlesources WHERE `bottlesourceOmittedByUser` = 0 AND bottlesourceTargetID IN (@bottleID) GROUP BY bottlesourceTargetID),
															(SELECT GROUP_CONCAT(bottlesourceTargetID SEPARATOR ',') from bottlesources WHERE `bottlesourceOmittedByUser` = 0 AND bottlesourceSourceID IN (@bottleID) GROUP BY bottlesourceSourceID));
		END IF;
		SET @queryParameter = CONCAT_WS('',@queryParameter,')');
	END IF;
	IF (p_displayAllBottleHistory = 0) THEN
		SET @queryOrder = CONCAT_WS(',',' `bothistBottle` ',@queryOrder);
	END IF;

	IF (p_datefrom) <> '' THEN
		SET @queryParameter = CONCAT_WS('',@queryParameter,' AND bothistDateTime >=\'', p_dateFrom,'\' ');
	END IF;
	IF (p_dateto) <> '' THEN
		SET @queryParameter = CONCAT_WS('',@queryParameter,' AND bothistDateTime <=\'', p_dateTo,'\' ');
	END IF;

	IF (p_User) <> '' THEN
		SET @queryParameter = CONCAT_WS('',@queryParameter,' AND (CASE bottlehistory.bothistUserType
				    WHEN 2
				    THEN mothers.motherBarcode
				    ELSE ',IF(p_usingLDAP = 1, 'userRemoteLoginUsername', 'userLoginBarcode'),'
				  END) =\'', p_User,'\' ');
	END IF;

	IF (p_motherBarcode) <> '' THEN
		SET @queryParameter = CONCAT_WS('',@queryParameter,' AND mothers.motherBarcode =\'', p_motherBarcode,'\' ');
	END IF;

	IF (p_printedFor) <> '' THEN
		SET @queryParameter = CONCAT_WS(' ',@queryParameter,' AND ',p_printedFor);
	END IF;

	IF (p_location) <> '' THEN
		SET @queryParameter = CONCAT_WS(' ',@queryParameter,' AND ',p_location);
	END IF;

	IF (p_bin) <> '' THEN
		SET @queryParameter = CONCAT_WS(' ',@queryParameter,' AND ',p_bin);
	END IF;

	IF (p_category) <> '' THEN
		SET @queryParameter = CONCAT_WS(' ',@queryParameter,' AND ',p_category);
	END IF;

	SET @queryResultSet = CONCAT_WS(' ',@queryResultSet ,' AND ',@queryParameter,' ORDER BY ',@queryOrder,p_limit,';');



	PREPARE bottleHistoryReport FROM @queryResultSet;
	EXECUTE bottleHistoryReport;
	DEALLOCATE PREPARE bottleHistoryReport;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPROC_deliverylog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SPROC_deliverylog`(
                IN `botHistDateTimeStart` DATETIME,
                IN `botHistDateTimeEND` DATETIME,
                IN `unitIN` VARCHAR(255),
                IN `showUnprepped` TINYINT,
                IN `showInactive` TINYINT
            )
    SQL SECURITY INVOKER
    COMMENT 'BFPDR-1056: fetch appropriat contents for Delivery Log Report'
BEGIN


            SET @@group_concat_max_len = 102400;
            SELECT
              GROUP_CONCAT(DISTINCT
                CONCAT_WS('',
                    'ifnull (SUM(case when formtypeName = ''',
                  formtypeName,
                  ''' then 1 end),0) AS `',
                  formtypeName, '`'
                )
              )INTO @Formula
            FROM bottles b JOIN (SELECT bothistID, bothistBottle, bothistDateTime, bothistAction,
            bothistMother, bothistBaby, bothistUnit, bothistVolume, bothistCalOz, bothistFromBin, bothistFromLocation, bothistBin,
            bothistexpiryDateTime, bothistState, bothistPercentEBM, bothistPercentDBM, bothistPercentFormula,
            bothistPercentFortifier, activityID, activityOrderID, activityDateTime, activityType FROM bottlehistory as bh
                                            INNER JOIN activitymaster AS am ON (bh.bothistAction IN (50,60,65) AND
                    am.activityDateTime >  DATE_SUB(bothistDateTime, INTERVAL 10 SECOND) AND
                                                am.activityDateTime <  DATE_ADD(bothistDateTime, INTERVAL 10 SECOND)
                                                AND bothistDateTime>= `botHistDateTimeStart`
                    AND bothistDateTime<=`botHistDateTimeEND`)
                                              GROUP BY bothistBottle) temp ON bothistBottle = bottleID,
                  nutrition_product_types npt,
                  babies bb
            WHERE
                    b.formtypeID = npt.formtypeID AND
                    bb.babyID = b.bottlePrintedForBaby AND
                    temp.activityOrderID > 0 AND
                    b.bottlePercentFormula > 0 AND
                    npt.formtypeCategoryID = 3 AND
                    bb.babyActive >= `showInactive`;

            SET @units = '';
            IF( unitIN <> '') THEN
                SET @units = CONCAT_WS('', 'AND bb.babyUnit IN (',unitIN,')');
            END IF;

            SELECT
              GROUP_CONCAT(DISTINCT
                CONCAT_WS('',"0 AS '", formtypeName,"'")
              )  INTO @header
            FROM bottles b
                    JOIN (SELECT bothistID, bothistBottle, bothistDateTime, bothistAction,
            bothistMother, bothistBaby, bothistUnit, bothistVolume, bothistCalOz, bothistFromBin, bothistFromLocation, bothistBin,
            bothistexpiryDateTime, bothistState, bothistPercentEBM, bothistPercentDBM, bothistPercentFormula,
            bothistPercentFortifier, activityID, activityOrderID, activityDateTime, activityType FROM bottlehistory as bh
                    INNER JOIN activitymaster AS am ON (bh.bothistAction IN (50,60, 65) AND
                    am.activityDateTime >  DATE_SUB(bothistDateTime, INTERVAL 10 SECOND) AND
                        am.activityDateTime <  DATE_ADD(bothistDateTime, INTERVAL 10 SECOND)
                        AND bothistDateTime>=botHistDateTimeStart
                    AND bothistDateTime<=botHistDateTimeEND)
                      GROUP BY bothistBottle) temp ON bothistBottle = b.bottleID,
                  nutrition_product_types npt,
                  babies bb
            WHERE
                    b.formtypeID = npt.formtypeID AND
                    babyID = b.bottlePrintedForBaby AND
                    temp.activityOrderID > 0 AND
                    b.bottlePercentFormula > 0 AND
                    npt.formtypeCategoryID = 3 AND
                    bb.babyActive >= `showInactive`;



            SET @Formula = CONCAT_WS('',"SELECT babyID,babyBarcode, babyLastName, babyFirstName, babyUnit, babyRoom,
                                            (SELECT count(*) FROM orders WHERE orderBaby = babyID AND orderActive = 1 AND orderBase = -1) AS babyHasNPO,
                                            SUM(CASE WHEN bottlePercentEBM > 0 AND bottlePercentDBM = 0 THEN 1 ELSE 0 END ) AS ebmBottlesPrepared,
                                            SUM(CASE WHEN bottlePercentDBM > 0 THEN 1 ELSE 0 END) AS dbmBottlesPrepared,
                                            SUM(CASE WHEN b.bottlePercentFormula > 0 AND npt.formtypeCategoryID = 3 THEN 1 ELSE 0 END) AS formulaBottlesPrepared,
                                            SUM(CASE WHEN b.bottlePercentFormula > 0 AND npt.formtypeCategoryID = 6 THEN 1 ELSE 0 END) AS prolactaBottlesPrepared,
                                            SUM(CASE WHEN b.bottlePercentFormula > 0 AND npt.formtypeCategoryID = 4 THEN 1 ELSE 0 END) AS medolacBottlesPrepared,
                                            SUM(CASE WHEN b.bottlePercentFormula > 0 AND npt.formtypeCategoryID = 7 THEN 1 ELSE 0 END) AS niqBottlesPrepared
                                         ",CASE WHEN( @Formula IS NOT NULL AND @Formula <> '') THEN CONCAT(', ',@Formula) ELSE '' END, "
                                    FROM bottles b LEFT JOIN nutrition_product_types npt ON b.formtypeID = npt.formtypeID
                                         JOIN (SELECT bothistID, bothistBottle, bothistDateTime, bothistAction,
            bothistMother, bothistBaby, bothistUnit, bothistVolume, bothistCalOz, bothistFromBin, bothistFromLocation, bothistBin,
            bothistexpiryDateTime, bothistState, bothistPercentEBM, bothistPercentDBM, bothistPercentFormula,
            bothistPercentFortifier, activityID, activityOrderID, activityDateTime, activityType FROM bottlehistory as bh
                                            INNER JOIN activitymaster AS am ON (bh.bothistAction IN (50,60, 65) AND
                                               am.activityDateTime >  DATE_SUB(bothistDateTime, INTERVAL 10 SECOND) AND
                                                am.activityDateTime <  DATE_ADD(bothistDateTime, INTERVAL 10 SECOND)
                                                AND bothistDateTime>='",botHistDateTimeStart,"'
                                                AND bothistDateTime<='",botHistDateTimeEND,"')
                                              GROUP BY bothistBottle) temp ON bothistBottle = bottleID,
                                          babies bb INNER JOIN units u ON bb.babyUnit = u.unitID
                                    WHERE
                                            bb.babyID = b.bottlePrintedForBaby AND
                                            temp.activityOrderID > 0 AND
                                            bb.babyActive >= ",showInactive,"
                                                                  ",@units,"
                                    GROUP BY babyID ");


            SET @others = CONCAT_WS('',"SELECT babyID,babyBarcode, babyLastName, babyFirstName, babyUnit, babyRoom,
                                        0 AS	 babyHasNPO,
                                        0 AS ebmBottlesPrepared,
                                        0 AS dbmBottlesPrepared,
                                        0 AS formulaBottlesPrepared,
                                        0 AS prolactaBottlesPrepared,
                                        0 AS niqBottlesPrepared,
                                        0 AS medolacBottlesPrepared",CASE WHEN( @header IS NOT NULL AND @header <> '') THEN CONCAT(', ',@header) ELSE '' END, "
                                FROM babies bb INNER JOIN units u ON bb.babyUnit = u.unitID
                                WHERE bb.babyID NOT IN( SELECT b.bottlePrintedForBaby
                                                                FROM bottles b
                                                                      JOIN (SELECT bothistID, bothistBottle, bothistDateTime, bothistAction,
            bothistMother, bothistBaby, bothistUnit, bothistVolume, bothistCalOz, bothistFromBin, bothistFromLocation, bothistBin,
            bothistexpiryDateTime, bothistState, bothistPercentEBM, bothistPercentDBM, bothistPercentFormula,
            bothistPercentFortifier, activityID, activityOrderID, activityDateTime, activityType FROM bottlehistory as bh
                                                                        INNER JOIN activitymaster AS am ON (bh.bothistAction IN (50,60, 65) AND
                                                                       am.activityDateTime >  DATE_SUB(bothistDateTime, INTERVAL 10 SECOND) AND
                                                                        am.activityDateTime <  DATE_ADD(bothistDateTime, INTERVAL 10 SECOND)
                                                                        AND bothistDateTime>='",botHistDateTimeStart,"'
                                                                        AND bothistDateTime<='",botHistDateTimeEND,"')
                                                                      GROUP BY bothistBottle) temp ON bothistBottle = bottleID

                                                                WHERE temp.activityOrderID > 0
                                                                GROUP BY b.bottlePrintedForBaby) AND
                                        bb.babyActive >= ",showInactive,"
                                                                ",@units,"
                                GROUP BY bb.babyID");

            IF (`showUnprepped`<> '1') THEN
                    SET @FinalSQL = CONCAT_WS('',	@Formula);
            ELSE
                    SET @FinalSQL = CONCAT_WS('',	@Formula, ' UNION ',	@others);
            END IF;

            SET @FinalSQL = CONCAT_WS('',@FinalSQL,' ORDER BY babyLastName, babyFirstName, babyBarcode');

            -- SELECT @FinalSQL;
              PREPARE stmt FROM @FinalSQL;
              EXECUTE stmt;
              DEALLOCATE PREPARE stmt;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPROC_feedOrderReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SPROC_feedOrderReport`(
	IN `baseCategories` VARCHAR(50),
	IN `includeWaterBase` BIT,
	IN `fortifierCategories` VARCHAR(50),
	IN `includePlain` BIT,
	IN `orderPriorities` VARCHAR(50),
	IN `orderTypes` VARCHAR(50),
	IN `babyUnits` VARCHAR(250),
	IN `babyHospitals` VARCHAR(50),
	IN `useProductShortName` BIT,
	IN `includeIfOnlyOrderIsNPO` BIT,
	IN `orderByColumns` VARCHAR(2048)




)
    COMMENT 'BFPDR-1067: Create a new Feed Order Report as a stored procedure'
BEGIN
-- This stored procedure will generate a list of active Feed Orders
-- Accepts:
	-- baseCategories: NULL (all), or a comma-separated list of NutritionProductTypeCategories that the base of the order should match.
		-- includeWaterBase : if true include orders that use water as a base.  Separate from baseCategories because there is no NutritionProductTypeCategory for this.
	-- fortifierCategories: NULL (all), or a comma-separated list of NutritionProductTypeCategories that at least one fortifier of the order should match.
			-- includePlain : if true, include plain orders.  Otherwise exclude them.  Separate from fortifierCategories because there is no NutritionProductTypeCategory for this.
	-- orderPriorities: NULL (all), or a comma-separated list of order priorities to include (see FeedOrder::PRIMARY, etc.)
	-- orderTypes: NULL (all), or a comma-separated list of order types to include (see FeedOrder::TYPE_NPO, etc.)
	-- babyUnits: NULL (all), or a comma-separated list of unit IDs that the baby who has the feed order should be in.  Does not affect community orders
	-- babyHospitals: NULL (all), or a comma-separated list of hospital IDs that the baby who has the feed order should be in.  Expected to be a single value that is the user's hospital in most scenarios.
	-- useProductShortName: if true, use the shortName column.  Otherwise use the usual name.
	-- includeIfOnlyOrderIsNPO: if true, when a patient only has an NPO order that order will be included
			-- otherwise patients whose only order is NPO will be filtered out
	-- orderByColumns: NULL (all), or a comma-separated list of column names to use in the ORDER BY clause
		-- included for compatibiltiy with the old report/feed_order/sort_columns app setting
-- IF A VARCHAR PARAMETER DOES NOT MATCH THE COMMA-SEPARATED LIST OF INTEGERS FORMAT IT WILL BE IGNORED (note this exclude orderByColumns, as that accepts arbitrary text (which I don't like, but for now we have to maintain that legacy decision)

SET @@group_concat_max_len = 16384; -- system variable; reset on connection; maximum number of bytes a GROUP_CONCAT should concatenate to

SET @foSELECT = CONCAT('
SELECT
	bab.babyID,babyGestationalAge, babyBarcode, babyMRN, babyAccountNumber, babyRoom, babyBedNumber, babyLastName, babyFirstName, babyMiddleName, babyUnit -- raw baby info
	unitHoursOfFeedPrepared, -- raw unit info
	orderID, orderType, orderPriority, orderCalPerOz, orderBase, orderMilkBase, orderRouteVolume, orderDateCreated, orderDateTimeValidFrom, orderNotes, orderLabelNotes, orderHL7OrderID, orderMilkType,  -- raw order info
	nptBase.formtypeType as baseFormulaType, nptBase.formtypeGroup as baseFormulaGroup, -- raw base info
	feedMethodName, -- raw feed method info
	feedProtocolName, -- raw feed protocol info
	frequencyName, frequencyHoursBetweenFeeds, frequencyBottlesMergeForFeed, -- raw feed frequency info
	-- begin processed baby info
	BIT_OR(fc.productCategoryID = 2) as babyDBMConsent,
	BIT_OR(fc.productCategoryID = 3) as babyFormulaConsent,
	BIT_OR(fc.productCategoryID = 4) as babyMedolacConsent,
	BIT_OR(fc.productCategoryID = 6) as babyProlactaConsent,
	(SELECT COUNT(babyID) FROM babies sib WHERE sib.babyMother = bab.babyMother AND sib.babyID <> bab.babyID) as siblingCount,
	-- end processed baby info
	-- begin processed order info
	COUNT(DISTINCT orderfortificationtypesID) as fortifierCount,
	BIT_OR(nptFort.formtypeCategoryID IN(3, 5)) as orderContainsFormulaAdditive,
	BIT_OR(nptFort.formtypeCategoryID = 4) as orderContainsMedolacAdditive,
	BIT_OR(nptFort.formtypeCategoryID = 6) as orderContainsProlactaAdditive,
	BIT_OR(forttypeModular = 1) as orderContainsModularAdditive,
	',CASE WHEN (useProductShortName = 0) THEN 'nptBase.formTypeName' ELSE 'nptBase.formTypeShortName' END,' as baseFormulaName,
	GROUP_CONCAT(
		DISTINCT CONCAT_WS("^|",
						orderFortificationTypesOrder,
						',CASE WHEN (useProductShortName = 0) THEN 'fortTypeName' ELSE 'fortTypeShortName' END,',
						orderfortificationtypesStartCalOz,
						orderfortificationtypesEndCalOz,
						orderfortificationtypesModularVolume
					) ORDER BY orderFortificationTypesOrder
		SEPARATOR "#|"
	) as orderFortifications,
	-- end processed order info
	-- begin processed bottle info
	SUM(CASE WHEN (bottleOrder = 0 AND
						bottleExpiryDateTime IS NOT NULL AND bottleExpiryDateTime > NOW() AND
						bottleLatestState NOT IN(2,3) AND
						bottleLastAction <> 100
						) THEN (IFNULL(bottleReceivedVolume,0) - IFNULL(bottleFedVolume,0) - IFNULL(bottleUsedVolume,0) - IFNULL(bottleDisposedVolume,0)) ELSE 0 END) AS unpreparedUnfrozenBottleVolume,
	SUM(CASE WHEN (bottleOrder = 0 AND
						bottleExpiryDateTime IS NOT NULL AND bottleExpiryDateTime > NOW() AND
						bottleLatestState IN(2,3) AND
						bottleLastAction <> 100
						) THEN (IFNULL(bottleReceivedVolume,0) - IFNULL(bottleFedVolume,0) - IFNULL(bottleUsedVolume,0) - IFNULL(bottleDisposedVolume,0)) ELSE 0 END) AS unpreparedFrozenBottleVolume
	-- end processed bottle info');
SET @foFROM = '
FROM orders o
	LEFT JOIN babies bab ON o.orderBaby = bab.babyID
		LEFT JOIN bottles bot ON bot.bottlePrintedForMother = bab.babyMother
		LEFT JOIN baby_nutrition_product_category_feed_consents fc ON bab.babyID = fc.babyID
		LEFT JOIN units uni ON bab.babyUnit = uni.unitID
	LEFT JOIN nutrition_product_types nptBase ON o.orderFormulaType = nptBase.formtypeID
	LEFT JOIN order_fortification_types oft ON o.orderID = oft.orderfortificationtypesOrderID
		LEFT JOIN fortification_types ft ON oft.orderfortificationtypesFortificationID = ft.forttypeID
			LEFT JOIN nutrition_product_types nptFort ON ft.formTypeMasterID = nptFort.formTypeID
	LEFT JOIN feed_frequencies freq ON o.orderFrequency = freq.frequencyID
	LEFT JOIN feedmethods met ON o.orderFeedMethod = met.feedmethodID
	LEFT JOIN feedprotocols prot ON o.orderFeedProtocol = prot.feedprotocolID';
SET @foWHERE = '
WHERE orderActive = 1';

SET @foGROUP = '
GROUP BY orderID';

-- the optimizer will get rid of 1=1 for us.  It gives us the ability to chain clauses on with AND without checking to see it is the first clause though.
SET @foHAVING = 'HAVING 1=1';

SET @foORDERBY = 'ORDER BY babyLastName ASC, babyFirstName ASC';
IF(orderByColumns IS NOT NULL AND orderByColumns <> '') THEN
	-- this is so not an ok string sanitizer, but we do what we can with the codebase we were given
	SET orderByColumns = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(lower(orderByColumns), 'insert', ''), ';', ''), '-', ''), 'select', ''), 'delete', ''), 'truncate', ''), 'update', '');
	SET @foORDERBY = CONCAT_WS(' ','ORDER BY ' ,orderByColumns);
END IF;

-- Let's set up our more complex parameters now
-- FIND_IN_SET can't use table indexes, so we'll make generate some more efficient SQL based on our analysis of the parameters
	-- We can use FIND_IN_SET to build our additional criteria, it's just not great to run it against every row in the orders table
	-- We will make lots of use of the fact that CONCAT_WS ignores NULL strings and does not insert the first argument if there is nothing to concatenate.
-- We will also be applying some REGEXP validation on our string parameters here to weed out incorrect formats.  It doesn't constitute full formal validation, but it's a start.

-- prepareBases will become a list of appropriate values of orderBase
-- milkBases will become a list of appropriate values for orderMilkBase
	-- We will use it in an IN() clause.  Duplicates are OK
SET @prepareBases = NULL;
SET @milkBases = NULL;
	IF(baseCategories IS NOT NULL AND baseCategories <> '' AND baseCategories REGEXP '^[0-9,]+$') THEN
		SET @prepareBases = CONCAT_WS(',', @prepareBases,
			CASE WHEN (FIND_IN_SET('1', baseCategories) OR FIND_IN_SET('2', baseCategories)) THEN '0' ELSE NULL END, -- EBM or DBM mean find breastmilk
			CASE WHEN (FIND_IN_SET('3', baseCategories) OR FIND_IN_SET('4', baseCategories) OR FIND_IN_SET('5', baseCategories) OR FIND_IN_SET('6', baseCategories)) THEN '1' ELSE NULL END -- Medolac and Prolacta are formula
		);
		SET @milkBases = CONCAT_WS(',', @milkBases,
			CASE WHEN (FIND_IN_SET('1', baseCategories) OR FIND_IN_SET('2', baseCategories)) THEN '0' ELSE NULL END, -- EBM OR DBM
			CASE WHEN (FIND_IN_SET('1', baseCategories)) THEN '1' ELSE NULL END, -- EBM only
			CASE WHEN (FIND_IN_SET('2', baseCategories)) THEN '2' ELSE NULL END -- DBM only
		);
	END IF;
	IF(includeWaterBase = 1) THEN
		SET @prepareBases = CONCAT_WS(',', @prepareBases, '2');
	END IF;

	-- Now we set up the order types (BEFORE we finish with our prepareBases, since NPO orders do not have a base and we need to address that.
	IF(orderTypes IS NOT NULL AND orderTypes <> '' AND orderTypes REGEXP '^[0-9,]+$') THEN
		SET @prepareBases = CONCAT_WS(',', @prepareBases, CASE WHEN FIND_IN_SET('2', orderTypes) THEN '-1'ELSE NULL END);
		SET @foWHERE = CONCAT_WS(' ', @foWHERE, 'AND orderType IN(',orderTypes,')');
	END IF;

	IF(@prepareBases IS NOT NULL) THEN
		SET @foWHERE = CONCAT_WS(' ', @foWHERE, 'AND orderBase IN(',@prepareBases,')');
	END IF;
	IF(@milkBases IS NOT NULL AND @orderMilkType <> '') THEN
		SET @foWHERE = CONCAT_WS(' ', @foWHERE, 'AND (orderBase <> 1 OR  orderMilkType IN(',@milkBases,'))'); -- non milk orders always pass this portion of the filter
	END IF;

-- Now we do the fortifiers
SET @fortifierWhereClause = NULL;
SET @fortifierHavingClause = NUll;
-- We do our specific filter in the HAVING because we want to capture all fortifier rows for display purposes (e.g. a bottle should be fortified with Prolacta, then with formula.
	-- We still need to capture both rows for order display, we can't filter until after orderFortifications is computed

	IF(includePlain = 1) THEN
		SET @fortifierWhereClause = CONCAT_WS(' OR ', @fortifierWhereClause, 'orderfortificationtypesID IS NULL');
		SET @fortifierHavingClause = CONCAT_WS(' OR ', @fortifierHavingClause, 'fortifierCount = 0');
	END IF;
	IF(fortifierCategories IS NOT NULL AND fortifierCategories <> '' AND fortifierCategories REGEXP '^[0-9,]+$') THEN
		SET @fortifierWhereClause = CONCAT_WS(' OR ', @fortifierWhereClause, 'orderfortificationtypesID IS NOT NULL');
		SET @fortifierHavingClause = CONCAT_WS(' OR ', @fortifierHavingClause,
			CASE WHEN (FIND_IN_SET('3', fortifierCategories)) THEN 'orderContainsFormulaAdditive = 1' ELSE NULL END,
			CASE WHEN (FIND_IN_SET('4', fortifierCategories)) THEN 'orderContainsMedolacAdditive = 1' ELSE NULL END,
			CASE WHEN (FIND_IN_SET('6', fortifierCategories)) THEN 'orderContainsProlactaAdditive = 1' ELSE NULL END
		);
	END IF;

	IF(@fortifierWhereClause IS NOT NULL) THEN
		SET @foWHERE = CONCAT_WS(' ', @foWHERE, 'AND (',@fortifierWhereClause,')');
	END IF;
	IF(@fortifierHavingClause IS NOT NULL) THEN
		SET @foHAVING = CONCAT_WS(' ', @foHAVING, 'AND (',@fortifierHavingClause,')');
	END IF;

-- Next up is order priorities
IF(orderPriorities IS NOT NULL AND orderPriorities <> '' AND orderPriorities REGEXP '^[0-9,]+$') THEN
	SET @foWHERE = CONCAT_WS(' ', @foWHERE, 'AND orderPriority IN(',orderPriorities,')');
END IF;

-- Now we check units
IF(babyUnits IS NOT NULL AND babyUnits <> '' AND babyUnits REGEXP '^[0-9,]+$') THEN
	SET @foWHERE = CONCAT_WS(' ', @foWHERE, 'AND (orderBaby = 0 OR babyUnit IN(',babyUnits,'))');
END IF;

-- Now we check hospitals
IF(babyHospitals IS NOT NULL AND babyHospitals <> '' AND babyHospitals REGEXP '^[0-9,]+$') THEN
	SET @foWHERE = CONCAT_WS(' ', @foWHERE, 'AND (orderBaby = 0 OR babyHospital IN(',babyHospitals,'))');
END IF;

-- Finally do some filtering against NPO
IF(includeIfOnlyOrderIsNPO = 1) THEN
	SET @foHAVING = CONCAT_WS(' ', @foHAVING, ' AND (SELECT COUNT(orderID) FROM orders WHERE orderActive = 1 AND (orderBaby = 0 OR orderBaby = bab.babyID) AND orderType <> 2) > 0');
END IF;

-- Now we have everything we need to run the report
SET @feedOrderQuery = CONCAT_WS(' ',@foSELECT, @foFROM, @foWHERE, @foGROUP, @foHAVING, @foORDERBY, ';');
-- uncomment for debugging:
-- SELECT @feedOrderQuery;/*
PREPARE feedOrderReport FROM @feedOrderQuery;
EXECUTE feedOrderReport;
DEALLOCATE PREPARE feedOrderReport;/**/

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPROC_findProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SPROC_findProduct`(IN `productID` INT, IN `includeInactive` BOOLEAN, IN `includeRTF` BOOLEAN, IN `productLot` VARCHAR(50)
                            )
    SQL SECURITY INVOKER
BEGIN

                            SET @TableName = concat('temp',now() + 0);

                            SET @SQLStmt = CONCAT('DROP TABLE IF EXISTS ',
                    @TableName
                );
                            PREPARE Stmt FROM @SQLStmt;
                            EXECUTE Stmt;
                            DEALLOCATE PREPARE Stmt;

                            SET @SQLStmt = CONCAT('CREATE TABLE ',
                    @TableName,
                    '(
                                                                  `fortentryID` int(11) DEFAULT NULL,
                                                                  `Barcode` varchar(50) DEFAULT NULL,
                                                                  KEY `Barcode` (`Barcode`)
                                                                )
                                                            '
                );
                            PREPARE Stmt FROM @SQLStmt;
                            EXECUTE Stmt;
                            DEALLOCATE PREPARE Stmt;

                            SET @SQLStmt = CONCAT('INSERT INTO ',
                    @TableName,
                    ' SELECT * FROM viewfortificationbarcodes '
                );
                            PREPARE Stmt FROM @SQLStmt;
                            EXECUTE Stmt;
                            DEALLOCATE PREPARE Stmt;

                            SET @findProductQuery = CONCAT("(SELECT
                                        npt.formtypeID as ProductID,
                                        npt.formtypeName as ProductName,
                                        npti.formtypeMeasurementUnit as UnitOfMeasurement,
                                        npfft.name as FormFactorName,
                                        npfft.id as FormFactorID,
                                        loc.locationID,
                                        CASE WHEN loc.locationName IS NOT NULL
                                            THEN loc.locationName
                                        ELSE 'Unstored' END as locationName,
                                        npr.formulaProductBarcode as Barcode,
                                        ((SELECT nprh.created_at
                                        FROM nutrition_products_received_history nprh
                                        WHERE nprh.formulaproductID = npr.formulaproductID AND formulaproductHistoryAction = 35 LIMIT 1) IS NOT NULL) As Opened,
                                        npr.formulaproductUnitVolume as ReceivedVolume,
                                        IFNULL(npr.formulaproductUnitVolumeUsed,0) as UsedVolume,
                                        formulaproductLot as Lot,
                                        npr.formulaproductExpiryDateTime as ExpiryDateTime,
                                        ((SELECT nprh.created_at FROM nutrition_products_received_history nprh
                                        WHERE nprh.formulaproductID = npr.formulaproductID
                                                AND formulaproductHistoryAction = 100) IS NOT NULL) as isDisposed
                                        FROM  nutrition_products_received npr
                                                LEFT JOIN nutrition_product_types fort ON npr.formulaproductFormulaTypesID = fort.formTypeID
                                                LEFT JOIN locations loc ON npr.formulaProductLocation = loc.locationID
                                                INNER JOIN nutrition_product_types npt ON npt.formTypeID = npr.formulaproductFormulaTypesID
                                                INNER JOIN nutrition_product_type_items npti ON npt.formTypeID = npti.formTypeID
                                                INNER JOIN nutrition_product_type_form_factors nptff ON npr.producttypeformfactorsID = nptff.id
                                                INNER JOIN nutrition_product_form_factor_types npfft ON npfft.id = nptff.formfactortypeID
                                                LEFT JOIN ",@TableName," vfa ON vfa.Barcode = npr.formulaproductBarcode
                                                LEFT JOIN bottlesources bs ON vfa.fortEntryID = bs.bottlesourceID
                                        WHERE   npt.formtypeID = ",productID," AND
                                                 (",includeInactive,"  OR
                                                 ((npr.formulaproductUnitQuantityReceived - npr.formulaproductQuantityUsed) > 0 AND
                                                 npr.formulaproductLastAction IN (30,33,35,80,220))) AND
                                                ('",productLot,"' IS NULL OR '",productLot,"' = '' OR formulaproductLot = '",productLot,"')
                                        GROUP BY npr.formulaproductBarcode)");
                            IF (includeRTF) THEN
                                SET @findProductQuery = CONCAT(@findProductQuery,"
                                UNION (SELECT
                                        npt.formtypeID as ProductID,
                                        npt.formtypeName as ProductName,
                                        npti.formtypeMeasurementUnit as UnitOfMeasurement,
                                        'RTF Bottle' as FormFactorName,
                                        0 as FormFactorID,
                                        loc.locationID,
                                        CASE WHEN loc.locationName IS NOT NULL
                                            THEN loc.locationName
                                        ELSE 'Unstored' END as locationName,
                                        bot.bottleBarcode as Barcode,
                                        BIT_OR(SFUNC_actionOpensBottle(bh.bothistaction)) as Opened,
                                        bot.bottleReceivedVolume as ReceivedVolume,
                                        (IFNULL(bot.bottleFedVolume,0) + IFNULL(bot.bottleDisposedVolume,0) + IFNULL(bot.bottleUsedVolume,0)) AS UsedVolume,
                                        bot.bottleLotNumber as Lot,
                                        bot.bottleExpiryDateTime as ExpiryDateTime,
                                        (loc.locationID IS NOT NULL AND bot.bottleDisposalReason > 0) as isDisposed
                                        FROM    bottles bot
                                                INNER JOIN nutrition_product_types npt ON npt.formTypeID = bot.formtypeID
                                                INNER JOIN nutrition_product_type_items npti ON npt.formTypeID = npti.formTypeID
                                                LEFT JOIN locations loc ON bot.bottleLocation = loc.locationID
                                                INNER JOIN bottlehistory bh ON bh.bothistBottle = bot.bottleID
                                        WHERE   bot.formtypeID = ",`productID`," AND (
                                                      ",includeInactive," OR (
                                                                                        (bot.bottleLastAction <> 100 AND
                                                                                        (bot.bottleReceivedVolume - (IFNULL(bot.bottleFedVolume,0) + IFNULL(bot.bottleDisposedVolume,0) + IFNULL(bot.bottleUsedVolume,0))))))  AND
                                                        ('",productLot,"' IS NULL OR '",productLot,"' = '' OR bot.bottleLotNumber = '",productLot,"')
                                            GROUP BY bot.bottleID) -- We want to condense the bottle history to one row
                                ");
                            END IF;
                            SET @findProductQuery = CONCAT(@findProductQuery,"ORDER BY ProductName,  isDisposed ASC, locationID, FormFactorID, Opened DESC, ExpiryDateTime, Barcode");
                            -- uncomment for debugging:
                    --  SELECT @findProductQuery;/*
                                 PREPARE stmtFindProduct FROM @findProductQuery;
                            EXECUTE stmtFindProduct;
                            DEALLOCATE PREPARE stmtFindProduct;
                            /**/
                            SET @SQLStmt = CONCAT('DROP TABLE IF EXISTS ',
                    @TableName
                );

                PREPARE Stmt FROM @SQLStmt;
                EXECUTE Stmt;
                DEALLOCATE PREPARE Stmt;

                END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPROC_productHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SPROC_productHistory`(
                    IN `barcode` VARCHAR(255),
                IN `useBottleHistory` BOOLEAN
            ,
                IN `usingLDAP` TINYINT

            )
    SQL SECURITY INVOKER
    COMMENT 'BFPDR-621: Returns history of a scanned product.  You have to know if it is an RTF or not (parameter useBottleHistory), but it does normalize the column names.  Checking both and detecting automatically isn;t great, performance-wise'
BEGIN
            -- I'm not a fan of the structure here, but the lack of a product history table and the storing of RTFs in another context forces my hand a bit
            -- This isn't a view (even though it looks like it ought to be) because we want to provide a parameter to the nested select necessary to normalize the data across product types) and a view just won't let you do that.
            -- Applying the WHERE after the union will likely cause performance issues on larger datasets vs using this procedure.
            -- The prodDescription = string DESC criteria in the ORDER BY are to force a sensible order when things happen simultaneously - for example a product could very well be opened, used as a fortifier, and disposed in the same instant if it's a single-serve packet





            IF(useBottleHistory) THEN
                SELECT * FROM (
                    (SELECT 	MIN(	CASE WHEN bh.bothistAction IN(1,30,40,51) THEN
                                                                IFNULL(bot.bottleDateTimeReceived, IF(bh.bothistAction IN(1,30,40), bh.bothistDateTime, null))
                                                            WHEN SFUNC_actionOpensBottle(bh.bothistAction) OR bh.bothistAction In (80, 98, 100) THEN
                                                                bh.bothistDateTime
                                                            ELSE
                                                                null END) as prodTransactionDate,
                                             CASE WHEN bh.bothistAction IN(1,30,40,51) THEN
                                                            CASE WHEN bot.bottleDateTimeReceived IS NOT NULL THEN
                                                                IFNULL(CONCAT(  'Unpacked from: ',
                                                                    (   SELECT GROUP_CONCAT(CONCAT("<%|",npr.formulaproductBarcode, "|%> by : ", IF (usingLDAP = 1, userRemoteLoginUsername, userLoginBarcode)) SEPARATOR ', ')
                                                                                    FROM bottlesources bs
                                                                                        INNER JOIN nutrition_products_received npr ON bs.formtypeID = npr.formulaproductFormulaTypesID
                                                                                        INNER JOIN users ON userID = npr.createdBy
                                                                                    WHERE   bs.sourceRecordID = bh.bothistBottle AND bs.activityID = bot.activityID
                                                                                )
                                                                            ),
                                                                        CONCAT("Received", IF(bot.bottleFormulaProductWasReceivedAdHoc > 0, " (Direct Scan)", "")))
                                                            ELSE
                                                                "Created in Hospital" END
                                                        WHEN SFUNC_actionOpensBottle(bh.bothistAction) THEN
                                                            "Opened"
                                                        WHEN bh.bothistAction = 80 THEN
                    (CONCAT("Moved", IFNULL(CONCAT(" from ",locFrom.locationName), ""), IFNULL(CONCAT(" to ",locTo.locationName), ""), (SELECT CONCAT(" by : ",IF (usingLDAP = 1, userRemoteLoginUsername, userLoginBarcode)) FROM users WHERE userID = bh.bothistUser),
                                                            IFNULL(CONCAT("<br\>Changed expiration to <%d", bh.bothistExpiryDateTime, "d%>") ,"")))
                                                        WHEN bh.bothistAction = 98 THEN
                                                            "Dispensed"
                                                        WHEN bh.bothistAction = 100 THEN
                                                            "Disposed"
                                                        ELSE
                                                            null END as prodDescription,
                                            null as prodBottle,
                                            null as prodMother,
                                            null as prodBaby,
                                            null as prodOrder,
                                            null as bottleFed,
                                            null as bottleUsed,
                                            null as bottleDisposed
                                FROM bottles bot
                                INNER JOIN bottlehistory bh ON bot.bottleID = bh.bothistbottle
                                LEFT JOIN locations locFrom ON bh.bothistFromLocation = locFrom.locationID -- assumption: entering product into the system might qualify as a move with no From
                                LEFT JOIN locations locTo ON bh.bothistLocation = locTo.locationID
                                WHERE bot.bottleBarcode = barcode
                                      GROUP BY prodDescription
                                      HAVING prodDescription IS NOT NULL)
                                UNION
                                (SELECT 	bot.bottleExpiryDateTime as prodTransactionDate,
                                            "Expired" as prodDescription,
                                            null as prodBottle,
                                            null as prodMother,
                                            null as prodBaby,
                                            null as prodOrder,
                                            null as bottleFed,
                                            null as bottleUsed,
                                            null as bottleDisposed
                                FROM bottles bot
                                WHERE bot.bottleBarcode = barcode)
                                UNION
                                (SELECT 	am.activityDateTime as prodTransactionDate,
                                            "Used In Bottle" as prodDescription,
                                            botFortified.bottleBarcode as prodBottle,
                                            botFortified.bottlePrintedForMother as prodMother,
                                            botFortified.bottlePrintedForBaby as prodBaby,
                                            botFortified.activityID as prodOrder,
                                            (botFortified.bottleFedVolume > 0) as bottleFed,
                                            (botFortified.bottleUsedVolume > 0) as bottleUsed,
                                            (botFortified.bottleDisposedVolume > 0 OR botFortified.bottleLastAction = 100) as bottleDisposed
                                FROM bottles botFortified
                                    INNER JOIN viewfortificationbarcodes vfa ON vfa.Barcode = botFortified.bottleBarcode
                                    INNER JOIN bottlesources bs ON bs.bottlesourceID = vfa.fortentryID AND bs.sourceType = 'ADDITIVE'
                                    INNER JOIN activitymaster am ON am.activityID = bs.activityID
                        -- INNER JOIN bottles botFortified on botFortified.activityID = bs.activityID
                        -- INNER JOIN bottles botFortified on botFortified.bottleFortification = fe.fortentryFortification
                        -- INNER JOIN fortifications fort on fort.fortID = botFortified.bottleFortification
                                WHERE botFortified.bottleBarcode = barcode) ) trans

                                WHERE 	prodTransactionDate IS NOT NULL AND
                    prodTransactionDate > 0 AND
                    prodTransactionDate < NOW()
                                ORDER BY prodTransactionDate, prodDescription = "Received" DESC, prodDescription = "Created in Hospital" DESC, prodDescription = "Opened" DESC, prodDescription <> "Disposed" DESC;
                ELSE
                SELECT * FROM (
                    (SELECT nprh.created_at as prodTransactionDate,
                                        CASE WHEN npr.formulaProductWasReceivedAdHoc > 0 THEN
                                            CONCAT("Received (Direct Scan)",(SELECT CONCAT(" By : ",IF (usingLDAP = 1, userRemoteLoginUsername, userLoginBarcode)) FROM users WHERE users.userID = nprh.userID))
                                        ELSE
                                            CONCAT("Received",(SELECT CONCAT(" By : ",IF (usingLDAP = 1, userRemoteLoginUsername, userLoginBarcode)) FROM users WHERE users.userID = nprh.userID))
                                        END as prodDescription,
                                        null as prodBottle,
                                        null as prodMother,
                                        null as prodBaby,
                                        null as prodOrder,
                                        null as bottleFed,
                                        null as bottleUsed,
                                        null as bottleDisposed
                                FROM nutrition_products_received npr INNER JOIN nutrition_products_received_history nprh
                                    ON npr.formulaproductID = nprh.formulaproductID
                                WHERE nprh.formulaproductHistoryAction = 30 AND npr.formulaProductBarcode = barcode)
                                UNION
                                (SELECT nprh.created_at as prodTransactionDate,
                                        CONCAT("Unpacked from <%|",(SELECT formulaProductBarcode FROM nutrition_products_received npr2 WHERE npr2.formulaproductID = npr.formulaproductSourceID), "|%>" ,(SELECT CONCAT(" by : ",IF (usingLDAP = 1, userRemoteLoginUsername, userLoginBarcode)) FROM users WHERE userID = nprh.userID)) as prodDescription,
                                        null as prodBottle,
                                        null as prodMother,
                                        null as prodBaby,
                                        null as prodOrder,
                                        null as bottleFed,
                                        null as bottleUsed,
                                        null as bottleDisposed
                                FROM nutrition_products_received npr INNER JOIN nutrition_products_received_history nprh
                                        ON nprh.formulaproductID = npr.formulaproductID
                                WHERE npr.formulaProductBarcode = barcode AND formulaproductHistoryAction = 33 AND formulaproductSourceID IS NOT NULL)
                                UNION
                                (SELECT 	nprh.created_at as prodTransactionDate,
                                            (CASE WHEN formulaproductDispensedTo = 0 THEN CONCAT("Dispensed to Outpatient ","</br>Notes: ",IFNULL(nprh.formulaproductHistoryNotes,' '))  ELSE 'Dispensed' END) as prodDescription ,
                                            null as prodBottle,
                                            null as prodMother,
                                            formulaproductDispensedTo as prodBaby,
                                            null as prodOrder,
                                            null as bottleFed,
                                            null as bottleUsed,
                                            null as bottleDisposed
                                FROM nutrition_products_received npr INNER JOIN nutrition_products_received_history nprh
                                    ON npr.formulaproductID = nprh.formulaproductID
                                WHERE npr.formulaProductBarcode = barcode AND nprh.formulaproductHistoryAction = 98)
                                UNION
                                (SELECT nprh.created_at as prodTransactionDate,
                                        "Opened" as prodDescription,
                                            null as prodBottle,
                                            null as prodMother,
                                            null as prodBaby,
                                            null as prodOrder,
                                            null as bottleFed,
                                            null as bottleUsed,
                                            null as bottleDisposed
                                 FROM nutrition_products_received npr INNER JOIN nutrition_products_received_history nprh
                                    ON npr.formulaproductID = nprh.formulaproductID
                                WHERE npr.formulaProductBarcode = barcode AND nprh.formulaproductHistoryAction = 35)
                                UNION
                                (SELECT 	npr.formulaproductExpiryDateTime as prodTransactionDate,
                                            "Expired" as prodDescription,
                                            null as prodBottle,
                                            null as prodMother,
                                            null as prodBaby,
                                            null as prodOrder,
                                            null as bottleFed,
                                            null as bottleUsed,
                                            null as bottleDisposed
                                FROM nutrition_products_received npr
                                WHERE npr.formulaProductBarcode = barcode)
                                UNION
                                (SELECT 	(SELECT created_at
                                        FROM nutrition_products_received_history
                                        WHERE nutrition_products_received_history.formulaproductID = npr.formulaproductID AND formulaproductHistoryAction = 95) as prodTransactionDate,
                                            CASE WHEN npr.formulaproductUnitQuantityReceived = npr.formulaproductQuantityUsed THEN
                                                CONCAT_WS('',  'Unpacked to: ',
                                                    (   SELECT GROUP_CONCAT(CONCAT("<%|",npr2.formulaproductBarcode, "|%>") SEPARATOR ', ')
                                                                FROM nutrition_products_received npr2
                                                                WHERE npr2.formulaproductSourceID = npr.formulaproductID
                                                            ),
                                                            (   SELECT GROUP_CONCAT( CONCAT("<%|",bottleBarcode, "|%>") SEPARATOR ', ')
                                                                FROM bottles bot INNER JOIN bottlesources bs ON bs.activityID = bot.activityID
                                                                WHERE   bs.sourceRecordID = npr.formulaproductID AND
                    bot.bottleDateTimeReceived IS NOT NULL
                                                            ),
                                                            (   SELECT CONCAT(" by : ",IF (usingLDAP = 1, userRemoteLoginUsername, userLoginBarcode))
                                                                FROM users
                                                                WHERE userID = npr.createdBy
                                                            )
                                                         )
                                                ELSE "Emptied"
                                            END as prodDescription,
                                            null as prodBottle,
                                            null as prodMother,
                                            null as prodBaby,
                                            null as prodOrder,
                                            null as bottleFed,
                                            null as bottleUsed,
                                            null as bottleDisposed
                                FROM nutrition_products_received npr
                                WHERE npr.formulaProductBarcode = barcode)
                                UNION
                                (SELECT 	(SELECT created_at
                                        FROM nutrition_products_received_history
                                        WHERE nutrition_products_received_history.formulaproductID = npr.formulaproductID AND formulaproductHistoryAction = 100) as prodTransactionDate,
                                            "Disposed" as prodDescription,
                                            null as prodBottle,
                                            null as prodMother,
                                            null as prodBaby,
                                            null as prodOrder,
                                            null as bottleFed,
                                            null as bottleUsed,
                                            null as bottleDisposed
                                FROM nutrition_products_received npr
                                WHERE npr.formulaProductBarcode = barcode)
                                UNION
                                (SELECT 	(SELECT created_at
                                        FROM nutrition_products_received_history
                                        WHERE nutrition_products_received_history.formulaproductID = npr.formulaproductID AND formulaproductHistoryAction = 105) as prodTransactionDate,
                                            "Recalled" as prodDescription,
                                            null as prodBottle,
                                            null as prodMother,
                                            null as prodBaby,
                                            null as prodOrder,
                                            null as bottleFed,
                                            null as bottleUsed,
                                            null as bottleDisposed
                                FROM nutrition_products_received npr
                                WHERE npr.formulaProductBarcode = barcode)
                                UNION
                                (SELECT 	(SELECT created_at
                                        FROM nutrition_products_received_history
                                        WHERE nutrition_products_received_history.formulaproductID = npr.formulaproductID AND formulaproductHistoryAction = 220) as prodTransactionDate,
                                            "Returned after Dispensed" as prodDescription,
                                            null as prodBottle,
                                            null as prodMother,
                                            null as prodBaby,
                                            null as prodOrder,
                                            null as bottleFed,
                                            null as bottleUsed,
                                            null as bottleDisposed
                                FROM nutrition_products_received npr
                                WHERE npr.formulaProductBarcode = barcode)
                                UNION
                                (SELECT 	am.activityDateTime as prodTransactionDate,
                                            "Product Used In Bottle" as prodDescription,
                                            bot.bottleBarcode as prodBottle,
                                            bot.bottlePrintedForMother as prodMother,
                                            bot.bottlePrintedForBaby as prodBaby,
                                            bot.activityID as prodOrder,
                                            (bot.bottleFedVolume > 0) as bottleFed,
                                            (bot.bottleUsedVolume > 0) as bottleUsed,
                                            (bot.bottleDisposedVolume > 0 OR bot.bottleLastAction = 100) as bottleDisposed
                                FROM nutrition_products_received npr
                                INNER JOIN viewfortificationbarcodes vfa ON vfa.Barcode = npr.formulaproductBarcode
                                INNER JOIN bottlesources bs ON bs.bottlesourceID = vfa.fortentryID
                                INNER JOIN activitymaster am ON am.activityID = bs.activityID
                                INNER JOIN bottles bot on bot.activityID = bs.activityID
                        -- INNER JOIN fortifications fort on fort.fortID = bot.bottleFortification
                                WHERE npr.formulaProductBarcode = barcode)
                                UNION
                                (SELECT 	nprh.created_at as prodTransactionDate,
                                            CONCAT("Moved", IFNULL(CONCAT(" from ",locFrom.locationName), ""), IFNULL(CONCAT(" to ",locTo.locationName), ""), (SELECT CONCAT(" by : ",IF (usingLDAP = 1, userRemoteLoginUsername, userLoginBarcode)) FROM users WHERE userID = nprh.userID),
                                                    IFNULL(CONCAT("<br\>Changed expiration to <%d", nprh.formulaproductHistoryToExpiryDate, "d%>") ,"")) as prodDescription,
                                            null as prodBottle,
                                            null as prodMother,
                                            null as prodBaby,
                                            null as prodOrder,
                                            null as bottleFed,
                                            null as bottleUsed,
                                            null as bottleDisposed
                                FROM nutrition_products_received npr
                                INNER JOIN nutrition_products_received_history nprh ON npr.formulaproductID = nprh.formulaproductID
                                LEFT JOIN locations locFrom ON nprh.formulaproductHistoryFromLocation = locFrom.locationID -- assumption: entering product into the system might qualify as a move with no From
                                LEFT JOIN locations locTo ON nprh.formulaproductHistoryFromLocation = locTo.locationID
                                WHERE npr.formulaProductBarcode = barcode AND nprh.formulaproductHistoryAction = 80)
                                ) trans

                                WHERE 	prodTransactionDate IS NOT NULL AND
                    prodTransactionDate > 0 AND
                    prodTransactionDate < NOW()
                                ORDER BY prodTransactionDate, prodDescription = "Received" DESC, prodDescription = "Opened" DESC, prodDescription <> "Disposed" DESC;
                END IF;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPROC_productView` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SPROC_productView`(IN `barcodeIN` VARCHAR(255)
            )
BEGIN
            -- This isn't a view (even though it looks like it ought to be) because we want to provide a parameter to the nested select necessary to normalize the data across product types) and a view just won't let you do that.
            -- Applying the WHERE after the union will likely cause performance issues on larger datasets vs using this procedure.
                    (SELECT
                        npt.formtypeID as ProductID,
                        npt.formtypeName as ProductName,
                        npti.formtypeMeasurementUnit as UnitOfMeasurement,
                        npfft.name as FormFactorName,
                        CASE WHEN loc.locationName IS NOT NULL
                            THEN loc.locationName
                        ELSE 'Unstored' END as LocationName,
                        npr.formulaProductBarcode as Barcode,
                        ((SELECT nprh.created_at 
                                        FROM nutrition_products_received_history nprh
                                        WHERE nprh.formulaproductID = npr.formulaproductID AND formulaproductHistoryAction = 35) IS NOT NULL) as HasBeenOpened,
                        (SELECT nprh.created_at 
                                        FROM nutrition_products_received_history nprh
                                        WHERE nprh.formulaproductID = npr.formulaproductID AND formulaproductHistoryAction = 35) As DateTimeOpened,
                        (SELECT nprh.created_at 
                                        FROM nutrition_products_received_history nprh
                                        WHERE nprh.formulaproductID = npr.formulaproductID AND formulaproductHistoryAction = 30) As DateTimeReceived,
                        (SELECT nprh.created_at 
                                        FROM nutrition_products_received_history nprh
                                        WHERE nprh.formulaproductID = npr.formulaproductID AND formulaproductHistoryAction = 95) As DateTimeEmptied,
                        (SELECT nprh.created_at 
                                        FROM nutrition_products_received_history nprh
                                        WHERE nprh.formulaproductID = npr.formulaproductID AND formulaproductHistoryAction = 100) As DateTimeDisposed,
                        npr.formulaproductUnitVolume as ReceivedVolume,
                        SUM(IFNULL(bs.sourceVolumeUsed,0)) as UsedVolume,
                        (npr.formulaproductUnitVolume - npr.formulaproductUnitVolumeUsed) AS AvailableVolume,
                        npr.formulaproductUnitQuantityReceived as ReceivedQuantity,
                        npr.formulaproductQuantityUsed as UsedQuantity,
                        (npr.formulaproductUnitQuantityReceived - npr.formulaproductQuantityUsed) AS AvailableQuantity,
                        npr.formulaproductLot as Lot,
                        npr.formulaproductExpiryDateTime as DateTimeExpired,
                        
                        npt.formtypeType as FormType,
                        fdr.reasonName as DisposalReason,
                        npr.formulaproductForBaby as ProductBaby
                        FROM  nutrition_products_received npr
                                INNER JOIN nutrition_product_types npt ON npr.formulaproductFormulaTypesID =  npt.formtypeID
                                INNER JOIN nutrition_product_type_items npti ON npti.formtypeID =  npt.formtypeID
                                LEFT JOIN locations loc ON npr.formulaProductLocation = loc.locationID
                                INNER JOIN nutrition_product_type_form_factors nptff ON npr.producttypeformfactorsID = nptff.id
                                INNER JOIN nutrition_product_form_factor_types npfft ON npfft.id = nptff.formfactortypeID
                                LEFT JOIN formula_disposalreasons fdr ON npr.formulaproductDisposeReason = fdr.reasonID
                                LEFT JOIN viewfortificationbarcodes vfa ON vfa.Barcode = npr.formulaproductBarcode
                                      LEFT JOIN bottlesources bs ON vfa.fortEntryID = bs.bottlesourceID AND bs.sourceType = 'ADDITIVE'
                            WHERE npr.formulaProductBarcode = `barcodeIN`
                            GROUP BY npr.formulaproductBarcode)
            UNION
                    (SELECT
                        npt.formtypeID as ProductID,
                        npt.formtypeName as ProductName,
                        npti.formtypeMeasurementUnit as UnitOfMeasurement,
                        'RTF Bottle' as FormFactorName,
                        CASE WHEN loc.locationName IS NOT NULL
                            THEN loc.locationName
                        ELSE 'Unstored' END as LocationName,
                        bot.bottleBarcode as Barcode,
                        BIT_OR(SFUNC_actionOpensBottle(bh.bothistaction))  as HasBeenOpened,
                        MIN(IF(SFUNC_actionOpensBottle(bh.bothistaction), bh.bothistDateTime, '9999-12-31 23:59:59')) as DateTimeOpened, -- TODO: change this if Timeless is still operating on my code in 7000 years
                        MIN(IFNULL(bot.bottleDateTimeReceived,IF(bh.botHistAction IN(1,30,40) AND bot.formtypeID = NULL, bh.bothistDateTime, null))) as DateTimeReceived,
                        MAX(IF(bh.botHistAction = 100, bh.bothistDateTime, null)) as DateTimeEmptied,
                        MAX(IF(bh.botHistAction = 100, bh.bothistDateTime, null)) as DateTimeDisposed,
                        bot.bottleReceivedVolume as ReceivedVolume,
                        (IFNULL(bot.bottleFedVolume, 0) + IFNULL(bot.bottleUsedVolume,0) + IFNULL(bot.bottleDisposedVolume,0)) as UsedVolume,
                        (bot.bottleReceivedVolume - (IFNULL(bot.bottleFedVolume, 0) + IFNULL(bot.bottleUsedVolume,0) + IFNULL(bot.bottleDisposedVolume,0))) AS AvailableVolume,
                        1 as ReceivedQuantity,
                        IF((bot.bottleReceivedVolume = (IFNULL(bot.bottleFedVolume, 0) + IFNULL(bot.bottleUsedVolume,0) + IFNULL(bot.bottleDisposedVolume,0))),1,0) as UsedQuantity,
                        IF((bot.bottleReceivedVolume = (IFNULL(bot.bottleFedVolume, 0) + IFNULL(bot.bottleUsedVolume,0) + IFNULL(bot.bottleDisposedVolume,0))),0,1) AS AvailableQuantity,
                        (CASE WHEN bot.bottleLotNumber IS NULL
                                THEN
                                    (SELECT GROUP_CONCAT(DISTINCT bsRecords.bottleLotNumber)
                                   FROM bottlesources bs, bottles bsRecords
                                   WHERE bs.activityID = bot.activityID AND 
                                         bs.sourceRecordID = bsRecords.bottleID AND 
                                         NOT bsRecords.bottleLotNumber IS NULL AND NOT bot.activityID IS NULL)
                                ELSE
                                     GROUP_CONCAT(DISTINCT bot.bottleLotNumber)
                            END) as Lot,
                        bot.bottleExpiryDateTime as DateTimeExpired,
                        1 as FormType,
                        dr.reasonName as DisposalReason,
                        bot.bottlePrintedForBaby as ProductBaby
                        FROM  bottles bot
                                INNER JOIN nutrition_product_types npt ON bot.formtypeID =  npt.formtypeID
                                INNER JOIN nutrition_product_type_items npti ON npti.formtypeID =  npt.formtypeID
                                LEFT JOIN locations loc ON bot.bottleLocation = loc.locationID
                                INNER JOIN bottlehistory bh ON bh.bothistbottle = bot.bottleID
                                      LEFT JOIN disposalreasons dr ON bot.bottleDisposalReason = dr.reasonID
                            WHERE bot.bottleBarcode = `barcodeIN`
                            GROUP by bot.bottleID);
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPROC_userEditAuditReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SPROC_userEditAuditReport`(
    IN `dw_name` varchar(255),
	IN `fromTime` DATETIME,
	IN `toTime` DATETIME,
	IN `userID` VARCHAR(255),
	IN `editedID` VARCHAR(255),
	IN `usingLDAP` INT

)
BEGIN

SET @table := CONCAT(dw_name,'.changelog');
SET @userWhere = '';
IF( userID <> '') THEN
	SET @userWhere = CONCAT_WS('', ' AND ',IF(usingLDAP = 1, 'us.userRemoteLoginUsername', 'us.userLoginBarcode'),' IN ("',userID,'")');
END IF;

SET @editedWhere = '';
IF( editedID <> '') THEN
	SET @editedWhere = CONCAT_WS('', ' AND ',IF(usingLDAP = 1, 'u.userRemoteLoginUsername', 'u.userLoginBarcode'),' IN ("',editedID,'")');
END IF;


SET @STATE = CONCAT_WS('',"SELECT clogDateTime, clogUser,us.userLoginBarcode, CONCAT(us.userFirstName,' ',us.userLastName)as UserEditor, clogRowID,clogDetails,u.userLoginBarcode, CONCAT(u.userFirstName,' ',u.userLastName) as UserEdited
					from ",@table,"
							LEFT JOIN users us ON clogUser = us.userID
							LEFT JOIN users u ON clogRowID = u.userID
					WHERE clogOperation = 2 AND
							clogUser <> -1 AND
							clogDetails NOT LIKE '%userLastIPAddress%' AND
							clogDetails NOT LIKE ('"'{"user_permission_overrides":"null"}'"') AND
							clogDateTime >= '",fromTime,"' AND
							clogDateTime <= '",toTime,"' AND
							clogTable IN ('users')",@userWhere,"",@editedWhere,"");



   PREPARE stmt FROM @STATE;
   EXECUTE stmt;
   DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPROC_volumeReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SPROC_volumeReport`(
                IN `fromDate` DATETIME,
            IN `toDate` DATETIME,
            IN `motherID` INT,
            IN `babyID` INT,
            IN `locationID` INT,
            IN `milkBankID` INT,
            IN `showMaternal` BOOLEAN,
            IN `showMothersWithPrintedBottleLabels` BOOLEAN,
            IN `showMothersThatHaveBabiesWithBreastmilkOrders` BOOLEAN,
            IN `showDonor` BOOLEAN,
            IN `babyUnits` VARCHAR(1024)
        )
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'This stored procedure returns the volume of milk received and available meeting passed-in criteria, grouped by mother.'
BEGIN
            /*Author: Jonathan Pugsley
            Date Created: August 16th, 2017
            Ticket Reference: WS-4936 (   http://jira.timelessmedical.com/jira/browse/WS-4936   )
            Date Modified: October 20 2017
            Ticket Reference: BFPDR-410 ( http://jira.timelessmedical.com/jira/browse/BFPDR-410 )
            Date Modified: December 18 2017
            Ticket Reference: BFPDR-892 ( http://jira.timelessmedical.com/jira/browse/BFPDR-892 )
            Parameters:
                IN `fromDate` DATETIME, -- fetch all milk that was received after this date.  Any standard datetime (e.g. YYYY-MM-DD hh:mm:ss) is expected.  Null to get milk from the beginning of time.
                IN `toDate` DATETIME, -- fetch all milk that was received before this date.  Any standard datetime (e.g. YYYY-MM-DD hh:mm:ss) is expected.  Null for all milk until the end of time.
                IN `motherID` INT, -- the row ID of the mother who's milk should be found.  Barcode is not accepted at this point in time.  NULL to fetch all mothers.
                IN `babyID` INT, -- the row ID of the baby who's milk should be found.  Barcode is not accepted at this point in time.  NULL to fetch all babies.
                                    IF BABY ID AND MOTHER ID ARE SET THE BABY WILL TAKE PRIORITY
                                    This report finds all milk *available* to the baby, not all milk *assigned* to the baby (i.e. it finds milk belonging to the baby's mother)
                IN `locationID` INT -- the row ID of the location to look for bottles in.  NULL to search all storage locations.
                IN `milkBankID` INT, -- the row ID of the milk bank who's donor bottles should be found.  NULL to fetch all milk banks
                IN `showMaternal` BOOLEAN, -- whether or not to show EBM.  NULL shows EBM.
                IN `showDonor` BOOLEAN -- whether or not to show DBM.  NULL shows DBM.
                IN `babyUnits` VARCHAR(1024) -- a comma-delimited list of unit IDs.  Only return mother's who have a baby in one of the specified units.  NULL shows all units.
                IN `babyUnits` VARCHAR(1024) -- a comma-delimited list of unit IDs.  Only return mother's who have a baby in one of the specified units.  NULL shows all units.
                IN `showMothersWithPrintedBottleLabels` BOOLEAN -- whether or not to show mothers who have bottle labels printed, but no bottles received.
            Returns:
                A table containing the total milk received, and currently available (not expired, fed, disposed) grouped by source (mother or milk bank)
                |Source Name|Source Barcode|Mother Identifier (if from mother; NULL if from milk bank)|List of active babies the mother has|Total Milk Volume Recieved|Total Milk Bottles Received|Total Useable milk volume in the system|Total useable bottles in the system|
                    Plus |Volume Received|Volume Available|Bottles Received|BottlesAvailable| for each receivable, active milk type*/

        -- Setup our local variables
            DECLARE currentRank INT;  -- currentRank: how many levels/generations of split/combine we've looked at so far.
            DECLARE rowCount INT;  -- rowCount: how many rows we found last time we incremented rank.  If this is 0, we didn't find any more descendents via split/combine and we can stop checking.
                SET @@group_concat_max_len = 16384; -- system variable; reset on connection; maximum number of bytes a GROUP_CONCAT should concatenate to
            SET currentRank = 0;
            SET rowCount = 1;
            IF(babyID IS NOT NULL AND babyID <> '') THEN -- find all bottles for its mother
                                                                                 SET motherID = (SELECT b.babyMother FROM babies b WHERE b.babyID = babyID LIMIT 1);
            END IF;

            /* tBottles: this table is our master list of all bottles that match the query criteria. (t = temp)
                We stick our bottle data in here, then query from it to get the final table returned*/
            DROP TEMPORARY TABLE IF EXISTS tBottles;
            SET @makeTemporaryBottlesTable = 'CREATE TEMPORARY TABLE tBottles (UNIQUE KEY (BottleID)) AS (
                SELECT 	bot.bottleID as BottleID,

                        bot.bottleReceivedVolume as ReceivedVolume,

                        CASE 	WHEN (bot.bottleExpiryDateTime <= NOW()) THEN -- it\'s expired, don\'t bother summing or tracing it through the system
                                    0
                                ELSE
                                    bot.bottleReceivedVolume - (IFNULL(bot.bottleFedVolume,0) + IFNULL(bot.bottleDisposedVolume,0) + IFNULL(bot.bottleUsedVolume,0))
                        END as AvailableVolume,

                        IFNULL(bot.bottleUsedVolume, 0) as UsedVolume,

                        CASE 	WHEN (mot.motherFirstName IS NOT NULL OR mot.motherLastName IS NOT NULL) THEN -- we have useful mother info - display it preferentially
                                    CONCAT(mot.motherLastName,\', \',mot.motherFirstName)
                                WHEN (dmb.formtypeName IS NOT NULL OR dmb.formtypeName <> \'\') THEN -- If we don\'t have a mother, do we have a milk bank?
                                    GROUP_CONCAT(DISTINCT dmb.formtypeName SEPARATOR \'; \')
                                ELSE -- this is a weird bottle that is either in an invalid state, or was introduced into the system in a way that this procedure will have to be modified for later.
                                    NULL
                        END as Source,

                        CASE 	WHEN (mot.MotherBarcode IS NOT NULL) THEN
                                    mot.MotherBarcode
                                ELSE
                                    NULL
                        END as SourceBarcode,

                        mot.motherID AS MotherIdentifier,

                        (SELECT GROUP_CONCAT(b.babyID, \'=>\',b.babyLastName, \', \', b.babyFirstName,\'=>\',b.babyRoom,\'=>\',b.babyBedNumber SEPARATOR \' / \') FROM babies b WHERE babyMother = mot.motherID ) as PatientsData,

                        0 as BottleRank,
                        bottleLastAction as BotLastAction

                FROM `bottles` bot
                        LEFT OUTER JOIN `mothers` mot ON mot.motherID = bot.bottlePrintedForMother
                        LEFT OUTER JOIN `donor_bottle_milk_bank_batches` dbmbb ON bot.bottleID = dbmbb.dbmbbBottleID
                        LEFT OUTER JOIN `nutrition_product_types` dmb ON dbmbb.formtypeID = dmb.formtypeID
                        LEFT OUTER JOIN `locations` loc ON bot.BottleLocation = loc.locationID

                WHERE (bot.bottleDateTimeReceived IS NOT NULL';

                if (showMothersWithPrintedBottleLabels) THEN
                    SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable," OR bot.bottleLastAction = 20 ");
                END IF;

                SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable, " ) AND (bot.bottlePercentFormula IS NULL OR bot.bottlePercentFormula = 0) ");


            -- tweak our WHERE clause based on the inputs
            IF(babyUnits IS NOT NULL AND babyUnits <> '') THEN
              SET @validUnits = babyUnits;
              SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable, ' AND (mot.motherID in (
                (SELECT DISTINCT motunit.motherID
                FROM mothers AS motunit
                LEFT JOIN babies AS bunit ON bunit.babyMother = motunit.motherID
                WHERE FIND_IN_SET(babyUnit,@validUnits) and bunit.babyActive = 1))) ');
           ELSE
                    SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable, ' AND (mot.motherID in (
                    (SELECT DISTINCT m.motherID
                    FROM mothers AS m
                    LEFT JOIN babies AS b ON b.babyMother = m.motherID
                    WHERE b.babyActive = 1))) ');

            END IF;
            IF(fromDate IS NOT NULL) THEN
              SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable," AND (bot.bottleDateTimeReceived >= '",fromDate,"')");
            END IF;
            IF(toDate IS NOT NULL) THEN
              SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable," AND (bot.bottleDateTimeReceived <= '",toDate,"')");
            END IF;
            IF(locationID IS NOT NULL AND locationID <> '') THEN
              SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable," AND (loc.locationID = ",locationID,")");
            END IF;
             -- Since we query both EBM and DBM we need to handle the ids a little different here.  The ORs necessitate a different structure
            IF((motherID IS NOT NULL AND motherID <> '') OR (milkBankID IS NOT NULL AND milkBankID <> '')) THEN
               SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable," AND ( 1=0"); -- 1=0 lets us use OR (Clause) and not worry if there is something in front of it.  This clause is only added if we have something to look at, so it won't cause us issues.
                IF(motherID IS NOT NULL AND motherID <> '') THEN
                  SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable," OR (mot.motherID = ",motherID,")");
                END IF;
                IF(milkBankID IS NOT NULL AND milkBankID <> '') THEN
                  SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable," OR (dmb.formtypeID = ",milkBankID,")");
                END IF;
                SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable,")");
            END IF;
            -- We need to do aliases as HAVING since they get calculated after the WHERE.  Note that this is a performance tradeoff with maintainability (if this is ever too slow, consider duplicating the alias definition into the WHERE clause
            IF(showMaternal IS NOT NULL OR showDonor IS NOT NULL) THEN
              SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable,"GROUP BY bottleID HAVING 1=0"); -- 1=0 lets us use OR (Clause) and not worry if there is something in front of it.  HAVING is only added if we have something to look at, so it won't cause us issues.
                IF(showMaternal) THEN
                  SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable," OR (MotherIdentifier IS NOT NULL)");
                END IF;
                IF(showDonor) THEN
                  SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable," OR (MotherIdentifier IS NULL)");
                END IF;
            END IF;
            -- Close it up
            SET @makeTemporaryBottlesTable = CONCAT(@makeTemporaryBottlesTable,");");
            -- Actually make the table
            PREPARE stmtTBottles FROM @makeTemporaryBottlesTable;
            EXECUTE stmtTBottles;
            DEALLOCATE PREPARE stmtTBottles;

            -- trace the milk all the way down to whichever bottles it's currently in.  If there is useful volume along the way, record that too.
            WHILE (rowCount > 0) DO
              /* nextGeneration: this table holds all milk produced via split/combine from a bottle that meets the search criteria.
            Note: https://bugs.mysql.com/bug.php?id=10327: cannot reference a temporary table twice in the same query
                So we make another temporary table to hold information we might want to query while performing an insert
            */
            DROP TEMPORARY TABLE IF EXISTS nextGenerationBottles;
            CREATE TEMPORARY TABLE nextGenerationBottles AS ( -- We don't want to add the same bottle twice if it traces back to two ancestors in the date range, so we enforce uniqueness
                        SELECT 	bot.bottleID as BottleID,
                                bot.bottleReceivedVolume as ReceivedVolume,
                                CASE WHEN (bot.bottleExpiryDateTime <= NOW()) THEN -- it\'s expired, don\'t bother summing or tracing it through the system
                                    0
                                ELSE
                                    bot.bottleReceivedVolume - (IFNULL(bot.bottleFedVolume,0) + IFNULL(bot.bottleDisposedVolume,0) + IFNULL(bot.bottleUsedVolume,0))
                                END as AvailableVolume,
                                bot.bottleUsedVolume as UsedVolume,
                                tb.Source as Source,
                                tb.SourceBarcode as SourceBarcode,
                                tb.MotherIdentifier as MotherIdentifier,
                                tb.PatientsData as PatientsData,
                                currentRank+1 as BottleRank,
                                bot.bottleLastAction as BotLastAction
                            FROM tBottles tb 	INNER JOIN bottlesources bs ON tb.BottleID = bs.sourceRecordID
                                                INNER JOIN bottles bot ON bs.activityID = bot.activityID
                            WHERE tb.BottleRank = currentRank AND bs.sourceType = 'BASE'
                    );
              INSERT IGNORE INTO tBottles -- IGNORE: If we have a duplicate bottle (duplicate BottleID) just skip it.  No record is added.
                SELECT * FROM nextGenerationBottles ngb;
              SET rowCount = ROW_COUNT(); -- if we had any new entries we need to loop at least once more to find their descendents)
              SET currentRank = currentRank + 1;
            END WHILE;

            -- Here we encounter https://bugs.mysql.com/bug.php?id=10327 again.
            -- We can't sum by distinct bottle id since we can;t group by it without losing our milk type sums
                -- We can't do a subquery due to the MySQL bug that prevents us from opening tBotttles twice
            -- We can't do scaling e.g. (SUM(CASE WHEN BottleRank = 0 THEN IFNULL(ReceivedVolume, 0) ELSE 0 END) * COUNT(DISTINCT tb.BottleID) / COUNT(*)) as TotalReceivedVolume
                -- Because of rounding quirks.  Decimals come out of nowhere.
                -- So we make a new table and join to it.
                DROP TEMPORARY TABLE IF EXISTS totalSumsNoMilkTypes;
            CREATE TEMPORARY TABLE totalSumsNoMilkTypes AS (
                SELECT 	Source as Source,
                        SUM(CASE WHEN BottleRank = 0 THEN IFNULL(ReceivedVolume, 0) ELSE 0 END) as TotalReceivedVolume,
                        SUM(CASE WHEN AvailableVolume > 0  AND BotLastAction !=81 THEN IFNULL(AvailableVolume,0) ELSE 0 END) as TotalAvailableVolume,
                        COUNT(DISTINCT CASE WHEN BottleRank = 0 AND BotLastAction != 20 THEN BottleID END) as TotalReceivedBottles,
                        SUM(CASE WHEN AvailableVolume > 0  AND BotLastAction !=81 THEN 1 ELSE 0 END) as TotalAvailableBottles,
                        SUM(CASE WHEN AvailableVolume > 0  AND BotLastAction =81 THEN 1 ELSE 0 END) as TotalSentToHomeBottles,
                        SUM(CASE WHEN AvailableVolume > 0  AND BotLastAction =81 THEN IFNULL(AvailableVolume,0) ELSE 0 END) as TotalSentToHomeVolume
                    FROM tBottles
                    GROUP BY Source

            );

            -- consolidate the individual bottles to get our mother statistics and pass it back to the caller.
                SET @calculateMilkStatistics = 'SELECT * FROM (SELECT 	tb.Source,
                    tb.SourceBarcode as SourceBarcode,
                    tb.MotherIdentifier as MotherIdentifier,
                    tb.PatientsData as PatientsData,
                    ts.TotalReceivedVolume as TotalReceivedVolume,
                    ts.TotalAvailableVolume as TotalAvailableVolume,
                    ts.TotalReceivedBottles as TotalReceivedBottles,
                    ts.TotalAvailableBottles as TotalAvailableBottles,
                    ts.TotalSentToHomeBottles as TotalSentToHomeBottles,
                    ts.TotalSentToHomeVolume as TotalSentToHomeVolume';

            SELECT GROUP_CONCAT(CONCAT(' 	SUM(CASE WHEN mtb.milktypebottlesMilktypeID = ', milktypeID, ' AND BottleRank = 0 THEN IFNULL(ReceivedVolume, 0) ELSE 0 END) as ', milktypeID, 'ReceivedVolume,
                                            SUM(CASE WHEN mtb.milktypebottlesMilktypeID = ', milktypeID, ' THEN IFNULL(AvailableVolume, 0) ELSE 0 END) as ', milktypeID, 'AvailableVolume,
                                            SUM(CASE WHEN mtb.milktypebottlesMilktypeID = ', milktypeID, ' AND BottleRank = 0 THEN 1 ELSE 0 END) as ', milktypeID, 'ReceivedBottles,
                                            SUM(CASE WHEN mtb.milktypebottlesMilktypeID = ', milktypeID, ' AND tb.AvailableVolume > 0 THEN 1 ELSE 0 END) as ', milktypeID, 'AvailableBottles') SEPARATOR ', ')
                    INTO @dynamicMilkTypeReturnColumns
                    FROM milktypes
                    WHERE milktypeUseInReceiveEBM = 1 AND milktypeActive = 1;

            IF(@dynamicMilkTypeReturnColumns IS NOT NULL and @dynamicMilkTypeReturnColumns != '') THEN
                SET @calculateMilkStatistics = CONCAT(@calculateMilkStatistics, ', ', @dynamicMilkTypeReturnColumns);
            END IF;
            SET @calculateMilkStatistics = CONCAT(@calculateMilkStatistics,
                    ' FROM tBottles tb LEFT OUTER JOIN milktypes_bottles mtb ON tb.BottleID = mtb.milktypebottlesBottleID
                                                                    LEFT OUTER JOIN milktypes mt ON mtb.milktypebottlesMilktypeID = mt.milktypeID
                                                                                                          AND (mt.milktypeUseInReceiveEBM = 1 OR mt.milktypeID IS NULL)
                                                                                                          AND mt.milktypeActive = 1
                                                                    INNER JOIN totalSumsNoMilkTypes ts ON tb.Source = ts.Source
                                                                    GROUP BY tb.Source');

            IF (showMothersThatHaveBabiesWithBreastmilkOrders) THEN
                SET @calculateMilkStatistics = CONCAT(@calculateMilkStatistics, '
                UNION
                    SELECT

                        CASE 	WHEN (mot.motherFirstName IS NOT NULL OR mot.motherLastName IS NOT NULL) THEN -- we have useful mother info - display it preferentially
                            CONCAT(mot.motherLastName,\', \',mot.motherFirstName)
                        ELSE -- this is a weird bottle that is either in an invalid state, or was introduced into the system in a way that this procedure will have to be modified for later.
                            NULL
                       END as Source,
                       mot.motherBarcode as SourceBarcode,
                       mot.motherID as MotherIdentifier,
                       (SELECT GROUP_CONCAT(b.babyID, \'=>\',b.babyLastName, \', \', b.babyFirstName,\'=>\',b.babyRoom,\'=>\',b.babyBedNumber SEPARATOR \' / \') FROM babies b WHERE  babyMother = mot.motherID AND b.babyID = babyID) as PatientsData,
                       0 as TotalReceivedVolume,
                        0 as TotalAvailableVolume,
                        0 as TotalReceivedBottles,
                        0 as TotalAvailableBottles,
						0 as TotalSentToHomeBottles,
                        0 as TotalSentToHomeVolume ');


                SELECT GROUP_CONCAT(CONCAT(' 0 as', milktypeID, 'ReceivedVolume,
                        0 as ', milktypeID, 'AvailableVolume,
                        0 as ', milktypeID, 'ReceivedBottles,
                        0 as ', milktypeID, 'AvailableBottles') SEPARATOR ', ')
                            INTO @dynamicMilkTypeReturnColumnsOrders
                            FROM milktypes
                            WHERE milktypeUseInReceiveEBM = 1 AND milktypeActive = 1;

                    IF(@dynamicMilkTypeReturnColumnsOrders IS NOT NULL and @dynamicMilkTypeReturnColumnsOrders != '') THEN
                        SET @calculateMilkStatistics = CONCAT(@calculateMilkStatistics, ', ', @dynamicMilkTypeReturnColumnsOrders);
                     END IF;


                SET @calculateMilkStatistics = CONCAT(@calculateMilkStatistics, 	' FROM mothers mot LEFT JOIN babies ON babyMother = mot.motherID
                                                                                LEFT JOIN bottles ON bottlePrintedForMother = mot.motherID
                                                                                LEFT JOIN orders ON orderBaby = babyID
                                                                                LEFT JOIN nutrition_product_types ON nutrition_product_types.formtypeID = orderFormulaType
                                                                                LEFT JOIN locations loc ON bottles.BottleLocation = locationID
                                                                                WHERE motherActive = 1 ');
                -- BFPDR-1427
                IF(babyUnits IS NOT NULL AND babyUnits <> '') THEN
                  SET @validUnits = babyUnits;
                  SET @calculateMilkStatistics = CONCAT(@calculateMilkStatistics, ' AND (mot.motherID in (
                    (SELECT DISTINCT motunit.motherID
                    FROM mothers AS motunit
                    LEFT JOIN babies AS bunit ON bunit.babyMother = motunit.motherID
                    WHERE FIND_IN_SET(babyUnit,@validUnits) and bunit.babyActive = 1))) ');
                ELSE
                    SET @calculateMilkStatistics = CONCAT(@calculateMilkStatistics, ' AND (mot.motherID in (
                    (SELECT DISTINCT m.motherID
                    FROM mothers AS m
                    LEFT JOIN babies AS b ON b.babyMother = m.motherID
                    WHERE b.babyActive = 1))) ');
                END IF;

                SET @calculateMilkStatistics = CONCAT(@calculateMilkStatistics, 	' AND (bottleID is null and orderID is not null) AND (orderBase = 0 OR formtypeCategoryID IN (4,6)) -- MEDOLAC: 4 PROLACTA: 6
                                                                        GROUP BY mot.motherID ');
            END IF;

            SET @calculateMilkStatistics = CONCAT(@calculateMilkStatistics, 	' ) VOLUMEREPORT ORDER BY MotherIdentifier IS NOT NULL, Source ASC;');

            -- Do the bottle math now that we have a rowset to work on
            PREPARE ReturnValue FROM @calculateMilkStatistics;
            EXECUTE ReturnValue;
            -- SELECT * FROM tBottles;
            -- SELECT * FROM tBottles tb LEFT OUTER JOIN milktypes_bottles mtb ON tb.BottleID = mtb.milktypebottlesBottleID;
            -- clean up
            DEALLOCATE PREPARE ReturnValue;
            DROP TEMPORARY TABLE tBottles;

          END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-28 20:59:02
