-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 09:15 AM
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
-- Database: `dms2`
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
  `status` int(11) NOT NULL,
  `sequence_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`id`, `title`, `short_code`, `created_at`, `updated_at`, `deleted_at`, `status`, `sequence_code`) VALUES
(1, 'Assets', 'A1', NULL, NULL, NULL, 1, NULL),
(2, 'Liabilities', 'L2', NULL, NULL, NULL, 1, NULL),
(3, 'Equity', 'E3', NULL, NULL, NULL, 1, NULL),
(4, 'Revenue', 'R4', NULL, NULL, NULL, 1, NULL),
(5, 'Expenses', 'E5', NULL, NULL, NULL, 1, NULL);

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
(2, 'DHA', 1),
(3, 'Clifton', 0),
(4, 'Clifton', 1);

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
(241, 'Can view boq_master', 59, 'view_boq_master'),
(242, 'Can add iso_detail', 60, 'add_iso_detail'),
(243, 'Can change iso_detail', 60, 'change_iso_detail'),
(244, 'Can delete iso_detail', 60, 'delete_iso_detail'),
(245, 'Can view iso_detail', 60, 'view_iso_detail'),
(246, 'Can add iso_master', 61, 'add_iso_master'),
(247, 'Can change iso_master', 61, 'change_iso_master'),
(248, 'Can delete iso_master', 61, 'delete_iso_master'),
(249, 'Can view iso_master', 61, 'view_iso_master'),
(250, 'Can add tax calculation', 62, 'add_taxcalculation'),
(251, 'Can change tax calculation', 62, 'change_taxcalculation'),
(252, 'Can delete tax calculation', 62, 'delete_taxcalculation'),
(253, 'Can view tax calculation', 62, 'view_taxcalculation'),
(254, 'Can add payroll calculation', 63, 'add_payrollcalculation'),
(255, 'Can change payroll calculation', 63, 'change_payrollcalculation'),
(256, 'Can delete payroll calculation', 63, 'delete_payrollcalculation'),
(257, 'Can view payroll calculation', 63, 'view_payrollcalculation'),
(258, 'Can add employee salary structure', 64, 'add_employeesalarystructure'),
(259, 'Can change employee salary structure', 64, 'change_employeesalarystructure'),
(260, 'Can delete employee salary structure', 64, 'delete_employeesalarystructure'),
(261, 'Can view employee salary structure', 64, 'view_employeesalarystructure'),
(262, 'Can add payroll payment', 65, 'add_payrollpayment'),
(263, 'Can change payroll payment', 65, 'change_payrollpayment'),
(264, 'Can delete payroll payment', 65, 'delete_payrollpayment'),
(265, 'Can view payroll payment', 65, 'view_payrollpayment'),
(266, 'Can add payroll component detail', 66, 'add_payrollcomponentdetail'),
(267, 'Can change payroll component detail', 66, 'change_payrollcomponentdetail'),
(268, 'Can delete payroll component detail', 66, 'delete_payrollcomponentdetail'),
(269, 'Can view payroll component detail', 66, 'view_payrollcomponentdetail'),
(270, 'Can add salary component value', 67, 'add_salarycomponentvalue'),
(271, 'Can change salary component value', 67, 'change_salarycomponentvalue'),
(272, 'Can delete salary component value', 67, 'delete_salarycomponentvalue'),
(273, 'Can view salary component value', 67, 'view_salarycomponentvalue'),
(274, 'Can add payroll document', 68, 'add_payrolldocument'),
(275, 'Can change payroll document', 68, 'change_payrolldocument'),
(276, 'Can delete payroll document', 68, 'delete_payrolldocument'),
(277, 'Can view payroll document', 68, 'view_payrolldocument'),
(278, 'Can add payroll period', 69, 'add_payrollperiod'),
(279, 'Can change payroll period', 69, 'change_payrollperiod'),
(280, 'Can delete payroll period', 69, 'delete_payrollperiod'),
(281, 'Can view payroll period', 69, 'view_payrollperiod'),
(282, 'Can add salary component', 70, 'add_salarycomponent'),
(283, 'Can change salary component', 70, 'change_salarycomponent'),
(284, 'Can delete salary component', 70, 'delete_salarycomponent'),
(285, 'Can view salary component', 70, 'view_salarycomponent'),
(286, 'Can add payroll permission', 71, 'add_payrollpermission'),
(287, 'Can change payroll permission', 71, 'change_payrollpermission'),
(288, 'Can delete payroll permission', 71, 'delete_payrollpermission'),
(289, 'Can view payroll permission', 71, 'view_payrollpermission'),
(290, 'Can add payroll role', 72, 'add_payrollrole'),
(291, 'Can change payroll role', 72, 'change_payrollrole'),
(292, 'Can delete payroll role', 72, 'delete_payrollrole'),
(293, 'Can view payroll role', 72, 'view_payrollrole'),
(294, 'Can add security settings', 73, 'add_securitysettings'),
(295, 'Can change security settings', 73, 'change_securitysettings'),
(296, 'Can delete security settings', 73, 'delete_securitysettings'),
(297, 'Can view security settings', 73, 'view_securitysettings'),
(298, 'Can add audit log', 74, 'add_auditlog'),
(299, 'Can change audit log', 74, 'change_auditlog'),
(300, 'Can delete audit log', 74, 'delete_auditlog'),
(301, 'Can view audit log', 74, 'view_auditlog'),
(302, 'Can add user payroll role', 75, 'add_userpayrollrole'),
(303, 'Can change user payroll role', 75, 'change_userpayrollrole'),
(304, 'Can delete user payroll role', 75, 'delete_userpayrollrole'),
(305, 'Can view user payroll role', 75, 'view_userpayrollrole'),
(306, 'Can add Attendance Rule', 76, 'add_attendancerule'),
(307, 'Can change Attendance Rule', 76, 'change_attendancerule'),
(308, 'Can delete Attendance Rule', 76, 'delete_attendancerule'),
(309, 'Can view Attendance Rule', 76, 'view_attendancerule'),
(310, 'Can add payroll workflow', 77, 'add_payrollworkflow'),
(311, 'Can change payroll workflow', 77, 'change_payrollworkflow'),
(312, 'Can delete payroll workflow', 77, 'delete_payrollworkflow'),
(313, 'Can view payroll workflow', 77, 'view_payrollworkflow'),
(314, 'Can add payroll workflow step', 78, 'add_payrollworkflowstep'),
(315, 'Can change payroll workflow step', 78, 'change_payrollworkflowstep'),
(316, 'Can delete payroll workflow step', 78, 'delete_payrollworkflowstep'),
(317, 'Can view payroll workflow step', 78, 'view_payrollworkflowstep'),
(318, 'Can add Employee Attendance', 79, 'add_employeeattendance'),
(319, 'Can change Employee Attendance', 79, 'change_employeeattendance'),
(320, 'Can delete Employee Attendance', 79, 'delete_employeeattendance'),
(321, 'Can view Employee Attendance', 79, 'view_employeeattendance'),
(322, 'Can add payroll workflow task', 80, 'add_payrollworkflowtask'),
(323, 'Can change payroll workflow task', 80, 'change_payrollworkflowtask'),
(324, 'Can delete payroll workflow task', 80, 'delete_payrollworkflowtask'),
(325, 'Can view payroll workflow task', 80, 'view_payrollworkflowtask'),
(326, 'Can add payroll workflow instance', 81, 'add_payrollworkflowinstance'),
(327, 'Can change payroll workflow instance', 81, 'change_payrollworkflowinstance'),
(328, 'Can delete payroll workflow instance', 81, 'delete_payrollworkflowinstance'),
(329, 'Can view payroll workflow instance', 81, 'view_payrollworkflowinstance');

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
(1, 'pbkdf2_sha256$600000$oL0OdDOGLsnL9iAqoqm466$CsRnlsue4mofR0GGQI2+NX195XJUMrenMk2mqZ1twmI=', '2025-05-02 11:04:17.830490', 1, 'turab', '', '', '', 1, 1, '2024-02-19 10:18:22.000000'),
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
(2, 'HBL', 'HB00005', 'Karachi', 'Zamama branch', 1),
(3, 'Meezan', 'MB00005', 'karachi', 'ajsdasd', 0);

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
  `project_id` bigint(20) DEFAULT NULL,
  `guarantee_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_guaranty`
--

INSERT INTO `bank_guaranty` (`id`, `duration`, `instrument_no`, `bg_start_date`, `bg_end_date`, `bg_validity`, `bg_percentage`, `bg_amount`, `bg_doc`, `addendum`, `status`, `bank_id`, `project_id`, `guarantee_type`) VALUES
(2, 1, 'vbcf4545', '2024-05-01', '2024-05-31', '2024-05-31', 5, 34555, 'project\\KMC\\bank_guarantee\\download3.png', NULL, 1, 2, 14, NULL),
(3, 3, 'lx123', '2024-05-01', '2024-05-31', '2024-05-30', 5, 2500, 'project\\23\\bank_guarantee\\db_erd.png', NULL, 1, 2, 23, NULL),
(18, 2, 'vbcf4545223', '2024-07-01', '2024-09-26', '2024-09-25', 5, 5000, 'project\\23\\bank_guarantee\\CORP.xx.08.2023 [name of client].docx', NULL, 1, 2, 23, NULL),
(19, 6, 'rrrr777', '2024-06-01', '2024-12-31', '2024-12-31', 5, 7000, 'project\\14\\bank_guarantee\\Ref--No---CORP-8.pdf', NULL, 1, 2, 14, NULL),
(20, 4, 'lx1212', '2024-08-01', '2024-12-31', '2024-11-30', 8, 10000, 'project\\23\\bank_guarantee\\23_bg_20240723120404.docx', NULL, 1, 2, 23, NULL),
(21, 3, 'IGT00380141724PK', '2024-03-19', '2024-06-30', '2024-06-30', 10, 8100000, 'project\\25\\bank_guarantee\\25_bg_20241119150235.jpeg', NULL, 1, 2, 25, NULL),
(22, 3, 'tttrrr55', '2024-10-01', '2024-12-31', '2024-12-31', 5, 15000, 'project\\24\\bank_guarantee\\24_bg_20241223143420.txt', NULL, 0, 2, 24, NULL),
(23, 3, 'BG5501', '2024-10-01', '2024-12-31', '2024-12-31', 5, 15000, 'project\\11\\bank_guarantee\\11_bg_20241223144706.txt', NULL, 1, 2, 11, NULL);

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
(2, 'Clifton Branch', 'HB00005', 'Doctor Plaza', 1, 2, 1, 2, 1, 2),
(3, 'tested', 'MB00005', 'ooo', 0, 4, 5, 2, 1, 2);

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
(3, 'Plastic', '2024-10-30', '2024-10-30', NULL, 1),
(4, 'tested', '2024-12-26', '2024-12-26', NULL, 0);

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
  `detail_type_id` bigint(20) DEFAULT NULL,
  `sequence_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `title`, `short_code`, `created_at`, `updated_at`, `deleted_at`, `status`, `parent_id`, `account_type_id`, `detail_type_id`, `sequence_code`) VALUES
(3, 'Cash', 'CC', '2024-09-10', '2024-09-10', NULL, 1, NULL, 1, 1, NULL),
(6, 'Petty Cash', 'PC', '2024-09-10', '2024-09-10', NULL, 1, 3, 1, 1, NULL),
(7, 'Checking Account', 'CA', '2024-09-10', '2024-09-10', NULL, 1, 3, 1, 1, NULL),
(11, 'Savings Account', 'SA', '2024-09-10', '2024-09-10', NULL, 1, 3, 1, 1, NULL),
(16, 'Accounts Receivable', 'AR', '2024-10-22', '2024-10-22', NULL, 1, NULL, 1, 1, NULL),
(17, 'Trade Receivables', 'TR', '2024-11-19', '2024-11-19', NULL, 1, 16, 1, 1, NULL),
(18, 'Other Receivables', 'OR', '2024-11-19', '2024-11-19', NULL, 1, 16, 1, 1, NULL),
(19, 'Inventory', 'IN', '2024-11-19', '2024-11-19', NULL, 1, NULL, 1, 1, NULL),
(20, 'Raw Materials', 'RMI', '2024-11-19', '2024-12-26', NULL, 1, 19, 1, 1, NULL),
(21, 'Finished Goods', 'FGI', '2024-12-26', '2024-12-26', NULL, 1, 19, 1, 1, NULL),
(22, 'Property, Plant, and Equipment', 'PPEA', NULL, NULL, NULL, 1, NULL, 1, 2, NULL),
(31, 'Land', 'LA', NULL, NULL, NULL, 1, 22, 1, 2, NULL),
(32, 'Buildings', 'BA', NULL, NULL, NULL, 1, 22, 1, 2, NULL),
(33, 'Machinery', 'MA', NULL, NULL, NULL, 1, 22, 1, 2, NULL),
(34, 'Accumulated Depreciation', 'ADA', NULL, NULL, NULL, 1, NULL, 1, 2, NULL),
(35, 'Accounts Payable', 'APL', NULL, NULL, NULL, 1, NULL, 2, 3, NULL),
(36, 'Trade Payables', 'TPL', NULL, NULL, NULL, 1, 36, 2, 3, NULL),
(37, 'Other Payables', 'OPL', NULL, NULL, NULL, 1, 35, 2, 3, NULL),
(38, 'Short-Term Loans', 'STLL', NULL, NULL, NULL, 1, NULL, 2, 3, NULL),
(39, 'Bank Loans', 'BLL', NULL, NULL, NULL, 1, 38, 2, 3, NULL),
(40, 'Other Short-Term Debt', 'OSTDL', NULL, NULL, NULL, 1, 38, 2, 3, NULL),
(41, 'Long-Term Loans', 'LTLL', NULL, NULL, NULL, 1, NULL, 2, 4, NULL),
(42, 'Bank Loans', 'BTLL', NULL, NULL, NULL, 1, 41, 2, 4, NULL),
(43, 'Bonds Payable', 'BPL', NULL, NULL, NULL, 1, 41, 2, 4, NULL),
(44, 'Deferred Tax Liabilities', 'DTL', NULL, NULL, NULL, 1, NULL, 2, 4, NULL),
(45, 'Common Stock', 'CSE', NULL, NULL, NULL, 1, NULL, 3, 5, NULL),
(46, 'Retained Earnings', 'REE', NULL, NULL, NULL, 1, NULL, 3, 5, NULL),
(47, 'Additional Paid-In Capital', 'APCE', NULL, NULL, NULL, 1, NULL, 3, 5, NULL),
(48, 'Product Sales', 'PSR', NULL, NULL, NULL, 1, NULL, 4, 6, NULL),
(49, 'Service Revenue', 'SR', NULL, NULL, NULL, 1, NULL, 4, 6, NULL),
(50, 'Interest Income', 'IIR', NULL, NULL, NULL, 1, NULL, 4, 7, NULL),
(51, 'Rental Income', 'RIR', NULL, NULL, NULL, 1, NULL, 4, 7, NULL),
(52, 'Rent Expense', 'RE', NULL, NULL, NULL, 1, NULL, 5, 8, NULL),
(53, 'Utilities Expense', 'UE', NULL, NULL, NULL, 1, NULL, 5, 8, NULL),
(54, 'Electricity', 'EE', NULL, NULL, NULL, 1, 53, 5, 8, NULL),
(55, 'Water', 'WE', NULL, NULL, NULL, 1, 53, 5, 8, NULL),
(56, 'Salaries and Wages', 'SWE', NULL, NULL, NULL, 1, NULL, 5, 8, NULL),
(57, 'Salaries', 'SE', NULL, NULL, NULL, 1, 56, 5, 8, NULL),
(58, 'Wages', 'WE', NULL, NULL, NULL, 1, 56, 5, 8, NULL),
(59, 'Office Supplies', 'OSE', NULL, NULL, NULL, 1, NULL, 5, 8, NULL),
(60, 'Depreciation Expense', 'DE', NULL, NULL, NULL, 1, NULL, 5, 8, NULL),
(61, 'Interest Expense', 'IE', NULL, NULL, NULL, 1, NULL, 5, 9, NULL),
(62, 'Loss on Sale of Assets', 'LOSAE', NULL, NULL, NULL, 1, NULL, 5, 9, NULL);

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
(1, 'CPO Karachi', 'jack@gmail.com', '02213231231', 'II Chandigarh road Karachi', 1, 2),
(2, 'cpo', 'turabhyder@64gmail.com', '01231313122', 'Zamama branch', 0, 2);

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
(4, 'test', 0),
(5, 'abc', 1);

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
(3, 'China', 0),
(4, 'USAS', 0);

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
  `account_type_id` bigint(20) DEFAULT NULL,
  `sequence_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_type`
--

