-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2016 at 01:49 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `academicaffair_info`
--

INSERT INTO `academicaffair_info` (`sn`, `firstName`, `middleName`, `lastName`, `email`, `password`) VALUES
(2, 'Jbril', 'Babatope', 'Bello', 'bello.jbril@fuo.edu.ng', 'punch8');

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
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `lecturerId` varchar(20) NOT NULL DEFAULT '',
  `code` varchar(20) DEFAULT NULL,
  `allocatedBy` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `sessionId` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `allocation_info`
--

INSERT INTO `allocation_info` (`sn`, `lecturerId`, `code`, `allocatedBy`, `semester`, `sessionId`) VALUES
(6, '2', 'CPS101', 1, 1, 4),
(7, '1', 'MAT101', 1, 0, 0);

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
  `semester` varchar(10) DEFAULT NULL,
  `levelId` int(11) DEFAULT NULL,
  `departmentId` int(11) NOT NULL,
  `majorId` int(11) NOT NULL,
  `type` varchar(2) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_info`
--

INSERT INTO `course_info` (`code`, `title`, `unit`, `semester`, `levelId`, `departmentId`, `majorId`, `type`) VALUES
('BIO101', 'Introductory Biology', '3', '1', 1, 2, 1, 'C'),
('CHM101', 'Introductory Chemistry', '3', '1', 1, 2, 1, 'C'),
('CPS101', 'Introductory to Computer I', '3', '1', 1, 1, 1, 'C'),
('MAT101', 'Elementary Mathematics I', '3', '1', 1, 1, 1, 'C'),
('MAT102', 'Elementary Mathematics II', '3', '2', 1, 1, 1, 'C'),
('MAT201', 'Mathematical Methods', '3', '1', 2, 1, 1, 'C'),
('MAT202', 'Differential Equations', '3', '2', 2, 1, 1, 'C'),
('PHY101', 'Introductory Physics I', '3', '1', 1, 3, 1, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `collegeId` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`sn`, `name`, `collegeId`) VALUES
(1, 'Department of Mathematics and Computer Sciences', 1),
(2, 'Department of Chemical Sciences', 1),
(3, 'Department of Physics and Earth Sciences', 1);

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
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `rankId` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `collegeId` int(11) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `phoneNumber` varchar(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lecturer_info`
--

INSERT INTO `lecturer_info` (`sn`, `firstName`, `middleName`, `lastName`, `rankId`, `statusId`, `collegeId`, `departmentId`, `phoneNumber`, `email`, `password`, `address`) VALUES
(1, 'Pamilerin', 'Azeez', 'Idowu', 2, 1, 1, 1, '08062425791', 'pamilerin.idowu@fuo.edu.ng', 'punch8', 'Isale Osun'),
(2, 'Olufemi', 'Paul', 'Lasisi', 1, 2, 1, 1, '7037286040', 'femi.lasisi@fuo.edu.ng', 'punch8', '');

-- --------------------------------------------------------

--
-- Table structure for table `lecturerrank`
--

CREATE TABLE IF NOT EXISTS `lecturerrank` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `rank` varchar(20) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `lecturerrank`
--

INSERT INTO `lecturerrank` (`sn`, `rank`) VALUES
(1, 'Professor'),
(2, 'Associate Professor'),
(3, 'Senior Lecturer'),
(4, 'Lecturer I'),
(5, 'Lecturer II'),
(6, 'Assistant Lecturer'),
(7, 'Graduate Assistant');

-- --------------------------------------------------------

--
-- Table structure for table `lecturerstatus`
--

CREATE TABLE IF NOT EXISTS `lecturerstatus` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lecturerstatus`
--

INSERT INTO `lecturerstatus` (`sn`, `status`) VALUES
(1, 'Permanent'),
(2, 'Adjunct');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`sn`, `name`, `departmentId`) VALUES
(1, 'Computer Science', 1),
(3, 'Industrial Chemistry', 2),
(4, 'Mathematics', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modeofentry`
--

CREATE TABLE IF NOT EXISTS `modeofentry` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `modeOfEntry` varchar(10) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `modeofentry`
--

