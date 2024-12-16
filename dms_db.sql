-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2024 at 06:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `account_type`
--

CREATE TABLE `account_type` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_code` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`id`, `title`, `short_code`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'Account 1', 'A1', NULL, NULL, NULL, 1),
(2, 'Account 2', 'A2', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` bigint(20) NOT NULL,
  `area_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(121, 3, 77),
(122, 3, 78),
(123, 3, 79),
(124, 3, 80),
(109, 3, 81),
(110, 3, 82),
(111, 3, 83),
(112, 3, 84),
(113, 3, 85),
(114, 3, 86),
(115, 3, 87),
(116, 3, 88),
(125, 3, 89),
(126, 3, 90),
(127, 3, 91),
(128, 3, 92),
(129, 3, 157);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(144, 'Can view zone', 35, 'view_zone'),
(145, 'Can add document_type', 36, 'add_document_type'),
(146, 'Can change document_type', 36, 'change_document_type'),
(147, 'Can delete document_type', 36, 'delete_document_type'),
(148, 'Can view document_type', 36, 'view_document_type'),
(149, 'Can add project_document', 37, 'add_project_document'),
(150, 'Can change project_document', 37, 'change_project_document'),
(151, 'Can delete project_document', 37, 'delete_project_document'),
(152, 'Can view project_document', 37, 'view_project_document'),
(153, 'Can add client', 38, 'add_client'),
(154, 'Can change client', 38, 'change_client'),
(155, 'Can delete client', 38, 'delete_client'),
(156, 'Can view client', 38, 'view_client'),
(157, 'Can generate CV', 9, 'generate_cv'),
(158, 'Can add employee_target', 39, 'add_employee_target'),
(159, 'Can change employee_target', 39, 'change_employee_target'),
(160, 'Can delete employee_target', 39, 'delete_employee_target'),
(161, 'Can view employee_target', 39, 'view_employee_target'),
(162, 'Can add employee_project', 40, 'add_employee_project'),
(163, 'Can change employee_project', 40, 'change_employee_project'),
(164, 'Can delete employee_project', 40, 'delete_employee_project'),
(165, 'Can view employee_project', 40, 'view_employee_project'),
(166, 'Can add leads', 41, 'add_leads'),
(167, 'Can change leads', 41, 'change_leads'),
(168, 'Can delete leads', 41, 'delete_leads'),
(169, 'Can view leads', 41, 'view_leads'),
(170, 'Can add quarters', 42, 'add_quarters'),
(171, 'Can change quarters', 42, 'change_quarters'),
(172, 'Can delete quarters', 42, 'delete_quarters'),
(173, 'Can view quarters', 42, 'view_quarters'),
(174, 'Can add sales', 43, 'add_sales'),
(175, 'Can change sales', 43, 'change_sales'),
(176, 'Can delete sales', 43, 'delete_sales'),
(177, 'Can view sales', 43, 'view_sales'),
(178, 'Can add journal_entry', 44, 'add_journal_entry'),
(179, 'Can change journal_entry', 44, 'change_journal_entry'),
(180, 'Can delete journal_entry', 44, 'delete_journal_entry'),
(181, 'Can view journal_entry', 44, 'view_journal_entry'),
(182, 'Can add chart_of_accounts', 45, 'add_chart_of_accounts'),
(183, 'Can change chart_of_accounts', 45, 'change_chart_of_accounts'),
(184, 'Can delete chart_of_accounts', 45, 'delete_chart_of_accounts'),
(185, 'Can view chart_of_accounts', 45, 'view_chart_of_accounts'),
(186, 'Can add payment_mode', 46, 'add_payment_mode'),
(187, 'Can change payment_mode', 46, 'change_payment_mode'),
(188, 'Can delete payment_mode', 46, 'delete_payment_mode'),
(189, 'Can view payment_mode', 46, 'view_payment_mode'),
(190, 'Can add account_type', 47, 'add_account_type'),
(191, 'Can change account_type', 47, 'change_account_type'),
(192, 'Can delete account_type', 47, 'delete_account_type'),
(193, 'Can view account_type', 47, 'view_account_type'),
(194, 'Can add currency', 48, 'add_currency'),
(195, 'Can change currency', 48, 'change_currency'),
(196, 'Can delete currency', 48, 'delete_currency'),
(197, 'Can view currency', 48, 'view_currency'),
(198, 'Can add detail_type', 49, 'add_detail_type'),
(199, 'Can change detail_type', 49, 'change_detail_type'),
(200, 'Can delete detail_type', 49, 'delete_detail_type'),
(201, 'Can view detail_type', 49, 'view_detail_type'),
(202, 'Can add heading', 50, 'add_heading'),
(203, 'Can change heading', 50, 'change_heading'),
(204, 'Can delete heading', 50, 'delete_heading'),
(205, 'Can view heading', 50, 'view_heading'),
(206, 'Can add sub_heading', 51, 'add_sub_heading'),
(207, 'Can change sub_heading', 51, 'change_sub_heading'),
(208, 'Can delete sub_heading', 51, 'delete_sub_heading'),
(209, 'Can view sub_heading', 51, 'view_sub_heading'),
(210, 'Can add tendor', 52, 'add_tendor'),
(211, 'Can change tendor', 52, 'change_tendor'),
(212, 'Can delete tendor', 52, 'delete_tendor'),
(213, 'Can view tendor', 52, 'view_tendor'),
(214, 'Can add unit', 53, 'add_unit'),
(215, 'Can change unit', 53, 'change_unit'),
(216, 'Can delete unit', 53, 'delete_unit'),
(217, 'Can view unit', 53, 'view_unit'),
(218, 'Can add boq_items', 54, 'add_boq_items'),
(219, 'Can change boq_items', 54, 'change_boq_items'),
(220, 'Can delete boq_items', 54, 'delete_boq_items'),
(221, 'Can view boq_items', 54, 'view_boq_items'),
(222, 'Can add item', 55, 'add_item'),
(223, 'Can change item', 55, 'change_item'),
(224, 'Can delete item', 55, 'delete_item'),
(225, 'Can view item', 55, 'view_item'),
(226, 'Can add category', 56, 'add_category'),
(227, 'Can change category', 56, 'change_category'),
(228, 'Can delete category', 56, 'delete_category'),
(229, 'Can view category', 56, 'view_category'),
(230, 'Can add vendor', 57, 'add_vendor'),
(231, 'Can change vendor', 57, 'change_vendor'),
(232, 'Can delete vendor', 57, 'delete_vendor'),
(233, 'Can view vendor', 57, 'view_vendor'),
(234, 'Can add tax', 58, 'add_tax'),
(235, 'Can change tax', 58, 'change_tax'),
(236, 'Can delete tax', 58, 'delete_tax'),
(237, 'Can view tax', 58, 'view_tax'),
(238, 'Can add boq_master', 59, 'add_boq_master'),
(239, 'Can change boq_master', 59, 'change_boq_master'),
(240, 'Can delete boq_master', 59, 'delete_boq_master'),
(241, 'Can view boq_master', 59, 'view_boq_master');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$oL0OdDOGLsnL9iAqoqm466$CsRnlsue4mofR0GGQI2+NX195XJUMrenMk2mqZ1twmI=', '2024-12-14 07:28:28.828040', 1, 'turab', '', '', '', 1, 1, '2024-02-19 10:18:22.000000'),
(2, 'pbkdf2_sha256$390000$wIduK5Jfq16OLdS3US7z5Q$9Ig2vHd8oJwrvYXAjfnwIwkgm2f6+6Ctbos2rjD+vNg=', '2024-07-29 11:42:22.266162', 0, 'danish', 'Danish', 'khan', 'danish@gmail.com', 1, 1, '2024-02-19 10:23:50.000000'),
(3, 'pbkdf2_sha256$390000$nHN3QkKDcnhijyLrOoNcE0$4CRmR83Xko/BUdnpzI2nlF2tPPkNCgsVKUzRqVSET4s=', '2024-02-20 05:59:03.000000', 0, 'rauf001', '', '', '', 1, 1, '2024-02-20 05:58:11.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(7, 1, 1),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `bg_percentage` double DEFAULT NULL,
  `bg_amount` double DEFAULT NULL,
  `bg_doc` varchar(255) DEFAULT NULL,
  `addendum` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_guaranty`
--

INSERT INTO `bank_guaranty` (`id`, `duration`, `instrument_no`, `bg_start_date`, `bg_end_date`, `bg_validity`, `bg_percentage`, `bg_amount`, `bg_doc`, `addendum`, `status`, `bank_id`, `project_id`) VALUES
(2, 1, 'vbcf4545', '2024-05-01', '2024-05-31', '2024-05-31', 5, 34555, 'project\\KMC\\bank_guarantee\\download3.png', NULL, 1, 2, 14),
(3, 3, 'lx123', '2024-05-01', '2024-05-31', '2024-05-30', 5, 2500, 'project\\23\\bank_guarantee\\db_erd.png', NULL, 1, 2, 23),
(18, 2, 'vbcf4545223', '2024-07-01', '2024-09-26', '2024-09-25', 5, 5000, 'project\\23\\bank_guarantee\\CORP.xx.08.2023 [name of client].docx', NULL, 1, 2, 23),
(19, 6, 'rrrr777', '2024-06-01', '2024-12-31', '2024-12-31', 5, 7000, 'project\\14\\bank_guarantee\\Ref--No---CORP-8.pdf', NULL, 1, 2, 14),
(20, 4, 'lx1212', '2024-08-01', '2024-12-31', '2024-11-30', 8, 10000, 'project\\23\\bank_guarantee\\23_bg_20240723120404.docx', NULL, 1, 2, 23),
(21, 3, 'IGT00380141724PK', '2024-03-19', '2024-06-30', '2024-06-30', 10, 8100000, 'project\\25\\bank_guarantee\\25_bg_20241119150235.jpeg', NULL, 1, 2, 25);

-- --------------------------------------------------------

--
-- Table structure for table `boq_items`
--

