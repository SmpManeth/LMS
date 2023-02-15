-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2023 at 04:29 AM
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
-- Table structure for table `band_scores`
--

CREATE TABLE `band_scores` (
  `id` int(11) NOT NULL,
  `band_score` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `band_scores`
--

INSERT INTO `band_scores` (`id`, `band_score`) VALUES
(1, 20),
(2, 40),
(3, 45),
(4, 50),
(5, 55),
(6, 60),
(7, 65),
(8, 70),
(9, 75),
(10, 80),
(11, 85),
(12, 90);

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
(70, 'EI', 'no', '2023-02-07 01:12:03', NULL),
(71, 'GI', 'no', '2023-02-07 01:12:03', NULL),
(72, 'MG', 'no', '2023-02-07 01:12:03', NULL),
(73, 'II', 'no', '2023-02-07 01:12:03', NULL),
(74, 'OL', 'no', '2023-02-07 01:12:03', NULL),
(75, 'OR', 'no', '2023-02-07 01:12:03', NULL),
(76, 'OW', 'no', '2023-02-07 01:12:03', NULL),
(77, 'OS', 'no', '2023-02-07 01:12:03', NULL),
(78, 'OEI', 'no', '2023-02-07 01:12:03', NULL),
(79, 'OGI', 'no', '2023-02-07 01:12:03', NULL),
(80, 'OMG', 'no', '2023-02-07 01:12:03', NULL),
(81, 'OII', 'no', '2023-02-07 01:12:03', NULL),
(82, 'OOL', 'no', '2023-02-07 01:12:03', NULL),
(83, 'OOR', 'no', '2023-02-07 01:12:03', NULL),
(84, 'OOW', 'no', '2023-02-07 01:12:03', NULL),
(85, 'OOS', 'no', '2023-02-07 01:12:03', NULL),
(86, 'UEI', 'no', '2023-02-07 01:12:03', NULL),
(87, 'UGI', 'no', '2023-02-07 01:12:03', NULL),
(88, 'UMG', 'no', '2023-02-07 01:12:03', NULL),
(89, 'UII', 'no', '2023-02-07 01:12:03', NULL),
(90, 'UOL', 'no', '2023-02-07 01:12:03', NULL),
(91, 'UOR', 'no', '2023-02-07 01:12:03', NULL),
(92, 'UOW', 'no', '2023-02-07 01:12:03', NULL),
(93, 'UOS', 'no', '2023-02-07 01:12:03', NULL);

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
(73, 33, 1, 'no', '2023-02-07 01:08:32', NULL),
(74, 93, 24, 'no', '2023-02-07 01:13:23', NULL),
(75, 92, 23, 'no', '2023-02-07 01:13:42', NULL),
(76, 91, 22, 'no', '2023-02-07 01:13:51', NULL),
(77, 90, 21, 'no', '2023-02-07 01:14:00', NULL),
(78, 89, 20, 'no', '2023-02-07 01:14:09', NULL),
(79, 88, 19, 'no', '2023-02-07 01:14:18', NULL),
(80, 87, 18, 'no', '2023-02-07 01:14:34', NULL),
(81, 86, 17, 'no', '2023-02-07 01:14:51', NULL),
(82, 85, 16, 'no', '2023-02-07 01:15:08', NULL),
(83, 84, 14, 'no', '2023-02-07 01:15:16', NULL),
(84, 83, 15, 'no', '2023-02-07 01:15:26', NULL),
(85, 82, 13, 'no', '2023-02-07 01:15:35', NULL),
(86, 81, 12, 'no', '2023-02-07 01:15:47', NULL),
(87, 80, 11, 'no', '2023-02-07 01:16:03', NULL),
(88, 79, 10, 'no', '2023-02-07 01:16:13', NULL),
(89, 78, 9, 'no', '2023-02-07 01:16:29', NULL),
(90, 77, 7, 'no', '2023-02-07 01:16:41', NULL),
(91, 76, 6, 'no', '2023-02-07 01:16:49', NULL),
(92, 75, 8, 'no', '2023-02-07 01:16:56', NULL),
(93, 74, 5, 'no', '2023-02-07 01:17:04', NULL),
(95, 73, 4, 'no', '2023-02-07 01:17:29', NULL),
(96, 72, 3, 'no', '2023-02-07 01:17:35', NULL),
(97, 71, 2, 'no', '2023-02-07 01:19:18', NULL),
(98, 70, 1, 'no', '2023-02-07 01:19:25', NULL);

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
-- Table structure for table `course_slots`
--

CREATE TABLE `course_slots` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `link` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course_slots`
--

INSERT INTO `course_slots` (`id`, `name`, `type`, `date`, `time`, `link`, `course_id`, `created_at`) VALUES
(27, 'Slot One new', 'IELTS Classes', '2023-02-06', '06:09:00', 'maneth', '1', '2023-02-14 12:13:23'),
(28, 'Slot Two', 'IELTS Classes', '2023-02-08', '22:20:33', 'www.join.me.free', '1', '2023-02-07 13:06:27'),
(29, 'Slot Three', 'IELTS Classes', '2023-02-08', '22:20:33', 'www.join.me.free', '1', '2023-02-07 13:06:30'),
(30, 'Slot Four', 'IELTS Classes', '2023-02-08', '22:20:33', 'www.join.me.free', '1', '2023-02-07 13:06:34'),
(31, 'Slot Five', 'IELTS Classes', '2023-02-08', '22:20:33', 'www.join.me.free', '1', '2023-02-07 13:06:37'),
(32, 'Slot Six', 'IELTS Classes', NULL, NULL, NULL, '1', '2023-02-07 11:32:25'),
(33, 'Slot Seven', 'IELTS Classes', NULL, NULL, NULL, '1', '2023-02-07 11:32:25'),
(34, 'Slot Eight', 'IELTS Classes', NULL, NULL, NULL, '1', '2023-02-07 11:32:25'),
(35, 'Slot Nine', 'IELTS Classes', NULL, NULL, NULL, '1', '2023-02-07 11:32:25'),
(36, 'Slot ten', 'IELTS Classes', NULL, NULL, NULL, '1', '2023-02-07 11:32:25'),
(37, 'Slot Eleven', 'IELTS Classes', NULL, NULL, NULL, '1', '2023-02-07 11:32:25'),
(38, 'Slot Twelwe', 'IELTS Classes', NULL, NULL, NULL, '1', '2023-02-07 11:32:25'),
(39, 'Slot One', 'Mock Test', NULL, NULL, NULL, '1', '2023-02-07 11:32:25'),
(40, 'Slot Two', 'Mock Test', NULL, NULL, NULL, '1', '2023-02-07 11:32:25'),
(42, 'Slot Two', 'IELTS Classes', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(43, 'Slot Three', 'IELTS Classes', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(44, 'Slot Four', 'IELTS Classes', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(45, 'Slot Five', 'IELTS Classes', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(46, 'Slot Six', 'IELTS Classes', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(47, 'Slot Seven', 'IELTS Classes', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(48, 'Slot Eight', 'IELTS Classes', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(49, 'Slot Nine', 'IELTS Classes', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(50, 'Slot ten', 'IELTS Classes', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(53, 'Slot One', 'Mock Test', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(54, 'Slot Two', 'Mock Test', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(55, 'Slot Three', 'Mock Test', NULL, NULL, NULL, '2', '2023-02-07 11:32:25'),
(56, 'Slot One', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:40:06'),
(57, 'Slot Two', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:29'),
(58, 'Slot Three', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:29'),
(59, 'Slot Four', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:29'),
(60, 'Slot Five', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:29'),
(61, 'Slot Six', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:29'),
(62, 'Slot Seven', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:29'),
(63, 'Slot Eight', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:29'),
(64, 'Slot Nine', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:30'),
(65, 'Slot Ten', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:30'),
(66, 'Slot Eleven', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:30'),
(67, 'Slot Twelwe', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:30'),
(68, 'Slot Thirteen', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:30'),
(69, 'Slot Fourteen', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:30'),
(70, 'Slot Fifteen', 'Grammer Classes', NULL, NULL, NULL, '2', '2023-02-07 11:41:30'),
(72, 'new Grammer Slot', 'Grammer Classes', NULL, NULL, NULL, '3', '2023-02-14 23:53:35'),
(73, 'new Mock Slot', 'Mock Test', NULL, NULL, NULL, '3', '2023-02-14 23:53:52'),
(74, 'new Slot ielts', 'IELTS Classes', NULL, NULL, NULL, '3', '2023-02-15 01:46:31');

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
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `student_reg_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bandscore` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `occupation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ielts_course` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expected_band_score` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `coursecode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `User_id` int(11) NOT NULL,
  `is_student` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `student_reg_no`, `bandscore`, `first_name`, `last_name`, `phone`, `email`, `address`, `occupation`, `ielts_course`, `expected_band_score`, `coursecode`, `created_at`, `User_id`, `is_student`) VALUES
(1, 'LD2302EI400001', '40', 'Maneth', 'Pathirana', '0761535453', 'smpmaneth@gmail.com', 'Sisira,Attudawa', 'sagh', 'Express IELTS Course', '12', 'EI', '2023-02-07 03:42:17', 18, 1),
(2, 'LD2302II200002', '20', 'xb', 'cxbczxb', '+94755725', 'smpmaneth@gmail.com', 'Sisira,Attudawa', 'l;hjlhbl', 'Express IELTS Course', '41', 'II', '2023-02-07 03:40:26', 18, 0);

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
(0, 'Record updated On students id 1005', '1005', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-05 18:54:32', NULL),
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
(13, 'New Record inserted On subject groups id 16', '16', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-19 14:14:21', NULL),
(14, 'New Record inserted On subject groups id 17', '17', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 09:32:53', NULL),
(15, 'Record updated On sections id 2', '2', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:23:09', NULL),
(16, 'Record updated On sections id 3', '3', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:23:18', NULL),
(17, 'Record updated On sections id 4', '4', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:23:27', NULL),
(18, 'Record updated On sections id 5', '5', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:23:43', NULL),
(19, 'Record updated On sections id 6', '6', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:23:54', NULL),
(20, 'Record updated On sections id 7', '7', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:24:14', NULL),
(21, 'Record updated On sections id 8', '8', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:24:24', NULL),
(22, 'Record updated On sections id 9', '9', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:24:32', NULL),
(23, 'Record updated On sections id 10', '10', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:24:40', NULL),
(24, 'Record updated On sections id 11', '11', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:24:50', NULL),
(25, 'Record updated On sections id 12', '12', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:24:56', NULL),
(26, 'Record updated On sections id 13', '13', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:25:03', NULL),
(27, 'New Record inserted On students id 926', '926', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:55:28', NULL),
(29, 'New Record inserted On users id 1851', '1851', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:55:28', NULL),
(30, 'New Record inserted On users id 1852', '1852', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:55:28', NULL),
(31, 'Record updated On students id 926', '926', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 10:55:28', NULL),
(32, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 11:39:26', NULL),
(34, 'New Record inserted On users id 1853', '1853', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 11:39:26', NULL),
(35, 'New Record inserted On users id 1854', '1854', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 11:39:26', NULL),
(36, 'Record updated On students id 0', '0', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 11:39:26', NULL),
(37, 'New Record inserted On students id 4', '4', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:07:30', NULL),
(39, 'New Record inserted On users id 1855', '1855', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:07:30', NULL),
(40, 'New Record inserted On users id 1856', '1856', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:07:30', NULL),
(41, 'Record updated On students id 4', '4', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:07:30', NULL),
(42, 'New Record inserted On students id 5', '5', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:25:44', NULL),
(43, 'New Record inserted On students id 6', '6', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:26:24', NULL),
(44, 'New Record inserted On students id 7', '7', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:27:35', NULL),
(45, 'New Record inserted On students id 8', '8', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:29:13', NULL),
(46, 'New Record inserted On students id 9', '9', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:31:05', NULL),
(47, 'New Record inserted On students id 10', '10', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:31:32', NULL),
(48, 'New Record inserted On students id 11', '11', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:32:21', NULL),
(49, 'New Record inserted On students id 12', '12', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:32:58', NULL),
(50, 'New Record inserted On students id 13', '13', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:33:24', NULL),
(51, 'New Record inserted On students id 14', '14', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:33:56', NULL),
(52, 'New Record inserted On students id 15', '15', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:34:06', NULL),
(53, 'New Record inserted On students id 16', '16', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:34:29', NULL),
(54, 'New Record inserted On students id 17', '17', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:34:53', NULL),
(55, 'New Record inserted On students id 18', '18', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:37:11', NULL),
(56, 'New Record inserted On students id 19', '19', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:37:33', NULL),
(57, 'New Record inserted On students id 20', '20', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:37:55', NULL),
(58, 'New Record inserted On students id 21', '21', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:38:17', NULL),
(59, 'New Record inserted On students id 22', '22', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:38:30', NULL),
(60, 'New Record inserted On students id 23', '23', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:40:44', NULL),
(61, 'New Record inserted On students id 24', '24', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:41:03', NULL),
(62, 'New Record inserted On students id 25', '25', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:42:39', NULL),
(63, 'New Record inserted On students id 26', '26', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:43:20', NULL),
(64, 'New Record inserted On students id 27', '27', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:43:50', NULL),
(65, 'New Record inserted On students id 28', '28', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:44:31', NULL),
(66, 'New Record inserted On students id 29', '29', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:44:42', NULL),
(67, 'New Record inserted On students id 30', '30', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:44:56', NULL),
(68, 'New Record inserted On students id 31', '31', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:45:03', NULL),
(69, 'New Record inserted On students id 32', '32', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:45:21', NULL),
(70, 'New Record inserted On students id 33', '33', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:47:02', NULL),
(71, 'New Record inserted On students id 34', '34', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:47:29', NULL),
(72, 'New Record inserted On students id 35', '35', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:49:37', NULL),
(73, 'New Record inserted On students id 36', '36', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:50:15', NULL),
(74, 'New Record inserted On students id 37', '37', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:50:59', NULL),
(75, 'New Record inserted On students id 38', '38', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-21 12:52:39', NULL),
(76, 'New Record inserted On students id 39', '39', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 07:29:26', NULL),
(77, 'New Record inserted On students id 40', '40', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 07:43:13', NULL),
(78, 'Record updated On students id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 08:55:12', NULL),
(79, 'Record updated On students id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 08:56:57', NULL),
(80, 'Record updated On students id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 08:57:59', NULL),
(81, 'Record updated On students id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 08:58:16', NULL),
(82, 'Record updated On students id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 08:59:22', NULL),
(83, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:11:50', NULL),
(84, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:12:34', NULL),
(85, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:12:37', NULL),
(86, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:12:50', NULL),
(87, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:12:56', NULL),
(88, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:13:01', NULL),
(89, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:14:09', NULL),
(90, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:15:29', NULL),
(91, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:16:15', NULL),
(92, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:21:47', NULL),
(93, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:23:00', NULL),
(94, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:26:25', NULL),
(95, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:27:39', NULL),
(96, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:28:20', NULL),
(97, 'Record updated On Lead id 34', '34', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:28:24', NULL),
(98, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:28:29', NULL),
(99, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:39:03', NULL),
(100, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:41:35', NULL),
(101, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:45:48', NULL),
(102, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:46:06', NULL),
(103, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:48:11', NULL),
(104, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:49:19', NULL),
(105, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:50:22', NULL),
(106, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:50:49', NULL),
(107, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 09:52:45', NULL),
(108, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 10:00:41', NULL),
(109, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 10:00:50', NULL),
(110, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 10:01:38', NULL),
(111, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 10:02:23', NULL),
(112, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 10:02:41', NULL),
(113, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 10:04:53', NULL),
(114, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 11:12:10', NULL),
(115, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 11:13:14', NULL),
(116, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 11:15:00', NULL),
(117, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:25:32', NULL),
(118, 'New Record inserted On students id 41', '41', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:28:35', NULL),
(119, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:29:21', NULL),
(120, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:30:01', NULL),
(121, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:30:29', NULL),
(122, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:32:00', NULL),
(123, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:33:47', NULL),
(124, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:34:24', NULL),
(125, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:35:25', NULL),
(126, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:35:35', NULL),
(127, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:35:47', NULL),
(128, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:36:06', NULL),
(129, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:36:20', NULL),
(130, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:37:08', NULL),
(131, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:39:09', NULL),
(132, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:39:22', NULL),
(133, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:39:28', NULL),
(134, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:40:23', NULL),
(135, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:42:01', NULL),
(136, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:43:59', NULL),
(137, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:44:07', NULL),
(138, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:48:03', NULL),
(139, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:48:24', NULL),
(140, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:51:04', NULL),
(141, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:51:16', NULL),
(142, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:58:57', NULL),
(143, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 12:59:23', NULL),
(144, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 13:01:57', NULL),
(145, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 13:02:09', NULL),
(146, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 13:04:09', NULL),
(147, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 13:31:27', NULL),
(148, 'New Record inserted On students id 0', '0', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 13:32:37', NULL),
(149, 'New Record inserted On students id 928', '928', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 13:34:47', NULL),
(150, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 13:37:15', NULL),
(151, 'New Record inserted On students id 929', '929', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-24 13:37:25', NULL),
(152, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:19:27', NULL),
(153, 'New Record inserted On students id 930', '930', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:19:42', NULL),
(154, 'New Record inserted On students id 931', '931', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:21:50', NULL),
(155, 'New Record inserted On students id 932', '932', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:22:25', NULL),
(156, 'New Record inserted On students id 933', '933', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:23:20', NULL),
(157, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:28:56', NULL),
(158, 'New Record inserted On students id 934', '934', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:29:05', NULL),
(159, 'New Record inserted On students id 935', '935', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:30:06', NULL),
(160, 'New Record inserted On students id 936', '936', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:30:21', NULL),
(161, 'New Record inserted On students id 937', '937', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:31:04', NULL),
(162, 'New Record inserted On users id 1858', '1858', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:31:04', NULL),
(163, 'New Record inserted On students id 938', '938', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:31:49', NULL),
(164, 'New Record inserted On users id 1859', '1859', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:31:49', NULL),
(165, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:33:01', NULL),
(166, 'New Record inserted On students id 939', '939', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:33:15', NULL),
(167, 'New Record inserted On users id 1860', '1860', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:33:15', NULL),
(168, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:35:43', NULL),
(169, 'New Record inserted On students id 940', '940', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:35:49', NULL),
(170, 'New Record inserted On users id 1861', '1861', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:35:49', NULL),
(171, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:39:57', NULL),
(172, 'New Record inserted On students id 941', '941', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:40:16', NULL),
(173, 'New Record inserted On users id 1862', '1862', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:40:16', NULL),
(174, 'New Record inserted On students id 942', '942', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:41:24', NULL),
(175, 'New Record inserted On users id 1863', '1863', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:41:24', NULL),
(176, 'New Record inserted On students id 943', '943', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:41:56', NULL),
(177, 'New Record inserted On users id 1864', '1864', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:41:56', NULL),
(178, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:45:15', NULL),
(179, 'New Record inserted On students id 944', '944', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:45:30', NULL),
(180, 'New Record inserted On users id 1865', '1865', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:45:30', NULL),
(181, 'New Record inserted On students id 945', '945', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:46:49', NULL),
(182, 'New Record inserted On users id 1866', '1866', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:46:49', NULL),
(183, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:49:33', NULL),
(184, 'New Record inserted On students id 946', '946', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:49:48', NULL),
(185, 'New Record inserted On users id 1867', '1867', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:49:48', NULL),
(186, 'New Record inserted On students id 947', '947', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:58:12', NULL),
(187, 'New Record inserted On users id 1868', '1868', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:58:12', NULL),
(188, 'New Record inserted On students id 948', '948', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:59:10', NULL),
(189, 'New Record inserted On users id 1869', '1869', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:59:10', NULL),
(190, 'New Record inserted On students id 949', '949', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:59:47', NULL),
(191, 'New Record inserted On users id 1870', '1870', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 00:59:48', NULL),
(192, 'New Record inserted On students id 950', '950', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:00:45', NULL),
(193, 'New Record inserted On users id 1871', '1871', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:00:45', NULL),
(194, 'New Record inserted On students id 951', '951', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:00:52', NULL),
(195, 'New Record inserted On users id 1872', '1872', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:00:52', NULL),
(196, 'New Record inserted On students id 952', '952', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:01:03', NULL),
(197, 'New Record inserted On users id 1873', '1873', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:01:03', NULL),
(198, 'New Record inserted On students id 953', '953', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:01:28', NULL),
(199, 'New Record inserted On users id 1874', '1874', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:01:28', NULL),
(200, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:07:18', NULL),
(201, 'New Record inserted On students id 954', '954', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:07:33', NULL),
(202, 'New Record inserted On users id 1875', '1875', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:07:34', NULL),
(203, 'New Record inserted On students id 955', '955', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:14:12', NULL),
(204, 'New Record inserted On users id 1876', '1876', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:14:12', NULL),
(205, 'New Record inserted On students id 956', '956', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:14:28', NULL),
(206, 'New Record inserted On users id 1877', '1877', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:14:28', NULL),
(207, 'New Record inserted On students id 957', '957', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:14:43', NULL),
(208, 'New Record inserted On users id 1878', '1878', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:14:43', NULL),
(209, 'New Record inserted On students id 958', '958', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:14:50', NULL),
(210, 'New Record inserted On users id 1879', '1879', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:14:50', NULL),
(211, 'New Record inserted On students id 959', '959', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:15:36', NULL),
(212, 'New Record inserted On users id 1880', '1880', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:15:36', NULL),
(213, 'New Record inserted On students id 960', '960', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:16:27', NULL),
(214, 'New Record inserted On users id 1881', '1881', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:16:27', NULL),
(215, 'New Record inserted On students id 961', '961', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:17:14', NULL),
(216, 'New Record inserted On users id 1882', '1882', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:17:14', NULL),
(217, 'New Record inserted On students id 962', '962', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:17:56', NULL),
(218, 'New Record inserted On users id 1883', '1883', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:17:56', NULL),
(219, 'New Record inserted On students id 963', '963', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:18:13', NULL),
(220, 'New Record inserted On users id 1884', '1884', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:18:13', NULL),
(221, 'New Record inserted On students id 964', '964', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:18:21', NULL),
(222, 'New Record inserted On users id 1885', '1885', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:18:21', NULL),
(223, 'New Record inserted On students id 965', '965', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:18:40', NULL),
(224, 'New Record inserted On users id 1886', '1886', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:18:40', NULL),
(225, 'New Record inserted On students id 966', '966', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:19:40', NULL),
(226, 'New Record inserted On users id 1887', '1887', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:19:40', NULL),
(227, 'New Record inserted On students id 967', '967', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:19:51', NULL),
(228, 'New Record inserted On users id 1888', '1888', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:19:51', NULL),
(229, 'New Record inserted On students id 968', '968', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:20:03', NULL),
(230, 'New Record inserted On users id 1889', '1889', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:20:03', NULL),
(231, 'New Record inserted On students id 969', '969', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:20:24', NULL),
(232, 'New Record inserted On users id 1890', '1890', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:20:24', NULL),
(233, 'New Record inserted On students id 970', '970', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:20:36', NULL),
(234, 'New Record inserted On users id 1891', '1891', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:20:36', NULL),
(235, 'New Record inserted On students id 971', '971', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:20:50', NULL),
(236, 'New Record inserted On users id 1892', '1892', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:20:50', NULL),
(237, 'New Record inserted On students id 972', '972', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:22:32', NULL),
(238, 'New Record inserted On users id 1893', '1893', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:22:32', NULL),
(239, 'New Record inserted On students id 973', '973', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:22:41', NULL),
(240, 'New Record inserted On users id 1894', '1894', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:22:41', NULL),
(241, 'New Record inserted On students id 974', '974', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:23:00', NULL),
(242, 'New Record inserted On users id 1895', '1895', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:23:00', NULL),
(243, 'New Record inserted On students id 975', '975', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:23:11', NULL),
(244, 'New Record inserted On users id 1896', '1896', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:23:11', NULL),
(245, 'New Record inserted On students id 976', '976', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:23:46', NULL),
(246, 'New Record inserted On users id 1897', '1897', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:23:46', NULL),
(247, 'New Record inserted On students id 977', '977', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:23:59', NULL),
(248, 'New Record inserted On users id 1898', '1898', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:23:59', NULL),
(249, 'New Record inserted On students id 978', '978', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:24:08', NULL),
(250, 'New Record inserted On users id 1899', '1899', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:24:08', NULL),
(251, 'New Record inserted On students id 979', '979', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:25:33', NULL),
(252, 'New Record inserted On users id 1900', '1900', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:25:33', NULL),
(253, 'New Record inserted On students id 980', '980', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:26:14', NULL),
(254, 'New Record inserted On users id 1901', '1901', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:26:14', NULL),
(255, 'New Record inserted On students id 981', '981', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:26:26', NULL),
(256, 'New Record inserted On users id 1902', '1902', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:26:26', NULL),
(257, 'New Record inserted On students id 982', '982', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:26:30', NULL),
(258, 'New Record inserted On users id 1903', '1903', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:26:30', NULL),
(259, 'New Record inserted On students id 983', '983', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:26:33', NULL),
(260, 'New Record inserted On users id 1904', '1904', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:26:33', NULL),
(261, 'New Record inserted On students id 984', '984', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:26:37', NULL),
(262, 'New Record inserted On users id 1905', '1905', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:26:37', NULL),
(263, 'New Record inserted On students id 985', '985', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:27:31', NULL),
(264, 'New Record inserted On users id 1906', '1906', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:27:31', NULL),
(265, 'New Record inserted On students id 986', '986', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:28:28', NULL),
(266, 'New Record inserted On users id 1907', '1907', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:28:29', NULL),
(267, 'New Record inserted On students id 987', '987', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:28:39', NULL),
(268, 'New Record inserted On users id 1908', '1908', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:28:39', NULL),
(269, 'New Record inserted On students id 988', '988', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:28:51', NULL),
(270, 'New Record inserted On users id 1909', '1909', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:28:51', NULL),
(271, 'New Record inserted On students id 989', '989', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:29:13', NULL),
(272, 'New Record inserted On users id 1910', '1910', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:29:13', NULL),
(273, 'New Record inserted On students id 990', '990', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:29:27', NULL),
(274, 'New Record inserted On users id 1911', '1911', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:29:27', NULL),
(275, 'New Record inserted On students id 991', '991', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:33:12', NULL),
(276, 'New Record inserted On users id 1912', '1912', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:33:12', NULL),
(277, 'New Record inserted On students id 992', '992', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:35:10', NULL),
(278, 'New Record inserted On users id 1913', '1913', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:35:10', NULL),
(279, 'New Record inserted On students id 993', '993', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:35:44', NULL),
(280, 'New Record inserted On users id 1914', '1914', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:35:44', NULL),
(281, 'New Record inserted On students id 994', '994', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:36:31', NULL),
(282, 'New Record inserted On users id 1915', '1915', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:36:31', NULL),
(283, 'New Record inserted On students id 995', '995', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:56:50', NULL),
(284, 'New Record inserted On users id 1916', '1916', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:56:50', NULL),
(285, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:56:54', NULL),
(286, 'Record updated On Lead id 41', '41', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:57:07', NULL),
(287, 'New Record inserted On students id 996', '996', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:57:18', NULL),
(288, 'New Record inserted On users id 1917', '1917', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 01:57:18', NULL),
(289, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:40:58', NULL),
(290, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:41:36', NULL),
(291, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:41:44', NULL),
(292, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:42:44', NULL),
(293, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:43:11', NULL),
(294, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:44:22', NULL),
(295, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:44:28', NULL),
(296, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:44:40', NULL),
(297, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:44:54', NULL),
(298, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:46:04', NULL),
(299, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:46:35', NULL),
(300, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:46:49', NULL),
(301, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:46:59', NULL),
(302, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:48:00', NULL),
(303, 'Record updated On Lead id 39', '39', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:48:07', NULL),
(304, 'New Record inserted On students id 997', '997', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:49:00', NULL),
(305, 'New Record inserted On users id 1918', '1918', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:49:00', NULL),
(306, 'New Record inserted On students id 998', '998', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:51:19', NULL),
(307, 'New Record inserted On students id 999', '999', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:51:28', NULL),
(308, 'New Record inserted On students id 1000', '1000', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:51:39', NULL),
(309, 'New Record inserted On users id 1919', '1919', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:51:39', NULL),
(310, 'New Record inserted On students id 1001', '1001', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:51:46', NULL),
(311, 'New Record inserted On users id 1920', '1920', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:51:46', NULL),
(312, 'New Record inserted On students id 1002', '1002', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:51:58', NULL),
(313, 'New Record inserted On users id 1921', '1921', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:51:58', NULL),
(314, 'New Record inserted On students id 1003', '1003', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:52:06', NULL),
(315, 'New Record inserted On users id 1922', '1922', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:52:06', NULL),
(316, 'New Record inserted On students id 1004', '1004', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:52:13', NULL),
(317, 'New Record inserted On users id 1923', '1923', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-31 06:52:13', NULL),
(318, 'New Record inserted On students id 42', '42', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 01:56:21', NULL),
(319, 'Record updated On Lead id 42', '42', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 01:56:34', NULL),
(320, 'Record updated On Lead id 42', '42', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 01:58:09', NULL),
(321, 'Record updated On Lead id 42', '42', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 01:58:31', NULL),
(322, 'New Record inserted On students id 1005', '1005', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 01:59:12', NULL),
(323, 'New Record inserted On users id 1924', '1924', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 01:59:12', NULL),
(324, 'New Record inserted On students id 43', '43', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 02:05:41', NULL),
(325, 'New Record inserted On students id 44', '44', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 02:22:37', NULL),
(326, 'New Record inserted On students id 45', '45', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 02:25:49', NULL),
(327, 'Record updated On Lead id 45', '45', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 02:25:58', NULL),
(328, 'New Record inserted On students id 46', '46', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 02:32:30', NULL),
(329, 'New Record inserted On students id 47', '47', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 02:33:04', NULL),
(330, 'Record updated On Lead id 43', '43', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 04:33:47', NULL),
(332, 'Record updated On Lead id 43', '43', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 04:35:06', NULL),
(333, 'Record updated On Lead id 43', '43', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 06:58:45', NULL),
(334, 'Record updated On Lead id 43', '43', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 06:59:09', NULL),
(335, 'New Record inserted On students id 1006', '1006', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 07:02:50', NULL),
(336, 'New Record inserted On users id 1925', '1925', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 07:02:50', NULL),
(337, 'Record updated On Lead id 43', '43', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 07:09:46', NULL),
(338, 'New Record inserted On students id 1007', '1007', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 07:09:46', NULL),
(339, 'New Record inserted On users id 1926', '1926', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 07:09:47', NULL),
(340, 'Record updated On Lead id 43', '43', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 08:07:36', NULL),
(341, 'New Record inserted On students id 1008', '1008', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 08:07:36', NULL),
(342, 'New Record inserted On users id 1927', '1927', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 08:07:36', NULL),
(343, 'Record updated On Lead id 43', '43', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 08:09:12', NULL),
(344, 'New Record inserted On students id 1009', '1009', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 08:09:12', NULL),
(345, 'New Record inserted On users id 1928', '1928', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 08:09:12', NULL),
(346, 'New Record inserted On students id 48', '48', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 08:52:09', NULL),
(347, 'Record updated On Lead id 48', '48', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 08:52:43', NULL),
(348, 'New Record inserted On students id 1010', '1010', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 08:52:43', NULL),
(349, 'New Record inserted On users id 1929', '1929', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 08:52:43', NULL),
(350, 'Record updated On Lead id 1010', '1010', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:08:07', NULL),
(351, 'New Record inserted On students id 1011', '1011', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:08:07', NULL),
(352, 'New Record inserted On users id 1930', '1930', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:08:07', NULL),
(353, 'Record updated On students id 1011', '1011', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:22:00', NULL),
(354, 'Record updated On students id 1011', '1011', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:22:14', NULL),
(355, 'Record updated On Lead id ', '', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:24:27', NULL),
(356, 'New Record inserted On students id 1012', '1012', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:24:27', NULL),
(357, 'New Record inserted On users id 1931', '1931', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:24:27', NULL),
(358, 'Record updated On students id 1012', '1012', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:24:41', NULL),
(359, 'Record updated On students id 1012', '1012', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:24:41', NULL),
(360, 'Record updated On Lead id ', '', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:25:34', NULL),
(361, 'New Record inserted On students id 1013', '1013', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:25:34', NULL),
(362, 'New Record inserted On users id 1932', '1932', 18, 'Insert', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:25:34', NULL),
(363, 'Record updated On students id 1013', '1013', 18, 'Update', '::1', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-03 09:46:48', NULL);

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
(17, 'Front Office', 'front_office', 0, 0, '2023-02-08 01:29:53'),
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
(30, 'Deal Information', 'deal_information', 1, 1, '2019-03-15 09:30:22'),
(31, 'Lead Information', 'lead_information', 1, 0, '2023-01-21 05:38:25'),
(32, 'Student Time Table', 'student_time_table', 1, 0, '2023-02-08 10:20:32');

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
(1, 'Fees', 'fees', 0, 0, 0, 2, '2023-02-07 08:32:20'),
(2, 'Class Timetable', 'class_timetable', 1, 1, 1, 7, '2020-05-30 19:57:50'),
(3, 'Homework', 'homework', 0, 0, 0, 19, '2022-05-06 07:47:53'),
(4, 'Download Center', 'download_center', 0, 0, 0, 8, '2023-02-07 08:32:24'),
(5, 'Attendance', 'attendance', 0, 0, 0, 5, '2023-02-07 08:32:43'),
(7, 'Examinations', 'examinations', 0, 0, 0, 6, '2023-02-07 08:32:47'),
(8, 'Notice Board', 'notice_board', 0, 0, 0, 13, '2023-02-07 08:32:51'),
(11, 'Library', 'library', 0, 0, 0, 9, '2021-07-31 18:06:54'),
(12, 'Transport Routes', 'transport_routes', 0, 0, 0, 11, '2021-07-31 18:07:09'),
(13, 'Hostel Rooms', 'hostel_rooms', 0, 0, 0, 12, '2021-07-31 18:07:02'),
(14, 'Calendar To Do List', 'calendar_to_do_list', 0, 0, 0, 21, '2021-08-30 08:03:15'),
(15, 'Online Examination', 'online_examination', 0, 0, 0, 23, '2023-02-07 08:32:55'),
(16, 'Teachers Rating', 'teachers_rating', 0, 0, 0, 0, '2021-08-02 12:25:07'),
(17, 'Chat', 'chat', 0, 0, 0, 25, '2021-08-02 12:24:44'),
(18, 'Multi Class', 'multi_class', 1, 0, 1, 26, '2023-02-07 08:33:00'),
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
(1, 'Cambridge IELTS Academy', 0, '', 'Info@ieltsatcia.com', '+94 117 711 766', 'Cambridge IELTS Academy (Pvt) Ltd,\r\nNo: 35, S De S Jayasinghe Mawatha,\r\nKalubowila, Sri Lanka.', 4, '[\"4\"]', '', 'm/d/Y', '12-hour', 'LKR', 'Rs.', 'disabled', 0, 'Asia/Colombo', 16, '', 'after_number', 'yes', '1', 0, '1.jpg', '1.png', '1.png', 'red.jpg', 30, 0, '', '0700', 4, 1, 1, 'YGC/S/', '000', 3, 1, 'no', 1, 'no', 10000, '', '<p>&nbsp;Please enter your institution online admission terms &amp; conditions here.</p>\r\n', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '', '#424242', '#eeeeee', '1.png', 0, 'Monday', 1, '2023-01-21 11:52:32', NULL);

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
(1, 'Express IELTS Course', '', '2023-02-07 00:47:03', NULL),
(2, 'Grammar + IELTS Course', 'no', '2023-02-07 00:47:24', NULL),
(3, 'Moneyback Guaranteed IELTS', 'no', '2023-02-07 00:47:37', NULL),
(4, 'Individual IELTS Course', 'no', '2023-02-07 00:47:44', NULL),
(5, 'One Module IELTS Listening', 'no', '2023-02-07 00:52:58', NULL),
(6, 'One Module IELTS Writing', 'no', '2023-02-07 00:47:59', NULL),
(7, 'One Module IELTS Speaking', 'no', '2023-02-07 00:48:03', NULL),
(8, 'One Module IELTS Reading', 'no', '2023-02-07 00:53:29', NULL),
(9, 'ONLINE - Express IELTS Course', 'no', '2023-02-07 00:53:49', NULL),
(10, 'ONLINE - Grammar + IELTS Course', 'no', '2023-02-07 00:54:05', NULL),
(11, 'ONLINE - Moneyback Guaranteed IELTS', 'no', '2023-02-07 00:54:14', NULL),
(12, 'ONLINE - Individual IELTS Course', 'no', '2023-02-07 00:54:18', NULL),
(13, 'ONLINE – One Module Course Listening', 'no', '2023-02-07 00:55:20', NULL),
(14, 'ONLINE – One Module Course Writing', 'no', '2023-02-07 00:57:53', NULL),
(15, 'ONLINE – One Module Course Reading', 'no', '2023-02-07 00:58:30', NULL),
(16, 'ONLINE – One Module Course Speaking', 'no', '2023-02-07 01:00:33', NULL),
(17, 'UK-VI - Express IELTS Course', 'no', '2023-02-07 01:00:33', NULL),
(18, 'UK-VI - Grammar + IELTS Course', 'no', '2023-02-07 01:00:33', NULL),
(19, 'UK-VI - Moneyback Guaranteed IELTS', 'no', '2023-02-07 01:00:33', NULL),
(20, 'UK-VI - Individual IELTS Course', 'no', '2023-02-07 01:00:33', NULL),
(21, 'UK-VI – One Module Course Listening', 'no', '2023-02-07 01:00:33', NULL),
(22, 'UK-VI – One Module Course Reading', 'no', '2023-02-07 01:00:33', NULL),
(23, 'UK-VI – One Module Course Writing', 'no', '2023-02-07 01:00:33', NULL),
(24, 'UK-VI – One Module Course Speaking', 'no', '2023-02-07 01:00:33', NULL),
(25, 'Life Skills Course', 'no', '2023-02-07 01:00:34', NULL);

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
  `student_reg_no` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `bandscore` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `ielts_course` varchar(255) DEFAULT NULL,
  `expected_band_score` varchar(255) DEFAULT NULL,
  `coursecode` varchar(255) DEFAULT NULL,
  `passportNo` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `User_id` varchar(255) DEFAULT NULL,
  `is_student` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_reg_no`, `first_name`, `last_name`, `phone`, `bandscore`, `email`, `dob`, `address`, `occupation`, `ielts_course`, `expected_band_score`, `coursecode`, `passportNo`, `purpose`, `User_id`, `is_student`, `created_at`) VALUES
