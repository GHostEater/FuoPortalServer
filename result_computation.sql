-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2016 at 04:18 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `result_computation`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sn`, `name`, `username`, `password`) VALUES
(1, 'Femi Lasisi', 'jaguar', 'punch8');

-- --------------------------------------------------------

--
-- Table structure for table `allocation_info`
--

CREATE TABLE IF NOT EXISTS `allocation_info` (
  `lecturer_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `course_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `course_title` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `course_unit` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `level` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`lecturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE IF NOT EXISTS `college` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `acronym` text NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`sn`, `name`, `acronym`) VALUES
(1, 'College of Natural and Applied Sciences', 'CONAS'),
(2, 'College of Management and Social Sicences', 'COMAS');

-- --------------------------------------------------------

--
-- Table structure for table `course_info`
--

CREATE TABLE IF NOT EXISTS `course_info` (
  `course_code` varchar(20) CHARACTER SET utf8 NOT NULL,
  `course_title` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `course_unit` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `course_semester` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `prerequisiteFor` varchar(20) NOT NULL,
  PRIMARY KEY (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `collegeId` int(11) NOT NULL,
  `acronym` varchar(20) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`sn`, `name`, `collegeId`, `acronym`) VALUES
(1, 'Department of Mathematics and Computer Sciences', 1, 'CPS');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_info`
--

CREATE TABLE IF NOT EXISTS `lecturer_info` (
  `sn` varchar(20) NOT NULL DEFAULT '',
  `firstName` varchar(45) DEFAULT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `rank` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `collegeId` int(11) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `phoneNumber` varchar(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer_info`
--

INSERT INTO `lecturer_info` (`sn`, `firstName`, `middleName`, `lastName`, `rank`, `status`, `collegeId`, `departmentId`, `phoneNumber`, `email`, `password`) VALUES
('1', 'Olufemi', 'Paul', 'Lasisi', 'reader', 'Permanent', 1, 1, '7037286040', 'femi.lasisi@fuo.edu.ng', 'punch8');

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE IF NOT EXISTS `major` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `departmentId` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`sn`, `name`, `departmentId`) VALUES
(1, 'Computer Science', 1);

-- --------------------------------------------------------

--
-- Table structure for table `result_info`
--

CREATE TABLE IF NOT EXISTS `result_info` (
  `course_code` varchar(20) CHARACTER SET utf8 NOT NULL,
  `matric_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ca` varchar(20) DEFAULT NULL,
  `exam` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `final` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `grade` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE IF NOT EXISTS `student_info` (
  `matric_no` varchar(20) CHARACTER SET utf8 NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `collegeId` int(11) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `majorId` int(11) DEFAULT NULL,
  `level` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `mode_of_entry` varchar(10) DEFAULT NULL,
  `session` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`matric_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (matricNo, `firstName`, `middleName`, `lastName`, `collegeId`, `departmentId`, `majorId`, `level`, `mode_of_entry`, `session`, `dob`, `email`, `address`, `password`) VALUES
('NAS/12048', 'Olufemi', 'Paul', 'Lasisi', 1, 1, 1, '400', 'D/E', '2015/2016', '1992-11-26', 'lasisi28@gmail.com', 'Block 10 Plot 3, Parakin', 'punch8');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