INSERT INTO `detail_type` (`id`, `title`, `short_code`, `created_at`, `updated_at`, `deleted_at`, `status`, `account_type_id`, `sequence_code`) VALUES
(1, 'Current Assets', 'CA1', NULL, NULL, NULL, 1, 1, NULL),
(2, 'Fixed Assets', 'FA1', NULL, NULL, NULL, 1, 1, NULL),
(3, 'Current Liabilities', 'CL2', NULL, NULL, NULL, 1, 2, NULL),
(4, 'Long-Term Liabilities', 'LTC2', NULL, NULL, NULL, 1, 2, NULL),
(5, 'Owner\'s Equity', 'OE3', NULL, NULL, NULL, 1, 3, NULL),
(6, 'Sales Revenue', 'SR4', NULL, NULL, NULL, 1, 4, NULL),
(7, 'Other Revenue', 'OR4', NULL, NULL, NULL, 1, 4, NULL),
(8, 'Operating Expenses', 'OE5', NULL, NULL, NULL, 1, 5, NULL),
(9, 'Non-Operating Expenses', 'NOE5', NULL, NULL, NULL, 1, 5, NULL);

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
(76, 'payroll', 'attendancerule'),
(74, 'payroll', 'auditlog'),
(79, 'payroll', 'employeeattendance'),
(64, 'payroll', 'employeesalarystructure'),
(63, 'payroll', 'payrollcalculation'),
(66, 'payroll', 'payrollcomponentdetail'),
(68, 'payroll', 'payrolldocument'),
(65, 'payroll', 'payrollpayment'),
(69, 'payroll', 'payrollperiod'),
(71, 'payroll', 'payrollpermission'),
(72, 'payroll', 'payrollrole'),
(77, 'payroll', 'payrollworkflow'),
(81, 'payroll', 'payrollworkflowinstance'),
(78, 'payroll', 'payrollworkflowstep'),
(80, 'payroll', 'payrollworkflowtask'),
(70, 'payroll', 'salarycomponent'),
(67, 'payroll', 'salarycomponentvalue'),
(73, 'payroll', 'securitysettings'),
(62, 'payroll', 'taxcalculation'),
(75, 'payroll', 'userpayrollrole'),
(54, 'project_initiation', 'boq_items'),
(59, 'project_initiation', 'boq_master'),
(56, 'project_initiation', 'category'),
(50, 'project_initiation', 'heading'),
(60, 'project_initiation', 'iso_detail'),
(61, 'project_initiation', 'iso_master'),
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
(69, 'employee', '0033_leads_client_leads_title_employee_project', '2024-12-11 10:24:07.069849'),
(70, 'finance', '0011_journal_entry_coa_type_journal_entry_current_status_and_more', '2024-12-27 05:36:50.389569'),
(71, 'project_initiation', '0009_alter_heading_tendor_alter_item_unit_and_more', '2024-12-27 05:36:50.584526'),
(72, 'finance', '0012_journal_entry_expected_date', '2024-12-27 07:17:38.227548'),
(73, 'employee', '0034_bank_guaranty_guarantee_type', '2024-12-30 12:15:05.400387'),
(74, 'finance', '0013_account_type_sequence_code_and_more', '2024-12-30 12:15:05.453685'),
(75, 'project_initiation', '0010_iso_master_iso_detail', '2025-02-27 06:24:17.097595'),
(76, 'payroll', '0001_initial', '2025-04-16 05:28:00.609834'),
(77, 'payroll', '0002_payrollpermission_payrollrole_securitysettings_and_more', '2025-04-16 06:17:05.774061'),
(78, 'payroll', '0003_attendancerule_payrollworkflow_and_more', '2025-04-16 10:20:57.120988'),
(79, 'employee', '0035_employee_expected_end_time_and_more', '2025-04-21 07:16:11.538897'),
(80, 'payroll', '0004_salarycomponent_is_active', '2025-04-23 05:04:05.605768'),
(81, 'payroll', '0005_employeeattendance_is_active_and_more', '2025-04-24 06:51:32.786462');

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
('08315htrusrxod95brmvqbmdk9cmp3sp', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tq3ht:0ZhrX00LgumG_fTuWMulshmKVIuNrapiDiOnDK-IZ8k', '2025-03-06 08:23:41.896041'),
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
('192zxumy3ky8admiluxxkhq39kyboyrd', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tv8qq:mqFkrzMGhEwPzAtcwuiqbG7AfR1yhsO7DJmCo8gAcAM', '2025-03-20 08:53:56.968790'),
('1hbtk4kvgz9kqf0u1d8ye03zuckwnazc', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1txLMM:a3He5OGQmJ9sxi9NdWsHA_MpXzSr6rDg2txmGJMfB14', '2025-03-26 10:39:34.076647'),
('1htsm5jh7y3dp2ieag2i67g4so1v8jk0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t0gHW:wGA2AiM4YkAMUPPe32EjoCaTjBBc_29lZ5YtsmA-540', '2024-10-15 15:04:06.706338'),
('1kmq8fxxpiygrlzzw2k31vyxae98zslp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1swDcH:Mb3HqXcKLhzmQB6sB85D4q-_sWFqYPeRT_4BH8EX9_w', '2024-10-03 07:39:05.023576'),
('1t9bl1elv0vi0c8b4zqksxumc038scu4', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tAl3Q:JpvxiVicWa_KfRAmwBjOxJCbJB4LWYbJ6U9O2DinXSc', '2024-11-12 10:11:12.783805'),
('20feqbhookfxph353gpb5xnk7e45bqil', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u4zIA:IsmQhiJE1kB4K54PiPnRzrXImQh2SxmBgjExddboLgQ', '2025-04-16 12:42:50.018084'),
('21rsvxqyiqg47ewq8ytuqnkm8uumnzf2', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u1eRP:nhKbJjaQs3QvaJsh-llmj3_8ZC-2jWs9xaH0_wDC1F0', '2025-04-07 07:50:35.880908'),
('22bfjnzgapag3pcs4dqv1eec7t66grei', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tgGVv:vw05icnQ3am9K2sjmdOtex4mwxucPxdgpXEhKrKDg3s', '2025-02-07 08:02:51.161120'),
('24cb51bv8m2xeriuqtu2eox69cyhgipb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1retqk:cCEL8YjoyAhkCf77YC_7F8TR4FEgJX6jzVuaTAjPSgw', '2024-02-27 10:24:10.895973'),
('24dk0rvxza9ovo02byn9mi5hrrcybgwr', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sMgm0:643x8Z3G_x1lybdbWD2UjNjOrmVNj603H0NY_84VzgI', '2024-06-27 07:30:16.519646'),
('250xu3grm8hvd2srhj95ye3vhypr2toe', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tpgTq:AVYQLdEzrLqgqTvpYKXKRnaKuqxvkYBoFQqQ7276wC0', '2025-03-05 07:35:38.791564'),
('26yphhawyey6wwgjcpxt9fvgs9uytfdc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd3Uw:csDyYEfPoPlnf7zR1PPhbNhSDtWYh7OJWXECGfpeSy4', '2024-02-22 08:18:02.171490'),
('298bxybnh7rs8hl1dp7khn0ylwjl002h', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rl1FL:qPesLAmIwm4zg4k6cdTdrftt5xoPqDzq0riOUKBoS7I', '2024-03-15 07:30:51.164046'),
('29ka2sisdafkwgsr9hp1albzqqxadx4s', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tLHOK:SeNo8YZf0wZqGRWq_3mgDYRYVxX6Wi9lHFsD18v42r4', '2024-12-11 10:44:16.748870'),
('2b33enx80xa2fkz9s92l53whibnqqt2l', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u0FP2:6xG6ZQgKkNQ_mjsjwIHTbaMElNpFjq3U0eJjUzDMKQk', '2025-04-03 10:54:20.588532'),
('2e6yx21b0jlv8efzzw2mxm0vq75cvfod', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk9VT:HGv4LUR5Sntplg3shXS3zNhveIEvc5wR4-g49BUe9Do', '2024-03-12 22:07:55.888323'),
('2jqz6bu3zvserhk9v68p8sqgt7rjz1in', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sRpxI:CUzvuk1dHVNhVU4DKLDnI7RyYQUnjEy9niaSdm54xxI', '2024-07-11 12:19:12.152158'),
('2r2kqtnod1dm6t44iiwbdtkyqdlamut5', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1scJLh:FexEJgt1cjBcbv4VQw4cunoTlEcKdf9MelqXtvlCrb4', '2024-08-09 09:43:41.860997'),
('2recc4jzldcwezvz2g2nfa6oumsgsgmx', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u4cXB:LA_IgNwHP9nh7Zl4T_IKRyicU734sUpur3PXkI2uxgg', '2025-04-15 12:24:49.703892'),
('2swhde8swdkiun85jzlpu06v6qk9tjev', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sVp3q:VBlpNnniis_09Su95aB4dtgodPXvKNYJZs3-Tv_sHYg', '2024-07-22 12:10:26.959175'),
('2wcq0o88yp7b3m0wq4f9t7ksbvuxnfqu', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1txITY:DHYrRfTolEA0Gf1aAMtIb7bQttmByFlTQawZjauchPQ', '2025-03-26 07:34:48.339741'),
('2wu42maixc7s5ja39nsglbmkpplqeghd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sZ5TV:qTSXjMtWiNxdTcAKSTbRFWe1XCoNoM2-cKuzzoDo6wU', '2024-07-31 12:18:25.759428'),
('30t62mvwhysfnpxxvx0qi5d9k86li43g', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u8YxS:GKBIhx28VvUKjsCP_AVq0ZtXFK-A3atK-EuduGyJmUU', '2025-04-26 09:24:14.067927'),
('31hoj009wslx4qj10p02p73c1hdlaxtq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rckRi:tHBV3-hvCySZGkwreZ_NnKK7V0LRMyVNOb0x_g5Or78', '2024-02-21 11:57:26.791694'),
('34zon77jarvazy9of8ok7h1cwmgs0zvc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk0VP:eAB-pH_1MZc7thThh_LIQzSYdgPzPZfXLdwKFfQvFMI', '2024-03-12 12:31:15.905277'),
('38vpwil2w3p1k3jkx10cbpcxgjof1y8x', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sF6DA:6h1qlaLqEKQ2WjczCKh1WnrINAUudhbGXdhWF5EIWbU', '2024-06-06 09:02:56.454074'),
('3ciubmalajura7m8ix3xg0nptpinl4ml', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s0DrA:i5eMzuN676q7AlmeE59YltUcxINpKpX_9oe5xlXIntI', '2024-04-26 06:00:44.146393'),
('3e74wc4xx4p8rx3bvmzqwztw86wgoohv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s3rTd:h-5E7zxDiB4jQTbSbrJecJ-t2jNkjyd0-Q8IdvJh754', '2024-05-06 06:55:29.794982'),
('3m2tx6i405on08iz576yx6mcuvqx6eh6', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tfuHg:SBObI025oM3cTwMJEvlR40LjeOzVaAGTCaZrEaapv74', '2025-02-06 08:18:40.085922'),
('3mnjosd52kbg2ssf68bq7bogh0jsjyay', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u4v2p:-H0cjrdSsSrhUoFkfezLiVr6yRmMfIDSzwZPP7rSOms', '2025-04-16 08:10:43.896272'),
('3np6cp0c754xk2kz16atiohpb0rri91x', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmTXw:VW2tQMFeiJYGQWcD17uOGOippyZ0jzHFgWU7O-5EkOg', '2024-03-19 07:56:04.575582'),
('3owl0ha15pvhdsq47yesgyao4xhfvztg', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u7oVf:skO67Zg4JfprD6zZXsgdzE3aw2UrUn2g8p4mfkKgmM0', '2025-04-24 07:48:27.269841'),
('3u6fteopup8wizcj7cfpbkpgva2zacf6', '.eJxVjEEOwiAQRe_C2hAoHRCX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5Vsry8OAZ1YEbAlGlaPXmSEZMFYbRzwaG0FrMJgjxERee3KYnM3oFIn3B-KgOCs:1t4CfW:vVOoHEiU7W4pmo7VMm6sUy9sO3tqfRdIfU293snozLs', '2024-10-25 08:15:26.000000'),
('3xcdrmzci04wz87dmhrsbwqjwoe6ls77', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkeJr:lIrlgfuJieRU7l3_i0Q-rKZHFfOqdXBc9rhy2DYGqvc', '2024-03-14 07:01:59.135374'),
('417x8a213o3hyzkln1ra9udp9b2balwi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1seqLw:UQZXoZXK5K5xY7Bi2dxGZYzaB7BbTA3FWvOkPjWwsZY', '2024-08-16 09:22:24.933035'),
('41cv6wc1rl7mzts107gna3kuf0k0t995', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sjH3f:wLtOoGTrET3E_aQiWp4mtvuvr3wyXDMsRV4QVAUAMYQ', '2024-08-28 14:41:51.995705'),
('430vc2zlov78vljaro51aarlngu1opmc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1stJl0:dWCwWl_y8mk5X-MtR0WBfWxedfIhn-hEqNF6X69msMw', '2024-09-25 07:36:06.263876'),
('4577un4k7xlisv7o4fw1fakjy7ccj0kb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1skzhs:k0I5d8DsPqyf8YYvR096BMmfO0d43uFUv1qyGBWG4sI', '2024-09-02 08:34:28.269708'),
('4635z0328tka9f0i16ha2zo24gnu9bqu', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t9Guj:nSXUsifLikYEV8XzM99QJCsjYF1LS5Z5MuQb8KNYRW4', '2024-11-08 07:48:05.233859'),
('4638du1oea02fq4nuvi11nntiw4dlnnc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sbzN9:kvqC2khS-8L8sCJYYpZa-ofsFbC4l1_T-lqcS0M8an8', '2024-08-08 12:23:51.726917'),
('4735my5n7qxaykj0ai4wd5cscegy6zoh', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u4fMa:hs91ZCfP9Bm5UQbR9nqq2aTJ30KrnFkglHk8k4rykDM', '2025-04-15 15:26:04.706823'),
('483usoult7sx06gyrxpvjj0nkaq1dkhw', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tPza5:pCahJvsK2bWAoTzz1pfGUhw9VQ1i8thEiNQKD7jzDzg', '2024-12-24 10:43:53.909192'),
('4ap2vmfs72bquik9f6q1bpgw0euwv1sl', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpjgX:v6e6lV0IINxLidmguZAptbLQIBAAt4MKyfjJRZGCBjs', '2024-03-28 07:46:25.032244'),
('4i7ep5yaxy5lyq5swf8we247y9f01b03', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rof9l:dtuAscKB6JU0S2OuS-DTl4sX0tkYupdi89H8zRVQHBs', '2024-03-25 08:44:09.151996'),
('4j6o16a2ubby2got4jrs2prd876c86sh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd1I0:Qhx4nH_d6qPaKPE3RR-Er2EZH1qYQVVpWPUM8o4PbN8', '2024-02-22 05:56:32.139209'),
('4o6u5c8qj46gvferrzmjnphqwean8wh3', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u4Bio:NMSdc5fca5mLq-89zesRfaOPyBRf-_AjTnBg7ZehpFg', '2025-04-14 07:47:02.752312'),
('4q1blv0dtcxgybvhwonccfdd58zmxngy', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1ti7Lt:BONU8v-bNfYYyHe-fAz2XjblReu35vEJJEDenoNpVq8', '2025-02-12 10:40:09.814128'),
('4rqspjmikkyfjomxpuuy6n9ik58a3l7z', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t1elt:USV7pM5kQTlYTlRbuS_KcVE1N9zbIJJrh4hVyDav3VI', '2024-10-18 07:39:29.469669'),
('4wgkw9s00riz72wwj8ouc0i51sewefzc', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tR53c:ZtHOG0d2p2ya_TcE_rYj4P_SY2lkzXOQPXquKGDDxjk', '2024-12-27 10:46:52.327397'),
('4xwvytteuz7u2fxba14twcz86kc80lgs', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sgzfM:WMAObozQag0Zts7TH7Ha-tmXYjFYDx7Vc0cnNuH1esc', '2024-08-22 07:43:20.047598'),
('4yat6mhjtngpzomhpu11xpxr1ssnk4fc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sjwA8:ATj7C5jvKXB64I2EH90aeJ2iZUmswn8SJ1BMZpSsQcU', '2024-08-30 10:35:16.453061'),
('4z7t5lkecbdtxm2jw3du6gdo3x3snuw9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd2hU:ie7gFwsu4LzzkNKohG4NrqMZbIPgdqWYZpbQFVOr-1c', '2024-02-22 07:26:56.281295'),
('58uhk95vtfe2keymmsibppywy2k6x7fu', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u5H6s:Cj9EHX7m-AlpHjitaete5MaW6c48y1Z-M8zyf1ZgGII', '2025-04-17 07:44:22.419044'),
('5c2gmme117u4y6qodx8bn4iz1bahaem2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOWHc:7mZOUaZBMYMl2w_MQF4x3bLjpkrQK0xHzMnlk3JyYJY', '2024-07-02 08:42:28.573713'),
('5izm4ugy2p5ruqfxfhw81p61j4q81ioe', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjXyy:hiahnpmqbfShLwcIDNR3xdNt780nt39djgdWKkQYEAI', '2024-03-11 06:03:52.972776'),
('5kfnxs2xh7t8hr25zk4iawc5pb9arbaq', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tENav:udi5S6TF6uQcIJi0GxlsKWbCLjxvar_oJp2feCEybyQ', '2024-11-22 09:56:45.471992'),
('5neyppat4p90qzwkgd8w4udmoebe2aud', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rxK7P:GzNtDo800tjpOqaiaVjU7qwm5UjDZoZ_usgx1hBsK98', '2024-04-18 06:05:31.121702'),
('5nxji97gnskyntthu724cht7fwzjsmbh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sRPDc:VGGitrXCYZaJHz3tGOGLFjaAbOfKYbgIn-5lzaUy6C8', '2024-07-10 07:46:16.406795'),
('5p96sjoh3esrertjuz4njsmhr0pl83zk', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tR2Ba:pWi6oK-Oxjt1lrfY1mIKNCXPFExp_Q_2V8rPCUakCJg', '2024-12-27 07:42:54.406536'),
('5vbs2oytj1gs5bw0qagrgq6mzkdap8bo', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmVS8:RLOMcBG62u3Oe-gtUTG2nL21mKF4wtO0S-j2ug2I6wg', '2024-03-19 09:58:12.016461'),
('5x1z46kkwhe20u1y5owhetjyhhil0yh3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rsGiw:Jbk2PJqWMwTzwZf3d7MJfBcZ80Hdo-lf6ieR3fk4Zfw', '2024-04-04 07:27:22.715107'),
('5z3ztc83qc9ve5zi5gs6htu1mmn6ki7b', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1soFWm:ITRt-19IYPqO75b363C_IwOjyVAG4jPPSmZaAo01W58', '2024-09-11 08:04:28.484590'),
('62flhudhy4d9r90b6hj8kximcxu6ulpv', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tEN1j:3dDqrGl4rcgLtsxzw5yiEjWQX6YBEp4BBc4H7QCDjkA', '2024-11-22 09:20:23.653637'),
('636blhy87brc5xmawkx1cyazvfcx2vx7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1snbbV:x5y-3P8lW8tfpzxsdbjN986C9mLu_LmGYYfGQhRHDIc', '2024-09-09 13:26:41.490802'),
('63cdz2zykm3g40v5ybs1pd89ib1t1rew', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u7sgq:k20H95RbYbzjgYRzfqPK_xPyA6tH7LllhbguqNtjM_U', '2025-04-24 12:16:16.044009'),
('64fspaf2jw4h70b5oe8v9y9urpe78olh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpira:zJMo5FFzk-g3CrPb4pEffK19WwbQxrFU8mdjz06TV2Q', '2024-03-28 06:53:46.185752'),
('68cwmd2vb1tgy0djeqfd6d6l5c4v8rgv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sgHXz:CSJZI_RnwUctuNflKC8lorsaRPJcFeWth3UMgNvss5k', '2024-08-20 08:36:47.546326'),
('6apwe8aac6rd9r754awwzgszvhbfoqt3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t3Cdo:QYet2LE9zIpcLVGizYoEvRQEYx_dFFRBwbwND_TrkoQ', '2024-10-22 14:01:32.780935'),
('6camtupfpbyyfd3p5cz1wsm8rbh5r1fu', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwFgO:xYpLZ7vLdhfcG-slx3lbtyPJtb4LMy5SNGNlQuo0XTU', '2024-04-15 07:09:12.190096'),
('6hyftrt7s0aw1dwzg94yfthq75du5u9x', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tDiRM:f5EAfAvDaTE7SZafEL5uD9vh8dxxmvmH7U7rmXCcdUc', '2024-11-20 14:00:08.297938'),
('6iivu7ee0b2kgf35z7nylyz9g8fzprw5', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmSbV:N7QDT0OP34iDjlfYIMTFamJ6unfGockyM21Cc2iwpJQ', '2024-03-19 06:55:41.917182'),
('6j2j7nnem78cyjf6k1s2xnbf3mwc2lao', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u0YpK:ErZQx16H35aMGI_gFWfHre_UM00N7xKYkkOsWvbsW2o', '2025-04-04 07:38:46.862927'),
('6rgztgyp9cfraj904tgc6kgdf7wp1gk8', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOymO:t7QIez-BFvEtJgsVjuZMX6QhEclTVYYo_XXxhTP1Hd4', '2024-07-03 15:08:08.624600'),
('6t4g4xhfbcj3n710mhbghovn5tboh482', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpPpu:fgbLO7b_sdZOGl_5N4636P2TrPBjKB3Iw971sz2YO4A', '2024-03-27 10:34:46.176869'),
('6tiwkycnlim4ihghb63fclnqohbgr0rj', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u9LrF:iGEtEyIqkRYgCPhtIsrrk0zqfVrthKrz-tO6DfwCK0E', '2025-04-28 13:37:05.443868'),
('6uiow4rxgjaxrcacn4oqh0n3hkz2if3c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1riSZv:81gMJ_ndofKMLrvgj3BKpEDeChZzpTZYyweTHKRmLKs', '2024-03-08 06:05:31.842622'),
('6v0ed7l4bmr70160ogpcg3s0d8olrzut', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t8eAE:8WE5rzQGcsesYh2n8rvdraG4ju8PCUiX22ATa2ZFNQU', '2024-11-06 14:25:30.339481'),
('6vp6iozuh8x45q82to4bjxcdqdla2qmp', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1uAoBl:skVu3CT-OvHB8QXoNrC01SSqPV_bx70XoxXhZnH5yQE', '2025-05-02 14:04:17.857187'),
('6xnmaofq6kh4v4hsgusjcpyyqeqvllz0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s3uhk:d2cSrt_rjv5jpYqgo6btdh9yDWSvGce0eAyFoB_MUwQ', '2024-05-06 10:22:16.480499'),
('70w0lq2dmz7mq6gk94puntuhmhjc5vhf', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sBTXJ:WF_WQrfpi7cbY6QIQZGkXqxewT0T10CnGrxKlaZkbi4', '2024-05-27 09:08:45.564665'),
('7g31ho4tz0f2vmilkrrys2nxrx79u8ir', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sGtt9:yQYJ0oYVeWOZW3g_D4wzAmsNSdFB7AmDrah9-TUWFpo', '2024-06-11 08:17:43.685840'),
('7tw9sr7xwgxuou8wql5mttqhmvvzp9ff', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rwdDZ:XmpfV9HpfP1N3191MYEqkSSxyWAZg3JnAymHj8WIgTY', '2024-04-16 08:17:01.830873'),
('7vs0fuhpmp4t5hxxbotekpn7powe44dz', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u4YAt:dIaIYpDVRrutBhlo70CND64S0de1F6IRYmLyB0NfeaY', '2025-04-15 07:45:31.012218'),
('7xt3vilffapq5dsr1jlt8hlddviz27cq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnAF4:a-_CUMHXH_Ezj5Tvm0j84cSjcki9_tA2HHzRo044C6Q', '2024-03-21 05:31:26.777192'),
('7zn8t0tgom4prug97anvocz8d718kblt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjxux:5-6HsnwKZYPN-dRJg5TKeXtFtZI-3fI2rmHipjI1Wos', '2024-03-12 09:45:27.292809'),
('8148u16pzcalsqw1pbzkmj16wkb5yotk', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rti1R:cim5LiSBIuI0k0A2p7BbNeR14XJnUM-CugPkqnnLU5g', '2024-04-08 06:48:25.658112'),
('81vhtulslcj0k92q9m9ykxhcbonjzbl8', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u20xf:VPPwKhK77MKF4QSCDaS5lho2cE913VLDT0Bm32ShfpI', '2025-04-08 07:53:23.981794'),
('83y55sqwo5f1njaasy40unlnsxxltrqi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk4yh:rBW7-yaZYQ445-iIgPXos9Q4wQbOoBdSXxC8KH-sV30', '2024-03-12 17:17:47.944459'),
('87uty74d0v656cc3xr4uv3xhcfyfgq7q', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnWee:aP-LrntHYQESfoxE8RboxiHcrhA0n0rLPrhcDNzRcKA', '2024-03-22 05:27:20.381179'),
('8ecrxors5iml7e7ie4fpwdsjh1c11cuh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1swxS9:6q5jJBTbPy6ZYoj_liSMx8MpFxMXBHn3AefSE6i5GFs', '2024-10-05 08:35:41.729030'),
('8h0wehbzgg7e29b7kr7prmwyigll6czy', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sMPEA:PNA0iXUbJZAH-FGosiI-cuOy4xKDjBMplZvGTVLIwUE', '2024-06-26 12:46:10.557556'),
('8l2fekz16e96mi4aeovmcbseskgazwq9', '.eJxVjEEOwiAQRe_C2hAoHRCX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5Vsry8OAZ1YEbAlGlaPXmSEZMFYbRzwaG0FrMJgjxERee3KYnM3oFIn3B-KgOCs:1t5Hro:vM4BAxBhOKpJjN_A0IXFPWERc3ZhRpWuuoUySrftpFY', '2024-10-28 08:00:36.000000'),
('8mgqa8ufgz9p53dqydmsq5t7pry2l8vt', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tkFVP:xCQXXSuZ679SSzOW_rDZxte9DEvpAOoM4C7aZae5HYs', '2025-02-18 07:46:47.925658'),
('8ow1511zetoo2bzpy5yaoxgk0h74e45r', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tS9wZ:Lc5tMGfBYFu7B2AvQxy9kzuU3LKly2_Rp5jO0yP8Cpc', '2024-12-30 10:12:03.727155'),
('9a090hipd9lv8c77py4kxhtnvuf0h1cp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sXDla:rnxAPazTGmOL_F0wH7e7eetONiA8YBHowvV6QhwhQ4s', '2024-07-26 08:45:22.613033'),
('9l56zojspd1gtc6ogg5qu74w67jc70tz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1seT60:YNAgBhwSBQM9SdIGrrGJi1Y6Nyx25uKJBEX2-4eC0w4', '2024-08-15 08:32:24.819172'),
('9p5cue9g2f68luqo4gbsq3ogcpkncy1v', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tLdFX:XF1oXians22g77S2IGnQ7F4mEY5vz-CVH19q-NPyni0', '2024-12-12 10:04:39.317759'),
('9sss9oc8f3uztz4wvjvch9buhvpiv240', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tpLqu:zN0NAiFGKZIjzPhRFeqcuYGHH3co5DimAJR3APyV6Pc', '2025-03-04 09:34:04.424365'),
('9st53fvflns48wmtruxh5cxzelzttgyj', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u36CT:hSoTzFBfpinDUiqhDfHMI6LqCqfC5ALgkYTz-1uhD88', '2025-04-11 07:41:09.582856'),
('9ts166q00whurepaiq74ggm8tb9943q2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sgeHQ:QuM086sF8k6-OKREDZ8iwZ6fPrj2Vs5_IQ-x8mTwgdo', '2024-08-21 08:53:12.795202'),
('a1ysylsg08lv28tmlk3poemxpgvibs66', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm7RU:u6mYn3nuFK7lRjydh2fUVtED9OWEFV3mMouMTjTrjbI', '2024-03-18 08:19:56.709704'),
('a7951pp7lrxezmzf86u9jktny4bo4t4e', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rju09:mlplo9iIoZU_EBlWYfQ6afYaUz4Ubyi9EuTNldbDeo0', '2024-03-12 05:34:33.243006'),
('a7dkjozyrcn0rtmqrerdsktotmamrh7i', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sW8jr:CvoJwQ-33N-xeA3RzRvkUIJwdWVtFSY63-X7sjhlPtA', '2024-07-23 09:11:07.810947'),
('a7n0o32jd5rkv5jtc2p2v5xb4syggoq0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk5ld:2eet6kX_DwcsgI3FFp5UXW-HcVsQfItoccL-FpmPbuw', '2024-03-12 18:08:21.905621'),
('a86ci30hy42n6ll3afsuqw3eqrj94bxu', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t1IGM:9XQXmoL4SrYJqrifA4eCQJ0HbECIWsFkWqrPDPw-DP8', '2024-10-17 07:37:26.224673'),
('ae2mf90x0pe27iezq6x32fkirf11qe6k', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sN3Hd:26AQ4Lp5W7ssoxdUu-mh7vb5MTBHzkeRzbjl5MH7nMw', '2024-06-28 07:32:25.510667'),
('am4v0ppvxuzm1kufm2m279lsi3zr6vm7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rq47n:h3zoVNPvvYMbNq1ZYZ-nUtf7kcagKaokb0ysH5sPr4g', '2024-03-29 05:35:55.481508'),
('aqjuqe5ivp9v10zae1ycqkhvlc3ipx12', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t1LE6:dJcWOxHzG3-cH3IVqfnO1h73S3osJau70uWwKbrRNw0', '2024-10-17 10:47:18.287098'),
('aqtefq2jgd2oz8h2kia9jsrtnpq8w5o7', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tswPz:stK6UFYA3dMEbKXHzK2R8B1hqY8GZ2S2ZDfH00Nhgrg', '2025-03-14 07:13:07.193409'),
('atdf77djbvg5d3vpkojhow6scrxivm8t', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sy4x7:GGAb5bcYhL38-mIdX8eM6qL0rEB1wm_yQFKUmhJqDJI', '2024-10-08 10:48:17.059910'),
('azoypnuq3vinlnf4qs0utsx0uy2ufv6d', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rl0Rv:CfF-gURCb4a9Z9TOMj86QszjloLqyBS-2W-J_BfxIn4', '2024-03-15 06:39:47.983253'),
('b0rjj8ejmewh4arl7n2aex5k6ddboyuc', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1thLZM:-vyvxuchKk4bAAcgx08ZQXtYoxubMAXAeIkCDhuxCNk', '2025-02-10 07:38:52.873781'),
('b1gqustwbfmxf39afr10yfmeofeu4bu4', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sANf4:jojBPChwrZI_U9aXIrtvBAnJD-9JRA2N0Es_ImOnutE', '2024-05-24 08:40:14.962682'),
('b89b76ogo3pvo085mqy24ujdjjtwzpfv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfYjf:bV0sy6yhIpqxICsf5PHGRKIFJZtD3swCraisU5TzgNc', '2024-02-29 06:03:35.458415'),
('bc104ni4vaat7n1jmfspdloyl30s90qp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7CI3:I_l1VnKVX1UCGckLIjXW1ADHeSeHORQUSKxvxamomKQ', '2024-05-15 11:45:19.800451'),
('bcfkzql4pql0v6ydpqwx7sy1d96ebfhj', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s8vQJ:JSNfZd4adK3Dj5Mw8P3ZzRDIXuE6d6qt3qjm0epxWVM', '2024-05-20 08:18:59.709870'),
('bcirzeek72ti0evhll6yuw7hnayzzy72', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sDzat:dnNZXruvfPlgYnmCA44xO2usjL2rFapiDUl1llDPJTU', '2024-06-03 07:46:51.720019'),
('bhvu1jmxbgggeoa9ug79e6rossczxvj1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sq82Y:eFH7DagTzQfR6ZFP5ldPgVvm3KG3-e7o-Wfsr0c2-iI', '2024-09-16 12:29:02.508407'),
('bihutbwss0l0fg3hs1yl0mzcoosbio74', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t5fuv:VrwYPcVoF1xjWID72an0Hq8RwsGA81H_ySc_onIGkKw', '2024-10-29 09:41:25.862021'),
('bis2363pys5627qn6ju0gvetk7454pfe', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkI4B:Sw4a_o2IdbdmZs3qoGR7LcQig4BEaVW4shSKhEip548', '2024-03-13 07:16:19.661937'),
('bjgc5nypk6p2z1kslckos3hi6659bv8m', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u7Upt:YaotKWU3xhpxbCVgk-Ev3RmwiMifoI2G2Mtiah0SRKQ', '2025-04-23 10:48:01.930393'),
('bjltyv0zcxtbub1aekqpq47cyh7hbu1n', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t0xjT:d977ADy_jBmMUKog5tsJVFYuvOuU-0lWrgvA8ZVsvDo', '2024-10-16 09:42:07.337119'),
('bk7uyc2rdx2v9xg7pz1ieybunng7r68m', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1txezz:5Y0rxM795-VHQ2kxw9zc9le4GHBAOI918-Tpo3VK_Mk', '2025-03-27 07:37:47.478192'),
('bou3prplaacwy2kf5kaekk8ztw6ygym3', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t611A:MhY5O2jyLrpEeGITmRkOzpEd8u71wQLvO2Zf2xGsA9o', '2024-10-30 08:13:16.552435'),
('c3pu131q0jxyq1cb5f2xm0hur6r5lj0w', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s4Cjr:63CCbPJbj_LTkeQwYApG-xvMvvI1hnsmjrlMxeOKbPs', '2024-05-07 05:37:39.330606'),
('c5dtoulf0d7mp8c86k8g4nggyuhyvsz8', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sTDmz:vKpG5ezyefvQG3z512qJcTsIrfoeSrWL6bz-BqEYHP8', '2024-07-15 07:58:17.758147'),
('c74c8eif1e4w6qu2br3qzpmwfsu0l0k0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sbvBv:zbgVCp6NNjprkt69OVPcY3BZa9AfAGjgvZDImkjVKzM', '2024-08-08 07:55:59.097150'),
('c981btkhln3g02zpzrpn7u2tdvvxi9hz', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1thi3b:oNxxykfVZJry9J4Ir0W133qbl-DuwQoI5tZIkVeeHzI', '2025-02-11 07:39:35.748042'),
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
('ekoxgblu2lgpmwecrst5hkz9e1uyh3vn', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u5gM1:czh73tXe2rDS8cnzYap4qtl5ktz6bsUDIi-3hJZl9kw', '2025-04-18 10:41:41.669819'),
('erxjfj590w97g3eewo5lz5o67g82rrtt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rc0r6:qKitkz057jMoj7o_2_sgrBJJWOS3KMPlR_Yqc_zID_Y', '2024-02-19 11:16:36.653300');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('et1cfcep2x0cloeuybbu9kzr6flpd3ho', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcefC:64dy1LHw29FaeWcSC4PKQI-E2iQg3bz4af5Er-IXyCY', '2024-02-21 05:46:58.075412'),
('etg8nn1ddpcnk11l8n2s6yjua076i29j', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sM2yz:FNjUuzAAfGjXcpMnxvJHauDNxPGm84xpvtk4L12pWc0', '2024-06-25 13:01:01.402693'),
('ewh4s0b2up67otgazka2vtk1gfh6yriu', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rcKkl:prPRAqCNDLiJqa6puARQS8PHt0WEYbMmuukkwQ6ylKQ', '2024-02-20 08:31:23.983902'),
('exm8gs6bh8hncgr2ujx12zpgo9o4gimm', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sCZVD:jaw_ep4XFwK78HdK6vyqDEgHynQu5vWYEn2McHIhakY', '2024-05-30 09:43:07.183440'),
('f3gf7cvix957t7tuah2gpidrlqq04h2w', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rtirt:vgCsBMm2z_pKSdOfcrjvuf3QDmDgTfXZ5vO5LPxhi6A', '2024-04-08 07:42:37.586006'),
('f3hi23ut05ccg11yh2505wyllioz7fdc', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1kTk:_bjUxm8l-QmA-x8WlUX5DqTTp_GijZi5AqCfTXlfo_o', '2024-04-30 11:02:52.979819'),
('favv5kbjlip5kxtpaycfiw5nflqjuadh', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tnb3v:ARBrxDPPm9YNoeSOtBT8MnjdhXNhDN8rTB803t7fF5A', '2025-02-27 13:24:15.805201'),
('fcitq2psbvhimzfnlc75if9t7a7raatk', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tCu7m:hiKtxuuNxcosHoxzHeBztGmpb4duYA3KJCIbaELgbVE', '2024-11-18 08:16:34.631231'),
('fl77z81qaiox0ab1vdqcs9jd8oqxa0ge', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tn9MA:o4TrMVL9whwi_YhhIMUPhMLrjRzuaZ2_7-DzAi-akLA', '2025-02-26 07:49:14.386106'),
('fqsas8gkzwtoxrra8sm30lhewi9lx6w2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1ru2je:CUlGDkZy8F9vF9mMHqFIAFlagNF3jniliNYbET-izs4', '2024-04-09 04:55:26.905361'),
('fqvea36ufmm0j10msv6xouzzotg2y6zj', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1trr9H:rMOGeCLrBdVB4GdjUdgeGxaHh--L6_uCVDhMr51vVho', '2025-03-11 07:23:23.546444'),
('fx9dhy33i3hrbet4yk2pt8ebt7wak1dx', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfwNy:mHQjL9MaBJPeDX7RHV2mbZtiMq41Cbg4jfvW_m7Ej6g', '2024-03-01 07:18:46.793489'),
('fyagylgb0q2zapp06795o14mps6brvpt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkhAA:gkHlvWY9U1LeIerrMt1h8CNzmsHC94saRIcYMGjJIWQ', '2024-03-14 10:04:10.646251'),
('g7hlwpth9su9oyq15uy913ohb8q4ewq5', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sq3Zu:ePfmfiJNwONhQft9zSb_OajnoQp49xsicC6TySs6vZY', '2024-09-16 07:43:10.903949'),
('ga4kqe69o39ikrinr10hegk0ey1ow2nz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s2kZK:5zTtcsgKbYzjKjrzxFLj8uyg_4IUhxzBIoHnBCe7ibg', '2024-05-03 05:20:46.375875'),
('gjqljuzy306vr7i5fcpwb3m64tcncldz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sdjMu:kK_G13AuKcsFNHopdG2JYlLbabvE6U-fumSupx4QW2c', '2024-08-13 07:42:48.633476'),
('gkyc5iy9qfzzjilo8x3tmc5ht8cn6ia6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1ry3hC:eZAYvzhBHubSRoWldC_x5g2r0nQFX1bCY0h16ATBGlE', '2024-04-20 06:45:30.751323'),
('gl7nw17yo7qu2ljb2oe6m7i442l0xfah', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tntdz:PVDx97temwHsg6sCM3YsWQH_jZ2k9yH9A5GDy-KOtOU', '2025-02-28 09:14:43.665320'),
('gmmd4wgskomj9nyvqbkyyvxhgqyiiuyq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhRBX:JqxZxMZYdUys3bM6Ab59rz4S8Mblkk4p51P1rWN3nGU', '2024-03-05 10:24:07.250116'),
('gnrrgkbunovvbwulkmngbzes17wo8py7', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tmSoc:o1Ay93jGlQ-c3y3JGbHkkpjZoEPOXzhtrGy3HjSCCi4', '2025-02-24 10:23:46.174447'),
('go2f01r8yp6j63u5c930y1i341de6grv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rynH6:juGWASfdN-uYiE1EFVomvUYS2eAddpNPP3dQD-G2dMU', '2024-04-22 07:25:36.384981'),
('gsjnuj407k9q6354nhjx0270h4mfgyln', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7YaT:O13Ke-LOS-umqeVgWA3r5i9TXqgpLm8qeeXvbouCDNE', '2024-05-16 11:33:49.403576'),
('gthj1jwc46jx262avz8u4y0kvrp678ws', '.eJxVjMsOwiAQRf-FtSFAebp07zeQgWGkaiAp7cr479qkC93ec859sQjbWuM2yhJnZGem2Ol3S5Afpe0A79Bunefe1mVOfFf4QQe_dizPy-H-HVQY9VubyUGRigRZayzpTMmhUWYSIoP0WkAwzhtJIblEUgVwyktAUgBSY2LvD9ThN8Y:1sOXYD:2eZfK-HbWsnr09s9y0a00tUQVBMaJ0BBJs7Fbn_pE5E', '2024-07-02 10:03:41.004964'),
('h2nfb9wea11v4255faretczpo3g9khhg', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u6loO:6R01w2jNow4RWzyptRctN8H2mLQtTGjfNv-y0_g_twY', '2025-04-21 10:43:28.020496'),
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
('ig21fmznl1jxhs48jpj77fy1bh8lsgum', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u2jdP:AIKSVH_m4I8Jji0RlMBYdCq5QzFczoBe3DB5WvUqRn4', '2025-04-10 07:35:27.220605'),
('ikwfivif7s0f6ad1cpy5x7soy5rt7ifv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rh0Iw:IY2gsXhQMhawZNmQffmy9CZE4OVAyLT-pQP7w7EU7as', '2024-03-04 05:41:58.112039'),
('ikygmn1b0100fejntgvkusw5jkzyqqx2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpLGH:Whb73ppENeouAT3kZzDfOTdyxKjeUxMHvzWHaOU6T4I', '2024-03-27 05:41:41.490198'),
('ionog86obd8957j1x2izcuapmahuu7ue', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmpGA:5GjXIUzvVlTdIroHOsHv8QWz_jwi5AQeFrxN0so_hY0', '2024-03-20 07:07:10.328466'),
('iwg73jugmommfjstrvrc65nzxtcge9hh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpN8O:5wFqnQP4_CpYQDaQt0fZbJaAerbSoqi8gGzPUw8FlfQ', '2024-03-27 07:41:40.753103'),
('ix8h74qn06z2lszpaooewmoawf0000ej', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s77kP:A4XEb-rvndSHI1MVMvHg7Lc03F7DSS9iKOMqAMvk_qo', '2024-05-15 06:54:17.624955'),
('ixir296czvuzp4gjbf8ckqd8sp0s530o', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tPbDG:t8o0fcYPMxPn8BYtIGTsT6V8-O5y-HQfarVChCcXU6g', '2024-12-23 08:42:42.367906'),
('iyec4y5hln2gbiynq094pshdsvroq4r6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sQgE6:1PU1kBpnvBnfseuCW3yVkZEQ_mTzB4EyK7-WnE3cyTU', '2024-07-08 07:43:46.571355'),
('izb1vopn35voyri4pzsxb0nmf9x6pi3y', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1ri5r4:NMIitZt7wMHAe-er78tAxBtXRFEvoMH4BJ6qX3s8mDA', '2024-03-07 05:49:42.094215'),
('izv92l7fr8gtuy9fv8exbjp0zir2xxfx', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOa2X:xiD-plIixzf8swLoDl9g4frvCRBQCy6XaFMM4jzallo', '2024-07-02 12:43:09.021373'),
('j1ogjii8toeqfobds66oncnzyndgmwbo', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7vAQ:MyYh0VvrE_OEMm0wUBPFlHcqiZ0fp44IMFzF7U1msf8', '2024-05-17 11:40:26.341002'),
('j4dhcbfvlbsndy26n79no5og1lvvjab9', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tEREY:MJoHoNPhL5nopMMyavGUBQWSmynoD2_Q2B42NksAZ2M', '2024-11-22 13:49:54.742071'),
('j4g2dkn7icucus1pee7j89zeti52yvgf', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t6NAV:dJdK3_uYZtqRAbWpuDV9hKiIBVyqqAMuWNXmaQtTx-M', '2024-10-31 07:52:23.555070'),
('j5o7kzfv4uuqsiju0viea44qmq3l1iq7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sKVxH:1LnW4oKqWmcoyURrjAE0oS5iCHJScfw4Rc2TY4KETGY', '2024-06-21 07:32:55.113121'),
('j8fuiplb6vpsrosd5iy2ljzirbtp4cn0', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tmSDH:aI6UXsH0gHsVXzVwKcgufkNqDVjFZ4c6OfCRbH35NcM', '2025-02-24 09:45:11.916642'),
('j8j2y6uuyux5tax8xh6mjodm54x9r5mi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1Lb7:PI_ZGQZkIZ9Z8i3gCgQVysjbYM7VhCKEXTwUSNV2x5o', '2024-04-29 08:28:49.643327'),
('j9bddt8awsjvoq4bg4gi0lk7e0k2cr0s', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s8Cix:iAAlR7HamwXi9jC7pqMwGFL-aKavCj7zbMTI2TM7XEE', '2024-05-18 08:35:15.753464'),
('j9l17qrewlnphejzauaatsknmpy2vozb', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk6rS:t41xtOJr8HeHysK4-AgEWl7ikIDwCz01BE6tqp54_iQ', '2024-03-12 19:18:26.317575'),
('jaboe8a7mrdaek6hrmchw1ckabwabcmz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rxguN:5xK9KlLQidajwWLovLWN8Bgp4aJfMf15Dd8khKjRmLM', '2024-04-19 06:25:35.844910'),
('jjw7kk2n3v28dry7nmnb08dztbdxu22g', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sfz45:nbwtnEwiiA1-QkIf8cCdBVPOlFwG2akYKCfpFvBVAuw', '2024-08-19 12:52:41.204008'),
('jp0nxcnjn3n09ivb41gqzz0q84zxnoa9', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tDdLx:CXnkr5C9mkQPDZf_ZCnMo64S-itCEVWGXX7lE_57x0M', '2024-11-20 08:34:13.886056'),
('jqwtkyy0fy3cxctkup6hsa34a78swdy9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1JBa:Te2NcOLCF87HPVPtLg3LQGknO-3FXPcKVp7AUlzFUTM', '2024-04-29 05:54:18.923368'),
('k2zqiuqte95dsa1ydnavgw1ljkymgg1t', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rk8Y6:edaor3_E95HxOkGMT-XSqBRYMPXQfxPv28IQXdiAIcc', '2024-03-12 21:06:34.258204'),
('kkx5q0erbis374wh1u1prmzkwiyqe5ro', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tPwiO:QgCQZKwubjnlDAlVjaTpCY6sT3KcMfznFcCJ4aqLprg', '2024-12-24 07:40:16.564360'),
('kox8hmzqmmcahdplp3pknrq0gnh9sr1d', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tpJk1:AFpzNaPlhbCNoZJ-8gtyI51VQyXLP4_cV2B7sETIuGA', '2025-03-04 07:18:49.370640'),
('kp0qljndk6a7ndb88pit55eka6jy213d', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sxjzm:ZfRUJJ8tYsGCxvZ544tDHkNH341f5XSXQpWX1aRgduM', '2024-10-07 12:25:38.109005'),
('kvn7mii02i9711qp8e06uv9odvor2len', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s79Dw:6FXZhcWoLQejRnu9QbwDJaNrs2KxP9aQRDqxsJYdYCE', '2024-05-15 08:28:52.759182'),
('kyhqbue1i5z971hwopnue2ayulehai46', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sm4QT:p7je0ObBnb-g1XHYw_FbzVKJlGJ4DK2P0Uq_1qwjwew', '2024-09-05 07:48:57.118754'),
('l263mfq77ipbedmihsandcr70cazao46', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sRlpj:e9GhhWv3ljA5Mt2VKdjiHnGAU5HTjJKIg5LNTdkwAnM', '2024-07-11 07:55:07.381641'),
('l2obl6wdc3y1jlq3z5f0d48on0hv9sce', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1JBb:PXxDm2iG85FEIMeY-SU9A_Ap4Dw2VGY0fkuXsLpvW8s', '2024-04-29 05:54:19.149246'),
('l4desebb00m1ss61wooy6iznv2xp0na1', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tnsET:ZTDIvq9miGgVIL81zAXAfKrXGsLZwqn8vhhKVulD5g8', '2025-02-28 07:44:17.840351'),
('l6v7vr9dfia49nlrk1q8bokvfcthrnfi', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tmWOn:LRDCU63mOZTsvctzUZRhasosYLRJcxp23QJDVvklMgI', '2025-02-24 14:13:21.498776'),
('l8xwbyda85xt0oa4ufhdhn8ogm5tfi0b', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfegz:IVeT9qQoLlKPa26eG0lUaFeBXlnEqgn30l6kfMPjqH0', '2024-02-29 12:25:13.451918'),
('l9qi4e5izk2wqkndw1xok5vebw376bhc', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u5dXB:Y6LHrM23x1ISqU_M3TfxdyIIw-BkuEFmIBlRHSRB_Ys', '2025-04-18 07:41:01.941136'),
('lcevjyr9hj5vwgkllf9qvuysfwoflz4k', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhTpc:EkqSuMYQoDDBdv66z8ftrtuzvfBfRG4yAsFAfnoj8lc', '2024-03-05 13:13:40.295421'),
('lcnzoy0mvek8cqmjcl1a33hl4qdt2ae8', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1shM9y:4krojwZegdeF-N-c1onwgJ-r28o00-58-0dsrRmMu7w', '2024-08-23 07:44:26.574222'),
('lgxj7eaamwiqc8pyuvqdy4j0td2k3nh4', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcJ2N:OOaKVozljadP9BaubJGuOx8urSAu9SSlM9OZMaE355s', '2024-02-20 06:41:27.209002'),
('lhuaykick0800lig1mu69fn1nl03c8us', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sN6B7:nT6eYX-6NdgGztby98s-qlEP4wIypg92JDfultMGH9Y', '2024-06-28 10:37:53.611714'),
('lta3qaaq9y9yuj38i05raux3szrcphbn', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tu28L:BGcqZyB869lbZEaGAoshGp7CjQqrrKfVvXa7wqR8u3Y', '2025-03-17 07:31:25.342777'),
('lvew4kppy13lpeqroichz8m1abyubjkq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rja0s:ZinIpLFFYk4k7gntEBSrDtMFyXYyVVA_xZQN-LIA9ZU', '2024-03-11 08:13:58.241059'),
('lxdc87g78bmr36vxoas5db2sltbbq3el', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u9I5u:3a7mfmEhgfx7AaJEG3bSewR4m4JKH8RWk-cbBe5fwaM', '2025-04-28 09:35:58.441438'),
('lyfsucek04buf9m23eeume7yida99c0g', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u2oL8:hXd8AuCHIGYrX1YRUdeWm_yDg8FMePv-IRA9gvUIt50', '2025-04-10 12:36:54.714065'),
('lz8ewq0zzr631fp53mq3ze42z82in6y9', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tvU2C:YwEQdOvN3bTwDBHf4wJIYBNhODRgqdHkXexd01I96DA', '2025-03-21 07:31:04.872105'),
('lzpqc9drgy9qdd6okdh06pa5n1cqzcgl', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tmmbJ:fun-zvnAB-bkAdqUvQcglmxliLiteJNjsi6Nc_NMxw8', '2025-02-25 07:31:21.744921'),
('m4fvblqo91hxrnf6rih6d425xie7jro1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcPog:o1wBGgWCSuu22WtNe0X6fUpySkv0QQvK72QoCaK61HY', '2024-02-20 13:55:46.474066'),
('m4h579qdm5kgovvkd0428fa10lvv2wa6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcMfO:0jshP5sHrcobxb-0iSh9dDVbJU54FKhbrY-FiN9X8Dw', '2024-02-20 10:33:58.802704'),
('m7y7m4pbquf0jm60n34fqg76zgqswegw', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnC3R:fbyms3xv7DmESkXu3UI7uhuamgqGVPxaL5POyBUQkTE', '2024-03-21 07:27:33.277016'),
('map7n89bfl2xtv7cmv9uo04vnx85cx1m', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rc1fy:8LU_i2gKwXOhdC3zW63Q0tMmy7cgihoKnL4P8Z8ex1Y', '2024-02-19 12:09:10.587423'),
('mb37jnahjhgoykx7d37n6jcmt5m0bagl', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sdNgw:qTtWvCPv1RFpIDzGVpfCgaiX4G-MNL1AOEY3vOLTfuo', '2024-08-12 08:34:02.203006'),
('mcbfgsfkr0t57p5ldflphlacxknmaazr', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sZlH6:YSV2DQDfzgB9vOpv9p60aP5EROEO032F_VPfdH7jey4', '2024-08-02 08:56:24.280710'),
('mfjed3057h99qixtmbzcy8nyypeeayr0', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t8vIB:we-O_a3oU3NHDM09dK-8eczAF48ggq8XuDLdhMOKw-M', '2024-11-07 08:42:51.914980'),
('mfz8n55rmiolzohirqm1jxouvhucvjg1', '.eJxVjMsOwiAQRf-FtSFAebp07zeQgWGkaiAp7cr479qkC93ec859sQjbWuM2yhJnZGem2Ol3S5Afpe0A79Bunefe1mVOfFf4QQe_dizPy-H-HVQY9VubyUGRigRZayzpTMmhUWYSIoP0WkAwzhtJIblEUgVwyktAUgBSY2LvD9ThN8Y:1sA2ka:ylCW_xEdZ6yftU1beC7SuEwLgY21eAbTl8eOxnQIliU', '2024-05-23 10:20:32.825209'),
('mgedxtjgdykqi0huoi9nbf1uty6aegoj', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1toxIa:d6IPv6B5_CVdL0RImbAldgLwQsxCYTpcRq50VPHqYQw', '2025-03-03 07:21:00.978650'),
('mi6h03uilvqslbac0dglz5mmzvowuisp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkKRY:ATUsQtrN-nDe68Ju5vJcfKFTHGgM-XHZxhx8SsafGRc', '2024-03-13 09:48:36.093117'),
('mjaql5uqz4dnvambcwib3gsm5qyrukav', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sFRWr:zRSSu1pFv3-GkQyQpgwQzaWa-STSUIhwcJpjKdEnwQw', '2024-06-07 07:48:41.547141'),
('mltpqzs0pn9q1td7s541jdter0l421bj', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tuQ0T:bM3X1un9jyvVj2gMfL_Z99oLIDRJY-5zpI6eZNri2xQ', '2025-03-18 09:00:53.742782'),
('ms47cj0pghittkgxk5q96qz3rj3x9int', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sWBiT:HB_JZ_5U8IsyxI9PM5b9KNXE9o1cZGdprD_8BkcORco', '2024-07-23 12:21:53.960469'),
('mt5hzuqyt58dtudradr1of6u6txv9ze1', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sLyEV:CqC8rnW9ZFKNeuTKwDcu6wk9l8S4YsQ2KRYKsNT17l4', '2024-06-25 07:56:43.794846'),
('n0rw6ydczlfxtqquywyk9lhego4vxsha', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t6Pz2:3reVqIk0Ym-NXqx1VvWk3LeRB2LOkaAc9nx2oNwCJ1A', '2024-10-31 10:52:44.429406'),
('n7f0ybm7skne429zfi02hg5wi8cb4as6', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u79sm:wrUkNZvCvh0FzM2Ui0a0PUOXUgiqt5gzIHC2itpCiTU', '2025-04-22 12:25:36.100815'),
('nbwavi4523mhd3gz8k5d7jbh5256dwik', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm8cs:nrJ694dLUpvj7Y7hOihT2AOvHgy8ERE_DFgcHoGPInk', '2024-03-18 09:35:46.620919'),
('ncz7jg9w5uouz01xrhk09z3tcwch7hr3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sylUL:5zg17kXbAMVftUtxNiyY0-plW8MU6A-9uFU-tly-fPY', '2024-10-10 08:13:25.733552'),
('nenz1zkvyldvp2e7rxnenagldlf4psk9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7w3O:bYqONFP8NubRK8ffzamM6_-a_xZjWc3kZJu88Mj5mvA', '2024-05-17 11:47:14.190933'),
('njjztt3yyknvm5utsfxb3nunffr701g8', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u8YM8:ZbOLr_XQsbnK4tZAAVgi3TzEU_u371Do0ls_BN6e1Ao', '2025-04-26 08:45:40.559622'),
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
('q0sw2nmgvu9ufywyeimf3ja9h6r0sdo6', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tQfoV:HkaXzcgrcL-m4SMGuU2dmhRk4tS4zoSNjPjZY3NmEd4', '2024-12-26 07:49:35.314825'),
('q4zvzvgfuoxerdknj4nm8lzgtkxld52w', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sy21D:MT7UrSri9SPArtZuPcyqqU4YEFnpcHwli3a6vXadShs', '2024-10-08 07:40:19.048131'),
('q5dzcd3h2bfyqdd376dsljpa7a5gngkj', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7SzD:zN-cgrrYqvdAuZ0ftKlvUzbhIVBi7gdVILPPFdY7xDI', '2024-05-16 05:34:59.414433'),
('q6nbgu1o2qsm7b6zvpzi34f1y7m5y2l3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcfT8:rUM_MshyMm_bVS33jjEuYLL-Su0PtM-w6WaHbIlwuiw', '2024-02-21 06:38:34.499670'),
('q8xmntz4jpo34vrp2yfurwucoxmgslgk', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t3BeE:LEbzF-9qVVS44jz62vQIdN900ys8ro1DiqUfDBYN_F4', '2024-10-22 12:57:54.077819'),
('qakyfr6x85jmye8ysjh3sanfpy0aezsl', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfED8:PatHtxvNdB8wQRq1nwPFV3LqTaVc965dMAIeMHQGGIE', '2024-02-28 08:08:38.095842'),
('qassxsgzjdi942st4a5mefg06w3jnysi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnB5g:mQJLtpp-QholSHAZxvwfmz4Fz1kJsYRZ7lWfCHoTdHc', '2024-03-21 06:25:48.841645'),
('qaulyq4v5sd9sjiuy4dbimifp8m6fg6a', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sYILD:4UHc8DlSJmeSea6uJiJOCQA2r08k6t8ezpYF5tDOLhQ', '2024-07-29 07:50:35.568370'),
('qbjijq2c3x20ftm65wlioy37gzmzsxtd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmnwm:X5IR60ZVBX-8TeDwXEiWhqAkLuE5EwMsUjDnOhMCZMw', '2024-03-20 05:43:04.228857'),
('qc44i7co33xrx6ry7j0qd2rf6k2ciy60', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7VQt:7Phb9-WW-wSehp7REBYfYXPyqo2GcijQk5UK_PRHHjw', '2024-05-16 08:11:43.016359'),
('qc5vi2qzon01w4crs2sazk9dq82i2ne3', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u75TE:6UOxROcNM_0JKHFfBjxN9JIBZ_nLgYWbLbW9llrYs2Y', '2025-04-22 07:42:56.994844'),
('qcnrefdh7moj2eqkja3317agw1vensee', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1trUpt:e22pYWFyMSg4C6BpC2QyjFhtstxTHbuf9_8LTX90wBA', '2025-03-10 07:33:53.887881'),
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
('rq14zll6k5zccr5uwnssyk7jwdkxcv81', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tinhf:F4_c3bwJxVNwp9TphirsnR17Cyn-xdsswlzqI7eUk1M', '2025-02-14 07:53:27.267024'),
('rtz1vcimbqro8dertof0vo92f6ma2h1h', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sNA0t:qwqKz2ViFU1yEF3BSoU4ZXl88Ncxqbwd1NreX72Belk', '2024-06-28 14:43:35.549267'),
('rxkkwlyj3epcikq4t97fs9ks0eorzkz9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmsTx:y6XY30AmHWapZIpHYAsZC93LZva_gUi9BnAI3uB5NDw', '2024-03-20 10:33:37.905139'),
('rzvv9kahqmmv3nv1e9poose31bkqtnih', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u2oL9:AnkrZe8f1lcu7pwK33r6zayl5IwVBEz8tctBA0MbnDo', '2025-04-10 12:36:55.844933'),
('s158adjvemzcrhviubcvliekyvbbk4vg', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rc0ur:BLSWG_oNrLKTZ4iRk96J-VnONTEdXZ1ypMjIS3zoag4', '2024-02-19 11:20:29.319771'),
('s1pb4anv0h3h7cc0nq8yx8r83ic0wl2b', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmUTi:kuEKB8PuYfSNUFWiNYD-r541zFufxXTecy4QEhdS2oY', '2024-03-19 08:55:46.071900'),
('s4qeko4tpvwlw2dgp8uy1ley889gckoy', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sjc0Y:6fBe9Y3vva0N5EHe2iz51UnHoXhjs44r8ISxWsheZN4', '2024-08-29 13:04:02.151116'),
('s4z9g501v6mrdtjd0qjgiveq98qurfvr', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tLxhb:cjDTl6BfWFpsbdMmRXqNEzqpwWrj2hTCs8J-Kox_XIA', '2024-12-13 07:54:59.275603'),
('s5a8ugqvlkgpilbep74hdbmz0o4jy7xr', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s4HME:ZvYjPXjum9s-eKoiJ4DeEGIAeyXnl8WtdsNKHHqQ7O4', '2024-05-07 10:33:34.517448'),
('sbaaxy9xlfntgfulens4pi5nhgqov2dy', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s38LI:nHDPq3KY6jWZoCphaQ0cdxEw41KcycMiQYYIDTY0Cls', '2024-05-04 06:43:52.553856'),
('sc8w7fn6ik5h8fc6wnjbgk6pykpx4x6h', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u8HND:ctm1QCXG3Zazmhb_a27tZUrupf4fw8wjH89x77ozjr8', '2025-04-25 14:37:39.684030'),
('scr376o11knmdqpcfz8d1p8epdz7p6sk', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7BUM:mGJlQbpDpKNFxzK78A807VvBxWQAoXHU8d6tYkXHu8I', '2024-05-15 10:53:58.968431'),
('sf722oz6jn4kzglyl8sjjz6k40jnmem3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sgiHW:_gnJZ5a0YKqF0rKxfowWmleLP1L2iHJGdxcgWcYiHBs', '2024-08-21 13:09:34.254877'),
('sikc83v1fnh2oecpajpwn9lqrjogcutd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rscsR:IbPRjKM660D3ZJVgcP0cNNfno1gZTDSbAJ427tZ3x2w', '2024-04-05 07:06:39.157081'),
('silqpx8is4craxumg9fpucg7mnd83mpp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rxn7x:tJuoe6mSMszVHWS8F3KLxaTRl-Km-1oJYNba1uCTiFQ', '2024-04-19 13:04:01.989016'),
('sjou5q1fwqajnwvf51pduw70owde3ayg', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tnDdc:-0GbmoqCCiuR8FtNnOgQSa1TcW-_gNYqK8yyOQjyTAQ', '2025-02-26 12:23:32.757340'),
('sloi158mgtetzbwgd7zztujnjja313op', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rfGwV:zzQB5YOh1sPC0UnwcsYHKM1cZ_Jkk-rkQb_VjwazHew', '2024-02-28 11:03:39.988649'),
('stx9dn9ww8hy1sq72sh68394k33psuid', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u7RyE:6cEBSmKVSnMt0FqejLhV1gYCPK9K9iPzsIiernD5rms', '2025-04-23 07:44:26.167696'),
('suihbm5nsziwadh1g1tkzkvtfxcqh84b', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rm4f7:8CX-kTdLSBFqJGrCWPNCzJJ-0NSvIpQbNbsUhnmY7uA', '2024-03-18 05:21:49.551259'),
('svf2blnkmwhqocmidsr3hg66gfowfd12', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tDI8Y:kEDi_8fE7rgw6k32qNaxXfVr3aG9c1uoc17Hiew9djc', '2024-11-19 09:54:58.460518'),
('sxasemyuao6nces7uupud88yduiegkii', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1roeNF:ExcYG4YTg-tyx5D9zt8LZkxaD6ZY7Iwog3r88CwcrUg', '2024-03-25 07:54:01.680306'),
('sy1te4bb0arpuy1djrswhg6ymb90qir3', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpO0n:uO7LrZE69RfTUez-210AxkihRo5NM9wReu1Y_FLmV4U', '2024-03-27 08:37:53.600651'),
('t0d792pxv856mc7eohk9brvhev4y81hi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rpOwR:K6Wj1bFeAGGJ60axKN25V4t2boqV4xnI8Xl2JxqKC6o', '2024-03-27 09:37:27.263356'),
('t40fpx1sz0bqaom6xr2ubqd8mbrgdtkp', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1syQ5i:JSekre-KaxeNCRTlW5-fyAz2vGACMBwWwG5CSOsRn78', '2024-10-09 09:22:34.734426'),
('t74bvriw366ic0o9ulqemkgxc8fmnk09', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rsHXI:eqMsZ3FX0gY012n0fGZnmAAc756LAzGlESpXsHKJXaI', '2024-04-04 08:19:24.494749'),
('tg218ifgbjie1bx140gh7f0orp92v2m7', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tqRph:uAwE0DNy7z9k5dFCculhUcud2HsGS_0vAqG6MBffyx8', '2025-03-07 10:09:21.644174');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('th2584f11g3cpifkl7j9ox5ojkj9ma7e', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tDzSM:a9ZT6nv0aZ_4xB_6x8UtOFFV33gL8zXAikT8mq-Osh0', '2024-11-21 08:10:18.012791'),
('tig11gogozmc75aw2i9r6o6jsf7e4ili', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tp0W8:nishgb8dTw8oL6V9rRbtlIfeOLgZS4vTC8X9lC42pj8', '2025-03-03 10:47:12.483368'),
('tiy0alqjjm8s0fmdtvj7w6ngn51eecml', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tDfSF:jDfZbIpNpECaWnzZDLi_Cz5oMD9qWFWzOaUlwW0s4Kk', '2024-11-20 10:48:51.731496'),
('tkocsifkl406pm8xdqficilw6b8wdj09', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tulQy:VWMdlIyF-R9ui-SnUNCJwTiWII-KAj9ycHRBJkzGf4Q', '2025-03-19 07:53:40.987383'),
('tn48h3ehv13d2gzmudfb58gzamgvtomq', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tlMQv:KvSEQ4nOE7jOmywEtP0UbrzNrgDUwFTxzlmToQ56LfE', '2025-02-21 09:22:45.499813'),
('to8ed0lx7fu46j908nye44ht0c0qv6ug', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7qz9:e-_lVo56rfCravVamDWd1EjlXPzpnu8TV7Kqir2bA7k', '2024-05-17 07:12:31.526677'),
('tocvqc5rocgc1jbomar5ubtflgzdm5sr', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tmrCq:9tMrXGepF3mmA3EZYfo4_cgV0DsN2orz00KLtzKcmzI', '2025-02-25 12:26:24.614242'),
('tqkm4b1cr077ga5t3uecw0fz0cx3dqm5', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sMlxo:ckf-4HIDYksEuUjpqryc2c_PQEyDC9ynw4llsXbjDUk', '2024-06-27 13:02:48.037882'),
('tt9jfyetbculm6wmbrpfyn2ju0yf73pv', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sMLMr:886zM0CvTgNi-NbkHPxp8mzncJmrLISITPsiiM4qwx4', '2024-06-26 08:38:53.731474'),
('twxg9eipty143wmvhbsyz9uzysvzi31d', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tfCv3:-pqyj36-fDW3N_hRJ5tev-zFKUWL5Tbmdwc10jYfddA', '2025-02-04 10:00:25.089853'),
('tzxpub53rb9dpsxprc9y45yimtjc86wg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7w31:jq40ixdhsSLpZl3Ev0PVkMF_IDd7EEe9ey7ygFkm7oI', '2024-05-17 11:46:51.081284'),
('u8igfql0jbxm5frok13ft3vs1fiqmy6t', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1smoWu:TiuufBjcYTS-eG5537MGVU_iQCbIECdVre4YLKkHfQU', '2024-09-07 09:02:40.119508'),
('u8r6xlr1t9acmfqt59fye3qr6scu2lnt', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rsc3J:3i4uAtiXHhDCCoBBfhEBfoeiXBS3q7muIVH7KQsS3D4', '2024-04-05 06:13:49.953235'),
('uc32kotenmk0j99cbg9dhb9kkbi2s86u', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u2534:JG0hcsIfP-2l9XMNOMn6pIkQHHe1u8GIWHqEzngc4dM', '2025-04-08 12:15:14.559030'),
('uew3zevmdbo2f68adhd1uoizxiunm95a', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOsxN:WrsSvtSF_zPfHs61e4lgJFKA08SFrRjl3J4fYjf11lc', '2024-07-03 08:55:05.156197'),
('uf3odrs7lgh1ljwxguy86f6m0sdttpgf', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tBoJ2:oMZ1kyvMw3wwvzITvptQ8rY902bgPlQHx1l2y6SYk1o', '2024-11-15 07:51:40.757894'),
('ul5q3zro1c62yfyg4hrqwk40gchzzbtw', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sr9SB:yqnzG439sronrK6ErFGDagSXEGH9JkWMI3WSRvr5Tg8', '2024-09-19 08:11:43.870238'),
('umhlkxhavbna06wxrn7ql5gyb65csoa6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOAnF:7qTxwIgxcQFZYFnnBsQl_ruxVV9Pn1N-lGqCIT4pWZA', '2024-07-01 09:45:41.469262'),
('urnwm17ui7y88a902gkqxac7e8yuivuf', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rcK4Z:8Qp70Xt77JidU-tF3WbUfsuq5SNk23UiKhj7VN0axD4', '2024-02-20 07:47:47.926961'),
('uty3tbn9px69r2t0s6sfp7cxwrkgcp8r', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tB5Lb:3h2hStE8U5qvGpvFsIqv_CfFkMEesVCHMiOtOVv0vdY', '2024-11-13 07:51:19.475921'),
('v2uhyl69o4zjr4gcsrknpb55kgnyxyuo', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tq2rU:kcPZz_lZ-WUzTkJY0bCJyX_5FBw1---xmgVnhushgFc', '2025-03-06 07:29:32.859901'),
('v3hhz33r330zcjalwxs94rfyhos74ham', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t7p4g:JvDTwpLbzv0iCjpG2i5MNK-9X2Tqshfkz1rID6crHNQ', '2024-11-04 07:52:22.298615'),
('v7q4dcq93nte1m34xwqmo2mwxcrgijg0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s2qFs:qMPj0yjEXt8U8n4HtCwgLVuMMrigjNNYXghU96HwdkU', '2024-05-03 11:25:04.518919'),
('va0k0sxd35cn5hafocmydjmju8fczigi', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkLOR:7-lJQ08ZQdko3fMG-rOzXpF0eZCGvlHUARLLytzbQoU', '2024-03-13 10:49:27.805812'),
('va75v556xx2ujung4ghtxy2i1y53wrjj', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tQiet:0nmGzZj6KpWgd6zd7MxF6Iq2lyKi7s2M8vl_bb4Yas4', '2024-12-26 10:51:51.839738'),
('vb7si7cpsj3ekxyftg0xf9q5su5stsvh', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s4I8t:nb-XetMTRVMqhyhpAF2bpDq5p-_bvUdXdat1CG06ZFE', '2024-05-07 11:23:51.262383'),
('vckrqw3k8cf13xbqvlvzkjb3s7d79ei7', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tSCZA:Xu4eRaTQf_tlMj8uWS0c1X5b1A82oi09en27NvixvKI', '2024-12-30 13:00:04.232069'),
('vekdawj7lbk719obxvcj6hqmpwzo7jts', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tAMFT:ddxYJfS4R_NYay0OM8NM2RHwQMdzdDRs9Oft89phzgQ', '2024-11-11 07:41:59.947909'),
('vfl6j58rofirez9mk5q3ke6ptuewe2hn', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t0ZZB:yW6e8iRVczQGBXPc8TnVU0slyC0UokxSq189c_5uoo0', '2024-10-15 07:53:53.583248'),
('vfvsqhl1hes918pxnz4dgenxcczisjaq', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rdQ9p:9RE_7HRZuTfpmioBE0ciRZQEZk0YjDWgnER080Iwe_c', '2024-02-23 08:29:45.844376'),
('vhl8lqzms9f4xzgyf3gqju0hwqft0xkg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1repfF:O2FF2-ETdFyt9211vclZ5_oy1uH5RKkc1QxbL4ZN7LQ', '2024-02-27 05:56:01.016543'),
('vlj1zv6ad0tr0m2ntjuvvrho67ujeaf9', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tM2pK:Rcyj7gZWiVsZ2tT0yGWwcyCSPsFE7opxTuWQelGnnVs', '2024-12-13 13:23:18.988986'),
('w0mqv3ji93rp6sivv8ke5aau7jo7shq9', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tkzXD:JD7eW5eVKNpth3E8hiVUJH19f_yhmwVTKBhRrhw877Y', '2025-02-20 08:55:43.802253'),
('w17ns26oq9eueqfszwy14rzqtub1xpza', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sZPzc:8gBP_b2xryrDyKpfoZL993WheZDs70GDeTA0g2UL7po', '2024-08-01 10:12:56.135095'),
('w4ynzsf8s2mqzk5dnxcz0l5qlhzasyd9', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd6w5:ly2s2NHTwJVRVu_PkUsO_6-HgC9y4dRngADG_SgMnrQ', '2024-02-22 11:58:17.871519'),
('w5zrarhodgcr2gwlmr97gtcsmnk7qcl2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkzHm:M8o05RXoJvi-O6TtBzFGGVjxvXcjbMRwxDOjrtpq3zs', '2024-03-15 05:25:14.362931'),
('w8n1mu5dmn9a49z10wbwejz1d39clasd', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1tFR40:ovB8nS5WtG75K5H_rivMBPRzdznyuO68Xdyk910YHkY', '2024-11-25 07:51:08.579220'),
('w9a757bn8a1cbw2mrg9idqyy8dx301qe', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1fjX:9vvWHHRgod0OUWLrZmXc3E0Xh1Vr1tQ3TgpyIO0BJek', '2024-04-30 05:58:51.778574'),
('wdk0h38g1f4irhnel22sowbx9plmgs9g', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rnXfn:yQCseA2yTQvmhccbKzH7kfYe4QsTyFN3XcWi4Awt9s8', '2024-03-22 06:32:35.810426'),
('we9grzqnfim5vb59ve68tay2z802v4oj', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tjt7v:M3oegw_60OlUIio7ZRY4u5rwAsRJa51gwHZZNVJDklI', '2025-02-17 07:53:03.399483'),
('wfiyctqo474df4be682lfbixy79q2bwu', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sS9sQ:x34tJS62KaUR0_pm-TbVc_6yVn702M1fG39jc9g3fr0', '2024-07-12 09:35:30.494900'),
('wiymcl2nabcu67dv7bpb0pbppo25jq0n', '.eJxVjM0OwiAQhN-FsyH8LEU8evcZCOwuUjU0Ke3J-O62SQ96m8z3zbxFTOtS49p5jiOJi9Di9NvlhE9uO6BHavdJ4tSWecxyV-RBu7xNxK_r4f4d1NTrtkYNWZVkrdmSR19ocAMjcSmFIDgFmQ0bD84q9Hx2zqjgAQBz0BaU-HwB9Rw3nw:1t6RKh:2m0rpurDDd88xROBRncvngf7_iE6d1jwaAU37b09npE', '2024-10-31 12:19:11.752606'),
('wj3hzn2j7hac4g0t3e30h6zs2spieg6u', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tkbsa:tDmra_ITX_WLzda9ddNBs40uhzgGjkX2Ragv31Q0kKU', '2025-02-19 07:40:12.897898'),
('wkvz0tg3vqj7fw6pkp553y3w0brv6r0n', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sOvvE:j1MrrrAx2hHE4rIO_d1nyv-jzsELU2gJyBfy6X4zbOg', '2024-07-03 12:05:04.212108'),
('wlnsjrj497blp983w12mkhi7rl17z91y', '.eJxVjEEOgjAQRe_StWlgppTq0r1nIDOdqaCmTSisjHcXEha6_e-9_zYDrcs4rFXnYRJzMWBOvxtTfGregTwo34uNJS_zxHZX7EGrvRXR1_Vw_w5GquNWe-UupLPnJAkleUJ20SEANA69aqIQOu2BtW1CiyxEgn1sAZC7DZrPFwJ7OIg:1rcKkl:prPRAqCNDLiJqa6puARQS8PHt0WEYbMmuukkwQ6ylKQ', '2024-02-20 08:31:23.963577'),
('wn1y9ve6rt3u2b2zgslr3sf1cfjrxc27', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tSEEI:7F45cNndEg0g6Q70AWEHznJO1FztmlbG7qgqtU4a5yo', '2024-12-30 14:46:38.539556'),
('wr6amwinze7u07zwz214ydgsnlfs07h8', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1swaRh:52NffXa2JMAPXKTFY-wxPEutKJDHJggvWf0l6qzgek8', '2024-10-04 08:01:41.788415'),
('wu8zi681s99ugpaxhiwpgeg8x4ipksxo', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhjFn:sxumIDAv36Kztpr0ZjmXHh4dDq65S1fYkgy5Umky6rc', '2024-03-06 05:41:43.299728'),
('x2b9iyautuacrjmolg6yrzrppfah1eh0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1Ofy:OElvd5U8coR6C7AqUgweiJZjvGzrvZULRSrXGqIVXGw', '2024-04-29 11:46:02.653469'),
('x2dp923chcptc4hz5fcygc0nb6ophct0', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sh4Bz:Xuk9PJiUcl0SW_LnCLskoATPlNdSFrc9tb848l0WDI0', '2024-08-22 12:33:19.047096'),
('x62if2jo7zff02vg4qo82eexi93ki389', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rjwB1:HKM2lqGYWA2DN9QrPIDkl1KbDhmYI0emdUEUEUE5lDc', '2024-03-12 07:53:55.989411'),
('xcqof0s0ip17ew6k7vq5gg0vddws6luf', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1ty2OQ:D8pWcFRdwB9c7ZznpGlUQnJO-IBTN6v7QBuqP9G9A6Y', '2025-03-28 08:36:34.677147'),
('xdkhkww8po9qdjgbcw7e4umtiob0nj1c', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rclJA:Yd8xP9uKoa76hgFnUl94h9RrESF18HZ8n1s4O-Xi4FU', '2024-02-21 12:52:40.341480'),
('xlwdpc9701fop7u2l8z6uqnjitz5vkgi', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tpOkW:KVBleduQuFTs6SO-3alcTW-ERu27Lsh5Yncj92DQSPk', '2025-03-04 12:39:40.742959'),
('xlztwt5dqdylm0nvr35p6onok295hn9q', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rd4Jk:p2abiF_i2Nr01FPfFJBFbU0kc2qznGegl6WrXqBG_WU', '2024-02-22 09:10:32.318396'),
('xqto7wiy1rlaydd6qbqoolu5z6ydwce7', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s3qFm:ggnoYhXW4gCbdm9vHBMuYfFGAZGlAtatOX8JSpA6ODg', '2024-05-06 05:37:06.474233'),
('xyrri0hkvs9lo7tqbcp19u9bu9iovihg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1JyF:NNwkRTL2uF6JFxmdLy_XmZknYA1Yj2JFkArwaUhUydM', '2024-04-29 06:44:35.202676'),
('xytmkkx28i7ryxq99rthxgor46fmvv55', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rgI3l:esVyFiJfoOJ7XpwFtGYhzqf29WvVK-UX6_XL74C1dxA', '2024-03-02 06:27:21.199625'),
('y6paz83ty5apef6z14evx33u5za3xflz', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tsDlL:HnygJcP1Vfh-eHqCjzdhL3YgX5CSk6moEeCwe29hPVw', '2025-03-12 07:32:11.624222'),
('y7c1bzu2qozm9rvm3boii41c0wd5dx10', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sLiLO:3IuI0qNtqLkLHQ3ljvue99Xn6Uzk5NTsEwE20yynmBk', '2024-06-24 14:58:46.819982'),
('yazwzru8ofj3ztbxbxgnt4191pquedqw', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s7ppE:_FQYUDzvw8CPAS-ibEeVpL_yPYM1Aj7anIxfkA-seAI', '2024-05-17 05:58:12.811473'),
('ybc2es37tcd2s3hfhmec2ox4lb40nnnu', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tnW3u:ZnAE_uNdNHvEF7-QRtvs-SAgwOlISZcQWbOeb1QivLM', '2025-02-27 08:03:54.595232'),
('yc9yj42tkt9oa7wf1emowu6w8b3bq6n8', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sUfWl:C2r3VRRFUBjGn2Ji0wf6mYJzJms3l7kGvvJalVpcfD0', '2024-07-19 07:47:31.007230'),
('ydpp4rc48rhub3z4hcczt0odl062fasc', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u2PUA:TWj8I1Q8I0VuTKLNt2RyG6rF2ec82pb5QJ8raWmsjg8', '2025-04-09 10:04:34.340634'),
('yf9b0eb3fgss4ihgbda6p93ztionptao', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sR2gs:Rusg99f22n_aMblwJk-PEcyTCxYIOZFFMrjVSyUFsl8', '2024-07-09 07:42:58.193489'),
('yfp0jqk9c5l5tfrrq0yubn635j8tj7cz', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t37Kb:ABDxbvB7GsnhfhSoZ2qo2_5luG1ysJTIXysAmpdbVyo', '2024-10-22 08:21:21.205954'),
('ykicagbjmcc75ofkg4qp1k0gviyd5eo2', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tq75W:qRfkGo0uDq_HTIN9CBdK_pV7oy9fmDgSj2kk-M-VrT4', '2025-03-06 12:00:18.507839'),
('yokt9tc2rtylon8esocm555kf6fm8ayd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rhMvc:iTJ8mO12KdWrp8qJ8iJdSSnngnxhKiT3zX8Z75iXHig', '2024-03-05 05:51:24.301184'),
('yuom4a0lm2z7j9div2nf2096u52xw7zg', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1t0vsL:a-N1ZHDHQb9rrjPb8hnPp7-s3WyJPG_WWnyEqeaKElQ', '2024-10-16 07:43:09.720458'),
('z08g2oezf44slm31o8rb3jtze4aqs9z2', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rmWG8:2-vc62yOOI1ZOl77WdBm_tp2BcpOoNUCzC5kIk5bYNE', '2024-03-19 10:49:52.676243'),
('z0fqlpxr22cdc1cqk9qqjt5ddk9iw4v6', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sYeo1:SWk6-1MavGauZsbTLYaP02IU014sPQ8MNcfq3Ia31QE', '2024-07-30 07:49:49.862061'),
('zfuggc992k1ss30ntwgc61l469dqgojl', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1sLc4L:vD7m553cjNSQ4dZd9-NO2tRLigGa_n106R4OkMbbsMQ', '2024-06-24 08:16:45.536497'),
('zi05c3opbp5aa7txpl7lsmhecb851u68', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tS7oD:Zq7CSeckDHhfPPBljNLErJS4ULsiuOHBvrAPMB0gOCk', '2024-12-30 07:55:17.194071'),
('zkdxmmdui5flh6q97lhjibyk64uq1dn0', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u8Arv:421yCg8T3W4hk8ee5_N1Tg0AjscqFM7EnnjowGfqK_Y', '2025-04-25 07:40:55.748819'),
('zn94ywsbym89a1a0aonkht5hrnc6ymtb', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tPenC:rPe1TguOwklORMEQZb3NtVbLivvopT2UvPY8u8Xo2bc', '2024-12-23 12:32:02.857179'),
('znzoxpvk7u8vcgwxsfx35midxzqfsjux', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1rkcm3:fmcog8HWBUFfCjnqZg20EFCGFOgC7lWJh5gLJ5kOmPQ', '2024-03-14 05:22:59.408115'),
('zvywshwffntyj3g63f6q7qpv1dx0fdqd', '.eJxVjDsOwjAQBe_iGllex19Kes5grT-LA8iW4qRC3B0ipYD2zcx7sYDbWsM2yhLmzM4M2Ol3i5gepe0g37HdOk-9rcsc-a7wgw5-7bk8L4f7d1Bx1G-tJ4sFJAkyRhtSiaLNWupJiITglECvrdNAPtpIID1a6QAzSURQObL3B9RIN8U:1s1gZC:Qqmf1N8Pz-VgzAvNhy2wS9-gD7-sorLA-xJbDm1uuOU', '2024-04-30 06:52:14.328178'),
('zxwcncy6biygrmp8mhrtql3fl6memjmz', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1tpiiY:aAj00N1nTkjWFT6tkelkSVuKUkvl9fxWlVCgqPAb8ko', '2025-03-05 09:58:58.192152'),
('zy08h2l87sje0jicr687aa79epq6jwcu', '.eJxVjDsOwjAQBe_iGln4uzYlPWew1rsGB5AtxUmFuDtESgHtm5n3EgnXpaZ1lDlNLE5CicPvlpEepW2A79huXVJvyzxluSlyp0NeOpfneXf_DiqO-q2zB_A2KNDaOLpSBoOgwSqH5BWBU1Yzx4CYOVqGYyyRnPEl-BxYs3h_AMSzN4U:1u6ixm:5opr17QYguIQQyvkR4IxVJc7DVWbVR6vHeVVagzd78o', '2025-04-21 07:40:58.128958'),
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
(4, 'SRS', NULL, NULL, NULL, 1),
(5, 'pp', '2024-12-24', '2024-12-24', NULL, 0);

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
  `cv_doc` varchar(255) DEFAULT NULL,
  `expected_end_time` time(6) DEFAULT NULL,
  `expected_start_time` time(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `eid`, `ename`, `eemail`, `econtact`, `cnic`, `date_of_joining`, `dob`, `qualification_id`, `deliverable_task`, `e_address`, `status`, `department_id`, `designation_id`, `branch_id`, `cv_doc`, `expected_end_time`, `expected_start_time`) VALUES
(1, '001', 'Danish', 'danish@gmail.com', '03323232322', '42323234234222', '2024-02-06', '2023-07-05', 'Master', 'asascasc', 'adascaac', 1, 1, 1, 2, NULL, NULL, NULL),
(2, '002', 'Mikyle', 'mikyle@gmail.com', '03323232322', '42323234234222', '2022-01-01', '2000-06-06', 'Bachelor', 'iajosidoajdo oiaj doiaojd aoisdj oiajd', 'oiqqad aoidsj aoijsd oij', 1, 2, 1, 2, NULL, NULL, NULL),
(8, '007', 'Cdr Liaquat', 'danial@sigbl.com', '03323232322', '42323234234222', '2024-07-01', '2004-06-15', 'Bachelor', 'asdasd', 'asdasd', 1, 1, 1, 2, 'employee\\8\\cv\\8_cv_20240711113316.docx', NULL, NULL);

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
(8, 0, 1, 2, 11),
(9, 0, 0, 2, 11),
(10, 0, 0, 2, 11),
(11, 0, 0, 1, 11),
(12, 1, 0, 2, 25),
(13, 0, 0, 1, 25),
(14, 1, 0, 1, 11);

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
(14, '2024', 'PKR', '2024-12-13', '2024-12-13', NULL, 1, 8, 4, 500000),
(15, '2024', 'PKR', '2024-12-24', '2024-12-24', NULL, 0, 1, 4, 25000);

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
(1, 'Tested', '2024-10-30', '2024-10-30', NULL, 1, 2),
(2, 'testeed', '2024-12-26', '2024-12-26', NULL, 0, 4);

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
(9, '2024-12-01', '2025-05-14', 5000, 'no', '45zfasdas', 1, 2, 11),
(10, '2024-10-01', '2024-12-31', 5900, 'no', 'tttrrr55', 0, 1, 25),
(11, '2024-11-01', '2024-12-31', 4900, 'no', 'BG5501', 1, 1, 11);

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
(2, 'Yearly', 1),
(3, 'quartER', 0);

-- --------------------------------------------------------

--
-- Table structure for table `iso_detail`
--

CREATE TABLE `iso_detail` (
  `id` bigint(20) NOT NULL,
  `delivery_type` varchar(50) DEFAULT NULL,
  `gst_percentage` double DEFAULT NULL,
  `import_factor` double DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `unit_cost_pkr` double DEFAULT NULL,
  `total_pkr` double DEFAULT NULL,
  `gp_calculation` double DEFAULT NULL,
  `unit_selling_pkr` double DEFAULT NULL,
  `delivery_charges` double DEFAULT NULL,
  `total_selling_price` double DEFAULT NULL,
  `gst_amount` double DEFAULT NULL,
  `total_with_gst` double DEFAULT NULL,
  `income_tax_adjustment` double DEFAULT NULL,
  `gp_percentage` double DEFAULT NULL,
  `gp_amount` double DEFAULT NULL,
  `tax_adjusment` double DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `iso_master_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `sales_tax_category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `iso_detail`
--

INSERT INTO `iso_detail` (`id`, `delivery_type`, `gst_percentage`, `import_factor`, `unit`, `unit_cost`, `unit_cost_pkr`, `total_pkr`, `gp_calculation`, `unit_selling_pkr`, `delivery_charges`, `total_selling_price`, `gst_amount`, `total_with_gst`, `income_tax_adjustment`, `gp_percentage`, `gp_amount`, `tax_adjusment`, `created_at`, `updated_at`, `deleted_at`, `status`, `iso_master_id`, `item_id`, `sales_tax_category_id`) VALUES
(1, 'Over Land', 18, 13, 50, 200, NULL, 10000, NULL, 248.6, 200, 12630, 2273.4, 14903.4, NULL, 5.53, 698.5, 5, '2025-04-03', '2025-04-03', NULL, 1, 1, 2, 2),
(2, 'Over Land', 18, 13, 50, 200, NULL, 10000, NULL, 248.6, 200, 12630, 2273.4, 14903.4, NULL, 5.53, 698.5, 5, '2025-04-03', '2025-04-03', NULL, 1, 2, 2, 2),
(3, 'Over Land', 13, 8, 35, 400, NULL, 14000, NULL, 475.2, 200, 16832, 2188.16, 19020.16, NULL, 5.17, 870.4, NULL, '2025-04-04', '2025-04-04', NULL, 0, 1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `iso_master`
--

CREATE TABLE `iso_master` (
  `id` bigint(20) NOT NULL,
  `version` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `delivery_date_commeted` date DEFAULT NULL,
  `delivery_date_required` date DEFAULT NULL,
  `payment_term` varchar(50) DEFAULT NULL,
  `em_percentage` double DEFAULT NULL,
  `em_amount` double DEFAULT NULL,
  `bg_percentage` double DEFAULT NULL,
  `bg_amount` double DEFAULT NULL,
  `pg_percentage` double DEFAULT NULL,
  `pg_amount` double DEFAULT NULL,
  `total_value_iso` double DEFAULT NULL,
  `total_cost_iso` double DEFAULT NULL,
  `initial_gp_planned` double DEFAULT NULL,
  `gp_after_tax` double DEFAULT NULL,
  `total_sales_promo` double DEFAULT NULL,
  `final_gp_after_promo` double DEFAULT NULL,
  `total_financial_charges` double DEFAULT NULL,
  `initial_gp_percentage` double DEFAULT NULL,
  `final_gp_percentage` double DEFAULT NULL,
  `final_gp_after_financial` double DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `shipping_address` varchar(200) DEFAULT NULL,
  `customer_po_no` varchar(100) DEFAULT NULL,
  `po_doc` varchar(100) DEFAULT NULL,
  `mode_of_shipment` varchar(100) DEFAULT NULL,
  `sales_person` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `delivery_type` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `tendor_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `iso_master`
--

INSERT INTO `iso_master` (`id`, `version`, `date`, `delivery_date_commeted`, `delivery_date_required`, `payment_term`, `em_percentage`, `em_amount`, `bg_percentage`, `bg_amount`, `pg_percentage`, `pg_amount`, `total_value_iso`, `total_cost_iso`, `initial_gp_planned`, `gp_after_tax`, `total_sales_promo`, `final_gp_after_promo`, `total_financial_charges`, `initial_gp_percentage`, `final_gp_percentage`, `final_gp_after_financial`, `city`, `shipping_address`, `customer_po_no`, `po_doc`, `mode_of_shipment`, `sales_person`, `approved_by`, `exchange_rate`, `delivery_type`, `created_at`, `updated_at`, `deleted_at`, `status`, `client_id`, `tendor_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 5, 5000, 5, 5000, 5, 5000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 280, '1', '2025-04-03', '2025-04-04', NULL, 1, 1, 2),
(2, NULL, NULL, NULL, NULL, NULL, 5, 5000, 5, 5000, 5, 5000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 280, '1', '2025-04-03', '2025-04-03', NULL, 1, 1, 2);

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
(2, 'Steel', 'STL', 'js dcojdo kjsod', '2024-10-30', '2024-10-30', NULL, 1, 2, 3),
(3, 'TESTED', 'TT', 'TESTIING', '2024-12-26', '2024-12-26', NULL, 0, 2, 4);

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
  `currency_id` bigint(20) DEFAULT NULL,
  `coa_type` varchar(50) DEFAULT NULL,
  `current_status` varchar(50) DEFAULT NULL,
  `status_change_date` date DEFAULT NULL,
  `expected_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journal_entry`
--

INSERT INTO `journal_entry` (`id`, `amount`, `transaction_type`, `created_at`, `updated_at`, `deleted_at`, `status`, `coaid_id`, `project_id`, `bank_id`, `cheque_no`, `receive_person`, `payment_mode_id`, `ref_no`, `description`, `branch_id`, `doc_path`, `conversion_rate`, `total_amount`, `currency_id`, `coa_type`, `current_status`, `status_change_date`, `expected_date`) VALUES
(2, 10000, 'Debit', '2024-09-10', '2024-12-27', NULL, 1, 6, 11, NULL, 'None', 'Ahmed', 1, 'SIGBL-20241007-001', NULL, NULL, NULL, NULL, NULL, NULL, 'Expense Payable', 'Paid', '2024-12-25', NULL),
(3, 50000, 'Debit', '2024-10-11', '2024-12-27', NULL, 0, 11, NULL, 2, 'szc a3eqeadasdad', 'Ahmed', 2, 'SIGBL-20241011-002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 50000, 'Debit', '2024-10-16', '2024-10-16', NULL, 1, 11, 11, 2, '212312weqwe23121', 'Ahmed', 2, 'SIGBL-20241016-003', 'checking', 2, 'project\\11\\expense_document\\11_SIGBL-20241016-003_20241016152712.png', NULL, NULL, NULL, 'Expense Payable', 'Paid', '2024-12-20', NULL),
(6, 5000, 'Credit', '2024-10-22', '2024-10-22', NULL, 1, 16, 11, 2, '112121', 'Hammad', 3, 'SIGBL-20241022-004', 'project receiving', 2, 'project\\11\\expense_document\\11_SIGBL-20241022-004_20241022145947.png', 278, 1390000, 2, 'Revenue Receivable', 'Received', '2024-12-22', NULL),
(7, 329819, 'Debit', '2024-11-19', '2024-11-19', NULL, 1, 18, 25, 2, '035/0038', 'aptech Supplier', 2, 'SIGBL-20241119-005', 'no', 2, NULL, 280, 92349320, 2, NULL, NULL, NULL, NULL),
(8, 53529, 'Debit', '2024-11-19', '2024-11-19', NULL, 1, 20, 25, 2, '035/0039', 'Askeri Supplier', 2, 'SIGBL-20241119-006', 'no', 2, 'project\\25\\expense_document\\25_SIGBL-20241119-006_20241119153601.pdf', 1, 53529, 1, NULL, NULL, NULL, NULL),
(11, 5000, 'Credit', '2024-12-26', '2024-12-27', NULL, 1, 6, 23, 2, 'werwe', 'ahmed', 1, 'SIGBL-20241226-007', 'testing', 2, 'project\\23\\expense_document\\23_SIGBL-20241226-007_20241226110255.txt', 279, 1395000, 2, 'Revenue Receivable', 'Received', '2024-12-26', NULL),
(12, 10000, 'Credit', '2024-12-27', '2024-12-27', NULL, 1, 20, 24, 2, 'werwe', 'sajid', 2, 'SIGBL-20241227-008', 'tteasting', 2, 'project\\24\\expense_document\\24_SIGBL-20241227-008_20241227152314.txt', 1, 10000, 1, 'Revenue Receivable', 'Receivable', NULL, '2024-12-25'),
(13, 15000, 'Debit', '2024-12-27', '2024-12-27', NULL, 1, 11, 25, 2, 'no', 'sajid', 1, 'SIGBL-20241227-009', 'testing', 2, 'project\\25\\expense_document\\25_SIGBL-20241227-009_20241227152530.txt', 1, 15000, 1, 'Expense Payable', 'Payable', NULL, '2024-12-27');

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
(5, '2024-02-09', '2024-12-24', '2024-11-19', '2024-12-24', NULL, 1, 8, 'tt', NULL, NULL),
(6, '2024-11-19', '2024-11-27', '2024-11-21', '2024-11-21', NULL, 1, 8, 'Local', NULL, NULL),
(7, '2024-02-05', '2024-12-12', '2024-12-11', '2024-12-12', NULL, 1, 8, 'Local', 1, 'CPO'),
(8, '2024-12-23', NULL, '2024-12-24', '2024-12-24', NULL, 0, 2, 'no', 1, 'testing');

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
(29, 12, 9, 10, 'project\\23\\liquidity_damages\\23_ld_20240723120821.png', NULL, 1, 23),
(31, 5, 5, 8, 'project\\25\\liquidity_damages\\25_ld_20241223150448.txt', NULL, 0, 25),
(32, 12, 10, 15, 'project\\11\\liquidity_damages\\11_ld_20241223150548.txt', NULL, 1, 11);

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
-- Table structure for table `payroll_attendancerule`
--

CREATE TABLE `payroll_attendancerule` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `late_deduction_type` varchar(20) NOT NULL,
  `late_deduction_amount` decimal(10,2) NOT NULL,
  `late_threshold_minutes` int(11) NOT NULL,
  `absent_deduction_type` varchar(20) NOT NULL,
  `absent_deduction_amount` decimal(10,2) NOT NULL,
  `overtime_rate_multiplier` decimal(3,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_attendancerule`
--

INSERT INTO `payroll_attendancerule` (`id`, `name`, `description`, `late_deduction_type`, `late_deduction_amount`, `late_threshold_minutes`, `absent_deduction_type`, `absent_deduction_amount`, `overtime_rate_multiplier`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Late Arrival', 'Late timing rule', 'PERCENTAGE', 10.00, 26, 'FULL_DAY', 800.00, 1.50, 1, '2025-04-22 09:57:01.768495', '2025-04-22 10:30:11.508853');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_auditlog`
--

CREATE TABLE `payroll_auditlog` (
  `id` char(32) NOT NULL,
  `action` varchar(20) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `object_id` varchar(100) NOT NULL,
  `details` longtext NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `user_agent` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metadata`)),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_auditlog`
--

INSERT INTO `payroll_auditlog` (`id`, `action`, `model_name`, `object_id`, `details`, `ip_address`, `user_agent`, `created_at`, `metadata`, `user_id`) VALUES
('0011547e182640c88daf967d7c4031ea', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-17 05:03:18.453843', '{}', 1),
('0044f55559024b0da87c06d7f49deb2c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:59.197287', '{}', 1),
('00962d2a692445a8a774d02717013208', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:48:17.731311', '{}', 1),
('009bc1964df9452dbf420643e1514a2c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:22:28.762445', '{}', 1),
('012ae3ab1b9f455188075703322a63e9', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:47.750106', '{}', 1),
('022cddf2a47f41e8a41a8415ece1ea8e', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:21:55.937752', '{}', 1),
('02623805388f443abdf4e8a2a9cc014e', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:05:55.421820', '{}', 1),
('0276149df35f4bf594b229af5257ed17', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:00:49.092650', '{}', 1),
('028ae66837424811982196fd816d2c5c', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-18 07:06:38.423721', '{}', 1),
('028db996dd5f49a1a0d0d0d0ac9bffe9', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-17 05:56:23.111369', '{}', 1),
('032bcd0d63aa4ce19121b8f3de3dd89a', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:27.236110', '{}', 1),
('035200df5bfb4da6bf38e5d3402653b5', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 12:39:13.965420', '{}', 1),
('03e24f43b606473ab3c6eba335b32081', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:45:38.018691', '{}', 1),
('048f591de0fb4903905aad5f20e88d5e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 07:00:32.698459', '{}', 1),
('04b9c11725354af48061c00e577bac67', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 06:05:34.684693', '{}', 1),
('05202600a195405e8eed804f2e8bdf5f', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:37:53.977130', '{}', 1),
('052ad37126504df5bc9132889f1f7091', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:36:02.743585', '{}', 1),
('0534160f7e2a4f8ba5ea2293f03881be', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 04:50:49.123875', '{}', 1),
('059c75123a494d0a8881cba82f613bc1', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:52.676348', '{}', 1),
('072008e60525444fa179f2d8811d3744', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-17 04:44:45.244808', '{}', 1),
('07442838e8fd41939884a0f46855264e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:44:10.198407', '{}', 1),
('0792cdb1f32d44bb892118e56dc8122c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:57:12.070149', '{}', 1),
('0871a45cbe084957bbaa82a07649ea6f', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-17 05:32:36.902513', '{}', 1),
('089e0e212def4bd48baebbe48706360e', 'UPDATE', 'AttendanceRule', '1', 'Updated attendance rule: Late Arrival', NULL, '', '2025-04-22 10:30:11.512171', '{}', 1),
('089f556cc70c45bd8cd194bcad2fc249', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:59:40.934339', '{}', 1),
('08a241d882644af1832cefc9ffe52f52', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-21 11:03:07.197762', '{}', 1),
('08ab985b68be45fd84f42b3e21e1e4d2', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:43:06.224808', '{}', 1),
('090abcb98ea14ddc9d62a2f9ba34f5d5', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:48.710712', '{}', 1),
('090dd41242a64abf932e7c20352d0001', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-16 06:43:19.906036', '{}', 1),
('09f9269a96e942189bcb5ade9ccf64f8', 'VIEW', 'AttendanceRule', '0', 'Viewed attendance rules', NULL, '', '2025-04-22 09:58:10.875035', '{}', 1),
('09ff9466bd3b46a190e029fd3a5d37af', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:49:03.061527', '{}', 1),
('0a1ce160413f471d855c35207b76d081', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:25:29.160324', '{}', 1),
('0a278d7449bc484483467a61795e5646', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:43.113498', '{}', 1),
('0a720706dd3941a1830f4ee7aeee6abe', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:54:09.330464', '{}', 1),
('0bd265e0c8314dbcaf68098be7684b53', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-22 05:08:26.643798', '{}', 1),
('0c787178ec934ec5a378128e2cf5a4cd', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:46:48.110991', '{}', 1),
('0c79403c687c4220a5964cd378fd8d52', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:32.539293', '{}', 1),
('0cba9b3f802f4ff4a304c225821c5655', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:32.568349', '{}', 1),
('0d05568248a044789ea87ab6a77bef84', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-22 11:20:52.919158', '{}', 1),
('0d056e7733a040688da917c49f43a8eb', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-16 12:01:41.168808', '{}', 1),
('0d222e1f879441acadd3f6b0b8f0aa8e', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:34:23.774536', '{}', 1),
('0d299c63330c4aa69057651fbbbaf022', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:21:58.939354', '{}', 1),
('0d46da064d144052ade404a2ac46d148', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:31.554936', '{}', 1),
('0d4e2600cbcc4329a3b0cfcc8ba96d14', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:59:40.294755', '{}', 1),
('0da08b0ab21f4036bf8c76a0dc3d247a', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-17 05:58:03.216609', '{}', 1),
('0da9ba7456b64d34bcde9aa166cd9dd3', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:30:56.609272', '{}', 1),
('0dc4ccb937e84f4fb8ce7e2b28b7238e', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:32:01.766244', '{}', 1),
('0e03bc1b042546588d6b0acc5e5f515b', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:37.131848', '{}', 1),
('0f058a459cba4524bd7f845ca0b5026e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 11:37:48.414373', '{}', 1),
('0fbde4ae4dec41b3af9070df9971a2c2', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-17 11:06:08.232760', '{}', 1),
('0fca8fcd99564d7aac29e081bef4a10d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:32:40.559121', '{}', 1),
('1046e7bc34bf496e9e2bbfdab3de0a87', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-17 05:56:52.528250', '{}', 1),
('1077542527944044bdcac4b9d7ded3d5', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:30:01.077587', '{}', 1),
('10ea7e90605e436e806c124e194d253d', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-16 06:20:18.177657', '{}', 1),
('117c42a7584441e7931b108e5244cc31', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:30:00.694045', '{}', 1),
('124c84dcc66743c18a5f07b4a05143c1', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:53:56.132634', '{}', 1),
('12dda54562ae4f0c92111504ad331157', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:59:26.237264', '{}', 1),
('130086f260074b4f868991f72610376f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 11:37:48.734212', '{}', 1),
('1316e93c9f5844b8b4a333b9cd3ca498', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:08:48.888736', '{}', 1),
('13184b2969304f32b24c30cb643d606c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:31:55.095700', '{}', 1),
('13b88d6614534b5783e47a0311935fbc', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 11:37:46.282095', '{}', 1),
('13c4683854d74818a44f9fa1e26e3ba5', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:05:37.241177', '{}', 1),
('13e9b2993b9a4a81b70ce22fc52cdd12', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:44.727850', '{}', 1),
('144311a2f14c42668e678a9e7efdd982', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-21 11:16:02.311558', '{}', 1),
('1461cc832cdc4287aaaf83b5e2a3cf5b', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:59:25.845229', '{}', 1),
('148f4f5c188e4f0c9a8012e8a63fea07', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:22.691632', '{}', 1),
('15869ce170b54e6cae6de1a42221e878', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:00:02.331908', '{}', 1),
('15e6cb909a5541a8a610279f1d6df8a3', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 05:57:38.525172', '{}', 1),
('161d8ba745fc4334b97b417d1b1fb014', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:22:29.933491', '{}', 1),
('163019a33f954b29be067067daa89798', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:33.807908', '{}', 1),
('167caf998b7e4bf889dda4f92a7262c8', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:08:49.205519', '{}', 1),
('178d45ea11a441b5969136184b11b89c', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:32.709048', '{}', 1),
('1794bd78b1fd45ed8f7802320eaba1f3', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 04:55:39.771595', '{}', 1),
('17ec8cf2758c498ba4370d6d1120fd38', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 11:02:59.948953', '{}', 1),
('18c7eb548a214ce3ae4bfcbdee2a81a2', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:28:58.459488', '{}', 1),
('19185b07aadf487ca3d3a3d2e389768f', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:27.409518', '{}', 1),
('19259e4fd1cf4b74b37be15982d6e5ea', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-16 07:33:37.682031', '{}', 1),
('19c94c10d66b4c0890b2b4105c7ee889', 'UPDATE', 'AttendanceRule', '1', 'Updated attendance rule: Late Arrival', NULL, '', '2025-04-22 09:58:14.595707', '{}', 1),
('19d39796b5ba4f57a550a4b64e85e5e4', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:36:02.189590', '{}', 1),
('1a02c1744d7a43beb2d9f19b60be046c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:08:11.305839', '{}', 1),
('1a0cb41931714e70ab542dc508f7bfdf', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-16 07:33:21.684257', '{}', 1),
('1afc05d380e04610ba7de0f0b934d97b', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:55:46.963420', '{}', 1),
('1b2ebe0e2e3e45f38412d226216de789', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 05:45:17.931131', '{}', 1),
('1bc3aa9e3bd94060ae3ff39bb91d9ce2', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:22.209543', '{}', 1),
('1c3d8b91e56141258e747c4d700e6686', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:13:12.846624', '{}', 1),
('1d2916d20c4545a09089e3513fa097e9', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:54:25.390236', '{}', 1),
('1d54bc6f75fb40c5b167a1d8de5dcce0', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-17 05:48:34.936472', '{}', 1),
('1d5d1613798c4afb9b4cb0446afe2bfd', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-21 04:46:44.535571', '{}', 1),
('1e0686b0bbc348e9b388e533db7161e1', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:22:23.641981', '{}', 1),
('1e6607f201f847ea887275f863216731', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:37.630253', '{}', 1),
('1fd11702cc364b9b9ab235ff08ac6362', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:22:23.473507', '{}', 1),
('1ffb619507c54a3fb195619e842da761', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:46:47.846038', '{}', 1),
('2025d78926d44e7383b0c060d7d51c78', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:24:02.385237', '{}', 1),
('206e7c2ce5244481a834a8837fa7c0ef', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-26 07:11:18.292794', '{}', 1),
('20907df29b6c4859a7f2a8cddda852df', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:32.058164', '{}', 1),
('20a0ded645ba4763ad16ff3f5a856c04', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-26 07:07:25.251458', '{}', 1),
('214cef7d581d44a796f305c58c96e004', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:30:55.882355', '{}', 1),
('21a09a91d0ef47a4a7668e250cedc528', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:34.879102', '{}', 1),
('224f9856395c4ca5ad6b1f21f8a151bb', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:30:00.913262', '{}', 1),
('22ce56018c224c209c359e488d04200c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:32:01.579563', '{}', 1),
('2300bbbe0771499a80a7f83c38c5f888', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:26.849169', '{}', 1),
('2333203e99634bdb998ccb40ccbffac5', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:22:31.224934', '{}', 1),
('23abc09120404eccbb7fa26b3dbf9fe7', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:23.178242', '{}', 1),
('23d9bad66c3c46b4ab3416c4e6943767', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance report', NULL, '', '2025-04-16 10:49:23.557005', '{}', 1),
('24770102091a4ea995e49d5f81fdacda', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:29:33.139547', '{}', 1),
('24992ef0410d41c0b9e1524667de695e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:31:56.961848', '{}', 1),
('26197599056f4890bcba1d2505493ed1', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:35:58.635112', '{}', 1),
('269070e2fbf74600a35c2ea27bf2bffc', 'CREATE', 'AttendanceRule', '1', 'Created attendance rule: Late Arrival', NULL, '', '2025-04-22 09:57:01.770765', '{}', 1),
('26a9d7fbaed44ceca739f7da78d96e2c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:07:30.586564', '{}', 1),
('26b14428740b4696b3d1025c6c7128e3', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:02:08.224041', '{}', 1),
('26b19d3f5fee4a1581b02ff7ada5c118', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:27.390418', '{}', 1),
('26b84ab5e6db45a4822765cc020ad246', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:36:06.259760', '{}', 1),
('2719dcace6894d42b5f319705982e80c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:57:11.612303', '{}', 1),
('278f89c3fccf408eb7b8059990a91688', 'CREATE', 'SalaryComponent', '5', 'Created salary component: Allowances', NULL, '', '2025-04-23 12:39:30.216338', '{}', 1),
('27b96167e6ac4df8b83e02786a5bce6f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 06:05:35.518147', '{}', 1),
('28038fb4b330437b8e4c80efe86011dc', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:09:42.783962', '{}', 1),
('28976aed0a814999a5a5e8db081732e0', 'UPDATE', 'SalaryComponent', '1', 'Updated salary component: Allowances', NULL, '', '2025-04-22 11:27:27.137602', '{}', 1),
('28c3dbe8beee431391aa35215dd117bf', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:33.072199', '{}', 1),
('28e456247f1145ad8af9638828591b18', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-21 11:14:01.479750', '{}', 1),
('29162125257a412e88211182ba893d0a', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:35:28.908812', '{}', 1),
('29a9d306f8f245c59c4f5c0e4c13da35', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-16 06:18:37.020114', '{}', 1),
('29cdacc49c3643da8a53fe83f6bcd005', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:13:26.136322', '{}', 1),
('2a54971738504474ae7ecf893d6fb717', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:32.111783', '{}', 1),
('2abdf5e5307240f9a133f0c220bf7458', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 07:00:32.312752', '{}', 1),
('2acb2abe1b124765b545f0ab6d1522f2', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-28 10:37:28.147975', '{}', 1),
('2ae508a41c2348da9041168c1d680351', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-21 07:36:48.778178', '{}', 1),
('2b2fc7fc350f416b887aec01a2319f41', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:32.216499', '{}', 1),
('2b54c0a0b3b640b792a9ee0f47b77231', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:33.134839', '{}', 1),
('2b608d5eaf4b452cac32c0f80b166520', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:59:25.677493', '{}', 1),
('2b7b40cbc4b54385870b40220eca1d25', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-21 07:36:36.377633', '{}', 1),
('2b9302598c614fb0b54c527b43fd5c84', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-16 09:43:19.098995', '{}', 1),
('2bac18b9cd25446e9dd69c3f51663618', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-16 06:42:23.063232', '{}', 1),
('2c7fa79a0c4149edb678dc7a63d1ffd1', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-28 10:37:41.592134', '{}', 1),
('2ce44abc0889484982bdb150912f1b25', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:31:49.362277', '{}', 1),
('2d365673ba524af7ae9f1ee73194cf6b', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-21 11:00:04.634501', '{}', 1),
('2e3333204b0e43138bb087ecf4dbb9dc', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:17.258122', '{}', 1),
('2e49c1d6f3834519b0c0ea10eb5fc2eb', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-22 09:28:11.225673', '{}', 1),
('2e99355931c04ee899a552845473bf2e', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-18 07:31:00.703721', '{}', 1),
('2eb68f9336e64bdc814a3b0525134c4a', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:01.931335', '{}', 1),
('2ece054a9af54fa7b9863c39bbee47bb', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-21 11:08:54.446760', '{}', 1),
('2f1d73bf57c841399b55e65053d2977c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:35:29.349631', '{}', 1),
('2f3b9c7328d242959f4f56698dbf4202', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:21:58.795414', '{}', 1),
('2f75d42735174120858fd204d40e91c2', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:24:02.197608', '{}', 1),
('2fd530a4498a47cca869bc0c1fa8b935', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 11:37:45.923859', '{}', 1),
('30174e3ae6d849368ec77a185a8adfce', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:45:37.902267', '{}', 1),
('30397e43dc794eb5b0f938d0258611e7', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:01.499683', '{}', 1),
('30b65c60ad6943e29c8666f6f7222c03', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:59:52.603949', '{}', 1),
('31a61617ff1d4542ad6c03f1e466126d', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-17 05:30:20.141345', '{}', 1),
('324d2631601f4d4f8886d6d371110515', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 11:37:48.412889', '{}', 1),
('32c97ef59a4443828fe5c0b8f67d6850', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:31:54.292619', '{}', 1),
('33261ace1f5041579b95b9b86c7aa0f2', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-16 07:46:46.653539', '{}', 1),
('336105ffd89c4fdfa80ac30e697898e4', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:41.252019', '{}', 1),
('3367f3d1876f4b2cbaa9301fdc125175', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:59:24.128079', '{}', 1),
('3381e9fbf00943acb04f579b692fbd9c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:31:32.516324', '{}', 1),
('33ec185788694222b815921f5fb56f28', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:59:40.849864', '{}', 1),
('34164929371048599df84b9d7f7ed83f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:12:58.491926', '{}', 1),
('34cf2c5968fb4d10a4dbdfa943952133', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:00:49.470391', '{}', 1),
('34d913c9de744a85b341803cb187e56b', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:05:55.732164', '{}', 1),
('3616ded0bc6a484c9fced423a84081ed', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:59:30.907557', '{}', 1),
('36c6971c6b824fc4a5cc1197c64b0c50', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:27:14.101454', '{}', 1),
('36e8dbebdcdb4c92a7d2d1eb5b061b0c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 07:00:32.620063', '{}', 1),
('370f2ff4f85045a2bd6b93852c78b4ca', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:28:58.096790', '{}', 1),
('37388b3922964bf48dc200dba95bf4e8', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:31:54.497068', '{}', 1),
('3748b2ee3e5d445ab1e353ea037b92af', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:36:02.607402', '{}', 1),
('37aa4bc86deb4c5aa032232f2ca42285', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:32.374141', '{}', 1),
('37ba4a39548944f183cdc957d44298f7', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:03.549848', '{}', 1),
('37c159744f314337b8e91a3c8e1237e4', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 05:56:51.465637', '{}', 1),
('37f5efc588cc4df18dab5773bbbc6e53', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:48:17.899612', '{}', 1),
('386b81f800fc42d8bfce31736df09e3e', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-26 07:07:12.017813', '{}', 1),
('3889d51e9d3745a2b5a647d874db121d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 10:54:05.775451', '{}', 1),
('3900364639c44c2c85fbe18596849beb', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:01:18.464964', '{}', 1),
('39473bd1e64547e19e7340fe165191ce', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:30.829792', '{}', 1),
('3a2bb09f66754b06acfbd27d952b552b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:54:24.815045', '{}', 1),
('3a4873c6625542f698650ccd46340f82', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:59:26.454957', '{}', 1),
('3a760bdd12fe4f13957a86e5b87cb891', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:28:24.225626', '{}', 1),
('3b0a2a782d394529950127b5b2774ca6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-28 10:37:11.914136', '{}', 1),
('3b2e37953bf246938f1580c30c2c7e65', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 10:51:18.644014', '{}', 1),
('3bccb258716b4e0e89bb8540da3480b9', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 09:45:03.776422', '{}', 1),
('3c5a8ad81bd74132bcf2f47cb62c1995', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:18.910217', '{}', 1),
('3cd8a62746c74d8fb0b018df8816c1db', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:08:10.893849', '{}', 1),
('3d3d97a83ef745008ede08b0184197cf', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 04:41:23.442235', '{}', 1),
('3d59ca6ebcd04b91a06551f06255c631', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-23 05:14:13.938542', '{}', 1),
('3d83e20253c548b698eeaa80a4ec2f2b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:54:31.876356', '{}', 1),
('3d856fa76c2a4112bf7ccb198ea07984', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:55:24.380201', '{}', 1),
('3da3173d546445aaa0f191d202598dab', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 07:11:23.216782', '{}', 1),
('3da5448495c34ff28fd84254d4f09f66', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-26 09:38:46.062340', '{}', 1),
('3db12645d52a415fb84ee963180025b2', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:00:01.649489', '{}', 1),
('3dc14483a9ce4ab6b1faf61fc3457bce', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:54:25.039821', '{}', 1),
('3dedfe7236e04fc3a672f31fa174f380', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-16 07:34:16.611740', '{}', 1),
('3df39a30c3f14947940c374156ee12f8', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:31.569417', '{}', 1),
('3e1d84ec97d34b39b3def2a1dab93b44', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-23 05:15:17.564370', '{}', 1),
('3ea4c8b44e124df491268d47fbbe6dfa', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:59:26.013557', '{}', 1),
('3f516ee322024ba2b4e735695ee0ffea', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-22 09:26:48.279830', '{}', 1),
('3fd2d29ef67840358299074c580e9fd9', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:50:30.015439', '{}', 1),
('400b194608ed4e0f9dcbd4cb6ad400ab', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:57:05.916971', '{}', 1),
('4029540653864a169218a05e59f65f27', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:58:59.301835', '{}', 1),
('4087f449005b46fab25b127547f2caad', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:01:42.964176', '{}', 1),
('40d6182962ca47789fdada3f1409cee7', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-26 09:38:41.462530', '{}', 1),
('41bcd021656046d094d9844d17fdcfcc', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:55:24.873023', '{}', 1),
('420986c3292846a4b6905105fa4bea2d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:13:14.687598', '{}', 1),
('424625d9f8c14b24b5b888611487e7b7', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:22:29.557736', '{}', 1),
('42922ae1759b4fc6b8a8219af221d508', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:44.308109', '{}', 1),
('42f12359b0c64fc893400f69091209fa', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:22.349440', '{}', 1),
('42f8c1d3291e4bafb548020d9a2107ce', 'CREATE', 'SalaryComponent', '2', 'Created salary component: Insurance', NULL, '', '2025-04-23 05:05:00.745494', '{}', 1),
('4300bd9abb9f4b0ca107cf01bbb7815a', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:17.533457', '{}', 1),
('438bcf4ff347461484aa47986b6acb8c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:43:06.437094', '{}', 1),
('43f8ef696692420b9fc39af337c1ada5', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:33.308964', '{}', 1),
('442cac3db8494cbcb762311e1dbcee1c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 05:43:35.248411', '{}', 1),
('445c7a0386f04b7683b60ea35499f635', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:23.489469', '{}', 1),
('462030fe675c42288caccbffea2806d5', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:35:59.362830', '{}', 1),
('46c86fa7e3fd49c7816a8c30cf7fd8ae', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:02.527452', '{}', 1),
('47e44aaed01a48c2a115b30f2ed2b759', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:37.852445', '{}', 1),
('481573256b0e405ab94cc6b0a196092d', 'VIEW', 'AttendanceRule', '0', 'Viewed attendance rules', NULL, '', '2025-04-22 09:57:01.817936', '{}', 1),
('4868031b792c4514a8da14163b1d3cb5', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-28 10:37:33.515317', '{}', 1),
('489580a1436d465b80c6ec1022a67e64', 'VIEW', 'AttendanceRule', '0', 'Viewed attendance rules', NULL, '', '2025-04-22 10:30:11.542295', '{}', 1),
('48f6e668dcff43c2b860033d2e6fa475', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-18 11:57:43.447487', '{}', 1),
('490c502971744243967b438cc4811ddc', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:27.239976', '{}', 1),
('492010c1def0415190623c73694c2b40', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:09:17.481330', '{}', 1),
('492ed99d01814fb1b872377792bd08a9', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-21 11:54:22.371471', '{}', 1),
('497603bdc2c54c70aa1ab0e4fa6dd0c6', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-17 09:32:26.140808', '{}', 1),
('49eac806cd6d4c488c09b33b14a3ef24', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-16 06:17:13.005975', '{}', 1),
('4a23385f4e304c0b9627bb767db08ba9', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:06:08.308604', '{}', 1),
('4a579f90a0a8467788530b0c9b50b416', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-18 07:07:21.821174', '{}', 1),
('4b9e673136cb46cd966a93625f9b012f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:44:08.962676', '{}', 1),
('4bcc4f03d74d4f7e9bee1af5f2d6b89b', 'VIEW', 'AttendanceRule', '0', 'Viewed attendance rules', NULL, '', '2025-04-22 10:29:23.890190', '{}', 1),
('4bcd88be0dbf4a5d9474914b3c978ec1', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-26 07:03:28.360275', '{}', 1),
('4c25d549585849b6bab86d3f38eff8ec', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 12:39:42.648415', '{}', 1),
('4c3191bb0f5744a3941ad15d81ea0b78', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:02:00.680971', '{}', 1),
('4c45744ce58f4c67811cf2fef60ca065', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:01:42.188764', '{}', 1),
('4c91a878417b45cbbd00d62fee73b02f', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:25:36.923020', '{}', 1),
('4c9f4ce6f746415382335ff197d7ba9a', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-16 07:48:19.797581', '{}', 1),
('4d048a31bdce44fab4db9251702c2155', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-22 10:30:21.714320', '{}', 1),
('4d08fb6332ed4d40b07d9b6811862315', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:31.407099', '{}', 1),
('4d7de20f825147e7a2162c61b0746313', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:34:01.327414', '{}', 1),
('4db9de3ac7d349a5a4e3f5b3ca30f0bd', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 11:37:46.102336', '{}', 1),
('4dd5ea72e8b940f2a9de1337763d2824', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:00.895747', '{}', 1),
('4ddc7a7ad9ac4d87968eb216242a5a05', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-23 05:15:25.709942', '{}', 1),
('4e0e2b14579a4c208e17549cf3b52c5f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-18 07:47:34.015388', '{}', 1),
('4e746e4a19594af3a5122062233b6ec4', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:27.605883', '{}', 1),
('4ec9c676f2a84e4295ac3707f9c72d66', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:21.707900', '{}', 1),
('4edc54936bca4e75be238bdd46bfbba3', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:42.941618', '{}', 1),
('4f4bddb008fa47ed9ec5e504b16025d8', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 10:47:38.977247', '{}', 1),
('4f678587ca4040c7abcdb87e21b234f4', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:12:58.330581', '{}', 1),
('4fc5254720c949b2acded5dd81e1e14d', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-23 05:14:05.893164', '{}', 1),
('5024cd63ad244406b2604d1b4251fe6c', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:21:58.318165', '{}', 1),
('5029fdde6de54d1da7060863bcfaaaf6', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:00:48.621001', '{}', 1),
('503ee867ba8242d7ac16f286468f19e6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:55:45.400834', '{}', 1),
('504cb91dd2a1450680607d7d9ff4ce86', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 10:49:56.147261', '{}', 1),
('515697116a364ad2820954b812ff5c1e', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-22 11:25:16.469344', '{}', 1),
('515b32ceb05848138585fb516b090541', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 05:38:23.481699', '{}', 1),
('517b61d3c57345bc9553a86b9aecc495', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:08:53.837291', '{}', 1),
('51cc641d0b424890b53569cfe97b2f1f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 11:07:34.305604', '{}', 1),
('51fc6072fa424e5b9c10548bd5915c35', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-16 07:07:27.292377', '{}', 1),
('522fe8ccaf784466bb5403330cbe1519', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-26 09:38:50.311186', '{}', 1),
('52342fafc48a44c4a9625ff40bf59697', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:45:51.646709', '{}', 1),
('527241a6ee6343a69c6c731552577b64', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:35:59.698867', '{}', 1),
('528a702ea12e4dc5af54f02729edf049', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:14:19.906799', '{}', 1),
('53b2a3666e1141ee88988df1e9ed15c6', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:18.751974', '{}', 1),
('53b7fb6a7f3b4adaa6e53fe7885f11a1', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 05:53:29.581324', '{}', 1),
('53c8f26bd6d74d588ffc207adda7cb85', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-16 07:33:41.734443', '{}', 1),
('53e878644813428b91e2d5da8bab1e41', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:08:10.675289', '{}', 1),
('5435b460e8094c73897af87ef7e69779', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:07:28.444780', '{}', 1),
('543d33b849334019a6e53ce9e0c45c7c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:05:37.125225', '{}', 1),
('5480c3e2ac8d4ab68e6515367402276e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 10:55:04.436239', '{}', 1),
('54940ff3747e4d119e0dbea3b4170219', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:50:29.641994', '{}', 1),
('54961e731124412189c95e78a61e7ec7', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-23 05:15:31.165800', '{}', 1),
('54df1da8a0a24fdd9683cef2b86738d3', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:25:27.490303', '{}', 1),
('550ada39a0a5487aa62b31373334ae7f', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:30.763860', '{}', 1),
('55bffc7537a745f49452ed9a06189126', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:28:24.595957', '{}', 1),
('55f5bbbab3c44f83939c8ba960cf2765', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:36:02.973824', '{}', 1),
('56684b54d2c246ef85e1bfbf2b82ce11', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:25.365741', '{}', 1),
('56e35feb4e2d4197b36e983c6c95942e', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:14:16.267180', '{}', 1),
('56f04ee9a9d14d07a1e2b05b6a061ab9', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:14:00.846387', '{}', 1),
('57675ad3dd9545a49ab20f81f4aa1be4', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:34.146563', '{}', 1),
('57f5539a329d43e083af1e429a5899df', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-26 07:04:08.430487', '{}', 1),
('57f7b7902cba4bd3abe3fad30f73c2d6', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:55:55.599851', '{}', 1),
('58051d8e410d49ff90647c8088f17c12', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-17 10:47:11.305324', '{}', 1),
('58210584ece94e73aed8ec80234b77b7', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:45:38.661172', '{}', 1),
('58e101967a8440a3b164921843034881', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:34:00.790857', '{}', 1),
('58f2b158cddc40f2af784629f40cedbd', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-17 09:32:57.265597', '{}', 1),
('595fa39aea2a422090134db9eb7c5ada', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 05:57:18.698209', '{}', 1),
('59bdde149bcb4c43879f49fe059ed047', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:05.441846', '{}', 1),
('59ca5747632e405ab1acdd898715a4e5', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:05:00.835840', '{}', 1),
('59e01a6a9c594abd937e6aab8b12ae04', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-22 11:26:20.922231', '{}', 1),
('5a20a7ffc9f442a78decdb4e89d3d1df', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:17.748605', '{}', 1),
('5a3c8656476e4da78386679a40dd52de', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:30.240246', '{}', 1),
('5a5b993da735484dab1a9cbe85a94140', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:31:51.546513', '{}', 1),
('5a5e84afa0fa4fea9cef585647fb1a7f', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:21:58.500700', '{}', 1),
('5a71b23ed10d44c78c21008c3f0ac478', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-26 07:03:55.137057', '{}', 1),
('5a96f7af58be468ea0be07fa4be3ed93', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:35:28.955467', '{}', 1),
('5c35e0dd33de4c588d2f8834a7d8ddfe', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:34.279457', '{}', 1),
('5c378dcfa407461e99d1b9db9d3e26a4', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:01:43.147007', '{}', 1),
('5c38ed01595e4adfa3e8db2fe03ffd5b', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:50:33.671921', '{}', 1),
('5c97ef4881fc4419b8606d4dc98a0f09', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:01:46.722478', '{}', 1),
('5d11fd9bda184b9f858f75b703264357', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-21 11:15:07.301430', '{}', 1),
('5d7b72029f6348f9aabd3bbefbad5dc4', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:13:16.078017', '{}', 1),
('5da98d2bbc3a4638948cbf89d317cb19', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:44:10.134431', '{}', 1),
('5ddd650a06c34d1791e089e0dbf4578b', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:25.441113', '{}', 1),
('5de119d270d046818153f2f456033efb', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:31.261896', '{}', 1),
('5e00fdb20994432e998cf920dd729f92', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:09:27.540725', '{}', 1),
('5f1bb17fc419467abb54a19627d80b69', 'EXPORT', 'EmployeeAttendance', '0', 'Exported attendance records', NULL, '', '2025-04-16 12:54:51.663895', '{}', 1),
('5f323d6f6fcf41869c9cf0a36f455ab0', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:30:44.807606', '{}', 1),
('5f9c9397a17d40bf82e752af7a19e8c3', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 11:37:48.495311', '{}', 1),
('5fab9189b2e4446fb29a2a5267af29a0', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:34.731414', '{}', 1),
('60aeac7b1fab4b2694c483cacf045d11', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:22.532794', '{}', 1),
('613cb97d20a74112a4e4b87cc3811813', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:06.461390', '{}', 1),
('61774f32ed224c24952027809cc67e7f', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:31:53.409978', '{}', 1),
('6195938eca9142f5a9736b1aae850f5b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:14:50.674579', '{}', 1),
('620fbc6cac93410989b7d08b1d7f3e39', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-16 07:06:59.859509', '{}', 1),
('627c983021be4c629b98e933c99ae5a8', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:32:01.294670', '{}', 1),
('63b60c5dffc046c3ad71fe28b8880b2f', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:32.550536', '{}', 1),
('63bac68000bd4ffab6e71cfe8b486992', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:00:49.855471', '{}', 1),
('640e46eb670341c4839ca69b07573d12', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-26 07:10:58.206044', '{}', 1),
('65ea48e7ba604522a523b55c598dd2cd', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:08:51.938287', '{}', 1),
('664b8bbf23404080978c87d10fb8ca7a', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:05.110919', '{}', 1),
('66e18281e58a4b378cdfe5d4f89b1b55', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-16 06:18:43.420095', '{}', 1),
('67415b160d5048c0b435b1906832fc7c', 'VIEW', 'AttendanceRule', '0', 'Viewed attendance rules', NULL, '', '2025-04-17 05:02:54.739402', '{}', 1),
('6753b928fd204565872a40f3855159a5', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:31:54.785863', '{}', 1),
('6792a85284804944bbeec3aedafc0000', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 06:05:33.169034', '{}', 1),
('6808ef4ea7ea406c8b6c65d1d55f5809', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:45:46.147246', '{}', 1),
('689dec7f776c4be1a958f8e5466c65d0', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-28 10:37:09.580756', '{}', 1),
('68ebb2b4019542b8a6c93bc721d6d38a', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:35:59.821248', '{}', 1),
('69258bb6f16640e489630b01235dc5a9', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-16 06:42:34.257697', '{}', 1),
('69a9bcab57d8454585a12ee34e4fd266', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-18 12:04:48.192658', '{}', 1),
('69fa952c06df4ee989d693e3656c498a', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:49.130002', '{}', 1),
('6a2be7d2333445d3bc6672c8ea11f443', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-23 05:15:40.080709', '{}', 1),
('6a678c8edf174b52a28960afbf96b530', 'UPDATE', 'SalaryComponent', '1', 'Updated salary component: Allowances', NULL, '', '2025-04-23 05:07:56.570705', '{}', 1),
('6b426488a3664f9d9b21813822a70d57', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:33.919723', '{}', 1),
('6b5c554471d144f692cc27d4981f2461', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-21 07:36:40.115496', '{}', 1);
INSERT INTO `payroll_auditlog` (`id`, `action`, `model_name`, `object_id`, `details`, `ip_address`, `user_agent`, `created_at`, `metadata`, `user_id`) VALUES
('6bea8e8ba66c436e8d0bc0e157345615', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:34:00.505829', '{}', 1),
('6beb851e6bd240cfabe93da2d2af87f4', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-16 06:23:19.756467', '{}', 1),
('6c79c54bd3da468f89af36a68148ef6e', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:24:02.578313', '{}', 1),
('6d419e13e7d446e7b456828eda4ee659', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:33.752876', '{}', 1),
('6d5c14a1d913423791b9c985f356b6c0', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:52.277608', '{}', 1),
('6d870528a42045969db3848442e5b808', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:05:55.187267', '{}', 1),
('6d8dd00f321b4fd9b63aac5df8c7f801', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-21 11:13:40.940646', '{}', 1),
('6dc97d2d14404b9694c2b0182488b0ea', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:07:30.261133', '{}', 1),
('6ddbecf4d376430b8e0a347347d5afb6', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:55:01.329320', '{}', 1),
('6df2d8c894a2475f9bbdb933b57f9759', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:53:52.765857', '{}', 1),
('6e13fea302f84d45b45349c18104b51c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:06.308649', '{}', 1),
('6e706e4844d44992bd6a848614e38618', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-17 05:56:36.660019', '{}', 1),
('6eaa3a3ca442411c856b87cb3af51db8', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:08:07.611699', '{}', 1),
('6ef1b62307934cd4bb8daa97bc93d405', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:00:49.977344', '{}', 1),
('6fb727411fd2449e9ad9c16704fb09a1', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:57:11.981579', '{}', 1),
('700c4f6353514028ab0c1490a24413a1', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance report', NULL, '', '2025-04-16 10:50:42.433820', '{}', 1),
('700d0e8b34b746eaaadc7a91e35ba17d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:58:59.472861', '{}', 1),
('704cfec976b94b77aaa49528f52b82d8', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-17 05:06:33.385557', '{}', 1),
('707565898d614558816532747682f6ca', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:00.682387', '{}', 1),
('70e38b57d0c84313bb299c92d75ccea2', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:00:49.192634', '{}', 1),
('710e7d705ad5456aa47e4218d8dc9fc7', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:50:34.114412', '{}', 1),
('71335da4395747458a7a3af41f5721e6', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:29.496937', '{}', 1),
('7145dd2650e64ee69c37d74d986f39f1', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:55:46.422634', '{}', 1),
('71a3018cafbf4f4eb308c88de5c0afaf', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:29.957326', '{}', 1),
('71a4ed0360bb417a8a3d7614efacb17a', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:13:25.528358', '{}', 1),
('71fd341870dd4493a4e4f4782be4145b', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:37:54.525572', '{}', 1),
('729a6502b34f4c09bd0d0abb58b999b5', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:14:00.005436', '{}', 1),
('72ea641f69f04c8f97b309552334404f', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-28 10:37:21.877562', '{}', 1),
('733adffb68224eaeb4c7a4d9f9fa7aa2', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 10:50:37.083018', '{}', 1),
('734c4b571e9e4c2a9a5859e2b5948057', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:28:24.446221', '{}', 1),
('7405bca14d774001a2223b92e08d5bbf', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-21 11:09:04.747509', '{}', 1),
('7528d58eae624f42b7c43f784e0f537a', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:25:36.732212', '{}', 1),
('76010c1fdf4b44668c16f1b3858a8090', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:57:11.021366', '{}', 1),
('76027b970a714827894262dd7922d2a7', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:43:04.351472', '{}', 1),
('767b48a99e1d46139e96b96414a0efc3', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:05:36.863230', '{}', 1),
('76e38203ed2b44c493862cd4b1d1631f', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:55:46.653756', '{}', 1),
('76fe118613d6424bb1d0a96165360f14', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-22 11:27:13.836048', '{}', 1),
('775e713c86254523bb0409ab55c2c8fb', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:36.586249', '{}', 1),
('7802a7473f5646a1855e88d1f24e7138', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:55:48.067808', '{}', 1),
('78275717a8674cf9872ed731851a9060', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:26.730195', '{}', 1),
('78cad853d49a401fbd2825e163d566f9', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:34:01.101411', '{}', 1),
('7901cabd153145da8d632cdbfaad8bc8', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:27.120881', '{}', 1),
('7944c838c0bb44cc8c922acbad5ef770', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:57.986443', '{}', 1),
('798f73e36ac449728e95f8a2cc78c80a', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-16 12:03:25.805262', '{}', 1),
('79b18d5343ec4626956988054df8a946', 'CREATE', 'PayrollPeriod', '1', 'Created payroll period: Payroll 2025', NULL, '', '2025-04-16 07:48:19.744404', '{}', 1),
('79c459c0c1ba4822ae4cb624db47c419', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 05:05:55.467575', '{}', 1),
('7a2b03e6faaa46869d7c2abfbdc2f00c', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:22:23.810163', '{}', 1),
('7b0e559beba14a769b8aeb8d16294fff', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-24 05:38:20.926157', '{}', 1),
('7b951a2cc411403e8e036ac89928b80e', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:45:45.745018', '{}', 1),
('7b9d47a340824b32b76e3383196b26e9', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:27.703045', '{}', 1),
('7baf7d5c614d440e889a496db421a394', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:30:01.327398', '{}', 1),
('7bb7b7d56319470dac462a1220e851cf', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:33:02.123559', '{}', 1),
('7bd5ce0bd9034b8bba4658de4042f9d4', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:30.557863', '{}', 1),
('7c39b1a46fec409ab55e550d23405f0e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:44:09.714709', '{}', 1),
('7c442d4f7e85472793550c33dc9a258e', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-18 07:31:25.914829', '{}', 1),
('7c51d9e2c33844dcba59543cc5092357', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:44:09.093405', '{}', 1),
('7c57bdeea50249e7bbd836b995911a15', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 09:17:27.558417', '{}', 1),
('7c9369c3ad7b4caa843c5ddabef62949', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-21 11:18:59.168227', '{}', 1),
('7c95b286a1fc45848a2c3f04386e52c0', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:08:15.145775', '{}', 1),
('7cc3c46ac3f144d19fd6492efdf168e3', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-23 05:15:45.596145', '{}', 1),
('7cfc6b2ee9b44ab49aa222df4f4c0374', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 11:37:48.018311', '{}', 1),
('7cffe7ad0de44dfb890b54ed4aea0669', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 04:58:09.558690', '{}', 1),
('7d01b0b6b1364306893b43967acfc6ee', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:01:18.217395', '{}', 1),
('7df1c36c64f64045814c664f7006f5c1', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-16 09:42:54.217996', '{}', 1),
('7eb38dcdb32d47449b3476e0d3f5b27e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-17 05:07:37.742662', '{}', 1),
('7ed0396e5e794152bcf3e4c226c35ee4', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-16 12:03:56.403871', '{}', 1),
('7efd1a347ba24ff9a733b2f6fb1c18e7', 'VIEW', 'AttendanceRule', '0', 'Viewed attendance rules', NULL, '', '2025-04-22 09:58:14.642123', '{}', 1),
('7f3abdb9a5084389af9fb2117b12a557', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:53:05.426965', '{}', 1),
('7f6a720e465d4083b347ff710b070855', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:01:43.256700', '{}', 1),
('7f724345d4be42f281b217f1c05271f9', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:22:30.147007', '{}', 1),
('7faaa44ac170491b9cfee13e6244bad2', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:31.011394', '{}', 1),
('7fdd66380f3b4193b75671ac3d81e27b', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-18 07:46:12.060307', '{}', 1),
('8061c64540734993a4c096019a0b3d9c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:22:30.327720', '{}', 1),
('8122ea7113fa4f67b8e114ff1fd455b5', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:59:50.699733', '{}', 1),
('813230f658e7467b85f25234e16724e0', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:14:25.454589', '{}', 1),
('81b26929f8df470c8113992a57dad7bd', 'VIEW', 'AttendanceRule', '0', 'Viewed attendance rules', NULL, '', '2025-04-17 05:02:36.198967', '{}', 1),
('82386b38382a4b3da204e17f1e1306f8', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:01.046963', '{}', 1),
('8240c96eb45e48a5a916852d568fca5d', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:31.723067', '{}', 1),
('8241519c666449f4a5990489babc0f20', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:30.028189', '{}', 1),
('834cf32d08934e8b80c8d4a11bc226bc', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:43:04.905426', '{}', 1),
('836b5a447fb74675ae0e8a06d93f3341', 'VIEW', 'AttendanceRule', '1', 'Viewed attendance rule: Late Arrival', NULL, '', '2025-04-22 09:58:03.827807', '{}', 1),
('83af25beee7d41c6a6ffd1dfa785c3b9', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-26 07:06:26.311901', '{}', 1),
('83c31044e77e456cbc4e0f8ccce25b0d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 04:46:49.246793', '{}', 1),
('83d1bc075e354738a9b5d853a9c005ea', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:48.520202', '{}', 1),
('84263ede0a1745a58583f6efad072575', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-18 04:59:37.841650', '{}', 1),
('848d2ff372fb49d18d0750eeb880e4c0', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:31.125726', '{}', 1),
('8492749123e142d7a692fd3dd60d9a19', 'CREATE', 'SalaryComponent', '6', 'Created salary component: Allowances', NULL, '', '2025-04-26 07:03:55.067232', '{}', 1),
('8496aa1faec240739de02742f8810ce9', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:36.363979', '{}', 1),
('8590c4c7264746f69e099fbaf5422d4e', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:02.999501', '{}', 1),
('85fa2ddd57dd432ea0b17db77a4feba3', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:28:24.817736', '{}', 1),
('8665b867bf5f413b988ddf429090efbd', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:16.620029', '{}', 1),
('867718c6f24d4023888bb0a0196c5241', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:07:56.639927', '{}', 1),
('86cfaaca55e0463196513d9ea31d0f5a', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:35:59.148042', '{}', 1),
('86d79ad41d2444c2a5b178106141537f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:12:58.435539', '{}', 1),
('8757bd1c8c434f4d9ecfd28df525f411', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:56:01.550175', '{}', 1),
('876a08b2d5d64fab8b506390e602e051', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:05.029347', '{}', 1),
('879466402fad4ee8ad0c55a99b5964c5', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:59:52.395062', '{}', 1),
('87c82e02b2b74714b84491dd9b391cea', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:34:01.800304', '{}', 1),
('87db05fbf8a545499b59222add8fb1ae', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:30:45.132435', '{}', 1),
('87e544597c5e4a5c9597f318d7ce360d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-17 05:03:34.808981', '{}', 1),
('883bd5eda74f4e8c9a4283d815122b30', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:13:26.306621', '{}', 1),
('884e0237d2154b5d87c33b62cd9bb621', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:30:01.195454', '{}', 1),
('88cbe38df2e449ac9503710eeca4057c', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-18 07:31:21.102724', '{}', 1),
('88d12374b4f14f10bc02874838c073b3', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:56:57.311542', '{}', 1),
('894e9e9045f2492f89e59470b757635c', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:34.431349', '{}', 1),
('895bb992e30b47929534c0490d90e3ad', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-16 12:03:40.853749', '{}', 1),
('8985229217324ffcab393025cf8980e8', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:52.454164', '{}', 1),
('898b05fae7504d988ded13e45e6f89bf', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:01:15.788057', '{}', 1),
('898e270f90924e928f051783dc06fc33', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:54:39.113073', '{}', 1),
('898faddc5a6740149013bc0493a410d5', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 11:49:24.544137', '{}', 1),
('8991cb65be2a41e588509b9ce80def22', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-21 11:09:06.378758', '{}', 1),
('89be8f2b03094c14ba8b7ff101d6b44f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance report', NULL, '', '2025-04-16 10:49:37.130478', '{}', 1),
('8a2f596982144c55aee74e9f7371915e', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-25 04:41:58.139383', '{}', 1),
('8a5bde74c6a849b4b792be2588ab3aa7', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:29:33.314886', '{}', 1),
('8b00f61ba9624d49be52eb0ea1eccf1e', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 11:47:49.452645', '{}', 1),
('8b0b1a3858884ab2aa25010e7013ec40', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:22.972883', '{}', 1),
('8b5aaeab879249b6992ae4889f62413f', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:35.340571', '{}', 1),
('8b67fe00d3634cfd8e2e6189ae8bc080', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:00:50.218787', '{}', 1),
('8b6db8cad947478bad281d7f889c60b4', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 11:49:14.394700', '{}', 1),
('8bcd91299d8843a497959cf1e19f0b54', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:46:47.683543', '{}', 1),
('8bd778c6211747bd8995c38816d73e70', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:37:54.181291', '{}', 1),
('8c18ed61228546ebb682fdada54149fd', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:08:46.167847', '{}', 1),
('8c5d7a68860a4bf69242149f6ef71b02', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:05:57.210639', '{}', 1),
('8c625bd8b91a40ca9c391b1e5ea43cdf', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:47.214175', '{}', 1),
('8c64a637ee1b4537b0285b2a80327fa6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:29.576071', '{}', 1),
('8cf10368ac0643d5ad912e47ee63dce4', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:28:59.070321', '{}', 1),
('8d2ba422fc3c4ca0a43893b41041cd98', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:43:33.037285', '{}', 1),
('8d84ecdeb3a14b6380c11ffbd01f52ea', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:31.226097', '{}', 1),
('8ddbaabfcbb44b4c9bad9bd852add467', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:35:29.213499', '{}', 1),
('8e12421915cf454598980b82a2c8dcad', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 10:51:56.586405', '{}', 1),
('8e2683740da144aba4f6c03af3506c4f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-28 10:37:47.964355', '{}', 1),
('8e400562c5c848ccb176a192d45f4e18', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 09:45:04.403460', '{}', 1),
('8e99a6747f3d45b68ffc080e20a97940', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:56:37.596955', '{}', 1),
('8ec5edf092334a5d915939b0531b0649', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:58:56.116843', '{}', 1),
('8f418be2d08547ea91dfaf2ad1353555', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:37:54.652558', '{}', 1),
('8f50c7a85f82467b92294e6b47e94c63', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:08:53.560538', '{}', 1),
('8ffe8da904b744a1bb6976a07013e42f', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:31.885261', '{}', 1),
('906d11424b4b4c8097cdf30b368cf1ef', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:08:47.105605', '{}', 1),
('90f7093aef6b4f5d9332cc804f135449', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:56:19.332670', '{}', 1),
('9113e006d2814fe2a60f23b9af6e380a', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:21:58.656173', '{}', 1),
('91295a6cac9f4c62869656f232af3498', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-17 04:59:55.960355', '{}', 1),
('91313754d2d646ada108fa75921f8b4a', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:34.605303', '{}', 1),
('91b51d4afc2146b697a81ac1aef4f7c0', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:50:30.648031', '{}', 1),
('921f15e134eb4aa0ac711b8156ab1635', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:03.718320', '{}', 1),
('9223af1403374431ad7e6be592b196a6', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-17 09:32:28.706936', '{}', 1),
('931240e50e2b4df5bbe58e6c36f500cb', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:37.310507', '{}', 1),
('932601780a9842e9b691315d1a056d1c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:07:42.164845', '{}', 1),
('936835e5a47a4ed4a17c5ac337af1bfe', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:54:16.540562', '{}', 1),
('937859011a7a42208887545940524b63', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:44.840034', '{}', 1),
('939a66e3b736462db6b5422e015f7bfe', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:48.065776', '{}', 1),
('93eba4ab298147bfa7d4f6f136aafbe5', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:15.360264', '{}', 1),
('93fe3f58bda94dce931f07d09fb20cb6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-17 09:32:30.672873', '{}', 1),
('9403de9981c941c8b10d62ddbb1f2a26', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:29:32.618163', '{}', 1),
('9410aa3b3ef045608a44fa2461c31a1d', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:36:02.354748', '{}', 1),
('945972857cca431a881e4de2740287bc', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:50:29.723082', '{}', 1),
('94990c0d7f0346f18793cdbc610f7abb', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:50:29.055311', '{}', 1),
('94d51272c6e046268c473b6a1742ce09', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-18 05:43:55.890784', '{}', 1),
('95e77fe1ba7b4f77b58a4cadae58c4ed', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:44:10.462664', '{}', 1),
('960856818a154a68884c32be79beab8b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:12:58.694788', '{}', 1),
('96b5ae6864984a9193d2620d97ccc581', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:35.874676', '{}', 1),
('96cb07c577fa436cb5d453eec65573f7', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:22:29.792791', '{}', 1),
('96f20889d9d1473c888b34deeb5308ba', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-18 12:12:11.910309', '{}', 1),
('9760292b6e354771a428fae05f784989', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:08:53.701230', '{}', 1),
('976bf1484ec94d749dc3b47472681e4c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:14:22.556890', '{}', 1),
('97892aef66da4871ae047ca6cb9d907d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:01:38.416696', '{}', 1),
('979ad768deb842a8a520905e40913f25', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:43:05.149926', '{}', 1),
('98094e9e95704be496856cfb524212fd', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:05.366271', '{}', 1),
('981f2dcc48f446708453627db949b922', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:21:56.812296', '{}', 1),
('991744239db84e9d862738983475d60d', 'CREATE', 'SalaryComponent', '3', 'Created salary component: Allowances', NULL, '', '2025-04-23 06:53:05.366537', '{}', 1),
('99277e90020b449e8b82ff72f9cfcc2c', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-26 07:03:19.560493', '{}', 1),
('993aa0f250a24ba7899ae14d7054738a', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:21:56.618901', '{}', 1),
('99dd41470f18422b81a7df1d869db62a', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:05:56.853380', '{}', 1),
('9a672783f9334f099acd7aa11fcac6f7', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 11:05:49.647871', '{}', 1),
('9a86dd879bc8423eb729e9e1e03da467', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:32.821435', '{}', 1),
('9a9460e6b5754af1bc59ae73ee00b4c8', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:51.787565', '{}', 1),
('9aeab9d86da94f99a7541d4b328f34ef', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:36.760859', '{}', 1),
('9b32b128c9a246e49cc4dc540a5c7343', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-23 05:15:22.718771', '{}', 1),
('9b371f7a50774926872e226bf766eab0', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-22 11:24:57.367287', '{}', 1),
('9b6677ae20db4727b7e1a2fe77ddb49c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:29.457426', '{}', 1),
('9b9bfdf38bf54c108988c805d89d4ea6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:33.522055', '{}', 1),
('9bc8a59c5f61411da1044fa8da2ee025', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:23.328006', '{}', 1),
('9bd6e0986e2d47938d3d5ade9dfb1d12', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:59:40.863005', '{}', 1),
('9bdcdf7bd75a4e05aef2e2654749d349', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 10:51:55.267977', '{}', 1),
('9c1f6f173bb3476f97a48f5eb0a45b71', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:49:02.861413', '{}', 1),
('9c8794e14f5f4abe84dd3c7032f6024a', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 11:48:58.937956', '{}', 1),
('9c8f35dc05594d539b5d65731a545591', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:22:31.403741', '{}', 1),
('9cadaaef38b340cbbd35e02868008f24', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:54.942387', '{}', 1),
('9cae28f1e3064a21a2561eb333dbab09', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-18 11:56:39.929467', '{}', 1),
('9cc26c26d78b49d5b8a6b07239c62acf', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:25.573833', '{}', 1),
('9cc66c2fa426464da360e137296665db', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:59:51.005126', '{}', 1),
('9d45f8db77764b62a0ad53e0b1bc0e32', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:31:46.368859', '{}', 1),
('9d8cf27dc9084987960027a79d6598f8', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-16 12:06:24.023638', '{}', 1),
('9df108b540ad417baafc87c15377460e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-17 09:33:00.452223', '{}', 1),
('9df18c651974465bb949dbf239abe855', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:47.438359', '{}', 1),
('9e0b48330f924d819fcf85bef8aa658c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-21 11:15:35.262453', '{}', 1),
('9e45cf6f2f414c818cf4a9aafd86eded', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:25:37.119012', '{}', 1),
('9e57a84aeae04c6386b83f7eae78275c', 'EXPORT', 'EmployeeAttendance', '0', 'Exported attendance records', NULL, '', '2025-04-16 12:23:35.802280', '{}', 1),
('9e624db0768546968df3c81622a68e15', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:38.274333', '{}', 1),
('9e7c0200f3ca416ca9e73d5120aec926', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 09:45:04.737647', '{}', 1),
('9e8f5041a45a475495f61d13b076e2f2', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:30.818574', '{}', 1),
('9ea992c048e040d4bfe4a5c4385e9334', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:01.785294', '{}', 1),
('9ef81800a08a4bdca76d016ac73873cc', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-23 05:15:20.357769', '{}', 1),
('9f2ff9450e384192be391f1cd0745189', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:38.620804', '{}', 1),
('9f7bca77297d4e878716f1d579f9ca97', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:31.813502', '{}', 1),
('9fa351e1bf7d4c9cb38c839860a925b1', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-17 05:03:37.732200', '{}', 1),
('9fdf9ed539954149942d1baedb30f40f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-17 05:03:23.256159', '{}', 1),
('9fefb30030c448b78e7857d07b6d5b6f', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:39:05.351204', '{}', 1),
('a03b234a61e44c9d82004a7e61dd1fd6', 'CREATE', 'PayrollPeriod', '2', 'Created payroll period: Payroll 2025', NULL, '', '2025-04-24 05:57:38.437920', '{}', 1),
('a0bf461cf92f4cac901f898de6db833d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:49:02.681660', '{}', 1),
('a0fcaa9f62464b6b93a6304e0fab6657', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 11:19:27.473946', '{}', 1),
('a18b27fc8fb34affa29bf538d5c1a511', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:21.129775', '{}', 1),
('a1ced8e3589945d09c9dd8619a859593', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:58:59.668139', '{}', 1),
('a1e923632afb44e98b540c960f284dd0', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:52.102984', '{}', 1),
('a2505111dc854f9c967c28004b11040c', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-22 11:25:48.861246', '{}', 1),
('a252405203754f219e80c58feecbda43', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:54:26.732863', '{}', 1),
('a27fddc41cc543118f0b25691cfeee19', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:48:16.078945', '{}', 1),
('a28e138559314a7f924e696690f96288', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:55:45.682978', '{}', 1),
('a2b56077dfc04be2a3ca2d5ce05309d2', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:08:46.559476', '{}', 1),
('a2e146d2e721484f8d7262cc548f3151', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-18 11:57:44.346295', '{}', 1),
('a4b2bdbb579448268ece97c9e5b6cf15', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:04:49.330700', '{}', 1),
('a4cf262cf8044314a28d9aa836011160', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:37:54.900817', '{}', 1),
('a4d81b11f4f84c868370fea337d44d9a', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:35.546714', '{}', 1),
('a5069e21fa5f40b28f332313f7589a04', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:59:25.966880', '{}', 1),
('a50e8b3e261b41fead6597c7ac4c7d8b', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:39:23.498190', '{}', 1),
('a50ef19da83b45059c120060486b1275', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-26 07:04:42.468922', '{}', 1),
('a520d9dd6c3141c78aa91dd8119cb94d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-18 04:41:16.085645', '{}', 1),
('a53a0a2a939e4403b75ef2051372209a', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:52.992113', '{}', 1),
('a5b89de62a114856a1b3c1ada514b72d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:05:36.608082', '{}', 1),
('a66837d6d3d9408297401720bc60e265', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:39:06.217223', '{}', 1),
('a6859d2c97b64486bc4fae1878022a68', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:54:18.983204', '{}', 1),
('a68f484c7e2d4d8c87a379a3a676117a', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-26 07:00:52.387876', '{}', 1),
('a6d099133e5c483783a66c51d5086ce4', 'UPDATE', 'SalaryComponent', '1', 'Updated salary component: Allowances', NULL, '', '2025-04-23 05:08:07.555885', '{}', 1),
('a72043729db243ff8666c2d7d0fd3aec', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:53.096335', '{}', 1),
('a810d337db8f4333907975c664af3a25', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:59:40.705594', '{}', 1),
('a84c875a72b94c82b21c88a197642122', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:33.055716', '{}', 1),
('a89813f0e07b4638acb14ebecd4adcc8', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:35.842602', '{}', 1),
('a93166c6a875483ea13adc204a94e84b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:56:57.005832', '{}', 1),
('a96c2eb5771047bc80efded923849d40', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:48:17.512822', '{}', 1),
('a9805c5eda664d9685cae33c0e6f9a73', 'VIEW', 'AttendanceRule', '0', 'Viewed attendance rules', NULL, '', '2025-04-22 09:57:59.562079', '{}', 1),
('aa8ea4fec358412d9dfaaa8da8ae6edf', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-18 04:59:44.425362', '{}', 1),
('aa97f2356df449cda8e27780d5fb57c9', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:30:54.681056', '{}', 1),
('aac17028b0224d8b80f279ff594bf787', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:31:54.653200', '{}', 1),
('ab16e602a817419ca3d3a902e9f8619b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:44:09.870241', '{}', 1),
('ab8ccc3b7fc94be0b86654ee4489f3ee', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:13:26.158869', '{}', 1),
('abae44719b8a4463b66d74a1a243ddae', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:31.457231', '{}', 1),
('ace57dd670af44aa96b63f0f5c2ce9b2', 'CREATE', 'SalaryComponent', '1', 'Created salary component: Allowances', NULL, '', '2025-04-22 11:27:13.724337', '{}', 1),
('ad128cffa11b4d398919f3b30e522cb0', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:17.413455', '{}', 1),
('ad237768c353415bac7b153da9d7e356', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-23 05:15:36.146467', '{}', 1),
('ad308aa2021644d5938c9da7808fbcc0', 'UPDATE', 'PayrollPeriod', '1', 'Updated payroll period: Payroll 2025', NULL, '', '2025-04-16 09:43:19.041645', '{}', 1),
('ad35715eb4e14c79a317bb0914b08a11', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:18.574307', '{}', 1),
('adf60cc60be54873971bbf3d81a70974', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-22 11:27:27.205658', '{}', 1),
('ae78b7cc8d714bd391a9968dbc6c51bd', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:55:27.453521', '{}', 1),
('ae9202bb26ac4487aa3b86dc5fe49090', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:05.214023', '{}', 1),
('aeb4d03ed34b425fad95206304aea752', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:55:46.106063', '{}', 1),
('aeb9759197884557b0e8a69d9ba3fb6e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:08:49.064066', '{}', 1),
('af2dc4bd8beb4e4d9c944b14f8584816', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:35:58.516933', '{}', 1),
('af91777968b4451ba896ebfc2cccc289', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:36:00.459326', '{}', 1),
('af91e193236446eb83ce3211a8c2c57c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:55:46.233107', '{}', 1),
('afad527c815248b5ba3db2f8f389b05b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:56:56.851620', '{}', 1),
('afbe11586b794c08b072f49193cb610d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:53:46.898071', '{}', 1),
('b04c2a34d2e2470da01cb81620929267', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:14:49.044444', '{}', 1),
('b0a730931c9843dc9ac496c84bfca1d4', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 11:19:08.103315', '{}', 1),
('b0ae861c6d7a4126a1b2800b74acb2c3', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-21 11:53:46.489207', '{}', 1),
('b116613c08ce42d1ab43486c4541907d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance report', NULL, '', '2025-04-16 11:31:50.032655', '{}', 1),
('b167806834f248159b01adb44edc0920', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:59:30.754297', '{}', 1),
('b1d4c2d408744cad8bf490bebddd786a', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:08:26.913782', '{}', 1),
('b2356b06572445e8a9ef00ef905f771e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:28:58.471036', '{}', 1),
('b28710cfde204975b317e1c6a50e851f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:29:32.947338', '{}', 1),
('b396ff24cf6e4dae815dd1d2602792a3', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:01.685983', '{}', 1),
('b3e4136049914215af58bf936d0759a6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-21 09:24:19.050638', '{}', 1),
('b463c61ee6e9412ea2c1ef0ac4748a2a', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 11:37:47.801242', '{}', 1),
('b47911a87b2d4079a956b53da21064d4', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:32.288383', '{}', 1),
('b4a3a9fd790f457bbc6aed424afbc0c7', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:44.488301', '{}', 1),
('b4b59c171d6d475e9e67d0411b128e95', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:22:23.362889', '{}', 1),
('b4f5a953025b4dd2ba9b748411b5c171', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:52.559011', '{}', 1),
('b54f9966c61a4365af5eb729a56e38a7', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:52:01.292442', '{}', 1),
('b58ff2cfcb1f421ea77c311116bb2906', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:48.242744', '{}', 1),
('b5cd864a7d79491990be287c8712673b', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:55:48.841093', '{}', 1),
('b5ee1c6a1ed6438b90f94c1df2b5329c', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:45:51.388917', '{}', 1),
('b5fe3cea974e4cba9f1a5458a138df99', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:51:28.620360', '{}', 1),
('b60d759d7a0c4437bdc3ef8572e1fc18', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:22:23.934384', '{}', 1),
('b622598fabfd4e41b1c37d32e6d95ded', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:01:03.350310', '{}', 1),
('b6ac83fada324751b78a75d6e650e6b8', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:32.968482', '{}', 1),
('b70851f83a3a4ca5b04338d259df6522', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:44:09.316403', '{}', 1),
('b7296a996e3544678b49017807665249', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:16.807793', '{}', 1),
('b797bfa750f04f9ea4096b589e9a614a', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-22 09:26:44.680021', '{}', 1),
('b79ba4f8e3714d2a8d33bc1bc786e068', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:35:58.273407', '{}', 1),
('b7eee9f86e754fc6934bf85eee8bfc7c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:38.773778', '{}', 1),
('b8f60e59fe6743dfa69c58229c508eb5', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:00:49.333957', '{}', 1),
('b9f39b0a95b543efbce4fa1cf5f24249', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:33.737735', '{}', 1),
('bab40c7dc06742098b77d6eb84eb2efd', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:12:57.917399', '{}', 1),
('bac6f65724fe43239e3fc915e3806da2', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:58:55.984883', '{}', 1),
('baee9a1b64654d00b74043eb34fd46a7', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:31:54.952741', '{}', 1),
('bafb0e1331f443f99e7d018272b2a564', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:54:18.501435', '{}', 1),
('bb13c0f925e94eddae05f7896c81b411', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:09:18.280111', '{}', 1),
('bb16cea82082481c83b4fcc9c393d677', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:01:44.671065', '{}', 1),
('bb6a7c469a054b43b7c67611a8cebb1d', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:33:08.183354', '{}', 1),
('bb9468bcc32b4a119f38c2c48c0b365a', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:59:49.905989', '{}', 1),
('bb965eab92804ffe984d3dc3db2edb2a', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 09:39:27.787303', '{}', 1),
('bbfc22813fff404cb171084719537bff', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:27.034031', '{}', 1),
('bd4f0ae5ff5f4df68f1882a346d8a4ef', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-18 07:07:19.354773', '{}', 1),
('be0d8935217d425dba31c6bdf3c864f2', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:28:24.822664', '{}', 1),
('be77c887af0b44718f6575aba4988637', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:59:52.260055', '{}', 1),
('be840c7b2d64488699bc0a0ebe719a07', 'VIEW', 'AttendanceRule', '0', 'Viewed attendance rules', NULL, '', '2025-04-17 05:02:58.761380', '{}', 1),
('bedccd1d3e4649b7b029738b228018f0', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 11:37:47.593987', '{}', 1),
('bf72da4e3c8a4d5f925081b22521a593', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:30:43.994517', '{}', 1),
('bfa2e2be6aa74e36a1d759602cc705b5', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:51:29.164154', '{}', 1),
('bfd3abe10fb943c0bddd201b192297c2', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:55:24.576173', '{}', 1),
('c015e073acd24c948b6b6cfc85596ae2', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:08:45.925740', '{}', 1),
('c06647568c7740bbbf065608a22ffe8e', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:26.865076', '{}', 1),
('c0fff6f48b1d4523811112d4c1655694', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:01:46.653289', '{}', 1),
('c12377bd60d34155971f5b176b40d4bc', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 05:54:32.164112', '{}', 1),
('c1d2b8c57f5b4f51997b00392e4c3901', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:00:48.209333', '{}', 1),
('c2386bf2550d428a97d5bf6c3b2d80d5', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:35:59.989199', '{}', 1),
('c345cdfb18a14d8faa394b2b841d6649', 'CREATE', 'EmployeeAttendance', '5', 'Created attendance record for Employee object (1) on 2025-04-19', NULL, '', '2025-04-21 07:36:06.197243', '{}', 1),
('c39204f361be4c2fada559cd9193e83a', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 12:39:30.300046', '{}', 1),
('c3c2f2bc2b3e483e8574c6ab00a4ae80', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:17.698639', '{}', 1),
('c3e85623f55740c58f05c5b2c366dd72', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 04:51:02.614160', '{}', 1),
('c43a0c1e99384b2fafce18c8eb711bea', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:00:01.822463', '{}', 1),
('c43c5ba3c5b349b583759cc733ec5436', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-17 04:59:46.674642', '{}', 1),
('c4721ed7aa8545b6b838f66193109b41', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:54:39.385102', '{}', 1),
('c493dd257aed412aa7f5949f0f79bf6b', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:50:30.189620', '{}', 1),
('c49aab696abd42b9a47d8367ca4ea3fb', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:50:29.440915', '{}', 1),
('c4c6a5b3d77c443fb1746684cbbdc442', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:59:40.006032', '{}', 1),
('c4e6e2ae2035470cae06c3178e521a56', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:51:28.758197', '{}', 1),
('c52ee6d454e741729c6d8664d436a233', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:33.304259', '{}', 1),
('c5c02637b7fe4469a553a5ce1482c4fa', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:31:46.447115', '{}', 1);
INSERT INTO `payroll_auditlog` (`id`, `action`, `model_name`, `object_id`, `details`, `ip_address`, `user_agent`, `created_at`, `metadata`, `user_id`) VALUES
('c5d70b80bde64b9c9ce9fd29b9d3c725', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:44:09.492675', '{}', 1),
('c5e78c5a422547578fcef7b1fc07dce7', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:01:46.941923', '{}', 1),
('c64c92c13449413f8f64ad87af988a2b', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:31:55.408310', '{}', 1),
('c6e22dd146334059b1890564910c563b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:49:02.549946', '{}', 1),
('c713ee86d9df4c819a32a2848cc598ec', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:02:13.718573', '{}', 1),
('c71958a5b9854937b1d3065b3232f126', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:03.332039', '{}', 1),
('c78150c71b0e4bfd8b019a6f66623486', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:51.495978', '{}', 1),
('c8fc608030c342b182a82a5e9e9e44cf', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-21 11:00:01.517785', '{}', 1),
('c8fd40ee130b40858b4af608ec2e1f0d', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:59:26.336899', '{}', 1),
('c9d005d3d5674f86a3ce7d789df05473', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:36.965739', '{}', 1),
('c9e053b22ef243d593d8523d633bc1ad', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:35:28.560431', '{}', 1),
('ca0bb82f93b94323b4eedc67ad76adad', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance report', NULL, '', '2025-04-16 10:54:18.106010', '{}', 1),
('ca36979f83c541f9a2b9cad5d1a13c59', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:34:00.373021', '{}', 1),
('ca5197bf43ce46ee8839ba777da14657', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:05.645915', '{}', 1),
('ca52b2f09f2a4e0098ca86edc37cb278', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:28:59.043172', '{}', 1),
('caa5d0914fc24b56a0c15fc0c79b0844', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 09:45:37.042652', '{}', 1),
('cb3d8527f5ac4932956f4c1f57144e87', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-25 11:37:45.014821', '{}', 1),
('cbea66dfc4fb4eef916024b3a9fc7d89', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:31.946836', '{}', 1),
('cc45b82519f843588dab4b6a6704b319', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:08:53.271248', '{}', 1),
('cc4a36769ff94456b0ac96603bc7cfa8', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:09:27.742114', '{}', 1),
('ccec4726d49e40a1b6268860950293fb', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-21 11:03:03.253950', '{}', 1),
('cd226ce26c304d408a6ac04924cc2f63', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:09:27.909869', '{}', 1),
('cd8ca91bc65b4a4d856e25693c9d9c16', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-21 11:13:35.483454', '{}', 1),
('ce10ea8e9b994e55b8425fefef6410ec', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:56:07.232548', '{}', 1),
('cf027b96d4164d5b98f480d5d6c569ad', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-26 07:06:32.799015', '{}', 1),
('cf6ed7bb78c74bdbaa24c86bd8dc247a', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-22 09:25:50.966836', '{}', 1),
('d02c048cec724adc804fdd020647db9d', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:26.390646', '{}', 1),
('d09a483053434636a9e55b488b2ebea4', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 11:48:04.085331', '{}', 1),
('d09d640f3a8747b89dab382aee950fa9', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:55:24.777221', '{}', 1),
('d0f2627c9438473cb87c3a0fd5aa399d', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:41.468698', '{}', 1),
('d117ab372a6e44afb46176f45dfdc9e0', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:01:33.800284', '{}', 1),
('d12ef5db274e4229ae8752e3fd065084', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:50:06.095212', '{}', 1),
('d139859007ed47e392a45ceffb9c2e84', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance report', NULL, '', '2025-04-16 11:32:21.627986', '{}', 1),
('d1aa2a8d71a54d82bc21e3ebc0bb8101', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-18 07:46:03.399641', '{}', 1),
('d206228b2de747b7a85379a36f64d2d9', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:21.875373', '{}', 1),
('d35c5a681a5445c6b5d8022a6c19ca2a', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:30:44.906543', '{}', 1),
('d3fb559c249543dcb072feebf44b9314', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:13:11.260951', '{}', 1),
('d44381afa68c4108b0686d01e2261e28', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:59:50.339483', '{}', 1),
('d4a9a44683fc4b9eb685035b3c4d124b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:34:01.105011', '{}', 1),
('d4d5dbf5bb464a83b62210005cfbd897', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:53:46.738807', '{}', 1),
('d51bf7fb57a44d0b9a9a169b088249e3', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:52.031120', '{}', 1),
('d618e155c80b451084c9abd619bbfd61', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-18 07:46:18.336381', '{}', 1),
('d62c0de032e04d13aa57b72cdf734f1b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:01:44.167516', '{}', 1),
('d6aebe4cb7bb4f9b96c07d8a139430f6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:01.226487', '{}', 1),
('d70913d739144b3f8c77ef3bdc6a2bb4', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:55:27.013436', '{}', 1),
('d7582c72ce0141f9b9e7058360c6c361', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-17 05:55:18.691443', '{}', 1),
('d7a48dfe6ca144d992ee5bf184c3327b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:25:30.029580', '{}', 1),
('d7afbdf36c3c48a08b5472a16c870287', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:55:13.706100', '{}', 1),
('d7ef502c35354450b21a27260310dcee', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-24 07:00:48.791661', '{}', 1),
('d83cae7b83704b57af2558776e324e9b', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:29.837203', '{}', 1),
('d83f86e55bd64a409f2f02191b4a2259', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:01:17.962094', '{}', 1),
('d89363aaafe64a1f8663461d8fedeaee', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 11:37:47.477040', '{}', 1),
('d89fae439e8644c983261584f0eb8a1f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:16:01.915395', '{}', 1),
('d8bbbbbdabad4b07b138de3b3eab5bdc', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:14:03.830804', '{}', 1),
('d8e932770db44e75b98015a7c66505da', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:54:25.188917', '{}', 1),
('d96f193317f14e9c8f08d0043d463f85', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:01.354468', '{}', 1),
('da58c747d9174e8ca1230e46c6eb5754', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:13:25.402198', '{}', 1),
('da828d5fd95e4bf7add85fcb4907c85f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:01:40.517204', '{}', 1),
('da9b15a225de4b80b2eefb96e40dcdc2', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:06.205119', '{}', 1),
('daac681da1404da787e908839002ff0c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:29.182604', '{}', 1),
('dadcdc0e864f4829ab603598d819bc63', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-16 06:42:28.354420', '{}', 1),
('db270b0a1f09412693877b3984f8a7e0', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:57:05.765764', '{}', 1),
('db5286e6abdd40b8ae5bc8014074df64', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:38:05.920303', '{}', 1),
('db57ee38c7c94b768e72f0f8d328514e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:58:59.118424', '{}', 1),
('db766d8e06c142128813977629521eee', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:58:55.740037', '{}', 1),
('dc2b46e8778949c996e12d12185c691e', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-22 05:08:23.496711', '{}', 1),
('dc5d88fb751f40fa8234fdedd0c47f13', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:14:50.455576', '{}', 1),
('dcbc1d36e91a4dbcb1b828efd5242a0e', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:55:33.243273', '{}', 1),
('dcf1979049de49618ac0b5ae7dbf1673', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-23 05:15:41.736540', '{}', 1),
('dd2f0b1abcd64fd7a1c3ff392b76a1a6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:31.651007', '{}', 1),
('ddce78ff9065463eba6b97c8af7d8c00', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 07:48:12.808370', '{}', 1),
('de136415f3e549a3a16fc103b4729946', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:14:00.642621', '{}', 1),
('de396cdda4f74ea58b21a74d60eaab66', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:41.290620', '{}', 1),
('de818bcf22fa439ca8916344e4a2d47c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 10:54:15.191297', '{}', 1),
('def0889575be47cb9dba810eebf05e87', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-28 10:38:08.060967', '{}', 1),
('df42571a2eb24b0398006f2e2198aec7', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:23.690164', '{}', 1),
('df6494532f2f45d3ae110832011e022f', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-17 11:06:11.369214', '{}', 1),
('df7d6e7f635a48e5a2e68051cb550df7', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:32.064243', '{}', 1),
('dfbc859088b646ff811fae8b0f8a41aa', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 06:05:35.751274', '{}', 1),
('e02755b2ab094963a300d0f7a0c41763', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-17 04:51:26.836091', '{}', 1),
('e05010c0669e4b3385d5591a1cd55d98', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:59:30.622015', '{}', 1),
('e05786549cae453dbd005df748f8d4d9', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:56:57.196166', '{}', 1),
('e0c5a19f27154fb8bf9b65e015877bf6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 12:49:11.733601', '{}', 1),
('e0db7db0a6bf479c99872968fc5985d2', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:32.441055', '{}', 1),
('e18f2ca6574541b5b7cb4ec074556121', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:09:07.553089', '{}', 1),
('e191a07ced784a82a7e2c3ba9373476f', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:29.327699', '{}', 1),
('e1c94e20b310441895fc5558a48c88fe', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-18 11:57:44.538278', '{}', 1),
('e1d9f54ace3e4199b147c2204dc499bf', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:11:24.613892', '{}', 1),
('e1f153586d2c434db0b86b031d10f7b4', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:09:25.324065', '{}', 1),
('e2051ff2b47843c395d2bf9e3777b95a', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-21 04:46:15.279542', '{}', 1),
('e22f092016214d2ea5bc384ed28f5b2c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:21.507501', '{}', 1),
('e270fefa2cc7426fbc23f0bb018ae02c', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:58:55.605306', '{}', 1),
('e30ef72ad0704eee86c311708054b627', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-16 06:19:43.100005', '{}', 1),
('e31390da02504e97b834e8047b5a0051', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:24:33.623850', '{}', 1),
('e33d2f122e8040dcafe129284ff66616', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:25.123722', '{}', 1),
('e35c6f2b7c444be8b4cc2baf947065b8', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:17.082483', '{}', 1),
('e385dc8e9ca947f1b8ed1a270ee25f76', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:25:30.858128', '{}', 1),
('e39839b3688946ee91a7052e07935f6e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:28:57.806031', '{}', 1),
('e3e3381d06cd48a7874c85557b48aaef', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 11:54:48.071110', '{}', 1),
('e3ec29384b5b40ed867690bb418890ab', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:29.388720', '{}', 1),
('e3ef933ff9884b679b60eafd86b5184a', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:59:50.212930', '{}', 1),
('e4601ba63c1b43e49efa528d8f31132b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:43:04.177365', '{}', 1),
('e476d67430604521a212dedd5e817a33', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:56:08.865141', '{}', 1),
('e4b1488aebfd4d1087ad8cacebf8cb0c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:31:55.229482', '{}', 1),
('e4d45d48c0934808a19351331f642518', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:26:29.420732', '{}', 1),
('e52b8652c9da4bf58ec6e08140ef746e', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-21 11:53:21.176204', '{}', 1),
('e59c180aaaae45b6a9c2b384c17af38b', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-18 05:43:51.798370', '{}', 1),
('e5a9669fdb4a4d97a19d0a0565a1814a', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 09:45:01.867278', '{}', 1),
('e6044040600e4e69988b2cdd70e25651', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:29:32.745884', '{}', 1),
('e60c0d7c915f4eba82524659a443695e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 06:05:36.103507', '{}', 1),
('e61ee9dc42b6459882848d250cf36387', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:51:29.367663', '{}', 1),
('e64a4301a57c46d98521a2306efe16cc', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-16 09:43:26.184132', '{}', 1),
('e6692c5a35634961b987f0f37da0e361', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-21 11:19:56.889145', '{}', 1),
('e67edabe047e41b79c8f3cfc096918b1', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:13:25.844559', '{}', 1),
('e6e5eb7e3c5c42fea1093c878f4c8766', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-18 11:57:44.913703', '{}', 1),
('e71c95d643a24a518e29889e74f56656', 'CREATE', 'SalaryComponent', '4', 'Created salary component: Allowances', NULL, '', '2025-04-23 11:49:14.363977', '{}', 1),
('e736e31294d542b0a98840ec3e5fb423', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-18 12:03:57.430418', '{}', 1),
('e789a98d07604ca2b7c75899aef01e04', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:08:46.739437', '{}', 1),
('e7eb8c406e334484a5424cb80e02f583', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:14:01.024528', '{}', 1),
('e89280007ca64eafaa23b6d21975e0fc', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 06:05:35.909827', '{}', 1),
('e97efc1311b24a1cb0d78c4fa3d27ad2', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:53.313574', '{}', 1),
('e99ff0130bd848f3b41d346ceed8433d', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:09:05.720786', '{}', 1),
('ea3011f0f6b042ef8fdc04a57f0448b6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:27.617219', '{}', 1),
('ea32ea164ff94841abb5277012765f89', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-16 12:03:52.934948', '{}', 1),
('eacab9b2819940fab784bb43441ad329', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:52.982040', '{}', 1),
('eadef8574d1542778c3d33810c3d6dc2', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:45:46.345952', '{}', 1),
('eae61cef52b445419868d049ead414f1', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:37:54.367606', '{}', 1),
('eb80560834c149798188017c125925ce', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:29.142956', '{}', 1),
('ec9c05f92ac5405080a495d0c9ed7356', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:22:31.612814', '{}', 1),
('ed1b3fd6f2904fd1bcffc528fbecace6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:32.717434', '{}', 1),
('ed1da4c468014acd80fde5ec799b0c8a', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-17 05:39:54.437337', '{}', 1),
('ed386d0934784f44b5859b5546c5d93b', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:45:46.182367', '{}', 1),
('ee4c5799b13c43e89a7018bdfcc9fe66', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-16 12:02:20.647002', '{}', 1),
('eeea674fc81a46e58b4324232d190c91', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:59:22.316694', '{}', 1),
('eeed039455c24d45bad1d17b87051d2e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 10:51:26.725002', '{}', 1),
('ef0ceadd4e5c4f89a9ceaff102256c6e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:51:28.967318', '{}', 1),
('ef0d8744be6043b194a23efd376fe78a', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:31:32.999486', '{}', 1),
('ef3baec1ac1f4a909a4ed4113837e171', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:55:27.292375', '{}', 1),
('ef7cfa73914f48909e05c2afcac2b652', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:14:29.133309', '{}', 1),
('ef83915a4e99421f9e14882cae780c59', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:43:16.963554', '{}', 1),
('ef93731c6c8846538788f30c64cb4cf1', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:40.693253', '{}', 1),
('f009f7ad3f8f40a5954724b4c613a4df', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:07:30.434963', '{}', 1),
('f0197ec7b0424b668541a13b87cdb6ab', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:58:52.341678', '{}', 1),
('f01aaecc96ba4c4ca96b7f12c5b4d2fa', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:35:59.152950', '{}', 1),
('f056755436a34e7fb715ada6d9b1a5c7', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-22 11:26:25.510530', '{}', 1),
('f0d04869f074495ebe84b215f2635344', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-28 10:37:37.623525', '{}', 1),
('f1905b82dce941b592a99539c25ab526', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:57:11.280286', '{}', 1),
('f1c21523249d44a29246c4125745bf3d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:01:48.216679', '{}', 1),
('f1d709319b6d48a6b3f5ff1b516976ae', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 11:48:58.626799', '{}', 1),
('f23930baf2f04140b07a04606deaa4a9', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:21:22.831347', '{}', 1),
('f24183941bf14e9e8aca92db8a1f04b2', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-18 04:41:07.871534', '{}', 1),
('f2ddefd21f7d4b108c077a58e6ab25c7', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:01:42.711548', '{}', 1),
('f3270719f6524d6ca96b0be978bd2d8e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:25:33.556659', '{}', 1),
('f3a7bf1fc3ec49b9ae9c0e7ec4b7a571', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-26 07:07:18.651831', '{}', 1),
('f3d78623b7344828840821530ded275e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:59:52.699413', '{}', 1),
('f3da8bf4c57e42ba89c63282df2240c3', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 12:01:42.707011', '{}', 1),
('f428365128ac43908302a49994b8c465', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:08:53.393002', '{}', 1),
('f440d794aafd4daa9c2a1100caaef607', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 05:45:33.725327', '{}', 1),
('f46ce3d757ab47c8ba87c585a0a51905', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 09:29:10.593908', '{}', 1),
('f490b07b01024462879696cfce0139db', 'EXPORT', 'EmployeeAttendance', '0', 'Exported attendance records', NULL, '', '2025-04-16 12:16:08.423006', '{}', 1),
('f4ed58760a554624858eacb84b5028c6', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:05:55.561587', '{}', 1),
('f5328936ae704ce7945eca1e6d631dbe', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:25:37.489441', '{}', 1),
('f55ee37b2eb546d384e9e11266eed45c', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-26 05:45:44.732296', '{}', 1),
('f56aa0dd81b74b35ad5103ec0b5df71d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 11:55:48.871565', '{}', 1),
('f5f266a4b3ab4bf38ccb07dcf6ca592b', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-17 05:56:50.121414', '{}', 1),
('f694bde7c6ff4470b8e669927c250d6d', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-23 05:29:52.179035', '{}', 1),
('f7c46d2943ca4003a0787f5aec6f439e', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:53:47.002269', '{}', 1),
('f7c718ef18e54d2e878ca0494e131cdc', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:27.969629', '{}', 1),
('f90f79c6a3384c8797f509106b579ba9', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:26.421769', '{}', 1),
('f90fd157a051446da99fe796ee6a537e', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:33:03.122459', '{}', 1),
('f94cdb3af3994640bd29b75c1983a126', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:55:52.776341', '{}', 1),
('f9ba2f6e71464966afeb0aa97be70bfe', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 05:59:18.232223', '{}', 1),
('f9eb3bc749634d8c85941dd692759312', 'VIEW', 'AttendanceRule', '0', 'Viewed attendance rules', NULL, '', '2025-04-22 10:25:00.083654', '{}', 1),
('fa0a370cd5b548e89c46c8597a9669ae', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:29.835933', '{}', 1),
('fa67d1d829954b45961452b35cf931d0', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 07:08:54.119670', '{}', 1),
('fb1c7f0d321e4422b5a738fd7a7d0a45', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-17 05:06:20.552771', '{}', 1),
('fb7596caa10e4fc68e44c654cbabedae', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-21 11:19:59.297985', '{}', 1),
('fb7c4675be5b4e72be99f1b4f5601b2b', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:43:04.474937', '{}', 1),
('fbf2c00bae2544aaa3801fd040becf10', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-04-26 05:48:59.317369', '{}', 1),
('fc30e7c7f05641229875c9fddb736751', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 07:50:34.226605', '{}', 1),
('fc323afafe4845c080e4be3c4460d1d2', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-24 10:57:11.843080', '{}', 1),
('fc5b38cae0cc4f9da0f5ca1a3f86ad80', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 10:54:28.172021', '{}', 1),
('fce1ee4e115f4474a16d30cdcf505d44', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 09:16:27.534036', '{}', 1),
('fd37ff98e2524ce6a30a24a26bf6bb44', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:08:11.086260', '{}', 1),
('fd3d7717ad0e49e7afc0f3852eab1bfa', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-23 05:15:27.534116', '{}', 1),
('fda1c9f20322477c8ba1b9f1d96f0fb1', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-24 10:24:01.784292', '{}', 1),
('fda7e5a3ddc54fddbc01e7c28700f0a3', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-16 12:02:30.843576', '{}', 1),
('fdc4ba4eeab94ba48eab5627008ac597', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-04-18 07:07:14.036950', '{}', 1),
('fdd14392bb6743a4af0e3e75f4375954', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance report', NULL, '', '2025-04-16 11:32:37.981251', '{}', 1),
('fdfd5fac5e33488c8151ddf970a0c62e', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-16 06:42:38.793838', '{}', 1),
('feb00a19a48040ca99475b2511ffa329', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-04-18 04:41:14.339069', '{}', 1),
('feeb410518724b90ad9c60a7a8e1503d', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:00:01.975719', '{}', 1),
('fef4fa7ddc8c41fab41a00b972480a40', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-26 06:45:38.665734', '{}', 1),
('feff30279e274fcd8483bd5077456476', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 09:45:03.382733', '{}', 1),
('ff04ca5ac8284e4ebd8f2e8930150787', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-04-21 07:22:31.169189', '{}', 1),
('ff88ab6e3fa2490c96f8064427ee0529', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-25 05:17:58.337781', '{}', 1),
('ff90d2f638e2419a99edc763b3787374', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-04-21 11:00:18.618112', '{}', 1),
('fff95da6a46d497f8eddbbc5b2f86f72', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-04-23 06:52:02.543302', '{}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_employeeattendance`
--

CREATE TABLE `payroll_employeeattendance` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `clock_in` time(6) DEFAULT NULL,
  `clock_out` time(6) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `overtime_hours` decimal(5,2) NOT NULL,
  `late_minutes` int(11) NOT NULL,
  `notes` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_employeeattendance`
--

INSERT INTO `payroll_employeeattendance` (`id`, `date`, `clock_in`, `clock_out`, `status`, `overtime_hours`, `late_minutes`, `notes`, `created_at`, `updated_at`, `employee_id`, `is_active`) VALUES
(1, '2025-04-21', NULL, NULL, 'PRESENT', 0.00, 0, 'tetsing', '2025-04-21 05:43:07.650872', '2025-04-26 06:53:52.686186', 1, 1),
(2, '2025-04-21', NULL, NULL, 'PRESENT', 0.00, 0, 'tetsing', '2025-04-21 05:43:07.655347', '2025-04-21 05:43:07.655364', 2, 1),
(4, '2025-04-21', '11:00:00.000000', '17:30:00.000000', 'PRESENT', 0.00, 0, 'TEST', '2025-04-21 07:25:53.769866', '2025-04-21 07:25:53.769900', 8, 1),
(5, '2025-04-19', '11:00:00.000000', '17:30:00.000000', 'PRESENT', 0.00, 0, 'TEST', '2025-04-21 07:36:06.192229', '2025-04-21 07:36:06.192265', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_employeesalarystructure`
--

CREATE TABLE `payroll_employeesalarystructure` (
  `id` bigint(20) NOT NULL,
  `basic_salary` decimal(12,2) NOT NULL,
  `effective_from` date NOT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `employee_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_employeesalarystructure`
--

INSERT INTO `payroll_employeesalarystructure` (`id`, `basic_salary`, `effective_from`, `effective_to`, `is_active`, `created_at`, `updated_at`, `employee_id`) VALUES
(3, 45000.00, '2025-06-01', '2025-12-31', 1, '2025-04-17 05:53:00.300183', '2025-04-22 11:24:57.292743', 8);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollcalculation`
--

CREATE TABLE `payroll_payrollcalculation` (
  `id` bigint(20) NOT NULL,
  `gross_salary` decimal(12,2) NOT NULL,
  `total_deductions` decimal(12,2) NOT NULL,
  `net_salary` decimal(12,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `employee_id` bigint(20) NOT NULL,
  `period_id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_payrollcalculation`
--

INSERT INTO `payroll_payrollcalculation` (`id`, `gross_salary`, `total_deductions`, `net_salary`, `status`, `payment_date`, `created_at`, `updated_at`, `created_by_id`, `employee_id`, `period_id`, `is_active`) VALUES
(2, 50000.00, 2000.00, 48000.00, 'DRAFT', NULL, '2025-04-26 07:07:48.256514', '2025-04-26 07:07:48.260709', 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollcomponentdetail`
--

CREATE TABLE `payroll_payrollcomponentdetail` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `component_id` bigint(20) NOT NULL,
  `payroll_calculation_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrolldocument`
--

CREATE TABLE `payroll_payrolldocument` (
  `id` bigint(20) NOT NULL,
  `document_type` varchar(20) NOT NULL,
  `file` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `payroll_calculation_id` bigint(20) NOT NULL,
  `uploaded_by_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_payrolldocument`
--

INSERT INTO `payroll_payrolldocument` (`id`, `document_type`, `file`, `description`, `created_at`, `updated_at`, `payroll_calculation_id`, `uploaded_by_id`, `is_active`) VALUES
(1, 'PAYSLIP', 'payroll_documents/ISO_Format_New.xlsx', 'testing', '2025-04-26 07:09:35.640037', '2025-04-26 07:17:02.176044', 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollpayment`
--

CREATE TABLE `payroll_payrollpayment` (
  `id` bigint(20) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `payroll_calculation_id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_payrollpayment`
--

INSERT INTO `payroll_payrollpayment` (`id`, `payment_date`, `payment_method`, `reference_number`, `amount`, `status`, `created_at`, `updated_at`, `created_by_id`, `payroll_calculation_id`, `is_active`) VALUES
(1, '2025-04-26', 'CHEQUE', '00323232', 48000.00, 'PENDING', '2025-04-26 07:08:11.517670', '2025-04-26 07:17:58.748217', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollperiod`
--

CREATE TABLE `payroll_payrollperiod` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `period_type` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_payrollperiod`
--

INSERT INTO `payroll_payrollperiod` (`id`, `name`, `start_date`, `end_date`, `period_type`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'Payroll 2025', '2025-04-01', '2025-04-30', 'MONTHLY', 1, '2025-04-24 05:57:38.432886', '2025-04-24 07:30:54.643486');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollpermission`
--

CREATE TABLE `payroll_payrollpermission` (
  `id` bigint(20) NOT NULL,
  `module` varchar(50) NOT NULL,
  `permission_type` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollrole`
--

CREATE TABLE `payroll_payrollrole` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollrole_permissions`
--

CREATE TABLE `payroll_payrollrole_permissions` (
  `id` bigint(20) NOT NULL,
  `payrollrole_id` bigint(20) NOT NULL,
  `payrollpermission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollworkflow`
--

CREATE TABLE `payroll_payrollworkflow` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollworkflowinstance`
--

CREATE TABLE `payroll_payrollworkflowinstance` (
  `id` bigint(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `started_at` datetime(6) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `current_step_id` bigint(20) DEFAULT NULL,
  `payroll_calculation_id` bigint(20) NOT NULL,
  `workflow_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollworkflowstep`
--

CREATE TABLE `payroll_payrollworkflowstep` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `order` int(10) UNSIGNED NOT NULL CHECK (`order` >= 0),
  `is_required` tinyint(1) NOT NULL,
  `timeout_days` int(10) UNSIGNED NOT NULL CHECK (`timeout_days` >= 0),
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `workflow_id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollworkflowstep_actions`
--

CREATE TABLE `payroll_payrollworkflowstep_actions` (
  `id` bigint(20) NOT NULL,
  `payrollworkflowstep_id` bigint(20) NOT NULL,
  `payrollpermission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollworkflowtask`
--

CREATE TABLE `payroll_payrollworkflowtask` (
  `id` bigint(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `comments` longtext NOT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `step_id` bigint(20) NOT NULL,
  `workflow_instance_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_salarycomponent`
--

CREATE TABLE `payroll_salarycomponent` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `component_type` varchar(20) NOT NULL,
  `is_taxable` tinyint(1) NOT NULL,
  `is_mandatory` tinyint(1) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_salarycomponent`
--

INSERT INTO `payroll_salarycomponent` (`id`, `name`, `code`, `component_type`, `is_taxable`, `is_mandatory`, `description`, `created_at`, `updated_at`, `is_active`) VALUES
(6, 'Allowances', 'AW', 'EARNING', 1, 0, 'testing', '2025-04-26 07:03:55.062010', '2025-04-26 07:04:08.357403', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_salarycomponentvalue`
--

CREATE TABLE `payroll_salarycomponentvalue` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `is_percentage` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `component_id` bigint(20) NOT NULL,
  `salary_structure_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_securitysettings`
--

CREATE TABLE `payroll_securitysettings` (
  `id` bigint(20) NOT NULL,
  `require_mfa` tinyint(1) NOT NULL,
  `mfa_method` varchar(20) NOT NULL,
  `password_expiry_days` int(11) NOT NULL,
  `max_login_attempts` int(11) NOT NULL,
  `session_timeout_minutes` int(11) NOT NULL,
  `ip_whitelist` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_taxcalculation`
--

CREATE TABLE `payroll_taxcalculation` (
  `id` bigint(20) NOT NULL,
  `tax_year` int(11) NOT NULL,
  `taxable_amount` decimal(12,2) NOT NULL,
  `tax_amount` decimal(12,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `payroll_calculation_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_userpayrollrole`
--

CREATE TABLE `payroll_userpayrollrole` (
  `id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `assigned_at` datetime(6) NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `assigned_by_id` int(11) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(11, 'DMS', '2024-05-01', '2024-05-31', 1, 500000, 10, NULL, 5, 25000, 100000, 'tt4442f', '2024-05-01', '2024-05-31', '2024-06-05', 5, 25000, 'project\\DMS\\event (1).csv', 'project\\DMS\\Ref--No---CORP-8.pdf', 1, 'gr34431e', 2, 'f df sdf sf sfsdf sdfsf', 2, 'project\\DMS\\download.png', '2024-06-28', 'In Progress', 2, NULL, 'None', NULL, 'Local', 'Private', 1, 'None', 2, NULL, NULL, NULL, NULL, NULL),
(14, 'KMC', '2024-05-01', '2024-05-31', 1, 100000, 10, NULL, 5, 50000, 100000, 'tt4442f', '2024-05-01', '2024-05-31', '2024-05-31', 5, 50000, 'project\\KMC\\Tender Doc.docx', 'project\\KMC\\new_protal_pdf.pdf', 1, 'gr34431e', 2, 'qdqdqd  qdqdq  qwqwqd', 2, 'project\\KMC\\signature.png', '2024-06-29', 'Cancel', 2, NULL, NULL, NULL, 'Local', 'Government', 1, 'person', NULL, NULL, NULL, '2024-12-30', 'project\\14\\14_20241230152045.txt', 'yrwsrstr'),
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
(11, 'project\\11\\11_EM_20241031124113.xlsx', '2024-10-31', '2024-12-24', NULL, 1, 2, 11, 'em update', '2024-08-05', '2221212'),
(12, 'project\\11\\11_PO_20241031124512.pdf', '2024-10-31', '2024-10-31', NULL, 1, 3, 11, 'twetwtes', '2024-09-26', '22212122'),
(13, 'project\\11\\11_SRS_20241031124512.png', '2024-10-31', '2024-12-24', NULL, 1, 4, 11, '3rd', '2024-10-01', '2221212w'),
(14, 'project\\25\\25_PO_20241119144715.pdf', '2024-11-19', '2024-11-19', NULL, 1, 3, 25, 'Out Standing Receivable', '2024-06-30', '688'),
(15, 'project\\25\\25_SRS_20241224151002.txt', '2024-12-24', '2024-12-24', NULL, 0, 4, 25, 'qweqweqwe', '2024-12-24', '234234'),
(16, 'project\\11\\11_SRS_20241224151323.txt', '2024-12-24', '2024-12-24', NULL, 0, 4, 11, 'werwerqwe', '2024-12-24', '2221212');

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
(13, 7, 200000, '2024-12-12', '2024-12-12', NULL, 1, NULL, 4, 8, '2024-12-12'),
(14, 5, 690000, '2024-12-24', '2024-12-24', NULL, 1, NULL, 4, 8, '2024-12-24');

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
(1, 'sub tested', 1, '2024-10-30', '2024-10-30', NULL, 1, 1, 2),
(2, 'sub test', 0, '2024-12-26', '2024-12-26', NULL, 0, 1, 2);

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
(3, 'FED', 13, '2024-11-07', '2024-11-07', NULL, 1),
(4, 'sst', 13, '2024-12-26', '2024-12-26', NULL, 0);

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
(4, 'Lex', 'tt222', 1, 5, 5, 'tendor\\4\\4_tt222_20241031130053.png', 'teswt', '2024-08-05', '2024-08-10', '2024-08-04', '2024-08-09', 'no', 'Sajid', '2024-10-31', '2024-10-31', NULL, 1, 1, '12312312', 1),
(5, 'tested', 'tt12121', 0, 5, 8, 'tendor\\5\\5_tt1212_20241226125410.txt', 'fghfghfghf', '2024-12-01', '2024-12-18', '2024-12-26', '2024-12-28', 'no', 'no', '2024-12-26', '2024-12-26', NULL, 0, 2, 'no', 1);

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
(4, 'Gram', '2024-10-30', '2024-10-30', NULL, 1),
(5, 'kgss', '2024-12-26', '2024-12-26', NULL, 0);

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
(2, 'Abdullah', 'abdullah@gmail.com', '02133434334', 'II Chandigarh road Karachi', 1, 2),
(3, 'tt', 'abdullah@gmail.com', '01231313122', 'Zamama branch', 0, 2),
(4, 'tt', 'abdullaah@gmail.com', '01231313122', 'Zamama branch', 0, 2);

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
(2, 'South', 1),
(3, 'Norths', 0);

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
-- Indexes for table `iso_detail`
--
ALTER TABLE `iso_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iso_detail_iso_master_id_089b7e1a_fk_iso_master_id` (`iso_master_id`),
  ADD KEY `iso_detail_item_id_f5ff9ac7_fk_item_id` (`item_id`),
  ADD KEY `iso_detail_sales_tax_category_id_806987da_fk_tax_id` (`sales_tax_category_id`);

--
-- Indexes for table `iso_master`
--
ALTER TABLE `iso_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iso_master_client_id_75ea8d34_fk_client_id` (`client_id`),
  ADD KEY `iso_master_tendor_id_d634f829_fk_tendor_id` (`tendor_id`);

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
-- Indexes for table `payroll_attendancerule`
--
ALTER TABLE `payroll_attendancerule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_auditlog`
--
ALTER TABLE `payroll_auditlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_aud_user_id_af1665_idx` (`user_id`,`action`,`created_at`),
  ADD KEY `payroll_aud_model_n_81fcd3_idx` (`model_name`,`object_id`);

--
-- Indexes for table `payroll_employeeattendance`
--
ALTER TABLE `payroll_employeeattendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_employeeattendance_employee_id_date_94396250_uniq` (`employee_id`,`date`);

--
-- Indexes for table `payroll_employeesalarystructure`
--
ALTER TABLE `payroll_employeesalarystructure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_employeesala_employee_id_7a44a3d5_fk_employee_` (`employee_id`);

--
-- Indexes for table `payroll_payrollcalculation`
--
ALTER TABLE `payroll_payrollcalculation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_payrollcalcu_period_id_644a6ee7_fk_payroll_p` (`period_id`),
  ADD KEY `payroll_payrollcalcu_created_by_id_200618f5_fk_auth_user` (`created_by_id`),
  ADD KEY `payroll_payrollcalculation_employee_id_6297b2b7_fk_employee_id` (`employee_id`);

--
-- Indexes for table `payroll_payrollcomponentdetail`
--
ALTER TABLE `payroll_payrollcomponentdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_payrollcompo_component_id_603ded32_fk_payroll_s` (`component_id`),
  ADD KEY `payroll_payrollcompo_payroll_calculation__18359a51_fk_payroll_p` (`payroll_calculation_id`);

--
-- Indexes for table `payroll_payrolldocument`
--
ALTER TABLE `payroll_payrolldocument`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_payrolldocum_payroll_calculation__13400e4e_fk_payroll_p` (`payroll_calculation_id`),
  ADD KEY `payroll_payrolldocument_uploaded_by_id_62dbe699_fk_auth_user_id` (`uploaded_by_id`);

--
-- Indexes for table `payroll_payrollpayment`
--
ALTER TABLE `payroll_payrollpayment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_payrollpayment_created_by_id_e97352b7_fk_auth_user_id` (`created_by_id`),
  ADD KEY `payroll_payrollpayme_payroll_calculation__d3e5382f_fk_payroll_p` (`payroll_calculation_id`);

--
-- Indexes for table `payroll_payrollperiod`
--
ALTER TABLE `payroll_payrollperiod`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_payrollpermission`
--
ALTER TABLE `payroll_payrollpermission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_payrollpermission_module_permission_type_5f8968b8_uniq` (`module`,`permission_type`);

--
-- Indexes for table `payroll_payrollrole`
--
ALTER TABLE `payroll_payrollrole`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_payrollrole_permissions`
--
ALTER TABLE `payroll_payrollrole_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_payrollrole_perm_payrollrole_id_payrollpe_08f23c8d_uniq` (`payrollrole_id`,`payrollpermission_id`),
  ADD KEY `payroll_payrollrole__payrollpermission_id_f4e18910_fk_payroll_p` (`payrollpermission_id`);

--
-- Indexes for table `payroll_payrollworkflow`
--
ALTER TABLE `payroll_payrollworkflow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_payrollworkflowinstance`
--
ALTER TABLE `payroll_payrollworkflowinstance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_payrollworkf_current_step_id_416b65a1_fk_payroll_p` (`current_step_id`),
  ADD KEY `payroll_payrollworkf_payroll_calculation__c5af4253_fk_payroll_p` (`payroll_calculation_id`),
  ADD KEY `payroll_payrollworkf_workflow_id_39daba29_fk_payroll_p` (`workflow_id`),
  ADD KEY `payroll_payrollworkf_created_by_id_80080ba5_fk_auth_user` (`created_by_id`);

--
-- Indexes for table `payroll_payrollworkflowstep`
--
ALTER TABLE `payroll_payrollworkflowstep`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_payrollworkflowstep_workflow_id_order_b7297e2f_uniq` (`workflow_id`,`order`),
  ADD KEY `payroll_payrollworkf_role_id_19906bb5_fk_payroll_p` (`role_id`);

--
-- Indexes for table `payroll_payrollworkflowstep_actions`
--
ALTER TABLE `payroll_payrollworkflowstep_actions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_payrollworkflows_payrollworkflowstep_id_p_1c2e38bb_uniq` (`payrollworkflowstep_id`,`payrollpermission_id`),
  ADD KEY `payroll_payrollworkf_payrollpermission_id_77f1ffe0_fk_payroll_p` (`payrollpermission_id`);

--
-- Indexes for table `payroll_payrollworkflowtask`
--
ALTER TABLE `payroll_payrollworkflowtask`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_payrollworkf_assigned_to_id_1aba48f1_fk_auth_user` (`assigned_to_id`),
  ADD KEY `payroll_payrollworkf_step_id_b9f8892b_fk_payroll_p` (`step_id`),
  ADD KEY `payroll_payrollworkf_workflow_instance_id_3237db54_fk_payroll_p` (`workflow_instance_id`);

--
-- Indexes for table `payroll_salarycomponent`
--
ALTER TABLE `payroll_salarycomponent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `payroll_salarycomponentvalue`
--
ALTER TABLE `payroll_salarycomponentvalue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_salarycompon_component_id_1d1c194f_fk_payroll_s` (`component_id`),
  ADD KEY `payroll_salarycompon_salary_structure_id_d691d246_fk_payroll_e` (`salary_structure_id`);

--
-- Indexes for table `payroll_securitysettings`
--
ALTER TABLE `payroll_securitysettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_taxcalculation`
--
ALTER TABLE `payroll_taxcalculation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_taxcalculati_payroll_calculation__e004f245_fk_payroll_p` (`payroll_calculation_id`);

--
-- Indexes for table `payroll_userpayrollrole`
--
ALTER TABLE `payroll_userpayrollrole`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_userpayrollrole_user_id_role_id_f7d12492_uniq` (`user_id`,`role_id`),
  ADD KEY `payroll_userpayrollrole_assigned_by_id_43bd9ead_fk_auth_user_id` (`assigned_by_id`),
  ADD KEY `payroll_userpayrollr_role_id_bcbef895_fk_payroll_p` (`role_id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bank_guaranty`
--
ALTER TABLE `bank_guaranty`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `certifications`
--
ALTER TABLE `certifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company_module`
--
ALTER TABLE `company_module`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employee_target`
--
ALTER TABLE `employee_target`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `employment_record`
--
ALTER TABLE `employment_record`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `heading`
--
ALTER TABLE `heading`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `insurance_detail`
--
ALTER TABLE `insurance_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `insurance_type`
--
ALTER TABLE `insurance_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `iso_detail`
--
ALTER TABLE `iso_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `iso_master`
--
ALTER TABLE `iso_master`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `journal_entry`
--
ALTER TABLE `journal_entry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `liquidity_damages`
--
ALTER TABLE `liquidity_damages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
-- AUTO_INCREMENT for table `payroll_attendancerule`
--
ALTER TABLE `payroll_attendancerule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_employeeattendance`
--
ALTER TABLE `payroll_employeeattendance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payroll_employeesalarystructure`
--
ALTER TABLE `payroll_employeesalarystructure`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payroll_payrollcalculation`
--
ALTER TABLE `payroll_payrollcalculation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payroll_payrollcomponentdetail`
--
ALTER TABLE `payroll_payrollcomponentdetail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrolldocument`
--
ALTER TABLE `payroll_payrolldocument`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_payrollpayment`
--
ALTER TABLE `payroll_payrollpayment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_payrollperiod`
--
ALTER TABLE `payroll_payrollperiod`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payroll_payrollpermission`
--
ALTER TABLE `payroll_payrollpermission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollrole`
--
ALTER TABLE `payroll_payrollrole`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollrole_permissions`
--
ALTER TABLE `payroll_payrollrole_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollworkflow`
--
ALTER TABLE `payroll_payrollworkflow`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollworkflowinstance`
--
ALTER TABLE `payroll_payrollworkflowinstance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollworkflowstep`
--
ALTER TABLE `payroll_payrollworkflowstep`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollworkflowstep_actions`
--
ALTER TABLE `payroll_payrollworkflowstep_actions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollworkflowtask`
--
ALTER TABLE `payroll_payrollworkflowtask`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_salarycomponent`
--
ALTER TABLE `payroll_salarycomponent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payroll_salarycomponentvalue`
--
ALTER TABLE `payroll_salarycomponentvalue`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_securitysettings`
--
ALTER TABLE `payroll_securitysettings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_taxcalculation`
--
ALTER TABLE `payroll_taxcalculation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_userpayrollrole`
--
ALTER TABLE `payroll_userpayrollrole`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `project_document`
--
ALTER TABLE `project_document`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `template_column`
--
ALTER TABLE `template_column`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tendor`
--
ALTER TABLE `tendor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `iso_detail`
--
ALTER TABLE `iso_detail`
  ADD CONSTRAINT `iso_detail_iso_master_id_089b7e1a_fk_iso_master_id` FOREIGN KEY (`iso_master_id`) REFERENCES `iso_master` (`id`),
  ADD CONSTRAINT `iso_detail_item_id_f5ff9ac7_fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `iso_detail_sales_tax_category_id_806987da_fk_tax_id` FOREIGN KEY (`sales_tax_category_id`) REFERENCES `tax` (`id`);

--
-- Constraints for table `iso_master`
--
ALTER TABLE `iso_master`
  ADD CONSTRAINT `iso_master_client_id_75ea8d34_fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `iso_master_tendor_id_d634f829_fk_tendor_id` FOREIGN KEY (`tendor_id`) REFERENCES `tendor` (`id`);

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
-- Constraints for table `payroll_auditlog`
--
ALTER TABLE `payroll_auditlog`
  ADD CONSTRAINT `payroll_auditlog_user_id_8c739156_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payroll_employeeattendance`
--
ALTER TABLE `payroll_employeeattendance`
  ADD CONSTRAINT `payroll_employeeattendance_employee_id_d6339d10_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `payroll_employeesalarystructure`
--
ALTER TABLE `payroll_employeesalarystructure`
  ADD CONSTRAINT `payroll_employeesala_employee_id_7a44a3d5_fk_employee_` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `payroll_payrollcalculation`
--
ALTER TABLE `payroll_payrollcalculation`
  ADD CONSTRAINT `payroll_payrollcalcu_created_by_id_200618f5_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payroll_payrollcalcu_period_id_644a6ee7_fk_payroll_p` FOREIGN KEY (`period_id`) REFERENCES `payroll_payrollperiod` (`id`),
  ADD CONSTRAINT `payroll_payrollcalculation_employee_id_6297b2b7_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `payroll_payrollcomponentdetail`
--
ALTER TABLE `payroll_payrollcomponentdetail`
  ADD CONSTRAINT `payroll_payrollcompo_component_id_603ded32_fk_payroll_s` FOREIGN KEY (`component_id`) REFERENCES `payroll_salarycomponent` (`id`),
  ADD CONSTRAINT `payroll_payrollcompo_payroll_calculation__18359a51_fk_payroll_p` FOREIGN KEY (`payroll_calculation_id`) REFERENCES `payroll_payrollcalculation` (`id`);

--
-- Constraints for table `payroll_payrolldocument`
--
ALTER TABLE `payroll_payrolldocument`
  ADD CONSTRAINT `payroll_payrolldocum_payroll_calculation__13400e4e_fk_payroll_p` FOREIGN KEY (`payroll_calculation_id`) REFERENCES `payroll_payrollcalculation` (`id`),
  ADD CONSTRAINT `payroll_payrolldocument_uploaded_by_id_62dbe699_fk_auth_user_id` FOREIGN KEY (`uploaded_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payroll_payrollpayment`
--
ALTER TABLE `payroll_payrollpayment`
  ADD CONSTRAINT `payroll_payrollpayme_payroll_calculation__d3e5382f_fk_payroll_p` FOREIGN KEY (`payroll_calculation_id`) REFERENCES `payroll_payrollcalculation` (`id`),
  ADD CONSTRAINT `payroll_payrollpayment_created_by_id_e97352b7_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payroll_payrollrole_permissions`
--
ALTER TABLE `payroll_payrollrole_permissions`
  ADD CONSTRAINT `payroll_payrollrole__payrollpermission_id_f4e18910_fk_payroll_p` FOREIGN KEY (`payrollpermission_id`) REFERENCES `payroll_payrollpermission` (`id`),
  ADD CONSTRAINT `payroll_payrollrole__payrollrole_id_082f3e57_fk_payroll_p` FOREIGN KEY (`payrollrole_id`) REFERENCES `payroll_payrollrole` (`id`);

--
-- Constraints for table `payroll_payrollworkflowinstance`
--
ALTER TABLE `payroll_payrollworkflowinstance`
  ADD CONSTRAINT `payroll_payrollworkf_created_by_id_80080ba5_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payroll_payrollworkf_current_step_id_416b65a1_fk_payroll_p` FOREIGN KEY (`current_step_id`) REFERENCES `payroll_payrollworkflowstep` (`id`),
  ADD CONSTRAINT `payroll_payrollworkf_payroll_calculation__c5af4253_fk_payroll_p` FOREIGN KEY (`payroll_calculation_id`) REFERENCES `payroll_payrollcalculation` (`id`),
  ADD CONSTRAINT `payroll_payrollworkf_workflow_id_39daba29_fk_payroll_p` FOREIGN KEY (`workflow_id`) REFERENCES `payroll_payrollworkflow` (`id`);

--
-- Constraints for table `payroll_payrollworkflowstep`
--
ALTER TABLE `payroll_payrollworkflowstep`
  ADD CONSTRAINT `payroll_payrollworkf_role_id_19906bb5_fk_payroll_p` FOREIGN KEY (`role_id`) REFERENCES `payroll_payrollrole` (`id`),
  ADD CONSTRAINT `payroll_payrollworkf_workflow_id_460b73ad_fk_payroll_p` FOREIGN KEY (`workflow_id`) REFERENCES `payroll_payrollworkflow` (`id`);

--
-- Constraints for table `payroll_payrollworkflowstep_actions`
--
ALTER TABLE `payroll_payrollworkflowstep_actions`
  ADD CONSTRAINT `payroll_payrollworkf_payrollpermission_id_77f1ffe0_fk_payroll_p` FOREIGN KEY (`payrollpermission_id`) REFERENCES `payroll_payrollpermission` (`id`),
  ADD CONSTRAINT `payroll_payrollworkf_payrollworkflowstep__fbeb9a34_fk_payroll_p` FOREIGN KEY (`payrollworkflowstep_id`) REFERENCES `payroll_payrollworkflowstep` (`id`);

--
-- Constraints for table `payroll_payrollworkflowtask`
--
ALTER TABLE `payroll_payrollworkflowtask`
  ADD CONSTRAINT `payroll_payrollworkf_assigned_to_id_1aba48f1_fk_auth_user` FOREIGN KEY (`assigned_to_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payroll_payrollworkf_step_id_b9f8892b_fk_payroll_p` FOREIGN KEY (`step_id`) REFERENCES `payroll_payrollworkflowstep` (`id`),
  ADD CONSTRAINT `payroll_payrollworkf_workflow_instance_id_3237db54_fk_payroll_p` FOREIGN KEY (`workflow_instance_id`) REFERENCES `payroll_payrollworkflowinstance` (`id`);

--
-- Constraints for table `payroll_salarycomponentvalue`
--
ALTER TABLE `payroll_salarycomponentvalue`
  ADD CONSTRAINT `payroll_salarycompon_component_id_1d1c194f_fk_payroll_s` FOREIGN KEY (`component_id`) REFERENCES `payroll_salarycomponent` (`id`),
  ADD CONSTRAINT `payroll_salarycompon_salary_structure_id_d691d246_fk_payroll_e` FOREIGN KEY (`salary_structure_id`) REFERENCES `payroll_employeesalarystructure` (`id`);

--
-- Constraints for table `payroll_taxcalculation`
--
ALTER TABLE `payroll_taxcalculation`
  ADD CONSTRAINT `payroll_taxcalculati_payroll_calculation__e004f245_fk_payroll_p` FOREIGN KEY (`payroll_calculation_id`) REFERENCES `payroll_payrollcalculation` (`id`);

--
-- Constraints for table `payroll_userpayrollrole`
--
ALTER TABLE `payroll_userpayrollrole`
  ADD CONSTRAINT `payroll_userpayrollr_role_id_bcbef895_fk_payroll_p` FOREIGN KEY (`role_id`) REFERENCES `payroll_payrollrole` (`id`),
  ADD CONSTRAINT `payroll_userpayrollrole_assigned_by_id_43bd9ead_fk_auth_user_id` FOREIGN KEY (`assigned_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payroll_userpayrollrole_user_id_891f56ed_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
