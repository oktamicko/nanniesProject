-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: coba
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(150) NOT NULL,
  `age_group` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (3,'Art Class','3-6','City Museum'),(4,'Cooking Workshop','7-12','Community Center'),(5,'Science Lab','8-12','Tech University'),(6,'Music Lessons','4-8','Music Academy'),(7,'Dance Class','5-10','Dance Studio'),(8,'Sports Camp','6-11','Sports Complex'),(9,'Swimming Lessons','4-9','Aquatic Center'),(10,'Theater Workshop','7-14','Theater Hall'),(11,'Yoga for Kids','6-12','Yoga Studio');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('cff69dac3953');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nannies_activities`
--

DROP TABLE IF EXISTS `nannies_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nannies_activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nanny_id` int NOT NULL,
  `activity_id` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nanny_id` (`nanny_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `nannies_activities_ibfk_1` FOREIGN KEY (`nanny_id`) REFERENCES `nanny` (`id`),
  CONSTRAINT `nannies_activities_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nannies_activities`
--

LOCK TABLES `nannies_activities` WRITE;
/*!40000 ALTER TABLE `nannies_activities` DISABLE KEYS */;
INSERT INTO `nannies_activities` VALUES (1,4,6,'2024-09-10'),(5,10,9,'2024-09-05'),(6,11,10,'2024-09-03'),(7,20,4,'2024-09-06'),(8,21,8,'2024-09-02'),(9,17,3,'2024-09-07'),(11,13,7,'2024-09-07');
/*!40000 ALTER TABLE `nannies_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nanny`
--

DROP TABLE IF EXISTS `nanny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nanny` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `availability` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nanny`
--

LOCK TABLES `nanny` WRITE;
/*!40000 ALTER TABLE `nanny` DISABLE KEYS */;
INSERT INTO `nanny` VALUES (4,'John Smith','john.smith@example.com','0987654321','Male','Available','456 Oak St, Townsville',34),(5,'Mary Williams','mary.williams@example.com','5551234567','Female','Available','789 Pine St, Villageville',25),(6,'James Brown','james.brown@example.com','4441239876','Male','Available','321 Cedar St, Hamletville',30),(7,'Linda Davis','linda.davis@example.com','3335556789','Female','Available','654 Elm St, Boroughsville',26),(8,'Robert Wilson','robert.wilson@example.com','2224445555','Male','Available','987 Spruce St, Townland',29),(9,'Patricia Taylor','patricia.taylor@example.com','1118889990','Female','Not Available','135 Birch St, Urbanville',32),(10,'Michael Martinez','michael.martinez@example.com','7779996663','Male','Available','246 Cherry St, Cityburg',27),(11,'Barbara Anderson','barbara.anderson@example.com','5556667778','Female','Not Available','357 Chestnut St, Metrotown',31),(12,'William Thomas','william.thomas@example.com','9998887771','Male','Available','468 Walnut St, Capitalville',24),(13,'Elizabeth Jackson','elizabeth.jackson@example.com','2223334445','Female','Not Available','579 Redwood St, Riverside',29),(14,'David White','david.white@example.com','1231231234','Male','Available','680 Aspen St, Lakeview',33),(15,'Susan Harris','susan.harris@example.com','3213214321','Female','Available','791 Beech St, Coastal City',27),(16,'Daniel Lee','daniel.lee@example.com','6546547654','Male','Available','902 Cypress St, Mountain Town',30),(17,'Jessica Miller','jessica.miller@example.com','9879871234','Female','Available','111 Magnolia St, Plainsville',22),(18,'Christopher Moore','christopher.moore@example.com','4564567890','Male','Not Available','222 Linden St, Valley Town',35),(19,'Sarah Taylor','sarah.taylor@example.com','7897893456','Female','Available','333 Willow St, Hillside',28),(20,'Joshua Brown','joshua.brown@example.com','3334445556','Male','Not Available','444 Fir St, Seaside',31),(21,'Karen Thompson','karen.thompson@example.com','5556667779','Female','Not Available','555 Spruce St, River City',26),(22,'Kevin Garcia','kevin.garcia@example.com','6667778880','Male','Available','666 Maple St, Uptown',29);
/*!40000 ALTER TABLE `nanny` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-10 10:31:01