INSERT INTO `modeofentry` (`sn`, `modeOfEntry`) VALUES
(1, 'UTME'),
(2, 'D/E'),
(3, 'D/E 300');

-- --------------------------------------------------------

--
-- Table structure for table `prerequisites`
--

CREATE TABLE IF NOT EXISTS `prerequisites` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `prerequisite` varchar(10) DEFAULT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `prerequisites`
--

INSERT INTO `prerequisites` (`sn`, `code`, `prerequisite`, `active`) VALUES
(1, 'MAT201', 'MAT101', 1),
(5, 'MAT201', 'MAT102', 1),
(6, 'MAT102', 'MAT101', 1),
(8, 'MAT202', 'MAT201', 1);

-- --------------------------------------------------------

--
-- Table structure for table `registerredcourses`
--

CREATE TABLE IF NOT EXISTS `registerredcourses` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `matricNo` varchar(10) NOT NULL,
  `levelId` int(11) NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `sessionId` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `registerredcourses`
--

INSERT INTO `registerredcourses` (`sn`, `code`, `matricNo`, `levelId`, `semester`, `sessionId`) VALUES
(1, 'BIO101', 'NAS/12048', 1, 1, 4),
(2, 'CHM101', 'NAS/12048', 1, 1, 4),
(3, 'PHY101', 'NAS/12048', 1, 1, 4),
(4, 'CPS101', 'NAS/12048', 1, 1, 4),
(5, 'MAT101', 'NAS/12048', 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `registrablecourses`
--

CREATE TABLE IF NOT EXISTS `registrablecourses` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `majorId` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `levelId` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `registrablecourses`
--

INSERT INTO `registrablecourses` (`sn`, `majorId`, `code`, `levelId`) VALUES
(1, 1, 'MAT101', 1),
(2, 1, 'CPS101', 1),
(3, 3, 'MAT101', 1),
(4, 4, 'MAT101', 1),
(5, 1, 'MAT201', 2),
(6, 3, 'MAT201', 2),
(7, 4, 'MAT201', 2),
(8, 1, 'MAT102', 1),
(9, 3, 'MAT102', 1),
(10, 4, 'MAT102', 1),
(11, 1, 'PHY101', 1),
(12, 1, 'BIO101', 1),
(13, 1, 'CHM101', 1);

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
-- Table structure for table `semester`
--

CREATE TABLE IF NOT EXISTS `semester` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `semester` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`sn`, `semester`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(20) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`sn`, `session`) VALUES
(1, '2015/2016'),
(4, '2016/2017');

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE IF NOT EXISTS `student_info` (
  `matricNo` varchar(20) NOT NULL DEFAULT '',
  `firstName` varchar(45) DEFAULT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `sex` varchar(10) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(20) NOT NULL,
  `stateOrigin` varchar(20) DEFAULT NULL,
  `lga` varchar(20) NOT NULL,
  `religion` varchar(20) NOT NULL,
  `address` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `nextOfKin` varchar(100) NOT NULL,
  `nextOfKinAddress` longtext NOT NULL,
  `collegeId` int(11) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `majorId` int(11) DEFAULT NULL,
  `levelId` varchar(20) DEFAULT NULL,
  `modeOfEntryId` varchar(10) DEFAULT NULL,
  `password` varchar(40) NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`matricNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`matricNo`, `firstName`, `middleName`, `lastName`, `sex`, `email`, `phoneNumber`, `dob`, `nationality`, `stateOrigin`, `lga`, `religion`, `address`, `nextOfKin`, `nextOfKinAddress`, `collegeId`, `departmentId`, `majorId`, `levelId`, `modeOfEntryId`, `password`, `img`) VALUES
('NAS/12048', 'Olufemi', 'Paul', 'Lasisi', 'Male', 'lasisi28@gmail.com', '07037286040', '1992-11-26', 'Nigerian', 'Ogun', 'Ijebu North-East', 'Christianity', 'Block 10 Plot 3, Parakin', 'Mrs Monica Lasisi', 'Block 10 Plot 3, Parakin', 1, 1, 1, '1', '2', 'punch8', 'NAS/12048.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
