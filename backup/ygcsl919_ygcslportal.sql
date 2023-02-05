-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2023 at 01:00 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ygcsl919_ygcslportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni_events`
--

CREATE TABLE `alumni_events` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `event_notification_message` text NOT NULL,
  `show_onwebsite` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_students`
--

CREATE TABLE `alumni_students` (
  `id` int(11) NOT NULL,
  `current_email` varchar(255) NOT NULL,
  `current_phone` varchar(255) NOT NULL,
  `occupation` text NOT NULL,
  `address` text NOT NULL,
  `student_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attendence_type`
--

CREATE TABLE `attendence_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `key_value` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendence_type`
--

INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '2016-06-23 18:11:37', '0000-00-00'),
(2, 'Late With Excuse', '<b class=\"text text-warning\">E</b>', 'no', '2018-05-29 08:19:48', '0000-00-00'),
(3, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '2016-06-23 18:12:28', '0000-00-00'),
(4, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '2016-10-11 11:35:40', '0000-00-00'),
(5, 'Holiday', 'H', 'yes', '2016-10-11 11:35:01', '0000-00-00'),
(6, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2016-06-23 18:12:28', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `isbn_no` varchar(100) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `rack_no` varchar(100) NOT NULL,
  `publish` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `perunitcost` float(10,2) DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `available` varchar(10) DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` int(11) UNSIGNED NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `duereturn_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `is_returned` int(11) DEFAULT 0,
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE `captcha` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `captcha`
--

INSERT INTO `captcha` (`id`, `name`, `status`, `created_at`) VALUES
(1, 'userlogin', 0, '2021-01-19 08:10:29'),
(2, 'login', 0, '2021-01-19 08:10:31'),
(3, 'admission', 0, '2021-11-30 09:58:15'),
(4, 'complain', 1, '2021-07-31 18:19:14'),
(5, 'contact_us', 1, '2021-07-31 18:19:15');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Undergraduates', 'no', '2021-08-01 05:41:47', NULL),
(2, 'HND Level', 'no', '2021-08-01 05:41:56', NULL),
(3, 'Diploma Level', 'no', '2021-08-01 05:42:06', NULL),
(4, 'Certificate Level', 'no', '2021-08-01 05:42:14', NULL),
(5, 'Online Courses', 'no', '2021-08-01 05:42:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `certificate_name` varchar(100) NOT NULL,
  `certificate_text` text NOT NULL,
  `left_header` varchar(100) NOT NULL,
  `center_header` varchar(100) NOT NULL,
  `right_header` varchar(100) NOT NULL,
  `left_footer` varchar(100) NOT NULL,
  `right_footer` varchar(100) NOT NULL,
  `center_footer` varchar(100) NOT NULL,
  `background_image` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `created_for` tinyint(1) NOT NULL COMMENT '1 = staff, 2 = students',
  `status` tinyint(1) NOT NULL,
  `header_height` int(11) NOT NULL,
  `content_height` int(11) NOT NULL,
  `footer_height` int(11) NOT NULL,
  `content_width` int(11) NOT NULL,
  `enable_student_image` tinyint(1) NOT NULL COMMENT '0=no,1=yes',
  `enable_image_height` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_at`, `updated_at`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_student_image`, `enable_image_height`) VALUES
(1, 'Diploma in Technology', 'This is certify that <b>[name]</b> has born on [dob]  <br> and have following details [present_address] [guardian] [created_at] [admission_no] [roll_no] [class] [section] [gender] [admission_date]  .<br>We wish best of luck for future endeavors.', 'Reff. No.....1111111.........', 'To Whomever It May Concern', 'Date: _10__/_10__/__2021__', '.................................<br>admin', '.................................<br>principal', '.................................<br>admin', '135387158_203419931476743_3840311470527943364_n.jpg', '2021-07-31 20:15:23', '0000-00-00', 2, 1, 360, 400, 480, 810, 1, 230);

-- --------------------------------------------------------

--
-- Table structure for table `chat_connections`
--

CREATE TABLE `chat_connections` (
  `id` int(11) NOT NULL,
  `chat_user_one` int(11) NOT NULL,
  `chat_user_two` int(11) NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_connections`
--

INSERT INTO `chat_connections` (`id`, `chat_user_one`, `chat_user_two`, `ip`, `time`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL, '2021-07-31 18:42:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `chat_user_id` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `time` int(11) NOT NULL,
  `is_first` int(1) DEFAULT 0,
  `is_read` int(1) NOT NULL DEFAULT 0,
  `chat_connection_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `message`, `chat_user_id`, `ip`, `time`, `is_first`, `is_read`, `chat_connection_id`, `created_at`) VALUES
(1, 'you are now connected on chat', 2, '', 0, 1, 0, 1, NULL),
(2, 'Hello', 2, '', 0, 0, 0, 1, '2021-08-01 00:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `chat_users`
--

CREATE TABLE `chat_users` (
  `id` int(11) NOT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `create_staff_id` int(11) DEFAULT NULL,
  `create_student_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_users`
--

INSERT INTO `chat_users` (`id`, `user_type`, `staff_id`, `student_id`, `create_staff_id`, `create_student_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'staff', 1, NULL, NULL, NULL, 0, '2021-07-31 18:42:40', NULL),
(2, 'staff', 2, NULL, 1, NULL, 0, '2021-07-31 18:42:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES
(16, 'test', 'no', '2023-01-19 14:14:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_sections`
--

CREATE TABLE `class_sections` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_sections`
--

INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'no', '2021-08-01 18:16:05', NULL),
(2, 1, 2, 'no', '2021-08-01 18:16:05', NULL),
(3, 1, 3, 'no', '2021-08-01 18:16:05', NULL),
(4, 1, 4, 'no', '2021-08-01 18:16:05', NULL),
(5, 1, 5, 'no', '2021-08-01 18:16:05', NULL),
(6, 1, 6, 'no', '2021-08-01 18:16:05', NULL),
(7, 2, 1, 'no', '2021-08-01 18:16:23', NULL),
(8, 2, 2, 'no', '2021-08-01 18:16:23', NULL),
(9, 2, 3, 'no', '2021-08-01 18:16:23', NULL),
(10, 2, 4, 'no', '2021-08-01 18:16:23', NULL),
(11, 2, 5, 'no', '2021-08-01 18:16:23', NULL),
(12, 2, 6, 'no', '2021-08-01 18:16:23', NULL),
(13, 3, 1, 'no', '2021-08-01 18:16:40', NULL),
(14, 3, 2, 'no', '2021-08-01 18:16:40', NULL),
(15, 3, 3, 'no', '2021-08-01 18:16:40', NULL),
(16, 3, 4, 'no', '2021-08-01 18:16:40', NULL),
(17, 3, 5, 'no', '2021-08-01 18:16:40', NULL),
(18, 3, 6, 'no', '2021-08-01 18:16:40', NULL),
(19, 4, 1, 'no', '2021-08-01 18:16:55', NULL),
(20, 4, 2, 'no', '2021-08-01 18:16:55', NULL),
(21, 4, 3, 'no', '2021-08-01 18:16:55', NULL),
(22, 4, 4, 'no', '2021-08-01 18:16:55', NULL),
(23, 4, 5, 'no', '2021-08-01 18:16:55', NULL),
(24, 4, 6, 'no', '2021-08-01 18:16:55', NULL),
(25, 5, 1, 'no', '2021-08-01 18:17:08', NULL),
(26, 5, 2, 'no', '2021-08-01 18:17:08', NULL),
(27, 5, 3, 'no', '2021-08-01 18:17:08', NULL),
(28, 5, 4, 'no', '2021-08-01 18:17:08', NULL),
(29, 5, 5, 'no', '2021-08-01 18:17:08', NULL),
(30, 5, 6, 'no', '2021-08-01 18:17:08', NULL),
(31, 6, 1, 'no', '2021-08-01 18:17:22', NULL),
(32, 6, 2, 'no', '2021-08-01 18:17:22', NULL),
(33, 6, 3, 'no', '2021-08-01 18:17:22', NULL),
(34, 6, 4, 'no', '2021-08-01 18:17:22', NULL),
(35, 6, 5, 'no', '2021-08-01 18:17:22', NULL),
(36, 6, 6, 'no', '2021-08-01 18:17:22', NULL),
(37, 7, 1, 'no', '2021-08-01 18:17:39', NULL),
(38, 7, 2, 'no', '2021-08-01 18:17:39', NULL),
(39, 7, 3, 'no', '2021-08-01 18:17:39', NULL),
(40, 8, 1, 'no', '2021-08-01 18:17:47', NULL),
(41, 8, 2, 'no', '2021-08-01 18:17:47', NULL),
(42, 8, 3, 'no', '2021-08-01 18:17:47', NULL),
(43, 9, 1, 'no', '2021-08-01 18:18:00', NULL),
(44, 9, 2, 'no', '2021-08-01 18:18:00', NULL),
(45, 9, 3, 'no', '2021-08-01 18:18:00', NULL),
(46, 9, 4, 'no', '2021-08-01 18:18:00', NULL),
(47, 9, 5, 'no', '2021-08-01 18:18:00', NULL),
(48, 10, 1, 'no', '2021-08-01 18:18:07', NULL),
(49, 10, 2, 'no', '2021-08-01 18:18:07', NULL),
(50, 10, 3, 'no', '2021-08-01 18:18:07', NULL),
(52, 2, 7, 'no', '2021-08-29 19:32:21', NULL),
(53, 2, 8, 'no', '2021-08-29 19:32:21', NULL),
(54, 2, 9, 'no', '2021-08-29 19:32:57', NULL),
(55, 2, 10, 'no', '2021-08-29 19:32:57', NULL),
(68, 2, 11, 'no', '2022-01-21 05:53:21', NULL),
(69, 2, 12, 'no', '2022-01-21 05:53:21', NULL),
(70, 16, 1, 'no', '2023-01-19 14:14:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_teacher`
--

CREATE TABLE `class_teacher` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_teacher`
--

INSERT INTO `class_teacher` (`id`, `class_id`, `staff_id`, `section_id`, `session_id`) VALUES
(1, 11, 8, 1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL,
  `complaint_type` varchar(255) NOT NULL,
  `source` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `action_taken` varchar(200) NOT NULL,
  `assigned` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `complaint_type`
--

INSERT INTO `complaint_type` (`id`, `complaint_type`, `description`, `created_at`) VALUES
(1, 'Facilities', '', '2021-11-28 16:26:08'),
(2, 'Teacher', '', '2021-11-28 16:26:16'),
(3, 'Personal', '', '2021-11-28 16:26:26'),
(4, 'Lessons', '', '2021-11-28 16:26:32');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_public` varchar(10) DEFAULT 'No',
  `class_id` int(11) DEFAULT NULL,
  `cls_sec_id` int(10) NOT NULL,
  `file` varchar(250) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content_for`
--

CREATE TABLE `content_for` (
  `id` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `belong_to` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `bs_column` int(10) DEFAULT NULL,
  `validation` int(11) DEFAULT 0,
  `field_values` text DEFAULT NULL,
  `show_table` varchar(100) DEFAULT NULL,
  `visible_on_table` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `belong_to`, `type`, `bs_column`, `validation`, `field_values`, `show_table`, `visible_on_table`, `weight`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Student Counsellor', 'students', 'select', 4, 1, 'Yeshika, Chamudi, Sean, Jithmi,Shashini, Others', NULL, 1, NULL, 0, '2022-01-24 10:13:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL,
  `belong_table_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `field_value` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`, `updated_at`) VALUES
(1, 850, 1, 'Shashini', '2022-01-28 06:25:58', NULL),
(2, 851, 1, 'Shashini', '2022-01-28 06:29:40', NULL),
(4, 853, 1, 'Yeshika', '2022-01-28 11:28:21', NULL),
(5, 854, 1, 'Yeshika', '2022-01-29 06:18:18', NULL),
(6, 855, 1, 'Yeshika', '2022-01-29 06:39:57', NULL),
(7, 856, 1, 'Yeshika', '2022-01-29 06:50:28', NULL),
(8, 857, 1, 'Yeshika', '2022-01-29 06:52:57', NULL),
(11, 859, 1, 'Shashini', '2022-01-29 10:01:11', NULL),
(16, 861, 1, 'Shashini', '2022-01-31 03:57:29', NULL),
(17, 862, 1, 'Jithmi', '2022-01-31 10:44:03', NULL),
(18, 863, 1, 'Chamudi', '2022-01-31 15:14:59', NULL),
(19, 864, 1, 'Chamudi', '2022-01-31 15:19:11', NULL),
(20, 865, 1, 'Chamudi', '2022-01-31 15:22:26', NULL),
(21, 866, 1, 'Chamudi', '2022-01-31 15:29:45', NULL),
(22, 784, 1, 'Shashini', '2022-02-02 05:10:06', NULL),
(23, 785, 1, 'Shashini', '2022-02-02 05:10:35', NULL),
(24, 779, 1, 'Shashini', '2022-02-02 05:10:59', NULL),
(25, 867, 1, 'Shashini', '2022-02-05 06:57:18', NULL),
(26, 815, 1, 'Shashini', '2022-02-09 03:27:18', NULL),
(28, 868, 1, 'Chamudi', '2022-02-10 05:57:12', NULL),
(29, 869, 1, 'Shashini', '2022-02-11 05:48:07', NULL),
(30, 870, 1, 'Shashini', '2022-02-18 05:13:43', NULL),
(31, 871, 1, 'Shashini', '2022-02-18 05:15:42', NULL),
(32, 872, 1, 'Shashini', '2022-02-18 05:19:43', NULL),
(33, 873, 1, 'Shashini', '2022-02-18 05:25:43', NULL),
(34, 874, 1, 'Shashini', '2022-02-18 05:29:39', NULL),
(35, 875, 1, 'Chamudi', '2022-02-22 06:17:38', NULL),
(36, 876, 1, 'Yeshika', '2022-02-22 06:40:04', NULL),
(37, 877, 1, 'Chamudi', '2022-02-22 08:29:55', NULL),
(38, 878, 1, 'Chamudi', '2022-02-22 08:34:47', NULL),
(39, 879, 1, 'Yeshika', '2022-02-22 08:38:39', NULL),
(40, 880, 1, 'Chamudi', '2022-02-23 03:53:06', NULL),
(41, 881, 1, 'Chamudi', '2022-02-23 03:57:39', NULL),
(42, 882, 1, 'Chamudi', '2022-02-23 04:08:23', NULL),
(43, 883, 1, 'Chamudi', '2022-02-23 04:13:22', NULL),
(44, 884, 1, 'Shashini', '2022-02-24 04:34:51', NULL),
(45, 885, 1, 'Shashini', '2022-02-24 04:39:04', NULL),
(46, 886, 1, 'Shashini', '2022-02-24 04:41:53', NULL),
(47, 887, 1, 'Shashini', '2022-02-24 04:44:49', NULL),
(48, 888, 1, 'Shashini', '2022-02-24 06:04:50', NULL),
(49, 889, 1, 'Shashini', '2022-02-24 06:08:40', NULL),
(50, 890, 1, 'Chamudi', '2022-02-26 05:59:02', NULL),
(51, 891, 1, 'Shashini', '2022-02-25 09:39:27', NULL),
(52, 892, 1, 'Chamudi', '2022-02-26 06:03:26', NULL),
(55, 308, 1, 'Chamudi', '2022-02-28 03:50:28', NULL),
(56, 893, 1, 'Yeshika', '2022-02-28 03:53:07', NULL),
(57, 894, 1, 'Chamudi', '2022-02-28 03:54:33', NULL),
(58, 895, 1, 'Yeshika', '2022-02-28 04:00:13', NULL),
(59, 896, 1, 'Shashini', '2022-03-01 03:22:03', NULL),
(60, 897, 1, 'Shashini', '2022-03-01 03:27:37', NULL),
(61, 898, 1, 'Shashini', '2022-03-01 03:30:28', NULL),
(62, 899, 1, 'Chamudi', '2022-03-01 03:31:06', NULL),
(63, 900, 1, 'Shashini', '2022-03-01 03:35:20', NULL),
(64, 901, 1, 'Chamudi', '2022-03-01 03:35:54', NULL),
(65, 902, 1, 'Shashini', '2022-03-01 03:37:27', NULL),
(66, 903, 1, 'Chamudi', '2022-03-01 03:45:04', NULL),
(67, 904, 1, 'Yeshika', '2022-03-01 04:12:29', NULL),
(68, 905, 1, 'Yeshika', '2022-03-01 06:29:59', NULL),
(69, 906, 1, 'Yeshika', '2022-03-02 09:52:56', NULL),
(73, 910, 1, 'Chamudi', '2022-03-03 10:59:23', NULL),
(74, 911, 1, 'Yeshika', '2022-03-04 06:44:42', NULL),
(78, 915, 1, 'Sean', '2022-03-25 05:09:06', NULL),
(79, 916, 1, 'Sean', '2022-03-25 05:09:28', NULL),
(80, 917, 1, 'Sean', '2022-03-25 05:10:41', NULL),
(81, 918, 1, 'Sean', '2022-03-25 05:11:27', NULL),
(82, 919, 1, 'Yeshika', '2022-03-25 05:12:34', NULL),
(83, 920, 1, 'Yeshika', '2022-03-25 05:13:23', NULL),
(84, 921, 1, 'Yeshika', '2022-03-25 05:14:10', NULL),
(85, 922, 1, 'Chamudi', '2022-03-26 06:07:51', NULL),
(87, 924, 1, 'Sean', '2022-05-22 09:35:19', NULL),
(88, 925, 1, 'Yeshika', '2023-01-18 09:51:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES
(1, 'Administrative Department', 'yes'),
(2, 'Account Department', 'yes'),
(3, 'Academic Department', 'yes'),
(4, 'Student Relationals', 'yes'),
(5, 'Marketing', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `disable_reason`
--

CREATE TABLE `disable_reason` (
  `id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `disable_reason`
--

INSERT INTO `disable_reason` (`id`, `reason`, `created_at`) VALUES
(1, 'Payment Issue', '2021-08-01 05:41:00'),
(2, 'Disciplinary Action', '2021-08-01 05:41:14'),
(3, 'Course Finished', '2021-08-01 05:41:24');

-- --------------------------------------------------------

--
-- Table structure for table `dispatch_receive`
--

CREATE TABLE `dispatch_receive` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `smtp_auth` varchar(10) NOT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `smtp_auth`, `is_active`, `created_at`) VALUES
(1, 'smtp', 'smtp.gmail.com', '587', 'portal.ygc@gmail.com', 'YGCofficial@202!', 'tls', 'false', 'yes', '2022-03-24 06:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `reference` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `note` text NOT NULL,
  `source` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `assigned` varchar(100) NOT NULL,
  `class` int(11) NOT NULL,
  `no_of_child` varchar(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`id`, `name`, `contact`, `address`, `reference`, `date`, `description`, `follow_up_date`, `note`, `source`, `email`, `assigned`, `class`, `no_of_child`, `status`) VALUES
(1, 'exa', '07263436542', 'sadfasdasd', '', '2021-11-29', 'sdasdasdasd', '2021-11-29', 'sdasdsadasdas', 'Facebook', 'ceso@yorkgraduatecampus.com', '', 11, '01', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_type`
--

CREATE TABLE `enquiry_type` (
  `id` int(11) NOT NULL,
  `enquiry_type` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_title` varchar(200) NOT NULL,
  `event_description` varchar(300) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `sesion_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_groups`
--

CREATE TABLE `exam_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `exam_type` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_groups`
--

INSERT INTO `exam_groups` (`id`, `name`, `exam_type`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Final Ex', 'basic_system', '', 0, '2022-03-21 09:04:19', NULL),
(2, 'exam101', 'basic_system', 'Exam 1', 0, '2022-03-21 09:06:02', NULL),
(3, 'English Aptitude Test', 'basic_system', 'This is Only a Pass-Fail Test without Grading', 0, '2022-03-21 12:19:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_class_batch_exams`
--

CREATE TABLE `exam_group_class_batch_exams` (
  `id` int(11) NOT NULL,
  `exam` varchar(250) DEFAULT NULL,
  `session_id` int(10) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `use_exam_roll_no` int(1) NOT NULL DEFAULT 1,
  `is_publish` int(1) DEFAULT 0,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_group_class_batch_exams`
--

INSERT INTO `exam_group_class_batch_exams` (`id`, `exam`, `session_id`, `date_from`, `date_to`, `description`, `exam_group_id`, `use_exam_roll_no`, `is_publish`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'FINAL EX', 16, NULL, NULL, 'FSD', 1, 1, 0, 1, '2022-03-21 09:16:10', NULL),
(2, 'MY EXM', 16, NULL, NULL, 'This is my Exam', 1, 1, 1, 1, '2022-03-21 09:14:53', NULL),
(3, 'My Exam', 16, NULL, NULL, '1ST eXAM', 1, 1, 1, 1, '2022-03-21 09:20:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_class_batch_exam_students`
--

CREATE TABLE `exam_group_class_batch_exam_students` (
  `id` int(11) NOT NULL,
  `exam_group_class_batch_exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `roll_no` int(6) NOT NULL DEFAULT 0,
  `teacher_remark` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_class_batch_exam_subjects`
--

CREATE TABLE `exam_group_class_batch_exam_subjects` (
  `id` int(11) NOT NULL,
  `exam_group_class_batch_exams_id` int(11) DEFAULT NULL,
  `subject_id` int(10) NOT NULL,
  `date_from` date NOT NULL,
  `time_from` time NOT NULL,
  `duration` varchar(50) NOT NULL,
  `room_no` varchar(100) DEFAULT NULL,
  `max_marks` float(10,2) DEFAULT NULL,
  `min_marks` float(10,2) DEFAULT NULL,
  `credit_hours` float(10,2) DEFAULT 0.00,
  `date_to` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_group_class_batch_exam_subjects`
--

INSERT INTO `exam_group_class_batch_exam_subjects` (`id`, `exam_group_class_batch_exams_id`, `subject_id`, `date_from`, `time_from`, `duration`, `room_no`, `max_marks`, `min_marks`, `credit_hours`, `date_to`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-03-02', '14:41:04', '2', '1', 50.00, 0.00, 30.00, NULL, 0, '2022-03-21 09:12:13', NULL),
(2, 3, 1, '2022-03-14', '14:51:36', '1', '1', 100.00, 0.00, 1.00, NULL, 0, '2022-03-21 09:21:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_exam_connections`
--

CREATE TABLE `exam_group_exam_connections` (
  `id` int(11) NOT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `exam_group_class_batch_exams_id` int(11) DEFAULT NULL,
  `exam_weightage` float(10,2) DEFAULT 0.00,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_exam_results`
--

CREATE TABLE `exam_group_exam_results` (
  `id` int(11) NOT NULL,
  `exam_group_class_batch_exam_student_id` int(11) NOT NULL,
  `exam_group_class_batch_exam_subject_id` int(11) DEFAULT NULL,
  `attendence` varchar(10) DEFAULT NULL,
  `get_marks` float(10,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `exam_group_student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_group_students`
--

CREATE TABLE `exam_group_students` (
  `id` int(11) NOT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `student_session_id` int(10) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` int(11) NOT NULL,
  `attendence` varchar(10) NOT NULL,
  `exam_schedule_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `get_marks` float(10,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_schedules`
--

CREATE TABLE `exam_schedules` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `teacher_subject_id` int(11) DEFAULT NULL,
  `date_of_exam` date DEFAULT NULL,
  `start_to` varchar(50) DEFAULT NULL,
  `end_from` varchar(50) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `full_marks` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `exp_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expense_head`
--

CREATE TABLE `expense_head` (
  `id` int(11) NOT NULL,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feecategory`
--

CREATE TABLE `feecategory` (
  `id` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feemasters`
--

CREATE TABLE `feemasters` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fees_discounts`
--

CREATE TABLE `fees_discounts` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fees_discounts`
--

INSERT INTO `fees_discounts` (`id`, `session_id`, `name`, `code`, `amount`, `description`, `is_active`, `created_at`) VALUES
(1, 16, 'Special Discount', 'S_P1000', '1000.00', 'Special Discount', 'no', '2021-08-02 12:42:30'),
(2, 16, 'DPE 04 DISCOUNT', 'DPE 04 DISCOUNT', '12000.00', 'COURSE WILL BE RS.48,000/= + ADMISSION FEE RS.2,500/= IF STUDENT PAYS FULL AT ONCE', 'no', '2021-12-07 08:07:16'),
(3, 16, 'OCCEL DISCOUNT', 'OCCEL DISCOUNT', '2000.00', 'COURSE FEE WILL BE Rs.10,000 IF STUDENT PAYS FULL AT ONCE.(DISCOUNT Rs.2,000)', 'no', '2021-12-07 08:06:13'),
(6, 16, 'FLINDERS 1 + 2 IT BATCH 01', 'FLINDERS IT FIRST FIVE STUDENT', '5000.00', 'SPECIAL DISCOUNT OFFER TO FIRST FOUR OF STUDENT', 'no', '2022-01-08 07:09:28'),
(7, 16, 'FLINDERS 1 + 2 IT BATCH 01', 'FLINDERS 1 + 2 IT 9A\'S STUDENT DISCOUNT', '4900.00', 'TOTAL COURSE FEE Rs.540,000\r\nOFFERED TO 50000+44000=99000 DISCOUNT\r\n', 'no', '2022-01-08 07:12:33'),
(8, 16, 'DITESL FULL PAYMENT DISCOUNT', 'DITESL WE 04', '3000.00', 'COURSE WILL BE 27,000 IF STUDENT PAYS FULL AT ONCE.', 'no', '2022-02-22 05:04:54'),
(9, 16, 'DPE 05 FULL PAYMENT DISCOUNT', 'DPE 05', '12000.00', '', 'no', '2022-02-22 06:05:43'),
(10, 16, 'Demo_Discount', 'DEMO123', '100.00', 'this is an Demo discount\r\n', 'no', '2022-03-24 05:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `fees_reminder`
--

CREATE TABLE `fees_reminder` (
  `id` int(11) NOT NULL,
  `reminder_type` varchar(10) DEFAULT NULL,
  `day` int(2) DEFAULT NULL,
  `is_active` int(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fees_reminder`
--

INSERT INTO `fees_reminder` (`id`, `reminder_type`, `day`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'before', 2, 0, '2020-02-28 13:38:32', NULL),
(2, 'before', 5, 0, '2020-02-28 13:38:36', NULL),
(3, 'after', 2, 0, '2020-02-28 13:38:40', NULL),
(4, 'after', 5, 0, '2020-02-28 13:38:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feetype`
--

CREATE TABLE `feetype` (
  `id` int(11) NOT NULL,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `feecategory_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feetype`
--

INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `created_at`, `updated_at`, `description`) VALUES
(1, 0, NULL, 'Admission Fee', 'Admission_Fee', 'no', '2021-08-03 11:31:14', NULL, 'Admission Fee should be taken prior to Course Commencent. '),
(8, 0, NULL, 'Initial Payment', 'Initial Payment', 'no', '2021-11-29 08:12:36', NULL, ''),
(13, 0, NULL, '1st Installment', '1st Installment', 'no', '2021-11-29 08:19:19', NULL, ''),
(14, 0, NULL, '2nd Installment', '2nd Installment', 'no', '2021-11-29 08:19:28', NULL, ''),
(15, 0, NULL, '3rd Installment', '3rd Installment', 'no', '2021-11-29 08:19:37', NULL, ''),
(16, 0, NULL, '4th Installment', '4th Installment', 'no', '2021-11-29 08:19:46', NULL, ''),
(17, 0, NULL, '5th Installment', '5th Installment', 'no', '2021-11-29 08:19:56', NULL, ''),
(18, 0, NULL, '6th Installment', '6th Installment', 'no', '2021-11-29 08:20:05', NULL, ''),
(19, 0, NULL, '7th Installment', '7th Installment', 'no', '2021-11-29 08:20:12', NULL, ''),
(20, 0, NULL, '8th Installment', '8th Installment', 'no', '2021-11-29 08:20:20', NULL, ''),
(21, 0, NULL, '9th Installment', '9th Installment', 'no', '2021-11-29 08:20:27', NULL, ''),
(22, 0, NULL, '10th Installment', '10th Installment', 'no', '2021-11-29 08:20:38', NULL, ''),
(23, 0, NULL, '11th Installment', '11th Installment', 'no', '2021-11-29 08:20:45', NULL, ''),
(24, 0, NULL, '12th Installment', '12th Installment', 'no', '2021-11-29 08:20:54', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups`
--

CREATE TABLE `fee_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `course_id` varchar(50) NOT NULL,
  `batch_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_groups`
--

INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`, `course_id`, `batch_id`) VALUES
(1, 'Demo_Initial_Pay', 0, 'Signing FEE to a Course', 'no', '2021-08-01 18:26:30', '11', '1'),
(2, 'Ditec_Pay', 0, 'This is the third batch. ', 'no', '2021-08-02 12:45:29', '3', '3'),
(3, 'DPE - 01', 0, 'First Batch', 'no', '2021-08-03 12:26:23', '1', '1'),
(4, 'DPE - 02', 0, 'Second Batch', 'no', '2021-08-03 12:26:53', '1', '2'),
(5, 'DPE - 03', 0, 'Third Batch', 'no', '2021-08-03 12:27:14', '1', '3'),
(6, 'DPE - 04', 0, 'Forth Batch', 'no', '2021-08-03 12:27:31', '1', '4'),
(7, 'OCCEL - 01', 0, 'First Batch', 'no', '2021-08-03 12:30:33', '2', '1'),
(8, 'OCCEL - 02', 0, 'Second Batch', 'no', '2021-08-03 12:28:16', '2', '2'),
(9, 'OCCEL - 03', 0, 'Third Batch', 'no', '2021-08-03 12:28:39', '2', '3'),
(10, 'OCCEL - 04', 0, 'Forth Batch ', 'no', '2021-08-03 12:29:27', '2', '4'),
(11, 'OCCEL - 05', 0, 'Fifth Batch', 'no', '2021-08-03 12:29:49', '2', '5'),
(12, 'OCCEL - 06', 0, 'Sixth Batch', 'no', '2021-08-03 12:30:12', '2', '6'),
(13, 'DITEC - WD - 01', 0, 'DITEC Week Days - First Batch', 'no', '2021-08-03 12:31:09', '3', '1'),
(14, 'DITEC - WD - 02', 0, 'DITEC Week Days - Second Batch', 'no', '2021-08-03 12:31:38', '3', '2'),
(15, 'DITEC - WD - 03', 0, 'DITEC Week Days - Third Batch', 'no', '2021-08-03 12:32:21', '3', '3'),
(16, 'DITEC - WE - 01', 0, 'DITEC Weekends - First Batch', 'no', '2021-08-03 12:32:55', '4', '1'),
(17, 'DITEC - WE - 02', 0, 'DITEC Weekends - Second Batch', 'no', '2021-08-03 12:33:26', '4', '2'),
(18, 'DITEC - WE - 03', 0, 'DITEC Weekends - Third Batch', 'no', '2021-08-03 12:34:03', '4', '3'),
(19, 'DIE - WD - 01', 0, 'DIE Week Days - First Batch', 'no', '2021-08-03 12:36:28', '5', '1'),
(20, 'OCCIT - 01', 0, 'First Batch in Online Computer Certificate Course. ', 'no', '2021-09-13 08:51:15', '12', '1'),
(21, 'OCCEL - 07', 0, 'Seventh Batch', 'no', '2021-09-23 05:28:15', '2', '7'),
(22, 'OCCEL - 08', 0, 'Eighth Batch ', 'no', '2021-09-23 05:28:40', '2', '8'),
(23, 'OCCEL - 09', 0, 'Ninth Batch', 'no', '2021-09-23 05:29:04', '2', '9'),
(24, 'OCCEL - 10', 0, 'Tenth Batch', 'no', '2021-12-08 11:34:57', '2', '10'),
(27, '	FLINDERS 1 + 2 IT BATCH 01', 0, 'FLINDERS 1 + 2 PROGRAMME OF STUDY - BACHELOR OF COMPUTING', 'no', '2022-01-08 06:31:59', '14', '1'),
(28, '	FLINDERS 1 + 2 BS BATCH 01', 0, 'FLINDERS 1 + 2 PROGRAMME OF STUDY - BACHELOR OF BUSINESS', 'no', '2022-01-08 06:32:48', '15', '1'),
(29, 'DPE - 05', 0, 'Fifth Batch', 'no', '2022-01-24 05:28:50', '2', '5'),
(30, 'DITESL WD - 03', 0, 'Third Batch ', 'no', '2022-01-24 05:31:35', '5', '3'),
(31, 'DITESL WE - 03', 0, 'Third Batch ', 'no', '2022-01-24 05:32:00', '6', '3'),
(32, 'DITESL WE - 02', 0, 'Second Batch ', 'no', '2022-01-24 05:32:40', '6', '2'),
(33, 'DITESL WE - 01', 0, 'First Batch ', 'no', '2022-01-24 05:33:01', '6', '1'),
(34, 'DIBM WD - 01', 0, 'First Batch ', 'no', '2022-01-24 05:45:49', '10', '1'),
(35, 'DIBM WD 02 + FLU Foundation 01', 0, 'DIBM WD Second Batch + Flinders Uni Foundation Course First Batch ', 'no', '2022-01-24 05:46:44', '10', '2'),
(36, 'DITESL - WE - 04', 0, 'Fourth Batch - Weekend', 'no', '2022-03-25 06:04:30', '6', '4'),
(37, 'DITESL WD 02', 0, 'Diploma in Teaching English as a Second Language (DITESL)  Weekday Second Batch 02\r\n', 'no', '2022-02-25 07:41:28', '5', '2'),
(38, 'DITESL - WE - 04 RS.23,000 PAYMENT PLAN', 0, 'PAYMENT PLAN CHANGED ON 25.01.2022 \r\nBEFORE ENROLLED STUDENT', 'no', '2022-03-25 06:06:56', '6', '4');

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups_feetype`
--

CREATE TABLE `fee_groups_feetype` (
  `id` int(11) NOT NULL,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `fee_groups_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `fine_type` varchar(50) NOT NULL DEFAULT 'none',
  `due_date` date DEFAULT NULL,
  `fine_percentage` float(10,2) NOT NULL DEFAULT 0.00,
  `fine_amount` float(10,2) NOT NULL DEFAULT 0.00,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_groups_feetype`
--

INSERT INTO `fee_groups_feetype` (`id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `amount`, `fine_type`, `due_date`, `fine_percentage`, `fine_amount`, `is_active`, `created_at`) VALUES
(1, 1, 1, 1, 16, '10000.00', 'none', '2021-08-01', 0.00, 0.00, 'no', '2021-08-01 18:28:22'),
(3, 2, 2, 1, 16, '12000.00', 'none', '2021-08-20', 0.00, 0.00, 'no', '2021-08-02 12:48:24'),
(7, 4, 3, 1, 16, '12000.00', 'none', NULL, 0.00, 0.00, 'no', '2021-09-23 05:30:34'),
(9, 5, 6, 1, 16, '2500.00', 'percentage', '2021-11-01', 10.00, 250.00, 'no', '2022-01-24 05:35:35'),
(10, 5, 6, 8, 16, '10000.00', 'none', '2021-11-01', 0.00, 0.00, 'no', '2021-11-29 08:27:16'),
(11, 5, 6, 13, 16, '10000.00', 'none', '2021-12-10', 0.00, 0.00, 'no', '2021-11-29 08:30:02'),
(12, 5, 6, 14, 16, '10000.00', 'none', '2022-01-10', 0.00, 0.00, 'no', '2021-11-29 08:36:32'),
(13, 5, 6, 15, 16, '10000.00', 'none', '2022-02-10', 0.00, 0.00, 'no', '2021-11-29 08:36:48'),
(14, 5, 6, 16, 16, '10000.00', 'none', '2022-03-10', 0.00, 0.00, 'no', '2021-11-29 08:37:03'),
(15, 5, 6, 17, 16, '10000.00', 'none', '2022-04-10', 0.00, 0.00, 'no', '2021-11-29 08:37:17'),
(16, 6, 7, 8, 16, '5000.00', 'none', '2020-11-20', 0.00, 0.00, 'no', '2021-12-07 07:56:11'),
(17, 6, 7, 13, 16, '5000.00', 'none', '2021-01-10', 0.00, 0.00, 'no', '2021-12-07 07:56:32'),
(18, 7, 8, 8, 16, '5000.00', 'none', '2020-12-28', 0.00, 0.00, 'no', '2021-12-07 07:57:08'),
(19, 7, 8, 13, 16, '5000.00', 'none', '2021-02-10', 0.00, 0.00, 'no', '2021-12-07 07:57:24'),
(20, 8, 9, 8, 16, '5000.00', 'none', '2021-02-08', 0.00, 0.00, 'no', '2021-12-07 07:58:38'),
(21, 8, 9, 13, 16, '5000.00', 'none', '2021-03-10', 0.00, 0.00, 'no', '2021-12-07 07:59:11'),
(22, 9, 10, 8, 16, '5000.00', 'none', '2021-03-15', 0.00, 0.00, 'no', '2021-12-07 07:59:37'),
(23, 9, 10, 13, 16, '5000.00', 'none', '2021-04-10', 0.00, 0.00, 'no', '2021-12-07 08:00:06'),
(24, 10, 11, 8, 16, '5000.00', 'none', '2021-05-03', 0.00, 0.00, 'no', '2021-12-07 08:00:45'),
(25, 10, 11, 13, 16, '5000.00', 'none', '2021-06-10', 0.00, 0.00, 'no', '2021-12-07 08:01:01'),
(26, 11, 12, 8, 16, '5000.00', 'none', '2021-06-07', 0.00, 0.00, 'no', '2021-12-07 08:01:25'),
(27, 11, 12, 13, 16, '5000.00', 'none', '2021-07-10', 0.00, 0.00, 'no', '2021-12-07 08:01:40'),
(28, 12, 21, 8, 16, '5000.00', 'none', '2021-07-05', 0.00, 0.00, 'no', '2021-12-07 08:02:04'),
(29, 12, 21, 13, 16, '5000.00', 'none', '2021-08-10', 0.00, 0.00, 'no', '2021-12-07 08:02:18'),
(30, 13, 22, 8, 16, '5000.00', 'none', '2021-08-23', 0.00, 0.00, 'no', '2021-12-07 08:02:39'),
(31, 13, 22, 13, 16, '5000.00', 'none', '2021-10-10', 0.00, 0.00, 'no', '2021-12-07 08:02:54'),
(32, 14, 23, 8, 16, '6000.00', 'none', '2021-10-18', 0.00, 0.00, 'no', '2021-12-07 10:37:36'),
(33, 14, 23, 13, 16, '6000.00', 'none', '2021-11-10', 0.00, 0.00, 'no', '2021-12-07 10:37:44'),
(45, 16, 24, 8, 16, '6000.00', 'none', '2021-12-31', 0.00, 0.00, 'no', '2021-12-27 07:06:15'),
(46, 16, 24, 13, 16, '6000.00', 'none', '2022-02-10', 0.00, 0.00, 'no', '2022-01-05 05:48:41'),
(47, 17, 27, 8, 16, '100000.00', 'percentage', '2021-12-31', 10.00, 10000.00, 'no', '2022-01-08 06:33:59'),
(48, 17, 27, 13, 16, '39000.00', 'percentage', '2022-01-10', 10.00, 3900.00, 'no', '2022-01-08 06:51:46'),
(49, 17, 27, 14, 16, '39000.00', 'percentage', '2022-02-10', 10.00, 3900.00, 'no', '2022-01-08 06:51:56'),
(50, 17, 27, 15, 16, '39000.00', 'percentage', '2022-03-10', 10.00, 3900.00, 'no', '2022-01-08 06:52:04'),
(51, 17, 27, 16, 16, '39000.00', 'percentage', '2022-04-10', 10.00, 3900.00, 'no', '2022-01-08 06:52:20'),
(52, 17, 27, 17, 16, '39000.00', 'percentage', '2022-05-10', 10.00, 3900.00, 'no', '2022-01-08 06:52:30'),
(53, 17, 27, 18, 16, '39000.00', 'percentage', '2022-06-10', 10.00, 3900.00, 'no', '2022-01-08 06:54:41'),
(54, 17, 27, 19, 16, '39000.00', 'percentage', '2022-07-10', 10.00, 3900.00, 'no', '2022-01-08 06:54:49'),
(55, 17, 27, 20, 16, '39000.00', 'percentage', '2022-08-10', 10.00, 3900.00, 'no', '2022-01-08 06:54:57'),
(56, 17, 27, 21, 16, '39000.00', 'percentage', '2022-09-10', 10.00, 3900.00, 'no', '2022-01-08 06:55:10'),
(57, 17, 27, 22, 16, '39000.00', 'percentage', '2022-10-10', 10.00, 3900.00, 'no', '2022-01-08 06:57:17'),
(58, 18, 29, 1, 16, '2500.00', 'none', NULL, 0.00, 0.00, 'no', '2022-01-24 05:33:47'),
(59, 18, 29, 8, 16, '10000.00', 'none', NULL, 0.00, 0.00, 'no', '2022-01-24 05:34:07'),
(60, 18, 29, 13, 16, '10000.00', 'none', NULL, 0.00, 0.00, 'no', '2022-01-24 05:34:27'),
(61, 18, 29, 14, 16, '10000.00', 'percentage', '2022-04-10', 10.00, 1000.00, 'no', '2022-01-24 05:36:53'),
(62, 18, 29, 15, 16, '10000.00', 'percentage', '2022-05-10', 10.00, 1000.00, 'no', '2022-01-24 05:37:23'),
(63, 18, 29, 16, 16, '10000.00', 'percentage', '2022-06-10', 10.00, 1000.00, 'no', '2022-01-24 05:37:47'),
(64, 18, 29, 17, 16, '10000.00', 'percentage', '2022-07-10', 10.00, 1000.00, 'no', '2022-01-24 05:38:12'),
(65, 19, 31, 8, 16, '6000.00', 'percentage', '2021-12-10', 10.00, 600.00, 'no', '2022-01-24 05:41:44'),
(66, 19, 31, 13, 16, '6000.00', 'percentage', '2022-01-10', 10.00, 600.00, 'no', '2022-01-24 05:42:20'),
(67, 19, 31, 14, 16, '6000.00', 'percentage', '2022-02-10', 10.00, 600.00, 'no', '2022-01-24 05:44:22'),
(68, 19, 31, 15, 16, '5000.00', 'percentage', '2022-03-10', 10.00, 500.00, 'no', '2022-01-24 05:44:34'),
(73, 1, 1, 8, 16, '5000.00', 'none', NULL, 0.00, 0.00, 'no', '2022-02-22 06:27:36'),
(74, 21, 37, 8, 16, '12000.00', 'none', '2022-02-28', 0.00, 0.00, 'no', '2022-02-25 07:41:58'),
(75, 21, 37, 13, 16, '6000.00', 'none', '2022-03-10', 0.00, 0.00, 'no', '2022-02-25 07:42:27'),
(76, 21, 37, 14, 16, '6000.00', 'none', '2022-04-10', 0.00, 0.00, 'no', '2022-02-25 07:42:40'),
(77, 21, 37, 15, 16, '6000.00', 'none', '2022-05-10', 0.00, 0.00, 'no', '2022-02-25 07:42:54'),
(82, 23, 17, 8, 16, '10000.00', 'none', '2022-01-31', 0.00, 0.00, 'no', '2022-03-12 06:31:39'),
(83, 23, 17, 13, 16, '8000.00', 'none', '2022-02-25', 0.00, 0.00, 'no', '2022-03-12 06:32:18'),
(84, 23, 17, 14, 16, '7000.00', 'percentage', '2022-03-25', 10.00, 700.00, 'no', '2022-03-12 06:32:54'),
(85, 23, 17, 15, 16, '7000.00', 'percentage', '2022-04-25', 10.00, 700.00, 'no', '2022-03-12 06:33:13'),
(86, 24, 36, 8, 16, '12000.00', 'percentage', '2022-03-26', 10.00, 1200.00, 'no', '2022-03-25 04:42:19'),
(87, 24, 36, 13, 16, '6000.00', 'percentage', '2022-04-30', 10.00, 600.00, 'no', '2022-03-25 04:46:20'),
(88, 24, 36, 14, 16, '6000.00', 'percentage', '2022-05-31', 10.00, 600.00, 'no', '2022-03-25 04:46:29'),
(89, 24, 36, 15, 16, '6000.00', 'percentage', '2022-06-30', 10.00, 600.00, 'no', '2022-03-25 04:46:39'),
(94, 26, 38, 8, 16, '6000.00', 'percentage', '2022-03-31', 10.00, 600.00, 'no', '2022-03-25 06:10:06'),
(95, 26, 38, 13, 16, '6000.00', 'percentage', '2022-04-30', 10.00, 600.00, 'no', '2022-03-25 06:10:24'),
(96, 26, 38, 14, 16, '6000.00', 'percentage', '2022-05-31', 10.00, 600.00, 'no', '2022-03-25 06:10:52'),
(97, 26, 38, 15, 16, '5000.00', 'percentage', '2022-06-30', 10.00, 500.00, 'no', '2022-03-25 06:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `fee_receipt_no`
--

CREATE TABLE `fee_receipt_no` (
  `id` int(11) NOT NULL,
  `payment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fee_session_groups`
--

CREATE TABLE `fee_session_groups` (
  `id` int(11) NOT NULL,
  `fee_groups_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_session_groups`
--

INSERT INTO `fee_session_groups` (`id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES
(1, 1, 16, 'no', '2021-08-01 18:28:22'),
(2, 2, 16, 'no', '2021-08-02 12:48:24'),
(3, 20, 16, 'no', '2021-09-13 07:54:59'),
(4, 3, 16, 'no', '2021-09-23 05:29:41'),
(5, 6, 16, 'no', '2021-11-29 08:27:02'),
(6, 7, 16, 'no', '2021-12-07 07:56:11'),
(7, 8, 16, 'no', '2021-12-07 07:57:08'),
(8, 9, 16, 'no', '2021-12-07 07:58:38'),
(9, 10, 16, 'no', '2021-12-07 07:59:37'),
(10, 11, 16, 'no', '2021-12-07 08:00:45'),
(11, 12, 16, 'no', '2021-12-07 08:01:25'),
(12, 21, 16, 'no', '2021-12-07 08:02:04'),
(13, 22, 16, 'no', '2021-12-07 08:02:39'),
(14, 23, 16, 'no', '2021-12-07 08:07:56'),
(16, 24, 16, 'no', '2021-12-27 07:06:15'),
(17, 27, 16, 'no', '2022-01-08 06:33:59'),
(18, 29, 16, 'no', '2022-01-24 05:33:47'),
(19, 31, 16, 'no', '2022-01-24 05:41:44'),
(21, 37, 16, 'no', '2022-02-25 07:41:58'),
(23, 17, 16, 'no', '2022-03-12 06:31:39'),
(24, 36, 16, 'no', '2022-03-25 04:42:19'),
(26, 38, 16, 'no', '2022-03-25 06:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `filetypes`
--

CREATE TABLE `filetypes` (
  `id` int(11) NOT NULL,
  `file_extension` text DEFAULT NULL,
  `file_mime` text DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `image_extension` text DEFAULT NULL,
  `image_mime` text DEFAULT NULL,
  `image_size` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filetypes`
--

INSERT INTO `filetypes` (`id`, `file_extension`, `file_mime`, `file_size`, `image_extension`, `image_mime`, `image_size`, `created_at`) VALUES
(1, 'pdf, zip, jpg, jpeg, png, txt, 7z, gif, csv, docx, mp3, mp4, accdb, odt, ods, ppt, pptx, xlsx, wmv, jfif, apk, ppt, bmp, jpe, mdb, rar, xls, svg', 'application/pdf, image/zip, image/jpg, image/png, image/jpeg, text/plain, application/x-zip-compressed, application/zip, image/gif, text/csv, application/vnd.openxmlformats-officedocument.wordprocessingml.document, audio/mpeg, application/msaccess, application/vnd.oasis.opendocument.text, application/vnd.oasis.opendocument.spreadsheet, application/vnd.ms-powerpoint, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, video/x-ms-wmv, video/mp4, image/jpeg, application/vnd.android.package-archive, application/x-msdownload, application/vnd.ms-powerpoint, image/bmp, image/jpeg, application/msaccess, application/vnd.ms-excel, image/svg+xml', 100048576, 'jfif, png, jpe, jpeg, jpg, bmp, gif, svg', 'image/jpeg, image/png, image/jpeg, image/jpeg, image/bmp, image/gif, image/x-ms-bmp, image/svg+xml', 10048576, '2021-01-30 13:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `follow_up`
--

CREATE TABLE `follow_up` (
  `id` int(11) NOT NULL,
  `enquiry_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_media_gallery`
--

CREATE TABLE `front_cms_media_gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` text NOT NULL,
  `vid_title` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menus`
--

CREATE TABLE `front_cms_menus` (
  `id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `open_new_tab` int(10) NOT NULL DEFAULT 0,
  `ext_url` text NOT NULL,
  `ext_url_link` text NOT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_menus`
--

INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES
(1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2018-04-20 14:54:49'),
(2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2018-04-20 14:54:55');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu_items`
--

CREATE TABLE `front_cms_menu_items` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ext_url` text DEFAULT NULL,
  `open_new_tab` int(11) DEFAULT 0,
  `ext_url_link` text DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_menu_items`
--

INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES
(1, 1, 'Home', 1, 0, NULL, NULL, NULL, 'home', 1, 0, NULL, 'no', '2019-12-02 22:11:50'),
(2, 1, 'Contact Us', 76, 0, NULL, NULL, NULL, 'contact-us', 4, 0, NULL, 'no', '2019-12-02 22:11:52'),
(3, 1, 'Complain', 2, 0, NULL, NULL, NULL, 'complain', 3, 0, NULL, 'no', '2019-12-02 22:11:52'),
(4, 1, 'Online Admission', 0, 0, '1', NULL, 'http://yourschoolurl.com/online_admission', 'admssion', 2, 0, NULL, 'no', '2019-12-21 15:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_pages`
--

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int(1) DEFAULT 0,
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `feature_image` varchar(200) NOT NULL,
  `description` longtext DEFAULT NULL,
  `publish_date` date NOT NULL,
  `publish` int(10) DEFAULT 0,
  `sidebar` int(10) DEFAULT 0,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_pages`
--

INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES
(1, 'default', 1, 'Home', 'page/home', 'page', 'home', '', '', '', '', '<p>home page</p>', '0000-00-00', 1, NULL, 'no', '2019-12-02 15:23:47'),
(2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<p>[form-builder:complain]</p>', '0000-00-00', 1, NULL, 'no', '2019-11-13 10:16:36'),
(3, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2018-05-18 14:46:04'),
(4, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<section class=\"contact\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<h2 class=\"col-md-12 col-sm-12\">Send In Your Query</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div class=\"col-md-12 col-sm-12\">[form-builder:contact_us]<!--./row--></div>\r\n<!--./col-md-12--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/pin.svg\" />\r\n<h3>Our Location</h3>\r\n\r\n<p>350 Fifth Avenue, 34th floor New York NY 10118-3299 USA</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/phone.svg\" />\r\n<h3>CALL US</h3>\r\n\r\n<p>E-mail : info@abcschool.com</p>\r\n\r\n<p>Mobile : +91-9009987654</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/clock.svg\" />\r\n<h3>Working Hours</h3>\r\n\r\n<p>Mon-Fri : 9 am to 5 pm</p>\r\n\r\n<p>Sat : 9 am to 3 pm</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"mapWrapper fullwidth\"><iframe frameborder=\"0\" height=\"500\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" src=\"http://maps.google.com/maps?f=q&source=s_q&hl=EN&q=time+square&aq=&sll=40.716558,-73.931122&sspn=0.40438,1.056747&ie=UTF8&rq=1&ev=p&split=1&radius=33.22&hq=time+square&hnear=&ll=37.061753,-95.677185&spn=0.438347,0.769043&z=9&output=embed\" width=\"100%\"></iframe></div>\r\n</div>', '0000-00-00', 0, NULL, 'no', '2019-05-04 15:46:41');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_page_contents`
--

CREATE TABLE `front_cms_page_contents` (
  `id` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_programs`
--

CREATE TABLE `front_cms_programs` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `event_venue` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `meta_title` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `feature_image` text NOT NULL,
  `publish_date` date NOT NULL,
  `publish` varchar(10) DEFAULT '0',
  `sidebar` int(10) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_program_photos`
--

CREATE TABLE `front_cms_program_photos` (
  `id` int(11) NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  `media_gallery_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_settings`
--

CREATE TABLE `front_cms_settings` (
  `id` int(11) NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `is_active_rtl` int(10) DEFAULT 0,
  `is_active_front_cms` int(11) DEFAULT 0,
  `is_active_sidebar` int(1) DEFAULT 0,
  `logo` varchar(200) DEFAULT NULL,
  `contact_us_email` varchar(100) DEFAULT NULL,
  `complain_form_email` varchar(100) DEFAULT NULL,
  `sidebar_options` text NOT NULL,
  `whatsapp_url` varchar(255) NOT NULL,
  `fb_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `pinterest_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `google_analytics` text DEFAULT NULL,
  `footer_text` varchar(500) DEFAULT NULL,
  `cookie_consent` varchar(255) NOT NULL,
  `fav_icon` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_settings`
--

INSERT INTO `front_cms_settings` (`id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `whatsapp_url`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `cookie_consent`, `fav_icon`, `created_at`) VALUES
(1, 'material_pink', NULL, NULL, NULL, NULL, '', '', '[\"news\",\"complain\"]', '', '', '', '', '', '', '', '', '', '', '', '', '2020-02-28 13:48:32');

-- --------------------------------------------------------

--
-- Table structure for table `general_calls`
--

CREATE TABLE `general_calls` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_dureation` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `call_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_calls`
--

INSERT INTO `general_calls` (`id`, `name`, `contact`, `date`, `description`, `follow_up_date`, `call_dureation`, `note`, `call_type`) VALUES
(1, 'Rohan Perera', '07613436542', '2021-11-29', 'ghgchcg', '2021-11-09', '', '', 'Incoming');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `exam_type` varchar(250) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `point` float(10,1) DEFAULT NULL,
  `mark_from` float(10,2) DEFAULT NULL,
  `mark_upto` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(10) NOT NULL,
  `homework_date` date NOT NULL,
  `submit_date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `create_date` date NOT NULL,
  `evaluation_date` date NOT NULL,
  `document` varchar(200) NOT NULL,
  `created_by` int(11) NOT NULL,
  `evaluated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homework`
--

INSERT INTO `homework` (`id`, `class_id`, `section_id`, `session_id`, `homework_date`, `submit_date`, `staff_id`, `subject_group_subject_id`, `subject_id`, `description`, `create_date`, `evaluation_date`, `document`, `created_by`, `evaluated_by`) VALUES
(1, 9, 1, 16, '2022-03-02', '2022-03-02', 5, 3, 0, '<p>caczx<br></p>', '2022-03-21', '0000-00-00', '1.pdf', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `homework_evaluation`
--

CREATE TABLE `homework_evaluation` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `id` int(11) NOT NULL,
  `hostel_name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `intake` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_rooms`
--

CREATE TABLE `hostel_rooms` (
  `id` int(11) NOT NULL,
  `hostel_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `room_no` varchar(200) DEFAULT NULL,
  `no_of_bed` int(11) DEFAULT NULL,
  `cost_per_bed` float(10,2) DEFAULT 0.00,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `id_card`
--

CREATE TABLE `id_card` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `school_address` varchar(500) NOT NULL,
  `background` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `sign_image` varchar(100) NOT NULL,
  `enable_vertical_card` int(11) NOT NULL DEFAULT 0,
  `header_color` varchar(100) NOT NULL,
  `enable_admission_no` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_student_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_class` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_blood_group` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `id_card`
--

INSERT INTO `id_card` (`id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `enable_vertical_card`, `header_color`, `enable_admission_no`, `enable_student_name`, `enable_class`, `enable_fathers_name`, `enable_mothers_name`, `enable_address`, `enable_phone`, `enable_dob`, `enable_blood_group`, `status`) VALUES
(1, 'Sample Student Identity Card Horizontal', 'YORK Campus', 'Kandy Road,Kelaniya', 'background1.jpg', 'logo1.png', 'samplesign12.png', 0, '#595959', 1, 1, 1, 1, 0, 1, 1, 1, 1, 1),
(2, 'Sample Student Identity Card Vertical', 'YGC Campus', 'Kandy Road, Kelaniya', 'background2.png', 'logo2.png', 'sign2.png', 1, '#595959', 1, 1, 1, 1, 0, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `inc_head_id` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `income_head`
--

CREATE TABLE `income_head` (
  `id` int(255) NOT NULL,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `income_head`
--

INSERT INTO `income_head` (`id`, `income_category`, `description`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Sample Head', 'sdv', 'yes', 'no', '2022-08-17 05:49:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `item_store_id` int(11) DEFAULT NULL,
  `item_supplier_id` int(11) DEFAULT NULL,
  `quantity` int(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id` int(255) NOT NULL,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_issue`
--

CREATE TABLE `item_issue` (
  `id` int(11) NOT NULL,
  `issue_type` varchar(15) DEFAULT NULL,
  `issue_to` varchar(100) DEFAULT NULL,
  `issue_by` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `note` text NOT NULL,
  `is_returned` int(2) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` varchar(10) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_stock`
--

CREATE TABLE `item_stock` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `purchase_price` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_store`
--

CREATE TABLE `item_store` (
  `id` int(255) NOT NULL,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_supplier`
--

CREATE TABLE `item_supplier` (
  `id` int(255) NOT NULL,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `short_code` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Azerbaijan', 'az', 'az', 'no', 'no', '2019-11-20 11:23:12', '0000-00-00'),
(2, 'Albanian', 'sq', 'al', 'no', 'no', '2019-11-20 11:42:42', '0000-00-00'),
(3, 'Amharic', 'am', 'am', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(4, 'English', 'en', 'us', 'no', 'no', '2019-11-20 11:38:50', '0000-00-00'),
(5, 'Arabic', 'ar', 'sa', 'no', 'no', '2019-11-20 11:47:28', '0000-00-00'),
(7, 'Afrikaans', 'af', 'af', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(8, 'Basque', 'eu', 'es', 'no', 'no', '2019-11-20 11:54:10', '0000-00-00'),
(11, 'Bengali', 'bn', 'in', 'no', 'no', '2019-11-20 11:41:53', '0000-00-00'),
(13, 'Bosnian', 'bs', 'bs', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(14, 'Welsh', 'cy', 'cy', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(15, 'Hungarian', 'hu', 'hu', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(16, 'Vietnamese', 'vi', 'vi', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(17, 'Haitian', 'ht', 'ht', 'no', 'no', '2021-01-23 07:09:32', '0000-00-00'),
(18, 'Galician', 'gl', 'gl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(19, 'Dutch', 'nl', 'nl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(21, 'Greek', 'el', 'gr', 'no', 'no', '2019-11-20 12:12:08', '0000-00-00'),
(22, 'Georgian', 'ka', 'ge', 'no', 'no', '2019-11-20 12:11:40', '0000-00-00'),
(23, 'Gujarati', 'gu', 'in', 'no', 'no', '2019-11-20 11:39:16', '0000-00-00'),
(24, 'Danish', 'da', 'dk', 'no', 'no', '2019-11-20 12:03:25', '0000-00-00'),
(25, 'Hebrew', 'he', 'il', 'no', 'no', '2019-11-20 12:13:50', '0000-00-00'),
(26, 'Yiddish', 'yi', 'il', 'no', 'no', '2019-11-20 12:25:33', '0000-00-00'),
(27, 'Indonesian', 'id', 'id', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(28, 'Irish', 'ga', 'ga', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(29, 'Italian', 'it', 'it', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(30, 'Icelandic', 'is', 'is', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(31, 'Spanish', 'es', 'es', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(33, 'Kannada', 'kn', 'kn', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(34, 'Catalan', 'ca', 'ca', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(36, 'Chinese', 'zh', 'cn', 'no', 'no', '2019-11-20 12:01:48', '0000-00-00'),
(37, 'Korean', 'ko', 'kr', 'no', 'no', '2019-11-20 12:19:09', '0000-00-00'),
(38, 'Xhosa', 'xh', 'ls', 'no', 'no', '2019-11-20 12:24:39', '0000-00-00'),
(39, 'Latin', 'la', 'it', 'no', 'no', '2021-01-23 07:09:32', '0000-00-00'),
(40, 'Latvian', 'lv', 'lv', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(41, 'Lithuanian', 'lt', 'lt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(43, 'Malagasy', 'mg', 'mg', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(44, 'Malay', 'ms', 'ms', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(45, 'Malayalam', 'ml', 'ml', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(46, 'Maltese', 'mt', 'mt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(47, 'Macedonian', 'mk', 'mk', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(48, 'Maori', 'mi', 'nz', 'no', 'no', '2019-11-20 12:20:27', '0000-00-00'),
(49, 'Marathi', 'mr', 'in', 'no', 'no', '2019-11-20 11:39:51', '0000-00-00'),
(51, 'Mongolian', 'mn', 'mn', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(52, 'German', 'de', 'de', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(53, 'Nepali', 'ne', 'ne', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(54, 'Norwegian', 'no', 'no', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(55, 'Punjabi', 'pa', 'in', 'no', 'no', '2019-11-20 11:40:16', '0000-00-00'),
(57, 'Persian', 'fa', 'ir', 'no', 'no', '2019-11-20 12:21:17', '0000-00-00'),
(59, 'Portuguese', 'pt', 'pt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(60, 'Romanian', 'ro', 'ro', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(61, 'Russian', 'ru', 'ru', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(62, 'Cebuano', 'ceb', 'ph', 'no', 'no', '2019-11-20 11:59:12', '0000-00-00'),
(64, 'Sinhala', 'si', 'lk ', 'no', 'no', '2021-01-23 07:09:32', '0000-00-00'),
(65, 'Slovakian', 'sk', 'sk', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(66, 'Slovenian', 'sl', 'sl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(67, 'Swahili', 'sw', 'ke', 'no', 'no', '2019-11-20 12:21:57', '0000-00-00'),
(68, 'Sundanese', 'su', 'sd', 'no', 'no', '2019-12-03 11:06:57', '0000-00-00'),
(70, 'Thai', 'th', 'th', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(71, 'Tagalog', 'tl', 'tl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(72, 'Tamil', 'ta', 'in', 'no', 'no', '2019-11-20 11:40:53', '0000-00-00'),
(74, 'Telugu', 'te', 'in', 'no', 'no', '2019-11-20 11:41:15', '0000-00-00'),
(75, 'Turkish', 'tr', 'tr', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(77, 'Uzbek', 'uz', 'uz', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(79, 'Urdu', 'ur', 'pk', 'no', 'no', '2019-11-20 12:23:57', '0000-00-00'),
(80, 'Finnish', 'fi', 'fi', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(81, 'French', 'fr', 'fr', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(82, 'Hindi', 'hi', 'in', 'no', 'no', '2019-11-20 11:36:34', '0000-00-00'),
(84, 'Czech', 'cs', 'cz', 'no', 'no', '2019-11-20 12:02:36', '0000-00-00'),
(85, 'Swedish', 'sv', 'sv', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(86, 'Scottish', 'gd', 'gd', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(87, 'Estonian', 'et', 'et', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(88, 'Esperanto', 'eo', 'br', 'no', 'no', '2019-11-21 04:49:18', '0000-00-00'),
(89, 'Javanese', 'jv', 'id', 'no', 'no', '2019-11-20 12:18:29', '0000-00-00'),
(90, 'Japanese', 'ja', 'jp', 'no', 'no', '2019-11-20 12:14:39', '0000-00-00'),
(91, 'Polish', 'pl', 'pl', 'no', 'no', '2020-06-15 03:25:27', '0000-00-00'),
(92, 'Kurdish', 'ku', 'iq', 'no', 'no', '2020-12-21 00:15:31', '0000-00-00'),
(93, 'Lao', 'lo', 'la', 'no', 'no', '2020-12-21 00:15:36', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) NOT NULL,
  `subject_group_class_sections_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `libarary_members`
--

CREATE TABLE `libarary_members` (
  `id` int(11) UNSIGNED NOT NULL,
  `library_card_no` varchar(50) DEFAULT NULL,
  `member_type` varchar(50) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `record_id` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `agent` varchar(50) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES
(1, 'New Record inserted On  income head   id 1', '1', 18, 'Insert', '124.43.67.10', 'Windows 10', 'Chrome 104.0.5112.81', '2022-08-17 16:19:55', NULL),
(2, 'Record updated On  disable Staff id 10', '10', 2, 'Update', '175.157.33.25', 'Windows 10', 'Chrome 104.0.0.0', '2022-08-17 19:40:46', NULL),
(3, 'New Record inserted On students id 925', '925', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-18 09:51:13', NULL),
(4, 'New Record inserted On  student session id 959', '959', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-18 09:51:13', NULL),
(5, 'New Record inserted On users id 1849', '1849', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-18 09:51:13', NULL),
(6, 'New Record inserted On users id 1850', '1850', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-18 09:51:13', NULL),
(7, 'Record updated On students id 925', '925', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-18 09:51:13', NULL),
(8, 'Record deleted On classes id 15', '15', 18, 'Delete', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-19 14:13:05', NULL),
(9, 'Record deleted On classes id 14', '14', 18, 'Delete', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-19 14:13:09', NULL),
(10, 'Record deleted On classes id 13', '13', 18, 'Delete', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-19 14:13:16', NULL),
(11, 'Record deleted On classes id 12', '12', 18, 'Delete', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-19 14:13:20', NULL),
(12, 'Record deleted On classes id 11', '11', 18, 'Delete', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-19 14:13:23', NULL),
(13, 'New Record inserted On subject groups id 16', '16', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-19 14:14:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `template_id` varchar(100) NOT NULL,
  `message` text DEFAULT NULL,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `is_individual` varchar(10) DEFAULT '0',
  `is_class` int(10) NOT NULL DEFAULT 0,
  `group_list` text DEFAULT NULL,
  `user_list` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `title`, `template_id`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES
(1, 'Checking whether you received email', '', '<p>Hello there,.Home you and the Familt kjbsadkfsdb s ksdfsdfdsf&nbsp;</p>\r\n', '1', '0', '1', '0', 0, '[]', NULL, '2021-08-01 05:13:21', NULL),
(2, 'sadadsadsafas  sadsadasdasdssadsada', '', '<p>sdfdsfdfsd&nbsp; d kd sfs dfksd fkds fdsf&nbsp; dfobdsofd fds fskd fsdofusdf dsf dkfjsd fskfs</p>\r\n', '1', '0', '0', '1', 0, NULL, '[{\"category\":\"staff\",\"user_id\":\"2\",\"email\":\"ygcampus2020@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"\"}]', '2021-08-01 05:14:31', NULL),
(3, 'Hello there', '', '<p>sdfdss&nbsp; dsfdsfdsf sdfljsdf dsfds f,dsf sdfsdfdsfsdfdfs</p>\r\n', '1', '0', '0', '1', 0, NULL, '[{\"category\":\"staff\",\"user_id\":\"2\",\"email\":\"ygcampus2020@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"\"}]', '2021-08-02 21:26:39', NULL),
(4, 'dsfsddsfsdfsf sdfsdfsdfsdffsdfsdfsd', '', '<p>dsfdsfdsfsdf sdfosdbfsd fdslf sdlf dskf sdkfsdfdsfsdf</p>\r\n', '1', '0', '0', '1', 0, NULL, '[{\"category\":\"staff\",\"user_id\":\"2\",\"email\":\"ygcampus2020@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"\"}]', '2021-08-02 21:35:22', NULL),
(5, 'sadasdassa asdasdsa sadasdsadad', '', '<p>asdsadsadasd sadsadsad asmdsads adkas dksd sadasdsadsdasdsadasdsad</p>\r\n', '1', '0', '0', '1', 0, NULL, '[{\"category\":\"staff\",\"user_id\":\"2\",\"email\":\"ygcampus2020@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"\"}]', '2021-08-02 21:38:34', NULL),
(6, 'dsfdfdsfdsfdsfsdfsdfs', '', '<p>sdfsdfdsfdsfdsfdsfdsfdsfds sdfsdfsdfdfs</p>\r\n', '1', '0', '0', '1', 0, NULL, '[{\"category\":\"staff\",\"user_id\":\"2\",\"email\":\"ygcampus2020@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"\"}]', '2021-08-02 22:15:00', NULL),
(7, 'asfdfdfdsfdsfsdfs', '', '<p>sdjfbsdfds fksd kfsdfsdffsdfsdsdfsdfsdffs</p>\r\n', '1', '0', '0', '1', 0, NULL, '[{\"category\":\"staff\",\"user_id\":\"2\",\"email\":\"ygcampus2020@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"\"}]', '2021-08-02 22:21:40', NULL),
(8, 'something', '', '<p>fdgfdgfdgfdgfd vbbvc</p>\r\n', '1', '0', '1', '0', 0, '[]', NULL, '2021-11-29 04:47:23', NULL),
(9, 'drfgdfgfdgdfgfdgdf', '', '<p>gdfgdfgdfgdfgdfgdfgdfgdfgfdgdfgd</p>\r\n', '1', '0', '1', '0', 0, '[]', NULL, '2021-11-29 04:49:16', NULL),
(10, 'dfdsfdfds', '', '<p>dfdsfdfdfdfdsfdsfds</p>\r\n', '1', '0', '1', '0', 0, '[]', NULL, '2021-11-29 04:55:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `multi_class_students`
--

CREATE TABLE `multi_class_students` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification_roles`
--

CREATE TABLE `notification_roles` (
  `id` int(11) NOT NULL,
  `send_notification_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_roles`
--

INSERT INTO `notification_roles` (`id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES
(1, 1, 8, 0, '2022-03-06 03:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` varchar(10) DEFAULT '0',
  `is_sms` varchar(10) DEFAULT '0',
  `is_notification` int(11) NOT NULL DEFAULT 0,
  `display_notification` int(11) NOT NULL DEFAULT 0,
  `display_sms` int(11) NOT NULL DEFAULT 1,
  `subject` varchar(255) NOT NULL,
  `template_id` varchar(100) NOT NULL,
  `template` longtext NOT NULL,
  `variables` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_setting`
--

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES
(1, 'student_admission', '0', '0', 0, 0, 1, 'Student Admission', '', 'Dear {{student_name}} your admission is confirm in Class: {{class}} Section:  {{section}} for Session: {{current_session_name}} for more \r\ndetail\r\n contact\r\n System\r\n Admin\r\n {{class}} {{section}} {{admission_no}} {{roll_no}} {{admission_date}} {{mobileno}} {{email}} {{dob}} {{guardian_name}} {{guardian_relation}} {{guardian_phone}} {{father_name}} {{father_phone}} {{blood_group}} {{mother_name}} {{gender}} {{guardian_email}}', '{{student_name}} {{class}}  {{section}}  {{admission_no}}  {{roll_no}}  {{admission_date}}   {{mobileno}}  {{email}}  {{dob}}  {{guardian_name}}  {{guardian_relation}}  {{guardian_phone}}  {{father_name}}  {{father_phone}}  {{blood_group}}  {{mother_name}}  {{gender}} {{guardian_email}} {{current_session_name}} ', '2021-09-03 05:46:56'),
(2, 'exam_result', '0', '0', 0, 1, 1, 'Exam Result', '', 'Dear {{student_name}} - {{exam_roll_no}}, your {{exam}} result has been published.', '{{student_name}} {{exam_roll_no}} {{exam}}', '2021-09-03 05:46:56'),
(3, 'fee_submission', '0', '0', 0, 1, 1, 'Fee Submission', '', 'Dear parents, we have received Fees Amount {{fee_amount}} for  {{student_name}}  by Your School Name \r\n{{class}} {{section}} {{fine_type}} {{fine_percentage}} {{fine_amount}} {{fee_group_name}} {{type}} {{code}} {{email}} {{contact_no}} {{invoice_id}} {{sub_invoice_id}} {{due_date}} {{amount}} {{fee_amount}}', '{{student_name}} {{class}} {{section}} {{fine_type}} {{fine_percentage}} {{fine_amount}} {{fee_group_name}} {{type}} {{code}} {{email}} {{contact_no}} {{invoice_id}} {{sub_invoice_id}} {{due_date}} {{amount}} {{fee_amount}}', '2021-09-03 05:46:56'),
(4, 'absent_attendence', '0', '0', 0, 1, 1, 'Absent Attendence', '', 'Absent Notice :{{student_name}}  was absent on date {{date}} in period {{subject_name}} {{subject_code}} {{subject_type}} from Your School Name', '{{student_name}} {{mobileno}} {{email}} {{father_name}} {{father_phone}} {{father_occupation}} {{mother_name}} {{mother_phone}} {{guardian_name}} {{guardian_phone}} {{guardian_occupation}} {{guardian_email}} {{date}} {{current_session_name}}             {{time_from}} {{time_to}} {{subject_name}} {{subject_code}} {{subject_type}}  ', '2021-09-03 05:46:56'),
(5, 'login_credential', '0', '0', 0, 0, 1, 'Login Credential for the YGC Portal', '', 'Hello {{display_name}} ,\r\n<br>\r\n<br>\r\n<u>Welcome to YGC Student Portal,</u>\r\n<br>\r\n<br>\r\nyour login details for Url: {{url}} \r\n<br>\r\nUsername: {{username}}  \r\n<br>\r\nPassword: {{password}}\r\n<br>\r\n<br>\r\nThank You.\r\nYork Graduate Campus\r\n <br>\r\n<br>', '{{url}} {{display_name}} {{username}} {{password}}', '2021-11-29 08:45:35'),
(6, 'homework', '0', '0', 0, 1, 1, 'Homework', '', 'New Homework has been created for \r\n{{student_name}} at\r\n\r\n\r\n\r\n{{homework_date}} for the class {{class}} {{section}} {{subject}}. kindly submit your\r\n\r\n\r\n homework before {{submit_date}} .Thank you', '{{homework_date}} {{submit_date}} {{class}} {{section}} {{subject}} {{student_name}}', '2021-09-03 05:46:56'),
(7, 'fees_reminder', '0', '0', 0, 1, 1, 'Fees Reminder', '', 'Dear parents, please pay fee amount Rs.{{due_amount}} of {{fee_type}} before {{due_date}} for {{student_name}}  from smart school (ignore if you already paid)', '{{fee_type}}{{fee_code}}{{due_date}}{{student_name}}{{school_name}}{{fee_amount}}{{due_amount}}{{deposit_amount}} ', '2021-08-30 08:01:14'),
(8, 'forgot_password', '0', '0', 0, 0, 0, 'Forgot Password', '', 'Dear  {{name}} , \r\n<br>\r\n    Recently a request was submitted to reset password for your account. If you didn\'t make the request, just ignore this email. Otherwise you can reset your password using this link <a href=\'{{resetPassLink}}\'>Click here to reset your password</a>,\r\n<br>\r\nif you\'re having trouble clicking the password reset button, copy and paste the URL below into your web browser. your username {{username}}\r\n<br>\r\n<br>\r\n{{resetPassLink}}\r\n Regards,\r\n {{school_name}}', '{{school_name}}{{name}}{{username}}{{resetPassLink}} ', '2021-08-30 08:01:14'),
(9, 'online_examination_publish_exam', '0', '0', 0, 1, 1, 'Online Examination Publish Exam', '', 'A new exam {{exam_title}} has been created for  duration: {{time_duration}} min, which will be available from:  {{exam_from}} to  {{exam_to}}.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2021-08-30 08:01:14'),
(10, 'online_examination_publish_result', '0', '0', 0, 1, 1, 'Online Examination Publish Result', '', 'Exam {{exam_title}} result has been declared which was conducted between  {{exam_from}} to   {{exam_to}}, for more details, please check your student portal.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2021-08-30 08:01:14'),
(11, 'online_admission_form_submission', '0', '0', 0, 1, 1, 'Online Admission Form Submission', '', 'Dear {{firstname}}  {{lastname}} your online admission form is Submitted successfully  on date {{date}}. Your Reference number is {{reference_no}}. Please remember your reference number for further process.', ' {{firstname}} {{lastname}} {{date}} {{reference_no}}', '2021-08-30 08:01:14'),
(12, 'online_admission_fees_submission', '0', '0', 0, 1, 1, 'Online Admission Fees Submission', '', 'Dear {{firstname}}  {{lastname}} your online admission form is Submitted successfully and the payment of {{paid_amount}} has recieved successfully on date {{date}}. Your Reference number is {{reference_no}}. Please remember your reference number for further process.', ' {{firstname}} {{lastname}} {{date}} {{paid_amount}} {{reference_no}}', '2021-06-02 08:46:46');

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam`
--

CREATE TABLE `onlineexam` (
  `id` int(11) NOT NULL,
  `exam` text DEFAULT NULL,
  `attempt` int(11) NOT NULL,
  `exam_from` datetime DEFAULT NULL,
  `exam_to` datetime DEFAULT NULL,
  `is_quiz` int(11) NOT NULL DEFAULT 0,
  `auto_publish_date` datetime DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `duration` time NOT NULL,
  `passing_percentage` float NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `publish_result` int(11) NOT NULL DEFAULT 0,
  `is_active` varchar(1) DEFAULT '0',
  `is_marks_display` int(11) NOT NULL DEFAULT 0,
  `is_neg_marking` int(11) NOT NULL DEFAULT 0,
  `is_random_question` int(11) NOT NULL DEFAULT 0,
  `is_rank_generated` int(1) NOT NULL DEFAULT 0,
  `publish_exam_notification` int(1) NOT NULL,
  `publish_result_notification` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_attempts`
--

CREATE TABLE `onlineexam_attempts` (
  `id` int(11) NOT NULL,
  `onlineexam_student_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_questions`
--

CREATE TABLE `onlineexam_questions` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `onlineexam_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `neg_marks` float(10,2) DEFAULT 0.00,
  `is_active` varchar(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_students`
--

CREATE TABLE `onlineexam_students` (
  `id` int(11) NOT NULL,
  `onlineexam_id` int(11) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `is_attempted` int(1) NOT NULL DEFAULT 0,
  `rank` int(1) DEFAULT 0,
  `quiz_attempted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `onlineexam_student_results`
--

CREATE TABLE `onlineexam_student_results` (
  `id` int(11) NOT NULL,
  `onlineexam_student_id` int(11) NOT NULL,
  `onlineexam_question_id` int(11) NOT NULL,
  `select_option` longtext DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `remark` text DEFAULT NULL,
  `attachment_name` text DEFAULT NULL,
  `attachment_upload_name` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `online_admissions`
--

CREATE TABLE `online_admissions` (
  `id` int(11) NOT NULL,
  `admission_no` varchar(100) DEFAULT NULL,
  `roll_no` varchar(100) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `admission_date` date DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(255) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `rte` varchar(20) NOT NULL DEFAULT 'No',
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `cast` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `school_house_id` int(11) DEFAULT NULL,
  `blood_group` varchar(200) NOT NULL,
  `vehroute_id` int(11) NOT NULL,
  `hostel_room_id` int(11) NOT NULL,
  `adhar_no` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `guardian_is` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) NOT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_email` varchar(100) NOT NULL,
  `father_pic` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `guardian_pic` varchar(200) NOT NULL,
  `is_enroll` int(255) DEFAULT 0,
  `previous_school` text DEFAULT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `form_status` int(11) NOT NULL,
  `paid_status` int(11) NOT NULL,
  `measurement_date` date DEFAULT NULL,
  `app_key` text DEFAULT NULL,
  `document` text DEFAULT NULL,
  `disable_at` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `online_admission_fields`
--

CREATE TABLE `online_admission_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `online_admission_fields`
--

INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES
(1, 'middlename', 1, '2021-07-31 18:17:57'),
(2, 'lastname', 1, '2021-06-02 04:49:19'),
(3, 'category', 0, '2021-06-02 04:48:35'),
(4, 'religion', 0, '2021-06-02 04:48:35'),
(5, 'cast', 0, '2021-06-02 04:48:35'),
(6, 'mobile_no', 1, '2021-06-02 04:50:24'),
(7, 'admission_date', 0, '2021-06-02 04:48:35'),
(8, 'student_photo', 0, '2021-06-02 04:48:35'),
(9, 'is_student_house', 0, '2021-05-29 13:22:53'),
(10, 'is_blood_group', 0, '2021-06-02 04:48:35'),
(11, 'student_height', 0, '2021-06-02 04:48:35'),
(12, 'student_weight', 0, '2021-06-02 04:48:35'),
(13, 'father_name', 0, '2021-06-02 04:48:35'),
(14, 'father_phone', 0, '2021-06-02 04:48:35'),
(15, 'father_occupation', 0, '2021-06-02 04:48:35'),
(16, 'father_pic', 0, '2021-06-02 04:48:35'),
(17, 'mother_name', 0, '2021-06-02 04:48:35'),
(18, 'mother_phone', 0, '2021-06-02 04:48:35'),
(19, 'mother_occupation', 0, '2021-06-02 04:48:35'),
(20, 'mother_pic', 0, '2021-06-02 04:48:35'),
(21, 'guardian_name', 0, '2021-07-31 18:17:45'),
(22, 'guardian_phone', 0, '2021-07-31 18:17:41'),
(23, 'if_guardian_is', 0, '2021-07-31 18:17:47'),
(24, 'guardian_relation', 0, '2021-07-31 18:17:43'),
(25, 'guardian_email', 0, '2021-07-31 18:17:38'),
(26, 'guardian_occupation', 0, '2021-07-31 18:12:33'),
(27, 'guardian_address', 0, '2021-07-31 18:17:35'),
(28, 'bank_account_no', 0, '2021-06-02 04:48:35'),
(29, 'bank_name', 0, '2021-06-02 04:48:35'),
(30, 'ifsc_code', 0, '2021-06-02 04:48:35'),
(31, 'national_identification_no', 1, '2021-07-31 18:17:29'),
(32, 'local_identification_no', 0, '2021-06-02 04:48:35'),
(33, 'rte', 0, '2021-06-02 04:48:35'),
(34, 'previous_school_details', 0, '2021-06-02 04:48:35'),
(35, 'guardian_photo', 0, '2021-07-31 18:17:37'),
(36, 'student_note', 1, '2021-11-30 09:27:27'),
(37, 'measurement_date', 0, '2021-06-02 04:48:35'),
(38, 'student_email', 1, '2021-06-02 04:49:38'),
(39, 'current_address', 0, '2021-06-02 04:48:35'),
(40, 'permanent_address', 0, '2021-06-02 04:48:35');

-- --------------------------------------------------------

--
-- Table structure for table `online_admission_payment`
--

CREATE TABLE `online_admission_payment` (
  `id` int(11) NOT NULL,
  `admission_id` int(11) NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `note` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(200) NOT NULL,
  `api_username` varchar(200) DEFAULT NULL,
  `api_secret_key` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `api_publishable_key` varchar(200) NOT NULL,
  `api_password` varchar(200) DEFAULT NULL,
  `api_signature` varchar(200) DEFAULT NULL,
  `api_email` varchar(200) DEFAULT NULL,
  `paypal_demo` varchar(100) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `gateway_mode` int(11) NOT NULL COMMENT '0 Testing, 1 live',
  `paytm_website` varchar(255) NOT NULL,
  `paytm_industrytype` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payslip_allowance`
--

CREATE TABLE `payslip_allowance` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `staff_id` int(11) NOT NULL,
  `cal_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permission_category`
--

CREATE TABLE `permission_category` (
  `id` int(11) NOT NULL,
  `perm_group_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int(11) DEFAULT 0,
  `enable_add` int(11) DEFAULT 0,
  `enable_edit` int(11) DEFAULT 0,
  `enable_delete` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_category`
--

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES
(1, 1, 'Student', 'student', 1, 1, 1, 1, '2019-10-24 05:42:03'),
(2, 1, 'Import Student', 'import_student', 1, 0, 0, 0, '2018-06-22 10:17:19'),
(3, 1, 'Student Categories', 'student_categories', 1, 1, 1, 1, '2018-06-22 10:17:36'),
(4, 1, 'Student Houses', 'student_houses', 1, 1, 1, 1, '2018-06-22 10:17:53'),
(5, 2, 'Collect Fees', 'collect_fees', 1, 1, 0, 1, '2018-06-22 10:21:03'),
(6, 2, 'Fees Carry Forward', 'fees_carry_forward', 1, 0, 0, 0, '2018-06-27 00:18:15'),
(7, 2, 'Fees Master', 'fees_master', 1, 1, 1, 1, '2018-06-27 00:18:57'),
(8, 2, 'Fees Group', 'fees_group', 1, 1, 1, 1, '2018-06-22 10:21:46'),
(9, 3, 'Income', 'income', 1, 1, 1, 1, '2018-06-22 10:23:21'),
(10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2018-06-22 10:22:44'),
(11, 3, 'Search Income', 'search_income', 1, 0, 0, 0, '2018-06-22 10:23:00'),
(12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2018-06-22 10:24:06'),
(13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2018-06-22 10:23:47'),
(14, 4, 'Search Expense', 'search_expense', 1, 0, 0, 0, '2018-06-22 10:24:13'),
(15, 5, 'Student / Period Attendance', 'student_attendance', 1, 1, 1, 0, '2019-11-29 01:19:05'),
(20, 6, 'Marks Grade', 'marks_grade', 1, 1, 1, 1, '2018-06-22 10:25:25'),
(21, 7, 'Class Timetable', 'class_timetable', 1, 0, 1, 0, '2019-11-24 03:05:17'),
(23, 7, 'Subject', 'subject', 1, 1, 1, 1, '2018-06-22 10:32:17'),
(24, 7, 'Class', 'class', 1, 1, 1, 1, '2018-06-22 10:32:35'),
(25, 7, 'Section', 'section', 1, 1, 1, 1, '2018-06-22 10:31:10'),
(26, 7, 'Promote Student', 'promote_student', 1, 0, 0, 0, '2018-06-22 10:32:47'),
(27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1, '2018-06-22 10:33:19'),
(28, 9, 'Books List', 'books', 1, 1, 1, 1, '2019-11-24 00:37:12'),
(29, 9, 'Issue Return', 'issue_return', 1, 0, 0, 0, '2019-11-24 00:37:18'),
(30, 9, 'Add Staff Member', 'add_staff_member', 1, 0, 0, 0, '2018-07-02 11:37:00'),
(31, 10, 'Issue Item', 'issue_item', 1, 1, 1, 1, '2019-11-29 06:39:27'),
(32, 10, 'Add Item Stock', 'item_stock', 1, 1, 1, 1, '2019-11-24 00:39:17'),
(33, 10, 'Add Item', 'item', 1, 1, 1, 1, '2019-11-24 00:39:39'),
(34, 10, 'Item Store', 'store', 1, 1, 1, 1, '2019-11-24 00:40:41'),
(35, 10, 'Item Supplier', 'supplier', 1, 1, 1, 1, '2019-11-24 00:40:49'),
(37, 11, 'Routes', 'routes', 1, 1, 1, 1, '2018-06-22 10:39:17'),
(38, 11, 'Vehicle', 'vehicle', 1, 1, 1, 1, '2018-06-22 10:39:36'),
(39, 11, 'Assign Vehicle', 'assign_vehicle', 1, 1, 1, 1, '2018-06-27 04:39:20'),
(40, 12, 'Hostel', 'hostel', 1, 1, 1, 1, '2018-06-22 10:40:49'),
(41, 12, 'Room Type', 'room_type', 1, 1, 1, 1, '2018-06-22 10:40:27'),
(42, 12, 'Hostel Rooms', 'hostel_rooms', 1, 1, 1, 1, '2018-06-25 06:23:03'),
(43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2018-06-22 10:41:17'),
(44, 13, 'Email', 'email', 1, 0, 0, 0, '2019-11-26 05:20:37'),
(46, 13, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-06-22 10:41:23'),
(53, 15, 'Languages', 'languages', 0, 1, 0, 1, '2021-01-23 07:09:32'),
(54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2018-07-05 09:08:35'),
(55, 15, 'Session Setting', 'session_setting', 1, 1, 1, 1, '2018-06-22 10:44:15'),
(56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2018-07-05 09:08:41'),
(57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2018-07-05 09:08:47'),
(58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2018-07-05 09:08:51'),
(59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2018-07-05 09:08:55'),
(60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2018-07-05 09:08:59'),
(61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2018-07-09 03:50:06'),
(62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2018-07-09 03:50:26'),
(63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2018-06-22 10:46:02'),
(64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2018-06-22 10:46:21'),
(65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2018-06-22 10:47:02'),
(66, 16, 'Event', 'event', 1, 1, 1, 1, '2018-06-22 10:47:20'),
(67, 16, 'News', 'notice', 1, 1, 1, 1, '2018-07-03 08:39:34'),
(68, 2, 'Fees Group Assign', 'fees_group_assign', 1, 0, 0, 0, '2018-06-22 10:20:42'),
(69, 2, 'Fees Type', 'fees_type', 1, 1, 1, 1, '2018-06-22 10:19:34'),
(70, 2, 'Fees Discount', 'fees_discount', 1, 1, 1, 1, '2018-06-22 10:20:10'),
(71, 2, 'Fees Discount Assign', 'fees_discount_assign', 1, 0, 0, 0, '2018-06-22 10:20:17'),
(73, 2, 'Search Fees Payment', 'search_fees_payment', 1, 0, 0, 0, '2018-06-22 10:20:27'),
(74, 2, 'Search Due Fees', 'search_due_fees', 1, 0, 0, 0, '2018-06-22 10:20:35'),
(77, 7, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2018-06-22 10:30:52'),
(78, 17, 'Admission Enquiry', 'admission_enquiry', 1, 1, 1, 1, '2018-06-22 10:51:24'),
(79, 17, 'Follow Up Admission Enquiry', 'follow_up_admission_enquiry', 1, 1, 0, 1, '2018-06-22 10:51:39'),
(80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2018-06-22 10:48:58'),
(81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2018-06-22 10:50:57'),
(82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2018-06-22 10:50:21'),
(83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2018-06-22 10:50:04'),
(84, 17, 'Complain', 'complaint', 1, 1, 1, 1, '2018-07-03 08:40:55'),
(85, 17, 'Setup Font Office', 'setup_font_office', 1, 1, 1, 1, '2018-06-22 10:49:24'),
(86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2018-06-22 10:53:31'),
(87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2018-06-22 10:53:12'),
(88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2018-06-22 10:53:10'),
(90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1, '2018-06-22 10:52:51'),
(93, 19, 'Homework', 'homework', 1, 1, 1, 1, '2018-06-22 10:53:50'),
(94, 19, 'Homework Evaluation', 'homework_evaluation', 1, 1, 0, 0, '2018-06-27 03:07:21'),
(96, 20, 'Student Certificate', 'student_certificate', 1, 1, 1, 1, '2018-07-06 10:41:07'),
(97, 20, 'Generate Certificate', 'generate_certificate', 1, 0, 0, 0, '2018-07-06 10:37:16'),
(98, 20, 'Student ID Card', 'student_id_card', 1, 1, 1, 1, '2018-07-06 10:41:28'),
(99, 20, 'Generate ID Card', 'generate_id_card', 1, 0, 0, 0, '2018-07-06 10:41:49'),
(102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2018-06-22 10:54:41'),
(104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2018-06-22 10:34:33'),
(106, 22, 'Quick Session Change', 'quick_session_change', 1, 0, 0, 0, '2018-06-22 10:54:45'),
(107, 1, 'Disable Student', 'disable_student', 1, 0, 0, 0, '2018-06-25 06:21:34'),
(108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 0, 1, 1, '2020-10-05 08:56:27'),
(109, 18, 'Apply Leave', 'apply_leave', 1, 1, 0, 0, '2019-11-28 23:47:46'),
(110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1, '2018-07-02 10:17:56'),
(111, 18, 'Department', 'department', 1, 1, 1, 1, '2018-06-26 03:57:07'),
(112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2018-06-26 03:57:07'),
(113, 22, 'Fees Collection And Expense Monthly Chart', 'fees_collection_and_expense_monthly_chart', 1, 0, 0, 0, '2018-07-03 07:08:15'),
(114, 22, 'Fees Collection And Expense Yearly Chart', 'fees_collection_and_expense_yearly_chart', 1, 0, 0, 0, '2018-07-03 07:08:15'),
(115, 22, 'Monthly Fees Collection Widget', 'Monthly fees_collection_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(116, 22, 'Monthly Expense Widget', 'monthly_expense_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(117, 22, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(122, 5, 'Attendance By Date', 'attendance_by_date', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(123, 9, 'Add Student', 'add_student', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(126, 15, 'User Status', 'user_status', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(128, 1, 'Student Timeline', 'student_timeline', 0, 1, 0, 1, '2018-07-05 08:08:52'),
(129, 18, 'Staff Timeline', 'staff_timeline', 0, 1, 0, 1, '2018-07-05 08:08:52'),
(130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2018-07-09 04:17:17'),
(131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2018-07-09 04:17:17'),
(134, 1, 'Disable Reason', 'disable_reason', 1, 1, 1, 1, '2019-11-27 06:39:21'),
(135, 2, 'Fees Reminder', 'fees_reminder', 1, 0, 1, 0, '2019-10-25 00:39:49'),
(136, 5, 'Approve Leave', 'approve_leave', 1, 0, 0, 0, '2019-10-25 00:46:44'),
(137, 6, 'Exam Group', 'exam_group', 1, 1, 1, 1, '2019-10-25 01:02:34'),
(141, 6, 'Design Admit Card', 'design_admit_card', 1, 1, 1, 1, '2019-10-25 01:06:59'),
(142, 6, 'Print Admit Card', 'print_admit_card', 1, 0, 0, 0, '2019-11-23 23:57:51'),
(143, 6, 'Design Marksheet', 'design_marksheet', 1, 1, 1, 1, '2019-10-25 01:10:25'),
(144, 6, 'Print Marksheet', 'print_marksheet', 1, 0, 0, 0, '2019-10-25 01:11:02'),
(145, 7, 'Teachers Timetable', 'teachers_time_table', 1, 0, 0, 0, '2019-11-30 02:52:21'),
(146, 14, 'Student Report', 'student_report', 1, 0, 0, 0, '2019-10-25 01:27:00'),
(147, 14, 'Guardian Report', 'guardian_report', 1, 0, 0, 0, '2019-10-25 01:30:27'),
(148, 14, 'Student History', 'student_history', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(149, 14, 'Student Login Credential Report', 'student_login_credential_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(150, 14, 'Class Subject Report', 'class_subject_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(151, 14, 'Admission Report', 'admission_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(152, 14, 'Sibling Report', 'sibling_report', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(153, 14, 'Homework Evaluation Report', 'homehork_evaluation_report', 1, 0, 0, 0, '2019-11-24 01:04:24'),
(154, 14, 'Student Profile', 'student_profile', 1, 0, 0, 0, '2019-10-25 01:39:07'),
(155, 14, 'Fees Statement', 'fees_statement', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(156, 14, 'Balance Fees Report', 'balance_fees_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(157, 14, 'Fees Collection Report', 'fees_collection_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(158, 14, 'Online Fees Collection Report', 'online_fees_collection_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(159, 14, 'Income Report', 'income_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(160, 14, 'Expense Report', 'expense_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(161, 14, 'PayRoll Report', 'payroll_report', 1, 0, 0, 0, '2019-10-31 00:23:22'),
(162, 14, 'Income Group Report', 'income_group_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(163, 14, 'Expense Group Report', 'expense_group_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(164, 14, 'Attendance Report', 'attendance_report', 1, 0, 0, 0, '2019-10-25 02:08:06'),
(165, 14, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2019-10-25 02:08:06'),
(174, 14, 'Transport Report', 'transport_report', 1, 0, 0, 0, '2019-10-25 02:13:56'),
(175, 14, 'Hostel Report', 'hostel_report', 1, 0, 0, 0, '2019-11-27 06:51:53'),
(176, 14, 'Audit Trail Report', 'audit_trail_report', 1, 0, 0, 0, '2019-10-25 02:16:39'),
(177, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2019-10-25 02:19:27'),
(178, 14, 'Book Issue Report', 'book_issue_report', 1, 0, 0, 0, '2019-10-25 02:29:04'),
(179, 14, 'Book Due Report', 'book_due_report', 1, 0, 0, 0, '2019-10-25 02:29:04'),
(180, 14, 'Book Inventory Report', 'book_inventory_report', 1, 0, 0, 0, '2019-10-25 02:29:04'),
(181, 14, 'Stock Report', 'stock_report', 1, 0, 0, 0, '2019-10-25 02:31:28'),
(182, 14, 'Add Item Report', 'add_item_report', 1, 0, 0, 0, '2019-10-25 02:31:28'),
(183, 14, 'Issue Item Report', 'issue_item_report', 1, 0, 0, 0, '2019-11-29 03:48:06'),
(185, 23, 'Online Examination', 'online_examination', 1, 1, 1, 1, '2019-11-23 23:54:50'),
(186, 23, 'Question Bank', 'question_bank', 1, 1, 1, 1, '2019-11-23 23:55:18'),
(187, 6, 'Exam Result', 'exam_result', 1, 0, 0, 0, '2019-11-23 23:58:50'),
(188, 7, 'Subject Group', 'subject_group', 1, 1, 1, 1, '2019-11-24 00:34:32'),
(189, 18, 'Teachers Rating', 'teachers_rating', 1, 0, 1, 1, '2019-11-24 03:12:54'),
(190, 22, 'Fees Awaiting Payment Widegts', 'fees_awaiting_payment_widegts', 1, 0, 0, 0, '2019-11-24 00:52:51'),
(191, 22, 'Conveted Leads Widegts', 'conveted_leads_widegts', 1, 0, 0, 0, '2019-11-24 00:58:24'),
(192, 22, 'Fees Overview Widegts', 'fees_overview_widegts', 1, 0, 0, 0, '2019-11-24 00:57:41'),
(193, 22, 'Enquiry Overview Widegts', 'enquiry_overview_widegts', 1, 0, 0, 0, '2019-12-02 05:06:09'),
(194, 22, 'Library Overview Widegts', 'book_overview_widegts', 1, 0, 0, 0, '2019-12-01 01:13:04'),
(195, 22, 'Student Today Attendance Widegts', 'today_attendance_widegts', 1, 0, 0, 0, '2019-12-03 04:57:45'),
(196, 6, 'Marks Import', 'marks_import', 1, 0, 0, 0, '2019-11-24 01:02:11'),
(197, 14, 'Student Attendance Type Report', 'student_attendance_type_report', 1, 0, 0, 0, '2019-11-24 01:06:32'),
(198, 14, 'Exam Marks Report', 'exam_marks_report', 1, 0, 0, 0, '2019-11-24 01:11:15'),
(200, 14, 'Online Exam Wise Report', 'online_exam_wise_report', 1, 0, 0, 0, '2019-11-24 01:18:14'),
(201, 14, 'Online Exams Report', 'online_exams_report', 1, 0, 0, 0, '2019-11-29 02:48:05'),
(202, 14, 'Online Exams Attempt Report', 'online_exams_attempt_report', 1, 0, 0, 0, '2019-11-29 02:46:24'),
(203, 14, 'Online Exams Rank Report', 'online_exams_rank_report', 1, 0, 0, 0, '2019-11-24 01:22:25'),
(204, 14, 'Staff Report', 'staff_report', 1, 0, 0, 0, '2019-11-24 01:25:27'),
(205, 6, 'Exam', 'exam', 1, 1, 1, 1, '2019-11-24 04:55:48'),
(207, 6, 'Exam Publish', 'exam_publish', 1, 0, 0, 0, '2019-11-24 05:15:04'),
(208, 6, 'Link Exam', 'link_exam', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(210, 6, 'Assign / View student', 'exam_assign_view_student', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(211, 6, 'Exam Subject', 'exam_subject', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(212, 6, 'Exam Marks', 'exam_marks', 1, 0, 1, 0, '2019-11-24 05:15:04'),
(213, 15, 'Language Switcher', 'language_switcher', 1, 0, 0, 0, '2019-11-24 05:17:11'),
(214, 23, 'Add Questions in Exam ', 'add_questions_in_exam', 1, 0, 1, 0, '2019-11-28 01:38:57'),
(215, 15, 'Custom Fields', 'custom_fields', 1, 0, 0, 0, '2019-11-29 04:08:35'),
(216, 15, 'System Fields', 'system_fields', 1, 0, 0, 0, '2019-11-25 00:15:01'),
(217, 13, 'SMS', 'sms', 1, 0, 0, 0, '2018-06-22 10:40:54'),
(219, 14, 'Student / Period Attendance Report', 'student_period_attendance_report', 1, 0, 0, 0, '2019-11-29 02:19:31'),
(220, 14, 'Biometric Attendance Log', 'biometric_attendance_log', 1, 0, 0, 0, '2019-11-27 05:59:16'),
(221, 14, 'Book Issue Return Report', 'book_issue_return_report', 1, 0, 0, 0, '2019-11-27 06:30:23'),
(222, 23, 'Assign / View Student', 'online_assign_view_student', 1, 0, 1, 0, '2019-11-28 04:20:22'),
(223, 14, 'Rank Report', 'rank_report', 1, 0, 0, 0, '2019-11-29 02:30:21'),
(224, 25, 'Chat', 'chat', 1, 0, 0, 0, '2019-11-29 04:10:28'),
(226, 22, 'Income Donut Graph', 'income_donut_graph', 1, 0, 0, 0, '2019-11-29 05:00:33'),
(227, 22, 'Expense Donut Graph', 'expense_donut_graph', 1, 0, 0, 0, '2019-11-29 05:01:10'),
(228, 9, 'Import Book', 'import_book', 1, 0, 0, 0, '2019-11-29 06:21:01'),
(229, 22, 'Staff Present Today Widegts', 'staff_present_today_widegts', 1, 0, 0, 0, '2019-11-29 06:48:00'),
(230, 22, 'Student Present Today Widegts', 'student_present_today_widegts', 1, 0, 0, 0, '2019-11-29 06:47:42'),
(231, 26, 'Multi Class Student', 'multi_class_student', 1, 1, 1, 1, '2020-10-05 08:56:27'),
(232, 27, 'Online Admission', 'online_admission', 1, 0, 1, 1, '2019-12-02 06:11:10'),
(233, 15, 'Print Header Footer', 'print_header_footer', 1, 0, 0, 0, '2020-02-12 02:02:02'),
(234, 28, 'Manage Alumni', 'manage_alumni', 1, 1, 1, 1, '2020-06-02 03:15:46'),
(235, 28, 'Events', 'events', 1, 1, 1, 1, '2020-05-28 21:48:52'),
(236, 29, 'Manage Lesson Plan', 'manage_lesson_plan', 1, 1, 1, 0, '2020-05-28 22:17:37'),
(237, 29, 'Manage Syllabus Status', 'manage_syllabus_status', 1, 0, 1, 0, '2020-05-28 22:20:11'),
(238, 29, 'Lesson', 'lesson', 1, 1, 1, 1, '2020-05-28 22:20:11'),
(239, 29, 'Topic', 'topic', 1, 1, 1, 1, '2020-05-28 22:20:11'),
(240, 14, 'Syllabus Status Report', 'syllabus_status_report', 1, 0, 0, 0, '2020-05-28 23:17:54'),
(241, 14, 'Teacher Syllabus Status Report', 'teacher_syllabus_status_report', 1, 0, 0, 0, '2020-05-28 23:17:54'),
(242, 14, 'Alumni Report', 'alumni_report', 1, 0, 0, 0, '2020-06-07 23:59:54'),
(243, 15, 'Student Profile Update', 'student_profile_update', 1, 0, 0, 0, '2020-08-21 05:36:33'),
(244, 14, 'Student Gender Ratio Report', 'student_gender_ratio_report', 1, 0, 0, 0, '2020-08-22 12:37:51'),
(245, 14, 'Student Teacher Ratio Report', 'student_teacher_ratio_report', 1, 0, 0, 0, '2020-08-22 12:42:27'),
(246, 14, 'Daily Attendance Report', 'daily_attendance_report', 1, 0, 0, 0, '2020-08-22 12:43:16'),
(247, 23, 'Import Question', 'import_question', 1, 0, 0, 0, '2019-11-23 18:25:18'),
(248, 20, 'Staff ID Card', 'staff_id_card', 1, 1, 1, 1, '2018-07-06 10:41:28'),
(249, 20, 'Generate Staff ID Card', 'generate_staff_id_card', 1, 0, 0, 0, '2018-07-06 10:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `permission_group`
--

CREATE TABLE `permission_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int(11) DEFAULT 0,
  `system` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_group`
--

INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES
(1, 'Student Information', 'student_information', 1, 1, '2019-03-15 09:30:22'),
(2, 'Fees Collection', 'fees_collection', 0, 0, '2023-01-18 14:44:46'),
(3, 'Income', 'income', 0, 0, '2023-01-18 14:44:49'),
(4, 'Expense', 'expense', 0, 0, '2023-01-18 14:44:52'),
(5, 'Student Attendance', 'student_attendance', 0, 0, '2023-01-18 14:44:54'),
(6, 'Examination', 'examination', 0, 0, '2023-01-18 14:44:56'),
(7, 'Academics', 'academics', 1, 1, '2023-01-19 14:11:37'),
(8, 'Download Center', 'download_center', 0, 0, '2023-01-18 14:45:12'),
(9, 'Library', 'library', 0, 0, '2021-07-31 18:06:54'),
(10, 'Inventory', 'inventory', 0, 0, '2022-02-09 06:11:49'),
(11, 'Transport', 'transport', 0, 0, '2021-07-31 18:07:09'),
(12, 'Hostel', 'hostel', 0, 0, '2021-07-31 18:07:02'),
(13, 'Communicate', 'communicate', 0, 0, '2023-01-18 14:45:15'),
(14, 'Reports', 'reports', 0, 1, '2023-01-18 14:46:11'),
(15, 'System Settings', 'system_settings', 1, 1, '2018-06-27 03:40:28'),
(16, 'Front CMS', 'front_cms', 0, 0, '2021-07-31 18:06:36'),
(17, 'Front Office', 'front_office', 0, 0, '2022-02-09 06:12:00'),
(18, 'Human Resource', 'human_resource', 0, 1, '2023-01-18 14:46:23'),
(19, 'Homework', 'homework', 0, 0, '2022-05-06 07:47:53'),
(20, 'Certificate', 'certificate', 0, 0, '2022-02-09 06:12:10'),
(21, 'Calendar To Do List', 'calendar_to_do_list', 0, 0, '2022-02-09 06:12:15'),
(22, 'Dashboard and Widgets', 'dashboard_and_widgets', 0, 1, '2023-01-18 14:46:26'),
(23, 'Online Examination', 'online_examination', 0, 0, '2023-01-18 14:46:34'),
(25, 'Chat', 'chat', 0, 0, '2021-08-02 12:24:44'),
(26, 'Multi Class', 'multi_class', 0, 0, '2023-01-18 14:46:39'),
(27, 'Online Admission', 'online_admission', 0, 0, '2023-01-18 14:46:42'),
(28, 'Alumni', 'alumni', 0, 0, '2021-07-31 18:06:40'),
(29, 'Lesson Plan', 'lesson_plan', 0, 0, '2022-05-06 07:47:33'),
(30, 'Deal Information', 'lead_information', 1, 1, '2019-03-15 09:30:22');

-- --------------------------------------------------------

--
-- Table structure for table `permission_student`
--

CREATE TABLE `permission_student` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `system` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_student`
--

INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES
(1, 'Fees', 'fees', 0, 1, 0, 2, '2021-09-20 11:02:01'),
(2, 'Class Timetable', 'class_timetable', 1, 1, 1, 7, '2020-05-30 19:57:50'),
(3, 'Homework', 'homework', 0, 0, 0, 19, '2022-05-06 07:47:53'),
(4, 'Download Center', 'download_center', 0, 1, 0, 8, '2022-06-11 05:20:27'),
(5, 'Attendance', 'attendance', 0, 1, 0, 5, '2022-06-11 05:20:29'),
(7, 'Examinations', 'examinations', 0, 1, 0, 6, '2022-06-11 05:21:00'),
(8, 'Notice Board', 'notice_board', 0, 1, 0, 13, '2022-06-11 05:20:55'),
(11, 'Library', 'library', 0, 0, 0, 9, '2021-07-31 18:06:54'),
(12, 'Transport Routes', 'transport_routes', 0, 0, 0, 11, '2021-07-31 18:07:09'),
(13, 'Hostel Rooms', 'hostel_rooms', 0, 0, 0, 12, '2021-07-31 18:07:02'),
(14, 'Calendar To Do List', 'calendar_to_do_list', 0, 0, 0, 21, '2021-08-30 08:03:15'),
(15, 'Online Examination', 'online_examination', 0, 1, 0, 23, '2022-06-11 05:21:06'),
(16, 'Teachers Rating', 'teachers_rating', 0, 0, 0, 0, '2021-08-02 12:25:07'),
(17, 'Chat', 'chat', 0, 0, 0, 25, '2021-08-02 12:24:44'),
(18, 'Multi Class', 'multi_class', 1, 1, 1, 26, '2022-03-04 03:07:56'),
(19, 'Lesson Plan', 'lesson_plan', 0, 0, 0, 29, '2022-05-06 07:47:33'),
(20, 'Syllabus Status', 'syllabus_status', 0, 0, 0, 29, '2022-05-06 07:47:33'),
(23, 'Apply Leave', 'apply_leave', 0, 0, 0, 0, '2021-07-31 18:09:17');

-- --------------------------------------------------------

--
-- Table structure for table `print_headerfooter`
--

CREATE TABLE `print_headerfooter` (
  `id` int(11) NOT NULL,
  `print_type` varchar(255) NOT NULL,
  `header_image` varchar(255) NOT NULL,
  `footer_content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `print_headerfooter`
--

INSERT INTO `print_headerfooter` (`id`, `print_type`, `header_image`, `footer_content`, `created_by`, `entry_date`) VALUES
(1, 'staff_payslip', 'header_image.jpg', 'This payslip is computer generated hence no signature is required.', 1, '2020-02-28 15:41:08'),
(2, 'student_receipt', 'header_image.jpg', 'This receipt is computer generated hence no signature is required.', 1, '2020-02-28 15:40:58'),
(3, 'online_admission_receipt', 'header_image.jpg', 'This receipt is for online admission  computer ffffffff generated hence no signature is required.', 1, '2021-05-27 12:50:24');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `question_type` varchar(100) NOT NULL,
  `level` varchar(10) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `opt_a` text DEFAULT NULL,
  `opt_b` text DEFAULT NULL,
  `opt_c` text DEFAULT NULL,
  `opt_d` text DEFAULT NULL,
  `opt_e` text DEFAULT NULL,
  `correct` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `staff_id`, `subject_id`, `question_type`, `level`, `class_id`, `section_id`, `class_section_id`, `question`, `opt_a`, `opt_b`, `opt_c`, `opt_d`, `opt_e`, `correct`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'descriptive', 'low', 9, 1, NULL, 'xccvxcx v', '', '', '', '', '', '', '2022-03-21 08:57:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question_answers`
--

CREATE TABLE `question_answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `read_notification`
--

CREATE TABLE `read_notification` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `id` int(11) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `is_superadmin` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, 0, 1, 0, '2018-06-30 15:39:11', '0000-00-00'),
(2, 'Lecturer', NULL, 0, 1, 0, '2021-07-31 18:20:48', '0000-00-00'),
(3, 'Accountant', NULL, 0, 1, 0, '2018-06-30 15:39:17', '0000-00-00'),
(4, 'Student Coordinator', NULL, 0, 1, 0, '2021-07-31 18:21:44', '0000-00-00'),
(6, 'Receptionist', NULL, 0, 1, 0, '2018-07-02 05:39:03', '0000-00-00'),
(7, 'Super Admin', NULL, 0, 1, 1, '2018-07-11 14:11:29', '0000-00-00'),
(8, 'Academic Coordinator', NULL, 0, 0, 0, '2021-09-03 05:47:47', NULL),
(9, 'Admin Executive', NULL, 0, 0, 0, '2022-01-03 10:13:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `perm_cat_id` int(11) DEFAULT NULL,
  `can_view` int(11) DEFAULT NULL,
  `can_add` int(11) DEFAULT NULL,
  `can_edit` int(11) DEFAULT NULL,
  `can_delete` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES
(10, 1, 17, 1, 1, 1, 1, '2018-07-06 09:48:56'),
(23, 1, 12, 1, 1, 1, 1, '2018-07-06 09:45:38'),
(24, 1, 13, 1, 1, 1, 1, '2018-07-06 09:48:28'),
(28, 1, 19, 1, 1, 1, 0, '2018-07-02 11:31:10'),
(30, 1, 76, 1, 1, 1, 0, '2018-07-02 11:31:10'),
(32, 1, 22, 1, 1, 1, 1, '2018-07-02 11:32:05'),
(43, 1, 32, 1, 1, 1, 1, '2018-07-06 10:22:05'),
(44, 1, 33, 1, 1, 1, 1, '2018-07-06 10:22:29'),
(45, 1, 34, 1, 1, 1, 1, '2018-07-06 10:23:59'),
(46, 1, 35, 1, 1, 1, 1, '2018-07-06 10:24:34'),
(47, 1, 104, 1, 1, 1, 1, '2018-07-06 10:23:08'),
(58, 1, 52, 1, 1, 0, 1, '2018-07-09 03:19:43'),
(87, 1, 92, 1, 1, 1, 1, '2018-06-26 03:33:43'),
(156, 1, 9, 1, 1, 1, 1, '2019-11-27 23:45:46'),
(157, 1, 10, 1, 1, 1, 1, '2019-11-27 23:45:46'),
(169, 1, 27, 1, 1, 0, 1, '2022-06-11 05:00:59'),
(190, 1, 105, 1, 0, 0, 0, '2018-07-02 11:13:25'),
(199, 1, 75, 1, 0, 0, 0, '2018-07-02 11:19:46'),
(201, 1, 14, 1, 0, 0, 0, '2018-07-02 11:22:03'),
(203, 1, 16, 1, 0, 0, 0, '2018-07-02 11:24:21'),
(208, 1, 31, 1, 1, 1, 1, '2019-11-30 01:32:51'),
(215, 1, 50, 1, 0, 0, 0, '2018-07-02 12:04:53'),
(216, 1, 51, 1, 0, 0, 0, '2018-07-02 12:04:53'),
(222, 1, 1, 1, 1, 1, 1, '2019-11-27 22:55:06'),
(227, 1, 91, 1, 0, 0, 0, '2018-07-03 01:49:27'),
(230, 10, 53, 0, 1, 0, 0, '2018-07-03 03:52:55'),
(231, 10, 54, 0, 0, 1, 0, '2018-07-03 03:52:55'),
(232, 10, 55, 1, 1, 1, 1, '2018-07-03 03:58:42'),
(233, 10, 56, 0, 0, 1, 0, '2018-07-03 03:52:55'),
(235, 10, 58, 0, 0, 1, 0, '2018-07-03 03:52:55'),
(236, 10, 59, 0, 0, 1, 0, '2018-07-03 03:52:55'),
(239, 10, 1, 1, 1, 1, 1, '2018-07-03 04:16:43'),
(241, 10, 3, 1, 0, 0, 0, '2018-07-03 04:23:56'),
(242, 10, 2, 1, 0, 0, 0, '2018-07-03 04:24:39'),
(243, 10, 4, 1, 0, 1, 1, '2018-07-03 04:31:24'),
(245, 10, 107, 1, 0, 0, 0, '2018-07-03 04:36:41'),
(246, 10, 5, 1, 1, 0, 1, '2018-07-03 04:38:18'),
(247, 10, 7, 1, 1, 1, 1, '2018-07-03 04:42:07'),
(248, 10, 68, 1, 0, 0, 0, '2018-07-03 04:42:53'),
(249, 10, 69, 1, 1, 1, 1, '2018-07-03 04:49:46'),
(250, 10, 70, 1, 0, 0, 1, '2018-07-03 04:52:40'),
(251, 10, 72, 1, 0, 0, 0, '2018-07-03 04:56:46'),
(252, 10, 73, 1, 0, 0, 0, '2018-07-03 04:56:46'),
(253, 10, 74, 1, 0, 0, 0, '2018-07-03 04:58:34'),
(254, 10, 75, 1, 0, 0, 0, '2018-07-03 04:58:34'),
(255, 10, 9, 1, 1, 1, 1, '2018-07-03 05:02:22'),
(256, 10, 10, 1, 1, 1, 1, '2018-07-03 05:03:09'),
(257, 10, 11, 1, 0, 0, 0, '2018-07-03 05:03:09'),
(258, 10, 12, 1, 1, 1, 1, '2018-07-03 05:08:40'),
(259, 10, 13, 1, 1, 1, 1, '2018-07-03 05:08:40'),
(260, 10, 14, 1, 0, 0, 0, '2018-07-03 05:08:53'),
(261, 10, 15, 1, 1, 1, 0, '2018-07-03 05:11:28'),
(262, 10, 16, 1, 0, 0, 0, '2018-07-03 05:12:12'),
(263, 10, 17, 1, 1, 1, 1, '2018-07-03 05:14:30'),
(264, 10, 19, 1, 1, 1, 0, '2018-07-03 05:15:45'),
(265, 10, 20, 1, 1, 1, 1, '2018-07-03 05:18:51'),
(266, 10, 76, 1, 0, 0, 0, '2018-07-03 05:21:21'),
(267, 10, 21, 1, 1, 1, 0, '2018-07-03 05:22:45'),
(268, 10, 22, 1, 1, 1, 1, '2018-07-03 05:25:00'),
(269, 10, 23, 1, 1, 1, 1, '2018-07-03 05:27:16'),
(270, 10, 24, 1, 1, 1, 1, '2018-07-03 05:27:49'),
(271, 10, 25, 1, 1, 1, 1, '2018-07-03 05:27:49'),
(272, 10, 26, 1, 0, 0, 0, '2018-07-03 05:28:25'),
(273, 10, 77, 1, 1, 1, 1, '2018-07-03 05:29:57'),
(274, 10, 27, 1, 1, 0, 1, '2018-07-03 05:30:36'),
(275, 10, 28, 1, 1, 1, 1, '2018-07-03 05:33:09'),
(276, 10, 29, 1, 0, 0, 0, '2018-07-03 05:34:03'),
(277, 10, 30, 1, 0, 0, 0, '2018-07-03 05:34:03'),
(278, 10, 31, 1, 0, 0, 0, '2018-07-03 05:34:03'),
(279, 10, 32, 1, 1, 1, 1, '2018-07-03 05:35:42'),
(280, 10, 33, 1, 1, 1, 1, '2018-07-03 05:36:32'),
(281, 10, 34, 1, 1, 1, 1, '2018-07-03 05:38:03'),
(282, 10, 35, 1, 1, 1, 1, '2018-07-03 05:38:41'),
(283, 10, 104, 1, 1, 1, 1, '2018-07-03 05:40:43'),
(284, 10, 37, 1, 1, 1, 1, '2018-07-03 05:42:42'),
(285, 10, 38, 1, 1, 1, 1, '2018-07-03 05:43:56'),
(286, 10, 39, 1, 1, 1, 1, '2018-07-03 05:45:39'),
(287, 10, 40, 1, 1, 1, 1, '2018-07-03 05:47:22'),
(288, 10, 41, 1, 1, 1, 1, '2018-07-03 05:48:54'),
(289, 10, 42, 1, 1, 1, 1, '2018-07-03 05:49:31'),
(290, 10, 43, 1, 1, 1, 1, '2018-07-03 05:51:15'),
(291, 10, 44, 1, 0, 0, 0, '2018-07-03 05:52:06'),
(292, 10, 46, 1, 0, 0, 0, '2018-07-03 05:52:06'),
(293, 10, 50, 1, 0, 0, 0, '2018-07-03 05:52:59'),
(294, 10, 51, 1, 0, 0, 0, '2018-07-03 05:52:59'),
(295, 10, 60, 0, 0, 1, 0, '2018-07-03 05:55:05'),
(296, 10, 61, 1, 1, 1, 1, '2018-07-03 05:56:52'),
(297, 10, 62, 1, 1, 1, 1, '2018-07-03 05:58:53'),
(298, 10, 63, 1, 1, 0, 0, '2018-07-03 05:59:37'),
(299, 10, 64, 1, 1, 1, 1, '2018-07-03 06:00:27'),
(300, 10, 65, 1, 1, 1, 1, '2018-07-03 06:02:51'),
(301, 10, 66, 1, 1, 1, 1, '2018-07-03 06:02:51'),
(302, 10, 67, 1, 0, 0, 0, '2018-07-03 06:02:51'),
(303, 10, 78, 1, 1, 1, 1, '2018-07-04 04:10:04'),
(310, 1, 119, 1, 0, 0, 0, '2018-07-03 10:15:00'),
(311, 1, 120, 1, 0, 0, 0, '2018-07-03 10:15:00'),
(317, 1, 124, 1, 0, 0, 0, '2018-07-03 10:29:14'),
(320, 1, 47, 1, 0, 0, 0, '2018-07-03 11:01:12'),
(321, 1, 121, 1, 0, 0, 0, '2018-07-03 11:01:12'),
(369, 1, 102, 1, 1, 1, 1, '2019-12-02 05:02:15'),
(372, 10, 79, 1, 1, 0, 0, '2018-07-04 04:10:04'),
(373, 10, 80, 1, 1, 1, 1, '2018-07-04 04:23:09'),
(374, 10, 81, 1, 1, 1, 1, '2018-07-04 04:23:50'),
(375, 10, 82, 1, 1, 1, 1, '2018-07-04 04:26:54'),
(376, 10, 83, 1, 1, 1, 1, '2018-07-04 04:27:55'),
(377, 10, 84, 1, 1, 1, 1, '2018-07-04 04:30:26'),
(378, 10, 85, 1, 1, 1, 1, '2018-07-04 04:32:54'),
(379, 10, 86, 1, 1, 1, 1, '2018-07-04 04:46:18'),
(380, 10, 87, 1, 0, 0, 0, '2018-07-04 04:49:49'),
(381, 10, 88, 1, 1, 1, 0, '2018-07-04 04:51:20'),
(382, 10, 89, 1, 0, 0, 0, '2018-07-04 04:51:51'),
(383, 10, 90, 1, 1, 0, 1, '2018-07-04 04:55:01'),
(384, 10, 91, 1, 0, 0, 0, '2018-07-04 04:55:01'),
(385, 10, 108, 1, 1, 1, 1, '2018-07-04 04:57:46'),
(386, 10, 109, 1, 1, 1, 1, '2018-07-04 04:58:26'),
(387, 10, 110, 1, 1, 1, 1, '2018-07-04 05:02:43'),
(388, 10, 111, 1, 1, 1, 1, '2018-07-04 05:03:21'),
(389, 10, 112, 1, 1, 1, 1, '2018-07-04 05:05:06'),
(390, 10, 127, 1, 0, 0, 0, '2018-07-04 05:05:06'),
(391, 10, 93, 1, 1, 1, 1, '2018-07-04 05:07:14'),
(392, 10, 94, 1, 1, 0, 0, '2018-07-04 05:08:02'),
(394, 10, 95, 1, 0, 0, 0, '2018-07-04 05:08:44'),
(395, 10, 102, 1, 1, 1, 1, '2018-07-04 05:11:02'),
(396, 10, 106, 1, 0, 0, 0, '2018-07-04 05:11:39'),
(397, 10, 113, 1, 0, 0, 0, '2018-07-04 05:12:37'),
(398, 10, 114, 1, 0, 0, 0, '2018-07-04 05:12:37'),
(399, 10, 115, 1, 0, 0, 0, '2018-07-04 05:18:45'),
(400, 10, 116, 1, 0, 0, 0, '2018-07-04 05:18:45'),
(401, 10, 117, 1, 0, 0, 0, '2018-07-04 05:19:43'),
(402, 10, 118, 1, 0, 0, 0, '2018-07-04 05:19:43'),
(434, 1, 125, 1, 0, 0, 0, '2018-07-06 09:59:26'),
(445, 1, 48, 1, 0, 0, 0, '2018-07-06 11:49:35'),
(446, 1, 49, 1, 0, 0, 0, '2018-07-06 11:49:35'),
(462, 1, 95, 1, 0, 0, 0, '2018-07-09 01:18:41'),
(479, 2, 47, 1, 0, 0, 0, '2018-07-10 06:47:12'),
(480, 2, 105, 1, 0, 0, 0, '2018-07-10 06:47:12'),
(482, 2, 119, 1, 0, 0, 0, '2018-07-10 06:47:12'),
(483, 2, 120, 1, 0, 0, 0, '2018-07-10 06:47:12'),
(486, 2, 16, 1, 0, 0, 0, '2018-07-10 06:47:12'),
(493, 2, 22, 1, 0, 0, 0, '2018-07-12 00:20:27'),
(504, 2, 95, 1, 0, 0, 0, '2018-07-10 06:47:12'),
(513, 3, 72, 1, 0, 0, 0, '2018-07-10 07:07:30'),
(517, 3, 75, 1, 0, 0, 0, '2018-07-10 07:10:38'),
(527, 3, 89, 1, 0, 0, 0, '2018-07-10 07:18:44'),
(529, 3, 91, 1, 0, 0, 0, '2018-07-10 07:18:44'),
(549, 3, 124, 1, 0, 0, 0, '2018-07-10 07:22:17'),
(557, 6, 82, 1, 1, 1, 1, '2019-12-01 01:48:28'),
(558, 6, 83, 1, 1, 1, 1, '2019-12-01 01:49:08'),
(559, 6, 84, 1, 1, 1, 1, '2019-12-01 01:49:59'),
(575, 6, 44, 1, 0, 0, 0, '2018-07-10 07:35:33'),
(576, 6, 46, 1, 0, 0, 0, '2018-07-10 07:35:33'),
(578, 6, 102, 1, 1, 1, 1, '2019-12-01 01:52:27'),
(594, 3, 125, 1, 0, 0, 0, '2018-07-10 07:58:12'),
(595, 3, 48, 1, 0, 0, 0, '2018-07-10 07:58:12'),
(596, 3, 49, 1, 0, 0, 0, '2018-07-10 07:58:12'),
(617, 2, 17, 1, 1, 1, 1, '2018-07-11 06:55:14'),
(618, 2, 19, 1, 1, 1, 0, '2018-07-11 06:55:14'),
(620, 2, 76, 1, 1, 1, 0, '2018-07-11 06:55:14'),
(622, 2, 121, 1, 0, 0, 0, '2018-07-11 06:56:27'),
(628, 6, 22, 1, 0, 0, 0, '2018-07-12 00:23:47'),
(634, 4, 102, 1, 1, 1, 1, '2019-12-01 01:03:00'),
(662, 1, 138, 1, 0, 0, 0, '2019-11-01 02:28:24'),
(663, 1, 139, 1, 1, 1, 1, '2019-11-01 02:28:24'),
(664, 1, 140, 1, 1, 1, 1, '2019-11-01 02:28:24'),
(690, 1, 166, 1, 0, 0, 0, '2019-11-01 02:28:24'),
(691, 1, 167, 1, 0, 0, 0, '2019-11-01 02:28:24'),
(692, 1, 168, 1, 0, 0, 0, '2019-11-01 02:28:24'),
(693, 1, 170, 1, 0, 0, 0, '2019-11-01 02:28:24'),
(694, 1, 172, 1, 0, 0, 0, '2019-11-01 02:28:24'),
(695, 1, 173, 1, 0, 0, 0, '2019-11-01 02:28:24'),
(733, 1, 199, 1, 0, 0, 0, '2019-11-26 05:24:30'),
(739, 1, 218, 1, 0, 0, 0, '2019-11-27 06:36:31'),
(743, 1, 218, 1, 0, 0, 0, '2019-11-27 06:36:32'),
(747, 1, 2, 1, 0, 0, 0, '2019-11-27 22:56:08'),
(748, 1, 3, 1, 0, 0, 0, '2021-08-02 12:18:13'),
(751, 1, 128, 0, 1, 0, 1, '2019-11-27 22:57:01'),
(752, 1, 132, 1, 0, 1, 1, '2019-11-27 23:02:23'),
(754, 1, 134, 1, 0, 0, 0, '2021-08-02 12:18:13'),
(755, 1, 5, 1, 1, 0, 1, '2019-11-27 23:35:07'),
(757, 1, 7, 1, 1, 1, 1, '2019-11-27 23:36:35'),
(758, 1, 8, 1, 1, 1, 1, '2019-11-27 23:37:27'),
(760, 1, 68, 1, 0, 0, 0, '2019-11-27 23:38:06'),
(761, 1, 69, 1, 1, 1, 1, '2019-11-27 23:39:06'),
(762, 1, 70, 1, 1, 1, 1, '2019-11-27 23:39:41'),
(763, 1, 71, 1, 0, 0, 0, '2019-11-27 23:39:59'),
(764, 1, 72, 1, 0, 0, 0, '2019-11-27 23:40:11'),
(765, 1, 73, 1, 0, 0, 0, '2019-11-27 23:43:15'),
(766, 1, 74, 1, 0, 0, 0, '2019-11-27 23:43:55'),
(768, 1, 11, 1, 0, 0, 0, '2019-11-27 23:45:46'),
(806, 2, 133, 1, 0, 1, 0, '2019-11-29 00:34:35'),
(810, 2, 1, 1, 1, 1, 1, '2019-11-30 02:54:16'),
(813, 1, 133, 1, 0, 1, 0, '2019-11-29 00:39:57'),
(836, 1, 146, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(838, 1, 148, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(841, 1, 151, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(843, 1, 154, 1, 0, 0, 0, '2019-11-29 01:13:28'),
(862, 1, 155, 1, 0, 0, 0, '2019-11-29 02:07:30'),
(863, 1, 156, 1, 0, 0, 0, '2019-11-29 02:07:52'),
(864, 1, 157, 1, 0, 0, 0, '2019-11-29 02:08:05'),
(875, 1, 159, 1, 0, 0, 0, '2019-11-29 02:14:31'),
(876, 1, 160, 1, 0, 0, 0, '2019-11-29 02:14:44'),
(878, 1, 162, 1, 0, 0, 0, '2019-11-29 02:15:58'),
(879, 1, 163, 1, 0, 0, 0, '2019-11-29 02:16:19'),
(938, 1, 181, 1, 0, 0, 0, '2019-11-29 03:49:33'),
(939, 1, 182, 1, 0, 0, 0, '2019-11-29 03:49:45'),
(940, 1, 183, 1, 0, 0, 0, '2019-11-29 03:49:56'),
(979, 1, 225, 1, 0, 0, 0, '2019-11-29 04:45:30'),
(982, 2, 225, 1, 0, 0, 0, '2019-11-29 04:47:19'),
(1086, 1, 43, 1, 1, 1, 1, '2022-06-11 05:00:59'),
(1103, 2, 205, 1, 1, 1, 1, '2019-11-30 01:56:04'),
(1105, 2, 23, 1, 0, 0, 0, '2019-11-30 01:56:04'),
(1106, 2, 24, 1, 0, 0, 0, '2019-11-30 01:56:04'),
(1107, 2, 25, 1, 0, 0, 0, '2019-11-30 01:56:04'),
(1108, 2, 77, 1, 0, 0, 0, '2019-11-30 01:56:04'),
(1119, 2, 117, 1, 0, 0, 0, '2019-11-30 01:56:04'),
(1123, 3, 8, 1, 1, 1, 1, '2021-09-23 05:37:37'),
(1130, 3, 9, 1, 1, 0, 0, '2021-08-02 11:56:19'),
(1131, 3, 10, 1, 1, 0, 0, '2021-08-02 11:56:19'),
(1134, 3, 35, 1, 1, 1, 1, '2019-11-30 07:25:04'),
(1135, 3, 104, 1, 1, 1, 1, '2019-11-30 07:25:53'),
(1161, 3, 102, 1, 1, 1, 1, '2019-11-30 02:23:13'),
(1163, 3, 113, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1164, 3, 114, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1165, 3, 115, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1166, 3, 116, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1167, 3, 117, 1, 0, 0, 0, '2019-11-30 02:23:13'),
(1171, 2, 142, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1172, 2, 144, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1179, 2, 212, 1, 0, 1, 0, '2019-11-30 02:36:17'),
(1183, 2, 148, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1184, 2, 149, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1185, 2, 150, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1186, 2, 151, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1187, 2, 152, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1188, 2, 153, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1189, 2, 154, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1190, 2, 197, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1191, 2, 198, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1192, 2, 199, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1193, 2, 200, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1194, 2, 201, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1195, 2, 202, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1196, 2, 203, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1197, 2, 219, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1198, 2, 223, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1199, 2, 213, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1201, 2, 230, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1204, 2, 214, 1, 0, 1, 0, '2019-11-30 02:36:17'),
(1206, 2, 224, 1, 0, 0, 0, '2019-11-30 02:36:17'),
(1208, 2, 2, 1, 0, 0, 0, '2019-11-30 02:55:45'),
(1210, 2, 143, 1, 1, 1, 1, '2019-11-30 02:57:28'),
(1211, 2, 145, 1, 0, 0, 0, '2019-11-30 02:57:28'),
(1214, 2, 3, 1, 1, 1, 1, '2019-11-30 03:03:18'),
(1216, 2, 4, 1, 1, 1, 1, '2019-11-30 03:32:56'),
(1218, 2, 128, 0, 1, 0, 1, '2019-11-30 03:37:44'),
(1231, 3, 190, 1, 0, 0, 0, '2019-11-30 03:44:02'),
(1232, 3, 192, 1, 0, 0, 0, '2019-11-30 03:44:02'),
(1233, 3, 226, 1, 0, 0, 0, '2019-11-30 03:44:02'),
(1234, 3, 227, 1, 0, 0, 0, '2019-11-30 03:44:02'),
(1236, 2, 15, 1, 1, 1, 0, '2019-11-30 03:54:25'),
(1239, 2, 122, 1, 0, 0, 0, '2019-11-30 03:57:48'),
(1240, 2, 136, 1, 0, 0, 0, '2019-11-30 03:57:48'),
(1242, 6, 217, 1, 0, 0, 0, '2019-11-30 04:00:13'),
(1243, 6, 224, 1, 0, 0, 0, '2019-11-30 04:00:13'),
(1245, 2, 20, 1, 1, 1, 1, '2019-11-30 04:01:28'),
(1246, 2, 137, 1, 1, 1, 1, '2019-11-30 04:02:40'),
(1248, 2, 141, 1, 1, 1, 1, '2019-11-30 04:04:04'),
(1250, 2, 187, 1, 0, 0, 0, '2019-11-30 04:11:19'),
(1252, 2, 207, 1, 0, 0, 0, '2019-11-30 04:21:21'),
(1253, 2, 208, 1, 0, 1, 0, '2019-11-30 04:22:00'),
(1255, 2, 210, 1, 0, 1, 0, '2019-11-30 04:22:58'),
(1256, 2, 211, 1, 0, 1, 0, '2019-11-30 04:24:03'),
(1257, 2, 21, 1, 0, 0, 0, '2019-11-30 04:32:59'),
(1259, 2, 188, 1, 0, 0, 0, '2019-11-30 04:34:35'),
(1260, 2, 27, 1, 0, 0, 0, '2019-11-30 04:36:13'),
(1262, 2, 43, 1, 1, 1, 1, '2019-11-30 04:39:42'),
(1263, 2, 44, 1, 0, 0, 0, '2019-11-30 04:41:43'),
(1264, 2, 46, 1, 0, 0, 0, '2019-11-30 04:41:43'),
(1265, 2, 217, 1, 0, 0, 0, '2019-11-30 04:41:43'),
(1266, 2, 146, 1, 0, 0, 0, '2019-11-30 04:46:35'),
(1267, 2, 147, 1, 0, 0, 0, '2019-11-30 04:47:37'),
(1269, 2, 164, 1, 0, 0, 0, '2019-11-30 04:51:04'),
(1271, 2, 109, 1, 1, 0, 0, '2019-11-30 05:03:37'),
(1272, 2, 93, 1, 1, 1, 1, '2019-11-30 05:07:25'),
(1273, 2, 94, 1, 1, 0, 0, '2019-11-30 05:07:42'),
(1275, 2, 102, 1, 1, 1, 1, '2019-11-30 05:11:22'),
(1277, 2, 196, 1, 0, 0, 0, '2019-11-30 05:15:01'),
(1278, 2, 195, 1, 0, 0, 0, '2019-11-30 05:19:08'),
(1279, 2, 185, 1, 1, 1, 1, '2019-11-30 05:21:44'),
(1280, 2, 186, 1, 1, 1, 1, '2019-11-30 05:22:43'),
(1281, 2, 222, 1, 0, 1, 0, '2019-11-30 05:24:30'),
(1283, 3, 5, 1, 1, 0, 1, '2021-09-23 05:37:37'),
(1284, 3, 6, 1, 0, 0, 0, '2019-11-30 06:43:29'),
(1285, 3, 7, 1, 1, 1, 1, '2021-09-23 05:37:37'),
(1287, 3, 71, 1, 0, 0, 0, '2019-11-30 07:05:41'),
(1288, 3, 73, 1, 0, 0, 0, '2019-11-30 07:05:59'),
(1289, 3, 74, 1, 0, 0, 0, '2019-11-30 07:06:08'),
(1290, 3, 11, 1, 0, 0, 0, '2019-11-30 07:16:37'),
(1291, 3, 12, 1, 1, 0, 0, '2021-08-02 11:56:19'),
(1292, 3, 13, 1, 1, 0, 0, '2021-08-02 11:56:19'),
(1294, 3, 14, 1, 0, 0, 0, '2019-11-30 07:22:55'),
(1295, 3, 31, 1, 1, 1, 1, '2019-12-02 06:30:37'),
(1297, 3, 37, 1, 1, 1, 1, '2019-11-30 07:28:09'),
(1298, 3, 38, 1, 1, 1, 1, '2019-11-30 07:29:02'),
(1299, 3, 39, 1, 1, 1, 1, '2019-11-30 07:30:07'),
(1301, 3, 44, 1, 0, 0, 0, '2019-11-30 07:44:09'),
(1304, 3, 155, 1, 0, 0, 0, '2019-11-30 07:44:32'),
(1305, 3, 156, 1, 0, 0, 0, '2019-11-30 07:45:18'),
(1306, 3, 157, 1, 0, 0, 0, '2019-11-30 07:45:42'),
(1307, 3, 158, 1, 0, 0, 0, '2019-11-30 07:46:07'),
(1308, 3, 159, 1, 0, 0, 0, '2019-11-30 07:46:21'),
(1309, 3, 160, 1, 0, 0, 0, '2019-11-30 07:46:33'),
(1313, 3, 161, 1, 0, 0, 0, '2019-11-30 07:48:26'),
(1314, 3, 162, 1, 0, 0, 0, '2019-11-30 07:48:48'),
(1315, 3, 163, 1, 0, 0, 0, '2019-11-30 07:48:48'),
(1316, 3, 164, 1, 0, 0, 0, '2019-11-30 07:49:47'),
(1317, 3, 165, 1, 0, 0, 0, '2019-11-30 07:49:47'),
(1318, 3, 174, 1, 0, 0, 0, '2019-11-30 07:49:47'),
(1319, 3, 175, 1, 0, 0, 0, '2019-11-30 07:49:59'),
(1320, 3, 181, 1, 0, 0, 0, '2019-11-30 07:50:08'),
(1322, 4, 28, 1, 1, 1, 1, '2019-12-01 00:52:39'),
(1324, 4, 29, 1, 0, 0, 0, '2019-12-01 00:53:46'),
(1325, 4, 30, 1, 0, 0, 0, '2019-12-01 00:53:59'),
(1326, 4, 123, 1, 0, 0, 0, '2019-12-01 00:54:26'),
(1327, 4, 228, 1, 0, 0, 0, '2019-12-01 00:54:39'),
(1342, 1, 107, 1, 0, 0, 0, '2019-12-01 01:06:44'),
(1343, 4, 117, 1, 0, 0, 0, '2019-12-01 01:10:20'),
(1348, 4, 230, 1, 0, 0, 0, '2019-12-01 01:19:15'),
(1350, 6, 1, 1, 0, 0, 0, '2019-12-01 01:35:32'),
(1351, 6, 21, 1, 0, 0, 0, '2019-12-01 01:36:29'),
(1352, 6, 23, 1, 0, 0, 0, '2019-12-01 01:36:45'),
(1353, 6, 24, 1, 0, 0, 0, '2019-12-01 01:37:05'),
(1354, 6, 25, 1, 0, 0, 0, '2019-12-01 01:37:34'),
(1355, 6, 77, 1, 0, 0, 0, '2019-12-01 01:38:08'),
(1356, 6, 188, 1, 0, 0, 0, '2019-12-01 01:38:45'),
(1357, 6, 43, 1, 1, 1, 1, '2019-12-01 01:40:44'),
(1358, 6, 78, 1, 1, 1, 1, '2019-12-01 01:43:04'),
(1360, 6, 79, 1, 1, 0, 1, '2019-12-01 01:44:39'),
(1361, 6, 80, 1, 1, 1, 1, '2019-12-01 01:45:08'),
(1362, 6, 81, 1, 1, 1, 1, '2019-12-01 01:47:50'),
(1363, 6, 85, 1, 1, 1, 1, '2019-12-01 01:50:43'),
(1364, 6, 86, 1, 0, 0, 0, '2019-12-01 01:51:10'),
(1365, 6, 106, 1, 0, 0, 0, '2019-12-01 01:52:55'),
(1366, 6, 117, 1, 0, 0, 0, '2019-12-01 01:53:08'),
(1395, 1, 113, 1, 0, 0, 0, '2019-12-02 05:20:59'),
(1396, 1, 114, 1, 0, 0, 0, '2019-12-02 05:21:34'),
(1397, 1, 115, 1, 0, 0, 0, '2019-12-02 05:21:34'),
(1398, 1, 116, 1, 0, 0, 0, '2019-12-02 05:21:54'),
(1399, 1, 117, 1, 0, 0, 0, '2019-12-02 05:22:04'),
(1402, 1, 191, 1, 0, 0, 0, '2019-12-02 05:23:34'),
(1403, 1, 192, 1, 0, 0, 0, '2019-12-02 05:23:47'),
(1405, 1, 194, 1, 0, 0, 0, '2019-12-02 05:24:11'),
(1406, 1, 195, 1, 0, 0, 0, '2019-12-02 05:24:20'),
(1408, 1, 227, 1, 0, 0, 0, '2019-12-02 05:25:47'),
(1410, 1, 226, 1, 0, 0, 0, '2019-12-02 05:31:41'),
(1411, 1, 229, 1, 0, 0, 0, '2019-12-02 05:32:57'),
(1412, 1, 230, 1, 0, 0, 0, '2019-12-02 05:32:57'),
(1413, 1, 190, 1, 0, 0, 0, '2019-12-02 05:43:41'),
(1414, 2, 174, 1, 0, 0, 0, '2019-12-02 05:54:37'),
(1415, 2, 175, 1, 0, 0, 0, '2019-12-02 05:54:37'),
(1418, 2, 232, 1, 0, 1, 1, '2019-12-02 06:11:27'),
(1419, 2, 231, 1, 0, 0, 0, '2019-12-02 06:12:28'),
(1422, 3, 32, 1, 1, 1, 1, '2019-12-02 06:30:37'),
(1423, 3, 33, 1, 1, 1, 1, '2019-12-02 06:30:37'),
(1424, 3, 34, 1, 1, 1, 1, '2019-12-02 06:30:37'),
(1425, 3, 182, 1, 0, 0, 0, '2019-12-02 06:30:37'),
(1426, 3, 183, 1, 0, 0, 0, '2019-12-02 06:30:37'),
(1428, 3, 229, 1, 0, 0, 0, '2019-12-02 06:30:37'),
(1429, 3, 230, 1, 0, 0, 0, '2019-12-02 06:30:37'),
(1430, 4, 213, 1, 0, 0, 0, '2019-12-02 06:32:14'),
(1432, 4, 224, 1, 0, 0, 0, '2019-12-02 06:32:14'),
(1433, 4, 195, 1, 0, 0, 0, '2019-12-03 04:57:53'),
(1434, 4, 229, 1, 0, 0, 0, '2019-12-03 04:58:19'),
(1436, 6, 213, 1, 0, 0, 0, '2019-12-03 05:10:11'),
(1437, 6, 191, 1, 0, 0, 0, '2019-12-03 05:10:11'),
(1438, 6, 193, 1, 0, 0, 0, '2019-12-03 05:10:11'),
(1439, 6, 230, 1, 0, 0, 0, '2019-12-03 05:10:11'),
(1440, 2, 106, 1, 0, 0, 0, '2020-01-25 04:21:36'),
(1441, 2, 107, 1, 0, 0, 0, '2020-02-12 02:10:13'),
(1442, 2, 134, 1, 1, 1, 1, '2020-02-12 02:12:36'),
(1444, 2, 86, 1, 0, 0, 0, '2020-02-12 02:22:33'),
(1445, 3, 233, 1, 0, 0, 0, '2020-02-12 03:51:17'),
(1452, 2, 236, 1, 1, 1, 0, '2020-05-29 23:40:33'),
(1453, 2, 237, 1, 0, 1, 0, '2020-05-29 23:40:33'),
(1454, 2, 238, 1, 1, 1, 1, '2020-05-29 23:40:33'),
(1455, 2, 239, 1, 1, 1, 1, '2020-05-29 23:40:33'),
(1456, 2, 240, 1, 0, 0, 0, '2020-05-28 20:51:18'),
(1457, 2, 241, 1, 0, 0, 0, '2020-05-28 20:51:18'),
(1461, 2, 242, 1, 0, 0, 0, '2020-06-11 22:45:24'),
(1463, 6, 242, 1, 0, 0, 0, '2020-06-14 22:48:14'),
(1467, 1, 244, 1, 0, 0, 0, '2020-09-21 06:59:54'),
(1472, 2, 247, 1, 0, 0, 0, '2021-01-21 12:46:40'),
(1475, 2, 248, 1, 1, 1, 1, '2021-05-28 13:11:52'),
(1478, 6, 248, 1, 0, 0, 0, '2021-05-28 09:56:14'),
(1479, 6, 249, 1, 0, 0, 0, '2021-05-28 09:56:14'),
(1480, 2, 249, 1, 0, 0, 0, '2021-05-28 13:11:52'),
(1481, 3, 146, 1, 0, 0, 0, '2021-08-02 11:56:19'),
(1482, 3, 148, 1, 0, 0, 0, '2021-08-02 11:56:19'),
(1483, 3, 150, 1, 0, 0, 0, '2021-08-02 11:56:19'),
(1484, 3, 151, 1, 0, 0, 0, '2021-08-02 11:56:19'),
(1485, 3, 1, 1, 1, 1, 0, '2021-08-03 11:03:11'),
(1486, 3, 2, 1, 0, 0, 0, '2021-08-03 11:03:11'),
(1487, 3, 3, 1, 1, 1, 0, '2021-08-03 11:03:11'),
(1488, 8, 1, 1, 1, 1, 0, '2021-09-03 05:52:26'),
(1489, 8, 3, 1, 1, 1, 0, '2021-09-03 05:52:26'),
(1490, 8, 107, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1491, 8, 128, 0, 1, 0, 0, '2021-09-03 05:52:26'),
(1492, 8, 134, 1, 0, 1, 0, '2021-09-03 05:52:26'),
(1493, 8, 15, 1, 1, 1, 0, '2021-09-03 05:52:26'),
(1494, 8, 122, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1495, 8, 20, 1, 1, 1, 0, '2021-09-03 05:52:26'),
(1496, 8, 137, 1, 1, 1, 0, '2021-09-03 05:52:26'),
(1497, 8, 143, 0, 1, 1, 0, '2021-09-03 05:52:26'),
(1498, 8, 205, 1, 1, 1, 0, '2021-09-03 05:52:26'),
(1499, 8, 207, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1500, 8, 208, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1501, 8, 210, 1, 0, 1, 0, '2021-09-03 05:52:26'),
(1502, 8, 211, 1, 0, 1, 0, '2021-09-03 05:52:26'),
(1503, 8, 21, 1, 0, 1, 0, '2021-09-03 05:52:26'),
(1504, 8, 23, 1, 1, 0, 0, '2021-09-03 05:52:26'),
(1505, 8, 24, 1, 1, 0, 0, '2021-09-03 05:52:26'),
(1506, 8, 25, 1, 1, 0, 0, '2021-09-03 05:52:26'),
(1507, 8, 77, 1, 1, 1, 0, '2021-09-03 05:52:26'),
(1508, 8, 145, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1509, 8, 27, 1, 1, 0, 0, '2021-09-03 05:52:26'),
(1510, 8, 43, 1, 1, 1, 1, '2021-09-03 05:52:26'),
(1511, 8, 44, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1512, 8, 146, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1513, 8, 147, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1514, 8, 148, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1515, 8, 149, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1516, 8, 150, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1517, 8, 151, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1518, 8, 153, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1519, 8, 154, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1520, 8, 155, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1521, 8, 156, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1522, 8, 164, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1523, 8, 197, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1524, 8, 198, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1525, 8, 200, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1526, 8, 201, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1527, 8, 219, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1528, 8, 223, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1529, 8, 240, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1530, 8, 241, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1531, 8, 244, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1532, 8, 245, 1, 0, 0, 0, '2021-09-03 05:52:26'),
(1533, 8, 93, 1, 1, 1, 1, '2022-03-21 04:12:25'),
(1534, 8, 94, 1, 1, 0, 0, '2021-09-03 05:52:26'),
(1535, 8, 98, 1, 1, 0, 0, '2021-09-03 05:52:26'),
(1536, 8, 102, 1, 1, 1, 1, '2021-09-03 05:52:26'),
(1537, 8, 236, 1, 1, 1, 0, '2021-09-03 05:52:26'),
(1538, 8, 237, 1, 0, 1, 0, '2021-09-03 05:52:26'),
(1539, 8, 238, 1, 1, 1, 1, '2021-09-03 05:52:26'),
(1540, 8, 239, 1, 1, 1, 1, '2021-09-03 05:52:26'),
(1541, 3, 231, 1, 1, 1, 1, '2021-09-13 07:12:44'),
(1542, 1, 24, 1, 1, 1, 1, '2022-06-11 05:00:59'),
(1543, 1, 25, 1, 1, 1, 1, '2022-06-11 05:00:59'),
(1544, 1, 93, 1, 1, 1, 1, '2022-06-11 05:00:59'),
(1545, 1, 94, 1, 1, 0, 0, '2022-06-11 05:00:59'),
(1546, 1, 236, 1, 1, 1, 0, '2022-06-11 05:00:59'),
(1547, 3, 68, 1, 0, 0, 0, '2021-09-23 05:37:37'),
(1548, 3, 69, 1, 1, 1, 1, '2021-09-23 05:37:37'),
(1549, 3, 70, 1, 1, 1, 1, '2021-09-23 05:37:37'),
(1550, 4, 1, 1, 1, 1, 0, '2021-11-28 16:23:06'),
(1551, 4, 3, 0, 1, 1, 0, '2021-11-28 16:23:06'),
(1553, 4, 15, 1, 1, 0, 0, '2021-11-28 16:48:11'),
(1554, 4, 122, 1, 0, 0, 0, '2021-11-28 16:23:06'),
(1555, 4, 21, 1, 0, 0, 0, '2021-11-28 16:23:06'),
(1556, 4, 23, 1, 0, 0, 0, '2021-11-28 16:23:06'),
(1557, 4, 24, 1, 0, 0, 0, '2021-11-28 16:23:06'),
(1559, 4, 145, 1, 0, 0, 0, '2021-11-28 16:23:06'),
(1560, 4, 27, 1, 0, 0, 0, '2021-11-28 16:23:06'),
(1561, 4, 78, 1, 1, 1, 0, '2021-11-28 16:23:06'),
(1562, 4, 79, 1, 1, 0, 0, '2021-11-28 16:23:06'),
(1563, 4, 80, 1, 1, 1, 0, '2021-11-28 16:23:06'),
(1564, 4, 81, 1, 1, 1, 0, '2021-11-28 16:23:06'),
(1565, 4, 82, 1, 1, 1, 0, '2021-11-28 16:23:06'),
(1566, 4, 83, 1, 1, 1, 0, '2021-11-28 16:23:06'),
(1567, 4, 84, 1, 1, 1, 0, '2021-11-28 16:23:06'),
(1568, 4, 185, 1, 0, 0, 0, '2021-11-28 16:23:06'),
(1569, 4, 191, 1, 0, 0, 0, '2021-11-28 16:37:28'),
(1570, 4, 193, 1, 0, 0, 0, '2021-11-28 16:37:28'),
(1571, 4, 20, 1, 0, 0, 0, '2021-11-28 16:48:11'),
(1572, 4, 137, 1, 0, 0, 0, '2021-11-28 16:48:11'),
(1573, 4, 142, 1, 0, 0, 0, '2021-11-28 16:48:11'),
(1574, 4, 187, 1, 0, 0, 0, '2021-11-28 16:48:11'),
(1575, 4, 205, 1, 0, 0, 0, '2021-11-28 16:48:11'),
(1576, 4, 211, 1, 0, 0, 0, '2021-11-28 16:48:11'),
(1577, 4, 212, 1, 0, 0, 0, '2021-11-28 16:48:11'),
(1578, 4, 77, 1, 0, 0, 0, '2021-11-28 16:48:11'),
(1581, 4, 109, 1, 1, 0, 0, '2021-11-28 16:48:11'),
(1582, 4, 93, 1, 0, 0, 0, '2021-11-28 16:48:11'),
(1583, 4, 98, 1, 1, 0, 0, '2021-11-28 16:48:11'),
(1584, 4, 99, 1, 0, 0, 0, '2021-11-28 16:48:11'),
(1585, 1, 231, 1, 1, 1, 1, '2022-01-03 09:39:29'),
(1586, 1, 86, 1, 1, 1, 1, '2022-06-11 04:51:35'),
(1587, 9, 1, 1, 1, 1, 1, '2022-01-03 10:16:40'),
(1588, 9, 2, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1589, 9, 3, 1, 1, 1, 1, '2022-01-03 10:16:40'),
(1590, 9, 4, 1, 1, 1, 1, '2022-01-03 10:16:40'),
(1591, 9, 107, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1592, 9, 128, 0, 1, 0, 1, '2022-01-03 10:16:40'),
(1593, 9, 134, 1, 1, 1, 1, '2022-01-03 10:16:40'),
(1594, 9, 15, 1, 1, 0, 0, '2022-01-09 06:37:47'),
(1595, 9, 122, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1596, 9, 20, 1, 1, 0, 0, '2022-01-03 10:16:40'),
(1597, 9, 137, 1, 1, 0, 0, '2022-01-03 10:16:40'),
(1598, 9, 141, 1, 1, 0, 0, '2022-01-03 10:16:40'),
(1599, 9, 142, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1600, 9, 143, 1, 1, 0, 0, '2022-01-03 10:16:40'),
(1601, 9, 144, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1602, 9, 21, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1603, 9, 23, 1, 1, 0, 0, '2022-01-03 10:16:40'),
(1604, 9, 24, 1, 1, 0, 0, '2022-01-03 10:16:40'),
(1605, 9, 25, 1, 1, 0, 0, '2022-01-03 10:16:40'),
(1606, 9, 26, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1607, 9, 77, 1, 1, 0, 0, '2022-01-03 10:16:40'),
(1608, 9, 145, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1609, 9, 188, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1610, 9, 27, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1611, 9, 43, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1612, 9, 44, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1614, 9, 217, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1615, 9, 146, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1616, 9, 147, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1617, 9, 148, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1618, 9, 149, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1619, 9, 150, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1620, 9, 151, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1621, 9, 152, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1622, 9, 153, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1623, 9, 154, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1625, 9, 117, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1626, 9, 118, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1627, 9, 195, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1628, 9, 224, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1629, 9, 231, 1, 1, 0, 0, '2022-01-03 10:16:40'),
(1630, 9, 232, 1, 0, 0, 0, '2022-01-03 10:16:40'),
(1631, 9, 236, 1, 1, 0, 0, '2022-01-09 06:37:47'),
(1632, 9, 237, 1, 0, 0, 0, '2022-01-09 06:37:47'),
(1633, 9, 238, 1, 1, 0, 0, '2022-01-09 06:37:47'),
(1634, 9, 239, 1, 1, 0, 0, '2022-01-09 06:37:47'),
(1635, 8, 144, 1, 0, 0, 0, '2022-03-21 04:12:25'),
(1636, 8, 187, 1, 0, 0, 0, '2022-03-21 04:12:25'),
(1637, 8, 196, 1, 0, 0, 0, '2022-03-21 04:12:25'),
(1638, 8, 212, 1, 0, 1, 0, '2022-03-21 04:12:25'),
(1639, 8, 188, 1, 1, 1, 0, '2022-03-21 04:12:25'),
(1642, 8, 202, 1, 0, 0, 0, '2022-03-21 04:12:25'),
(1643, 8, 203, 1, 0, 0, 0, '2022-03-21 04:12:25'),
(1644, 8, 117, 1, 0, 0, 0, '2022-03-21 04:12:25'),
(1645, 8, 195, 1, 0, 0, 0, '2022-03-21 04:12:25'),
(1646, 8, 230, 1, 0, 0, 0, '2022-03-21 04:12:25'),
(1647, 8, 185, 1, 1, 1, 1, '2022-03-21 04:12:25'),
(1648, 8, 186, 1, 1, 1, 1, '2022-03-21 04:12:25'),
(1649, 8, 214, 1, 0, 1, 0, '2022-03-21 04:12:25'),
(1650, 8, 222, 1, 0, 1, 0, '2022-03-21 04:12:25'),
(1651, 8, 247, 1, 0, 0, 0, '2022-03-21 04:12:25'),
(1652, 8, 232, 1, 0, 0, 0, '2022-03-21 04:12:25'),
(1653, 8, 86, 1, 1, 1, 0, '2022-03-21 08:31:50'),
(1654, 1, 87, 1, 0, 0, 0, '2022-06-11 04:51:35'),
(1656, 1, 127, 1, 0, 0, 0, '2022-06-11 04:54:32'),
(1657, 1, 6, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1658, 1, 135, 1, 0, 1, 0, '2022-06-11 05:00:59'),
(1659, 1, 15, 1, 1, 1, 0, '2022-06-11 05:00:59'),
(1660, 1, 122, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1661, 1, 21, 1, 0, 1, 0, '2022-06-11 05:00:59'),
(1662, 1, 23, 1, 1, 1, 1, '2022-06-11 05:00:59'),
(1663, 1, 77, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1664, 1, 145, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1665, 1, 188, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1666, 1, 44, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1667, 1, 46, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1668, 1, 217, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1669, 1, 149, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1670, 1, 150, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1671, 1, 153, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1672, 1, 164, 1, 0, 0, 0, '2022-06-11 05:00:59'),
(1674, 1, 55, 1, 1, 1, 0, '2022-06-11 05:14:40'),
(1675, 1, 56, 1, 0, 1, 0, '2022-06-11 05:14:40'),
(1676, 1, 130, 1, 1, 0, 0, '2022-06-11 05:14:40'),
(1677, 1, 131, 1, 0, 0, 0, '2022-06-11 05:14:40'),
(1678, 1, 112, 1, 1, 1, 1, '2022-06-11 05:14:40'),
(1679, 1, 58, 1, 0, 1, 0, '2022-06-11 05:16:10'),
(1681, 1, 126, 1, 0, 0, 0, '2022-06-11 05:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `id` int(11) NOT NULL,
  `room_type` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `school_houses`
--

CREATE TABLE `school_houses` (
  `id` int(11) NOT NULL,
  `house_name` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sch_settings`
--

CREATE TABLE `sch_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `biometric` int(11) DEFAULT 0,
  `biometric_device` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `languages` varchar(500) NOT NULL,
  `dise_code` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) NOT NULL,
  `time_format` varchar(255) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `is_rtl` varchar(10) DEFAULT 'disabled',
  `is_duplicate_fees_invoice` int(1) DEFAULT 0,
  `timezone` varchar(30) DEFAULT 'UTC',
  `session_id` int(11) DEFAULT NULL,
  `cron_secret_key` varchar(100) NOT NULL,
  `currency_place` varchar(50) NOT NULL DEFAULT 'before_number',
  `class_teacher` varchar(100) NOT NULL,
  `start_month` varchar(40) NOT NULL,
  `attendence_type` int(10) NOT NULL DEFAULT 0,
  `image` varchar(100) DEFAULT NULL,
  `admin_logo` varchar(255) NOT NULL,
  `admin_small_logo` varchar(255) NOT NULL,
  `theme` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `fee_due_days` int(3) DEFAULT 0,
  `adm_auto_insert` int(1) NOT NULL DEFAULT 1,
  `adm_prefix` varchar(50) NOT NULL DEFAULT 'ssadm19/20',
  `adm_start_from` varchar(11) NOT NULL,
  `adm_no_digit` int(10) NOT NULL DEFAULT 6,
  `adm_update_status` int(11) NOT NULL DEFAULT 0,
  `staffid_auto_insert` int(11) NOT NULL DEFAULT 1,
  `staffid_prefix` varchar(100) NOT NULL DEFAULT 'staffss/19/20',
  `staffid_start_from` varchar(50) NOT NULL,
  `staffid_no_digit` int(11) NOT NULL DEFAULT 6,
  `staffid_update_status` int(11) NOT NULL DEFAULT 0,
  `is_active` varchar(255) DEFAULT 'no',
  `online_admission` int(1) DEFAULT 0,
  `online_admission_payment` varchar(50) NOT NULL,
  `online_admission_amount` float NOT NULL,
  `online_admission_instruction` text NOT NULL,
  `online_admission_conditions` text NOT NULL,
  `is_blood_group` int(10) NOT NULL DEFAULT 1,
  `is_student_house` int(10) NOT NULL DEFAULT 1,
  `roll_no` int(11) NOT NULL DEFAULT 1,
  `category` int(11) NOT NULL,
  `religion` int(11) NOT NULL DEFAULT 1,
  `cast` int(11) NOT NULL DEFAULT 1,
  `mobile_no` int(11) NOT NULL DEFAULT 1,
  `student_email` int(11) NOT NULL DEFAULT 1,
  `admission_date` int(11) NOT NULL DEFAULT 1,
  `lastname` int(11) NOT NULL,
  `middlename` int(11) NOT NULL DEFAULT 1,
  `student_photo` int(11) NOT NULL DEFAULT 1,
  `student_height` int(11) NOT NULL DEFAULT 1,
  `student_weight` int(11) NOT NULL DEFAULT 1,
  `measurement_date` int(11) NOT NULL DEFAULT 1,
  `father_name` int(11) NOT NULL DEFAULT 1,
  `father_phone` int(11) NOT NULL DEFAULT 1,
  `father_occupation` int(11) NOT NULL DEFAULT 1,
  `father_pic` int(11) NOT NULL DEFAULT 1,
  `mother_name` int(11) NOT NULL DEFAULT 1,
  `mother_phone` int(11) NOT NULL DEFAULT 1,
  `mother_occupation` int(11) NOT NULL DEFAULT 1,
  `mother_pic` int(11) NOT NULL DEFAULT 1,
  `guardian_name` int(1) NOT NULL,
  `guardian_relation` int(11) NOT NULL DEFAULT 1,
  `guardian_phone` int(1) NOT NULL,
  `test` int(11) NOT NULL,
  `guardian_email` int(11) NOT NULL DEFAULT 1,
  `guardian_pic` int(11) NOT NULL DEFAULT 1,
  `guardian_occupation` int(1) NOT NULL,
  `guardian_address` int(11) NOT NULL DEFAULT 1,
  `current_address` int(11) NOT NULL DEFAULT 1,
  `permanent_address` int(11) NOT NULL DEFAULT 1,
  `route_list` int(11) NOT NULL DEFAULT 1,
  `hostel_id` int(11) NOT NULL DEFAULT 1,
  `bank_account_no` int(11) NOT NULL DEFAULT 1,
  `ifsc_code` int(1) NOT NULL,
  `bank_name` int(1) NOT NULL,
  `national_identification_no` int(11) NOT NULL DEFAULT 1,
  `local_identification_no` int(11) NOT NULL DEFAULT 1,
  `rte` int(11) NOT NULL DEFAULT 1,
  `previous_school_details` int(11) NOT NULL DEFAULT 1,
  `student_note` int(11) NOT NULL DEFAULT 1,
  `upload_documents` int(11) NOT NULL DEFAULT 1,
  `staff_designation` int(11) NOT NULL DEFAULT 1,
  `staff_department` int(11) NOT NULL DEFAULT 1,
  `staff_last_name` int(11) NOT NULL DEFAULT 1,
  `staff_father_name` int(11) NOT NULL DEFAULT 1,
  `staff_mother_name` int(11) NOT NULL DEFAULT 1,
  `staff_date_of_joining` int(11) NOT NULL DEFAULT 1,
  `staff_phone` int(11) NOT NULL DEFAULT 1,
  `staff_emergency_contact` int(11) NOT NULL DEFAULT 1,
  `staff_marital_status` int(11) NOT NULL DEFAULT 1,
  `staff_photo` int(11) NOT NULL DEFAULT 1,
  `staff_current_address` int(11) NOT NULL DEFAULT 1,
  `staff_permanent_address` int(11) NOT NULL DEFAULT 1,
  `staff_qualification` int(11) NOT NULL DEFAULT 1,
  `staff_work_experience` int(11) NOT NULL DEFAULT 1,
  `staff_note` int(11) NOT NULL DEFAULT 1,
  `staff_epf_no` int(11) NOT NULL DEFAULT 1,
  `staff_basic_salary` int(11) NOT NULL DEFAULT 1,
  `staff_contract_type` int(11) NOT NULL DEFAULT 1,
  `staff_work_shift` int(11) NOT NULL DEFAULT 1,
  `staff_work_location` int(11) NOT NULL DEFAULT 1,
  `staff_leaves` int(11) NOT NULL DEFAULT 1,
  `staff_account_details` int(11) NOT NULL DEFAULT 1,
  `staff_social_media` int(11) NOT NULL DEFAULT 1,
  `staff_upload_documents` int(11) NOT NULL DEFAULT 1,
  `mobile_api_url` tinytext NOT NULL,
  `app_primary_color_code` varchar(20) DEFAULT NULL,
  `app_secondary_color_code` varchar(20) DEFAULT NULL,
  `app_logo` varchar(250) DEFAULT NULL,
  `student_profile_edit` int(1) NOT NULL DEFAULT 0,
  `start_week` varchar(10) NOT NULL,
  `my_question` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sch_settings`
--

INSERT INTO `sch_settings` (`id`, `name`, `biometric`, `biometric_device`, `email`, `phone`, `address`, `lang_id`, `languages`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `is_duplicate_fees_invoice`, `timezone`, `session_id`, `cron_secret_key`, `currency_place`, `class_teacher`, `start_month`, `attendence_type`, `image`, `admin_logo`, `admin_small_logo`, `theme`, `fee_due_days`, `adm_auto_insert`, `adm_prefix`, `adm_start_from`, `adm_no_digit`, `adm_update_status`, `staffid_auto_insert`, `staffid_prefix`, `staffid_start_from`, `staffid_no_digit`, `staffid_update_status`, `is_active`, `online_admission`, `online_admission_payment`, `online_admission_amount`, `online_admission_instruction`, `online_admission_conditions`, `is_blood_group`, `is_student_house`, `roll_no`, `category`, `religion`, `cast`, `mobile_no`, `student_email`, `admission_date`, `lastname`, `middlename`, `student_photo`, `student_height`, `student_weight`, `measurement_date`, `father_name`, `father_phone`, `father_occupation`, `father_pic`, `mother_name`, `mother_phone`, `mother_occupation`, `mother_pic`, `guardian_name`, `guardian_relation`, `guardian_phone`, `test`, `guardian_email`, `guardian_pic`, `guardian_occupation`, `guardian_address`, `current_address`, `permanent_address`, `route_list`, `hostel_id`, `bank_account_no`, `ifsc_code`, `bank_name`, `national_identification_no`, `local_identification_no`, `rte`, `previous_school_details`, `student_note`, `upload_documents`, `staff_designation`, `staff_department`, `staff_last_name`, `staff_father_name`, `staff_mother_name`, `staff_date_of_joining`, `staff_phone`, `staff_emergency_contact`, `staff_marital_status`, `staff_photo`, `staff_current_address`, `staff_permanent_address`, `staff_qualification`, `staff_work_experience`, `staff_note`, `staff_epf_no`, `staff_basic_salary`, `staff_contract_type`, `staff_work_shift`, `staff_work_location`, `staff_leaves`, `staff_account_details`, `staff_social_media`, `staff_upload_documents`, `mobile_api_url`, `app_primary_color_code`, `app_secondary_color_code`, `app_logo`, `student_profile_edit`, `start_week`, `my_question`, `created_at`, `updated_at`) VALUES
(1, 'Cambridge IELTS Academy', 0, '', 'Info@ieltsatcia.com', '+94 117 711 766', 'Cambridge IELTS Academy (Pvt) Ltd,\r\nNo: 35, S De S Jayasinghe Mawatha,\r\nKalubowila, Sri Lanka.', 4, '[\"4\"]', '', 'm/d/Y', '12-hour', 'LKR', 'Rs.', 'disabled', 0, 'Asia/Colombo', 16, '', 'after_number', 'yes', '1', 0, '1.jpg', '1.png', '1.png', 'red.jpg', 30, 0, 'YGC/2021/', '0700', 4, 1, 1, 'YGC/S/', '000', 3, 1, 'no', 1, 'no', 10000, '', '<p>&nbsp;Please enter your institution online admission terms &amp; conditions here.</p>\r\n', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '', '#424242', '#eeeeee', '1.png', 0, 'Monday', 1, '2023-01-18 13:33:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '1', 'no', '2021-08-01 05:47:15', NULL),
(2, '2', 'no', '2021-08-01 05:47:24', NULL),
(3, '3', 'no', '2021-08-01 05:47:28', NULL),
(4, '4', 'no', '2021-08-01 05:47:31', NULL),
(5, '5', 'no', '2021-08-01 05:47:35', NULL),
(6, '6', 'no', '2021-08-01 05:47:39', NULL),
(7, '7', 'no', '2021-08-29 19:27:28', NULL),
(8, '8', 'no', '2021-08-29 19:27:34', NULL),
(9, '9', 'no', '2021-08-29 19:32:38', NULL),
(10, '10', 'no', '2021-08-29 19:32:43', NULL),
(11, '11', 'no', '2022-01-21 05:52:24', NULL),
(12, '12', 'no', '2022-01-21 05:52:30', NULL),
(13, '13', 'no', '2022-01-21 05:52:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `send_notification`
--

CREATE TABLE `send_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` text DEFAULT NULL,
  `visible_student` varchar(10) NOT NULL DEFAULT 'no',
  `visible_staff` varchar(10) NOT NULL DEFAULT 'no',
  `visible_parent` varchar(10) NOT NULL DEFAULT 'no',
  `created_by` varchar(60) DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `send_notification`
--

INSERT INTO `send_notification` (`id`, `title`, `publish_date`, `date`, `message`, `visible_student`, `visible_staff`, `visible_parent`, `created_by`, `created_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Test Message', '2022-03-06', '2022-03-06', '<p>jt<br></p>', 'No', 'Yes', 'No', 'Academic Coordinator', 5, 'no', '2022-03-06 03:30:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES
(15, '2020-21', 'no', '2016-10-01 05:28:08', '0000-00-00'),
(16, '2021-22', 'no', '2016-10-01 05:28:20', '0000-00-00'),
(18, '2022-23', 'no', '2016-10-01 05:29:02', '0000-00-00'),
(19, '2023-24', 'no', '2016-10-01 05:29:10', '0000-00-00'),
(20, '2024-25', 'no', '2016-10-01 05:29:18', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `sms_config`
--

CREATE TABLE `sms_config` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `api_id` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `senderid` varchar(100) NOT NULL,
  `contact` text DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'disabled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`id`, `source`, `description`) VALUES
(1, 'Facebook', ''),
(2, 'Leaflet', ''),
(3, 'Friend', ''),
(4, 'YouTube', ''),
(5, 'Paper', ''),
(6, 'Referral', ''),
(7, 'Web site', '');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `department` int(11) DEFAULT 0,
  `designation` int(11) DEFAULT 0,
  `qualification` varchar(200) NOT NULL,
  `work_exp` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `emergency_contact_no` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `account_title` varchar(200) NOT NULL,
  `bank_account_no` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `bank_branch` varchar(100) NOT NULL,
  `payscale` varchar(200) NOT NULL,
  `basic_salary` varchar(200) NOT NULL,
  `epf_no` varchar(200) NOT NULL,
  `contract_type` varchar(100) NOT NULL,
  `shift` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `joining_letter` varchar(200) NOT NULL,
  `resignation_letter` varchar(200) NOT NULL,
  `other_document_name` varchar(200) NOT NULL,
  `other_document_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `verification_code` varchar(100) NOT NULL,
  `disable_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `disable_at`) VALUES
(1, '9000', 0, 0, 0, '', '', 'Jayanga', '', '', '', '', '', 'jayanga.kandearachchi@gmail.com', '2020-01-01', 'Single', '0000-00-00', '0000-00-00', '', '', '', '1.jpg', '$2y$10$L/TeLlPE1DycZZbDC45RcOv2ej6Fr5vLGyycJ05ff2/JwVEu6GFIC', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL),
(2, '1', 0, 1, 1, '', '', 'Roshane', 'Perera', '', '', '', '', 'ygcampus2020@gmail.com', '1995-01-02', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$FqICACVwFqStbv7PYx6rx.uu0iaTYbryiAXC36DyS1soaup9KctdK', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, 'Y1ZiMk8way9MTkZBeE1mNFJOVVZnTE5WVktZdnFIUXFyKy9iYVpYTVg2RT0=', NULL),
(3, 'YGC/S/002', 0, 2, 0, '', '', 'Asela', 'Perera', '', '', '', '', 'maxjayanga@gmail.com', '2021-08-04', 'Single', '2021-08-04', '0000-00-00', '', '', '', '', '$2y$10$xaBe9xP6pCcgPrpRWdtUJe1Ny9zxu3e6j5/sSh1LMGGPB1CDgCBVC', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 'OW4xd0txdzZqSG11SzdYQ21KM2tVYzAxTmMvcDdrdlVRbGowR0NPQVYzUT0=', '2022-01-03'),
(4, 'YGC/S/003', 0, 2, 0, '', '', 'Kalani', 'Panapitiya', '', '', '', '', 'finance@yorkgraduatecampus.com', '1984-09-18', 'Single', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$I49C7Tv0IFxPvX4QmueWrexhW8q.74KdfVDzoPg.FdoZuq4jt9QQi', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(5, 'YGC/S/004', 0, 3, 8, '', '', 'Eshini', 'Siriwardena', '', '', '', '', 'pgc@yorkgraduatecampus.com', '1992-12-29', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$IoT80ZK1AcBCj6eOYPNN8u0CdVwdUSnCAee8/HcnEb60303nffdhi', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(6, 'YGC/S/005', 0, 2, 10, '', '', 'Shanika', '', '', '', '', '', 'accountant.yisk@yorkinternational.lk', '2014-01-01', '', '2021-09-01', '0000-00-00', '', '', '', '', '$2y$10$o8mB7ISKQ6.EfY9clSwPUeyfKUPLBRv3YNz3lZdkx.adxvW8cb9Re', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', '2022-01-03'),
(7, 'YGC/S/006', 0, 5, 2, '', '', 'student', 'cordinator', '', '', '', '', 'etest7803@gmail.com', '2021-07-14', 'Single', '2021-10-26', '0000-00-00', '', '', '', '', '$2y$10$jRum07cD/02X9Ho2dTa0VO/LBBdV7fhWvoMq86Yf2rKDyz2Z21I1u', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', '2022-01-03'),
(8, 'YGC/S/007', 0, 3, 5, '', '', 'Lecturer1', 'IT', '', '', '', '', 'maxasela@gmail.com', '2021-11-10', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$wXu6ybAxpoC8QHcVY4iojO81WSazYxOS9euK/RPpljvIzyMjMl9Xe', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', '2022-01-03'),
(9, 'YGC/S/008', 0, 5, 2, '', '', 'Chamudi', '', '', '', '', '', 'chamudi9293@gmail.com', '2021-11-01', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$NeBaMNMnnYXbwWCmfYbVKO7B73VFADVLUHhSOsFS9m4gESAaYiYJe', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, 'eWdsNmgzb1ZzcEJ6VVpjT0ZlWG1SckREQUo1MGtPczkzZW5pbDVCK3V6UT0=', NULL),
(10, 'YGC/S/009', 0, 5, 2, '', '', 'Jithmi', 'Perera', '', '', '', '', 'jithmiperera05@gmail.com', '2021-11-01', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$RPEn6wcB2/Uwy64rZ.4lGO1OHId4sjmupIdZnDIo3HwzTdvrHymSu', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', '2022-08-17'),
(11, 'YGC/S/010', 0, 5, 2, '', '', 'Shashini', '', '', '', '', '', 'shashiruygc@gmail.com', '2021-11-01', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$aQiqyCyKUgPQIxfL9ILiueTCJq0EMNq5KcfPNwnfIqWVeIMWEOqqm', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(12, 'YGC/S/011', 0, 5, 2, '', '', 'Vishwa', 'Wickramage', '', '', '', '', 'Lucifervish2001@gmail.com', '2021-09-07', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$rK6DvfdeOfTIdzn01hCi5uQ1AzEeqsEWkWSAWZoJ2GhpHeM7FJ7ZW', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(13, 'YGC/S/012', 0, 5, 2, '', '', 'Yeshika', '', '', '', '', '', 'Yeshikaygc@gmail.com', '2021-11-03', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$vcOicN6RGE4khP8vajaINuJQNRqhcEYS3dKPFVqs4pToDBe/fUU2q', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(14, 'YGC/S/013', 0, 5, 2, '', '', 'Sean', '', '', '', '', '', 'Seanblackett06@gmail.com', '2021-11-01', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$pH4eSCvoMjAShKdXDbcoJezxHMGCjyJgSqypccj9.to1lwUty.0ga', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(15, 'YGC/S/014', 0, 1, 11, '', '', 'Samithka', 'Marcelline', '', '', '0771186651', '', 'hrexecutive@yorkgraduatecampus.com', '1999-05-17', 'Single', '2021-12-13', '0000-00-00', '', '', '', '', '$2y$10$ZtaDrITkoZJFpt4S0nfwduyFuAGLRUMpTJR8A88mXy5eo4SSjIaZ.', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL),
(16, 'YGC/S/015', 0, 3, 6, '', '', 'Sam', 'MARCELLINE', '', '', '', '', 'ni@gmail.com', '2022-03-03', 'Single', '2022-03-16', '0000-00-00', '', '', '', '', '$2y$10$Y1.Ju4rJlCO.zpouZQE.w.O0HVaiCwO0jhazwfaio2toMeuTXt29O', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(17, 'YGC/S/016', 0, 1, 1, '', '', 'admin', 'account', '', '', '', '', 'aselaperera321@gmail.com', '2022-06-02', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$X6WG2J2g/RUAY/hfa5WQV./xHTuRBVAijsXP95Gok/7K1KrlAflxi', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', NULL),
(18, '90001', 0, 0, 0, '', '', 'Maneth', 'Ovindu', '', '', '', '', 'smpmaneth@gmail.com', '2020-01-01', 'Single', '0000-00-00', '0000-00-00', '', '', '', '1.jpg', '$2a$09$H5Exz5sTQantoAiSEtWAP.WA5Y6.cZgFFhH.whBV3GyjmUTy4.Cka', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `staff_attendance_type_id` int(11) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance_type`
--

CREATE TABLE `staff_attendance_type` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_attendance_type`
--

INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00'),
(2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00'),
(3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00'),
(4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2018-05-07 01:56:16', '0000-00-00'),
(5, 'Holiday', 'H', 'yes', '0000-00-00 00:00:00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_designation`
--

INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES
(1, 'Director Marketing', 'yes'),
(2, 'Student Coordinator ', 'yes'),
(3, 'Head of Academic', 'yes'),
(4, 'Receptionist ', 'yes'),
(5, 'Visiting Lecturer - IT', 'yes'),
(6, 'Visiting Lecturer - English', 'yes'),
(7, 'Visiting Lecturer - Business', 'yes'),
(8, 'Academic Coordinator', 'yes'),
(9, 'HR Manager', 'yes'),
(10, 'Accountant', 'yes'),
(11, 'Admin executive', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `staff_id_card`
--

CREATE TABLE `staff_id_card` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `school_address` varchar(255) NOT NULL,
  `background` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `sign_image` varchar(100) NOT NULL,
  `header_color` varchar(100) NOT NULL,
  `enable_vertical_card` int(11) NOT NULL DEFAULT 0,
  `enable_staff_role` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_id` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_department` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_designation` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_date_of_joining` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_permanent_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_id_card`
--

INSERT INTO `staff_id_card` (`id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_vertical_card`, `enable_staff_role`, `enable_staff_id`, `enable_staff_department`, `enable_designation`, `enable_name`, `enable_fathers_name`, `enable_mothers_name`, `enable_date_of_joining`, `enable_permanent_address`, `enable_staff_dob`, `enable_staff_phone`, `status`) VALUES
(1, 'Sample Staff ID Card Horizontal', 'YGC Graduate Campus', 'No. 323,\r\nKandy road, Dalugama\r\nKelaniya, Sri Lanka\r\n\r\n+94 (0)11 7 11 23 88\r\ninfo@ygc.lk', 'background11.png', 'logo11.png', 'sign1.png', '#9b1818', 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1),
(2, 'Sample Staff ID Card Vertical', 'YORK Graduate Campus', 'No. 323,\r\nKandy road, Dalugama\r\nKelaniya, Sri Lanka\r\n\r\n+94 (0)11 7 11 23 88\r\ninfo@ygc.lk', 'background2.jpg', 'logo2.png', 'sign1.png', '#9b1818', 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1),
(3, 'Staff ID 1', 'YGC Graduate Campus', 'No. 323,\r\nKandy road, Dalugama\r\nKelaniya, Sri Lanka\r\n\r\n+94 (0)11 7 11 23 88\r\ninfo@ygc.lk', '', 'logo3.png', '', '#0418e8', 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_details`
--

CREATE TABLE `staff_leave_details` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `alloted_leave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_request`
--

CREATE TABLE `staff_leave_request` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_days` int(11) NOT NULL,
  `employee_remark` varchar(200) NOT NULL,
  `admin_remark` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_by` varchar(200) NOT NULL,
  `document_file` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_payroll`
--

CREATE TABLE `staff_payroll` (
  `id` int(11) NOT NULL,
  `basic_salary` int(11) NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_payslip`
--

CREATE TABLE `staff_payslip` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `basic` float(10,2) NOT NULL,
  `total_allowance` float(10,2) NOT NULL,
  `total_deduction` float(10,2) NOT NULL,
  `leave_deduction` int(11) NOT NULL,
  `tax` varchar(200) NOT NULL,
  `net_salary` float(10,2) NOT NULL,
  `status` varchar(100) NOT NULL,
  `month` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_date` date NOT NULL,
  `remark` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_rating`
--

CREATE TABLE `staff_rating` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rate` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 decline, 1 Approve',
  `entrydt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_roles`
--

CREATE TABLE `staff_roles` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_roles`
--

INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2022-08-15 11:14:50', NULL),
(2, 7, 2, 0, '2022-08-15 11:14:38', NULL),
(3, 3, 3, 0, '2021-08-02 11:58:16', NULL),
(4, 3, 4, 0, '2021-08-03 10:59:24', NULL),
(5, 8, 5, 0, '2021-09-03 05:54:12', NULL),
(6, 3, 6, 0, '2021-09-13 04:55:24', NULL),
(7, 4, 7, 0, '2021-11-28 16:15:47', NULL),
(8, 2, 8, 0, '2021-11-28 16:51:26', NULL),
(9, 4, 9, 0, '2021-11-28 17:28:02', NULL),
(10, 4, 10, 0, '2021-11-28 17:30:35', NULL),
(11, 4, 11, 0, '2021-11-28 17:32:06', NULL),
(12, 4, 12, 0, '2021-11-29 03:08:38', NULL),
(13, 4, 13, 0, '2021-11-29 03:10:02', NULL),
(14, 4, 14, 0, '2021-11-29 03:13:18', NULL),
(15, 9, 15, 0, '2022-01-09 06:35:05', NULL),
(16, 2, 16, 0, '2022-03-21 08:34:10', NULL),
(17, 1, 17, 0, '2022-06-11 04:25:33', NULL),
(18, 7, 18, 0, '2022-08-15 11:14:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_timeline`
--

CREATE TABLE `staff_timeline` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `admission_no` varchar(100) DEFAULT NULL,
  `roll_no` varchar(100) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `rte` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `cast` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `school_house_id` int(11) NOT NULL,
  `blood_group` varchar(200) NOT NULL,
  `vehroute_id` int(11) NOT NULL,
  `hostel_room_id` int(11) NOT NULL,
  `adhar_no` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `guardian_is` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) NOT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `father_pic` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `guardian_pic` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `previous_school` text DEFAULT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `measurement_date` date NOT NULL,
  `dis_reason` int(11) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `dis_note` text NOT NULL,
  `app_key` text DEFAULT NULL,
  `parent_app_key` text DEFAULT NULL,
  `disable_at` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES
(17, 34, '0219', '201', NULL, 'D M K SHANUKA', '', 'SANKALPA', '', NULL, '760257230', 'KAVEESHANU67@GMAIL.COM', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'CHAMILA PRASADIKA', '760232100', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:53:51', NULL),
(18, 36, '0239', '', NULL, 'Vikash', '', ' senavirathna', '', NULL, '757717370', 'No', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'Calistos', '717157889', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:53:52', NULL),
(19, 38, '0299', '', NULL, 'K Kalindu ', '', 'Dakshina', '', NULL, '758254346', 'kalindudakshina225@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'Samadara Samanmalie', '779702692', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Chamudi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:53:52', NULL),
(20, 40, '0317', '', NULL, 'T.P.Upeksha  ', '', 'Kithmini', '', NULL, '770250828', 'Upekshakithmini123@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'T.P.Jayantha Kithsiri', '763729690', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:53:53', NULL),
(21, 42, '0325', '', NULL, 'Jayakumar', '', 'Feromiya', '', NULL, '762796404', 'feromiyaj9772@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'D.Jayakumar', '770782922', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:53:54', NULL),
(22, 44, '0344', '', NULL, 'Kalutarage Prasad Lasitha  ', 'Prasad Lasitha ', 'Balasuriya', '', NULL, '701879052', 'prasadlasitha84@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:53:55', NULL),
(23, 46, '0187', '', NULL, 'Chadini  ', '', 'kaveesha', '', NULL, '764103443', 'Chadinikaveesha@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'Niroshan priyadharshana', '752140823', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:53:56', NULL),
(24, 48, '0380', '', NULL, 'N.A Sachin   ', 'Gawrawa', 'Perera', '', NULL, '757372286', 'Sachinperera70@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'N.A Nishantha Perera', '774084409', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Chamudi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:53:58', NULL),
(25, 50, '0440A', '', NULL, 'Ukku bandage ', 'rashen bandara ', 'ududeniya', '', NULL, '759636298', 'rashenbandara54@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'U B N B ududeniya', '779218495', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Chamudhi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:53:59', NULL),
(26, 52, '0455A', '', NULL, 'Pratheeshan ', '', 'Vijayan', '', NULL, '767202075', 'pratheeshanv@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'Vijayan Raman', '772081504', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Chamudhi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:54:00', NULL),
(27, 54, '0458', '', NULL, 'R.Dilma   ', 'vihangi', 'perera', '', NULL, '703202292', 'vihangidilma4@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'R.Nishantha perera ', '703202291', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:54:01', NULL),
(28, 56, '0457', '', NULL, 'D.Kasun ', 'Probodhana Geeth ', 'kumara', '', NULL, '785428844', 'kumarahaere@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'D.G.Ariyaratne', '775231161', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:54:02', NULL),
(29, 58, '0461A', '', NULL, 'M. Egova ', '', 'Shalom', '', NULL, '768982294', 'egovashalom@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', 'Madasamy', '112988084', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-22 20:54:03', NULL),
(30, 60, '0463', '', NULL, 'Thiwanka  ', 'Dinuramal', 'Thangallage', '', NULL, '770505520', 'thiwankadthangallage@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Venlly', '', NULL, NULL, '0000-00-00', '2021-08-22 20:54:04', NULL),
(296, 592, 'YGC/2021/0236', '', '2021-03-29', 'Nathasha ', '', 'Devindee', '', NULL, '759590507', 'not completed ', NULL, NULL, NULL, '', '', '2001-03-04', 'Female', '', '383/1/A, Makola North Makola', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:02:34', NULL),
(297, 594, 'YGC/2021/0277', '', '2021-03-29', 'L Indrika', ' Pavani ', 'Perera', '', NULL, '765485967', 'not completed', NULL, NULL, NULL, '', '', '1999-12-12', 'Female', '', '516/61, Bandarawatta, Weliveriya', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:02:34', NULL),
(298, 596, 'YGC/2021/0284', '', '2021-04-01', 'Pasindu ', '', 'nishara', '', NULL, '764232480', 'pasindu609@gmail.com', NULL, NULL, NULL, '', '', '2001-05-05', 'Male', '', '125/A thalgas mote weyangoda', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:02:34', NULL),
(299, 598, 'YGC/2021/0285', '', '2021-04-01', 'Meeshka', '', ' dimithri', '', NULL, '767085895', 'Flemingtitus@gmail.com', NULL, NULL, NULL, '', '', '2006-04-25', 'Female', '', '432/1/2 kandeliyadda paluwa ganemulla', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:02:36', NULL),
(300, 600, 'YGC/2021/0286', '', '2021-04-01', 'Surangi ', '', 'chamathka', '', NULL, '712380085', 'Schamathka40@gmail.com', NULL, NULL, NULL, '', '', '2001-07-31', 'Female', '', '345/ b / 3 nilapanagoda minuwangoda', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:02:37', NULL),
(301, 602, 'YGC/2021/0091', '', '2021-04-27', 'Imeth ', '', 'Navaratne ', '', NULL, '94779478773', 'asnavaratne@yahoo.com', NULL, NULL, NULL, '', '', '2003-08-21', 'Male', '', 'No.2A, Kandy Road, Dalugama, Kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:02:38', NULL),
(302, 604, 'YGC/2021/0360', '', '2021-05-10', 'Omerdeen ', 'Mohamed ', 'Burhanudeen', '', NULL, '766756752', 'burhanudeen2019@gmail.com', NULL, NULL, NULL, '', '', '1984-04-16', 'Female', '', '407, Dahalapitiyamadige Midiyala Bandara Koswatta', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:02:39', NULL),
(303, 606, 'YGC/2021/0224', '', '2021-03-23', 'Rajinda ', '', 'eshan', '', NULL, '718545857', 'Eshanjayo@gmail.com', NULL, NULL, NULL, '', '', '2003-12-03', 'Male', '', '5/1 nahenawattha hunupitiya watthala', 'Diploma Level', 0, 0, '', 0, 0, '2.00331E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:03:53', NULL),
(304, 608, 'YGC/2021/0227', '', '2021-03-23', 'Senuda ', '', 'dilwan', '', NULL, '775963388', 'No', NULL, NULL, NULL, '', '', '2004-02-22', 'Male', '', '282/5 polhena kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '2.00405E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:03:54', NULL),
(305, 610, 'YGC/2021/0204', '', '2021-03-23', 'Nathasha ', '', 'ann', '', NULL, '778710150', 'No', NULL, NULL, NULL, '', '', '2004-04-08', 'Female', '', '425/a5 10th lane mahawattha ganemulla', 'Diploma Level', 0, 0, '', 0, 0, '2.0046E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:03:54', NULL),
(306, 612, 'YGC/2021/0202', '', '2021-03-23', 'Rashini ', '', 'mihinsa', '', NULL, '768301213', 'No', NULL, NULL, NULL, '', '', '2004-03-28', 'Female', '', '248/1 kandaliyappa paluwa ganemulla', 'Diploma Level', 0, 0, '', 0, 0, '2.00459E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:03:54', NULL),
(307, 614, 'YGC/2021/0248', '', '2021-03-23', 'Shashipraba ', 'omasha', ' kuruppu', '', NULL, '777473006', 'omasha.kuruppu@gmail.com', NULL, NULL, NULL, '', '', '2004-08-03', 'Female', '', '397/3, pinthaliya Road, kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.00472E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:03:54', NULL),
(308, 616, 'YGC/2021/0221', '', '2021-03-24', 'Rehan', '', 'Antoniyo', NULL, NULL, '716307641', 'rehanantoniyo@gmail.com', NULL, NULL, NULL, '', NULL, '2003-12-01', 'Male', NULL, NULL, '2', 0, 0, '', 0, 0, '2.00334E+11', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-28 03:50:28', NULL),
(309, 618, 'YGC/2021/0208', '', '2021-03-24', 'Aditha ', '', 'Shanaka', '', NULL, '714669642', 'mbpiumali@yahoo.com', NULL, NULL, NULL, '', '', '2004-03-02', 'Male', '', '477/1/H, Ihalabiyanwila, Kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.00406E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:03:56', NULL),
(310, 620, 'YGC/2021/0212', '', '2021-03-24', 'Dilini ', '', 'Nawanjana', '', NULL, '771245596', 'dilininawanjana@gmail.com', NULL, NULL, NULL, '', '', '2001-01-05', 'Female', '', '182, Kandy Road, Dalugama , Kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '2.00151E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:03:57', NULL),
(311, 622, 'YGC/2021/0213', '', '2021-03-24', 'Bahgya ', '', 'Nilnuwani', '', NULL, '782535347', 'bhagyaperera142@gmail.com', NULL, NULL, NULL, '', '', '2000-07-14', 'Female', '', '27/H, Kandy Road, Dalugama, Kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '2.0007E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:03:58', NULL),
(312, 624, 'YGC/2021/0229', '', '2021-03-24', 'Mohomed ', '', 'Shimar', '', NULL, '777740960', 'vistaceramics@gmail.com', NULL, NULL, NULL, '', '', '2004-01-24', 'Male', '', '245/01, Dompe Road, Malwana', 'Diploma Level', 0, 0, '', 0, 0, '2.00402E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:03:59', NULL),
(313, 626, 'YGC/2021/0225', '', '2021-03-24', 'Daham ', '', 'Themiya', '', NULL, '711317989', 'blackhart932@gmail.com', NULL, NULL, NULL, '', '', '2004-04-23', 'Male', '', '423/a, Kirillawala , Kadawatha', 'Diploma Level', 0, 0, '', 0, 0, 'not complete', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:00', NULL),
(314, 628, 'YGC/2021/0226', '', '2021-03-24', 'Gihan ', '', 'Lakshan', '', NULL, '705124253', 'gihanlakshan234@gmail.com', NULL, NULL, NULL, '', '', '2003-05-21', 'Male', '', '73D, Weboda East Weboda', 'Diploma Level', 0, 0, '', 0, 0, '2.00314E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:01', NULL),
(315, 630, 'YGC/2021/0217', '', '2021-03-24', 'Savinda ', '', 'Kalhara', '', NULL, '773695270', '17savinda@gmail.com', NULL, NULL, NULL, '', '', '2004-02-02', 'Male', '', '141/6, Alubowila Delgoda', 'Diploma Level', 0, 0, '', 0, 0, '2.00403E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:02', NULL),
(316, 632, 'YGC/2021/0216', '', '2021-03-24', 'Biguni Maheesha ', '', 'Nethmi', '', NULL, '778170560', 'bmaheesha9@gmail.com', NULL, NULL, NULL, '', '', '2004-10-19', 'Female', '', '49/c, Demalagama , Delgoda', 'Diploma Level', 0, 0, '', 0, 0, '2.00479E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:03', NULL),
(317, 634, 'YGC/2021/0214', '', '2021-03-24', 'Adithya ', '', 'Rajapaksha', '', NULL, '767892548', 'adithyarajapakshe47@gmail.com', NULL, NULL, NULL, '', '', '2004-08-03', 'Male', '', '36/F/A Peramuna Mawatha, Eldeniya, Kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.00407E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:04', NULL),
(318, 636, 'YGC/2021/0228', '', '2021-03-24', 'Udayakumar ', '', 'Abhishek', '', NULL, '775150302', 'abishekudayakumar25@gmail.com', NULL, NULL, NULL, '', '', '2000-10-25', 'Male', '', '150/1, Wanawasala rd, Kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '2.0003E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:05', NULL),
(319, 638, 'YGC/2021/0243', '', '2021-03-24', 'E G Kasuni ', '', 'Thathsara', '', NULL, '94762980789', 'kasunithathsar5@gmail.com', NULL, NULL, NULL, '', '', '2004-02-29', 'Female', '', '344/2/G, Abesekara Mw, Polpithi Mukalana Kandana', 'Diploma Level', 0, 0, '', 0, 0, 'not completed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:06', NULL),
(320, 640, 'YGC/2021/0231', '', '2021-03-24', 'Tharushi ', '', 'Hansika', '', NULL, '703048597', 'tharushihansika34@gmail.com', NULL, NULL, NULL, '', '', '2001-02-02', 'Female', '', '298/16, Ihalabiyanvila, kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.00153E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:07', NULL),
(321, 642, 'YGC/2021/0253', '', NULL, 'Shehara', ' heshani ', 'weerarathna', '', NULL, '765532506', 'dananja1125@gmail.com', NULL, NULL, NULL, '', '', '2004-04-29', 'Female', '', '15/3C Dalupitiya rd Mahara Kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.00462E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:08', NULL),
(322, 644, 'YGC/2021/0252', '', '2021-03-27', 'T.P Bhagya ', '', 'nethmini', '', NULL, '766846600', 'Bhagya2004@gmail.com', NULL, NULL, NULL, '', '', '2004-07-23', 'Female', '', '10/ 2 ,C Andrews lane kadawatha.', 'Diploma Level', 0, 0, '', 0, 0, '200470503752V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:09', NULL),
(323, 646, 'YGC/2021/0273', '', '2021-03-29', 'Nawod', '', ' idumina', '', NULL, '778081841', 'No', NULL, NULL, NULL, '', '', '2004-08-20', 'Male', '', '21/06/ I / liyanegama dompe', 'Diploma Level', 0, 0, '', 0, 0, '2E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:10', NULL),
(324, 648, 'YGC/2021/0257', '', '2021-03-29', 'Kavindu ', '', 'layan', '', NULL, '781455096', 'Kavindulayan54@gmail.com', NULL, NULL, NULL, '', '', '2004-05-18', 'Male', '', '249 new road dompe', 'Diploma Level', 0, 0, '', 0, 0, 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:10', NULL),
(325, 650, 'YGC/2021/0254', '', '2021-03-29', 'Nisandi Vinoya ', '', 'Withanage', '', NULL, '778505484', 'nisadivinoya@gmail.com', NULL, NULL, NULL, '', '', '2004-08-23', 'Female', '', '457/E, Maharanugegoda, Kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.00474E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:11', NULL),
(326, 652, 'YGC/2021/0251', '', '2021-03-29', 'L G Sasmini ', 'Parindya ', 'Gamage', '', NULL, '763054425', 'no', NULL, NULL, NULL, '', '', '2004-09-23', 'Female', '', '218/D, Kirillawala Webada', 'Diploma Level', 0, 0, '', 0, 0, '2.00477E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:12', NULL),
(327, 654, 'YGC/2021/0269', '', '2021-03-29', 'D A Ruchidi ', '', 'Sandupama', '', NULL, '717643622', 'not in use', NULL, NULL, NULL, '', '', '2001-05-03', 'Female', '', '202/B, Muththettu Watta, Anuragoda, Pepiliyawala', 'Diploma Level', 0, 0, '', 0, 0, '2.00157E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:12', NULL),
(328, 656, 'YGC/2021/0274', '', '2021-03-29', 'J.A.Nethmi', ' Amaya ', 'Perera.', '', NULL, '750409697', 'anusha8761@gmail.com', NULL, NULL, NULL, '', '', '2004-06-24', 'Female', '', '186/B/1, kirimetiyagara , kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.00468E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:12', NULL),
(329, 658, 'YGC/2021/0262', '', '2021-04-02', 'D.M Ruvini', '', 'Maduthya ', '', NULL, '781358534', 'madhuthya2000@gmail.com', NULL, NULL, NULL, '', '', '2000-09-02', 'Female', '', '327/7B Gajaba Mawatha Makola  North, M akola', 'Diploma Level', 0, 0, '', 0, 0, '2.00075E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:15', NULL),
(330, 660, 'YGC/2021/0205', '', '2021-03-20', 'S.A bhanuka ', '', 'nilakshana', '', NULL, '778866417', 'Wasanthasanjeeva9@gmail.Com', NULL, NULL, NULL, '', '', '2004-11-13', 'Male', '', '236/97 new janapadaya palliya watta hedala wattala', 'Diploma Level', 0, 0, '', 0, 0, '2.00432E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:16', NULL),
(331, 662, 'YGC/2021/0272', '', '2021-03-29', 'Kushan ', '', 'madhawa', '', NULL, '717577402', 'kushanmadawa5@gmail.com', NULL, NULL, NULL, '', '', '2004-05-11', 'Male', '', '461/1B pahala biyanwila mankada road kadawatha', 'Diploma Level', 0, 0, '', 0, 0, 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:18', NULL),
(332, 664, 'YGC/2021/0037', '', '2021-03-29', 'Mohommad ', 'yazeed ', 'faumy', '', NULL, '759204664', '2002yazeedfaumy@gmail.com', NULL, NULL, NULL, '', '', '2002-05-21', 'Male', '', '121 a / A3 8th lane hunupitiya watthala', 'Diploma Level', 0, 0, '', 0, 0, '2E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:19', NULL),
(333, 666, 'YGC/2021/0140', '', '2021-03-31', 'Dulitha ', 'pinsara ', 'meegoda ', '', NULL, '760848317', 'Pinsarameegoda@gmail.com', NULL, NULL, NULL, '', '', '2004-01-13', 'Male', '', '19,weddamulla mawatha, Kelaniya ', 'Diploma Level', 0, 0, '', 0, 0, '2.00401E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:20', NULL),
(334, 668, 'YGC/2021/0304', '', '2021-03-30', 'J.M.Lithika ', 'chansilu ', 'jayasinghe', '', NULL, '740390091', 'Sithilajayasinghe@gmail.com', NULL, NULL, NULL, '', '', '2004-05-12', 'Female', '', '48/8 heelbathgala , narampola , dekatana', 'Diploma Level', 0, 0, '', 0, 0, '2.00413E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:21', NULL),
(335, 670, 'YGC/2021/0301', '', '2021-04-05', 'K A Sarith ', '', 'Sasmitha', '', NULL, '705267604', 'sarithsaz9@gmail.com', NULL, NULL, NULL, '', '', '2004-11-09', 'Male', '', '350, Sanasuma Kossinna Ganemulla', 'Diploma Level', 0, 0, '', 0, 0, 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:22', NULL),
(336, 672, 'YGC/2021/0303', '', '2021-04-05', 'Paramee Niranga ', 'Diwyanjalee', ' Kandambi ', '', NULL, '750244021', 'diwipara1316@gmail.com', NULL, NULL, NULL, '', '', '2004-04-27', 'Female', '', '516/1/B, Daluggala Road, Heiyanthuduwa', 'Diploma Level', 0, 0, '', 0, 0, '2.00462E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:23', NULL),
(337, 674, 'YGC/2021/0223', '', '2021-04-06', 'Nadun ', '', 'Dilhara ', '', NULL, '774148506', 'No', NULL, NULL, NULL, '', '', '2003-03-08', 'Male', '', '274/1, Welipillewa, Ganemulla', 'Diploma Level', 0, 0, '', 0, 0, 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:24', NULL),
(338, 676, 'YGC/2021/0302', '', '2021-04-05', 'Movindu ', 'sanjana', ' senevirathna', '', NULL, '190/1 Pahala karagahamuna,galroda RD, kadawaths', 'sanjanamovindu@gmail.com', NULL, NULL, NULL, '', '', '2003-09-25', 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '2.00327E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:24', NULL),
(339, 678, 'YGC/2021/0300', '', '2021-04-04', 'Pramudi ', '', 'maheesha', '', NULL, '710885586', 'No', NULL, NULL, NULL, '', '', '2004-05-08', 'Female', '', '50/f/a thalaghawattha suriyapaluwa kadawatha ', 'Diploma Level', 0, 0, '', 0, 0, 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:25', NULL),
(340, 680, 'YGC/2021/0306', '', '2021-04-06', 'G. A Muthuli ', '', 'Sanjana', '', NULL, '772291992', 'none', NULL, NULL, NULL, '', '', '2004-07-10', 'Female', '', '127/6, Biyagama Road,  Kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '2.00469E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:25', NULL),
(341, 682, 'YGC/2021/219', '', '2021-04-09', 'D M K SHANUKA', '', 'SANKALPA', '', NULL, '760257230', 'KAVEESHANU67@GMAIL.COM', NULL, NULL, NULL, '', '', '1995-07-11', 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'CHAMILA PRASADIKA', '760232100', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:47', NULL),
(342, 684, 'YGC/2021/239', '', '2021-03-23', 'Vikash', '', ' senavirathna', '', NULL, '757717370', 'No', NULL, NULL, NULL, '', '', '1999-11-15', 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'Calistos', '717157889', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:48', NULL),
(343, 686, 'YGC/2021/299', '', '2021-03-24', 'K Kalindu ', '', 'Dakshina', '', NULL, '758254346', 'kalindudakshina225@gmail.com', NULL, NULL, NULL, '', '', '1997-09-16', 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'Samadara Samanmalie', '779702692', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Chamudi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:48', NULL),
(344, 688, 'YGC/2021/317', '', '2021-04-04', 'T.P.Upeksha  ', '', 'Kithmini', '', NULL, '770250828', 'Upekshakithmini123@gmail.com', NULL, NULL, NULL, '', '', '2000-09-06', 'Female', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'T.P.Jayantha Kithsiri', '763729690', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:49', NULL),
(345, 690, 'YGC/2021/325', '', '2021-04-21', 'Jayakumar', '', 'Feromiya', '', NULL, '762796404', 'feromiyaj9772@gmail.com', NULL, NULL, NULL, '', '', '1997-08-27', 'Female', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'D.Jayakumar', '770782922', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:50', NULL),
(346, 692, 'YGC/2021/344', '', '2021-04-18', 'Kalutarage Prasad Lasitha  ', 'Prasad Lasitha ', 'Balasuriya', '', NULL, '701879052', 'prasadlasitha84@gmail.com', NULL, NULL, NULL, '', '', '2021-01-21', 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:51', NULL),
(347, 694, 'YGC/2021/187', '', '2021-05-13', 'Chadini  ', '', 'kaveesha', '', NULL, '764103443', 'Chadinikaveesha@gmail.com', NULL, NULL, NULL, '', '', '2001-08-09', 'Female', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'Niroshan priyadharshana', '752140823', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:52', NULL),
(348, 696, 'YGC/2021/380', '', '2021-05-15', 'N.A Sachin   ', 'Gawrawa', 'Perera', '', NULL, '757372286', 'Sachinperera70@gmail.com', NULL, NULL, NULL, '', '', '2001-04-17', 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'N.A Nishantha Perera', '774084409', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Chamudi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:53', NULL),
(349, 698, 'YGC/2021/0440A', '', '2021-06-27', 'Ukku bandage ', 'rashen bandara ', 'ududeniya', '', NULL, '759636298', 'rashenbandara54@gmail.com', NULL, NULL, NULL, '', '', '2004-01-23', 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'U B N B ududeniya', '779218495', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Chamudhi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:54', NULL),
(350, 700, 'YGC/2021/0455A', '', '2021-07-05', 'Pratheeshan ', '', 'Vijayan', '', NULL, '767202075', 'pratheeshanv@gmail.com', NULL, NULL, NULL, '', '', '2000-10-25', 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'Vijayan Raman', '772081504', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Chamudhi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:55', NULL),
(351, 702, 'YGC/2021/458', '', '2021-07-08', 'R.Dilma   ', 'vihangi', 'perera', '', NULL, '703202292', 'vihangidilma4@gmail.com', NULL, NULL, NULL, '', '', '2004-10-18', 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'R.Nishantha perera ', '703202291', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:56', NULL),
(352, 704, 'YGC/2021/457', '', '2021-07-07', 'D.Kasun ', 'Probodhana Geeth ', 'kumara', '', NULL, '785428844', 'kumarahaere@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'D.G.Ariyaratne', '775231161', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:57', NULL),
(353, 706, 'YGC/2021/0461A', '', '2021-07-06', 'M. Egova ', '', 'Shalom', '', NULL, '768982294', 'egovashalom@gmail.com', NULL, NULL, NULL, '', '', '2001-07-31', 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', 'Madasamy', '112988084', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Jithmi', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:58', NULL),
(354, 708, 'YGC/2021/463', '', '2021-07-12', 'Thiwanka  ', 'Dinuramal', 'Thangallage', '', NULL, '770505520', 'thiwankadthangallage@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, 'Venlly', '', NULL, NULL, '0000-00-00', '2021-08-29 19:04:59', NULL),
(355, 710, 'YGC/2021/0062', '', '2020-12-13', 'Samarasekara Okandapola Arachchige Oshani ', 'Imasha ', 'Samarasekara', '', NULL, '715194475', 'oshaniimasha588@gmail.com', NULL, NULL, NULL, '', '', '1999-04-18', 'Female', '', 'No. 422/1 Mandawala road Radawana', 'Diploma Level', 0, 0, '', 0, 0, '996091112v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:27', NULL),
(356, 712, 'YGC/2021/0038', '', '2020-12-15', 'Ayabadhdha dewage', 'kalpana ', 'Madhumali', NULL, NULL, '94776670135', 'Adithyakalpana21@gmail.com', NULL, NULL, NULL, '', NULL, '1997-05-15', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '976363833v', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-11-29 08:54:26', NULL),
(357, 714, 'YGC/2021/0052', '', '2020-12-15', 'P.D.Beneesha ', 'Palihena', 'Tharika ', '', NULL, '760194414', 'beneetp@gmail.com', NULL, NULL, NULL, '', '', '1992-10-04', 'Female', '', 'No.3M/26/1, N.H.S.Kiribathgoda', 'Diploma Level', 0, 0, '', 0, 0, '927783312v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:30', NULL),
(358, 716, 'YGC/2021/0046', '', '2020-12-18', 'Akurana appuhamilage dona', ' tharuki ', 'udara', '', NULL, '07612 22 192', 'udaratharuki97@gmail.com', NULL, NULL, NULL, '', '', '1997-08-13', 'Female', '', 'No 178/ A river road pamunugama alubomulla', 'Diploma Level', 0, 0, '', 0, 0, '977262330 v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:31', NULL),
(359, 718, 'YGC/2021/0045', '', '2020-12-18', 'Mrs.Shiney ', 'mayuri ', 'Ramachandran', '', NULL, '768689350', 'Shineypraba85@gmail.com', NULL, NULL, NULL, '', '', '1990-01-13', 'Female', '', '580/A,negombo road,Mabola,wattala', 'Diploma Level', 0, 0, '', 0, 0, '905130102v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:31', NULL),
(360, 720, 'YGC/2021/0049', '', '2020-12-22', 'Koswaththa Gamage', ' Lihini ', 'Dulakshika', '', NULL, '719879843', 'lihinidulakshi8@gmail.com', NULL, NULL, NULL, '', '', '2000-01-03', 'Female', '', 'No.5/2,Meryland,Wathurugama', 'Diploma Level', 0, 0, '', 0, 0, '2\'00050303417', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:32', NULL),
(361, 722, 'YGC/2021/0047', '', '2020-12-22', 'Anthonan Hettige Rashmi Avinsa ', 'Parami ', 'Dias', '', NULL, '714647722', 'rashmiavinsa12@gmail.com', NULL, NULL, NULL, '', '', '2001-02-12', 'Female', '', '226/75 ,Palahala ,Dekatana', 'Diploma Level', 0, 0, '', 0, 0, '2.00154E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:33', NULL),
(362, 724, 'YGC/2021/0058', '', '2020-12-23', 'Amarasinghe Arachchilage', ' Tamasha', ' Erandi', '', NULL, '762860539', 'tamashaerandi9@gmail.com', NULL, NULL, NULL, '', '', '2000-12-17', 'Female', '', 'No.81, Arakawila , Hadapangoda', 'Diploma Level', 0, 0, '', 0, 0, '2.00085E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:34', NULL),
(363, 726, 'YGC/2021/0060', '', '2020-12-25', 'Liyana Arachchige Ishini ', 'Nimalsha ', 'Liyanaarachchi', '', NULL, '701261433', 'ishininimalsha@gmail.com', NULL, NULL, NULL, '', '', '2000-06-02', 'Female', '', '45/A, Diyawala, Kirindiwela', 'Diploma Level', 0, 0, '', 0, 0, '2.00065E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:35', NULL),
(364, 728, 'YGC/2021/0059', '', '2020-12-26', 'Sakuni ', 'aroshika', ' senarath', '', NULL, '705795425', 'Umeshanu071@gmail.com', NULL, NULL, NULL, '', '', '1998-01-25', 'Female', '', '02,1st lane kumarathunga mawatha gampha', 'Diploma Level', 0, 0, '', 0, 0, '985251835v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:36', NULL),
(365, 730, 'YGC/2021/0066', '', '2020-12-30', 'E.A.Tharushi ', 'Dhananga ', 'Edirisinghe', '', NULL, '776779554', 'danangatharushi30@gmail.com', NULL, NULL, NULL, '', '', '2001-10-18', 'Female', '', '346/A,Naiwala road,Udugampola', 'Diploma Level', 0, 0, '', 0, 0, '2.00179E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:37', NULL),
(366, 732, 'YGC/2021/0071', '', '2021-01-03', 'Ghei ', 'Zihani ', 'Hafileen', '', NULL, '758626002', 'Zihani_hafileen@icloud.com', NULL, NULL, NULL, '', '', '1995-01-25', 'Female', '', '463/b/6,mahara-nugegoda,kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '955254147v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:38', NULL),
(367, 734, 'YGC/2021/0077', '', '2021-01-03', 'Dharshani ', '', 'Rajapaksha', '', NULL, '766130231', 'dharshanirajapaksha10@gmail.com', NULL, NULL, NULL, '', '', '1997-02-14', 'Female', '', '281/17 Sethsiri place ,sudharshana mawatha malabe', 'Diploma Level', 0, 0, '', 0, 0, '975451399V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:39', NULL),
(368, 736, 'YGC/2021/0073', '', '2021-01-02', 'Dahanayaka ArachchillageNimal ', 'Ranjith', 'Dahanayaka', '', NULL, '077 911 74 83', 'danrdahanayaka@gmail.com', NULL, NULL, NULL, '', '', '1986-03-03', 'Male', '', 'No.10, P.B.Wethtewa mawatha, Narammala road Alawwa', 'Diploma Level', 0, 0, '', 0, 0, '860631334v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:40', NULL),
(369, 738, 'YGC/2021/0085', '', '2021-01-09', 'Dona Ama ', 'Sewmini ', 'Kalutharage', '', NULL, '710379809', 'kavindak71@gmail.com', NULL, NULL, NULL, '', '', '2000-04-07', 'Female', '', '405/1,Kohalvila Road, Kelaniya.', 'Diploma Level', 0, 0, '', 0, 0, '2.0006E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:40', NULL),
(370, 740, 'YGC/2021/0089', '', '2021-01-13', 'M.M.A.A.D.k.', '', 'Kanchana', '', NULL, '702176610', 'KaKanchandilruaa@gmail.com', NULL, NULL, NULL, '', '', '1995-07-21', 'Female', '', '120/4 waralle waththa, giriulla road, mirigama .', 'Diploma Level', 0, 0, '', 0, 0, '957032885v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:41', NULL),
(371, 742, 'YGC/2021/0090', '', '2021-01-14', 'Wannakuwatta Waduge Kalmika', 'Nadeera', 'Fernando', '', NULL, '727105036', 'kalmikanadeera@gmail.com', NULL, NULL, NULL, '', '', '1988-08-17', 'Female', '', '13/30, Iththegala road, Naranwala, Gampaha.', 'Diploma Level', 0, 0, '', 0, 0, '887301352v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:42', NULL),
(372, 744, 'YGC/2021/0092', '', '2021-01-11', 'Cristopher shehara ', 'dheshanjali ', 'kaushalya.', '', NULL, '766617707', 'Dheshanjalishehara@gmail.com', NULL, NULL, NULL, '', '', '1997-12-23', 'Female', '', '436/36,alvitigala mawatha,narahenpita,colombo 05', 'Diploma Level', 0, 0, '', 0, 0, '978581412v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:43', NULL),
(373, 746, 'YGC/2021/0093', '', '2021-01-15', 'Warnakulasooriya Ann Nathasha ', 'Dilushini ', 'Fernando', '', NULL, '770059420', 'nathashafernanfo@gmail.com', NULL, NULL, NULL, '', '', '2000-06-27', 'Female', '', '17/5 B don bosco mawatha eththukala negombo', 'Diploma Level', 0, 0, '', 0, 0, '2.00068E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:44', NULL),
(374, 748, 'YGC/2021/0095', '', '2021-01-18', 'Fathima  ', 'Ruqayyah', 'Ikramdeen', '', NULL, '727530325', 'ruqayyahikramdeen1@gmail.com', NULL, NULL, NULL, '', '', '2000-12-28', 'Female', '', '1062, vijayaba mawatha, Hunupitiya, Wattala', 'Diploma Level', 0, 0, '', 0, 0, '2.00086E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:45', NULL),
(375, 750, 'YGC/2021/0103', '', '2021-01-18', 'H. Shehani ', '', 'kaushalya', '', NULL, '753696570', 'Sheha155333@gmail.com', NULL, NULL, NULL, '', '', '1998-05-27', 'Female', '', '648,station road, hunupitiya, wattala', 'Diploma Level', 0, 0, '', 0, 0, '986482113v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:46', NULL),
(376, 752, 'YGC/2021/0101', '', '2021-01-18', 'Inoka ', '', 'Chandrasekar', '', NULL, '774671820', 'inokavisha1809chandrasekar@gmail.com', NULL, NULL, NULL, '', '', '1996-09-18', 'Female', '', 'No-32,Warakapola', 'Diploma Level', 0, 0, '', 0, 0, '1.99676E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:47', NULL),
(377, 754, 'YGC/2021/0097', '', '2021-01-15', 'Horanage ', 'chamodi ', 'hansana', '', NULL, '767075544', 'Chamodihansanahansana@gmail.com', NULL, NULL, NULL, '', '', '1999-12-21', 'Female', '', 'No,100 golummahara, delgoda', 'Diploma Level', 0, 0, '', 0, 0, '998662834V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:48', NULL),
(378, 756, 'YGC/2021/0098', '', '2021-01-18', 'Bamunu Arachchige Chamali ', '', 'Dhananjana', '', NULL, '767867148', 'Chamalidhananja@gmail.com', NULL, NULL, NULL, '', '', '1999-10-15', 'Female', '', 'No : 387/1, Gammana Road, Kiriwaththuduwa , Homagama', 'Diploma Level', 0, 0, '', 0, 0, '997892119v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:49', NULL),
(379, 758, 'YGC/2021/0102', '', '2021-01-22', 'Weerasinghe Arachchilage Suwetha ', '', 'Dewmini', '', NULL, '771697449', 'taniyakariyawasam@gmail.com', NULL, NULL, NULL, '', '', '2003-07-18', 'Female', '', '33/2/1, Wenna watta Road, Wellampitiya', 'Diploma Level', 0, 0, '', 0, 0, '2.0037E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:50', NULL),
(380, 760, 'YGC/2021/0105', '', '2021-01-21', 'Manamalage chamodi', ' dilunika', ' silva', '', NULL, '760845664', 'dilunikasilva2@gmail.com', NULL, NULL, NULL, '', '', '2000-10-20', 'Female', '', 'No: 34/A dias mawatha, kanuwana, kuruduwatta, ekala', 'Diploma Level', 0, 0, '', 0, 0, '2.00079E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:51', NULL),
(381, 762, 'YGC/2021/0100', '', '2021-01-19', 'Batian Koralalage Neshtha Dulshani ', 'Shilona ', 'Rodrigo', '', NULL, '765651646', 'shilonar@gmail.com', NULL, NULL, NULL, '', '', '2002-05-30', 'Female', '', '191/A, Delathura, Jaela', 'Diploma Level', 0, 0, '', 0, 0, '2.00265E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:52', NULL),
(382, 764, 'YGC/2021/0108', '', '2021-01-23', 'Aparekkage Imalshi ', 'Danushika ', 'Wageeshani', '', NULL, '076 647 2242', 'imalshiwageeshani@gmail.con', NULL, NULL, NULL, '', '', '1998-01-08', 'Female', '', 'C .17/1, Ariyarathna mawatha, Niwunhella, Ibulana, Ruwanwalla', 'Diploma Level', 0, 0, '', 0, 0, '985081719V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:53', NULL),
(383, 766, 'YGC/2021/0106', '', '2021-01-19', 'Munasinghe Arachchige', ' Navodya ', 'Lakshani', '', NULL, '782881424', 'navlak123@gmail.com', NULL, NULL, NULL, '', '', '1998-12-16', 'Female', '', '120/17, Gamunu Mawatha, Biyagama Road, Kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '1.99885E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:54', NULL),
(384, 768, 'YGC/2021/0107', '', '2021-01-12', 'Arangalage irosha', ' indunil ', 'perera', '', NULL, '750655592', 'Pasindukalhara731@gmail.com', NULL, NULL, NULL, '', '', '1998-01-18', 'Female', '', '4/s,1/3j chithralane flats,kirula road, narahenpita, colombo 05', 'Diploma Level', 0, 0, '', 0, 0, '985182825v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:55', NULL),
(385, 770, 'YGC/2021/0096', '', '2021-01-15', 'Warnakulasuriya Dehiwlage Achini', ' Devindi', ' Costa', '', NULL, '763138396', 'Achini.d.costa@gmail.com', NULL, NULL, NULL, '', '', '1997-09-24', 'Female', '', '60/1, Kalaeliya Rod, Kapuwaththa, Ja-ela', 'Diploma Level', 0, 0, '', 0, 0, '977681685V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:55', NULL),
(386, 772, 'YGC/2021/0110', '', '2021-01-18', 'Kanaththage Buddima ', 'Sandumini ', 'Perera', '', NULL, '754032254', 'buddimasandumini@gmail.com', NULL, NULL, NULL, '', '', '1999-07-14', 'Female', '', 'No 413/18,1st lane,Kudagahapitiya,Kerawalapitiya,Hendala,Wattala', 'Diploma Level', 0, 0, '', 0, 0, '996962784v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:56', NULL),
(387, 774, 'YGC/2021/0067', '', '2020-12-30', 'P.Samalika ', 'Dilrukshi ', 'FernAndo', '', NULL, '754104734', 'dilkiferdo@gmail.com', NULL, NULL, NULL, '', '', '1993-12-14', 'Female', '', '135/F, Wikasitha uyana, samaranayaka road, Bandaragama.', 'Diploma Level', 0, 0, '', 0, 0, '938490317v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:57', NULL),
(388, 776, 'YGC/2021/0116', '', '2021-01-27', 'J.M. Sandali', '', ' Kaveesha', '', NULL, '741222128', 'aneeshaandsandali777@gmail.com', NULL, NULL, NULL, '', '', '1999-11-25', 'Female', '', '“sumudu” katukenda,dankotuwa', 'Diploma Level', 0, 0, '', 0, 0, '1.99983E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:58', NULL),
(389, 778, 'YGC/2021/0117', '', '2021-01-30', 'Kavisha ', 'Dinali ', 'Senevirathna', '', NULL, '778762324', 'kavistarz97@gmail.com', NULL, NULL, NULL, '', '', '1997-10-21', 'Female', '', 'No 82, Jaya Mawatha, Ganemulla Road, Kadawatha.', 'Diploma Level', 0, 0, '', 0, 0, '977952166v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:21:59', NULL),
(390, 780, 'YGC/2021/0118', '', '2021-01-26', 'Dematawa Mudiyanselage Sithija ', 'Shalinga', ' Dayananda', '', NULL, '767376460', 'Sithija95@gmail.com', NULL, NULL, NULL, '', '', '1995-03-15', 'Female', '', 'Deegithawa,Minuwangate', 'Diploma Level', 0, 0, '', 0, 0, '1.99508E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:00', NULL),
(391, 782, 'YGC/2021/0123', '', '2021-01-30', 'Jenali ', 'Fellan ', 'Liyanarachchi', '', NULL, '94773215212', 'jenfellnliy@yahoo.com', NULL, NULL, NULL, '', '', '1988-11-25', 'Female', '', '700, Batagama Road, Rilaulla, Kandana', 'Diploma Level', 0, 0, '', 0, 0, '19883003650', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:01', NULL),
(392, 784, 'YGC/2021/0120', '', '2021-01-28', 'Madusha ', 'oshini ', 'bandara', '', NULL, '781142722', 'Madushaoshi1203@gmail.com', NULL, NULL, NULL, '', '', '2001-03-08', 'Female', '', '375/8/b rathnarama road , hokandara north', 'Diploma Level', 0, 0, '', 0, 0, '2.00E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:02', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES
(393, 786, 'YGC/2021/0121', '', '2021-01-27', 'Sivabalan', '', ' jayaluxmi', '', NULL, '760430204', 'Luxmi1103@gmail.com', NULL, NULL, NULL, '', '', '2000-12-03', 'Female', '', '39/2, Aubune side ,dehiwela', 'Diploma Level', 0, 0, '', 0, 0, '2.00E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:03', NULL),
(394, 788, 'YGC/2021/0122', '', '2021-01-27', 'Rajan ', '', 'viveka', '', NULL, '94769379829', 'Viveka2005.rajan@gmail.com', NULL, NULL, NULL, '', '', '2000-05-06', 'Female', '', '1A/F11/U5 mayuraplace , havelock road , colombo - 06', 'Diploma Level', 0, 0, '', 0, 0, '2.00E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:04', NULL),
(395, 790, 'YGC/2021/0124', '', '2021-01-31', 'Malwaththa Mudalige', 'Navodha', 'Nirmani', '', NULL, '717191961', 'navodhanirmani28@gmail.com', NULL, NULL, NULL, '', '', '1999-07-08', 'Female', '', 'NO.575, YAGAMWELA,DUMMALASOORIYA', 'Diploma Level', 0, 0, '', 0, 0, '996900428v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:05', NULL),
(396, 792, 'YGC/2021/0126', '', '2021-01-31', 'Kiripitige Sanchana ', 'Sheroni ', 'Fernando', '', NULL, '773877684', 'sanchana0105@gmail.com', NULL, NULL, NULL, '', '', '1997-01-05', 'Female', '', '310/2/A, Alexandra Road,Kanuwana, Jaela', 'Diploma Level', 0, 0, '', 0, 0, '975050980v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:05', NULL),
(397, 794, 'YGC/2021/0128', '', '2021-02-02', 'Gihanthi ', 'Dinoshi ', 'Naidu', '', NULL, '765233485', 'gihanthidinoshinaidu@gmail.com', NULL, NULL, NULL, '', '', '1998-08-08', 'Female', '', '235/ A Godallawatte, Pattiyawatte, Kaduwela', 'Diploma Level', 0, 0, '', 0, 0, '987211865V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:06', NULL),
(398, 796, 'YGC/2021/0136', '', '2021-02-07', 'Sanduni', ' Geethma ', 'Amarasekara', '', NULL, '717687207', 'sanduniamarsekara.sa@gmail.com', NULL, NULL, NULL, '', '', '1997-11-07', 'Female', '', '363/5,Maradhana Rd,Dalupotha ,Negombo', 'Diploma Level', 0, 0, '', 0, 0, '976931890V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:07', NULL),
(399, 798, 'YGC/2021/0137', '', '2021-02-07', 'G H S Prasadini ', '', 'Dharmasena', '', NULL, '753658438', 'seuwandiprasadini@gmail.com', NULL, NULL, NULL, '', '', '1999-11-16', 'Female', '', '3/4, Morawatta, Nagoda, Kandana', 'Diploma Level', 0, 0, '', 0, 0, '2.00E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:08', NULL),
(400, 800, 'YGC/2021/0156', '', '2021-02-10', 'Dm m Ruwi ', '', 'disanayaka', '', NULL, '778930399', 'colonnes@ymail.com', NULL, NULL, NULL, '', '', '1993-10-12', 'Female', '', 'Malabe rood depanama pannipitiya', 'Diploma Level', 0, 0, '', 0, 0, '19937860017', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:09', NULL),
(401, 802, 'YGC/2021/0168', '', '2021-02-14', 'Anthonige Anjala Nimeshi ', 'Maduwanthi ', 'Perera', '', NULL, '740254596', 'anjalanimeshi16@gmail.com', NULL, NULL, NULL, '', '', '1999-01-06', 'Female', '', 'No.60,5th lane, Pathimawatta ,Daluwakotuwa ,Kochchikade', 'Diploma Level', 0, 0, '', 0, 0, '995061082V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:10', NULL),
(402, 804, 'YGC/2021/0167', '', '2021-02-14', 'Abdul Wahiduge Tharushi ', 'Sumudu ', 'Wasana', '', NULL, '767187422', 'tharuperera1516@gmail.com', NULL, NULL, NULL, '', '', '1999-01-15', 'Female', '', 'No.60/25,Adiheta Road,Daluwakotuwa,Kochchikade.', 'Diploma Level', 0, 0, '', 0, 0, '995150883V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:11', NULL),
(403, 806, 'YGC/2021/0165', '', '2021-02-14', 'Ganhewa kankanamge ruchini ', 'chthumali ', 'Kaushalya', '', NULL, '717240510', 'ruchini834@gmail.com', NULL, NULL, NULL, '', '', '1992-01-09', 'Female', '', '198b sandarshanarama Road Nagoda kalutara', 'Diploma Level', 0, 0, '', 0, 0, '925092106v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:12', NULL),
(404, 808, 'YGC/2021/0176', '', '2021-02-21', 'Navoda ', 'kaviyanjali ', 'herath', '', NULL, '761587151', 'Navodakaviyanjaliherath@gmail.com', NULL, NULL, NULL, '', '', '2001-12-02', 'Female', '', '484 jayasinghe rd nugape bopitiya pamunugama', 'Diploma Level', 0, 0, '', 0, 0, '2.00E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:13', NULL),
(405, 810, 'YGC/2021/0172', '', '2021-02-14', 'Pilippange Sudeshika ', 'Sewwandi ', 'Silva', '', NULL, '765766922', 'sewwandisilva202@gmail.com', NULL, NULL, NULL, '', '', '1997-02-06', 'Female', '', 'No:105/2/C, Dawamottawa , Andiambalama', 'Diploma Level', 0, 0, '', 0, 0, '975373401v', '', '', '', '', '', '774083897', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:33', NULL),
(406, 812, 'YGC/2021/0173', '', '2021-02-15', 'Kulasinghe Arachchige Dinuda', '', ' Reshini', '', NULL, '703488211', 'dinudareshini@gmail.com', NULL, NULL, NULL, '', '', '2001-09-17', 'Female', '', '2/5 B Nilugardens, Yatiyana, Minuwangoda', 'Diploma Level', 0, 0, '', 0, 0, '2.00176E+11', '', '', '', '', '', '074 178 0152', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:33', NULL),
(407, 814, 'YGC/2021/', '', '2021-02-20', 'Gunaraththna Mudiyanselage Tharushi ', 'Nawoda', 'Bandara ', '', NULL, '750252686', 'Bandaratharushinawoda@gmail.com.', NULL, NULL, NULL, '', '', '2000-06-15', 'Female', '', '86/18deranawaththa road,athurugiriye .', 'Diploma Level', 0, 0, '', 0, 0, '2.00067E+11', '', '', '', '', '', '755651209', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:34', NULL),
(408, 816, 'YGC/2021/0180', '', '2021-02-24', 'Achchu Thanthrige Theekshana', '', ' Deshanjali', '', NULL, '078-3765544', 'atheesha123@gmail.com', NULL, NULL, NULL, '', '', '2000-10-13', 'Female', '', '322/4 Uruwala , Nedungamuwa', 'Diploma Level', 0, 0, '', 0, 0, '2.00079E+11', '', '', '', '', '', '071-1476847', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:34', NULL),
(409, 818, 'YGC/2021/0197', '', '2021-03-01', 'Malshi ', 'imasha', ' botheju', '', NULL, '769957973', 'Madurangiashika.@gmail.com', NULL, NULL, NULL, '', '', '2001-03-17', 'Female', '', '293/ gonahena kadawatha sri lanka', 'Diploma Level', 0, 0, '', 0, 0, '2.00158E+11', '', '', '', '', '', '772180442', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:35', NULL),
(410, 820, 'YGC/2021/0211', '', '2021-03-12', 'Rajapakshe Pathirage Ishama', ' Neranji ', 'Rajapakshe', '', NULL, '763190660', 'ishama94neranji@gmail.com', NULL, NULL, NULL, '', '', '1994-06-29', 'Female', '', '3/6 A, Edirigoda Rd, Nugegoda', 'Diploma Level', 0, 0, '', 0, 0, '946810363V', '', '', '', '', '', '773938772', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:35', NULL),
(411, 822, 'YGC/2021/0199', '', '2021-03-11', 'Agampodige chathurya ', 'dewmini ', 'delgahawatta', '', NULL, '719892579', 'Isururusahansuraweera@gmail.com', NULL, NULL, NULL, '', '', '2000-08-25', 'Female', '', 'No.323,eluwapitiya,veyangoda', 'Diploma Level', 0, 0, '', 0, 0, '2.00074E+11', '', '', '', '', '', '788443615', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:36', NULL),
(412, 824, 'YGC/2021/0222', '', '2021-03-20', 'Chandrasekara Herath Mudiyanselage Wasana', '', ' Madhurangani', '', NULL, '719207363', 'wmadhurangani@gmail.com', NULL, NULL, NULL, '', '', '1996-02-01', 'Female', '', 'School Road, Nelliya, Minuwangete, Kurunegala', 'Diploma Level', 0, 0, '', 0, 0, '1.99653E+11', '', '', '', '', '', '710781464', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:37', NULL),
(413, 826, 'YGC/2021/0215', '', '2021-03-23', 'Rameshi', '', ' piyumika', '', NULL, '758376695', 'Rameshipiyumikajagatt@gmail.com', NULL, NULL, NULL, '', '', '1998-07-30', 'Female', '', '179/81 rajya sewa gammanaya avissawella', 'Diploma Level', 0, 0, '', 0, 0, '1.99871E+11', '', '', '', '', '', '718841013', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:38', NULL),
(414, 828, 'YGC/2021/0233', '', '2021-03-20', 'Nadeesha', '', ' Fernando', '', NULL, '770218418', 'nfernando732@gmail.com', NULL, NULL, NULL, '', '', '1989-12-26', 'Female', '', '', 'Diploma Level', 0, 0, '', 0, 0, '898614590v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:39', NULL),
(415, 830, 'YGC/2021/0244', '', '2021-03-24', 'Thushari ', '', 'Perera', '', NULL, '778453626', 'thusharirush@gmail.com', NULL, NULL, NULL, '', '', '1974-11-22', 'Female', '', '364/D Jinasena Mw, Mahara Kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '748273549v', '', '', '', '', '', '772272726', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:40', NULL),
(416, 832, 'YGC/2021/0198', '', '2021-03-25', 'R D I Kavindi', '', '', '', NULL, '760180400', 'imeshakavindi@icloud', NULL, NULL, NULL, '', '', '2001-02-05', 'Female', '', '68/E/1, Webada', 'Diploma Level', 0, 0, '', 0, 0, '2.00155E+11', '', '', '', '', '', '728872880', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:41', NULL),
(417, 834, 'YGC/2021/0247', '', '2021-03-18', 'U. G. Kavindaya ', '', 'Gayanjali', '', NULL, '0784581587 / 0716214035', 'gayanjalik@gmail.com', NULL, NULL, NULL, '', '', '2000-10-24', 'Female', '', '27/112,sarasavi mawatha, ragama.', 'Diploma Level', 0, 0, '', 0, 0, '2.0008E+11', '', '', '', '', '', '784581587', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:42', NULL),
(418, 836, 'YGC/2021/0263', '', '2021-03-24', 'Sanuri ', '', 'Silva', '', NULL, '764822617', 'silvasanuri826@gmail.com', NULL, NULL, NULL, '', '', '2000-05-04', 'Female', '', '157\\D Rohini Para Kaludawala Panadura', 'Diploma Level', 0, 0, '', 0, 0, '2.00063E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:43', NULL),
(419, 838, 'YGC/2021/0218', '', '2021-03-26', 'Warushahennadige Vishmila', ' Chamini ', 'Soyza', '', NULL, '766953014', 'vishmilasoyza1996@gmail.com', NULL, NULL, NULL, '', '', '1996-12-26', 'Female', '', 'No: 168/22, Rathanasara Road, Egoda melegama, Melegama , Wadduwa.', 'Diploma Level', 0, 0, '', 0, 0, '1.99686E+11', '', '', '', '', '', '788951008', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:44', NULL),
(420, 840, 'YGC/2021/0281', '', '2021-03-29', 'Madushika', '', ' kavindi', '', NULL, '766765186', 'Madushikakavindi77@gmail.com', NULL, NULL, NULL, '', '', '2000-12-21', 'Female', '', 'D 88 thelumpitiya gatahaththa', 'Diploma Level', 0, 0, '', 0, 0, '2E+11', '', '', '', '', '', '763886342', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:44', NULL),
(421, 842, 'YGC/2021/0220', '', '2021-03-29', 'Sadali ', '', 'Anuthara', '', NULL, '94712900561', 'sadalianuthara@gmail.com', NULL, NULL, NULL, '', '', '1998-04-25', 'Female', '', '20/2, Knakarathne place, Lakshapathiya, Moratuwa', 'Diploma Level', 0, 0, '', 0, 0, '986162402v', '', '', '', '', '', '94712900561', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:45', NULL),
(422, 844, 'YGC/2021/0270', '', '2021-03-29', 'R Lochana ', '', 'Lakmali ', '', NULL, '761592056', 'annesenevirathne72@gmail.com', NULL, NULL, NULL, '', '', '2001-03-28', 'Female', '', '17, M V Perera Mawatha, Sinharamulla, Kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '2.00159E+11', '', '', '', '', '', '761834337', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:46', NULL),
(423, 846, 'YGC/2021/0283', '', '2021-03-29', 'M P Gimhani', '', ' Kavishika', '', NULL, '763822150', 'gimhanikavishika99@gmail.com', NULL, NULL, NULL, '', '', '1999-09-21', 'Female', '', '162/B, Samanabedda, Thiththapaththara ', 'Diploma Level', 0, 0, '', 0, 0, '997652290v', '', '', '', '', '', '778315351', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:47', NULL),
(424, 848, 'YGC/2021/0287', '', '2021-03-31', 'W Senali', '', ' Piyathma', '', NULL, '778097432', 'senalipiyathma@gmail.com', NULL, NULL, NULL, '', '', '1999-07-24', 'Female', '', '141/3, Eksath Mawatha, Mahara Kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '1.99971E+11', '', '', '', '', '', '760591520', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:48', NULL),
(425, 850, 'YGC/2021/0288', '', '2021-04-01', 'Vishaka ', '', 'subodha', '', NULL, '769683150', 'Vishakasubodha01@gmail.com', NULL, NULL, NULL, '', '', '1995-02-13', 'Female', '', '56 kalahapitiya adiambalama', 'Diploma Level', 0, 0, '', 0, 0, '1.99554E+11', '', '', '', '', '', '768922365', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:49', NULL),
(426, 852, 'YGC/2021/0256', '', '2021-04-01', 'Irushi ', '', 'chathumini', '', NULL, '778558406', 'No', NULL, NULL, NULL, '', '', '1995-10-09', 'Female', '', '214 new kandy road biyagama', 'Diploma Level', 0, 0, '', 0, 0, '957832199v', '', '', '', '', '', '778558406', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:50', NULL),
(427, 854, 'YGC/2021/0250', '', '2021-03-24', 'Udeshika ', '', 'Sadamali', '', NULL, '767978128', 'udeshikasadamali644@gmail.com', NULL, NULL, NULL, '', '', '1998-01-04', 'Female', '', 'kon Kadawala, Nagollagoda', 'Diploma Level', 0, 0, '', 0, 0, '985921644v', '', '', '', '', '', '766449820', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:50', NULL),
(428, 856, 'YGC/2021/0264', '', '2021-03-25', 'Shashini ', '', 'Sadamali', '', NULL, '763280817', 'none', NULL, NULL, NULL, '', '', '1998-12-30', 'Female', '', 'Uswewa pihidiya , Rathmale', 'Diploma Level', 0, 0, '', 0, 0, '988651745v', '', '', '', '', '', '767683308', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:51', NULL),
(429, 858, 'YGC/2021/0265', '', '2021-03-26', 'Umesha ', '', 'Prabodhani ', '', NULL, '705934036', 'umeshaperera56@gmail.com', NULL, NULL, NULL, '', '', '1999-11-19', 'Female', '', '345/6,Ranaviru Nishantha perera Mawatha, Weliweriya', 'Diploma Level', 0, 0, '', 0, 0, '1.99981E+11', '', '', '', '', '', '702481841', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:51', NULL),
(430, 860, 'YGC/2021/0278', '', '2021-03-27', 'Dhammapriya Mudiyaselage', ' Vihara', ' Sathyanji', '', NULL, '778743876', 'vihuvihu775@gmail.com', NULL, NULL, NULL, '', '', '1999-02-26', 'Female', '', '53/3, Atikehelgalla , Weliweriya', 'Diploma Level', 0, 0, '', 0, 0, '995570700v', '', '', '', '', '', '756153162', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:52', NULL),
(431, 862, 'YGC/2021/0290', '', '2021-03-31', 'Mohamed ', 'Safeer ', 'Fathima Amna ', '', NULL, '0759889351/ 0774840530', 'amnasf001@gmail.com ', NULL, NULL, NULL, '', '', '2001-01-08', 'Female', '', 'D1/F1, Dias place, Colombo-12', 'Diploma Level', 0, 0, '', 0, 0, '2.00151E+11', '', '', '', '', '', '0756748811 / 0774840530', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:54', NULL),
(432, 864, 'YGC/2021/0291', '', '2021-03-31', 'Manuwarna Kumarage Erandi', ' Darshika ', 'Bandara ', '', NULL, '768706632', 'darshikabandara72@gmail.com', NULL, NULL, NULL, '', '', '2000-03-17', 'Female', '', '126/2 galthude bandaragama ', 'Diploma Level', 0, 0, '', 0, 0, '2.00058E+11', '', '', '', '', '', '776141377', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:54', NULL),
(433, 866, 'YGC/2021/0293', '', '2021-03-29', 'Udyani ', '', 'hirunika ', '', NULL, '758612751', 'Udyanihirunika9@gmail.com', NULL, NULL, NULL, '', '', '2000-11-27', 'Female', '', '94/A/2,udupila,delgoda ', 'Diploma Level', 0, 0, '', 0, 0, '2.00083E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:55', NULL),
(434, 868, 'YGC/2021/0292', '', '2021-04-02', 'Natasha', ' diana', ' de silva', '', NULL, '767154184', 'diananatasha638@gmail.com', NULL, NULL, NULL, '', '', '1998-02-02', 'Female', '', '103 /a makewita ja ela', 'Diploma Level', 0, 0, '', 0, 0, '1.99853E+11', '', '', '', '', '', '770691259', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:56', NULL),
(435, 870, 'YGC/2021/0294', '', '2021-04-02', 'Pahala Gedarage  Ridma', ' Anjalee ', 'Weerasinghe', '', NULL, '756293944', '92anjalee@gmail.com', NULL, NULL, NULL, '', '', '1992-02-20', 'Female', '', '159/2/A, Samurdhi Road, Siyambalape', 'Diploma Level', 0, 0, '', 0, 0, '925511536v', '', '', '', '', '', '710795684', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:57', NULL),
(436, 872, 'YGC/2021/0298', '', '2021-04-04', 'Balage ', 'Nethmi', ' Imashi ', '', NULL, '703261638', 'nethmiimashib@gmail.com ', NULL, NULL, NULL, '', '', '2001-10-25', 'Female', '', '6665/01/A Appugewatta wattala', 'Diploma Level', 0, 0, '', 0, 0, '2.0018E+11', '', '', '', '', '', '716622372', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:58', NULL),
(437, 874, 'YGC/2021/0309', '', '2021-04-01', 'MG  Ashisha ', 'Dilshani', ' Ranweera', '', NULL, '703781480', 'asinsadilshaniranavira1234@gmail.com', NULL, NULL, NULL, '', '', '2001-08-12', 'Female', '', 'Darmapalaya anamaduwa', 'Diploma Level', 0, 0, '', 0, 0, '2.00173E+11', '', '', '', '', '', '777387786', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:22:59', NULL),
(438, 876, 'YGC/2021/0311', '', '2021-04-05', 'Kimmanthudawage Thinuri ', 'Nilakna ', 'Perera', '', NULL, '777326215', 'thinuriperera123@gmail.com', NULL, NULL, NULL, '', '', '2000-06-15', 'Female', '', '29, Wedhamulla mawatha, Kelaniya ', 'Diploma Level', 0, 0, '', 0, 0, '2.00067E+11', '', '', '', '', '', '776011777', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:00', NULL),
(439, 878, 'YGC/2021/0312', '', '2021-04-07', 'N.R.G Janitha', ' Sithumini ', 'Dewasinghe ', '', NULL, '757837853', 'sithuminidewasinghe2@gmail.com', NULL, NULL, NULL, '', '', '2001-11-24', 'Female', '', 'No:08,dumbaragama,kalugala ', 'Diploma Level', 0, 0, '', 0, 0, '2.00183E+11', '', '', '', '', '', '703621346', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:01', NULL),
(440, 880, 'YGC/2021/0319', '', '2021-04-16', 'Uduwarage Maduka', ' Piuni', 'Perera', '', NULL, '711914118', '', NULL, NULL, NULL, '', '', '2021-04-16', 'Female', '', 'NO:341/B,', 'Diploma Level', 0, 0, '', 0, 0, '908532139V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:03', NULL),
(441, 882, 'YGC/2021/0328', '', '2021-04-24', 'Hewadewage Anoma', ' Subhashini', ' Fernando', '', NULL, '759164900', 'Subhashinifernando84@gmail.com', NULL, NULL, NULL, '', '', '1984-08-17', 'Female', '', 'No.522 C 2 R A Fernando Mawatha Eriyawatiya Kelniy', 'Diploma Level', 0, 0, '', 0, 0, '1.98E+11', '', '', '', '', '', '717091912', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:03', NULL),
(442, 884, 'YGC/2021/0316', '', '2021-04-10', 'Dilusha', ' Ishini ', 'Perera', '', NULL, '713818356', 'ishinidilusha@gmail.com', NULL, NULL, NULL, '', '', '2000-01-02', 'Female', '', '1B/49L, National Housing scheme, raddolugama', 'Diploma Level', 0, 0, '', 0, 0, '2.00E+11', '', '', '', '', '', '7748280399', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:04', NULL),
(443, 886, 'YGC/2021/0195', '', '2021-11-04', 'Bukumbura Walawwage', ' Lakshantha ', 'Kumara', '', NULL, '714918176', 'Lakshanbokumbura1art@gmail.com', NULL, NULL, NULL, '', '', '1992-03-29', 'Female', '', '79/01 kalayathana Road Hirana, Panadura', 'Diploma Level', 0, 0, '', 0, 0, '1.99E+11', '', '', '', '', '', '754417308', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:05', NULL),
(444, 888, 'YGC/2021/0315', '', '2021-04-28', 'Balasuriyage sumudu ', 'wasana ', 'perera', '', NULL, '755086386', 'Wasanasumu@gmail.com', NULL, NULL, NULL, '', '', '1992-02-01', 'Female', '', '80/2, A, pamunuwa , Maharagama ', 'Diploma Level', 0, 0, '', 0, 0, '925320668v', '', '', '', '', '', '775710715', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:05', NULL),
(445, 890, 'YGC/2021/0340', '', '2021-05-03', 'Mohamed', ' Safeer Fathima ', 'Amal', '', NULL, '752861488', 'amalfathima180@gmail.com ', NULL, NULL, NULL, '', '', '1997-09-06', 'Female', '', '14/51, Marties Lane, Colombo 12 ', 'Diploma Level', 0, 0, '', 0, 0, '977500389V', '', '', '', '', '', '774840530', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:07', NULL),
(446, 892, 'YGC/2021/0353', '', '2021-05-07', 'Thiranya ', 'Sathyangi ', 'Athukorala ', '', NULL, '703881740', 'thiranyasene@gmail.com ', NULL, NULL, NULL, '', '', '2000-04-20', 'Female', '', '28/2,Buddhist Center Road, Waragoda, Kelaniya ', 'Diploma Level', 0, 0, '', 0, 0, '2.00E+11', '', '', '', '', '', '714470403', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:08', NULL),
(447, 894, 'YGC/2021/0354', '', '2021-05-07', 'Kachchakaduge shenali', ' dinethma ', 'fernando ', '', NULL, '719966596', 'Fernandoshenali27@gmail.com', NULL, NULL, NULL, '', '', '2001-10-06', 'Female', '', '164/1 pamunuwila gonawela kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '2.00E+11', '', '', '', '', '', '712370738', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:08', NULL),
(448, 896, 'YGC/2021/0350', '', '2021-05-06', 'Mahesh ', '', 'Anushiya', '', NULL, '774504013', 'anushiyamahesh89@gmail.com ', NULL, NULL, NULL, '', '', '2001-12-25', 'Female', '', 'B/F12/U5, mETHSANDHA sEVANA, hENAMULLA cOLOMBO 15', 'Diploma Level', 0, 0, '', 0, 0, '2.00E+11', '', '', '', '', '', '767640277', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:09', NULL),
(449, 898, 'YGC/2021/0388', '', '2021-05-28', 'Kaduarachchige Pavani', '', ' Shanika', '', NULL, '777622926', 'Pavanishanika08@gmail.com', NULL, NULL, NULL, '', '', '2001-12-11', 'Female', '', '168/ welikanna,waga', 'Diploma Level', 0, 0, '', 0, 0, '2.00E+11', '', '', '', '', '', '715793135', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:10', NULL),
(450, 900, 'YGC/2021/0419', '', '2021-06-06', 'Ruwani ', 'Chathurika ', 'Bandara', '', NULL, '766837961', 'gunathilakerehana@gmail.com', NULL, NULL, NULL, '', '', '1989-10-02', 'Female', '', 'No.507, Dangahawela, Ragama.', 'Diploma Level', 0, 0, '', 0, 0, '897764288V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:40', NULL),
(451, 902, 'YGC/2021/0421', '', '2021-06-14', 'Dawundage', ' Upekka ', 'Kaushalya ', '', NULL, '779347201', 'dupekka.kaushalya98@gmail.com', NULL, NULL, NULL, '', '', '1998-05-29', 'Female', '', '70/21 P B Alwis Perera Mawatha, Katubedda, Moratuwa. ', 'Diploma Level', 0, 0, '', 0, 0, '986500234V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:41', NULL),
(452, 904, 'YGC/2021/0422', '', '2021-06-12', 'Kurukulasuriyage Tharushi', ' Niranjala ', 'Fernando', '', NULL, '766411799', 'tharushifernando12@icloud.com', NULL, NULL, NULL, '', '', '1998-01-13', 'Female', '', 'No:176/20/2 , Alwis Town Hendala Wattala', 'Diploma Level', 0, 0, '', 0, 0, '985133409v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:41', NULL),
(453, 906, 'YGC/2021/0424', '', '2021-06-19', 'Navodhi', 'Piyumika', ' Silva', '', NULL, '769133985', 'navodhipiyu95@gmail.com', NULL, NULL, NULL, '', '', '2001-05-09', 'Female', '', '517/4, Madagodalanda Road , Athurugiriya', 'Diploma Level', 0, 0, '', 0, 0, '2.00163E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:41', NULL),
(454, 908, 'YGC/2021/0425', '', '2021-06-19', 'D.G.M Kanchana ', '', 'Niroshani', '', NULL, '761723754', 'pradeepjayawardane10@gmail.com', NULL, NULL, NULL, '', '', '2000-04-10', 'Female', '', '48/8/A, Rathupaswala, Mudungoda.', 'Diploma Level', 0, 0, '', 0, 0, '2.0006E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:42', NULL),
(455, 910, 'YGC/2021/0429A', '', '2021-06-22', 'Shehana ', 'Minushi ', 'Weerabahu', '', NULL, '761193181', 'shehanaminushi@gmail.com', NULL, NULL, NULL, '', '', '2001-03-16', 'Female', '', '296, Horagolla, Ganemulla', 'Diploma Level', 0, 0, '', 0, 0, '2.00158E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:42', NULL),
(456, 912, 'YGC/2021/0432', '', '2021-06-16', 'Kumarage Don Natasha ', '', 'Sahassri ', '', NULL, '719520409', 'natasha.sahassri@gmail.com', NULL, NULL, NULL, '', '', '2000-03-01', 'Female', '', '895/4A, Aluthmawatha Road, Modara, Colombo-15.', 'Diploma Level', 0, 0, '', 0, 0, '2.00056E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:42', NULL),
(457, 914, 'YGC/2021/0433', '', '2021-06-23', 'L.A.Prasadi ', '', 'Nimanthika ', '', NULL, '725959509', 'prasadinimanthika2001@gamil.com', NULL, NULL, NULL, '', '', '2001-04-14', 'Female', '', '406/3 kossinna ,Ganemulla', 'Diploma Level', 0, 0, '', 0, 0, '2.00161E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:43', NULL),
(458, 916, 'YGC/2021/0437', '', '2021-06-23', 'Mirissage Hashini ', 'Imesha', ' wijewardana', '', NULL, '777628650', 'hashiniwijewardana9192@gmail.com', NULL, NULL, NULL, '', '', '1992-06-21', 'Female', '', '146/20, 5th lane, Kaldemulla road, Moratuwa ', 'Diploma Level', 0, 0, '', 0, 0, '926731092V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:43', NULL),
(459, 918, 'YGC/2021/0447', '', '2021-06-29', 'Hathurusingha Dewage ', 'Dilki', ' Awishka', '', NULL, '768026391', 'dilkiawishka17@gmail.com', NULL, NULL, NULL, '', '', '2000-08-17', 'Female', '', 'No.72/4/A walbothale , Kandalama ,Mirigama.', 'Diploma Level', 0, 0, '', 0, 0, '2.00073E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:44', NULL),
(460, 920, 'YGC/2021/0445', '', '2021-06-29', 'Rashmi ', 'Virasha ', 'Sewvandi', '', NULL, '773978963', 'rashmanansooriya@gamil.com', NULL, NULL, NULL, '', '', '2001-06-08', 'Female', '', 'No.248/B Batagama South Hapugoda Kandana ', 'Diploma Level', 0, 0, '', 0, 0, '2.00166E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:44', NULL),
(461, 922, 'YGC/2021/0454', '', '2021-07-01', 'Merinnage saduni ', 'wasana ', 'frenando ', '', NULL, '715359798', 'sanduniw800@gmali.com', NULL, NULL, NULL, '', '', '1994-09-09', 'Female', '', 'No 29.8th lane nirmala mawatha. Katuwapitiya. Negombo ', 'Diploma Level', 0, 0, '', 0, 0, '947536049v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:44', NULL),
(462, 924, 'YGC/2021/0448', '', '2021-07-01', 'Jayodya', ' Samaji ', 'Wiccramaarachchi', '', NULL, '718511414', 'samajiaponsu09@gmail.com', NULL, NULL, NULL, '', '', '2000-05-24', 'Female', '', 'No.266 A1 Araliyasewana kariyawasamgovipura Bandaragama ', 'Diploma Level', 0, 0, '', 0, 0, '2.00065E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:45', NULL),
(463, 926, 'YGC/2021/0451', '', '2021-07-03', 'E.E.Dimuthu ', '', 'Kumari', '', NULL, '716892259', 'snkpathirage7@gmail.com', NULL, NULL, NULL, '', '', '1975-02-10', 'Female', '', '181/2/2 welagedara attanagalla ', 'Diploma Level', 0, 0, '', 0, 0, '755412066V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:45', NULL),
(464, 928, 'YGC/2021/0453', '', '2021-07-04', 'Bombiwala Sewage ', 'Sinthika', ' Niroshani', '', NULL, '773041400', 'sinthikabdn@gmail.com', NULL, NULL, NULL, '', '', '1982-12-21', 'Female', '', 'No.27, Central Garden, Kaluwarippuwa, Katana', 'Diploma Level', 0, 0, '', 0, 0, '1.98286E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:45', NULL),
(465, 930, 'YGC/2021/0452', '', '2021-07-09', 'H.P Ishara ', '', 'Dilshani ', '', NULL, '754990909', 'idilshani337@gmail.com', NULL, NULL, NULL, '', '', '2001-06-03', 'Female', '', '25/19, Wilfred mawatha kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '2.00166E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:46', NULL),
(466, 932, 'YGC/2021/0461', '', '2021-07-11', 'Madumi ', 'Priyasha ', 'Meedeniya', '', NULL, '787119577', 'madumipriyasha363@gmail.com', NULL, NULL, NULL, '', '', '1998-03-15', 'Female', '', '33/3/2, Radawana road, Yakkala', 'Diploma Level', 0, 0, '', 0, 0, '985751323v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:46', NULL),
(467, 934, 'YGC/2021/0468A', '', '2021-07-15', 'M.W Jayani ', '', 'Morawaththa', '', NULL, '0771759548/0711871895', 'jayanichamarika9@gmail.com', NULL, NULL, NULL, '', '', '1991-09-18', 'Female', '', '588/8,Gurugalla Road,Talduwa,Avissawella', 'Diploma Level', 0, 0, '', 0, 0, '917620342v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:47', NULL),
(468, 936, 'YGC/2021/0466A', '', '2021-07-06', 'Biyanwilage ', 'Asanthika', ' Perera ', '', NULL, '752896653', 'asanthi.aialife@gmail.com', NULL, NULL, NULL, '', '', '1997-05-03', 'Female', '', '78,9th Lane,Lake City, Jaela.', 'Diploma Level', 0, 0, '', 0, 0, '976243935V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:47', NULL),
(469, 938, 'YGC/2021/0469', '', '2021-07-14', 'U. V. D Kaumini Vidurangi ', '', '', '', NULL, '771750260', '', NULL, NULL, NULL, '', '', '1997-08-15', 'Female', '', '80/C Naranwala, Gampaha', 'Diploma Level', 0, 0, '', 0, 0, '977281423V ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:47', NULL),
(470, 940, 'YGC/2021/0470A', '', '2021-07-14', 'Irugal Bandaralage ', 'Bhawanthi ', 'Nimesha', '', NULL, '768952252', 'Bhawanthinimesha458@gmil.com', NULL, NULL, NULL, '', '', '1997-08-23', 'Female', '', 'No 15/6,siribaramenikepura,katubedda,moratuwa', 'Diploma Level', 0, 0, '', 0, 0, '977361060V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:47', NULL),
(471, 942, 'YGC/2021/0484', '', '2021-07-26', 'Chathumini ', '', 'Wijayawardane', '', NULL, '', '', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:48', NULL),
(472, 944, 'YGC/2021/0490', '', '2021-04-08', ' Lakmini  ', '', 'Amarasiri', '', NULL, '', '', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:48', NULL),
(473, 946, 'YGC/2021/0491', '', '2021-04-08', 'Hansanee ', '', 'Devindi', '', NULL, '', '', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:23:48', NULL),
(474, 948, 'YGC/2021/0081', '', '2021-01-04', 'Dissanayaka mudhiyanselage hashan', ' madhusanka ', 'dissanayaka', '', NULL, '715851086', 'hashandissanayaka9@gmail.com', NULL, NULL, NULL, '', '', '1999-03-28', 'Male', '', '250/1 natiyagama ambagaswewa redhibendhi ella', 'HND Level', 0, 0, '', 0, 0, '990880816v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:01', NULL),
(475, 950, 'YGC/2021/0134', '', '2021-01-11', 'Palihawadena Arachchige Brian', ' Devon Warrick ', 'jayawardena', '', NULL, '774800697', 'briandevon22@gmail.com', NULL, NULL, NULL, '', '', '1993-05-22', 'Male', '', '265/1,Dippitigoda,Kelaniya', 'HND Level', 0, 0, '', 0, 0, '931432281V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:02', NULL),
(476, 952, 'YGC/2021/0161', '', '2021-01-20', 'Kodithuwakkuge ravindu', ' sansala ', 'dinendra', '', NULL, '0767376868/0779374897', 'skmotors048@gmail.com', NULL, NULL, NULL, '', '', '1999-12-10', 'Male', '', 'pamunuwila gonawala kelaniya', 'HND Level', 0, 0, '', 0, 0, '1.99935E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:02', NULL),
(477, 954, 'YGC/2021/0186', '', '2021-02-13', 'Ratnakumar ', '', 'Dakshan', '', NULL, '785165240', 'dakshanratnakumar7@gmail.com', NULL, NULL, NULL, '', '', '2004-10-07', 'Male', '', 'No:274 Dippitigoda rd, Yashodara Mawatha, Hunupitiya, Wattala', 'HND Level', 0, 0, '', 0, 0, 'N-F 007334', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:02', NULL),
(478, 956, 'YGC/2021/0237', '', '2021-03-27', 'Ranasinghe Arachchilage', ' Gihan ', 'Imesha', '', NULL, '753475806', 'ranamsinghe@gmail.com', NULL, NULL, NULL, '', '', '2000-04-10', 'Male', '', '315/A2 ,waboda rd , Gonahena ,Kadawatha ', 'HND Level', 0, 0, '', 0, 0, '2.0001E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:03', NULL),
(479, 958, 'YGC/2021/0238', '', '2021-03-25', 'Wisidagama Appuhamilage Don', ' Pubudu ', 'Lakshan Gunasekara', '', NULL, '719136224', '123lakshangunasekara@gmail.com', NULL, NULL, NULL, '', '', '2000-10-25', 'Male', '', '285/2 Phalabiyanwilla Kadawatha', 'HND Level', 0, 0, '', 0, 0, '2.0003E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:03', NULL),
(480, 960, 'YGC/2021/0282', '', '2021-04-01', 'Shimashi', ' Deviduni ', 'Pereira', '', NULL, '788323931', 'devidunipereira@gmail.com', NULL, NULL, NULL, '', '', '2001-06-15', 'Female', '', '36/c, Mabima Heiyanthuduwa', 'HND Level', 0, 0, '', 0, 0, '2.00167E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:03', NULL),
(481, 962, 'YGC/2021/0276', '', '2021-04-01', 'R D ', 'Hanshani ', 'Piyumila ', '', NULL, '716450139', 'hanshaninishanthi@gmail.com', NULL, NULL, NULL, '', '', '2000-08-15', 'Female', '', '20/12 Nahena Road, Mathew House, Hunupitiya , Wattala', 'HND Level', 0, 0, '', 0, 0, '2.00073E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:04', NULL),
(482, 964, 'YGC/2021/0240', '', '2021-04-01', 'M H Dinithi ', 'Upadya', ' Tissera', '', NULL, '112974253', 'dinithiupadya2001@gmail.com', NULL, NULL, NULL, '', '', '2001-03-24', 'Female', '', '164/2, Mahara Nugegoda, Kadawatha', 'HND Level', 0, 0, '', 0, 0, '2.00158E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:04', NULL),
(483, 966, 'YGC/2021/0235', '', '2021-04-01', 'K D Mishan', '', ' Vishmitha ', '', NULL, '715133394', 'mishanvishmitha58@gmail.com', NULL, NULL, NULL, '', '', '2000-05-05', 'Male', '', '141/5, Kirimatiyagara, Kadawatha', 'HND Level', 0, 0, '', 0, 0, '2.00013E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:04', NULL),
(484, 968, 'YGC/2021/0234', '', '2021-03-26', 'Mohomed Ashad ', 'Oshada ', 'Chathushka Irhad ', '', NULL, '0788230236/ 0752615479', 'oshadachathushaka3@gmail.com', NULL, NULL, NULL, '', '', '2000-04-28', 'Male', '', '86/26, Heritage city, Maguruwila Rd, Gonawala, kelaniya', 'HND Level', 0, 0, '', 0, 0, '2.00012E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:05', NULL),
(485, 970, 'YGC/2021/0296', '', '2021-04-03', 'H G Tharaka ', 'Charith ', 'Siriwardana', '', NULL, '785438378', 'tharakacharith08@gmail.com', NULL, NULL, NULL, '', '', '1998-08-28', 'Male', '', '394 Old Kandy Road, Dalugama, Kelaniya', 'HND Level', 0, 0, '', 0, 0, '1.99824E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:06', NULL),
(486, 972, 'YGC/2021/0297', '', '2021-04-03', 'A A Kavindu ', 'Prabath', ' Weerakoon', '', NULL, '703657964', 'kavinduprabath26@gmail.com', NULL, NULL, NULL, '', '', '2000-09-26', 'Male', '', '94/5, Maguruwila Road, Gonawala Kelaniya', 'HND Level', 0, 0, '', 0, 0, '2.00027E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:07', NULL),
(487, 974, 'YGC/2021/0295', '', '2021-04-09', 'S A ISHARA', '', ' DILMI', '', NULL, '112381251', 'isharadilmi826@gmail.com', NULL, NULL, NULL, '', '', '2000-03-25', 'Female', '', '55/13 SUMITHRARAMA MAWATHA KOTAHENA COLOMBO 13', 'HND Level', 0, 0, '', 0, 0, '2.00059E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:08', NULL),
(488, 976, 'YGC/2021/0336', '', '2021-05-01', 'Iranthi ', '', 'Jayasekera', '', NULL, '332050454', 'iranthiwj@gmail.com', NULL, NULL, NULL, '', '', '1992-06-08', 'Female', '', '124/5, Yatiyana, Nittambuwa', 'HND Level', 0, 0, '', 0, 0, '926601202V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:08', NULL),
(489, 978, 'YGC/2021/0160', '', '2021-04-27', 'Prageeth', ' Kavishan ', 'weerasinghe', '', NULL, '754773898', 'prageethkaviahan991221@gmail.com', NULL, NULL, NULL, '', '', '1999-12-21', 'Male', '', 'No. 244/B/3, Udupila, Delgoda. ', 'HND Level', 0, 0, '', 0, 0, '1.99936E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:27', NULL),
(490, 980, 'YGC/2021/0174', '', '2021-04-28', 'Dona Sanduni ', 'Imesha ', 'Weerasinghe ', '', NULL, '710791680', 'sandu721weerasinghe@gmail.com', NULL, NULL, NULL, '', '', '1999-04-19', 'Female', '', '465/G/4/B Sabawa road,Makola South, Makola', 'HND Level', 0, 0, '', 0, 0, '996103803V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:28', NULL),
(491, 982, 'YGC/2021/0314', '', '2021-04-28', 'A M B K ', 'THATHSARA', '', '', NULL, '773536088', 'kavindut21@yahoo.com', NULL, NULL, NULL, '', '', '2000-10-18', 'Male', '', '36/1 MEEGAHAWATTHA DELGODA', 'HND Level', 0, 0, '', 0, 0, '2.00029E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:29', NULL),
(492, 984, 'YGC/2021/0339', '', '2021-04-10', 'RAJAPAKSHA APPUHAMILAGE ', 'UDESHA ', 'MADHUSANKA', '', NULL, '777818084', 'Udesharajapaksha97@gmail.com', NULL, NULL, NULL, '', '', '1997-08-25', 'Male', '', '100/1 WEERAGULA, YAKKALA', 'HND Level', 0, 0, '', 0, 0, '972382507V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:30', NULL),
(493, 986, 'YGC/2021/0342', '', '2021-04-28', 'T. O. ', '', 'Nipun', '', NULL, '755533316', 'osandanipun1999@gmail.com', NULL, NULL, NULL, '', '', '1997-10-23', 'Male', '', '516/ 3 gongonagampala road welikubura kelaniya', 'HND Level', 0, 0, '', 0, 0, '972972363v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:31', NULL),
(494, 988, 'YGC/2021/0349', '', '2021-05-10', 'Mohomed Firzan ', 'Mohomed ', 'Rushdi', '', NULL, '776684557', 'mohomedrushdi199@gmail.com', NULL, NULL, NULL, '', '', '2003-06-22', 'Male', '', '109, sangaraja mawatha hunupitiya wattala', 'HND Level', 0, 0, '', 0, 0, '2.00317E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:32', NULL),
(495, 990, 'YGC/2021/0361', '', '2021-05-06', 'Wijerathne Arachchige ', 'Hiran ', 'Sunera', '', NULL, '766692323', 'trangani199162@gmail.com', NULL, NULL, NULL, '', '', '1999-10-31', 'Male', '', '157/7 ,Grandpass Road,Colombo 14', 'HND Level', 0, 0, '', 0, 0, '993056405V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:33', NULL),
(496, 992, 'YGC/2021/0455', '', '2021-07-05', 'Chamith ', '', 'Nadeeshan ', '', NULL, '719364099', 'vchamithnadeeshan@gmail.com', NULL, NULL, NULL, '', '', '1997-07-29', 'Male', '', '317/14, kanadola,Ratnapura ', 'HND Level', 0, 0, '', 0, 0, '972112917v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:34', NULL),
(497, 994, 'YGC/2021/0480', '', '2021-07-27', 'K.Nishini ', '', 'Chamya', '', NULL, '771069175', 'nishichamya@gmail.com', NULL, NULL, NULL, '', '', '2000-04-01', 'Female', '', 'No 247/3/A Pahalakaragahamuna , Udara mawatha , Ragama Rode , Kadawatha ', 'HND Level', 0, 0, '', 0, 0, '2.00059E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:25:35', NULL),
(498, 996, 'YGC/2021/0191', '', '2021-03-01', 'Malshi ', 'imasha', ' botheju', '', NULL, '769957973', 'THROUGH A FRIEND / FAMILY MEMBER', NULL, NULL, NULL, '', '', '2001-03-17', 'Female', '', '293/ gonahena kadawatha sri lanka', 'Diploma Level', 0, 0, '', 0, 0, '2.00158E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(499, 998, 'YGC/2021/0203', '', '2021-03-23', 'Maheesha ', '', 'Jayawardane', '', NULL, '710885586', 'Handbills', NULL, NULL, NULL, '', '', '2004-05-08', 'Female', '', '50/f/a thalagahawattha suriyapaluwa kadawatha', 'Diploma Level', 0, 0, '', 0, 0, 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES
(500, 1000, 'YGC/2021/0249', '', '2021-03-24', 'Primesha ', '', 'Ashani', '', NULL, '740205554', 'Incomming', NULL, NULL, NULL, '', '', '2001-09-27', 'Female', '', '151/B, Yabaraluwa, Malwana', 'Diploma Level', 0, 0, '', 0, 0, '2.00159E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(501, 1002, 'YGC/2021/0241', '', '2021-03-25', 'Sivakumar ', '', 'Malkanthi', '', NULL, '774415215', 'Incoming Call', NULL, NULL, NULL, '', '', '2002-10-15', 'Female', '', '09/15, Old Nuge Road, Nawaloka Garden, Peliyagoda', 'Diploma Level', 0, 0, '', 0, 0, '2.00279E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(502, 1004, 'YGC/2021/0232', '', '2021-03-25', 'Mindi Kavithma ', '', 'Fonseka', '', NULL, '774673339', 'Handbills', NULL, NULL, NULL, '', '', '2004-04-29', 'Female', '', '411G, Parakrama Mawatha Kadawatha', 'Diploma Level', 0, 0, '', 0, 0, 'no', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(503, 1006, 'YGC/2021/0242', '', '2021-03-25', 'G N Irosha', '', '', '', NULL, '776510435', 'Incoming Call', NULL, NULL, NULL, '', '', '2001-11-03', 'Female', '', 'Navinna Watta Kodikaragoda Morawaka', 'Diploma Level', 0, 0, '', 0, 0, '776510435', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(504, 1008, 'YGC/2021/0070', '', '2021-03-25', 'Maheshi minnimuthu perera', '', '', '', NULL, '768441648', 'Call from YGC', NULL, NULL, NULL, '', '', '2001-06-25', 'Female', '', '122 bodirajapura mawatha werahara boralasgamuwa', 'Diploma Level', 0, 0, '', 0, 0, '2.00168E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(505, 1010, 'YGC/2021/0258', '', '2021-03-24', 'R.A.Manusha ', '', 'Bhagyan', '', NULL, '774660300', 'School', NULL, NULL, NULL, '', '', '2005-01-09', 'Female', '', '434/C Maharanugegoda kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.00501E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(506, 1012, 'YGC/2021/0260', '', '2021-03-26', 'D.P.A.Sanduni ', '', 'Sankalpana', '', NULL, '778388435', 'Handbills', NULL, NULL, NULL, '', '', '2004-02-15', 'Female', '', '106/B Siyambalapewatta Delgoda', 'Diploma Level', 0, 0, '', 0, 0, '2.00455E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(507, 1014, 'YGC/2021/0261', '', '2021-03-26', 'Kannangara Arachchige ', 'Manuthi ', 'Nisadara', '', NULL, '769678129', 'Through a friend / Family member', NULL, NULL, NULL, '', '', '2004-08-16', 'Female', '', '135/2 In Front Of School Wanaluwawa', 'Diploma Level', 0, 0, '', 0, 0, '2.00473E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(508, 1016, 'YGC/2021/0266', '', '2021-03-26', 'Aththanayaka Mudiyanselage Pathum ', 'Lakshan', 'Bandara', '', NULL, '717357550', 'Through a friend / Family member', NULL, NULL, NULL, '', '', '2004-03-10', 'Male', '', '146/4,HORAHENA ROAD,WABODA WEST,WABODA.', 'Diploma Level', 0, 0, '', 0, 0, '2.00407E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(509, 1018, 'YGC/2021/0271', '', '2021-03-26', 'J.A.Nethmi ', 'Amaya ', 'Perera.', '', NULL, '750409697', 'Through a friend / Family member', NULL, NULL, NULL, '', '', '2004-06-24', 'Female', '', '186/B/1, kirimetiyagara , kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.00468E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(510, 1020, 'YGC/2021/0275', '', '2021-03-27', 'Thanesh ', 'Deeshan ', 'balaliyanage', '', NULL, '761480884', 'Through a friend / Family member', NULL, NULL, NULL, '', '', '2004-09-16', 'Male', '', '363/kossinna,ganemulle', 'Diploma Level', 0, 0, '', 0, 0, '2.00426E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(511, 1022, 'YGC/2021/0280', '', '2021-03-29', 'Piumika ', '', 'janani', '', NULL, '784221054', 'Facebook', NULL, NULL, NULL, '', '', '2004-06-18', 'Female', '', '314/E pugoda road delgoda', 'Diploma Level', 0, 0, '', 0, 0, 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:15', NULL),
(512, 1024, 'YGC/2021/0279', '', '2021-03-29', 'Hirunika ', '', 'malshani', '', NULL, '768416692', 'Facebook', NULL, NULL, NULL, '', '', '2004-05-29', 'Female', '', '837/08 siyambalape wattha delgoda', 'Diploma Level', 0, 0, '', 0, 0, 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:16', NULL),
(513, 1026, 'YGC/2021/0259', '', '2021-03-26', 'Sajila ', 'Tharuneth ', 'Ranasinghe', '', NULL, '770375869', 'incoming call', NULL, NULL, NULL, '', '', '2003-02-27', 'Male', '', 'not completed', 'Diploma Level', 0, 0, '', 0, 0, 'not complete', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:16', NULL),
(514, 1028, 'YGC/2021/0268', '', '2021-03-29', 'Adithya ', '', 'Rajapaksha', '', NULL, '777277271', 'Facebook', NULL, NULL, NULL, '', '', '2004-03-08', 'Male', '', '36FA, Peramuna Rd, Kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.00407E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:16', NULL),
(515, 1030, 'YGC/2021/0267', '', '2021-03-31', 'Wickramasingha appuhamilage ', 'Sachinika  ', 'malshani', '', NULL, '761796713', 'CALL FROM YGC', NULL, NULL, NULL, '', '', '1999-02-11', 'Female', '', 'No:461/4,vithanamulla,divulapitiya', 'Diploma Level', 0, 0, '', 0, 0, '998072069v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:16', NULL),
(516, 1032, 'YGC/2021/0289', '', '2021-03-30', 'Sharif mohomad ', 'Fathima', ' salma ', '', NULL, '766695035', 'Facebook', NULL, NULL, NULL, '', '', '2000-02-15', 'Female', '', '20/18 Eksathgama ,Radawana ', 'Diploma Level', 0, 0, '', 0, 0, '2.00055E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:16', NULL),
(517, 1034, 'YGC/2021/0255', '', '2021-04-02', 'Hettiarachchige', ' Amaya ', 'Nethmi', '', NULL, '721657500', 'Handbills', NULL, NULL, NULL, '', '', '2004-02-18', 'Female', '', '339/B,Mahara Nugegoda, Kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.00455E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:16', NULL),
(518, 1036, 'YGC/2021/0307', '', '2021-04-06', 'Amarathunga arachchige akila ', '', 'Dilshan ', '', NULL, '773795998', 'Through a friend / Family member', NULL, NULL, NULL, '', '', '2004-04-30', 'Male', '', '343 /bandarahenawaththa/ radawana', 'Diploma Level', 0, 0, '', 0, 0, '2.00412E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:16', NULL),
(519, 1038, 'YGC/2021/0313', '', '2021-05-03', 'Sanjana ', '', 'gajaweera', '', NULL, '779620318', 'Handbills', NULL, NULL, NULL, '', '', '2004-07-10', 'Female', '', '127/6 Biyagama road, kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '2.00469E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:16', NULL),
(520, 1040, 'YGC/2021/0322', '', '2021-04-28', 'Rankiri Hettiarcchige Dinusha', 'Nishanthi ', 'Perera', '', NULL, '714849514', 'Facebook', NULL, NULL, NULL, '', '', '1998-07-14', 'Female', '', '637/23,SIRIMAVO BANDARANAIKE MAWATHA COLOMBO 14', 'Diploma Level', 0, 0, '', 0, 0, '986960350V ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:26:16', NULL),
(521, 1042, 'YGC/2021/0420', '', '2021-06-15', 'Arumugam ', '', 'Prakash', '', NULL, '775940620', 'arumugamprakash5940@gmail.com', NULL, NULL, NULL, '', '', '2000-04-26', 'Male', '', 'Enselwatta S.T division Deneyaya', 'Certificate Level', 0, 0, '', 0, 0, '2.00012E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:39:51', NULL),
(522, 1044, 'YGC/2021/0423', '', '2021-06-19', 'Harshana ', 'shan ', 'fonseka', '', NULL, '781986393', 'Harshanashan42@gmail.com', NULL, NULL, NULL, '', '', '1997-09-23', 'Male', '', 'No:72 balagala watta hendala wattala', 'Certificate Level', 0, 0, '', 0, 0, '972670286v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:39:52', NULL),
(523, 1046, 'YGC/2021/0426', '', '2021-06-21', 'D.K.Oshadi ', '', 'Lavanthi', '', NULL, '779715267', 'oshadilavanthi@gmail.com', NULL, NULL, NULL, '', '', '1996-09-03', 'Female', '', '46/20 E,Gamunumawatha ,Hunupitiya ,Wattala', 'Certificate Level', 0, 0, '', 0, 0, '967472905V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:39:53', NULL),
(524, 1048, 'YGC/2021/0429', '', '2021-06-21', 'Gagani ', '', 'Thathsarani', '', NULL, '763295151', 'gagani99silva@gmail.com', NULL, NULL, NULL, '', '', '1999-03-15', 'Female', '', '20/4, Bekkegama, Panadura', 'Certificate Level', 0, 0, '', 0, 0, '995752239v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:39:54', NULL),
(525, 1050, 'YGC/2021/0428', '', '2021-06-17', 'Merinnage saduni ', 'wasana ', 'frenando ', '', NULL, '715359798', 'sanduniw800@gmali.com', NULL, NULL, NULL, '', '', '1994-09-09', 'Female', '', 'No 29.8th lane nirmala mawatha. Katuwapitiya. Negombo ', 'Certificate Level', 0, 0, '', 0, 0, '947536049v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:39:55', NULL),
(526, 1052, 'YGC/2021/0434', '', '2021-06-19', 'Hewa Kottage Sachini ', 'Punsara ', 'Wimalasuriya', '', NULL, '755600228', 'punsarasachini@gmail.com', NULL, NULL, NULL, '', '', '2000-10-01', 'Female', '', '165/A/5 Duwa road Batagama North Jaela', 'Certificate Level', 0, 0, '', 0, 0, '2.00078E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:39:56', NULL),
(527, 1054, 'YGC/2021/0436', '', '2021-06-26', 'Mapahamu Mudiyanselage Kalani ', 'Sachithra', ' Wijebandara', '', NULL, '714705337', 'kalani.sachi@gmail.com', NULL, NULL, NULL, '', '', '1991-09-10', 'Female', '', '276/2 Gamunu Wickramasinghe mawatha, Kelaniya', 'Certificate Level', 0, 0, '', 0, 0, '917542147v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:39:57', NULL),
(528, 1056, 'YGC/2021/0438', '', '2021-06-26', 'Thanippulige Yushen ', 'Prakash ', 'Rathnayaka ', '', NULL, '760216787', 'yushenprakash853@gmail.com', NULL, NULL, NULL, '', '', '2000-02-28', 'Male', '', 'No.383 Negombo Road Maradagahamula ', 'Certificate Level', 0, 0, '', 0, 0, '2.00006E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:39:58', NULL),
(529, 1058, 'YGC/2021/0439', '', '2021-06-27', 'K.D.C.D.P. ', '', 'Rajakaruna', '', NULL, '774779758', 'chinthakarajakaruna@gmail.com', NULL, NULL, NULL, '', '', '1991-11-20', 'Male', '', '624 A/2 , wathurawela,kosgoda.', 'Certificate Level', 0, 0, '', 0, 0, '913252128V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:39:59', NULL),
(530, 1060, 'YGC/2021/0441', '', '2021-06-28', 'Gangoda arachchige cloard praneeth', ' Sandeepa', ' perera ', '', NULL, '752263819', 'praneeth2243@gmail.com', NULL, NULL, NULL, '', '', '1997-12-03', 'Male', '', '233/19c mahawatta road Colombo 14 ', 'Certificate Level', 0, 0, '', 0, 0, '973381474v ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:40:00', NULL),
(531, 1062, 'YGC/2021/0440', '', '2021-06-27', 'Kimmanthudawage Thinuri ', 'Nilakna ', 'Perera', '', NULL, '777326215', 'thinuriperera123@gmail.com', NULL, NULL, NULL, '', '', '2000-06-15', 'Female', '', '31, Wedamulla Mawatha, Kelaniya', 'Certificate Level', 0, 0, '', 0, 0, '2.00067E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:40:01', NULL),
(532, 1064, 'YGC/2021/0442', '', '2021-06-24', 'Aruna ', 'Prasad', ' Siriwardhane ', '', NULL, '714429560', 'arunaps75@gmail.com', NULL, NULL, NULL, '', '', '1978-02-13', 'Male', '', 'No.169, pubudupura, Anuradhapura .', 'Certificate Level', 0, 0, '', 0, 0, '750443354v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:40:02', NULL),
(533, 1066, 'YGC/2021/0443', '', '2021-06-28', 'Henry George ', 'Udari ', 'Tissera ', '', NULL, '775012624', 'udari01@gmail.com', NULL, NULL, NULL, '', '', '1984-09-05', 'Female', '', 'No 127 kotikawatta mulleriyawa Newtown ', 'Certificate Level', 0, 0, '', 0, 0, '847493003v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:40:03', NULL),
(534, 1068, 'YGC/2021/0446', '', '2021-06-29', 'Hitihami Mudiyanselage Imetha ', 'Pansandi ', 'Wasathgiri', '', NULL, '717354565', 'imethablink@gmail.com', NULL, NULL, NULL, '', '', '2001-06-11', 'Female', '', 'No(16) , Dream Park , Thummodara , Kuliyapitiya , Kurunagale', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:40:04', NULL),
(535, 1070, 'YGC/2021/0449', '', '2021-06-29', 'A.A.Harini', 'Lakna', 'Amarasinghe', '', NULL, '779130185', 'hariniamarasinghe5@gmail.com', NULL, NULL, NULL, '', '', '1995-08-21', 'Female', '', '214/52, Hill Crest Estate, Makandana, Piliyandala', 'Certificate Level', 0, 0, '', 0, 0, '957343562V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:40:05', NULL),
(536, 1072, 'YGC/2021/0450', '', '2021-07-06', 'Merinnage Hiruni ', 'Nisansala ', 'Fernando ', '', NULL, '770720636', 'nisansala1022@gmail.com', NULL, NULL, NULL, '', '', '2001-10-22', 'Female', '', '60/09/03 Delpakadawala Badalgama', 'Certificate Level', 0, 0, '', 0, 0, '2.0018E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:40:06', NULL),
(537, 1074, 'YGC/2021/0466', '', '2021-07-15', 'Chandramali ', '', 'Sirisena ', '', NULL, '772806165', '', NULL, NULL, NULL, '', '', '1970-10-03', 'Female', '', '436/D,Eriyawatiya, Kelaniya.', 'Certificate Level', 0, 0, '', 0, 0, '1.97078E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:40:07', NULL),
(538, 1076, 'YGC/2021/0468', '', '2021-07-12', 'R.H.Hashini ', 'Rashmidha ', 'Lakrandi', '', NULL, '713059089', 'hashinihashini1212@gmail.com', NULL, NULL, NULL, '', '', '1999-10-02', 'Female', '', '90 mile post , Dematagala , Kolambageara ,Embilipitiya ', 'Certificate Level', 0, 0, '', 0, 0, '997762592V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:44', NULL),
(539, 1078, 'YGC/2021/0471', '', '2021-07-14', 'Irugal Bandaralage', ' Bhawanthi', ' Nimesha', '', NULL, '768952252', 'Bhawanthinimesha458@gmail.com', NULL, NULL, NULL, '', '', '1997-08-23', 'Female', '', 'No 15/6siribaramenikepura,katubedda,moratuwa', 'Certificate Level', 0, 0, '', 0, 0, '977361060V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:45', NULL),
(540, 1080, 'YGC/2021/0478', '', '2021-07-22', 'Anthonypillai', ' lRony ', 'Rajan', '', NULL, '077 5198 147 ', 'ronydemeld@gmail.com', NULL, NULL, NULL, '', '', '1978-11-28', 'Male', '', '1/8. Ethirvira Avenue,Dehiwala', 'Certificate Level', 0, 0, '', 0, 0, '1.97833E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:46', NULL),
(541, 1082, 'YGC/2021/0477', '', '2021-07-12', 'Jeeva Kavindu ', 'Alvis ', 'Adhihetti', '', NULL, '778005245', 'jeewakawindu@gmail.com', NULL, NULL, NULL, '', '', '1996-04-02', 'Male', '', 'Kalukgahawatte, Baddegama Town Baddegama', 'Certificate Level', 0, 0, '', 0, 0, '960930010v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:47', NULL),
(542, 1084, 'YGC/2021/0479', '', '2021-07-21', 'Maleesha ', 'Dilshani ', 'Gamlath', '', NULL, '071 2184936', 'maleeshadilshanigamlath@gmail.com', NULL, NULL, NULL, '', '', '1996-05-04', 'Female', '', '184/2 jayanthi rd , pallemulla , halolluwa .', 'Certificate Level', 0, 0, '', 0, 0, '966252600v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:47', NULL),
(543, 1086, 'YGC/2021/0492', '', '2021-08-02', 'Dhanushka ', 'Nuwan ', 'Prasad', '', NULL, '717896168', 'dhanu82nuwan@gmail.com', NULL, NULL, NULL, '', '', '1982-08-26', 'Male', '', 'No-148, temple road, Eriyawetiya, Kiribathgoda ', 'Certificate Level', 0, 0, '', 0, 0, '922390676v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:48', NULL),
(544, 1088, 'YGC/2021/0496', '', '2021-08-08', 'Shani Madumali', 'Abeysiri', 'Narayana', '', NULL, '703732260', 'shaninarayana70@gmail.com', NULL, NULL, NULL, '', '', '1991-11-23', 'Female', '', 'No 244/7A,Ritigahahena Road, Mawathagama,Padukka. ', 'Certificate Level', 0, 0, '', 0, 0, '918284702v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:49', NULL),
(545, 1090, 'YGC/2021/0497', '', '2021-08-09', 'Kankanige Ganga ', 'Sanjeewani', ' Peiris ', '', NULL, '718508819', 'gangathinuga@gmail.com', NULL, NULL, NULL, '', '', '1981-03-31', 'Female', '', '44, Mayadunna Mawatha ,Millennium city , Athurugiriya ', 'Certificate Level', 0, 0, '', 0, 0, '1.98159E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:50', NULL),
(546, 1092, 'YGC/2021/0498', '', '2021-08-09', 'Katuwawala Arachchige Koshila', 'Kavindi', 'Amarasiri', '', NULL, '077 9162099', 'Koshilakavindi39@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Female', '', 'No.180/A IDDAMAL DENIYA DOMPE .', 'Certificate Level', 0, 0, '', 0, 0, '2.00077E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:51', NULL),
(547, 1094, 'YGC/2021/0500', '', '2021-08-15', 'Rathnaweera Patabadhige Oyesha ', 'Nethumini ', 'Rathnaweera ', '', NULL, '703708634', 'nimalrathnaweera1976@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Female', '', 'Karadhagama ,  Badalkumbura ', 'Certificate Level', 0, 0, '', 0, 0, '760093157v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:52', NULL),
(548, 1096, 'YGC/2021/0502', '', '2021-08-17', 'Chadren ', '', 'sivdrshini', '', NULL, '766925609', 'saranya200308@gmil.com', NULL, NULL, NULL, '', '', NULL, 'Female', '', 'No 2/33 moragala panwila', 'Certificate Level', 0, 0, '', 0, 0, '2.00169E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:53', NULL),
(549, 1098, 'YGC/2021/0470', '', '2021-08-16', 'U.V.D.Kaumini ', '', 'Vidurangi', '', NULL, '', '', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:54', NULL),
(550, 1100, 'YGC/2021/0503', '', '2021-08-16', 'Oshara ', '', 'Harshana ', '', NULL, '', '', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:54', NULL),
(551, 1102, 'YGC/2021/0505', '', '2021-08-18', 'Chathunika ', '', 'Dewmini', '', NULL, '', '', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:54', NULL),
(552, 1104, 'YGC/2021/0506', '', '2021-08-18', 'Imesha ', '', 'Niwarthana ', '', NULL, '', '', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-29 19:41:54', NULL),
(553, 1106, 'YGC/2021/0207', '', '2021-02-25', 'Chadini ', '', 'kaveesha', '', NULL, '764103443', 'Chadinikaveesha@gmail.com', NULL, NULL, NULL, '', '', '2001-08-09', 'Female', '', '215/Udayamawatha , Heiyanthuduwa', 'Diploma Level', 0, 0, '', 0, 0, '2.00172E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:23', NULL),
(554, 1108, 'YGC/2021/0187', '', '2021-03-24', 'A K D Udeshika ', '', 'Chathurangani', '', NULL, '702340072', 'chathuranganiudeshika@gmail.com', NULL, NULL, NULL, '', '', '1992-07-24', 'Female', '', '107/21/A, Shalawa Road, Mirihana, Nugegoda', 'Diploma Level', 0, 0, '', 0, 0, '927060256v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:25', NULL),
(555, 1110, 'YGC/2021/0246', '', '2021-03-24', 'Nathasha ', '', 'Devindee', '', NULL, '759590507', 'not completed', NULL, NULL, NULL, '', '', '2001-03-04', 'Female', '', '383/1/A, Makola North Makola', 'Diploma Level', 0, 0, '', 0, 0, 'not completed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:26', NULL),
(556, 1112, 'YGC/2021/0299', '', '2021-04-01', 'Vishaka', '', ' subodha', '', NULL, '769683150', 'Vishakasubodha01@gmail.com', NULL, NULL, NULL, '', '', '1995-02-13', 'Female', '', '56 kalahapitiya adiambalama', 'Diploma Level', 0, 0, '', 0, 0, '1.99554E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:26', NULL),
(557, 1114, 'YGC/2021/0109', '', '2021-03-12', 'Galla Wellalage Menuka', '', ' Dakshitha', '', NULL, '713329692', 'menukadakshitha2000@gmail.com', NULL, NULL, NULL, '', '', '2000-06-08', 'Male', '', 'No 88,Parakrama Road,Galudupita,Ragama', 'Diploma Level', 0, 0, '', 0, 0, '2.00016E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:27', NULL),
(558, 1116, 'YGC/2021/0245', '', '2021-03-20', 'Andrusha', '', ' Jesuthasan', '', NULL, '762190713', 'andrushalatha@gmail.com', NULL, NULL, NULL, '', '', '1998-09-26', 'Male', '', '26 1/6 jempatta street, Colombo - 13', 'Diploma Level', 0, 0, '', 0, 0, '987700696V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:28', NULL),
(559, 1118, 'YGC/2021/0016', '', '2020-12-22', 'Mora Mudhalige Buddhi ', 'Anuradha ', 'Balasooriya', '', NULL, '716939906', 'anu93a@gmail.com', NULL, NULL, NULL, '', '', '1993-01-10', 'Female', '', '17/A Sri Sudharmarama Road, Thelangapatha, Wattala.', 'Diploma Level', 0, 0, '', 0, 0, '935101395V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:30', NULL),
(560, 1120, 'YGC/2021/0318', '', '2021-04-04', 'T.P.Upeksha ', '', 'Kithmini ', '', NULL, '770250828', 'Upekshakithmini123@gmail.com', NULL, NULL, NULL, '', '', '2000-09-06', 'Female', '', '193/C ,9 kanuwa , Kandy Rd , Kadawatha ', 'Diploma Level', 0, 0, '', 0, 0, '2.00075E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:31', NULL),
(561, 1122, 'YGC/2021/0335', '', '2021-04-21', 'Jayakumar.', '', ' Feromiya ', '', NULL, '762796404', 'feromiyaj9772@gmail.com', NULL, NULL, NULL, '', '', '1997-08-27', 'Female', '', '414, Dippitigoda road, Dalugama, Kelaniya. ', 'Diploma Level', 0, 0, '', 0, 0, '977401607V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:32', NULL),
(562, 1124, 'YGC/2021/0325', '', '2021-04-11', 'Kurukulasuriya Antoinette ', 'Dilani', ' Fernando', '', NULL, '762330676', 'randili4u@gmail.com', NULL, NULL, NULL, '', '', '1984-11-09', 'Female', '', '103/77 Cinnamon garden Maithree Mw Ekala', 'Diploma Level', 0, 0, '', 0, 0, '848143090v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:33', NULL),
(563, 1126, 'YGC/2021/0206', '', '2021-04-28', 'Maneesha ', 'kaumadee', ' luwishewa ', '', NULL, '710541127', 'Maneesha.2001@icloud.com', NULL, NULL, NULL, '', '', '2001-11-27', 'Female', '', '163/66 bangalawaththa, kirillawala, kadawatha ', 'Diploma Level', 0, 0, '', 0, 0, '2.00183E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:34', NULL),
(564, 1128, 'YGC/2021/0357', '', '2021-04-30', 'Ravindu ', '', 'Madushan ', '', NULL, '756398199', 'djmadushan073@gmail.com', NULL, NULL, NULL, '', '', '1998-08-24', 'Male', '', '15/11 Indurugalla,Wathuragma', 'Diploma Level', 0, 0, '', 0, 0, '982370647V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:35', NULL),
(565, 1130, 'YGC/2021/0359', '', '2021-05-07', 'Balasuriyage sumudu ', 'wasana ', 'perera', '', NULL, '755086386', 'Wasanasumu@gmail.com', NULL, NULL, NULL, '', '', '1992-02-01', 'Female', '', '80/2, A, Pamunuwa ,Maharagama ', 'Diploma Level', 0, 0, '', 0, 0, '925320668v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:36', NULL),
(566, 1132, 'YGC/2021/0363', '', '2021-05-08', 'Dulaksha', ' Kavindya ', 'Rajasekera', '', NULL, '718543416', 'dkrajasekere@gmail.com ', NULL, NULL, NULL, '', '', '2001-10-29', 'Female', '', '478/3 Nungamugoda, Kelaniya', 'Diploma Level', 0, 0, '', 0, 0, '2.0013E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:37', NULL),
(567, 1134, 'YGC/2021/0050', '', '2021-05-11', 'Kavishka ', 'Gayal ', 'Vithana', '', NULL, '717886092', 'gayalKavishka5@gmail.com', NULL, NULL, NULL, '', '', '2001-08-16', 'Male', '', '64,Naiwala,Essalla', 'Diploma Level', 0, 0, '', 0, 0, '2.00123E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:40', NULL),
(568, 1136, 'YGC/2021/0364', '', '2021-05-11', 'G Pasindu ', 'Dilshan', ' Perera', '', NULL, '774075376', 'pd804909@gmail.com', NULL, NULL, NULL, '', '', '2001-08-21', 'Male', '', '92/A Doranagoda Udugampola ', 'Diploma Level', 0, 0, '', 0, 0, '2.00123E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:41', NULL),
(569, 1138, 'YGC/2021/0374', '', '2021-05-14', 'Gardhi Hewa Abepitiyage ', 'Sasika', ' Kumari', '', NULL, '741240616', 'ohashohash6@gmail.com', NULL, NULL, NULL, '', '', '1983-10-21', 'Female', '', '200/34 Aramaya place, Dematagoda,Co.9', 'Diploma Level', 0, 0, '', 0, 0, '837950040V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:42', NULL),
(570, 1140, 'YGC/2021/0373', '', '2021-05-21', 'Muruththutuwe Gamaralalaya ', 'Thushara', ' Priyantha', '', NULL, '715611012', 'mgtpriyantha@gmail.com', NULL, NULL, NULL, '', '', '1972-01-18', 'Male', '', '190/d , Gangaboda, erathna, kuruwitta', 'Diploma Level', 0, 0, '', 0, 0, '720182971v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:44', NULL),
(571, 1142, 'YGC/2021/0375', '', '2021-05-27', 'Malinduwa Liyanage Hashan', ' Chamila ', 'Kumara', '', NULL, '760427796', 'kumarahashanc@gmail.com', NULL, NULL, NULL, '', '', '2000-05-02', 'Male', '', 'M.100 Mahayaya , Ellagewaththa , Kahawaththa', 'Diploma Level', 0, 0, '', 0, 0, '2.00012E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:45', NULL),
(572, 1144, 'YGC/2021/0385A', '', '2021-05-30', 'Saseema', ' Udayangani', ' kulathunga ', '', NULL, '710727240', 'Shasimaudayanganik@gmail.com ', NULL, NULL, NULL, '', '', '1993-05-16', 'Female', '', '380,negambo Rd, wattala', 'Diploma Level', 0, 0, '', 0, 0, '936370314v ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:46', NULL),
(573, 1146, 'YGC/2021/0386A', '', '2021-05-31', 'Upeksha ', '', 'kumanayake', '', NULL, '766481261', 'Kgchandrika1967@gmail.com', NULL, NULL, NULL, '', '', '2001-10-26', 'Female', '', '549/c eldeniya kadawatha', 'Diploma Level', 0, 0, '', 0, 0, '2.0018E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:47', NULL),
(574, 1148, 'YGC/2021/0387', '', '2021-06-11', 'Antony', ' Dhilushan ', 'Fernando ', '', NULL, '766664030', 'Milaangel53@gmail.com', NULL, NULL, NULL, '', '', '2000-02-29', 'Male', '', '331/J /01 , Batagama north, jaela', 'Diploma Level', 0, 0, '', 0, 0, '2.00006E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:48', NULL),
(575, 1150, 'YGC/2021/0437A', '', '2021-06-23', 'Anuththara ', '', 'Muthumali', '', NULL, '763951793', 'anuththaramuthumali00@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Female', '', '249/4 wijayarama road, Bollegala, kelaniya.', 'Diploma Level', 0, 0, '', 0, 0, '2.00064E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:57:49', NULL),
(576, 1152, 'YGC/2021/0464', '', '2021-07-05', 'Malith ', 'Hirantha ', 'Sudusinghe', '', NULL, '769290753', 'malithsudusinghe@gmail.com', NULL, NULL, NULL, '', '', '1991-11-01', 'Male', '', '239/2, Makola road, Kiribathgoda.', 'Diploma Level', 0, 0, '', 0, 0, '910112473 v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:28', NULL),
(577, 1154, 'YGC/2021/0473', '', '2021-07-05', 'Mohamed Anees  ', 'Fathima', 'Amna', '', NULL, '766002724', 'fathima97amna@gmail.com', NULL, NULL, NULL, '', '', '1997-10-16', 'Female', '', 'No.99,Main Road, Opposite to the temple,Old Town Madampe.(Chilaw)', 'Diploma Level', 0, 0, '', 0, 0, '977902401v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:29', NULL),
(578, 1156, 'YGC/2021/0474', '', '2021-07-05', 'Mohamed Anees ', 'Aaysha ', 'Siddeequa', '', NULL, '750353824', 'aaysha12anees@gmail.com', NULL, NULL, NULL, '', '', '2001-12-05', 'Female', '', 'No.99,Main Road, Opposite to the temple,Old Town Madampe.(Chilaw)', 'Diploma Level', 0, 0, '', 0, 0, '2.00184E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:31', NULL),
(579, 1158, 'YGC/2021/0475', '', '2021-07-11', 'Endane Dhammadinna thero ', '', '', '', NULL, '703610089', '', NULL, NULL, NULL, '', '', '2000-02-14', 'Male', '', 'Sirisena darma mandiraya Rawatawatta morathuwa ', 'Diploma Level', 0, 0, '', 0, 0, '2.00005E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:32', NULL),
(580, 1160, 'YGC/2021/0483', '', '2021-07-20', 'Adikari Athukorala Arachchilage Dona Niwarthana ', 'Tharushi ', 'Athukorala ', '', NULL, '781377035', 'tharushiniwarthana.a00@gmail.com', NULL, NULL, NULL, '', '', '2001-11-16', 'Female', '', '51/A/3 eldeniya,kadawatha ', 'Diploma Level', 0, 0, '', 0, 0, '2.00182E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:32', NULL),
(581, 1162, 'YGC/2021/0481', '', '2021-07-19', 'T.M.D Tharuka ', '', 'shashminda ', '', NULL, '713873802', 'Shashminda006@gmail.com', NULL, NULL, NULL, '', '', '2001-02-05', 'Female', '', '11/5 rathwattha mawatha badulla', 'Diploma Level', 0, 0, '', 0, 0, '2.00104E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:33', NULL),
(582, 1164, 'YGC/2021/0482', '', '2021-07-23', 'Maggonage Indu ', 'shanika ', 'jayasinghe ', '', NULL, '760778395', 'indushpradee02@gmail.com', NULL, NULL, NULL, '', '', '1995-09-29', 'Female', '', 'No 624 /A/2 Eriyawatiya kiribathgoda ', 'Diploma Level', 0, 0, '', 0, 0, '957732526v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:34', NULL),
(583, 1166, 'YGC/2021/0486', '', '2021-08-02', 'H.V.Ishara ', '', 'Jeewanthi ', '', NULL, '715331373', 'induwareehuuladduwa@gmail.com', NULL, NULL, NULL, '', '', '1994-12-01', 'Female', '', '566/1 Meegahagodella,Thalduwa,Avissawella ', 'Diploma Level', 0, 0, '', 0, 0, '945120967 v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:35', NULL),
(584, 1168, 'YGC/2021/0487', '', '2021-08-02', 'G.A Chanduka', '', ' kaveen', '', NULL, '702339932', 'Chanduka1234@gmail.com', NULL, NULL, NULL, '', '', '1998-11-03', 'Male', '', '89,Kotiyahena ,Walpita ,Horana', 'Diploma Level', 0, 0, '', 0, 0, '983081215V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:36', NULL),
(585, 1170, 'YGC/2021/0488', '', '2021-08-03', 'Thommage Akila', ' Shamika ', 'fernando', '', NULL, '771755697', 'tasfernando83@gmail.com', NULL, NULL, NULL, '', '', '1983-08-14', 'Male', '', '4/b/14,r n.h.s Raddolugama', 'Diploma Level', 0, 0, '', 0, 0, '832271730v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:37', NULL),
(586, 1172, 'YGC/2021/0495', '', '2021-08-06', 'Panapitiyage Don Nimesha ', '', 'Sewwandi ', '', NULL, '772942557', 'nimesha7sewwandi@gmail.com', NULL, NULL, NULL, '', '', '1992-01-07', 'Female', '', '07,meegahawatha Rd, Telagapatha, wattala ', 'Diploma Level', 0, 0, '', 0, 0, '925071722V ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:38', NULL),
(587, 1174, 'YGC/2021/0499', '', '2021-08-11', 'EDIRISURIYA KATTADIGE DINUSHIKA ', '', 'SEWWANDI', '', NULL, '713172709', 'dinushikasewwandi987@gmail.com', NULL, NULL, NULL, '', '', '1994-08-04', 'Female', '', '36/35,NAWALOKA UDYANAPURA, OLIYAMULLA,WATTALA', 'Diploma Level', 0, 0, '', 0, 0, '947170090V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:40', NULL),
(588, 1176, 'YGC/2021/0494', '', '2021-07-08', 'Hiffol Trummiey ', '', 'Fernandopulle', '', NULL, '', '', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:41', NULL),
(589, 1178, 'YGC/2021/0504', '', '2021-02-18', 'Nethum ', '', 'Sameera', '', NULL, '', '', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:41', NULL),
(590, 1180, 'YGC/2021/0507', '', '2021-08-19', 'Sandinika ', '', 'Dewindi', '', NULL, '', '', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:58:41', NULL),
(591, 1182, 'YGC/2021/0421A', '', '2021-06-12', 'K.B.A.Waruni', ' Gayani', ' Kodhithuwakku', '', NULL, '740251585', 'warunigk@yahoo.com', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:59:21', NULL),
(592, 1184, 'YGC/2021/0420A', '', '2021-06-13', 'Samarathunga Liyana Mohottige Don', 'Kaveen', '  Lakshitha', '', NULL, '713008137', 'kaveenlakshitha60@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:59:22', NULL),
(593, 1186, 'YGC/2021/0425A', '', '2021-06-16', 'D.M Hiran ', 'madusanka ', 'dissanayake', '', NULL, '711846812', 'hiran.madusanka91@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:59:23', NULL),
(594, 1188, 'YGC/2021/0439A', '', '2021-06-20', 'Salinda', ' Nimesh', ' Rupasinghe', '', NULL, '776387451', 'salindanimesh123@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:59:24', NULL),
(595, 1190, 'YGC/2021/0454A', '', '2021-06-23', 'W.M Samudhi ', 'Thilinika ', 'Wijesundara', '', NULL, '719489823', 'samudhithilinika65@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Female', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:59:25', NULL),
(596, 1192, 'YGC/2021/0444', '', '2021-06-28', 'K.A.Chalitha ', '', 'Priyanga ', '', NULL, '716326090', 'chalithariyanga345@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:59:27', NULL),
(597, 1194, 'YGC/2021/0476', '', '2021-07-09', 'K.A Tharani', ' Sasintha', ' Kiriella', '', NULL, '711552132', 'tharanikiriellabm@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:59:28', NULL),
(598, 1196, 'YGC/2021/0485', '', '2021-08-02', 'V P K U K', '', ' Sampath', '', NULL, '717578775', 'udayaksampath@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Male', '', '', 'Certificate Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 06:59:29', NULL),
(599, 1198, 'YGC/2021/0394', '', '2021-05-26', 'Mahesh ', 'Chaminda ', 'Mannapperuma', '', NULL, '7184626', 'maheshtudawe@gmail.com', NULL, NULL, NULL, '', '', '1976-04-10', 'Male', '', '250A, Kumbaloluwa Road, Humbutiyawa, Nittambuwa', 'Diploma Level', 0, 0, '', 0, 0, '761011758V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:35', NULL),
(600, 1200, 'YGC/2021/0393', '', '2021-05-26', 'Thebuwana Acharige Apsara ', 'Madushani ', 'Karunarathna', '', NULL, '0773191517 / 0741634243', 'madushanikarunarathna24@gmail.com', NULL, NULL, NULL, '', '', '2001-11-09', 'Female', '', 'No:114/C, Aluthgama, Bogamuwa, Yakkala', 'Diploma Level', 0, 0, '', 0, 0, '2.00181E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:36', NULL),
(601, 1202, 'YGC/2021/0392', '', '2021-05-27', 'Dissanayake Mudiyanselage Janith ', 'Nirmana ', 'Dissanayake ', '', NULL, '769088973', 'janithnirmana1999@gmail.com', NULL, NULL, NULL, '', '', '1999-10-08', 'Male', '', 'No.199/2/1, Mudungoda ,Gampaha ', 'Diploma Level', 0, 0, '', 0, 0, '992826126V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:38', NULL),
(602, 1204, 'YGC/2021/0382', '', '2021-05-29', 'Samarakoon Mudiyanselage Nalin ', '', 'Kavinda', '', NULL, '767434708', 'Nalinkavinda588@gmail.com', NULL, NULL, NULL, '', '', '2000-12-26', 'Male', '', 'Kiwlalahena,Yahamulla,Wilpita,Akurassa', 'Diploma Level', 0, 0, '', 0, 0, '2.00036E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:39', NULL),
(603, 1206, 'YGC/2021/0391', '', '2021-05-27', 'Benthotage Dhananjaya Tharinda', ' Kumara ', 'Karunarathna', '', NULL, '773590592', 'dinassck@gmail.com', NULL, NULL, NULL, '', '', '1986-04-24', 'Male', '', 'No 58, Sama Uyana,New Town, Kundasale.', 'Diploma Level', 0, 0, '', 0, 0, '861152090V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:40', NULL),
(604, 1208, 'YGC/2021/0387A', '', '2021-05-29', 'SETHUNGA MUDALIGE DONA VISHNIKA', ' DULANJI ', 'NAVODYA', '', NULL, '777486297', 'vishnika0823@gmail.com', NULL, NULL, NULL, '', '', NULL, 'Female', '', 'NO : 269 , BATAGAMA NORTH , JA-ELA', 'Diploma Level', 0, 0, '', 0, 0, '2.00074E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:42', NULL),
(605, 1210, 'YGC/2021/0385', '', '2021-05-30', 'Kumara Hewage Ishari', '', ' Kaushala ', '', NULL, '766106655', 'Isharikaushala181@gmail.com', NULL, NULL, NULL, '', '', '1998-11-18', 'Female', '', '765/32,Bodiraja mawatha,Maligawatta,Colombo 10', 'Diploma Level', 0, 0, '', 0, 0, '1.99882E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:43', NULL),
(606, 1212, 'YGC/2021/0395A', '', '2021-06-02', 'A.M.Chandika', '', ' Sandun', '', NULL, '719063281', 'chandikasandun123@gmail.com', NULL, NULL, NULL, '', '', '2001-04-23', 'Male', '', '562/D6,Jayanthi Mawatha,Anuradhapura ', 'Diploma Level', 0, 0, '', 0, 0, '2.00111E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:45', NULL),
(607, 1214, 'YGC/2021/0396A', '', '2021-06-11', 'Madasamy ', 'Joy ', 'Anesta', '', NULL, '768982294', 'annwarsha@gmail.com', NULL, NULL, NULL, '', '', '1995-10-08', 'Female', '', 'No11, Shanthi road hendala wattala', 'Diploma Level', 0, 0, '', 0, 0, '957822053V ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:46', NULL),
(608, 1216, 'YGC/2021/0397A', '', '2021-05-28', 'Kalyanarathnam', '', ' Prasanna', '', NULL, '767332271', 'kalyanarathnamprasanna@gmail.com', NULL, NULL, NULL, '', '', '1989-03-03', 'Male', '', 'NO 17, Shakthipuram, Kotagala', 'Diploma Level', 0, 0, '', 0, 0, '890631860V', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:47', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES
(609, 1218, 'YGC/2021/0398A', '', '2021-05-27', 'Ruwindu', ' Nisal ', 'Wijesena', '', NULL, '717386430', 'ruwindu15487@gmail.com', NULL, NULL, NULL, '', '', '2000-12-22', 'Male', '', '319/s ,Malasinghagoda road, hokandara east,hokandara', 'Diploma Level', 0, 0, '', 0, 0, '2.00036E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:49', NULL),
(610, 1220, 'YGC/2021/0400A', '', '2021-05-28', 'Muruththutuwe Gamaralalaya Thushara ', '', 'Priyantha ', '', NULL, '715611012', 'mgtpriyantha@gmail.com', NULL, NULL, NULL, '', '', '1972-01-18', 'Male', '', '190/d, Gangaboda, erathna , kuruwitta ', 'Diploma Level', 0, 0, '', 0, 0, '720182971v', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:50', NULL),
(611, 1222, 'YGC/2021/0401A', '', '2021-06-26', 'Tashini ', 'Thisalka ', 'Muthukumarana', '', NULL, '705954205', 'thisalkamuthu2000@gmail.com', NULL, NULL, NULL, '', '', '2000-08-02', 'Female', '', '478/5 ,Praja Mawatha, Arangala, Hokandara North.', 'Diploma Level', 0, 0, '', 0, 0, '2.00072E+11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:51', NULL),
(612, 1224, 'YGC/2021/0402A', '', '2021-06-26', 'H.V.Ishara ', 'Jeewanthi ', 'Huladduwa', '', NULL, '715331373', 'induwareehuuladduwa@gmail.com', NULL, NULL, NULL, '', '', '1994-01-12', 'Female', '', '566/1,Meegahagodella,Thalduwa,Avissawella ', 'Diploma Level', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:53', NULL),
(613, 1226, '', '', NULL, '', '', '', '', NULL, '', '', NULL, NULL, NULL, '', '', NULL, '', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-08-30 07:10:54', NULL),
(617, 1234, 'YGC/2020/0001', NULL, '2020-03-11', 'WITHANAGE', 'PASINDU', 'LAKSARA', NULL, 'uploads/student_images/default_male.jpg', '0772889866', 'hasitha.erandi@yahoo.com', NULL, NULL, NULL, '', NULL, '2020-05-31', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '200115202454', NULL, NULL, NULL, NULL, 'father', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-11-27 06:48:54', NULL),
(618, 1236, 'YGC/2020/002', NULL, '2020-07-11', 'DISSANAYAKA MUDIYANSELAGA', 'SAMANTHIKA', 'DISSANAYAKE', NULL, 'uploads/student_images/default_female.jpg', '0761912675', 'Wgwg198416@gmail.com', NULL, NULL, NULL, '', NULL, '1984-04-16', 'Female', 'samanthika book shop, Kanthalesamanthika book shop, Kanthale', NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, 'other', '', '', NULL, NULL, NULL, NULL, 'W G Sampath', 'husband', '0761912675', '', '', '', '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-13 06:43:35', NULL),
(619, 1238, 'YGC/2021/0112', NULL, '2021-01-29', 'NILANGA SANJEEWA', 'KUMARA ', 'JAYARATHNE', NULL, 'uploads/student_images/default_male.jpg', '772069448', 'nilangarj@gmail.com', NULL, NULL, NULL, '', NULL, '1979-11-07', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-13 07:23:39', NULL),
(620, 1240, 'YGC/2020/0004', NULL, '2020-09-20', 'Halwatta Weerasinghe Arachchige Suhan Chandira Gunathilake', ' Suhan Chandira', 'Gunathilake', NULL, 'uploads/student_images/default_male.jpg', '0764 39 49 20', 'shantha@ssfab.lk', NULL, NULL, NULL, 'Buddhism', NULL, '2002-01-17', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '199983310982', NULL, NULL, NULL, NULL, '', 'H.W.A.S. Gunathilake', '0765 422 233', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 05:02:29', NULL),
(621, 1242, 'YGC/2020/0005', NULL, '2020-10-11', 'Anita', ' Stefni ', 'Jesudasan', NULL, 'uploads/student_images/default_female.jpg', '0757901415', 'Jesudasanstefni@gmail.com', NULL, NULL, NULL, '', NULL, '1996-10-25', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '199679900302', NULL, NULL, NULL, NULL, '', 'Mr jesudasan (Dad)', '0752903060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 05:31:17', NULL),
(622, 1244, 'YGC/2020/0006', NULL, '2020-11-12', 'Rathnasekara Kuruppu Arachchige', ' Dinesh', ' Padmal', NULL, 'uploads/student_images/default_male.jpg', '718019153', 'rkadineshpadmal@gmail.com', NULL, NULL, NULL, '', NULL, '1982-02-06', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '820370244V', NULL, NULL, NULL, NULL, '', 'T.K.Mangalika', '112849103', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 05:35:51', NULL),
(623, 1246, 'YGC/2020/0007', NULL, '2020-11-12', 'Chethya', ' Asini ', ' Ranasingha', NULL, 'uploads/student_images/default_female.jpg', '777667918', 'chethya333@gmail.com', NULL, NULL, NULL, '', NULL, '2001-03-11', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '200180803332', NULL, NULL, NULL, NULL, '', 'Damayanthi Kasthurimudali', '777667918', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 05:38:59', NULL),
(624, 1248, 'YGC/2020/0008', NULL, '2020-11-12', 'U L  Kumara', 'Priyantha', '', NULL, 'uploads/student_images/default_male.jpg', '714102087', 'ulpkumara@gmail.com', NULL, NULL, NULL, '', NULL, '2020-03-17', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'R L Uyanahewa', '0710358140', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 05:41:47', NULL),
(625, 1250, 'YGC/2020/0009', NULL, '2020-11-13', 'H.Anusha', 'Nishanthi', '', NULL, 'uploads/student_images/default_female.jpg', '770541685', 'amandakankanamge94@gmail.com', NULL, NULL, NULL, '', NULL, '1970-12-12', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Shantha De Silva', '712233888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 05:44:28', NULL),
(626, 1252, 'YGC/2020/0010', NULL, '2020-11-13', 'Dammalage', ' Kalindu', ' Indupura', NULL, 'uploads/student_images/default_male.jpg', '704367808', 'kalinduindupura@gmail.com', NULL, NULL, NULL, '', NULL, '2020-06-30', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Yamuna Nandika', '719999087', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 05:47:17', NULL),
(627, 1254, 'YGC/2020/0011', NULL, '2020-11-14', 'Esandi', 'Onara', '', NULL, 'uploads/student_images/default_female.jpg', '773475516', 'harshani.Samaradiwakara@dfccbank.com', NULL, NULL, NULL, '', NULL, '2008-09-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Harshani Samaradiwakara', '773475516', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 05:53:11', NULL),
(628, 1256, 'YGC/2020/0012', NULL, '2020-11-16', 'Kahandawaarachchige', 'Gayan Danushka ', 'Kahandawaarachchi', NULL, 'uploads/student_images/default_male.jpg', '712466257', 'Kadgddanushka@gmail.com', NULL, NULL, NULL, '', NULL, '1989-12-26', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '893610839v', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 05:56:28', NULL),
(629, 1258, 'YGC/2020/0014', NULL, '2020-11-17', 'Janul', 'Sellahewa', '', NULL, 'uploads/student_images/default_male.jpg', '769088973', 'janulran1@gmail.com', NULL, NULL, NULL, '', NULL, '2005-10-20', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '992826126V', NULL, NULL, NULL, NULL, '', 'Sriyani', '717020485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:02:24', NULL),
(630, 1260, 'YGC/2020/0015', NULL, '2020-11-18', 'E.M.C.L.EKANAYAKE', '', 'EKANAYAKE', NULL, 'uploads/student_images/default_male.jpg', '767327542', '0512chathuralakshitha@gmail.com', NULL, NULL, NULL, '', NULL, '2020-12-05', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '200013301588', NULL, NULL, NULL, NULL, '', 'E.M.Piyarathna', '767327541', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:05:15', NULL),
(631, 1262, 'YGC/2020/0016', NULL, '2020-11-18', 'GALLA WELLALAGE', 'MENUKA', 'DAKSHITHA', NULL, 'uploads/student_images/default_male.jpg', '713329692', 'menukadakshitha@gmail.com', NULL, NULL, NULL, '', NULL, '2020-06-08', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '200016002174', NULL, NULL, NULL, NULL, '', 'G.W. Vajira priyantha', '714273250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:08:21', NULL),
(632, 1264, 'YGC/2020/0017', NULL, '2020-11-18', 'Kankani Arachchi Kankanamalage', ' Omesha Dilshani ', 'Jayawardana', NULL, 'uploads/student_images/default_female.jpg', '0763751178', 'Omeshadilshani99@gmail.com', NULL, NULL, NULL, '', NULL, '1996-05-15', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '932340658V', NULL, NULL, NULL, NULL, '', 'P.wanniarachchi ', '0758565475', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:23:13', NULL),
(633, 1266, 'YGC/2020/0018', NULL, '2020-11-18', 'W.A.Lasindu', 'punsara ', '', NULL, 'uploads/student_images/default_male.jpg', '0758565475', 'Lasindu.wanniarachchi@gmail.com', NULL, NULL, NULL, '', NULL, '1993-08-21', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '932340658V', NULL, NULL, NULL, NULL, '', 'P.wanniarachchi ', '0758565475', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:28:10', NULL),
(634, 1268, 'YGC/2020/0019', NULL, '2020-11-18', 'Agampodi', 'Osadi Kusalya ', 'De Zoysa', NULL, 'uploads/student_images/default_female.jpg', '0714334297', 'okdezoysa@gmail.com', NULL, NULL, NULL, '', NULL, '2020-03-14', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '200057402787', NULL, NULL, NULL, NULL, '', 'K P A S Vajira', '0714334297', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:30:51', NULL),
(635, 1270, 'YGC/2020/0020', NULL, '2020-11-18', 'Agampodi', ' Kumuthu Novinya', 'De Zoysa', NULL, 'uploads/student_images/default_female.jpg', '0714334297', 'knovinya@gmail.com', NULL, NULL, NULL, '', NULL, '2020-03-14', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '200057401497', NULL, NULL, NULL, NULL, '', 'K P A S Vajira', '0714334297', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:33:36', NULL),
(636, 1272, 'YGC/2020/0021', NULL, '2020-11-19', 'Kaduarachchige', 'pavani shanika', '', NULL, 'uploads/student_images/default_female.jpg', '777622926', '', NULL, NULL, NULL, '', NULL, '2001-11-12', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '200184604352', NULL, NULL, NULL, NULL, '', 'W.K.D.M Pearly', '715793135', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:37:18', NULL),
(637, 1274, 'YGC/2020/0022', NULL, '2020-11-19', 'Vidana Ralalage', 'Dhanushka Nuwan', 'Bandara', NULL, 'uploads/student_images/default_male.jpg', '711521350', 'Bandaranuwan224@yahoo.com', NULL, NULL, NULL, '', NULL, '1990-05-10', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, 'N 3609692', NULL, NULL, NULL, NULL, '', 'Vidana Ralalage podiralahami', '355780928', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:40:36', NULL),
(638, 1276, 'YGC/2020/0023', NULL, '2021-09-22', 'MUHANDIRAMGE', ' NILAKSHI LAKSHIKA ', 'RODRIGO', NULL, 'uploads/student_images/default_female.jpg', '766347717', 'nilakshilakshika92@gmail.com', NULL, NULL, NULL, '', NULL, '1992-03-06', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '926552430v', NULL, NULL, NULL, NULL, '', 'MAHINDA JAYANTHA KUMARA RODRIGO', '771443756', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:42:58', NULL),
(639, 1278, 'YGC/2020/0024', NULL, '2021-09-22', 'Anupa Pabasara', '', 'Rathnayake', NULL, 'uploads/student_images/default_female.jpg', '701816446', 'anuparathnayake513@gmail.com', NULL, NULL, NULL, '', NULL, '2000-05-13', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '200013000000', NULL, NULL, NULL, NULL, '', 'Sarath Rathnayake', '716893011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:44:57', NULL),
(640, 1280, 'YGC/2020/0025', NULL, '2021-09-22', 'REKHA', 'LAKSHANTHI', ' KOLAMBAGE', NULL, 'uploads/student_images/default_female.jpg', '076 0498495', 'sensory119@gmail.com', NULL, NULL, NULL, '', NULL, '2020-09-08', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '757523515 V', NULL, NULL, NULL, NULL, '', 'D.KOLAMBAGE', '071 5961207', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '\r\n', '', NULL, NULL, '0000-00-00', '2021-09-22 06:48:31', NULL),
(641, 1282, 'YGC/2020/0026', NULL, '2021-09-22', 'Weerasekara Mudiyanselage', 'Minsara Devin Deenath', 'Thilakarathne', NULL, 'uploads/student_images/default_male.jpg', '0702222996', 'minsaradevin@gmail.com', NULL, NULL, NULL, '', NULL, '2001-01-30', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '200103004089', NULL, NULL, NULL, NULL, '', 'Dilani Wijesundara', '0714537082', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:50:43', NULL),
(642, 1284, 'YGC/2020/0027', NULL, '2020-11-25', 'Nissanka Arachchige', 'Lasitha Suranjan', ' Nissanka', NULL, 'uploads/student_images/default_male.jpg', '777245020', 'lasithas@unionb.com', NULL, NULL, NULL, '', NULL, '1988-04-06', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '880970097V', NULL, NULL, NULL, NULL, '', 'Somarathne Nissanka', '112678871', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 06:53:19', NULL),
(643, 1286, 'YGC/2020/0028', NULL, '2020-11-27', 'Walpola Vithanage', 'Isuri Prabodini', '', NULL, 'uploads/student_images/default_female.jpg', '771431911', 'isuriprabodini1999@gmail.com', NULL, NULL, NULL, '', NULL, '1999-04-11', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '996020487v', NULL, NULL, NULL, NULL, '', 'Chandrasena Vithanage', '773211282', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 09:24:12', NULL),
(644, 1288, 'YGC/2020/0029', NULL, '2020-12-07', 'GANI ACHCHIGE', 'NAVODA YESHKA', ' PERERA', NULL, 'uploads/student_images/default_female.jpg', '712264384', 'navodayeshka@gmail.com', NULL, NULL, NULL, '', NULL, '1999-03-05', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '199907000000', NULL, NULL, NULL, NULL, '', 'G. A. SAMAN PRIYA PERERA', '716252828', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 09:27:48', NULL),
(645, 1290, 'YGC/2020/0030', NULL, '2020-12-07', 'Rashmina', 'Nurasha', ' Cooray', NULL, 'uploads/student_images/default_female.jpg', '769392893', 'rashminan01@gmail.com', NULL, NULL, NULL, '', NULL, '1999-04-27', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '991180680V', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-22 09:30:33', NULL),
(646, 1292, 'YGC/2021/0115', NULL, '2021-01-27', 'Sandeep', 'Christoper', 'de fonseka', NULL, 'uploads/student_images/default_male.jpg', '775493843', 'Sandeepfonseka19@gmail.com', NULL, NULL, NULL, '', NULL, '2001-06-19', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:24:05', NULL),
(647, 1294, 'YGC/2021/0125', NULL, '2021-02-01', 'Danushka', 'Samin', 'Rajapaksha', NULL, 'uploads/student_images/default_male.jpg', '770759775', 'danushkasaminraj@gmail.com', NULL, NULL, NULL, '', NULL, '2020-07-06', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:26:16', NULL),
(648, 1296, 'YGC/2021/0127', NULL, '2021-02-03', 'SIYAMBALAGAHA GEDARA', 'RUWAN INDIKE ', 'SOMARATHNA', NULL, 'uploads/student_images/default_male.jpg', '761484897', '', NULL, NULL, NULL, '', NULL, '1986-09-25', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:28:29', NULL),
(649, 1298, 'YGC/2021/0129', NULL, '2021-02-04', 'R M G', 'Dinesh', 'Aththanayake', NULL, 'uploads/student_images/default_male.jpg', '719991818', 'dineshaththanayaka@gmail.com', NULL, NULL, NULL, '', NULL, '1990-10-27', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:39:19', NULL),
(650, 1300, 'YGC/2021/0130', NULL, '2021-02-04', 'Kalupahana Manthrige', 'Nethmini Sathsarani', 'Dharmasena', NULL, 'uploads/student_images/default_female.jpg', '769432216', 'Wk1747505@gmail.com', NULL, NULL, NULL, '', NULL, '2002-10-28', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:41:12', NULL),
(651, 1302, 'YGC/2021/0131', NULL, '2021-02-05', 'J.A', 'Tharushi ', 'janani', NULL, 'uploads/student_images/default_female.jpg', '765437134', '', NULL, NULL, NULL, '', NULL, '1994-10-07', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:43:11', NULL),
(652, 1304, 'YGC/2021/0132', NULL, '2021-02-06', 'Uggalla Arachchige', 'Thaveesha Nethuli', 'Gunawardena', NULL, 'uploads/student_images/default_female.jpg', '776130205', 'nadeeshap20@gmail.com', NULL, NULL, NULL, '', NULL, '2003-10-17', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:44:46', NULL),
(653, 1306, 'YGC/2021/0133', NULL, '2021-02-06', 'H. W.', 'N.', 'Asha', NULL, 'uploads/student_images/default_female.jpg', '0703692040/0770400605', 'nimmislx@gmail.com', NULL, NULL, NULL, '', NULL, '1975-03-17', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:46:16', NULL),
(654, 1308, 'YGC/2021/0135', NULL, '2021-02-07', 'Wilwala Arachchige', 'Chamila Gayathr', 'Wilwalaarachchi', NULL, 'uploads/student_images/default_female.jpg', '714159570', 'gayathriwilwalaarachchi@gmail.com', NULL, NULL, NULL, '', NULL, '1975-03-03', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:47:50', NULL),
(655, 1310, 'YGC/2021/0138', NULL, '2021-02-07', 'Kavishka', '', 'Ashan', NULL, 'uploads/student_images/default_male.jpg', '769223093', 'Kavishkaashan2020@gmail.com', NULL, NULL, NULL, '', NULL, '2002-12-17', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:49:08', NULL),
(656, 1312, 'YGC/2021/0141', NULL, '2021-02-07', 'Thilaka Arachchige', 'Dinithi', 'Madhurangi', NULL, 'uploads/student_images/default_female.jpg', '717994439', 'dinitmadhu@gmail.com', NULL, NULL, NULL, '', NULL, '1994-05-31', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:56:24', NULL),
(657, 1314, 'YGC/2021/0142', NULL, '2021-02-07', 'M', 'Sandamini', 'Abeywickrama', NULL, 'uploads/student_images/default_female.jpg', '717727009', '', NULL, NULL, NULL, '', NULL, '1997-05-27', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:57:54', NULL),
(658, 1316, 'YGC/2021/0143', NULL, '2021-02-07', 'S.A', 'C', 'Kawshalya', NULL, 'uploads/student_images/default_female.jpg', '771918040', 'Cristinakawshalya@gmail.com', NULL, NULL, NULL, '', NULL, '1998-01-20', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 06:59:17', NULL),
(659, 1318, 'YGC/2021/0144', NULL, '2021-02-07', 'D.M.S.', 'S.R.', 'Dimbulgahamada', NULL, 'uploads/student_images/default_female.jpg', '704563232', 'sahansithmini@gmail.com', NULL, NULL, NULL, '', NULL, '1997-10-23', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:00:44', NULL),
(660, 1320, 'YGC/2021/0145', NULL, '2021-02-08', 'Janith', '', 'mahesh', NULL, 'uploads/student_images/default_male.jpg', '768683227', 'Maheshjanith6@gmail.com', NULL, NULL, NULL, '', NULL, '2001-09-14', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:02:35', NULL),
(661, 1322, 'YGC/2021/0146', NULL, '2021-02-08', 'Lahiru', '', 'Lorensuhewa', NULL, 'uploads/student_images/default_male.jpg', '702043418', 'lorensuhewalahiru@gmail.com', NULL, NULL, NULL, '', NULL, '1982-11-08', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:03:56', NULL),
(662, 1324, 'YGC/2021/0148', NULL, '2021-02-08', 'Himbutuwe', 'dhammasiddhi', 'thero', NULL, 'uploads/student_images/default_male.jpg', '783936882', 'dhammasiddhi2@gmail.com', NULL, NULL, NULL, '', NULL, '2001-06-01', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:05:12', NULL),
(663, 1326, 'YGC/2021/0149', NULL, '2021-02-08', 'DISANAYAKE MUDIYANSELAGE', 'YASHODHA KALPANI', 'DISANAYAKE', NULL, 'uploads/student_images/default_female.jpg', '701552868', 'Yashodadisanayake@gmail.com', NULL, NULL, NULL, '', NULL, '2000-11-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:06:27', NULL),
(664, 1328, 'YGC/2021/0150', NULL, '2021-02-08', 'Rev. Mahagama', 'Deepananda', 'Thero', NULL, 'uploads/student_images/default_male.jpg', '701555537', 'Mahagamadipananda@gmail.com', NULL, NULL, NULL, '', NULL, '2001-05-27', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:07:51', NULL),
(665, 1330, 'YGC/2021/0151', NULL, '2021-02-08', 'Dona Dayani', 'heshala ', 'Manamperi', NULL, 'uploads/student_images/default_female.jpg', '715560218', 'mheshala@gmail.com', NULL, NULL, NULL, '', NULL, '1984-12-12', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:22:02', NULL),
(666, 1332, 'YGC/2021/0152', NULL, '2021-02-08', 'Markerwitage Sewmini', 'Sandeepa Tharushi', 'Perera', NULL, 'uploads/student_images/default_female.jpg', '754986939', 'sewminiperera3@gmail.com', NULL, NULL, NULL, '', NULL, '2001-10-07', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:23:22', NULL),
(667, 1334, 'YGC/2021/0153', NULL, '2021-02-08', 'Markerwitage', 'Pashima Lakmali', 'Perera', NULL, 'uploads/student_images/default_female.jpg', '760670454', 'Inokapiyadarshaniperera1981@gmail.com', NULL, NULL, NULL, '', NULL, '2001-02-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:24:35', NULL),
(668, 1336, 'YGC/2021/0154', NULL, '2021-02-09', 'Ashan', 'isuranga ', 'millewa', NULL, 'uploads/student_images/default_male.jpg', '785650351', 'ashanmillewa@gmail.com', NULL, NULL, NULL, '', NULL, '2000-03-11', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:25:43', NULL),
(669, 1338, 'YGC/2021/0155', NULL, '2021-02-10', 'Ranasinghe Arachchige', 'Sharen Christeen', 'Perera', NULL, 'uploads/student_images/default_female.jpg', '740530176', 'Sharenperera17@gmail.com', NULL, NULL, NULL, '', NULL, '1998-07-17', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:27:07', NULL),
(670, 1340, 'YGC/2021/0157', NULL, '2021-02-10', 'M.T', 'P.', 'Nimanthaka', NULL, 'uploads/student_images/default_male.jpg', '714999822', 'pasindunimanthaka98@gmail.com', NULL, NULL, NULL, '', NULL, '1998-07-11', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:28:25', NULL),
(671, 1342, 'YGC/2021/0158', NULL, '2021-02-11', 'JEGANATHAN', '', 'KALAIVINOTHAN', NULL, 'uploads/student_images/default_male.jpg', '770183638', 'Vinothan2586@gmai.com', NULL, NULL, NULL, '', NULL, '1986-05-02', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:29:46', NULL),
(672, 1344, 'YGC/2021/0159', NULL, '2021-02-11', 'Mahamarakkalage', 'Januda Pasandul ', 'Perera', NULL, 'uploads/student_images/default_male.jpg', '766698753', 'janudaperera22@gmail.com', NULL, NULL, NULL, '', NULL, '2000-08-22', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:31:01', NULL),
(673, 1346, 'YGC/2021/0162', NULL, '2021-02-13', 'M.D', 'Dakshika', 'fernando', NULL, 'uploads/student_images/default_female.jpg', '778692022', 'dammalidhakshik@gmail.com', NULL, NULL, NULL, '', NULL, '1999-01-08', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:32:18', NULL),
(674, 1348, 'YGC/2021/0164', NULL, '2021-02-13', 'Akila', 'milinda ', 'demotte', NULL, 'uploads/student_images/default_male.jpg', '767825509', 'A.m.demotte@gmail.com', NULL, NULL, NULL, '', NULL, '2000-04-09', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:39:42', NULL),
(675, 1350, 'YGC/2021/0169', NULL, '2021-02-14', 'Samarasinghe Hewage', 'Hashini Sachintha', 'Samarasinghe', NULL, 'uploads/student_images/default_female.jpg', '773387278', 'hashinisamarasinghe31@gmail.com', NULL, NULL, NULL, '', NULL, '2000-10-31', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:41:09', NULL),
(676, 1352, 'YGC/2021/0170', NULL, '2021-02-14', 'Kumara Hewage', 'Ishari Kaushala', 'Kumari', NULL, 'uploads/student_images/default_female.jpg', '725904200', 'Kaushalaishari@gmail.com', NULL, NULL, NULL, '', NULL, '1998-11-18', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-23 07:42:42', NULL),
(677, 1354, 'YGC/2020/0032', NULL, '2020-12-09', 'Amarathunga arachchige deshal perera', 'deshal', 'perera', NULL, 'uploads/student_images/default_male.jpg', '774539775', 'Vimukthiperera96@gmail.com', NULL, NULL, NULL, '', NULL, '2001-12-10', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '200135000000', NULL, NULL, NULL, NULL, '', 'Jude perera', '772962729', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-24 07:51:14', NULL),
(678, 1356, 'YGC/2020/0033', NULL, '2020-12-11', 'T.Thiyangi', 'Nipunika Thiloshini ', 'Jayalath', NULL, 'uploads/student_images/default_female.jpg', '776080987', 'thiloshinijfernando@gmail.com', NULL, NULL, NULL, '', NULL, '2000-05-06', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '200062701800', NULL, NULL, NULL, NULL, '', 'Jayalath', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-24 07:54:50', NULL),
(679, 1358, 'YGC/2020/0034', NULL, NULL, 'Muthupana gedara chamod dulanjana', 'chamod', 'dulanjana', NULL, 'uploads/student_images/default_male.jpg', '701555115', 'Chamoddulanjana2001@gmail.com', NULL, NULL, NULL, '', NULL, '2001-11-29', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '200133402380', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-24 07:58:18', NULL),
(680, 1360, 'YGC/2021/0139', NULL, '2021-02-07', 'Kasun', '', 'Rukshan', NULL, 'uploads/student_images/default_male.jpg', '785986432', 'khmkasunrukshan@gmail.com', NULL, NULL, NULL, '', NULL, '1998-12-09', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-24 10:32:31', NULL),
(681, 1362, 'YGC/2021/0179', NULL, '2021-02-24', 'Chamil', 'rangana', 'ramanayaka', NULL, 'uploads/student_images/default_male.jpg', '712944120', 'Ramanayakanew@gmail.com', NULL, NULL, NULL, '', NULL, '1987-04-27', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-24 10:34:10', NULL),
(682, 1364, 'YGC/2021/0181', NULL, '2021-02-25', 'Selaka', 'Maduranga', 'Bandara', NULL, 'uploads/student_images/default_male.jpg', '771004689', 'selakamaduranaga1999@gmail.com', NULL, NULL, NULL, '', NULL, '1999-02-17', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-24 10:35:44', NULL),
(683, 1366, 'YGC/2021/0182', NULL, '2021-02-25', 'Paththiniya Hewa', 'Nadeesha Rohini', 'Udayangani', NULL, 'uploads/student_images/default_female.jpg', '769837990', 'nadeeshaudayangani190@gmail.com', NULL, NULL, NULL, '', NULL, '1998-08-02', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-24 10:37:18', NULL),
(684, 1368, 'YGC/2021/0184', NULL, '2021-02-25', 'A.A.D', 'Thuvindu Bimsara', 'Madanayake', NULL, 'uploads/student_images/default_male.jpg', '710712816', 'thuvindu12345@gmail.com', NULL, NULL, NULL, '', NULL, '2001-04-10', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-24 10:38:51', NULL),
(685, 1370, 'YGC/2021/0185', NULL, '2021-02-26', 'Marasinghege', 'Ireshan', 'Kalhari', NULL, 'uploads/student_images/default_female.jpg', '9726602140', 'ireshankalhari132@gmail.com', NULL, NULL, NULL, '', NULL, '1990-07-31', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-24 10:40:22', NULL),
(686, 1372, 'YGC/2021/0189', NULL, '2021-02-28', 'Wannakuwaththa Mitiwaduge', 'Susith Supulsara', 'Fernando', NULL, 'uploads/student_images/default_male.jpg', '756220629', 'Susithsupulsarafernando24@gmail.com', NULL, NULL, NULL, '', NULL, '1997-03-24', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-24 10:41:41', NULL),
(687, 1374, 'YGC/2021/0192', NULL, '2021-05-03', 'Kaveeshwara', '', 'Gayanath', NULL, 'uploads/student_images/default_male.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 07:42:18', NULL),
(688, 1376, 'YGC/2021/0193', NULL, '2021-08-03', 'Akila', '', 'Peiris', NULL, 'uploads/student_images/default_male.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 07:43:17', NULL),
(689, 1378, 'YGC/2021/0196', NULL, '2021-09-03', 'Tharindu', '', 'Srimal', NULL, 'uploads/student_images/default_male.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 07:44:06', NULL),
(690, 1380, 'YGC/2021/0201', NULL, '2021-03-13', 'Nadeeka', '', 'Jayasundara', NULL, 'uploads/student_images/default_male.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 07:45:15', NULL),
(691, 1382, 'YGC/2021/0209', NULL, '2021-03-15', 'Nadee', '', ' Biyangika', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 07:46:09', NULL),
(692, 1384, 'YGC/2021/0308', NULL, '2021-04-07', 'Seekkuge', 'Nethmi', 'Poornika', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:05:46', NULL),
(693, 1386, 'YGC/2021/0310', NULL, '2021-04-08', 'Withanage', 'sanduni sewwandi', 'sasikala', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:06:39', NULL),
(694, 1388, 'GC/2021/0319', NULL, '2021-04-16', 'UDUWARAGE', 'MADUKA PIUMI', 'PERERA', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:07:43', NULL),
(695, 1390, 'YGC/2021/0320', NULL, '2021-04-17', 'Hewayalage', 'Shashini Imesha', ' Jayasinghe', NULL, 'uploads/student_images/default_female.jpg', '773902408', 'shashinihsij@gmail.com', NULL, NULL, NULL, '', NULL, '1993-10-05', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:09:01', NULL),
(696, 1392, 'YGC/2021/0321', NULL, '2021-04-21', 'Sebastian', 'Julin Ganthy', 'Croos', NULL, 'uploads/student_images/default_female.jpg', '771394566', 'julinganthy@gmail.com', NULL, NULL, NULL, '', NULL, '1974-08-12', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:10:31', NULL),
(697, 1394, 'YGC/2021/0323', NULL, '2021-04-22', 'P.D', 'Oshadhi Hasini', 'Jayathilake', NULL, 'uploads/student_images/default_female.jpg', '94775221304', 'oshadhijayathilakepd@gmail.com', NULL, NULL, NULL, '', NULL, '1998-04-20', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:12:33', NULL),
(698, 1396, 'YGC/2021/0324', NULL, '2021-04-22', 'kalimuththu', '', 'pradeeban', NULL, 'uploads/student_images/default_male.jpg', '766046301', 'pradeebanvrc@gmail.com', NULL, NULL, NULL, '', NULL, '1993-02-26', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:14:22', NULL),
(699, 1398, 'YGC/2021/0326', NULL, '2021-04-23', 'Madduma Patabendige', 'Kingsly Harshana', 'Hemachandra', NULL, 'uploads/student_images/default_male.jpg', '94777245726', 'mpkharshana@gmail.com', NULL, NULL, NULL, '', NULL, '1989-11-22', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:16:28', NULL),
(700, 1400, 'YGC/2021/0327', NULL, '2021-09-27', 'Malsha', 'Sanduni', 'Kularathne', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:17:53', NULL),
(701, 1402, 'YGC/2021/0329', NULL, '2021-04-26', 'WADUGE', 'WASANTHA', 'KUMARA', NULL, 'uploads/student_images/default_male.jpg', '718024888', 'wwkumara1976@gmail.com', NULL, NULL, NULL, '', NULL, '1976-09-23', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:19:13', NULL),
(702, 1404, 'YGC/2021/0330', NULL, '2021-04-27', 'Chethana', '', 'upkshika', NULL, 'uploads/student_images/default_female.jpg', '760485943', 'chethanahewage2001@gmail.com', NULL, NULL, NULL, '', NULL, '2001-04-05', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:21:37', NULL),
(703, 1406, 'YGC/2021/0331', NULL, '2021-04-27', 'Vindhya', '', 'Navodini', NULL, 'uploads/student_images/default_female.jpg', '702597666', 'navodhyavin@gmail.comp', NULL, NULL, NULL, '', NULL, '1991-04-01', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:22:57', NULL),
(704, 1408, 'YGC/2021/0332', NULL, '2021-04-28', 'K.A.', 'Geenadi Nethmini', 'Perera', NULL, 'uploads/student_images/default_female.jpg', '716262515', 'Geenadiperera@gmail.com', NULL, NULL, NULL, '', NULL, '2004-03-18', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:29:08', NULL),
(705, 1410, 'YGC/2021/0333', NULL, '2021-04-28', 'Rajapaksha Rathnayaka', 'Chamara', 'Madhumadawa', NULL, 'uploads/student_images/default_male.jpg', '714356002', 'acchamara2001@gmail.com', NULL, NULL, NULL, '', NULL, '2001-10-31', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:31:25', NULL),
(706, 1412, 'YGC/2021/0334', NULL, '2021-04-29', 'M B', 'Lankika Poojani ', 'Fernando', NULL, 'uploads/student_images/default_female.jpg', '775933347', 'lankikapoojani11@gmail.com', NULL, NULL, NULL, '', NULL, '1998-11-11', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:32:47', NULL),
(707, 1414, 'YGC/2020/0338', NULL, '2021-05-03', 'Kavindaya', 'kithmini', 'waragoda ', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:35:38', NULL),
(708, 1416, 'YGC/2020/0341', NULL, '2021-05-03', 'Sandeepa', '', 'Madhawa', NULL, 'uploads/student_images/default_male.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:36:50', NULL),
(709, 1418, 'YGC/2020/0343', NULL, '2021-05-04', 'Sajith', 'Lakshan Jayathilaka', ' Dissanayaka', NULL, 'uploads/student_images/default_male.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:37:51', NULL),
(710, 1420, 'YGC/2020/0345', NULL, '2021-05-05', 'Rathnayaka mudiyanselage', 'umasha ', 'madushani ', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:38:47', NULL),
(711, 1422, 'YGC/2020/0346', NULL, '2021-05-05', 'Tashini', 'Thisalka', 'Muthukumarana', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:39:37', NULL),
(712, 1424, 'YGC/2021/0347', NULL, '2021-05-06', 'Subasingha Appuhamilage', 'Ayesha Lakmali', 'Subasingha ', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:40:28', NULL),
(713, 1426, 'YGC/2021/0348', NULL, '2021-05-06', 'K.m', 'Pathum Chamara', ' Sandaruvan', NULL, 'uploads/student_images/default_male.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:41:19', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES
(714, 1428, 'YGC/2021/0351', NULL, '2021-05-06', 'Mapatunage', 'sayuri ', 'sankalpana ', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:42:07', NULL),
(715, 1430, 'YGC/2021/0352', NULL, '2021-05-06', 'M.', 'Sasith ', 'Hasindu', NULL, 'uploads/student_images/default_male.jpg', '768106507', 'sasithhasindu@gmail.com', NULL, NULL, NULL, '', NULL, '1993-11-08', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:43:35', NULL),
(716, 1432, 'YGC/2021/0355', NULL, '2021-05-07', 'W.A.A.D.', '', 'Wanniarachchi', NULL, 'uploads/student_images/default_male.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:45:07', NULL),
(717, 1434, 'YGC/2021/0356', NULL, '2021-05-07', 'J. A. D.', 'Nethmi Madhushika', 'Jayakody ', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:46:03', NULL),
(718, 1436, 'YGC/2021/0362', NULL, '2031-05-10', 'Adhikari Mudiyanselage', 'Shawishwa Ashinsana', ' Adhikari', NULL, 'uploads/student_images/default_male.jpg', '755435223', 'Janithasadunama@gmail.com', NULL, NULL, NULL, '', NULL, '2000-10-06', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:48:00', NULL),
(719, 1438, 'YGC/2021/0190', NULL, '2021-03-01', 'Minindukula Sooriya', 'Marian Lakchani Arosha', 'Frenando', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-01-01', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 08:49:05', NULL),
(720, 1440, 'YGC/2020/0031', NULL, '2020-12-09', 'Shramaner', '', 'Ramaniyo', NULL, 'uploads/student_images/default_male.jpg', '715394226', 'ramaniyos@gmail.com', NULL, NULL, NULL, '', NULL, '1994-01-28', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:15:28', NULL),
(721, 1442, 'YGC/2020/0039', NULL, '2020-12-17', 'NWGPS', '', 'WEERASINGHE', NULL, 'uploads/student_images/default_male.jpg', '719618341', 'www.prasadsadaruwan998@gmail.com', NULL, NULL, NULL, '', NULL, '1966-03-01', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:19:12', NULL),
(722, 1444, 'YGC/2020/0042', NULL, '2020-12-18', 'Samarasuriyage', 'sivanthika', 'uchithani', NULL, 'uploads/student_images/default_female.jpg', '778227237', 'Samarasooriya08@gmail.com', NULL, NULL, NULL, '', NULL, '1987-08-04', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:20:45', NULL),
(723, 1446, 'YGC/2020/0043', NULL, '2020-12-20', 'R.L.', 'Lahiru Subashitha', 'Rajapaksha', NULL, 'uploads/student_images/default_male.jpg', '718844788', 'Lahirusubash100@gmail.com', NULL, NULL, NULL, '', NULL, '2001-04-28', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:21:53', NULL),
(724, 1448, 'YGC/2020/0044', NULL, '2020-12-20', 'Liyana Arachchige', 'Charitha Jayamini', 'Amarasinghe', NULL, 'uploads/student_images/default_female.jpg', '718891270', 'charitha@ibsl.lk', NULL, NULL, NULL, '', NULL, '1992-03-27', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:23:16', NULL),
(725, 1450, 'YGC/2020/0048', NULL, '2020-12-22', 'KOHILAMULLA ARACHCHILAGE', 'PASINDU', 'DILSHAN', NULL, 'uploads/student_images/default_male.jpg', '703114997', 'pasindud542@gmail.com', NULL, NULL, NULL, '', NULL, '2000-12-30', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:24:39', NULL),
(726, 1452, 'YGC/2020/0051', NULL, '2020-12-24', 'N M', 'Rajitha Harshanath', 'Perera', NULL, 'uploads/student_images/default_male.jpg', '773303611', 'rajithah22@gmail.com', NULL, NULL, NULL, '', NULL, '2000-05-22', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:26:14', NULL),
(727, 1454, 'YGC/2020/0053', NULL, '2020-12-25', 'Karunamuni', 'kaveesha dewmini', 'silva', NULL, 'uploads/student_images/default_female.jpg', '771469967', 'desilvakaveesha05@gmail.com', NULL, NULL, NULL, '', NULL, '2000-08-02', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:27:51', NULL),
(728, 1456, 'YGC/2020/0054', NULL, '2020-12-26', 'Maniyangama Dewage', 'Nadeesha Piyumali ', 'Karunarathna', NULL, 'uploads/student_images/default_female.jpg', '717757687', 'nadeeshakarunarathna0808@gmail.com', NULL, NULL, NULL, '', NULL, '1994-08-08', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:29:45', NULL),
(729, 1458, 'YGC/2020/0055', NULL, '2020-12-26', 'Nuwan', '', 'Madusanka', NULL, 'uploads/student_images/default_male.jpg', '719496777', 'nuwancnms@gmail.com', NULL, NULL, NULL, '', NULL, '1987-10-06', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:31:11', NULL),
(730, 1460, 'YGC/2020/0056', NULL, '2020-12-27', 'Neelakanni Mudiyanselage', 'Hiran Harshika ', 'Perera', NULL, 'uploads/student_images/default_male.jpg', '774261931', 'hiran.perera55@gmail.com', NULL, NULL, NULL, '', NULL, '1998-05-08', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:32:34', NULL),
(731, 1462, 'YGC/2020/0064', NULL, '2020-12-29', 'B.', 'Himanthi Oshadhi', 'Jayasinghe', NULL, 'uploads/student_images/default_female.jpg', '775876953', 'Jhimanthi@gmail.com', NULL, NULL, NULL, '', NULL, '1999-05-20', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:37:07', NULL),
(732, 1464, 'YGC/2021/0076', NULL, '2021-01-05', 'M.H.', 'Pavani', 'Iroshani', NULL, 'uploads/student_images/default_female.jpg', '768335594', 'Shanthaudhayakumara3@gmail.com', NULL, NULL, NULL, '', NULL, '2001-06-02', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:40:54', NULL),
(733, 1466, 'YGC/2021/0080', NULL, '2021-01-07', 'Mudiyanselage', 'Hiruna', ' Gimhan', NULL, 'uploads/student_images/default_male.jpg', '785161504', 'gimhanhiruna@gmail.com', NULL, NULL, NULL, '', NULL, '2001-01-30', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-09-27 09:42:15', NULL),
(761, 1522, 'YGC/2021/0652', NULL, '2021-12-10', 'RAVINDU', 'SANKALPA', 'RATHNAYAKE', NULL, 'uploads/student_images/default_male.jpg', '0766142990', 'ravindusankalpa06@gmail.com', NULL, NULL, NULL, '', NULL, '1998-06-06', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'R M NAWARATHNA BANDARA', '0701616150', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 09:51:04', NULL),
(762, 1524, 'YGC/2021/0647', NULL, '2021-12-03', 'DEHENI', '', ' WASANA', NULL, 'uploads/student_images/default_female.jpg', '0777453972', 'wasanadeheni87@gmail.com', NULL, NULL, NULL, '', NULL, '2001-08-07', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'K.S.T.R. SHIROMANI', '0787991340', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 09:56:50', NULL),
(763, 1526, 'YGC/2021/0643', NULL, '2021-12-30', 'UDITHA', 'HARSHANI', 'DE SILVA', NULL, 'uploads/student_images/default_female.jpg', '0702176112', '', NULL, NULL, NULL, '', NULL, '1990-03-30', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:05:26', NULL),
(764, 1528, 'YGC/2021/0655', NULL, '2021-12-12', 'TIRUNI', ' UDAYANGANI', 'SIRISENA ', NULL, 'uploads/student_images/default_female.jpg', '0716451079', 'tiruniu@gmail.com', NULL, NULL, NULL, '', NULL, '1998-02-12', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'THILAK NAYANA', '0704451366', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:09:29', NULL),
(765, 1530, 'YGC/2021/0658', NULL, '2021-12-16', 'KASUN', ' HASANTHA ', 'KUMARA ', NULL, 'uploads/student_images/default_male.jpg', '0718869367', 'khasantha40@gmail.com', NULL, NULL, NULL, '', NULL, '1995-08-22', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'L.S.JAYASINGHE', '0771719104', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:13:00', NULL),
(766, 1532, 'YGC/2021/0660', NULL, '2021-12-19', 'GANESHAN', '', 'LOGESHWARAN ', NULL, 'uploads/student_images/default_male.jpg', '0779923455', 'logeshlogeshwaran123@gmail.com', NULL, NULL, NULL, '', NULL, '1982-12-27', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'GANESHAN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:16:03', NULL),
(767, 1534, 'YGC/2021/0620', NULL, '2021-12-20', 'VISHMI', 'ASHENI', 'JUMART ', NULL, 'uploads/student_images/default_female.jpg', '0741663414', 'vishmiasheni2001@gmail.com', NULL, NULL, NULL, '', NULL, '2001-12-28', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'CHITHRA', '0763900842', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:45:16', NULL),
(768, 1536, 'YGC/2021/0662', NULL, '2021-12-22', 'THIRUMAGAL', '', 'RAMESHWARAN', NULL, 'uploads/student_images/default_female.jpg', '0741792455', 'jenodhiv@gmail.com', NULL, NULL, NULL, '', NULL, '2001-11-15', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', ' KUGASHAN NITHARSHANA	', '077 5538884', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:21:33', NULL),
(769, 1538, 'YGC/2021/0670', NULL, '2021-12-26', 'CHETHIKA', ' SHEHARI ', 'MENDIS', NULL, 'uploads/student_images/default_female.jpg', '0779741694', 'chethikamendis7@gmail.com', NULL, NULL, NULL, '', NULL, '1989-02-15', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'NIROSHAN RAJAKARUNA', '0773211870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:24:36', NULL),
(770, 1540, 'YGC/2021/0671', NULL, '2021-12-26', 'P.P.SURANGANI', '', '', NULL, 'uploads/student_images/default_female.jpg', '0766363780', '', NULL, NULL, NULL, '', NULL, '1979-12-06', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'DEEPAL HEMANTHA KODAGODA', '0774277933', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:27:50', NULL),
(771, 1542, 'YGC/2021/0672', NULL, '2021-12-27', 'R.K.ANOMI HANSIKA', ' BHASHINI', 'RAJAPAKSHA', NULL, 'uploads/student_images/default_female.jpg', '0760801624', 'anomirajapaksha7@gmail.com', NULL, NULL, NULL, '', NULL, '2000-12-31', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'INDIKA PUNSIRI', '0718606988', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:30:26', NULL),
(772, 1544, 'YGC/2021/0675', NULL, '2021-12-27', 'B.A.SURANGI', 'SANGEETHA', ' WIJESINGHE', NULL, 'uploads/student_images/default_female.jpg', '0764898462', '', NULL, NULL, NULL, '', NULL, '1980-03-18', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:32:25', NULL),
(773, 1546, 'YGC/2021/0674', NULL, '2021-12-27', 'D.G. DILUKSHI', 'CHAMIKA ', 'KEERTHIRATHNA ', NULL, 'uploads/student_images/default_female.jpg', '0715500049', 'diluchamika@gmail.com', NULL, NULL, NULL, '', NULL, '1991-05-05', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'INDIKA DENUWAN DEVENDRA', '0770606588', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:35:09', NULL),
(774, 1548, 'YGC/2021/0676', NULL, '2021-12-27', 'W. M. GAYANI', 'RUWANTHIKA ', 'WANNINAYAKE 	', NULL, 'uploads/student_images/default_female.jpg', '0761368291', 'gayaniwanninayake27@gmail.com', NULL, NULL, NULL, '', NULL, '1996-07-09', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'W. R. M. C. P. WIJESOORIYA', '0761368290', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:37:32', NULL),
(775, 1550, 'YGC/2021/0677', NULL, '2021-12-30', 'S.K.PRASANGA', '', 'NADEESHA', NULL, 'uploads/student_images/default_male.jpg', '0702628465', 'skprasanganadeesha789@gmail.com', NULL, NULL, NULL, '', NULL, '1986-12-30', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 10:44:23', NULL),
(776, 1552, 'YGC/2021/0565', NULL, '2021-10-14', 'HASINI', 'DEVINDI', 'KUMARI', NULL, 'uploads/student_images/default_female.jpg', '0740650639', 'Hashidevindi1212@gamil.com', NULL, NULL, NULL, '', NULL, '2002-12-12', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'RANJITH PUSHPAKUMARA', '0768624563', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 11:12:34', NULL),
(777, 1554, 'YGC/2021/0646', NULL, '2021-12-03', 'SATHASIVAM', '', 'DILAKSHAN', NULL, 'uploads/student_images/default_male.jpg', '0761102566', 'sdilakshan134@gmail.com', NULL, NULL, NULL, '', NULL, '1995-07-03', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 11:19:55', NULL),
(778, 1556, 'YGC/2021/0656', NULL, '2021-12-12', 'NIUMI', 'DARSHANI', 'PIERIS', NULL, 'uploads/student_images/default_female.jpg', '0716747348', 'niumi@ceyline.lk', NULL, NULL, NULL, '', NULL, '1995-04-11', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'NEWTON PIERIS', '0711562718', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 11:23:04', NULL),
(779, 1558, 'YGC/2021/0648', NULL, '2021-12-03', 'SITHMI', 'NIMASHI', 'FERNANDO', NULL, 'uploads/student_images/default_female.jpg', '0761981969', 'fernandosithmi0@gmail.com', NULL, NULL, NULL, '', NULL, '2003-01-24', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'NIRUSHA HARSHANI', '0776637108', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 11:26:03', NULL),
(780, 1560, 'YGC/2021/0663', NULL, '2021-12-22', 'THULSHI', 'NAVODIKA', 'DE SILVA', NULL, 'uploads/student_images/default_female.jpg', '94767158817', 'thulsidesilva@gmail.com', NULL, NULL, NULL, 'BUDDHISM', NULL, '1998-06-25', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'LAL DE SILVA', '94714447217', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 14:07:19', NULL),
(781, 1562, 'YGC/2021/0665', NULL, '2021-12-22', 'UDARI', 'CHINTHANI', 'BANNEHEKA', NULL, 'uploads/student_images/default_female.jpg', '94750162532', 'udari.banneheka@gmail.com', NULL, NULL, NULL, 'BUDDHISM', NULL, '1998-05-07', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'B M RATHNAYAKE', '94764353249', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 14:11:39', NULL),
(782, 1564, 'YGC/2021/0666', NULL, '2021-12-22', 'LAKSHIKA', 'MADHUSHANI', '', NULL, 'uploads/student_images/default_female.jpg', '94770409437', 'lakshikamadushani686@gmail.com', NULL, NULL, NULL, 'BUDDHISM', NULL, '1998-09-09', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'R M THISSA BANDARA', '94705818017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 14:16:02', NULL),
(783, 1566, 'YGC/2021/0664', NULL, '2021-12-22', 'THANGARAJA', 'MAHESHAN', '', NULL, 'uploads/student_images/default_male.jpg', '94776523340', 'thangarajamahesha@gmail.com', NULL, NULL, NULL, '', NULL, '1978-11-23', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-30 14:20:30', NULL),
(784, 1568, 'YGC/2021/0630', NULL, '2021-11-29', 'DINUSHIKA', '', 'SENADHEERA', NULL, 'uploads/student_images/default_female.jpg', '0711392889', 'dinushikap24@gmail.com', NULL, NULL, NULL, '', NULL, '2001-11-23', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'CHAMPIKA BALASOORIYA', '0759560508', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:03:44', NULL),
(785, 1570, 'YGC/2021/0637', NULL, '2021-11-20', 'JAQUE', 'CHRISTOPHER', 'LAMPAKTSUN', NULL, 'uploads/student_images/default_male.jpg', '0781656470', 'jakechris80@gmail.com', NULL, NULL, NULL, '', NULL, '2002-03-21', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'GILLIAN CLEMENTS', '0784458602', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:02:40', NULL),
(786, 1572, 'YGC/2021/0557', NULL, '2021-10-11', 'SHARAN', 'BERNADETTE', 'JANSEN', NULL, 'uploads/student_images/default_female.jpg', '0711634219', 'sharanjansen123@gmail.com', NULL, NULL, NULL, '', NULL, '1997-11-05', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'SHRIYANI JANSEN', '0701119261', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:16:00', NULL),
(787, 1574, 'YGC/2021/0599', NULL, '2021-11-06', 'IMESHA', '', 'DILSHANI', NULL, 'uploads/student_images/default_female.jpg', '0701593078', '', NULL, NULL, NULL, '', NULL, '2001-09-06', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'UDENI CHANDRIKA', '0112144307', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:20:04', NULL),
(788, 1576, 'YGC/2021/0600', NULL, '2021-11-09', 'VINUTH', 'CHANUKA ', 'DIAS', NULL, 'uploads/student_images/default_male.jpg', '0778077096', 'vinuthchanuka05@gmail.com', NULL, NULL, NULL, '', NULL, '2000-02-13', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'L.A.N.DIAS', '0775147733', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:24:04', NULL),
(789, 1578, 'YGC/2021/0602', NULL, '2021-11-09', 'ISURU', 'SAMPATH ', 'PERERA', NULL, 'uploads/student_images/default_male.jpg', '0787905835', 'Boy285409@gmail.com', NULL, NULL, NULL, '', NULL, '2000-04-07', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'NIROSHA FERNANDO', '0768939212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:26:33', NULL),
(790, 1580, 'YGC/2021/0603', NULL, '2021-11-09', 'DANUSHKA', 'UDANA', 'WICKRAMASINGHE', NULL, 'uploads/student_images/default_male.jpg', '0715557722', 'danushkaudanawickramasinghe@gmail.com', NULL, NULL, NULL, '', NULL, '1985-02-12', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:29:41', NULL),
(791, 1582, 'YGC/2021/0607', NULL, '2021-11-12', 'SASMITAA', '', 'ILLANCHELIAN', NULL, 'uploads/student_images/default_female.jpg', '0764160628', 'shashasachu@gmail.com', NULL, NULL, NULL, '', NULL, '2001-09-05', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'RENUKA', '0779954494', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:32:25', NULL),
(792, 1584, 'YGC/2021/0616', NULL, '2021-11-15', 'DEMATAN PITIYGE SHASHIKALA', '', '', NULL, 'uploads/student_images/default_female.jpg', '0714548825', 'dpshashi973@gmail.com', NULL, NULL, NULL, '', NULL, '2002-01-26', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'DP SUNIL', '0777606118', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:51:00', NULL),
(793, 1586, 'YGC/2021/0617', NULL, '2021-11-15', 'AUSHADI', 'MINOLI ', 'MANDIRA', NULL, 'uploads/student_images/default_female.jpg', '0701528662', 'minolimandira12@gmail.com', NULL, NULL, NULL, '', NULL, '2001-11-13', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'W.D NIROSHA WITHARANA	', '0764114570', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:38:14', NULL),
(794, 1588, 'YGC/2021/0621', NULL, '2021-11-17', 'DILINI', '', 'BHAGYA', NULL, 'uploads/student_images/default_female.jpg', '0779580232', 'dilinibhagya73@gmail.com', NULL, NULL, NULL, '', NULL, '1990-08-12', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'P.ABEYKOON', '0740606145', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:40:59', NULL),
(795, 1590, 'YGC/2021/0638', NULL, '2021-11-26', 'J.G.DILRUKSHI', '', '', NULL, 'uploads/student_images/default_female.jpg', '0778506739', 'JGdilrukshi95@gmail.com', NULL, NULL, NULL, '', NULL, '1999-10-26', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'B.P.SOORIYAKANTHI', '0768011734', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:45:47', NULL),
(796, 1592, 'YGC/2021/0644', NULL, '2021-11-30', 'DHADALLAGE SHASHIKALA', 'DULANGI', 'DE SILVA', NULL, 'uploads/student_images/default_female.jpg', '0740058528', 'shashidesilva6@gmail.com', NULL, NULL, NULL, '', NULL, '2001-10-24', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'D.DILSHA THUSHAN PREMASIRI SILVA', '0774874995 / 0764964096', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 03:49:05', NULL),
(797, 1594, 'YGC/2021/0551', NULL, '2021-09-24', 'THELASINGHA MUDIYANSELAGE SHEHAN', 'WENURANGA', 'THELASINGHA ', NULL, 'uploads/student_images/default_male.jpg', '0702187174', 'shehanwenuranga2020@gmail.com', NULL, NULL, NULL, '', NULL, '1998-01-07', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'T.M.SEMASINGHA', '071 2160222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:08:29', NULL),
(798, 1596, 'YGC/2021/0545', NULL, '2021-12-31', 'M.R. ANUSHA', ' MADUSHANI', 'GUNARATHNA', NULL, 'uploads/student_images/default_female.jpg', '0710471637', 'madushanianusha676@gmail.com', NULL, NULL, NULL, '', NULL, '1999-02-07', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'M.R.GAMINI GUNARATHNA', '0764422964', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:11:16', NULL),
(799, 1598, 'YGC/2021/0547', NULL, '2021-10-01', 'S.A.HASHINI', 'KAVEESHA ', 'PERERA', NULL, 'uploads/student_images/default_female.jpg', '0764598416', 'kaveeshahasini01@gmail.com', NULL, NULL, NULL, '', NULL, '2000-03-14', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'S.A.L.PALITHA PERERA', '0715818923', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:14:27', NULL),
(800, 1600, 'YGC/2021/0548', NULL, '2021-10-01', 'J A D PAWANI', '', 'JAYATHILAKA', NULL, 'uploads/student_images/default_female.jpg', '0765852769', 'jayathilakapawani20@gmail.com', NULL, NULL, NULL, '', NULL, '2000-02-03', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'INDRANI JAYATHILAKA', '0778399094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:18:02', NULL),
(801, 1602, 'YGC/2021/0549', NULL, '2021-10-03', 'RAVI', 'KUMAR', 'YOGAVATHANI', NULL, 'uploads/student_images/default_female.jpg', '0762186615', 'yogavathani43@gmail.com', NULL, NULL, NULL, '', NULL, '2000-04-23', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'VIJAY RANJANI', '0778241531', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:20:30', NULL),
(802, 1604, 'YGC/2021/0550', NULL, '2021-10-05', 'SURESH', '', 'SHALOM', NULL, 'uploads/student_images/default_male.jpg', '0769193593', 'sureshshalom711@gmail.com', NULL, NULL, NULL, '', NULL, '1998-08-14', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'SURESH ', '0762715210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:23:03', NULL),
(803, 1606, 'YGC/2021/0553', NULL, '2021-10-06', 'SITHARA', 'SANDUNI', 'HETTIARACHCHI', NULL, 'uploads/student_images/default_female.jpg', '0703696164', 'Sitharasanduni7@gmail.com', NULL, NULL, NULL, '', NULL, '2000-02-07', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'ATHULA CHANDRATHILAKA', '0724953836', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:25:30', NULL),
(804, 1608, 'YGC/2021/0554', NULL, '2021-10-08', 'ARUNI', 'MEKALA', 'VIDANAPATHIRANA', NULL, 'uploads/student_images/default_female.jpg', '0716242740', 'amv9737aruni@gmail.com', NULL, NULL, NULL, '', NULL, '1997-03-07', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'P.A.WIMALAWATHI', '0715949637', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:28:12', NULL),
(805, 1610, 'YGC/2021/0559', NULL, '2021-10-11', 'DIUNUGLGE AYONIKA', 'DILRUKSHI', 'WIMALARATHNA', NULL, 'uploads/student_images/default_female.jpg', '0717592730', 'dilrukshiwimalarathna7@gmail.com', NULL, NULL, NULL, '', NULL, '1998-01-03', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'D.WIMALARATHNA', '0710327161', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:31:17', NULL),
(806, 1612, 'YGC/2021/0560', NULL, '2021-10-11', 'PARANA SATTAMBIGE CHATHURIKA', '', 'DAYARATHNA', NULL, 'uploads/student_images/default_female.jpg', '0716012077', 'dayarathnachathurika1@gmail.com', NULL, NULL, NULL, '', NULL, '1999-04-28', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'P.S.DAYARATHNA', '0714564706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:35:09', NULL),
(807, 1614, 'YGC/2021/0567', NULL, '2021-10-15', 'DHANUSHI', 'THARINDYA', 'WIDISINGHE', NULL, 'uploads/student_images/default_female.jpg', '0714410119', 'dhanushitharindya@gmail.com', NULL, NULL, NULL, '', NULL, '2000-08-08', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'L.S.R.DE SILVA', '0714410119', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:38:07', NULL),
(808, 1616, 'YGC/2021/0581', NULL, '2021-10-28', 'H.P IMASHI', 'NITHYA', '  KESHALI', NULL, 'uploads/student_images/default_female.jpg', '0711661402', 'nithyakeshali89@gmail.com', NULL, NULL, NULL, '', NULL, '2000-09-26', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'H.P.WASANTHA PREMALAL', '0770632716', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:40:52', NULL),
(809, 1618, 'YGC/2021/0590', NULL, '2021-11-01', 'ROYCE', '', 'TERRENCE', NULL, 'uploads/student_images/default_male.jpg', '0767822133', 'royceterrence14@gmail.com', NULL, NULL, NULL, '', NULL, '1992-02-14', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'R.A.TERRENCE', '0773778471', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:43:12', NULL),
(810, 1620, 'YGC/2021/0501', NULL, '2021-08-17', 'M.V NILANGA', 'DILIP ', 'SAMPATH', NULL, 'uploads/student_images/default_male.jpg', '0713086078', 'qamanager.dagapparel@gmail.com', NULL, NULL, NULL, '', NULL, '1985-06-16', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'H.A.PREMAWATHI', '0765618255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:50:52', NULL),
(811, 1622, 'YGC/2021/0526', NULL, '2021-08-29', 'MEDAHEDARA MUDIYANSELAGE SUDANTHA', '', '', NULL, 'uploads/student_images/default_male.jpg', '0774921150', 'sudanthamedagedara@gimail.com', NULL, NULL, NULL, '', NULL, '1979-07-10', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:56:00', NULL),
(812, 1624, 'YGC/2021/0516', NULL, '2021-08-30', 'LASANTHA', '', 'EDIRIWEERA ', NULL, 'uploads/student_images/default_male.jpg', '0777731201', 'lljlasantha@gmail.com', NULL, NULL, NULL, '', NULL, '1979-07-16', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 04:59:24', NULL),
(813, 1626, 'YGC/2021/0591', NULL, '2021-11-03', 'RASANJALI', '', ' KOTHALAWALA ', NULL, 'uploads/student_images/default_female.jpg', '0763326644', 'ravikakothalawala@gmail.com', NULL, NULL, NULL, '', NULL, '1984-10-24', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'RANJITH KOTHALAWALA ', '0763726644', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 05:11:31', NULL),
(814, 1628, 'YGC/2021/0555', NULL, '2021-10-08', 'HANDUWALA DEWAGE SAMADHI', 'NETHMINI ', 'GUNARATHNA', NULL, 'uploads/student_images/default_female.jpg', '0765618168', 'samadhinethmini513@gmail.com', NULL, NULL, NULL, '', NULL, '1998-05-04', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'H.D.INDIKA GUNARATHNA', '077 5398160', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 05:16:13', NULL),
(815, 1630, 'YGC/2021/0609', NULL, '2021-11-13', 'RATHNA RAJAH PRIYANKA', '', ' NILUKSHI', NULL, 'uploads/student_images/default_female.jpg', '0779507524', 'shanthireeta71@gmail.com', NULL, NULL, NULL, '', NULL, '2004-02-24', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'RATHNA RAJAH', '0777742245', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-09 03:27:18', NULL),
(816, 1632, 'YGC/2021/0653', NULL, '2021-12-11', 'WARUNA', 'PRABHATH', 'THALAKOTUNA', NULL, 'uploads/student_images/default_male.jpg', '94778539284', 'qswarunaprabhath@gmail.com', NULL, NULL, NULL, '', NULL, '1993-10-05', 'Male', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'GUNARATHNA THALAKOTUNA', '94719465086', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 07:40:23', NULL),
(817, 1634, 'YGC/2021/0651', NULL, '2021-12-11', 'ASANKA', 'HIROSHAN', 'AMARASEKARA', NULL, 'uploads/student_images/default_male.jpg', '94772900311', 'asankaah@gmail.com', NULL, NULL, NULL, '', NULL, '1986-02-06', 'Male', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 07:48:53', NULL),
(818, 1636, 'YGC/2021/0654', NULL, '2021-12-11', 'DINUKA', 'SANDARUWAN', '', NULL, 'uploads/student_images/default_male.jpg', '94778610119', 'sandaruwandinuka2001@gmail.com', NULL, NULL, NULL, '', NULL, '2001-06-14', 'Male', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'RANJITH JAYANTHA', '94768472688', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2021-12-31 07:53:30', NULL),
(825, 1650, 'YGC/2021/0679', NULL, '2021-12-31', 'DILUMI', 'MADUSHANI', 'PERERA', NULL, 'uploads/student_images/default_female.jpg', '94778596337', 'uvdilumiperera90@gmail.com', NULL, NULL, NULL, '', NULL, '1990-10-03', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'D.M.VENDABONA', '94712669418', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-03 11:33:10', NULL),
(826, 1652, 'YGC/2021/0682', NULL, '2021-12-31', 'DISSANAYAKAGE', 'MADUKA ', 'RASHANTHI ', NULL, 'uploads/student_images/default_female.jpg', '94773754199', 'maduka_rashanthi@yahoo.com', NULL, NULL, NULL, '', NULL, '1986-09-30', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'D K HEMANTHA', '94777887088', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-03 11:39:33', NULL),
(827, 1654, 'YGC/2021/0680', NULL, '2021-12-31', 'SHAGANAA', '', 'SUGUMAR', NULL, 'uploads/student_images/default_female.jpg', '0763536200', 'sugumarshaganaa@gmail.com', NULL, NULL, NULL, '', NULL, '2001-07-26', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 04:36:57', NULL),
(828, 1656, 'YGC/2021/0598', NULL, '2021-11-06', 'DHANURDHA', 'THATHSARANI', '', NULL, 'uploads/student_images/default_female.jpg', '94760891504', 'thathsaranidhanurdha@gmail.com', NULL, NULL, NULL, '', NULL, '2000-01-06', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'B A SUNETHRA', '94778932251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 05:10:38', NULL),
(829, 1658, 'YGC/2021/0592', NULL, '2022-01-04', 'LIYANI', 'NAVINYA', 'JAYATHILAKA', NULL, 'uploads/student_images/default_female.jpg', '94779953966', 'jayathilakaliyani@gmail.com', NULL, NULL, NULL, '', NULL, '1999-10-15', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'P A D A S JAYATHILAKA', '94777342456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 05:16:52', NULL),
(830, 1660, 'YGC/2021/0627', NULL, '2022-01-04', 'K V HANSIKA', 'LAHIRUNI ', 'DAYANANDA', NULL, 'uploads/student_images/default_female.jpg', '94765751073', 'hansikalahiruni315@gmail.com', NULL, NULL, NULL, '', NULL, '1997-01-09', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'K V LAKSHMAN DAYANANDA', '94702618004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 05:24:29', NULL),
(831, 1662, 'YGC/2021/0628', NULL, '2022-01-04', 'I', 'SUSEELA ', 'THERO', NULL, 'uploads/student_images/default_male.jpg', '94729996238', 'suseelathero26@gmail.com', NULL, NULL, NULL, '', NULL, '1991-09-24', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 05:31:54', NULL),
(832, 1664, 'YGC/2021/0629', NULL, '2022-01-04', 'M.W RANDHI', 'SATHSARANI', 'DE SILVA', NULL, 'uploads/student_images/default_female.jpg', '94762269457', 'lilranu21@gmail.com', NULL, NULL, NULL, '', NULL, '2001-05-17', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'S K L MANGALIKA', '94762269457', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 05:38:01', NULL),
(833, 1666, 'YGC/2021/0531', NULL, '2021-09-12', 'M YASARA', 'YUWANIKA', 'SIRIWARDHANA', NULL, 'uploads/student_images/default_female.jpg', '94760261623', 'yasarasiriwardhana1@gmail.com', NULL, NULL, NULL, '', NULL, '1995-05-16', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'M.W.K  SIRIWARDHANA', '94776628194', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 08:46:01', NULL),
(834, 1668, 'YGC/2021/0534', NULL, '2021-09-16', 'A M SHARALA', 'UMEKA', 'EVANI', NULL, 'uploads/student_images/default_female.jpg', '94713397872', 'kwajira672@gmail.com', NULL, NULL, NULL, '', NULL, '2003-03-11', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'A.M.U.WAJIRA KUMARA', '94775744040', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 09:54:06', NULL),
(835, 1670, 'YGC/2021/0536', NULL, '2021-09-17', 'U U', 'MADHUBASHINI', '', NULL, 'uploads/student_images/default_female.jpg', '94762092356', '', NULL, NULL, NULL, '', NULL, '2000-06-10', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'U NIHAL ANANDA', '94762092356', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 10:00:43', NULL),
(836, 1672, 'YGC/2021/0538', NULL, '2021-09-22', 'ACHINI', 'KULATHUNGA', '', NULL, 'uploads/student_images/default_female.jpg', '94772846261', 'kulathungaachini5@gmail.com', NULL, NULL, NULL, '', NULL, '1984-09-13', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Y G C N GUNADASA', '94763844586', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 10:03:49', NULL),
(837, 1674, 'YGC/2021/0542', NULL, '2021-09-26', 'M G', 'HARSHI', 'MUTHUKUMARI', NULL, 'uploads/student_images/default_female.jpg', '94713845311', 'gamagehmk8@gamil.com', NULL, NULL, NULL, '', NULL, '1999-08-13', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'M G VIMALASENA', '94776994796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 10:08:26', NULL),
(838, 1676, 'YGC/2021/0574', NULL, '2021-10-19', 'C TIYANA', 'OSHADI', 'FERNANDO', NULL, 'uploads/student_images/default_female.jpg', '94778681444', 'tiyanaof@gmail.com', NULL, NULL, NULL, '', NULL, '2004-02-23', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'VAYOMI RODRIGO', '94778681444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-04 10:12:56', NULL),
(839, 1678, 'YGC/2021/0657', NULL, '2021-12-15', 'DUSHANTHI', 'NIMMIKA', 'PERERA', NULL, 'uploads/student_images/default_female.jpg', '94769288255', 'nimmip24@gmail.com', NULL, NULL, NULL, '', NULL, '1983-07-30', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Buddhika Disanayaka ', '94758796254', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-05 06:41:29', NULL),
(840, 1680, 'YGC/2021/0668', NULL, '2021-12-25', 'PAMODHI', 'NADUNIKA', 'WIJERATHNE', NULL, 'uploads/student_images/default_female.jpg', '94704995861‬', 'pamonadunika14@gmail.com', NULL, NULL, NULL, '', NULL, '2001-10-14', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Disna Dilrukshi', '94777726727', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-05 06:47:39', NULL),
(841, 1682, 'YGC/2021/0669', NULL, '2021-12-26', 'CHARUKA', 'DILSHAN ', '', NULL, 'uploads/student_images/default_male.jpg', '94703197038', 'Charukadilshan48@gmail.com', NULL, NULL, NULL, '', NULL, '2001-02-22', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'U Thushara Indika', '94728296898', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-05 06:51:15', NULL),
(842, 1684, 'YGC/2021/0673', NULL, '2021-12-25', 'SURANGA', 'GAYAN', 'DHARMARATHNA', NULL, 'uploads/student_images/default_male.jpg', '94777723788', 'susurangadh123@gmail.com', NULL, NULL, NULL, '', NULL, '1986-03-16', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Chathurika', '94760100595', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-05 06:54:38', NULL),
(843, 1686, 'YGC/2021/0681', NULL, '2021-12-31', 'PRAMODYA', 'SULAKSHI', 'WIJERATHNE', NULL, 'uploads/student_images/default_female.jpg', '94713493627', 'tharanga91@icloud.com', NULL, NULL, NULL, '', NULL, '2000-01-24', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Chaminda Wijerathne ', '94777950948', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-05 07:00:27', NULL),
(844, 1688, 'YGC/2021/0650', NULL, '2021-12-05', 'KAVISHA', 'SANKALPANI', 'FONSEKA', NULL, 'uploads/student_images/default_female.jpg', '94761017802', 'kavishasankalpani55@gmail.com', NULL, NULL, NULL, '', NULL, '2002-09-24', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Prasanna Fonseka', '94773178346', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-05 07:10:37', NULL),
(845, 1690, 'YGC/2021/0667', NULL, '2021-12-24', 'NISALI', 'JEEVIKA', '', NULL, 'uploads/student_images/default_female.jpg', '94770158299', 'nisalijeevi@gmail.com', NULL, NULL, NULL, '', NULL, '1989-05-31', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Mr Ranga ', '94770158299', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-05 07:15:02', NULL),
(846, 1692, 'YGC/2021/0685', NULL, '2022-01-04', 'SULOCHANA', '', 'RUPASENA', NULL, 'uploads/student_images/default_female.jpg', '0777659970', 'sadaruwansenanayaka411@gmail.com', NULL, NULL, NULL, '', NULL, '1991-08-14', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'K.A PRADEEP SANDARUWAN SENANAYAKE', '0777623628', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-07 05:22:02', NULL);
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES
(847, 1694, 'YGC/2021/0686', NULL, '2022-01-04', 'PRAVEESHA', 'SONALI', 'RAJAPAKSHA', NULL, 'uploads/student_images/default_female.jpg', '0713153249', 'sonalirjpksha99@gmail.com', NULL, NULL, NULL, '', NULL, '1999-04-06', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'SAGARIKA', '0702489033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-07 05:26:02', NULL),
(848, 1696, 'YGC/2021/0687', NULL, '2022-01-04', 'NETHMI', 'KAWSHALYA NAVODI', 'RUPASENA', NULL, 'uploads/student_images/default_female.jpg', '0772979180', 'sameeraathukorala17@icloud.com', NULL, NULL, NULL, '', NULL, '2000-02-08', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'R.G.NANDANA RUPASENA', '0777659970', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-07 05:31:58', NULL),
(850, 1700, 'YGC/2022/0694', NULL, '2022-01-21', 'D DINURANGA', 'MAYANTHA', 'DIWYANJANA', NULL, 'uploads/student_images/default_male.jpg', '0762827413', 'firstci@yahoo.com', NULL, NULL, NULL, '', NULL, '2002-11-02', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'KARUNARATHNA', '0769718610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-21 05:50:40', NULL),
(851, 1702, 'YGC/2022/0700', NULL, '2022-01-26', 'V.K.SEWMINI', '', 'UDESHIKA', NULL, 'uploads/student_images/default_female.jpg', '0770462855', 'Sewminiudeshika2000@gmail.com', NULL, NULL, NULL, '', NULL, '2000-05-29', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'H.K.PRIYANTHI KUMUDU', '0752569798', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-28 06:29:40', NULL),
(853, 1706, 'YGC/2022/0661', NULL, '2021-12-28', 'NAZLIYA', '', 'NAFEER ', NULL, 'uploads/student_images/default_female.jpg', '0781324593', '', NULL, NULL, NULL, 'BUDDHISTS ', NULL, '2005-12-17', 'Female', NULL, NULL, '1', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'SITHY FAIZA ADAM LABBY ', '0781324593', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-28 11:28:21', NULL),
(854, 1708, 'YGC/2022/698', NULL, '2022-01-29', 'SHIRUNI', 'PRITEESHI ', 'KULASINGHE', NULL, 'uploads/student_images/default_female.jpg', '0701809853', '', NULL, NULL, NULL, 'BUDDHIST', NULL, '2000-06-28', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'SHIYANI BANS ABEWARDHANA', '0775474137', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-29 06:18:18', NULL),
(855, 1710, 'YGC/2022/0696', NULL, '2022-01-22', 'MALSHA', 'DILUKSHI', 'MANIKKU ARACHCHILAGE', NULL, 'uploads/student_images/default_female.jpg', '0754020452', '', NULL, NULL, NULL, 'BUDDHIST', NULL, '1995-04-24', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'G.P. PUSHPA KUMARI ', '0702130018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-29 06:39:57', NULL),
(856, 1712, 'YGC/2022/0624', NULL, '2021-12-07', 'HERATH MUDIYANSELAGE', 'HASINDU BHATHIYA', 'DHAYARATHNA', NULL, 'uploads/student_images/default_male.jpg', '0719713071', '', NULL, NULL, NULL, 'BUDDHIST', NULL, '2001-12-05', 'Male', NULL, NULL, '2', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'RAMBANDAGE DHAYARTHNA', '0715404926', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-29 06:50:28', NULL),
(857, 1714, 'YGC/2022/0625', NULL, '2021-12-07', 'DISSANAYAKA MUDIYANSELAGE', 'ESHAN NIMESHA', 'DISSANYAKA', NULL, 'uploads/student_images/default_male.jpg', '0705941555', '', NULL, NULL, NULL, 'BUDDHIST', NULL, '2001-10-06', 'Male', NULL, NULL, '2', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'SAMAN KUMARA DISSANAYAKA', '0717108925', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-29 06:52:57', NULL),
(859, 1718, 'YGC/2022/0701', NULL, '2022-01-28', 'GANESHAN', 'SHERON', '', NULL, 'uploads/student_images/default_male.jpg', '0750324030', 'sheronganesh075@gmail.com', NULL, NULL, NULL, '', NULL, '2000-10-04', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'A .GANESHAN', '0775957766', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-02 05:11:29', NULL),
(861, 1722, 'YGC/2022/0704', NULL, '2022-01-30', 'K.D.HASHANI', 'NIMESHIKA', 'NANAYAKKARA', NULL, 'uploads/student_images/default_female.jpg', '0701461642', 'nimeshikananayakkara21@gmail.com', NULL, NULL, NULL, '', NULL, '2000-07-30', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'K.D.H.NANAYAKKARA', '0723331580', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-05 06:58:04', NULL),
(862, 1724, 'YGC/2021/0690', NULL, '2022-01-07', 'THARANGA', 'KASUN', 'NILNUWAN', NULL, 'uploads/student_images/default_male.jpg', '94754096203', 'Tharangakasun514@gmail.com', NULL, NULL, NULL, '', NULL, '1991-12-09', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Rukmal nishanthi perera ', '94754096203', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-31 10:44:03', NULL),
(863, 1726, 'YGC/2021/0684', NULL, '2022-01-03', 'W M ANJALEE', 'SANDAMINI', 'WEERASINGHE', NULL, 'uploads/student_images/default_female.jpg', '94714060838', 'sandaminianjalee@gmail.com', NULL, NULL, NULL, '', NULL, '1997-04-09', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'SURESH MADUSANKA', '94719734718', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-31 15:15:00', NULL),
(864, 1728, 'YGC/2022/0692', NULL, '2022-01-10', 'E M', 'SILUNI', 'NIKETA', NULL, 'uploads/student_images/default_female.jpg', '94770433728', 'siluniniketa@gmail.com', NULL, NULL, NULL, '', NULL, '2003-02-10', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'G SHIROMI RODRIGO', '94770454252', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-31 15:19:11', NULL),
(865, 1730, 'YGC/2022/0697', NULL, '2022-01-24', 'JOANA', 'MELAN', 'DHARMARAJA', NULL, 'uploads/student_images/default_female.jpg', '94769479559', 'abishekdharmaraja@gmail.com', NULL, NULL, NULL, '', NULL, '2003-09-30', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'RAGHU DHARMARAJA', '94766224657', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-31 15:22:26', NULL),
(866, 1732, 'YGC/2022/0688', NULL, '2022-01-05', 'U G G', 'JANAKI', 'KUMARI', NULL, 'uploads/student_images/default_female.jpg', '94764741487', '', NULL, NULL, NULL, '', NULL, '2000-10-26', 'Female', NULL, NULL, '2', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '94766151669', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-01-31 15:29:45', NULL),
(867, 1734, 'YGC/2022/0707', NULL, '2022-02-05', 'MOHAMMED ASLAM', 'FATHIMA', 'SARA', NULL, 'uploads/student_images/default_female.jpg', '0754646811', 'saraaslam324@gmail.com', NULL, NULL, NULL, '', NULL, '1997-04-08', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'M.R.M.ASLAM', '0773343443', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-11 05:49:14', NULL),
(868, 1736, 'YGC/2022/0710', NULL, '2022-02-10', 'ROSHANI', 'MALISHA', 'JAYAWARDANA', NULL, 'uploads/student_images/default_female.jpg', '94779781655', 'roshanimalisha26@gmail.com', NULL, NULL, NULL, 'CATHOLIC', NULL, '2000-05-26', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'K D SHIROMA HAYASINTH', '94771672088', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-22 06:13:55', NULL),
(869, 1738, 'YGC/2022/0714', NULL, '2022-02-11', 'KAMBURUGAMUWE LOKU ARACHCHIGE CHAKRANGI', ' ', 'SANJA', NULL, 'uploads/student_images/default_female.jpg', '0719631201', 'chakrangisanja6@gmail.com', NULL, NULL, NULL, '', NULL, '1995-09-29', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'DUSHMANTHA AROSHA', '0724440211', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-18 05:06:12', NULL),
(870, 1740, 'YGC/2022/0717', NULL, '2022-02-12', 'K.H.ARSANI', '', '', NULL, 'uploads/student_images/default_female.jpg', '0773558846	', 'arsanikariyawasam00@gmail.com', NULL, NULL, NULL, '', NULL, '1999-09-30', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'H.T SHERMILA	', '0710414137', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-18 05:21:32', NULL),
(871, 1742, 'YGC/2022/0716', NULL, '2022-02-12', 'YOGYA DE COSTA', '', '', NULL, 'uploads/student_images/default_female.jpg', '0766572062', 'yogya2126@gmail.com', NULL, NULL, NULL, '', NULL, '1999-08-21', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'ISURU MADUSHAN 	', '0778475617', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-18 05:15:42', NULL),
(872, 1744, 'YGC/2022/0715 ', NULL, '2022-02-12', 'K.H ARSIKA', '', '', NULL, 'uploads/student_images/default_female.jpg', '0760071654', 'arsikakariyawasam00@gmail.com', NULL, NULL, NULL, '', NULL, '1999-09-30', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'H.T SHARMILA	', '0710414137	', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-18 05:22:02', NULL),
(873, 1746, 'YGC/2022/0718', NULL, '2022-02-12', 'M.A.D.A.Aravinda', '', '', NULL, 'uploads/student_images/default_male.jpg', '0719729578', 'aravinda2017lk@gmail.com', NULL, NULL, NULL, '', NULL, '1999-01-18', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'M.A.D.K.DHARMASIRI	', '071 758 8781', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-18 05:25:43', NULL),
(874, 1748, 'YGC/2022/0721', NULL, '2022-02-13', 'WADUWAWATHTHE GEDRARA. SHASHIN', '', ' NIMESHA ', NULL, 'uploads/student_images/default_male.jpg', '0765867443	', 'rux0887@gmail.com', NULL, NULL, NULL, '', NULL, '2001-02-20', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'VISHMI NIRASHA	', '0767641745', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-19 04:14:21', NULL),
(875, 1750, 'YGC/2022/0719', NULL, '2022-02-15', 'H', 'DILINI', 'SHRIMALI', NULL, 'uploads/student_images/default_female.jpg', '94756611035', 'dilinishrimali@gmail.com', NULL, NULL, NULL, 'BUDDHISM', NULL, '1999-01-08', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'M M A MANEL DAMAYANTHI', '94757149844', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-22 06:17:38', NULL),
(876, 1752, 'YGC/2022/0703', NULL, '2022-02-22', 'KURUGALA KANKANAMALAGE', 'DILKI ', 'HANSAMALI ', NULL, 'uploads/student_images/default_female.jpg', '775582538', '', NULL, NULL, NULL, '', NULL, '2001-10-25', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-22 06:40:04', NULL),
(877, 1754, 'YGC/2022/0720', NULL, '2022-02-15', 'J W K', 'SANDUNIKA', 'JAYASUNDARA', NULL, 'uploads/student_images/default_female.jpg', '94779666432', 'sandunikathilakshmi@gmail.com', NULL, NULL, NULL, '', NULL, '1994-02-03', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'T DAYANANDA JAYASUNDARA', '94765451038', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-22 08:29:55', NULL),
(878, 1756, 'YGC/2022/0727', NULL, '2022-02-22', 'K A', 'AMILA', 'LASANTHI', NULL, 'uploads/student_images/default_female.jpg', '94778320204', '', NULL, NULL, NULL, '', NULL, '1986-03-05', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'KASUN ARAVINDA', '94763024090', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-25 07:35:38', NULL),
(879, 1758, 'YGC/2022/0709', NULL, '2022-02-22', 'MELANI', 'NATASHA ', 'KRISHANI ', NULL, 'uploads/student_images/default_female.jpg', '0740827060', '', NULL, NULL, NULL, '', NULL, '2002-04-22', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'JAYANTHA ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-22 08:38:39', NULL),
(880, 1760, 'YGC/2022/0724', NULL, '2022-02-21', 'D M', 'CHETHANA', 'KULARATHNE', NULL, 'uploads/student_images/default_female.jpg', '94777970430', 'chethanakularathna547@gmail.com', NULL, NULL, NULL, '', NULL, '1998-09-10', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'D M SISIRA KULARATHNE', '94777582711', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-23 03:53:06', NULL),
(881, 1762, 'YGC/2022/0713', NULL, '2022-02-11', 'SAMARAWEERA', 'DENETH', 'VIHANGA', NULL, 'uploads/student_images/default_male.jpg', '94779139553', 'denekvihanga43@email.com', NULL, NULL, NULL, '', NULL, '2003-10-14', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'S NIROSHAN NALAKA', '94772176575', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-23 03:57:39', NULL),
(882, 1764, 'YGC/2022/0712', NULL, '2022-02-11', 'H DENETH', 'KAVEESH', 'SOYSA', NULL, 'uploads/student_images/default_male.jpg', '94778879553', 'denethkaveesh2@gmail.com', NULL, NULL, NULL, '', NULL, '2004-01-02', 'Male', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'M D KUMARI SANJEEWANI GUNATHILAKA', '94779091128', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-23 04:08:23', NULL),
(883, 1766, 'YGC/2022/0725', NULL, '2022-02-21', 'WEWALAGE YOHANI', 'BHAGYA CHATHURANGI ', 'FERNANDO', NULL, 'uploads/student_images/default_female.jpg', '94778564242', 'yohanifernando2003@gmail.com', NULL, NULL, NULL, '', NULL, '2003-04-12', 'Female', NULL, NULL, '4', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'DINUSHA SANJEEWANI DE SILVA', '94778564242', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-23 04:13:22', NULL),
(884, 1768, 'YGC/2022/0723', NULL, '2022-02-19', 'MADANA HITI BANDARALAGE SHANIKA MADHUSHANKI MADANA', '', '', NULL, 'uploads/student_images/default_female.jpg', '0719523828', 'shanikamdhushanki@gmail.com', NULL, NULL, NULL, '', NULL, '1995-12-26', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'R.A.H.M.YASAWATHI HERATH', '	0714796788', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-24 04:34:51', NULL),
(885, 1770, 'YGC/2022/0722', NULL, '2022-02-19', 'HEIYANTHUDUWAGE DONA NAYANARASHEE SESARANI', '', '', NULL, 'uploads/student_images/default_female.jpg', '0703552589', 'hdnsesarani@gmail.com', NULL, NULL, NULL, '', NULL, '1998-05-12', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'VIMUKTHI PEIRIS MALALASEKARA	', '0714839978', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-24 04:39:04', NULL),
(886, 1772, 'YGC/2022/0729', NULL, '2022-02-23', 'HETTIARACHCHIGE NIRUDI MADUSHIKA', '', '', NULL, 'uploads/student_images/default_female.jpg', '0778536320', 'nirudimadushika@gmail.com', NULL, NULL, NULL, '', NULL, '1994-05-27', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'SEETHA JAYANTHI	', '0778385201', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-25 04:55:24', NULL),
(887, 1774, 'YGC/2022/00001', NULL, '2022-02-23', 'NEI NISHAMA SABIN SAYAR', '', '', NULL, 'uploads/student_images/default_female.jpg', '0762267674', 'nishamasayar123@gmail.com', NULL, NULL, NULL, '', NULL, '2001-08-30', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'T. SABIN SAYAR	', '0716260860', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-24 04:44:49', NULL),
(888, 1776, 'YGC/2022/000101', NULL, '2022-02-24', 'WELA HETTIGE SANDUNIKA SATHSARANI RODRIGO', '', '', NULL, 'uploads/student_images/default_female.jpg', '0705070888', 'sandunikasr@gmail.com', NULL, NULL, NULL, '', NULL, '1994-04-11', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'N.L.P. RUWANTHI NARANGODA	', '0766756267', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-24 06:04:50', NULL),
(889, 1778, 'YGC/2022/0731', NULL, '2022-02-24', 'G H WEHANGA RASHMINI', '', '', NULL, 'uploads/student_images/default_female.jpg', '0718826397', 'samanthi390@gmail.com', NULL, NULL, NULL, '', NULL, '2004-05-11', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'P K G SAMANTHI  FERNANDO', '0712864367', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-25 04:55:54', NULL),
(890, 1780, 'YGC/2022/0733', NULL, NULL, 'ARAMPATHTHIGEI', 'NIMASHA THATHSARANI ', 'ARAMPATHTHI', NULL, 'uploads/student_images/default_female.jpg', '94750438057', 'nimashaarampaththi2001@gmail.com', NULL, NULL, NULL, '', NULL, '2001-10-11', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'A GUNASIRI', '94762273756', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-26 05:59:02', NULL),
(891, 1782, 'YGC/2022/00000111', NULL, '2022-02-25', 'MALMI', 'GAYASHINI', 'ATHUKORALA', NULL, 'uploads/student_images/default_female.jpg', '0756539509', 'mal.gayashi@gmail.com', NULL, NULL, NULL, '', NULL, '1999-06-05', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Mrs.Imalka Shiromi Perera	', '0722825922', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-25 09:39:27', NULL),
(892, 1784, '1000', NULL, '2022-02-26', 'PRUTHIVI', 'BASHITHA', 'PATHIRANA', NULL, 'uploads/student_images/default_male.jpg', '94756655607', 'bashithapathirana0000@gmail.com', NULL, NULL, NULL, '', NULL, '2003-05-03', 'Male', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'ANUSHA ASHINI PERERA', '94704076046', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-26 06:03:27', NULL),
(893, 1786, 'YGC/2022/0711', NULL, '2022-02-09', 'TANIYA', 'GIMHANI ', 'PUSHPARAJA', NULL, 'uploads/student_images/default_female.jpg', '0740213084', '', NULL, NULL, NULL, '', NULL, '2000-05-17', 'Female', NULL, NULL, '2', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'J.A JANAKI JAYAKODI ', '0757192057', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-28 03:53:07', NULL),
(894, 1788, 'YGC/2022/0613', NULL, '2021-11-15', 'H D NAWANJANA', 'MADUSHIKA', 'MUTHUKUMARANA', NULL, 'uploads/student_images/default_female.jpg', '94761327402', 'nwanjanamadushika@gmail.com', NULL, NULL, NULL, '', NULL, '2001-12-31', 'Female', NULL, NULL, '2', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-28 03:54:33', NULL),
(895, 1790, 'YGC/2022/0708', NULL, '2022-02-28', 'LOKU SINGAN', 'KUTTILAGE RAMINDA ', 'LAKSIRI', NULL, 'uploads/student_images/default_male.jpg', '0717414210', '', NULL, NULL, NULL, '', NULL, '1991-03-05', 'Male', NULL, NULL, '2', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-02-28 04:00:13', NULL),
(896, 1792, 'YGC/2022/000121', NULL, '2022-02-28', 'ANTONY MOSES', '', '', NULL, 'uploads/student_images/default_male.jpg', '0785977529', 'tamilwithantony123@gmail.com', NULL, NULL, NULL, '', NULL, '1992-11-16', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'M.Mariyay', '0763451655', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-01 03:22:03', NULL),
(897, 1794, 'YGC/2022/0010020', NULL, '2022-02-28', 'M. NIRMALA SHERIN NISHANI', '', '', NULL, 'uploads/student_images/default_female.jpg', '0769631143', 'sherinnishani0425@gmail.com', NULL, NULL, NULL, '', NULL, '1996-04-25', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'G.S.Dilshan Dabare	', '0778670475', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-01 03:27:37', NULL),
(898, 1796, 'YGC/2022/01010', NULL, '2022-02-28', 'VANAJA SURENDRAN', '', '', NULL, 'uploads/student_images/default_female.jpg', '0778934489', 'vanajasurendran530@gmail.com', NULL, NULL, NULL, '', NULL, '1998-09-12', 'Female', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'R.Manamohan 	', '0779455469', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-01 03:31:38', NULL),
(899, 1798, 'YGC/2022/0739', NULL, '2022-02-28', 'W DISNI', 'KAVINDYA', 'WANNIGAMA', NULL, 'uploads/student_images/default_female.jpg', '94767471573', 'disinikavindya@gmail.com', NULL, NULL, NULL, '', NULL, '1995-03-09', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'DILEEPA HEWAGE', '94768060823', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-03 10:55:35', NULL),
(900, 1800, 'YGC/2022/00014', NULL, '2022-02-28', 'KEKALELLAGE DASUN RIDMIKA SIRIWARDHANA', '', '', NULL, 'uploads/student_images/default_male.jpg', '0713300668', 'dasunsiriwardana8@gmail.com', NULL, NULL, NULL, '', NULL, '2000-05-05', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Kekalellage Viraj Siriwardhana	', '0702017191', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-01 03:35:20', NULL),
(901, 1802, 'YGC/2022/0744', NULL, '2022-02-28', 'ASHA', 'RUBAN', 'SURENDRA KUMAR', NULL, 'uploads/student_images/default_female.jpg', '94764175723', 'lakmini.lucky1993@gmail.com', NULL, NULL, NULL, '', NULL, '2000-03-06', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'K INDRANI ', '94767070712', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-05 06:51:21', NULL),
(902, 1804, 'YGC/2022/010201', NULL, '2022-02-28', 'THILINA GEEVINDA WICKRAMASEKARA', '', '', NULL, 'uploads/student_images/default_male.jpg', '0703971054', 'thilinageevinda@gmail.com', NULL, NULL, NULL, '', NULL, '2001-10-25', 'Male', NULL, NULL, '', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'G.Wickramasekara 	', '0719455795', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-01 03:37:27', NULL),
(903, 1806, 'YGC/2022/0742', NULL, '2022-03-01', 'T M NITHINA', 'HESHAN', 'THENNAKOON', NULL, 'uploads/student_images/default_male.jpg', '94719934776', 'nithina.tmn@gmail.com', NULL, NULL, NULL, '', NULL, '2001-07-02', 'Male', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'T M SUNIL THENNAKOON', '94717453126', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-05 06:53:31', NULL),
(904, 1808, 'YGC/2022/0726', NULL, '2022-03-01', 'KIRIPPOUWAGE', 'ERANDI ', 'ASHAMALI ', NULL, 'uploads/student_images/default_female.jpg', '0703800046', '', NULL, NULL, NULL, '', NULL, '1993-08-27', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-01 04:12:29', NULL),
(905, 1810, 'YGC/2022/0745', NULL, '2022-03-01', 'DISSANAYAKE MUDIYANSELAGE', 'ANURADHA AMANDI', 'DISSANAYAKE ', NULL, 'uploads/student_images/default_female.jpg', '0715205530', '', NULL, NULL, NULL, '', NULL, '2002-03-02', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-10 06:45:47', NULL),
(906, 1812, 'YGC/2022/0735', NULL, '2022-03-02', 'A', 'SURANI AMALI ', 'PERERA ', NULL, 'uploads/student_images/default_female.jpg', '0777366090', '', NULL, NULL, NULL, '', NULL, '1992-01-22', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-02 09:52:56', NULL),
(910, 1820, 'YGC/2022/1100', NULL, '2022-03-02', 'M G JANETHRI', 'CHALINIKA', 'SANJALEE WIJESINGHE', NULL, 'uploads/student_images/default_female.jpg', '94704872303', 'janusanjalee@gmail.com', NULL, NULL, NULL, '', NULL, '1999-10-04', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'DAMMIKA MANTHRIRATHNE', '94716593386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-03 10:59:23', NULL),
(911, 1822, 'YGC2022/0735', NULL, '2022-03-02', 'AMARASINGHE ARACHCHIGE', 'SURANI AMALI ', 'PERERA ', NULL, 'uploads/student_images/default_female.jpg', '0777366090', 'amalikur@gmail.com', NULL, NULL, NULL, '', NULL, '1979-03-31', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-04 06:44:42', NULL),
(915, 1830, 'YGC/2022/0747', NULL, '2022-03-02', 'PANCHALI', '', 'NANAYAKARA', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-11-04', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-25 05:09:06', NULL),
(916, 1832, 'YGC/2022/047', NULL, '2022-03-02', 'PANCHALI', '', 'NANAYAKARA', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2021-11-04', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-25 05:09:28', NULL),
(917, 1834, 'YGC/2022/0749', NULL, '2022-03-07', 'S.', 'RUWANDITH', '', NULL, 'uploads/student_images/default_male.jpg', '', '', NULL, NULL, NULL, '', NULL, '2022-03-09', 'Male', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-25 05:10:42', NULL),
(918, 1836, 'YGC/2022/0752', NULL, '2022-03-07', 'M', 'CHANTHUKA', '', NULL, 'uploads/student_images/default_male.jpg', '', '', NULL, NULL, NULL, '', NULL, '2022-03-02', 'Male', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-25 05:11:27', NULL),
(919, 1838, 'YGC/2022/0756', NULL, '2022-03-16', 'THILAKSHI', 'AMEESHA', '', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2022-03-08', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-25 05:12:34', NULL),
(920, 1840, 'YGC/2022/0757', NULL, '2022-03-19', 'K.N.', 'SHAVINDI', '', NULL, 'uploads/student_images/default_female.jpg', '', '', NULL, NULL, NULL, '', NULL, '2022-03-16', 'Female', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-25 05:13:23', NULL),
(921, 1842, 'YGC/2022/0758', NULL, '2022-03-22', 'CHATHUMINA', 'RAWISHAN', '', NULL, 'uploads/student_images/default_male.jpg', '', '', NULL, NULL, NULL, '', NULL, '2022-03-03', 'Male', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-25 05:14:10', NULL),
(922, 1844, 'YGC/2022/0610', NULL, '2022-03-26', 'HANSANA', 'RAVINDA', 'DASANAYAKA', NULL, 'uploads/student_images/default_male.jpg', '', 'hansanadasanayaka91@gmail.com', NULL, NULL, NULL, '', NULL, '2022-03-12', 'Male', NULL, NULL, '3', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'S.L.Dasanayaka', '0767268084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-03-26 06:07:51', NULL),
(924, 1848, 'YGC/2022/0790', NULL, '2022-05-22', 'HAPUARACCHIGE', 'MAVINDYA', 'PASINDI', NULL, 'uploads/student_images/default_female.jpg', '0718326653', 'Nadeehatr@gmail.com', NULL, NULL, NULL, 'Budhist', NULL, '2002-12-04', 'Female', NULL, NULL, '2', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', 'Nadeesha Tharangi', '0718326653', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2022-05-22 09:35:19', NULL),
(925, 1850, '123', NULL, '2023-01-18', '123', '123', '123', NULL, 'uploads/student_images/default_male.jpg', '123', '123@d.com', NULL, NULL, NULL, '123', NULL, '2022-12-31', 'Male', NULL, NULL, '5', 0, 0, '', 0, 0, '', NULL, NULL, NULL, NULL, '', '123', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', 'yes', NULL, '', '', '0000-00-00', 0, '', '', NULL, NULL, '0000-00-00', '2023-01-18 09:51:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_applyleave`
--

CREATE TABLE `student_applyleave` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `apply_date` date NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `docs` text NOT NULL,
  `reason` text NOT NULL,
  `approve_by` int(11) NOT NULL,
  `request_type` int(11) NOT NULL COMMENT '0 student,1 staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_attendences`
--

CREATE TABLE `student_attendences` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `biometric_attendence` int(1) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `remark` varchar(200) NOT NULL,
  `biometric_device_data` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_attendences`
--

INSERT INTO `student_attendences` (`id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 691, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(2, 690, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(3, 689, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(4, 687, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(5, 686, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(6, 685, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(7, 684, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(8, 683, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(9, 682, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(10, 681, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(11, 680, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(12, 679, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(13, 674, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(14, 673, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(15, 672, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(16, 671, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(17, 670, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(18, 669, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(19, 668, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(20, 667, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(21, 666, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(22, 664, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(23, 663, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(24, 662, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(25, 661, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(26, 660, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(27, 659, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(28, 658, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(29, 654, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(30, 653, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(31, 652, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(32, 619, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(33, 620, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(34, 688, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(35, 649, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(36, 648, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(37, 678, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(38, 647, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(39, 656, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(40, 676, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(41, 655, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(42, 665, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(43, 675, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(44, 650, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(45, 677, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL),
(46, 651, 0, '2022-03-06', 3, 'test', NULL, 'no', '2022-03-06 03:23:02', NULL),
(47, 657, 0, '2022-03-06', 1, '', NULL, 'no', '2022-03-06 03:22:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_doc`
--

CREATE TABLE `student_doc` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `doc` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_doc`
--

INSERT INTO `student_doc` (`id`, `student_id`, `title`, `doc`) VALUES
(1, 365, 'primary education assignment', 'PE.docx'),
(2, 365, 'english assighnment', 'English.pdf'),
(3, 365, 'english assighnment', 'English.pdf'),
(4, 365, 'English assignment', 'English.pdf'),
(5, 365, 'English assignment', 'English.pdf'),
(6, 365, 'English assignment', 'English.pdf'),
(7, 365, 'Methodology assignment', 'methodology_assignment_.pdf'),
(8, 365, 'Philosophy 2', 'philosophy_assignment_2.pdf'),
(9, 365, 'Philosophy 1', '77273_(1).pdf'),
(10, 365, 'Sociology assignment', 'th.pdf'),
(11, 365, 'Education technology assignment', 'ET.docx'),
(12, 365, 'Psychology assignment', 'New_Microsoft_Office_PowerPoint_Presentation_5.pdf'),
(13, 365, 'Psychology assignment 2', 'New_Microsoft_Office_PowerPoint_Presentation_1.pdf'),
(14, 365, 'සිංහල 1 assignment', 'සිංහල_1.pdf'),
(15, 365, 'සිංහල 2 assignment', 'සිංහල_2.pdf'),
(16, 365, 'සිංහල 3 assignment', 'සිංහල_3.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `student_edit_fields`
--

CREATE TABLE `student_edit_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees`
--

CREATE TABLE `student_fees` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `feemaster_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `amount_discount` float(10,2) NOT NULL,
  `amount_fine` float(10,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_deposite`
--

CREATE TABLE `student_fees_deposite` (
  `id` int(11) NOT NULL,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `amount_detail` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_fees_deposite`
--

INSERT INTO `student_fees_deposite` (`id`, `student_fees_master_id`, `fee_groups_feetype_id`, `amount_detail`, `is_active`, `created_at`) VALUES
(1, 1, 1, '{\"1\":{\"amount\":\"1000\",\"date\":\"2021-08-02\",\"amount_discount\":\"50\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Roshane Perera(1)\",\"payment_mode\":\"Cash\",\"received_by\":\"2\",\"inv_no\":1}}', 'no', '2021-08-02 18:15:29'),
(3, 144, 17, '{\"1\":{\"amount\":\"5000.00\",\"date\":\"2021-03-11\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-09 03:59:55'),
(4, 144, 16, '{\"1\":{\"amount\":\"400\",\"date\":\"2021-12-09\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-09 07:33:28'),
(6, 324, 34, '{\"1\":{\"amount\":\"100000\",\"date\":\"2021-11-01\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\" \'RC\\/11\\/01 \\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:49:27'),
(7, 323, 34, '{\"1\":{\"amount\":\"25000\",\"date\":\"2021-10-29\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/10\\/38\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1},\"2\":{\"amount\":\"75000\",\"date\":\"2021-11-24\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/11\\/29\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":2}}', 'no', '2021-12-17 11:50:46'),
(8, 325, 34, '{\"1\":{\"amount\":\"50000\",\"date\":\"2021-11-02\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\'\'RPC\\/11\\/13\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1},\"2\":{\"amount\":\"50000\",\"date\":\"2021-11-22\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\'\'RPC\\/11\\/72\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":2}}', 'no', '2021-12-17 11:51:51'),
(9, 326, 34, '{\"1\":{\"amount\":\"50000\",\"date\":\"2021-11-02\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\'\'RPC\\/11\\/08\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1},\"2\":{\"amount\":\"50000\",\"date\":\"2021-11-29\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\'\'RPC\\/11\\/88\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":2}}', 'no', '2021-12-17 11:53:07'),
(10, 327, 34, '{\"1\":{\"amount\":\"100000.00\",\"date\":\"2021-11-30\",\"description\":\"\'RPC\\/11\\/89\\r\\nSPECIAL DISCOUNT OFFERED Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:55:53'),
(11, 327, 35, '{\"1\":{\"amount\":\"35000.00\",\"date\":\"2021-11-30\",\"description\":\"\'RPC\\/11\\/89\\r\\nSPECIAL DISCOUNT OFFERED Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:55:53'),
(12, 327, 36, '{\"1\":{\"amount\":\"35000.00\",\"date\":\"2021-11-30\",\"description\":\"\'RPC\\/11\\/89\\r\\nSPECIAL DISCOUNT OFFERED Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:55:53'),
(13, 327, 37, '{\"1\":{\"amount\":\"35000.00\",\"date\":\"2021-11-30\",\"description\":\"\'RPC\\/11\\/89\\r\\nSPECIAL DISCOUNT OFFERED Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:55:53'),
(14, 327, 38, '{\"1\":{\"amount\":\"35000.00\",\"date\":\"2021-11-30\",\"description\":\"\'RPC\\/11\\/89\\r\\nSPECIAL DISCOUNT OFFERED Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:55:53'),
(15, 327, 39, '{\"1\":{\"amount\":\"35000.00\",\"date\":\"2021-11-30\",\"description\":\"\'RPC\\/11\\/89\\r\\nSPECIAL DISCOUNT OFFERED Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:55:53'),
(16, 327, 40, '{\"1\":{\"amount\":\"35000.00\",\"date\":\"2021-11-30\",\"description\":\"\'RPC\\/11\\/89\\r\\nSPECIAL DISCOUNT OFFERED Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:55:53'),
(17, 327, 41, '{\"1\":{\"amount\":\"35000.00\",\"date\":\"2021-11-30\",\"description\":\"\'RPC\\/11\\/89\\r\\nSPECIAL DISCOUNT OFFERED Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:55:53'),
(18, 327, 42, '{\"1\":{\"amount\":\"35000.00\",\"date\":\"2021-11-30\",\"description\":\"\'RPC\\/11\\/89\\r\\nSPECIAL DISCOUNT OFFERED Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:55:53'),
(19, 327, 43, '{\"1\":{\"amount\":\"35000.00\",\"date\":\"2021-11-30\",\"description\":\"\'RPC\\/11\\/89\\r\\nSPECIAL DISCOUNT OFFERED Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:55:53'),
(20, 327, 44, '{\"1\":{\"amount\":\"35000.00\",\"date\":\"2021-11-30\",\"description\":\"\'RPC\\/11\\/89\\r\\nSPECIAL DISCOUNT OFFERED Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2021-12-17 11:55:53'),
(21, 396, 45, '{\"1\":{\"amount\":\"6000\",\"date\":\"2021-11-10\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-09 03:11:56'),
(22, 419, 69, '{\"1\":{\"amount\":\"12000.00\",\"date\":\"2022-01-26\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 05:07:48'),
(24, 429, 69, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-01-31\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 05:28:57'),
(25, 435, 69, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 05:31:48'),
(26, 437, 69, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-01-12\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 05:32:46'),
(28, 439, 69, '{\"1\":{\"amount\":\"3000\",\"date\":\"2022-02-12\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 05:36:06'),
(29, 438, 69, '{\"1\":{\"amount\":\"9000.00\",\"date\":\"2022-02-12\",\"amount_discount\":\"3000.00\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 05:37:49'),
(30, 438, 70, '{\"1\":{\"amount\":\"6000.00\",\"date\":\"2022-02-12\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 05:41:58'),
(31, 438, 71, '{\"1\":{\"amount\":\"6000.00\",\"date\":\"2022-02-12\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 05:41:58'),
(32, 438, 72, '{\"1\":{\"amount\":\"6000.00\",\"date\":\"2022-02-12\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 05:41:58'),
(33, 441, 69, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-12\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 05:43:58'),
(34, 442, 69, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-17\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 05:46:44'),
(35, 443, 59, '{\"1\":{\"amount\":\"10000\",\"date\":\"2021-12-21\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 06:15:43'),
(36, 445, 59, '{\"1\":{\"amount\":\"5000\",\"date\":\"2022-01-24\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 06:16:52'),
(37, 446, 58, '{\"1\":{\"amount\":\"2500.00\",\"date\":\"2022-02-10\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 06:18:06'),
(38, 446, 59, '{\"1\":{\"amount\":\"10000.00\",\"date\":\"2022-02-10\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 06:18:06'),
(39, 444, 58, '{\"1\":{\"amount\":\"2500.00\",\"date\":\"2022-01-24\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 06:20:27'),
(40, 444, 59, '{\"1\":{\"amount\":\"10000.00\",\"date\":\"2022-01-24\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 06:20:27'),
(41, 447, 69, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-14\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 06:22:53'),
(44, 449, 59, '{\"1\":{\"amount\":\"5000\",\"date\":\"2022-01-29\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-22 07:52:30'),
(45, 463, 69, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-25\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-25 07:12:06'),
(46, 466, 74, '{\"1\":{\"amount\":\"12000.00\",\"date\":\"2022-02-23\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-02-25 07:46:41'),
(47, 503, 58, '{\"1\":{\"amount\":\"2500\",\"date\":\"2022-02-27\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-04 06:52:00'),
(48, 503, 59, '{\"1\":{\"amount\":\"10000.00\",\"date\":\"2022-03-02\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-04 07:01:15'),
(49, 503, 60, '{\"1\":{\"amount\":\"10000.00\",\"date\":\"2022-03-02\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-04 07:01:15'),
(50, 503, 61, '{\"1\":{\"amount\":\"10000.00\",\"date\":\"2022-03-02\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-04 07:01:15'),
(51, 503, 62, '{\"1\":{\"amount\":\"10000.00\",\"date\":\"2022-03-02\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-04 07:01:15'),
(52, 503, 63, '{\"1\":{\"amount\":\"10000.00\",\"date\":\"2022-03-02\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-04 07:01:15'),
(53, 503, 64, '{\"1\":{\"amount\":\"10000.00\",\"date\":\"2022-03-02\",\"description\":\" Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-04 07:01:15'),
(54, 507, 82, '{\"1\":{\"amount\":\"10000.00\",\"date\":\"2021-12-03\",\"description\":\"\'RC\\/12\\/01 Collected By: Kalani Panapitiya\",\"amount_discount\":0,\"amount_fine\":\"0\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-12 06:35:33'),
(55, 507, 83, '{\"1\":{\"amount\":\"8000\",\"date\":\"2022-02-28\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/22\\/02\\/23\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-12 06:41:57'),
(56, 419, 71, '{\"1\":{\"amount\":\"6000\",\"date\":\"2022-02-03\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-21 04:22:06'),
(57, 465, 74, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-03-21\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Jayanga KandeArachchi(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2022-03-21 08:01:20'),
(66, 3, 1, '{\"1\":{\"amount\":\"9900.00\",\"date\":\"2022-03-24\",\"amount_discount\":\"100.00\",\"amount_fine\":\"0\",\"description\":\"Demo\",\"collected_by\":\"Jayanga KandeArachchi(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2022-03-24 06:02:55'),
(67, 440, 69, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-03-25\",\"amount_discount\":\"0\",\"amount_fine\":\"1200\",\"description\":\"\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 04:08:20'),
(68, 518, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-01-26\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\'RC\\/22\\/01\\/14\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 05:41:47'),
(69, 518, 87, '{\"1\":{\"amount\":\"500\",\"date\":\"2022-01-26\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\'RC\\/22\\/01\\/14\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 05:42:06'),
(70, 519, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-01-31\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/22\\/01\\/21\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 05:44:36'),
(71, 521, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-07\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/22\\/02\\/04\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 05:45:15'),
(72, 522, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-12\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RPC\\/22\\/02\\/45\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 05:45:47'),
(73, 533, 94, '{\"1\":{\"amount\":\"6000\",\"date\":\"2022-01-24\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/22\\/01\\/12\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 06:13:01'),
(74, 524, 86, '{\"1\":{\"amount\":\"3000\",\"date\":\"2022-02-12\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\'RPC\\/22\\/02\\/47\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1},\"2\":{\"amount\":\"9000\",\"date\":\"2022-02-28\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/22\\/02\\/26\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":2}}', 'no', '2022-03-25 06:21:54'),
(75, 526, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-12\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RPC\\/22\\/02\\/50\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 06:22:35'),
(76, 525, 89, '{\"1\":{\"amount\":\"3000\",\"date\":\"2022-03-25\",\"amount_discount\":\"3000.00\",\"amount_fine\":\"0\",\"description\":\"\",\"collected_by\":\"Jayanga KandeArachchi(9000)\",\"payment_mode\":\"Cash\",\"received_by\":\"1\",\"inv_no\":1}}', 'no', '2022-03-25 06:26:21'),
(77, 528, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-14\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/22\\/02\\/16\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 06:30:41'),
(78, 527, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-17\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RPC\\/22\\/02\\/57\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 06:31:16'),
(79, 529, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-19\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RPC\\/22\\/02\\/70\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 06:31:59'),
(80, 530, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-24\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RPC\\/22\\/02\\/82\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 06:32:27'),
(81, 531, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-24\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RPC\\/22\\/02\\/84\\n\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 06:33:13'),
(82, 532, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-02-28\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/22\\/02\\/30\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 06:33:50'),
(83, 515, 86, '{\"1\":{\"amount\":\"5000\",\"date\":\"2022-03-16\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RPC\\/22\\/03\\/41\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 06:34:31'),
(84, 516, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-03-19\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RPC\\/22\\/03\\/45\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 06:35:10'),
(85, 517, 86, '{\"1\":{\"amount\":\"12000\",\"date\":\"2022-03-22\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RPC\\/22\\/03\\/48\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-25 06:35:46'),
(86, 507, 84, '{\"1\":{\"amount\":\"7000\",\"date\":\"2022-03-25\",\"amount_discount\":\"0\",\"amount_fine\":\"700\",\"description\":\"Commercial Bank\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-26 05:55:40'),
(87, 534, 82, '{\"1\":{\"amount\":\"10000\",\"date\":\"2021-11-15\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/11\\/11\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-26 06:09:46'),
(88, 534, 83, '{\"1\":{\"amount\":\"8000\",\"date\":\"2022-03-26\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"\'2021\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-26 06:10:27'),
(89, 534, 84, '{\"1\":{\"amount\":\"7000\",\"date\":\"2022-03-26\",\"amount_discount\":\"0\",\"amount_fine\":\"700\",\"description\":\"\'2021\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"Cash\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-26 06:10:39'),
(91, 509, 83, '{\"1\":{\"amount\":\"8000\",\"date\":\"2022-02-24\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/22\\/02\\/19\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-26 06:46:28'),
(92, 509, 82, '{\"1\":{\"amount\":\"10000\",\"date\":\"2021-11-22\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RC\\/11\\/26\\n\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-26 06:47:05'),
(93, 488, 58, '{\"1\":{\"amount\":\"2500\",\"date\":\"2022-02-17\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RPC\\/22\\/02\\/55\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-28 06:13:03'),
(94, 488, 59, '{\"1\":{\"amount\":\"10000\",\"date\":\"2022-02-28\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\"RPC\\/22\\/02\\/97\",\"collected_by\":\"Kalani Panapitiya(YGC\\/S\\/003)\",\"payment_mode\":\"bank_transfer\",\"received_by\":\"4\",\"inv_no\":1}}', 'no', '2022-03-28 06:13:23');

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_discounts`
--

CREATE TABLE `student_fees_discounts` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `fees_discount_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'assigned',
  `payment_id` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_fees_discounts`
--

INSERT INTO `student_fees_discounts` (`id`, `student_session_id`, `fees_discount_id`, `status`, `payment_id`, `description`, `is_active`, `created_at`) VALUES
(6, 786, 4, 'assigned', NULL, NULL, 'no', '2021-12-17 11:57:48'),
(7, 787, 4, 'assigned', NULL, NULL, 'no', '2021-12-17 11:57:48'),
(8, 788, 4, 'assigned', NULL, NULL, 'no', '2021-12-17 11:57:48'),
(9, 789, 4, 'assigned', NULL, NULL, 'no', '2021-12-17 11:57:48'),
(10, 790, 5, 'assigned', NULL, NULL, 'no', '2021-12-17 11:59:24'),
(11, 904, 8, 'applied', '29//1', '', 'no', '2022-02-22 05:37:49'),
(12, 906, 8, 'applied', '76//1', '', 'no', '2022-03-25 06:26:21'),
(13, 945, 9, 'assigned', NULL, NULL, 'no', '2022-03-04 06:49:39'),
(14, 615, 10, 'applied', '66//1', 'Demo', 'no', '2022-03-24 06:02:55'),
(15, 949, 8, 'assigned', NULL, NULL, 'no', '2022-03-25 05:27:46'),
(16, 951, 8, 'assigned', NULL, NULL, 'no', '2022-03-25 05:27:46'),
(17, 952, 8, 'assigned', NULL, NULL, 'no', '2022-03-25 05:27:46');

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_master`
--

CREATE TABLE `student_fees_master` (
  `id` int(11) NOT NULL,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `student_session_id` int(11) DEFAULT NULL,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT 0.00,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_fees_master`
--

INSERT INTO `student_fees_master` (`id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES
(1, 0, 1, 1, 0.00, 'no', '2021-08-01 18:30:13'),
(2, 0, 614, 1, 0.00, 'no', '2021-08-30 08:24:00'),
(3, 0, 615, 1, 0.00, 'no', '2021-08-30 08:31:23'),
(4, 0, 616, 1, 0.00, 'no', '2021-08-31 17:33:05'),
(5, 0, 617, NULL, 0.00, 'no', '2021-09-13 06:30:05'),
(6, 0, 618, NULL, 0.00, 'no', '2021-09-13 06:43:35'),
(7, 0, 619, NULL, 0.00, 'no', '2021-09-13 07:10:16'),
(8, 0, 621, NULL, 0.00, 'no', '2021-09-22 05:02:29'),
(9, 0, 622, NULL, 0.00, 'no', '2021-09-22 05:31:17'),
(10, 0, 623, NULL, 0.00, 'no', '2021-09-22 05:35:51'),
(11, 0, 624, NULL, 0.00, 'no', '2021-09-22 05:38:59'),
(12, 0, 625, NULL, 0.00, 'no', '2021-09-22 05:41:47'),
(13, 0, 626, NULL, 0.00, 'no', '2021-09-22 05:44:28'),
(14, 0, 627, NULL, 0.00, 'no', '2021-09-22 05:47:17'),
(15, 0, 628, NULL, 0.00, 'no', '2021-09-22 05:53:11'),
(16, 0, 629, NULL, 0.00, 'no', '2021-09-22 05:56:28'),
(17, 0, 630, NULL, 0.00, 'no', '2021-09-22 06:02:24'),
(18, 0, 631, NULL, 0.00, 'no', '2021-09-22 06:05:15'),
(19, 0, 632, NULL, 0.00, 'no', '2021-09-22 06:08:21'),
(20, 0, 633, NULL, 0.00, 'no', '2021-09-22 06:23:13'),
(21, 0, 634, NULL, 0.00, 'no', '2021-09-22 06:28:10'),
(22, 0, 635, NULL, 0.00, 'no', '2021-09-22 06:30:51'),
(23, 0, 636, NULL, 0.00, 'no', '2021-09-22 06:33:36'),
(24, 0, 637, NULL, 0.00, 'no', '2021-09-22 06:37:18'),
(25, 0, 638, NULL, 0.00, 'no', '2021-09-22 06:40:36'),
(26, 0, 639, NULL, 0.00, 'no', '2021-09-22 06:42:58'),
(27, 0, 640, NULL, 0.00, 'no', '2021-09-22 06:44:57'),
(28, 0, 641, NULL, 0.00, 'no', '2021-09-22 06:48:31'),
(29, 0, 642, NULL, 0.00, 'no', '2021-09-22 06:50:43'),
(30, 0, 643, NULL, 0.00, 'no', '2021-09-22 06:53:19'),
(31, 0, 644, NULL, 0.00, 'no', '2021-09-22 09:24:12'),
(32, 0, 645, NULL, 0.00, 'no', '2021-09-22 09:27:48'),
(33, 0, 646, NULL, 0.00, 'no', '2021-09-22 09:30:33'),
(34, 0, 652, NULL, 0.00, 'no', '2021-09-23 06:24:05'),
(35, 0, 653, NULL, 0.00, 'no', '2021-09-23 06:26:16'),
(36, 0, 654, NULL, 0.00, 'no', '2021-09-23 06:28:29'),
(37, 0, 658, NULL, 0.00, 'no', '2021-09-23 06:39:19'),
(38, 0, 659, NULL, 0.00, 'no', '2021-09-23 06:41:12'),
(39, 0, 660, NULL, 0.00, 'no', '2021-09-23 06:43:11'),
(40, 0, 661, NULL, 0.00, 'no', '2021-09-23 06:44:46'),
(41, 0, 662, NULL, 0.00, 'no', '2021-09-23 06:46:16'),
(42, 0, 663, NULL, 0.00, 'no', '2021-09-23 06:47:50'),
(43, 0, 664, NULL, 0.00, 'no', '2021-09-23 06:49:08'),
(44, 0, 666, NULL, 0.00, 'no', '2021-09-23 06:56:24'),
(45, 0, 667, NULL, 0.00, 'no', '2021-09-23 06:57:54'),
(46, 0, 668, NULL, 0.00, 'no', '2021-09-23 06:59:17'),
(47, 0, 669, NULL, 0.00, 'no', '2021-09-23 07:00:44'),
(48, 0, 670, NULL, 0.00, 'no', '2021-09-23 07:02:35'),
(49, 0, 671, NULL, 0.00, 'no', '2021-09-23 07:03:56'),
(50, 0, 672, NULL, 0.00, 'no', '2021-09-23 07:05:12'),
(51, 0, 673, NULL, 0.00, 'no', '2021-09-23 07:06:27'),
(52, 0, 674, NULL, 0.00, 'no', '2021-09-23 07:07:51'),
(53, 0, 679, NULL, 0.00, 'no', '2021-09-23 07:22:02'),
(54, 0, 680, NULL, 0.00, 'no', '2021-09-23 07:23:22'),
(55, 0, 681, NULL, 0.00, 'no', '2021-09-23 07:24:35'),
(56, 0, 682, NULL, 0.00, 'no', '2021-09-23 07:25:43'),
(57, 0, 683, NULL, 0.00, 'no', '2021-09-23 07:27:07'),
(58, 0, 684, NULL, 0.00, 'no', '2021-09-23 07:28:25'),
(59, 0, 685, NULL, 0.00, 'no', '2021-09-23 07:29:46'),
(60, 0, 686, NULL, 0.00, 'no', '2021-09-23 07:31:01'),
(61, 0, 687, NULL, 0.00, 'no', '2021-09-23 07:32:18'),
(62, 0, 689, NULL, 0.00, 'no', '2021-09-23 07:39:42'),
(63, 0, 690, NULL, 0.00, 'no', '2021-09-23 07:41:09'),
(64, 0, 691, NULL, 0.00, 'no', '2021-09-23 07:42:42'),
(65, 0, 696, NULL, 0.00, 'no', '2021-09-24 07:51:14'),
(66, 0, 697, NULL, 0.00, 'no', '2021-09-24 07:54:50'),
(67, 0, 698, NULL, 0.00, 'no', '2021-09-24 07:58:18'),
(68, 0, 703, NULL, 0.00, 'no', '2021-09-24 10:32:31'),
(69, 0, 704, NULL, 0.00, 'no', '2021-09-24 10:34:10'),
(70, 0, 705, NULL, 0.00, 'no', '2021-09-24 10:35:44'),
(71, 0, 706, NULL, 0.00, 'no', '2021-09-24 10:37:18'),
(72, 0, 707, NULL, 0.00, 'no', '2021-09-24 10:38:51'),
(73, 0, 708, NULL, 0.00, 'no', '2021-09-24 10:40:22'),
(74, 0, 709, NULL, 0.00, 'no', '2021-09-24 10:41:41'),
(75, 0, 710, NULL, 0.00, 'no', '2021-09-27 07:42:18'),
(76, 0, 711, NULL, 0.00, 'no', '2021-09-27 07:43:17'),
(77, 0, 712, NULL, 0.00, 'no', '2021-09-27 07:44:06'),
(78, 0, 713, NULL, 0.00, 'no', '2021-09-27 07:45:15'),
(79, 0, 714, NULL, 0.00, 'no', '2021-09-27 07:46:09'),
(80, 0, 715, NULL, 0.00, 'no', '2021-09-27 08:05:46'),
(81, 0, 716, NULL, 0.00, 'no', '2021-09-27 08:06:39'),
(82, 0, 717, NULL, 0.00, 'no', '2021-09-27 08:07:43'),
(83, 0, 718, NULL, 0.00, 'no', '2021-09-27 08:09:01'),
(84, 0, 719, NULL, 0.00, 'no', '2021-09-27 08:10:30'),
(85, 0, 720, NULL, 0.00, 'no', '2021-09-27 08:12:33'),
(86, 0, 721, NULL, 0.00, 'no', '2021-09-27 08:14:22'),
(87, 0, 722, NULL, 0.00, 'no', '2021-09-27 08:16:28'),
(88, 0, 723, NULL, 0.00, 'no', '2021-09-27 08:17:53'),
(89, 0, 724, NULL, 0.00, 'no', '2021-09-27 08:19:13'),
(90, 0, 725, NULL, 0.00, 'no', '2021-09-27 08:21:37'),
(91, 0, 726, NULL, 0.00, 'no', '2021-09-27 08:22:57'),
(92, 0, 727, NULL, 0.00, 'no', '2021-09-27 08:29:08'),
(93, 0, 728, NULL, 0.00, 'no', '2021-09-27 08:31:25'),
(94, 0, 729, NULL, 0.00, 'no', '2021-09-27 08:32:47'),
(95, 0, 730, NULL, 0.00, 'no', '2021-09-27 08:35:38'),
(96, 0, 731, NULL, 0.00, 'no', '2021-09-27 08:36:50'),
(97, 0, 732, NULL, 0.00, 'no', '2021-09-27 08:37:51'),
(98, 0, 733, NULL, 0.00, 'no', '2021-09-27 08:38:47'),
(99, 0, 734, NULL, 0.00, 'no', '2021-09-27 08:39:37'),
(100, 0, 735, NULL, 0.00, 'no', '2021-09-27 08:40:28'),
(101, 0, 736, NULL, 0.00, 'no', '2021-09-27 08:41:19'),
(102, 0, 737, NULL, 0.00, 'no', '2021-09-27 08:42:07'),
(103, 0, 738, NULL, 0.00, 'no', '2021-09-27 08:43:35'),
(104, 0, 739, NULL, 0.00, 'no', '2021-09-27 08:45:07'),
(105, 0, 740, NULL, 0.00, 'no', '2021-09-27 08:46:03'),
(106, 0, 741, NULL, 0.00, 'no', '2021-09-27 08:48:00'),
(107, 0, 742, NULL, 0.00, 'no', '2021-09-27 08:49:05'),
(108, 0, 748, NULL, 0.00, 'no', '2021-09-27 09:15:28'),
(109, 0, 749, NULL, 0.00, 'no', '2021-09-27 09:19:12'),
(110, 0, 750, NULL, 0.00, 'no', '2021-09-27 09:20:45'),
(111, 0, 751, NULL, 0.00, 'no', '2021-09-27 09:21:53'),
(112, 0, 752, NULL, 0.00, 'no', '2021-09-27 09:23:16'),
(113, 0, 753, NULL, 0.00, 'no', '2021-09-27 09:24:39'),
(114, 0, 754, NULL, 0.00, 'no', '2021-09-27 09:26:14'),
(115, 0, 755, NULL, 0.00, 'no', '2021-09-27 09:27:51'),
(116, 0, 756, NULL, 0.00, 'no', '2021-09-27 09:29:45'),
(117, 0, 757, NULL, 0.00, 'no', '2021-09-27 09:31:11'),
(118, 0, 758, NULL, 0.00, 'no', '2021-09-27 09:32:34'),
(119, 0, 760, NULL, 0.00, 'no', '2021-09-27 09:37:07'),
(120, 0, 761, NULL, 0.00, 'no', '2021-09-27 09:40:54'),
(121, 0, 762, NULL, 0.00, 'no', '2021-09-27 09:42:15'),
(122, 0, 764, NULL, 0.00, 'no', '2021-09-28 05:05:33'),
(123, 0, 765, NULL, 0.00, 'no', '2021-09-28 05:16:07'),
(124, 0, 766, NULL, 0.00, 'no', '2021-09-28 05:18:11'),
(125, 0, 767, NULL, 0.00, 'no', '2021-09-28 05:19:28'),
(126, 0, 768, NULL, 0.00, 'no', '2021-09-28 05:20:46'),
(127, 0, 769, NULL, 0.00, 'no', '2021-09-28 05:27:43'),
(128, 0, 770, NULL, 0.00, 'no', '2021-09-28 06:24:16'),
(129, 0, 771, NULL, 0.00, 'no', '2021-09-28 06:27:08'),
(130, 0, 772, NULL, 0.00, 'no', '2021-09-28 06:28:43'),
(131, 0, 773, NULL, 0.00, 'no', '2021-09-28 06:30:16'),
(132, 0, 774, NULL, 0.00, 'no', '2021-09-28 06:31:42'),
(133, 0, 775, NULL, 0.00, 'no', '2021-09-28 06:49:55'),
(134, 0, 776, NULL, 0.00, 'no', '2021-09-28 06:51:56'),
(135, 0, 777, NULL, 0.00, 'no', '2021-09-28 06:54:27'),
(136, 0, 778, NULL, 0.00, 'no', '2021-09-28 08:08:49'),
(137, 0, 779, NULL, 0.00, 'no', '2021-09-28 08:10:13'),
(138, 0, 780, NULL, 0.00, 'no', '2021-09-28 08:11:43'),
(139, 0, 781, NULL, 0.00, 'no', '2021-09-28 08:12:54'),
(140, 0, 782, NULL, 0.00, 'no', '2021-09-28 08:14:23'),
(141, 0, 783, NULL, 0.00, 'no', '2021-09-28 08:20:28'),
(142, 0, 784, 1, 0.00, 'no', '2021-11-29 04:53:14'),
(143, 0, 785, 1, 0.00, 'no', '2021-11-29 04:55:33'),
(144, 0, 617, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(145, 0, 618, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(146, 0, 621, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(147, 0, 622, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(148, 0, 623, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(149, 0, 624, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(150, 0, 625, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(151, 0, 626, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(152, 0, 627, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(153, 0, 628, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(154, 0, 629, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(155, 0, 630, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(156, 0, 631, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(157, 0, 632, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(158, 0, 633, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(159, 0, 634, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(160, 0, 635, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(161, 0, 636, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(162, 0, 637, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(163, 0, 638, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(164, 0, 639, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(165, 0, 640, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(166, 0, 641, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(167, 0, 642, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(168, 0, 643, 6, 0.00, 'no', '2021-12-08 12:26:21'),
(169, 0, 743, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(170, 0, 744, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(171, 0, 745, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(172, 0, 746, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(173, 0, 747, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(174, 0, 759, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(175, 0, 644, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(176, 0, 645, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(177, 0, 646, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(178, 0, 696, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(179, 0, 697, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(180, 0, 698, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(181, 0, 748, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(182, 0, 749, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(183, 0, 750, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(184, 0, 751, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(185, 0, 752, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(186, 0, 753, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(187, 0, 754, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(188, 0, 755, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(189, 0, 756, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(190, 0, 757, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(191, 0, 758, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(192, 0, 760, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(193, 0, 761, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(194, 0, 762, 6, 0.00, 'no', '2021-12-08 12:27:06'),
(195, 0, 657, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(196, 0, 651, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(197, 0, 677, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(198, 0, 650, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(199, 0, 675, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(200, 0, 665, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(201, 0, 655, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(202, 0, 676, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(203, 0, 656, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(204, 0, 647, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(205, 0, 678, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(206, 0, 648, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(207, 0, 649, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(208, 0, 688, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(209, 0, 620, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(210, 0, 619, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(211, 0, 652, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(212, 0, 653, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(213, 0, 654, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(214, 0, 658, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(215, 0, 659, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(216, 0, 660, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(217, 0, 661, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(218, 0, 662, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(219, 0, 663, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(220, 0, 664, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(221, 0, 666, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(222, 0, 667, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(223, 0, 668, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(224, 0, 669, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(225, 0, 670, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(226, 0, 671, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(227, 0, 672, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(228, 0, 673, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(229, 0, 674, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(230, 0, 679, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(231, 0, 680, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(232, 0, 681, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(233, 0, 682, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(234, 0, 683, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(235, 0, 684, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(236, 0, 685, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(237, 0, 686, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(238, 0, 687, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(239, 0, 689, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(240, 0, 690, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(241, 0, 691, 8, 0.00, 'no', '2021-12-08 12:28:05'),
(242, 0, 700, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(243, 0, 701, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(244, 0, 699, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(245, 0, 692, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(246, 0, 693, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(247, 0, 694, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(248, 0, 695, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(249, 0, 702, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(250, 0, 703, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(251, 0, 704, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(252, 0, 705, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(253, 0, 706, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(254, 0, 707, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(255, 0, 708, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(256, 0, 709, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(257, 0, 710, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(258, 0, 711, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(259, 0, 712, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(260, 0, 713, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(261, 0, 714, 9, 0.00, 'no', '2021-12-08 12:28:23'),
(262, 0, 715, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(263, 0, 716, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(264, 0, 717, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(265, 0, 718, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(266, 0, 719, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(267, 0, 720, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(268, 0, 721, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(269, 0, 722, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(270, 0, 723, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(271, 0, 724, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(272, 0, 725, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(273, 0, 726, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(274, 0, 727, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(275, 0, 728, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(276, 0, 729, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(277, 0, 730, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(278, 0, 731, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(279, 0, 732, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(280, 0, 733, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(281, 0, 734, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(282, 0, 735, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(283, 0, 736, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(284, 0, 737, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(285, 0, 738, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(286, 0, 739, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(287, 0, 740, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(288, 0, 741, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(289, 0, 742, 10, 0.00, 'no', '2021-12-08 12:28:59'),
(290, 0, 521, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(291, 0, 522, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(292, 0, 523, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(293, 0, 524, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(294, 0, 525, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(295, 0, 526, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(296, 0, 527, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(297, 0, 528, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(298, 0, 529, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(299, 0, 530, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(300, 0, 531, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(301, 0, 532, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(302, 0, 533, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(303, 0, 534, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(304, 0, 535, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(305, 0, 536, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(306, 0, 537, 12, 0.00, 'no', '2021-12-08 12:29:40'),
(307, 0, 538, 13, 0.00, 'no', '2021-12-08 12:30:02'),
(308, 0, 539, 13, 0.00, 'no', '2021-12-08 12:30:02'),
(309, 0, 540, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(310, 0, 541, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(311, 0, 542, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(312, 0, 543, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(313, 0, 544, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(314, 0, 545, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(315, 0, 546, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(316, 0, 547, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(317, 0, 548, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(318, 0, 549, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(319, 0, 550, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(320, 0, 551, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(321, 0, 552, 13, 0.00, 'no', '2021-12-08 12:30:03'),
(322, 0, 786, NULL, 0.00, 'no', '2021-12-17 11:20:26'),
(323, 0, 786, 15, 0.00, 'no', '2021-12-17 11:34:30'),
(324, 0, 787, 15, 0.00, 'no', '2021-12-17 11:38:33'),
(325, 0, 788, 15, 0.00, 'no', '2021-12-17 11:40:17'),
(326, 0, 789, 15, 0.00, 'no', '2021-12-17 11:42:16'),
(327, 0, 790, 15, 0.00, 'no', '2021-12-17 11:46:51'),
(328, 0, 791, 16, 0.00, 'no', '2021-12-30 09:51:04'),
(329, 0, 792, NULL, 0.00, 'no', '2021-12-30 09:56:50'),
(330, 0, 793, 16, 0.00, 'no', '2021-12-30 10:05:26'),
(331, 0, 794, 16, 0.00, 'no', '2021-12-30 10:09:29'),
(332, 0, 795, 16, 0.00, 'no', '2021-12-30 10:13:00'),
(333, 0, 796, 16, 0.00, 'no', '2021-12-30 10:16:03'),
(334, 0, 797, 16, 0.00, 'no', '2021-12-30 10:19:00'),
(335, 0, 798, 16, 0.00, 'no', '2021-12-30 10:21:33'),
(336, 0, 799, 16, 0.00, 'no', '2021-12-30 10:24:36'),
(337, 0, 800, 16, 0.00, 'no', '2021-12-30 10:27:50'),
(338, 0, 801, 16, 0.00, 'no', '2021-12-30 10:30:26'),
(339, 0, 802, 16, 0.00, 'no', '2021-12-30 10:32:25'),
(340, 0, 803, 16, 0.00, 'no', '2021-12-30 10:35:09'),
(341, 0, 804, 16, 0.00, 'no', '2021-12-30 10:37:32'),
(342, 0, 805, 16, 0.00, 'no', '2021-12-30 10:44:23'),
(343, 0, 806, 16, 0.00, 'no', '2021-12-30 11:12:34'),
(344, 0, 807, NULL, 0.00, 'no', '2021-12-30 11:19:55'),
(345, 0, 808, NULL, 0.00, 'no', '2021-12-30 11:23:04'),
(346, 0, 809, NULL, 0.00, 'no', '2021-12-30 11:26:03'),
(347, 0, 810, NULL, 0.00, 'no', '2021-12-30 14:07:19'),
(348, 0, 811, NULL, 0.00, 'no', '2021-12-30 14:11:39'),
(349, 0, 812, NULL, 0.00, 'no', '2021-12-30 14:16:02'),
(350, 0, 813, 16, 0.00, 'no', '2021-12-30 14:20:30'),
(351, 0, 814, NULL, 0.00, 'no', '2021-12-31 02:58:25'),
(352, 0, 815, NULL, 0.00, 'no', '2021-12-31 03:02:40'),
(353, 0, 816, NULL, 0.00, 'no', '2021-12-31 03:16:00'),
(354, 0, 817, NULL, 0.00, 'no', '2021-12-31 03:20:04'),
(355, 0, 818, NULL, 0.00, 'no', '2021-12-31 03:24:04'),
(356, 0, 819, NULL, 0.00, 'no', '2021-12-31 03:26:33'),
(357, 0, 820, NULL, 0.00, 'no', '2021-12-31 03:29:41'),
(358, 0, 821, NULL, 0.00, 'no', '2021-12-31 03:32:25'),
(359, 0, 822, NULL, 0.00, 'no', '2021-12-31 03:34:54'),
(360, 0, 823, NULL, 0.00, 'no', '2021-12-31 03:38:14'),
(361, 0, 824, NULL, 0.00, 'no', '2021-12-31 03:40:59'),
(362, 0, 825, NULL, 0.00, 'no', '2021-12-31 03:45:47'),
(363, 0, 826, NULL, 0.00, 'no', '2021-12-31 03:49:05'),
(364, 0, 827, 14, 0.00, 'no', '2021-12-31 04:08:29'),
(365, 0, 828, 14, 0.00, 'no', '2021-12-31 04:11:16'),
(366, 0, 829, 14, 0.00, 'no', '2021-12-31 04:14:27'),
(367, 0, 830, 14, 0.00, 'no', '2021-12-31 04:18:02'),
(368, 0, 831, 14, 0.00, 'no', '2021-12-31 04:20:30'),
(369, 0, 832, 14, 0.00, 'no', '2021-12-31 04:23:03'),
(370, 0, 833, 14, 0.00, 'no', '2021-12-31 04:25:30'),
(371, 0, 834, 14, 0.00, 'no', '2021-12-31 04:28:12'),
(372, 0, 835, 14, 0.00, 'no', '2021-12-31 04:31:17'),
(373, 0, 836, 14, 0.00, 'no', '2021-12-31 04:34:23'),
(374, 0, 837, 14, 0.00, 'no', '2021-12-31 04:38:07'),
(375, 0, 838, 14, 0.00, 'no', '2021-12-31 04:40:52'),
(376, 0, 839, 14, 0.00, 'no', '2021-12-31 04:43:12'),
(377, 0, 840, 13, 0.00, 'no', '2021-12-31 04:50:52'),
(378, 0, 841, 13, 0.00, 'no', '2021-12-31 04:56:00'),
(379, 0, 842, 13, 0.00, 'no', '2021-12-31 04:59:24'),
(380, 0, 843, 5, 0.00, 'no', '2021-12-31 05:11:31'),
(381, 0, 844, 5, 0.00, 'no', '2021-12-31 05:16:13'),
(382, 0, 845, 5, 0.00, 'no', '2021-12-31 05:30:06'),
(383, 0, 846, NULL, 0.00, 'no', '2021-12-31 07:40:23'),
(384, 0, 847, NULL, 0.00, 'no', '2021-12-31 07:48:53'),
(385, 0, 848, NULL, 0.00, 'no', '2021-12-31 07:53:30'),
(386, 0, 849, 15, 0.00, 'no', '2022-01-03 04:53:05'),
(387, 0, 850, 15, 0.00, 'no', '2022-01-03 04:59:53'),
(388, 0, 851, NULL, 0.00, 'no', '2022-01-03 05:03:19'),
(389, 0, 852, NULL, 0.00, 'no', '2022-01-03 08:23:23'),
(390, 0, 853, NULL, 0.00, 'no', '2022-01-03 08:32:17'),
(391, 0, 854, NULL, 0.00, 'no', '2022-01-03 08:51:48'),
(392, 0, 859, 16, 0.00, 'no', '2022-01-03 11:33:10'),
(393, 0, 860, 16, 0.00, 'no', '2022-01-03 11:39:33'),
(394, 0, 861, NULL, 0.00, 'no', '2022-01-04 04:36:57'),
(395, 0, 862, 16, 0.00, 'no', '2022-01-04 05:10:38'),
(396, 0, 863, 16, 0.00, 'no', '2022-01-04 05:16:52'),
(397, 0, 864, 16, 0.00, 'no', '2022-01-04 05:24:29'),
(398, 0, 865, 16, 0.00, 'no', '2022-01-04 05:31:54'),
(399, 0, 866, 16, 0.00, 'no', '2022-01-04 05:38:01'),
(400, 0, 867, 14, 0.00, 'no', '2022-01-04 08:46:01'),
(401, 0, 868, 14, 0.00, 'no', '2022-01-04 09:54:06'),
(402, 0, 869, 16, 0.00, 'no', '2022-01-04 10:00:43'),
(403, 0, 870, 14, 0.00, 'no', '2022-01-04 10:03:49'),
(404, 0, 871, 14, 0.00, 'no', '2022-01-04 10:08:26'),
(405, 0, 872, 14, 0.00, 'no', '2022-01-04 10:12:56'),
(406, 0, 855, 16, 0.00, 'no', '2022-01-05 05:49:04'),
(407, 0, 873, 16, 0.00, 'no', '2022-01-05 06:41:29'),
(408, 0, 874, 16, 0.00, 'no', '2022-01-05 06:47:39'),
(409, 0, 875, 16, 0.00, 'no', '2022-01-05 06:51:15'),
(410, 0, 876, 16, 0.00, 'no', '2022-01-05 06:54:38'),
(411, 0, 877, 16, 0.00, 'no', '2022-01-05 07:00:27'),
(412, 0, 878, NULL, 0.00, 'no', '2022-01-05 07:10:37'),
(413, 0, 879, NULL, 0.00, 'no', '2022-01-05 07:15:02'),
(414, 0, 880, 16, 0.00, 'no', '2022-01-07 05:22:02'),
(415, 0, 881, 16, 0.00, 'no', '2022-01-07 05:26:02'),
(416, 0, 882, 16, 0.00, 'no', '2022-01-07 05:31:58'),
(417, 0, 883, 17, 0.00, 'no', '2022-01-19 09:41:55'),
(418, 0, 884, 16, 0.00, 'no', '2022-01-21 05:50:40'),
(419, 0, 885, 20, 0.00, 'no', '2022-01-28 06:29:40'),
(420, 0, 886, NULL, 0.00, 'no', '2022-01-28 10:59:24'),
(421, 0, 887, NULL, 0.00, 'no', '2022-01-28 11:28:21'),
(422, 0, 888, NULL, 0.00, 'no', '2022-01-29 06:18:18'),
(423, 0, 889, NULL, 0.00, 'no', '2022-01-29 06:39:57'),
(424, 0, 890, NULL, 0.00, 'no', '2022-01-29 06:50:28'),
(425, 0, 891, NULL, 0.00, 'no', '2022-01-29 06:52:57'),
(426, 0, 892, 17, 0.00, 'no', '2022-01-29 06:59:23'),
(427, 0, 893, NULL, 0.00, 'no', '2022-01-29 10:01:11'),
(428, 0, 894, NULL, 0.00, 'no', '2022-01-30 04:02:41'),
(429, 0, 895, 20, 0.00, 'no', '2022-01-31 03:57:29'),
(430, 0, 896, 16, 0.00, 'no', '2022-01-31 10:44:03'),
(431, 0, 897, 16, 0.00, 'no', '2022-01-31 15:15:00'),
(432, 0, 898, NULL, 0.00, 'no', '2022-01-31 15:19:11'),
(433, 0, 899, NULL, 0.00, 'no', '2022-01-31 15:22:26'),
(434, 0, 900, NULL, 0.00, 'no', '2022-01-31 15:29:45'),
(435, 0, 901, 20, 0.00, 'no', '2022-02-05 06:57:18'),
(436, 0, 902, NULL, 0.00, 'no', '2022-02-10 05:57:12'),
(437, 0, 903, 20, 0.00, 'no', '2022-02-11 05:48:07'),
(438, 0, 904, 20, 0.00, 'no', '2022-02-18 05:13:43'),
(439, 0, 905, 20, 0.00, 'no', '2022-02-18 05:15:42'),
(440, 0, 906, 20, 0.00, 'no', '2022-02-18 05:19:43'),
(441, 0, 907, 20, 0.00, 'no', '2022-02-18 05:25:43'),
(442, 0, 908, 20, 0.00, 'no', '2022-02-18 05:29:39'),
(443, 0, 887, 18, 0.00, 'no', '2022-02-22 06:10:23'),
(444, 0, 888, 18, 0.00, 'no', '2022-02-22 06:10:23'),
(445, 0, 889, 18, 0.00, 'no', '2022-02-22 06:10:23'),
(446, 0, 902, 18, 0.00, 'no', '2022-02-22 06:10:23'),
(447, 0, 909, 20, 0.00, 'no', '2022-02-22 06:17:38'),
(448, 0, 910, NULL, 0.00, 'no', '2022-02-22 06:40:04'),
(449, 0, 910, 18, 0.00, 'no', '2022-02-22 07:51:27'),
(450, 0, 911, NULL, 0.00, 'no', '2022-02-22 08:29:55'),
(451, 0, 912, NULL, 0.00, 'no', '2022-02-22 08:34:47'),
(452, 0, 913, NULL, 0.00, 'no', '2022-02-22 08:38:39'),
(453, 0, 914, NULL, 0.00, 'no', '2022-02-23 03:53:06'),
(454, 0, 915, NULL, 0.00, 'no', '2022-02-23 03:57:39'),
(455, 0, 916, NULL, 0.00, 'no', '2022-02-23 04:08:23'),
(456, 0, 917, NULL, 0.00, 'no', '2022-02-23 04:13:22'),
(457, 0, 918, 20, 0.00, 'no', '2022-02-24 04:34:51'),
(458, 0, 919, NULL, 0.00, 'no', '2022-02-24 04:39:04'),
(459, 0, 920, 20, 0.00, 'no', '2022-02-24 04:41:53'),
(460, 0, 921, NULL, 0.00, 'no', '2022-02-24 04:44:49'),
(461, 0, 922, NULL, 0.00, 'no', '2022-02-24 06:04:50'),
(462, 0, 923, 20, 0.00, 'no', '2022-02-24 06:08:40'),
(463, 0, 924, 20, 0.00, 'no', '2022-02-25 07:09:43'),
(464, 0, 898, 21, 0.00, 'no', '2022-02-25 07:43:17'),
(466, 0, 912, 21, 0.00, 'no', '2022-02-25 07:43:17'),
(467, 0, 925, NULL, 0.00, 'no', '2022-02-25 09:39:27'),
(468, 0, 926, 21, 0.00, 'no', '2022-02-26 06:03:26'),
(469, 0, 927, NULL, 0.00, 'no', '2022-02-28 03:53:07'),
(470, 0, 928, NULL, 0.00, 'no', '2022-02-28 03:54:33'),
(471, 0, 929, NULL, 0.00, 'no', '2022-02-28 04:00:13'),
(472, 0, 930, NULL, 0.00, 'no', '2022-03-01 03:22:03'),
(473, 0, 931, NULL, 0.00, 'no', '2022-03-01 03:27:37'),
(474, 0, 932, NULL, 0.00, 'no', '2022-03-01 03:30:28'),
(475, 0, 933, NULL, 0.00, 'no', '2022-03-01 03:31:06'),
(476, 0, 934, NULL, 0.00, 'no', '2022-03-01 03:35:20'),
(477, 0, 935, NULL, 0.00, 'no', '2022-03-01 03:35:54'),
(478, 0, 936, NULL, 0.00, 'no', '2022-03-01 03:37:27'),
(479, 0, 937, 20, 0.00, 'no', '2022-03-01 03:45:04'),
(480, 0, 938, NULL, 0.00, 'no', '2022-03-01 04:12:29'),
(481, 0, 939, NULL, 0.00, 'no', '2022-03-01 06:29:59'),
(482, 0, 940, NULL, 0.00, 'no', '2022-03-02 09:52:56'),
(483, 0, 941, NULL, 0.00, 'no', '2022-03-02 11:58:15'),
(484, 0, 942, NULL, 0.00, 'no', '2022-03-02 12:04:32'),
(485, 0, 943, NULL, 0.00, 'no', '2022-03-02 12:33:56'),
(486, 0, 944, NULL, 0.00, 'no', '2022-03-03 10:59:23'),
(487, 0, 945, NULL, 0.00, 'no', '2022-03-04 06:44:42'),
(488, 0, 911, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(489, 0, 913, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(490, 0, 914, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(491, 0, 919, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(492, 0, 921, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(493, 0, 922, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(494, 0, 925, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(495, 0, 930, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(496, 0, 931, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(497, 0, 932, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(498, 0, 933, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(499, 0, 935, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(500, 0, 938, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(501, 0, 940, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(502, 0, 944, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(503, 0, 945, 18, 0.00, 'no', '2022-03-04 06:50:39'),
(504, 0, 946, 17, 0.00, 'no', '2022-03-05 07:10:36'),
(505, 0, 947, 17, 0.00, 'no', '2022-03-05 07:25:29'),
(506, 0, 948, 17, 0.00, 'no', '2022-03-05 07:40:06'),
(507, 0, 809, 23, 0.00, 'no', '2022-03-12 06:33:51'),
(508, 0, 814, 23, 0.00, 'no', '2022-03-12 06:33:51'),
(509, 0, 815, 23, 0.00, 'no', '2022-03-12 06:33:51'),
(510, 0, 893, 23, 0.00, 'no', '2022-03-12 06:33:51'),
(511, 0, 949, 24, 0.00, 'no', '2022-03-25 05:09:06'),
(512, 0, 950, 24, 0.00, 'no', '2022-03-25 05:09:28'),
(513, 0, 951, 24, 0.00, 'no', '2022-03-25 05:10:42'),
(514, 0, 952, 24, 0.00, 'no', '2022-03-25 05:11:27'),
(515, 0, 953, 24, 0.00, 'no', '2022-03-25 05:12:34'),
(516, 0, 954, 24, 0.00, 'no', '2022-03-25 05:13:23'),
(517, 0, 955, 24, 0.00, 'no', '2022-03-25 05:14:10'),
(518, 0, 885, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(519, 0, 895, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(521, 0, 901, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(522, 0, 903, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(523, 0, 904, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(524, 0, 905, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(525, 0, 906, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(526, 0, 907, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(527, 0, 908, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(528, 0, 909, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(529, 0, 918, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(530, 0, 920, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(531, 0, 923, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(532, 0, 937, 24, 0.00, 'no', '2022-03-25 05:26:11'),
(533, 0, 899, 26, 0.00, 'no', '2022-03-25 06:11:26'),
(534, 0, 956, 23, 0.00, 'no', '2022-03-26 06:07:51'),
(535, 0, 957, NULL, 0.00, 'no', '2022-04-04 08:42:20'),
(536, 0, 958, NULL, 0.00, 'no', '2022-05-22 09:35:19'),
(537, 0, 959, 4, 0.00, 'no', '2023-01-18 09:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `student_session`
--

CREATE TABLE `student_session` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `hostel_room_id` int(11) NOT NULL,
  `vehroute_id` int(10) DEFAULT NULL,
  `transport_fees` float(10,2) NOT NULL DEFAULT 0.00,
  `fees_discount` float(10,2) NOT NULL DEFAULT 0.00,
  `is_active` varchar(255) DEFAULT 'no',
  `is_alumni` int(11) NOT NULL,
  `default_login` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_sibling`
--

CREATE TABLE `student_sibling` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `sibling_student_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_subject_attendances`
--

CREATE TABLE `student_subject_attendances` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `subject_timetable_id` int(11) DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_timeline`
--

CREATE TABLE `student_timeline` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Subject1', '0012', 'theory', 'no', '2021-11-28 16:53:23', NULL),
(2, 'Subject2', '0125', 'practical', 'no', '2021-11-28 16:53:35', NULL),
(3, 'English 101', 'E101', 'theory', 'no', '2022-03-21 08:27:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_groups`
--

CREATE TABLE `subject_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject_groups`
--

INSERT INTO `subject_groups` (`id`, `name`, `description`, `session_id`, `created_at`) VALUES
(1, 'IT', '', 16, '2021-11-28 16:53:51'),
(2, 'Sample', '', 16, '2022-03-21 08:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `subject_group_class_sections`
--

CREATE TABLE `subject_group_class_sections` (
  `id` int(11) NOT NULL,
  `subject_group_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject_group_class_sections`
--

INSERT INTO `subject_group_class_sections` (`id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 2, 43, 16, NULL, 0, '2022-03-21 08:30:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_group_subjects`
--

CREATE TABLE `subject_group_subjects` (
  `id` int(11) NOT NULL,
  `subject_group_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject_group_subjects`
--

INSERT INTO `subject_group_subjects` (`id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES
(1, 1, 16, 1, '2021-11-28 16:53:51'),
(2, 1, 16, 2, '2021-11-28 16:53:51'),
(3, 2, 16, 1, '2022-03-21 08:30:00'),
(4, 2, 16, 2, '2022-03-21 08:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `subject_syllabus`
--

CREATE TABLE `subject_syllabus` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_for` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_from` varchar(255) NOT NULL,
  `time_to` varchar(255) NOT NULL,
  `presentation` text NOT NULL,
  `attachment` text NOT NULL,
  `lacture_youtube_url` varchar(255) NOT NULL,
  `lacture_video` varchar(255) NOT NULL,
  `sub_topic` text NOT NULL,
  `teaching_method` text NOT NULL,
  `general_objectives` text NOT NULL,
  `previous_knowledge` text NOT NULL,
  `comprehensive_questions` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subject_timetable`
--

CREATE TABLE `subject_timetable` (
  `id` int(11) NOT NULL,
  `day` varchar(20) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `subject_group_id` int(11) DEFAULT NULL,
  `subject_group_subject_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `time_from` varchar(20) DEFAULT NULL,
  `time_to` varchar(20) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `room_no` varchar(20) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submit_assignment`
--

CREATE TABLE `submit_assignment` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `docs` varchar(225) NOT NULL,
  `file_name` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subjects`
--

CREATE TABLE `teacher_subjects` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `template_admitcards`
--

CREATE TABLE `template_admitcards` (
  `id` int(11) NOT NULL,
  `template` varchar(250) DEFAULT NULL,
  `heading` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `left_logo` varchar(200) DEFAULT NULL,
  `right_logo` varchar(200) DEFAULT NULL,
  `exam_name` varchar(200) DEFAULT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `exam_center` varchar(200) DEFAULT NULL,
  `sign` varchar(200) DEFAULT NULL,
  `background_img` varchar(200) DEFAULT NULL,
  `is_name` int(1) NOT NULL DEFAULT 1,
  `is_father_name` int(1) NOT NULL DEFAULT 1,
  `is_mother_name` int(1) NOT NULL DEFAULT 1,
  `is_dob` int(1) NOT NULL DEFAULT 1,
  `is_admission_no` int(1) NOT NULL DEFAULT 1,
  `is_roll_no` int(1) NOT NULL DEFAULT 1,
  `is_address` int(1) NOT NULL DEFAULT 1,
  `is_gender` int(1) NOT NULL DEFAULT 1,
  `is_photo` int(11) NOT NULL,
  `is_class` int(11) NOT NULL DEFAULT 0,
  `is_section` int(11) NOT NULL DEFAULT 0,
  `content_footer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template_admitcards`
--

INSERT INTO `template_admitcards` (`id`, `template`, `heading`, `title`, `left_logo`, `right_logo`, `exam_name`, `school_name`, `exam_center`, `sign`, `background_img`, `is_name`, `is_father_name`, `is_mother_name`, `is_dob`, `is_admission_no`, `is_roll_no`, `is_address`, `is_gender`, `is_photo`, `is_class`, `is_section`, `content_footer`, `created_at`, `updated_at`) VALUES
(1, 'Sample Admit Card', 'BOARD OF SECONDARY EDUCATION, MADHYA PRADESH, BHOPAL', 'HIGHER SECONDARY SCHOOL CERTIFICATE EXAMINATION (10+2) 2014', 'ab12c4b65f53ee621dcf84370a7c5be4.png', '0910482bf79df5fd103e8383d61b387a.png', 'Test', 'Mount Carmel School', 'test dmit card2', 'aa9c7087e68c5af1d2c04946de1d3bd3.png', '782a71f53ea6bca213012d49e9d46d98.jpg', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2020-02-28 14:26:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `template_marksheets`
--

CREATE TABLE `template_marksheets` (
  `id` int(11) NOT NULL,
  `template` varchar(200) DEFAULT NULL,
  `heading` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `left_logo` varchar(200) DEFAULT NULL,
  `right_logo` varchar(200) DEFAULT NULL,
  `exam_name` varchar(200) DEFAULT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `exam_center` varchar(200) DEFAULT NULL,
  `left_sign` varchar(200) DEFAULT NULL,
  `middle_sign` varchar(200) DEFAULT NULL,
  `right_sign` varchar(200) DEFAULT NULL,
  `exam_session` int(1) DEFAULT 1,
  `is_name` int(1) DEFAULT 1,
  `is_father_name` int(1) DEFAULT 1,
  `is_mother_name` int(1) DEFAULT 1,
  `is_dob` int(1) DEFAULT 1,
  `is_admission_no` int(1) DEFAULT 1,
  `is_roll_no` int(1) DEFAULT 1,
  `is_photo` int(11) DEFAULT 1,
  `is_division` int(1) NOT NULL DEFAULT 1,
  `is_customfield` int(1) NOT NULL,
  `background_img` varchar(200) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `is_class` int(11) NOT NULL DEFAULT 0,
  `is_teacher_remark` int(11) NOT NULL DEFAULT 1,
  `is_section` int(11) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `content_footer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template_marksheets`
--

INSERT INTO `template_marksheets` (`id`, `template`, `heading`, `title`, `left_logo`, `right_logo`, `exam_name`, `school_name`, `exam_center`, `left_sign`, `middle_sign`, `right_sign`, `exam_session`, `is_name`, `is_father_name`, `is_mother_name`, `is_dob`, `is_admission_no`, `is_roll_no`, `is_photo`, `is_division`, `is_customfield`, `background_img`, `date`, `is_class`, `is_teacher_remark`, `is_section`, `content`, `content_footer`, `created_at`, `updated_at`) VALUES
(1, 'Sample Marksheet', 'BOARD OF SECONDARY EDUCATION, MADHYA PRADESH, BHOPAL', 'BOARD OF SECONDARY EDUCATION, MADHYA PRADESH, BHOPAL', 'f314cec3f688771ccaeddbcee6e52f7c.png', 'e824b2df53266266be2dbfd2001168b8.png', 'HIGHER SECONDARY SCHOOL CERTIFICATE EXAMINATION', 'Mount Carmel School', 'GOVT GIRLS H S SCHOOL', '331e0690e50f8c6b7a219a0a2b9667f7.png', '351f513d79ee5c0f642c2d36514a1ff4.png', 'fb79d2c0d163357d1706b78550a05e2c.png', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '', NULL, 0, 1, 0, NULL, NULL, '2020-02-28 14:26:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` int(11) NOT NULL,
  `teacher_subject_id` int(20) DEFAULT NULL,
  `day_name` varchar(50) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `complete_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transport_route`
--

CREATE TABLE `transport_route` (
  `id` int(11) NOT NULL,
  `route_title` varchar(100) DEFAULT NULL,
  `no_of_vehicle` int(11) DEFAULT NULL,
  `fare` float(10,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES
(1, 'ygcampus2020@gmail.com', 'Admin', NULL, '175.157.134.196', 'Chrome 103.0.0.0, Windows 10', '2022-07-12 18:34:38'),
(2, 'jayanga.kandearachchi@gmail.com', 'Super Admin', NULL, '112.134.194.214', 'Chrome 103.0.0.0, Windows 10', '2022-07-12 20:54:29'),
(3, 'ygcampus2020@gmail.com', 'Admin', NULL, '111.223.160.186', 'Chrome 103.0.0.0, Windows 10', '2022-07-19 18:03:58'),
(4, 'std493', 'student', 40, '175.157.143.17', 'Chrome 96.0.4664.104, Android', '2022-08-01 02:03:12'),
(5, 'ygcampus2020@gmail.com', 'Admin', NULL, '175.157.37.249', 'Chrome 104.0.0.0, Windows 10', '2022-08-15 19:35:49'),
(6, 'ygcampus2020@gmail.com', 'Super Admin', NULL, '175.157.37.249', 'Chrome 104.0.0.0, Windows 10', '2022-08-15 21:49:11'),
(7, 'ygcampus2020@gmail.com', 'Super Admin', NULL, '175.157.37.249', 'Chrome 104.0.0.0, Windows 10', '2022-08-15 21:52:14'),
(8, 'smpmaneth@gmail.com', 'Super Admin', NULL, '124.43.67.10', 'Chrome 104.0.5112.81, Windows 10', '2022-08-15 21:52:18'),
(9, 'smpmaneth@gmail.com', 'Super Admin', NULL, '124.43.67.10', 'Chrome 104.0.5112.81, Windows 10', '2022-08-17 16:01:30'),
(10, 'ygcampus2020@gmail.com', 'Super Admin', NULL, '175.157.33.25', 'Chrome 104.0.0.0, Windows 10', '2022-08-17 19:23:45'),
(11, 'smpmaneth@gmail.com', 'Super Admin', NULL, '124.43.67.10', 'Chrome 104.0.5112.81, Windows 10', '2022-08-17 19:24:38'),
(12, 'ygcampus2020@gmail.com', 'Super Admin', NULL, '175.157.33.126', 'Chrome 104.0.0.0, Windows 10', '2022-08-22 18:51:53'),
(13, 'smpmaneth@gmail.com', 'Super Admin', NULL, '124.43.67.10', 'Chrome 104.0.5112.102, Windows 10', '2022-08-22 19:28:56'),
(14, 'ygcampus2020@gmail.com', 'Super Admin', NULL, '112.134.198.228', 'Chrome 104.0.0.0, Windows 10', '2022-08-27 19:43:55'),
(15, 'std493', 'student', 40, '111.223.160.138', 'Chrome 99.0.4844.88, Android', '2022-08-28 16:04:26'),
(16, 'ygcampus2020@gmail.com', 'Super Admin', NULL, '112.134.195.110', 'Chrome 104.0.0.0, Windows 10', '2022-08-29 20:50:48'),
(17, 'std609', 'student', 33, '112.135.90.98', 'Chrome 104.0.0.0, Windows 10', '2022-08-30 03:39:59'),
(18, 'std609', 'student', 33, '112.135.90.98', 'Chrome 104.0.0.0, Windows 10', '2022-08-30 03:41:06'),
(19, 'jayanga.kandearachchi@gmail.com', 'Admin', NULL, '112.134.198.116', 'Chrome 105.0.0.0, Windows 10', '2022-09-13 18:50:08'),
(20, 'smpmaneth@gmail.com', 'Super Admin', NULL, '124.43.67.10', 'Chrome 105.0.0.0, Windows 10', '2022-09-13 19:46:34'),
(21, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-18 08:08:28'),
(22, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-18 10:51:17'),
(23, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-18 13:30:37'),
(24, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-19 02:47:55'),
(25, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-19 07:50:05'),
(26, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-20 03:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES
(33, 17, 'std17', '0zre3p', '', 'student', '', 0, 'yes', '2021-08-22 20:53:51', NULL),
(34, 17, 'parent17', 'cen9ja', '17', 'parent', '', 0, 'yes', '2021-08-22 20:53:51', NULL),
(35, 18, 'std18', 'o69wot', '', 'student', '', 0, 'yes', '2021-08-22 20:53:52', NULL),
(36, 18, 'parent18', 'yxbeir', '18', 'parent', '', 0, 'yes', '2021-08-22 20:53:52', NULL),
(37, 19, 'std19', '8aqm8b', '', 'student', '', 0, 'yes', '2021-08-22 20:53:52', NULL),
(38, 19, 'parent19', '5iq988', '19', 'parent', '', 0, 'yes', '2021-08-22 20:53:52', NULL),
(39, 20, 'std20', 'wvfjf3', '', 'student', '', 0, 'yes', '2021-08-22 20:53:53', NULL),
(40, 20, 'parent20', 'ox87jy', '20', 'parent', '', 0, 'yes', '2021-08-22 20:53:53', NULL),
(41, 21, 'std21', 'zce36o', '', 'student', '', 0, 'yes', '2021-08-22 20:53:54', NULL),
(42, 21, 'parent21', 'r0ff3u', '21', 'parent', '', 0, 'yes', '2021-08-22 20:53:54', NULL),
(43, 22, 'std22', 'xh37zj', '', 'student', '', 0, 'yes', '2021-08-22 20:53:55', NULL),
(44, 22, 'parent22', 'xv6g6w', '22', 'parent', '', 0, 'yes', '2021-08-22 20:53:55', NULL),
(45, 23, 'std23', 'l6otnf', '', 'student', '', 0, 'yes', '2021-08-22 20:53:56', NULL),
(46, 23, 'parent23', 'jwahaa', '23', 'parent', '', 0, 'yes', '2021-08-22 20:53:56', NULL),
(47, 24, 'std24', 'do1dtg', '', 'student', '', 0, 'yes', '2021-08-22 20:53:58', NULL),
(48, 24, 'parent24', 'p15agf', '24', 'parent', '', 0, 'yes', '2021-08-22 20:53:58', NULL),
(49, 25, 'std25', 'xj9wsq', '', 'student', '', 0, 'yes', '2021-08-22 20:53:59', NULL),
(50, 25, 'parent25', 'g5gtzx', '25', 'parent', '', 0, 'yes', '2021-08-22 20:53:59', NULL),
(51, 26, 'std26', 'u1zgri', '', 'student', '', 0, 'yes', '2021-08-22 20:54:00', NULL),
(52, 26, 'parent26', 'ukbyxr', '26', 'parent', '', 0, 'yes', '2021-08-22 20:54:00', NULL),
(53, 27, 'std27', 'lm3dr7', '', 'student', '', 0, 'yes', '2021-08-22 20:54:01', NULL),
(54, 27, 'parent27', '4etimc', '27', 'parent', '', 0, 'yes', '2021-08-22 20:54:01', NULL),
(55, 28, 'std28', 'ncdle2', '', 'student', '', 0, 'yes', '2021-08-22 20:54:02', NULL),
(56, 28, 'parent28', 'rhl8b7', '28', 'parent', '', 0, 'yes', '2021-08-22 20:54:02', NULL),
(57, 29, 'std29', 'hrbsq4', '', 'student', '', 0, 'yes', '2021-08-22 20:54:03', NULL),
(58, 29, 'parent29', 'ygmvad', '29', 'parent', '', 0, 'yes', '2021-08-22 20:54:03', NULL),
(59, 30, 'std30', 'zl2zp0', '', 'student', '', 0, 'yes', '2021-08-22 20:54:04', NULL),
(60, 30, 'parent30', 'm7mcjj', '30', 'parent', '', 0, 'yes', '2021-08-22 20:54:04', NULL),
(591, 296, 'std296', 'ooqqd3', '', 'student', '', 0, 'yes', '2021-08-29 19:02:34', NULL),
(592, 296, 'parent296', 'jcxenj', '296', 'parent', '', 0, 'yes', '2021-08-29 19:02:34', NULL),
(593, 297, 'std297', 'vpah95', '', 'student', '', 0, 'yes', '2021-08-29 19:02:34', NULL),
(594, 297, 'parent297', 'jluv7o', '297', 'parent', '', 0, 'yes', '2021-08-29 19:02:34', NULL),
(595, 298, 'std298', 'dbss0i', '', 'student', '', 0, 'yes', '2021-08-29 19:02:34', NULL),
(596, 298, 'parent298', 'kdb97q', '298', 'parent', '', 0, 'yes', '2021-08-29 19:02:34', NULL),
(597, 299, 'std299', 'j8sba7', '', 'student', '', 0, 'yes', '2021-08-29 19:02:36', NULL),
(598, 299, 'parent299', 'ktxb2p', '299', 'parent', '', 0, 'yes', '2021-08-29 19:02:36', NULL),
(599, 300, 'std300', 'nkphu3', '', 'student', '', 0, 'yes', '2021-08-29 19:02:37', NULL),
(600, 300, 'parent300', 'crcqeh', '300', 'parent', '', 0, 'yes', '2021-08-29 19:02:37', NULL),
(601, 301, 'std301', 'cf3n6t', '', 'student', '', 0, 'yes', '2021-08-29 19:02:38', NULL),
(602, 301, 'parent301', 'zclm8o', '301', 'parent', '', 0, 'yes', '2021-08-29 19:02:38', NULL),
(603, 302, 'std302', '9zfrde', '', 'student', '', 0, 'yes', '2021-08-29 19:02:39', NULL),
(604, 302, 'parent302', '0ylby2', '302', 'parent', '', 0, 'yes', '2021-08-29 19:02:39', NULL),
(605, 303, 'std303', 'du36f1', '', 'student', '', 0, 'yes', '2021-08-29 19:03:53', NULL),
(606, 303, 'parent303', 'z8j661', '303', 'parent', '', 0, 'yes', '2021-08-29 19:03:53', NULL),
(607, 304, 'std304', 'mz1eji', '', 'student', '', 0, 'yes', '2021-08-29 19:03:54', NULL),
(608, 304, 'parent304', 'vvjbf8', '304', 'parent', '', 0, 'yes', '2021-08-29 19:03:54', NULL),
(609, 305, 'std305', '8mi4y2', '', 'student', '', 0, 'yes', '2021-08-29 19:03:54', NULL),
(610, 305, 'parent305', 'pmzq59', '305', 'parent', '', 0, 'yes', '2021-08-29 19:03:54', NULL),
(611, 306, 'std306', 'ch3wbm', '', 'student', '', 0, 'yes', '2021-08-29 19:03:54', NULL),
(612, 306, 'parent306', 'ccyq3b', '306', 'parent', '', 0, 'yes', '2021-08-29 19:03:54', NULL),
(613, 307, 'std307', 'yn2cw4', '', 'student', '', 0, 'yes', '2021-08-29 19:03:54', NULL),
(614, 307, 'parent307', 'x3kdn9', '307', 'parent', '', 0, 'yes', '2021-08-29 19:03:54', NULL),
(615, 308, 'std308', 'c3whoa', '', 'student', '', 0, 'yes', '2021-08-29 19:03:55', NULL),
(616, 308, 'parent308', 'al3vfr', '308', 'parent', '', 0, 'yes', '2021-08-29 19:03:55', NULL),
(617, 309, 'std309', 'cyxso5', '', 'student', '', 0, 'yes', '2021-08-29 19:03:56', NULL),
(618, 309, 'parent309', '5l3uzc', '309', 'parent', '', 0, 'yes', '2021-08-29 19:03:56', NULL),
(619, 310, 'std310', 'vwqvvr', '', 'student', '', 0, 'yes', '2021-08-29 19:03:57', NULL),
(620, 310, 'parent310', 'f3dzy0', '310', 'parent', '', 0, 'yes', '2021-08-29 19:03:57', NULL),
(621, 311, 'std311', 'g3cofj', '', 'student', '', 0, 'yes', '2021-08-29 19:03:58', NULL),
(622, 311, 'parent311', '82d5k1', '311', 'parent', '', 0, 'yes', '2021-08-29 19:03:58', NULL),
(623, 312, 'std312', 'qbavrd', '', 'student', '', 0, 'yes', '2021-08-29 19:03:59', NULL),
(624, 312, 'parent312', 'sk0cw6', '312', 'parent', '', 0, 'yes', '2021-08-29 19:03:59', NULL),
(625, 313, 'std313', 'yvsij6', '', 'student', '', 0, 'yes', '2021-08-29 19:04:00', NULL),
(626, 313, 'parent313', '2doks0', '313', 'parent', '', 0, 'yes', '2021-08-29 19:04:00', NULL),
(627, 314, 'std314', 'man0fj', '', 'student', '', 0, 'yes', '2021-08-29 19:04:01', NULL),
(628, 314, 'parent314', 'm9782z', '314', 'parent', '', 0, 'yes', '2021-08-29 19:04:01', NULL),
(629, 315, 'std315', 'aavevy', '', 'student', '', 0, 'yes', '2021-08-29 19:04:02', NULL),
(630, 315, 'parent315', '96yh8r', '315', 'parent', '', 0, 'yes', '2021-08-29 19:04:02', NULL),
(631, 316, 'std316', 'hin42n', '', 'student', '', 0, 'yes', '2021-08-29 19:04:03', NULL),
(632, 316, 'parent316', 'hz0u6l', '316', 'parent', '', 0, 'yes', '2021-08-29 19:04:03', NULL),
(633, 317, 'std317', 'vwanbv', '', 'student', '', 0, 'yes', '2021-08-29 19:04:04', NULL),
(634, 317, 'parent317', 'u4pxax', '317', 'parent', '', 0, 'yes', '2021-08-29 19:04:04', NULL),
(635, 318, 'std318', 'blf910', '', 'student', '', 0, 'yes', '2021-08-29 19:04:05', NULL),
(636, 318, 'parent318', 'wyntlc', '318', 'parent', '', 0, 'yes', '2021-08-29 19:04:05', NULL),
(637, 319, 'std319', 'ywu7ay', '', 'student', '', 0, 'yes', '2021-08-29 19:04:06', NULL),
(638, 319, 'parent319', '6871eu', '319', 'parent', '', 0, 'yes', '2021-08-29 19:04:06', NULL),
(639, 320, 'std320', 'ok547f', '', 'student', '', 0, 'yes', '2021-08-29 19:04:07', NULL),
(640, 320, 'parent320', 'eaw1ix', '320', 'parent', '', 0, 'yes', '2021-08-29 19:04:07', NULL),
(641, 321, 'std321', 'c3skm2', '', 'student', '', 0, 'yes', '2021-08-29 19:04:08', NULL),
(642, 321, 'parent321', '2kc55n', '321', 'parent', '', 0, 'yes', '2021-08-29 19:04:08', NULL),
(643, 322, 'std322', '9hku9a', '', 'student', '', 0, 'yes', '2021-08-29 19:04:09', NULL),
(644, 322, 'parent322', '463i2x', '322', 'parent', '', 0, 'yes', '2021-08-29 19:04:09', NULL),
(645, 323, 'std323', 'd8edxj', '', 'student', '', 0, 'yes', '2021-08-29 19:04:10', NULL),
(646, 323, 'parent323', '88cp6u', '323', 'parent', '', 0, 'yes', '2021-08-29 19:04:10', NULL),
(647, 324, 'std324', '5zmqwr', '', 'student', '', 0, 'yes', '2021-08-29 19:04:10', NULL),
(648, 324, 'parent324', 'j64xxq', '324', 'parent', '', 0, 'yes', '2021-08-29 19:04:10', NULL),
(649, 325, 'std325', '0b10w3', '', 'student', '', 0, 'yes', '2021-08-29 19:04:11', NULL),
(650, 325, 'parent325', 'qtabza', '325', 'parent', '', 0, 'yes', '2021-08-29 19:04:11', NULL),
(651, 326, 'std326', 'mwhqx8', '', 'student', '', 0, 'yes', '2021-08-29 19:04:12', NULL),
(652, 326, 'parent326', 'lofjeo', '326', 'parent', '', 0, 'yes', '2021-08-29 19:04:12', NULL),
(653, 327, 'std327', 'ej2eck', '', 'student', '', 0, 'yes', '2021-08-29 19:04:12', NULL),
(654, 327, 'parent327', 'xcyh68', '327', 'parent', '', 0, 'yes', '2021-08-29 19:04:12', NULL),
(655, 328, 'std328', 'uby5i4', '', 'student', '', 0, 'yes', '2021-08-29 19:04:12', NULL),
(656, 328, 'parent328', 'ez2alk', '328', 'parent', '', 0, 'yes', '2021-08-29 19:04:12', NULL),
(657, 329, 'std329', 'egbg0q', '', 'student', '', 0, 'yes', '2021-08-29 19:04:15', NULL),
(658, 329, 'parent329', 'zmjeep', '329', 'parent', '', 0, 'yes', '2021-08-29 19:04:15', NULL),
(659, 330, 'std330', '40lxkq', '', 'student', '', 0, 'yes', '2021-08-29 19:04:16', NULL),
(660, 330, 'parent330', '9avibm', '330', 'parent', '', 0, 'yes', '2021-08-29 19:04:16', NULL),
(661, 331, 'std331', '1gjv14', '', 'student', '', 0, 'yes', '2021-08-29 19:04:18', NULL),
(662, 331, 'parent331', '4f6inz', '331', 'parent', '', 0, 'yes', '2021-08-29 19:04:18', NULL),
(663, 332, 'std332', 'uw70qh', '', 'student', '', 0, 'yes', '2021-08-29 19:04:19', NULL),
(664, 332, 'parent332', 'cpkekt', '332', 'parent', '', 0, 'yes', '2021-08-29 19:04:19', NULL),
(665, 333, 'std333', 'v7ebm5', '', 'student', '', 0, 'yes', '2021-08-29 19:04:20', NULL),
(666, 333, 'parent333', 'l3ol7b', '333', 'parent', '', 0, 'yes', '2021-08-29 19:04:20', NULL),
(667, 334, 'std334', 'zitjmx', '', 'student', '', 0, 'yes', '2021-08-29 19:04:21', NULL),
(668, 334, 'parent334', 'mk4lze', '334', 'parent', '', 0, 'yes', '2021-08-29 19:04:21', NULL),
(669, 335, 'std335', 't1ad7d', '', 'student', '', 0, 'yes', '2021-08-29 19:04:22', NULL),
(670, 335, 'parent335', '1jafri', '335', 'parent', '', 0, 'yes', '2021-08-29 19:04:22', NULL),
(671, 336, 'std336', 'avviss', '', 'student', '', 0, 'yes', '2021-08-29 19:04:23', NULL),
(672, 336, 'parent336', 'dtl47f', '336', 'parent', '', 0, 'yes', '2021-08-29 19:04:23', NULL),
(673, 337, 'std337', '3upti4', '', 'student', '', 0, 'yes', '2021-08-29 19:04:24', NULL),
(674, 337, 'parent337', 'seolki', '337', 'parent', '', 0, 'yes', '2021-08-29 19:04:24', NULL),
(675, 338, 'std338', 'bd4noc', '', 'student', '', 0, 'yes', '2021-08-29 19:04:24', NULL),
(676, 338, 'parent338', 'frniyp', '338', 'parent', '', 0, 'yes', '2021-08-29 19:04:24', NULL),
(677, 339, 'std339', 'm1zrhd', '', 'student', '', 0, 'yes', '2021-08-29 19:04:25', NULL),
(678, 339, 'parent339', 'j4vllr', '339', 'parent', '', 0, 'yes', '2021-08-29 19:04:25', NULL),
(679, 340, 'std340', '5rk79d', '', 'student', '', 0, 'yes', '2021-08-29 19:04:25', NULL),
(680, 340, 'parent340', 'cybxsq', '340', 'parent', '', 0, 'yes', '2021-08-29 19:04:25', NULL),
(681, 341, 'std341', 'ikkfq3', '', 'student', '', 0, 'yes', '2021-08-29 19:04:47', NULL),
(682, 341, 'parent341', '3pxt2q', '341', 'parent', '', 0, 'yes', '2021-08-29 19:04:47', NULL),
(683, 342, 'std342', 'busu6l', '', 'student', '', 0, 'yes', '2021-08-29 19:04:48', NULL),
(684, 342, 'parent342', 'e5tv2n', '342', 'parent', '', 0, 'yes', '2021-08-29 19:04:48', NULL),
(685, 343, 'std343', '04r0op', '', 'student', '', 0, 'yes', '2021-08-29 19:04:48', NULL),
(686, 343, 'parent343', 'jetaay', '343', 'parent', '', 0, 'yes', '2021-08-29 19:04:48', NULL),
(687, 344, 'std344', 'hxfnys', '', 'student', '', 0, 'yes', '2021-08-29 19:04:49', NULL),
(688, 344, 'parent344', 'iw8yqa', '344', 'parent', '', 0, 'yes', '2021-08-29 19:04:49', NULL),
(689, 345, 'std345', '9azb33', '', 'student', '', 0, 'yes', '2021-08-29 19:04:50', NULL),
(690, 345, 'parent345', 'sedltb', '345', 'parent', '', 0, 'yes', '2021-08-29 19:04:50', NULL),
(691, 346, 'std346', 'jkbz4g', '', 'student', '', 0, 'yes', '2021-08-29 19:04:51', NULL),
(692, 346, 'parent346', 'ar6622', '346', 'parent', '', 0, 'yes', '2021-08-29 19:04:51', NULL),
(693, 347, 'std347', 'xkxpts', '', 'student', '', 0, 'yes', '2021-08-29 19:04:52', NULL),
(694, 347, 'parent347', 'goyow9', '347', 'parent', '', 0, 'yes', '2021-08-29 19:04:52', NULL),
(695, 348, 'std348', 'c9ib7e', '', 'student', '', 0, 'yes', '2021-08-29 19:04:53', NULL),
(696, 348, 'parent348', '2e2u5e', '348', 'parent', '', 0, 'yes', '2021-08-29 19:04:53', NULL),
(697, 349, 'std349', 'qn9638', '', 'student', '', 0, 'yes', '2021-08-29 19:04:54', NULL),
(698, 349, 'parent349', '9vot9g', '349', 'parent', '', 0, 'yes', '2021-08-29 19:04:54', NULL),
(699, 350, 'std350', 'd8uffs', '', 'student', '', 0, 'yes', '2021-08-29 19:04:55', NULL),
(700, 350, 'parent350', 'xla5pa', '350', 'parent', '', 0, 'yes', '2021-08-29 19:04:55', NULL),
(701, 351, 'std351', 'esz1pb', '', 'student', '', 0, 'yes', '2021-08-29 19:04:56', NULL),
(702, 351, 'parent351', 'mgcet8', '351', 'parent', '', 0, 'yes', '2021-08-29 19:04:56', NULL),
(703, 352, 'std352', 'ldd8u0', '', 'student', '', 0, 'yes', '2021-08-29 19:04:57', NULL),
(704, 352, 'parent352', 'vy0pet', '352', 'parent', '', 0, 'yes', '2021-08-29 19:04:57', NULL),
(705, 353, 'std353', 'e2mwam', '', 'student', '', 0, 'yes', '2021-08-29 19:04:58', NULL),
(706, 353, 'parent353', 'j3oey7', '353', 'parent', '', 0, 'yes', '2021-08-29 19:04:58', NULL),
(707, 354, 'std354', 'vyuido', '', 'student', '', 0, 'yes', '2021-08-29 19:04:59', NULL),
(708, 354, 'parent354', 'hggzug', '354', 'parent', '', 0, 'yes', '2021-08-29 19:04:59', NULL),
(709, 355, 'std355', 'pbkwp1', '', 'student', '', 0, 'yes', '2021-08-29 19:21:27', NULL),
(710, 355, 'parent355', 'snfv53', '355', 'parent', '', 0, 'yes', '2021-08-29 19:21:27', NULL),
(711, 356, 'std356', 'odyykf', '', 'student', '', 0, 'yes', '2021-08-29 19:21:29', NULL),
(712, 356, 'parent356', '2tt9mr', '356', 'parent', '', 0, 'yes', '2021-08-29 19:21:29', NULL),
(713, 357, 'std357', '3fpetl', '', 'student', '', 0, 'yes', '2021-08-29 19:21:30', NULL),
(714, 357, 'parent357', '67466x', '357', 'parent', '', 0, 'yes', '2021-08-29 19:21:30', NULL),
(715, 358, 'std358', 'bv2jm8', '', 'student', '', 0, 'yes', '2021-08-29 19:21:31', NULL),
(716, 358, 'parent358', '7sgllj', '358', 'parent', '', 0, 'yes', '2021-08-29 19:21:31', NULL),
(717, 359, 'std359', 'm5dh67', '', 'student', '', 0, 'yes', '2021-08-29 19:21:31', NULL),
(718, 359, 'parent359', 'qe6zrg', '359', 'parent', '', 0, 'yes', '2021-08-29 19:21:31', NULL),
(719, 360, 'std360', 'gh7oj3', '', 'student', '', 0, 'yes', '2021-08-29 19:21:32', NULL),
(720, 360, 'parent360', 'dxskk2', '360', 'parent', '', 0, 'yes', '2021-08-29 19:21:32', NULL),
(721, 361, 'std361', 'rq90o8', '', 'student', '', 0, 'yes', '2021-08-29 19:21:33', NULL),
(722, 361, 'parent361', '7xgak1', '361', 'parent', '', 0, 'yes', '2021-08-29 19:21:33', NULL),
(723, 362, 'std362', 'd1rz1i', '', 'student', '', 0, 'yes', '2021-08-29 19:21:34', NULL),
(724, 362, 'parent362', 'v5dq2e', '362', 'parent', '', 0, 'yes', '2021-08-29 19:21:34', NULL),
(725, 363, 'std363', 'pet548', '', 'student', '', 0, 'yes', '2021-08-29 19:21:35', NULL),
(726, 363, 'parent363', 'w2qyib', '363', 'parent', '', 0, 'yes', '2021-08-29 19:21:35', NULL),
(727, 364, 'std364', 'q7b1ne', '', 'student', '', 0, 'yes', '2021-08-29 19:21:36', NULL),
(728, 364, 'parent364', '1n5x98', '364', 'parent', '', 0, 'yes', '2021-08-29 19:21:36', NULL),
(729, 365, 'std365', 'tharu2001', '', 'student', '', 0, 'yes', '2021-09-05 03:49:20', NULL),
(730, 365, 'parent365', 'xx37l3', '365', 'parent', '', 0, 'yes', '2021-08-29 19:21:37', NULL),
(731, 366, 'std366', 'qlswsr', '', 'student', '', 0, 'yes', '2021-08-29 19:21:38', NULL),
(732, 366, 'parent366', 'mq1swj', '366', 'parent', '', 0, 'yes', '2021-08-29 19:21:38', NULL),
(733, 367, 'std367', 'cba7ar', '', 'student', '', 0, 'yes', '2021-08-29 19:21:39', NULL),
(734, 367, 'parent367', 'mstfnt', '367', 'parent', '', 0, 'yes', '2021-08-29 19:21:39', NULL),
(735, 368, 'std368', 'c4qgvh', '', 'student', '', 0, 'yes', '2021-08-29 19:21:40', NULL),
(736, 368, 'parent368', 'a8gvmq', '368', 'parent', '', 0, 'yes', '2021-08-29 19:21:40', NULL),
(737, 369, 'std369', '44mru9', '', 'student', '', 0, 'yes', '2021-08-29 19:21:40', NULL),
(738, 369, 'parent369', 'xwmt5s', '369', 'parent', '', 0, 'yes', '2021-08-29 19:21:40', NULL),
(739, 370, 'std370', '3ocshm', '', 'student', '', 0, 'yes', '2021-08-29 19:21:41', NULL),
(740, 370, 'parent370', 'maeste', '370', 'parent', '', 0, 'yes', '2021-08-29 19:21:41', NULL),
(741, 371, 'std371', 'rdjv67', '', 'student', '', 0, 'yes', '2021-08-29 19:21:42', NULL),
(742, 371, 'parent371', '4v9ndv', '371', 'parent', '', 0, 'yes', '2021-08-29 19:21:42', NULL),
(743, 372, 'std372', 'shcwyu', '', 'student', '', 0, 'yes', '2021-08-29 19:21:43', NULL),
(744, 372, 'parent372', 'o7goax', '372', 'parent', '', 0, 'yes', '2021-08-29 19:21:43', NULL),
(745, 373, 'std373', 'ipa59m', '', 'student', '', 0, 'yes', '2021-08-29 19:21:44', NULL),
(746, 373, 'parent373', 'cb4dy5', '373', 'parent', '', 0, 'yes', '2021-08-29 19:21:44', NULL),
(747, 374, 'std374', 'mjxf5l', '', 'student', '', 0, 'yes', '2021-08-29 19:21:45', NULL),
(748, 374, 'parent374', 'kle9fv', '374', 'parent', '', 0, 'yes', '2021-08-29 19:21:45', NULL),
(749, 375, 'std375', '1r03r9', '', 'student', '', 0, 'yes', '2021-08-29 19:21:46', NULL),
(750, 375, 'parent375', '2h0exq', '375', 'parent', '', 0, 'yes', '2021-08-29 19:21:46', NULL),
(751, 376, 'std376', 'zvuaiy', '', 'student', '', 0, 'yes', '2021-08-29 19:21:47', NULL),
(752, 376, 'parent376', 'g43zg4', '376', 'parent', '', 0, 'yes', '2021-08-29 19:21:47', NULL),
(753, 377, 'std377', '2c2h8z', '', 'student', '', 0, 'yes', '2021-08-29 19:21:48', NULL),
(754, 377, 'parent377', 'w3q68p', '377', 'parent', '', 0, 'yes', '2021-08-29 19:21:48', NULL),
(755, 378, 'std378', 'vjb7xa', '', 'student', '', 0, 'yes', '2021-08-29 19:21:49', NULL),
(756, 378, 'parent378', 'q3ktcc', '378', 'parent', '', 0, 'yes', '2021-08-29 19:21:49', NULL),
(757, 379, 'std379', '49u2eb', '', 'student', '', 0, 'yes', '2021-08-29 19:21:50', NULL),
(758, 379, 'parent379', 'l3l559', '379', 'parent', '', 0, 'yes', '2021-08-29 19:21:50', NULL),
(759, 380, 'std380', 'exbobm', '', 'student', '', 0, 'yes', '2021-08-29 19:21:51', NULL),
(760, 380, 'parent380', '56nbaj', '380', 'parent', '', 0, 'yes', '2021-08-29 19:21:51', NULL),
(761, 381, 'std381', 'm4dwkp', '', 'student', '', 0, 'yes', '2021-08-29 19:21:52', NULL),
(762, 381, 'parent381', 'iw9fqi', '381', 'parent', '', 0, 'yes', '2021-08-29 19:21:52', NULL),
(763, 382, 'std382', '21ws50', '', 'student', '', 0, 'yes', '2021-08-29 19:21:53', NULL),
(764, 382, 'parent382', 'p69ila', '382', 'parent', '', 0, 'yes', '2021-08-29 19:21:53', NULL),
(765, 383, 'std383', 'kjg8ar', '', 'student', '', 0, 'yes', '2021-08-29 19:21:54', NULL),
(766, 383, 'parent383', 'b8nusw', '383', 'parent', '', 0, 'yes', '2021-08-29 19:21:54', NULL),
(767, 384, 'std384', 'd31g5q', '', 'student', '', 0, 'yes', '2021-08-29 19:21:55', NULL),
(768, 384, 'parent384', 'xetxa5', '384', 'parent', '', 0, 'yes', '2021-08-29 19:21:55', NULL),
(769, 385, 'std385', '7xtib1', '', 'student', '', 0, 'yes', '2021-08-29 19:21:55', NULL),
(770, 385, 'parent385', 'a4kof1', '385', 'parent', '', 0, 'yes', '2021-08-29 19:21:55', NULL),
(771, 386, 'std386', 'l1bk54', '', 'student', '', 0, 'yes', '2021-08-29 19:21:56', NULL),
(772, 386, 'parent386', '97j2qu', '386', 'parent', '', 0, 'yes', '2021-08-29 19:21:56', NULL),
(773, 387, 'std387', 'btzt2n', '', 'student', '', 0, 'yes', '2021-08-29 19:21:57', NULL),
(774, 387, 'parent387', 'iyjet3', '387', 'parent', '', 0, 'yes', '2021-08-29 19:21:57', NULL),
(775, 388, 'std388', 'f15f00', '', 'student', '', 0, 'yes', '2021-08-29 19:21:58', NULL),
(776, 388, 'parent388', '4u9rui', '388', 'parent', '', 0, 'yes', '2021-08-29 19:21:58', NULL),
(777, 389, 'std389', '1qulol', '', 'student', '', 0, 'yes', '2021-08-29 19:21:59', NULL),
(778, 389, 'parent389', 'g9thkf', '389', 'parent', '', 0, 'yes', '2021-08-29 19:21:59', NULL),
(779, 390, 'std390', 'vjqonq', '', 'student', '', 0, 'yes', '2021-08-29 19:22:00', NULL),
(780, 390, 'parent390', 'x1e7kl', '390', 'parent', '', 0, 'yes', '2021-08-29 19:22:00', NULL),
(781, 391, 'std391', 'mnovvj', '', 'student', '', 0, 'yes', '2021-08-29 19:22:01', NULL),
(782, 391, 'parent391', '259klk', '391', 'parent', '', 0, 'yes', '2021-08-29 19:22:01', NULL),
(783, 392, 'std392', '12tx2l', '', 'student', '', 0, 'yes', '2021-08-29 19:22:02', NULL),
(784, 392, 'parent392', '8l14sz', '392', 'parent', '', 0, 'yes', '2021-08-29 19:22:02', NULL),
(785, 393, 'std393', 'e5bkjr', '', 'student', '', 0, 'yes', '2021-08-29 19:22:03', NULL),
(786, 393, 'parent393', 'c19fj7', '393', 'parent', '', 0, 'yes', '2021-08-29 19:22:03', NULL),
(787, 394, 'std394', '7i6s3e', '', 'student', '', 0, 'yes', '2021-08-29 19:22:04', NULL),
(788, 394, 'parent394', '60x1bx', '394', 'parent', '', 0, 'yes', '2021-08-29 19:22:04', NULL),
(789, 395, 'std395', 'zf4yio', '', 'student', 'bGNCS2pHUlUrQW9scU15V3JQU25hMmViS2RMZWpueEtyMGNlMkdQM3BKOD0=', 0, 'yes', '2021-11-05 09:48:28', NULL),
(790, 395, 'parent395', 'rcvfkc', '395', 'parent', '', 0, 'yes', '2021-08-29 19:22:05', NULL),
(791, 396, 'std396', 'hkuaml', '', 'student', '', 0, 'yes', '2021-08-29 19:22:05', NULL),
(792, 396, 'parent396', 'f4i98f', '396', 'parent', '', 0, 'yes', '2021-08-29 19:22:05', NULL),
(793, 397, 'std397', 'gt8fam', '', 'student', '', 0, 'yes', '2021-08-29 19:22:06', NULL),
(794, 397, 'parent397', 'x0yjbf', '397', 'parent', '', 0, 'yes', '2021-08-29 19:22:06', NULL),
(795, 398, 'std398', 'fb6xul', '', 'student', '', 0, 'yes', '2021-08-29 19:22:07', NULL),
(796, 398, 'parent398', 'r105h5', '398', 'parent', '', 0, 'yes', '2021-08-29 19:22:07', NULL),
(797, 399, 'std399', '8rosaz', '', 'student', '', 0, 'yes', '2021-08-29 19:22:08', NULL),
(798, 399, 'parent399', '9low5s', '399', 'parent', '', 0, 'yes', '2021-08-29 19:22:08', NULL),
(799, 400, 'std400', 'gt55vy', '', 'student', '', 0, 'yes', '2021-08-29 19:22:09', NULL),
(800, 400, 'parent400', 'b26098', '400', 'parent', '', 0, 'yes', '2021-08-29 19:22:09', NULL),
(801, 401, 'std401', 'drxs1l', '', 'student', '', 0, 'yes', '2021-08-29 19:22:10', NULL),
(802, 401, 'parent401', '0jvd52', '401', 'parent', '', 0, 'yes', '2021-08-29 19:22:10', NULL),
(803, 402, 'std402', 'heqlk0', '', 'student', '', 0, 'yes', '2021-08-29 19:22:11', NULL),
(804, 402, 'parent402', '3h4s8q', '402', 'parent', '', 0, 'yes', '2021-08-29 19:22:11', NULL),
(805, 403, 'std403', 'uqejnp', '', 'student', '', 0, 'yes', '2021-08-29 19:22:12', NULL),
(806, 403, 'parent403', 'ena58y', '403', 'parent', '', 0, 'yes', '2021-08-29 19:22:12', NULL),
(807, 404, 'std404', 'jppv1e', '', 'student', '', 0, 'yes', '2021-08-29 19:22:13', NULL),
(808, 404, 'parent404', 'k7v7h1', '404', 'parent', '', 0, 'yes', '2021-08-29 19:22:13', NULL),
(809, 405, 'std405', 'nn7pe1', '', 'student', '', 0, 'yes', '2021-08-29 19:22:33', NULL),
(810, 405, 'parent405', 'xe1shf', '405', 'parent', '', 0, 'yes', '2021-08-29 19:22:33', NULL),
(811, 406, 'std406', '62hq8s', '', 'student', '', 0, 'yes', '2021-08-29 19:22:33', NULL),
(812, 406, 'parent406', 'g2s3zo', '406', 'parent', '', 0, 'yes', '2021-08-29 19:22:33', NULL),
(813, 407, 'std407', '83ipvy', '', 'student', '', 0, 'yes', '2021-08-29 19:22:34', NULL),
(814, 407, 'parent407', '1xvjds', '407', 'parent', '', 0, 'yes', '2021-08-29 19:22:34', NULL),
(815, 408, 'std408', 'l7lw0t', '', 'student', '', 0, 'yes', '2021-08-29 19:22:34', NULL),
(816, 408, 'parent408', 'g7kxyy', '408', 'parent', '', 0, 'yes', '2021-08-29 19:22:34', NULL),
(817, 409, 'std409', 'yj5gnz', '', 'student', '', 0, 'yes', '2021-08-29 19:22:35', NULL),
(818, 409, 'parent409', 'd6sy7k', '409', 'parent', '', 0, 'yes', '2021-08-29 19:22:35', NULL),
(819, 410, 'std410', 'hlj4pb', '', 'student', '', 0, 'yes', '2021-08-29 19:22:35', NULL),
(820, 410, 'parent410', 'gsv17r', '410', 'parent', '', 0, 'yes', '2021-08-29 19:22:35', NULL),
(821, 411, 'std411', 'i0hil2', '', 'student', '', 0, 'yes', '2021-08-29 19:22:36', NULL),
(822, 411, 'parent411', 'ou2m31', '411', 'parent', '', 0, 'yes', '2021-08-29 19:22:36', NULL),
(823, 412, 'std412', 'bh7rdm', '', 'student', '', 0, 'yes', '2021-08-29 19:22:37', NULL),
(824, 412, 'parent412', '5c0g4l', '412', 'parent', '', 0, 'yes', '2021-08-29 19:22:37', NULL),
(825, 413, 'std413', '1fwfe0', '', 'student', '', 0, 'yes', '2021-08-29 19:22:38', NULL),
(826, 413, 'parent413', 'k3phl6', '413', 'parent', '', 0, 'yes', '2021-08-29 19:22:38', NULL),
(827, 414, 'std414', 'h4bh0r', '', 'student', '', 0, 'yes', '2021-08-29 19:22:39', NULL),
(828, 414, 'parent414', 'hf20q3', '414', 'parent', '', 0, 'yes', '2021-08-29 19:22:39', NULL),
(829, 415, 'std415', 'zij800', '', 'student', '', 0, 'yes', '2021-08-29 19:22:40', NULL),
(830, 415, 'parent415', '0sqq4n', '415', 'parent', '', 0, 'yes', '2021-08-29 19:22:40', NULL),
(831, 416, 'std416', 'sh41tq', '', 'student', '', 0, 'yes', '2021-08-29 19:22:41', NULL),
(832, 416, 'parent416', 'w8kun4', '416', 'parent', '', 0, 'yes', '2021-08-29 19:22:41', NULL),
(833, 417, 'std417', 'b4zxc3', '', 'student', '', 0, 'yes', '2021-08-29 19:22:42', NULL),
(834, 417, 'parent417', 'pqa2fk', '417', 'parent', '', 0, 'yes', '2021-08-29 19:22:42', NULL),
(835, 418, 'std418', 'wpcy06', '', 'student', '', 0, 'yes', '2021-08-29 19:22:43', NULL),
(836, 418, 'parent418', 'b0e3m7', '418', 'parent', '', 0, 'yes', '2021-08-29 19:22:43', NULL),
(837, 419, 'std419', 'aak4bz', '', 'student', '', 0, 'yes', '2021-08-29 19:22:44', NULL),
(838, 419, 'parent419', '86i1ts', '419', 'parent', '', 0, 'yes', '2021-08-29 19:22:44', NULL),
(839, 420, 'std420', 'n3eqf9', '', 'student', '', 0, 'yes', '2021-08-29 19:22:44', NULL),
(840, 420, 'parent420', 'm1ci4x', '420', 'parent', '', 0, 'yes', '2021-08-29 19:22:44', NULL),
(841, 421, 'std421', 'n0yx2b', '', 'student', '', 0, 'yes', '2021-08-29 19:22:45', NULL),
(842, 421, 'parent421', '8u0l6r', '421', 'parent', '', 0, 'yes', '2021-08-29 19:22:45', NULL),
(843, 422, 'std422', 'ojs3nx', '', 'student', '', 0, 'yes', '2021-08-29 19:22:46', NULL),
(844, 422, 'parent422', '9b03yg', '422', 'parent', '', 0, 'yes', '2021-08-29 19:22:46', NULL),
(845, 423, 'std423', 'cjdvvw', '', 'student', '', 0, 'yes', '2021-08-29 19:22:47', NULL),
(846, 423, 'parent423', 'v6711d', '423', 'parent', '', 0, 'yes', '2021-08-29 19:22:47', NULL),
(847, 424, 'std424', 'azbk10', '', 'student', '', 0, 'yes', '2021-08-29 19:22:48', NULL),
(848, 424, 'parent424', 'd17hl9', '424', 'parent', '', 0, 'yes', '2021-08-29 19:22:48', NULL),
(849, 425, 'std425', 't34fjv', '', 'student', '', 0, 'yes', '2021-08-29 19:22:49', NULL),
(850, 425, 'parent425', 'dd82hr', '425', 'parent', '', 0, 'yes', '2021-08-29 19:22:49', NULL),
(851, 426, 'std426', 'g9wy0b', '', 'student', '', 0, 'yes', '2021-08-29 19:22:50', NULL),
(852, 426, 'parent426', 'e4slke', '426', 'parent', '', 0, 'yes', '2021-08-29 19:22:50', NULL),
(853, 427, 'std427', 'oikeza', '', 'student', '', 0, 'yes', '2021-08-29 19:22:50', NULL),
(854, 427, 'parent427', 'gdxbve', '427', 'parent', '', 0, 'yes', '2021-08-29 19:22:50', NULL),
(855, 428, 'std428', 'a0dvkh', '', 'student', '', 0, 'yes', '2021-08-29 19:22:51', NULL),
(856, 428, 'parent428', 'zttuwp', '428', 'parent', '', 0, 'yes', '2021-08-29 19:22:51', NULL),
(857, 429, 'std429', 'j2nqgp', '', 'student', '', 0, 'yes', '2021-08-29 19:22:51', NULL),
(858, 429, 'parent429', 'zywg7n', '429', 'parent', '', 0, 'yes', '2021-08-29 19:22:51', NULL),
(859, 430, 'std430', 'dh5gmq', '', 'student', '', 0, 'yes', '2021-08-29 19:22:52', NULL),
(860, 430, 'parent430', 'qasv2g', '430', 'parent', '', 0, 'yes', '2021-08-29 19:22:52', NULL),
(861, 431, 'std431', 't6o4zs', '', 'student', '', 0, 'yes', '2021-08-29 19:22:54', NULL),
(862, 431, 'parent431', '5006k5', '431', 'parent', '', 0, 'yes', '2021-08-29 19:22:54', NULL),
(863, 432, 'std432', 'ucnxx5', '', 'student', '', 0, 'yes', '2021-08-29 19:22:54', NULL),
(864, 432, 'parent432', '0lnt11', '432', 'parent', '', 0, 'yes', '2021-08-29 19:22:54', NULL),
(865, 433, 'std433', 'wz2osh', '', 'student', '', 0, 'yes', '2021-08-29 19:22:55', NULL),
(866, 433, 'parent433', 'rbs2ex', '433', 'parent', '', 0, 'yes', '2021-08-29 19:22:55', NULL),
(867, 434, 'std434', 'met9kk', '', 'student', '', 0, 'yes', '2021-08-29 19:22:56', NULL),
(868, 434, 'parent434', 'a5icl4', '434', 'parent', '', 0, 'yes', '2021-08-29 19:22:56', NULL),
(869, 435, 'std435', 'ua7f54', '', 'student', '', 0, 'yes', '2021-08-29 19:22:57', NULL),
(870, 435, 'parent435', '3tx50s', '435', 'parent', '', 0, 'yes', '2021-08-29 19:22:57', NULL),
(871, 436, 'std436', 'v219px', '', 'student', '', 0, 'yes', '2021-08-29 19:22:58', NULL),
(872, 436, 'parent436', '4jxe4t', '436', 'parent', '', 0, 'yes', '2021-08-29 19:22:58', NULL),
(873, 437, 'std437', 'k961l4', '', 'student', '', 0, 'yes', '2021-08-29 19:22:59', NULL),
(874, 437, 'parent437', 'a5pa0e', '437', 'parent', '', 0, 'yes', '2021-08-29 19:22:59', NULL),
(875, 438, 'std438', 'ojy6um', '', 'student', '', 0, 'yes', '2021-08-29 19:23:00', NULL),
(876, 438, 'parent438', 'g962uh', '438', 'parent', '', 0, 'yes', '2021-08-29 19:23:00', NULL),
(877, 439, 'std439', 'pabw7z', '', 'student', '', 0, 'yes', '2021-08-29 19:23:01', NULL),
(878, 439, 'parent439', 'oaw3tg', '439', 'parent', '', 0, 'yes', '2021-08-29 19:23:01', NULL),
(879, 440, 'std440', 'cqxzln', '', 'student', '', 0, 'yes', '2021-08-29 19:23:03', NULL),
(880, 440, 'parent440', 'zrhs9u', '440', 'parent', '', 0, 'yes', '2021-08-29 19:23:03', NULL),
(881, 441, 'std441', '0hw3uz', '', 'student', '', 0, 'yes', '2021-08-29 19:23:03', NULL),
(882, 441, 'parent441', '4fgiug', '441', 'parent', '', 0, 'yes', '2021-08-29 19:23:03', NULL),
(883, 442, 'std442', 'blbga4', '', 'student', '', 0, 'yes', '2021-08-29 19:23:04', NULL),
(884, 442, 'parent442', '7o8nf7', '442', 'parent', '', 0, 'yes', '2021-08-29 19:23:04', NULL),
(885, 443, 'std443', '83bi4z', '', 'student', '', 0, 'yes', '2021-08-29 19:23:05', NULL),
(886, 443, 'parent443', 'u7jf5m', '443', 'parent', '', 0, 'yes', '2021-08-29 19:23:05', NULL),
(887, 444, 'std444', 'tstevl', '', 'student', '', 0, 'yes', '2021-08-29 19:23:05', NULL),
(888, 444, 'parent444', '2arefh', '444', 'parent', '', 0, 'yes', '2021-08-29 19:23:05', NULL),
(889, 445, 'std445', '25c2g7', '', 'student', '', 0, 'yes', '2021-08-29 19:23:06', NULL),
(890, 445, 'parent445', '7f0tbk', '445', 'parent', '', 0, 'yes', '2021-08-29 19:23:07', NULL),
(891, 446, 'std446', 'ev9stn', '', 'student', '', 0, 'yes', '2021-08-29 19:23:08', NULL),
(892, 446, 'parent446', 'co9yr5', '446', 'parent', '', 0, 'yes', '2021-08-29 19:23:08', NULL),
(893, 447, 'std447', 'k56gc2', '', 'student', '', 0, 'yes', '2021-08-29 19:23:08', NULL),
(894, 447, 'parent447', 'cuuteq', '447', 'parent', '', 0, 'yes', '2021-08-29 19:23:08', NULL),
(895, 448, 'std448', 'jc8o71', '', 'student', '', 0, 'yes', '2021-08-29 19:23:09', NULL),
(896, 448, 'parent448', '7v7aa0', '448', 'parent', '', 0, 'yes', '2021-08-29 19:23:09', NULL),
(897, 449, 'std449', '0syupv', '', 'student', '', 0, 'yes', '2021-08-29 19:23:10', NULL),
(898, 449, 'parent449', 'q71uh9', '449', 'parent', '', 0, 'yes', '2021-08-29 19:23:10', NULL),
(899, 450, 'std450', '8slz0j', '', 'student', '', 0, 'yes', '2021-08-29 19:23:40', NULL),
(900, 450, 'parent450', 'kmyi6l', '450', 'parent', '', 0, 'yes', '2021-08-29 19:23:40', NULL),
(901, 451, 'std451', 'qlqegm', '', 'student', 'VlhDQ3NzQklnRXlCYTJRMWlsNE1GVUJqQ3lLTU52aVl2N1c4dDlTQlBaQT0=', 0, 'yes', '2021-11-03 11:29:08', NULL),
(902, 451, 'parent451', 'gdfqcp', '451', 'parent', '', 0, 'yes', '2021-08-29 19:23:41', NULL),
(903, 452, 'std452', 'bgy39l', '', 'student', '', 0, 'yes', '2021-08-29 19:23:41', NULL),
(904, 452, 'parent452', 'eu3uke', '452', 'parent', '', 0, 'yes', '2021-08-29 19:23:41', NULL),
(905, 453, 'std453', '8t49dq', '', 'student', '', 0, 'yes', '2021-08-29 19:23:41', NULL),
(906, 453, 'parent453', 'o6u15n', '453', 'parent', '', 0, 'yes', '2021-08-29 19:23:41', NULL),
(907, 454, 'std454', 'wbqbko', '', 'student', '', 0, 'yes', '2021-08-29 19:23:42', NULL),
(908, 454, 'parent454', '61kk15', '454', 'parent', '', 0, 'yes', '2021-08-29 19:23:42', NULL),
(909, 455, 'std455', 'u1i5yt', '', 'student', '', 0, 'yes', '2021-08-29 19:23:42', NULL),
(910, 455, 'parent455', 'w753qu', '455', 'parent', '', 0, 'yes', '2021-08-29 19:23:42', NULL),
(911, 456, 'std456', 'jx9jdz', '', 'student', '', 0, 'yes', '2021-08-29 19:23:42', NULL),
(912, 456, 'parent456', 'uwnrr1', '456', 'parent', '', 0, 'yes', '2021-08-29 19:23:42', NULL),
(913, 457, 'std457', 'l02m6o', '', 'student', '', 0, 'yes', '2021-08-29 19:23:43', NULL),
(914, 457, 'parent457', 'lniprn', '457', 'parent', '', 0, 'yes', '2021-08-29 19:23:43', NULL),
(915, 458, 'std458', '4ibg1p', '', 'student', '', 0, 'yes', '2021-08-29 19:23:43', NULL),
(916, 458, 'parent458', 'bjknat', '458', 'parent', '', 0, 'yes', '2021-08-29 19:23:43', NULL),
(917, 459, 'std459', 'dfnjjj', '', 'student', '', 0, 'yes', '2021-08-29 19:23:44', NULL),
(918, 459, 'parent459', '9s459z', '459', 'parent', '', 0, 'yes', '2021-08-29 19:23:44', NULL),
(919, 460, 'std460', '9r05nm', '', 'student', '', 0, 'yes', '2021-08-29 19:23:44', NULL),
(920, 460, 'parent460', '9lhbcb', '460', 'parent', '', 0, 'yes', '2021-08-29 19:23:44', NULL),
(921, 461, 'std461', 'osmqa1', '', 'student', '', 0, 'yes', '2021-08-29 19:23:44', NULL),
(922, 461, 'parent461', '0pasfn', '461', 'parent', '', 0, 'yes', '2021-08-29 19:23:44', NULL),
(923, 462, 'std462', 'sjsx14', '', 'student', '', 0, 'yes', '2021-08-29 19:23:45', NULL),
(924, 462, 'parent462', '32hkgk', '462', 'parent', '', 0, 'yes', '2021-08-29 19:23:45', NULL),
(925, 463, 'std463', 'mw2uk6', '', 'student', '', 0, 'yes', '2021-08-29 19:23:45', NULL),
(926, 463, 'parent463', 'rfeq6l', '463', 'parent', '', 0, 'yes', '2021-08-29 19:23:45', NULL),
(927, 464, 'std464', 'c74omb', '', 'student', '', 0, 'yes', '2021-08-29 19:23:45', NULL),
(928, 464, 'parent464', 'nhee6y', '464', 'parent', '', 0, 'yes', '2021-08-29 19:23:45', NULL),
(929, 465, 'std465', 'tuv95o', '', 'student', '', 0, 'yes', '2021-08-29 19:23:46', NULL),
(930, 465, 'parent465', 'v663hw', '465', 'parent', '', 0, 'yes', '2021-08-29 19:23:46', NULL),
(931, 466, 'std466', 'o88v3t', '', 'student', '', 0, 'yes', '2021-08-29 19:23:46', NULL),
(932, 466, 'parent466', 'eoe4fr', '466', 'parent', '', 0, 'yes', '2021-08-29 19:23:46', NULL),
(933, 467, 'std467', 'pl8dhj', '', 'student', '', 0, 'yes', '2021-08-29 19:23:47', NULL),
(934, 467, 'parent467', '2ift6z', '467', 'parent', '', 0, 'yes', '2021-08-29 19:23:47', NULL),
(935, 468, 'std468', 'dvfg2p', '', 'student', '', 0, 'yes', '2021-08-29 19:23:47', NULL),
(936, 468, 'parent468', 'n93d2s', '468', 'parent', '', 0, 'yes', '2021-08-29 19:23:47', NULL),
(937, 469, 'std469', 'bv0boo', '', 'student', '', 0, 'yes', '2021-08-29 19:23:47', NULL),
(938, 469, 'parent469', 'on372b', '469', 'parent', '', 0, 'yes', '2021-08-29 19:23:47', NULL),
(939, 470, 'std470', 'wjiqdr', '', 'student', '', 0, 'yes', '2021-08-29 19:23:47', NULL),
(940, 470, 'parent470', 'ludctu', '470', 'parent', '', 0, 'yes', '2021-08-29 19:23:47', NULL),
(941, 471, 'std471', '78xrdm', '', 'student', '', 0, 'yes', '2021-08-29 19:23:48', NULL),
(942, 471, 'parent471', '6ialgw', '471', 'parent', '', 0, 'yes', '2021-08-29 19:23:48', NULL),
(943, 472, 'std472', 'lf40xy', '', 'student', '', 0, 'yes', '2021-08-29 19:23:48', NULL),
(944, 472, 'parent472', 'mw0liq', '472', 'parent', '', 0, 'yes', '2021-08-29 19:23:48', NULL),
(945, 473, 'std473', '7lg6wr', '', 'student', '', 0, 'yes', '2021-08-29 19:23:48', NULL),
(946, 473, 'parent473', 'adq31m', '473', 'parent', '', 0, 'yes', '2021-08-29 19:23:48', NULL),
(947, 474, 'std474', '6k30sl', '', 'student', '', 0, 'yes', '2021-08-29 19:25:01', NULL),
(948, 474, 'parent474', 'bwzmsi', '474', 'parent', '', 0, 'yes', '2021-08-29 19:25:01', NULL),
(949, 475, 'std475', '0vrslm', '', 'student', '', 0, 'yes', '2021-08-29 19:25:02', NULL),
(950, 475, 'parent475', 'gieosv', '475', 'parent', '', 0, 'yes', '2021-08-29 19:25:02', NULL),
(951, 476, 'std476', 'bbyv2a', '', 'student', '', 0, 'yes', '2021-08-29 19:25:02', NULL),
(952, 476, 'parent476', 'y3s3g2', '476', 'parent', '', 0, 'yes', '2021-08-29 19:25:02', NULL),
(953, 477, 'std477', 'ql5m0a', '', 'student', '', 0, 'yes', '2021-08-29 19:25:02', NULL),
(954, 477, 'parent477', 'e5pd7k', '477', 'parent', '', 0, 'yes', '2021-08-29 19:25:02', NULL),
(955, 478, 'std478', 'mh8yua', '', 'student', '', 0, 'yes', '2021-08-29 19:25:03', NULL),
(956, 478, 'parent478', 'ztynxt', '478', 'parent', '', 0, 'yes', '2021-08-29 19:25:03', NULL),
(957, 479, 'std479', '1g0vem', '', 'student', '', 0, 'yes', '2021-08-29 19:25:03', NULL),
(958, 479, 'parent479', '72qr4k', '479', 'parent', '', 0, 'yes', '2021-08-29 19:25:03', NULL),
(959, 480, 'std480', '6egb45', '', 'student', '', 0, 'yes', '2021-08-29 19:25:03', NULL),
(960, 480, 'parent480', '4wu5af', '480', 'parent', '', 0, 'yes', '2021-08-29 19:25:03', NULL),
(961, 481, 'std481', '9whidt', '', 'student', '', 0, 'yes', '2021-08-29 19:25:04', NULL),
(962, 481, 'parent481', 'lzeux9', '481', 'parent', '', 0, 'yes', '2021-08-29 19:25:04', NULL),
(963, 482, 'std482', '9jjp1d', '', 'student', '', 0, 'yes', '2021-08-29 19:25:04', NULL),
(964, 482, 'parent482', 'g741xs', '482', 'parent', '', 0, 'yes', '2021-08-29 19:25:04', NULL),
(965, 483, 'std483', 'fy8xk0', '', 'student', '', 0, 'yes', '2021-08-29 19:25:04', NULL),
(966, 483, 'parent483', '7nnw0d', '483', 'parent', '', 0, 'yes', '2021-08-29 19:25:04', NULL),
(967, 484, 'std484', 'gtv63x', '', 'student', '', 0, 'yes', '2021-08-29 19:25:05', NULL),
(968, 484, 'parent484', 'flj4yx', '484', 'parent', '', 0, 'yes', '2021-08-29 19:25:05', NULL),
(969, 485, 'std485', 'up4nlq', '', 'student', '', 0, 'yes', '2021-08-29 19:25:06', NULL),
(970, 485, 'parent485', 'stdgcr', '485', 'parent', '', 0, 'yes', '2021-08-29 19:25:06', NULL),
(971, 486, 'std486', 'ig9d8h', '', 'student', '', 0, 'yes', '2021-08-29 19:25:07', NULL),
(972, 486, 'parent486', 'pqvz33', '486', 'parent', '', 0, 'yes', '2021-08-29 19:25:07', NULL),
(973, 487, 'std487', '9jx8jb', '', 'student', '', 0, 'yes', '2021-08-29 19:25:08', NULL),
(974, 487, 'parent487', '7j1vr4', '487', 'parent', '', 0, 'yes', '2021-08-29 19:25:08', NULL),
(975, 488, 'std488', '75lfwg', '', 'student', '', 0, 'yes', '2021-08-29 19:25:08', NULL),
(976, 488, 'parent488', 'nb859t', '488', 'parent', '', 0, 'yes', '2021-08-29 19:25:08', NULL),
(977, 489, 'std489', '9j4w1d', '', 'student', '', 0, 'yes', '2021-08-29 19:25:27', NULL),
(978, 489, 'parent489', 'q5a1wv', '489', 'parent', '', 0, 'yes', '2021-08-29 19:25:27', NULL),
(979, 490, 'std490', '4g8738', '', 'student', '', 0, 'yes', '2021-08-29 19:25:28', NULL),
(980, 490, 'parent490', 'u579nt', '490', 'parent', '', 0, 'yes', '2021-08-29 19:25:28', NULL),
(981, 491, 'std491', '7b5e2m', '', 'student', '', 0, 'yes', '2021-08-29 19:25:29', NULL),
(982, 491, 'parent491', 'z4ggqn', '491', 'parent', '', 0, 'yes', '2021-08-29 19:25:29', NULL),
(983, 492, 'std492', '3qkune', '', 'student', '', 0, 'yes', '2021-08-29 19:25:30', NULL),
(984, 492, 'parent492', 'gou0ue', '492', 'parent', '', 0, 'yes', '2021-08-29 19:25:30', NULL),
(985, 493, 'std493', 'oj8e0b', '', 'student', '', 0, 'yes', '2021-08-29 19:25:31', NULL),
(986, 493, 'parent493', 'si47d7', '493', 'parent', '', 0, 'yes', '2021-08-29 19:25:31', NULL),
(987, 494, 'std494', 'enu88d', '', 'student', '', 0, 'yes', '2021-08-29 19:25:32', NULL),
(988, 494, 'parent494', '131je9', '494', 'parent', '', 0, 'yes', '2021-08-29 19:25:32', NULL),
(989, 495, 'std495', 'v9pszw', '', 'student', '', 0, 'yes', '2021-08-29 19:25:33', NULL),
(990, 495, 'parent495', '1bwyzl', '495', 'parent', '', 0, 'yes', '2021-08-29 19:25:33', NULL),
(991, 496, 'std496', 'imwsvm', '', 'student', '', 0, 'yes', '2021-08-29 19:25:34', NULL),
(992, 496, 'parent496', 'fpoby2', '496', 'parent', '', 0, 'yes', '2021-08-29 19:25:34', NULL),
(993, 497, 'std497', '7sb74x', '', 'student', '', 0, 'yes', '2021-08-29 19:25:35', NULL),
(994, 497, 'parent497', '357br5', '497', 'parent', '', 0, 'yes', '2021-08-29 19:25:35', NULL),
(995, 498, 'std498', 'gk6xyp', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(996, 498, 'parent498', 'gdtsm2', '498', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(997, 499, 'std499', '4liqc1', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(998, 499, 'parent499', '5zuedy', '499', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(999, 500, 'std500', 'zxd5ev', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1000, 500, 'parent500', '3geizi', '500', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1001, 501, 'std501', 'yv5w6u', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1002, 501, 'parent501', 'r1oquv', '501', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1003, 502, 'std502', 'wpfkb6', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1004, 502, 'parent502', '281agq', '502', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1005, 503, 'std503', 'mxvub8', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1006, 503, 'parent503', 't8bt9k', '503', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1007, 504, 'std504', 'dn9buu', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1008, 504, 'parent504', '1azj52', '504', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1009, 505, 'std505', 'rxhbu2', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1010, 505, 'parent505', '8u4wpk', '505', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1011, 506, 'std506', '0pavlv', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1012, 506, 'parent506', 'pe4jve', '506', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1013, 507, 'std507', '29f54s', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1014, 507, 'parent507', 'trk830', '507', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1015, 508, 'std508', 'mmkvhd', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1016, 508, 'parent508', 'pjwyzr', '508', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1017, 509, 'std509', 'bhspp4', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1018, 509, 'parent509', '4nrnlr', '509', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1019, 510, 'std510', 'zzj0m2', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1020, 510, 'parent510', 'rdrj1k', '510', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1021, 511, 'std511', 'kj60lf', '', 'student', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1022, 511, 'parent511', 'ha81z2', '511', 'parent', '', 0, 'yes', '2021-08-29 19:26:15', NULL),
(1023, 512, 'std512', 'wknsai', '', 'student', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1024, 512, 'parent512', 'h3xi02', '512', 'parent', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1025, 513, 'std513', 'pzrqz8', '', 'student', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1026, 513, 'parent513', '0nowp0', '513', 'parent', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1027, 514, 'std514', '73qsl2', '', 'student', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1028, 514, 'parent514', 'lxe0ei', '514', 'parent', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1029, 515, 'std515', 'in5x0b', '', 'student', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1030, 515, 'parent515', 'p4f98r', '515', 'parent', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1031, 516, 'std516', 'yeflzo', '', 'student', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1032, 516, 'parent516', 'blddv6', '516', 'parent', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1033, 517, 'std517', '5ybqlj', '', 'student', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1034, 517, 'parent517', 'usd3h4', '517', 'parent', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1035, 518, 'std518', 'gj6smy', '', 'student', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1036, 518, 'parent518', 'jtam6i', '518', 'parent', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1037, 519, 'std519', 'dwot0t', '', 'student', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1038, 519, 'parent519', '1jskq1', '519', 'parent', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1039, 520, 'std520', 'x4o1c0', '', 'student', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1040, 520, 'parent520', 'mn10tz', '520', 'parent', '', 0, 'yes', '2021-08-29 19:26:16', NULL),
(1041, 521, 'std521', 's6f4om', '', 'student', '', 0, 'yes', '2021-08-29 19:39:51', NULL),
(1042, 521, 'parent521', 'q75syd', '521', 'parent', '', 0, 'yes', '2021-08-29 19:39:51', NULL),
(1043, 522, 'std522', '704qv1', '', 'student', '', 0, 'yes', '2021-08-29 19:39:52', NULL),
(1044, 522, 'parent522', '9l4vjv', '522', 'parent', '', 0, 'yes', '2021-08-29 19:39:52', NULL),
(1045, 523, 'std523', '5lnhj9', '', 'student', '', 0, 'yes', '2021-08-29 19:39:53', NULL),
(1046, 523, 'parent523', 'xqtn4k', '523', 'parent', '', 0, 'yes', '2021-08-29 19:39:53', NULL),
(1047, 524, 'std524', '6tsxiq', '', 'student', '', 0, 'yes', '2021-08-29 19:39:54', NULL),
(1048, 524, 'parent524', '8z1gtv', '524', 'parent', '', 0, 'yes', '2021-08-29 19:39:54', NULL),
(1049, 525, 'std525', 'l5xwy8', '', 'student', '', 0, 'yes', '2021-08-29 19:39:55', NULL),
(1050, 525, 'parent525', 'r5d0fy', '525', 'parent', '', 0, 'yes', '2021-08-29 19:39:55', NULL),
(1051, 526, 'std526', 'mlawqy', '', 'student', '', 0, 'yes', '2021-08-29 19:39:56', NULL),
(1052, 526, 'parent526', '76f6od', '526', 'parent', '', 0, 'yes', '2021-08-29 19:39:56', NULL),
(1053, 527, 'std527', '31s1sl', '', 'student', '', 0, 'yes', '2021-08-29 19:39:57', NULL),
(1054, 527, 'parent527', 'ukkidl', '527', 'parent', '', 0, 'yes', '2021-08-29 19:39:57', NULL),
(1055, 528, 'std528', 'hyum0f', '', 'student', '', 0, 'yes', '2021-08-29 19:39:58', NULL),
(1056, 528, 'parent528', 'wtrf4n', '528', 'parent', '', 0, 'yes', '2021-08-29 19:39:58', NULL),
(1057, 529, 'std529', 'gbuhq7', '', 'student', '', 0, 'yes', '2021-08-29 19:39:59', NULL),
(1058, 529, 'parent529', 'jkszl5', '529', 'parent', '', 0, 'yes', '2021-08-29 19:39:59', NULL),
(1059, 530, 'std530', 'rl8kr7', '', 'student', '', 0, 'yes', '2021-08-29 19:40:00', NULL),
(1060, 530, 'parent530', '5txnb4', '530', 'parent', '', 0, 'yes', '2021-08-29 19:40:00', NULL),
(1061, 531, 'std531', 'ym1fwn', '', 'student', '', 0, 'yes', '2021-08-29 19:40:01', NULL),
(1062, 531, 'parent531', '89o3l0', '531', 'parent', '', 0, 'yes', '2021-08-29 19:40:01', NULL),
(1063, 532, 'std532', '9wcq8s', '', 'student', '', 0, 'yes', '2021-08-29 19:40:02', NULL),
(1064, 532, 'parent532', '389csx', '532', 'parent', '', 0, 'yes', '2021-08-29 19:40:02', NULL),
(1065, 533, 'std533', 'hzzinh', '', 'student', '', 0, 'yes', '2021-08-29 19:40:03', NULL),
(1066, 533, 'parent533', 'lc58zk', '533', 'parent', '', 0, 'yes', '2021-08-29 19:40:03', NULL),
(1067, 534, 'std534', 'jkwsjw', '', 'student', '', 0, 'yes', '2021-08-29 19:40:04', NULL),
(1068, 534, 'parent534', 'iev6hr', '534', 'parent', '', 0, 'yes', '2021-08-29 19:40:04', NULL),
(1069, 535, 'std535', 'xo7mtk', '', 'student', '', 0, 'yes', '2021-08-29 19:40:05', NULL),
(1070, 535, 'parent535', '68hf2r', '535', 'parent', '', 0, 'yes', '2021-08-29 19:40:05', NULL),
(1071, 536, 'std536', '7l1uo8', '', 'student', '', 0, 'yes', '2021-08-29 19:40:06', NULL),
(1072, 536, 'parent536', 'ctc52e', '536', 'parent', '', 0, 'yes', '2021-08-29 19:40:06', NULL),
(1073, 537, 'std537', 'qene0g', '', 'student', '', 0, 'yes', '2021-08-29 19:40:07', NULL),
(1074, 537, 'parent537', 'qv49h0', '537', 'parent', '', 0, 'yes', '2021-08-29 19:40:07', NULL),
(1075, 538, 'std538', '91anye', '', 'student', '', 0, 'yes', '2021-08-29 19:41:44', NULL),
(1076, 538, 'parent538', 'cq3i6b', '538', 'parent', '', 0, 'yes', '2021-08-29 19:41:44', NULL),
(1077, 539, 'std539', 'hqhgx4', '', 'student', '', 0, 'yes', '2021-08-29 19:41:45', NULL),
(1078, 539, 'parent539', '3b2oxx', '539', 'parent', '', 0, 'yes', '2021-08-29 19:41:45', NULL),
(1079, 540, 'std540', '4dtbda', '', 'student', '', 0, 'yes', '2021-08-29 19:41:46', NULL),
(1080, 540, 'parent540', 'd5cjra', '540', 'parent', '', 0, 'yes', '2021-08-29 19:41:46', NULL),
(1081, 541, 'std541', 'wn1xri', '', 'student', '', 0, 'yes', '2021-08-29 19:41:47', NULL),
(1082, 541, 'parent541', 'itsyiz', '541', 'parent', '', 0, 'yes', '2021-08-29 19:41:47', NULL),
(1083, 542, 'std542', 's1oif1', '', 'student', '', 0, 'yes', '2021-08-29 19:41:47', NULL),
(1084, 542, 'parent542', 'a1bszu', '542', 'parent', '', 0, 'yes', '2021-08-29 19:41:47', NULL),
(1085, 543, 'std543', '550muv', '', 'student', '', 0, 'yes', '2021-08-29 19:41:48', NULL),
(1086, 543, 'parent543', 'dekret', '543', 'parent', '', 0, 'yes', '2021-08-29 19:41:48', NULL),
(1087, 544, 'std544', 'shs3o2', '', 'student', '', 0, 'yes', '2021-08-29 19:41:49', NULL),
(1088, 544, 'parent544', 'h4j2wk', '544', 'parent', '', 0, 'yes', '2021-08-29 19:41:49', NULL),
(1089, 545, 'std545', 'vl63c2', '', 'student', '', 0, 'yes', '2021-08-29 19:41:50', NULL),
(1090, 545, 'parent545', 'f8zovh', '545', 'parent', '', 0, 'yes', '2021-08-29 19:41:50', NULL),
(1091, 546, 'std546', 'b33ii7', '', 'student', '', 0, 'yes', '2021-08-29 19:41:51', NULL),
(1092, 546, 'parent546', 'cvviim', '546', 'parent', '', 0, 'yes', '2021-08-29 19:41:51', NULL),
(1093, 547, 'std547', 'u3xb9y', '', 'student', '', 0, 'yes', '2021-08-29 19:41:52', NULL),
(1094, 547, 'parent547', 'dxq8c3', '547', 'parent', '', 0, 'yes', '2021-08-29 19:41:52', NULL),
(1095, 548, 'std548', '8k2rde', '', 'student', '', 0, 'yes', '2021-08-29 19:41:53', NULL),
(1096, 548, 'parent548', '9ztjvg', '548', 'parent', '', 0, 'yes', '2021-08-29 19:41:53', NULL),
(1097, 549, 'std549', 'csq7nb', '', 'student', '', 0, 'yes', '2021-08-29 19:41:54', NULL),
(1098, 549, 'parent549', 'ti8kv2', '549', 'parent', '', 0, 'yes', '2021-08-29 19:41:54', NULL),
(1099, 550, 'std550', 'enmgeb', '', 'student', '', 0, 'yes', '2021-08-29 19:41:54', NULL),
(1100, 550, 'parent550', 'yr1ir8', '550', 'parent', '', 0, 'yes', '2021-08-29 19:41:54', NULL),
(1101, 551, 'std551', '3icmgr', '', 'student', '', 0, 'yes', '2021-08-29 19:41:54', NULL),
(1102, 551, 'parent551', 'mscker', '551', 'parent', '', 0, 'yes', '2021-08-29 19:41:54', NULL),
(1103, 552, 'std552', 'oqsim4', '', 'student', '', 0, 'yes', '2021-08-29 19:41:54', NULL),
(1104, 552, 'parent552', 'lkj40y', '552', 'parent', '', 0, 'yes', '2021-08-29 19:41:54', NULL),
(1105, 553, 'std553', 'ddvuy8', '', 'student', '', 0, 'yes', '2021-08-30 06:57:23', NULL),
(1106, 553, 'parent553', '18tpps', '553', 'parent', '', 0, 'yes', '2021-08-30 06:57:23', NULL),
(1107, 554, 'std554', '4aouiw', '', 'student', '', 0, 'yes', '2021-08-30 06:57:25', NULL),
(1108, 554, 'parent554', 'csekx1', '554', 'parent', '', 0, 'yes', '2021-08-30 06:57:25', NULL),
(1109, 555, 'std555', 'wyiko8', '', 'student', '', 0, 'yes', '2021-08-30 06:57:26', NULL),
(1110, 555, 'parent555', 'gpwsvr', '555', 'parent', '', 0, 'yes', '2021-08-30 06:57:26', NULL),
(1111, 556, 'std556', 'zrv978', '', 'student', '', 0, 'yes', '2021-08-30 06:57:26', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1112, 556, 'parent556', 'lw1wtv', '556', 'parent', '', 0, 'yes', '2021-08-30 06:57:26', NULL),
(1113, 557, 'std557', 'zi5v1q', '', 'student', '', 0, 'yes', '2021-08-30 06:57:27', NULL),
(1114, 557, 'parent557', 'b20e2h', '557', 'parent', '', 0, 'yes', '2021-08-30 06:57:27', NULL),
(1115, 558, 'std558', 'nd55ie', '', 'student', '', 0, 'yes', '2021-08-30 06:57:28', NULL),
(1116, 558, 'parent558', 'f7pnig', '558', 'parent', '', 0, 'yes', '2021-08-30 06:57:28', NULL),
(1117, 559, 'std559', 'udfjb0', '', 'student', '', 0, 'yes', '2021-08-30 06:57:29', NULL),
(1118, 559, 'parent559', 'jqtti6', '559', 'parent', '', 0, 'yes', '2021-08-30 06:57:29', NULL),
(1119, 560, 'std560', 'kdvk1f', '', 'student', '', 0, 'yes', '2021-08-30 06:57:31', NULL),
(1120, 560, 'parent560', 'ww5tw5', '560', 'parent', '', 0, 'yes', '2021-08-30 06:57:31', NULL),
(1121, 561, 'std561', 'u88qes', '', 'student', '', 0, 'yes', '2021-08-30 06:57:32', NULL),
(1122, 561, 'parent561', 'ubl9kn', '561', 'parent', '', 0, 'yes', '2021-08-30 06:57:32', NULL),
(1123, 562, 'std562', 'a776ye', '', 'student', '', 0, 'yes', '2021-08-30 06:57:33', NULL),
(1124, 562, 'parent562', 'dlym09', '562', 'parent', '', 0, 'yes', '2021-08-30 06:57:33', NULL),
(1125, 563, 'std563', 'dy4k5s', '', 'student', '', 0, 'yes', '2021-08-30 06:57:34', NULL),
(1126, 563, 'parent563', 'h2agv6', '563', 'parent', '', 0, 'yes', '2021-08-30 06:57:34', NULL),
(1127, 564, 'std564', 'cqkh0x', '', 'student', '', 0, 'yes', '2021-08-30 06:57:35', NULL),
(1128, 564, 'parent564', 'i4vlvn', '564', 'parent', '', 0, 'yes', '2021-08-30 06:57:35', NULL),
(1129, 565, 'std565', 'u8jrhh', '', 'student', '', 0, 'yes', '2021-08-30 06:57:36', NULL),
(1130, 565, 'parent565', '52f7l6', '565', 'parent', '', 0, 'yes', '2021-08-30 06:57:36', NULL),
(1131, 566, 'std566', 'henbdq', '', 'student', '', 0, 'yes', '2021-08-30 06:57:37', NULL),
(1132, 566, 'parent566', 'zlo2s4', '566', 'parent', '', 0, 'yes', '2021-08-30 06:57:37', NULL),
(1133, 567, 'std567', '30r8bk', '', 'student', '', 0, 'yes', '2021-08-30 06:57:39', NULL),
(1134, 567, 'parent567', '1e75mw', '567', 'parent', '', 0, 'yes', '2021-08-30 06:57:40', NULL),
(1135, 568, 'std568', 'sdlyxc', '', 'student', '', 0, 'yes', '2021-08-30 06:57:41', NULL),
(1136, 568, 'parent568', '9eiowq', '568', 'parent', '', 0, 'yes', '2021-08-30 06:57:41', NULL),
(1137, 569, 'std569', 'vkbpin', '', 'student', '', 0, 'yes', '2021-08-30 06:57:42', NULL),
(1138, 569, 'parent569', 'zo29ck', '569', 'parent', '', 0, 'yes', '2021-08-30 06:57:42', NULL),
(1139, 570, 'std570', 'wi7ewc', '', 'student', '', 0, 'yes', '2021-08-30 06:57:44', NULL),
(1140, 570, 'parent570', 'e9suyg', '570', 'parent', '', 0, 'yes', '2021-08-30 06:57:44', NULL),
(1141, 571, 'std571', 'jxynik', '', 'student', '', 0, 'yes', '2021-08-30 06:57:45', NULL),
(1142, 571, 'parent571', 'yx8atn', '571', 'parent', '', 0, 'yes', '2021-08-30 06:57:45', NULL),
(1143, 572, 'std572', '25851w', '', 'student', '', 0, 'yes', '2021-08-30 06:57:46', NULL),
(1144, 572, 'parent572', 'dq2s6g', '572', 'parent', '', 0, 'yes', '2021-08-30 06:57:46', NULL),
(1145, 573, 'std573', '2kvxhs', '', 'student', '', 0, 'yes', '2021-08-30 06:57:47', NULL),
(1146, 573, 'parent573', 'p4mx35', '573', 'parent', '', 0, 'yes', '2021-08-30 06:57:47', NULL),
(1147, 574, 'std574', '4oqacf', '', 'student', '', 0, 'yes', '2021-08-30 06:57:48', NULL),
(1148, 574, 'parent574', 'kzkfr6', '574', 'parent', '', 0, 'yes', '2021-08-30 06:57:48', NULL),
(1149, 575, 'std575', 'k2evaa', '', 'student', '', 0, 'yes', '2021-08-30 06:57:49', NULL),
(1150, 575, 'parent575', 'hb9mon', '575', 'parent', '', 0, 'yes', '2021-08-30 06:57:49', NULL),
(1151, 576, 'std576', '2nsx3b', '', 'student', '', 0, 'yes', '2021-08-30 06:58:28', NULL),
(1152, 576, 'parent576', 'f001tb', '576', 'parent', '', 0, 'yes', '2021-08-30 06:58:28', NULL),
(1153, 577, 'std577', 'iit36x', '', 'student', '', 0, 'yes', '2021-08-30 06:58:29', NULL),
(1154, 577, 'parent577', '63zh6p', '577', 'parent', '', 0, 'yes', '2021-08-30 06:58:29', NULL),
(1155, 578, 'std578', 'jrfm32', '', 'student', '', 0, 'yes', '2021-08-30 06:58:31', NULL),
(1156, 578, 'parent578', 'rzz36c', '578', 'parent', '', 0, 'yes', '2021-08-30 06:58:31', NULL),
(1157, 579, 'std579', 'kwm2zi', '', 'student', '', 0, 'yes', '2021-08-30 06:58:32', NULL),
(1158, 579, 'parent579', 'qqgfag', '579', 'parent', '', 0, 'yes', '2021-08-30 06:58:32', NULL),
(1159, 580, 'std580', 'uf8fuk', '', 'student', '', 0, 'yes', '2021-08-30 06:58:32', NULL),
(1160, 580, 'parent580', '2sr16p', '580', 'parent', '', 0, 'yes', '2021-08-30 06:58:32', NULL),
(1161, 581, 'std581', 'm2wp4i', '', 'student', '', 0, 'yes', '2021-08-30 06:58:33', NULL),
(1162, 581, 'parent581', 'mi7b7c', '581', 'parent', '', 0, 'yes', '2021-08-30 06:58:33', NULL),
(1163, 582, 'std582', 'nfum31', '', 'student', '', 0, 'yes', '2021-08-30 06:58:34', NULL),
(1164, 582, 'parent582', 'bxdvgp', '582', 'parent', '', 0, 'yes', '2021-08-30 06:58:34', NULL),
(1165, 583, 'std583', '7gb4sc', '', 'student', '', 0, 'yes', '2021-08-30 06:58:35', NULL),
(1166, 583, 'parent583', 'rlfzqc', '583', 'parent', '', 0, 'yes', '2021-08-30 06:58:35', NULL),
(1167, 584, 'std584', '02rctl', '', 'student', '', 0, 'yes', '2021-08-30 06:58:36', NULL),
(1168, 584, 'parent584', '8u25na', '584', 'parent', '', 0, 'yes', '2021-08-30 06:58:36', NULL),
(1169, 585, 'std585', 'xd05au', '', 'student', '', 0, 'yes', '2021-08-30 06:58:37', NULL),
(1170, 585, 'parent585', 'w6z3hk', '585', 'parent', '', 0, 'yes', '2021-08-30 06:58:37', NULL),
(1171, 586, 'std586', 'k8vsib', '', 'student', '', 0, 'yes', '2021-08-30 06:58:38', NULL),
(1172, 586, 'parent586', 'wdqupc', '586', 'parent', '', 0, 'yes', '2021-08-30 06:58:38', NULL),
(1173, 587, 'std587', 'nn1pbu', '', 'student', '', 0, 'yes', '2021-08-30 06:58:40', NULL),
(1174, 587, 'parent587', 'rlf3ku', '587', 'parent', '', 0, 'yes', '2021-08-30 06:58:40', NULL),
(1175, 588, 'std588', '4qbujs', '', 'student', '', 0, 'yes', '2021-08-30 06:58:41', NULL),
(1176, 588, 'parent588', '5940c7', '588', 'parent', '', 0, 'yes', '2021-08-30 06:58:41', NULL),
(1177, 589, 'std589', '3aie9h', '', 'student', '', 0, 'yes', '2021-08-30 06:58:41', NULL),
(1178, 589, 'parent589', 'tizjyn', '589', 'parent', '', 0, 'yes', '2021-08-30 06:58:41', NULL),
(1179, 590, 'std590', 'dmsys1', '', 'student', '', 0, 'yes', '2021-08-30 06:58:41', NULL),
(1180, 590, 'parent590', 'wma16k', '590', 'parent', '', 0, 'yes', '2021-08-30 06:58:41', NULL),
(1181, 591, 'std591', 'cby724', '', 'student', '', 0, 'yes', '2021-08-30 06:59:21', NULL),
(1182, 591, 'parent591', 'rl71nd', '591', 'parent', '', 0, 'yes', '2021-08-30 06:59:21', NULL),
(1183, 592, 'std592', 'oa19v9', '', 'student', '', 0, 'yes', '2021-08-30 06:59:22', NULL),
(1184, 592, 'parent592', 'howkqk', '592', 'parent', '', 0, 'yes', '2021-08-30 06:59:22', NULL),
(1185, 593, 'std593', 'o8nlze', '', 'student', '', 0, 'yes', '2021-08-30 06:59:23', NULL),
(1186, 593, 'parent593', 'dwey4t', '593', 'parent', '', 0, 'yes', '2021-08-30 06:59:23', NULL),
(1187, 594, 'std594', '5hte2y', '', 'student', '', 0, 'yes', '2021-08-30 06:59:24', NULL),
(1188, 594, 'parent594', 't8mw9n', '594', 'parent', '', 0, 'yes', '2021-08-30 06:59:24', NULL),
(1189, 595, 'std595', '9oe0f1', '', 'student', '', 0, 'yes', '2021-08-30 06:59:25', NULL),
(1190, 595, 'parent595', '1tj22u', '595', 'parent', '', 0, 'yes', '2021-08-30 06:59:25', NULL),
(1191, 596, 'std596', 'okv8dd', '', 'student', '', 0, 'yes', '2021-08-30 06:59:27', NULL),
(1192, 596, 'parent596', 's98rp4', '596', 'parent', '', 0, 'yes', '2021-08-30 06:59:27', NULL),
(1193, 597, 'std597', 'e89wc9', '', 'student', '', 0, 'yes', '2021-08-30 06:59:28', NULL),
(1194, 597, 'parent597', '5el5k3', '597', 'parent', '', 0, 'yes', '2021-08-30 06:59:28', NULL),
(1195, 598, 'std598', 'b7vu81', '', 'student', '', 0, 'yes', '2021-08-30 06:59:29', NULL),
(1196, 598, 'parent598', 'upeu0v', '598', 'parent', '', 0, 'yes', '2021-08-30 06:59:29', NULL),
(1197, 599, 'std599', '19760410mcm', '', 'student', '', 0, 'yes', '2021-08-30 07:41:58', NULL),
(1198, 599, 'parent599', '6zs8q3', '599', 'parent', '', 0, 'yes', '2021-08-30 07:10:35', NULL),
(1199, 600, 'std600', 'minuyq', '', 'student', '', 0, 'yes', '2021-08-30 07:10:36', NULL),
(1200, 600, 'parent600', 'jwugm1', '600', 'parent', '', 0, 'yes', '2021-08-30 07:10:36', NULL),
(1201, 601, 'std601', 'bwruqu', '', 'student', '', 0, 'yes', '2021-08-30 07:10:38', NULL),
(1202, 601, 'parent601', '9plvs1', '601', 'parent', '', 0, 'yes', '2021-08-30 07:10:38', NULL),
(1203, 602, 'std602', 'mvz94s', '', 'student', '', 0, 'yes', '2021-08-30 07:10:39', NULL),
(1204, 602, 'parent602', '3y1xll', '602', 'parent', '', 0, 'yes', '2021-08-30 07:10:39', NULL),
(1205, 603, 'Dinassck', 'Dinassck@123', '', 'student', '', 0, 'yes', '2021-08-31 14:49:42', NULL),
(1206, 603, 'parent603', 'cpbbn7', '603', 'parent', '', 0, 'yes', '2021-08-30 07:10:40', NULL),
(1207, 604, 'std604', 'xqcac9', '', 'student', '', 0, 'yes', '2021-08-30 07:10:42', NULL),
(1208, 604, 'parent604', 'l9jozc', '604', 'parent', '', 0, 'yes', '2021-08-30 07:10:42', NULL),
(1209, 605, 'std605', 'i2uxzr', '', 'student', '', 0, 'yes', '2021-08-30 07:10:43', NULL),
(1210, 605, 'parent605', 'a6do5t', '605', 'parent', '', 0, 'yes', '2021-08-30 07:10:43', NULL),
(1211, 606, 'std606', '8zmc0m', '', 'student', '', 0, 'yes', '2021-08-30 07:10:45', NULL),
(1212, 606, 'parent606', 'i3ygh9', '606', 'parent', '', 0, 'yes', '2021-08-30 07:10:45', NULL),
(1213, 607, 'std607', '2ebn63', '', 'student', '', 0, 'yes', '2021-08-30 07:10:46', NULL),
(1214, 607, 'parent607', 'wnsfz2', '607', 'parent', '', 0, 'yes', '2021-08-30 07:10:46', NULL),
(1215, 608, 'std608', 'sau6we', '', 'student', '', 0, 'yes', '2021-08-30 07:10:47', NULL),
(1216, 608, 'parent608', 'u95b3u', '608', 'parent', '', 0, 'yes', '2021-08-30 07:10:47', NULL),
(1217, 609, 'std609', 'txtusb', '', 'student', '', 0, 'yes', '2021-08-30 07:10:49', NULL),
(1218, 609, 'parent609', 'pjcpht', '609', 'parent', '', 0, 'yes', '2021-08-30 07:10:49', NULL),
(1219, 610, 'std610', 'spk83j', '', 'student', '', 0, 'yes', '2021-08-30 07:10:50', NULL),
(1220, 610, 'parent610', 'gqxy8t', '610', 'parent', '', 0, 'yes', '2021-08-30 07:10:50', NULL),
(1221, 611, 'std611', 'ebx3jv', '', 'student', '', 0, 'yes', '2021-08-30 07:10:51', NULL),
(1222, 611, 'parent611', 'r4fwok', '611', 'parent', '', 0, 'yes', '2021-08-30 07:10:51', NULL),
(1223, 612, 'std612', 'mnnwf4', '', 'student', '', 0, 'yes', '2021-08-30 07:10:53', NULL),
(1224, 612, 'parent612', '0x9y81', '612', 'parent', '', 0, 'yes', '2021-08-30 07:10:53', NULL),
(1225, 613, 'std613', 'lqvxdr', '', 'student', '', 0, 'yes', '2021-08-30 07:10:54', NULL),
(1226, 613, 'parent613', 'eu09fv', '613', 'parent', '', 0, 'yes', '2021-08-30 07:10:54', NULL),
(1233, 617, 'std617', 'r89lhf', '', 'student', '', 0, 'yes', '2021-09-13 06:30:05', NULL),
(1234, 0, 'parent617', 'ndj7qs', '617', 'parent', '', 0, 'yes', '2021-09-13 06:30:05', NULL),
(1235, 618, 'std618', 'nh7lvh', '', 'student', '', 0, 'yes', '2021-09-13 06:43:35', NULL),
(1236, 0, 'parent618', 'dnzc40', '618', 'parent', '', 0, 'yes', '2021-09-13 06:43:35', NULL),
(1237, 619, 'std619', 'bohuur', '', 'student', '', 0, 'yes', '2021-09-13 07:10:16', NULL),
(1238, 0, 'parent619', 'cav00w', '619', 'parent', '', 0, 'yes', '2021-09-13 07:10:16', NULL),
(1239, 620, 'std620', 'wd8k99', '', 'student', '', 0, 'yes', '2021-09-22 05:02:29', NULL),
(1240, 0, 'parent620', 'e02o00', '620', 'parent', '', 0, 'yes', '2021-09-22 05:02:29', NULL),
(1241, 621, 'std621', 'sztjri', '', 'student', '', 0, 'yes', '2021-09-22 05:31:17', NULL),
(1242, 0, 'parent621', 'hrw1z5', '621', 'parent', '', 0, 'yes', '2021-09-22 05:31:17', NULL),
(1243, 622, 'std622', '62xxvk', '', 'student', '', 0, 'yes', '2021-09-22 05:35:51', NULL),
(1244, 0, 'parent622', 'rampym', '622', 'parent', '', 0, 'yes', '2021-09-22 05:35:51', NULL),
(1245, 623, 'std623', 'r1yo1u', '', 'student', '', 0, 'yes', '2021-09-22 05:38:59', NULL),
(1246, 0, 'parent623', 'durb66', '623', 'parent', '', 0, 'yes', '2021-09-22 05:38:59', NULL),
(1247, 624, 'std624', 'gsyil2', '', 'student', '', 0, 'yes', '2021-09-22 05:41:47', NULL),
(1248, 0, 'parent624', '0rvd44', '624', 'parent', '', 0, 'yes', '2021-09-22 05:41:47', NULL),
(1249, 625, 'std625', 'dc33wz', '', 'student', '', 0, 'yes', '2021-09-22 05:44:28', NULL),
(1250, 0, 'parent625', '13umtj', '625', 'parent', '', 0, 'yes', '2021-09-22 05:44:28', NULL),
(1251, 626, 'std626', '38b5yy', '', 'student', '', 0, 'yes', '2021-09-22 05:47:17', NULL),
(1252, 0, 'parent626', 'nrus9x', '626', 'parent', '', 0, 'yes', '2021-09-22 05:47:17', NULL),
(1253, 627, 'std627', 'jtw9a3', '', 'student', '', 0, 'yes', '2021-09-22 05:53:11', NULL),
(1254, 0, 'parent627', 'lj6evj', '627', 'parent', '', 0, 'yes', '2021-09-22 05:53:11', NULL),
(1255, 628, 'std628', 'g74rvi', '', 'student', '', 0, 'yes', '2021-09-22 05:56:28', NULL),
(1256, 0, 'parent628', 'yal8mi', '628', 'parent', '', 0, 'yes', '2021-09-22 05:56:28', NULL),
(1257, 629, 'std629', 'ioxjob', '', 'student', '', 0, 'yes', '2021-09-22 06:02:24', NULL),
(1258, 0, 'parent629', '2cj3rj', '629', 'parent', '', 0, 'yes', '2021-09-22 06:02:24', NULL),
(1259, 630, 'std630', '0kbz3y', '', 'student', '', 0, 'yes', '2021-09-22 06:05:15', NULL),
(1260, 0, 'parent630', 'rldzog', '630', 'parent', '', 0, 'yes', '2021-09-22 06:05:15', NULL),
(1261, 631, 'std631', '7ognsq', '', 'student', '', 0, 'yes', '2021-09-22 06:08:21', NULL),
(1262, 0, 'parent631', 'g5jrb0', '631', 'parent', '', 0, 'yes', '2021-09-22 06:08:21', NULL),
(1263, 632, 'std632', '7mc9pe', '', 'student', '', 0, 'yes', '2021-09-22 06:23:13', NULL),
(1264, 0, 'parent632', 'y2p93h', '632', 'parent', '', 0, 'yes', '2021-09-22 06:23:13', NULL),
(1265, 633, 'std633', 'qd1614', '', 'student', '', 0, 'yes', '2021-09-22 06:28:10', NULL),
(1266, 0, 'parent633', 'i3pcwc', '633', 'parent', '', 0, 'yes', '2021-09-22 06:28:10', NULL),
(1267, 634, 'std634', 'voz27i', '', 'student', '', 0, 'yes', '2021-09-22 06:30:51', NULL),
(1268, 0, 'parent634', 'djj9ym', '634', 'parent', '', 0, 'yes', '2021-09-22 06:30:51', NULL),
(1269, 635, 'std635', 'hl3acw', '', 'student', '', 0, 'yes', '2021-09-22 06:33:36', NULL),
(1270, 0, 'parent635', 'ghb3bi', '635', 'parent', '', 0, 'yes', '2021-09-22 06:33:36', NULL),
(1271, 636, 'std636', '9n19ku', '', 'student', '', 0, 'yes', '2021-09-22 06:37:18', NULL),
(1272, 0, 'parent636', 'jwlbru', '636', 'parent', '', 0, 'yes', '2021-09-22 06:37:18', NULL),
(1273, 637, 'std637', '8wpy0t', '', 'student', '', 0, 'yes', '2021-09-22 06:40:36', NULL),
(1274, 0, 'parent637', 'euw872', '637', 'parent', '', 0, 'yes', '2021-09-22 06:40:36', NULL),
(1275, 638, 'std638', 'fnk2pk', '', 'student', '', 0, 'yes', '2021-09-22 06:42:58', NULL),
(1276, 0, 'parent638', 'z65x7w', '638', 'parent', '', 0, 'yes', '2021-09-22 06:42:58', NULL),
(1277, 639, 'std639', 'yekha6', '', 'student', '', 0, 'yes', '2021-09-22 06:44:57', NULL),
(1278, 0, 'parent639', 'eh4ule', '639', 'parent', '', 0, 'yes', '2021-09-22 06:44:57', NULL),
(1279, 640, 'std640', 'x5i8eh', '', 'student', '', 0, 'yes', '2021-09-22 06:48:31', NULL),
(1280, 0, 'parent640', 'k754dr', '640', 'parent', '', 0, 'yes', '2021-09-22 06:48:31', NULL),
(1281, 641, 'std641', '452qm0', '', 'student', '', 0, 'yes', '2021-09-22 06:50:43', NULL),
(1282, 0, 'parent641', 'lqokkq', '641', 'parent', '', 0, 'yes', '2021-09-22 06:50:43', NULL),
(1283, 642, 'std642', '521ujq', '', 'student', '', 0, 'yes', '2021-09-22 06:53:19', NULL),
(1284, 0, 'parent642', '4yjmig', '642', 'parent', '', 0, 'yes', '2021-09-22 06:53:19', NULL),
(1285, 643, 'std643', 'w9bxzw', '', 'student', '', 0, 'yes', '2021-09-22 09:24:12', NULL),
(1286, 0, 'parent643', 'etievd', '643', 'parent', '', 0, 'yes', '2021-09-22 09:24:12', NULL),
(1287, 644, 'std644', 'xbstd3', '', 'student', '', 0, 'yes', '2021-09-22 09:27:48', NULL),
(1288, 0, 'parent644', 'gvo7oa', '644', 'parent', '', 0, 'yes', '2021-09-22 09:27:48', NULL),
(1289, 645, 'std645', '1k3auf', '', 'student', '', 0, 'yes', '2021-09-22 09:30:33', NULL),
(1290, 0, 'parent645', 'kn8lfl', '645', 'parent', '', 0, 'yes', '2021-09-22 09:30:33', NULL),
(1291, 646, 'std646', 'rzj2gm', '', 'student', '', 0, 'yes', '2021-09-23 06:24:05', NULL),
(1292, 0, 'parent646', '5rgpfr', '646', 'parent', '', 0, 'yes', '2021-09-23 06:24:05', NULL),
(1293, 647, 'std647', 'ithcl5', '', 'student', '', 0, 'yes', '2021-09-23 06:26:16', NULL),
(1294, 0, 'parent647', '26tjgp', '647', 'parent', '', 0, 'yes', '2021-09-23 06:26:16', NULL),
(1295, 648, 'std648', '7vw067', '', 'student', '', 0, 'yes', '2021-09-23 06:28:29', NULL),
(1296, 0, 'parent648', 'zs6po6', '648', 'parent', '', 0, 'yes', '2021-09-23 06:28:29', NULL),
(1297, 649, 'std649', 'wdmp18', '', 'student', '', 0, 'yes', '2021-09-23 06:39:19', NULL),
(1298, 0, 'parent649', '9ifj8k', '649', 'parent', '', 0, 'yes', '2021-09-23 06:39:19', NULL),
(1299, 650, 'std650', 'o7bu1o', '', 'student', '', 0, 'yes', '2021-09-23 06:41:12', NULL),
(1300, 0, 'parent650', 'z6lkd9', '650', 'parent', '', 0, 'yes', '2021-09-23 06:41:12', NULL),
(1301, 651, 'std651', '9qc1jq', '', 'student', '', 0, 'yes', '2021-09-23 06:43:11', NULL),
(1302, 0, 'parent651', 'on1x2f', '651', 'parent', '', 0, 'yes', '2021-09-23 06:43:11', NULL),
(1303, 652, 'std652', 'm4h05k', '', 'student', '', 0, 'yes', '2021-09-23 06:44:46', NULL),
(1304, 0, 'parent652', 'mptx2b', '652', 'parent', '', 0, 'yes', '2021-09-23 06:44:46', NULL),
(1305, 653, 'std653', '477ylf', '', 'student', '', 0, 'yes', '2021-09-23 06:46:16', NULL),
(1306, 0, 'parent653', 'bq054n', '653', 'parent', '', 0, 'yes', '2021-09-23 06:46:16', NULL),
(1307, 654, 'std654', 'o2mdsm', '', 'student', '', 0, 'yes', '2021-09-23 06:47:50', NULL),
(1308, 0, 'parent654', 'c5k4q6', '654', 'parent', '', 0, 'yes', '2021-09-23 06:47:50', NULL),
(1309, 655, 'std655', 'rlf5m7', '', 'student', '', 0, 'yes', '2021-09-23 06:49:08', NULL),
(1310, 0, 'parent655', 'v3g2vz', '655', 'parent', '', 0, 'yes', '2021-09-23 06:49:08', NULL),
(1311, 656, 'std656', 'rx3eo2', '', 'student', '', 0, 'yes', '2021-09-23 06:56:24', NULL),
(1312, 0, 'parent656', 'rw9ksy', '656', 'parent', '', 0, 'yes', '2021-09-23 06:56:24', NULL),
(1313, 657, 'std657', 'gq00bx', '', 'student', '', 0, 'yes', '2021-09-23 06:57:54', NULL),
(1314, 0, 'parent657', 'cdsr69', '657', 'parent', '', 0, 'yes', '2021-09-23 06:57:54', NULL),
(1315, 658, 'std658', 'li31mu', '', 'student', '', 0, 'yes', '2021-09-23 06:59:17', NULL),
(1316, 0, 'parent658', 'djli7n', '658', 'parent', '', 0, 'yes', '2021-09-23 06:59:17', NULL),
(1317, 659, 'std659', 'k7mczf', '', 'student', '', 0, 'yes', '2021-09-23 07:00:44', NULL),
(1318, 0, 'parent659', 'qjxad3', '659', 'parent', '', 0, 'yes', '2021-09-23 07:00:44', NULL),
(1319, 660, 'std660', 'ffxkcu', '', 'student', '', 0, 'yes', '2021-09-23 07:02:35', NULL),
(1320, 0, 'parent660', 'i9lacs', '660', 'parent', '', 0, 'yes', '2021-09-23 07:02:35', NULL),
(1321, 661, 'std661', 'o3c1q6', '', 'student', '', 0, 'yes', '2021-09-23 07:03:56', NULL),
(1322, 0, 'parent661', 'v0bd6z', '661', 'parent', '', 0, 'yes', '2021-09-23 07:03:56', NULL),
(1323, 662, 'std662', 'c14o8t', '', 'student', '', 0, 'yes', '2021-09-23 07:05:12', NULL),
(1324, 0, 'parent662', 'oeess1', '662', 'parent', '', 0, 'yes', '2021-09-23 07:05:12', NULL),
(1325, 663, 'std663', 'vwh4g6', '', 'student', '', 0, 'yes', '2021-09-23 07:06:27', NULL),
(1326, 0, 'parent663', '1lg32j', '663', 'parent', '', 0, 'yes', '2021-09-23 07:06:27', NULL),
(1327, 664, 'std664', 'g8gqya', '', 'student', '', 0, 'yes', '2021-09-23 07:07:51', NULL),
(1328, 0, 'parent664', 'dpdkth', '664', 'parent', '', 0, 'yes', '2021-09-23 07:07:51', NULL),
(1329, 665, 'std665', 'z3v9o1', '', 'student', '', 0, 'yes', '2021-09-23 07:22:02', NULL),
(1330, 0, 'parent665', 'lglbvu', '665', 'parent', '', 0, 'yes', '2021-09-23 07:22:02', NULL),
(1331, 666, 'std666', 'qsdj29', '', 'student', '', 0, 'yes', '2021-09-23 07:23:22', NULL),
(1332, 0, 'parent666', 'gbcq0d', '666', 'parent', '', 0, 'yes', '2021-09-23 07:23:22', NULL),
(1333, 667, 'std667', 'pljrsb', '', 'student', '', 0, 'yes', '2021-09-23 07:24:35', NULL),
(1334, 0, 'parent667', '0ie0ko', '667', 'parent', '', 0, 'yes', '2021-09-23 07:24:35', NULL),
(1335, 668, 'std668', '2d8zci', '', 'student', '', 0, 'yes', '2021-09-23 07:25:43', NULL),
(1336, 0, 'parent668', '9qr0pw', '668', 'parent', '', 0, 'yes', '2021-09-23 07:25:43', NULL),
(1337, 669, 'std669', '5rv8el', '', 'student', '', 0, 'yes', '2021-09-23 07:27:07', NULL),
(1338, 0, 'parent669', 'zc86ir', '669', 'parent', '', 0, 'yes', '2021-09-23 07:27:07', NULL),
(1339, 670, 'std670', 'wytvwc', '', 'student', '', 0, 'yes', '2021-09-23 07:28:25', NULL),
(1340, 0, 'parent670', 'qelpmp', '670', 'parent', '', 0, 'yes', '2021-09-23 07:28:25', NULL),
(1341, 671, 'std671', '9jqcdh', '', 'student', '', 0, 'yes', '2021-09-23 07:29:46', NULL),
(1342, 0, 'parent671', '2sk657', '671', 'parent', '', 0, 'yes', '2021-09-23 07:29:46', NULL),
(1343, 672, 'std672', 'xpwoxr', '', 'student', '', 0, 'yes', '2021-09-23 07:31:01', NULL),
(1344, 0, 'parent672', 'tpfgtt', '672', 'parent', '', 0, 'yes', '2021-09-23 07:31:01', NULL),
(1345, 673, 'std673', '66hz1w', '', 'student', '', 0, 'yes', '2021-09-23 07:32:18', NULL),
(1346, 0, 'parent673', '2zr9h5', '673', 'parent', '', 0, 'yes', '2021-09-23 07:32:18', NULL),
(1347, 674, 'std674', 's21iid', '', 'student', '', 0, 'yes', '2021-09-23 07:39:42', NULL),
(1348, 0, 'parent674', '09lj1n', '674', 'parent', '', 0, 'yes', '2021-09-23 07:39:42', NULL),
(1349, 675, 'std675', '8gz73s', '', 'student', '', 0, 'yes', '2021-09-23 07:41:09', NULL),
(1350, 0, 'parent675', 'ge3wvo', '675', 'parent', '', 0, 'yes', '2021-09-23 07:41:09', NULL),
(1351, 676, 'std676', '1tcg3f', '', 'student', '', 0, 'yes', '2021-09-23 07:42:42', NULL),
(1352, 0, 'parent676', '7svy94', '676', 'parent', '', 0, 'yes', '2021-09-23 07:42:42', NULL),
(1353, 677, 'std677', 'i6j3c3', '', 'student', '', 0, 'yes', '2021-09-24 07:51:14', NULL),
(1354, 0, 'parent677', 'llvppr', '677', 'parent', '', 0, 'yes', '2021-09-24 07:51:14', NULL),
(1355, 678, 'std678', 'otfzzm', '', 'student', '', 0, 'yes', '2021-09-24 07:54:50', NULL),
(1356, 0, 'parent678', 'cnmyu9', '678', 'parent', '', 0, 'yes', '2021-09-24 07:54:50', NULL),
(1357, 679, 'std679', 'h6whx2', '', 'student', '', 0, 'yes', '2021-09-24 07:58:18', NULL),
(1358, 0, 'parent679', 'ubng9b', '679', 'parent', '', 0, 'yes', '2021-09-24 07:58:18', NULL),
(1359, 680, 'std680', 'ndw197', '', 'student', '', 0, 'yes', '2021-09-24 10:32:31', NULL),
(1360, 0, 'parent680', 'xiszhl', '680', 'parent', '', 0, 'yes', '2021-09-24 10:32:31', NULL),
(1361, 681, 'std681', 'rxh0g8', '', 'student', '', 0, 'yes', '2021-09-24 10:34:10', NULL),
(1362, 0, 'parent681', 'lta1e6', '681', 'parent', '', 0, 'yes', '2021-09-24 10:34:10', NULL),
(1363, 682, 'std682', 'a3811k', '', 'student', '', 0, 'yes', '2021-09-24 10:35:44', NULL),
(1364, 0, 'parent682', '0g6yau', '682', 'parent', '', 0, 'yes', '2021-09-24 10:35:44', NULL),
(1365, 683, 'std683', 'qulcw2', '', 'student', '', 0, 'yes', '2021-09-24 10:37:18', NULL),
(1366, 0, 'parent683', 'gatjvg', '683', 'parent', '', 0, 'yes', '2021-09-24 10:37:18', NULL),
(1367, 684, 'std684', '8eswwj', '', 'student', '', 0, 'yes', '2021-09-24 10:38:51', NULL),
(1368, 0, 'parent684', 'ogrs4u', '684', 'parent', '', 0, 'yes', '2021-09-24 10:38:51', NULL),
(1369, 685, 'std685', 'z7uqs0', '', 'student', '', 0, 'yes', '2021-09-24 10:40:22', NULL),
(1370, 0, 'parent685', '2my6qk', '685', 'parent', '', 0, 'yes', '2021-09-24 10:40:22', NULL),
(1371, 686, 'std686', 'xhx75i', '', 'student', '', 0, 'yes', '2021-09-24 10:41:40', NULL),
(1372, 0, 'parent686', 'p4lcnx', '686', 'parent', '', 0, 'yes', '2021-09-24 10:41:41', NULL),
(1373, 687, 'std687', '9y1vgk', '', 'student', '', 0, 'yes', '2021-09-27 07:42:18', NULL),
(1374, 0, 'parent687', 'c0j7c3', '687', 'parent', '', 0, 'yes', '2021-09-27 07:42:18', NULL),
(1375, 688, 'std688', '8q5321', '', 'student', '', 0, 'yes', '2021-09-27 07:43:17', NULL),
(1376, 0, 'parent688', 'qk30ge', '688', 'parent', '', 0, 'yes', '2021-09-27 07:43:17', NULL),
(1377, 689, 'std689', '84d1bh', '', 'student', '', 0, 'yes', '2021-09-27 07:44:06', NULL),
(1378, 0, 'parent689', '90w7wi', '689', 'parent', '', 0, 'yes', '2021-09-27 07:44:06', NULL),
(1379, 690, 'std690', 't7ct7e', '', 'student', '', 0, 'yes', '2021-09-27 07:45:15', NULL),
(1380, 0, 'parent690', 'veuuak', '690', 'parent', '', 0, 'yes', '2021-09-27 07:45:15', NULL),
(1381, 691, 'std691', 'fo8gor', '', 'student', '', 0, 'yes', '2021-09-27 07:46:09', NULL),
(1382, 0, 'parent691', 'b7ok84', '691', 'parent', '', 0, 'yes', '2021-09-27 07:46:09', NULL),
(1383, 692, 'std692', 'n8wtjj', '', 'student', '', 0, 'yes', '2021-09-27 08:05:46', NULL),
(1384, 0, 'parent692', '7ml0xs', '692', 'parent', '', 0, 'yes', '2021-09-27 08:05:46', NULL),
(1385, 693, 'std693', '624xwc', '', 'student', '', 0, 'yes', '2021-09-27 08:06:39', NULL),
(1386, 0, 'parent693', '5nvmer', '693', 'parent', '', 0, 'yes', '2021-09-27 08:06:39', NULL),
(1387, 694, 'std694', 'hfnz21', '', 'student', '', 0, 'yes', '2021-09-27 08:07:43', NULL),
(1388, 0, 'parent694', 'djvhhx', '694', 'parent', '', 0, 'yes', '2021-09-27 08:07:43', NULL),
(1389, 695, 'std695', '2vvh0o', '', 'student', '', 0, 'yes', '2021-09-27 08:09:01', NULL),
(1390, 0, 'parent695', 'njl2he', '695', 'parent', '', 0, 'yes', '2021-09-27 08:09:01', NULL),
(1391, 696, 'std696', 's4t36q', '', 'student', '', 0, 'yes', '2021-09-27 08:10:30', NULL),
(1392, 0, 'parent696', 'y4zwve', '696', 'parent', '', 0, 'yes', '2021-09-27 08:10:30', NULL),
(1393, 697, 'std697', 'q8z3t6', '', 'student', '', 0, 'yes', '2021-09-27 08:12:33', NULL),
(1394, 0, 'parent697', 'pqmtia', '697', 'parent', '', 0, 'yes', '2021-09-27 08:12:33', NULL),
(1395, 698, 'std698', '33kwhl', '', 'student', '', 0, 'yes', '2021-09-27 08:14:22', NULL),
(1396, 0, 'parent698', '4okx82', '698', 'parent', '', 0, 'yes', '2021-09-27 08:14:22', NULL),
(1397, 699, 'std699', 'oun8bv', '', 'student', '', 0, 'yes', '2021-09-27 08:16:28', NULL),
(1398, 0, 'parent699', 'y2y8mk', '699', 'parent', '', 0, 'yes', '2021-09-27 08:16:28', NULL),
(1399, 700, 'std700', 'hpd48f', '', 'student', '', 0, 'yes', '2021-09-27 08:17:53', NULL),
(1400, 0, 'parent700', '39bcro', '700', 'parent', '', 0, 'yes', '2021-09-27 08:17:53', NULL),
(1401, 701, 'std701', '3byw28', '', 'student', '', 0, 'yes', '2021-09-27 08:19:13', NULL),
(1402, 0, 'parent701', 'g7s15l', '701', 'parent', '', 0, 'yes', '2021-09-27 08:19:13', NULL),
(1403, 702, 'std702', 'aevnsi', '', 'student', '', 0, 'yes', '2021-09-27 08:21:37', NULL),
(1404, 0, 'parent702', 'k45cqt', '702', 'parent', '', 0, 'yes', '2021-09-27 08:21:37', NULL),
(1405, 703, 'std703', '3ozge6', '', 'student', '', 0, 'yes', '2021-09-27 08:22:57', NULL),
(1406, 0, 'parent703', 'rlzbgu', '703', 'parent', '', 0, 'yes', '2021-09-27 08:22:57', NULL),
(1407, 704, 'std704', 'h2aj3s', '', 'student', '', 0, 'yes', '2021-09-27 08:29:08', NULL),
(1408, 0, 'parent704', 'ld1e9v', '704', 'parent', '', 0, 'yes', '2021-09-27 08:29:08', NULL),
(1409, 705, 'std705', 'xkz7ty', '', 'student', '', 0, 'yes', '2021-09-27 08:31:25', NULL),
(1410, 0, 'parent705', 'em9o9f', '705', 'parent', '', 0, 'yes', '2021-09-27 08:31:25', NULL),
(1411, 706, 'std706', 'mhfitd', '', 'student', '', 0, 'yes', '2021-09-27 08:32:47', NULL),
(1412, 0, 'parent706', 'in4suz', '706', 'parent', '', 0, 'yes', '2021-09-27 08:32:47', NULL),
(1413, 707, 'std707', 'm64est', '', 'student', '', 0, 'yes', '2021-09-27 08:35:38', NULL),
(1414, 0, 'parent707', 'uvl1el', '707', 'parent', '', 0, 'yes', '2021-09-27 08:35:38', NULL),
(1415, 708, 'std708', 'ixt15w', '', 'student', '', 0, 'yes', '2021-09-27 08:36:50', NULL),
(1416, 0, 'parent708', 'o89g8r', '708', 'parent', '', 0, 'yes', '2021-09-27 08:36:50', NULL),
(1417, 709, 'std709', '9875zf', '', 'student', '', 0, 'yes', '2021-09-27 08:37:51', NULL),
(1418, 0, 'parent709', 'm4ojxm', '709', 'parent', '', 0, 'yes', '2021-09-27 08:37:51', NULL),
(1419, 710, 'std710', '57jmbk', '', 'student', '', 0, 'yes', '2021-09-27 08:38:47', NULL),
(1420, 0, 'parent710', '85zc8m', '710', 'parent', '', 0, 'yes', '2021-09-27 08:38:47', NULL),
(1421, 711, 'std711', 'vjeybt', '', 'student', '', 0, 'yes', '2021-09-27 08:39:37', NULL),
(1422, 0, 'parent711', 'qiy8r4', '711', 'parent', '', 0, 'yes', '2021-09-27 08:39:37', NULL),
(1423, 712, 'std712', 'xyz459', '', 'student', '', 0, 'yes', '2021-09-27 08:40:28', NULL),
(1424, 0, 'parent712', 'dfafen', '712', 'parent', '', 0, 'yes', '2021-09-27 08:40:28', NULL),
(1425, 713, 'std713', '21jvlx', '', 'student', '', 0, 'yes', '2021-09-27 08:41:19', NULL),
(1426, 0, 'parent713', 'opjol6', '713', 'parent', '', 0, 'yes', '2021-09-27 08:41:19', NULL),
(1427, 714, 'std714', 'n62d30', '', 'student', '', 0, 'yes', '2021-09-27 08:42:07', NULL),
(1428, 0, 'parent714', 'z2x18i', '714', 'parent', '', 0, 'yes', '2021-09-27 08:42:07', NULL),
(1429, 715, 'std715', 'sjv2e6', '', 'student', '', 0, 'yes', '2021-09-27 08:43:35', NULL),
(1430, 0, 'parent715', 'ggvx1j', '715', 'parent', '', 0, 'yes', '2021-09-27 08:43:35', NULL),
(1431, 716, 'std716', 'zyc7kl', '', 'student', '', 0, 'yes', '2021-09-27 08:45:07', NULL),
(1432, 0, 'parent716', 'udbkfv', '716', 'parent', '', 0, 'yes', '2021-09-27 08:45:07', NULL),
(1433, 717, 'std717', 'xt4xft', '', 'student', '', 0, 'yes', '2021-09-27 08:46:03', NULL),
(1434, 0, 'parent717', 'pllc8y', '717', 'parent', '', 0, 'yes', '2021-09-27 08:46:03', NULL),
(1435, 718, 'std718', 'vxon89', '', 'student', '', 0, 'yes', '2021-09-27 08:48:00', NULL),
(1436, 0, 'parent718', 'oa7jfy', '718', 'parent', '', 0, 'yes', '2021-09-27 08:48:00', NULL),
(1437, 719, 'std719', 'rtiy7a', '', 'student', '', 0, 'yes', '2021-09-27 08:49:05', NULL),
(1438, 0, 'parent719', 'kf7c4y', '719', 'parent', '', 0, 'yes', '2021-09-27 08:49:05', NULL),
(1439, 720, 'std720', 'oez78s', '', 'student', '', 0, 'yes', '2021-09-27 09:15:28', NULL),
(1440, 0, 'parent720', 'j1k4ap', '720', 'parent', '', 0, 'yes', '2021-09-27 09:15:28', NULL),
(1441, 721, 'std721', '5vjk8r', '', 'student', '', 0, 'yes', '2021-09-27 09:19:12', NULL),
(1442, 0, 'parent721', 't8p7gk', '721', 'parent', '', 0, 'yes', '2021-09-27 09:19:12', NULL),
(1443, 722, 'std722', 'spkbrm', '', 'student', '', 0, 'yes', '2021-09-27 09:20:45', NULL),
(1444, 0, 'parent722', '3btcri', '722', 'parent', '', 0, 'yes', '2021-09-27 09:20:45', NULL),
(1445, 723, 'std723', 'xp6jzh', '', 'student', '', 0, 'yes', '2021-09-27 09:21:53', NULL),
(1446, 0, 'parent723', 'lx7w2g', '723', 'parent', '', 0, 'yes', '2021-09-27 09:21:53', NULL),
(1447, 724, 'std724', 'ljhg0e', '', 'student', '', 0, 'yes', '2021-09-27 09:23:16', NULL),
(1448, 0, 'parent724', '9ob8tk', '724', 'parent', '', 0, 'yes', '2021-09-27 09:23:16', NULL),
(1449, 725, 'std725', '5bz2o6', '', 'student', '', 0, 'yes', '2021-09-27 09:24:39', NULL),
(1450, 0, 'parent725', 'qe5r65', '725', 'parent', '', 0, 'yes', '2021-09-27 09:24:39', NULL),
(1451, 726, 'std726', '1mxfpi', '', 'student', '', 0, 'yes', '2021-09-27 09:26:14', NULL),
(1452, 0, 'parent726', '6m87qx', '726', 'parent', '', 0, 'yes', '2021-09-27 09:26:14', NULL),
(1453, 727, 'std727', 'a6jwfm', '', 'student', '', 0, 'yes', '2021-09-27 09:27:51', NULL),
(1454, 0, 'parent727', '4fevxo', '727', 'parent', '', 0, 'yes', '2021-09-27 09:27:51', NULL),
(1455, 728, 'std728', 'won9f6', '', 'student', '', 0, 'yes', '2021-09-27 09:29:45', NULL),
(1456, 0, 'parent728', 'x1r8k0', '728', 'parent', '', 0, 'yes', '2021-09-27 09:29:45', NULL),
(1457, 729, 'std729', 'xo0efr', '', 'student', '', 0, 'yes', '2021-09-27 09:31:11', NULL),
(1458, 0, 'parent729', 'sjkhmt', '729', 'parent', '', 0, 'yes', '2021-09-27 09:31:11', NULL),
(1459, 730, 'std730', 'zv2k71', '', 'student', '', 0, 'yes', '2021-09-27 09:32:34', NULL),
(1460, 0, 'parent730', 'e175u5', '730', 'parent', '', 0, 'yes', '2021-09-27 09:32:34', NULL),
(1461, 731, 'std731', 'w2r2hn', '', 'student', '', 0, 'yes', '2021-09-27 09:37:07', NULL),
(1462, 0, 'parent731', 'wkegqa', '731', 'parent', '', 0, 'yes', '2021-09-27 09:37:07', NULL),
(1463, 732, 'std732', 'wbo9sk', '', 'student', '', 0, 'yes', '2021-09-27 09:40:54', NULL),
(1464, 0, 'parent732', 'cvbnxv', '732', 'parent', '', 0, 'yes', '2021-09-27 09:40:54', NULL),
(1465, 733, 'std733', 'kwnwvf', '', 'student', '', 0, 'yes', '2021-09-27 09:42:15', NULL),
(1466, 0, 'parent733', 'zi6is8', '733', 'parent', '', 0, 'yes', '2021-09-27 09:42:15', NULL),
(1521, 761, 'std761', '9jpry6', '', 'student', '', 0, 'yes', '2021-12-30 09:51:04', NULL),
(1522, 0, 'parent761', 'dx5iag', '761', 'parent', '', 0, 'yes', '2021-12-30 09:51:04', NULL),
(1523, 762, 'std762', 'njhrg1', '', 'student', '', 0, 'yes', '2021-12-30 09:56:50', NULL),
(1524, 0, 'parent762', '0ac814', '762', 'parent', '', 0, 'yes', '2021-12-30 09:56:50', NULL),
(1525, 763, 'std763', 'opcr8i', '', 'student', '', 0, 'yes', '2021-12-30 10:05:26', NULL),
(1526, 0, 'parent763', '5r0hin', '763', 'parent', '', 0, 'yes', '2021-12-30 10:05:26', NULL),
(1527, 764, 'std764', '3pv7lo', '', 'student', '', 0, 'yes', '2021-12-30 10:09:29', NULL),
(1528, 0, 'parent764', 'hmxa6f', '764', 'parent', '', 0, 'yes', '2021-12-30 10:09:29', NULL),
(1529, 765, 'std765', 'c8e5l2', '', 'student', '', 0, 'yes', '2021-12-30 10:13:00', NULL),
(1530, 0, 'parent765', 'qfz20x', '765', 'parent', '', 0, 'yes', '2021-12-30 10:13:00', NULL),
(1531, 766, 'std766', 'nr0cl9', '', 'student', '', 0, 'yes', '2021-12-30 10:16:03', NULL),
(1532, 0, 'parent766', 'cc7gc6', '766', 'parent', '', 0, 'yes', '2021-12-30 10:16:03', NULL),
(1533, 767, 'std767', 'oohyg8', '', 'student', '', 0, 'yes', '2021-12-30 10:19:00', NULL),
(1534, 0, 'parent767', 'ppd3hu', '767', 'parent', '', 0, 'yes', '2021-12-30 10:19:00', NULL),
(1535, 768, 'std768', 'qlnl08', '', 'student', '', 0, 'yes', '2021-12-30 10:21:33', NULL),
(1536, 0, 'parent768', '1gd0o2', '768', 'parent', '', 0, 'yes', '2021-12-30 10:21:33', NULL),
(1537, 769, 'std769', 'r86no9', '', 'student', '', 0, 'yes', '2021-12-30 10:24:36', NULL),
(1538, 0, 'parent769', '66vn7z', '769', 'parent', '', 0, 'yes', '2021-12-30 10:24:36', NULL),
(1539, 770, 'std770', '03e0z7', '', 'student', '', 0, 'yes', '2021-12-30 10:27:50', NULL),
(1540, 0, 'parent770', 'f7q71x', '770', 'parent', '', 0, 'yes', '2021-12-30 10:27:50', NULL),
(1541, 771, 'std771', 'upeqtk', '', 'student', '', 0, 'yes', '2021-12-30 10:30:26', NULL),
(1542, 0, 'parent771', 'f33it1', '771', 'parent', '', 0, 'yes', '2021-12-30 10:30:26', NULL),
(1543, 772, 'std772', '266ddb', '', 'student', '', 0, 'yes', '2021-12-30 10:32:25', NULL),
(1544, 0, 'parent772', 'ck4874', '772', 'parent', '', 0, 'yes', '2021-12-30 10:32:25', NULL),
(1545, 773, 'std773', 'tnw6ag', '', 'student', '', 0, 'yes', '2021-12-30 10:35:09', NULL),
(1546, 0, 'parent773', 'ghlus1', '773', 'parent', '', 0, 'yes', '2021-12-30 10:35:09', NULL),
(1547, 774, 'std774', '2nnhyy', '', 'student', '', 0, 'yes', '2021-12-30 10:37:32', NULL),
(1548, 0, 'parent774', '11zxzm', '774', 'parent', '', 0, 'yes', '2021-12-30 10:37:32', NULL),
(1549, 775, 'std775', 'ycpqoz', '', 'student', '', 0, 'yes', '2021-12-30 10:44:23', NULL),
(1550, 0, 'parent775', '7yrswp', '775', 'parent', '', 0, 'yes', '2021-12-30 10:44:23', NULL),
(1551, 776, 'std776', 'w3t17d', '', 'student', '', 0, 'yes', '2021-12-30 11:12:34', NULL),
(1552, 0, 'parent776', 'jxx8u4', '776', 'parent', '', 0, 'yes', '2021-12-30 11:12:34', NULL),
(1553, 777, 'std777', 'w29wpr', '', 'student', '', 0, 'yes', '2021-12-30 11:19:55', NULL),
(1554, 0, 'parent777', '4294oq', '777', 'parent', '', 0, 'yes', '2021-12-30 11:19:55', NULL),
(1555, 778, 'std778', '2khufk', '', 'student', '', 0, 'yes', '2021-12-30 11:23:04', NULL),
(1556, 0, 'parent778', '75exfq', '778', 'parent', '', 0, 'yes', '2021-12-30 11:23:04', NULL),
(1557, 779, 'std779', 'roulm5', '', 'student', '', 0, 'yes', '2021-12-30 11:26:03', NULL),
(1558, 0, 'parent779', 'u6lbmu', '779', 'parent', '', 0, 'yes', '2021-12-30 11:26:03', NULL),
(1559, 780, 'std780', 'qp2gwa', '', 'student', '', 0, 'yes', '2021-12-30 14:07:19', NULL),
(1560, 0, 'parent780', 'sv34xo', '780', 'parent', '', 0, 'yes', '2021-12-30 14:07:19', NULL),
(1561, 781, 'std781', '3zbrgg', '', 'student', '', 0, 'yes', '2021-12-30 14:11:39', NULL),
(1562, 0, 'parent781', 'k7hm0k', '781', 'parent', '', 0, 'yes', '2021-12-30 14:11:39', NULL),
(1563, 782, 'std782', 'w3tkml', '', 'student', '', 0, 'yes', '2021-12-30 14:16:02', NULL),
(1564, 0, 'parent782', 'qe7xjm', '782', 'parent', '', 0, 'yes', '2021-12-30 14:16:02', NULL),
(1565, 783, 'std783', 'fzmnhi', '', 'student', '', 0, 'yes', '2021-12-30 14:20:30', NULL),
(1566, 0, 'parent783', 'goczwh', '783', 'parent', '', 0, 'yes', '2021-12-30 14:20:30', NULL),
(1567, 784, 'std784', 'y6rujn', '', 'student', '', 0, 'yes', '2021-12-31 02:58:25', NULL),
(1568, 0, 'parent784', 'u6craq', '784', 'parent', '', 0, 'yes', '2021-12-31 02:58:25', NULL),
(1569, 785, 'std785', 'vxllsi', '', 'student', '', 0, 'yes', '2021-12-31 03:02:40', NULL),
(1570, 0, 'parent785', 'zqfsp2', '785', 'parent', '', 0, 'yes', '2021-12-31 03:02:40', NULL),
(1571, 786, 'std786', 'voh9d6', '', 'student', '', 0, 'yes', '2021-12-31 03:16:00', NULL),
(1572, 0, 'parent786', 'abe6qi', '786', 'parent', '', 0, 'yes', '2021-12-31 03:16:00', NULL),
(1573, 787, 'std787', 'mjahfz', '', 'student', '', 0, 'yes', '2021-12-31 03:20:04', NULL),
(1574, 0, 'parent787', '5ejg5m', '787', 'parent', '', 0, 'yes', '2021-12-31 03:20:04', NULL),
(1575, 788, 'std788', '89fkud', '', 'student', '', 0, 'yes', '2021-12-31 03:24:04', NULL),
(1576, 0, 'parent788', 'ya4iyq', '788', 'parent', '', 0, 'yes', '2021-12-31 03:24:04', NULL),
(1577, 789, 'std789', 'kj7qsi', '', 'student', '', 0, 'yes', '2021-12-31 03:26:33', NULL),
(1578, 0, 'parent789', '3ibnik', '789', 'parent', '', 0, 'yes', '2021-12-31 03:26:33', NULL),
(1579, 790, 'std790', 'gh1ce5', '', 'student', '', 0, 'yes', '2021-12-31 03:29:41', NULL),
(1580, 0, 'parent790', 'mcqvfu', '790', 'parent', '', 0, 'yes', '2021-12-31 03:29:41', NULL),
(1581, 791, 'std791', 'e738wt', '', 'student', '', 0, 'yes', '2021-12-31 03:32:25', NULL),
(1582, 0, 'parent791', 'aog8l2', '791', 'parent', '', 0, 'yes', '2021-12-31 03:32:25', NULL),
(1583, 792, 'std792', '0bxi77', '', 'student', '', 0, 'yes', '2021-12-31 03:34:54', NULL),
(1584, 0, 'parent792', 'r4btup', '792', 'parent', '', 0, 'yes', '2021-12-31 03:34:54', NULL),
(1585, 793, 'std793', 'jv17x2', '', 'student', '', 0, 'yes', '2021-12-31 03:38:14', NULL),
(1586, 0, 'parent793', 'u244fs', '793', 'parent', '', 0, 'yes', '2021-12-31 03:38:14', NULL),
(1587, 794, 'std794', '8ntpgl', '', 'student', '', 0, 'yes', '2021-12-31 03:40:59', NULL),
(1588, 0, 'parent794', 'x8yxqb', '794', 'parent', '', 0, 'yes', '2021-12-31 03:40:59', NULL),
(1589, 795, 'std795', 's3vy0i', '', 'student', '', 0, 'yes', '2021-12-31 03:45:47', NULL),
(1590, 0, 'parent795', '6mi1r4', '795', 'parent', '', 0, 'yes', '2021-12-31 03:45:47', NULL),
(1591, 796, 'std796', '4fcmah', '', 'student', '', 0, 'yes', '2021-12-31 03:49:05', NULL),
(1592, 0, 'parent796', '7jrwia', '796', 'parent', '', 0, 'yes', '2021-12-31 03:49:05', NULL),
(1593, 797, 'std797', 'zye3nj', '', 'student', '', 0, 'yes', '2021-12-31 04:08:29', NULL),
(1594, 0, 'parent797', 'y4tq12', '797', 'parent', '', 0, 'yes', '2021-12-31 04:08:29', NULL),
(1595, 798, 'std798', '557fgm', '', 'student', '', 0, 'yes', '2021-12-31 04:11:16', NULL),
(1596, 0, 'parent798', 'kdbmom', '798', 'parent', '', 0, 'yes', '2021-12-31 04:11:16', NULL),
(1597, 799, 'std799', 'ybrxal', '', 'student', '', 0, 'yes', '2021-12-31 04:14:27', NULL),
(1598, 0, 'parent799', 'l671zk', '799', 'parent', '', 0, 'yes', '2021-12-31 04:14:27', NULL),
(1599, 800, 'std800', 'yfsp1a', '', 'student', '', 0, 'yes', '2021-12-31 04:18:02', NULL),
(1600, 0, 'parent800', 'ym1vrp', '800', 'parent', '', 0, 'yes', '2021-12-31 04:18:02', NULL),
(1601, 801, 'std801', 'wrwtmg', '', 'student', '', 0, 'yes', '2021-12-31 04:20:30', NULL),
(1602, 0, 'parent801', '2ozqyl', '801', 'parent', '', 0, 'yes', '2021-12-31 04:20:30', NULL),
(1603, 802, 'std802', 'yjjwe8', '', 'student', '', 0, 'yes', '2021-12-31 04:23:03', NULL),
(1604, 0, 'parent802', 'eg49go', '802', 'parent', '', 0, 'yes', '2021-12-31 04:23:03', NULL),
(1605, 803, 'std803', '035fby', '', 'student', '', 0, 'yes', '2021-12-31 04:25:30', NULL),
(1606, 0, 'parent803', 'uzpxk3', '803', 'parent', '', 0, 'yes', '2021-12-31 04:25:30', NULL),
(1607, 804, 'std804', 'p2ufs4', '', 'student', '', 0, 'yes', '2021-12-31 04:28:12', NULL),
(1608, 0, 'parent804', 'gwg1bd', '804', 'parent', '', 0, 'yes', '2021-12-31 04:28:12', NULL),
(1609, 805, 'std805', 'eow256', '', 'student', '', 0, 'yes', '2021-12-31 04:31:17', NULL),
(1610, 0, 'parent805', '4ebjw6', '805', 'parent', '', 0, 'yes', '2021-12-31 04:31:17', NULL),
(1611, 806, 'std806', 'gpsxy4', '', 'student', '', 0, 'yes', '2021-12-31 04:34:23', NULL),
(1612, 0, 'parent806', 'mebq3z', '806', 'parent', '', 0, 'yes', '2021-12-31 04:34:23', NULL),
(1613, 807, 'std807', '4ppl2q', '', 'student', '', 0, 'yes', '2021-12-31 04:38:07', NULL),
(1614, 0, 'parent807', 'l5yi6a', '807', 'parent', '', 0, 'yes', '2021-12-31 04:38:07', NULL),
(1615, 808, 'std808', 'iuwfbj', '', 'student', '', 0, 'yes', '2021-12-31 04:40:52', NULL),
(1616, 0, 'parent808', 'p6nuf8', '808', 'parent', '', 0, 'yes', '2021-12-31 04:40:52', NULL),
(1617, 809, 'std809', 'aq0hdt', '', 'student', '', 0, 'yes', '2021-12-31 04:43:12', NULL),
(1618, 0, 'parent809', '853nor', '809', 'parent', '', 0, 'yes', '2021-12-31 04:43:12', NULL),
(1619, 810, 'std810', '8x8qyd', '', 'student', '', 0, 'yes', '2021-12-31 04:50:52', NULL),
(1620, 0, 'parent810', '02m0w1', '810', 'parent', '', 0, 'yes', '2021-12-31 04:50:52', NULL),
(1621, 811, 'std811', 'hqirgx', '', 'student', '', 0, 'yes', '2021-12-31 04:56:00', NULL),
(1622, 0, 'parent811', '5kcu4m', '811', 'parent', '', 0, 'yes', '2021-12-31 04:56:00', NULL),
(1623, 812, 'std812', 'hne68d', '', 'student', '', 0, 'yes', '2021-12-31 04:59:24', NULL),
(1624, 0, 'parent812', 'tz9qxs', '812', 'parent', '', 0, 'yes', '2021-12-31 04:59:24', NULL),
(1625, 813, 'std813', '42319n', '', 'student', '', 0, 'yes', '2021-12-31 05:11:31', NULL),
(1626, 0, 'parent813', 'zl046z', '813', 'parent', '', 0, 'yes', '2021-12-31 05:11:31', NULL),
(1627, 814, 'std814', 'n57c6d', '', 'student', '', 0, 'yes', '2021-12-31 05:16:13', NULL),
(1628, 0, 'parent814', 'ljuu09', '814', 'parent', '', 0, 'yes', '2021-12-31 05:16:13', NULL),
(1629, 815, 'std815', 'yqef1o', '', 'student', '', 0, 'yes', '2021-12-31 05:30:06', NULL),
(1630, 0, 'parent815', 'otd6cp', '815', 'parent', '', 0, 'yes', '2021-12-31 05:30:06', NULL),
(1631, 816, 'std816', 'tgycml', '', 'student', '', 0, 'yes', '2021-12-31 07:40:23', NULL),
(1632, 0, 'parent816', 'mrl9zz', '816', 'parent', '', 0, 'yes', '2021-12-31 07:40:23', NULL),
(1633, 817, 'std817', 'inkl33', '', 'student', '', 0, 'yes', '2021-12-31 07:48:53', NULL),
(1634, 0, 'parent817', 'da790n', '817', 'parent', '', 0, 'yes', '2021-12-31 07:48:53', NULL),
(1635, 818, 'std818', 'yjssc9', '', 'student', '', 0, 'yes', '2021-12-31 07:53:30', NULL),
(1636, 0, 'parent818', '3wrqfb', '818', 'parent', '', 0, 'yes', '2021-12-31 07:53:30', NULL),
(1649, 825, 'std825', 'e7yvd0', '', 'student', '', 0, 'yes', '2022-01-03 11:33:10', NULL),
(1650, 0, 'parent825', 'hzifxm', '825', 'parent', '', 0, 'yes', '2022-01-03 11:33:10', NULL),
(1651, 826, 'std826', 'yvuuym', '', 'student', '', 0, 'yes', '2022-01-03 11:39:33', NULL),
(1652, 0, 'parent826', 'gd6uia', '826', 'parent', '', 0, 'yes', '2022-01-03 11:39:33', NULL),
(1653, 827, 'std827', 'u86lsg', '', 'student', '', 0, 'yes', '2022-01-04 04:36:57', NULL),
(1654, 0, 'parent827', '45zy45', '827', 'parent', '', 0, 'yes', '2022-01-04 04:36:57', NULL),
(1655, 828, 'std828', 'fcxje8', '', 'student', '', 0, 'yes', '2022-01-04 05:10:38', NULL),
(1656, 0, 'parent828', 'vq92u6', '828', 'parent', '', 0, 'yes', '2022-01-04 05:10:38', NULL),
(1657, 829, 'std829', 'jd2kse', '', 'student', '', 0, 'yes', '2022-01-04 05:16:52', NULL),
(1658, 0, 'parent829', '23jeft', '829', 'parent', '', 0, 'yes', '2022-01-04 05:16:52', NULL),
(1659, 830, 'std830', 'nd4wn3', '', 'student', '', 0, 'yes', '2022-01-04 05:24:29', NULL),
(1660, 0, 'parent830', 'uu3y52', '830', 'parent', '', 0, 'yes', '2022-01-04 05:24:29', NULL),
(1661, 831, 'std831', '3hzzol', '', 'student', '', 0, 'yes', '2022-01-04 05:31:54', NULL),
(1662, 0, 'parent831', '5klxo2', '831', 'parent', '', 0, 'yes', '2022-01-04 05:31:54', NULL),
(1663, 832, 'std832', '6y7ijl', '', 'student', '', 0, 'yes', '2022-01-04 05:38:01', NULL),
(1664, 0, 'parent832', 'nv4qup', '832', 'parent', '', 0, 'yes', '2022-01-04 05:38:01', NULL),
(1665, 833, 'std833', 'u6ij85', '', 'student', '', 0, 'yes', '2022-01-04 08:46:01', NULL),
(1666, 0, 'parent833', 'v5ejlq', '833', 'parent', '', 0, 'yes', '2022-01-04 08:46:01', NULL),
(1667, 834, 'std834', 'qiqd0q', '', 'student', '', 0, 'yes', '2022-01-04 09:54:06', NULL),
(1668, 0, 'parent834', 'fam2nt', '834', 'parent', '', 0, 'yes', '2022-01-04 09:54:06', NULL),
(1669, 835, 'std835', '04iezy', '', 'student', '', 0, 'yes', '2022-01-04 10:00:43', NULL),
(1670, 0, 'parent835', 'wln4f0', '835', 'parent', '', 0, 'yes', '2022-01-04 10:00:43', NULL),
(1671, 836, 'std836', '42axea', '', 'student', '', 0, 'yes', '2022-01-04 10:03:49', NULL),
(1672, 0, 'parent836', '4h673m', '836', 'parent', '', 0, 'yes', '2022-01-04 10:03:49', NULL),
(1673, 837, 'std837', 'z2r6e5', '', 'student', '', 0, 'yes', '2022-01-04 10:08:26', NULL),
(1674, 0, 'parent837', 'zddx5d', '837', 'parent', '', 0, 'yes', '2022-01-04 10:08:26', NULL),
(1675, 838, 'std838', '91dhby', '', 'student', '', 0, 'yes', '2022-01-04 10:12:56', NULL),
(1676, 0, 'parent838', 'zo762r', '838', 'parent', '', 0, 'yes', '2022-01-04 10:12:56', NULL),
(1677, 839, 'std839', '3794di', '', 'student', '', 0, 'yes', '2022-01-05 06:41:29', NULL),
(1678, 0, 'parent839', 'a87zj4', '839', 'parent', '', 0, 'yes', '2022-01-05 06:41:29', NULL),
(1679, 840, 'std840', 'fc4vrl', '', 'student', '', 0, 'yes', '2022-01-05 06:47:39', NULL),
(1680, 0, 'parent840', 'jhs9bj', '840', 'parent', '', 0, 'yes', '2022-01-05 06:47:39', NULL),
(1681, 841, 'std841', 'vd7t7h', '', 'student', '', 0, 'yes', '2022-01-05 06:51:15', NULL),
(1682, 0, 'parent841', 'lezahv', '841', 'parent', '', 0, 'yes', '2022-01-05 06:51:15', NULL),
(1683, 842, 'std842', 'a9s4fz', '', 'student', '', 0, 'yes', '2022-01-05 06:54:38', NULL),
(1684, 0, 'parent842', 'yeexve', '842', 'parent', '', 0, 'yes', '2022-01-05 06:54:38', NULL),
(1685, 843, 'std843', 'dzmn3u', '', 'student', '', 0, 'yes', '2022-01-05 07:00:27', NULL),
(1686, 0, 'parent843', 'f7rczt', '843', 'parent', '', 0, 'yes', '2022-01-05 07:00:27', NULL),
(1687, 844, 'std844', 'ga8mov', '', 'student', '', 0, 'yes', '2022-01-05 07:10:37', NULL),
(1688, 0, 'parent844', 'wfbjbm', '844', 'parent', '', 0, 'yes', '2022-01-05 07:10:37', NULL),
(1689, 845, 'std845', 'a4y0px', '', 'student', '', 0, 'yes', '2022-01-05 07:15:02', NULL),
(1690, 0, 'parent845', '2ls0wo', '845', 'parent', '', 0, 'yes', '2022-01-05 07:15:02', NULL),
(1691, 846, 'std846', 'q5kub7', '', 'student', '', 0, 'yes', '2022-01-07 05:22:01', NULL),
(1692, 0, 'parent846', '5qfim3', '846', 'parent', '', 0, 'yes', '2022-01-07 05:22:02', NULL),
(1693, 847, 'std847', 'cnkrus', '', 'student', '', 0, 'yes', '2022-01-07 05:26:02', NULL),
(1694, 0, 'parent847', '7cruua', '847', 'parent', '', 0, 'yes', '2022-01-07 05:26:02', NULL),
(1695, 848, 'std848', 'xk4zpz', '', 'student', '', 0, 'yes', '2022-01-07 05:31:58', NULL),
(1696, 0, 'parent848', 'tf0qug', '848', 'parent', '', 0, 'yes', '2022-01-07 05:31:58', NULL),
(1699, 850, 'std850', 'o83f8q', '', 'student', '', 0, 'yes', '2022-01-21 05:50:40', NULL),
(1700, 0, 'parent850', '5sguqq', '850', 'parent', '', 0, 'yes', '2022-01-21 05:50:40', NULL),
(1701, 851, 'std851', '3qedlr', '', 'student', '', 0, 'yes', '2022-01-28 06:29:40', NULL),
(1702, 0, 'parent851', '00trmm', '851', 'parent', '', 0, 'yes', '2022-01-28 06:29:40', NULL),
(1705, 853, 'std853', 'rnelnm', '', 'student', '', 0, 'yes', '2022-01-28 11:28:21', NULL),
(1706, 0, 'parent853', 'a7y1l1', '853', 'parent', '', 0, 'yes', '2022-01-28 11:28:21', NULL),
(1707, 854, 'std854', 'qjje0a', '', 'student', '', 0, 'yes', '2022-01-29 06:18:18', NULL),
(1708, 0, 'parent854', 'b2tvfc', '854', 'parent', '', 0, 'yes', '2022-01-29 06:18:18', NULL),
(1709, 855, 'std855', 'imr7zy', '', 'student', '', 0, 'yes', '2022-01-29 06:39:57', NULL),
(1710, 0, 'parent855', '4afd5e', '855', 'parent', '', 0, 'yes', '2022-01-29 06:39:57', NULL),
(1711, 856, 'std856', 'q3eyfj', '', 'student', '', 0, 'yes', '2022-01-29 06:50:28', NULL),
(1712, 0, 'parent856', 'ogou9o', '856', 'parent', '', 0, 'yes', '2022-01-29 06:50:28', NULL),
(1713, 857, 'std857', 'qfjsxe', '', 'student', '', 0, 'yes', '2022-01-29 06:52:57', NULL),
(1714, 0, 'parent857', 'erbrts', '857', 'parent', '', 0, 'yes', '2022-01-29 06:52:57', NULL),
(1717, 859, 'std859', 'j53kh6', '', 'student', '', 0, 'yes', '2022-01-29 10:01:11', NULL),
(1718, 0, 'parent859', 'm3mvsl', '859', 'parent', '', 0, 'yes', '2022-01-29 10:01:11', NULL),
(1721, 861, 'std861', '1h2a0v', '', 'student', '', 0, 'yes', '2022-01-31 03:57:29', NULL),
(1722, 0, 'parent861', '6q05vy', '861', 'parent', '', 0, 'yes', '2022-01-31 03:57:29', NULL),
(1723, 862, 'std862', '1myx2l', '', 'student', '', 0, 'yes', '2022-01-31 10:44:03', NULL),
(1724, 0, 'parent862', '5xt8u8', '862', 'parent', '', 0, 'yes', '2022-01-31 10:44:03', NULL),
(1725, 863, 'std863', 'qxucg3', '', 'student', '', 0, 'yes', '2022-01-31 15:14:59', NULL),
(1726, 0, 'parent863', '6z412j', '863', 'parent', '', 0, 'yes', '2022-01-31 15:15:00', NULL),
(1727, 864, 'std864', 'vvwqd8', '', 'student', '', 0, 'yes', '2022-01-31 15:19:11', NULL),
(1728, 0, 'parent864', 'nraj8g', '864', 'parent', '', 0, 'yes', '2022-01-31 15:19:11', NULL),
(1729, 865, 'std865', 'xrnkq0', '', 'student', '', 0, 'yes', '2022-01-31 15:22:26', NULL),
(1730, 0, 'parent865', 'vuxu6f', '865', 'parent', '', 0, 'yes', '2022-01-31 15:22:26', NULL),
(1731, 866, 'std866', 'b6nhul', '', 'student', '', 0, 'yes', '2022-01-31 15:29:45', NULL),
(1732, 0, 'parent866', 'gl86zz', '866', 'parent', '', 0, 'yes', '2022-01-31 15:29:45', NULL),
(1733, 867, 'std867', 'nqehbl', '', 'student', '', 0, 'yes', '2022-02-05 06:57:18', NULL),
(1734, 0, 'parent867', 'dij7er', '867', 'parent', '', 0, 'yes', '2022-02-05 06:57:18', NULL),
(1735, 868, 'std868', 'jbgcoj', '', 'student', '', 0, 'yes', '2022-02-10 05:57:12', NULL),
(1736, 0, 'parent868', 'bi42yx', '868', 'parent', '', 0, 'yes', '2022-02-10 05:57:12', NULL),
(1737, 869, 'std869', '6ht06k', '', 'student', '', 0, 'yes', '2022-02-11 05:48:07', NULL),
(1738, 0, 'parent869', '1pfrdj', '869', 'parent', '', 0, 'yes', '2022-02-11 05:48:07', NULL),
(1739, 870, 'std870', '9mo84d', '', 'student', '', 0, 'yes', '2022-02-18 05:13:43', NULL),
(1740, 0, 'parent870', 'gy5i4r', '870', 'parent', '', 0, 'yes', '2022-02-18 05:13:43', NULL);
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1741, 871, 'std871', 'gc1y1c', '', 'student', '', 0, 'yes', '2022-02-18 05:15:42', NULL),
(1742, 0, 'parent871', 'w9iirt', '871', 'parent', '', 0, 'yes', '2022-02-18 05:15:42', NULL),
(1743, 872, 'std872', '2twkg2', '', 'student', '', 0, 'yes', '2022-02-18 05:19:43', NULL),
(1744, 0, 'parent872', 'dnrc52', '872', 'parent', '', 0, 'yes', '2022-02-18 05:19:43', NULL),
(1745, 873, 'std873', '7ej3cr', '', 'student', '', 0, 'yes', '2022-02-18 05:25:43', NULL),
(1746, 0, 'parent873', 'dyxtm8', '873', 'parent', '', 0, 'yes', '2022-02-18 05:25:43', NULL),
(1747, 874, 'std874', 'tkp6ux', '', 'student', '', 0, 'yes', '2022-02-18 05:29:39', NULL),
(1748, 0, 'parent874', 'gltlqc', '874', 'parent', '', 0, 'yes', '2022-02-18 05:29:39', NULL),
(1749, 875, 'std875', 'jgqxtd', '', 'student', '', 0, 'yes', '2022-02-22 06:17:38', NULL),
(1750, 0, 'parent875', 'u8bf2w', '875', 'parent', '', 0, 'yes', '2022-02-22 06:17:38', NULL),
(1751, 876, 'std876', 'pl2cgh', '', 'student', '', 0, 'yes', '2022-02-22 06:40:04', NULL),
(1752, 0, 'parent876', 'h8n5t6', '876', 'parent', '', 0, 'yes', '2022-02-22 06:40:04', NULL),
(1753, 877, 'std877', 'wjm66f', '', 'student', '', 0, 'yes', '2022-02-22 08:29:55', NULL),
(1754, 0, 'parent877', '9s7n53', '877', 'parent', '', 0, 'yes', '2022-02-22 08:29:55', NULL),
(1755, 878, 'std878', 'g4czr7', '', 'student', '', 0, 'yes', '2022-02-22 08:34:47', NULL),
(1756, 0, 'parent878', 'x8nq26', '878', 'parent', '', 0, 'yes', '2022-02-22 08:34:47', NULL),
(1757, 879, 'std879', 'k6mczy', '', 'student', '', 0, 'yes', '2022-02-22 08:38:39', NULL),
(1758, 0, 'parent879', 'vj4i2x', '879', 'parent', '', 0, 'yes', '2022-02-22 08:38:39', NULL),
(1759, 880, 'std880', 'd8sghv', '', 'student', '', 0, 'yes', '2022-02-23 03:53:06', NULL),
(1760, 0, 'parent880', 'qvq576', '880', 'parent', '', 0, 'yes', '2022-02-23 03:53:06', NULL),
(1761, 881, 'std881', 'shs04p', '', 'student', '', 0, 'yes', '2022-02-23 03:57:39', NULL),
(1762, 0, 'parent881', 'tqra3c', '881', 'parent', '', 0, 'yes', '2022-02-23 03:57:39', NULL),
(1763, 882, 'std882', '3scwlb', '', 'student', '', 0, 'yes', '2022-02-23 04:08:23', NULL),
(1764, 0, 'parent882', '4av70o', '882', 'parent', '', 0, 'yes', '2022-02-23 04:08:23', NULL),
(1765, 883, 'std883', '4jq3mi', '', 'student', '', 0, 'yes', '2022-02-23 04:13:22', NULL),
(1766, 0, 'parent883', 'jwsqng', '883', 'parent', '', 0, 'yes', '2022-02-23 04:13:22', NULL),
(1767, 884, 'std884', '2l0y3v', '', 'student', '', 0, 'yes', '2022-02-24 04:34:51', NULL),
(1768, 0, 'parent884', '8izw79', '884', 'parent', '', 0, 'yes', '2022-02-24 04:34:51', NULL),
(1769, 885, 'std885', '373xva', '', 'student', '', 0, 'yes', '2022-02-24 04:39:04', NULL),
(1770, 0, 'parent885', 'jy1bwg', '885', 'parent', '', 0, 'yes', '2022-02-24 04:39:04', NULL),
(1771, 886, 'std886', 'jx2jch', '', 'student', '', 0, 'yes', '2022-02-24 04:41:53', NULL),
(1772, 0, 'parent886', '0wsj2y', '886', 'parent', '', 0, 'yes', '2022-02-24 04:41:53', NULL),
(1773, 887, 'std887', '0o19qp', '', 'student', '', 0, 'yes', '2022-02-24 04:44:49', NULL),
(1774, 0, 'parent887', 'jdqgei', '887', 'parent', '', 0, 'yes', '2022-02-24 04:44:49', NULL),
(1775, 888, 'std888', 'hui8gg', '', 'student', '', 0, 'yes', '2022-02-24 06:04:50', NULL),
(1776, 0, 'parent888', 'ceqd1p', '888', 'parent', '', 0, 'yes', '2022-02-24 06:04:50', NULL),
(1777, 889, 'std889', 'yc8pxj', '', 'student', '', 0, 'yes', '2022-02-24 06:08:40', NULL),
(1778, 0, 'parent889', 'i38pdz', '889', 'parent', '', 0, 'yes', '2022-02-24 06:08:40', NULL),
(1779, 890, 'std890', 'c7k0ok', '', 'student', '', 0, 'yes', '2022-02-25 07:09:43', NULL),
(1780, 0, 'parent890', '1l0eln', '890', 'parent', '', 0, 'yes', '2022-02-25 07:09:43', NULL),
(1781, 891, 'std891', 'rg6qhv', '', 'student', '', 0, 'yes', '2022-02-25 09:39:27', NULL),
(1782, 0, 'parent891', '7lpx4j', '891', 'parent', '', 0, 'yes', '2022-02-25 09:39:27', NULL),
(1783, 892, 'std892', 'vlskb8', '', 'student', '', 0, 'yes', '2022-02-26 06:03:26', NULL),
(1784, 0, 'parent892', 'k3fw0n', '892', 'parent', '', 0, 'yes', '2022-02-26 06:03:27', NULL),
(1785, 893, 'std893', 'iy07h8', '', 'student', '', 0, 'yes', '2022-02-28 03:53:07', NULL),
(1786, 0, 'parent893', 'p3x91v', '893', 'parent', '', 0, 'yes', '2022-02-28 03:53:07', NULL),
(1787, 894, 'std894', 'znqm1m', '', 'student', '', 0, 'yes', '2022-02-28 03:54:33', NULL),
(1788, 0, 'parent894', '0w4et9', '894', 'parent', '', 0, 'yes', '2022-02-28 03:54:33', NULL),
(1789, 895, 'std895', 'nw2o35', '', 'student', '', 0, 'yes', '2022-02-28 04:00:13', NULL),
(1790, 0, 'parent895', 'j8n99h', '895', 'parent', '', 0, 'yes', '2022-02-28 04:00:13', NULL),
(1791, 896, 'std896', '6kwnef', '', 'student', '', 0, 'yes', '2022-03-01 03:22:03', NULL),
(1792, 0, 'parent896', 'a4h3rx', '896', 'parent', '', 0, 'yes', '2022-03-01 03:22:03', NULL),
(1793, 897, 'std897', 'y5ff83', '', 'student', '', 0, 'yes', '2022-03-01 03:27:37', NULL),
(1794, 0, 'parent897', 'nye7c6', '897', 'parent', '', 0, 'yes', '2022-03-01 03:27:37', NULL),
(1795, 898, 'std898', '0xa432', '', 'student', '', 0, 'yes', '2022-03-01 03:30:28', NULL),
(1796, 0, 'parent898', '0jp496', '898', 'parent', '', 0, 'yes', '2022-03-01 03:30:28', NULL),
(1797, 899, 'std899', 'kiwd1p', '', 'student', '', 0, 'yes', '2022-03-01 03:31:06', NULL),
(1798, 0, 'parent899', '5xy3ot', '899', 'parent', '', 0, 'yes', '2022-03-01 03:31:06', NULL),
(1799, 900, 'std900', 'uyq5ug', '', 'student', '', 0, 'yes', '2022-03-01 03:35:20', NULL),
(1800, 0, 'parent900', 'a239zh', '900', 'parent', '', 0, 'yes', '2022-03-01 03:35:20', NULL),
(1801, 901, 'std901', 'opp8e1', '', 'student', '', 0, 'yes', '2022-03-01 03:35:54', NULL),
(1802, 0, 'parent901', '77dnoo', '901', 'parent', '', 0, 'yes', '2022-03-01 03:35:54', NULL),
(1803, 902, 'std902', 'kkya84', '', 'student', '', 0, 'yes', '2022-03-01 03:37:27', NULL),
(1804, 0, 'parent902', 'a28mq7', '902', 'parent', '', 0, 'yes', '2022-03-01 03:37:27', NULL),
(1805, 903, 'std903', 'dpmar6', '', 'student', '', 0, 'yes', '2022-03-01 03:45:04', NULL),
(1806, 0, 'parent903', 'p9agjz', '903', 'parent', '', 0, 'yes', '2022-03-01 03:45:04', NULL),
(1807, 904, 'std904', 'cwh9ev', '', 'student', '', 0, 'yes', '2022-03-01 04:12:29', NULL),
(1808, 0, 'parent904', 'q6io52', '904', 'parent', '', 0, 'yes', '2022-03-01 04:12:29', NULL),
(1809, 905, 'std905', '647jm4', '', 'student', '', 0, 'yes', '2022-03-01 06:29:59', NULL),
(1810, 0, 'parent905', 'mxiyjw', '905', 'parent', '', 0, 'yes', '2022-03-01 06:29:59', NULL),
(1811, 906, 'std906', 'p6clvz', '', 'student', '', 0, 'yes', '2022-03-02 09:52:56', NULL),
(1812, 0, 'parent906', 'l2ol8k', '906', 'parent', '', 0, 'yes', '2022-03-02 09:52:56', NULL),
(1819, 910, 'std910', '6jcm1l', '', 'student', '', 0, 'yes', '2022-03-03 10:59:23', NULL),
(1820, 0, 'parent910', 'lsgy3z', '910', 'parent', '', 0, 'yes', '2022-03-03 10:59:23', NULL),
(1821, 911, 'std911', 'u5hlkl', '', 'student', '', 0, 'yes', '2022-03-04 06:44:42', NULL),
(1822, 0, 'parent911', '30nzma', '911', 'parent', '', 0, 'yes', '2022-03-04 06:44:42', NULL),
(1829, 915, 'std915', 'xcxqte', '', 'student', '', 0, 'yes', '2022-03-25 05:09:06', NULL),
(1830, 0, 'parent915', 'dl2eb2', '915', 'parent', '', 0, 'yes', '2022-03-25 05:09:06', NULL),
(1831, 916, 'std916', 'p74v16', '', 'student', '', 0, 'yes', '2022-03-25 05:09:28', NULL),
(1832, 0, 'parent916', 'qegv90', '916', 'parent', '', 0, 'yes', '2022-03-25 05:09:28', NULL),
(1833, 917, 'std917', 'kqdce3', '', 'student', '', 0, 'yes', '2022-03-25 05:10:41', NULL),
(1834, 0, 'parent917', '6gjbai', '917', 'parent', '', 0, 'yes', '2022-03-25 05:10:42', NULL),
(1835, 918, 'std918', 'cx1vzc', '', 'student', '', 0, 'yes', '2022-03-25 05:11:27', NULL),
(1836, 0, 'parent918', '728v36', '918', 'parent', '', 0, 'yes', '2022-03-25 05:11:27', NULL),
(1837, 919, 'std919', 'hvq5vs', '', 'student', '', 0, 'yes', '2022-03-25 05:12:34', NULL),
(1838, 0, 'parent919', '6mrtj4', '919', 'parent', '', 0, 'yes', '2022-03-25 05:12:34', NULL),
(1839, 920, 'std920', 'izbkxs', '', 'student', '', 0, 'yes', '2022-03-25 05:13:23', NULL),
(1840, 0, 'parent920', 'zg89pw', '920', 'parent', '', 0, 'yes', '2022-03-25 05:13:23', NULL),
(1841, 921, 'std921', 'dfztnb', '', 'student', '', 0, 'yes', '2022-03-25 05:14:10', NULL),
(1842, 0, 'parent921', 'lbtnf4', '921', 'parent', '', 0, 'yes', '2022-03-25 05:14:10', NULL),
(1843, 922, 'std922', '1abhbb', '', 'student', '', 0, 'yes', '2022-03-26 06:07:51', NULL),
(1844, 0, 'parent922', '8yxv54', '922', 'parent', '', 0, 'yes', '2022-03-26 06:07:51', NULL),
(1847, 924, 'std924', '8cbgcy', '', 'student', '', 0, 'yes', '2022-05-22 09:35:19', NULL),
(1848, 0, 'parent924', '4x24v8', '924', 'parent', '', 0, 'yes', '2022-05-22 09:35:19', NULL),
(1849, 925, 'std925', 'oyrplg', '', 'student', '', 0, 'yes', '2023-01-18 09:51:13', NULL),
(1850, 0, 'parent925', 'p7xd3g', '925', 'parent', '', 0, 'yes', '2023-01-18 09:51:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_authentication`
--

CREATE TABLE `users_authentication` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expired_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `manufacture_year` varchar(4) DEFAULT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_routes`
--

CREATE TABLE `vehicle_routes` (
  `id` int(11) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `visitors_book`
--

CREATE TABLE `visitors_book` (
  `id` int(11) NOT NULL,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `no_of_pepple` int(11) NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `visitors_purpose`
--

CREATE TABLE `visitors_purpose` (
  `id` int(11) NOT NULL,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `visitors_purpose`
--

INSERT INTO `visitors_purpose` (`id`, `visitors_purpose`, `description`) VALUES
(1, 'Interested on a Course', ''),
(2, 'Inquiry', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni_events`
--
ALTER TABLE `alumni_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alumni_students`
--
ALTER TABLE `alumni_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `attendence_type`
--
ALTER TABLE `attendence_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `captcha`
--
ALTER TABLE `captcha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_connections`
--
ALTER TABLE `chat_connections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_user_one` (`chat_user_one`),
  ADD KEY `chat_user_two` (`chat_user_two`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_user_id` (`chat_user_id`),
  ADD KEY `chat_connection_id` (`chat_connection_id`);

--
-- Indexes for table `chat_users`
--
ALTER TABLE `chat_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `create_staff_id` (`create_staff_id`),
  ADD KEY `create_student_id` (`create_student_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `class_teacher`
--
ALTER TABLE `class_teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint_type`
--
ALTER TABLE `complaint_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_for`
--
ALTER TABLE `content_for`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_id` (`content_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_id` (`custom_field_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disable_reason`
--
ALTER TABLE `disable_reason`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatch_receive`
--
ALTER TABLE `dispatch_receive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_groups`
--
ALTER TABLE `exam_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_group_class_batch_exams`
--
ALTER TABLE `exam_group_class_batch_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_id` (`exam_group_id`);

--
-- Indexes for table `exam_group_class_batch_exam_students`
--
ALTER TABLE `exam_group_class_batch_exam_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_class_batch_exam_id` (`exam_group_class_batch_exam_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `exam_group_class_batch_exam_subjects`
--
ALTER TABLE `exam_group_class_batch_exam_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_class_batch_exams_id` (`exam_group_class_batch_exams_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `exam_group_exam_connections`
--
ALTER TABLE `exam_group_exam_connections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_id` (`exam_group_id`),
  ADD KEY `exam_group_class_batch_exams_id` (`exam_group_class_batch_exams_id`);

--
-- Indexes for table `exam_group_exam_results`
--
ALTER TABLE `exam_group_exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_class_batch_exam_subject_id` (`exam_group_class_batch_exam_subject_id`),
  ADD KEY `exam_group_student_id` (`exam_group_student_id`),
  ADD KEY `exam_group_class_batch_exam_student_id` (`exam_group_class_batch_exam_student_id`);

--
-- Indexes for table `exam_group_students`
--
ALTER TABLE `exam_group_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_id` (`exam_group_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_schedule_id` (`exam_schedule_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_subject_id` (`teacher_subject_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_head`
--
ALTER TABLE `expense_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feecategory`
--
ALTER TABLE `feecategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feemasters`
--
ALTER TABLE `feemasters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_discounts`
--
ALTER TABLE `fees_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feetype`
--
ALTER TABLE `feetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups`
--
ALTER TABLE `fee_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups_feetype`
--
ALTER TABLE `fee_groups_feetype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_session_group_id` (`fee_session_group_id`),
  ADD KEY `fee_groups_id` (`fee_groups_id`),
  ADD KEY `feetype_id` (`feetype_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `fee_receipt_no`
--
ALTER TABLE `fee_receipt_no`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_session_groups`
--
ALTER TABLE `fee_session_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_groups_id` (`fee_groups_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `filetypes`
--
ALTER TABLE `filetypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow_up`
--
ALTER TABLE `follow_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_media_gallery`
--
ALTER TABLE `front_cms_media_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menus`
--
ALTER TABLE `front_cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `front_cms_programs`
--
ALTER TABLE `front_cms_programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `front_cms_settings`
--
ALTER TABLE `front_cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_calls`
--
ALTER TABLE `general_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_group_subject_id` (`subject_group_subject_id`);

--
-- Indexes for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_rooms`
--
ALTER TABLE `hostel_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `id_card`
--
ALTER TABLE `id_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_head`
--
ALTER TABLE `income_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_issue`
--
ALTER TABLE `item_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_category_id` (`item_category_id`);

--
-- Indexes for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `item_store`
--
ALTER TABLE `item_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_supplier`
--
ALTER TABLE `item_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `subject_group_subject_id` (`subject_group_subject_id`),
  ADD KEY `subject_group_class_sections_id` (`subject_group_class_sections_id`);

--
-- Indexes for table `libarary_members`
--
ALTER TABLE `libarary_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_class_students`
--
ALTER TABLE `multi_class_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `notification_roles`
--
ALTER TABLE `notification_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `send_notification_id` (`send_notification_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `onlineexam`
--
ALTER TABLE `onlineexam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `onlineexam_attempts`
--
ALTER TABLE `onlineexam_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_student_id` (`onlineexam_student_id`);

--
-- Indexes for table `onlineexam_questions`
--
ALTER TABLE `onlineexam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_id` (`onlineexam_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `onlineexam_students`
--
ALTER TABLE `onlineexam_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_id` (`onlineexam_id`),
  ADD KEY `student_session_id` (`student_session_id`);

--
-- Indexes for table `onlineexam_student_results`
--
ALTER TABLE `onlineexam_student_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_student_id` (`onlineexam_student_id`),
  ADD KEY `onlineexam_question_id` (`onlineexam_question_id`);

--
-- Indexes for table `online_admissions`
--
ALTER TABLE `online_admissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`);

--
-- Indexes for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_admission_payment`
--
ALTER TABLE `online_admission_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_category`
--
ALTER TABLE `permission_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_group`
--
ALTER TABLE `permission_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_student`
--
ALTER TABLE `permission_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `print_headerfooter`
--
ALTER TABLE `print_headerfooter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `read_notification`
--
ALTER TABLE `read_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_houses`
--
ALTER TABLE `school_houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sch_settings`
--
ALTER TABLE `sch_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_notification`
--
ALTER TABLE `send_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_config`
--
ALTER TABLE `sms_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_attendance_staff` (`staff_id`),
  ADD KEY `FK_staff_attendance_staff_attendance_type` (`staff_attendance_type_id`);

--
-- Indexes for table `staff_attendance_type`
--
ALTER TABLE `staff_attendance_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_id_card`
--
ALTER TABLE `staff_id_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_leave_details_staff` (`staff_id`),
  ADD KEY `FK_staff_leave_details_leave_types` (`leave_type_id`);

--
-- Indexes for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_leave_request_staff` (`staff_id`),
  ADD KEY `FK_staff_leave_request_leave_types` (`leave_type_id`);

--
-- Indexes for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_payslip_staff` (`staff_id`);

--
-- Indexes for table `staff_rating`
--
ALTER TABLE `staff_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_rating_staff` (`staff_id`);

--
-- Indexes for table `staff_roles`
--
ALTER TABLE `staff_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_staff_timeline_staff` (`staff_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_applyleave`
--
ALTER TABLE `student_applyleave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendences`
--
ALTER TABLE `student_attendences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `attendence_type_id` (`attendence_type_id`);

--
-- Indexes for table `student_doc`
--
ALTER TABLE `student_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_edit_fields`
--
ALTER TABLE `student_edit_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fees`
--
ALTER TABLE `student_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fees_deposite`
--
ALTER TABLE `student_fees_deposite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`student_fees_master_id`),
  ADD KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`);

--
-- Indexes for table `student_fees_discounts`
--
ALTER TABLE `student_fees_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `fees_discount_id` (`fees_discount_id`);

--
-- Indexes for table `student_fees_master`
--
ALTER TABLE `student_fees_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `fee_session_group_id` (`fee_session_group_id`);

--
-- Indexes for table `student_session`
--
ALTER TABLE `student_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `student_sibling`
--
ALTER TABLE `student_sibling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_subject_attendances`
--
ALTER TABLE `student_subject_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendence_type_id` (`attendence_type_id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `subject_timetable_id` (`subject_timetable_id`);

--
-- Indexes for table `student_timeline`
--
ALTER TABLE `student_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_groups`
--
ALTER TABLE `subject_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `subject_group_class_sections`
--
ALTER TABLE `subject_group_class_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`),
  ADD KEY `subject_group_id` (`subject_group_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `subject_group_subjects`
--
ALTER TABLE `subject_group_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_group_id` (`subject_group_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `subject_syllabus`
--
ALTER TABLE `subject_syllabus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `created_for` (`created_for`);

--
-- Indexes for table `subject_timetable`
--
ALTER TABLE `subject_timetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `subject_group_id` (`subject_group_id`),
  ADD KEY `subject_group_subject_id` (`subject_group_subject_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `submit_assignment`
--
ALTER TABLE `submit_assignment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `template_admitcards`
--
ALTER TABLE `template_admitcards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_marksheets`
--
ALTER TABLE `template_marksheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Indexes for table `transport_route`
--
ALTER TABLE `transport_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_authentication`
--
ALTER TABLE `users_authentication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors_book`
--
ALTER TABLE `visitors_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors_purpose`
--
ALTER TABLE `visitors_purpose`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumni_events`
--
ALTER TABLE `alumni_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alumni_students`
--
ALTER TABLE `alumni_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendence_type`
--
ALTER TABLE `attendence_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `captcha`
--
ALTER TABLE `captcha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat_connections`
--
ALTER TABLE `chat_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat_users`
--
ALTER TABLE `chat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `class_teacher`
--
ALTER TABLE `class_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_type`
--
ALTER TABLE `complaint_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_for`
--
ALTER TABLE `content_for`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `disable_reason`
--
ALTER TABLE `disable_reason`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dispatch_receive`
--
ALTER TABLE `dispatch_receive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_groups`
--
ALTER TABLE `exam_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_group_class_batch_exams`
--
ALTER TABLE `exam_group_class_batch_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_group_class_batch_exam_students`
--
ALTER TABLE `exam_group_class_batch_exam_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exam_group_class_batch_exam_subjects`
--
ALTER TABLE `exam_group_class_batch_exam_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam_group_exam_connections`
--
ALTER TABLE `exam_group_exam_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_group_exam_results`
--
ALTER TABLE `exam_group_exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_group_students`
--
ALTER TABLE `exam_group_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_head`
--
ALTER TABLE `expense_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feecategory`
--
ALTER TABLE `feecategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feemasters`
--
ALTER TABLE `feemasters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_discounts`
--
ALTER TABLE `fees_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feetype`
--
ALTER TABLE `feetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `fee_groups`
--
ALTER TABLE `fee_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `fee_groups_feetype`
--
ALTER TABLE `fee_groups_feetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `fee_receipt_no`
--
ALTER TABLE `fee_receipt_no`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_session_groups`
--
ALTER TABLE `fee_session_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `filetypes`
--
ALTER TABLE `filetypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_media_gallery`
--
ALTER TABLE `front_cms_media_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_menus`
--
ALTER TABLE `front_cms_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_programs`
--
ALTER TABLE `front_cms_programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_settings`
--
ALTER TABLE `front_cms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `general_calls`
--
ALTER TABLE `general_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_rooms`
--
ALTER TABLE `hostel_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `id_card`
--
ALTER TABLE `id_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_head`
--
ALTER TABLE `income_head`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_issue`
--
ALTER TABLE `item_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_stock`
--
ALTER TABLE `item_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_store`
--
ALTER TABLE `item_store`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_supplier`
--
ALTER TABLE `item_supplier`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `libarary_members`
--
ALTER TABLE `libarary_members`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `multi_class_students`
--
ALTER TABLE `multi_class_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_roles`
--
ALTER TABLE `notification_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `onlineexam`
--
ALTER TABLE `onlineexam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onlineexam_attempts`
--
ALTER TABLE `onlineexam_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onlineexam_questions`
--
ALTER TABLE `onlineexam_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onlineexam_students`
--
ALTER TABLE `onlineexam_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onlineexam_student_results`
--
ALTER TABLE `onlineexam_student_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_admissions`
--
ALTER TABLE `online_admissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `online_admission_payment`
--
ALTER TABLE `online_admission_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_category`
--
ALTER TABLE `permission_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `permission_group`
--
ALTER TABLE `permission_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `permission_student`
--
ALTER TABLE `permission_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `print_headerfooter`
--
ALTER TABLE `print_headerfooter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `question_answers`
--
ALTER TABLE `question_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `read_notification`
--
ALTER TABLE `read_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reference`
--
ALTER TABLE `reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1682;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_houses`
--
ALTER TABLE `school_houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `send_notification`
--
ALTER TABLE `send_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sms_config`
--
ALTER TABLE `sms_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_attendance_type`
--
ALTER TABLE `staff_attendance_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `staff_id_card`
--
ALTER TABLE `staff_id_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_rating`
--
ALTER TABLE `staff_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_roles`
--
ALTER TABLE `staff_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=926;

--
-- AUTO_INCREMENT for table `student_applyleave`
--
ALTER TABLE `student_applyleave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_attendences`
--
ALTER TABLE `student_attendences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `student_doc`
--
ALTER TABLE `student_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `student_edit_fields`
--
ALTER TABLE `student_edit_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees`
--
ALTER TABLE `student_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees_deposite`
--
ALTER TABLE `student_fees_deposite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `student_fees_discounts`
--
ALTER TABLE `student_fees_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `student_fees_master`
--
ALTER TABLE `student_fees_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=538;

--
-- AUTO_INCREMENT for table `student_session`
--
ALTER TABLE `student_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=960;

--
-- AUTO_INCREMENT for table `student_sibling`
--
ALTER TABLE `student_sibling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_subject_attendances`
--
ALTER TABLE `student_subject_attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_timeline`
--
ALTER TABLE `student_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subject_groups`
--
ALTER TABLE `subject_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subject_group_class_sections`
--
ALTER TABLE `subject_group_class_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subject_group_subjects`
--
ALTER TABLE `subject_group_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subject_syllabus`
--
ALTER TABLE `subject_syllabus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_timetable`
--
ALTER TABLE `subject_timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `submit_assignment`
--
ALTER TABLE `submit_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template_admitcards`
--
ALTER TABLE `template_admitcards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `template_marksheets`
--
ALTER TABLE `template_marksheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_route`
--
ALTER TABLE `transport_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1851;

--
-- AUTO_INCREMENT for table `users_authentication`
--
ALTER TABLE `users_authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors_book`
--
ALTER TABLE `visitors_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors_purpose`
--
ALTER TABLE `visitors_purpose`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni_students`
--
ALTER TABLE `alumni_students`
  ADD CONSTRAINT `alumni_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_connections`
--
ALTER TABLE `chat_connections`
  ADD CONSTRAINT `chat_connections_ibfk_1` FOREIGN KEY (`chat_user_one`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_connections_ibfk_2` FOREIGN KEY (`chat_user_two`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`chat_user_id`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`chat_connection_id`) REFERENCES `chat_connections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_users`
--
ALTER TABLE `chat_users`
  ADD CONSTRAINT `chat_users_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_users_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_users_ibfk_3` FOREIGN KEY (`create_staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_users_ibfk_4` FOREIGN KEY (`create_student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_for`
--
ALTER TABLE `content_for`
  ADD CONSTRAINT `content_for_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_for_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_ibfk_1` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_class_batch_exams`
--
ALTER TABLE `exam_group_class_batch_exams`
  ADD CONSTRAINT `exam_group_class_batch_exams_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_class_batch_exam_students`
--
ALTER TABLE `exam_group_class_batch_exam_students`
  ADD CONSTRAINT `exam_group_class_batch_exam_students_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exam_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_class_batch_exam_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_class_batch_exam_students_ibfk_3` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_class_batch_exam_subjects`
--
ALTER TABLE `exam_group_class_batch_exam_subjects`
  ADD CONSTRAINT `exam_group_class_batch_exam_subjects_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exams_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_class_batch_exam_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_exam_connections`
--
ALTER TABLE `exam_group_exam_connections`
  ADD CONSTRAINT `exam_group_exam_connections_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_exam_connections_ibfk_2` FOREIGN KEY (`exam_group_class_batch_exams_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_exam_results`
--
ALTER TABLE `exam_group_exam_results`
  ADD CONSTRAINT `exam_group_exam_results_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exam_subject_id`) REFERENCES `exam_group_class_batch_exam_subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_exam_results_ibfk_2` FOREIGN KEY (`exam_group_student_id`) REFERENCES `exam_group_students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_exam_results_ibfk_3` FOREIGN KEY (`exam_group_class_batch_exam_student_id`) REFERENCES `exam_group_class_batch_exam_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_group_students`
--
ALTER TABLE `exam_group_students`
  ADD CONSTRAINT `exam_group_students_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_group_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_discounts`
--
ALTER TABLE `fees_discounts`
  ADD CONSTRAINT `fees_discounts_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_groups_feetype`
--
ALTER TABLE `fee_groups_feetype`
  ADD CONSTRAINT `fee_groups_feetype_ibfk_1` FOREIGN KEY (`fee_session_group_id`) REFERENCES `fee_session_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_groups_feetype_ibfk_2` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_groups_feetype_ibfk_3` FOREIGN KEY (`feetype_id`) REFERENCES `feetype` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_groups_feetype_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_session_groups`
--
ALTER TABLE `fee_session_groups`
  ADD CONSTRAINT `fee_session_groups_ibfk_1` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_session_groups_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  ADD CONSTRAINT `front_cms_page_contents_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `front_cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  ADD CONSTRAINT `front_cms_program_photos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `front_cms_programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homework`
--
ALTER TABLE `homework`
  ADD CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_issue`
--
ALTER TABLE `item_issue`
  ADD CONSTRAINT `item_issue_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_issue_ibfk_2` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_stock_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_ibfk_2` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_ibfk_3` FOREIGN KEY (`subject_group_class_sections_id`) REFERENCES `subject_group_class_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `multi_class_students`
--
ALTER TABLE `multi_class_students`
  ADD CONSTRAINT `multi_class_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `multi_class_students_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notification_roles`
--
ALTER TABLE `notification_roles`
  ADD CONSTRAINT `notification_roles_ibfk_1` FOREIGN KEY (`send_notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notification_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onlineexam`
--
ALTER TABLE `onlineexam`
  ADD CONSTRAINT `onlineexam_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onlineexam_attempts`
--
ALTER TABLE `onlineexam_attempts`
  ADD CONSTRAINT `onlineexam_attempts_ibfk_1` FOREIGN KEY (`onlineexam_student_id`) REFERENCES `onlineexam_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onlineexam_questions`
--
ALTER TABLE `onlineexam_questions`
  ADD CONSTRAINT `onlineexam_questions_ibfk_1` FOREIGN KEY (`onlineexam_id`) REFERENCES `onlineexam` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `onlineexam_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `onlineexam_questions_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onlineexam_students`
--
ALTER TABLE `onlineexam_students`
  ADD CONSTRAINT `onlineexam_students_ibfk_1` FOREIGN KEY (`onlineexam_id`) REFERENCES `onlineexam` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `onlineexam_students_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onlineexam_student_results`
--
ALTER TABLE `onlineexam_student_results`
  ADD CONSTRAINT `onlineexam_student_results_ibfk_1` FOREIGN KEY (`onlineexam_student_id`) REFERENCES `onlineexam_students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `onlineexam_student_results_ibfk_2` FOREIGN KEY (`onlineexam_question_id`) REFERENCES `onlineexam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_admissions`
--
ALTER TABLE `online_admissions`
  ADD CONSTRAINT `online_admissions_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD CONSTRAINT `FK_staff_attendance_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_staff_attendance_staff_attendance_type` FOREIGN KEY (`staff_attendance_type_id`) REFERENCES `staff_attendance_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  ADD CONSTRAINT `FK_staff_leave_details_leave_types` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_staff_leave_details_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  ADD CONSTRAINT `FK_staff_leave_request_leave_types` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`),
  ADD CONSTRAINT `FK_staff_leave_request_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  ADD CONSTRAINT `FK_staff_payslip_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_rating`
--
ALTER TABLE `staff_rating`
  ADD CONSTRAINT `FK_staff_rating_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_roles`
--
ALTER TABLE `staff_roles`
  ADD CONSTRAINT `FK_staff_roles_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_staff_roles_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  ADD CONSTRAINT `FK_staff_timeline_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_session`
--
ALTER TABLE `student_session`
  ADD CONSTRAINT `student_session_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_session_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_session_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_session_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_subject_attendances`
--
ALTER TABLE `student_subject_attendances`
  ADD CONSTRAINT `student_subject_attendances_ibfk_1` FOREIGN KEY (`attendence_type_id`) REFERENCES `attendence_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_subject_attendances_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_subject_attendances_ibfk_3` FOREIGN KEY (`subject_timetable_id`) REFERENCES `subject_timetable` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_groups`
--
ALTER TABLE `subject_groups`
  ADD CONSTRAINT `subject_groups_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_group_class_sections`
--
ALTER TABLE `subject_group_class_sections`
  ADD CONSTRAINT `subject_group_class_sections_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_group_class_sections_ibfk_2` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_group_class_sections_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_group_subjects`
--
ALTER TABLE `subject_group_subjects`
  ADD CONSTRAINT `subject_group_subjects_ibfk_1` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_group_subjects_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_group_subjects_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_syllabus`
--
ALTER TABLE `subject_syllabus`
  ADD CONSTRAINT `subject_syllabus_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_syllabus_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_syllabus_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_syllabus_ibfk_4` FOREIGN KEY (`created_for`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_timetable`
--
ALTER TABLE `subject_timetable`
  ADD CONSTRAINT `subject_timetable_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_timetable_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_timetable_ibfk_3` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_timetable_ibfk_4` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_timetable_ibfk_5` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_timetable_ibfk_6` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `topic_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
