CREATE DATABASE  IF NOT EXISTS `librarydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `librarydb`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: librarydb
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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClaimType` longtext COLLATE utf8mb4_unicode_ci,
  `ClaimValue` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`Id`),
  KEY `RoleId` (`RoleId`),
  CONSTRAINT `aspnetroleclaims_ibfk_1` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NormalizedName` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES ('010a8e48-04a9-4f08-8b48-957ae4e3f4d1','Librarian','LIBRARIAN',NULL),('a2f7e9e7-5727-461c-9863-0eecab44cbb2','Admin','ADMIN',NULL);
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClaimType` longtext COLLATE utf8mb4_unicode_ci,
  `ClaimValue` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `aspnetuserclaims_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProviderKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProviderDisplayName` longtext COLLATE utf8mb4_unicode_ci,
  `UserId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `aspnetuserlogins_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `RoleId` (`RoleId`),
  CONSTRAINT `aspnetuserroles_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `aspnetuserroles_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES ('e8b1a632-3e11-474e-a806-3a2aeddbe60f','a2f7e9e7-5727-461c-9863-0eecab44cbb2'),('eb3ba638-fddb-4f09-a9fc-bd813196984d','a2f7e9e7-5727-461c-9863-0eecab44cbb2');
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserName` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext COLLATE utf8mb4_unicode_ci,
  `SecurityStamp` longtext COLLATE utf8mb4_unicode_ci,
  `ConcurrencyStamp` longtext COLLATE utf8mb4_unicode_ci,
  `PhoneNumber` longtext COLLATE utf8mb4_unicode_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('0b6841a7-247e-4db9-a240-d29ecaf752b6','moayad2@gmail.com','MOAYAD2@GMAIL.COM','moayad2@gmail.com','MOAYAD2@GMAIL.COM',0,'AQAAAAIAAYagAAAAEGbay8+lDg2aixjJ8tmCfIz2KtZ3gwOgRyWDEPt07yJ1WiiHhdrxuyze5Y+Xw7cwXQ==','Z2DT3G66HUFKP4JKIB5QVZM3KHJPMRPF','d2afe985-3eb7-4ce3-81d9-dfdfc9bf7f47',NULL,0,0,NULL,1,0),('0e2dffec-b71a-4db0-a227-024696bfacf6','moayad10@gmail.com','MOAYAD10@GMAIL.COM','moayad10@gmail.com','MOAYAD10@GMAIL.COM',0,'AQAAAAIAAYagAAAAEDJPvNHi4uNcy2jKPySBbhNEQoCc5DceQ426x1IKHzhETEmeAi+bZuKcySiAzka2vA==','LURZJQTWYJSHZMISDEVMOPRBNAJTLPPX','6082cd37-9b88-430c-a504-772db8d240de',NULL,0,0,NULL,1,0),('1','testuser','TESTUSER','test@example.com','TEST@EXAMPLE.COM',0,'passwordhash','securitystamp','concurrencystamp',NULL,0,0,NULL,0,0),('163beec5-6cc3-4fdf-be3d-12821ba703c6','moayad23@gmail.com','MOAYAD23@GMAIL.COM','moayad23@gmail.com','MOAYAD23@GMAIL.COM',0,'AQAAAAIAAYagAAAAEP2vFcwvom0zikTm+Uu2o+6zM2Eyi/jO/f4ddmBRwOTukCpO0uxNeXECo3RB29kZQw==','L6CL77XGSPQD4R2LHE6YP4IQEC5V245T','8254d1c6-ef8f-4a37-bd94-b9c8c5f8a7ec',NULL,0,0,NULL,1,0),('46d6faca-a7cb-4472-abcd-8b0b605f6b98','moayad000@gmail.com','MOAYAD000@GMAIL.COM','moayad000@gmail.com','MOAYAD000@GMAIL.COM',0,'AQAAAAIAAYagAAAAEF4N60dMcIs9o5H1js6Rpfg8B54faH3QIUsqNBzpxtTtN01Jhw96ru5W27wFN2C13A==','KONWXBRPC5E2IQPZD4DHW56MPG3ZSWXZ','c2faa410-f2db-4e0f-b465-59a31b6dbe97',NULL,0,0,NULL,1,0),('a6a494f3-70df-4df0-996c-c1b4dbfcb7f4','moayad22@gmail.com','MOAYAD22@GMAIL.COM','moayad22@gmail.com','MOAYAD22@GMAIL.COM',0,'AQAAAAIAAYagAAAAEPdbRQliG9xjYhrisxEpQ7a5zaW96HzzG4/JDiX2hIWdi5S8ugW74GUgGLe1zn+ADg==','76TDPHPD6PKCYPTHO5FQNEJAKJU5LNL7','b7e389cd-9a5f-4485-9bc6-c020d2a12b2d',NULL,0,0,NULL,1,0),('e8b1a632-3e11-474e-a806-3a2aeddbe60f','admin@example.com','ADMIN@EXAMPLE.COM','admin@example.com','ADMIN@EXAMPLE.COM',1,'AQAAAAIAAYagAAAAECvwHbWfYCxY0ncm5y/W/6as6Xq7u74FOtkn2bBByk4rYi9EbAJ8yo40fX+lEuK9pA==','KQGEVW5UD77LGOUZ2N5QCUURJBZPCXRX','bd008388-5d2d-4f44-816b-0e4f7e643005',NULL,0,0,NULL,1,0),('eb3ba638-fddb-4f09-a9fc-bd813196984d','moayad77@gmail.com','MOAYAD77@GMAIL.COM','moayad77@gmail.com','MOAYAD77@GMAIL.COM',0,'AQAAAAIAAYagAAAAEEaT7aFDHolustszn6jF3c/jHdY2Su2KorEaPlzVsNUsof1DoUezoqTUC6dZzI6rkQ==','QW2AWEG2SRYLKVUAFH4QAQDNSPG734CU','48b75146-33cc-413a-a2b4-4a60c5d9554d',NULL,0,0,NULL,1,0),('f8dfaf55-8b66-4c7a-9de1-d92e44fd70f4','moayad@gmail.com','MOAYAD@GMAIL.COM','moayad@gmail.com','MOAYAD@GMAIL.COM',0,'AQAAAAIAAYagAAAAEIhuBsKWx9wGzIcnXaO+ULJ+qsZ6BpHUhbw+68wuOnznKh8/VPM5x7pHzTyOemV4iw==','PRURMB5H6UIBFAG4L2EHTR2GVZZNL67Q','80fd0905-00c9-410a-8cc7-e6ce2e5a5835',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LoginProvider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `aspnetusertokens_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `BookId` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(30) NOT NULL,
  `author` varchar(30) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `CategoryId` int DEFAULT NULL,
  `CopiesAvailable` int DEFAULT '0',
  PRIMARY KEY (`BookId`),
  KEY `CategoryId` (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (4,'Lonley','Moayad Shurafa','328-7-3844-2322-1',4,5),(11,'Atomic Habits','Ahmed Ali','15236GYBJJ',6,2),(12,'dmwks','moayad','364-4-4632-3628-2',12,2),(13,'one','jamal','111-1-1111-1111-1',13,6),(14,'no name','noOne','222-2-2222-2222-2',15,6);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryId` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Fiction'),(2,'Non-Fiction'),(3,'Mystery'),(4,'Science Fiction'),(5,'Fantasy'),(6,'Biography'),(7,'Historical'),(8,'Romance'),(9,'Thriller'),(10,'Self-Help'),(11,'Health & Wellness'),(12,'Travel'),(13,'Science & Nature'),(14,'Children\'s'),(15,'Young Adult');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `LoanId` int NOT NULL AUTO_INCREMENT,
  `BookId` int DEFAULT NULL,
  `MemberId` int DEFAULT NULL,
  `LoanDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`LoanId`),
  KEY `BookId` (`BookId`),
  KEY `MemberId` (`MemberId`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`BookId`) REFERENCES `books` (`BookId`),
  CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`MemberId`) REFERENCES `members` (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,4,1,'2024-09-09','2024-09-20',NULL),(2,4,1,'2024-09-09','2024-09-17',NULL),(3,4,1,'2024-09-09','2024-09-26','2024-09-09'),(4,11,4,'2024-09-09','2024-09-11',NULL),(5,11,4,'2024-09-09','2024-09-10','2024-09-09'),(6,13,7,'2024-09-10','2024-09-11',NULL),(7,14,6,'2024-09-10','2024-09-11',NULL);
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `MemberId` int NOT NULL AUTO_INCREMENT,
  `Fullname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `MembershipDate` date NOT NULL,
  PRIMARY KEY (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'moayad','moayad@gamil.com','2024-09-08'),(4,'Ahmed','ahmed@gamil.com','2024-09-09'),(6,'khalid ahmed','fvvmk@gmail.com','2024-09-09'),(7,'sara','sara@gmail.com','2024-10-01');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-10 15:03:33
