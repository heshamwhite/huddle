-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: huddle_development
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `confirms`
--

DROP TABLE IF EXISTS `confirms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confirms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `confirmtext` text,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_confirms_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_7b46302dc1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirms`
--

LOCK TABLES `confirms` WRITE;
/*!40000 ALTER TABLE `confirms` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventcomments`
--

DROP TABLE IF EXISTS `eventcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventcomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_eventcomments_on_user_id` (`user_id`),
  KEY `index_eventcomments_on_event_id` (`event_id`),
  CONSTRAINT `fk_rails_3dae50361a` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `fk_rails_a33ecb94f2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventcomments`
--

LOCK TABLES `eventcomments` WRITE;
/*!40000 ALTER TABLE `eventcomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `log` float DEFAULT NULL,
  `desc` text,
  `date` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_events_on_group_id` (`group_id`),
  CONSTRAINT `fk_rails_61fbf6ca48` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'newhere',29,41,'nthingsadasf','2015-05-09 12:08:00',2,'2015-05-09 12:09:16','2015-05-09 12:09:16'),(2,'newhere',29,41,'nthingsadasf','2015-05-09 12:08:00',3,'2015-05-09 12:09:16','2015-05-09 12:09:16'),(3,'new there',29,41,'nthingsadasf','2015-05-09 12:08:00',2,'2015-05-09 12:09:16','2015-05-09 12:09:16'),(4,'sad',45.8288,9.09668,'sadfasf','2015-05-11 20:04:00',2,'2015-05-11 20:05:04','2015-05-11 20:05:04');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_users`
--

DROP TABLE IF EXISTS `events_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_users` (
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  KEY `index_events_users_on_user_id_and_event_id` (`user_id`,`event_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `events_users_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_users`
--

LOCK TABLES `events_users` WRITE;
/*!40000 ALTER TABLE `events_users` DISABLE KEYS */;
INSERT INTO `events_users` VALUES (3,1),(3,2),(3,3),(3,4),(4,1),(4,2),(4,3),(5,1);
/*!40000 ALTER TABLE `events_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupimages`
--

DROP TABLE IF EXISTS `groupimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupimages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `desc` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `gimage_file_name` varchar(255) DEFAULT NULL,
  `gimage_content_type` varchar(255) DEFAULT NULL,
  `gimage_file_size` int(11) DEFAULT NULL,
  `gimage_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_groupimages_on_group_id` (`group_id`),
  CONSTRAINT `fk_rails_f6980ab02d` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupimages`
--

LOCK TABLES `groupimages` WRITE;
/*!40000 ALTER TABLE `groupimages` DISABLE KEYS */;
INSERT INTO `groupimages` VALUES (1,2,NULL,'2015-05-11 12:48:21','2015-05-11 12:48:21','15601974024_0cc85fe5e7_o.jpg','image/jpeg',734123,'2015-05-11 12:48:20'),(2,2,NULL,'2015-05-11 12:48:21','2015-05-11 12:48:21','15678056103_4dc10c3797_b.jpg','image/jpeg',243801,'2015-05-11 12:48:21'),(3,2,NULL,'2015-05-11 12:48:22','2015-05-11 12:48:22','15970274619_70c9652522_b.jpg','image/jpeg',287498,'2015-05-11 12:48:22'),(4,2,NULL,'2015-05-11 12:48:22','2015-05-11 12:48:22','16139352259_b31c41a70b_b.jpg','image/jpeg',271953,'2015-05-11 12:48:22'),(5,2,NULL,'2015-05-11 12:48:22','2015-05-11 12:48:22','16224565415_590062afa8_b.jpg','image/jpeg',336668,'2015-05-11 12:48:22'),(6,2,NULL,'2015-05-11 20:26:38','2015-05-11 20:26:38','16243304064_fb3afb8732_b.jpg','image/jpeg',300942,'2015-05-11 20:26:38'),(7,2,NULL,'2015-05-11 20:26:38','2015-05-11 20:26:38','16327822402_e73cdfcc3e_b.jpg','image/jpeg',332831,'2015-05-11 20:26:38'),(8,2,NULL,'2015-05-11 20:26:38','2015-05-11 20:26:38','16863176225_8233a129ca_b.jpg','image/jpeg',337098,'2015-05-11 20:26:38'),(9,2,NULL,'2015-05-11 20:26:39','2015-05-11 20:26:39','heart-shaped-bokeh-example-8.jpg','image/jpeg',330626,'2015-05-11 20:26:38'),(10,4,NULL,'2015-05-12 17:34:41','2015-05-12 17:34:41','15678056103_4dc10c3797_b.jpg','image/jpeg',243801,'2015-05-12 17:34:40'),(11,4,NULL,'2015-05-12 17:34:41','2015-05-12 17:34:41','15970274619_70c9652522_b.jpg','image/jpeg',287498,'2015-05-12 17:34:41'),(12,4,NULL,'2015-05-12 17:34:42','2015-05-12 17:34:42','16053684277_a8629cbb40_b.jpg','image/jpeg',197222,'2015-05-12 17:34:42'),(13,4,NULL,'2015-05-12 17:34:42','2015-05-12 17:34:42','16086919658_bf1dd21c08_b.jpg','image/jpeg',497276,'2015-05-12 17:34:42'),(14,4,NULL,'2015-05-12 17:34:42','2015-05-12 17:34:42','16139352259_b31c41a70b_b.jpg','image/jpeg',271953,'2015-05-12 17:34:42'),(15,4,NULL,'2015-05-12 17:34:42','2015-05-12 17:34:42','16148513200_dc28d62197_b.jpg','image/jpeg',165928,'2015-05-12 17:34:42');
/*!40000 ALTER TABLE `groupimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupmessages`
--

DROP TABLE IF EXISTS `groupmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_groupmessages_on_user_id` (`user_id`),
  KEY `index_groupmessages_on_group_id` (`group_id`),
  CONSTRAINT `fk_rails_c7f0ce8f98` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `fk_rails_ee70178a8d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupmessages`
--

LOCK TABLES `groupmessages` WRITE;
/*!40000 ALTER TABLE `groupmessages` DISABLE KEYS */;
INSERT INTO `groupmessages` VALUES (3,'New here','sadsad',3,2,'2015-05-10 18:10:41','2015-05-10 18:10:41'),(4,'hi ','safj\r\n\r\nEGF\r\n',NULL,NULL,'2015-05-11 12:15:58','2015-05-11 12:15:58'),(5,'12','33wdawd',NULL,NULL,'2015-05-11 12:19:42','2015-05-11 12:19:42'),(6,'asf','asfsaf',6,2,'2015-05-11 12:23:38','2015-05-11 12:23:38'),(7,'asdsad','safasf',6,2,'2015-05-11 12:31:06','2015-05-11 12:31:06');
/*!40000 ALTER TABLE `groupmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupreplies`
--

DROP TABLE IF EXISTS `groupreplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupreplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text,
  `user_id` int(11) DEFAULT NULL,
  `groupmessage_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_groupreplies_on_user_id` (`user_id`),
  KEY `index_groupreplies_on_groupmessage_id` (`groupmessage_id`),
  CONSTRAINT `fk_rails_0348950c49` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_203dc009ce` FOREIGN KEY (`groupmessage_id`) REFERENCES `groupmessages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupreplies`
--

LOCK TABLES `groupreplies` WRITE;
/*!40000 ALTER TABLE `groupreplies` DISABLE KEYS */;
INSERT INTO `groupreplies` VALUES (1,'saaas   sfsdfsd   dsgsdg sdf ',3,3,'2015-05-10 19:55:43','2015-05-10 19:55:43'),(2,'bass ya ga7sh',4,3,'2015-05-10 19:56:43','2015-05-10 19:56:43'),(3,'safsa',6,3,'2015-05-11 11:37:28','2015-05-11 11:37:28'),(4,'asfsaf',6,3,'2015-05-11 12:03:02','2015-05-11 12:03:02'),(5,'asfasf',6,3,'2015-05-11 12:03:47','2015-05-11 12:03:47'),(6,'safsaf',6,6,'2015-05-11 12:23:49','2015-05-11 12:23:49'),(7,'dsf',3,6,'2015-05-11 13:30:12','2015-05-11 13:30:12'),(8,'dsfdsfsdf',3,6,'2015-05-11 13:30:21','2015-05-11 13:30:21'),(9,'AFSF',3,7,'2015-05-11 13:34:54','2015-05-11 13:34:54'),(10,'SAFSA',3,7,'2015-05-11 13:35:01','2015-05-11 13:35:01');
/*!40000 ALTER TABLE `groupreplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `log` float DEFAULT NULL,
  `desc` text,
  `membertitle` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `groupavatar_file_name` varchar(255) DEFAULT NULL,
  `groupavatar_content_type` varchar(255) DEFAULT NULL,
  `groupavatar_file_size` int(11) DEFAULT NULL,
  `groupavatar_updated_at` datetime DEFAULT NULL,
  `bgimage_file_name` varchar(255) DEFAULT NULL,
  `bgimage_content_type` varchar(255) DEFAULT NULL,
  `bgimage_file_size` int(11) DEFAULT NULL,
  `bgimage_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_groups_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_5e78cd340a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (2,'newG',48.1954,3.31787,'safsafas','sfasf',3,'2015-05-09 12:06:06','2015-05-09 12:06:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'newG',48.1954,3.31787,'safsafas','sfasf',3,'2015-05-09 12:06:06','2015-05-09 12:06:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'moataz lovers',31.1961,29.8933,'me3alem','jsanfjkasnf',6,'2015-05-09 18:02:37','2015-05-09 18:04:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_interests`
--

DROP TABLE IF EXISTS `groups_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_interests` (
  `group_id` int(11) DEFAULT NULL,
  `interest_id` int(11) DEFAULT NULL,
  KEY `index_groups_interests_on_group_id_and_interest_id` (`group_id`,`interest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_interests`
--

LOCK TABLES `groups_interests` WRITE;
/*!40000 ALTER TABLE `groups_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_groups_users_on_user_id` (`user_id`),
  KEY `index_groups_users_on_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
INSERT INTO `groups_users` VALUES (1,3,3),(2,4,3),(7,6,2),(9,3,2),(10,3,4);
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interestname` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests`
--

LOCK TABLES `interests` WRITE;
/*!40000 ALTER TABLE `interests` DISABLE KEYS */;
INSERT INTO `interests` VALUES (0,'sky','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'reddit ','2015-05-09 17:59:35','2015-05-09 17:59:35'),(3,' CS','2015-05-09 17:59:36','2015-05-09 17:59:36');
/*!40000 ALTER TABLE `interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests_users`
--

DROP TABLE IF EXISTS `interests_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interests_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `interest_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_interests_users_on_user_id` (`user_id`),
  KEY `index_interests_users_on_interest_id` (`interest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests_users`
--

LOCK TABLES `interests_users` WRITE;
/*!40000 ALTER TABLE `interests_users` DISABLE KEYS */;
INSERT INTO `interests_users` VALUES (1,6,2),(2,6,3);
/*!40000 ALTER TABLE `interests_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `notificationtype` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `seen` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_b080fb4855` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'New Event in Group newG','/events/4','newevent',6,'2015-05-11 20:05:05','2015-05-11 20:05:05',NULL),(2,'New Event in Group newG','/events/4','newevent',3,'2015-05-11 20:05:05','2015-05-11 20:05:05',NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150507135440'),('20150507140404'),('20150507141153'),('20150507142004'),('20150507153907'),('20150507154434'),('20150507155658'),('20150507155709'),('20150507155934'),('20150507160007'),('20150507160242'),('20150507161827'),('20150508174528'),('20150508212846'),('20150508213905'),('20150508230428'),('20150509103133'),('20150509121159'),('20150509131712'),('20150509134328'),('20150510164534'),('20150510175332'),('20150510182436'),('20150510192534'),('20150511062730'),('20150512073532');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermessages`
--

DROP TABLE IF EXISTS `usermessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `seen` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermessages`
--

LOCK TABLES `usermessages` WRITE;
/*!40000 ALTER TABLE `usermessages` DISABLE KEYS */;
INSERT INTO `usermessages` VALUES (1,'ya 3beeet','enta 3beet',6,3,'2015-05-11 12:38:36','2015-05-11 12:38:36',0);
/*!40000 ALTER TABLE `usermessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `hashedpassword` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `bio` text,
  `email` varchar(255) DEFAULT NULL,
  `isconfirm` int(11) DEFAULT NULL,
  `usertype` int(11) DEFAULT NULL,
  `interest_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `avatar_content_type` varchar(255) DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_interest_id` (`interest_id`),
  CONSTRAINT `fk_rails_0ce9d27871` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'moataz','$2a$10$DKvZNDPYZN/wz6dpKM1TnOAZro7EC6daZ9WWXTlgXExY4zAY9pY5u',5,'saf','asd@ad',1,0,0,'2015-05-09 12:04:45','2015-05-09 12:04:45','16086919658_bf1dd21c08_b.jpg','image/jpeg',497276,'2015-05-09 12:04:44','$2a$10$DKvZNDPYZN/wz6dpKM1TnO',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'hisham','sdkgnskdj',13,'masfish ketir','sagfs',1,1,0,'2015-05-09 14:56:19','2015-05-09 14:56:19','15970274619_70c9652522_b.jpg','image/jpeg',287498,'2015-05-09 14:56:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'rania','sdkgnskdj',13,'masfish ketir','sagfs',1,1,0,'2015-05-09 15:01:25','2015-05-09 15:01:25','16327822402_e73cdfcc3e_b.jpg','image/jpeg',332831,'2015-05-09 15:01:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'moataz2','$2a$10$DKvZNDPYZN/wz6dpKM1TnOAZro7EC6daZ9WWXTlgXExY4zAY9pY5u',22,'7amra','moataz@yahoo.com',NULL,1,NULL,'2015-05-09 17:59:35','2015-05-09 17:59:35','15601974024_0cc85fe5e7_o.jpg','image/jpeg',734123,'2015-05-09 17:59:35','$2a$10$DKvZNDPYZN/wz6dpKM1TnO',22,22,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-13 18:39:29
