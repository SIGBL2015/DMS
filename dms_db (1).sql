-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2024 at 01:02 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` bigint(20) NOT NULL,
  `area_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `area_name`, `status`) VALUES
(2, 'DHA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'admin'),
(3, 'Manager'),
(1, 'Super Admin');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56),
(57, 1, 57),
(58, 1, 58),
(59, 1, 59),
(60, 1, 60),
(61, 1, 61),
(62, 1, 62),
(63, 1, 63),
(64, 1, 64),
(65, 1, 65),
(66, 1, 66),
(67, 1, 67),
(68, 1, 68),
(69, 1, 69),
(70, 1, 70),
(71, 1, 71),
(72, 1, 72),
(73, 1, 73),
(74, 1, 74),
(75, 1, 75),
(76, 1, 76),
(77, 1, 77),
(78, 1, 78),
(79, 1, 79),
(80, 1, 80),
(81, 1, 81),
(82, 1, 82),
(83, 1, 83),
(84, 1, 84),
(85, 1, 85),
(86, 1, 86),
(87, 1, 87),
(88, 1, 88),
(89, 1, 89),
(90, 1, 90),
(91, 1, 91),
(92, 1, 92),
(118, 1, 101),
(119, 1, 102),
(120, 1, 103),
(117, 1, 104),
(102, 2, 37),
(103, 2, 38),
(104, 2, 39),
(101, 2, 40),
(106, 3, 46),
(107, 3, 47),
(108, 3, 48),
(109, 3, 81),
(110, 3, 82),
(111, 3, 83),
(112, 3, 84),
(113, 3, 85),
(114, 3, 86),
(115, 3, 87),
(116, 3, 88);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add company', 7, 'add_company'),
(26, 'Can change company', 7, 'change_company'),
(27, 'Can delete company', 7, 'delete_company'),
(28, 'Can view company', 7, 'view_company'),
(29, 'Can add company_module', 8, 'add_company_module'),
(30, 'Can change company_module', 8, 'change_company_module'),
(31, 'Can delete company_module', 8, 'delete_company_module'),
(32, 'Can view company_module', 8, 'view_company_module'),
(33, 'Can add c v_template', 9, 'add_cv_template'),
(34, 'Can change c v_template', 9, 'change_cv_template'),
(35, 'Can delete c v_template', 9, 'delete_cv_template'),
(36, 'Can view c v_template', 9, 'view_cv_template'),
(37, 'Can add department', 10, 'add_department'),
(38, 'Can change department', 10, 'change_department'),
(39, 'Can delete department', 10, 'delete_department'),
(40, 'Can view department', 10, 'view_department'),
(41, 'Can add designation', 11, 'add_designation'),
(42, 'Can change designation', 11, 'change_designation'),
(43, 'Can delete designation', 11, 'delete_designation'),
(44, 'Can view designation', 11, 'view_designation'),
(45, 'Can add employee', 12, 'add_employee'),
(46, 'Can change employee', 12, 'change_employee'),
(47, 'Can delete employee', 12, 'delete_employee'),
(48, 'Can view employee', 12, 'view_employee'),
(49, 'Can add mainmenu', 13, 'add_mainmenu'),
(50, 'Can change mainmenu', 13, 'change_mainmenu'),
(51, 'Can delete mainmenu', 13, 'delete_mainmenu'),
(52, 'Can view mainmenu', 13, 'view_mainmenu'),
(53, 'Can add module', 14, 'add_module'),
(54, 'Can change module', 14, 'change_module'),
(55, 'Can delete module', 14, 'delete_module'),
(56, 'Can view module', 14, 'view_module'),
(57, 'Can add region', 15, 'add_region'),
(58, 'Can change region', 15, 'change_region'),
(59, 'Can delete region', 15, 'delete_region'),
(60, 'Can view region', 15, 'view_region'),
(61, 'Can add role', 16, 'add_role'),
(62, 'Can change role', 16, 'change_role'),
(63, 'Can delete role', 16, 'delete_role'),
(64, 'Can view role', 16, 'view_role'),
(65, 'Can add role_permission', 17, 'add_role_permission'),
(66, 'Can change role_permission', 17, 'change_role_permission'),
(67, 'Can delete role_permission', 17, 'delete_role_permission'),
(68, 'Can view role_permission', 17, 'view_role_permission'),
(69, 'Can add submenu', 18, 'add_submenu'),
(70, 'Can change submenu', 18, 'change_submenu'),
(71, 'Can delete submenu', 18, 'delete_submenu'),
(72, 'Can view submenu', 18, 'view_submenu'),
(73, 'Can add template_column', 19, 'add_template_column'),
(74, 'Can change template_column', 19, 'change_template_column'),
(75, 'Can delete template_column', 19, 'delete_template_column'),
(76, 'Can view template_column', 19, 'view_template_column'),
(77, 'Can add skills', 20, 'add_skills'),
(78, 'Can change skills', 20, 'change_skills'),
(79, 'Can delete skills', 20, 'delete_skills'),
(80, 'Can view skills', 20, 'view_skills'),
(81, 'Can add employement_ record', 21, 'add_employement_record'),
(82, 'Can change employement_ record', 21, 'change_employement_record'),
(83, 'Can delete employement_ record', 21, 'delete_employement_record'),
(84, 'Can view employement_ record', 21, 'view_employement_record'),
(85, 'Can add education', 22, 'add_education'),
(86, 'Can change education', 22, 'change_education'),
(87, 'Can delete education', 22, 'delete_education'),
(88, 'Can view education', 22, 'view_education'),
(89, 'Can add certifications', 23, 'add_certifications'),
(90, 'Can change certifications', 23, 'change_certifications'),
(91, 'Can delete certifications', 23, 'delete_certifications'),
(92, 'Can view certifications', 23, 'view_certifications'),
(93, 'Can add employement_ record', 24, 'add_employement_record'),
(94, 'Can change employement_ record', 24, 'change_employement_record'),
(95, 'Can delete employement_ record', 24, 'delete_employement_record'),
(96, 'Can view employement_ record', 24, 'view_employement_record'),
(97, 'Can add bank_guaranty', 25, 'add_bank_guaranty'),
(98, 'Can change bank_guaranty', 25, 'change_bank_guaranty'),
(99, 'Can delete bank_guaranty', 25, 'delete_bank_guaranty'),
(100, 'Can view bank_guaranty', 25, 'view_bank_guaranty'),
(101, 'Can add bank', 26, 'add_bank'),
(102, 'Can change bank', 26, 'change_bank'),
(103, 'Can delete bank', 26, 'delete_bank'),
(104, 'Can view bank', 26, 'view_bank'),
(105, 'Can add project', 27, 'add_project'),
(106, 'Can change project', 27, 'change_project'),
(107, 'Can delete project', 27, 'delete_project'),
(108, 'Can view project', 27, 'view_project'),
(109, 'Can add insurance_type', 28, 'add_insurance_type'),
(110, 'Can change insurance_type', 28, 'change_insurance_type'),
(111, 'Can delete insurance_type', 28, 'delete_insurance_type'),
(112, 'Can view insurance_type', 28, 'view_insurance_type'),
(113, 'Can add insurance_detail', 29, 'add_insurance_detail'),
(114, 'Can change insurance_detail', 29, 'change_insurance_detail'),
(115, 'Can delete insurance_detail', 29, 'delete_insurance_detail'),
(116, 'Can view insurance_detail', 29, 'view_insurance_detail'),
(117, 'Can add liquidity_damages', 30, 'add_liquidity_damages'),
(118, 'Can change liquidity_damages', 30, 'change_liquidity_damages'),
(119, 'Can delete liquidity_damages', 30, 'delete_liquidity_damages'),
(120, 'Can view liquidity_damages', 30, 'view_liquidity_damages'),
(121, 'Can add project_type', 31, 'add_project_type'),
(122, 'Can change project_type', 31, 'change_project_type'),
(123, 'Can delete project_type', 31, 'delete_project_type'),
(124, 'Can view project_type', 31, 'view_project_type'),
(125, 'Can add branch', 32, 'add_branch'),
(126, 'Can change branch', 32, 'change_branch'),
(127, 'Can delete branch', 32, 'delete_branch'),
(128, 'Can view branch', 32, 'view_branch'),
(129, 'Can add employment_ record', 21, 'add_employment_record'),
(130, 'Can change employment_ record', 21, 'change_employment_record'),
(131, 'Can delete employment_ record', 21, 'delete_employment_record'),
(132, 'Can view employment_ record', 21, 'view_employment_record'),
(133, 'Can add area', 33, 'add_area'),
(134, 'Can change area', 33, 'change_area'),
(135, 'Can delete area', 33, 'delete_area'),
(136, 'Can view area', 33, 'view_area'),
(137, 'Can add country', 34, 'add_country'),
(138, 'Can change country', 34, 'change_country'),
(139, 'Can delete country', 34, 'delete_country'),
(140, 'Can view country', 34, 'view_country'),
(141, 'Can add zone', 35, 'add_zone'),
(142, 'Can change zone', 35, 'change_zone'),
(143, 'Can delete zone', 35, 'delete_zone'),
(144, 'Can view zone', 35, 'view_zone');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$wIduK5Jfq16OLdS3US7z5Q$9Ig2vHd8oJwrvYXAjfnwIwkgm2f6+6Ctbos2rjD+vNg=', '2024-05-27 06:08:45.561663', 1, 'turab', '', '', '', 1, 1, '2024-02-19 10:18:22.000000'),
(2, 'pbkdf2_sha256$390000$wIduK5Jfq16OLdS3US7z5Q$9Ig2vHd8oJwrvYXAjfnwIwkgm2f6+6Ctbos2rjD+vNg=', '2024-05-23 07:20:32.822218', 0, 'danish', 'Danish', 'khan', 'danish@gmail.com', 1, 1, '2024-02-19 10:23:50.000000'),
(3, 'pbkdf2_sha256$390000$nHN3QkKDcnhijyLrOoNcE0$4CRmR83Xko/BUdnpzI2nlF2tPPkNCgsVKUzRqVSET4s=', '2024-02-20 05:59:03.000000', 0, 'rauf001', '', '', '', 1, 1, '2024-02-20 05:58:11.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 2),
(5, 2, 3),
(6, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` bigint(20) NOT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `branch_code` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `bank_name`, `branch_code`, `city`, `address`, `status`) VALUES
(2, 'HBL', 'HB00005', 'Karachi', 'Zamama branch', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bank_guaranty`
--

CREATE TABLE `bank_guaranty` (
  `id` bigint(20) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `instrument_no` varchar(100) DEFAULT NULL,
  `bg_start_date` date DEFAULT NULL,
  `bg_end_date` date DEFAULT NULL,
  `bg_validity` date DEFAULT NULL,
  `bg_percentage` int(11) DEFAULT NULL,
  `bg_amount` int(11) DEFAULT NULL,
  `bg_doc` varchar(255) DEFAULT NULL,
  `addendum` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank_guaranty`
--

INSERT INTO `bank_guaranty` (`id`, `duration`, `instrument_no`, `bg_start_date`, `bg_end_date`, `bg_validity`, `bg_percentage`, `bg_amount`, `bg_doc`, `addendum`, `status`, `bank_id`, `project_id`) VALUES
(2, 1, 'vbcf4545', '2024-05-01', '2024-05-31', '2024-05-31', 5, 34555, 'project\\KMC\\bank_guarantee\\download3.png', NULL, 1, 2, 14),
(3, 1, 'vbcf4545', '2024-05-01', '2024-05-31', '2024-05-30', 5, 2500, 'project\\23\\bank_guarantee\\signature.png', NULL, 1, 2, 23);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` bigint(20) NOT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `branch_code` varchar(100) DEFAULT NULL,
  `branch_address` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `branch_name`, `branch_code`, `branch_address`, `status`, `area_id`, `company_id`, `country_id`, `region_id`, `zone_id`) VALUES
(2, 'Clifton Branch', 'HB00005', 'Doctor Plaza', 1, 2, 1, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `certifications`
--

CREATE TABLE `certifications` (
  `id` bigint(20) NOT NULL,
  `certification_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `certifications`
--

INSERT INTO `certifications` (`id`, `certification_name`, `status`, `employee_id`) VALUES
(1, 'Web Development', 1, 1),
(2, 'Project Management', 1, 1),
(3, 'Mob App Development', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` bigint(20) NOT NULL,
  `comp_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `comp_name`, `status`) VALUES
(1, 'SI Global Solution', 1);

-- --------------------------------------------------------

--
-- Table structure for table `company_module`
--

CREATE TABLE `company_module` (
  `id` bigint(20) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` bigint(20) NOT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_name`, `status`) VALUES
(2, 'Pakistan', 1),
(3, 'China', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cv_template`
--

CREATE TABLE `cv_template` (
  `id` bigint(20) NOT NULL,
  `tendor` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `templete_code` varchar(2000) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cv_template`
--

INSERT INTO `cv_template` (`id`, `tendor`, `title`, `templete_code`, `status`) VALUES
(1, 'test company', 'Test', '<p>Welcome&nbsp;{{name}},</p>\r\n\r\n<p>Your Email Address is&nbsp;{{email}}</p>\r\n\r\n<p>Your Contact Number is&nbsp;{{contact}}</p>\r\n\r\n<p><b>Education</b></p>\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>S.No</td>\r\n			<td>Degree</td>\r\n<td>Institute</td>\r\n		</tr>\r\n		{{education}}\r\n	</tbody>\r\n</table>\r\n<p><b>Skills</b></p>\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>S.No</td>\r\n			<td>Skills</td>\r\n		</tr>\r\n		{{skills}}\r\n	</tbody>\r\n</table>\r\n\r\n<p><b>Certifications</b></p>\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>S.No</td>\r\n			<td>Certification</td>\r\n		</tr>\r\n		{{certifications}}\r\n	</tbody>\r\n</table>\r\n<p><b>Employment History</b></p>\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>S.No</td>\r\n			<td>Organization</td>\r\n<td>Position</td>\r\n<td>From</td>\r\n<td>To</td>\r\n<td>Country</td>\r\n		</tr>\r\n		{{employment_record}}\r\n	</tbody>\r\n</table>\r\n<p>&nbsp;</p>', 1),
(2, 'test company', 'ffff', '<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Degree</td>\r\n			<td>Institute</td>\r\n		</tr>\r\n		<tr>\r\n			<td>{{degree}}</td>\r\n			<td>{{institute}}</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1),
(3, 'SI Global', 'IT', '<p> {{name}} </p>\r\n\r\n<p> {{email}} </p>\r\n\r\n<p> {{contact}} </p>\r\n', 1),
(4, 'SI Global', 'IT-1', '<p> {{name}} </p>\r\n\r\n<p> {{email}} </p>\r\n\r\n<p> {{contact}} </p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Education</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Degree</td>\r\n			<td>University</td>\r\n		</tr>\r\n		<tr>\r\n			<td>{{degree}}</td><td>{{institute}}</td>\r\n			\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Skills</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Skills</td>\r\n		</tr>\r\n		<tr>\r\n			<td>{{skills}}</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n                        <td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Certification</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Certification</td>\r\n		</tr>\r\n		<tr>\r\n			<td>{{certifications}}</td>\r\n		</tr>\r\n                <tr>\r\n			<td>&nbsp;</td>\r\n                        <td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Employment Record</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Organization</td>\r\n<td>Position</td>\r\n		</tr>\r\n		<tr>\r\n			<td>{{organization_name}}</td>\r\n<td>{{position}}</td>\r\n		</tr>\r\n                <tr>\r\n			<td>&nbsp;</td>\r\n                        <td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` bigint(20) NOT NULL,
  `depart_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `depart_name`, `status`) VALUES
(1, 'Information Technology', 1),
(2, 'HR Department', 1);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` bigint(20) NOT NULL,
  `design_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `design_name`, `status`) VALUES
(1, 'Frontend Developer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-02-19 10:19:45.987453', '1', 'Super Admin', 1, '[{\"added\": {}}]', 3, 1),
(2, '2024-02-19 10:20:14.720157', '2', 'Admin', 1, '[{\"added\": {}}]', 3, 1),
(3, '2024-02-19 10:20:42.061311', '1', 'turab', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(4, '2024-02-19 10:23:51.118015', '2', 'danish', 1, '[{\"added\": {}}]', 4, 1),
(5, '2024-02-19 10:24:12.469385', '2', 'danish', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Groups\"]}}]', 4, 1),
(6, '2024-02-19 10:29:57.449743', '2', 'Admin', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(7, '2024-02-19 10:43:28.716548', '2', 'Admin', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(8, '2024-02-19 10:45:56.724481', '2', 'Admin', 2, '[]', 3, 1),
(9, '2024-02-19 10:46:29.907416', '2', 'danish', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(10, '2024-02-19 10:46:53.218291', '2', 'danish', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(11, '2024-02-19 10:52:32.737271', '2', 'danish', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(12, '2024-02-19 11:03:13.902224', '2', 'admin', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(13, '2024-02-19 11:03:29.288115', '2', 'danish', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(14, '2024-02-20 05:56:31.403423', '3', 'Manager', 1, '[{\"added\": {}}]', 3, 1),
(15, '2024-02-20 05:56:48.123587', '2', 'danish', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(16, '2024-02-20 05:58:12.087495', '3', 'rauf001', 1, '[{\"added\": {}}]', 4, 1),
(17, '2024-02-20 05:58:28.590051', '3', 'rauf001', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(18, '2024-02-20 05:58:40.041298', '3', 'rauf001', 2, '[]', 4, 1),
(19, '2024-02-20 06:03:12.906523', '3', 'rauf001', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 1),
(20, '2024-04-29 05:55:17.997579', '1', 'Super Admin', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(21, '2024-05-23 07:20:18.400899', '3', 'Manager', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(33, 'employee', 'area'),
(26, 'employee', 'bank'),
(25, 'employee', 'bank_guaranty'),
(32, 'employee', 'branch'),
(23, 'employee', 'certifications'),
(7, 'employee', 'company'),
(8, 'employee', 'company_module'),
(34, 'employee', 'country'),
(9, 'employee', 'cv_template'),
(10, 'employee', 'department'),
(11, 'employee', 'designation'),
(22, 'employee', 'education'),
(12, 'employee', 'employee'),
(24, 'employee', 'employement_record'),
(21, 'employee', 'employment_record'),
(29, 'employee', 'insurance_detail'),
(28, 'employee', 'insurance_type'),
(30, 'employee', 'liquidity_damages'),
(13, 'employee', 'mainmenu'),
(14, 'employee', 'module'),
(27, 'employee', 'project'),
(31, 'employee', 'project_type'),
(15, 'employee', 'region'),
(16, 'employee', 'role'),
(17, 'employee', 'role_permission'),
(20, 'employee', 'skills'),
(18, 'employee', 'submenu'),
(19, 'employee', 'template_column'),
(35, 'employee', 'zone'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-19 10:16:19.179845'),
(2, 'auth', '0001_initial', '2024-02-19 10:16:19.914953'),
(3, 'admin', '0001_initial', '2024-02-19 10:16:20.050848'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-02-19 10:16:20.066841'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-19 10:16:20.084831'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-02-19 10:16:20.179405'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-02-19 10:16:20.329318'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-02-19 10:16:20.358302'),
(9, 'auth', '0004_alter_user_username_opts', '2024-02-19 10:16:20.383288'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-02-19 10:16:20.468238'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-02-19 10:16:20.476234'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-02-19 10:16:20.499222'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-02-19 10:16:20.551190'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-02-19 10:16:20.601163'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-02-19 10:16:20.646137'),
(16, 'auth', '0011_update_proxy_permissions', '2024-02-19 10:16:20.669123'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-02-19 10:16:20.699106'),
(18, 'employee', '0001_initial', '2024-02-19 10:16:21.908143'),
(19, 'sessions', '0001_initial', '2024-02-19 10:16:21.977589'),
(20, 'employee', '0002_bank_insurance_type_and_more', '2024-04-29 05:17:33.326342'),
(21, 'employee', '0003_employment_record_and_more', '2024-04-29 10:36:25.060092'),
(22, 'employee', '0004_employment_record_project_type_and_more', '2024-04-29 10:54:25.351873'),
(23, 'employee', '0005_employment_record_project_keywords_and_more', '2024-04-30 06:19:03.377228'),
(24, 'employee', '0006_area_country_zone_branch', '2024-05-03 07:49:08.259653'),
(25, 'employee', '0007_remove_employee_region_remove_project_company_and_more', '2024-05-07 05:30:56.252706'),
(26, 'employee', '0008_project_em_doc_project_em_expire_date_and_more', '2024-05-07 10:39:02.269233'),
(27, 'employee', '0009_alter_project_em_doc_alter_project_pg_doc_and_more', '2024-05-15 06:03:07.143913'),
(28, 'employee', '0010_alter_bank_guaranty_bg_doc', '2024-05-16 10:55:07.342375'),
(29, 'employee', '0011_alter_liquidity_damages_ld_doc', '2024-05-17 11:36:05.994025'),
(30, 'employee', '0012_alter_project_em_doc_alter_project_pg_doc_and_more', '2024-05-17 12:19:19.282033'),
(31, 'employee', '0013_alter_bank_guaranty_bg_doc_and_more', '2024-05-17 12:21:40.475251');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('07zx6x2883atze7kq9ajmmwqueuxwhuv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwENd:E2KEMg1ZkjWPFcnh3CR9Sn01h7sOK-UUO4q6aXjfGZc', '2024-04-15 05:45:45.831294'),
('0fe3e5bf3xo3nimzm9hzptxioypjorgi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjx6W:mVAFvxzU0r4fV4mknWomezvM44oIHbSK0Z05NALC1gc', '2024-03-12 08:53:20.867828'),
('0jvdz0l4k3mwvg2mb5emlraycplrsowf', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwcDb:COEWceiZERq8DEU3AcyeJ65aKuhDYhUm1PtUvZxIoTQ', '2024-04-16 07:12:59.928798'),
('0und978hnyp5y0zsrznre9gh1563enph', '.eJxVjMsOwiAQRf-FtSHAdCi4dO83kIEZbNXQpI-V8d-1SRe6veec-1KJtnVI2yJzGlmdFajT75apPKTtgO_UbpMuU1vnMetd0Qdd9HVieV4O9-9goGX41tZhdCZIJKDQCWMGl4PJFriSr96IMbF4jIgcyPoOXN8LVwMFPIZOvT_MNjcU:1rcJ9j:ldWDGP2JuaWDvAHJW_wW3QSrxKCz1__CDP5CmcBH6vQ', '2024-02-20 06:49:03.286594'),
('0w4vzjf60gos4nf1cl3w4s00jcximtup', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfDQE:PvU6dcpIxZewXCPlYUz120pmfCCcqGzDU5LsyS77yk4', '2024-02-28 07:18:06.123342'),
('0y8g3nc1x26b8gyra2ynogznbee8xmo5', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rdNXb:0WrmG8ggXF6uLQ5sakMjAaL_DrGX1UYbYOsKYNCM4e8', '2024-02-23 05:42:07.634153'),
('14335kftmh88egn0ia930vzbvnvo6if3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpi4f:cRdKrwtiOW2DOlKdoKzf_VePMZi40YaYOfooT0ovE50', '2024-03-28 06:03:13.204772'),
('24cb51bv8m2xeriuqtu2eox69cyhgipb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1retqk:cCEL8YjoyAhkCf77YC_7F8TR4FEgJX6jzVuaTAjPSgw', '2024-02-27 10:24:10.895973'),
('26yphhawyey6wwgjcpxt9fvgs9uytfdc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd3Uw:csDyYEfPoPlnf7zR1PPhbNhSDtWYh7OJWXECGfpeSy4', '2024-02-22 08:18:02.171490'),
('298bxybnh7rs8hl1dp7khn0ylwjl002h', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rl1FL:qPesLAmIwm4zg4k6cdTdrftt5xoPqDzq0riOUKBoS7I', '2024-03-15 07:30:51.164046'),
('2e6yx21b0jlv8efzzw2mxm0vq75cvfod', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk9VT:HGv4LUR5Sntplg3shXS3zNhveIEvc5wR4-g49BUe9Do', '2024-03-12 22:07:55.888323'),
('31hoj009wslx4qj10p02p73c1hdlaxtq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rckRi:tHBV3-hvCySZGkwreZ_NnKK7V0LRMyVNOb0x_g5Or78', '2024-02-21 11:57:26.791694'),
('34zon77jarvazy9of8ok7h1cwmgs0zvc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk0VP:eAB-pH_1MZc7thThh_LIQzSYdgPzPZfXLdwKFfQvFMI', '2024-03-12 12:31:15.905277'),
('3ciubmalajura7m8ix3xg0nptpinl4ml', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s0DrA:i5eMzuN676q7AlmeE59YltUcxINpKpX_9oe5xlXIntI', '2024-04-26 06:00:44.146393'),
('3e74wc4xx4p8rx3bvmzqwztw86wgoohv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s3rTd:h-5E7zxDiB4jQTbSbrJecJ-t2jNkjyd0-Q8IdvJh754', '2024-05-06 06:55:29.794982'),
('3np6cp0c754xk2kz16atiohpb0rri91x', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmTXw:VW2tQMFeiJYGQWcD17uOGOippyZ0jzHFgWU7O-5EkOg', '2024-03-19 07:56:04.575582'),
('3xcdrmzci04wz87dmhrsbwqjwoe6ls77', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkeJr:lIrlgfuJieRU7l3_i0Q-rKZHFfOqdXBc9rhy2DYGqvc', '2024-03-14 07:01:59.135374'),
('4ap2vmfs72bquik9f6q1bpgw0euwv1sl', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpjgX:v6e6lV0IINxLidmguZAptbLQIBAAt4MKyfjJRZGCBjs', '2024-03-28 07:46:25.032244'),
('4i7ep5yaxy5lyq5swf8we247y9f01b03', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rof9l:dtuAscKB6JU0S2OuS-DTl4sX0tkYupdi89H8zRVQHBs', '2024-03-25 08:44:09.151996'),
('4j6o16a2ubby2got4jrs2prd876c86sh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd1I0:Qhx4nH_d6qPaKPE3RR-Er2EZH1qYQVVpWPUM8o4PbN8', '2024-02-22 05:56:32.139209'),
('4z7t5lkecbdtxm2jw3du6gdo3x3snuw9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd2hU:ie7gFwsu4LzzkNKohG4NrqMZbIPgdqWYZpbQFVOr-1c', '2024-02-22 07:26:56.281295'),
('5izm4ugy2p5ruqfxfhw81p61j4q81ioe', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjXyy:hiahnpmqbfShLwcIDNR3xdNt780nt39djgdWKkQYEAI', '2024-03-11 06:03:52.972776'),
('5neyppat4p90qzwkgd8w4udmoebe2aud', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rxK7P:GzNtDo800tjpOqaiaVjU7qwm5UjDZoZ_usgx1hBsK98', '2024-04-18 06:05:31.121702'),
('5vbs2oytj1gs5bw0qagrgq6mzkdap8bo', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmVS8:RLOMcBG62u3Oe-gtUTG2nL21mKF4wtO0S-j2ug2I6wg', '2024-03-19 09:58:12.016461'),
('5x1z46kkwhe20u1y5owhetjyhhil0yh3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rsGiw:Jbk2PJqWMwTzwZf3d7MJfBcZ80Hdo-lf6ieR3fk4Zfw', '2024-04-04 07:27:22.715107'),
('64fspaf2jw4h70b5oe8v9y9urpe78olh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpira:zJMo5FFzk-g3CrPb4pEffK19WwbQxrFU8mdjz06TV2Q', '2024-03-28 06:53:46.185752'),
('6camtupfpbyyfd3p5cz1wsm8rbh5r1fu', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwFgO:xYpLZ7vLdhfcG-slx3lbtyPJtb4LMy5SNGNlQuo0XTU', '2024-04-15 07:09:12.190096'),
('6iivu7ee0b2kgf35z7nylyz9g8fzprw5', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmSbV:N7QDT0OP34iDjlfYIMTFamJ6unfGockyM21Cc2iwpJQ', '2024-03-19 06:55:41.917182'),
('6t4g4xhfbcj3n710mhbghovn5tboh482', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpPpu:fgbLO7b_sdZOGl_5N4636P2TrPBjKB3Iw971sz2YO4A', '2024-03-27 10:34:46.176869'),
('6uiow4rxgjaxrcacn4oqh0n3hkz2if3c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1riSZv:81gMJ_ndofKMLrvgj3BKpEDeChZzpTZYyweTHKRmLKs', '2024-03-08 06:05:31.842622'),
('6xnmaofq6kh4v4hsgusjcpyyqeqvllz0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s3uhk:d2cSrt_rjv5jpYqgo6btdh9yDWSvGce0eAyFoB_MUwQ', '2024-05-06 10:22:16.480499'),
('70w0lq2dmz7mq6gk94puntuhmhjc5vhf', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sBTXJ:WF_WQrfpi7cbY6QIQZGkXqxewT0T10CnGrxKlaZkbi4', '2024-05-27 09:08:45.564665'),
('7tw9sr7xwgxuou8wql5mttqhmvvzp9ff', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwdDZ:XmpfV9HpfP1N3191MYEqkSSxyWAZg3JnAymHj8WIgTY', '2024-04-16 08:17:01.830873'),
('7xt3vilffapq5dsr1jlt8hlddviz27cq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnAF4:a-_CUMHXH_Ezj5Tvm0j84cSjcki9_tA2HHzRo044C6Q', '2024-03-21 05:31:26.777192'),
('7zn8t0tgom4prug97anvocz8d718kblt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjxux:5-6HsnwKZYPN-dRJg5TKeXtFtZI-3fI2rmHipjI1Wos', '2024-03-12 09:45:27.292809'),
('8148u16pzcalsqw1pbzkmj16wkb5yotk', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rti1R:cim5LiSBIuI0k0A2p7BbNeR14XJnUM-CugPkqnnLU5g', '2024-04-08 06:48:25.658112'),
('83y55sqwo5f1njaasy40unlnsxxltrqi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk4yh:rBW7-yaZYQ445-iIgPXos9Q4wQbOoBdSXxC8KH-sV30', '2024-03-12 17:17:47.944459'),
('87uty74d0v656cc3xr4uv3xhcfyfgq7q', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnWee:aP-LrntHYQESfoxE8RboxiHcrhA0n0rLPrhcDNzRcKA', '2024-03-22 05:27:20.381179'),
('a1ysylsg08lv28tmlk3poemxpgvibs66', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm7RU:u6mYn3nuFK7lRjydh2fUVtED9OWEFV3mMouMTjTrjbI', '2024-03-18 08:19:56.709704'),
('a7951pp7lrxezmzf86u9jktny4bo4t4e', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rju09:mlplo9iIoZU_EBlWYfQ6afYaUz4Ubyi9EuTNldbDeo0', '2024-03-12 05:34:33.243006'),
('a7n0o32jd5rkv5jtc2p2v5xb4syggoq0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk5ld:2eet6kX_DwcsgI3FFp5UXW-HcVsQfItoccL-FpmPbuw', '2024-03-12 18:08:21.905621'),
('am4v0ppvxuzm1kufm2m279lsi3zr6vm7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rq47n:h3zoVNPvvYMbNq1ZYZ-nUtf7kcagKaokb0ysH5sPr4g', '2024-03-29 05:35:55.481508'),
('azoypnuq3vinlnf4qs0utsx0uy2ufv6d', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rl0Rv:CfF-gURCb4a9Z9TOMj86QszjloLqyBS-2W-J_BfxIn4', '2024-03-15 06:39:47.983253'),
('b1gqustwbfmxf39afr10yfmeofeu4bu4', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sANf4:jojBPChwrZI_U9aXIrtvBAnJD-9JRA2N0Es_ImOnutE', '2024-05-24 08:40:14.962682'),
('b89b76ogo3pvo085mqy24ujdjjtwzpfv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfYjf:bV0sy6yhIpqxICsf5PHGRKIFJZtD3swCraisU5TzgNc', '2024-02-29 06:03:35.458415'),
('bc104ni4vaat7n1jmfspdloyl30s90qp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7CI3:I_l1VnKVX1UCGckLIjXW1ADHeSeHORQUSKxvxamomKQ', '2024-05-15 11:45:19.800451'),
('bcfkzql4pql0v6ydpqwx7sy1d96ebfhj', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s8vQJ:JSNfZd4adK3Dj5Mw8P3ZzRDIXuE6d6qt3qjm0epxWVM', '2024-05-20 08:18:59.709870'),
('bis2363pys5627qn6ju0gvetk7454pfe', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkI4B:Sw4a_o2IdbdmZs3qoGR7LcQig4BEaVW4shSKhEip548', '2024-03-13 07:16:19.661937'),
('c3pu131q0jxyq1cb5f2xm0hur6r5lj0w', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s4Cjr:63CCbPJbj_LTkeQwYApG-xvMvvI1hnsmjrlMxeOKbPs', '2024-05-07 05:37:39.330606'),
('cc62y36shod0g1x9bsumybeu2zu4exie', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk7l9:lKX3ThDu817J4IGrvuukmNEubOE4VGFxu2vPnUH_FHE', '2024-03-12 20:15:59.633626'),
('censme4uqzfefp6pqtad89kuu2abm77e', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s9fFU:PkSkTQSS5GTXTElpbWFeMQtmNqUGSi-DV6dvBNmXgGA', '2024-05-22 09:14:52.283050'),
('cmyufjzpyajoztyyuadvtkutvhrt4m2w', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnEfy:fRnyP5jrWc8zv37cCGfcBi3oFyYXKBK9YYqyemLzziU', '2024-03-21 10:15:30.590806'),
('cq6gw9fm63fej4anc1rb6l10wfersj2i', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpkU5:1LYw42lL_hNAe5KIoZRbAkHJ6_VkEXEs-jVvW36eIqk', '2024-03-28 08:37:37.580352'),
('cquh7w6hjl992f8khrza6o1rb6yv3b0p', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rylcC:bwQnxJAEm0u6JPGo3RWSTMBRK0AA4eDh6K8_1ROcaqQ', '2024-04-22 05:39:16.475912'),
('ct99xime2smdpt4fldalei55s71ja6te', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkfiY:gmioMR6KIBxUZJebv6UZTpjJSaqHtKk36bLlbiwaGKg', '2024-03-14 08:31:34.790997'),
('cy8xs8a9edyoyjag3uq0lfsm12bg9j6j', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rxOAC:rCH-feWaKNT3aWgDhRyoqEGrr8LHri1om74OTBA4mu4', '2024-04-18 10:24:40.604353'),
('deyptg7wcz3asphwdmcxvlyd543cteam', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1jgu:NKZ_3UJ1bqhavt_5h90qJtdDePxTQdB4FrBPEqcMs5Q', '2024-04-30 10:12:24.041472'),
('dyqh2ceii0bmk3fsw7cyr0v3eskc9eyo', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rruMN:Pj8etjm4-W9Dcj68kN4TTUB8-bLFvj2O0PAXJ0qPDrA', '2024-04-03 07:34:35.363431'),
('eauwmxsbwj50w7jw0rsug3bg3agacd39', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwJsn:GCy3_w9M3eeSuTaZBdDN_UJIVjtpTccWwDANHbsJSvM', '2024-04-15 11:38:17.510724'),
('eekgtwmlvvsn9nmp1wef964cf49bl4ae', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rdRqQ:G6mwUutLGOjD4knhaHPv8qdq3rSW-lqNHASOguhX9gc', '2024-02-23 10:17:50.395314'),
('erxjfj590w97g3eewo5lz5o67g82rrtt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rc0r6:qKitkz057jMoj7o_2_sgrBJJWOS3KMPlR_Yqc_zID_Y', '2024-02-19 11:16:36.653300'),
('et1cfcep2x0cloeuybbu9kzr6flpd3ho', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcefC:64dy1LHw29FaeWcSC4PKQI-E2iQg3bz4af5Er-IXyCY', '2024-02-21 05:46:58.075412'),
('ewh4s0b2up67otgazka2vtk1gfh6yriu', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rcKkl:prPRAqCNDLiJqa6puARQS8PHt0WEYbMmuukkwQ6ylKQ', '2024-02-20 08:31:23.983902'),
('f3gf7cvix957t7tuah2gpidrlqq04h2w', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rtirt:vgCsBMm2z_pKSdOfcrjvuf3QDmDgTfXZ5vO5LPxhi6A', '2024-04-08 07:42:37.586006'),
('f3hi23ut05ccg11yh2505wyllioz7fdc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1kTk:_bjUxm8l-QmA-x8WlUX5DqTTp_GijZi5AqCfTXlfo_o', '2024-04-30 11:02:52.979819'),
('fqsas8gkzwtoxrra8sm30lhewi9lx6w2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1ru2je:CUlGDkZy8F9vF9mMHqFIAFlagNF3jniliNYbET-izs4', '2024-04-09 04:55:26.905361'),
('fx9dhy33i3hrbet4yk2pt8ebt7wak1dx', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfwNy:mHQjL9MaBJPeDX7RHV2mbZtiMq41Cbg4jfvW_m7Ej6g', '2024-03-01 07:18:46.793489'),
('fyagylgb0q2zapp06795o14mps6brvpt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkhAA:gkHlvWY9U1LeIerrMt1h8CNzmsHC94saRIcYMGjJIWQ', '2024-03-14 10:04:10.646251'),
('ga4kqe69o39ikrinr10hegk0ey1ow2nz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s2kZK:5zTtcsgKbYzjKjrzxFLj8uyg_4IUhxzBIoHnBCe7ibg', '2024-05-03 05:20:46.375875'),
('gkyc5iy9qfzzjilo8x3tmc5ht8cn6ia6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1ry3hC:eZAYvzhBHubSRoWldC_x5g2r0nQFX1bCY0h16ATBGlE', '2024-04-20 06:45:30.751323'),
('gmmd4wgskomj9nyvqbkyyvxhgqyiiuyq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhRBX:JqxZxMZYdUys3bM6Ab59rz4S8Mblkk4p51P1rWN3nGU', '2024-03-05 10:24:07.250116'),
('go2f01r8yp6j63u5c930y1i341de6grv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rynH6:juGWASfdN-uYiE1EFVomvUYS2eAddpNPP3dQD-G2dMU', '2024-04-22 07:25:36.384981'),
('gsjnuj407k9q6354nhjx0270h4mfgyln', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7YaT:O13Ke-LOS-umqeVgWA3r5i9TXqgpLm8qeeXvbouCDNE', '2024-05-16 11:33:49.403576'),
('hps91z4iu9wttns7e6tv38vadkvitp45', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkIuo:CkINStRriPdDraQvGdvvPHWaVqhPY145nz_cnvr4kRg', '2024-03-13 08:10:42.809151'),
('iakaaiqtnv3bd9hwozzyrxkomd1qkdx6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjZDy:dJkaPLppziOyq1bHS4_9M9gr9-MrosRi04GzSdMMUzY', '2024-03-11 07:23:26.113033'),
('ikwfivif7s0f6ad1cpy5x7soy5rt7ifv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rh0Iw:IY2gsXhQMhawZNmQffmy9CZE4OVAyLT-pQP7w7EU7as', '2024-03-04 05:41:58.112039'),
('ikygmn1b0100fejntgvkusw5jkzyqqx2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpLGH:Whb73ppENeouAT3kZzDfOTdyxKjeUxMHvzWHaOU6T4I', '2024-03-27 05:41:41.490198'),
('ionog86obd8957j1x2izcuapmahuu7ue', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmpGA:5GjXIUzvVlTdIroHOsHv8QWz_jwi5AQeFrxN0so_hY0', '2024-03-20 07:07:10.328466'),
('iwg73jugmommfjstrvrc65nzxtcge9hh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpN8O:5wFqnQP4_CpYQDaQt0fZbJaAerbSoqi8gGzPUw8FlfQ', '2024-03-27 07:41:40.753103'),
('ix8h74qn06z2lszpaooewmoawf0000ej', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s77kP:A4XEb-rvndSHI1MVMvHg7Lc03F7DSS9iKOMqAMvk_qo', '2024-05-15 06:54:17.624955'),
('izb1vopn35voyri4pzsxb0nmf9x6pi3y', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1ri5r4:NMIitZt7wMHAe-er78tAxBtXRFEvoMH4BJ6qX3s8mDA', '2024-03-07 05:49:42.094215'),
('j1ogjii8toeqfobds66oncnzyndgmwbo', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7vAQ:MyYh0VvrE_OEMm0wUBPFlHcqiZ0fp44IMFzF7U1msf8', '2024-05-17 11:40:26.341002'),
('j8j2y6uuyux5tax8xh6mjodm54x9r5mi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1Lb7:PI_ZGQZkIZ9Z8i3gCgQVysjbYM7VhCKEXTwUSNV2x5o', '2024-04-29 08:28:49.643327'),
('j9bddt8awsjvoq4bg4gi0lk7e0k2cr0s', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s8Cix:iAAlR7HamwXi9jC7pqMwGFL-aKavCj7zbMTI2TM7XEE', '2024-05-18 08:35:15.753464'),
('j9l17qrewlnphejzauaatsknmpy2vozb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk6rS:t41xtOJr8HeHysK4-AgEWl7ikIDwCz01BE6tqp54_iQ', '2024-03-12 19:18:26.317575'),
('jaboe8a7mrdaek6hrmchw1ckabwabcmz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rxguN:5xK9KlLQidajwWLovLWN8Bgp4aJfMf15Dd8khKjRmLM', '2024-04-19 06:25:35.844910'),
('jqwtkyy0fy3cxctkup6hsa34a78swdy9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1JBa:Te2NcOLCF87HPVPtLg3LQGknO-3FXPcKVp7AUlzFUTM', '2024-04-29 05:54:18.923368'),
('k2zqiuqte95dsa1ydnavgw1ljkymgg1t', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk8Y6:edaor3_E95HxOkGMT-XSqBRYMPXQfxPv28IQXdiAIcc', '2024-03-12 21:06:34.258204'),
('kvn7mii02i9711qp8e06uv9odvor2len', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s79Dw:6FXZhcWoLQejRnu9QbwDJaNrs2KxP9aQRDqxsJYdYCE', '2024-05-15 08:28:52.759182'),
('l2obl6wdc3y1jlq3z5f0d48on0hv9sce', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1JBb:PXxDm2iG85FEIMeY-SU9A_Ap4Dw2VGY0fkuXsLpvW8s', '2024-04-29 05:54:19.149246'),
('l8xwbyda85xt0oa4ufhdhn8ogm5tfi0b', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfegz:IVeT9qQoLlKPa26eG0lUaFeBXlnEqgn30l6kfMPjqH0', '2024-02-29 12:25:13.451918'),
('lcevjyr9hj5vwgkllf9qvuysfwoflz4k', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhTpc:EkqSuMYQoDDBdv66z8ftrtuzvfBfRG4yAsFAfnoj8lc', '2024-03-05 13:13:40.295421'),
('lgxj7eaamwiqc8pyuvqdy4j0td2k3nh4', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcJ2N:OOaKVozljadP9BaubJGuOx8urSAu9SSlM9OZMaE355s', '2024-02-20 06:41:27.209002'),
('lvew4kppy13lpeqroichz8m1abyubjkq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rja0s:ZinIpLFFYk4k7gntEBSrDtMFyXYyVVA_xZQN-LIA9ZU', '2024-03-11 08:13:58.241059'),
('m4fvblqo91hxrnf6rih6d425xie7jro1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcPog:o1wBGgWCSuu22WtNe0X6fUpySkv0QQvK72QoCaK61HY', '2024-02-20 13:55:46.474066'),
('m4h579qdm5kgovvkd0428fa10lvv2wa6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcMfO:0jshP5sHrcobxb-0iSh9dDVbJU54FKhbrY-FiN9X8Dw', '2024-02-20 10:33:58.802704'),
('m7y7m4pbquf0jm60n34fqg76zgqswegw', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnC3R:fbyms3xv7DmESkXu3UI7uhuamgqGVPxaL5POyBUQkTE', '2024-03-21 07:27:33.277016'),
('map7n89bfl2xtv7cmv9uo04vnx85cx1m', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rc1fy:8LU_i2gKwXOhdC3zW63Q0tMmy7cgihoKnL4P8Z8ex1Y', '2024-02-19 12:09:10.587423'),
('mfz8n55rmiolzohirqm1jxouvhucvjg1', '.eJxVjMsOwiAQRf-FtSFAebp07zeQgWGkaiAp7cr479qkC93ec859sQjbWuM2yhJnZGem2Ol3S5Afpe0A79Bunefe1mVOfFf4QQe_dizPy-H-HVQY9VubyUGRigRZayzpTMmhUWYSIoP0WkAwzhtJIblEUgVwyktAUgBSY2LvD9ThN8Y:1sA2ka:ylCW_xEdZ6yftU1beC7SuEwLgY21eAbTl8eOxnQIliU', '2024-05-23 10:20:32.825209'),
('mi6h03uilvqslbac0dglz5mmzvowuisp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkKRY:ATUsQtrN-nDe68Ju5vJcfKFTHGgM-XHZxhx8SsafGRc', '2024-03-13 09:48:36.093117'),
('nbwavi4523mhd3gz8k5d7jbh5256dwik', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm8cs:nrJ694dLUpvj7Y7hOihT2AOvHgy8ERE_DFgcHoGPInk', '2024-03-18 09:35:46.620919'),
('nenz1zkvyldvp2e7rxnenagldlf4psk9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7w3O:bYqONFP8NubRK8ffzamM6_-a_xZjWc3kZJu88Mj5mvA', '2024-05-17 11:47:14.190933'),
('nnr8dtwwjblmtng7q430e5yffj03b8dk', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjapb:LPjKMYJB-VvgMwRB00US12djs-zylan2wEpictbkMJk', '2024-03-11 09:06:23.109845'),
('nzep0xlr1tp6gdnmzm6nwx9t4g82282x', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcP20:GF5EG8_XtAPKigv7c4vxz5sQn2fbpFEigUCsqiZ4v6o', '2024-02-20 13:05:28.879799'),
('o2h4438llbtbdx273bocsbomnbztbefe', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm9al:bfvqsh24i2-ZNpOVbg0mePvojOTki3sGlV8nhwpUvN0', '2024-03-18 10:37:39.366081'),
('onug5npj08kcbk5o1a2l200oj7fmo40c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s2nek:9Edsp0SRPnL8WzyaBE2IEg5aSsla6Al8a9tjzja_uSw', '2024-05-03 08:38:34.838757'),
('oozg292zk0ouu89vs6aczkdrwwwbw04d', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfCZ4:iSUPwyUT3VvAULY_Q2UyAGwcmpsfyL4H616gYB5bSWk', '2024-02-28 06:23:10.372045'),
('oxvmexkr3y1jzq084tvvhrgx30wplipj', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s4ZeX:WMl2pdjhMbg8HTf4AiTHR74E-snqNDHVGztgwPIVG6I', '2024-05-08 06:05:41.762559'),
('p7lnvpiq1zdddiezjdb3ectqzuc39lsg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rofwf:V_u0Laa-v0zkDeR-WoIALvYeXPLkYkYjUdVFTnogQPI', '2024-03-25 09:34:41.474760'),
('p8ead8d94g9lbnivfzgspo6da1n0had4', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfxfP:vgQLWuK05RSMYSbRvkjYN_DXnrl2TJBH8HIM1DoV9zU', '2024-03-01 08:40:51.429768'),
('pdzq6x8rmb15fqi1oagk8nix7p6n2hr6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk46z:Fy-XvvQeLt8FPlYKo4aBlDs435PAZkYjhi0L6BEr2rc', '2024-03-12 16:22:17.401423'),
('ph6x360zkjc6c4ydav33zstuou2d7bd9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmrgQ:RTFlLo-LV_q8YcEh5ErKqWGpvYiCA_GwJq6Z9SzDV5I', '2024-03-20 09:42:26.031850'),
('pha9tr5h7mjry6c60rpii72byakyw8m1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rdR2o:ZM1FGFVybw2M0EdysXg4RFxTiOgO1DZiCrvphzlxv5k', '2024-02-23 09:26:34.500584'),
('pigmqxyjz5q89a0lad6xov7mn98ptujg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s2OYm:qHkgWvkSbzoTU2m62GxAFX1NLBnfVOTh0_T7wHf4OU4', '2024-05-02 05:50:44.828114'),
('pr9gbr2xo84jjs1jalj8dsjgdl97qb3c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rp0MJ:aCDZW15djZfoXEnXN-WJwQ9uwU-kRylqTVW_2OllcG4', '2024-03-26 07:22:31.831317'),
('q5dzcd3h2bfyqdd376dsljpa7a5gngkj', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7SzD:zN-cgrrYqvdAuZ0ftKlvUzbhIVBi7gdVILPPFdY7xDI', '2024-05-16 05:34:59.414433'),
('q6nbgu1o2qsm7b6zvpzi34f1y7m5y2l3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcfT8:rUM_MshyMm_bVS33jjEuYLL-Su0PtM-w6WaHbIlwuiw', '2024-02-21 06:38:34.499670'),
('qakyfr6x85jmye8ysjh3sanfpy0aezsl', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfED8:PatHtxvNdB8wQRq1nwPFV3LqTaVc965dMAIeMHQGGIE', '2024-02-28 08:08:38.095842'),
('qassxsgzjdi942st4a5mefg06w3jnysi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnB5g:mQJLtpp-QholSHAZxvwfmz4Fz1kJsYRZ7lWfCHoTdHc', '2024-03-21 06:25:48.841645'),
('qbjijq2c3x20ftm65wlioy37gzmzsxtd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmnwm:X5IR60ZVBX-8TeDwXEiWhqAkLuE5EwMsUjDnOhMCZMw', '2024-03-20 05:43:04.228857'),
('qc44i7co33xrx6ry7j0qd2rf6k2ciy60', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7VQt:7Phb9-WW-wSehp7REBYfYXPyqo2GcijQk5UK_PRHHjw', '2024-05-16 08:11:43.016359'),
('qddywxyja3ep7861xttehsxosc6qz2yb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rphHp:oauv5dODllZVYntbYfDGDmApXdMKmgp1ZtusthrNJ4A', '2024-03-28 05:12:45.620095'),
('qh3lvm0x78c23jyxklodbrxfcvkae9rc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnDFk:3y5_0iXJEQzEEQlvFBfGLRNDi4KxdNZVQjeQP7xDnIc', '2024-03-21 08:44:20.847751'),
('qqrjd9uad8z45tuqvighyhxcnkq8ssr1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7Tt7:4CX_YGHOQtcu5imfGNEuHBCiZNj_3-wL46tQujcgXjg', '2024-05-16 06:32:45.884280'),
('r72vjalm9y3rj3vrngbs31mftagd8bvb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm6ez:O-xYfOGmgKylFgA1zYl-cr5HsNwxmTnd1pL2ifVQ9Ws', '2024-03-18 07:29:49.107029'),
('rcbql0qi85tb25fxvniy1ah67j0g27l7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7XUA:Unf4B70N-R4zQjiKbZ7QUVLDn9ha0gvssbokIilVFqc', '2024-05-16 10:23:14.601066'),
('rfow48hgi9lnshe3ukurbssju5a95q52', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcNSB:7L_ARyeZW2JrChbNOTPieuM1jBzWZLeK_VudBQmA6T4', '2024-02-20 11:24:23.896796'),
('ri8psr5fdf8692zwr6mcj2tdhzrj724l', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwxa0:H77gKic-UORyg0ZqTCYyNxHLyTZ_TQ40rPD3hSafQZU', '2024-04-17 06:01:32.394188'),
('rk7qkmq0deft37wp3xj02cfu80769tk1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk1Kg:zMp2XeAntjGVtuSkyDKLfo0o0WGkRBkjgva4V4HoBKs', '2024-03-12 13:24:14.409875'),
('rl2b1u5kddydgpewgyccmympjlbwzlan', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s8zab:TjUQL4HS9sTIwmViRDwrrGmtaL8-dttk0MnN7gY1fwo', '2024-05-20 12:45:53.184955'),
('rxkkwlyj3epcikq4t97fs9ks0eorzkz9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmsTx:y6XY30AmHWapZIpHYAsZC93LZva_gUi9BnAI3uB5NDw', '2024-03-20 10:33:37.905139'),
('s158adjvemzcrhviubcvliekyvbbk4vg', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rc0ur:BLSWG_oNrLKTZ4iRk96J-VnONTEdXZ1ypMjIS3zoag4', '2024-02-19 11:20:29.319771'),
('s1pb4anv0h3h7cc0nq8yx8r83ic0wl2b', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmUTi:kuEKB8PuYfSNUFWiNYD-r541zFufxXTecy4QEhdS2oY', '2024-03-19 08:55:46.071900'),
('s5a8ugqvlkgpilbep74hdbmz0o4jy7xr', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s4HME:ZvYjPXjum9s-eKoiJ4DeEGIAeyXnl8WtdsNKHHqQ7O4', '2024-05-07 10:33:34.517448'),
('sbaaxy9xlfntgfulens4pi5nhgqov2dy', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s38LI:nHDPq3KY6jWZoCphaQ0cdxEw41KcycMiQYYIDTY0Cls', '2024-05-04 06:43:52.553856'),
('scr376o11knmdqpcfz8d1p8epdz7p6sk', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7BUM:mGJlQbpDpKNFxzK78A807VvBxWQAoXHU8d6tYkXHu8I', '2024-05-15 10:53:58.968431'),
('sikc83v1fnh2oecpajpwn9lqrjogcutd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rscsR:IbPRjKM660D3ZJVgcP0cNNfno1gZTDSbAJ427tZ3x2w', '2024-04-05 07:06:39.157081'),
('silqpx8is4craxumg9fpucg7mnd83mpp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rxn7x:tJuoe6mSMszVHWS8F3KLxaTRl-Km-1oJYNba1uCTiFQ', '2024-04-19 13:04:01.989016'),
('sloi158mgtetzbwgd7zztujnjja313op', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfGwV:zzQB5YOh1sPC0UnwcsYHKM1cZ_Jkk-rkQb_VjwazHew', '2024-02-28 11:03:39.988649'),
('suihbm5nsziwadh1g1tkzkvtfxcqh84b', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm4f7:8CX-kTdLSBFqJGrCWPNCzJJ-0NSvIpQbNbsUhnmY7uA', '2024-03-18 05:21:49.551259'),
('sxasemyuao6nces7uupud88yduiegkii', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1roeNF:ExcYG4YTg-tyx5D9zt8LZkxaD6ZY7Iwog3r88CwcrUg', '2024-03-25 07:54:01.680306'),
('sy1te4bb0arpuy1djrswhg6ymb90qir3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpO0n:uO7LrZE69RfTUez-210AxkihRo5NM9wReu1Y_FLmV4U', '2024-03-27 08:37:53.600651'),
('t0d792pxv856mc7eohk9brvhev4y81hi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpOwR:K6Wj1bFeAGGJ60axKN25V4t2boqV4xnI8Xl2JxqKC6o', '2024-03-27 09:37:27.263356'),
('t74bvriw366ic0o9ulqemkgxc8fmnk09', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rsHXI:eqMsZ3FX0gY012n0fGZnmAAc756LAzGlESpXsHKJXaI', '2024-04-04 08:19:24.494749'),
('to8ed0lx7fu46j908nye44ht0c0qv6ug', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7qz9:e-_lVo56rfCravVamDWd1EjlXPzpnu8TV7Kqir2bA7k', '2024-05-17 07:12:31.526677'),
('tzxpub53rb9dpsxprc9y45yimtjc86wg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7w31:jq40ixdhsSLpZl3Ev0PVkMF_IDd7EEe9ey7ygFkm7oI', '2024-05-17 11:46:51.081284'),
('u8r6xlr1t9acmfqt59fye3qr6scu2lnt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rsc3J:3i4uAtiXHhDCCoBBfhEBfoeiXBS3q7muIVH7KQsS3D4', '2024-04-05 06:13:49.953235'),
('urnwm17ui7y88a902gkqxac7e8yuivuf', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcK4Z:8Qp70Xt77JidU-tF3WbUfsuq5SNk23UiKhj7VN0axD4', '2024-02-20 07:47:47.926961'),
('v7q4dcq93nte1m34xwqmo2mwxcrgijg0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s2qFs:qMPj0yjEXt8U8n4HtCwgLVuMMrigjNNYXghU96HwdkU', '2024-05-03 11:25:04.518919'),
('va0k0sxd35cn5hafocmydjmju8fczigi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkLOR:7-lJQ08ZQdko3fMG-rOzXpF0eZCGvlHUARLLytzbQoU', '2024-03-13 10:49:27.805812'),
('vb7si7cpsj3ekxyftg0xf9q5su5stsvh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s4I8t:nb-XetMTRVMqhyhpAF2bpDq5p-_bvUdXdat1CG06ZFE', '2024-05-07 11:23:51.262383'),
('vfvsqhl1hes918pxnz4dgenxcczisjaq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rdQ9p:9RE_7HRZuTfpmioBE0ciRZQEZk0YjDWgnER080Iwe_c', '2024-02-23 08:29:45.844376'),
('vhl8lqzms9f4xzgyf3gqju0hwqft0xkg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1repfF:O2FF2-ETdFyt9211vclZ5_oy1uH5RKkc1QxbL4ZN7LQ', '2024-02-27 05:56:01.016543'),
('w4ynzsf8s2mqzk5dnxcz0l5qlhzasyd9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd6w5:ly2s2NHTwJVRVu_PkUsO_6-HgC9y4dRngADG_SgMnrQ', '2024-02-22 11:58:17.871519'),
('w5zrarhodgcr2gwlmr97gtcsmnk7qcl2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkzHm:M8o05RXoJvi-O6TtBzFGGVjxvXcjbMRwxDOjrtpq3zs', '2024-03-15 05:25:14.362931'),
('w9a757bn8a1cbw2mrg9idqyy8dx301qe', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1fjX:9vvWHHRgod0OUWLrZmXc3E0Xh1Vr1tQ3TgpyIO0BJek', '2024-04-30 05:58:51.778574'),
('wdk0h38g1f4irhnel22sowbx9plmgs9g', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnXfn:yQCseA2yTQvmhccbKzH7kfYe4QsTyFN3XcWi4Awt9s8', '2024-03-22 06:32:35.810426'),
('wlnsjrj497blp983w12mkhi7rl17z91y', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rcKkl:prPRAqCNDLiJqa6puARQS8PHt0WEYbMmuukkwQ6ylKQ', '2024-02-20 08:31:23.963577'),
('wu8zi681s99ugpaxhiwpgeg8x4ipksxo', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhjFn:sxumIDAv36Kztpr0ZjmXHh4dDq65S1fYkgy5Umky6rc', '2024-03-06 05:41:43.299728'),
('x2b9iyautuacrjmolg6yrzrppfah1eh0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1Ofy:OElvd5U8coR6C7AqUgweiJZjvGzrvZULRSrXGqIVXGw', '2024-04-29 11:46:02.653469'),
('x62if2jo7zff02vg4qo82eexi93ki389', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjwB1:HKM2lqGYWA2DN9QrPIDkl1KbDhmYI0emdUEUEUE5lDc', '2024-03-12 07:53:55.989411'),
('xdkhkww8po9qdjgbcw7e4umtiob0nj1c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rclJA:Yd8xP9uKoa76hgFnUl94h9RrESF18HZ8n1s4O-Xi4FU', '2024-02-21 12:52:40.341480'),
('xlztwt5dqdylm0nvr35p6onok295hn9q', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd4Jk:p2abiF_i2Nr01FPfFJBFbU0kc2qznGegl6WrXqBG_WU', '2024-02-22 09:10:32.318396'),
('xqto7wiy1rlaydd6qbqoolu5z6ydwce7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s3qFm:ggnoYhXW4gCbdm9vHBMuYfFGAZGlAtatOX8JSpA6ODg', '2024-05-06 05:37:06.474233'),
('xyrri0hkvs9lo7tqbcp19u9bu9iovihg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1JyF:NNwkRTL2uF6JFxmdLy_XmZknYA1Yj2JFkArwaUhUydM', '2024-04-29 06:44:35.202676'),
('xytmkkx28i7ryxq99rthxgor46fmvv55', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rgI3l:esVyFiJfoOJ7XpwFtGYhzqf29WvVK-UX6_XL74C1dxA', '2024-03-02 06:27:21.199625'),
('yazwzru8ofj3ztbxbxgnt4191pquedqw', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7ppE:_FQYUDzvw8CPAS-ibEeVpL_yPYM1Aj7anIxfkA-seAI', '2024-05-17 05:58:12.811473'),
('yokt9tc2rtylon8esocm555kf6fm8ayd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhMvc:iTJ8mO12KdWrp8qJ8iJdSSnngnxhKiT3zX8Z75iXHig', '2024-03-05 05:51:24.301184');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('z08g2oezf44slm31o8rb3jtze4aqs9z2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmWG8:2-vc62yOOI1ZOl77WdBm_tp2BcpOoNUCzC5kIk5bYNE', '2024-03-19 10:49:52.676243'),
('znzoxpvk7u8vcgwxsfx35midxzqfsjux', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkcm3:fmcog8HWBUFfCjnqZg20EFCGFOgC7lWJh5gLJ5kOmPQ', '2024-03-14 05:22:59.408115'),
('zvywshwffntyj3g63f6q7qpv1dx0fdqd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1gZC:Qqmf1N8Pz-VgzAvNhy2wS9-gD7-sorLA-xJbDm1uuOU', '2024-04-30 06:52:14.328178');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` bigint(20) NOT NULL,
  `degree_name` varchar(50) DEFAULT NULL,
  `institute` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `degree_name`, `institute`, `country`, `from_date`, `to_date`, `grade`, `status`, `employee_id`) VALUES
(1, 'BSCS', 'FAST University', 'Pakistan', '2015-06-20', '2020-06-16', 3, 1, 1),
(2, 'MSCS', 'IQRA University', 'Pakistan', '2015-06-20', '2020-06-16', 3, 1, 1),
(3, 'BBA', 'Iqra University', 'Pakistan', '2024-02-01', '2024-02-21', 3, 1, 2),
(4, 'Intermediate', 'DHA College', 'Pakistan', '2024-02-01', '2024-02-16', 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
  `eid` varchar(20) DEFAULT NULL,
  `ename` varchar(100) DEFAULT NULL,
  `eemail` varchar(254) DEFAULT NULL,
  `econtact` varchar(15) DEFAULT NULL,
  `cnic` varchar(15) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `qualification_id` varchar(100) DEFAULT NULL,
  `deliverable_task` varchar(1000) DEFAULT NULL,
  `e_address` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `designation_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `eid`, `ename`, `eemail`, `econtact`, `cnic`, `date_of_joining`, `dob`, `qualification_id`, `deliverable_task`, `e_address`, `status`, `department_id`, `designation_id`, `branch_id`) VALUES
(1, '001', 'Danish', 'danish@gmail.com', '03323232322', '42323234234222', '2024-02-06', '2023-07-05', 'Master', 'asascasc', 'adascaac', 1, 1, 1, 2),
(2, '002', 'Mikyle', 'mikyle@gmail.com', '03323232322', '42323234234222', '2022-01-01', '2000-06-06', 'Bachelor', 'iajosidoajdo oiaj doiaojd aoisdj oiajd', 'oiqqad aoidsj aoijsd oij', 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `employment_record`
--

CREATE TABLE `employment_record` (
  `id` bigint(20) NOT NULL,
  `organization_name` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `activites` varchar(1000) DEFAULT NULL,
  `ref_name` varchar(100) DEFAULT NULL,
  `ref_email` varchar(254) DEFAULT NULL,
  `ref_contact` varchar(15) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employment_record`
--

INSERT INTO `employment_record` (`id`, `organization_name`, `position`, `country`, `from_date`, `to_date`, `salary`, `activites`, `ref_name`, `ref_email`, `ref_contact`, `status`, `employee_id`) VALUES
(1, 'SI Global', 'Frontend Developer', 'Pakistan', '2021-05-21', '2024-02-21', 50000, 'anckja ajs ll', 'no', 'no@gmail.com', 'no', 1, 1),
(2, 'XYZ Company', 'Frontend Developer', 'Pakistan', '2019-01-21', '2020-12-21', 25000, 'ks js lsld dl slllzc', 'no', 'no@gmail.com', 'no', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `insurance_detail`
--

CREATE TABLE `insurance_detail` (
  `id` bigint(20) NOT NULL,
  `issued_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `vendor` varchar(100) DEFAULT NULL,
  `instrument_no` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `insurance_type_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `insurance_detail`
--

INSERT INTO `insurance_detail` (`id`, `issued_date`, `expire_date`, `amount`, `vendor`, `instrument_no`, `status`, `insurance_type_id`, `project_id`) VALUES
(1, '2024-05-01', '2024-05-31', 5000, 'no', 'vbcf4545', 1, 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `insurance_type`
--

CREATE TABLE `insurance_type` (
  `id` bigint(20) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `insurance_type`
--

INSERT INTO `insurance_type` (`id`, `type_name`, `status`) VALUES
(1, 'Monthly', 1);

-- --------------------------------------------------------

--
-- Table structure for table `liquidity_damages`
--

CREATE TABLE `liquidity_damages` (
  `id` bigint(20) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `max_percentage` int(11) DEFAULT NULL,
  `ld_doc` varchar(255) DEFAULT NULL,
  `addendum` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `liquidity_damages`
--

INSERT INTO `liquidity_damages` (`id`, `unit`, `percentage`, `max_percentage`, `ld_doc`, `addendum`, `status`, `project_id`) VALUES
(1, 1, 5, 10, 'project\\23\\liquidity_damages\\photo-1579353977828-2a4eab540b9a.jpg', NULL, 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `mainmenu`
--

CREATE TABLE `mainmenu` (
  `id` bigint(20) NOT NULL,
  `module_id` int(11) NOT NULL,
  `mainmenu_name` varchar(100) DEFAULT NULL,
  `mainmenu_link` varchar(100) DEFAULT NULL,
  `mainmenu_seq` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` bigint(20) NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `advance_tax` int(11) DEFAULT NULL,
  `advance_amount` int(11) DEFAULT NULL,
  `earnest_money` int(11) DEFAULT NULL,
  `em_instrument_no` varchar(100) DEFAULT NULL,
  `pg_start_date` date DEFAULT NULL,
  `pg_end_date` date DEFAULT NULL,
  `pg_validity` date DEFAULT NULL,
  `pg_percentage` int(11) DEFAULT NULL,
  `pg_amount` int(11) DEFAULT NULL,
  `pg_doc` varchar(255) DEFAULT NULL,
  `project_doc` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `pg_instrument_no` varchar(100) DEFAULT NULL,
  `project_type_id` bigint(20) DEFAULT NULL,
  `keywords` varchar(1000) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `em_doc` varchar(255) DEFAULT NULL,
  `em_expire_date` date DEFAULT NULL,
  `project_status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `title`, `client_name`, `start_date`, `end_date`, `duration`, `amount`, `tax`, `total`, `advance_tax`, `advance_amount`, `earnest_money`, `em_instrument_no`, `pg_start_date`, `pg_end_date`, `pg_validity`, `pg_percentage`, `pg_amount`, `pg_doc`, `project_doc`, `status`, `pg_instrument_no`, `project_type_id`, `keywords`, `branch_id`, `em_doc`, `em_expire_date`, `project_status`) VALUES
(11, 'DMS', 'No', '2024-05-01', '2024-05-31', 1, 500000, 10, NULL, 5, 25000, 100000, 'tt4442f', '2024-05-01', '2024-05-31', '2024-06-05', 5, 25000, 'project\\DMS\\event (1).csv', 'project\\DMS\\Ref--No---CORP-8.pdf', 1, 'gr34431e', 2, 'f df sdf sf sfsdf sdfsf', 2, 'project\\DMS\\download.png', '2024-05-01', 'In Progress'),
(14, 'KMC', 'No', '2024-05-01', '2024-05-31', 1, 100000, 10, NULL, 5, 50000, 100000, 'tt4442f', '2024-05-01', '2024-05-31', '2024-05-31', 5, 50000, 'project\\KMC\\Tender Doc.docx', 'project\\KMC\\new_protal_pdf.pdf', 1, 'gr34431e', 2, 'qdqdqd  qdqdq  qwqwqd', 2, 'project\\KMC\\signature.png', '2024-05-31', 'In Progress'),
(23, 'Lexfirma', 'No', '2024-05-01', '2024-05-31', 1, 50000, 10, NULL, 5, 2500, 10000, 'tt4442f', '2024-05-02', '2024-05-30', '2024-06-01', 5, 2500, 'project\\23\\qr-code_a3trap.png', 'project\\23\\Employee Probation Evaluation Form.pdf', 1, 'gr34431e', 2, 'sf  fff  sf sfs sfs sff  sfs', 2, 'project\\23\\Tender details.xlsx', '2024-05-16', 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `project_type`
--

CREATE TABLE `project_type` (
  `id` bigint(20) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_type`
--

INSERT INTO `project_type` (`id`, `type_name`, `status`) VALUES
(2, 'Software Development', 1);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `id` bigint(20) NOT NULL,
  `region_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`id`, `region_name`, `status`) VALUES
(1, 'Karachi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `mainmenu_id` int(11) DEFAULT NULL,
  `submenu_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) NOT NULL,
  `skill_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `skill_name`, `status`, `employee_id`) VALUES
(1, 'Laravel', 1, 1),
(2, 'Node js', 1, 1),
(3, 'PHP', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `submenu`
--

CREATE TABLE `submenu` (
  `id` bigint(20) NOT NULL,
  `mainmenu_id` int(11) NOT NULL,
  `submenu_name` varchar(100) DEFAULT NULL,
  `submenu_link` varchar(100) DEFAULT NULL,
  `submenu_seq` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `template_column`
--

CREATE TABLE `template_column` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `title_without_braces` text DEFAULT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `template_column`
--

INSERT INTO `template_column` (`id`, `title`, `title_without_braces`, `table_name`, `field_name`, `status`) VALUES
(1, '{{name}}', 'name', 'employee', 'ename', 1),
(2, '{{email}}', 'email', 'employee', 'eemail', 1),
(3, '{{contact}}', 'contact', 'employee', 'econtact', 1),
(4, '{{degree}}', 'degree', 'education', 'degree_name', 1),
(5, '{{institute}}', 'institute', 'education', 'institute', 1),
(6, '{{education}}', 'education', 'education', 'education', 1),
(7, '{{skills}}', 'skills', 'skills', 'skill_name', 1),
(8, '{{certifications}}', 'certifications', 'certifications', 'certification_name', 1),
(9, '{{organization_name}}', 'organization_name', 'employment_record', 'organization_name', 1),
(10, '{{position}}', 'position', 'employment_record', 'position', 1);

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `id` bigint(20) NOT NULL,
  `zone_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`id`, `zone_name`, `status`) VALUES
(2, 'South', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_guaranty`
--
ALTER TABLE `bank_guaranty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Bank_guaranty_bank_id_71dbe6a1_fk_bank_id` (`bank_id`),
  ADD KEY `Bank_guaranty_project_id_1615d2ab_fk_project_id` (`project_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_area_id_e1baf9ce_fk_area_id` (`area_id`),
  ADD KEY `branch_company_id_5ee217db_fk_company_id` (`company_id`),
  ADD KEY `branch_country_id_56c0b082_fk_country_id` (`country_id`),
  ADD KEY `branch_region_id_b980afd0_fk_region_id` (`region_id`),
  ADD KEY `branch_zone_id_1db5bb21_fk_zone_id` (`zone_id`);

--
-- Indexes for table `certifications`
--
ALTER TABLE `certifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certifications_employee_id_950973f6_fk_employee_id` (`employee_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_module`
--
ALTER TABLE `company_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cv_template`
--
ALTER TABLE `cv_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `education_employee_id_3731f831_fk_employee_id` (`employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_department_id_4306dd33_fk_department_id` (`department_id`),
  ADD KEY `employee_designation_id_073f8843_fk_designation_id` (`designation_id`),
  ADD KEY `employee_branch_id_fabda6fb_fk_branch_id` (`branch_id`);

--
-- Indexes for table `employment_record`
--
ALTER TABLE `employment_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employment_record_employee_id_f04b202d_fk_employee_id` (`employee_id`);

--
-- Indexes for table `insurance_detail`
--
ALTER TABLE `insurance_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `insurance_detail_insurance_type_id_0da6039e_fk_insurance_type_id` (`insurance_type_id`),
  ADD KEY `insurance_detail_project_id_e98e04a4_fk_project_id` (`project_id`);

--
-- Indexes for table `insurance_type`
--
ALTER TABLE `insurance_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liquidity_damages`
--
ALTER TABLE `liquidity_damages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `liquidity_damages_project_id_87c36d78_fk_project_id` (`project_id`);

--
-- Indexes for table `mainmenu`
--
ALTER TABLE `mainmenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_project_type_id_44f37a37_fk_project_type_id` (`project_type_id`),
  ADD KEY `project_branch_id_ff91ab7b_fk_branch_id` (`branch_id`);

--
-- Indexes for table `project_type`
--
ALTER TABLE `project_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skills_employee_id_6086f136_fk_employee_id` (`employee_id`);

--
-- Indexes for table `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_column`
--
ALTER TABLE `template_column`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bank_guaranty`
--
ALTER TABLE `bank_guaranty`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `certifications`
--
ALTER TABLE `certifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_module`
--
ALTER TABLE `company_module`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cv_template`
--
ALTER TABLE `cv_template`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employment_record`
--
ALTER TABLE `employment_record`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `insurance_detail`
--
ALTER TABLE `insurance_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `insurance_type`
--
ALTER TABLE `insurance_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `liquidity_damages`
--
ALTER TABLE `liquidity_damages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mainmenu`
--
ALTER TABLE `mainmenu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `project_type`
--
ALTER TABLE `project_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template_column`
--
ALTER TABLE `template_column`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `bank_guaranty`
--
ALTER TABLE `bank_guaranty`
  ADD CONSTRAINT `Bank_guaranty_bank_id_71dbe6a1_fk_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`),
  ADD CONSTRAINT `Bank_guaranty_project_id_1615d2ab_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_area_id_e1baf9ce_fk_area_id` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `branch_company_id_5ee217db_fk_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `branch_country_id_56c0b082_fk_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `branch_region_id_b980afd0_fk_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
  ADD CONSTRAINT `branch_zone_id_1db5bb21_fk_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`);

--
-- Constraints for table `certifications`
--
ALTER TABLE `certifications`
  ADD CONSTRAINT `certifications_employee_id_950973f6_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_employee_id_3731f831_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_branch_id_fabda6fb_fk_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  ADD CONSTRAINT `employee_department_id_4306dd33_fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `employee_designation_id_073f8843_fk_designation_id` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`);

--
-- Constraints for table `employment_record`
--
ALTER TABLE `employment_record`
  ADD CONSTRAINT `employment_record_employee_id_f04b202d_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `insurance_detail`
--
ALTER TABLE `insurance_detail`
  ADD CONSTRAINT `insurance_detail_insurance_type_id_0da6039e_fk_insurance_type_id` FOREIGN KEY (`insurance_type_id`) REFERENCES `insurance_type` (`id`),
  ADD CONSTRAINT `insurance_detail_project_id_e98e04a4_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Constraints for table `liquidity_damages`
--
ALTER TABLE `liquidity_damages`
  ADD CONSTRAINT `liquidity_damages_project_id_87c36d78_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_branch_id_ff91ab7b_fk_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  ADD CONSTRAINT `project_project_type_id_44f37a37_fk_project_type_id` FOREIGN KEY (`project_type_id`) REFERENCES `project_type` (`id`);

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_employee_id_6086f136_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
