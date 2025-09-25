-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Sep 25, 2025 at 10:11 AM
-- Server version: 10.11.11-MariaDB-ubu2204
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

CREATE TABLE `account_type` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_code` varchar(50) DEFAULT NULL,
  `sequence_code` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Karachi', 1),
(2, 'Lahore', 1),
(3, 'Islamabad', 1);

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
(1, 'DEO');

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
(21, 1, 89),
(22, 1, 90),
(23, 1, 92),
(1, 1, 137),
(2, 1, 138),
(3, 1, 139),
(4, 1, 140),
(5, 1, 141),
(6, 1, 142),
(7, 1, 143),
(8, 1, 144),
(9, 1, 145),
(10, 1, 146),
(11, 1, 147),
(12, 1, 148),
(13, 1, 169),
(14, 1, 170),
(15, 1, 171),
(16, 1, 172),
(17, 1, 325),
(18, 1, 326),
(19, 1, 327),
(20, 1, 328);

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
(25, 'Can add area', 7, 'add_area'),
(26, 'Can change area', 7, 'change_area'),
(27, 'Can delete area', 7, 'delete_area'),
(28, 'Can view area', 7, 'view_area'),
(29, 'Can add bank', 8, 'add_bank'),
(30, 'Can change bank', 8, 'change_bank'),
(31, 'Can delete bank', 8, 'delete_bank'),
(32, 'Can view bank', 8, 'view_bank'),
(33, 'Can add branch', 9, 'add_branch'),
(34, 'Can change branch', 9, 'change_branch'),
(35, 'Can delete branch', 9, 'delete_branch'),
(36, 'Can view branch', 9, 'view_branch'),
(37, 'Can add client', 10, 'add_client'),
(38, 'Can change client', 10, 'change_client'),
(39, 'Can delete client', 10, 'delete_client'),
(40, 'Can view client', 10, 'view_client'),
(41, 'Can add company', 11, 'add_company'),
(42, 'Can change company', 11, 'change_company'),
(43, 'Can delete company', 11, 'delete_company'),
(44, 'Can view company', 11, 'view_company'),
(45, 'Can add company_module', 12, 'add_company_module'),
(46, 'Can change company_module', 12, 'change_company_module'),
(47, 'Can delete company_module', 12, 'delete_company_module'),
(48, 'Can view company_module', 12, 'view_company_module'),
(49, 'Can add country', 13, 'add_country'),
(50, 'Can change country', 13, 'change_country'),
(51, 'Can delete country', 13, 'delete_country'),
(52, 'Can view country', 13, 'view_country'),
(53, 'Can add c v_template', 14, 'add_cv_template'),
(54, 'Can change c v_template', 14, 'change_cv_template'),
(55, 'Can delete c v_template', 14, 'delete_cv_template'),
(56, 'Can view c v_template', 14, 'view_cv_template'),
(57, 'Can add department', 15, 'add_department'),
(58, 'Can change department', 15, 'change_department'),
(59, 'Can delete department', 15, 'delete_department'),
(60, 'Can view department', 15, 'view_department'),
(61, 'Can add designation', 16, 'add_designation'),
(62, 'Can change designation', 16, 'change_designation'),
(63, 'Can delete designation', 16, 'delete_designation'),
(64, 'Can view designation', 16, 'view_designation'),
(65, 'Can add document_type', 17, 'add_document_type'),
(66, 'Can change document_type', 17, 'change_document_type'),
(67, 'Can delete document_type', 17, 'delete_document_type'),
(68, 'Can view document_type', 17, 'view_document_type'),
(69, 'Can add employee', 18, 'add_employee'),
(70, 'Can change employee', 18, 'change_employee'),
(71, 'Can delete employee', 18, 'delete_employee'),
(72, 'Can view employee', 18, 'view_employee'),
(73, 'Can add insurance_type', 19, 'add_insurance_type'),
(74, 'Can change insurance_type', 19, 'change_insurance_type'),
(75, 'Can delete insurance_type', 19, 'delete_insurance_type'),
(76, 'Can view insurance_type', 19, 'view_insurance_type'),
(77, 'Can add leads', 20, 'add_leads'),
(78, 'Can change leads', 20, 'change_leads'),
(79, 'Can delete leads', 20, 'delete_leads'),
(80, 'Can view leads', 20, 'view_leads'),
(81, 'Can add mainmenu', 21, 'add_mainmenu'),
(82, 'Can change mainmenu', 21, 'change_mainmenu'),
(83, 'Can delete mainmenu', 21, 'delete_mainmenu'),
(84, 'Can view mainmenu', 21, 'view_mainmenu'),
(85, 'Can add module', 22, 'add_module'),
(86, 'Can change module', 22, 'change_module'),
(87, 'Can delete module', 22, 'delete_module'),
(88, 'Can view module', 22, 'view_module'),
(89, 'Can add project', 23, 'add_project'),
(90, 'Can change project', 23, 'change_project'),
(91, 'Can delete project', 23, 'delete_project'),
(92, 'Can view project', 23, 'view_project'),
(93, 'Can add project_type', 24, 'add_project_type'),
(94, 'Can change project_type', 24, 'change_project_type'),
(95, 'Can delete project_type', 24, 'delete_project_type'),
(96, 'Can view project_type', 24, 'view_project_type'),
(97, 'Can add quarters', 25, 'add_quarters'),
(98, 'Can change quarters', 25, 'change_quarters'),
(99, 'Can delete quarters', 25, 'delete_quarters'),
(100, 'Can view quarters', 25, 'view_quarters'),
(101, 'Can add region', 26, 'add_region'),
(102, 'Can change region', 26, 'change_region'),
(103, 'Can delete region', 26, 'delete_region'),
(104, 'Can view region', 26, 'view_region'),
(105, 'Can add role', 27, 'add_role'),
(106, 'Can change role', 27, 'change_role'),
(107, 'Can delete role', 27, 'delete_role'),
(108, 'Can view role', 27, 'view_role'),
(109, 'Can add role_permission', 28, 'add_role_permission'),
(110, 'Can change role_permission', 28, 'change_role_permission'),
(111, 'Can delete role_permission', 28, 'delete_role_permission'),
(112, 'Can view role_permission', 28, 'view_role_permission'),
(113, 'Can add submenu', 29, 'add_submenu'),
(114, 'Can change submenu', 29, 'change_submenu'),
(115, 'Can delete submenu', 29, 'delete_submenu'),
(116, 'Can view submenu', 29, 'view_submenu'),
(117, 'Can add template_column', 30, 'add_template_column'),
(118, 'Can change template_column', 30, 'change_template_column'),
(119, 'Can delete template_column', 30, 'delete_template_column'),
(120, 'Can view template_column', 30, 'view_template_column'),
(121, 'Can add zone', 31, 'add_zone'),
(122, 'Can change zone', 31, 'change_zone'),
(123, 'Can delete zone', 31, 'delete_zone'),
(124, 'Can view zone', 31, 'view_zone'),
(125, 'Can add vendor', 32, 'add_vendor'),
(126, 'Can change vendor', 32, 'change_vendor'),
(127, 'Can delete vendor', 32, 'delete_vendor'),
(128, 'Can view vendor', 32, 'view_vendor'),
(129, 'Can add skills', 33, 'add_skills'),
(130, 'Can change skills', 33, 'change_skills'),
(131, 'Can delete skills', 33, 'delete_skills'),
(132, 'Can view skills', 33, 'view_skills'),
(133, 'Can add sales', 34, 'add_sales'),
(134, 'Can change sales', 34, 'change_sales'),
(135, 'Can delete sales', 34, 'delete_sales'),
(136, 'Can view sales', 34, 'view_sales'),
(137, 'Can add project_document', 35, 'add_project_document'),
(138, 'Can change project_document', 35, 'change_project_document'),
(139, 'Can delete project_document', 35, 'delete_project_document'),
(140, 'Can view project_document', 35, 'view_project_document'),
(141, 'Can add liquidity_damages', 36, 'add_liquidity_damages'),
(142, 'Can change liquidity_damages', 36, 'change_liquidity_damages'),
(143, 'Can delete liquidity_damages', 36, 'delete_liquidity_damages'),
(144, 'Can view liquidity_damages', 36, 'view_liquidity_damages'),
(145, 'Can add insurance_detail', 37, 'add_insurance_detail'),
(146, 'Can change insurance_detail', 37, 'change_insurance_detail'),
(147, 'Can delete insurance_detail', 37, 'delete_insurance_detail'),
(148, 'Can view insurance_detail', 37, 'view_insurance_detail'),
(149, 'Can add employment_ record', 38, 'add_employment_record'),
(150, 'Can change employment_ record', 38, 'change_employment_record'),
(151, 'Can delete employment_ record', 38, 'delete_employment_record'),
(152, 'Can view employment_ record', 38, 'view_employment_record'),
(153, 'Can add employee_target', 39, 'add_employee_target'),
(154, 'Can change employee_target', 39, 'change_employee_target'),
(155, 'Can delete employee_target', 39, 'delete_employee_target'),
(156, 'Can view employee_target', 39, 'view_employee_target'),
(157, 'Can add employee_project', 40, 'add_employee_project'),
(158, 'Can change employee_project', 40, 'change_employee_project'),
(159, 'Can delete employee_project', 40, 'delete_employee_project'),
(160, 'Can view employee_project', 40, 'view_employee_project'),
(161, 'Can add education', 41, 'add_education'),
(162, 'Can change education', 41, 'change_education'),
(163, 'Can delete education', 41, 'delete_education'),
(164, 'Can view education', 41, 'view_education'),
(165, 'Can add certifications', 42, 'add_certifications'),
(166, 'Can change certifications', 42, 'change_certifications'),
(167, 'Can delete certifications', 42, 'delete_certifications'),
(168, 'Can view certifications', 42, 'view_certifications'),
(169, 'Can add bank_guaranty', 43, 'add_bank_guaranty'),
(170, 'Can change bank_guaranty', 43, 'change_bank_guaranty'),
(171, 'Can delete bank_guaranty', 43, 'delete_bank_guaranty'),
(172, 'Can view bank_guaranty', 43, 'view_bank_guaranty'),
(173, 'Can add account_type', 44, 'add_account_type'),
(174, 'Can change account_type', 44, 'change_account_type'),
(175, 'Can delete account_type', 44, 'delete_account_type'),
(176, 'Can view account_type', 44, 'view_account_type'),
(177, 'Can add chart_of_accounts', 45, 'add_chart_of_accounts'),
(178, 'Can change chart_of_accounts', 45, 'change_chart_of_accounts'),
(179, 'Can delete chart_of_accounts', 45, 'delete_chart_of_accounts'),
(180, 'Can view chart_of_accounts', 45, 'view_chart_of_accounts'),
(181, 'Can add currency', 46, 'add_currency'),
(182, 'Can change currency', 46, 'change_currency'),
(183, 'Can delete currency', 46, 'delete_currency'),
(184, 'Can view currency', 46, 'view_currency'),
(185, 'Can add payment_mode', 47, 'add_payment_mode'),
(186, 'Can change payment_mode', 47, 'change_payment_mode'),
(187, 'Can delete payment_mode', 47, 'delete_payment_mode'),
(188, 'Can view payment_mode', 47, 'view_payment_mode'),
(189, 'Can add journal_entry', 48, 'add_journal_entry'),
(190, 'Can change journal_entry', 48, 'change_journal_entry'),
(191, 'Can delete journal_entry', 48, 'delete_journal_entry'),
(192, 'Can view journal_entry', 48, 'view_journal_entry'),
(193, 'Can add detail_type', 49, 'add_detail_type'),
(194, 'Can change detail_type', 49, 'change_detail_type'),
(195, 'Can delete detail_type', 49, 'delete_detail_type'),
(196, 'Can view detail_type', 49, 'view_detail_type'),
(197, 'Can add category', 50, 'add_category'),
(198, 'Can change category', 50, 'change_category'),
(199, 'Can delete category', 50, 'delete_category'),
(200, 'Can view category', 50, 'view_category'),
(201, 'Can add heading', 51, 'add_heading'),
(202, 'Can change heading', 51, 'change_heading'),
(203, 'Can delete heading', 51, 'delete_heading'),
(204, 'Can view heading', 51, 'view_heading'),
(205, 'Can add tax', 52, 'add_tax'),
(206, 'Can change tax', 52, 'change_tax'),
(207, 'Can delete tax', 52, 'delete_tax'),
(208, 'Can view tax', 52, 'view_tax'),
(209, 'Can add unit', 53, 'add_unit'),
(210, 'Can change unit', 53, 'change_unit'),
(211, 'Can delete unit', 53, 'delete_unit'),
(212, 'Can view unit', 53, 'view_unit'),
(213, 'Can add tendor', 54, 'add_tendor'),
(214, 'Can change tendor', 54, 'change_tendor'),
(215, 'Can delete tendor', 54, 'delete_tendor'),
(216, 'Can view tendor', 54, 'view_tendor'),
(217, 'Can add sub_heading', 55, 'add_sub_heading'),
(218, 'Can change sub_heading', 55, 'change_sub_heading'),
(219, 'Can delete sub_heading', 55, 'delete_sub_heading'),
(220, 'Can view sub_heading', 55, 'view_sub_heading'),
(221, 'Can add item', 56, 'add_item'),
(222, 'Can change item', 56, 'change_item'),
(223, 'Can delete item', 56, 'delete_item'),
(224, 'Can view item', 56, 'view_item'),
(225, 'Can add iso_master', 57, 'add_iso_master'),
(226, 'Can change iso_master', 57, 'change_iso_master'),
(227, 'Can delete iso_master', 57, 'delete_iso_master'),
(228, 'Can view iso_master', 57, 'view_iso_master'),
(229, 'Can add iso_detail', 58, 'add_iso_detail'),
(230, 'Can change iso_detail', 58, 'change_iso_detail'),
(231, 'Can delete iso_detail', 58, 'delete_iso_detail'),
(232, 'Can view iso_detail', 58, 'view_iso_detail'),
(233, 'Can add boq_master', 59, 'add_boq_master'),
(234, 'Can change boq_master', 59, 'change_boq_master'),
(235, 'Can delete boq_master', 59, 'delete_boq_master'),
(236, 'Can view boq_master', 59, 'view_boq_master'),
(237, 'Can add boq_items', 60, 'add_boq_items'),
(238, 'Can change boq_items', 60, 'change_boq_items'),
(239, 'Can delete boq_items', 60, 'delete_boq_items'),
(240, 'Can view boq_items', 60, 'view_boq_items'),
(241, 'Can add Attendance Rule', 61, 'add_attendancerule'),
(242, 'Can change Attendance Rule', 61, 'change_attendancerule'),
(243, 'Can delete Attendance Rule', 61, 'delete_attendancerule'),
(244, 'Can view Attendance Rule', 61, 'view_attendancerule'),
(245, 'Can add employee salary structure', 62, 'add_employeesalarystructure'),
(246, 'Can change employee salary structure', 62, 'change_employeesalarystructure'),
(247, 'Can delete employee salary structure', 62, 'delete_employeesalarystructure'),
(248, 'Can view employee salary structure', 62, 'view_employeesalarystructure'),
(249, 'Can add payroll calculation', 63, 'add_payrollcalculation'),
(250, 'Can change payroll calculation', 63, 'change_payrollcalculation'),
(251, 'Can delete payroll calculation', 63, 'delete_payrollcalculation'),
(252, 'Can view payroll calculation', 63, 'view_payrollcalculation'),
(253, 'Can add payroll period', 64, 'add_payrollperiod'),
(254, 'Can change payroll period', 64, 'change_payrollperiod'),
(255, 'Can delete payroll period', 64, 'delete_payrollperiod'),
(256, 'Can view payroll period', 64, 'view_payrollperiod'),
(257, 'Can add payroll permission', 65, 'add_payrollpermission'),
(258, 'Can change payroll permission', 65, 'change_payrollpermission'),
(259, 'Can delete payroll permission', 65, 'delete_payrollpermission'),
(260, 'Can view payroll permission', 65, 'view_payrollpermission'),
(261, 'Can add payroll role', 66, 'add_payrollrole'),
(262, 'Can change payroll role', 66, 'change_payrollrole'),
(263, 'Can delete payroll role', 66, 'delete_payrollrole'),
(264, 'Can view payroll role', 66, 'view_payrollrole'),
(265, 'Can add payroll workflow', 67, 'add_payrollworkflow'),
(266, 'Can change payroll workflow', 67, 'change_payrollworkflow'),
(267, 'Can delete payroll workflow', 67, 'delete_payrollworkflow'),
(268, 'Can view payroll workflow', 67, 'view_payrollworkflow'),
(269, 'Can add payroll workflow instance', 68, 'add_payrollworkflowinstance'),
(270, 'Can change payroll workflow instance', 68, 'change_payrollworkflowinstance'),
(271, 'Can delete payroll workflow instance', 68, 'delete_payrollworkflowinstance'),
(272, 'Can view payroll workflow instance', 68, 'view_payrollworkflowinstance'),
(273, 'Can add payroll workflow step', 69, 'add_payrollworkflowstep'),
(274, 'Can change payroll workflow step', 69, 'change_payrollworkflowstep'),
(275, 'Can delete payroll workflow step', 69, 'delete_payrollworkflowstep'),
(276, 'Can view payroll workflow step', 69, 'view_payrollworkflowstep'),
(277, 'Can add salary component', 70, 'add_salarycomponent'),
(278, 'Can change salary component', 70, 'change_salarycomponent'),
(279, 'Can delete salary component', 70, 'delete_salarycomponent'),
(280, 'Can view salary component', 70, 'view_salarycomponent'),
(281, 'Can add security settings', 71, 'add_securitysettings'),
(282, 'Can change security settings', 71, 'change_securitysettings'),
(283, 'Can delete security settings', 71, 'delete_securitysettings'),
(284, 'Can view security settings', 71, 'view_securitysettings'),
(285, 'Can add tax calculation', 72, 'add_taxcalculation'),
(286, 'Can change tax calculation', 72, 'change_taxcalculation'),
(287, 'Can delete tax calculation', 72, 'delete_taxcalculation'),
(288, 'Can view tax calculation', 72, 'view_taxcalculation'),
(289, 'Can add salary component value', 73, 'add_salarycomponentvalue'),
(290, 'Can change salary component value', 73, 'change_salarycomponentvalue'),
(291, 'Can delete salary component value', 73, 'delete_salarycomponentvalue'),
(292, 'Can view salary component value', 73, 'view_salarycomponentvalue'),
(293, 'Can add payroll workflow task', 74, 'add_payrollworkflowtask'),
(294, 'Can change payroll workflow task', 74, 'change_payrollworkflowtask'),
(295, 'Can delete payroll workflow task', 74, 'delete_payrollworkflowtask'),
(296, 'Can view payroll workflow task', 74, 'view_payrollworkflowtask'),
(297, 'Can add payroll payment', 75, 'add_payrollpayment'),
(298, 'Can change payroll payment', 75, 'change_payrollpayment'),
(299, 'Can delete payroll payment', 75, 'delete_payrollpayment'),
(300, 'Can view payroll payment', 75, 'view_payrollpayment'),
(301, 'Can add payroll document', 76, 'add_payrolldocument'),
(302, 'Can change payroll document', 76, 'change_payrolldocument'),
(303, 'Can delete payroll document', 76, 'delete_payrolldocument'),
(304, 'Can view payroll document', 76, 'view_payrolldocument'),
(305, 'Can add payroll component detail', 77, 'add_payrollcomponentdetail'),
(306, 'Can change payroll component detail', 77, 'change_payrollcomponentdetail'),
(307, 'Can delete payroll component detail', 77, 'delete_payrollcomponentdetail'),
(308, 'Can view payroll component detail', 77, 'view_payrollcomponentdetail'),
(309, 'Can add audit log', 78, 'add_auditlog'),
(310, 'Can change audit log', 78, 'change_auditlog'),
(311, 'Can delete audit log', 78, 'delete_auditlog'),
(312, 'Can view audit log', 78, 'view_auditlog'),
(313, 'Can add user payroll role', 79, 'add_userpayrollrole'),
(314, 'Can change user payroll role', 79, 'change_userpayrollrole'),
(315, 'Can delete user payroll role', 79, 'delete_userpayrollrole'),
(316, 'Can view user payroll role', 79, 'view_userpayrollrole'),
(317, 'Can add Employee Attendance', 80, 'add_employeeattendance'),
(318, 'Can change Employee Attendance', 80, 'change_employeeattendance'),
(319, 'Can delete Employee Attendance', 80, 'delete_employeeattendance'),
(320, 'Can view Employee Attendance', 80, 'view_employeeattendance'),
(321, 'Can add issuing_authority', 81, 'add_issuing_authority'),
(322, 'Can change issuing_authority', 81, 'change_issuing_authority'),
(323, 'Can delete issuing_authority', 81, 'delete_issuing_authority'),
(324, 'Can view issuing_authority', 81, 'view_issuing_authority'),
(325, 'Can add company_document', 82, 'add_company_document'),
(326, 'Can change company_document', 82, 'change_company_document'),
(327, 'Can delete company_document', 82, 'delete_company_document'),
(328, 'Can view company_document', 82, 'view_company_document'),
(329, 'Can add setting', 83, 'add_setting'),
(330, 'Can change setting', 83, 'change_setting'),
(331, 'Can delete setting', 83, 'delete_setting'),
(332, 'Can view setting', 83, 'view_setting'),
(333, 'Can add item_specification', 84, 'add_item_specification'),
(334, 'Can change item_specification', 84, 'change_item_specification'),
(335, 'Can delete item_specification', 84, 'delete_item_specification'),
(336, 'Can view item_specification', 84, 'view_item_specification'),
(337, 'Can add component', 85, 'add_component'),
(338, 'Can change component', 85, 'change_component'),
(339, 'Can delete component', 85, 'delete_component'),
(340, 'Can view component', 85, 'view_component'),
(341, 'Can add item_spec_values', 86, 'add_item_spec_values'),
(342, 'Can change item_spec_values', 86, 'change_item_spec_values'),
(343, 'Can delete item_spec_values', 86, 'delete_item_spec_values'),
(344, 'Can view item_spec_values', 86, 'view_item_spec_values'),
(345, 'Can add spec_values', 87, 'add_spec_values'),
(346, 'Can change spec_values', 87, 'change_spec_values'),
(347, 'Can delete spec_values', 87, 'delete_spec_values'),
(348, 'Can view spec_values', 87, 'view_spec_values'),
(349, 'Can add specs', 88, 'add_specs'),
(350, 'Can change specs', 88, 'change_specs'),
(351, 'Can delete specs', 88, 'delete_specs'),
(352, 'Can view specs', 88, 'view_specs'),
(353, 'Can add vendor_quotation_master', 89, 'add_vendor_quotation_master'),
(354, 'Can change vendor_quotation_master', 89, 'change_vendor_quotation_master'),
(355, 'Can delete vendor_quotation_master', 89, 'delete_vendor_quotation_master'),
(356, 'Can view vendor_quotation_master', 89, 'view_vendor_quotation_master'),
(357, 'Can add vendor_quotation_detail', 90, 'add_vendor_quotation_detail'),
(358, 'Can change vendor_quotation_detail', 90, 'change_vendor_quotation_detail'),
(359, 'Can delete vendor_quotation_detail', 90, 'delete_vendor_quotation_detail'),
(360, 'Can view vendor_quotation_detail', 90, 'view_vendor_quotation_detail'),
(361, 'Can add quotation_vendor_list', 91, 'add_quotation_vendor_list'),
(362, 'Can change quotation_vendor_list', 91, 'change_quotation_vendor_list'),
(363, 'Can delete quotation_vendor_list', 91, 'delete_quotation_vendor_list'),
(364, 'Can view quotation_vendor_list', 91, 'view_quotation_vendor_list');

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
(1, 'pbkdf2_sha256$600000$LOsqH8dxpqzBKGkXRbOdlh$GpqD/THsBI9RpMfLnbYiv7Iw5ejvQgFUHHAOGIINYBA=', '2025-09-25 09:58:25.156827', 1, 'admin', '', '', 'admin@sigbl.com', 1, 1, '2025-05-20 10:20:34.344465'),
(2, 'pbkdf2_sha256$600000$6D8ZeEABID6oA0fEfHRFtf$nPaPqq0OFMn6u1PB89HMJIIDo+Q77fAJMmVc4EY+MtU=', '2025-09-16 07:36:51.430909', 0, 'rauf', '', '', '', 1, 1, '2025-08-12 07:28:02.000000'),
(3, 'pbkdf2_sha256$600000$H1fpl9ip7XU8ie6AQyzrPH$StnYuegMigBk0ZrBqe2R+zI3cRJJ/+mpSKiApG8KHyA=', '2025-08-28 10:03:56.084798', 0, 'salman', '', '', '', 0, 1, '2025-08-12 07:33:27.000000');

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
(1, 2, 1),
(2, 3, 1);

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
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_guaranty`
--

