-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 21, 2024 at 11:36 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `complaint_tool`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE IF NOT EXISTS `admin_info` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_password` varchar(15) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_phone` varchar(15) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Admin Information';

-- --------------------------------------------------------

--
-- Table structure for table `complaint_info`
--

DROP TABLE IF EXISTS `complaint_info`;
CREATE TABLE IF NOT EXISTS `complaint_info` (
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  `tracking_id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `description` varchar(250) NOT NULL,
  `tracking_status` tinyint(1) NOT NULL,
  `admin_remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `complaint_raise_date` date NOT NULL,
  `complaint_update_date` date NOT NULL,
  PRIMARY KEY (`complaint_id`),
  UNIQUE KEY `tracking_id` (`tracking_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Complaint Information';

--
-- Dumping data for table `complaint_info`
--

INSERT INTO `complaint_info` (`complaint_id`, `tracking_id`, `name`, `email`, `phone`, `description`, `tracking_status`, `admin_remarks`, `complaint_raise_date`, `complaint_update_date`) VALUES
(1, 45, 'ezhil', 'ponezhilan1@gmail.com', '8056508190', 'i have complaints', 0, '', '0000-00-00', '0000-00-00'),
(2, 2147483647, 'Pon Ezhilan', 'ponezhilan1@gmail.com', '8056508190', 'helloooo\r\n', 0, '', '0000-00-00', '0000-00-00'),
(3, 1256651286, 'Pon Ezhilan', 'ponezhilan1@gmail.com', '8056508190', 'drfhbdfb', 0, '', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_status`
--

DROP TABLE IF EXISTS `complaint_status`;
CREATE TABLE IF NOT EXISTS `complaint_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(15) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Status Information';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