CREATE TABLE `boq_items` (
  `id` bigint(20) NOT NULL,
  `groupid` varchar(10) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `is_imported` int(11) NOT NULL,
  `conversion_rate` double DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `heading_id` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `sub_heading_id` bigint(20) DEFAULT NULL,
  `tendor_id` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `boq_master_id` bigint(20) DEFAULT NULL,
  `root_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `boq_items`
--

INSERT INTO `boq_items` (`id`, `groupid`, `unit_price`, `quantity`, `total_amount`, `is_imported`, `conversion_rate`, `created_at`, `updated_at`, `deleted_at`, `status`, `currency_id`, `heading_id`, `item_id`, `sub_heading_id`, `tendor_id`, `unit_id`, `parent_id`, `boq_master_id`, `root_id`) VALUES
(13, '1', NULL, NULL, 3600, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, NULL, 1, NULL),
(14, '1.1', NULL, NULL, 1800, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 13, 1, 13),
(15, '1.1.1', 450, 2, 900, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 14, 1, 13),
(16, '1.1.2', 450, 2, 900, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 14, 1, 13),
(17, '1.2', NULL, NULL, 1800, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 13, 1, 13),
(18, '1.2.1', 450, 2, 900, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 17, 1, 13),
(19, '1.2.2', 450, 2, 900, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 17, 1, 13),
(20, '2', NULL, NULL, 4000, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, NULL, 1, NULL),
(21, '2.1', NULL, NULL, 2000, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 20, 1, 20),
(22, '2.1.1', 500, 2, 1000, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 21, 1, 20),
(23, '2.1.2', 500, 2, 1000, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 21, 1, 20),
(24, '2.2', NULL, NULL, 2000, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 20, 1, 20),
(25, '2.2.1', 500, 2, 1000, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 24, 1, 20),
(26, '2.2.2', 500, 2, 1000, 0, 1, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 2, 3, 24, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `boq_master`
--

CREATE TABLE `boq_master` (
  `id` bigint(20) NOT NULL,
  `amount` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `tendor_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `boq_master`
--

INSERT INTO `boq_master` (`id`, `amount`, `tax_amount`, `total_amount`, `level`, `created_at`, `updated_at`, `deleted_at`, `status`, `tendor_id`) VALUES
(1, 7600, 400, 8000, 3, NULL, NULL, NULL, 1, 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `branch_name`, `branch_code`, `branch_address`, `status`, `area_id`, `company_id`, `country_id`, `region_id`, `zone_id`) VALUES
(2, 'Clifton Branch', 'HB00005', 'Doctor Plaza', 1, 2, 1, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'tested', '2024-10-30', '2024-10-30', NULL, 0),
(2, 'Metal', '2024-10-30', '2024-10-30', NULL, 1),
(3, 'Plastic', '2024-10-30', '2024-10-30', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `certifications`
--

CREATE TABLE `certifications` (
  `id` bigint(20) NOT NULL,
  `certification_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `certification_doc` varchar(255) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certifications`
--

INSERT INTO `certifications` (`id`, `certification_name`, `status`, `employee_id`, `certification_doc`, `expiry_date`) VALUES
(1, 'Web Development', 1, 1, NULL, NULL),
(2, 'Project Management', 1, 1, NULL, NULL),
(3, 'Mob App Development', 1, 1, NULL, NULL),
(4, 'Web Development', 1, 8, 'employee\\8\\certification\\8_certificate_20240711114337.jpg', '2025-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_code` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `account_type_id` bigint(20) DEFAULT NULL,
  `detail_type_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `title`, `short_code`, `created_at`, `updated_at`, `deleted_at`, `status`, `parent_id`, `account_type_id`, `detail_type_id`) VALUES
(3, 'cash and cash equivalent', 'cc', '2024-09-10', '2024-09-10', NULL, 1, NULL, NULL, NULL),
(6, 'Sigbl HBL Tariq road', 'SB', '2024-09-10', '2024-09-10', NULL, 1, 3, NULL, NULL),
(7, 'Expense', 'ex', '2024-09-10', '2024-09-10', NULL, 1, NULL, NULL, NULL),
(11, 'Electricity Bill', 'EB', '2024-09-10', '2024-09-10', NULL, 1, 7, NULL, NULL),
(16, 'Parking Fee', 'PF', '2024-10-22', '2024-10-22', NULL, 1, 7, 1, 1),
(17, 'Cost Of Good Sold', 'COS', '2024-11-19', '2024-11-19', NULL, 1, NULL, NULL, NULL),
(18, 'Aptech Distribution', 'AD', '2024-11-19', '2024-11-19', NULL, 1, 17, NULL, NULL),
(19, 'Askari General Insurance', 'AGI', '2024-11-19', '2024-11-19', NULL, 1, NULL, NULL, NULL),
(20, 'Insurance Premium', 'IP', '2024-11-19', '2024-11-19', NULL, 1, 19, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` bigint(20) NOT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `country_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `client_name`, `email`, `phone`, `address`, `status`, `country_id`) VALUES
(1, 'CPO Karachi', 'jack@gmail.com', '02213231231', 'II Chandigarh road Karachi', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` bigint(20) NOT NULL,
  `comp_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `comp_name`, `status`) VALUES
(1, 'SI Global Solution', 1),
(4, 'test', 0);

-- --------------------------------------------------------

--
-- Table structure for table `company_module`
--

CREATE TABLE `company_module` (
  `id` bigint(20) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` bigint(20) NOT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_name`, `status`) VALUES
(2, 'Pakistan', 1),
(3, 'China', 0);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `country`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'PKR', 'Pakistan', NULL, NULL, NULL, 1),
(2, 'USD', 'United State', NULL, NULL, NULL, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `design_name`, `status`) VALUES
(1, 'Frontend Developer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_type`
--

CREATE TABLE `detail_type` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_code` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `account_type_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_type`
--

INSERT INTO `detail_type` (`id`, `title`, `short_code`, `created_at`, `updated_at`, `deleted_at`, `status`, `account_type_id`) VALUES
(1, 'Detail1 A1', 'D1A1', NULL, NULL, NULL, 1, 1),
(2, 'Detail2 A1', 'D2A1', NULL, NULL, NULL, 1, 1),
(3, 'Detail1 A2', 'D1A2', NULL, NULL, NULL, 1, 2),
(4, 'Detail2 A2', 'D2A2', NULL, NULL, NULL, 1, 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(21, '2024-05-23 07:20:18.400899', '3', 'Manager', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(22, '2024-07-09 09:55:15.491925', '3', 'Manager', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(23, '2024-07-09 09:55:21.391881', '3', 'Manager', 2, '[]', 3, 1),
(24, '2024-07-09 10:59:45.596453', '3', 'Manager', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(25, '2024-07-09 11:01:10.691946', '3', 'Manager', 2, '[]', 3, 1),
(26, '2024-11-22 05:43:19.145646', '1', 'turab', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(38, 'employee', 'client'),
(7, 'employee', 'company'),
(8, 'employee', 'company_module'),
(34, 'employee', 'country'),
(9, 'employee', 'cv_template'),
(10, 'employee', 'department'),
(11, 'employee', 'designation'),
(36, 'employee', 'document_type'),
(22, 'employee', 'education'),
(12, 'employee', 'employee'),
(40, 'employee', 'employee_project'),
(39, 'employee', 'employee_target'),
(24, 'employee', 'employement_record'),
(21, 'employee', 'employment_record'),
(29, 'employee', 'insurance_detail'),
(28, 'employee', 'insurance_type'),
(41, 'employee', 'leads'),
(30, 'employee', 'liquidity_damages'),
(13, 'employee', 'mainmenu'),
(14, 'employee', 'module'),
(27, 'employee', 'project'),
(37, 'employee', 'project_document'),
(31, 'employee', 'project_type'),
(42, 'employee', 'quarters'),
(15, 'employee', 'region'),
(16, 'employee', 'role'),
(17, 'employee', 'role_permission'),
(43, 'employee', 'sales'),
(20, 'employee', 'skills'),
(18, 'employee', 'submenu'),
(19, 'employee', 'template_column'),
(57, 'employee', 'vendor'),
(35, 'employee', 'zone'),
(47, 'finance', 'account_type'),
(45, 'finance', 'chart_of_accounts'),
(48, 'finance', 'currency'),
(49, 'finance', 'detail_type'),
(44, 'finance', 'journal_entry'),
(46, 'finance', 'payment_mode'),
(54, 'project_initiation', 'boq_items'),
(59, 'project_initiation', 'boq_master'),
(56, 'project_initiation', 'category'),
(50, 'project_initiation', 'heading'),
(55, 'project_initiation', 'item'),
(51, 'project_initiation', 'sub_heading'),
(58, 'project_initiation', 'tax'),
(52, 'project_initiation', 'tendor'),
(53, 'project_initiation', 'unit'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(31, 'employee', '0013_alter_bank_guaranty_bg_doc_and_more', '2024-05-17 12:21:40.475251'),
(32, 'employee', '0014_document_type_remove_project_client_name_and_more', '2024-06-21 05:19:42.716333'),
(33, 'employee', '0015_project_document_remarks', '2024-06-24 11:59:09.844384'),
(34, 'employee', '0016_certifications_certification_doc_and_more', '2024-07-11 05:07:34.597501'),
(35, 'employee', '0017_alter_education_grade', '2024-07-11 06:40:11.686546'),
(36, 'employee', '0018_employee_target_employee_project', '2024-07-26 06:22:47.449787'),
(37, 'employee', '0019_rename_quarter_target_employee_target_quarter_first_target_and_more', '2024-07-29 11:35:02.716578'),
(38, 'employee', '0020_leads_quarters_sales_and_more', '2024-08-19 12:09:47.916239'),
(39, 'employee', '0021_rename_quarter_id_employee_target_quarter_and_more', '2024-08-19 12:13:18.245393'),
(40, 'employee', '0022_employee_target_sales_target', '2024-08-20 06:13:23.662467'),
(41, 'employee', '0023_alter_project_lead_alter_sales_lead', '2024-08-22 11:27:42.686637'),
(42, 'employee', '0024_leads_lead_type', '2024-08-24 06:00:47.637928'),
(43, 'finance', '0001_initial', '2024-09-09 10:25:58.705942'),
(44, 'finance', '0002_rename_parent_id_chart_of_accounts_parent', '2024-09-10 10:07:02.046795'),
(45, 'finance', '0003_alter_chart_of_accounts_parent', '2024-09-10 12:19:29.524695'),
(46, 'finance', '0004_alter_journal_entry_coaid_and_more', '2024-09-10 12:26:37.404675'),
(47, 'finance', '0005_payment_mode_journal_entry_bank_and_more', '2024-09-16 05:03:36.560376'),
(48, 'finance', '0006_remove_journal_entry_category_type_and_more', '2024-10-04 11:38:38.503284'),
(49, 'finance', '0007_journal_entry_description', '2024-10-15 09:48:10.804851'),
(50, 'finance', '0008_remove_journal_entry_region_journal_entry_branch_and_more', '2024-10-16 07:02:26.572384'),
(51, 'finance', '0009_account_type_currency_and_more', '2024-10-22 05:20:56.582462'),
(52, 'project_initiation', '0001_initial', '2024-10-29 06:39:40.587604'),
(53, 'employee', '0025_project_document_issuance_date_and_more', '2024-10-31 07:11:12.134997'),
(54, 'project_initiation', '0002_tendor_adpscheme_no_tendor_client', '2024-10-31 07:11:12.235230'),
(55, 'employee', '0026_vendor', '2024-10-31 09:49:20.888680'),
(56, 'project_initiation', '0003_tax', '2024-11-07 07:11:46.924529'),
(57, 'project_initiation', '0004_boq_items_parent_boq_master_boq_items_boq_master', '2024-11-15 06:43:41.992937'),
(58, 'project_initiation', '0005_alter_boq_items_groupid', '2024-11-15 06:52:34.953290'),
(59, 'project_initiation', '0006_boq_items_root', '2024-11-19 07:17:30.494691'),
(60, 'employee', '0027_alter_project_country_alter_project_em_receive_date_and_more', '2024-11-20 05:36:15.915224'),
(61, 'finance', '0010_alter_journal_entry_amount_and_more', '2024-11-20 06:13:14.056757'),
(62, 'project_initiation', '0007_alter_boq_items_conversion_rate_and_more', '2024-11-20 06:13:14.560034'),
(63, 'employee', '0028_alter_bank_guaranty_bg_amount_and_more', '2024-11-20 06:26:36.281685'),
(64, 'project_initiation', '0008_alter_boq_master_amount', '2024-11-20 06:26:36.347990'),
(65, 'employee', '0029_project_close_date_project_closing_doc_and_more', '2024-11-21 05:32:02.971879'),
(66, 'employee', '0030_alter_project_advance_amount_and_more', '2024-11-21 06:28:05.143120'),
(67, 'employee', '0031_alter_project_pg_instrument_no', '2024-11-21 06:29:48.848665'),
(68, 'employee', '0032_sales_sale_date', '2024-12-11 10:24:06.821630'),
(69, 'employee', '0033_leads_client_leads_title_employee_project', '2024-12-11 10:24:07.069849');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('07zx6x2883atze7kq9ajmmwqueuxwhuv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwENd:E2KEMg1ZkjWPFcnh3CR9Sn01h7sOK-UUO4q6aXjfGZc', '2024-04-15 05:45:45.831294'),
('0fe3e5bf3xo3nimzm9hzptxioypjorgi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjx6W:mVAFvxzU0r4fV4mknWomezvM44oIHbSK0Z05NALC1gc', '2024-03-12 08:53:20.867828'),
('0ftf9ra839ggoz1hac0d0q55zzbmkhof', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sbCC7:FBqYndDYQGCaaeIfNFRmQ0sK5JecWe4D23otgcjTl6g', '2024-08-06 07:53:11.009120'),
('0jpbxauwzue1p26vezdee9dxx29saeky', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1socMj:1UO54XaRyGHWne-REAnwVm29TIXPUqDKpSjVu1cIHfc', '2024-09-12 08:27:37.103057'),
('0jvdz0l4k3mwvg2mb5emlraycplrsowf', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwcDb:COEWceiZERq8DEU3AcyeJ65aKuhDYhUm1PtUvZxIoTQ', '2024-04-16 07:12:59.928798'),
('0snxvroyke6rqq7i44ma8l2ugjvvggg6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sCuR0:CXaJA6Tmmc9vEYUxFzlejyp-8a7h9L13VuCQM472BlI', '2024-05-31 08:04:10.693742'),
('0und978hnyp5y0zsrznre9gh1563enph', '.eJxVjMsOwiAQRf-FtSHAdCi4dO83kIEZbNXQpI-V8d-1SRe6veec-1KJtnVI2yJzGlmdFajT75apPKTtgO_UbpMuU1vnMetd0Qdd9HVieV4O9-9goGX41tZhdCZIJKDQCWMGl4PJFriSr96IMbF4jIgcyPoOXN8LVwMFPIZOvT_MNjcU:1rcJ9j:ldWDGP2JuaWDvAHJW_wW3QSrxKCz1__CDP5CmcBH6vQ', '2024-02-20 06:49:03.286594'),
('0w4vzjf60gos4nf1cl3w4s00jcximtup', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfDQE:PvU6dcpIxZewXCPlYUz120pmfCCcqGzDU5LsyS77yk4', '2024-02-28 07:18:06.123342'),
('0y8g3nc1x26b8gyra2ynogznbee8xmo5', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rdNXb:0WrmG8ggXF6uLQ5sakMjAaL_DrGX1UYbYOsKYNCM4e8', '2024-02-23 05:42:07.634153'),
('12u7icdm0cyo4cr3y3i5368ffukuj32c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t0DHQ:p2EZf9up36Pd8BiaSOWCIzer6FzQRprpzFBYvAOD47Q', '2024-10-14 08:06:04.731465'),
('14335kftmh88egn0ia930vzbvnvo6if3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpi4f:cRdKrwtiOW2DOlKdoKzf_VePMZi40YaYOfooT0ovE50', '2024-03-28 06:03:13.204772'),
('1htsm5jh7y3dp2ieag2i67g4so1v8jk0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t0gHW:wGA2AiM4YkAMUPPe32EjoCaTjBBc_29lZ5YtsmA-540', '2024-10-15 15:04:06.706338'),
('1kmq8fxxpiygrlzzw2k31vyxae98zslp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1swDcH:Mb3HqXcKLhzmQB6sB85D4q-_sWFqYPeRT_4BH8EX9_w', '2024-10-03 07:39:05.023576'),
('1t9bl1elv0vi0c8b4zqksxumc038scu4', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tAl3Q:JpvxiVicWa_KfRAmwBjOxJCbJB4LWYbJ6U9O2DinXSc', '2024-11-12 10:11:12.783805'),
('24cb51bv8m2xeriuqtu2eox69cyhgipb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1retqk:cCEL8YjoyAhkCf77YC_7F8TR4FEgJX6jzVuaTAjPSgw', '2024-02-27 10:24:10.895973'),
('24dk0rvxza9ovo02byn9mi5hrrcybgwr', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sMgm0:643x8Z3G_x1lybdbWD2UjNjOrmVNj603H0NY_84VzgI', '2024-06-27 07:30:16.519646'),
('26yphhawyey6wwgjcpxt9fvgs9uytfdc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd3Uw:csDyYEfPoPlnf7zR1PPhbNhSDtWYh7OJWXECGfpeSy4', '2024-02-22 08:18:02.171490'),
('298bxybnh7rs8hl1dp7khn0ylwjl002h', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rl1FL:qPesLAmIwm4zg4k6cdTdrftt5xoPqDzq0riOUKBoS7I', '2024-03-15 07:30:51.164046'),
('29ka2sisdafkwgsr9hp1albzqqxadx4s', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tLHOK:SeNo8YZf0wZqGRWq_3mgDYRYVxX6Wi9lHFsD18v42r4', '2024-12-11 10:44:16.748870'),
('2e6yx21b0jlv8efzzw2mxm0vq75cvfod', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk9VT:HGv4LUR5Sntplg3shXS3zNhveIEvc5wR4-g49BUe9Do', '2024-03-12 22:07:55.888323'),
('2jqz6bu3zvserhk9v68p8sqgt7rjz1in', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sRpxI:CUzvuk1dHVNhVU4DKLDnI7RyYQUnjEy9niaSdm54xxI', '2024-07-11 12:19:12.152158'),
('2r2kqtnod1dm6t44iiwbdtkyqdlamut5', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1scJLh:FexEJgt1cjBcbv4VQw4cunoTlEcKdf9MelqXtvlCrb4', '2024-08-09 09:43:41.860997'),
('2swhde8swdkiun85jzlpu06v6qk9tjev', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sVp3q:VBlpNnniis_09Su95aB4dtgodPXvKNYJZs3-Tv_sHYg', '2024-07-22 12:10:26.959175'),
('2wu42maixc7s5ja39nsglbmkpplqeghd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sZ5TV:qTSXjMtWiNxdTcAKSTbRFWe1XCoNoM2-cKuzzoDo6wU', '2024-07-31 12:18:25.759428'),
('31hoj009wslx4qj10p02p73c1hdlaxtq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rckRi:tHBV3-hvCySZGkwreZ_NnKK7V0LRMyVNOb0x_g5Or78', '2024-02-21 11:57:26.791694'),
('34zon77jarvazy9of8ok7h1cwmgs0zvc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk0VP:eAB-pH_1MZc7thThh_LIQzSYdgPzPZfXLdwKFfQvFMI', '2024-03-12 12:31:15.905277'),
('38vpwil2w3p1k3jkx10cbpcxgjof1y8x', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sF6DA:6h1qlaLqEKQ2WjczCKh1WnrINAUudhbGXdhWF5EIWbU', '2024-06-06 09:02:56.454074'),
('3ciubmalajura7m8ix3xg0nptpinl4ml', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s0DrA:i5eMzuN676q7AlmeE59YltUcxINpKpX_9oe5xlXIntI', '2024-04-26 06:00:44.146393'),
('3e74wc4xx4p8rx3bvmzqwztw86wgoohv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s3rTd:h-5E7zxDiB4jQTbSbrJecJ-t2jNkjyd0-Q8IdvJh754', '2024-05-06 06:55:29.794982'),
('3np6cp0c754xk2kz16atiohpb0rri91x', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmTXw:VW2tQMFeiJYGQWcD17uOGOippyZ0jzHFgWU7O-5EkOg', '2024-03-19 07:56:04.575582'),
('3u6fteopup8wizcj7cfpbkpgva2zacf6', '.eJxVjEEOwiAQRe_C2hAoHRCX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5Vsry8OAZ1YEbAlGlaPXmSEZMFYbRzwaG0FrMJgjxERee3KYnM3oFIn3B-KgOCs:1t4CfW:vVOoHEiU7W4pmo7VMm6sUy9sO3tqfRdIfU293snozLs', '2024-10-25 08:15:26.000000'),
('3xcdrmzci04wz87dmhrsbwqjwoe6ls77', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkeJr:lIrlgfuJieRU7l3_i0Q-rKZHFfOqdXBc9rhy2DYGqvc', '2024-03-14 07:01:59.135374'),
('417x8a213o3hyzkln1ra9udp9b2balwi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1seqLw:UQZXoZXK5K5xY7Bi2dxGZYzaB7BbTA3FWvOkPjWwsZY', '2024-08-16 09:22:24.933035'),
('41cv6wc1rl7mzts107gna3kuf0k0t995', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sjH3f:wLtOoGTrET3E_aQiWp4mtvuvr3wyXDMsRV4QVAUAMYQ', '2024-08-28 14:41:51.995705'),
('430vc2zlov78vljaro51aarlngu1opmc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1stJl0:dWCwWl_y8mk5X-MtR0WBfWxedfIhn-hEqNF6X69msMw', '2024-09-25 07:36:06.263876'),
('4577un4k7xlisv7o4fw1fakjy7ccj0kb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1skzhs:k0I5d8DsPqyf8YYvR096BMmfO0d43uFUv1qyGBWG4sI', '2024-09-02 08:34:28.269708'),
('4635z0328tka9f0i16ha2zo24gnu9bqu', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t9Guj:nSXUsifLikYEV8XzM99QJCsjYF1LS5Z5MuQb8KNYRW4', '2024-11-08 07:48:05.233859'),
('4638du1oea02fq4nuvi11nntiw4dlnnc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sbzN9:kvqC2khS-8L8sCJYYpZa-ofsFbC4l1_T-lqcS0M8an8', '2024-08-08 12:23:51.726917'),
('4ap2vmfs72bquik9f6q1bpgw0euwv1sl', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpjgX:v6e6lV0IINxLidmguZAptbLQIBAAt4MKyfjJRZGCBjs', '2024-03-28 07:46:25.032244'),
('4i7ep5yaxy5lyq5swf8we247y9f01b03', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rof9l:dtuAscKB6JU0S2OuS-DTl4sX0tkYupdi89H8zRVQHBs', '2024-03-25 08:44:09.151996'),
('4j6o16a2ubby2got4jrs2prd876c86sh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd1I0:Qhx4nH_d6qPaKPE3RR-Er2EZH1qYQVVpWPUM8o4PbN8', '2024-02-22 05:56:32.139209'),
('4rqspjmikkyfjomxpuuy6n9ik58a3l7z', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t1elt:USV7pM5kQTlYTlRbuS_KcVE1N9zbIJJrh4hVyDav3VI', '2024-10-18 07:39:29.469669'),
('4xwvytteuz7u2fxba14twcz86kc80lgs', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sgzfM:WMAObozQag0Zts7TH7Ha-tmXYjFYDx7Vc0cnNuH1esc', '2024-08-22 07:43:20.047598'),
('4yat6mhjtngpzomhpu11xpxr1ssnk4fc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sjwA8:ATj7C5jvKXB64I2EH90aeJ2iZUmswn8SJ1BMZpSsQcU', '2024-08-30 10:35:16.453061'),
('4z7t5lkecbdtxm2jw3du6gdo3x3snuw9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd2hU:ie7gFwsu4LzzkNKohG4NrqMZbIPgdqWYZpbQFVOr-1c', '2024-02-22 07:26:56.281295'),
('5c2gmme117u4y6qodx8bn4iz1bahaem2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOWHc:7mZOUaZBMYMl2w_MQF4x3bLjpkrQK0xHzMnlk3JyYJY', '2024-07-02 08:42:28.573713'),
('5izm4ugy2p5ruqfxfhw81p61j4q81ioe', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjXyy:hiahnpmqbfShLwcIDNR3xdNt780nt39djgdWKkQYEAI', '2024-03-11 06:03:52.972776'),
('5kfnxs2xh7t8hr25zk4iawc5pb9arbaq', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tENav:udi5S6TF6uQcIJi0GxlsKWbCLjxvar_oJp2feCEybyQ', '2024-11-22 09:56:45.471992'),
('5neyppat4p90qzwkgd8w4udmoebe2aud', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rxK7P:GzNtDo800tjpOqaiaVjU7qwm5UjDZoZ_usgx1hBsK98', '2024-04-18 06:05:31.121702'),
('5nxji97gnskyntthu724cht7fwzjsmbh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sRPDc:VGGitrXCYZaJHz3tGOGLFjaAbOfKYbgIn-5lzaUy6C8', '2024-07-10 07:46:16.406795'),
('5vbs2oytj1gs5bw0qagrgq6mzkdap8bo', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmVS8:RLOMcBG62u3Oe-gtUTG2nL21mKF4wtO0S-j2ug2I6wg', '2024-03-19 09:58:12.016461'),
('5x1z46kkwhe20u1y5owhetjyhhil0yh3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rsGiw:Jbk2PJqWMwTzwZf3d7MJfBcZ80Hdo-lf6ieR3fk4Zfw', '2024-04-04 07:27:22.715107'),
('5z3ztc83qc9ve5zi5gs6htu1mmn6ki7b', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1soFWm:ITRt-19IYPqO75b363C_IwOjyVAG4jPPSmZaAo01W58', '2024-09-11 08:04:28.484590'),
('62flhudhy4d9r90b6hj8kximcxu6ulpv', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tEN1j:3dDqrGl4rcgLtsxzw5yiEjWQX6YBEp4BBc4H7QCDjkA', '2024-11-22 09:20:23.653637'),
('636blhy87brc5xmawkx1cyazvfcx2vx7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1snbbV:x5y-3P8lW8tfpzxsdbjN986C9mLu_LmGYYfGQhRHDIc', '2024-09-09 13:26:41.490802'),
('64fspaf2jw4h70b5oe8v9y9urpe78olh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpira:zJMo5FFzk-g3CrPb4pEffK19WwbQxrFU8mdjz06TV2Q', '2024-03-28 06:53:46.185752'),
('68cwmd2vb1tgy0djeqfd6d6l5c4v8rgv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sgHXz:CSJZI_RnwUctuNflKC8lorsaRPJcFeWth3UMgNvss5k', '2024-08-20 08:36:47.546326'),
('6apwe8aac6rd9r754awwzgszvhbfoqt3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t3Cdo:QYet2LE9zIpcLVGizYoEvRQEYx_dFFRBwbwND_TrkoQ', '2024-10-22 14:01:32.780935'),
('6camtupfpbyyfd3p5cz1wsm8rbh5r1fu', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwFgO:xYpLZ7vLdhfcG-slx3lbtyPJtb4LMy5SNGNlQuo0XTU', '2024-04-15 07:09:12.190096'),
('6hyftrt7s0aw1dwzg94yfthq75du5u9x', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tDiRM:f5EAfAvDaTE7SZafEL5uD9vh8dxxmvmH7U7rmXCcdUc', '2024-11-20 14:00:08.297938'),
('6iivu7ee0b2kgf35z7nylyz9g8fzprw5', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmSbV:N7QDT0OP34iDjlfYIMTFamJ6unfGockyM21Cc2iwpJQ', '2024-03-19 06:55:41.917182'),
('6rgztgyp9cfraj904tgc6kgdf7wp1gk8', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOymO:t7QIez-BFvEtJgsVjuZMX6QhEclTVYYo_XXxhTP1Hd4', '2024-07-03 15:08:08.624600'),
('6t4g4xhfbcj3n710mhbghovn5tboh482', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpPpu:fgbLO7b_sdZOGl_5N4636P2TrPBjKB3Iw971sz2YO4A', '2024-03-27 10:34:46.176869'),
('6uiow4rxgjaxrcacn4oqh0n3hkz2if3c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1riSZv:81gMJ_ndofKMLrvgj3BKpEDeChZzpTZYyweTHKRmLKs', '2024-03-08 06:05:31.842622'),
('6v0ed7l4bmr70160ogpcg3s0d8olrzut', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t8eAE:8WE5rzQGcsesYh2n8rvdraG4ju8PCUiX22ATa2ZFNQU', '2024-11-06 14:25:30.339481'),
('6xnmaofq6kh4v4hsgusjcpyyqeqvllz0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s3uhk:d2cSrt_rjv5jpYqgo6btdh9yDWSvGce0eAyFoB_MUwQ', '2024-05-06 10:22:16.480499'),
('70w0lq2dmz7mq6gk94puntuhmhjc5vhf', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sBTXJ:WF_WQrfpi7cbY6QIQZGkXqxewT0T10CnGrxKlaZkbi4', '2024-05-27 09:08:45.564665'),
('7g31ho4tz0f2vmilkrrys2nxrx79u8ir', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sGtt9:yQYJ0oYVeWOZW3g_D4wzAmsNSdFB7AmDrah9-TUWFpo', '2024-06-11 08:17:43.685840'),
('7tw9sr7xwgxuou8wql5mttqhmvvzp9ff', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwdDZ:XmpfV9HpfP1N3191MYEqkSSxyWAZg3JnAymHj8WIgTY', '2024-04-16 08:17:01.830873'),
('7xt3vilffapq5dsr1jlt8hlddviz27cq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnAF4:a-_CUMHXH_Ezj5Tvm0j84cSjcki9_tA2HHzRo044C6Q', '2024-03-21 05:31:26.777192'),
('7zn8t0tgom4prug97anvocz8d718kblt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjxux:5-6HsnwKZYPN-dRJg5TKeXtFtZI-3fI2rmHipjI1Wos', '2024-03-12 09:45:27.292809'),
('8148u16pzcalsqw1pbzkmj16wkb5yotk', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rti1R:cim5LiSBIuI0k0A2p7BbNeR14XJnUM-CugPkqnnLU5g', '2024-04-08 06:48:25.658112'),
('83y55sqwo5f1njaasy40unlnsxxltrqi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk4yh:rBW7-yaZYQ445-iIgPXos9Q4wQbOoBdSXxC8KH-sV30', '2024-03-12 17:17:47.944459'),
('87uty74d0v656cc3xr4uv3xhcfyfgq7q', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnWee:aP-LrntHYQESfoxE8RboxiHcrhA0n0rLPrhcDNzRcKA', '2024-03-22 05:27:20.381179'),
('8ecrxors5iml7e7ie4fpwdsjh1c11cuh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1swxS9:6q5jJBTbPy6ZYoj_liSMx8MpFxMXBHn3AefSE6i5GFs', '2024-10-05 08:35:41.729030'),
('8h0wehbzgg7e29b7kr7prmwyigll6czy', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sMPEA:PNA0iXUbJZAH-FGosiI-cuOy4xKDjBMplZvGTVLIwUE', '2024-06-26 12:46:10.557556'),
('8l2fekz16e96mi4aeovmcbseskgazwq9', '.eJxVjEEOwiAQRe_C2hAoHRCX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5Vsry8OAZ1YEbAlGlaPXmSEZMFYbRzwaG0FrMJgjxERee3KYnM3oFIn3B-KgOCs:1t5Hro:vM4BAxBhOKpJjN_A0IXFPWERc3ZhRpWuuoUySrftpFY', '2024-10-28 08:00:36.000000'),
('9a090hipd9lv8c77py4kxhtnvuf0h1cp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sXDla:rnxAPazTGmOL_F0wH7e7eetONiA8YBHowvV6QhwhQ4s', '2024-07-26 08:45:22.613033'),
('9l56zojspd1gtc6ogg5qu74w67jc70tz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1seT60:YNAgBhwSBQM9SdIGrrGJi1Y6Nyx25uKJBEX2-4eC0w4', '2024-08-15 08:32:24.819172'),
('9p5cue9g2f68luqo4gbsq3ogcpkncy1v', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tLdFX:XF1oXians22g77S2IGnQ7F4mEY5vz-CVH19q-NPyni0', '2024-12-12 10:04:39.317759'),
('9ts166q00whurepaiq74ggm8tb9943q2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sgeHQ:QuM086sF8k6-OKREDZ8iwZ6fPrj2Vs5_IQ-x8mTwgdo', '2024-08-21 08:53:12.795202'),
('a1ysylsg08lv28tmlk3poemxpgvibs66', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm7RU:u6mYn3nuFK7lRjydh2fUVtED9OWEFV3mMouMTjTrjbI', '2024-03-18 08:19:56.709704'),
('a7951pp7lrxezmzf86u9jktny4bo4t4e', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rju09:mlplo9iIoZU_EBlWYfQ6afYaUz4Ubyi9EuTNldbDeo0', '2024-03-12 05:34:33.243006'),
('a7dkjozyrcn0rtmqrerdsktotmamrh7i', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sW8jr:CvoJwQ-33N-xeA3RzRvkUIJwdWVtFSY63-X7sjhlPtA', '2024-07-23 09:11:07.810947'),
('a7n0o32jd5rkv5jtc2p2v5xb4syggoq0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk5ld:2eet6kX_DwcsgI3FFp5UXW-HcVsQfItoccL-FpmPbuw', '2024-03-12 18:08:21.905621'),
('a86ci30hy42n6ll3afsuqw3eqrj94bxu', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t1IGM:9XQXmoL4SrYJqrifA4eCQJ0HbECIWsFkWqrPDPw-DP8', '2024-10-17 07:37:26.224673'),
('ae2mf90x0pe27iezq6x32fkirf11qe6k', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sN3Hd:26AQ4Lp5W7ssoxdUu-mh7vb5MTBHzkeRzbjl5MH7nMw', '2024-06-28 07:32:25.510667'),
('am4v0ppvxuzm1kufm2m279lsi3zr6vm7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rq47n:h3zoVNPvvYMbNq1ZYZ-nUtf7kcagKaokb0ysH5sPr4g', '2024-03-29 05:35:55.481508'),
('aqjuqe5ivp9v10zae1ycqkhvlc3ipx12', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t1LE6:dJcWOxHzG3-cH3IVqfnO1h73S3osJau70uWwKbrRNw0', '2024-10-17 10:47:18.287098'),
('atdf77djbvg5d3vpkojhow6scrxivm8t', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sy4x7:GGAb5bcYhL38-mIdX8eM6qL0rEB1wm_yQFKUmhJqDJI', '2024-10-08 10:48:17.059910'),
('azoypnuq3vinlnf4qs0utsx0uy2ufv6d', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rl0Rv:CfF-gURCb4a9Z9TOMj86QszjloLqyBS-2W-J_BfxIn4', '2024-03-15 06:39:47.983253'),
('b1gqustwbfmxf39afr10yfmeofeu4bu4', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sANf4:jojBPChwrZI_U9aXIrtvBAnJD-9JRA2N0Es_ImOnutE', '2024-05-24 08:40:14.962682'),
('b89b76ogo3pvo085mqy24ujdjjtwzpfv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfYjf:bV0sy6yhIpqxICsf5PHGRKIFJZtD3swCraisU5TzgNc', '2024-02-29 06:03:35.458415'),
('bc104ni4vaat7n1jmfspdloyl30s90qp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7CI3:I_l1VnKVX1UCGckLIjXW1ADHeSeHORQUSKxvxamomKQ', '2024-05-15 11:45:19.800451'),
('bcfkzql4pql0v6ydpqwx7sy1d96ebfhj', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s8vQJ:JSNfZd4adK3Dj5Mw8P3ZzRDIXuE6d6qt3qjm0epxWVM', '2024-05-20 08:18:59.709870'),
('bcirzeek72ti0evhll6yuw7hnayzzy72', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sDzat:dnNZXruvfPlgYnmCA44xO2usjL2rFapiDUl1llDPJTU', '2024-06-03 07:46:51.720019'),
('bhvu1jmxbgggeoa9ug79e6rossczxvj1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sq82Y:eFH7DagTzQfR6ZFP5ldPgVvm3KG3-e7o-Wfsr0c2-iI', '2024-09-16 12:29:02.508407'),
('bihutbwss0l0fg3hs1yl0mzcoosbio74', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t5fuv:VrwYPcVoF1xjWID72an0Hq8RwsGA81H_ySc_onIGkKw', '2024-10-29 09:41:25.862021'),
('bis2363pys5627qn6ju0gvetk7454pfe', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkI4B:Sw4a_o2IdbdmZs3qoGR7LcQig4BEaVW4shSKhEip548', '2024-03-13 07:16:19.661937'),
('bjltyv0zcxtbub1aekqpq47cyh7hbu1n', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t0xjT:d977ADy_jBmMUKog5tsJVFYuvOuU-0lWrgvA8ZVsvDo', '2024-10-16 09:42:07.337119'),
('bou3prplaacwy2kf5kaekk8ztw6ygym3', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t611A:MhY5O2jyLrpEeGITmRkOzpEd8u71wQLvO2Zf2xGsA9o', '2024-10-30 08:13:16.552435'),
('c3pu131q0jxyq1cb5f2xm0hur6r5lj0w', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s4Cjr:63CCbPJbj_LTkeQwYApG-xvMvvI1hnsmjrlMxeOKbPs', '2024-05-07 05:37:39.330606'),
('c5dtoulf0d7mp8c86k8g4nggyuhyvsz8', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sTDmz:vKpG5ezyefvQG3z512qJcTsIrfoeSrWL6bz-BqEYHP8', '2024-07-15 07:58:17.758147'),
('c74c8eif1e4w6qu2br3qzpmwfsu0l0k0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sbvBv:zbgVCp6NNjprkt69OVPcY3BZa9AfAGjgvZDImkjVKzM', '2024-08-08 07:55:59.097150'),
('cc62y36shod0g1x9bsumybeu2zu4exie', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk7l9:lKX3ThDu817J4IGrvuukmNEubOE4VGFxu2vPnUH_FHE', '2024-03-12 20:15:59.633626'),
('cd1xv16n7j3z406oy65rr00sfchq8m18', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sjwG1:bs2IWQYYHgmSwnOCBJw2kFuBoc_xm2Msjf_rZ_xnF90', '2024-08-30 10:41:21.377789'),
('censme4uqzfefp6pqtad89kuu2abm77e', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s9fFU:PkSkTQSS5GTXTElpbWFeMQtmNqUGSi-DV6dvBNmXgGA', '2024-05-22 09:14:52.283050'),
('cknx2uq5lqeabk9wzyrwhn6humsiwqvj', '.eJxVjMsOwiAQRf-FtSFAebp07zeQgWGkaiAp7cr479qkC93ec859sQjbWuM2yhJnZGem2Ol3S5Afpe0A79Bunefe1mVOfFf4QQe_dizPy-H-HVQY9VubyUGRigRZayzpTMmhUWYSIoP0WkAwzhtJIblEUgVwyktAUgBSY2LvD9ThN8Y:1sNRSJ:wzjH_Re_LIq5RhuDHnuaKIcG8xa7OIAu1sYL_Y8hLpA', '2024-06-29 09:21:03.239149'),
('cmyufjzpyajoztyyuadvtkutvhrt4m2w', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnEfy:fRnyP5jrWc8zv37cCGfcBi3oFyYXKBK9YYqyemLzziU', '2024-03-21 10:15:30.590806'),
('cq6gw9fm63fej4anc1rb6l10wfersj2i', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpkU5:1LYw42lL_hNAe5KIoZRbAkHJ6_VkEXEs-jVvW36eIqk', '2024-03-28 08:37:37.580352'),
('cquh7w6hjl992f8khrza6o1rb6yv3b0p', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rylcC:bwQnxJAEm0u6JPGo3RWSTMBRK0AA4eDh6K8_1ROcaqQ', '2024-04-22 05:39:16.475912'),
('ct99xime2smdpt4fldalei55s71ja6te', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkfiY:gmioMR6KIBxUZJebv6UZTpjJSaqHtKk36bLlbiwaGKg', '2024-03-14 08:31:34.790997'),
('cx0ygvd1vzjeovcps0xtdjgl41xc0o8g', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tENz7:asRkqmyc0DheHY8t62CWdtxcs72hTKxb16Ema_iDD5o', '2024-11-22 10:21:45.992230'),
('cy8xs8a9edyoyjag3uq0lfsm12bg9j6j', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rxOAC:rCH-feWaKNT3aWgDhRyoqEGrr8LHri1om74OTBA4mu4', '2024-04-18 10:24:40.604353'),
('cyiqji5izpq3pvtovb085bqqq2rt7654', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tERDY:P98kEHnVqBTBp-CgFWwK2RpGV7Xa_vEP5jfgPFvPjGs', '2024-11-22 13:48:52.816348'),
('cym4ch3egy3q9si8o53sbeh5l937pdhr', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1scf4P:R4wGtcCnTFTmTbVjkcCTMCxEa2mcmxL5a5eJumxnYDM', '2024-08-10 08:55:17.739968'),
('d0w600srj9f9yn5stjnintw0gtadblrf', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sVm3K:EnJupdmRy32FqylWwixupdAH32zgopTdFK5f9smqYrA', '2024-07-22 08:57:42.343677'),
('d5ee6i79crh31lrs4369eslal8j1lcjj', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t1IGN:AwOrczbtAc2Y43RJsChKBAjVzUxvViwCAxwDpqboemk', '2024-10-17 07:37:27.753402'),
('d5yrdvzi1blws7mc34mdmj01cmykxos0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sjDMy:SGhkLHSBEEZ1c1APSYupTUz6C3lJpPUY4oAWqqkwCew', '2024-08-28 10:45:32.766139'),
('deyptg7wcz3asphwdmcxvlyd543cteam', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1jgu:NKZ_3UJ1bqhavt_5h90qJtdDePxTQdB4FrBPEqcMs5Q', '2024-04-30 10:12:24.041472'),
('dfuf09jla1k0z0fbq6ae39217nvkil5n', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t0e9W:v43M8Y4RJ8QnFWpl6Sd58vTgFpzkD1QySMH2sk5xWsA', '2024-10-15 12:47:42.680481'),
('dohgqofc96dl7qgtpgahedv1h590pqc0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sMomU:4gu-KruNUbg6BqAzyIvEQpekgqDWhOTbRL9YW6HYPtM', '2024-06-27 16:03:18.464135'),
('dsgbdghui44jblh31a9ctvywch174x40', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sjYUA:B7hMhecgir8xkgW_q3Nn4PjhuWRFDm-hK0WSm3ZitVw', '2024-08-29 09:18:22.498235'),
('dt6wt197dsbt9dq28kgq1yft33xp6vqr', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sWTtD:p__zW1pp7OoPkZz_S9If30QBn4fh-GFtG4w_bXPKvp4', '2024-07-24 07:46:11.995095'),
('dyqh2ceii0bmk3fsw7cyr0v3eskc9eyo', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rruMN:Pj8etjm4-W9Dcj68kN4TTUB8-bLFvj2O0PAXJ0qPDrA', '2024-04-03 07:34:35.363431'),
('e7oio227r80uhj1ffwcr0t8aiwzlba3h', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1snWeM:vxzOMBxk4Txtp2zqYLtP5aJyK2F7HL4ov4FwtbNvf8Q', '2024-09-09 08:09:18.834345'),
('e8qcj0lix1pil0kpb792g70789649bxe', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t8DL1:XjElrTQy7CQ3w4CUgKNmGtWqHpWhzMkHH37m-m8T5Fw', '2024-11-05 09:46:51.778213'),
('eauwmxsbwj50w7jw0rsug3bg3agacd39', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwJsn:GCy3_w9M3eeSuTaZBdDN_UJIVjtpTccWwDANHbsJSvM', '2024-04-15 11:38:17.510724'),
('eekgtwmlvvsn9nmp1wef964cf49bl4ae', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rdRqQ:G6mwUutLGOjD4knhaHPv8qdq3rSW-lqNHASOguhX9gc', '2024-02-23 10:17:50.395314'),
('erxjfj590w97g3eewo5lz5o67g82rrtt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rc0r6:qKitkz057jMoj7o_2_sgrBJJWOS3KMPlR_Yqc_zID_Y', '2024-02-19 11:16:36.653300'),
('et1cfcep2x0cloeuybbu9kzr6flpd3ho', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcefC:64dy1LHw29FaeWcSC4PKQI-E2iQg3bz4af5Er-IXyCY', '2024-02-21 05:46:58.075412'),
('etg8nn1ddpcnk11l8n2s6yjua076i29j', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sM2yz:FNjUuzAAfGjXcpMnxvJHauDNxPGm84xpvtk4L12pWc0', '2024-06-25 13:01:01.402693'),
('ewh4s0b2up67otgazka2vtk1gfh6yriu', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rcKkl:prPRAqCNDLiJqa6puARQS8PHt0WEYbMmuukkwQ6ylKQ', '2024-02-20 08:31:23.983902'),
('exm8gs6bh8hncgr2ujx12zpgo9o4gimm', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sCZVD:jaw_ep4XFwK78HdK6vyqDEgHynQu5vWYEn2McHIhakY', '2024-05-30 09:43:07.183440'),
('f3gf7cvix957t7tuah2gpidrlqq04h2w', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rtirt:vgCsBMm2z_pKSdOfcrjvuf3QDmDgTfXZ5vO5LPxhi6A', '2024-04-08 07:42:37.586006'),
('f3hi23ut05ccg11yh2505wyllioz7fdc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1kTk:_bjUxm8l-QmA-x8WlUX5DqTTp_GijZi5AqCfTXlfo_o', '2024-04-30 11:02:52.979819'),
('fcitq2psbvhimzfnlc75if9t7a7raatk', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tCu7m:hiKtxuuNxcosHoxzHeBztGmpb4duYA3KJCIbaELgbVE', '2024-11-18 08:16:34.631231'),
('fqsas8gkzwtoxrra8sm30lhewi9lx6w2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1ru2je:CUlGDkZy8F9vF9mMHqFIAFlagNF3jniliNYbET-izs4', '2024-04-09 04:55:26.905361'),
('fx9dhy33i3hrbet4yk2pt8ebt7wak1dx', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfwNy:mHQjL9MaBJPeDX7RHV2mbZtiMq41Cbg4jfvW_m7Ej6g', '2024-03-01 07:18:46.793489'),
('fyagylgb0q2zapp06795o14mps6brvpt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkhAA:gkHlvWY9U1LeIerrMt1h8CNzmsHC94saRIcYMGjJIWQ', '2024-03-14 10:04:10.646251'),
('g7hlwpth9su9oyq15uy913ohb8q4ewq5', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sq3Zu:ePfmfiJNwONhQft9zSb_OajnoQp49xsicC6TySs6vZY', '2024-09-16 07:43:10.903949'),
('ga4kqe69o39ikrinr10hegk0ey1ow2nz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s2kZK:5zTtcsgKbYzjKjrzxFLj8uyg_4IUhxzBIoHnBCe7ibg', '2024-05-03 05:20:46.375875'),
('gjqljuzy306vr7i5fcpwb3m64tcncldz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sdjMu:kK_G13AuKcsFNHopdG2JYlLbabvE6U-fumSupx4QW2c', '2024-08-13 07:42:48.633476'),
('gkyc5iy9qfzzjilo8x3tmc5ht8cn6ia6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1ry3hC:eZAYvzhBHubSRoWldC_x5g2r0nQFX1bCY0h16ATBGlE', '2024-04-20 06:45:30.751323'),
('gmmd4wgskomj9nyvqbkyyvxhgqyiiuyq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhRBX:JqxZxMZYdUys3bM6Ab59rz4S8Mblkk4p51P1rWN3nGU', '2024-03-05 10:24:07.250116'),
('go2f01r8yp6j63u5c930y1i341de6grv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rynH6:juGWASfdN-uYiE1EFVomvUYS2eAddpNPP3dQD-G2dMU', '2024-04-22 07:25:36.384981'),
('gsjnuj407k9q6354nhjx0270h4mfgyln', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7YaT:O13Ke-LOS-umqeVgWA3r5i9TXqgpLm8qeeXvbouCDNE', '2024-05-16 11:33:49.403576'),
('gthj1jwc46jx262avz8u4y0kvrp678ws', '.eJxVjMsOwiAQRf-FtSFAebp07zeQgWGkaiAp7cr479qkC93ec859sQjbWuM2yhJnZGem2Ol3S5Afpe0A79Bunefe1mVOfFf4QQe_dizPy-H-HVQY9VubyUGRigRZayzpTMmhUWYSIoP0WkAwzhtJIblEUgVwyktAUgBSY2LvD9ThN8Y:1sOXYD:2eZfK-HbWsnr09s9y0a00tUQVBMaJ0BBJs7Fbn_pE5E', '2024-07-02 10:03:41.004964'),
('h3clp0x682h1kualxslr8a9pvr1gnjk7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sPaap:fqxoq3_ghu01WskeZZskzuc12vk_PhtOIcTnEQ4xGxU', '2024-07-05 07:30:43.565776'),
('h4nar1r8zfn4z7p7nz33iqk6iwug92w0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sndOc:MvvyQa7WXgtW6FU5m-fb7l4vf9pnFo-1eRB3aHKCtOs', '2024-09-09 15:21:30.904718'),
('hlqqva90o25bopqdnkrer6blzna7phw1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sQjHX:C1SdtM55_CurcAg0RG3b_GaF5e4iBXi_scafuGvtxxQ', '2024-07-08 10:59:31.880919'),
('ho3441xzeyqnbfmhisbe34k24sw2djne', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sPE1R:ZWDJ_QUknr09js2EIzS3HG4ysI_tqZWyOd3827OrusI', '2024-07-04 07:24:41.840788'),
('hps91z4iu9wttns7e6tv38vadkvitp45', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkIuo:CkINStRriPdDraQvGdvvPHWaVqhPY145nz_cnvr4kRg', '2024-03-13 08:10:42.809151'),
('huonyp8p5j9bkbk0fwto620dadva5uqj', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tE3zt:U3eHaNnBHDhSK58Bp7aBPeioZPmO6eBUi6jSD9L-NHQ', '2024-11-21 13:01:13.528250'),
('husjkbplyv4kc9oepvmnpggbl6tg6n0i', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t0aYf:hU-fGZJT1B8kMniABG2rh0ToSa8MjP_x4_MBCD2mZJA', '2024-10-15 08:57:25.618499'),
('hy21qw0l0j7w6njaiipd2zjz96ncwe3c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t12RF:chUPk23R1VJthZXc7KdqDKyVCPQeJCw7qnn7iubqcjk', '2024-10-16 14:43:37.110620'),
('i896y5mfu460rlg9jcm52ko0lyxmymek', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t6jbN:4mB_DWjrNSd1yuirOvdWe4Q08Zfh8XNZ7USj0hfrPOE', '2024-11-01 07:49:37.366048'),
('i8qu4hpatdjhz4iynayvflqc6psp5gmr', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sqmdg:xCbtTXBgv49eVYAPrdUXUvRJZlH3oGpj69KMe5Xzh7U', '2024-09-18 07:50:04.568445'),
('iakaaiqtnv3bd9hwozzyrxkomd1qkdx6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjZDy:dJkaPLppziOyq1bHS4_9M9gr9-MrosRi04GzSdMMUzY', '2024-03-11 07:23:26.113033'),
('ikwfivif7s0f6ad1cpy5x7soy5rt7ifv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rh0Iw:IY2gsXhQMhawZNmQffmy9CZE4OVAyLT-pQP7w7EU7as', '2024-03-04 05:41:58.112039'),
('ikygmn1b0100fejntgvkusw5jkzyqqx2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpLGH:Whb73ppENeouAT3kZzDfOTdyxKjeUxMHvzWHaOU6T4I', '2024-03-27 05:41:41.490198'),
('ionog86obd8957j1x2izcuapmahuu7ue', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmpGA:5GjXIUzvVlTdIroHOsHv8QWz_jwi5AQeFrxN0so_hY0', '2024-03-20 07:07:10.328466'),
('iwg73jugmommfjstrvrc65nzxtcge9hh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpN8O:5wFqnQP4_CpYQDaQt0fZbJaAerbSoqi8gGzPUw8FlfQ', '2024-03-27 07:41:40.753103'),
('ix8h74qn06z2lszpaooewmoawf0000ej', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s77kP:A4XEb-rvndSHI1MVMvHg7Lc03F7DSS9iKOMqAMvk_qo', '2024-05-15 06:54:17.624955'),
('iyec4y5hln2gbiynq094pshdsvroq4r6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sQgE6:1PU1kBpnvBnfseuCW3yVkZEQ_mTzB4EyK7-WnE3cyTU', '2024-07-08 07:43:46.571355'),
('izb1vopn35voyri4pzsxb0nmf9x6pi3y', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1ri5r4:NMIitZt7wMHAe-er78tAxBtXRFEvoMH4BJ6qX3s8mDA', '2024-03-07 05:49:42.094215'),
('izv92l7fr8gtuy9fv8exbjp0zir2xxfx', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOa2X:xiD-plIixzf8swLoDl9g4frvCRBQCy6XaFMM4jzallo', '2024-07-02 12:43:09.021373');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('j1ogjii8toeqfobds66oncnzyndgmwbo', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7vAQ:MyYh0VvrE_OEMm0wUBPFlHcqiZ0fp44IMFzF7U1msf8', '2024-05-17 11:40:26.341002'),
('j4dhcbfvlbsndy26n79no5og1lvvjab9', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tEREY:MJoHoNPhL5nopMMyavGUBQWSmynoD2_Q2B42NksAZ2M', '2024-11-22 13:49:54.742071'),
('j4g2dkn7icucus1pee7j89zeti52yvgf', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t6NAV:dJdK3_uYZtqRAbWpuDV9hKiIBVyqqAMuWNXmaQtTx-M', '2024-10-31 07:52:23.555070'),
('j5o7kzfv4uuqsiju0viea44qmq3l1iq7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sKVxH:1LnW4oKqWmcoyURrjAE0oS5iCHJScfw4Rc2TY4KETGY', '2024-06-21 07:32:55.113121'),
('j8j2y6uuyux5tax8xh6mjodm54x9r5mi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1Lb7:PI_ZGQZkIZ9Z8i3gCgQVysjbYM7VhCKEXTwUSNV2x5o', '2024-04-29 08:28:49.643327'),
('j9bddt8awsjvoq4bg4gi0lk7e0k2cr0s', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s8Cix:iAAlR7HamwXi9jC7pqMwGFL-aKavCj7zbMTI2TM7XEE', '2024-05-18 08:35:15.753464'),
('j9l17qrewlnphejzauaatsknmpy2vozb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk6rS:t41xtOJr8HeHysK4-AgEWl7ikIDwCz01BE6tqp54_iQ', '2024-03-12 19:18:26.317575'),
('jaboe8a7mrdaek6hrmchw1ckabwabcmz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rxguN:5xK9KlLQidajwWLovLWN8Bgp4aJfMf15Dd8khKjRmLM', '2024-04-19 06:25:35.844910'),
('jjw7kk2n3v28dry7nmnb08dztbdxu22g', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sfz45:nbwtnEwiiA1-QkIf8cCdBVPOlFwG2akYKCfpFvBVAuw', '2024-08-19 12:52:41.204008'),
('jp0nxcnjn3n09ivb41gqzz0q84zxnoa9', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tDdLx:CXnkr5C9mkQPDZf_ZCnMo64S-itCEVWGXX7lE_57x0M', '2024-11-20 08:34:13.886056'),
('jqwtkyy0fy3cxctkup6hsa34a78swdy9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1JBa:Te2NcOLCF87HPVPtLg3LQGknO-3FXPcKVp7AUlzFUTM', '2024-04-29 05:54:18.923368'),
('k2zqiuqte95dsa1ydnavgw1ljkymgg1t', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk8Y6:edaor3_E95HxOkGMT-XSqBRYMPXQfxPv28IQXdiAIcc', '2024-03-12 21:06:34.258204'),
('kp0qljndk6a7ndb88pit55eka6jy213d', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sxjzm:ZfRUJJ8tYsGCxvZ544tDHkNH341f5XSXQpWX1aRgduM', '2024-10-07 12:25:38.109005'),
('kvn7mii02i9711qp8e06uv9odvor2len', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s79Dw:6FXZhcWoLQejRnu9QbwDJaNrs2KxP9aQRDqxsJYdYCE', '2024-05-15 08:28:52.759182'),
('kyhqbue1i5z971hwopnue2ayulehai46', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sm4QT:p7je0ObBnb-g1XHYw_FbzVKJlGJ4DK2P0Uq_1qwjwew', '2024-09-05 07:48:57.118754'),
('l263mfq77ipbedmihsandcr70cazao46', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sRlpj:e9GhhWv3ljA5Mt2VKdjiHnGAU5HTjJKIg5LNTdkwAnM', '2024-07-11 07:55:07.381641'),
('l2obl6wdc3y1jlq3z5f0d48on0hv9sce', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1JBb:PXxDm2iG85FEIMeY-SU9A_Ap4Dw2VGY0fkuXsLpvW8s', '2024-04-29 05:54:19.149246'),
('l8xwbyda85xt0oa4ufhdhn8ogm5tfi0b', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfegz:IVeT9qQoLlKPa26eG0lUaFeBXlnEqgn30l6kfMPjqH0', '2024-02-29 12:25:13.451918'),
('lcevjyr9hj5vwgkllf9qvuysfwoflz4k', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhTpc:EkqSuMYQoDDBdv66z8ftrtuzvfBfRG4yAsFAfnoj8lc', '2024-03-05 13:13:40.295421'),
('lcnzoy0mvek8cqmjcl1a33hl4qdt2ae8', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1shM9y:4krojwZegdeF-N-c1onwgJ-r28o00-58-0dsrRmMu7w', '2024-08-23 07:44:26.574222'),
('lgxj7eaamwiqc8pyuvqdy4j0td2k3nh4', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcJ2N:OOaKVozljadP9BaubJGuOx8urSAu9SSlM9OZMaE355s', '2024-02-20 06:41:27.209002'),
('lhuaykick0800lig1mu69fn1nl03c8us', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sN6B7:nT6eYX-6NdgGztby98s-qlEP4wIypg92JDfultMGH9Y', '2024-06-28 10:37:53.611714'),
('lvew4kppy13lpeqroichz8m1abyubjkq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rja0s:ZinIpLFFYk4k7gntEBSrDtMFyXYyVVA_xZQN-LIA9ZU', '2024-03-11 08:13:58.241059'),
('m4fvblqo91hxrnf6rih6d425xie7jro1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcPog:o1wBGgWCSuu22WtNe0X6fUpySkv0QQvK72QoCaK61HY', '2024-02-20 13:55:46.474066'),
('m4h579qdm5kgovvkd0428fa10lvv2wa6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcMfO:0jshP5sHrcobxb-0iSh9dDVbJU54FKhbrY-FiN9X8Dw', '2024-02-20 10:33:58.802704'),
('m7y7m4pbquf0jm60n34fqg76zgqswegw', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnC3R:fbyms3xv7DmESkXu3UI7uhuamgqGVPxaL5POyBUQkTE', '2024-03-21 07:27:33.277016'),
('map7n89bfl2xtv7cmv9uo04vnx85cx1m', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rc1fy:8LU_i2gKwXOhdC3zW63Q0tMmy7cgihoKnL4P8Z8ex1Y', '2024-02-19 12:09:10.587423'),
('mb37jnahjhgoykx7d37n6jcmt5m0bagl', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sdNgw:qTtWvCPv1RFpIDzGVpfCgaiX4G-MNL1AOEY3vOLTfuo', '2024-08-12 08:34:02.203006'),
('mcbfgsfkr0t57p5ldflphlacxknmaazr', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sZlH6:YSV2DQDfzgB9vOpv9p60aP5EROEO032F_VPfdH7jey4', '2024-08-02 08:56:24.280710'),
('mfjed3057h99qixtmbzcy8nyypeeayr0', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t8vIB:we-O_a3oU3NHDM09dK-8eczAF48ggq8XuDLdhMOKw-M', '2024-11-07 08:42:51.914980'),
('mfz8n55rmiolzohirqm1jxouvhucvjg1', '.eJxVjMsOwiAQRf-FtSFAebp07zeQgWGkaiAp7cr479qkC93ec859sQjbWuM2yhJnZGem2Ol3S5Afpe0A79Bunefe1mVOfFf4QQe_dizPy-H-HVQY9VubyUGRigRZayzpTMmhUWYSIoP0WkAwzhtJIblEUgVwyktAUgBSY2LvD9ThN8Y:1sA2ka:ylCW_xEdZ6yftU1beC7SuEwLgY21eAbTl8eOxnQIliU', '2024-05-23 10:20:32.825209'),
('mi6h03uilvqslbac0dglz5mmzvowuisp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkKRY:ATUsQtrN-nDe68Ju5vJcfKFTHGgM-XHZxhx8SsafGRc', '2024-03-13 09:48:36.093117'),
('mjaql5uqz4dnvambcwib3gsm5qyrukav', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sFRWr:zRSSu1pFv3-GkQyQpgwQzaWa-STSUIhwcJpjKdEnwQw', '2024-06-07 07:48:41.547141'),
('ms47cj0pghittkgxk5q96qz3rj3x9int', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sWBiT:HB_JZ_5U8IsyxI9PM5b9KNXE9o1cZGdprD_8BkcORco', '2024-07-23 12:21:53.960469'),
('mt5hzuqyt58dtudradr1of6u6txv9ze1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sLyEV:CqC8rnW9ZFKNeuTKwDcu6wk9l8S4YsQ2KRYKsNT17l4', '2024-06-25 07:56:43.794846'),
('n0rw6ydczlfxtqquywyk9lhego4vxsha', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t6Pz2:3reVqIk0Ym-NXqx1VvWk3LeRB2LOkaAc9nx2oNwCJ1A', '2024-10-31 10:52:44.429406'),
('nbwavi4523mhd3gz8k5d7jbh5256dwik', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm8cs:nrJ694dLUpvj7Y7hOihT2AOvHgy8ERE_DFgcHoGPInk', '2024-03-18 09:35:46.620919'),
('ncz7jg9w5uouz01xrhk09z3tcwch7hr3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sylUL:5zg17kXbAMVftUtxNiyY0-plW8MU6A-9uFU-tly-fPY', '2024-10-10 08:13:25.733552'),
('nenz1zkvyldvp2e7rxnenagldlf4psk9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7w3O:bYqONFP8NubRK8ffzamM6_-a_xZjWc3kZJu88Mj5mvA', '2024-05-17 11:47:14.190933'),
('nkd50xltf5m99fbaylcb1n424hojspvu', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sbYci:KgxTJeptAlQo-fFhNWSZktJWTohbSMBjTtPc0X-iIjk', '2024-08-07 07:50:08.320561'),
('nnr8dtwwjblmtng7q430e5yffj03b8dk', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjapb:LPjKMYJB-VvgMwRB00US12djs-zylan2wEpictbkMJk', '2024-03-11 09:06:23.109845'),
('nysx7vrip8zhh2ej7xttfw0q3s7ub4yw', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sWqVN:CugUyz1BADAJU2S2eqfFrTxckARiYxojGukNSfr7zJA', '2024-07-25 07:55:05.953788'),
('nzep0xlr1tp6gdnmzm6nwx9t4g82282x', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcP20:GF5EG8_XtAPKigv7c4vxz5sQn2fbpFEigUCsqiZ4v6o', '2024-02-20 13:05:28.879799'),
('o2h4438llbtbdx273bocsbomnbztbefe', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm9al:bfvqsh24i2-ZNpOVbg0mePvojOTki3sGlV8nhwpUvN0', '2024-03-18 10:37:39.366081'),
('oby9xv7i62is9yrg72qei52w2cvkfw2e', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sPIqm:VVFiHxzm0PDWF9pfzbVnuJT2CMjhyd7ax_CqKtVGDao', '2024-07-04 12:34:00.937067'),
('oc4sidkadxxba8ao7wgxk5xr6vuaqkpn', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tMMZg:8r1kt6rXM1gEDFO3nT6DMliZgDlzAFyanNLLG6Q6mp4', '2024-12-14 10:28:28.830499'),
('ol4hu9ynyi11iz84b6mgu87yugjyzmju', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOct8:KekYOzHIYZTNgvM2UMmAEkMBi5m2_2RASkP_3A2ythE', '2024-07-02 15:45:38.560375'),
('onug5npj08kcbk5o1a2l200oj7fmo40c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s2nek:9Edsp0SRPnL8WzyaBE2IEg5aSsla6Al8a9tjzja_uSw', '2024-05-03 08:38:34.838757'),
('oozg292zk0ouu89vs6aczkdrwwwbw04d', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfCZ4:iSUPwyUT3VvAULY_Q2UyAGwcmpsfyL4H616gYB5bSWk', '2024-02-28 06:23:10.372045'),
('oxvmexkr3y1jzq084tvvhrgx30wplipj', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s4ZeX:WMl2pdjhMbg8HTf4AiTHR74E-snqNDHVGztgwPIVG6I', '2024-05-08 06:05:41.762559'),
('p7lnvpiq1zdddiezjdb3ectqzuc39lsg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rofwf:V_u0Laa-v0zkDeR-WoIALvYeXPLkYkYjUdVFTnogQPI', '2024-03-25 09:34:41.474760'),
('p8ead8d94g9lbnivfzgspo6da1n0had4', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfxfP:vgQLWuK05RSMYSbRvkjYN_DXnrl2TJBH8HIM1DoV9zU', '2024-03-01 08:40:51.429768'),
('pdzq6x8rmb15fqi1oagk8nix7p6n2hr6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk46z:Fy-XvvQeLt8FPlYKo4aBlDs435PAZkYjhi0L6BEr2rc', '2024-03-12 16:22:17.401423'),
('ph6x360zkjc6c4ydav33zstuou2d7bd9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmrgQ:RTFlLo-LV_q8YcEh5ErKqWGpvYiCA_GwJq6Z9SzDV5I', '2024-03-20 09:42:26.031850'),
('pha9tr5h7mjry6c60rpii72byakyw8m1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rdR2o:ZM1FGFVybw2M0EdysXg4RFxTiOgO1DZiCrvphzlxv5k', '2024-02-23 09:26:34.500584'),
('pigmqxyjz5q89a0lad6xov7mn98ptujg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s2OYm:qHkgWvkSbzoTU2m62GxAFX1NLBnfVOTh0_T7wHf4OU4', '2024-05-02 05:50:44.828114'),
('pkfbolcygta52gpu2oio2vhwe3w8yx6l', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sNQZP:U8kDvMY5SZBYDxTZWTOQlU_SToaK4tfV8SZvQks7704', '2024-06-29 08:24:19.244582'),
('pr9gbr2xo84jjs1jalj8dsjgdl97qb3c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rp0MJ:aCDZW15djZfoXEnXN-WJwQ9uwU-kRylqTVW_2OllcG4', '2024-03-26 07:22:31.831317'),
('q4zvzvgfuoxerdknj4nm8lzgtkxld52w', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sy21D:MT7UrSri9SPArtZuPcyqqU4YEFnpcHwli3a6vXadShs', '2024-10-08 07:40:19.048131'),
('q5dzcd3h2bfyqdd376dsljpa7a5gngkj', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7SzD:zN-cgrrYqvdAuZ0ftKlvUzbhIVBi7gdVILPPFdY7xDI', '2024-05-16 05:34:59.414433'),
('q6nbgu1o2qsm7b6zvpzi34f1y7m5y2l3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcfT8:rUM_MshyMm_bVS33jjEuYLL-Su0PtM-w6WaHbIlwuiw', '2024-02-21 06:38:34.499670'),
('q8xmntz4jpo34vrp2yfurwucoxmgslgk', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t3BeE:LEbzF-9qVVS44jz62vQIdN900ys8ro1DiqUfDBYN_F4', '2024-10-22 12:57:54.077819'),
('qakyfr6x85jmye8ysjh3sanfpy0aezsl', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfED8:PatHtxvNdB8wQRq1nwPFV3LqTaVc965dMAIeMHQGGIE', '2024-02-28 08:08:38.095842'),
('qassxsgzjdi942st4a5mefg06w3jnysi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnB5g:mQJLtpp-QholSHAZxvwfmz4Fz1kJsYRZ7lWfCHoTdHc', '2024-03-21 06:25:48.841645'),
('qaulyq4v5sd9sjiuy4dbimifp8m6fg6a', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sYILD:4UHc8DlSJmeSea6uJiJOCQA2r08k6t8ezpYF5tDOLhQ', '2024-07-29 07:50:35.568370'),
('qbjijq2c3x20ftm65wlioy37gzmzsxtd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmnwm:X5IR60ZVBX-8TeDwXEiWhqAkLuE5EwMsUjDnOhMCZMw', '2024-03-20 05:43:04.228857'),
('qc44i7co33xrx6ry7j0qd2rf6k2ciy60', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7VQt:7Phb9-WW-wSehp7REBYfYXPyqo2GcijQk5UK_PRHHjw', '2024-05-16 08:11:43.016359'),
('qddywxyja3ep7861xttehsxosc6qz2yb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rphHp:oauv5dODllZVYntbYfDGDmApXdMKmgp1ZtusthrNJ4A', '2024-03-28 05:12:45.620095'),
('qdf8ck4yvikd9pb28ox1piomob0kfxz8', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1su2rd:1lZV4A4BI3qiYxSRoTcpdmipwNe22NRVEfcDR4WX9Qw', '2024-09-27 07:45:57.837734'),
('qh3lvm0x78c23jyxklodbrxfcvkae9rc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnDFk:3y5_0iXJEQzEEQlvFBfGLRNDi4KxdNZVQjeQP7xDnIc', '2024-03-21 08:44:20.847751'),
('qqrjd9uad8z45tuqvighyhxcnkq8ssr1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7Tt7:4CX_YGHOQtcu5imfGNEuHBCiZNj_3-wL46tQujcgXjg', '2024-05-16 06:32:45.884280'),
('r72vjalm9y3rj3vrngbs31mftagd8bvb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm6ez:O-xYfOGmgKylFgA1zYl-cr5HsNwxmTnd1pL2ifVQ9Ws', '2024-03-18 07:29:49.107029'),
('r7rst4ap3vkdnnjtjdfwrdd162qeiqar', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tDfRV:Mv_MfELmI4giCryDmgyBnC3X3SpA8NPALgo2JwMmImc', '2024-11-20 10:48:05.600797'),
('rcbql0qi85tb25fxvniy1ah67j0g27l7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7XUA:Unf4B70N-R4zQjiKbZ7QUVLDn9ha0gvssbokIilVFqc', '2024-05-16 10:23:14.601066'),
('rfow48hgi9lnshe3ukurbssju5a95q52', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcNSB:7L_ARyeZW2JrChbNOTPieuM1jBzWZLeK_VudBQmA6T4', '2024-02-20 11:24:23.896796'),
('ri8psr5fdf8692zwr6mcj2tdhzrj724l', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwxa0:H77gKic-UORyg0ZqTCYyNxHLyTZ_TQ40rPD3hSafQZU', '2024-04-17 06:01:32.394188'),
('rk7qkmq0deft37wp3xj02cfu80769tk1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk1Kg:zMp2XeAntjGVtuSkyDKLfo0o0WGkRBkjgva4V4HoBKs', '2024-03-12 13:24:14.409875'),
('rl2b1u5kddydgpewgyccmympjlbwzlan', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s8zab:TjUQL4HS9sTIwmViRDwrrGmtaL8-dttk0MnN7gY1fwo', '2024-05-20 12:45:53.184955'),
('rtz1vcimbqro8dertof0vo92f6ma2h1h', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sNA0t:qwqKz2ViFU1yEF3BSoU4ZXl88Ncxqbwd1NreX72Belk', '2024-06-28 14:43:35.549267'),
('rxkkwlyj3epcikq4t97fs9ks0eorzkz9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmsTx:y6XY30AmHWapZIpHYAsZC93LZva_gUi9BnAI3uB5NDw', '2024-03-20 10:33:37.905139'),
('s158adjvemzcrhviubcvliekyvbbk4vg', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rc0ur:BLSWG_oNrLKTZ4iRk96J-VnONTEdXZ1ypMjIS3zoag4', '2024-02-19 11:20:29.319771'),
('s1pb4anv0h3h7cc0nq8yx8r83ic0wl2b', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmUTi:kuEKB8PuYfSNUFWiNYD-r541zFufxXTecy4QEhdS2oY', '2024-03-19 08:55:46.071900'),
('s4qeko4tpvwlw2dgp8uy1ley889gckoy', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sjc0Y:6fBe9Y3vva0N5EHe2iz51UnHoXhjs44r8ISxWsheZN4', '2024-08-29 13:04:02.151116'),
('s4z9g501v6mrdtjd0qjgiveq98qurfvr', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tLxhb:cjDTl6BfWFpsbdMmRXqNEzqpwWrj2hTCs8J-Kox_XIA', '2024-12-13 07:54:59.275603'),
('s5a8ugqvlkgpilbep74hdbmz0o4jy7xr', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s4HME:ZvYjPXjum9s-eKoiJ4DeEGIAeyXnl8WtdsNKHHqQ7O4', '2024-05-07 10:33:34.517448'),
('sbaaxy9xlfntgfulens4pi5nhgqov2dy', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s38LI:nHDPq3KY6jWZoCphaQ0cdxEw41KcycMiQYYIDTY0Cls', '2024-05-04 06:43:52.553856'),
('scr376o11knmdqpcfz8d1p8epdz7p6sk', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7BUM:mGJlQbpDpKNFxzK78A807VvBxWQAoXHU8d6tYkXHu8I', '2024-05-15 10:53:58.968431'),
('sf722oz6jn4kzglyl8sjjz6k40jnmem3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sgiHW:_gnJZ5a0YKqF0rKxfowWmleLP1L2iHJGdxcgWcYiHBs', '2024-08-21 13:09:34.254877'),
('sikc83v1fnh2oecpajpwn9lqrjogcutd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rscsR:IbPRjKM660D3ZJVgcP0cNNfno1gZTDSbAJ427tZ3x2w', '2024-04-05 07:06:39.157081'),
('silqpx8is4craxumg9fpucg7mnd83mpp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rxn7x:tJuoe6mSMszVHWS8F3KLxaTRl-Km-1oJYNba1uCTiFQ', '2024-04-19 13:04:01.989016'),
('sloi158mgtetzbwgd7zztujnjja313op', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfGwV:zzQB5YOh1sPC0UnwcsYHKM1cZ_Jkk-rkQb_VjwazHew', '2024-02-28 11:03:39.988649'),
('suihbm5nsziwadh1g1tkzkvtfxcqh84b', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm4f7:8CX-kTdLSBFqJGrCWPNCzJJ-0NSvIpQbNbsUhnmY7uA', '2024-03-18 05:21:49.551259'),
('svf2blnkmwhqocmidsr3hg66gfowfd12', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tDI8Y:kEDi_8fE7rgw6k32qNaxXfVr3aG9c1uoc17Hiew9djc', '2024-11-19 09:54:58.460518'),
('sxasemyuao6nces7uupud88yduiegkii', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1roeNF:ExcYG4YTg-tyx5D9zt8LZkxaD6ZY7Iwog3r88CwcrUg', '2024-03-25 07:54:01.680306'),
('sy1te4bb0arpuy1djrswhg6ymb90qir3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpO0n:uO7LrZE69RfTUez-210AxkihRo5NM9wReu1Y_FLmV4U', '2024-03-27 08:37:53.600651'),
('t0d792pxv856mc7eohk9brvhev4y81hi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpOwR:K6Wj1bFeAGGJ60axKN25V4t2boqV4xnI8Xl2JxqKC6o', '2024-03-27 09:37:27.263356'),
('t40fpx1sz0bqaom6xr2ubqd8mbrgdtkp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1syQ5i:JSekre-KaxeNCRTlW5-fyAz2vGACMBwWwG5CSOsRn78', '2024-10-09 09:22:34.734426'),
('t74bvriw366ic0o9ulqemkgxc8fmnk09', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rsHXI:eqMsZ3FX0gY012n0fGZnmAAc756LAzGlESpXsHKJXaI', '2024-04-04 08:19:24.494749'),
('th2584f11g3cpifkl7j9ox5ojkj9ma7e', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tDzSM:a9ZT6nv0aZ_4xB_6x8UtOFFV33gL8zXAikT8mq-Osh0', '2024-11-21 08:10:18.012791'),
('tiy0alqjjm8s0fmdtvj7w6ngn51eecml', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tDfSF:jDfZbIpNpECaWnzZDLi_Cz5oMD9qWFWzOaUlwW0s4Kk', '2024-11-20 10:48:51.731496'),
('to8ed0lx7fu46j908nye44ht0c0qv6ug', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7qz9:e-_lVo56rfCravVamDWd1EjlXPzpnu8TV7Kqir2bA7k', '2024-05-17 07:12:31.526677'),
('tqkm4b1cr077ga5t3uecw0fz0cx3dqm5', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sMlxo:ckf-4HIDYksEuUjpqryc2c_PQEyDC9ynw4llsXbjDUk', '2024-06-27 13:02:48.037882'),
('tt9jfyetbculm6wmbrpfyn2ju0yf73pv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sMLMr:886zM0CvTgNi-NbkHPxp8mzncJmrLISITPsiiM4qwx4', '2024-06-26 08:38:53.731474'),
('tzxpub53rb9dpsxprc9y45yimtjc86wg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7w31:jq40ixdhsSLpZl3Ev0PVkMF_IDd7EEe9ey7ygFkm7oI', '2024-05-17 11:46:51.081284'),
('u8igfql0jbxm5frok13ft3vs1fiqmy6t', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1smoWu:TiuufBjcYTS-eG5537MGVU_iQCbIECdVre4YLKkHfQU', '2024-09-07 09:02:40.119508'),
('u8r6xlr1t9acmfqt59fye3qr6scu2lnt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rsc3J:3i4uAtiXHhDCCoBBfhEBfoeiXBS3q7muIVH7KQsS3D4', '2024-04-05 06:13:49.953235'),
('uew3zevmdbo2f68adhd1uoizxiunm95a', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOsxN:WrsSvtSF_zPfHs61e4lgJFKA08SFrRjl3J4fYjf11lc', '2024-07-03 08:55:05.156197'),
('uf3odrs7lgh1ljwxguy86f6m0sdttpgf', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tBoJ2:oMZ1kyvMw3wwvzITvptQ8rY902bgPlQHx1l2y6SYk1o', '2024-11-15 07:51:40.757894'),
('ul5q3zro1c62yfyg4hrqwk40gchzzbtw', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sr9SB:yqnzG439sronrK6ErFGDagSXEGH9JkWMI3WSRvr5Tg8', '2024-09-19 08:11:43.870238'),
('umhlkxhavbna06wxrn7ql5gyb65csoa6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOAnF:7qTxwIgxcQFZYFnnBsQl_ruxVV9Pn1N-lGqCIT4pWZA', '2024-07-01 09:45:41.469262'),
('urnwm17ui7y88a902gkqxac7e8yuivuf', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcK4Z:8Qp70Xt77JidU-tF3WbUfsuq5SNk23UiKhj7VN0axD4', '2024-02-20 07:47:47.926961'),
('uty3tbn9px69r2t0s6sfp7cxwrkgcp8r', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tB5Lb:3h2hStE8U5qvGpvFsIqv_CfFkMEesVCHMiOtOVv0vdY', '2024-11-13 07:51:19.475921'),
('v3hhz33r330zcjalwxs94rfyhos74ham', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t7p4g:JvDTwpLbzv0iCjpG2i5MNK-9X2Tqshfkz1rID6crHNQ', '2024-11-04 07:52:22.298615'),
('v7q4dcq93nte1m34xwqmo2mwxcrgijg0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s2qFs:qMPj0yjEXt8U8n4HtCwgLVuMMrigjNNYXghU96HwdkU', '2024-05-03 11:25:04.518919'),
('va0k0sxd35cn5hafocmydjmju8fczigi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkLOR:7-lJQ08ZQdko3fMG-rOzXpF0eZCGvlHUARLLytzbQoU', '2024-03-13 10:49:27.805812'),
('vb7si7cpsj3ekxyftg0xf9q5su5stsvh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s4I8t:nb-XetMTRVMqhyhpAF2bpDq5p-_bvUdXdat1CG06ZFE', '2024-05-07 11:23:51.262383'),
('vekdawj7lbk719obxvcj6hqmpwzo7jts', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tAMFT:ddxYJfS4R_NYay0OM8NM2RHwQMdzdDRs9Oft89phzgQ', '2024-11-11 07:41:59.947909'),
('vfl6j58rofirez9mk5q3ke6ptuewe2hn', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t0ZZB:yW6e8iRVczQGBXPc8TnVU0slyC0UokxSq189c_5uoo0', '2024-10-15 07:53:53.583248'),
('vfvsqhl1hes918pxnz4dgenxcczisjaq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rdQ9p:9RE_7HRZuTfpmioBE0ciRZQEZk0YjDWgnER080Iwe_c', '2024-02-23 08:29:45.844376'),
('vhl8lqzms9f4xzgyf3gqju0hwqft0xkg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1repfF:O2FF2-ETdFyt9211vclZ5_oy1uH5RKkc1QxbL4ZN7LQ', '2024-02-27 05:56:01.016543'),
('vlj1zv6ad0tr0m2ntjuvvrho67ujeaf9', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tM2pK:Rcyj7gZWiVsZ2tT0yGWwcyCSPsFE7opxTuWQelGnnVs', '2024-12-13 13:23:18.988986'),
('w17ns26oq9eueqfszwy14rzqtub1xpza', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sZPzc:8gBP_b2xryrDyKpfoZL993WheZDs70GDeTA0g2UL7po', '2024-08-01 10:12:56.135095'),
('w4ynzsf8s2mqzk5dnxcz0l5qlhzasyd9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd6w5:ly2s2NHTwJVRVu_PkUsO_6-HgC9y4dRngADG_SgMnrQ', '2024-02-22 11:58:17.871519'),
('w5zrarhodgcr2gwlmr97gtcsmnk7qcl2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkzHm:M8o05RXoJvi-O6TtBzFGGVjxvXcjbMRwxDOjrtpq3zs', '2024-03-15 05:25:14.362931'),
('w8n1mu5dmn9a49z10wbwejz1d39clasd', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tFR40:ovB8nS5WtG75K5H_rivMBPRzdznyuO68Xdyk910YHkY', '2024-11-25 07:51:08.579220'),
('w9a757bn8a1cbw2mrg9idqyy8dx301qe', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1fjX:9vvWHHRgod0OUWLrZmXc3E0Xh1Vr1tQ3TgpyIO0BJek', '2024-04-30 05:58:51.778574'),
('wdk0h38g1f4irhnel22sowbx9plmgs9g', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnXfn:yQCseA2yTQvmhccbKzH7kfYe4QsTyFN3XcWi4Awt9s8', '2024-03-22 06:32:35.810426'),
('wfiyctqo474df4be682lfbixy79q2bwu', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sS9sQ:x34tJS62KaUR0_pm-TbVc_6yVn702M1fG39jc9g3fr0', '2024-07-12 09:35:30.494900'),
('wiymcl2nabcu67dv7bpb0pbppo25jq0n', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t6RKh:2m0rpurDDd88xROBRncvngf7_iE6d1jwaAU37b09npE', '2024-10-31 12:19:11.752606'),
('wkvz0tg3vqj7fw6pkp553y3w0brv6r0n', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOvvE:j1MrrrAx2hHE4rIO_d1nyv-jzsELU2gJyBfy6X4zbOg', '2024-07-03 12:05:04.212108'),
('wlnsjrj497blp983w12mkhi7rl17z91y', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rcKkl:prPRAqCNDLiJqa6puARQS8PHt0WEYbMmuukkwQ6ylKQ', '2024-02-20 08:31:23.963577'),
('wr6amwinze7u07zwz214ydgsnlfs07h8', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1swaRh:52NffXa2JMAPXKTFY-wxPEutKJDHJggvWf0l6qzgek8', '2024-10-04 08:01:41.788415'),
('wu8zi681s99ugpaxhiwpgeg8x4ipksxo', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhjFn:sxumIDAv36Kztpr0ZjmXHh4dDq65S1fYkgy5Umky6rc', '2024-03-06 05:41:43.299728'),
('x2b9iyautuacrjmolg6yrzrppfah1eh0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1Ofy:OElvd5U8coR6C7AqUgweiJZjvGzrvZULRSrXGqIVXGw', '2024-04-29 11:46:02.653469'),
('x2dp923chcptc4hz5fcygc0nb6ophct0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sh4Bz:Xuk9PJiUcl0SW_LnCLskoATPlNdSFrc9tb848l0WDI0', '2024-08-22 12:33:19.047096'),
('x62if2jo7zff02vg4qo82eexi93ki389', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjwB1:HKM2lqGYWA2DN9QrPIDkl1KbDhmYI0emdUEUEUE5lDc', '2024-03-12 07:53:55.989411'),
('xdkhkww8po9qdjgbcw7e4umtiob0nj1c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rclJA:Yd8xP9uKoa76hgFnUl94h9RrESF18HZ8n1s4O-Xi4FU', '2024-02-21 12:52:40.341480'),
('xlztwt5dqdylm0nvr35p6onok295hn9q', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd4Jk:p2abiF_i2Nr01FPfFJBFbU0kc2qznGegl6WrXqBG_WU', '2024-02-22 09:10:32.318396'),
('xqto7wiy1rlaydd6qbqoolu5z6ydwce7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s3qFm:ggnoYhXW4gCbdm9vHBMuYfFGAZGlAtatOX8JSpA6ODg', '2024-05-06 05:37:06.474233'),
('xyrri0hkvs9lo7tqbcp19u9bu9iovihg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1JyF:NNwkRTL2uF6JFxmdLy_XmZknYA1Yj2JFkArwaUhUydM', '2024-04-29 06:44:35.202676'),
('xytmkkx28i7ryxq99rthxgor46fmvv55', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rgI3l:esVyFiJfoOJ7XpwFtGYhzqf29WvVK-UX6_XL74C1dxA', '2024-03-02 06:27:21.199625'),
('y7c1bzu2qozm9rvm3boii41c0wd5dx10', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sLiLO:3IuI0qNtqLkLHQ3ljvue99Xn6Uzk5NTsEwE20yynmBk', '2024-06-24 14:58:46.819982'),
('yazwzru8ofj3ztbxbxgnt4191pquedqw', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7ppE:_FQYUDzvw8CPAS-ibEeVpL_yPYM1Aj7anIxfkA-seAI', '2024-05-17 05:58:12.811473'),
('yc9yj42tkt9oa7wf1emowu6w8b3bq6n8', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sUfWl:C2r3VRRFUBjGn2Ji0wf6mYJzJms3l7kGvvJalVpcfD0', '2024-07-19 07:47:31.007230'),
('yf9b0eb3fgss4ihgbda6p93ztionptao', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sR2gs:Rusg99f22n_aMblwJk-PEcyTCxYIOZFFMrjVSyUFsl8', '2024-07-09 07:42:58.193489'),
('yfp0jqk9c5l5tfrrq0yubn635j8tj7cz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t37Kb:ABDxbvB7GsnhfhSoZ2qo2_5luG1ysJTIXysAmpdbVyo', '2024-10-22 08:21:21.205954'),
('yokt9tc2rtylon8esocm555kf6fm8ayd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhMvc:iTJ8mO12KdWrp8qJ8iJdSSnngnxhKiT3zX8Z75iXHig', '2024-03-05 05:51:24.301184'),
('yuom4a0lm2z7j9div2nf2096u52xw7zg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t0vsL:a-N1ZHDHQb9rrjPb8hnPp7-s3WyJPG_WWnyEqeaKElQ', '2024-10-16 07:43:09.720458'),
('z08g2oezf44slm31o8rb3jtze4aqs9z2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmWG8:2-vc62yOOI1ZOl77WdBm_tp2BcpOoNUCzC5kIk5bYNE', '2024-03-19 10:49:52.676243'),
('z0fqlpxr22cdc1cqk9qqjt5ddk9iw4v6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sYeo1:SWk6-1MavGauZsbTLYaP02IU014sPQ8MNcfq3Ia31QE', '2024-07-30 07:49:49.862061'),
('zfuggc992k1ss30ntwgc61l469dqgojl', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sLc4L:vD7m553cjNSQ4dZd9-NO2tRLigGa_n106R4OkMbbsMQ', '2024-06-24 08:16:45.536497'),
('znzoxpvk7u8vcgwxsfx35midxzqfsjux', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkcm3:fmcog8HWBUFfCjnqZg20EFCGFOgC7lWJh5gLJ5kOmPQ', '2024-03-14 05:22:59.408115'),
('zvywshwffntyj3g63f6q7qpv1dx0fdqd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1gZC:Qqmf1N8Pz-VgzAvNhy2wS9-gD7-sorLA-xJbDm1uuOU', '2024-04-30 06:52:14.328178'),
('zyngrvv3z2a7aw59ihsm43qvipmwkdvi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sntY0:q-cgJe9TJAF7rzUP-2MdwZ8H9qP3gm7Smcq-73AOmlo', '2024-09-10 08:36:16.645531');

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE `document_type` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(2, 'EM', NULL, NULL, NULL, 1),
(3, 'PO', NULL, NULL, NULL, 1),
(4, 'SRS', NULL, NULL, NULL, 1);

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
  `grade` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `degree_doc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `degree_name`, `institute`, `country`, `from_date`, `to_date`, `grade`, `status`, `employee_id`, `degree_doc`) VALUES
(1, 'BSCS', 'FAST University', 'Pakistan', '2015-06-20', '2020-06-16', '3', 1, 1, NULL),
(2, 'MSCS', 'IQRA University', 'Pakistan', '2015-06-20', '2020-06-16', '3', 1, 1, NULL),
(3, 'BBA', 'Iqra University', 'Pakistan', '2024-02-01', '2024-02-21', '3', 1, 2, NULL),
(4, 'Intermediate', 'DHA College', 'Pakistan', '2024-02-01', '2024-02-16', '2', 1, 2, NULL),
(5, 'BSCS', 'Iqra University', 'Pakistan', '2020-01-06', '2024-07-16', 'A', 1, 8, 'employee\\8\\education\\8_edu_20240711114135.png');

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
  `branch_id` bigint(20) DEFAULT NULL,
  `cv_doc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `eid`, `ename`, `eemail`, `econtact`, `cnic`, `date_of_joining`, `dob`, `qualification_id`, `deliverable_task`, `e_address`, `status`, `department_id`, `designation_id`, `branch_id`, `cv_doc`) VALUES
(1, '001', 'Danish', 'danish@gmail.com', '03323232322', '42323234234222', '2024-02-06', '2023-07-05', 'Master', 'asascasc', 'adascaac', 1, 1, 1, 2, NULL),
(2, '002', 'Mikyle', 'mikyle@gmail.com', '03323232322', '42323234234222', '2022-01-01', '2000-06-06', 'Bachelor', 'iajosidoajdo oiaj doiaojd aoisdj oiajd', 'oiqqad aoidsj aoijsd oij', 1, 2, 1, 2, NULL),
(8, '007', 'Cdr Liaquat', 'danial@sigbl.com', '03323232322', '42323234234222', '2024-07-01', '2004-06-15', 'Bachelor', 'asdasd', 'asdasd', 1, 1, 1, 2, 'employee\\8\\cv\\8_cv_20240711113316.docx');

-- --------------------------------------------------------

--
-- Table structure for table `employee_project`
--

CREATE TABLE `employee_project` (
  `id` bigint(20) NOT NULL,
  `is_key_acc_mgr` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_project`
--

INSERT INTO `employee_project` (`id`, `is_key_acc_mgr`, `status`, `employee_id`, `project_id`) VALUES
(2, 1, 1, 8, 25),
(6, 1, 1, 8, 11),
(7, 0, 0, 1, 11),
(8, 1, 1, 2, 11),
(9, 0, 0, 2, 11),
(10, 0, 0, 2, 11),
(11, 0, 0, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `employee_target`
--

CREATE TABLE `employee_target` (
  `id` bigint(20) NOT NULL,
  `financial_year` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `employee_id` bigint(20) DEFAULT NULL,
  `quarter_id` bigint(20) DEFAULT NULL,
  `sales_target` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_target`
--

INSERT INTO `employee_target` (`id`, `financial_year`, `currency`, `created_at`, `updated_at`, `deleted_at`, `status`, `employee_id`, `quarter_id`, `sales_target`) VALUES
(1, '2023', 'PKR', '2024-07-26', '2024-07-26', NULL, 1, 1, 1, 300000),
(3, '2024', 'PKR', '2024-08-07', '2024-08-07', NULL, 1, 8, 1, 700000),
(4, '2023', 'PKR', '2024-08-08', '2024-08-08', NULL, 1, 8, 2, 300000),
(5, '2024', 'PKR', '2024-08-08', '2024-08-08', NULL, 1, 8, 2, 1000000),
(6, '2024', 'PKR', NULL, NULL, NULL, 1, 2, 1, 500000),
(7, '2024', 'PKR', NULL, NULL, NULL, 1, 2, 2, 500000),
(14, '2024', 'PKR', '2024-12-13', '2024-12-13', NULL, 1, 8, 4, 500000);

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
  `salary` double DEFAULT NULL,
  `activites` varchar(1000) DEFAULT NULL,
  `ref_name` varchar(100) DEFAULT NULL,
  `ref_email` varchar(254) DEFAULT NULL,
  `ref_contact` varchar(15) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employment_record`
--

INSERT INTO `employment_record` (`id`, `organization_name`, `position`, `country`, `from_date`, `to_date`, `salary`, `activites`, `ref_name`, `ref_email`, `ref_contact`, `status`, `employee_id`) VALUES
(1, 'SI Global', 'Frontend Developer', 'Pakistan', '2021-05-21', '2024-02-21', 50000, 'anckja ajs ll', 'no', 'no@gmail.com', 'no', 1, 1),
(2, 'XYZ Company', 'Frontend Developer', 'Pakistan', '2019-01-21', '2020-12-21', 25000, 'ks js lsld dl slllzc', 'no', 'no@gmail.com', 'no', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `heading`
--

CREATE TABLE `heading` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `tendor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `heading`
--

INSERT INTO `heading` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`, `status`, `tendor_id`) VALUES
(1, 'Tested', '2024-10-30', '2024-10-30', NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `insurance_detail`
--

CREATE TABLE `insurance_detail` (
  `id` bigint(20) NOT NULL,
  `issued_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `amount` double NOT NULL,
  `vendor` varchar(100) DEFAULT NULL,
  `instrument_no` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `insurance_type_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `insurance_detail`
--

INSERT INTO `insurance_detail` (`id`, `issued_date`, `expire_date`, `amount`, `vendor`, `instrument_no`, `status`, `insurance_type_id`, `project_id`) VALUES
(1, '2024-05-01', '2024-05-31', 5000, 'never', 'vbcf4545s', 1, 1, 23),
(6, '2024-07-08', '2024-08-08', 6000, 'no', 'vbcf4545fh', 1, 1, 23),
(7, '2024-06-01', '2024-11-29', 5000, 'no', 'rrrr777', 1, 1, 14),
(8, '2024-05-21', '2025-05-20', 53529, 'askari general insurance co. ltd.', '2024/05/29MIPDT00084', 1, 2, 25),
(9, '2024-12-01', '2025-05-14', 5000, 'no', '45zfasdas', 1, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `insurance_type`
--

CREATE TABLE `insurance_type` (
  `id` bigint(20) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `insurance_type`
--

INSERT INTO `insurance_type` (`id`, `type_name`, `status`) VALUES
(1, 'Monthly', 1),
(2, 'Yearly', 1);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `short_name`, `description`, `created_at`, `updated_at`, `deleted_at`, `status`, `category_id`, `unit_id`) VALUES
(1, 'Steels', 'STLs', 'testingss', '2024-10-30', '2024-10-30', NULL, 0, 2, 2),
(2, 'Steel', 'STL', 'js dcojdo kjsod', '2024-10-30', '2024-10-30', NULL, 1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `journal_entry`
--

CREATE TABLE `journal_entry` (
  `id` bigint(20) NOT NULL,
  `amount` double DEFAULT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `coaid_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `cheque_no` varchar(100) DEFAULT NULL,
  `receive_person` varchar(100) DEFAULT NULL,
  `payment_mode_id` bigint(20) DEFAULT NULL,
  `ref_no` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `doc_path` varchar(100) DEFAULT NULL,
  `conversion_rate` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journal_entry`
--

INSERT INTO `journal_entry` (`id`, `amount`, `transaction_type`, `created_at`, `updated_at`, `deleted_at`, `status`, `coaid_id`, `project_id`, `bank_id`, `cheque_no`, `receive_person`, `payment_mode_id`, `ref_no`, `description`, `branch_id`, `doc_path`, `conversion_rate`, `total_amount`, `currency_id`) VALUES
(2, 10000, 'Debit', '2024-09-10', '2024-09-18', NULL, 1, 6, 11, NULL, 'None', 'Ahmed', 1, 'SIGBL-20241007-001', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 50000, 'Debit', '2024-10-11', '2024-10-11', NULL, 1, 11, NULL, 2, 'szc a3eqeadasdad', 'Ahmed', 2, 'SIGBL-20241011-002', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 50000, 'Debit', '2024-10-16', '2024-10-16', NULL, 1, 11, 11, 2, '212312weqwe23121', 'Ahmed', 2, 'SIGBL-20241016-003', 'checking', 2, 'project\\11\\expense_document\\11_SIGBL-20241016-003_20241016152712.png', NULL, NULL, NULL),
(6, 5000, 'Debit', '2024-10-22', '2024-10-22', NULL, 1, 16, 11, 2, '112121', 'Hammad', 3, 'SIGBL-20241022-004', 'project receiving', 2, 'project\\11\\expense_document\\11_SIGBL-20241022-004_20241022145947.png', 278, 1390000, 2),
(7, 329819, 'Debit', '2024-11-19', '2024-11-19', NULL, 1, 18, 25, 2, '035/0038', 'aptech Supplier', 2, 'SIGBL-20241119-005', 'no', 2, NULL, 280, 92349320, 2),
(8, 53529, 'Debit', '2024-11-19', '2024-11-19', NULL, 1, 20, 25, 2, '035/0039', 'Askeri Supplier', 2, 'SIGBL-20241119-006', 'no', 2, 'project\\25\\expense_document\\25_SIGBL-20241119-006_20241119153601.pdf', 1, 53529, 1);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) NOT NULL,
  `lead_date` date DEFAULT NULL,
  `convert_date` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `sale_person_id` bigint(20) DEFAULT NULL,
  `lead_type` varchar(100) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `lead_date`, `convert_date`, `created_at`, `updated_at`, `deleted_at`, `status`, `sale_person_id`, `lead_type`, `client_id`, `title`) VALUES
(1, '2024-08-02', NULL, '2024-08-22', '2024-08-22', NULL, 0, 2, NULL, NULL, NULL),
(2, '2024-08-01', '2024-08-23', '2024-08-22', '2024-08-23', NULL, 1, 8, NULL, NULL, 'DMS'),
(3, '2024-07-01', NULL, '2024-08-23', '2024-08-23', NULL, 1, 2, NULL, NULL, NULL),
(4, '2024-08-01', NULL, '2024-08-24', '2024-08-24', NULL, 0, 2, 'tendor', NULL, NULL),
(5, '2024-02-09', NULL, '2024-11-19', '2024-11-19', NULL, 1, 8, 'tt', NULL, NULL),
(6, '2024-11-19', '2024-11-27', '2024-11-21', '2024-11-21', NULL, 1, 8, 'Local', NULL, NULL),
(7, '2024-02-05', '2024-12-12', '2024-12-11', '2024-12-12', NULL, 1, 8, 'Local', 1, 'CPO');

-- --------------------------------------------------------

--
-- Table structure for table `liquidity_damages`
--

CREATE TABLE `liquidity_damages` (
  `id` bigint(20) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `max_percentage` double DEFAULT NULL,
  `ld_doc` varchar(255) DEFAULT NULL,
  `addendum` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `liquidity_damages`
--

INSERT INTO `liquidity_damages` (`id`, `unit`, `percentage`, `max_percentage`, `ld_doc`, `addendum`, `status`, `project_id`) VALUES
(1, 5, 7, 10, 'project\\23\\liquidity_damages\\ilf_remaining.txt', NULL, 1, 23),
(27, 3, 5, 7, 'project\\14\\liquidity_damages\\qr-code_a3trap.png', NULL, 1, 14),
(28, 4, 6, 8, 'project\\23\\liquidity_damages\\signature.png', NULL, 1, 23),
(29, 12, 9, 10, 'project\\23\\liquidity_damages\\23_ld_20240723120821.png', NULL, 1, 23);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` bigint(20) NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE `payment_mode` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'Cash', NULL, NULL, NULL, 1),
(2, 'Cheque', NULL, NULL, NULL, 1),
(3, 'Online Transaction', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `advance_tax` double DEFAULT NULL,
  `advance_amount` double DEFAULT NULL,
  `earnest_money` double DEFAULT NULL,
  `em_instrument_no` varchar(100) DEFAULT NULL,
  `pg_start_date` date DEFAULT NULL,
  `pg_end_date` date DEFAULT NULL,
  `pg_validity` date DEFAULT NULL,
  `pg_percentage` double DEFAULT NULL,
  `pg_amount` double DEFAULT NULL,
  `pg_doc` varchar(255) DEFAULT NULL,
  `project_doc` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `pg_instrument_no` varchar(100) DEFAULT NULL,
  `project_type_id` bigint(20) DEFAULT NULL,
  `keywords` varchar(1000) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `em_doc` varchar(255) DEFAULT NULL,
  `em_expire_date` date DEFAULT NULL,
  `project_status` varchar(100) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `em_receive_date` date DEFAULT NULL,
  `em_received` varchar(100) DEFAULT NULL,
  `po_scan_doc` varchar(255) DEFAULT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `sector` varchar(100) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `initiated_by` varchar(100) DEFAULT NULL,
  `lead_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `closing_doc` varchar(255) DEFAULT NULL,
  `closing_remarks` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `title`, `start_date`, `end_date`, `duration`, `amount`, `tax`, `total`, `advance_tax`, `advance_amount`, `earnest_money`, `em_instrument_no`, `pg_start_date`, `pg_end_date`, `pg_validity`, `pg_percentage`, `pg_amount`, `pg_doc`, `project_doc`, `status`, `pg_instrument_no`, `project_type_id`, `keywords`, `branch_id`, `em_doc`, `em_expire_date`, `project_status`, `country_id`, `em_receive_date`, `em_received`, `po_scan_doc`, `scope`, `sector`, `client_id`, `initiated_by`, `lead_id`, `manager_id`, `team_id`, `close_date`, `closing_doc`, `closing_remarks`) VALUES
(11, 'DMS', '2024-05-01', '2024-05-31', 1, 500000, 10, NULL, 5, 25000, 100000, 'tt4442f', '2024-05-01', '2024-05-31', '2024-06-05', 5, 25000, 'project\\DMS\\event (1).csv', 'project\\DMS\\Ref--No---CORP-8.pdf', 1, 'gr34431e', 2, 'f df sdf sf sfsdf sdfsf', 2, 'project\\DMS\\download.png', '2024-06-28', 'In Progress', 2, NULL, NULL, NULL, 'Local', 'Private', 1, NULL, 2, NULL, NULL, NULL, NULL, NULL),
(14, 'KMC', '2024-05-01', '2024-05-31', 1, 100000, 10, NULL, 5, 50000, 100000, 'tt4442f', '2024-05-01', '2024-05-31', '2024-05-31', 5, 50000, 'project\\KMC\\Tender Doc.docx', 'project\\KMC\\new_protal_pdf.pdf', 1, 'gr34431e', 2, 'qdqdqd  qdqdq  qwqwqd', 2, 'project\\KMC\\signature.png', '2024-06-29', 'In Progress', 2, NULL, NULL, NULL, 'Local', 'Government', 1, 'person', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'LexFirma', '2024-05-01', '2024-05-31', 1, 50000, 10, NULL, 5, 2500, 10000, 'tt4442f', '2024-05-02', '2024-05-30', '2024-06-01', 5, 2500, 'project\\23\\23_20240723171349.png', 'project\\23\\AdminLTE 3  DataTables.xlsx', 1, 'gr34431e', 2, 'sf  fff  sf sfs sfs sff  sfs', 2, 'project\\23\\Employee Probation Evaluation Form.docx', '2024-06-30', 'In Progress', 2, NULL, NULL, 'project\\23\\download.png', 'International', 'Private', 1, 'Company', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'CPO', '2024-07-01', '2024-07-31', 1, 10000, 5, NULL, 5, 500, 2000, 'tt4442f', '2024-07-01', '2024-07-31', '2024-07-31', 5, 500, NULL, 'project\\24\\24_20240723171836.pdf', 1, 'gr34431e', 2, 'tgdb dgdfg d', 2, 'project\\24\\24_20240723171836.docx', '2024-07-31', 'Cancel', 2, NULL, 'None', 'project\\24\\24_20240723171912.png', 'Local', 'Government', 1, 'None', 7, NULL, NULL, NULL, NULL, NULL),
(25, 'Computer Equipment for Sindh Police  CFY 2023-24', '2024-05-16', '2024-09-17', 5, 126065800, 5, NULL, 0, 0, 8100000, 'IGT00380141724PK', '2024-05-07', '2025-05-06', '2025-05-06', 10, 12606600, 'project\\25\\25_20241119143555.pdf', 'project\\25\\25_20241119143555.pdf', 1, '2120IGT2401116PK', 3, 'Atif Sahab', 2, 'project\\25\\25_20241119143555.jpeg', '2024-06-30', 'Completed', 2, '2024-07-15', 'YES', 'project\\25\\25_20241119143555.pdf', 'Local', 'Government', 1, 'Sale Person', 7, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_document`
--

CREATE TABLE `project_document` (
  `id` bigint(20) NOT NULL,
  `doc_path` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `document_type_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `issuance_date` date DEFAULT NULL,
  `ref_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_document`
--

INSERT INTO `project_document` (`id`, `doc_path`, `created_at`, `updated_at`, `deleted_at`, `status`, `document_type_id`, `project_id`, `remarks`, `issuance_date`, `ref_no`) VALUES
(3, 'project\\23\\23_EM_20240703144202.png', NULL, '2024-07-05', NULL, 1, 2, 23, '1st', NULL, NULL),
(5, 'project\\23\\23_SRS_20240627105519.png', NULL, NULL, NULL, 1, 4, 23, '3rd', NULL, NULL),
(6, 'project\\23\\23_PO_20240722115932.png', '2024-07-22', '2024-07-23', NULL, 1, 3, 23, 'checked', NULL, NULL),
(8, 'project\\14\\14_EM_20240723113825.pdf', '2024-07-23', '2024-07-23', NULL, 1, 2, 14, '1st', NULL, NULL),
(9, 'project\\14\\14_PO_20240723113825.png', '2024-07-23', '2024-07-23', NULL, 1, 3, 14, '2nd', NULL, NULL),
(11, 'project\\11\\11_EM_20241031124113.xlsx', '2024-10-31', '2024-10-31', NULL, 1, 2, 11, 'resgg', '2024-08-05', '2221212'),
(12, 'project\\11\\11_PO_20241031124512.pdf', '2024-10-31', '2024-10-31', NULL, 1, 3, 11, 'twetwtes', '2024-09-26', '22212122'),
(13, 'project\\11\\11_SRS_20241031124512.png', '2024-10-31', '2024-10-31', NULL, 1, 4, 11, '3rd', '2024-10-01', '2221212w'),
(14, 'project\\25\\25_PO_20241119144715.pdf', '2024-11-19', '2024-11-19', NULL, 1, 3, 25, 'Out Standing Receivable', '2024-06-30', '688');

-- --------------------------------------------------------

--
-- Table structure for table `project_type`
--

CREATE TABLE `project_type` (
  `id` bigint(20) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_type`
--

INSERT INTO `project_type` (`id`, `type_name`, `status`) VALUES
(2, 'Software Development', 1),
(3, 'IT Equipment', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quarters`
--

CREATE TABLE `quarters` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quarters`
--

INSERT INTO `quarters` (`id`, `title`, `short_name`, `year`, `start_date`, `end_date`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'quarter1', 'q1', '2024', '2024-01-01', '2024-03-31', NULL, NULL, NULL, 1),
(2, 'quarter2', 'q2', '2024', '2024-04-01', '2024-06-30', NULL, NULL, NULL, 1),
(3, 'quarter3', 'q3', '2024', '2024-07-01', '2024-09-30', NULL, NULL, NULL, 1),
(4, 'quarter4', 'q4', '2024', '2024-10-01', '2024-12-31', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `id` bigint(20) NOT NULL,
  `region_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) NOT NULL,
  `lead_id` bigint(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `quarter_id` bigint(20) DEFAULT NULL,
  `sale_person_id` bigint(20) DEFAULT NULL,
  `sale_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `lead_id`, `amount`, `created_at`, `updated_at`, `deleted_at`, `status`, `project_id`, `quarter_id`, `sale_person_id`, `sale_date`) VALUES
(1, NULL, 600000, NULL, NULL, NULL, 1, 23, 1, 2, NULL),
(2, NULL, 300000, NULL, NULL, NULL, 1, 14, 2, 2, NULL),
(3, NULL, 600000, NULL, NULL, NULL, 1, 14, 1, 8, NULL),
(4, NULL, 300000, NULL, NULL, NULL, 1, 23, 2, 8, NULL),
(5, NULL, 100000, NULL, NULL, NULL, 1, 11, 1, 1, NULL),
(6, NULL, 300000, NULL, NULL, NULL, 1, 14, 2, 8, NULL),
(12, 2, 200000, '2024-08-23', '2024-08-23', NULL, 1, NULL, 3, 1, NULL),
(13, 7, 200000, '2024-12-12', '2024-12-12', NULL, 1, NULL, 4, 8, '2024-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) NOT NULL,
  `skill_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_heading`
--

CREATE TABLE `sub_heading` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `isgroup` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `heading_id` bigint(20) DEFAULT NULL,
  `tendor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_heading`
--

INSERT INTO `sub_heading` (`id`, `title`, `isgroup`, `created_at`, `updated_at`, `deleted_at`, `status`, `heading_id`, `tendor_id`) VALUES
(1, 'sub tested', 1, '2024-10-30', '2024-10-30', NULL, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `name`, `percentage`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'GSTS', 17, '2024-11-07', '2024-11-07', NULL, 0),
(2, 'GST', 18, '2024-11-07', '2024-11-07', NULL, 1),
(3, 'FED', NULL, '2024-11-07', '2024-11-07', NULL, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `tendor`
--

CREATE TABLE `tendor` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tendor_no` varchar(255) DEFAULT NULL,
  `isadpscheme` int(11) DEFAULT NULL,
  `em_percentage` double DEFAULT NULL,
  `bg_percentage` double DEFAULT NULL,
  `ad_image` varchar(255) DEFAULT NULL,
  `ad_description` varchar(255) DEFAULT NULL,
  `lastdate_to_collect` date DEFAULT NULL,
  `lastdate_of_submission` date DEFAULT NULL,
  `date_of_collection` date DEFAULT NULL,
  `date_of_submission` date DEFAULT NULL,
  `special_instruction` varchar(255) DEFAULT NULL,
  `tendor_collected_by` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `adpscheme_no` varchar(100) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tendor`
--

INSERT INTO `tendor` (`id`, `title`, `tendor_no`, `isadpscheme`, `em_percentage`, `bg_percentage`, `ad_image`, `ad_description`, `lastdate_to_collect`, `lastdate_of_submission`, `date_of_collection`, `date_of_submission`, `special_instruction`, `tendor_collected_by`, `created_at`, `updated_at`, `deleted_at`, `status`, `department_id`, `adpscheme_no`, `client_id`) VALUES
(2, 'DMS', '123123', 0, 5, 7, 'tendor\\2\\2_123123_20241030102856.png', 'for testing', '2024-10-25', '2024-10-31', '2024-10-24', '2024-10-30', 'no', 'Sajid', '2024-10-29', '2024-10-30', NULL, 1, 1, NULL, NULL),
(4, 'Lex', 'tt222', 1, 5, 5, 'tendor\\4\\4_tt222_20241031130053.png', 'teswt', '2024-08-05', '2024-08-10', '2024-08-04', '2024-08-09', 'no', 'Sajid', '2024-10-31', '2024-10-31', NULL, 1, 1, '12312312', 1);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'Kilograms', '2024-10-30', '2024-10-30', NULL, 0),
(2, 'Litre', '2024-10-30', '2024-10-30', NULL, 1),
(3, 'KG', '2024-10-30', '2024-10-30', NULL, 1),
(4, 'Gram', '2024-10-30', '2024-10-30', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` bigint(20) NOT NULL,
  `vendor_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `country_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `vendor_name`, `email`, `phone`, `address`, `status`, `country_id`) VALUES
(1, 'Abdullahs', 'abdullah12@gmail.com', '02133434334', 'testing', 0, 2),
(2, 'Abdullah', 'abdullah@gmail.com', '02133434334', 'II Chandigarh road Karachi', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `id` bigint(20) NOT NULL,
  `zone_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`id`, `zone_name`, `status`) VALUES
(2, 'South', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_type`
--
ALTER TABLE `account_type`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `boq_items`
--
ALTER TABLE `boq_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boq_items_currency_id_73ec2288_fk_currency_id` (`currency_id`),
  ADD KEY `boq_items_heading_id_8daa5f86_fk_heading_id` (`heading_id`),
  ADD KEY `boq_items_item_id_c7c85ded_fk_item_id` (`item_id`),
  ADD KEY `boq_items_sub_heading_id_41415c83_fk_sub_heading_id` (`sub_heading_id`),
  ADD KEY `boq_items_tendor_id_bc418b4e_fk_tendor_id` (`tendor_id`),
  ADD KEY `boq_items_unit_id_77d218e4_fk_unit_id` (`unit_id`),
  ADD KEY `boq_items_parent_id_a95be6dc_fk_boq_items_id` (`parent_id`),
  ADD KEY `boq_items_boq_master_id_3294e4d6_fk_boq_master_id` (`boq_master_id`),
  ADD KEY `boq_items_root_id_8fe31522_fk_boq_items_id` (`root_id`);

--
-- Indexes for table `boq_master`
--
ALTER TABLE `boq_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boq_master_tendor_id_60aeb4bd_fk_tendor_id` (`tendor_id`);

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
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certifications`
--
ALTER TABLE `certifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certifications_employee_id_950973f6_fk_employee_id` (`employee_id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chart_of_accounts_parent_id_8b283fae_fk_chart_of_accounts_id` (`parent_id`),
  ADD KEY `chart_of_accounts_account_type_id_4ae7a867_fk_account_type_id` (`account_type_id`),
  ADD KEY `chart_of_accounts_detail_type_id_f5f2ede3_fk_detail_type_id` (`detail_type_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_country_id_a5f7146a_fk_country_id` (`country_id`);

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
-- Indexes for table `currency`
--
ALTER TABLE `currency`
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
-- Indexes for table `detail_type`
--
ALTER TABLE `detail_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_type_account_type_id_515508fa_fk_account_type_id` (`account_type_id`);

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
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_project_employee_id_2bd66f29_fk_employee_id` (`employee_id`),
  ADD KEY `employee_project_project_id_00893bbc_fk_project_id` (`project_id`);

--
-- Indexes for table `employee_target`
--
ALTER TABLE `employee_target`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_target_employee_id_385f32e1_fk_employee_id` (`employee_id`),
  ADD KEY `employee_target_quarter_id_05913fea_fk_quarters_id` (`quarter_id`);

--
-- Indexes for table `employment_record`
--
ALTER TABLE `employment_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employment_record_employee_id_f04b202d_fk_employee_id` (`employee_id`);

--
-- Indexes for table `heading`
--
ALTER TABLE `heading`
  ADD PRIMARY KEY (`id`),
  ADD KEY `heading_tendor_id_45f79fa3_fk_tendor_id` (`tendor_id`);

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
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_category_id_03b07192_fk_category_id` (`category_id`),
  ADD KEY `item_unit_id_3876106f_fk_unit_id` (`unit_id`);

--
-- Indexes for table `journal_entry`
--
ALTER TABLE `journal_entry`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref_no` (`ref_no`),
  ADD KEY `journal_entry_coaid_id_86a100eb_fk_chart_of_accounts_id` (`coaid_id`),
  ADD KEY `journal_entry_project_id_de18606c_fk_project_id` (`project_id`),
  ADD KEY `journal_entry_bank_id_e6729857_fk_bank_id` (`bank_id`),
  ADD KEY `journal_entry_payment_mode_id_6d5e0e24_fk_payment_mode_id` (`payment_mode_id`),
  ADD KEY `journal_entry_branch_id_b685678a_fk_branch_id` (`branch_id`),
  ADD KEY `journal_entry_currency_id_fd3ea6bd_fk_currency_id` (`currency_id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_sale_person_id_c86f239a_fk_employee_id` (`sale_person_id`),
  ADD KEY `leads_client_id_b29eb43b_fk_client_id` (`client_id`);

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
-- Indexes for table `payment_mode`
--
ALTER TABLE `payment_mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_project_type_id_44f37a37_fk_project_type_id` (`project_type_id`),
  ADD KEY `project_branch_id_ff91ab7b_fk_branch_id` (`branch_id`),
  ADD KEY `project_country_id_1ea674e9_fk_country_id` (`country_id`),
  ADD KEY `project_client_id_0696401f_fk_client_id` (`client_id`),
  ADD KEY `project_manager_id_3167996f_fk_employee_id` (`manager_id`),
  ADD KEY `project_lead_id_b33b20d2` (`lead_id`);

--
-- Indexes for table `project_document`
--
ALTER TABLE `project_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_document_document_type_id_86e285f1_fk_document_type_id` (`document_type_id`),
  ADD KEY `project_document_project_id_ae197ff4_fk_project_id` (`project_id`);

--
-- Indexes for table `project_type`
--
ALTER TABLE `project_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quarters`
--
ALTER TABLE `quarters`
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
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_project_id_25cfbde0_fk_project_id` (`project_id`),
  ADD KEY `sales_sale_person_id_2c874c2c_fk_employee_id` (`sale_person_id`),
  ADD KEY `sales_quarter_id_b8bf1f54_fk_quarters_id` (`quarter_id`),
  ADD KEY `sales_lead_id_fc35c250` (`lead_id`);

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
-- Indexes for table `sub_heading`
--
ALTER TABLE `sub_heading`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_heading_heading_id_7fd62f34_fk_heading_id` (`heading_id`),
  ADD KEY `sub_heading_tendor_id_122de1e7_fk_tendor_id` (`tendor_id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_column`
--
ALTER TABLE `template_column`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tendor`
--
ALTER TABLE `tendor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tendor_department_id_e10c77e4_fk_department_id` (`department_id`),
  ADD KEY `tendor_client_id_0e24ec9b_fk_client_id` (`client_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_country_id_8460a602_fk_country_id` (`country_id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_type`
--
ALTER TABLE `account_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `boq_items`
--
ALTER TABLE `boq_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `boq_master`
--
ALTER TABLE `boq_master`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `certifications`
--
ALTER TABLE `certifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `detail_type`
--
ALTER TABLE `detail_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee_project`
--
ALTER TABLE `employee_project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employee_target`
--
ALTER TABLE `employee_target`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employment_record`
--
ALTER TABLE `employment_record`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `heading`
--
ALTER TABLE `heading`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `insurance_detail`
--
ALTER TABLE `insurance_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `insurance_type`
--
ALTER TABLE `insurance_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `journal_entry`
--
ALTER TABLE `journal_entry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `liquidity_damages`
--
ALTER TABLE `liquidity_damages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
-- AUTO_INCREMENT for table `payment_mode`
--
ALTER TABLE `payment_mode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `project_document`
--
ALTER TABLE `project_document`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `project_type`
--
ALTER TABLE `project_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quarters`
--
ALTER TABLE `quarters`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
-- AUTO_INCREMENT for table `sub_heading`
--
ALTER TABLE `sub_heading`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `template_column`
--
ALTER TABLE `template_column`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tendor`
--
ALTER TABLE `tendor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Constraints for table `boq_items`
--
ALTER TABLE `boq_items`
  ADD CONSTRAINT `boq_items_boq_master_id_3294e4d6_fk_boq_master_id` FOREIGN KEY (`boq_master_id`) REFERENCES `boq_master` (`id`),
  ADD CONSTRAINT `boq_items_currency_id_73ec2288_fk_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `boq_items_heading_id_8daa5f86_fk_heading_id` FOREIGN KEY (`heading_id`) REFERENCES `heading` (`id`),
  ADD CONSTRAINT `boq_items_item_id_c7c85ded_fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `boq_items_parent_id_a95be6dc_fk_boq_items_id` FOREIGN KEY (`parent_id`) REFERENCES `boq_items` (`id`),
  ADD CONSTRAINT `boq_items_root_id_8fe31522_fk_boq_items_id` FOREIGN KEY (`root_id`) REFERENCES `boq_items` (`id`),
  ADD CONSTRAINT `boq_items_sub_heading_id_41415c83_fk_sub_heading_id` FOREIGN KEY (`sub_heading_id`) REFERENCES `sub_heading` (`id`),
  ADD CONSTRAINT `boq_items_tendor_id_bc418b4e_fk_tendor_id` FOREIGN KEY (`tendor_id`) REFERENCES `tendor` (`id`),
  ADD CONSTRAINT `boq_items_unit_id_77d218e4_fk_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`);

--
-- Constraints for table `boq_master`
--
ALTER TABLE `boq_master`
  ADD CONSTRAINT `boq_master_tendor_id_60aeb4bd_fk_tendor_id` FOREIGN KEY (`tendor_id`) REFERENCES `tendor` (`id`);

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
-- Constraints for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD CONSTRAINT `chart_of_accounts_account_type_id_4ae7a867_fk_account_type_id` FOREIGN KEY (`account_type_id`) REFERENCES `account_type` (`id`),
  ADD CONSTRAINT `chart_of_accounts_detail_type_id_f5f2ede3_fk_detail_type_id` FOREIGN KEY (`detail_type_id`) REFERENCES `detail_type` (`id`),
  ADD CONSTRAINT `chart_of_accounts_parent_id_8b283fae_fk_chart_of_accounts_id` FOREIGN KEY (`parent_id`) REFERENCES `chart_of_accounts` (`id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_country_id_a5f7146a_fk_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `detail_type`
--
ALTER TABLE `detail_type`
  ADD CONSTRAINT `detail_type_account_type_id_515508fa_fk_account_type_id` FOREIGN KEY (`account_type_id`) REFERENCES `account_type` (`id`);

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
-- Constraints for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD CONSTRAINT `employee_project_employee_id_2bd66f29_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `employee_project_project_id_00893bbc_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Constraints for table `employee_target`
--
ALTER TABLE `employee_target`
  ADD CONSTRAINT `employee_target_employee_id_385f32e1_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `employee_target_quarter_id_05913fea_fk_quarters_id` FOREIGN KEY (`quarter_id`) REFERENCES `quarters` (`id`);

--
-- Constraints for table `employment_record`
--
ALTER TABLE `employment_record`
  ADD CONSTRAINT `employment_record_employee_id_f04b202d_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `heading`
--
ALTER TABLE `heading`
  ADD CONSTRAINT `heading_tendor_id_45f79fa3_fk_tendor_id` FOREIGN KEY (`tendor_id`) REFERENCES `tendor` (`id`);

--
-- Constraints for table `insurance_detail`
--
ALTER TABLE `insurance_detail`
  ADD CONSTRAINT `insurance_detail_insurance_type_id_0da6039e_fk_insurance_type_id` FOREIGN KEY (`insurance_type_id`) REFERENCES `insurance_type` (`id`),
  ADD CONSTRAINT `insurance_detail_project_id_e98e04a4_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_category_id_03b07192_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `item_unit_id_3876106f_fk_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`);

--
-- Constraints for table `journal_entry`
--
ALTER TABLE `journal_entry`
  ADD CONSTRAINT `journal_entry_bank_id_e6729857_fk_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`),
  ADD CONSTRAINT `journal_entry_branch_id_b685678a_fk_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  ADD CONSTRAINT `journal_entry_coaid_id_86a100eb_fk_chart_of_accounts_id` FOREIGN KEY (`coaid_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `journal_entry_currency_id_fd3ea6bd_fk_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `journal_entry_payment_mode_id_6d5e0e24_fk_payment_mode_id` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_mode` (`id`),
  ADD CONSTRAINT `journal_entry_project_id_de18606c_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_client_id_b29eb43b_fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `leads_sale_person_id_c86f239a_fk_employee_id` FOREIGN KEY (`sale_person_id`) REFERENCES `employee` (`id`);

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
  ADD CONSTRAINT `project_client_id_0696401f_fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `project_country_id_1ea674e9_fk_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `project_lead_id_b33b20d2_fk_leads_id` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `project_manager_id_3167996f_fk_employee_id` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `project_project_type_id_44f37a37_fk_project_type_id` FOREIGN KEY (`project_type_id`) REFERENCES `project_type` (`id`);

--
-- Constraints for table `project_document`
--
ALTER TABLE `project_document`
  ADD CONSTRAINT `project_document_document_type_id_86e285f1_fk_document_type_id` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`),
  ADD CONSTRAINT `project_document_project_id_ae197ff4_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_lead_id_fc35c250_fk_leads_id` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `sales_project_id_25cfbde0_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `sales_quarter_id_b8bf1f54_fk_quarters_id` FOREIGN KEY (`quarter_id`) REFERENCES `quarters` (`id`),
  ADD CONSTRAINT `sales_sale_person_id_2c874c2c_fk_employee_id` FOREIGN KEY (`sale_person_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_employee_id_6086f136_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `sub_heading`
--
ALTER TABLE `sub_heading`
  ADD CONSTRAINT `sub_heading_heading_id_7fd62f34_fk_heading_id` FOREIGN KEY (`heading_id`) REFERENCES `heading` (`id`),
  ADD CONSTRAINT `sub_heading_tendor_id_122de1e7_fk_tendor_id` FOREIGN KEY (`tendor_id`) REFERENCES `tendor` (`id`);

--
-- Constraints for table `tendor`
--
ALTER TABLE `tendor`
  ADD CONSTRAINT `tendor_client_id_0e24ec9b_fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `tendor_department_id_e10c77e4_fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `vendor`
--
ALTER TABLE `vendor`
  ADD CONSTRAINT `vendor_country_id_8460a602_fk_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
