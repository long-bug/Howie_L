-- MySQL dump 10.13  Distrib 5.6.45, for Win64 (x86_64)
--
-- Host: localhost    Database: tf_crm
-- ------------------------------------------------------
-- Server version	5.6.45

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
-- Table structure for table `app01_campuses`
--

DROP TABLE IF EXISTS `app01_campuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_campuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `address` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_campuses`
--

LOCK TABLES `app01_campuses` WRITE;
/*!40000 ALTER TABLE `app01_campuses` DISABLE KEYS */;
INSERT INTO `app01_campuses` VALUES (1,'bj','bj');
/*!40000 ALTER TABLE `app01_campuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_classlist`
--

DROP TABLE IF EXISTS `app01_classlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_classlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` varchar(64) NOT NULL,
  `semester` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `start_date` date NOT NULL,
  `graduate_date` date DEFAULT NULL,
  `class_type` varchar(64) DEFAULT NULL,
  `campuses_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_classlist_course_semester_campuses_id_ba9d2f2c_uniq` (`course`,`semester`,`campuses_id`),
  KEY `app01_classlist_campuses_id_45af4e65_fk_app01_campuses_id` (`campuses_id`),
  CONSTRAINT `app01_classlist_campuses_id_45af4e65_fk_app01_campuses_id` FOREIGN KEY (`campuses_id`) REFERENCES `app01_campuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_classlist`
--

LOCK TABLES `app01_classlist` WRITE;
/*!40000 ALTER TABLE `app01_classlist` DISABLE KEYS */;
INSERT INTO `app01_classlist` VALUES (1,'Linux',1,10000,NULL,'2020-01-01',NULL,NULL,1),(2,'PythonFullStack',2,10000,NULL,'2019-12-19',NULL,NULL,1);
/*!40000 ALTER TABLE `app01_classlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_classlist_teachers`
--

DROP TABLE IF EXISTS `app01_classlist_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_classlist_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classlist_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_classlist_teachers_classlist_id_userprofile_3205eb68_uniq` (`classlist_id`,`userprofile_id`),
  KEY `app01_classlist_teac_userprofile_id_81fc8cae_fk_app01_use` (`userprofile_id`),
  CONSTRAINT `app01_classlist_teac_classlist_id_d9486686_fk_app01_cla` FOREIGN KEY (`classlist_id`) REFERENCES `app01_classlist` (`id`),
  CONSTRAINT `app01_classlist_teac_userprofile_id_81fc8cae_fk_app01_use` FOREIGN KEY (`userprofile_id`) REFERENCES `app01_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_classlist_teachers`
--

LOCK TABLES `app01_classlist_teachers` WRITE;
/*!40000 ALTER TABLE `app01_classlist_teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_classlist_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_consultrecord`
--

DROP TABLE IF EXISTS `app01_consultrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_consultrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` longtext NOT NULL,
  `status` varchar(8) NOT NULL,
  `date` datetime(6) NOT NULL,
  `delete_status` tinyint(1) NOT NULL,
  `consultant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_consultrecord_consultant_id_01ffd4e4_fk_app01_use` (`consultant_id`),
  KEY `app01_consultrecord_customer_id_5728417f_fk_app01_customer_id` (`customer_id`),
  CONSTRAINT `app01_consultrecord_consultant_id_01ffd4e4_fk_app01_use` FOREIGN KEY (`consultant_id`) REFERENCES `app01_userprofile` (`id`),
  CONSTRAINT `app01_consultrecord_customer_id_5728417f_fk_app01_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `app01_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_consultrecord`
--

LOCK TABLES `app01_consultrecord` WRITE;
/*!40000 ALTER TABLE `app01_consultrecord` DISABLE KEYS */;
INSERT INTO `app01_consultrecord` VALUES (1,'asdasdsad','B','2019-12-01 14:17:06.187478',0,1,1);
/*!40000 ALTER TABLE `app01_consultrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_courserecord`
--

DROP TABLE IF EXISTS `app01_courserecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_courserecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_num` int(11) NOT NULL,
  `date` date NOT NULL,
  `course_title` varchar(64) DEFAULT NULL,
  `course_memo` longtext,
  `has_homework` tinyint(1) NOT NULL,
  `homework_title` varchar(64) DEFAULT NULL,
  `homework_memo` longtext,
  `scoring_point` longtext,
  `re_class_id` int(11) NOT NULL,
  `recorder_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_courserecord_re_class_id_day_num_9467c419_uniq` (`re_class_id`,`day_num`),
  KEY `app01_courserecord_recorder_id_6d09acbf_fk_app01_userprofile_id` (`recorder_id`),
  KEY `app01_courserecord_teacher_id_4476c694_fk_app01_userprofile_id` (`teacher_id`),
  CONSTRAINT `app01_courserecord_re_class_id_224ae9c9_fk_app01_classlist_id` FOREIGN KEY (`re_class_id`) REFERENCES `app01_classlist` (`id`),
  CONSTRAINT `app01_courserecord_recorder_id_6d09acbf_fk_app01_userprofile_id` FOREIGN KEY (`recorder_id`) REFERENCES `app01_userprofile` (`id`),
  CONSTRAINT `app01_courserecord_teacher_id_4476c694_fk_app01_userprofile_id` FOREIGN KEY (`teacher_id`) REFERENCES `app01_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_courserecord`
--

LOCK TABLES `app01_courserecord` WRITE;
/*!40000 ALTER TABLE `app01_courserecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_courserecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_customer`
--

DROP TABLE IF EXISTS `app01_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qq` varchar(64) NOT NULL,
  `qq_name` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `sex` varchar(16) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `source` varchar(64) NOT NULL,
  `course` varchar(21) NOT NULL,
  `class_type` varchar(64) NOT NULL,
  `customer_note` longtext,
  `status` varchar(64) NOT NULL,
  `last_consult_date` date NOT NULL,
  `next_date` date DEFAULT NULL,
  `consultant_id` int(11) DEFAULT NULL,
  `introduce_from_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qq` (`qq`),
  KEY `app01_customer_consultant_id_8032bb08_fk_app01_userprofile_id` (`consultant_id`),
  KEY `app01_customer_introduce_from_id_ee31cbdd_fk_app01_customer_id` (`introduce_from_id`),
  CONSTRAINT `app01_customer_consultant_id_8032bb08_fk_app01_userprofile_id` FOREIGN KEY (`consultant_id`) REFERENCES `app01_userprofile` (`id`),
  CONSTRAINT `app01_customer_introduce_from_id_ee31cbdd_fk_app01_customer_id` FOREIGN KEY (`introduce_from_id`) REFERENCES `app01_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_customer`
--

LOCK TABLES `app01_customer` WRITE;
/*!40000 ALTER TABLE `app01_customer` DISABLE KEYS */;
INSERT INTO `app01_customer` VALUES (1,'1111111',NULL,NULL,'male',NULL,NULL,'qq','Linux','fulltime','','unregistered','2019-12-01',NULL,1,NULL),(2,'5555555',NULL,NULL,'male',NULL,NULL,'qq','PythonFullStack','fulltime','','unregistered','2019-12-01',NULL,NULL,NULL),(3,'1312312312',NULL,NULL,'male',NULL,NULL,'qq','PythonFullStack','fulltime','','unregistered','2019-12-01',NULL,NULL,NULL);
/*!40000 ALTER TABLE `app01_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_customer_class_list`
--

DROP TABLE IF EXISTS `app01_customer_class_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_customer_class_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `classlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_customer_class_list_customer_id_classlist_id_2868a8ae_uniq` (`customer_id`,`classlist_id`),
  KEY `app01_customer_class_classlist_id_c3575f10_fk_app01_cla` (`classlist_id`),
  CONSTRAINT `app01_customer_class_classlist_id_c3575f10_fk_app01_cla` FOREIGN KEY (`classlist_id`) REFERENCES `app01_classlist` (`id`),
  CONSTRAINT `app01_customer_class_customer_id_d7a92dfe_fk_app01_cus` FOREIGN KEY (`customer_id`) REFERENCES `app01_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_customer_class_list`
--

LOCK TABLES `app01_customer_class_list` WRITE;
/*!40000 ALTER TABLE `app01_customer_class_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_customer_class_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_department`
--

DROP TABLE IF EXISTS `app01_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_department`
--

LOCK TABLES `app01_department` WRITE;
/*!40000 ALTER TABLE `app01_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_enrollment`
--

DROP TABLE IF EXISTS `app01_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_enrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `why_us` longtext,
  `your_expectation` longtext,
  `contract_agreed` tinyint(1) NOT NULL,
  `contract_approved` tinyint(1) NOT NULL,
  `enrolled_date` datetime(6) NOT NULL,
  `memo` longtext,
  `delete_status` tinyint(1) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `enrolment_class_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_enrollment_enrolment_class_id_customer_id_ad9b37f7_uniq` (`enrolment_class_id`,`customer_id`),
  KEY `app01_enrollment_customer_id_99adc3d9_fk_app01_customer_id` (`customer_id`),
  KEY `app01_enrollment_school_id_bf0b6a99_fk_app01_campuses_id` (`school_id`),
  CONSTRAINT `app01_enrollment_customer_id_99adc3d9_fk_app01_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `app01_customer` (`id`),
  CONSTRAINT `app01_enrollment_enrolment_class_id_2b7b93c6_fk_app01_cla` FOREIGN KEY (`enrolment_class_id`) REFERENCES `app01_classlist` (`id`),
  CONSTRAINT `app01_enrollment_school_id_bf0b6a99_fk_app01_campuses_id` FOREIGN KEY (`school_id`) REFERENCES `app01_campuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_enrollment`
--

LOCK TABLES `app01_enrollment` WRITE;
/*!40000 ALTER TABLE `app01_enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_paymentrecord`
--

DROP TABLE IF EXISTS `app01_paymentrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_paymentrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_type` varchar(64) NOT NULL,
  `paid_fee` int(11) NOT NULL,
  `note` longtext,
  `date` datetime(6) NOT NULL,
  `course` varchar(64) DEFAULT NULL,
  `class_type` varchar(64) DEFAULT NULL,
  `delete_status` tinyint(1) NOT NULL,
  `status` int(11) NOT NULL,
  `confirm_date` datetime(6) DEFAULT NULL,
  `confirm_user_id` int(11) DEFAULT NULL,
  `consultant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `enrolment_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_paymentrecord_confirm_user_id_76394a49_fk_app01_use` (`confirm_user_id`),
  KEY `app01_paymentrecord_consultant_id_b57e45a6_fk_app01_use` (`consultant_id`),
  KEY `app01_paymentrecord_customer_id_e51ad199_fk_app01_customer_id` (`customer_id`),
  KEY `app01_paymentrecord_enrolment_class_id_ab1c7df4_fk_app01_cla` (`enrolment_class_id`),
  CONSTRAINT `app01_paymentrecord_confirm_user_id_76394a49_fk_app01_use` FOREIGN KEY (`confirm_user_id`) REFERENCES `app01_userprofile` (`id`),
  CONSTRAINT `app01_paymentrecord_consultant_id_b57e45a6_fk_app01_use` FOREIGN KEY (`consultant_id`) REFERENCES `app01_userprofile` (`id`),
  CONSTRAINT `app01_paymentrecord_customer_id_e51ad199_fk_app01_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `app01_customer` (`id`),
  CONSTRAINT `app01_paymentrecord_enrolment_class_id_ab1c7df4_fk_app01_cla` FOREIGN KEY (`enrolment_class_id`) REFERENCES `app01_classlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_paymentrecord`
--

LOCK TABLES `app01_paymentrecord` WRITE;
/*!40000 ALTER TABLE `app01_paymentrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_paymentrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_studyrecord`
--

DROP TABLE IF EXISTS `app01_studyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_studyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance` varchar(64) NOT NULL,
  `score` int(11) NOT NULL,
  `homework_note` varchar(255) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `course_record_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_studyrecord_course_record_id_student_id_db81a8d8_uniq` (`course_record_id`,`student_id`),
  KEY `app01_studyrecord_student_id_11107852_fk_app01_customer_id` (`student_id`),
  CONSTRAINT `app01_studyrecord_course_record_id_09c56fb0_fk_app01_cou` FOREIGN KEY (`course_record_id`) REFERENCES `app01_courserecord` (`id`),
  CONSTRAINT `app01_studyrecord_student_id_11107852_fk_app01_customer_id` FOREIGN KEY (`student_id`) REFERENCES `app01_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_studyrecord`
--

LOCK TABLES `app01_studyrecord` WRITE;
/*!40000 ALTER TABLE `app01_studyrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_studyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userprofile`
--

DROP TABLE IF EXISTS `app01_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `name` varchar(32) NOT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `memo` longtext,
  `date_joined` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `app01_userprofile_department_id_bab0384f_fk_app01_department_id` (`department_id`),
  CONSTRAINT `app01_userprofile_department_id_bab0384f_fk_app01_department_id` FOREIGN KEY (`department_id`) REFERENCES `app01_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userprofile`
--

LOCK TABLES `app01_userprofile` WRITE;
/*!40000 ALTER TABLE `app01_userprofile` DISABLE KEYS */;
INSERT INTO `app01_userprofile` VALUES (1,'fh@qq.com','698d51a19d8a121ce581499d7b701668','fh',NULL,NULL,'2019-11-30 09:40:01.315950',1,NULL);
/*!40000 ALTER TABLE `app01_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userprofile_roles`
--

DROP TABLE IF EXISTS `app01_userprofile_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_userprofile_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userprofile_roles_userprofile_id_role_id_05c8a872_uniq` (`userprofile_id`,`role_id`),
  KEY `app01_userprofile_roles_role_id_97dba74b_fk_rbac_role_id` (`role_id`),
  CONSTRAINT `app01_userprofile_ro_userprofile_id_742ed0c8_fk_app01_use` FOREIGN KEY (`userprofile_id`) REFERENCES `app01_userprofile` (`id`),
  CONSTRAINT `app01_userprofile_roles_role_id_97dba74b_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userprofile_roles`
--

LOCK TABLES `app01_userprofile_roles` WRITE;
/*!40000 ALTER TABLE `app01_userprofile_roles` DISABLE KEYS */;
INSERT INTO `app01_userprofile_roles` VALUES (27,1,1),(24,1,2),(28,1,3),(25,1,4),(26,1,5);
/*!40000 ALTER TABLE `app01_userprofile_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add campuses',7,'add_campuses'),(20,'Can change campuses',7,'change_campuses'),(21,'Can delete campuses',7,'delete_campuses'),(22,'Can add class list',8,'add_classlist'),(23,'Can change class list',8,'change_classlist'),(24,'Can delete class list',8,'delete_classlist'),(25,'Can add consult record',9,'add_consultrecord'),(26,'Can change consult record',9,'change_consultrecord'),(27,'Can delete consult record',9,'delete_consultrecord'),(28,'Can add course record',10,'add_courserecord'),(29,'Can change course record',10,'change_courserecord'),(30,'Can delete course record',10,'delete_courserecord'),(31,'Can add customer',11,'add_customer'),(32,'Can change customer',11,'change_customer'),(33,'Can delete customer',11,'delete_customer'),(34,'Can add department',12,'add_department'),(35,'Can change department',12,'change_department'),(36,'Can delete department',12,'delete_department'),(37,'Can add enrollment',13,'add_enrollment'),(38,'Can change enrollment',13,'change_enrollment'),(39,'Can delete enrollment',13,'delete_enrollment'),(40,'Can add payment record',14,'add_paymentrecord'),(41,'Can change payment record',14,'change_paymentrecord'),(42,'Can delete payment record',14,'delete_paymentrecord'),(43,'Can add study record',15,'add_studyrecord'),(44,'Can change study record',15,'change_studyrecord'),(45,'Can delete study record',15,'delete_studyrecord'),(46,'Can add user profile',16,'add_userprofile'),(47,'Can change user profile',16,'change_userprofile'),(48,'Can delete user profile',16,'delete_userprofile'),(49,'Can add campuses',17,'add_campuses'),(50,'Can change campuses',17,'change_campuses'),(51,'Can delete campuses',17,'delete_campuses'),(52,'Can add class list',18,'add_classlist'),(53,'Can change class list',18,'change_classlist'),(54,'Can delete class list',18,'delete_classlist'),(55,'Can add consult record',19,'add_consultrecord'),(56,'Can change consult record',19,'change_consultrecord'),(57,'Can delete consult record',19,'delete_consultrecord'),(58,'Can add course record',20,'add_courserecord'),(59,'Can change course record',20,'change_courserecord'),(60,'Can delete course record',20,'delete_courserecord'),(61,'Can add customer',21,'add_customer'),(62,'Can change customer',21,'change_customer'),(63,'Can delete customer',21,'delete_customer'),(64,'Can add department',22,'add_department'),(65,'Can change department',22,'change_department'),(66,'Can delete department',22,'delete_department'),(67,'Can add enrollment',23,'add_enrollment'),(68,'Can change enrollment',23,'change_enrollment'),(69,'Can delete enrollment',23,'delete_enrollment'),(70,'Can add payment record',24,'add_paymentrecord'),(71,'Can change payment record',24,'change_paymentrecord'),(72,'Can delete payment record',24,'delete_paymentrecord'),(73,'Can add study record',25,'add_studyrecord'),(74,'Can change study record',25,'change_studyrecord'),(75,'Can delete study record',25,'delete_studyrecord'),(76,'Can add 用户表',26,'add_userprofile'),(77,'Can change 用户表',26,'change_userprofile'),(78,'Can delete 用户表',26,'delete_userprofile'),(79,'Can add 菜单表',27,'add_menu'),(80,'Can change 菜单表',27,'change_menu'),(81,'Can delete 菜单表',27,'delete_menu'),(82,'Can add 权限表',28,'add_permission'),(83,'Can change 权限表',28,'change_permission'),(84,'Can delete 权限表',28,'delete_permission'),(85,'Can add 角色表',29,'add_role'),(86,'Can change 角色表',29,'change_role'),(87,'Can delete 角色表',29,'delete_role');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$SkyJAYVjTnfr$TAUAJBUSR0S3UU2F1UaQkX/h8qa2Lq+3IgFYPMPXhLA=','2019-11-30 09:44:23.796964',1,'fh','','','',1,1,'2019-11-20 06:57:09.423367');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-11-20 07:58:21.545169','1','Customer object',1,'[{\"added\": {}}]',11,1),(2,'2019-11-20 08:02:04.892324','1','ClassList object',1,'[{\"added\": {}}]',8,1),(3,'2019-11-20 08:02:29.988812','2','ClassList object',1,'[{\"added\": {}}]',8,1),(4,'2019-11-20 08:06:01.702376','1','Customer object',2,'[{\"changed\": {\"fields\": [\"class_list\"]}}]',11,1),(5,'2019-11-20 11:46:37.650316','1','Customer object',2,'[{\"changed\": {\"fields\": [\"class_list\"]}}]',11,1),(6,'2019-11-20 11:52:58.693013','1','Customer object',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',11,1),(7,'2019-11-20 13:50:40.798963','2','Customer object',1,'[{\"added\": {}}]',11,1),(8,'2019-11-20 13:51:04.573096','3','Customer object',1,'[{\"added\": {}}]',11,1),(9,'2019-11-20 13:51:15.182639','3','Customer object',2,'[{\"changed\": {\"fields\": [\"class_list\"]}}]',11,1),(10,'2019-11-21 01:41:51.386651','4','4444444',1,'[{\"added\": {}}]',11,1),(11,'2019-11-21 01:42:10.704776','5','5555555',1,'[{\"added\": {}}]',11,1),(12,'2019-11-21 01:42:33.645679','6','66666666',1,'[{\"added\": {}}]',11,1),(13,'2019-11-25 07:03:19.791264','1','ConsultRecord object',1,'[{\"added\": {}}]',9,1),(14,'2019-11-25 07:03:32.723900','2','ConsultRecord object',1,'[{\"added\": {}}]',9,1),(15,'2019-11-25 07:11:14.655285','2','ConsultRecord object',2,'[{\"changed\": {\"fields\": [\"note\"]}}]',9,1),(16,'2019-11-25 07:11:20.415604','1','ConsultRecord object',2,'[{\"changed\": {\"fields\": [\"note\"]}}]',9,1),(17,'2019-11-25 07:30:47.757108','2','ConsultRecord object',2,'[]',9,1),(18,'2019-11-25 07:31:34.330890','4','4444444',2,'[{\"changed\": {\"fields\": [\"consultant\"]}}]',11,1),(19,'2019-11-25 07:32:14.333639','3','ConsultRecord object',1,'[{\"added\": {}}]',9,1),(20,'2019-11-25 11:52:57.068716','1','Enrollment object',1,'[{\"added\": {}}]',13,1),(21,'2019-11-25 11:53:17.072864','2','Enrollment object',1,'[{\"added\": {}}]',13,1),(22,'2019-11-26 08:14:51.373217','1','北京校区Python高级全栈开发1期',2,'[]',8,1),(23,'2019-11-26 08:16:31.909993','2','北京校区Linux中高级1期',2,'[{\"changed\": {\"fields\": [\"teachers\"]}}]',8,1),(24,'2019-11-26 08:17:12.127667','2','北京校区Linux中高级1期',2,'[]',8,1),(25,'2019-11-26 08:58:04.326645','1','北京校区Python高级全栈开发1期-day1',1,'[{\"added\": {}}]',10,1),(26,'2019-11-26 09:49:46.860816','8','北京校区Python高级全栈开发1期-day12414',3,'',10,1),(27,'2019-11-26 09:49:52.301488','7','北京校区Python高级全栈开发1期-day12124',3,'',10,1),(28,'2019-11-26 09:50:04.949849','6','北京校区Python高级全栈开发1期-day123',3,'',10,1),(29,'2019-11-26 11:46:06.285703','1','StudyRecord object',1,'[{\"added\": {}}]',15,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(17,'app01','campuses'),(18,'app01','classlist'),(19,'app01','consultrecord'),(20,'app01','courserecord'),(21,'app01','customer'),(22,'app01','department'),(23,'app01','enrollment'),(24,'app01','paymentrecord'),(25,'app01','studyrecord'),(26,'app01','userprofile'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(27,'rbac','menu'),(28,'rbac','permission'),(29,'rbac','role'),(6,'sessions','session'),(7,'tf01','campuses'),(8,'tf01','classlist'),(9,'tf01','consultrecord'),(10,'tf01','courserecord'),(11,'tf01','customer'),(12,'tf01','department'),(13,'tf01','enrollment'),(14,'tf01','paymentrecord'),(15,'tf01','studyrecord'),(16,'tf01','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-19 12:10:37.061805'),(2,'auth','0001_initial','2019-11-19 12:10:37.861167'),(3,'admin','0001_initial','2019-11-19 12:10:38.055317'),(4,'admin','0002_logentry_remove_auto_add','2019-11-19 12:10:38.065318'),(5,'contenttypes','0002_remove_content_type_name','2019-11-19 12:10:38.212410'),(6,'auth','0002_alter_permission_name_max_length','2019-11-19 12:10:38.298581'),(7,'auth','0003_alter_user_email_max_length','2019-11-19 12:10:38.376424'),(8,'auth','0004_alter_user_username_opts','2019-11-19 12:10:38.387394'),(9,'auth','0005_alter_user_last_login_null','2019-11-19 12:10:38.449474'),(10,'auth','0006_require_contenttypes_0002','2019-11-19 12:10:38.454498'),(11,'auth','0007_alter_validators_add_error_messages','2019-11-19 12:10:38.464471'),(12,'auth','0008_alter_user_username_max_length','2019-11-19 12:10:38.534714'),(13,'sessions','0001_initial','2019-11-19 12:10:38.612670'),(14,'tf01','0001_initial','2019-11-19 12:10:41.505472'),(15,'rbac','0001_initial','2019-11-30 09:38:04.673169'),(16,'app01','0001_initial','2019-11-30 09:38:07.983456');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bml9ji7qvk0x72v2i6i76zway1dy7ifs','MjBiNjFkNzNkMDEzZmU0NDYxMjY3NTdmYTUxNDY1NzcxMGM2MTVmOTp7ImlzX2xvZ2luIjoidHJ1ZSIsInVzZXJfaWQiOjJ9','2019-12-05 10:04:21.698983'),('e333emtiodwg0ssfh4zbbueorez9o1sn','NzUwOTdjMDBjYzM4MGFiNDA1NjcyOWYwODQ4YmIxNGM5ZWYyYjNkNTp7InBrIjoxLCJpc19sb2dpbiI6dHJ1ZSwicGVybWlzc2lvbiI6eyJjdXN0b21lciI6eyJ1cmwiOiIvY3VzdG9tZXIvIiwidGl0bGUiOiJcdTViYTJcdTYyMzdcdTVlOTMiLCJpZCI6NCwicGlkIjpudWxsLCJwbmFtZSI6bnVsbH0sIm15X2N1c3RvbWVyIjp7InVybCI6Ii9teV9jdXN0b21lci8iLCJ0aXRsZSI6Ilx1NjIxMVx1NzY4NFx1NWJhMlx1NjIzNyIsImlkIjo1LCJwaWQiOm51bGwsInBuYW1lIjpudWxsfSwiY29uc3VsdF9yZWNvcmQiOnsidXJsIjoiL2NvbnN1bHRfcmVjb3JkLyIsInRpdGxlIjoiXHU4ZGRmXHU4ZmRiXHU4YmIwXHU1ZjU1IiwiaWQiOjgsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9LCJlbnJvbGxtZW50X2xpc3QiOnsidXJsIjoiL2Vucm9sbG1lbnRfbGlzdC8iLCJ0aXRsZSI6Ilx1NjJhNVx1NTQwZFx1OGJiMFx1NWY1NSIsImlkIjoxMiwicGlkIjpudWxsLCJwbmFtZSI6bnVsbH0sImNsYXNzX2xpc3QiOnsidXJsIjoiL2NsYXNzX2xpc3QvIiwidGl0bGUiOiJcdTczZWRcdTdlYTdcdTVjNTVcdTc5M2EiLCJpZCI6MzcsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9LCJyYmFjOnJvbGVfbGlzdCI6eyJ1cmwiOiIvcmJhYy9yb2xlL2xpc3QvIiwidGl0bGUiOiJcdTg5ZDJcdTgyNzJcdTVjNTVcdTc5M2EiLCJpZCI6MjQsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9LCJyYmFjOm1lbnVfbGlzdCI6eyJ1cmwiOiIvcmJhYy9tZW51L2xpc3QvIiwidGl0bGUiOiJcdTY3NDNcdTk2NTBcdTUyMTdcdTg4NjgiLCJpZCI6MjcsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9LCJyYmFjOmRpc3RyaWJ1dGVfcGVybWlzc2lvbnMiOnsidXJsIjoiL3JiYWMvZGlzdHJpYnV0ZS9wZXJtaXNzaW9ucy8iLCJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1NjNhN1x1NTIzNiIsImlkIjozNCwicGlkIjpudWxsLCJwbmFtZSI6bnVsbH0sImxvZ2luIjp7InVybCI6Ii9sb2dpbi8iLCJ0aXRsZSI6Ilx1NzY3Ylx1NWY1NSIsImlkIjoyLCJwaWQiOm51bGwsInBuYW1lIjpudWxsfSwicmVnaXN0ZXIiOnsidXJsIjoiL3JlZ2lzdGVyLyIsInRpdGxlIjoiXHU2Y2U4XHU1MThjIiwiaWQiOjMsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9LCJjdXN0b21lcl9hZGQiOnsidXJsIjoiL2N1c3RvbWVyX2FkZC8iLCJ0aXRsZSI6Ilx1NmRmYlx1NTJhMFx1NWJhMlx1NjIzNyIsImlkIjo2LCJwaWQiOjQsInBuYW1lIjoiY3VzdG9tZXIifSwiY3VzdG9tZXJfZWRpdCI6eyJ1cmwiOiIvY3VzdG9tZXJfZWRpdC8oXFxkKykvIiwidGl0bGUiOiJcdTViYTJcdTYyMzdcdTdmMTZcdThmOTEiLCJpZCI6NywicGlkIjo0LCJwbmFtZSI6ImN1c3RvbWVyIn0sIm9uZV9jb25zdWx0X3JlY29yZCI6eyJ1cmwiOiIvY29uc3VsdF9yZWNvcmQvKD9QPGN1c3RvbWVyX2lkPlxcZCspLyIsInRpdGxlIjoiXHU0ZTJhXHU0ZWJhXHU4ZGRmXHU4ZmRiXHU4YmIwXHU1ZjU1IiwiaWQiOjksInBpZCI6OCwicG5hbWUiOiJjb25zdWx0X3JlY29yZCJ9LCJjb25zdWx0X3JlY29yZF9hZGQiOnsidXJsIjoiL2NvbnN1bHRfcmVjb3JkX2FkZC8iLCJ0aXRsZSI6Ilx1NmRmYlx1NTJhMFx1OGRkZlx1OGZkYlx1OGJiMFx1NWY1NSIsImlkIjoxMCwicGlkIjo4LCJwbmFtZSI6ImNvbnN1bHRfcmVjb3JkIn0sImNvbnN1bHRfcmVjb3JkX2VkaXQiOnsidXJsIjoiL2NvbnN1bHRfcmVjb3JkX2VkaXQvKFxcZCspLyIsInRpdGxlIjoiXHU3ZjE2XHU4ZjkxXHU4ZGRmXHU4ZmRiXHU4YmIwXHU1ZjU1IiwiaWQiOjExLCJwaWQiOjgsInBuYW1lIjoiY29uc3VsdF9yZWNvcmQifSwib25lX2Vucm9sbG1lbnRfbGlzdCI6eyJ1cmwiOiIvZW5yb2xsbWVudF9saXN0Lyg/UDxjdXN0b21lcl9pZD5cXGQrKS8iLCJ0aXRsZSI6Ilx1NGUyYVx1NGViYVx1NjJhNVx1NTQwZFx1OGJiMFx1NWY1NSIsImlkIjoxMywicGlkIjoxMiwicG5hbWUiOiJlbnJvbGxtZW50X2xpc3QifSwiZW5yb2xsbWVudF9hZGQiOnsidXJsIjoiL2Vucm9sbG1lbnRfYWRkLyg/UDxjdXN0b21lcl9pZD5cXGQrKSIsInRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU2MmE1XHU1NDBkXHU4YmIwXHU1ZjU1XHU0ZTJhXHU0ZWJhIiwiaWQiOjE0LCJwaWQiOjEyLCJwbmFtZSI6ImVucm9sbG1lbnRfbGlzdCJ9LCJlbnJvbGxtZW50X2FkZDIiOnsidXJsIjoiL2Vucm9sbG1lbnRfYWRkLyIsInRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU2MmE1XHU1NDBkXHU4YmIwXHU1ZjU1IiwiaWQiOjE1LCJwaWQiOjEyLCJwbmFtZSI6ImVucm9sbG1lbnRfbGlzdCJ9LCJlbnJvbGxtZW50X2VkaXQiOnsidXJsIjoiL2Vucm9sbG1lbnRfZWRpdC8oP1A8cGs+XFxkKykiLCJ0aXRsZSI6Ilx1NGZlZVx1NjUzOVx1NjJhNVx1NTQwZFx1OGJiMFx1NWY1NSIsImlkIjoxNiwicGlkIjoxMiwicG5hbWUiOiJlbnJvbGxtZW50X2xpc3QifSwiY2xhc3NfYWRkIjp7InVybCI6Ii9jbGFzc19hZGQvIiwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTczZWRcdTdlYTciLCJpZCI6MTgsInBpZCI6MzcsInBuYW1lIjoiY2xhc3NfbGlzdCJ9LCJjbGFzc19lZGl0Ijp7InVybCI6Ii9jbGFzc19lZGl0LyhcXGQrKS8iLCJ0aXRsZSI6Ilx1NGZlZVx1NjUzOVx1NzNlZFx1N2VhNyIsImlkIjoxOSwicGlkIjozNywicG5hbWUiOiJjbGFzc19saXN0In0sImNvdXJzZV9yZWNvcmRfbGlzdCI6eyJ1cmwiOiIvY291cnNlX3JlY29yZF9saXN0Lyg/UDxjbGFzc19pZD5cXGQrKS8iLCJ0aXRsZSI6Ilx1OGJmZVx1N2EwYlx1OGJiMFx1NWY1NVx1NWM1NVx1NzkzYSIsImlkIjoyMCwicGlkIjpudWxsLCJwbmFtZSI6bnVsbH0sImNvdXJzZV9yZWNvcmRfYWRkIjp7InVybCI6Ii9jb3Vyc2VfcmVjb3JkX2FkZC8oP1A8Y2xhc3NfaWQ+XFxkKykvIiwidGl0bGUiOiJcdThiZmVcdTdhMGJcdThkZGZcdThmZGJcdThiYjBcdTVmNTUiLCJpZCI6MjEsInBpZCI6MjAsInBuYW1lIjoiY291cnNlX3JlY29yZF9saXN0In0sImNvdXJzZV9yZWNvcmRfYWRkX2VkaXQiOnsidXJsIjoiL2NvdXJzZV9yZWNvcmRfZWRpdC8oP1A8cGs+XFxkKykvIiwidGl0bGUiOiJcdThiZmVcdTdhMGJcdThkZGZcdThmZGJcdThiYjBcdTVmNTUiLCJpZCI6MjIsInBpZCI6MjAsInBuYW1lIjoiY291cnNlX3JlY29yZF9saXN0In0sInN0dWR5X3JlY29yZF9saXN0Ijp7InVybCI6Ii9zdHVkeV9yZWNvcmRfbGlzdC8oP1A8Y291cnNlX3JlY29yZF9pZD5cXGQrKS8iLCJ0aXRsZSI6Ilx1NWI2Nlx1NGU2MFx1OGJiMFx1NWY1NVx1NWM1NVx1NzkzYSIsImlkIjoyMywicGlkIjozNywicG5hbWUiOiJjbGFzc19saXN0In0sInJiYWM6cm9sZV9hZGQiOnsidXJsIjoiL3JiYWMvcm9sZS9hZGQvIiwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTg5ZDJcdTgyNzIiLCJpZCI6MjUsInBpZCI6MjQsInBuYW1lIjoicmJhYzpyb2xlX2xpc3QifSwicmJhYzpyb2xlX2VkaXQiOnsidXJsIjoiL3JiYWMvcm9sZS9lZGl0LyhcXGQrKSIsInRpdGxlIjoiXHU0ZmVlXHU2NTM5XHU4OWQyXHU4MjcyIiwiaWQiOjI2LCJwaWQiOjI0LCJwbmFtZSI6InJiYWM6cm9sZV9saXN0In0sInJiYWM6bWVudV9hZGQiOnsidXJsIjoiL3JiYWMvbWVudS9hZGQvIiwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTgzZGNcdTUzNTUiLCJpZCI6MjgsInBpZCI6MjcsInBuYW1lIjoicmJhYzptZW51X2xpc3QifSwicmJhYzptZW51X2VkaXQiOnsidXJsIjoiL3JiYWMvbWVudS9lZGl0LyhcXGQrKSIsInRpdGxlIjoiXHU0ZmVlXHU2NTM5XHU4M2RjXHU1MzU1IiwiaWQiOjI5LCJwaWQiOjI3LCJwbmFtZSI6InJiYWM6bWVudV9saXN0In0sInJiYWM6cGVybWlzc2lvbl9hZGQiOnsidXJsIjoiL3JiYWMvcGVybWlzc2lvbi9hZGQvIiwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTY3NDNcdTk2NTAiLCJpZCI6MzAsInBpZCI6MjcsInBuYW1lIjoicmJhYzptZW51X2xpc3QifSwicmJhYzpwZXJtaXNzaW9uX2VkaXQiOnsidXJsIjoiL3JiYWMvcGVybWlzc2lvbi9lZGl0LyhcXGQrKSIsInRpdGxlIjoiXHU0ZmVlXHU2NTM5XHU2NzQzXHU5NjUwIiwiaWQiOjMxLCJwaWQiOjI3LCJwbmFtZSI6InJiYWM6bWVudV9saXN0In0sInJiYWM6ZGVsZXRlIjp7InVybCI6Ii9yYmFjLyhcXHcrKS9kZWxldGUvKFxcZCspIiwidGl0bGUiOiJcdTUyMjBcdTk2NjQiLCJpZCI6MzIsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9LCJyYmFjOm11bHRpX3Blcm1pc3Npb25zIjp7InVybCI6Ii9yYmFjL211bHRpL3Blcm1pc3Npb25zLyIsInRpdGxlIjoiXHU2Mjc5XHU5MWNmXHU2NGNkXHU0ZjVjXHU2NzQzXHU5NjUwIiwiaWQiOjMzLCJwaWQiOjM0LCJwbmFtZSI6InJiYWM6ZGlzdHJpYnV0ZV9wZXJtaXNzaW9ucyJ9fSwibWVudSI6eyIxIjp7InRpdGxlIjoiXHU5NTAwXHU1NTJlIiwiaWNvbiI6ImZhLWFkZHJlc3MtYm9vayIsIndlaWdodCI6MSwiY2hpbGRyZW4iOlt7InRpdGxlIjoiXHU1YmEyXHU2MjM3XHU1ZTkzIiwidXJsIjoiL2N1c3RvbWVyLyIsImlkIjo0fSx7InRpdGxlIjoiXHU2MjExXHU3Njg0XHU1YmEyXHU2MjM3IiwidXJsIjoiL215X2N1c3RvbWVyLyIsImlkIjo1fSx7InRpdGxlIjoiXHU4ZGRmXHU4ZmRiXHU4YmIwXHU1ZjU1IiwidXJsIjoiL2NvbnN1bHRfcmVjb3JkLyIsImlkIjo4fSx7InRpdGxlIjoiXHU2MmE1XHU1NDBkXHU4YmIwXHU1ZjU1IiwidXJsIjoiL2Vucm9sbG1lbnRfbGlzdC8iLCJpZCI6MTJ9XX0sIjIiOnsidGl0bGUiOiJcdTczZWRcdTRlM2JcdTRlZmIiLCJpY29uIjoiZmEtd2hlZWxjaGFpci1hbHQiLCJ3ZWlnaHQiOjIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1NzNlZFx1N2VhN1x1NWM1NVx1NzkzYSIsInVybCI6Ii9jbGFzc19saXN0LyIsImlkIjozN31dfSwiMyI6eyJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1N2JhMVx1NzQwNiIsImljb24iOiJmYS1hdXRvbW9iaWxlIiwid2VpZ2h0IjoxLCJjaGlsZHJlbiI6W3sidGl0bGUiOiJcdTg5ZDJcdTgyNzJcdTVjNTVcdTc5M2EiLCJ1cmwiOiIvcmJhYy9yb2xlL2xpc3QvIiwiaWQiOjI0fSx7InRpdGxlIjoiXHU2NzQzXHU5NjUwXHU1MjE3XHU4ODY4IiwidXJsIjoiL3JiYWMvbWVudS9saXN0LyIsImlkIjoyN30seyJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1NjNhN1x1NTIzNiIsInVybCI6Ii9yYmFjL2Rpc3RyaWJ1dGUvcGVybWlzc2lvbnMvIiwiaWQiOjM0fV19fX0=','2019-12-15 14:04:25.633742'),('m7vbfg5m22jad1g7lyjre42hc57l00mz','MjIwZDlhYWU2ODkwOWEzNDE4MWM4N2ZjOTQzMzIzZDliYmI0NjlmOTp7ImlzX2xvZ2luIjoidHJ1ZSIsInVzZXJfaWQiOjIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjllOWFjMzRjYTMwYjc2MmIyNjZiMTZiY2UzZTJlMTkwMzAyMDIyIn0=','2019-12-09 07:02:09.899205'),('phdsrwtqb6xxlawjbukgsemxl4sdh4g1','NGIyYzM2ODkyNDI4ZTkyYzY2OGY3NmFmNjM2ZGM1Mzg0MTY3YmEwNDp7InBrIjoxLCJpc19sb2dpbiI6dHJ1ZSwicGVybWlzc2lvbiI6eyJjdXN0b21lciI6eyJ1cmwiOiIvY3VzdG9tZXIvIiwidGl0bGUiOiJcdTViYTJcdTYyMzdcdTVlOTMiLCJpZCI6NCwicGlkIjpudWxsLCJwbmFtZSI6bnVsbH0sIm15X2N1c3RvbWVyIjp7InVybCI6Ii9teV9jdXN0b21lci8iLCJ0aXRsZSI6Ilx1NjIxMVx1NzY4NFx1NWJhMlx1NjIzNyIsImlkIjo1LCJwaWQiOm51bGwsInBuYW1lIjpudWxsfSwiY29uc3VsdF9yZWNvcmQiOnsidXJsIjoiL2NvbnN1bHRfcmVjb3JkLyIsInRpdGxlIjoiXHU4ZGRmXHU4ZmRiXHU4YmIwXHU1ZjU1IiwiaWQiOjgsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9LCJlbnJvbGxtZW50X2xpc3QiOnsidXJsIjoiL2Vucm9sbG1lbnRfbGlzdC8iLCJ0aXRsZSI6Ilx1NjJhNVx1NTQwZFx1OGJiMFx1NWY1NSIsImlkIjoxMiwicGlkIjpudWxsLCJwbmFtZSI6bnVsbH0sImNvdXJzZV9yZWNvcmRfbGlzdCI6eyJ1cmwiOiIvY291cnNlX3JlY29yZF9saXN0Lyg/UDxjbGFzc19pZD5cXGQrKS8iLCJ0aXRsZSI6Ilx1OGJmZVx1N2EwYlx1OGJiMFx1NWY1NVx1NWM1NVx1NzkzYSIsImlkIjoyMCwicGlkIjpudWxsLCJwbmFtZSI6bnVsbH0sImNsYXNzX2xpc3QiOnsidXJsIjoiL2NsYXNzX2xpc3QvIiwidGl0bGUiOiJcdTczZWRcdTdlYTdcdTVjNTVcdTc5M2EiLCJpZCI6MzcsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9LCJyYmFjOnJvbGVfbGlzdCI6eyJ1cmwiOiIvcmJhYy9yb2xlL2xpc3QvIiwidGl0bGUiOiJcdTg5ZDJcdTgyNzJcdTVjNTVcdTc5M2EiLCJpZCI6MjQsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9LCJyYmFjOm1lbnVfbGlzdCI6eyJ1cmwiOiIvcmJhYy9tZW51L2xpc3QvIiwidGl0bGUiOiJcdTY3NDNcdTk2NTBcdTUyMTdcdTg4NjgiLCJpZCI6MjcsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9LCJyYmFjOmRpc3RyaWJ1dGVfcGVybWlzc2lvbnMiOnsidXJsIjoiL3JiYWMvZGlzdHJpYnV0ZS9wZXJtaXNzaW9ucy8iLCJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1NjNhN1x1NTIzNiIsImlkIjozNCwicGlkIjpudWxsLCJwbmFtZSI6bnVsbH0sImxvZ2luIjp7InVybCI6Ii9sb2dpbi8iLCJ0aXRsZSI6Ilx1NzY3Ylx1NWY1NSIsImlkIjoyLCJwaWQiOm51bGwsInBuYW1lIjpudWxsfSwicmVnaXN0ZXIiOnsidXJsIjoiL3JlZ2lzdGVyLyIsInRpdGxlIjoiXHU2Y2U4XHU1MThjIiwiaWQiOjMsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9LCJjdXN0b21lcl9hZGQiOnsidXJsIjoiL2N1c3RvbWVyX2FkZC8iLCJ0aXRsZSI6Ilx1NmRmYlx1NTJhMFx1NWJhMlx1NjIzNyIsImlkIjo2LCJwaWQiOjQsInBuYW1lIjoiY3VzdG9tZXIifSwiY3VzdG9tZXJfZWRpdCI6eyJ1cmwiOiIvY3VzdG9tZXJfZWRpdC8oXFxkKykvIiwidGl0bGUiOiJcdTViYTJcdTYyMzdcdTdmMTZcdThmOTEiLCJpZCI6NywicGlkIjo0LCJwbmFtZSI6ImN1c3RvbWVyIn0sIm9uZV9jb25zdWx0X3JlY29yZCI6eyJ1cmwiOiIvY29uc3VsdF9yZWNvcmQvKD9QPGN1c3RvbWVyX2lkPlxcZCspLyIsInRpdGxlIjoiXHU0ZTJhXHU0ZWJhXHU4ZGRmXHU4ZmRiXHU4YmIwXHU1ZjU1IiwiaWQiOjksInBpZCI6OCwicG5hbWUiOiJjb25zdWx0X3JlY29yZCJ9LCJjb25zdWx0X3JlY29yZF9hZGQiOnsidXJsIjoiL2NvbnN1bHRfcmVjb3JkX2FkZC8iLCJ0aXRsZSI6Ilx1NmRmYlx1NTJhMFx1OGRkZlx1OGZkYlx1OGJiMFx1NWY1NSIsImlkIjoxMCwicGlkIjo4LCJwbmFtZSI6ImNvbnN1bHRfcmVjb3JkIn0sImNvbnN1bHRfcmVjb3JkX2VkaXQiOnsidXJsIjoiL2NvbnN1bHRfcmVjb3JkX2VkaXQvKFxcZCspLyIsInRpdGxlIjoiXHU3ZjE2XHU4ZjkxXHU4ZGRmXHU4ZmRiXHU4YmIwXHU1ZjU1IiwiaWQiOjExLCJwaWQiOjgsInBuYW1lIjoiY29uc3VsdF9yZWNvcmQifSwib25lX2Vucm9sbG1lbnRfbGlzdCI6eyJ1cmwiOiIvZW5yb2xsbWVudF9saXN0Lyg/UDxjdXN0b21lcl9pZD5cXGQrKS8iLCJ0aXRsZSI6Ilx1NGUyYVx1NGViYVx1NjJhNVx1NTQwZFx1OGJiMFx1NWY1NSIsImlkIjoxMywicGlkIjoxMiwicG5hbWUiOiJlbnJvbGxtZW50X2xpc3QifSwiZW5yb2xsbWVudF9hZGQiOnsidXJsIjoiL2Vucm9sbG1lbnRfYWRkLyg/UDxjdXN0b21lcl9pZD5cXGQrKSIsInRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU2MmE1XHU1NDBkXHU4YmIwXHU1ZjU1XHU0ZTJhXHU0ZWJhIiwiaWQiOjE0LCJwaWQiOjEyLCJwbmFtZSI6ImVucm9sbG1lbnRfbGlzdCJ9LCJlbnJvbGxtZW50X2FkZDIiOnsidXJsIjoiL2Vucm9sbG1lbnRfYWRkLyIsInRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU2MmE1XHU1NDBkXHU4YmIwXHU1ZjU1IiwiaWQiOjE1LCJwaWQiOjEyLCJwbmFtZSI6ImVucm9sbG1lbnRfbGlzdCJ9LCJlbnJvbGxtZW50X2VkaXQiOnsidXJsIjoiL2Vucm9sbG1lbnRfZWRpdC8oP1A8cGs+XFxkKykiLCJ0aXRsZSI6Ilx1NGZlZVx1NjUzOVx1NjJhNVx1NTQwZFx1OGJiMFx1NWY1NSIsImlkIjoxNiwicGlkIjoxMiwicG5hbWUiOiJlbnJvbGxtZW50X2xpc3QifSwiY2xhc3NfYWRkIjp7InVybCI6Ii9jbGFzc19hZGQvIiwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTczZWRcdTdlYTciLCJpZCI6MTgsInBpZCI6MzcsInBuYW1lIjoiY2xhc3NfbGlzdCJ9LCJjbGFzc19lZGl0Ijp7InVybCI6Ii9jbGFzc19lZGl0LyhcXGQrKS8iLCJ0aXRsZSI6Ilx1NGZlZVx1NjUzOVx1NzNlZFx1N2VhNyIsImlkIjoxOSwicGlkIjozNywicG5hbWUiOiJjbGFzc19saXN0In0sImNvdXJzZV9yZWNvcmRfYWRkIjp7InVybCI6Ii9jb3Vyc2VfcmVjb3JkX2FkZC8oP1A8Y2xhc3NfaWQ+XFxkKykvIiwidGl0bGUiOiJcdThiZmVcdTdhMGJcdThkZGZcdThmZGJcdThiYjBcdTVmNTUiLCJpZCI6MjEsInBpZCI6MjAsInBuYW1lIjoiY291cnNlX3JlY29yZF9saXN0In0sImNvdXJzZV9yZWNvcmRfYWRkX2VkaXQiOnsidXJsIjoiL2NvdXJzZV9yZWNvcmRfZWRpdC8oP1A8cGs+XFxkKykvIiwidGl0bGUiOiJcdThiZmVcdTdhMGJcdThkZGZcdThmZGJcdThiYjBcdTVmNTUiLCJpZCI6MjIsInBpZCI6MjAsInBuYW1lIjoiY291cnNlX3JlY29yZF9saXN0In0sInN0dWR5X3JlY29yZF9saXN0Ijp7InVybCI6Ii9zdHVkeV9yZWNvcmRfbGlzdC8oP1A8Y291cnNlX3JlY29yZF9pZD5cXGQrKS8iLCJ0aXRsZSI6Ilx1NWI2Nlx1NGU2MFx1OGJiMFx1NWY1NVx1NWM1NVx1NzkzYSIsImlkIjoyMywicGlkIjozNywicG5hbWUiOiJjbGFzc19saXN0In0sInJiYWM6cm9sZV9hZGQiOnsidXJsIjoiL3JiYWMvcm9sZS9hZGQvIiwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTg5ZDJcdTgyNzIiLCJpZCI6MjUsInBpZCI6MjQsInBuYW1lIjoicmJhYzpyb2xlX2xpc3QifSwicmJhYzpyb2xlX2VkaXQiOnsidXJsIjoiL3JiYWMvcm9sZS9lZGl0LyhcXGQrKSIsInRpdGxlIjoiXHU0ZmVlXHU2NTM5XHU4OWQyXHU4MjcyIiwiaWQiOjI2LCJwaWQiOjI0LCJwbmFtZSI6InJiYWM6cm9sZV9saXN0In0sInJiYWM6bWVudV9hZGQiOnsidXJsIjoiL3JiYWMvbWVudS9hZGQvIiwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTgzZGNcdTUzNTUiLCJpZCI6MjgsInBpZCI6MjcsInBuYW1lIjoicmJhYzptZW51X2xpc3QifSwicmJhYzptZW51X2VkaXQiOnsidXJsIjoiL3JiYWMvbWVudS9lZGl0LyhcXGQrKSIsInRpdGxlIjoiXHU0ZmVlXHU2NTM5XHU4M2RjXHU1MzU1IiwiaWQiOjI5LCJwaWQiOjI3LCJwbmFtZSI6InJiYWM6bWVudV9saXN0In0sInJiYWM6cGVybWlzc2lvbl9hZGQiOnsidXJsIjoiL3JiYWMvcGVybWlzc2lvbi9hZGQvIiwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTY3NDNcdTk2NTAiLCJpZCI6MzAsInBpZCI6MjcsInBuYW1lIjoicmJhYzptZW51X2xpc3QifSwicmJhYzpwZXJtaXNzaW9uX2VkaXQiOnsidXJsIjoiL3JiYWMvcGVybWlzc2lvbi9lZGl0LyhcXGQrKSIsInRpdGxlIjoiXHU0ZmVlXHU2NTM5XHU2NzQzXHU5NjUwIiwiaWQiOjMxLCJwaWQiOjI3LCJwbmFtZSI6InJiYWM6bWVudV9saXN0In0sInJiYWM6ZGVsZXRlIjp7InVybCI6Ii9yYmFjLyhcXHcrKS9kZWxldGUvKFxcZCspIiwidGl0bGUiOiJcdTUyMjBcdTk2NjQiLCJpZCI6MzIsInBpZCI6bnVsbCwicG5hbWUiOm51bGx9fSwibWVudSI6eyIxIjp7InRpdGxlIjoiXHU5NTAwXHU1NTJlIiwiaWNvbiI6ImZhLWFkZHJlc3MtYm9vayIsIndlaWdodCI6MSwiY2hpbGRyZW4iOlt7InRpdGxlIjoiXHU1YmEyXHU2MjM3XHU1ZTkzIiwidXJsIjoiL2N1c3RvbWVyLyIsImlkIjo0fSx7InRpdGxlIjoiXHU2MjExXHU3Njg0XHU1YmEyXHU2MjM3IiwidXJsIjoiL215X2N1c3RvbWVyLyIsImlkIjo1fSx7InRpdGxlIjoiXHU4ZGRmXHU4ZmRiXHU4YmIwXHU1ZjU1IiwidXJsIjoiL2NvbnN1bHRfcmVjb3JkLyIsImlkIjo4fSx7InRpdGxlIjoiXHU2MmE1XHU1NDBkXHU4YmIwXHU1ZjU1IiwidXJsIjoiL2Vucm9sbG1lbnRfbGlzdC8iLCJpZCI6MTJ9LHsidGl0bGUiOiJcdThiZmVcdTdhMGJcdThiYjBcdTVmNTVcdTVjNTVcdTc5M2EiLCJ1cmwiOiIvY291cnNlX3JlY29yZF9saXN0Lyg/UDxjbGFzc19pZD5cXGQrKS8iLCJpZCI6MjB9XX0sIjIiOnsidGl0bGUiOiJcdTczZWRcdTRlM2JcdTRlZmIiLCJpY29uIjoiZmEtd2hlZWxjaGFpci1hbHQiLCJ3ZWlnaHQiOjIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1NzNlZFx1N2VhN1x1NWM1NVx1NzkzYSIsInVybCI6Ii9jbGFzc19saXN0LyIsImlkIjozN31dfSwiMyI6eyJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1N2JhMVx1NzQwNiIsImljb24iOiJmYS1hdXRvbW9iaWxlIiwid2VpZ2h0IjoxLCJjaGlsZHJlbiI6W3sidGl0bGUiOiJcdTg5ZDJcdTgyNzJcdTVjNTVcdTc5M2EiLCJ1cmwiOiIvcmJhYy9yb2xlL2xpc3QvIiwiaWQiOjI0fSx7InRpdGxlIjoiXHU2NzQzXHU5NjUwXHU1MjE3XHU4ODY4IiwidXJsIjoiL3JiYWMvbWVudS9saXN0LyIsImlkIjoyN30seyJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1NjNhN1x1NTIzNiIsInVybCI6Ii9yYmFjL2Rpc3RyaWJ1dGUvcGVybWlzc2lvbnMvIiwiaWQiOjM0fV19fSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRhM2VjZjQzZjc0MDRlZGU2OWNjNDBiYzU3M2VmOTY0YjIzMTY1NTAifQ==','2019-12-14 10:49:58.961533'),('xvvrehuxi3qaxwe24ufsp8j03z3ska1o','MmNiZTdlNDM0NzY3ZTc3NjYxNzM2N2RjYmNiZTBiY2U1MjA4ZWJiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjllOWFjMzRjYTMwYjc2MmIyNjZiMTZiY2UzZTJlMTkwMzAyMDIyIiwiaXNfbG9naW4iOiJ0cnVlIiwidXNlciI6ImZoQHFxLmNvbSIsInVzZXJfaWQiOjN9','2019-12-05 02:08:07.670941'),('zgx7rvps3mbuyrld39z7pauqegg3t7pf','MjIwZDlhYWU2ODkwOWEzNDE4MWM4N2ZjOTQzMzIzZDliYmI0NjlmOTp7ImlzX2xvZ2luIjoidHJ1ZSIsInVzZXJfaWQiOjIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjllOWFjMzRjYTMwYjc2MmIyNjZiMTZiY2UzZTJlMTkwMzAyMDIyIn0=','2019-12-05 04:03:41.922050');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_menu`
--

DROP TABLE IF EXISTS `rbac_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `icon` varchar(64) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_menu`
--

LOCK TABLES `rbac_menu` WRITE;
/*!40000 ALTER TABLE `rbac_menu` DISABLE KEYS */;
INSERT INTO `rbac_menu` VALUES (1,'销售','fa-address-book',1),(2,'班主任','fa-wheelchair-alt',2),(3,'权限管理','fa-automobile',1);
/*!40000 ALTER TABLE `rbac_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_permission`
--

DROP TABLE IF EXISTS `rbac_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `title` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `rbac_permission_menu_id_3dcc68be_fk_rbac_menu_id` (`menu_id`),
  KEY `rbac_permission_parent_id_bcb411ef_fk_rbac_permission_id` (`parent_id`),
  CONSTRAINT `rbac_permission_menu_id_3dcc68be_fk_rbac_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `rbac_menu` (`id`),
  CONSTRAINT `rbac_permission_parent_id_bcb411ef_fk_rbac_permission_id` FOREIGN KEY (`parent_id`) REFERENCES `rbac_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_permission`
--

LOCK TABLES `rbac_permission` WRITE;
/*!40000 ALTER TABLE `rbac_permission` DISABLE KEYS */;
INSERT INTO `rbac_permission` VALUES (2,'/login/','登录','login',NULL,NULL),(3,'/register/','注册','register',NULL,NULL),(4,'/customer/','客户库','customer',1,NULL),(5,'/my_customer/','我的客户','my_customer',1,NULL),(6,'/customer_add/','添加客户','customer_add',NULL,4),(7,'/customer_edit/(\\d+)/','客户编辑','customer_edit',NULL,4),(8,'/consult_record/','跟进记录','consult_record',1,NULL),(9,'/consult_record/(?P<customer_id>\\d+)/','个人跟进记录','one_consult_record',NULL,8),(10,'/consult_record_add/','添加跟进记录','consult_record_add',NULL,8),(11,'/consult_record_edit/(\\d+)/','编辑跟进记录','consult_record_edit',NULL,8),(12,'/enrollment_list/','报名记录','enrollment_list',1,NULL),(13,'/enrollment_list/(?P<customer_id>\\d+)/','个人报名记录','one_enrollment_list',NULL,12),(14,'/enrollment_add/(?P<customer_id>\\d+)','添加报名记录个人','enrollment_add',NULL,12),(15,'/enrollment_add/','添加报名记录','enrollment_add2',NULL,12),(16,'/enrollment_edit/(?P<pk>\\d+)','修改报名记录','enrollment_edit',NULL,12),(18,'/class_add/','添加班级','class_add',NULL,37),(19,'/class_edit/(\\d+)/','修改班级','class_edit',NULL,37),(20,'/course_record_list/(?P<class_id>\\d+)/','课程记录展示','course_record_list',NULL,NULL),(21,'/course_record_add/(?P<class_id>\\d+)/','课程跟进记录','course_record_add',NULL,NULL),(22,'/course_record_edit/(?P<pk>\\d+)/','课程跟进记录','course_record_add_edit',NULL,NULL),(23,'/study_record_list/(?P<course_record_id>\\d+)/','学习记录展示','study_record_list',NULL,37),(24,'/rbac/role/list/','角色展示','rbac:role_list',3,NULL),(25,'/rbac/role/add/','添加角色','rbac:role_add',NULL,24),(26,'/rbac/role/edit/(\\d+)','修改角色','rbac:role_edit',NULL,24),(27,'/rbac/menu/list/','权限列表','rbac:menu_list',3,NULL),(28,'/rbac/menu/add/','添加菜单','rbac:menu_add',NULL,27),(29,'/rbac/menu/edit/(\\d+)','修改菜单','rbac:menu_edit',NULL,27),(30,'/rbac/permission/add/','添加权限','rbac:permission_add',NULL,27),(31,'/rbac/permission/edit/(\\d+)','修改权限','rbac:permission_edit',NULL,27),(32,'/rbac/(\\w+)/delete/(\\d+)','删除','rbac:delete',NULL,NULL),(33,'/rbac/multi/permissions/','批量操作权限','rbac:multi_permissions',NULL,34),(34,'/rbac/distribute/permissions/','权限控制','rbac:distribute_permissions',3,NULL),(37,'/class_list/','班级展示','class_list',2,NULL);
/*!40000 ALTER TABLE `rbac_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role`
--

DROP TABLE IF EXISTS `rbac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role`
--

LOCK TABLES `rbac_role` WRITE;
/*!40000 ALTER TABLE `rbac_role` DISABLE KEYS */;
INSERT INTO `rbac_role` VALUES (1,'管理员'),(2,'销售'),(3,'班主任'),(4,'讲师'),(5,'财务');
/*!40000 ALTER TABLE `rbac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role_permissions`
--

DROP TABLE IF EXISTS `rbac_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_role_permissions_role_id_permission_id_d01303da_uniq` (`role_id`,`permission_id`),
  KEY `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm` (`permission_id`),
  CONSTRAINT `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm` FOREIGN KEY (`permission_id`) REFERENCES `rbac_permission` (`id`),
  CONSTRAINT `rbac_role_permissions_role_id_d10416cb_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role_permissions`
--

LOCK TABLES `rbac_role_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_role_permissions` DISABLE KEYS */;
INSERT INTO `rbac_role_permissions` VALUES (107,1,2),(131,1,3),(102,1,4),(112,1,5),(114,1,6),(105,1,7),(122,1,8),(116,1,9),(108,1,10),(117,1,11),(104,1,12),(128,1,13),(118,1,14),(129,1,15),(119,1,16),(106,1,18),(111,1,19),(123,1,20),(115,1,21),(133,1,22),(125,1,23),(121,1,24),(127,1,25),(110,1,26),(120,1,27),(113,1,28),(132,1,29),(103,1,30),(130,1,31),(124,1,32),(101,1,33),(126,1,34),(109,1,37),(54,2,4),(66,2,5),(53,2,6),(56,2,7),(58,2,8),(67,2,9),(65,2,10),(60,2,11),(64,2,12),(63,2,13),(68,2,14),(61,2,15),(62,2,16),(55,2,20),(59,2,21),(57,2,22),(141,3,18),(147,3,19),(142,3,20),(146,3,21),(143,3,22),(144,3,23),(145,3,37);
/*!40000 ALTER TABLE `rbac_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_campuses`
--

DROP TABLE IF EXISTS `tf01_campuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_campuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `address` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_campuses`
--

LOCK TABLES `tf01_campuses` WRITE;
/*!40000 ALTER TABLE `tf01_campuses` DISABLE KEYS */;
INSERT INTO `tf01_campuses` VALUES (1,'北京','北京'),(2,'上海','上海');
/*!40000 ALTER TABLE `tf01_campuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_classlist`
--

DROP TABLE IF EXISTS `tf01_classlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_classlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` varchar(64) NOT NULL,
  `semester` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `start_date` date NOT NULL,
  `graduate_date` date DEFAULT NULL,
  `class_type` varchar(64) DEFAULT NULL,
  `campuses_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tf01_classlist_course_semester_campuses_id_98f645ee_uniq` (`course`,`semester`,`campuses_id`),
  KEY `tf01_classlist_campuses_id_ca1839b5_fk_tf01_campuses_id` (`campuses_id`),
  CONSTRAINT `tf01_classlist_campuses_id_ca1839b5_fk_tf01_campuses_id` FOREIGN KEY (`campuses_id`) REFERENCES `tf01_campuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_classlist`
--

LOCK TABLES `tf01_classlist` WRITE;
/*!40000 ALTER TABLE `tf01_classlist` DISABLE KEYS */;
INSERT INTO `tf01_classlist` VALUES (1,'PythonFullStack',1,10000,NULL,'2019-11-20',NULL,'weekend',1),(2,'Linux',1,10000,NULL,'2019-11-20',NULL,'fulltime',1);
/*!40000 ALTER TABLE `tf01_classlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_classlist_teachers`
--

DROP TABLE IF EXISTS `tf01_classlist_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_classlist_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classlist_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tf01_classlist_teachers_classlist_id_userprofile_ebe4b006_uniq` (`classlist_id`,`userprofile_id`),
  KEY `tf01_classlist_teach_userprofile_id_c02f83ec_fk_tf01_user` (`userprofile_id`),
  CONSTRAINT `tf01_classlist_teach_classlist_id_d5009776_fk_tf01_clas` FOREIGN KEY (`classlist_id`) REFERENCES `tf01_classlist` (`id`),
  CONSTRAINT `tf01_classlist_teach_userprofile_id_c02f83ec_fk_tf01_user` FOREIGN KEY (`userprofile_id`) REFERENCES `tf01_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_classlist_teachers`
--

LOCK TABLES `tf01_classlist_teachers` WRITE;
/*!40000 ALTER TABLE `tf01_classlist_teachers` DISABLE KEYS */;
INSERT INTO `tf01_classlist_teachers` VALUES (5,1,2),(2,2,2),(3,2,3);
/*!40000 ALTER TABLE `tf01_classlist_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_consultrecord`
--

DROP TABLE IF EXISTS `tf01_consultrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_consultrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` longtext NOT NULL,
  `status` varchar(8) NOT NULL,
  `date` datetime(6) NOT NULL,
  `delete_status` tinyint(1) NOT NULL,
  `consultant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tf01_consultrecord_consultant_id_6afe8602_fk_tf01_userprofile_id` (`consultant_id`),
  KEY `tf01_consultrecord_customer_id_a624cccb_fk_tf01_customer_id` (`customer_id`),
  CONSTRAINT `tf01_consultrecord_consultant_id_6afe8602_fk_tf01_userprofile_id` FOREIGN KEY (`consultant_id`) REFERENCES `tf01_userprofile` (`id`),
  CONSTRAINT `tf01_consultrecord_customer_id_a624cccb_fk_tf01_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `tf01_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_consultrecord`
--

LOCK TABLES `tf01_consultrecord` WRITE;
/*!40000 ALTER TABLE `tf01_consultrecord` DISABLE KEYS */;
INSERT INTO `tf01_consultrecord` VALUES (1,'跟进内容1跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容','B','2019-11-25 07:03:19.786000',0,2,1),(2,'跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容跟进内容','C','2019-11-25 07:12:32.722000',0,2,4),(3,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','D','2019-11-25 07:32:14.332641',0,2,1),(4,'1231232131231232','E','2019-11-25 07:59:23.230620',0,2,1),(5,'asdasdasfaga','F','2019-11-25 08:00:22.784693',0,2,7),(6,'qweqwr','F','2019-11-25 08:02:29.937146',0,2,4),(7,'qweqweqweqweqweq','G','2019-11-25 09:23:17.935448',0,2,7);
/*!40000 ALTER TABLE `tf01_consultrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_courserecord`
--

DROP TABLE IF EXISTS `tf01_courserecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_courserecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_num` int(11) NOT NULL,
  `date` date NOT NULL,
  `course_title` varchar(64) DEFAULT NULL,
  `course_memo` longtext,
  `has_homework` tinyint(1) NOT NULL,
  `homework_title` varchar(64) DEFAULT NULL,
  `homework_memo` longtext,
  `scoring_point` longtext,
  `re_class_id` int(11) NOT NULL,
  `recorder_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tf01_courserecord_re_class_id_day_num_65e53624_uniq` (`re_class_id`,`day_num`),
  KEY `tf01_courserecord_recorder_id_0a0ca99f_fk_tf01_userprofile_id` (`recorder_id`),
  KEY `tf01_courserecord_teacher_id_17a6e842_fk_tf01_userprofile_id` (`teacher_id`),
  CONSTRAINT `tf01_courserecord_re_class_id_18952e39_fk_tf01_classlist_id` FOREIGN KEY (`re_class_id`) REFERENCES `tf01_classlist` (`id`),
  CONSTRAINT `tf01_courserecord_recorder_id_0a0ca99f_fk_tf01_userprofile_id` FOREIGN KEY (`recorder_id`) REFERENCES `tf01_userprofile` (`id`),
  CONSTRAINT `tf01_courserecord_teacher_id_17a6e842_fk_tf01_userprofile_id` FOREIGN KEY (`teacher_id`) REFERENCES `tf01_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_courserecord`
--

LOCK TABLES `tf01_courserecord` WRITE;
/*!40000 ALTER TABLE `tf01_courserecord` DISABLE KEYS */;
INSERT INTO `tf01_courserecord` VALUES (1,1,'2019-11-26','str','str int bool list dict set',1,'str','asd','1',1,3,2),(2,2,'2019-11-26',NULL,'',0,NULL,'','',1,2,2),(3,3,'2019-11-26',NULL,'',1,NULL,'','',1,2,2),(4,4,'2019-11-26',NULL,'',0,NULL,'','',1,2,2),(5,6,'2019-11-26',NULL,'',1,NULL,'','',1,2,2),(9,1,'2019-11-26',NULL,'',1,NULL,'','',2,2,2);
/*!40000 ALTER TABLE `tf01_courserecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_customer`
--

DROP TABLE IF EXISTS `tf01_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qq` varchar(64) NOT NULL,
  `qq_name` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `sex` varchar(16) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `source` varchar(64) NOT NULL,
  `course` varchar(21) NOT NULL,
  `class_type` varchar(64) NOT NULL,
  `customer_note` longtext,
  `status` varchar(64) NOT NULL,
  `last_consult_date` date NOT NULL,
  `next_date` date DEFAULT NULL,
  `consultant_id` int(11) DEFAULT NULL,
  `introduce_from_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qq` (`qq`),
  KEY `tf01_customer_consultant_id_1c8de557_fk_tf01_userprofile_id` (`consultant_id`),
  KEY `tf01_customer_introduce_from_id_1448187f_fk_tf01_customer_id` (`introduce_from_id`),
  CONSTRAINT `tf01_customer_consultant_id_1c8de557_fk_tf01_userprofile_id` FOREIGN KEY (`consultant_id`) REFERENCES `tf01_userprofile` (`id`),
  CONSTRAINT `tf01_customer_introduce_from_id_1448187f_fk_tf01_customer_id` FOREIGN KEY (`introduce_from_id`) REFERENCES `tf01_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_customer`
--

LOCK TABLES `tf01_customer` WRITE;
/*!40000 ALTER TABLE `tf01_customer` DISABLE KEYS */;
INSERT INTO `tf01_customer` VALUES (1,'13214',NULL,NULL,'male',NULL,NULL,'qq','Linux,PythonFullStack','fulltime','','studying','2019-11-20',NULL,2,NULL),(2,'2222222',NULL,NULL,'male','2019-11-20',NULL,'qq','Linux,PythonFullStack','online','','signed','2019-11-20','2019-11-20',3,NULL),(3,'33333333',NULL,NULL,'female','2019-11-20',NULL,'qq','Linux','fulltime','','studying','2019-11-20','2019-11-20',2,NULL),(4,'4444444',NULL,'abc','female',NULL,NULL,'qq','PythonFullStack','fulltime','','studying','2019-11-21','2019-11-21',2,NULL),(5,'5555555',NULL,NULL,'male','2019-11-21',NULL,'qq','Linux','weekend','','studying','2019-11-21','2019-11-21',NULL,NULL),(6,'66666666',NULL,NULL,'male',NULL,NULL,'qq','Linux','fulltime','','unregistered','2019-11-21',NULL,NULL,NULL),(7,'123',NULL,NULL,'male',NULL,NULL,'qq','Linux','fulltime','','studying','2019-11-21','2019-11-20',2,NULL),(8,'8888888','asd','asd','male',NULL,1,'qq','Linux,PythonFullStack','fulltime','','studying','2019-11-21',NULL,2,NULL),(9,'12341234',NULL,NULL,'male',NULL,NULL,'qq','Linux','fulltime','','unregistered','2019-11-21',NULL,NULL,NULL),(10,'12412541',NULL,NULL,'male',NULL,NULL,'qq','Linux','fulltime','','unregistered','2019-11-21',NULL,NULL,NULL),(11,'345324534',NULL,NULL,'male',NULL,NULL,'qq','PythonFullStack','fulltime','','unregistered','2019-11-21',NULL,NULL,NULL),(12,'432534263',NULL,NULL,'male',NULL,NULL,'qq','PythonFullStack','fulltime','','unregistered','2019-11-21',NULL,NULL,NULL),(13,'2333546546',NULL,NULL,'male',NULL,NULL,'qq','Linux','fulltime','','unregistered','2019-11-21',NULL,NULL,NULL),(14,'64536324523',NULL,NULL,'male',NULL,NULL,'qq','Linux','fulltime','','unregistered','2019-11-21',NULL,NULL,NULL),(15,'534563242',NULL,NULL,'male',NULL,NULL,'qq','PythonFullStack','fulltime','','unregistered','2019-11-21',NULL,NULL,NULL),(16,'134256334',NULL,'cwa','male',NULL,NULL,'qq','PythonFullStack','fulltime','','unregistered','2019-11-21',NULL,NULL,NULL),(17,'1256432534',NULL,NULL,'male',NULL,NULL,'qq','Linux','fulltime','','unregistered','2019-11-21',NULL,NULL,NULL),(18,'2135241431',NULL,NULL,'male',NULL,NULL,'qq','Linux','fulltime','','unregistered','2019-11-21',NULL,NULL,NULL),(19,'513512',NULL,NULL,'male',NULL,NULL,'qq','PythonFullStack','fulltime','','unregistered','2019-11-25',NULL,NULL,NULL),(20,'123123',NULL,NULL,'male',NULL,NULL,'qq','PythonFullStack','fulltime','','unregistered','2019-11-25',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tf01_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_customer_class_list`
--

DROP TABLE IF EXISTS `tf01_customer_class_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_customer_class_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `classlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tf01_customer_class_list_customer_id_classlist_id_a4ea23b6_uniq` (`customer_id`,`classlist_id`),
  KEY `tf01_customer_class__classlist_id_51fc029c_fk_tf01_clas` (`classlist_id`),
  CONSTRAINT `tf01_customer_class__classlist_id_51fc029c_fk_tf01_clas` FOREIGN KEY (`classlist_id`) REFERENCES `tf01_classlist` (`id`),
  CONSTRAINT `tf01_customer_class__customer_id_b09c0adf_fk_tf01_cust` FOREIGN KEY (`customer_id`) REFERENCES `tf01_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_customer_class_list`
--

LOCK TABLES `tf01_customer_class_list` WRITE;
/*!40000 ALTER TABLE `tf01_customer_class_list` DISABLE KEYS */;
INSERT INTO `tf01_customer_class_list` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(6,3,2),(7,4,1),(8,5,2),(9,6,2),(10,7,1),(11,8,2);
/*!40000 ALTER TABLE `tf01_customer_class_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_department`
--

DROP TABLE IF EXISTS `tf01_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_department`
--

LOCK TABLES `tf01_department` WRITE;
/*!40000 ALTER TABLE `tf01_department` DISABLE KEYS */;
INSERT INTO `tf01_department` VALUES (1,'销售部',10),(2,'讲师部',5);
/*!40000 ALTER TABLE `tf01_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_enrollment`
--

DROP TABLE IF EXISTS `tf01_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_enrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `why_us` longtext,
  `your_expectation` longtext,
  `contract_agreed` tinyint(1) NOT NULL,
  `contract_approved` tinyint(1) NOT NULL,
  `enrolled_date` datetime(6) NOT NULL,
  `memo` longtext,
  `delete_status` tinyint(1) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `enrolment_class_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tf01_enrollment_enrolment_class_id_customer_id_f5e42d57_uniq` (`enrolment_class_id`,`customer_id`),
  KEY `tf01_enrollment_customer_id_41b2b2f7_fk_tf01_customer_id` (`customer_id`),
  KEY `tf01_enrollment_school_id_b13ff6d5_fk_tf01_campuses_id` (`school_id`),
  CONSTRAINT `tf01_enrollment_customer_id_41b2b2f7_fk_tf01_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `tf01_customer` (`id`),
  CONSTRAINT `tf01_enrollment_enrolment_class_id_5693517f_fk_tf01_classlist_id` FOREIGN KEY (`enrolment_class_id`) REFERENCES `tf01_classlist` (`id`),
  CONSTRAINT `tf01_enrollment_school_id_b13ff6d5_fk_tf01_campuses_id` FOREIGN KEY (`school_id`) REFERENCES `tf01_campuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_enrollment`
--

LOCK TABLES `tf01_enrollment` WRITE;
/*!40000 ALTER TABLE `tf01_enrollment` DISABLE KEYS */;
INSERT INTO `tf01_enrollment` VALUES (1,'老子愿意','上天',1,1,'2019-11-25 11:52:57.067688','dsb',0,1,1,1),(2,'aaa','asd',1,1,'2019-11-25 11:53:17.071830','asd',0,4,1,1),(3,'51','1231',0,0,'2019-11-25 13:31:35.978132','124',0,1,2,1),(4,'','',0,0,'2019-11-25 13:42:57.795677','',0,3,2,1);
/*!40000 ALTER TABLE `tf01_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_paymentrecord`
--

DROP TABLE IF EXISTS `tf01_paymentrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_paymentrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_type` varchar(64) NOT NULL,
  `paid_fee` int(11) NOT NULL,
  `note` longtext,
  `date` datetime(6) NOT NULL,
  `course` varchar(64) DEFAULT NULL,
  `class_type` varchar(64) DEFAULT NULL,
  `delete_status` tinyint(1) NOT NULL,
  `status` int(11) NOT NULL,
  `confirm_date` datetime(6) DEFAULT NULL,
  `confirm_user_id` int(11) DEFAULT NULL,
  `consultant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `enrolment_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tf01_paymentrecord_confirm_user_id_7fe209ce_fk_tf01_user` (`confirm_user_id`),
  KEY `tf01_paymentrecord_consultant_id_dc749ed1_fk_tf01_userprofile_id` (`consultant_id`),
  KEY `tf01_paymentrecord_customer_id_8075f283_fk_tf01_customer_id` (`customer_id`),
  KEY `tf01_paymentrecord_enrolment_class_id_8d1525fa_fk_tf01_clas` (`enrolment_class_id`),
  CONSTRAINT `tf01_paymentrecord_confirm_user_id_7fe209ce_fk_tf01_user` FOREIGN KEY (`confirm_user_id`) REFERENCES `tf01_userprofile` (`id`),
  CONSTRAINT `tf01_paymentrecord_consultant_id_dc749ed1_fk_tf01_userprofile_id` FOREIGN KEY (`consultant_id`) REFERENCES `tf01_userprofile` (`id`),
  CONSTRAINT `tf01_paymentrecord_customer_id_8075f283_fk_tf01_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `tf01_customer` (`id`),
  CONSTRAINT `tf01_paymentrecord_enrolment_class_id_8d1525fa_fk_tf01_clas` FOREIGN KEY (`enrolment_class_id`) REFERENCES `tf01_classlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_paymentrecord`
--

LOCK TABLES `tf01_paymentrecord` WRITE;
/*!40000 ALTER TABLE `tf01_paymentrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `tf01_paymentrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_studyrecord`
--

DROP TABLE IF EXISTS `tf01_studyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_studyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance` varchar(64) NOT NULL,
  `score` int(11) NOT NULL,
  `homework_note` varchar(255) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `homework` varchar(100) DEFAULT NULL,
  `course_record_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tf01_studyrecord_course_record_id_student_id_2ba2ec7a_uniq` (`course_record_id`,`student_id`),
  KEY `tf01_studyrecord_student_id_1a4a0b8f_fk_tf01_customer_id` (`student_id`),
  CONSTRAINT `tf01_studyrecord_course_record_id_18de2234_fk_tf01_cour` FOREIGN KEY (`course_record_id`) REFERENCES `tf01_courserecord` (`id`),
  CONSTRAINT `tf01_studyrecord_student_id_1a4a0b8f_fk_tf01_customer_id` FOREIGN KEY (`student_id`) REFERENCES `tf01_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_studyrecord`
--

LOCK TABLES `tf01_studyrecord` WRITE;
/*!40000 ALTER TABLE `tf01_studyrecord` DISABLE KEYS */;
INSERT INTO `tf01_studyrecord` VALUES (1,'leave_early',60,'gdgdfgdf','2019-11-26 11:46:06.285703',NULL,'',1,1),(2,'checked',-1,NULL,'2019-11-26 13:09:11.346786',NULL,'',2,1),(3,'checked',-1,NULL,'2019-11-26 13:09:11.346786',NULL,'',2,4),(4,'checked',-1,NULL,'2019-11-26 13:09:11.347783',NULL,'',2,7),(5,'checked',-1,NULL,'2019-11-26 13:09:22.391546',NULL,'',1,4),(6,'checked',-1,NULL,'2019-11-26 13:09:22.391546',NULL,'',1,7),(7,'leave_early',70,'eqwqw','2019-11-26 13:11:28.660831',NULL,'',9,1),(8,'checked',50,'eqw','2019-11-26 13:11:28.660831',NULL,'',9,3),(9,'late',50,'eqwe','2019-11-26 13:11:28.660831',NULL,'',9,5),(10,'vacate',50,'qwe','2019-11-26 13:11:28.661827',NULL,'',9,8);
/*!40000 ALTER TABLE `tf01_studyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf01_userprofile`
--

DROP TABLE IF EXISTS `tf01_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf01_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `name` varchar(32) NOT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `memo` longtext,
  `date_joined` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `tf01_userprofile_department_id_0f8bab74_fk_tf01_department_id` (`department_id`),
  CONSTRAINT `tf01_userprofile_department_id_0f8bab74_fk_tf01_department_id` FOREIGN KEY (`department_id`) REFERENCES `tf01_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf01_userprofile`
--

LOCK TABLES `tf01_userprofile` WRITE;
/*!40000 ALTER TABLE `tf01_userprofile` DISABLE KEYS */;
INSERT INTO `tf01_userprofile` VALUES (2,'fh@qq.com','698d51a19d8a121ce581499d7b701668','fh','11111111111',NULL,'2019-11-20 07:43:13.653847',1,1),(3,'qq@11.com','b59c67bf196a4758191e42f76670ceba','1111',NULL,NULL,'2019-11-20 08:17:05.205311',1,NULL);
/*!40000 ALTER TABLE `tf01_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-18 15:50:48