CREATE TABLE `bank_guaranty` (
  `id` bigint(20) NOT NULL,
  `guarantee_type` varchar(50) DEFAULT NULL,
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
  `boq_master_id` bigint(20) DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `heading_id` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `root_id` bigint(20) DEFAULT NULL,
  `sub_heading_id` bigint(20) DEFAULT NULL,
  `tendor_id` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Karachi Office', 'SI-001', 'The Plaza, 3rd Floor, Office # 311, KDA Scheme # 5, Near II Talwar Clifton Karachi', 1, 1, 1, 1, 2, 1),
(2, 'Lahore', 'br-002', 'Office # 13, 8th Floor, Arfa Software Technology Park 346-B, Ferozepur Road Lahore, Pakistan', 1, 2, 1, 1, 1, 2),
(3, 'Islamabad', 'br-003', 'Office 8, 2nd Floor, Moscow Plaza, Blue Area, Islamabad, Pakistan', 1, 3, 1, 1, 3, 2);

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
(2, 'Metal', NULL, NULL, NULL, 1),
(3, 'Plastic', NULL, NULL, NULL, 1),
(5, 'Desktop Computers', NULL, NULL, NULL, 1),
(6, 'Printers', NULL, NULL, NULL, 1),
(7, 'Scanners', NULL, NULL, NULL, 1),
(8, 'Laptops', NULL, NULL, NULL, 1),
(9, 'Fiber', NULL, NULL, NULL, 1),
(10, 'Cables', NULL, NULL, NULL, 1),
(11, 'LCDs', NULL, NULL, NULL, 1),
(12, 'LED Monitors', NULL, NULL, NULL, 1),
(13, 'Servers', NULL, NULL, NULL, 1),
(14, 'Storage', NULL, NULL, NULL, 1),
(15, 'Firewall', NULL, NULL, NULL, 1),
(16, 'Marine Lights', NULL, NULL, NULL, 1),
(17, 'Buoys', NULL, NULL, NULL, 1),
(18, 'Powerbanks', NULL, NULL, NULL, 1),
(19, 'UPS', NULL, NULL, NULL, 1),
(20, 'DC Cooling Unit', NULL, NULL, NULL, 1),
(21, 'Cameras', NULL, NULL, NULL, 1),
(22, 'Mouse', NULL, NULL, NULL, 1),
(23, 'Keyboard', NULL, NULL, NULL, 1),
(24, 'Tablets', NULL, NULL, NULL, 1),
(25, 'Macbooks', NULL, NULL, NULL, 1),
(26, 'iPads', NULL, NULL, NULL, 1),
(27, 'All in One', NULL, NULL, NULL, 1),
(28, 'AirConditioner', NULL, NULL, NULL, 1),
(29, 'Photocopier', NULL, NULL, NULL, 1),
(30, '3 in one Copier', NULL, NULL, NULL, 1),
(31, 'SMDs', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `certifications`
--

CREATE TABLE `certifications` (
  `id` bigint(20) NOT NULL,
  `certification_name` varchar(100) DEFAULT NULL,
  `certification_doc` varchar(255) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_code` varchar(50) DEFAULT NULL,
  `sequence_code` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `account_type_id` bigint(20) DEFAULT NULL,
  `detail_type_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'MES Navy', 'mes@mes.gov.pk', '12234556', 'Karachi', 1, 1),
(2, 'Sindh Police', 'cpo@sindhpolice.com.pk', '423423423', 'II Chundrigar Road', 1, 1),
(3, 'DESCON Engineering Ltd', 'info@descon.com', '+923001234567', '18KM, Ferozepur Road, Lahore', 1, 1),
(4, 'Contour Software (Pt) Limited', 'support@contour.com', '021353087012', 'Askari Corporate Towers, 12th Floor, 75- Block D1, Gulberg –III, LAHORE, Punjab, Pakistan', 1, 1);

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
(1, 'SI Global Solutions Pvt Ltd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `company_document`
--

CREATE TABLE `company_document` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `issuance_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `doc_path` varchar(255) DEFAULT NULL,
  `reg_no` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `issuing_authority_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_document`
--

INSERT INTO `company_document` (`id`, `title`, `issuance_date`, `expire_date`, `doc_path`, `reg_no`, `created_at`, `updated_at`, `deleted_at`, `status`, `issuing_authority_id`) VALUES
(1, 'PASHA Certificate', '2025-04-01', '2026-03-31', 'company_document/1/1_PASHA Certificate_20250813050558.pdf', '2025_C0559', '2025-06-04', '2025-08-13', NULL, 1, 1),
(2, 'Licence Of Pakistani Constructor', '2025-07-07', '2026-06-30', 'company_document/2/2_Licence Of Pakistani Constructor_20250813051340.pdf', '7607', '2025-08-13', '2025-08-13', NULL, 1, 2),
(3, 'Membership Certificate', '2025-04-01', '2026-03-31', 'company_document/23/23_Membership Certificate_20250813051346.pdf', '1560060', '2025-08-13', '2025-08-13', NULL, 1, 23),
(4, 'Certificate Of Registration', '2024-06-27', '2025-07-24', 'company_document/3/3_Certificate Of Registration_20250813052521.pdf', 'AQP-70001', '2025-08-13', '2025-08-13', NULL, 1, 3),
(5, 'Letter of Appreciation', '2023-04-09', '2023-04-09', 'company_document/6/6_Letter of Appreciation_20250813055456.pdf', 'DG/SSCA/KYC/ 1075 /2024', '2025-08-13', '2025-08-13', NULL, 1, 6),
(6, 'Certificare Of Registration', '2024-06-27', '2025-07-24', 'company_document/3/3_Certificare Of Registration_20250813052928.pdf', 'AQP-30025', '2025-08-13', '2025-08-13', NULL, 1, 3),
(7, 'Certificate Of Registration', '2024-06-27', '2025-07-24', 'company_document/3/3_Certificate Of Registration_20250813055531.pdf', 'AQP-10396', '2025-08-13', '2025-08-13', NULL, 1, 3),
(8, 'Manufacture Acknowledgement', '2025-03-15', '2025-12-31', 'company_document/22/22_Manufacture Acknowledgement_20250813061531.pdf', '0000000000000', '2025-08-13', '2025-08-13', NULL, 1, 22),
(9, 'DELL Technologies Platinum Partner', '2025-02-01', '2026-01-30', 'company_document/9/9_DELL Technologies Platinum Partner_20250813061828.pdf', '0000000000000', '2025-08-13', '2025-08-13', NULL, 1, 9),
(10, 'Certificate Of Registration', '2024-06-27', '2025-07-24', 'company_document/3/3_Certificate Of Registration_20250813062202.pdf', 'AQP-20056', '2025-08-13', '2025-08-13', NULL, 1, 3),
(11, 'Certificate Of Approval', '2023-05-11', '2026-05-10', 'company_document/3/3_Certificate Of Approval_20250813062856.pdf', 'TIT/PK01/89811105', '2025-08-13', '2025-08-13', NULL, 1, 3),
(12, 'Certificare Of Approval', '2023-05-11', '2026-05-12', 'company_document/3/3_Certificare Of Approval_20250813070755.pdf', 'TIT/PK01/73051105', '2025-08-13', '2025-08-13', NULL, 1, 3),
(13, 'Trend Micro Partner Program Certificate', '2020-10-01', '2020-10-01', 'company_document/27/27_Trend Micro Partner Program Certificate_20250813101025.pdf', '00000000000', '2025-08-13', '2025-08-13', NULL, 1, 27),
(14, 'test', '2025-08-01', '2025-08-27', 'company_document/26/26_test_20250827080448.pdf', '222', '2025-08-27', '2025-08-27', NULL, 0, 26),
(15, 'Provisional Registration of Firm - Cat \"A\"', '2021-08-17', '2022-08-18', 'company_document/15/15_Provisional Registration of Firm - Cat \"A\"_20250828060309.pdf', 'SIGBL/FF/Regst.Doc/30-07-2021', '2025-08-28', '2025-08-28', NULL, 1, 15),
(16, 'Membership acceptance', '2024-10-24', '2024-10-24', 'company_document/13/13_Membership acceptance_20250828062859.pdf', '00000000000', '2025-08-28', '2025-08-28', NULL, 1, 13),
(17, 'Membership Certificate', '2025-01-08', '2026-03-31', 'company_document/20/20_Membership Certificate_20250828063603.pdf', '111271', '2025-08-28', '2025-08-28', NULL, 1, 20),
(18, 'Membership Certificate', '2025-02-06', '2026-03-31', 'company_document/4/4_Membership Certificate_20250828063819.jpg', '86862-C', '2025-08-28', '2025-08-28', NULL, 1, 4),
(19, 'Lenovo 360 Gold Intelligent Devices Partner', '2026-03-31', '2026-03-31', 'company_document/8/8_Lenovo 360 Gold Intelligent Devices Partner_20250828064031.pdf', '00000000000', '2025-08-28', '2025-08-28', NULL, 1, 8),
(20, 'Lenovo Partner Certificate', '2023-08-04', '2023-08-04', 'company_document/8/8_Lenovo Partner Certificate_20250828064346.pdf', '1215101183/0093928', '2025-08-28', '2025-08-28', NULL, 1, 8),
(21, 'Membership Certificate', '2025-04-01', '2026-03-31', 'company_document/1/1_Membership Certificate_20250828064556.pdf', '2025_C0559', '2025-08-28', '2025-08-28', NULL, 1, 1),
(22, 'Liscense of Pakistani Constructor', '2025-07-07', '2026-06-30', 'company_document/2/2_Liscense of Pakistani Constructor_20250828065042.pdf', '611575', '2025-08-28', '2025-08-28', NULL, 1, 2),
(23, 'Certificate of Registration', '2024-10-01', '2025-09-01', 'company_document/5/5_Certificate of Registration_20250828065349.pdf', 'Z-25-3024/15', '2025-08-28', '2025-08-28', NULL, 1, 5),
(24, 'Authorised Distribution Partner', '2024-09-01', '2024-12-01', 'company_document/24/24_Authorised Distribution Partner_20250828065823.pdf', '1000202409247063', '2025-08-28', '2025-08-28', NULL, 1, 24),
(25, 'Letter of Authorization', '2025-02-03', '2025-02-03', 'company_document/21/21_Letter of Authorization_20250828070915.pdf', '00000000000', '2025-08-28', '2025-08-28', NULL, 1, 21),
(26, 'Sindh Salex Tax Registration Certificate', '2017-01-13', '2017-01-13', 'company_document/19/19_Sindh Salex Tax Registration Certificate_20250828071226.jpg', '4438418-1', '2025-08-28', '2025-08-28', NULL, 1, 19),
(27, 'Authorised Dealer Certificate', '2024-07-01', '2024-12-31', 'company_document/25/25_Authorised Dealer Certificate_20250828073254.pdf', '00000000000', '2025-08-28', '2025-08-28', NULL, 1, 25),
(28, 'Manufacturer Authorization Letter', '2024-11-07', '2024-11-07', 'company_document/17/17_Manufacturer Authorization Letter_20250828074111.pdf', '00000000000', '2025-08-28', '2025-08-28', NULL, 1, 17),
(29, 'New Registration of Firm', '2021-08-17', '2025-12-31', 'company_document/26/26_New Registration of Firm_20250828101244.pdf', '1566/13153/', '2025-08-28', '2025-08-28', NULL, 1, 26),
(30, 'Attaining H3C Partnership Certificate', '2021-02-17', '2021-02-17', 'company_document/18/18_Attaining H3C Partnership Certificate_20250828101812.pdf', '00000000000', '2025-08-28', '2025-08-28', NULL, 1, 18),
(31, 'Huawei Partnership Status', '0001-01-01', '0001-01-01', 'company_document/11/11_Huawei Partnership Status_20250828102222.jpg', '00000000000', '2025-08-28', '2025-08-28', NULL, 1, 11),
(32, 'Certificate of Incorporation', '2025-06-11', '2025-06-11', 'company_document/29/29_Certificate of Incorporation_20250828102950.jpg', 'A009484', '2025-08-28', '2025-08-28', NULL, 1, 29),
(33, 'Partnership Certificate', '0001-01-01', '2027-12-31', 'company_document/30/30_Partnership Certificate_20250828103123.pdf', '00000000000', '2025-08-28', '2025-08-28', NULL, 1, 30),
(34, 'Partnership Certificate', '0001-01-01', '2027-12-31', 'company_document/30/30_Partnership Certificate_20250828103124.pdf', '00000000000', '2025-08-28', '2025-08-28', NULL, 1, 30),
(35, 'Authorised Sole Agent', '2024-02-21', '2024-02-21', 'company_document/31/31_Authorised Sole Agent_20250828103310.pdf', 'SATCL/SIGBL/0702204', '2025-08-28', '2025-08-28', NULL, 1, 31),
(36, 'Authorised Sole Agent', '2024-02-21', '2024-02-21', 'company_document/31/31_Authorised Sole Agent_20250828103310.pdf', 'SATCL/SIGBL/0702204', '2025-08-28', '2025-08-28', NULL, 1, 31);

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
-- Table structure for table `component`
--

CREATE TABLE `component` (
  `id` bigint(20) NOT NULL,
  `comp_title` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `component`
--

INSERT INTO `component` (`id`, `comp_title`, `created_at`, `updated_at`, `deleted_at`, `status`, `category_id`) VALUES
(1, 'CPU', NULL, NULL, NULL, 1, 13),
(2, 'RAM', NULL, NULL, NULL, 1, 13),
(3, 'Storage', NULL, NULL, NULL, 1, 13),
(4, 'Power Supply', NULL, NULL, NULL, 1, 13),
(5, 'LAN Port', NULL, NULL, NULL, 1, 13),
(6, 'GPU', NULL, NULL, NULL, 1, 13),
(7, 'RAID Controller', NULL, NULL, NULL, 1, 13),
(8, 'Print Engine', NULL, NULL, NULL, 1, 6),
(9, 'Paper Handling', NULL, NULL, NULL, 1, 6),
(10, 'Optics', NULL, NULL, NULL, 1, 7),
(11, 'Feeder', NULL, NULL, NULL, 1, 7),
(12, 'Lens', NULL, NULL, NULL, 1, 21),
(13, 'Image Sensor', NULL, NULL, NULL, 1, 21);

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
(1, 'Pakistan', 1),
(2, 'No Country', 1);

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
(1, 'Software', 1),
(2, 'Maritime', 1),
(3, 'Sales', 1),
(4, 'Pre-Sales', 1),
(5, 'Finance', 1),
(6, 'Human Resources', 1),
(7, 'Procurement', 1);

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
(1, 'GM Maritime', 1),
(2, 'CTO', 1),
(3, 'CEO', 1),
(4, 'Head of Sales', 1),
(5, 'COO', 1),
(6, 'Company Secretary', 1),
(7, 'Finance Manager', 1),
(8, 'Procurement Manager', 1),
(9, 'IT Support Manager', 1),
(10, 'Sales Executive', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_type`
--

CREATE TABLE `detail_type` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_code` varchar(50) DEFAULT NULL,
  `sequence_code` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `account_type_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, '2025-08-12 07:26:12.178027', '1', 'DEO', 1, '[{\"added\": {}}]', 3, 1),
(2, '2025-08-12 07:28:03.316276', '2', 'rauf', 1, '[{\"added\": {}}]', 4, 1),
(3, '2025-08-12 07:28:37.068031', '2', 'rauf', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', 4, 1),
(4, '2025-08-12 07:33:27.845585', '3', 'salman', 1, '[{\"added\": {}}]', 4, 1),
(5, '2025-08-12 07:43:59.750640', '3', 'salman', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);

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
(7, 'employee', 'area'),
(8, 'employee', 'bank'),
(43, 'employee', 'bank_guaranty'),
(9, 'employee', 'branch'),
(42, 'employee', 'certifications'),
(10, 'employee', 'client'),
(11, 'employee', 'company'),
(82, 'employee', 'company_document'),
(12, 'employee', 'company_module'),
(13, 'employee', 'country'),
(14, 'employee', 'cv_template'),
(15, 'employee', 'department'),
(16, 'employee', 'designation'),
(17, 'employee', 'document_type'),
(41, 'employee', 'education'),
(18, 'employee', 'employee'),
(40, 'employee', 'employee_project'),
(39, 'employee', 'employee_target'),
(38, 'employee', 'employment_record'),
(37, 'employee', 'insurance_detail'),
(19, 'employee', 'insurance_type'),
(81, 'employee', 'issuing_authority'),
(20, 'employee', 'leads'),
(36, 'employee', 'liquidity_damages'),
(21, 'employee', 'mainmenu'),
(22, 'employee', 'module'),
(23, 'employee', 'project'),
(35, 'employee', 'project_document'),
(24, 'employee', 'project_type'),
(25, 'employee', 'quarters'),
(26, 'employee', 'region'),
(27, 'employee', 'role'),
(28, 'employee', 'role_permission'),
(34, 'employee', 'sales'),
(33, 'employee', 'skills'),
(29, 'employee', 'submenu'),
(30, 'employee', 'template_column'),
(32, 'employee', 'vendor'),
(31, 'employee', 'zone'),
(44, 'finance', 'account_type'),
(45, 'finance', 'chart_of_accounts'),
(46, 'finance', 'currency'),
(49, 'finance', 'detail_type'),
(48, 'finance', 'journal_entry'),
(47, 'finance', 'payment_mode'),
(61, 'payroll', 'attendancerule'),
(78, 'payroll', 'auditlog'),
(80, 'payroll', 'employeeattendance'),
(62, 'payroll', 'employeesalarystructure'),
(63, 'payroll', 'payrollcalculation'),
(77, 'payroll', 'payrollcomponentdetail'),
(76, 'payroll', 'payrolldocument'),
(75, 'payroll', 'payrollpayment'),
(64, 'payroll', 'payrollperiod'),
(65, 'payroll', 'payrollpermission'),
(66, 'payroll', 'payrollrole'),
(67, 'payroll', 'payrollworkflow'),
(68, 'payroll', 'payrollworkflowinstance'),
(69, 'payroll', 'payrollworkflowstep'),
(74, 'payroll', 'payrollworkflowtask'),
(70, 'payroll', 'salarycomponent'),
(73, 'payroll', 'salarycomponentvalue'),
(71, 'payroll', 'securitysettings'),
(72, 'payroll', 'taxcalculation'),
(79, 'payroll', 'userpayrollrole'),
(60, 'project_initiation', 'boq_items'),
(59, 'project_initiation', 'boq_master'),
(50, 'project_initiation', 'category'),
(85, 'project_initiation', 'component'),
(51, 'project_initiation', 'heading'),
(58, 'project_initiation', 'iso_detail'),
(57, 'project_initiation', 'iso_master'),
(56, 'project_initiation', 'item'),
(84, 'project_initiation', 'item_specification'),
(86, 'project_initiation', 'item_spec_values'),
(91, 'project_initiation', 'quotation_vendor_list'),
(83, 'project_initiation', 'setting'),
(88, 'project_initiation', 'specs'),
(87, 'project_initiation', 'spec_values'),
(55, 'project_initiation', 'sub_heading'),
(52, 'project_initiation', 'tax'),
(54, 'project_initiation', 'tendor'),
(53, 'project_initiation', 'unit'),
(90, 'project_initiation', 'vendor_quotation_detail'),
(89, 'project_initiation', 'vendor_quotation_master'),
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
(1, 'contenttypes', '0001_initial', '2025-05-20 10:20:24.682676'),
(2, 'auth', '0001_initial', '2025-05-20 10:20:24.827974'),
(3, 'admin', '0001_initial', '2025-05-20 10:20:24.875514'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-05-20 10:20:24.893678'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-05-20 10:20:24.917804'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-05-20 10:20:24.969541'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-05-20 10:20:24.997424'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-05-20 10:20:25.020128'),
(9, 'auth', '0004_alter_user_username_opts', '2025-05-20 10:20:25.036767'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-05-20 10:20:25.062528'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-05-20 10:20:25.066659'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-05-20 10:20:25.083030'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-05-20 10:20:25.105874'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-05-20 10:20:25.128108'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-05-20 10:20:25.149320'),
(16, 'auth', '0011_update_proxy_permissions', '2025-05-20 10:20:25.171200'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-05-20 10:20:25.192445'),
(18, 'employee', '0001_initial', '2025-05-20 10:20:26.084637'),
(19, 'finance', '0001_initial', '2025-05-20 10:20:26.316531'),
(20, 'payroll', '0001_initial', '2025-05-20 10:20:27.708180'),
(21, 'project_initiation', '0001_initial', '2025-05-20 10:20:28.896018'),
(22, 'sessions', '0001_initial', '2025-05-20 10:20:28.909785'),
(23, 'employee', '0002_issuing_authority_document_type_purpose_and_more', '2025-06-04 05:45:38.601678'),
(24, 'employee', '0003_employee_cnic_back_employee_cnic_front_and_more', '2025-06-12 10:46:10.442680'),
(25, 'project_initiation', '0002_setting_and_more', '2025-07-22 11:38:46.335391'),
(26, 'project_initiation', '0003_component_item_spec_values_spec_values_specs_and_more', '2025-08-07 06:06:25.375934'),
(27, 'project_initiation', '0004_setting_footer_setting_header_setting_logo_and_more', '2025-09-25 09:55:05.172864');

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
('1dj13cg0sx8h3qknzursiylo89zyrwo0', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1ukGSX:ILLHk4Dj48g8BkZ_qz9RPqfEn9Rsw0Zz9e4r23lWcwA', '2025-08-08 09:20:09.609011'),
('1sr5o2gk2j1mj859yuapdx8047yuqity', '.eJxVjDkOwjAUBe_iGlnf8RpKes5g_cXGAZRIWSrE3SFSCmjfzLyXyritLW9LmfMg6qysOv1uhPwo4w7kjuNt0jyN6zyQ3hV90EVfJynPy-H-HTRc2rcGMJFC8E4KsrEpWhMBK1RKaMVzx31IHdbeGQBBQi8SwbkQOmJKQb0_1bM3ug:1urAaV:Kx79X9tBjbmP4DMpYta8FtEbTwld9vNR3VGjyzt-BAY', '2025-08-27 10:28:55.278479'),
('2i5natpd5jhr9zix37uvheznzcdgwc03', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1ulnSr:_-JV9iwFbO20u2l76f2xXJcCemKJRScpsf8jmzxAJMw', '2025-08-12 14:46:49.102529'),
('3u1znkk8vp7u03mw8h4x8tqegntz2ktx', '.eJxVjMEOwiAQRP-FsyEUdyn16N1vIAsLUjWQlPZk_Hdp0oPeJvPezFs42tbsthYXN7O4CC1Ov52n8IxlB_ygcq8y1LIus5e7Ig_a5K1yfF0P9-8gU8t9jcBKgU0YekjICGoCtjrBeQoDeDadaDRgbIJkiCkGOwDG0StDoxGfL827N30:1uyQF9:R29MVukSAKF2WNw6DQv1gE_HhfQ0yaZd-06WVgk86uA', '2025-09-16 10:36:51.510478'),
('49y6cr5v9phmmhmrt2bduf4hrayjycnf', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uPaC1:3EYOLgV4XeWMqVPqmu8J13Cq1LmUvjFvpnTZMArggfQ', '2025-06-12 08:09:37.626769'),
('4tbz2kujqvtgsug4xsyhihz3qziizhm9', '.eJxVjDkOwjAUBe_iGlnf8RpKes5g_cXGAZRIWSrE3SFSCmjfzLyXyritLW9LmfMg6qysOv1uhPwo4w7kjuNt0jyN6zyQ3hV90EVfJynPy-H-HTRc2rcGMJFC8E4KsrEpWhMBK1RKaMVzx31IHdbeGQBBQi8SwbkQOmJKQb0_1bM3ug:1ulnNU:J1vcs8LGS8-PAhfdMQ4hxefbeMa0FTYPKxrb27HKL_s', '2025-08-12 14:41:16.641218'),
('5ojt3nbmml1h0t8cvxajhi73jnyu4xf3', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1v0xh5:zLyIwQQxrL_M7yGvXUIC0loU05_EOwWOpsejaTyCOYw', '2025-09-23 10:44:11.720214'),
('6goh77g5cjpbr2m8ejg3l1ivja6gmfwf', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uVRay:1FTsCLCwolCw0sLVxU-TRaUFbGaetKaTNvFjv4GspGg', '2025-06-28 12:11:36.910517'),
('6myxil3br6xxmhwfgm3r9u9s8i3b0zrk', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uKt7c:UP3Wd02XZFn_F4REvUlvkewxZdDE2PQjxwEY6s0ilUE', '2025-05-30 09:21:40.867064'),
('6tb8khx4tnv9jvjz0mncf1xfpur0miz3', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uwc0z:B4suMBdP7BZzAG163UfOEex8vgwY5xQpAdf26U6wu-E', '2025-09-11 10:46:45.843505'),
('6yzz3gjh1iy18dovy8k8zn1pqfebbvk9', '.eJxVjMEOwiAQRP-FsyEUdyn16N1vIAsLUjWQlPZk_Hdp0oPeJvPezFs42tbsthYXN7O4CC1Ov52n8IxlB_ygcq8y1LIus5e7Ig_a5K1yfF0P9-8gU8t9jcBKgU0YekjICGoCtjrBeQoDeDadaDRgbIJkiCkGOwDG0StDoxGfL827N30:1ulnYK:PTSGJ8Y0Ir_c-i1iUont7duo2_MwXM5OX6wFTl5ds7o', '2025-08-12 14:52:28.054582'),
('75ak8d0r2id1czfnzbrww2tprvlnm5aj', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uKrlW:cVqiQAmmyYROhX210e6-3-mQzHyBrs-adqdtQXZG9Oc', '2025-05-30 07:54:46.939988'),
('8lek01mufjxjifjkfz98au7ydqpi4t3j', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uljfY:Asn-i5Y0wjr55SrE-lDRtrObiCk0EtYJfdClnQsHcpg', '2025-08-12 10:43:40.660066'),
('8obr66gxhk45zvlluhbext2dfov3kcry', '.eJxVjMEOwiAQRP-FsyEUdyn16N1vIAsLUjWQlPZk_Hdp0oPeJvPezFs42tbsthYXN7O4CC1Ov52n8IxlB_ygcq8y1LIus5e7Ig_a5K1yfF0P9-8gU8t9jcBKgU0YekjICGoCtjrBeQoDeDadaDRgbIJkiCkGOwDG0StDoxGfL827N30:1uvWE3:HHDT-nBcaHEy2Il5c9b6udyR8e5ZjNxlDRi84dizIzM', '2025-09-08 10:23:43.178708'),
('93fcf3mcno9lu0yoc53jytejet9m6r7v', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1v0fUw:KLWntnSrcDlkQOmmyZK3RnsPFmB8CfGI6eODxfLbe4E', '2025-09-22 15:18:26.440343'),
('a867c8fecwyyu1y32biogi1wj8ybyix2', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uRTOm:t5vNvummpOu6HRJvJWjnFox-hW3iplQ_0f7q9TiVpFo', '2025-06-17 13:18:36.566481'),
('abolhmqw8blb5o5oigltjzlyhmwbezei', '.eJxVjDkOwjAUBe_iGlnf8RpKes5g_cXGAZRIWSrE3SFSCmjfzLyXyritLW9LmfMg6qysOv1uhPwo4w7kjuNt0jyN6zyQ3hV90EVfJynPy-H-HTRc2rcGMJFC8E4KsrEpWhMBK1RKaMVzx31IHdbeGQBBQi8SwbkQOmJKQb0_1bM3ug:1um3at:yNgYj-2O__9YCBRhf8glo5OddCgzoaQy_houSsLIRVA', '2025-08-13 08:00:11.158861'),
('b85fqbqydczdpieoc8mobyoc2mzqyb39', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1ue6Pv:N8bePjWvbKvddIWi2OEN1ljmbNQjesOnWRhMAjzAwQ8', '2025-07-22 09:23:59.578186'),
('bg9tz2o8piss3n8oao4g58ijxy2x1wk8', '.eJxVjDkOwjAUBe_iGlnf8RpKes5g_cXGAZRIWSrE3SFSCmjfzLyXyritLW9LmfMg6qysOv1uhPwo4w7kjuNt0jyN6zyQ3hV90EVfJynPy-H-HTRc2rcGMJFC8E4KsrEpWhMBK1RKaMVzx31IHdbeGQBBQi8SwbkQOmJKQb0_1bM3ug:1urVcC:wRF0jWGFkUO_jPFosPLqN3Q9vrPb75u-zFlFDvFWCPw', '2025-08-28 08:56:04.165459'),
('e3p6qpka0uxjvdaj0rlplfwg194bxz0v', '.eJxVjDkOwjAUBe_iGlnf8RpKes5g_cXGAZRIWSrE3SFSCmjfzLyXyritLW9LmfMg6qysOv1uhPwo4w7kjuNt0jyN6zyQ3hV90EVfJynPy-H-HTRc2rcGMJFC8E4KsrEpWhMBK1RKaMVzx31IHdbeGQBBQi8SwbkQOmJKQb0_1bM3ug:1urZU4:rr7q7ocOUld11zJzXuJmG96ykioU1V6UlbTqbSFXmpo', '2025-08-28 13:03:56.086628'),
('ec4wtsq2wkyz0rzt8tiwb0ka7sqlyn08', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uPMmV:iKSI2JmLEk57_H73Gql_sQrm9tuc0PS5P_n8IOZqeP0', '2025-06-11 17:50:23.005640'),
('f5tj739yo81ivle78xwrjh74bn867tgz', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uPFoG:UpHsTOAEXolGyXVnbOt-kT4iQDapVNGj5k8TRj0G_CY', '2025-06-11 10:23:44.700788'),
('g4infbb2zmpuwvplanwe0u3ym49mqlv9', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uHcFX:ZYWUWMb0qWwcc7c4C2JKg6TIHyn1JAAFuGSilm4yDoQ', '2025-05-21 08:44:19.022875'),
('hwg3ooc9qroyrbebfjkdqwrkxdjnr1jy', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1urB7A:-635eoBKwq031nUqMQbhfQgwyxJjTGbpHALUrPNeyns', '2025-08-27 11:02:40.200702'),
('ioa3i6nrvfbpki11wu46x8cy8lf013lf', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uUPc9:DHdKilLc5J6DnfeIAmv4DHHajnHeIOM_iSxom7EW9OE', '2025-06-25 15:52:33.665780'),
('jmj65yv4fpk580p1b8ljlbnbjw7ylx8w', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uHK8D:JcaxVkViCky3wzGuqYHWYCW6J8zrcDJUyQss6azEma4', '2025-05-20 13:23:33.841112'),
('knhufxmqfjm1wj0l52s4jccyrc8iqeky', '.eJxVjMEOwiAQRP-FsyEUdyn16N1vIAsLUjWQlPZk_Hdp0oPeJvPezFs42tbsthYXN7O4CC1Ov52n8IxlB_ygcq8y1LIus5e7Ig_a5K1yfF0P9-8gU8t9jcBKgU0YekjICGoCtjrBeQoDeDadaDRgbIJkiCkGOwDG0StDoxGfL827N30:1um3cC:Wi1MUAxWAYnCDEdbYMthJbSmOtm9y0-jwWDyCdyok08', '2025-08-13 08:01:32.892412'),
('ox7x3uat5btn8j6jfohf0syrav20x1ce', '.eJxVjDkOwjAUBe_iGlnf8RpKes5g_cXGAZRIWSrE3SFSCmjfzLyXyritLW9LmfMg6qysOv1uhPwo4w7kjuNt0jyN6zyQ3hV90EVfJynPy-H-HTRc2rcGMJFC8E4KsrEpWhMBK1RKaMVzx31IHdbeGQBBQi8SwbkQOmJKQb0_1bM3ug:1uoFAv:qgOwz572T4pUuzXgcGqO1lUoEg_amBV7YyGFuIUdG_0', '2025-08-19 08:46:25.729220'),
('p24a1l0ws2937bijnrvex839ln7ruup3', '.eJxVjDkOwjAUBe_iGlnf8RpKes5g_cXGAZRIWSrE3SFSCmjfzLyXyritLW9LmfMg6qysOv1uhPwo4w7kjuNt0jyN6zyQ3hV90EVfJynPy-H-HTRc2rcGMJFC8E4KsrEpWhMBK1RKaMVzx31IHdbeGQBBQi8SwbkQOmJKQb0_1bM3ug:1ulnYL:qHwUFMZfvSukPWHXy30XGvHWvQRkk-f8KH5u81HelxU', '2025-08-12 14:52:29.186031'),
('pkdi1b835d6i1ddys6xqimrtddwbsjvg', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uSaOO:UKGyKhTRaCpWz-VfWY3sw8aQwdI4MmM_offDqXMdFdc', '2025-06-20 14:58:48.742276'),
('ptr7yiynvj435xm157anznsd1nm4eefl', '.eJxVjDkOwjAUBe_iGlnf8RpKes5g_cXGAZRIWSrE3SFSCmjfzLyXyritLW9LmfMg6qysOv1uhPwo4w7kjuNt0jyN6zyQ3hV90EVfJynPy-H-HTRc2rcGMJFC8E4KsrEpWhMBK1RKaMVzx31IHdbeGQBBQi8SwbkQOmJKQb0_1bM3ug:1ulnYK:E_hsjG8ASRaXJYj4GVps7zEWILWkHeIkvPxx2PmLXyo', '2025-08-12 14:52:28.620063'),
('qihiajmapxijbxozfeol4ht69ne9hp78', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1ulNOp:oZmgxCHV_e0w8Hqz_RKSl3gDR3sxOIw25u5QraagdT8', '2025-08-11 10:56:55.913427'),
('r78bmy5y69k30wzz0jxfx5qdey0npj26', '.eJxVjDkOwjAUBe_iGlnf8RpKes5g_cXGAZRIWSrE3SFSCmjfzLyXyritLW9LmfMg6qysOv1uhPwo4w7kjuNt0jyN6zyQ3hV90EVfJynPy-H-HTRc2rcGMJFC8E4KsrEpWhMBK1RKaMVzx31IHdbeGQBBQi8SwbkQOmJKQb0_1bM3ug:1um8JX:LgX1nDMn2B8O8crPKispXjZFwA8yz7VtrZky_e7-LcM', '2025-08-13 13:02:35.956215'),
('ruyarpzeexfjnzknbm0m0dy6hxewop7l', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1v1ik5:1rIZRtrCOnCbgwEmzNM3spQC6Pk4aOHPx4JR5ZhKAAM', '2025-09-25 12:58:25.240917'),
('rwosjgvuow4b1wli5ptr31digjln58ow', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uRn89:4LLRgvp7DqwH16L96m7GPtpOWXUCOW9zP_VJmA1wZrk', '2025-06-18 10:22:45.512713'),
('tmzfqn0itz40qxj5u0gdnvujuz2gl3gr', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1ukL9o:auMpAXIim6iXlX_LQUppTMzKTpXhy1wl2wfkfefmegI', '2025-08-08 14:21:08.251062'),
('uitgmhvhe8k656un5azp9t060mu7rpxn', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uIMol:dvHcOnLXI8mdDdng9PKXOufSNMis852rNHMHW6gG7iQ', '2025-05-23 10:27:47.288808'),
('ulds5r7zjm2x1efs3x02bqkx3eflge79', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uPJ7Q:pOncQzpnvwIcjzj1I7SdZP-2d7vjGL1AXBe42SxLrqk', '2025-06-11 13:55:44.223014'),
('w29jm58n8gc3vwc2ulr7f8mw1tsbzob9', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uz7lD:EVby68xzVgAsp9WEgkqCmqXQ_2paKXLvwEwVjDupSCo', '2025-09-18 09:04:51.873098'),
('w2f30ylqy7ojdfl6o2o5dfo5eny40n61', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1ujtjc:DZtSoFRI-L7ZduaPlk1fCKY4FDxnD86b6Okj__z9g44', '2025-08-07 09:04:16.586518'),
('w7lsydfz80ejlpn2eq4gbcf8ihth7l21', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uPcmL:kG9PRX2qCfbUD-An0epIuCOE4HR8Uz6rtwhCPVEedwM', '2025-06-12 10:55:17.503138'),
('wflh0n53zmlo6qzer7x3a5toqznk3vaj', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1ujwzm:fxPojA4oxANgDBCjxvi3sx36NT8eNEASD_hrXbtA2oo', '2025-08-07 12:33:10.083762'),
('wsb73xncli0pck13sm7brvua9050i4c6', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uPJEm:y4fPjEYxontz0bXlK7bvaON0Z4vVFtDPhyIZCAxdQJU', '2025-06-11 14:03:20.101526'),
('x5tyaoobwb1rkoow682kmd496ymb33mp', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uIPxk:ibUBdN726oxmByux1Yi1e4mnsXstY795s1-uj1PUqlw', '2025-05-23 13:49:16.988729'),
('x7u4ugylf2of2pxvwqvsij6aw34d8oth', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uOwGd:FRwOIN3T3iPYa0w8XM5oVgRXblerIc6bHtERWUQTP0c', '2025-06-10 13:31:43.879975'),
('x9oyhqlopjqp9f8q7akg9xmyauoae622', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uR68R:yRrqIFN1Qpk4jTBVRmPCFW5eePjRUueztjop-6CrOp8', '2025-06-16 12:28:11.710142'),
('xv7j8xbihur5bil32vowtur3sb8l8gvu', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uSA1s:cnF4HtNrj5EE3h92hzfib3qDLM604HtozaemAKkbqOE', '2025-06-19 10:49:48.690699'),
('xvtfv0ddqp5t9mh3dj1pjc96xhkhf4mo', '.eJxVjDkOwjAUBe_iGlnf8RpKes5g_cXGAZRIWSrE3SFSCmjfzLyXyritLW9LmfMg6qysOv1uhPwo4w7kjuNt0jyN6zyQ3hV90EVfJynPy-H-HTRc2rcGMJFC8E4KsrEpWhMBK1RKaMVzx31IHdbeGQBBQi8SwbkQOmJKQb0_1bM3ug:1uljgC:tVFP0CLLmsvIIzM_TNE8deQeE62Ni88P-sHvzzpQrjs', '2025-08-12 10:44:20.843048'),
('zrsrsv9b97sg4wiskdyq9dk46kq7lksz', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BzDBUqoYmpV0Z765NutDtf-_9l0i4rTVtvSxpYnERWpx-N8L8KG0HfMd2m2We27pMJHdFHrTLYebyvB7u30HFXr81BM_AYNHEoMmQBY2mROUZMSrFMQBZq11xI5XRejCZMDiIGjRZdRbvD804NzA:1uOvu2:AT-Q1SeXX1DletfFRAiruNpejdRVfEWG_VYHeVCEOdY', '2025-06-10 13:08:22.908460');

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
  `status` int(11) NOT NULL,
  `purpose` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`, `status`, `purpose`) VALUES
(1, 'Earnest Money (EM)', '2025-05-23', '2025-05-23', NULL, 1, NULL),
(2, 'Purchase Order (PO)', '2025-05-23', '2025-05-23', NULL, 1, NULL),
(3, 'Letter of Interest (LOI)', '2025-05-23', '2025-05-23', NULL, 1, NULL),
(4, 'Performance Guarantee (PG)', '2025-05-23', '2025-05-23', NULL, 1, NULL),
(5, 'Bank Guarantee (BG)', '2025-05-23', '2025-05-23', NULL, 1, NULL),
(6, 'Request For Proposal (RFP)', '2025-05-23', '2025-05-23', NULL, 1, NULL),
(7, 'Request For Quantity (RFQ)', '2025-05-23', '2025-05-23', NULL, 1, NULL),
(8, 'Correspondence', '2025-06-10', '2025-06-10', NULL, 1, 'Project'),
(9, 'GD (Import)', '2025-06-10', '2025-06-10', NULL, 1, 'Project'),
(10, 'Invoice', '2025-06-11', '2025-06-11', NULL, 1, 'Project'),
(11, 'Delivery Challan (DC)', '2025-06-11', '2025-06-11', NULL, 1, 'Project');

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
  `degree_doc` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `cv_doc` varchar(255) DEFAULT NULL,
  `expected_start_time` time(6) DEFAULT NULL,
  `expected_end_time` time(6) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `designation_id` bigint(20) DEFAULT NULL,
  `cnic_back` varchar(100) DEFAULT NULL,
  `cnic_front` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `eid`, `ename`, `eemail`, `econtact`, `cnic`, `date_of_joining`, `dob`, `qualification_id`, `deliverable_task`, `e_address`, `cv_doc`, `expected_start_time`, `expected_end_time`, `status`, `branch_id`, `department_id`, `designation_id`, `cnic_back`, `cnic_front`) VALUES
(1, 'emp-001', 'Ghayyur Naqvi', 'ghayyur@sigbl.com', '14234234', '42301678624681', '2021-02-23', '1985-03-23', 'Bachelor', 'No Task', 'Afnan Duplex', 'employee/1/cv/1_cv_20250523074914.pdf', NULL, NULL, 1, 1, 2, 1, NULL, NULL),
(2, 'emp-002', 'Mir Shafiq', 'mir.shafiq@sigbl.com', '13431243', '42301734927390', '2024-05-15', '1970-07-23', 'Bachelor', 'Sales', 'PECHS Karachi', 'employee/2/cv/2_cv_20250523090448.pdf', NULL, NULL, 1, 1, 3, 4, NULL, NULL),
(3, 'emp-003', 'Bilal Sheikh', 'bilal.sheikh@sigbl.com', '+923052872126', '4220150049565', '2024-07-08', '1996-03-05', 'Master', 'IT Sales, Quotations, Product Marketing, Tender preparation, E-Pads', 'House no R-1343, Lines Area, Gulshan-e-Zahoor, Saddar, Karachi', 'employee/None/cv/None_cv_20250611074349.pdf', NULL, NULL, 1, 1, 3, 10, NULL, NULL),
(4, 'emp-004', 'Muhammad Owais', 'm.owais@sigbl.com', '+923002282912', '1111111111111', '2018-01-01', '1976-01-24', 'Master', 'Stakeholder Management, Procurements,  Quotations, Tender Management, Sales', 'Kharadar, Saddar Town, Karachi', NULL, NULL, NULL, 1, 1, 7, 8, NULL, NULL),
(5, 'emp-005', 'Murshid Jamil', 'murshid.jamil@sigbl.com', '+923212636946', '1111111111111', '2023-10-03', '1980-01-01', 'Master', 'Sales, quotations, tenders, product marketing', 'PECHS 6, KARACHI', NULL, NULL, NULL, 1, 1, 3, 10, NULL, NULL),
(6, 'emp-006', 'Shafiq Ur Rehman Mir', 'mir.shafiq@sigbl.com', '+923008276393', '1111111111111', '2024-06-07', '1970-06-07', 'Bachelor', 'Corporate Sales, Team Management, Customer Serivces', 'House no 117-E, PECHS, Block 6', NULL, NULL, NULL, 1, 1, 3, 4, NULL, NULL);

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
(1, 1, 1, 4, 3),
(2, 0, 1, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `employee_target`
--

CREATE TABLE `employee_target` (
  `id` bigint(20) NOT NULL,
  `financial_year` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `sales_target` double DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `quarter_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Transit Insurance', 1),
(2, 'Monthly', 1),
(3, 'Yearly', 1);

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
  `gp_calculation` double DEFAULT NULL,
  `unit_selling_pkr` double DEFAULT NULL,
  `delivery_charges` double DEFAULT NULL,
  `total_selling_price` double DEFAULT NULL,
  `gst_amount` double DEFAULT NULL,
  `total_with_gst` double DEFAULT NULL,
  `gp_percentage` double DEFAULT NULL,
  `gp_amount` double DEFAULT NULL,
  `tax_adjusment` double DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `iso_master_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `sales_tax_category_id` bigint(20) NOT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `currency_rate` double DEFAULT NULL,
  `final_amt` double DEFAULT NULL,
  `per_kg_rate` double DEFAULT NULL,
  `tax_adjusment_amt` double DEFAULT NULL,
  `total_with_import` double DEFAULT NULL,
  `total_without_import` double DEFAULT NULL,
  `unit_cost_exchange_rate` double DEFAULT NULL,
  `unit_weight` double DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `item_spec_values_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iso_master`
--

CREATE TABLE `iso_master` (
  `id` bigint(20) NOT NULL,
  `version` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `delivery_date_committed` date DEFAULT NULL,
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
  `sales_promo` double DEFAULT NULL,
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
  `sales_person_id` bigint(20) DEFAULT NULL,
  `approved_by_id` bigint(20) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `delivery_type` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `tendor_id` bigint(20) NOT NULL,
  `advance_amount` double DEFAULT NULL,
  `advance_percentage` double DEFAULT NULL,
  `beneficiary_payorder` varchar(50) DEFAULT NULL,
  `bg_duration` double DEFAULT NULL,
  `bg_fc_amount` double DEFAULT NULL,
  `em_duration` double DEFAULT NULL,
  `em_fc_amount` double DEFAULT NULL,
  `fc_amount` double DEFAULT NULL,
  `fc_markup` double DEFAULT NULL,
  `is_approved` int(11) NOT NULL,
  `iso_no` varchar(50) DEFAULT NULL,
  `pg_duration` double DEFAULT NULL,
  `pg_fc_amount` double DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `sale_promo_percentage` double DEFAULT NULL,
  `total_delivery_charges` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issuing_authority`
--

CREATE TABLE `issuing_authority` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issuing_authority`
--

INSERT INTO `issuing_authority` (`id`, `full_name`, `short_name`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, 'Pasha', 'PA', '2025-06-04', '2025-06-04', NULL, 1),
(2, 'Pakistan Engineering Council', 'PEC', '2025-08-12', '2025-08-12', NULL, 1),
(3, 'International Standards Organization', 'ISO', '2025-08-12', '2025-08-12', NULL, 1),
(4, 'Lahore Chamber of Commerce', 'LCOC', '2025-08-12', '2025-08-12', NULL, 1),
(5, 'Pakistan Software Export Board (Pvt) Limited', 'PSEB', '2025-08-12', '2025-08-12', NULL, 1),
(6, 'Central Police Office, Karachi', 'CPO', '2025-08-12', '2025-08-12', NULL, 1),
(7, 'Lahore Bar Association', 'LBA', '2025-08-12', '2025-08-12', NULL, 1),
(8, 'Lenovo', 'Lenovo', '2025-08-12', '2025-08-12', NULL, 1),
(9, 'DELL', 'DELL', '2025-08-12', '2025-08-12', NULL, 1),
(10, 'Hewlett Packard', 'HP', '2025-08-12', '2025-08-12', NULL, 1),
(11, 'Huawei', 'Huawei', '2025-08-12', '2025-08-12', NULL, 1),
(12, 'DLink', 'DLink', '2025-08-12', '2025-08-12', NULL, 1),
(13, 'International Association of Marine Aids to Navigation and Lighthouse Authorities', 'IALA', '2025-08-12', '2025-08-12', NULL, 1),
(14, 'Attom Technology', 'Attom Tech', '2025-08-12', '2025-08-12', NULL, 1),
(15, 'Fauji Foundation', 'FF', '2025-08-12', '2025-08-12', NULL, 1),
(16, 'Fauji Fertilizer Company Limited', 'FFC', '2025-08-12', '2025-08-12', NULL, 1),
(17, 'ZKTECO', 'ZKTECO', '2025-08-12', '2025-08-12', NULL, 1),
(18, 'Hangzhou H3C Technologies Co., Ltd', 'H3C', '2025-08-12', '2025-08-12', NULL, 1),
(19, 'Sindh Revenue Board', 'SRB', '2025-08-12', '2025-08-12', NULL, 1),
(20, 'Karachi Chamber of Commerce & Industry', 'KCCI', '2025-08-12', '2025-08-12', NULL, 1),
(21, 'SolarWinds Corporation', 'SolarWinds', '2025-08-12', '2025-08-12', NULL, 1),
(22, 'DAHUA', 'DAHUA', '2025-08-12', '2025-08-12', NULL, 1),
(23, 'The  American Business Council of Pakistan', 'ABCP', '2025-08-12', '2025-08-12', NULL, 1),
(24, 'Ruijie Networks Co.  Ltd', 'Ruijie', '2025-08-12', '2025-08-12', NULL, 1),
(25, 'Synology', 'Synology', '2025-08-12', '2025-08-12', NULL, 1),
(26, 'Directorate General Defence Purchase', 'DGDP', '2025-08-12', '2025-08-12', NULL, 1),
(27, 'Trend Micro Incorporated', 'Trend Micro', '2025-08-12', '2025-08-12', NULL, 1),
(28, 'Eugene Valentinovich Kaspersky', 'Kaspersky', '2025-08-12', '2025-08-12', NULL, 1),
(29, 'Securities and Exchange Commision of Pakistan', 'SECP', '2025-08-28', '2025-08-28', NULL, 1),
(30, 'Kaspersky', 'Kaspersky', '2025-08-28', '2025-08-28', NULL, 1),
(31, 'Shenzen Anhang Technologies', 'SAT', '2025-08-28', '2025-08-28', NULL, 1);

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
  `unit_id` bigint(20) DEFAULT NULL,
  `maker` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `short_name`, `description`, `created_at`, `updated_at`, `deleted_at`, `status`, `category_id`, `unit_id`, `maker`, `model`) VALUES
(1, 'Server R760', 'R760', 'Check', '2025-08-07', '2025-08-07', NULL, 1, 13, 7, 'Dell', '2025');

-- --------------------------------------------------------

--
-- Table structure for table `item_spec_values`
--

CREATE TABLE `item_spec_values` (
  `id` bigint(20) NOT NULL,
  `specifications` varchar(1000) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `item_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journal_entry`
--

CREATE TABLE `journal_entry` (
  `id` bigint(20) NOT NULL,
  `amount` double DEFAULT NULL,
  `conversion_rate` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `cheque_no` varchar(100) DEFAULT NULL,
  `receive_person` varchar(100) DEFAULT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `ref_no` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `doc_path` varchar(100) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `coa_type` varchar(50) DEFAULT NULL,
  `current_status` varchar(50) DEFAULT NULL,
  `status_change_date` date DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `coaid_id` bigint(20) DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `payment_mode_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `lead_date` date DEFAULT NULL,
  `lead_type` varchar(100) DEFAULT NULL,
  `convert_date` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `sale_person_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `title`, `lead_date`, `lead_type`, `convert_date`, `created_at`, `updated_at`, `deleted_at`, `status`, `client_id`, `sale_person_id`) VALUES
(1, 'Replacement of Passage Markers at Ormara', '2021-11-01', 'Tender', NULL, '2025-05-23', '2025-05-23', NULL, 1, 1, 1),
(2, 'Procurement of Desktop Computers', '2025-04-10', 'Government Tender', NULL, '2025-05-23', '2025-05-23', NULL, 1, 2, 2),
(3, 'HP Color Laserjet Printers', '2025-03-18', 'Open Query', NULL, '2025-06-11', '2025-06-11', NULL, 1, 3, 3);

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

-- --------------------------------------------------------

--
-- Table structure for table `payroll_attendancerule`
--

CREATE TABLE `payroll_attendancerule` (
  `id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `late_deduction_type` varchar(20) NOT NULL,
  `late_deduction_amount` decimal(10,2) NOT NULL,
  `late_threshold_minutes` int(11) NOT NULL,
  `absent_deduction_type` varchar(20) NOT NULL,
  `absent_deduction_amount` decimal(10,2) NOT NULL,
  `overtime_rate_multiplier` decimal(3,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('07b963c0861b475c90f4273701322096', 'VIEW', 'PayrollRole', '0', 'Viewed payroll roles list', NULL, '', '2025-05-30 07:12:07.550086', '{}', 1),
('09315e8083ef443cb97a03e0876704f2', 'CREATE', 'SalaryComponent', '4', 'Created salary component: Late Arrival', NULL, '', '2025-05-30 07:06:55.470940', '{}', 1),
('109fa7d995b340cfadad7845d4dc8ebb', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-05-30 07:06:14.886834', '{}', 1),
('12e7765ef58343009eb04187db899ccd', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-05-30 07:03:00.077617', '{}', 1),
('1b87ad83003f486d8311f6effdd439c4', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-05-30 07:00:42.909582', '{}', 1),
('3da8f9b1593b4e32b83ef454c98cdde6', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-05-20 10:24:22.973744', '{}', 1),
('416e9f07973c4dceb6daeb9b1543f407', 'VIEW', 'EmployeeAttendance', '0', 'Viewed attendance records', NULL, '', '2025-05-30 07:11:38.125076', '{}', 1),
('498a484fd5134d3db95734c3272f24e8', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-05-30 07:12:43.425391', '{}', 1),
('4aaad36fe9184e11a771110eeee48667', 'CREATE', 'PayrollPeriod', '1', 'Created payroll period: May 2025 Salary', NULL, '', '2025-05-30 07:02:43.477488', '{}', 1),
('4c7e7c9888c648b1b12fbc38aee49863', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-05-30 07:05:19.694383', '{}', 1),
('6371476cf57a40908b03c2af6334f77c', 'VIEW', 'EmployeeSalaryStructure', '0', 'Viewed salary structures list', NULL, '', '2025-05-30 07:07:27.551262', '{}', 1),
('70e422eec4ec442fb52695996b71bbd6', 'CREATE', 'SalaryComponent', '2', 'Created salary component: House Allowance', NULL, '', '2025-05-30 07:05:47.606725', '{}', 1),
('79b2cf1f3cd64c20b2febb4b3db0ef8d', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-05-30 07:07:17.668140', '{}', 1),
('7b6c3d64b95842aba047eb00fece5d36', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-05-30 07:05:47.664781', '{}', 1),
('8535b27af8b04e0c82182d135467e092', 'VIEW', 'PayrollPeriod', '0', 'Viewed payroll periods list', NULL, '', '2025-05-30 07:02:43.656966', '{}', 1),
('a510a94603764c219f51c037ce123a3d', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-05-30 07:06:55.533870', '{}', 1),
('ba4ae50adcd04a40a04d090e3755ff8c', 'CREATE', 'SalaryComponent', '3', 'Created salary component: Medical Allowance', NULL, '', '2025-05-30 07:06:14.826455', '{}', 1),
('c1ae78b0ebbd4d3da7a52554f6d6ad67', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-05-30 07:06:34.494945', '{}', 1),
('d01ba66509c548da8f9f700f43e3e3e6', 'VIEW', 'EmployeeAttendance', '0', 'Generated attendance report', NULL, '', '2025-05-30 09:15:48.356646', '{}', 1),
('dc64c81d340f479ebc8f18d903cfe6ff', 'VIEW', 'SalaryComponent', '0', 'Viewed salary components list', NULL, '', '2025-05-30 07:02:50.435988', '{}', 1),
('e683a37583c34978b72a8954c78b5ccc', 'CREATE', 'SalaryComponent', '1', 'Created salary component: Basic Salary', NULL, '', '2025-05-30 07:05:19.556413', '{}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_employeeattendance`
--

CREATE TABLE `payroll_employeeattendance` (
  `id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date` date NOT NULL,
  `clock_in` time(6) DEFAULT NULL,
  `clock_out` time(6) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `overtime_hours` decimal(5,2) NOT NULL,
  `late_minutes` int(11) NOT NULL,
  `notes` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `employee_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_employeesalarystructure`
--

CREATE TABLE `payroll_employeesalarystructure` (
  `id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `basic_salary` decimal(12,2) NOT NULL,
  `effective_from` date NOT NULL,
  `effective_to` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `employee_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollcalculation`
--

CREATE TABLE `payroll_payrollcalculation` (
  `id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `gross_salary` decimal(12,2) NOT NULL,
  `total_deductions` decimal(12,2) NOT NULL,
  `net_salary` decimal(12,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `employee_id` bigint(20) NOT NULL,
  `period_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `is_active` tinyint(1) NOT NULL,
  `document_type` varchar(20) NOT NULL,
  `file` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `payroll_calculation_id` bigint(20) NOT NULL,
  `uploaded_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollpayment`
--

CREATE TABLE `payroll_payrollpayment` (
  `id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `payroll_calculation_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollperiod`
--

CREATE TABLE `payroll_payrollperiod` (
  `id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `period_type` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_payrollperiod`
--

INSERT INTO `payroll_payrollperiod` (`id`, `is_active`, `name`, `start_date`, `end_date`, `period_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'May 2025 Salary', '2025-05-01', '2025-05-31', 'MONTHLY', '2025-05-30 07:02:43.475797', '2025-05-30 07:02:43.475825');

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
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
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
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `order` int(10) UNSIGNED NOT NULL CHECK (`order` >= 0),
  `is_required` tinyint(1) NOT NULL,
  `timeout_days` int(10) UNSIGNED NOT NULL CHECK (`timeout_days` >= 0),
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `workflow_id` bigint(20) NOT NULL
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
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `component_type` varchar(20) NOT NULL,
  `is_taxable` tinyint(1) NOT NULL,
  `is_mandatory` tinyint(1) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_salarycomponent`
--

INSERT INTO `payroll_salarycomponent` (`id`, `is_active`, `name`, `code`, `component_type`, `is_taxable`, `is_mandatory`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Basic Salary', '001', 'EARNING', 1, 1, 'Basic Salary component', '2025-05-30 07:05:19.467469', '2025-05-30 07:05:19.467504'),
(2, 1, 'House Allowance', '002', 'EARNING', 1, 1, 'House Allowance', '2025-05-30 07:05:47.604596', '2025-05-30 07:05:47.604628'),
(3, 1, 'Medical Allowance', '003', 'EARNING', 1, 1, 'Medical Allowance', '2025-05-30 07:06:14.824928', '2025-05-30 07:06:14.824958'),
(4, 1, 'Late Arrival', '004', 'DEDUCTION', 1, 0, 'Late Arrival Deduction', '2025-05-30 07:06:55.469192', '2025-05-30 07:06:55.469223');

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
  `em_expire_date` date DEFAULT NULL,
  `em_doc` varchar(255) DEFAULT NULL,
  `pg_start_date` date DEFAULT NULL,
  `pg_end_date` date DEFAULT NULL,
  `pg_validity` date DEFAULT NULL,
  `pg_percentage` double DEFAULT NULL,
  `pg_amount` double DEFAULT NULL,
  `pg_instrument_no` varchar(100) DEFAULT NULL,
  `keywords` varchar(1000) DEFAULT NULL,
  `pg_doc` varchar(255) DEFAULT NULL,
  `project_doc` varchar(255) DEFAULT NULL,
  `project_status` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `sector` varchar(100) DEFAULT NULL,
  `po_scan_doc` varchar(255) DEFAULT NULL,
  `em_received` varchar(100) DEFAULT NULL,
  `em_receive_date` date DEFAULT NULL,
  `initiated_by` varchar(100) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `closing_doc` varchar(255) DEFAULT NULL,
  `closing_remarks` varchar(1000) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `lead_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `project_type_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `title`, `start_date`, `end_date`, `duration`, `amount`, `tax`, `total`, `advance_tax`, `advance_amount`, `earnest_money`, `em_instrument_no`, `em_expire_date`, `em_doc`, `pg_start_date`, `pg_end_date`, `pg_validity`, `pg_percentage`, `pg_amount`, `pg_instrument_no`, `keywords`, `pg_doc`, `project_doc`, `project_status`, `status`, `scope`, `sector`, `po_scan_doc`, `em_received`, `em_receive_date`, `initiated_by`, `team_id`, `close_date`, `closing_doc`, `closing_remarks`, `branch_id`, `client_id`, `country_id`, `lead_id`, `manager_id`, `project_type_id`) VALUES
(1, 'Procurement of Desktop Computers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 1, 2, NULL, 3),
(3, 'HP Color Laserjet Printers', '2025-04-18', '2025-04-22', 1, 116210, 18, NULL, NULL, NULL, NULL, 'None', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'None', 'HP, Laserjet, color printers, printers', NULL, NULL, 'Completed', 1, 'Local', 'Private', 'project/3/3_20250611121101.jpeg', 'None', NULL, 'Sale Person', NULL, '2025-06-11', 'project/3/3_20250611150024.pdf', 'Project completed successfully', 1, 3, 1, 3, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `project_document`
--

CREATE TABLE `project_document` (
  `id` bigint(20) NOT NULL,
  `doc_path` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `ref_no` varchar(100) DEFAULT NULL,
  `issuance_date` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `document_type_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `document_direction` varchar(100) DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `company_document_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_document`
--

INSERT INTO `project_document` (`id`, `doc_path`, `remarks`, `ref_no`, `issuance_date`, `created_at`, `updated_at`, `deleted_at`, `status`, `document_type_id`, `project_id`, `document_direction`, `received_date`, `company_document_id`) VALUES
(1, 'project/3/3_Invoice_20250611113015.pdf', 'Invoice sent to Descon', '850', '2025-04-22', '2025-06-11', '2025-06-11', NULL, 1, 10, 3, 'Outward', NULL, NULL),
(2, 'project/3/3_Delivery Challan (DC)_20250611113354.pdf', 'Deliver challan issued to Descon', '663', '2025-04-22', '2025-06-11', '2025-06-11', NULL, 1, 11, 3, '', '2025-04-25', NULL);

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
(1, 'Channel Buoys (Maritime)', 1),
(2, 'Software Development', 1),
(3, 'IT Equipments', 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `quotation_vendor_list`
--

CREATE TABLE `quotation_vendor_list` (
  `id` bigint(20) NOT NULL,
  `current_status` varchar(10) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `without_tax_amount` double DEFAULT NULL,
  `with_tax_amount` double DEFAULT NULL,
  `attached_file` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `vendor_quotation_master_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Lahore', 1),
(2, 'Karachi', 1),
(3, 'Islamabad', 1);

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
  `sale_date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `lead_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `quarter_id` bigint(20) DEFAULT NULL,
  `sale_person_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` bigint(20) NOT NULL,
  `fc_markup_percentage` double DEFAULT NULL,
  `em_fc_ratio` double DEFAULT NULL,
  `bg_fc_ratio` double DEFAULT NULL,
  `per_kg_rate` double DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `footer` varchar(1000) DEFAULT NULL,
  `header` varchar(1000) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `fc_markup_percentage`, `em_fc_ratio`, `bg_fc_ratio`, `per_kg_rate`, `created_at`, `updated_at`, `deleted_at`, `status`, `footer`, `header`, `logo`) VALUES
(1, 24, 1.5, 0.2, 40, NULL, NULL, NULL, 1, 'The Plaza, 3rd Floor, Office # 311, KDA Scheme # 5, Near II Talwar Clifton Karachi \\\\n\nPhone: 021-35308701-2 \\\\n\nEmail: info@sigbl.com\n', NULL, '/media/logo/image.png');

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

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` bigint(20) NOT NULL,
  `specs_name` varchar(255) DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `component_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specs`
--

INSERT INTO `specs` (`id`, `specs_name`, `data_type`, `created_at`, `updated_at`, `deleted_at`, `status`, `component_id`) VALUES
(1, 'Cores', 'number', NULL, NULL, NULL, 1, 1),
(2, 'Clock Speed (GHz)', 'number', NULL, NULL, NULL, 1, 1),
(3, 'Size (GB)', 'number', NULL, NULL, NULL, 1, 2),
(4, 'Type', 'select', NULL, NULL, NULL, 1, 2),
(5, 'Type', 'select', NULL, NULL, NULL, 1, 3),
(6, 'Capacity (TB)', 'number', NULL, NULL, NULL, 1, 3),
(7, 'Wattage', 'number', NULL, NULL, NULL, 1, 4),
(8, 'Speed', 'select', NULL, NULL, NULL, 1, 5),
(9, 'Model', 'text', NULL, NULL, NULL, 1, 6),
(10, 'Type', 'select', NULL, NULL, NULL, 1, 7),
(11, 'Technology', 'select', NULL, NULL, NULL, 1, 8),
(12, 'Speed (PPM)', 'number', NULL, NULL, NULL, 1, 8),
(13, 'Tray Capacity', 'number', NULL, NULL, NULL, 1, 9),
(14, 'Resolution (DPI)', 'number', NULL, NULL, NULL, 1, 10),
(15, 'ADF Capacity', 'number', NULL, NULL, NULL, 1, 11),
(16, 'Focal Length', 'text', NULL, NULL, NULL, 1, 12),
(17, 'Sensor Type', 'select', NULL, NULL, NULL, 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `spec_values`
--

CREATE TABLE `spec_values` (
  `id` bigint(20) NOT NULL,
  `spec_value` varchar(255) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `specs_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spec_values`
--

INSERT INTO `spec_values` (`id`, `spec_value`, `created_at`, `updated_at`, `deleted_at`, `status`, `specs_id`) VALUES
(1, 'DDR3', NULL, NULL, NULL, 1, 4),
(2, 'DDR4', NULL, NULL, NULL, 1, 4),
(3, 'DDR5', NULL, NULL, NULL, 1, 4),
(4, 'HDD', NULL, NULL, NULL, 1, 5),
(5, 'SSD', NULL, NULL, NULL, 1, 5),
(6, 'NVMe', NULL, NULL, NULL, 1, 5),
(7, '1 Gbps', NULL, NULL, NULL, 1, 8),
(8, '10 Gbps', NULL, NULL, NULL, 1, 8),
(9, 'RAID 0', NULL, NULL, NULL, 1, 10),
(10, 'RAID 1', NULL, NULL, NULL, 1, 10),
(11, 'RAID 5', NULL, NULL, NULL, 1, 10),
(12, 'Laser', NULL, NULL, NULL, 1, 11),
(13, 'Inkjet', NULL, NULL, NULL, 1, 11),
(14, 'Thermal', NULL, NULL, NULL, 1, 11),
(15, 'CMOS', NULL, NULL, NULL, 1, 17),
(16, 'CCD', NULL, NULL, NULL, 1, 17);

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

-- --------------------------------------------------------

--
-- Table structure for table `template_column`
--

CREATE TABLE `template_column` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tendor`
--

CREATE TABLE `tendor` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tendor_no` varchar(255) DEFAULT NULL,
  `isadpscheme` int(11) DEFAULT NULL,
  `adpscheme_no` varchar(100) DEFAULT NULL,
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
  `client_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Kilograms', NULL, NULL, NULL, 0),
(2, 'Litre', NULL, NULL, NULL, 1),
(3, 'KG', NULL, NULL, NULL, 1),
(4, 'Gram', NULL, NULL, NULL, 1),
(5, 'kgss', NULL, NULL, NULL, 0),
(6, 'KM', NULL, NULL, NULL, 1),
(7, 'Unit', NULL, NULL, NULL, 1),
(8, 'Job', NULL, NULL, NULL, 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `vendor_quotation_detail`
--

CREATE TABLE `vendor_quotation_detail` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `item_spec_values_id` bigint(20) DEFAULT NULL,
  `vendor_quotation_master_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_quotation_master`
--

CREATE TABLE `vendor_quotation_master` (
  `id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `ref_no` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `tendor_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'South', 1),
(2, 'North', 1);

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
  ADD KEY `bank_guaranty_bank_id_9ed7feb9_fk_bank_id` (`bank_id`),
  ADD KEY `bank_guaranty_project_id_6f026a2d_fk_project_id` (`project_id`);

--
-- Indexes for table `boq_items`
--
ALTER TABLE `boq_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boq_items_boq_master_id_3294e4d6_fk_boq_master_id` (`boq_master_id`),
  ADD KEY `boq_items_currency_id_73ec2288_fk_currency_id` (`currency_id`),
  ADD KEY `boq_items_heading_id_8daa5f86_fk_heading_id` (`heading_id`),
  ADD KEY `boq_items_item_id_c7c85ded_fk_item_id` (`item_id`),
  ADD KEY `boq_items_parent_id_a95be6dc_fk_boq_items_id` (`parent_id`),
  ADD KEY `boq_items_root_id_8fe31522_fk_boq_items_id` (`root_id`),
  ADD KEY `boq_items_sub_heading_id_41415c83_fk_sub_heading_id` (`sub_heading_id`),
  ADD KEY `boq_items_tendor_id_bc418b4e_fk_tendor_id` (`tendor_id`),
  ADD KEY `boq_items_unit_id_77d218e4_fk_unit_id` (`unit_id`);

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
  ADD KEY `branch_company_id_5ee217db_fk_company_id` (`company_id`),
  ADD KEY `branch_country_id_56c0b082_fk_country_id` (`country_id`),
  ADD KEY `branch_region_id_b980afd0_fk_region_id` (`region_id`),
  ADD KEY `branch_zone_id_1db5bb21_fk_zone_id` (`zone_id`),
  ADD KEY `branch_area_id_e1baf9ce_fk_area_id` (`area_id`);

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
  ADD KEY `chart_of_accounts_detail_type_id_f5f2ede3_fk_detail_type_id` (`detail_type_id`),
  ADD KEY `chart_of_accounts_parent_id_8b283fae_fk_chart_of_accounts_id` (`parent_id`),
  ADD KEY `chart_of_accounts_account_type_id_4ae7a867_fk_account_type_id` (`account_type_id`);

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
-- Indexes for table `company_document`
--
ALTER TABLE `company_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_document_issuing_authority_id_5283e2b4_fk_issuing_a` (`issuing_authority_id`);

--
-- Indexes for table `company_module`
--
ALTER TABLE `company_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`id`),
  ADD KEY `component_category_id_8f6aaef4_fk_category_id` (`category_id`);

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
  ADD UNIQUE KEY `employee_eid_00fa3a12_uniq` (`eid`),
  ADD KEY `employee_branch_id_fabda6fb_fk_branch_id` (`branch_id`),
  ADD KEY `employee_department_id_4306dd33_fk_department_id` (`department_id`),
  ADD KEY `employee_designation_id_073f8843_fk_designation_id` (`designation_id`);

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
  ADD KEY `employment_record_employee_id_9320d5bc_fk_employee_id` (`employee_id`);

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
  ADD KEY `iso_detail_sales_tax_category_id_806987da_fk_tax_id` (`sales_tax_category_id`),
  ADD KEY `iso_detail_item_spec_values_id_4fd22a91_fk_item_spec_values_id` (`item_spec_values_id`);

--
-- Indexes for table `iso_master`
--
ALTER TABLE `iso_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iso_no` (`iso_no`),
  ADD KEY `iso_master_client_id_75ea8d34_fk_client_id` (`client_id`),
  ADD KEY `iso_master_tendor_id_d634f829_fk_tendor_id` (`tendor_id`),
  ADD KEY `iso_master_approved_by_id_75f62d4b` (`approved_by_id`),
  ADD KEY `iso_master_sales_person_id_5f2f0f66` (`sales_person_id`);

--
-- Indexes for table `issuing_authority`
--
ALTER TABLE `issuing_authority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_category_id_03b07192_fk_category_id` (`category_id`),
  ADD KEY `item_unit_id_3876106f_fk_unit_id` (`unit_id`);

--
-- Indexes for table `item_spec_values`
--
ALTER TABLE `item_spec_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_spec_values_item_id_438af95c_fk_item_id` (`item_id`);

--
-- Indexes for table `journal_entry`
--
ALTER TABLE `journal_entry`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref_no` (`ref_no`),
  ADD KEY `journal_entry_bank_id_e6729857_fk_bank_id` (`bank_id`),
  ADD KEY `journal_entry_branch_id_b685678a_fk_branch_id` (`branch_id`),
  ADD KEY `journal_entry_coaid_id_86a100eb_fk_chart_of_accounts_id` (`coaid_id`),
  ADD KEY `journal_entry_currency_id_fd3ea6bd_fk_currency_id` (`currency_id`),
  ADD KEY `journal_entry_payment_mode_id_6d5e0e24_fk_payment_mode_id` (`payment_mode_id`),
  ADD KEY `journal_entry_project_id_de18606c_fk_project_id` (`project_id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_client_id_b29eb43b_fk_client_id` (`client_id`),
  ADD KEY `leads_sale_person_id_c86f239a_fk_employee_id` (`sale_person_id`);

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
  ADD KEY `project_client_id_0696401f_fk_client_id` (`client_id`),
  ADD KEY `project_country_id_1ea674e9_fk_country_id` (`country_id`),
  ADD KEY `project_lead_id_b33b20d2_fk_leads_id` (`lead_id`),
  ADD KEY `project_manager_id_3167996f_fk_employee_id` (`manager_id`);

--
-- Indexes for table `project_document`
--
ALTER TABLE `project_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_document_document_type_id_86e285f1_fk_document_type_id` (`document_type_id`),
  ADD KEY `project_document_project_id_ae197ff4_fk_project_id` (`project_id`),
  ADD KEY `project_document_company_document_id_b6a02965_fk_company_d` (`company_document_id`);

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
-- Indexes for table `quotation_vendor_list`
--
ALTER TABLE `quotation_vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_vendor_list_vendor_id_98b3f0f8_fk_vendor_id` (`vendor_id`),
  ADD KEY `quotation_vendor_lis_vendor_quotation_mas_7122f957_fk_vendor_qu` (`vendor_quotation_master_id`);

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
  ADD KEY `sales_lead_id_fc35c250_fk_leads_id` (`lead_id`),
  ADD KEY `sales_project_id_25cfbde0_fk_project_id` (`project_id`),
  ADD KEY `sales_quarter_id_b8bf1f54_fk_quarters_id` (`quarter_id`),
  ADD KEY `sales_sale_person_id_2c874c2c_fk_employee_id` (`sale_person_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skills_employee_id_6086f136_fk_employee_id` (`employee_id`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specs_component_id_c825f014_fk_component_id` (`component_id`);

--
-- Indexes for table `spec_values`
--
ALTER TABLE `spec_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spec_values_specs_id_4a610803_fk_specs_id` (`specs_id`);

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
  ADD KEY `tendor_client_id_0e24ec9b_fk_client_id` (`client_id`),
  ADD KEY `tendor_department_id_e10c77e4_fk_department_id` (`department_id`);

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
-- Indexes for table `vendor_quotation_detail`
--
ALTER TABLE `vendor_quotation_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_quotation_detail_item_id_3b035296_fk_item_id` (`item_id`),
  ADD KEY `vendor_quotation_det_item_spec_values_id_5bdb0b19_fk_item_spec` (`item_spec_values_id`),
  ADD KEY `vendor_quotation_det_vendor_quotation_mas_f7988001_fk_vendor_qu` (`vendor_quotation_master_id`);

--
-- Indexes for table `vendor_quotation_master`
--
ALTER TABLE `vendor_quotation_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_quotation_master_tendor_id_b95c330a_fk_tendor_id` (`tendor_id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_guaranty`
--
ALTER TABLE `bank_guaranty`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `boq_items`
--
ALTER TABLE `boq_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `boq_master`
--
ALTER TABLE `boq_master`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `certifications`
--
ALTER TABLE `certifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_document`
--
ALTER TABLE `company_document`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `company_module`
--
ALTER TABLE `company_module`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `component`
--
ALTER TABLE `component`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv_template`
--
ALTER TABLE `cv_template`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `detail_type`
--
ALTER TABLE `detail_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_project`
--
ALTER TABLE `employee_project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_target`
--
ALTER TABLE `employee_target`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employment_record`
--
ALTER TABLE `employment_record`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `heading`
--
ALTER TABLE `heading`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurance_detail`
--
ALTER TABLE `insurance_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurance_type`
--
ALTER TABLE `insurance_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `iso_detail`
--
ALTER TABLE `iso_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iso_master`
--
ALTER TABLE `iso_master`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issuing_authority`
--
ALTER TABLE `issuing_authority`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item_spec_values`
--
ALTER TABLE `item_spec_values`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal_entry`
--
ALTER TABLE `journal_entry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `liquidity_damages`
--
ALTER TABLE `liquidity_damages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_attendancerule`
--
ALTER TABLE `payroll_attendancerule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_employeeattendance`
--
ALTER TABLE `payroll_employeeattendance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_employeesalarystructure`
--
ALTER TABLE `payroll_employeesalarystructure`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollcalculation`
--
ALTER TABLE `payroll_payrollcalculation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollcomponentdetail`
--
ALTER TABLE `payroll_payrollcomponentdetail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrolldocument`
--
ALTER TABLE `payroll_payrolldocument`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollpayment`
--
ALTER TABLE `payroll_payrollpayment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollperiod`
--
ALTER TABLE `payroll_payrollperiod`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_document`
--
ALTER TABLE `project_document`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_type`
--
ALTER TABLE `project_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quarters`
--
ALTER TABLE `quarters`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_vendor_list`
--
ALTER TABLE `quotation_vendor_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specs`
--
ALTER TABLE `specs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `spec_values`
--
ALTER TABLE `spec_values`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_heading`
--
ALTER TABLE `sub_heading`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template_column`
--
ALTER TABLE `template_column`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tendor`
--
ALTER TABLE `tendor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_quotation_detail`
--
ALTER TABLE `vendor_quotation_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_quotation_master`
--
ALTER TABLE `vendor_quotation_master`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `bank_guaranty_bank_id_9ed7feb9_fk_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`),
  ADD CONSTRAINT `bank_guaranty_project_id_6f026a2d_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

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
-- Constraints for table `company_document`
--
ALTER TABLE `company_document`
  ADD CONSTRAINT `company_document_issuing_authority_id_5283e2b4_fk_issuing_a` FOREIGN KEY (`issuing_authority_id`) REFERENCES `issuing_authority` (`id`);

--
-- Constraints for table `component`
--
ALTER TABLE `component`
  ADD CONSTRAINT `component_category_id_8f6aaef4_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

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
  ADD CONSTRAINT `employment_record_employee_id_9320d5bc_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

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
  ADD CONSTRAINT `iso_detail_item_spec_values_id_4fd22a91_fk_item_spec_values_id` FOREIGN KEY (`item_spec_values_id`) REFERENCES `item_spec_values` (`id`),
  ADD CONSTRAINT `iso_detail_sales_tax_category_id_806987da_fk_tax_id` FOREIGN KEY (`sales_tax_category_id`) REFERENCES `tax` (`id`);

--
-- Constraints for table `iso_master`
--
ALTER TABLE `iso_master`
  ADD CONSTRAINT `iso_master_approved_by_id_75f62d4b_fk_employee_id` FOREIGN KEY (`approved_by_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `iso_master_client_id_75ea8d34_fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `iso_master_sales_person_id_5f2f0f66_fk_employee_id` FOREIGN KEY (`sales_person_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `iso_master_tendor_id_d634f829_fk_tendor_id` FOREIGN KEY (`tendor_id`) REFERENCES `tendor` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_category_id_03b07192_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `item_unit_id_3876106f_fk_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`);

--
-- Constraints for table `item_spec_values`
--
ALTER TABLE `item_spec_values`
  ADD CONSTRAINT `item_spec_values_item_id_438af95c_fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

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
  ADD CONSTRAINT `project_document_company_document_id_b6a02965_fk_company_d` FOREIGN KEY (`company_document_id`) REFERENCES `company_document` (`id`),
  ADD CONSTRAINT `project_document_document_type_id_86e285f1_fk_document_type_id` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`),
  ADD CONSTRAINT `project_document_project_id_ae197ff4_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Constraints for table `quotation_vendor_list`
--
ALTER TABLE `quotation_vendor_list`
  ADD CONSTRAINT `quotation_vendor_lis_vendor_quotation_mas_7122f957_fk_vendor_qu` FOREIGN KEY (`vendor_quotation_master_id`) REFERENCES `vendor_quotation_master` (`id`),
  ADD CONSTRAINT `quotation_vendor_list_vendor_id_98b3f0f8_fk_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`);

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
-- Constraints for table `specs`
--
ALTER TABLE `specs`
  ADD CONSTRAINT `specs_component_id_c825f014_fk_component_id` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`);

--
-- Constraints for table `spec_values`
--
ALTER TABLE `spec_values`
  ADD CONSTRAINT `spec_values_specs_id_4a610803_fk_specs_id` FOREIGN KEY (`specs_id`) REFERENCES `specs` (`id`);

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

--
-- Constraints for table `vendor_quotation_detail`
--
ALTER TABLE `vendor_quotation_detail`
  ADD CONSTRAINT `vendor_quotation_det_item_spec_values_id_5bdb0b19_fk_item_spec` FOREIGN KEY (`item_spec_values_id`) REFERENCES `item_spec_values` (`id`),
  ADD CONSTRAINT `vendor_quotation_det_vendor_quotation_mas_f7988001_fk_vendor_qu` FOREIGN KEY (`vendor_quotation_master_id`) REFERENCES `vendor_quotation_master` (`id`),
  ADD CONSTRAINT `vendor_quotation_detail_item_id_3b035296_fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

--
-- Constraints for table `vendor_quotation_master`
--
ALTER TABLE `vendor_quotation_master`
  ADD CONSTRAINT `vendor_quotation_master_tendor_id_b95c330a_fk_tendor_id` FOREIGN KEY (`tendor_id`) REFERENCES `tendor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
