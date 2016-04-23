-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2016 at 04:43 PM
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
-- Table structure for table `academicaffair_info`
--

CREATE TABLE IF NOT EXISTS `academicaffair_info` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `lecturerId` varchar(20) NOT NULL DEFAULT '',
  `code` varchar(20) DEFAULT NULL,
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `allocatedBy` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `allocation_info`
--

INSERT INTO `allocation_info` (`lecturerId`, `code`, `sn`, `allocatedBy`) VALUES
('1', 'MAT102', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `co_info`
--

CREATE TABLE IF NOT EXISTS `co_info` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(50) NOT NULL,
  `lastNane` varchar(50) NOT NULL,
  `collegeId` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `code` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(45) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `semesterId` varchar(10) DEFAULT NULL,
  `prerequisiteFor` varchar(20) DEFAULT NULL,
  `levelId` int(11) DEFAULT NULL,
  `departmentId` int(11) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_info`
--

INSERT INTO `course_info` (`code`, `title`, `unit`, `semesterId`, `prerequisiteFor`, `levelId`, `departmentId`) VALUES
('CPS101', 'Introductory to Computer I', '3', '1', NULL, 1, 1),
('CPS102', 'Introductory to Computer II', '3', '2', NULL, 1, 1),
('MAT101', 'Elementary Mathematics I', '3', '1', NULL, 1, 1),
('MAT102', 'Elementary Mathematics II', '3', '2', NULL, 1, 1);

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
-- Table structure for table `hod_info`
--

CREATE TABLE IF NOT EXISTS `hod_info` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `lecturerId` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hod_info`
--

INSERT INTO `hod_info` (`sn`, `lecturerId`, `departmentId`) VALUES
(1, 1, 1);

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
  `address` text NOT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer_info`
--

INSERT INTO `lecturer_info` (`sn`, `firstName`, `middleName`, `lastName`, `rank`, `status`, `collegeId`, `departmentId`, `phoneNumber`, `email`, `password`, `address`) VALUES
('1', 'Olufemi', 'Paul', 'Lasisi', 'reader', 'Permanent', 1, 1, '7037286040', 'femi.lasisi@fuo.edu.ng', 'punch8', '');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(10) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`sn`, `level`) VALUES
(1, '100'),
(2, '200'),
(3, '300'),
(4, '400');

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
-- Table structure for table `modeofentry`
--

CREATE TABLE IF NOT EXISTS `modeofentry` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `modeOfEntry` varchar(10) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `result_info`
--

CREATE TABLE IF NOT EXISTS `result_info` (
  `code` varchar(20) NOT NULL DEFAULT '',
  `matricNo` varchar(20) DEFAULT NULL,
  `ca` varchar(20) DEFAULT NULL,
  `exam` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `final` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `grade` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `session` varchar(20) NOT NULL,
  `semester` int(11) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(20) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE IF NOT EXISTS `student_info` (
  `matricNo` varchar(20) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`matricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`matricNo`, `firstName`, `middleName`, `lastName`, `collegeId`, `departmentId`, `majorId`, `level`, `mode_of_entry`, `session`, `dob`, `email`, `address`, `password`) VALUES
('bello', 'be', 'bek', 'vgf', 0, 0, 0, '', '', '', '0000-00-00', 'fttyu', 'ffggghh', ''),
('NAS/12048', 'Olufemi', 'Paul', 'Lasisi', 1, 1, 1, '400', 'D/E', '2015/2016', '1992-11-26', 'lasisi28@gmail.com', 'Block 10 Plot 3, Parakin', 'punch8');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
