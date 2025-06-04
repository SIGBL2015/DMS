-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: punjabassembly
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `a_dsolvd_msgs`
--

DROP TABLE IF EXISTS `a_dsolvd_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_dsolvd_msgs` (
  `aid` int(11) NOT NULL DEFAULT 0,
  `msg_e` text DEFAULT NULL,
  `msg_u` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Message on main page when assembly is dissolved';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `act2bl`
--

DROP TABLE IF EXISTS `act2bl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act2bl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actid` int(11) NOT NULL DEFAULT 0,
  `bid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Relate Acts to the draft bills';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `act_amnds`
--

DROP TABLE IF EXISTS `act_amnds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_amnds` (
  `actid` int(11) NOT NULL DEFAULT 0,
  `orgnl_act` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Act Amedning these past acts ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `act_fls`
--

DROP TABLE IF EXISTS `act_fls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_fls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actid` int(11) NOT NULL DEFAULT 0,
  `translation` char(3) NOT NULL DEFAULT 'No',
  `ftitle` text NOT NULL,
  `link` text DEFAULT NULL,
  `fsize` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1328 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Act File upload';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acts`
--

DROP TABLE IF EXISTS `acts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acts` (
  `actid` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `pyid` int(11) NOT NULL DEFAULT 0,
  `lg_lng_id` int(11) NOT NULL DEFAULT 0,
  `title` text NOT NULL,
  `act_no` varchar(255) NOT NULL DEFAULT '',
  `amndmnt` char(3) DEFAULT 'No',
  `dt_pass` date DEFAULT NULL,
  `dt_enf` date DEFAULT NULL,
  PRIMARY KEY (`actid`)
) ENGINE=MyISAM AUTO_INCREMENT=890 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Acts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asmblys`
--

DROP TABLE IF EXISTS `asmblys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asmblys` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `title_e` varchar(255) NOT NULL DEFAULT '',
  `title_u` text DEFAULT NULL,
  `dt_incp` date NOT NULL DEFAULT '0000-00-00',
  `dsolvd` char(3) NOT NULL DEFAULT 'No',
  `dt_dsolvd` date NOT NULL DEFAULT '0000-00-00',
  `name` varchar(15) NOT NULL,
  `asmbly_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=1 COMMENT='Assemblies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asmblys_smry`
--

DROP TABLE IF EXISTS `asmblys_smry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asmblys_smry` (
  `aid` int(11) NOT NULL DEFAULT 0,
  `dtls_e` longtext DEFAULT NULL,
  `dtls_u` longtext DEFAULT NULL,
  `legislation` int(11) DEFAULT 0,
  `motion` int(11) DEFAULT 0,
  `sessions` int(11) DEFAULT 0,
  `resolutions` int(11) DEFAULT 0,
  `questions` int(11) DEFAULT 0,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Session Summary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assembly_calendar`
--

DROP TABLE IF EXISTS `assembly_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assembly_calendar` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT,
  `ac_date` text DEFAULT NULL,
  `ac_aid` int(11) DEFAULT NULL,
  `ac_pyid` int(11) DEFAULT NULL,
  `ac_type` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `btid` int(11) NOT NULL DEFAULT 0,
  `lg_lng_id` int(11) NOT NULL DEFAULT 0,
  `stnid` int(11) NOT NULL DEFAULT 0,
  `stnid_rejected` int(11) DEFAULT 0,
  `bmtid` int(11) NOT NULL DEFAULT 0,
  `title` text NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Bills';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bl_draft_fls`
--

DROP TABLE IF EXISTS `bl_draft_fls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_draft_fls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL DEFAULT 0,
  `ftitle` text NOT NULL,
  `translation` char(3) NOT NULL DEFAULT 'No',
  `link` text NOT NULL,
  `fsize` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=703 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Bill Draft Files for upload';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bl_mvrs`
--

DROP TABLE IF EXISTS `bl_mvrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_mvrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL DEFAULT 0,
  `mid` int(11) NOT NULL DEFAULT 0,
  `main` char(3) NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Movers of a Bill';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bl_prncpl`
--

DROP TABLE IF EXISTS `bl_prncpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_prncpl` (
  `bid` int(11) NOT NULL DEFAULT 0,
  `txt_e` longtext DEFAULT NULL,
  `txt_u` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Principle of the Bill - 1 to 1 relation with bill';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bl_track`
--

DROP TABLE IF EXISTS `bl_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_track` (
  `btrck_id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL DEFAULT 0,
  `bstid` int(11) NOT NULL DEFAULT 0,
  `stnid` int(11) NOT NULL DEFAULT 0,
  `bl_date` datetime DEFAULT NULL,
  PRIMARY KEY (`btrck_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1174 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='BIll Tracking';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bl_track_cmt`
--

DROP TABLE IF EXISTS `bl_track_cmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_track_cmt` (
  `cmtid` int(11) NOT NULL DEFAULT 0,
  `btrck_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Bill Tracking any Committees envolved';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `session_start` int(10) unsigned NOT NULL DEFAULT 0,
  `session_last_activity` int(10) unsigned NOT NULL DEFAULT 0,
  `session_ip_address` varchar(16) NOT NULL DEFAULT '0',
  `session_user_agent` varchar(50) NOT NULL DEFAULT '',
  `session_data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `viewable` char(3) DEFAULT 'Yes',
  `city_e` varchar(255) NOT NULL DEFAULT '',
  `city_u` text DEFAULT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Cities in this province';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmt_cp`
--

DROP TABLE IF EXISTS `cmt_cp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmt_cp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmtid` int(11) NOT NULL DEFAULT 0,
  `mid` int(11) NOT NULL DEFAULT 0,
  `in_place_cp_id` int(11) NOT NULL DEFAULT 0,
  `dt_elect` date NOT NULL DEFAULT '0000-00-00',
  `dt_rmvd` date DEFAULT NULL,
  `y_left_e` text DEFAULT NULL,
  `y_left_u` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Chairperson for a committee';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmt_mbrs`
--

DROP TABLE IF EXISTS `cmt_mbrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmt_mbrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmtid` int(11) NOT NULL DEFAULT 0,
  `mid` int(11) NOT NULL DEFAULT 0,
  `in_place_mpa_id` int(11) DEFAULT 0,
  `dt_elect` date NOT NULL DEFAULT '0000-00-00',
  `dt_rmvd` date DEFAULT NULL,
  `y_rplc_e` text DEFAULT NULL,
  `y_rplc_u` text DEFAULT NULL,
  `m_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3310 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Committee members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmt_mom`
--

DROP TABLE IF EXISTS `cmt_mom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmt_mom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmtid` int(11) NOT NULL DEFAULT 0,
  `title` text NOT NULL,
  `dt_pblsh` date DEFAULT NULL,
  `dtls_e` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Committee Reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmt_rpts`
--

DROP TABLE IF EXISTS `cmt_rpts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmt_rpts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmtid` int(11) NOT NULL DEFAULT 0,
  `title` text NOT NULL,
  `link` text DEFAULT NULL,
  `fsize` varchar(11) DEFAULT '0',
  `dt_pblsh` date DEFAULT NULL,
  `in_prnt` char(3) NOT NULL DEFAULT 'No',
  `title_u` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=507 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Committee Reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmt_types`
--

DROP TABLE IF EXISTS `cmt_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmt_types` (
  `ctid` int(11) NOT NULL AUTO_INCREMENT,
  `navid` int(11) NOT NULL DEFAULT 0,
  `prmnt` char(3) NOT NULL DEFAULT 'No',
  `ct_title_e` text NOT NULL,
  `ct_title_u` text DEFAULT NULL,
  PRIMARY KEY (`ctid`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=0 COMMENT='Committee Types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmts`
--

DROP TABLE IF EXISTS `cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmts` (
  `cmtid` int(11) NOT NULL AUTO_INCREMENT,
  `ctid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `c_title_e` text NOT NULL,
  `c_title_u` text NOT NULL,
  `dt_frmd` date DEFAULT NULL,
  `c_email` text DEFAULT NULL,
  `details_e` text DEFAULT NULL,
  `details_u` text DEFAULT NULL,
  `adr_e` text DEFAULT NULL,
  `adr_u` text DEFAULT NULL,
  `cn_dsolv` char(3) NOT NULL DEFAULT 'No',
  `dt_dsolvd` date DEFAULT NULL,
  `c_order` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cmtid`)
) ENGINE=MyISAM AUTO_INCREMENT=331 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Committees';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cntry`
--

DROP TABLE IF EXISTS `cntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cntry` (
  `cnt_id` int(11) DEFAULT NULL,
  `cntr_e` varchar(100) DEFAULT NULL,
  `cntr_u` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vname` text NOT NULL,
  `email` text NOT NULL,
  `dt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cityid` int(11) NOT NULL DEFAULT 0,
  `city_othr` text DEFAULT NULL,
  `inqid` int(11) NOT NULL DEFAULT 0,
  `msg` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11304 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Contact Assembly secteriate form data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designations` (
  `designation_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(255) NOT NULL,
  `designation_name_urdu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `designation_short_name` varchar(100) NOT NULL,
  `designation_functions` text NOT NULL,
  `designation_functions_urdu` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `designation_order` int(11) NOT NULL,
  `designation_remarks` varchar(255) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `updated_datetime` datetime NOT NULL,
  `designation_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`designation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dspkr_news`
--

DROP TABLE IF EXISTS `dspkr_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dspkr_news` (
  `dspkr_id` int(11) NOT NULL DEFAULT 0,
  `newsid` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Media related to Deputy Speaker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dspkrs`
--

DROP TABLE IF EXISTS `dspkrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dspkrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `stnid` int(11) NOT NULL DEFAULT 0,
  `dt_elected` date DEFAULT NULL,
  `in_place_mpa_id` int(11) DEFAULT 0,
  `dt_resigned` date DEFAULT NULL,
  `photofile` text DEFAULT NULL,
  `msg_e` mediumtext DEFAULT NULL,
  `msg_u` longtext DEFAULT NULL,
  `role_e` mediumtext DEFAULT NULL,
  `role_u` longtext DEFAULT NULL,
  `staff_e` mediumtext DEFAULT NULL,
  `staff_u` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Deputy Speakers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fqcid` int(11) NOT NULL DEFAULT 0,
  `q_e` text NOT NULL,
  `q_u` text DEFAULT NULL,
  `a_e` mediumtext NOT NULL,
  `a_u` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='FAQs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faq_bk`
--

DROP TABLE IF EXISTS `faq_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fqcid` int(11) NOT NULL DEFAULT 0,
  `q_e` text NOT NULL,
  `q_u` text DEFAULT NULL,
  `a_e` mediumtext NOT NULL,
  `a_u` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='FAQs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gdlds`
--

DROP TABLE IF EXISTS `gdlds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdlds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gdcid` int(11) NOT NULL DEFAULT 0,
  `title_e` varchar(255) NOT NULL DEFAULT '',
  `title_u` text DEFAULT NULL,
  `link` text NOT NULL,
  `fsize` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='General Downloads';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inq_area`
--

DROP TABLE IF EXISTS `inq_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inq_area` (
  `inqid` int(11) NOT NULL AUTO_INCREMENT,
  `viewable` char(3) DEFAULT 'Yes',
  `e` varchar(255) NOT NULL DEFAULT '',
  `u` text NOT NULL,
  PRIMARY KEY (`inqid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL DEFAULT 0,
  `txt_e` longtext DEFAULT NULL,
  `txt_u` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Jobs page - No inserts just update';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0,
  `sctnid` int(11) NOT NULL DEFAULT 0,
  `dt_time` datetime DEFAULT '0000-00-00 00:00:00',
  `action` varchar(20) NOT NULL DEFAULT '',
  `area` varchar(255) NOT NULL DEFAULT '',
  `desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM AUTO_INCREMENT=51376 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Logs user activites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loh`
--

DROP TABLE IF EXISTS `loh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `mid` int(11) NOT NULL DEFAULT 0,
  `stnid` int(11) NOT NULL DEFAULT 0,
  `in_place_mpa_id` int(11) DEFAULT 0,
  `dt_elected` date DEFAULT NULL,
  `dt_resigned` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Leader of the House';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loo`
--

DROP TABLE IF EXISTS `loo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `mid` int(11) NOT NULL DEFAULT 0,
  `nfid` int(11) NOT NULL DEFAULT 0,
  `in_place_mpa_id` int(11) DEFAULT 0,
  `dt_elected` date DEFAULT NULL,
  `dt_resigned` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Leader of the Opposition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_act_c`
--

DROP TABLE IF EXISTS `m_act_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_act_c` (
  `acid` int(11) NOT NULL AUTO_INCREMENT,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `title_e` varchar(255) NOT NULL DEFAULT '',
  `title_u` text DEFAULT NULL,
  PRIMARY KEY (`acid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Acts - Single Level Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_bl_mv_types`
--

DROP TABLE IF EXISTS `m_bl_mv_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_bl_mv_types` (
  `bmtid` int(11) NOT NULL AUTO_INCREMENT,
  `bmt_e` varchar(255) NOT NULL DEFAULT '',
  `bmt_u` text DEFAULT NULL,
  PRIMARY KEY (`bmtid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master Table Bill Mover Types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_bl_status`
--

DROP TABLE IF EXISTS `m_bl_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_bl_status` (
  `bstid` int(11) NOT NULL AUTO_INCREMENT,
  `bst_e` varchar(255) NOT NULL DEFAULT '',
  `bst_u` text DEFAULT NULL,
  PRIMARY KEY (`bstid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master Table Bill Status used in bill tracking';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_bl_types`
--

DROP TABLE IF EXISTS `m_bl_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_bl_types` (
  `btid` int(11) NOT NULL AUTO_INCREMENT,
  `bt_e` varchar(255) NOT NULL DEFAULT '',
  `bt_u` text DEFAULT NULL,
  PRIMARY KEY (`btid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Bill Types - Current Rejected Passed. Data cannot be changed';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_cbnt_roles`
--

DROP TABLE IF EXISTS `m_cbnt_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_cbnt_roles` (
  `cbnt_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `order` smallint(6) NOT NULL DEFAULT 1,
  `role_e` varchar(255) DEFAULT NULL,
  `role_u` text DEFAULT NULL,
  PRIMARY KEY (`cbnt_role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=0 COMMENT='Master table Cabinet Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_const`
--

DROP TABLE IF EXISTS `m_const`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_const` (
  `cnstid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `did` int(11) NOT NULL DEFAULT 0,
  `st_id` int(11) DEFAULT 0,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `const_e` varchar(255) NOT NULL DEFAULT '',
  `const_u` text DEFAULT NULL,
  PRIMARY KEY (`cnstid`)
) ENGINE=InnoDB AUTO_INCREMENT=1926 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_dgres`
--

DROP TABLE IF EXISTS `m_dgres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_dgres` (
  `deg_id` int(11) NOT NULL AUTO_INCREMENT,
  `order` smallint(6) NOT NULL DEFAULT 1,
  `deg_e` varchar(255) NOT NULL DEFAULT '',
  `deg_u` text NOT NULL,
  PRIMARY KEY (`deg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master Table Degrees';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_district_maps`
--

DROP TABLE IF EXISTS `m_district_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_district_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `map_file` varchar(255) DEFAULT NULL,
  `map_file_u` varchar(255) DEFAULT NULL,
  `map_code` text DEFAULT NULL,
  `map_code_u` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_districts`
--

DROP TABLE IF EXISTS `m_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_districts` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `dist_e` varchar(50) NOT NULL DEFAULT '',
  `dist_u` text NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_evnts`
--

DROP TABLE IF EXISTS `m_evnts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_evnts` (
  `evnt_id` int(11) NOT NULL AUTO_INCREMENT,
  `evnt_e` varchar(255) NOT NULL DEFAULT '',
  `evnt_u` text DEFAULT NULL,
  PRIMARY KEY (`evnt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master Table Events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_faq_c`
--

DROP TABLE IF EXISTS `m_faq_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_faq_c` (
  `fqcid` int(11) NOT NULL AUTO_INCREMENT,
  `title_e` varchar(255) NOT NULL DEFAULT '',
  `title_u` text DEFAULT NULL,
  PRIMARY KEY (`fqcid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Categories FAQ - Single level';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_gbodies`
--

DROP TABLE IF EXISTS `m_gbodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_gbodies` (
  `gbid` int(11) NOT NULL AUTO_INCREMENT,
  `gb_e` varchar(255) NOT NULL DEFAULT '',
  `gb_u` text NOT NULL,
  PRIMARY KEY (`gbid`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master table govt. bodies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_gdlds_c`
--

DROP TABLE IF EXISTS `m_gdlds_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_gdlds_c` (
  `gdcid` int(11) NOT NULL AUTO_INCREMENT,
  `title_e` varchar(255) NOT NULL DEFAULT '',
  `title_u` text DEFAULT NULL,
  PRIMARY KEY (`gdcid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Categories for general downloads';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_lg_langs`
--

DROP TABLE IF EXISTS `m_lg_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_lg_langs` (
  `lg_lng_id` int(11) NOT NULL AUTO_INCREMENT,
  `lng_code` char(2) NOT NULL DEFAULT '',
  `lg_lang` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`lg_lng_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Languages for Assembly Legislation - Data cannot be changed';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_marital_status`
--

DROP TABLE IF EXISTS `m_marital_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_marital_status` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `mstat_e` varchar(255) NOT NULL DEFAULT '',
  `mstat_u` text DEFAULT NULL,
  PRIMARY KEY (`ms_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master table Marital Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_mnstry`
--

DROP TABLE IF EXISTS `m_mnstry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_mnstry` (
  `min_id` int(11) NOT NULL AUTO_INCREMENT,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `min_e` varchar(255) NOT NULL DEFAULT '',
  `min_u` text NOT NULL,
  PRIMARY KEY (`min_id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master table ministry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_mpa_langs`
--

DROP TABLE IF EXISTS `m_mpa_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_mpa_langs` (
  `lang_id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_e` varchar(255) NOT NULL DEFAULT '',
  `lang_u` text NOT NULL,
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=0 COMMENT='Master Table Spoken Languages for members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_mpa_rlation`
--

DROP TABLE IF EXISTS `m_mpa_rlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_mpa_rlation` (
  `rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_e` varchar(255) NOT NULL DEFAULT '',
  `rel_u` text NOT NULL,
  PRIMARY KEY (`rel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master table Relations for members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_mpa_status`
--

DROP TABLE IF EXISTS `m_mpa_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_mpa_status` (
  `m_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `status_e` varchar(255) NOT NULL DEFAULT '',
  `status_u` text DEFAULT NULL,
  PRIMARY KEY (`m_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Member status in assembly sitting , passed away';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_nws_type`
--

DROP TABLE IF EXISTS `m_nws_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_nws_type` (
  `nwst_id` int(11) NOT NULL AUTO_INCREMENT,
  `nwst_e` varchar(255) NOT NULL DEFAULT '',
  `nwst_u` text DEFAULT NULL,
  PRIMARY KEY (`nwst_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='News Types or categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_parties`
--

DROP TABLE IF EXISTS `m_parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_parties` (
  `partyid` int(11) NOT NULL AUTO_INCREMENT,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `pabbr_e` varchar(255) DEFAULT NULL,
  `pabbr_u` varchar(255) DEFAULT NULL,
  `party_e` varchar(255) NOT NULL DEFAULT '',
  `party_u` text NOT NULL,
  `partylogo` text DEFAULT NULL,
  `partywebsite` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`partyid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=0 COMMENT='Master Political Parties with abbreviations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_party_grp_asmbly`
--

DROP TABLE IF EXISTS `m_party_grp_asmbly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_party_grp_asmbly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partyid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `pgid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Party in govt. or oppostion for an assembly tenure';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_party_grps`
--

DROP TABLE IF EXISTS `m_party_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_party_grps` (
  `pgid` int(11) NOT NULL AUTO_INCREMENT,
  `pg_e` varchar(255) NOT NULL DEFAULT '',
  `pg_u` text NOT NULL,
  PRIMARY KEY (`pgid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master Party Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_pbodies`
--

DROP TABLE IF EXISTS `m_pbodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_pbodies` (
  `pbid` int(11) NOT NULL AUTO_INCREMENT,
  `pb_e` varchar(255) NOT NULL DEFAULT '',
  `pb_u` text NOT NULL,
  PRIMARY KEY (`pbid`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Parliamentary Bodies for the relatives of the MPA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_prof`
--

DROP TABLE IF EXISTS `m_prof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_prof` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `prof_e` varchar(255) NOT NULL DEFAULT '',
  `prof_u` text NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master table professions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_religion`
--

DROP TABLE IF EXISTS `m_religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_religion` (
  `rlg_id` int(11) NOT NULL AUTO_INCREMENT,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `rlg_e` varchar(255) NOT NULL DEFAULT '',
  `rlg_u` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rlg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master table Religion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_seat_types`
--

DROP TABLE IF EXISTS `m_seat_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_seat_types` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `seat_e` varchar(255) NOT NULL DEFAULT '',
  `seat_u` text DEFAULT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master Table Seat Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_titles`
--

DROP TABLE IF EXISTS `m_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_titles` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `title_e` varchar(255) NOT NULL DEFAULT '',
  `title_u` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master table Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_tribes`
--

DROP TABLE IF EXISTS `m_tribes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_tribes` (
  `tribe_id` int(11) NOT NULL AUTO_INCREMENT,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `tribe_e` varchar(255) NOT NULL DEFAULT '',
  `tribe_u` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tribe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master Table Tribes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_u_sctn2cntrl`
--

DROP TABLE IF EXISTS `m_u_sctn2cntrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_u_sctn2cntrl` (
  `cntrlr_id` int(11) NOT NULL AUTO_INCREMENT,
  `sctnid` int(11) NOT NULL DEFAULT 0,
  `controller` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`cntrlr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Controllers wih in an access area - static - donot change';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_u_sctns`
--

DROP TABLE IF EXISTS `m_u_sctns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_u_sctns` (
  `sctnid` int(11) NOT NULL AUTO_INCREMENT,
  `sctn` varchar(255) NOT NULL DEFAULT '',
  `viewable` char(3) DEFAULT 'Yes',
  PRIMARY KEY (`sctnid`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master for CMS Sections - Static cant be changed';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_ut`
--

DROP TABLE IF EXISTS `m_ut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_ut` (
  `ut` char(3) NOT NULL DEFAULT '',
  `ut_desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ut`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Master Table User Types for Admin Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_cb_dept`
--

DROP TABLE IF EXISTS `mpa_cb_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_cb_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `mrid` int(11) NOT NULL DEFAULT 0,
  `min_id` int(11) NOT NULL DEFAULT 0,
  `othr_dsc_e` varchar(255) DEFAULT NULL,
  `othr_dsc_u` text DEFAULT NULL,
  `dt` date DEFAULT NULL,
  `url` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=969 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPAs cabinet role is for these departments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_cb_roles`
--

DROP TABLE IF EXISTS `mpa_cb_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_cb_roles` (
  `mrid` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `cbnt_role_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mrid`)
) ENGINE=InnoDB AUTO_INCREMENT=626 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPA has been assigned these cabinet roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_conf`
--

DROP TABLE IF EXISTS `mpa_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `evnt_id` int(11) NOT NULL DEFAULT 0,
  `cnt_id` int(11) NOT NULL DEFAULT 0,
  `as_e` varchar(255) DEFAULT NULL,
  `as_u` text DEFAULT NULL,
  `yr_e` varchar(255) DEFAULT NULL,
  `yr_u` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPA confrences attended';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_contacts`
--

DROP TABLE IF EXISTS `mpa_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_contacts` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_mpa_id` int(10) unsigned NOT NULL,
  `contact_type` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1 = Permanent, 2 = Present, 3 = Constituency ',
  `contact_official` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1 = official, 2= non-official',
  `contact_order` tinyint(3) unsigned NOT NULL,
  `contact_status` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `contact_modified` datetime DEFAULT NULL,
  `contact_created` datetime DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2468 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_contacts_bk`
--

DROP TABLE IF EXISTS `mpa_contacts_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_contacts_bk` (
  `mid` int(11) NOT NULL DEFAULT 0,
  `prm_e` text DEFAULT NULL,
  `prm_u` text DEFAULT NULL,
  `prm_official` char(3) DEFAULT NULL,
  `pr_e` text DEFAULT NULL,
  `pr_u` text DEFAULT NULL,
  `pr_official` char(3) DEFAULT NULL,
  `cnst_e` text DEFAULT NULL,
  `cnst_u` text DEFAULT NULL,
  `cnst_official` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPA contact details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_contacts_list`
--

DROP TABLE IF EXISTS `mpa_contacts_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_contacts_list` (
  `list_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_contact_id` int(10) unsigned NOT NULL,
  `list_phone_type` varchar(50) DEFAULT 'Phone',
  `list_phone` varchar(50) DEFAULT '',
  `list_address_e` text DEFAULT NULL,
  `list_address_u` text DEFAULT NULL,
  `list_primary_no` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6979 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_cv`
--

DROP TABLE IF EXISTS `mpa_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_cv` (
  `mid` int(11) NOT NULL DEFAULT 0,
  `p_profile_e` longtext DEFAULT NULL,
  `p_profile_u` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Personal Profile hobbies private civil career etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_duty_fun`
--

DROP TABLE IF EXISTS `mpa_duty_fun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_duty_fun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `detail_e` longtext DEFAULT NULL,
  `detail_u` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_edu`
--

DROP TABLE IF EXISTS `mpa_edu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_edu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `deg_id` int(11) NOT NULL DEFAULT 0,
  `yr_e` varchar(255) DEFAULT NULL,
  `yr_u` text DEFAULT NULL,
  `cmnts_e` varchar(255) DEFAULT NULL,
  `cmnts_u` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2027 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPA Education';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_langs`
--

DROP TABLE IF EXISTS `mpa_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_langs` (
  `mid` int(11) NOT NULL DEFAULT 0,
  `lang_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPA knows these languages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_off_pos`
--

DROP TABLE IF EXISTS `mpa_off_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_off_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `gbid` int(11) NOT NULL DEFAULT 0,
  `post_e` varchar(255) DEFAULT NULL,
  `post_u` text DEFAULT NULL,
  `tenure_e` varchar(255) DEFAULT NULL,
  `tenure_u` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1584 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPA official positions held';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_political_cr`
--

DROP TABLE IF EXISTS `mpa_political_cr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_political_cr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `partyid` int(11) NOT NULL DEFAULT 0,
  `post_e` varchar(255) DEFAULT NULL,
  `post_u` text DEFAULT NULL,
  `tenure_e` varchar(255) DEFAULT NULL,
  `tenure_u` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Political Career of an MPA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_prof`
--

DROP TABLE IF EXISTS `mpa_prof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_prof` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `detail_e` text DEFAULT NULL,
  `detail_u` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1251 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPA professions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_rltvs`
--

DROP TABLE IF EXISTS `mpa_rltvs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_rltvs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `rel_id` int(11) NOT NULL DEFAULT 0,
  `pbid` int(11) NOT NULL DEFAULT 0,
  `name_e` varchar(255) DEFAULT NULL,
  `name_u` text DEFAULT NULL,
  `period_e` varchar(255) DEFAULT NULL,
  `period_u` text DEFAULT NULL,
  `designation_e` varchar(255) DEFAULT NULL,
  `designation_u` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1655 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPAs relatives in past assemblies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_social_media`
--

DROP TABLE IF EXISTS `mpa_social_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_social_media` (
  `sm_id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `personal_web` varchar(255) DEFAULT NULL,
  `blog_link` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_visits`
--

DROP TABLE IF EXISTS `mpa_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `cnt_id` int(11) NOT NULL DEFAULT 0,
  `prps_e` varchar(255) DEFAULT NULL,
  `prps_u` text DEFAULT NULL,
  `tenure_e` varchar(255) DEFAULT NULL,
  `tenure_u` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1660 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPAs visit to other countries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpa_xbodies`
--

DROP TABLE IF EXISTS `mpa_xbodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpa_xbodies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `org_e` varchar(255) DEFAULT NULL,
  `org_u` text DEFAULT NULL,
  `desig_e` varchar(255) DEFAULT NULL,
  `desig_u` text DEFAULT NULL,
  `tenure_e` varchar(255) DEFAULT NULL,
  `tenure_u` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPA membership in external bodies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mpas`
--

DROP TABLE IF EXISTS `mpas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpas` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `cnstid` int(11) NOT NULL DEFAULT 0,
  `partyid` int(11) NOT NULL DEFAULT 0,
  `title_id` int(11) NOT NULL DEFAULT 0,
  `tribe_id` int(11) NOT NULL DEFAULT 1,
  `ms_id` int(11) NOT NULL DEFAULT 0,
  `rlg_id` int(11) NOT NULL DEFAULT 0,
  `st_id` int(11) NOT NULL DEFAULT 0,
  `m_status_id` int(11) NOT NULL DEFAULT 1,
  `in_place_mpa_id` int(11) DEFAULT 0,
  `dsp_full_profile` char(3) DEFAULT 'Yes',
  `dsp_photo` char(3) DEFAULT 'No',
  `gender` varchar(10) NOT NULL DEFAULT '',
  `name_e` varchar(255) NOT NULL DEFAULT '',
  `name_u` text NOT NULL,
  `lname_e` varchar(255) NOT NULL DEFAULT '',
  `lname_u` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pob_e` varchar(255) DEFAULT NULL,
  `pob_u` text DEFAULT NULL,
  `chld_e` varchar(50) DEFAULT NULL,
  `chld_u` text DEFAULT NULL,
  `dt_oath` date DEFAULT NULL,
  `dt_left` date DEFAULT NULL,
  `photofile` text DEFAULT NULL,
  `dob_ispublic` tinyint(1) NOT NULL DEFAULT 1,
  `ms_ispublic` tinyint(1) NOT NULL DEFAULT 1,
  `chld_e_ispublic` tinyint(1) NOT NULL DEFAULT 1,
  `chld_u_ispublic` tinyint(1) NOT NULL DEFAULT 1,
  `dt_oath_ispublic` tinyint(1) NOT NULL DEFAULT 1,
  `mpa_password` varchar(255) DEFAULT NULL,
  `verified_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `partyid` (`partyid`),
  KEY `cnstid` (`cnstid`),
  KEY `aid` (`aid`),
  KEY `partyid_2` (`partyid`),
  KEY `cnstid_2` (`cnstid`)
) ENGINE=InnoDB AUTO_INCREMENT=2051 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='MPA profile main';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_type` varchar(10) NOT NULL DEFAULT '',
  `caption` text NOT NULL,
  `details` text DEFAULT NULL,
  `fpath` text NOT NULL,
  `thumbpath` text DEFAULT NULL,
  `fsize` int(11) NOT NULL DEFAULT 0,
  `featured_video` tinyint(1) DEFAULT 0,
  `media_for` tinyint(1) DEFAULT 1 COMMENT '1 = gallery, 2= speaker, 3= dspeaker, 4=CPA',
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1170 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Multimedia downloads for assembly - audio video picture gall';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mystn_files`
--

DROP TABLE IF EXISTS `mystn_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mystn_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stnid` int(11) NOT NULL DEFAULT 0,
  `media_type` varchar(10) NOT NULL DEFAULT 'Audio',
  `link` text DEFAULT NULL,
  `fsize` int(11) NOT NULL DEFAULT 0,
  `ftitle_e` varchar(255) DEFAULT NULL,
  `ftitle_u` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `stnid` (`stnid`),
  KEY `media_type` (`media_type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Sitting Verbatim file upload';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nav`
--

DROP TABLE IF EXISTS `nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ntid` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `changeable` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'No',
  `expandable` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'No',
  `viewable` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Yes',
  `title_e` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `title_u` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `url_e` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `url_u` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`,`title_e`),
  KEY `ntid` (`ntid`)
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Site Navigation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nav_absolute_url`
--

DROP TABLE IF EXISTS `nav_absolute_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nav_absolute_url` (
  `url_id` int(11) NOT NULL AUTO_INCREMENT,
  `url_title` varchar(50) NOT NULL,
  `url_name` varchar(50) NOT NULL,
  `url_name_u` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url_title_u` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nav_content`
--

DROP TABLE IF EXISTS `nav_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nav_content` (
  `navid` int(11) NOT NULL DEFAULT 0,
  `e` longtext DEFAULT NULL,
  `u` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nav_types`
--

DROP TABLE IF EXISTS `nav_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nav_types` (
  `ntid` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ntid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Navigation Types - Master Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `newsid` int(11) NOT NULL AUTO_INCREMENT,
  `nwst_id` int(11) NOT NULL DEFAULT 0,
  `title_e` varchar(255) NOT NULL DEFAULT '',
  `title_u` text DEFAULT NULL,
  `dt` date NOT NULL DEFAULT '0000-00-00',
  `details_e` mediumtext DEFAULT NULL,
  `details_u` longtext DEFAULT NULL,
  PRIMARY KEY (`newsid`)
) ENGINE=MyISAM AUTO_INCREMENT=634 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='News';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nfs`
--

DROP TABLE IF EXISTS `nfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfs` (
  `nfid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `pyid` int(11) NOT NULL DEFAULT 0,
  `nfno` text NOT NULL,
  `sbj` text DEFAULT NULL,
  `dt` date DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `sbj_u` varchar(255) DEFAULT NULL,
  `details_u` longtext DEFAULT NULL,
  `link_type` tinyint(1) DEFAULT 1 COMMENT '1 = other, 2= members, 3= secretariat, 4 = committees, 5 = sessions',
  `link_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nfid`)
) ENGINE=MyISAM AUTO_INCREMENT=1494 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nfs_cmt`
--

DROP TABLE IF EXISTS `nfs_cmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfs_cmt` (
  `nfid` int(11) NOT NULL DEFAULT 0,
  `cmtid` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Notifications - Committees';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nfs_link`
--

DROP TABLE IF EXISTS `nfs_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfs_link` (
  `nfid` int(11) NOT NULL DEFAULT 0,
  `link_id` int(11) DEFAULT 0,
  `link_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = other, 2 = member, 3 secretariat'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Notifications - Members, secretariat and other';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nfs_ssn`
--

DROP TABLE IF EXISTS `nfs_ssn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfs_ssn` (
  `nfid` int(11) NOT NULL DEFAULT 0,
  `ssnid` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=0 COMMENT='Notifications - sessions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `officers`
--

DROP TABLE IF EXISTS `officers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `officers` (
  `officer_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation_id` int(11) NOT NULL,
  `officer_name` varchar(100) NOT NULL,
  `officer_bps` varchar(20) NOT NULL,
  `officer_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_datetime` datetime NOT NULL,
  `updated_datetime` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`officer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `old_m_const`
--

DROP TABLE IF EXISTS `old_m_const`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_m_const` (
  `cnstid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `did` int(11) NOT NULL DEFAULT 0,
  `st_id` int(11) DEFAULT 0,
  `editable` char(3) NOT NULL DEFAULT 'Yes',
  `const_e` varchar(255) NOT NULL DEFAULT '',
  `const_u` text DEFAULT NULL,
  PRIMARY KEY (`cnstid`)
) ENGINE=InnoDB AUTO_INCREMENT=1548 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_yrs`
--

DROP TABLE IF EXISTS `p_yrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_yrs` (
  `pyid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `title_e` varchar(255) NOT NULL DEFAULT '',
  `title_u` text NOT NULL,
  `dt_strt` date NOT NULL DEFAULT '0000-00-00',
  `dt_end` date DEFAULT NULL,
  PRIMARY KEY (`pyid`),
  KEY `pyid` (`pyid`),
  KEY `aid` (`aid`),
  KEY `pyid_2` (`pyid`),
  KEY `title_e` (`title_e`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=0 COMMENT='Parliamentary Years';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_site_nav_id` int(11) NOT NULL,
  `page_title_e` varchar(255) NOT NULL,
  `page_title_u` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `page_detail_e` longtext NOT NULL,
  `page_detail_u` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `page_image` varchar(255) NOT NULL,
  `page_file` varchar(255) NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `papjobs`
--

DROP TABLE IF EXISTS `papjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `papjobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_ref_no` varchar(100) NOT NULL,
  `job_heading` varchar(255) NOT NULL,
  `job_desceription` text DEFAULT NULL,
  `job_start_date` date DEFAULT NULL,
  `job_end_date` date DEFAULT NULL,
  `job_pdf_file` varchar(200) DEFAULT NULL,
  `job_external_link` varchar(500) DEFAULT NULL,
  `job_created_by` varchar(300) DEFAULT NULL,
  `job_creation_date` date DEFAULT NULL,
  `job_is_deleted` int(11) DEFAULT 0,
  `job_deleted_by` varchar(300) DEFAULT NULL,
  `job_heading_u` varchar(255) DEFAULT NULL,
  `job_desceription_u` longtext DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perf_asmbly_legislations`
--

DROP TABLE IF EXISTS `perf_asmbly_legislations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perf_asmbly_legislations` (
  `pal_id` int(11) NOT NULL AUTO_INCREMENT,
  `notices` int(11) DEFAULT 0,
  `admitted` int(11) DEFAULT 0,
  `introduced` int(11) DEFAULT 0,
  `passed` int(11) DEFAULT 0,
  `bill_type` tinyint(1) DEFAULT 1 COMMENT '1 = Government Bills, 2 = Private Bills',
  `aid` int(11) NOT NULL DEFAULT 0,
  `pyid` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`pal_id`),
  UNIQUE KEY `aid` (`aid`,`pyid`,`bill_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perf_asmbly_motions`
--

DROP TABLE IF EXISTS `perf_asmbly_motions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perf_asmbly_motions` (
  `pam_id` int(11) NOT NULL AUTO_INCREMENT,
  `notices` int(11) DEFAULT 0,
  `admitted` int(11) DEFAULT 0,
  `committee_or_disposed` int(11) DEFAULT 0,
  `motion_type` tinyint(1) DEFAULT 1 COMMENT '1 = Privilege Motions, 2 = Adjournment Motions',
  `aid` int(11) NOT NULL DEFAULT 0,
  `pyid` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`pam_id`),
  UNIQUE KEY `aid` (`aid`,`pyid`,`motion_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perf_asmbly_questions`
--

DROP TABLE IF EXISTS `perf_asmbly_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perf_asmbly_questions` (
  `paq_id` int(11) NOT NULL AUTO_INCREMENT,
  `notices` int(11) DEFAULT 0,
  `admitted` int(11) DEFAULT 0,
  `disallowed` int(11) DEFAULT 0,
  `answered` int(11) DEFAULT 0,
  `question_type` tinyint(1) DEFAULT 1 COMMENT '1 = Starred Questions, 2 = Unstarred Questions, 3 = Short Notice Questions, 4 = Calling Attention Notices, 5 = Zero Hour Notices',
  `aid` int(11) NOT NULL DEFAULT 0,
  `pyid` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`paq_id`),
  UNIQUE KEY `aid` (`aid`,`pyid`,`question_type`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perf_asmbly_resolutions`
--

DROP TABLE IF EXISTS `perf_asmbly_resolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perf_asmbly_resolutions` (
  `par_id` int(11) NOT NULL AUTO_INCREMENT,
  `notices` int(11) DEFAULT 0,
  `admitted` int(11) DEFAULT 0,
  `passed` int(11) DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `pyid` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`par_id`),
  UNIQUE KEY `aid` (`aid`,`pyid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perf_asmbly_sessions`
--

DROP TABLE IF EXISTS `perf_asmbly_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perf_asmbly_sessions` (
  `pas_id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sessions` int(11) DEFAULT 0,
  `total_days` int(11) DEFAULT 0,
  `actual_sittings` int(11) DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `pyid` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`pas_id`),
  UNIQUE KEY `aid` (`aid`,`pyid`),
  UNIQUE KEY `aid_2` (`aid`,`pyid`),
  UNIQUE KEY `aid_3` (`aid`,`pyid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poll_options`
--

DROP TABLE IF EXISTS `poll_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_id`),
  KEY `option_poll_id` (`poll_id`),
  CONSTRAINT `poll_options_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poll_votes`
--

DROP TABLE IF EXISTS `poll_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_votes` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '' COMMENT 'max ipv6',
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`vote_id`),
  KEY `vote_option_id` (`option_id`),
  CONSTRAINT `poll_votes_ibfk_1` FOREIGN KEY (`option_id`) REFERENCES `poll_options` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls` (
  `poll_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closed` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'if the poll is closed or not',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`poll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `powers_functions`
--

DROP TABLE IF EXISTS `powers_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `powers_functions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_e` varchar(255) NOT NULL,
  `title_u` varchar(255) NOT NULL,
  `desc_e` text DEFAULT NULL,
  `desc_u` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '1 = active, 0= deactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `proceed`
--

DROP TABLE IF EXISTS `proceed`;
/*!50001 DROP VIEW IF EXISTS `proceed`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `proceed` AS SELECT
 1 AS `aid`,
  1 AS `title_e`,
  1 AS `ssnid`,
  1 AS `no_e`,
  1 AS `stnid`,
  1 AS `dt`,
  1 AS `id`,
  1 AS `media_type`,
  1 AS `ftitle_e`,
  1 AS `link`,
  1 AS `dtls_e` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pubs`
--

DROP TABLE IF EXISTS `pubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `dt` date NOT NULL DEFAULT '0000-00-00',
  `link` text DEFAULT NULL,
  `fsize` varchar(11) DEFAULT NULL,
  `in_prnt` char(3) DEFAULT 'Yes',
  `title_u` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Assembly Publications';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `py_smry`
--

DROP TABLE IF EXISTS `py_smry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `py_smry` (
  `pyid` int(11) NOT NULL DEFAULT 0,
  `dtls_e` mediumtext DEFAULT NULL,
  `dtls_u` longtext DEFAULT NULL,
  `pc_e` mediumtext DEFAULT NULL,
  `pc_u` longtext DEFAULT NULL,
  PRIMARY KEY (`pyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Session Summary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rop`
--

DROP TABLE IF EXISTS `rop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rop` (
  `ropid` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL DEFAULT 1,
  `e` text NOT NULL,
  `u` text NOT NULL,
  PRIMARY KEY (`ropid`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=0 COMMENT='Rules of Procedure -  Chapter Titles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rop_dtls`
--

DROP TABLE IF EXISTS `rop_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rop_dtls` (
  `ropid` int(11) NOT NULL DEFAULT 0,
  `e` longtext DEFAULT NULL,
  `u` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Rule of Procedure Details for each chapter';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sb_cmt_mbrs`
--

DROP TABLE IF EXISTS `sb_cmt_mbrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sb_cmt_mbrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sbcmtid` int(11) NOT NULL DEFAULT 0,
  `mid` int(11) NOT NULL DEFAULT 0,
  `in_place_mpa_id` int(11) DEFAULT NULL,
  `dt_elect` date NOT NULL DEFAULT '0000-00-00',
  `dt_rmvd` date DEFAULT NULL,
  `y_rplc_e` text DEFAULT NULL,
  `y_rplc_u` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=1 COMMENT='Sub Committee Members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sb_cmts`
--

DROP TABLE IF EXISTS `sb_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sb_cmts` (
  `sbcmtid` int(11) NOT NULL AUTO_INCREMENT,
  `cmtid` int(11) NOT NULL DEFAULT 0,
  `title_e` text NOT NULL,
  `title_u` text NOT NULL,
  `dt_frmd` date NOT NULL DEFAULT '0000-00-00',
  `dt_dslvd` date DEFAULT NULL,
  PRIMARY KEY (`sbcmtid`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Sub Committees';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_title` varchar(255) NOT NULL,
  `section_content_e` mediumtext DEFAULT NULL,
  `section_content_u` mediumtext DEFAULT NULL,
  `section_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_slider_time` int(11) DEFAULT 0,
  `setting_page_margin` int(11) DEFAULT NULL,
  `setting_margin_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site_navs`
--

DROP TABLE IF EXISTS `site_navs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_navs` (
  `nav_id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(255) NOT NULL,
  `nav_parent_id` int(11) NOT NULL,
  `nav_url_type` enum('Absolute','Relative') NOT NULL DEFAULT 'Relative',
  `nav_url` varchar(255) NOT NULL,
  `nav_absolute_id` int(11) NOT NULL,
  `nav_order` int(11) NOT NULL,
  `nav_desc_e` text NOT NULL,
  `nav_enabled` enum('Active','Inactive') NOT NULL,
  `nav_menu_check` tinyint(1) DEFAULT 1,
  `nav_name_u` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nav_url_u` varchar(255) DEFAULT NULL,
  `nav_desc_u` text DEFAULT NULL,
  `nav_is_external` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slider` (
  `slider_id` int(11) NOT NULL AUTO_INCREMENT,
  `slider_image` varchar(255) NOT NULL,
  `slider_image_thumb` varchar(255) NOT NULL,
  `slider_status` tinyint(1) NOT NULL DEFAULT 1,
  `slider_order` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `slider_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`slider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slider2`
--

DROP TABLE IF EXISTS `slider2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slider2` (
  `slider_id` int(11) NOT NULL DEFAULT 0,
  `slider_image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `slider_image_thumb` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `slider_status` tinyint(1) NOT NULL DEFAULT 1,
  `slider_order` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spk_dspk_news`
--

DROP TABLE IF EXISTS `spk_dspk_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spk_dspk_news` (
  `mid` int(11) NOT NULL DEFAULT 0,
  `newsid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Media related to Speaker and Deputy Speaker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spkr_news`
--

DROP TABLE IF EXISTS `spkr_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spkr_news` (
  `spkid` int(11) NOT NULL DEFAULT 0,
  `newsid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Media related to speaker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spkrs`
--

DROP TABLE IF EXISTS `spkrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spkrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `stnid` int(11) NOT NULL DEFAULT 0,
  `dt_elected` date DEFAULT NULL,
  `in_place_mpa_id` int(11) DEFAULT 0,
  `dt_resigned` date DEFAULT NULL,
  `photofile` text DEFAULT NULL,
  `msg_e` mediumtext DEFAULT NULL,
  `msg_u` longtext DEFAULT NULL,
  `role_e` mediumtext DEFAULT NULL,
  `role_u` longtext DEFAULT NULL,
  `staff_e` mediumtext DEFAULT NULL,
  `staff_u` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Speakers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ssn`
--

DROP TABLE IF EXISTS `ssn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ssn` (
  `ssnid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT 0,
  `pyid` int(11) NOT NULL DEFAULT 0,
  `no_e` varchar(255) DEFAULT NULL,
  `no_u` text DEFAULT NULL,
  `smndby_e` varchar(255) DEFAULT NULL,
  `smndby_u` text DEFAULT NULL,
  `dt` date DEFAULT NULL,
  `dt_end` date DEFAULT NULL,
  PRIMARY KEY (`ssnid`),
  KEY `ssnid` (`ssnid`),
  KEY `aid` (`aid`),
  KEY `pyid` (`pyid`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Assembly Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ssn_poc`
--

DROP TABLE IF EXISTS `ssn_poc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ssn_poc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssnid` int(11) NOT NULL DEFAULT 0,
  `mid` int(11) NOT NULL DEFAULT 0,
  `order` mediumint(9) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Panel of chairman for a session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ssn_sch`
--

DROP TABLE IF EXISTS `ssn_sch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ssn_sch` (
  `ssnid` int(11) NOT NULL DEFAULT 0,
  `dtls_e` mediumtext DEFAULT NULL,
  `dtls_u` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Session Schedule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ssn_smry`
--

DROP TABLE IF EXISTS `ssn_smry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ssn_smry` (
  `ssnid` int(11) NOT NULL DEFAULT 0,
  `dtls_e` mediumtext DEFAULT NULL,
  `dtls_u` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Session Summary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stn`
--

DROP TABLE IF EXISTS `stn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stn` (
  `stnid` int(11) NOT NULL AUTO_INCREMENT,
  `ssnid` int(11) NOT NULL DEFAULT 0,
  `dt` date DEFAULT NULL,
  PRIMARY KEY (`stnid`),
  KEY `stnid` (`stnid`),
  KEY `ssnid` (`ssnid`)
) ENGINE=MyISAM AUTO_INCREMENT=1352 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Sitting in a Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stn_agnda`
--

DROP TABLE IF EXISTS `stn_agnda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stn_agnda` (
  `stnid` int(11) NOT NULL DEFAULT 0,
  `dtls_e` mediumtext DEFAULT NULL,
  `dtls_u` longtext DEFAULT NULL,
  KEY `stnid` (`stnid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Sitting Agenda';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stn_av`
--

DROP TABLE IF EXISTS `stn_av`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stn_av` (
  `stnid` int(11) NOT NULL DEFAULT 0,
  `media_type` varchar(10) NOT NULL DEFAULT 'Audio',
  `link` varchar(255) DEFAULT NULL,
  `title_e` text DEFAULT NULL,
  `title_u` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Sitting Verbatim Audios and Videos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stn_files`
--

DROP TABLE IF EXISTS `stn_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stn_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stnid` int(11) NOT NULL DEFAULT 0,
  `media_type` varchar(10) NOT NULL DEFAULT 'Audio',
  `link` text DEFAULT NULL,
  `fsize` int(11) NOT NULL DEFAULT 0,
  `ftitle_e` varchar(255) DEFAULT NULL,
  `ftitle_u` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `stnid` (`stnid`),
  KEY `media_type` (`media_type`)
) ENGINE=MyISAM AUTO_INCREMENT=6411 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Sitting Verbatim file upload';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stn_prcdngs`
--

DROP TABLE IF EXISTS `stn_prcdngs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stn_prcdngs` (
  `stnid` int(11) NOT NULL DEFAULT 0,
  `dtls_e` longtext DEFAULT NULL,
  `dtls_u` longtext DEFAULT NULL,
  KEY `stnid` (`stnid`),
  KEY `stnid_2` (`stnid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Summary of proceedings for a sitting';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stn_questions`
--

DROP TABLE IF EXISTS `stn_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stn_questions` (
  `stnid` int(11) NOT NULL DEFAULT 0,
  `dtls_e` longtext DEFAULT NULL,
  `dtls_u` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Questions for a sitting';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stn_resolutions`
--

DROP TABLE IF EXISTS `stn_resolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stn_resolutions` (
  `stnid` int(11) NOT NULL DEFAULT 0,
  `dtls_e` mediumtext DEFAULT NULL,
  `dtls_u` longtext DEFAULT NULL,
  KEY `stnid` (`stnid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Sitting Agenda';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tndrs`
--

DROP TABLE IF EXISTS `tndrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tndrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tno_e` varchar(255) NOT NULL DEFAULT '',
  `tno_u` text NOT NULL,
  `title_e` varchar(255) DEFAULT NULL,
  `title_u` text DEFAULT NULL,
  `dt_ad` date DEFAULT NULL,
  `dt_bdopn` date DEFAULT NULL,
  `dt_bdcls` date DEFAULT NULL,
  `tm_bdopn` varchar(255) DEFAULT NULL,
  `tm_bdcls` varchar(255) DEFAULT NULL,
  `details_e` longtext DEFAULT NULL,
  `details_u` longtext DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `fsize` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=483 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci PACK_KEYS=0 COMMENT='Tenders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `today_in_assembly`
--

DROP TABLE IF EXISTS `today_in_assembly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `today_in_assembly` (
  `today_id` int(11) NOT NULL AUTO_INCREMENT,
  `today_date` date NOT NULL,
  `today_time` varchar(25) NOT NULL DEFAULT '',
  `today_title_e` varchar(255) NOT NULL,
  `today_content_e` mediumtext NOT NULL,
  `today_title_u` varchar(255) NOT NULL,
  `today_content_u` mediumtext NOT NULL,
  `today_status` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`today_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u2sctn`
--

DROP TABLE IF EXISTS `u2sctn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u2sctn` (
  `uid` char(3) NOT NULL DEFAULT '',
  `sctnid` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Admin User is assigned these Sections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usrs`
--

DROP TABLE IF EXISTS `usrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ut` varchar(10) NOT NULL DEFAULT '',
  `un` varchar(20) NOT NULL DEFAULT '',
  `pw` varchar(32) NOT NULL DEFAULT '',
  `actv` char(3) NOT NULL DEFAULT 'Yes',
  `fn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Admin Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `virtual_tours`
--

DROP TABLE IF EXISTS `virtual_tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_tours` (
  `vt_id` int(11) NOT NULL AUTO_INCREMENT,
  `vt_title_e` varchar(255) NOT NULL,
  `vt_title_u` varchar(255) NOT NULL,
  `vt_image` varchar(255) NOT NULL,
  `vt_status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`vt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `proceed`
--

/*!50001 DROP VIEW IF EXISTS `proceed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`us_pap`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proceed` AS select 1 AS `aid`,1 AS `title_e`,1 AS `ssnid`,1 AS `no_e`,1 AS `stnid`,1 AS `dt`,1 AS `id`,1 AS `media_type`,1 AS `ftitle_e`,1 AS `link`,1 AS `dtls_e` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-02 10:19:42