(74, '2302EI400001', 'Maneth', 'Pathirana', '0761535453', '40', 'smpmaneth@gmail.com', '2023-01-30', 'Sisira,Attudawa', 'sagh', '1', '12', 'EI', '200120403150', 'just for fun', '18', 1, '2023-02-07 03:42:17');

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
-- Table structure for table `student_course_slots`
--

CREATE TABLE `student_course_slots` (
  `id` int(11) NOT NULL,
  `student_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `course_slot_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_attended` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_course_slots`
--

INSERT INTO `student_course_slots` (`id`, `student_id`, `course_slot_id`, `is_attended`, `created_at`) VALUES
(30, '74', '27', 1, '2023-02-08 09:33:01'),
(31, '74', '28', 1, '2023-02-08 09:23:55'),
(32, '74', '29', 1, '2023-02-08 09:25:09');

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
(537, 0, 959, 4, 0.00, 'no', '2023-01-18 09:51:13'),
(538, 0, NULL, NULL, 0.00, 'no', '2023-01-21 10:55:28');

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
(0, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-02-05 16:54:48'),
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
(26, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-20 03:34:04'),
(27, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-21 05:19:31'),
(28, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-21 05:28:44'),
(29, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-21 06:10:00'),
(30, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-21 08:50:47'),
(31, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-23 10:12:30'),
(32, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-24 05:53:16'),
(33, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-27 04:42:48'),
(34, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-31 00:12:10'),
(35, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-31 00:28:02'),
(36, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-01-31 05:43:15'),
(37, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-02-03 00:53:45'),
(38, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-02-03 06:58:19'),
(39, 'smpmaneth@gmail.com', 'Super Admin', NULL, '::1', 'Chrome 109.0.0.0, Windows 10', '2023-02-03 12:06:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `lang_id` varchar(255) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES
(9, '1', '001', '001', '', 'student', '', '4', 'yes', '2023-02-07 02:36:59', NULL),
(37, '74', '2302EI400001', '55brqf6y', '', 'student', '', '4', 'yes', '2023-02-07 03:42:17', NULL);

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
-- Indexes for table `band_scores`
--
ALTER TABLE `band_scores`
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
-- Indexes for table `course_slots`
--
ALTER TABLE `course_slots`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `leads`
--
ALTER TABLE `leads`
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
-- Indexes for table `student_course_slots`
--
ALTER TABLE `student_course_slots`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `band_scores`
--
ALTER TABLE `band_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

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
-- AUTO_INCREMENT for table `course_slots`
--
ALTER TABLE `course_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

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
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `student_course_slots`
--
ALTER TABLE `student_course_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
