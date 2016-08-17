-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2016 at 07:48 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `academicaffair_info`
--

INSERT INTO `academicaffair_info` (`sn`, `firstName`, `middleName`, `lastName`, `email`, `password`) VALUES
(3, 'Iyabo', 'Kehinde', 'Aderemi', 'aderemi.iyabo@fuo.edu.ng', '12345');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sn`, `name`, `username`, `password`) VALUES
(1, 'Femi Lasisi', 'jaguar', 'punch8'),
(2, 'Bello J', 'jamzee', 'jam123');

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
  `position` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `collegeId` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `allocation_info`
--

INSERT INTO `allocation_info` (`sn`, `lecturerId`, `code`, `allocatedBy`, `semester`, `sessionId`, `position`, `departmentId`, `collegeId`) VALUES
(46, '71', 'CPS101', 71, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `co_info`
--

CREATE TABLE IF NOT EXISTS `co_info` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(50) NOT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `collegeId` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `co_info`
--

INSERT INTO `co_info` (`sn`, `firstName`, `middleName`, `lastName`, `collegeId`, `email`, `password`) VALUES
(1, 'Muimin', 'Femi', 'AbdulRauf', 1, 'rauf.muimin@fuo.edu.ng', 'rauf'),
(2, 'Akeeb', 'Olatidoye', 'Olateju', 2, 'olateju.akeeb@fuo.edu.ng', 'olateju');

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
  `semester` int(11) DEFAULT NULL,
  `levelId` int(11) DEFAULT NULL,
  `departmentId` int(11) NOT NULL,
  `type` varchar(2) NOT NULL,
  `collegeId` int(11) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_info`
--

INSERT INTO `course_info` (`code`, `title`, `unit`, `semester`, `levelId`, `departmentId`, `type`, `collegeId`) VALUES
('ACC101', 'Introduction to Financial Accounting I', '3', 1, 1, 6, 'C', 2),
('ACC102', 'Introduction to Financial Accounting II', '3', 1, 2, 6, 'C', 2),
('ACC201', 'Financial Accounting  I', '3', 2, 1, 6, 'C', 2),
('ACC202', 'Financial Accounting  II', '3', 2, 2, 6, 'C', 2),
('ACC203', 'Introduction to Cost and Management Accountin', '3', 2, 1, 6, 'C', 2),
('ACC204', 'Cost Accounting', '3', 2, 2, 6, 'C', 2),
('ACC205', 'Accounting Professional Ethics', '2', 2, 1, 6, 'C', 2),
('ACC206', 'Accounting Theory', '2', 2, 2, 6, 'C', 2),
('ACC210', 'Computer Applications In Accounting`', '3', 2, 2, 6, 'C', 2),
('BCH201', 'Structure & Chem. of Biomolecules', '3', 1, 2, 5, 'C', 1),
('BCH202', 'Introduction to Physical Biochemistry', '2', 2, 2, 5, 'C', 1),
('BCH203', 'Introduction to Cellular Biochemistry', '1', 1, 2, 5, 'C', 1),
('BCH204', 'Lipid Metabolism', '2', 2, 2, 5, 'C', 1),
('BCH205', 'Introduction to Foods & Nutrition ', '2', 1, 2, 5, 'C', 1),
('BCH206', 'Metabolism of Nucleic Acids', '2', 2, 2, 5, 'C', 1),
('BCH208', 'Carbohydrate Metabolism', '2', 2, 2, 5, 'C', 1),
('BCH210', 'Metabolism of Proteins and Amino', '2', 2, 2, 5, 'C', 1),
('BCH301', 'Enzymology', '2', 1, 3, 5, 'C', 1),
('BCH303', 'Lipid Chemistry', '2', 1, 3, 5, 'C', 1),
('BCH305', 'Protein & Amino Acid Chemistry', '2', 1, 3, 5, 'C', 1),
('BCH307', 'Membrane Biochemistry', '1', 1, 3, 5, 'C', 1),
('BCH309', 'Analytical Biochemistry', '2', 1, 3, 5, 'C', 1),
('BCH311', 'Bioenergetics', '1', 1, 3, 5, 'C', 1),
('BCH313', 'Food & Nutritional Biochemistry', '2', 1, 3, 5, 'C', 1),
('BCH315', 'Inorganic Biochemistry', '1', 1, 3, 5, 'C', 1),
('BCH399', 'SIWES', '15', 2, 3, 5, 'C', 1),
('BCH401', 'Advanced Enzymology', '2', 1, 4, 5, 'C', 1),
('BCH402', 'Biosynthesis of Macromolecules', '1', 2, 4, 5, 'C', 1),
('BCH403', 'Tissue Biochemistry', '3', 1, 4, 5, 'C', 1),
('BCH404', 'Biochemical Reasoning', '2', 2, 4, 5, 'C', 1),
('BCH405', 'Biotechnology and Genetic Engineering', '3', 1, 4, 5, 'C', 1),
('BCH406', 'Metabolic Regulations', '3', 2, 4, 5, 'C', 1),
('BCH407 ', 'Nutritional Toxicology', '1', 1, 4, 5, 'C', 1),
('BCH408 ', 'Industrial Biochemistry', '3', 2, 4, 5, 'C', 1),
('BCH409', 'Seminar', '2', 1, 4, 5, 'C', 1),
('BCH410', 'Community Nutrition, Planning & Policy', '6', 2, 4, 5, 'C', 1),
('BCH411', 'Pharmaceutical Biochemistry', '2', 1, 4, 5, 'C', 1),
('BCH412', 'Recent Advances in Human Nutrition', '2', 2, 4, 5, 'E', 1),
('BCH413', 'Advanced Biochemical Methods', '2', 1, 4, 5, 'C', 1),
('BCH414', 'Clinical and Forensic Biochemistry', '2', 2, 4, 5, 'E', 1),
('BCH415', 'Plant Biochemistry', '2', 1, 4, 5, 'C', 1),
('BCH417', 'Clinical Nutrition and Diet Therapy', '2', 2, 4, 5, 'E', 1),
('BCH419', 'International Nutrition ', '2', 2, 4, 5, 'E', 1),
('BCH420', 'Research Project', '2', 2, 4, 5, 'C', 1),
('BFN101', 'Introduction to Money and Banking I', '3', 1, 1, 6, 'C', 2),
('BFN102', 'Introduction to Money and Banking II', '3', 1, 2, 6, 'C', 2),
('BFN201', 'Finance System I', '3', 2, 1, 6, 'C', 2),
('BFN202', 'Financial System II', '3', 2, 2, 6, 'C', 2),
('BFN203', 'Introduction to Finance and Investment', '3', 2, 1, 6, 'C', 2),
('BFN204', 'Business Law', '3', 2, 2, 6, 'C', 2),
('BFN205  ', 'Finance of E-Commerce', '2', 2, 1, 6, 'E', 2),
('BFN206              ', 'Comparative Financial Markets and Institution', '2', 2, 2, 6, 'E', 2),
('BFN207', 'Introduction to Insrance', '3', 2, 1, 6, 'E', 2),
('BFN208 ', 'Islamic Economics  ', '2', 2, 2, 6, 'E', 2),
('BFN210', 'Computer Application to Banking', '3', 2, 2, 6, 'C', 2),
('BFN212', 'Financial Economics', '2', 2, 2, 6, 'C', 2),
('BIO101', 'General Biology I', '1', 1, 1, 5, 'C', 1),
('BIO102', 'General Biology II', '1', 2, 1, 5, 'C', 1),
('BIO103', 'Experimental Biology I', '3', 1, 1, 5, 'C', 1),
('BIO104', 'Experimental Biology II', '3', 2, 1, 5, 'C', 1),
('BUS101', 'Introduction to Business ', '3', 1, 1, 7, 'R', 2),
('BUS102', 'Elements of Management', '3', 1, 2, 7, 'R', 2),
('BUS103', 'Business Organization', '3', 1, 1, 7, 'C', 2),
('BUS201', 'Elements of Marketing ', '3', 2, 1, 7, 'C', 2),
('BUS202', 'Marketing  Management', '2', 2, 2, 7, 'C', 2),
('BUS203', 'Business Communication', '3', 2, 1, 7, 'C', 2),
('BUS204', 'Introduction of Industrial Relations', '3', 2, 2, 7, 'C', 2),
('BUS205', 'Business Management', '3', 2, 1, 7, 'C', 2),
('BUS206', 'Nigerian Business Environment', '3', 2, 2, 7, 'C', 2),
('BUS208', 'Computer Application to Business', '3', 2, 2, 7, 'R', 2),
('CHM101', 'Introductory Chemistry I', '3', 1, 1, 2, 'C', 1),
('CHM102', 'Introductory Chemistry II', '3', 2, 1, 2, 'C', 1),
('CHM103', 'Experimental Introductory Chemistry I', '1', 1, 1, 2, 'C', 1),
('CHM104', 'Experimental Introductory Chemistry II', '1', 2, 1, 2, 'C', 1),
('CHM201', 'Inorganic Chemistry ', '2', 1, 2, 2, 'C', 1),
('CHM202', 'Introductory Analytical Chemistry', '2', 2, 2, 2, 'C', 1),
('CHM203', 'Physical Chemistry ', '2', 1, 2, 2, 'C', 1),
('CHM204', 'Organic Chemistry', '2', 2, 2, 2, 'C', 1),
('CHM205', 'Experimental Inorganic/Physical Chemistry', '1', 1, 2, 2, 'C', 1),
('CHM206', 'Heat Transfer', '2', 2, 2, 2, 'C', 1),
('CHM207', 'Introduction to Environmental Science', '2', 1, 2, 2, 'C', 1),
('CHM208', 'Experimental Organic Chemistry', '1', 2, 2, 2, 'C', 1),
('CHM210', 'Industrial Drawing', '2', 2, 2, 2, 'C', 1),
('CHM301', 'Applied Chemical Thermodynamics and Kinetics', '3', 1, 3, 2, 'C', 1),
('CHM303', 'Instrumental Methods of Analysis', '2', 1, 3, 2, 'C', 1),
('CHM304', 'INDUSTRIAL ATTACHEMENT', '6', 2, 3, 2, 'C', 1),
('CHM305', 'Aromatic and Heterocyclic Chemistry', '3', 1, 3, 2, 'C', 1),
('CHM307', 'Air and soil Chemistry', '3', 1, 3, 2, 'C', 1),
('CHM309', 'Applied Spectroscopy', '2', 1, 3, 2, 'C', 1),
('CHM311', 'Process Science I', '2', 1, 3, 2, 'C', 1),
('CHM313', 'Introductory Material Science', '2', 1, 3, 2, 'C', 1),
('CHM315', 'Glass Blowing Technology', '1', 1, 3, 2, 'C', 1),
('CHM317', 'Experimental Applied Chemistry', '1', 1, 3, 2, 'C', 1),
('CHM319', 'Chemical Literature', '1', 1, 3, 2, 'C', 1),
('CHM401', 'Applied Inorganic Chemistry', '2', 1, 4, 2, 'C', 1),
('CHM402', 'Water Chemistry ', '2', 2, 4, 2, 'C', 1),
('CHM403', 'Process Science II', '2', 1, 4, 2, 'C', 1),
('CHM404', 'Macromolecular Chemistry II', '2', 2, 4, 2, 'C', 1),
('CHM405', 'Surface Chemistry and Electrochemistry', '2', 1, 4, 2, 'C', 1),
('CHM406', 'Quality Control', '2', 2, 4, 2, 'C', 1),
('CHM408', 'Petroleum Chemistry', '2', 2, 4, 2, 'C', 1),
('CHM409', 'Macromolecular Chemistry I', '2', 1, 4, 2, 'C', 1),
('CHM410', 'Nuclear and Radiation Chemistry', '2', 2, 4, 2, 'E', 1),
('CHM411', 'Organic Reaction and Synthesis', '3', 1, 4, 2, 'C', 1),
('CHM412', 'Agrochemical and Fertilizer', '2', 2, 4, 2, 'E', 1),
('CHM413', 'Reaction Kinetics', '2', 1, 4, 2, 'C', 1),
('CHM414', 'Colour and Textile Chemistry', '2', 2, 4, 2, 'E', 1),
('CHM415', 'Industrial Law and Management', '2', 1, 4, 2, 'C', 1),
('CHM416', 'Food and Drug Technology', '2', 2, 4, 2, 'E', 1),
('CHM417', 'Seminar', '1', 1, 4, 2, 'C', 1),
('CHM418', 'Natural Product Chemistry', '2', 2, 4, 2, 'E', 1),
('CHM420', 'Geochemistry', '2', 2, 4, 2, 'E', 1),
('CHM422', 'Environmental Law', '2', 2, 4, 2, 'E', 1),
('CHM424', 'Pollution Control and Waste Management', '2', 2, 4, 2, 'E', 1),
('CHM426', 'Research Project', '6', 2, 4, 2, 'C', 1),
('CPS101', 'Introductory Computer Technology I', '3', 1, 1, 1, 'C', 1),
('CPS102', 'Introductory Computer Technology II', '3', 2, 1, 1, 'C', 1),
('CPS201', 'Computer Programming I', '3', 1, 2, 1, 'C', 1),
('CPS202', 'Computer Programming II', '3', 2, 2, 1, 'C', 1),
('CPS203', 'Data Processing and Web Programming', '2', 1, 2, 1, 'C', 1),
('CPS204', 'Discrete Structures', '2', 2, 2, 1, 'C', 1),
('CPS205', 'Operating System I', '2', 1, 2, 1, 'C', 1),
('CPS206', 'Computer Hardware', '2', 2, 2, 1, 'C', 1),
('CPS208', 'Foundation of Sequential Programming', '2', 2, 2, 1, 'C', 1),
('CPS210', 'Computer Applications', '2', 2, 2, 1, 'R', 2),
('CPS214', 'Informatics', '2', 2, 2, 1, 'R', 1),
('CPS301', 'Structured Programming', '2', 1, 3, 1, 'C', 1),
('CPS303', 'Programming in Visual Basic', '2', 1, 3, 1, 'C', 1),
('CPS305', 'Operating System II', '2', 1, 3, 1, 'C', 1),
('CPS307', 'Data Structures and Algorithm', '3', 1, 3, 1, 'C', 1),
('CPS309', 'Database Management I', '2', 1, 3, 1, 'C', 1),
('CPS311', 'Computer Architecture and Organization', '2', 1, 3, 1, 'C', 1),
('CPS313', 'System Analysis and Design', '3', 1, 3, 1, 'C', 1),
('CPS315', 'Computational Science and Numerical Method', '3', 1, 3, 1, 'E', 1),
('CPS317', 'Statistical Computing', '2', 1, 3, 1, 'E', 1),
('CPS319', 'Operation Research', '2', 1, 3, 1, 'E', 1),
('CPS399', 'Industrial Training', '6', 2, 3, 1, 'C', 1),
('CPS401', 'Organization of Programming languages', '3', 1, 4, 1, 'C', 1),
('CPS402', 'Database Management II', '3', 2, 4, 1, 'C', 1),
('CPS403', 'Software Engineering', '3', 1, 4, 1, 'C', 1),
('CPS404', 'Basic Principles of Network Security', '3', 2, 4, 1, 'C', 1),
('CPS405', 'Artificial Intelligence', '3', 1, 4, 1, 'C', 1),
('CPS406', 'Net-Centric Computing', '3', 2, 4, 1, 'C', 1),
('CPS407', 'Compiler Construction', '3', 1, 4, 1, 'C', 1),
('CPS408', 'Queuing Systems', '3', 2, 4, 1, 'E', 1),
('CPS409', 'Computer Networks and Communication', '3', 1, 4, 1, 'C', 1),
('CPS410', 'Computer System Performance Evaluation', '3', 2, 4, 1, 'E', 1),
('CPS411', 'Special Topics in Computer Science and Softwa', '3', 1, 4, 1, 'C', 1),
('CPS412', 'Project Management', '3', 2, 4, 1, 'E', 1),
('CPS413', 'Human Computer Interface', '2', 1, 4, 1, 'E', 1),
('CPS414', 'Distributed Computing', '3', 2, 4, 1, 'E', 1),
('CPS415', 'Computer Graphics and Visualization', '2', 1, 4, 1, 'E', 1),
('CPS416', 'Formal Model of Computation', '3', 2, 4, 1, 'E', 1),
('CPS417', 'Optimization Technique', '2', 1, 4, 1, 'E', 1),
('CPS418', 'Modeling and Simulation', '3', 2, 4, 1, 'E', 1),
('CPS419', 'Information Technology Law', '2', 1, 4, 1, 'E', 1),
('CPS499', 'Project', '6', 2, 4, 1, 'C', 1),
('ECO101', 'Economic Principles I', '3', 1, 1, 8, 'C', 2),
('ECO102', 'Economic Principles II', '3', 2, 1, 8, 'C', 2),
('ECO201', 'Introduction to Microeconomics I', '2', 1, 2, 8, 'C', 2),
('ECO202', 'Introduction to Microeconomics II', '2', 2, 2, 8, 'C', 2),
('ECO203', 'Introduction to Macroeconomics I', '2', 1, 2, 8, 'C', 2),
('ECO204', 'Introduction to Macroeconomics II', '2', 2, 2, 8, 'C', 2),
('ECO205', 'Mathematics for Economists I', '3', 1, 2, 8, 'C', 2),
('ECO206', 'Mathematics for Economists II', '3', 2, 2, 8, 'C', 2),
('ECO207', 'Introductory Applied Economics I', '3', 1, 2, 8, 'C', 2),
('ECO208', 'Introductory Applied Economics II', '2', 2, 2, 8, 'C', 2),
('ECO209 ', 'History and Structure of Nigeria Economy I', '2', 1, 2, 8, 'C', 2),
('ECO211', 'Labour Economics I', '2', 1, 2, 8, 'E', 2),
('ECO212', 'Labour Economics II', '2', 2, 2, 8, 'E', 2),
('ECO214', 'Urban and Regional Economics', '2', 2, 2, 8, 'E', 2),
('GBT201', 'Introductory Genetics and Cell physiology', '3', 1, 2, 5, 'C', 1),
('GBT202', 'Introductory Genetics', '2', 2, 2, 5, 'C', 1),
('GBT204', 'Biological Techniques', '1', 2, 2, 5, 'C', 1),
('GNS101', 'Use of English', '1', 1, 1, 4, 'C', 1),
('GNS102', 'Use of English II', '2', 2, 1, 4, 'C', 1),
('GNS103', 'Use of Library and Information Technology', '1', 1, 1, 4, 'C', 1),
('GNS104', 'History and Philosophy of Science', '2', 2, 1, 4, 'C', 1),
('GNS105', 'Philosophy and Logic', '2', 1, 1, 4, 'C', 1),
('GNS106', 'Arabic', '1', 2, 1, 4, 'C', 1),
('GNS201', 'Agric and Rural Development', '1', 1, 2, 4, 'C', 1),
('GNS202', 'Foundation in Entrepreneurship Studies', '1', 2, 2, 4, 'C', 1),
('GNS203', 'Islamic Ethics and Culture', '1', 1, 2, 4, 'C', 1),
('GNS204', 'Entrepreneurial Skills Acquisition', '1', 2, 2, 4, 'C', 1),
('GNS206', 'Citizenship, Peace and Conflict Resolution St', '2', 2, 2, 4, 'C', 1),
('MAT101', 'General Mathematics I', '3', 1, 1, 1, 'C', 1),
('MAT102', 'General Mathematics II', '3', 2, 1, 1, 'C', 1),
('MAT104', 'General Mathematics III', '3', 2, 1, 1, 'C', 1),
('MAT201', 'Mathematical Method I', '3', 1, 2, 1, 'C', 1),
('MAT202', 'Differential Equation I', '3', 2, 2, 1, 'C', 1),
('MAT203', 'Abstract Algebra', '3', 1, 2, 1, 'C', 1),
('MAT204', 'Real Analysis II', '3', 2, 2, 1, 'C', 1),
('MAT205', 'Linear Algebra I', '2', 1, 2, 1, 'C', 1),
('MAT206', 'Linear Algebra II', '2', 2, 2, 1, 'C', 1),
('MAT303', 'Vector and Tensor Analysis', '2', 1, 3, 3, 'R', 1),
('MCM101', 'Introduction to Mass Communication ', '2', 1, 1, 9, 'C', 2),
('MCM102', 'History of Nigerian Mass Media ', '2', 1, 2, 9, 'C', 2),
('MCM103', 'African Communication System I', '2', 1, 1, 9, 'C', 2),
('MCM104', 'New Communication Technology', '2', 1, 2, 9, 'C', 2),
('MCM105', 'Introduction to Health Communication', '2', 1, 1, 9, 'C', 2),
('MCM106', 'Writing for the Mass media II ', '2', 1, 2, 9, 'C', 2),
('MCM107', 'Writing for the Mass media I ', '2', 1, 1, 9, 'C', 2),
('MCM108', 'African Communication System II', '2', 1, 2, 9, 'C', 2),
('MCM109', 'Word Processing ', '2', 1, 1, 9, 'C', 2),
('MCM110', 'Speech and Public Speaking', '2', 1, 2, 9, 'C', 2),
('MCM111', 'Professional Media Skills I (Still Camera Han', '2', 1, 1, 9, 'C', 2),
('MCM112', 'Professional Media Skills II (Audio-Visual Ha', '2', 1, 2, 9, 'C', 2),
('MCM201', 'Principles of Public Relations', '2', 2, 1, 9, 'C', 2),
('MCM202', 'Media Attachment', '2', 2, 2, 9, 'C', 2),
('MCM203', 'News Writing and Reporting', '2', 2, 1, 9, 'C', 2),
('MCM204', 'Introduction to Newspaper and Magazine Produc', '3', 2, 2, 9, 'C', 2),
('MCM205', 'Theories of Mass communication ', '2', 2, 1, 9, 'C', 2),
('MCM206', 'Broadcast Presentation', '3', 2, 2, 9, 'C', 2),
('MCM207', 'Photo Journalism', '2', 2, 1, 9, 'C', 2),
('MCM208', 'Principles of Advertising', '2', 2, 2, 9, 'C', 2),
('MCM209', 'Broadcast Analysis and Criticism ', '3', 2, 1, 9, 'C', 2),
('MCM210', 'Specialized Reporting I', '2', 2, 2, 9, 'C', 2),
('MCM212', 'Islamic Communication Concept and Principles', '2', 2, 2, 9, 'C', 2),
('MCM213', 'Introduction to Radio &TV Production', '2', 2, 1, 9, 'C', 2),
('MCM215', 'Professional Media Skills III (Audio Editing)', '2', 2, 1, 9, 'C', 2),
('MCM216', 'Professional Media Skills IV (Audio and Visua', '2', 2, 2, 9, 'C', 2),
('MCM217', 'Drama and Video Production', '2', 2, 1, 9, 'C', 2),
('MIB201', 'General Microbiology', '3', 1, 2, 5, 'C', 1),
('MIB203', 'Basic Techniques in Microbiology', '1', 1, 2, 5, 'C', 1),
('MIC307', 'Immunology', '2', 1, 3, 5, 'C', 1),
('MSS101', 'Mathematics for Social Scientists  I', '3', 1, 1, 8, 'C', 2),
('MSS102', 'Mathematics for Social Scientists II', '3', 2, 1, 8, 'C', 2),
('MSS201', 'Statistical Methods and Applications I', '3', 1, 2, 6, 'C', 2),
('MSS202', 'Statistical Methods and Applications II', '3', 2, 2, 8, 'C', 2),
('PAD 204', 'Introduction to Public Administration', '2', 2, 2, 10, 'C', 2),
('PAD209', 'Introduction to Local Government', '2', 2, 1, 10, 'C', 2),
('PHY 402', 'Statistical Physics', '3', 2, 4, 3, 'C', 1),
('PHY 408', 'Vacuum Physical and Thin Films', '3', 2, 4, 3, 'C', 1),
('PHY 497', 'Seminar', '2', 1, 4, 3, 'C', 1),
('PHY 498', 'Project', '6', 2, 4, 3, 'C', 1),
('PHY101', 'Introductory Physics I', '3', 1, 1, 3, 'C', 1),
('PHY102', 'Introductory Physics II', '3', 2, 1, 3, 'C', 1),
('PHY103', 'Experimental Introductory Physics I', '1', 1, 1, 3, 'C', 1),
('PHY104', 'Experimental Introductory Physics II', '1', 2, 1, 3, 'C', 1),
('PHY201', 'Modern Physics I', '2', 1, 2, 3, 'C', 1),
('PHY202', 'Analytical Mechanics II', '2', 2, 2, 3, 'C', 1),
('PHY203', 'Electrical and Electronics Circuit', '3', 1, 2, 3, 'C', 1),
('PHY204', 'Waves and Optics', '3', 2, 2, 3, 'C', 1),
('PHY205', 'Thermodynamics', '3', 1, 2, 3, 'C', 1),
('PHY206', 'Energy and society', '1', 2, 2, 3, 'C', 1),
('PHY207', 'Analytical Mechanics I', '2', 1, 2, 3, 'C', 1),
('PHY208', 'Experimental Physics II', '1', 2, 2, 3, 'C', 1),
('PHY209', 'Experimental Physics I', '1', 1, 2, 3, 'C', 1),
('PHY210', 'Analogue Electronics Device and Systems I', '2', 2, 2, 3, 'C', 1),
('PHY212', 'Digital Electronics Device and  Systems I', '2', 2, 2, 3, 'C', 1),
('PHY214', 'Modern Physics II', '2', 2, 2, 3, 'C', 1),
('PHY301', 'Quantum Mechanics I', '2', 1, 2, 3, 'C', 1),
('PHY303', 'Electrodynamics ', '2', 1, 3, 3, 'C', 1),
('PHY305', 'Semiconductor Physics and Properties of Mater', '3', 1, 3, 3, 'C', 1),
('PHY307', 'Mathematical Physics I', '2', 1, 3, 3, 'C', 1),
('PHY309', 'Condensed Matter Physics', '3', 1, 3, 3, 'C', 1),
('PHY311', 'Nuclear and Particle Physics I', '3', 1, 3, 3, 'E', 1),
('PHY313', 'Analogue Electronic Device and systems II', '2', 1, 3, 3, 'C', 1),
('PHY315', 'Digital Electronic Device and systems II', '2', 1, 3, 3, 'C', 1),
('PHY317', 'Workshop Practice and Electronics Software Ap', '1', 1, 3, 3, 'C', 1),
('PHY319', 'Experimental Physics III', '1', 1, 3, 3, 'C', 1),
('PHY368', 'Industrial Attachment', '', 2, 3, 3, 'C', 1),
('PHY401', 'Quantum Mechanics II', '2', 1, 4, 3, 'C', 1),
('PHY403', 'Electronic Circuit Theory', '3', 1, 4, 3, 'C', 1),
('PHY404', 'Semiconductor Technology and Design and Fabri', '3', 2, 4, 3, 'C', 1),
('PHY405', 'Nuclear and Particle  Physics II', '3', 1, 4, 3, 'E', 1),
('PHY406', 'Atomic and Molecular Spectroscopy', '3', 2, 4, 3, 'C', 1),
('PHY407', 'Electronic Communication Theory ', '3', 1, 4, 3, 'C', 1),
('PHY409', 'Computational Physics', '3', 1, 4, 3, 'C', 1),
('PHY410', 'Atmospheric Physics', '3', 2, 4, 3, 'E', 1),
('PHY411', 'Mathematical Physics II', '2', 1, 4, 3, 'C', 1),
('PHY413', 'Electrical Measurement and Instrumentation', '3', 1, 4, 3, 'C', 1),
('POL 206', 'Comparative Politics', '2', 2, 2, 10, 'C', 2),
('POL101', 'Introduction to Political Science', '3', 1, 1, 10, 'C', 2),
('POL102', 'Constitutional Development in Nigeria', '3', 1, 2, 10, 'C', 2),
('POL104', 'Organization of Government, State and Citizen', '3', 1, 2, 10, 'C', 2),
('POL105', 'Nigerian Legal System', '3', 1, 1, 10, 'C', 2),
('POL201', 'Introduction to Political Analysis', '3', 2, 1, 10, 'C', 2),
('POL202', 'Nigerian Government and Politics', '3', 2, 2, 10, 'C', 2),
('POL203', 'History of Political Thought', '3', 2, 1, 10, 'C', 2),
('POL204', 'Political Ideas', '2', 2, 2, 10, 'C', 2),
('POL205', 'Foundations of Political Economy', '2', 2, 1, 10, 'C', 2),
('POL207', 'Introduction to International Relations', '2', 2, 1, 10, 'C', 2),
('PSY201 ', 'General Psychology', '3', 1, 2, 10, 'C', 2),
('PSY202', 'General Psychology II', '2', 2, 2, 10, 'E', 2),
('SCO102', 'Introduction To Sociology II', '3', 1, 2, 11, 'C', 2),
('SCO103', 'Introduction to Anthropology', '3', 1, 1, 11, 'C', 2),
('SCO104', 'Introduction to African Societies and Culture', '3', 1, 2, 11, 'C', 2),
('SCO105', 'Introduction to Basic Social Institutions', '3', 1, 1, 11, 'C', 2),
('SCO207', 'Introduction to Modern Social Problems', '3', 2, 1, 11, 'C', 2),
('SOC101', 'Introduction to Sociology I', '3', 1, 1, 11, 'C', 2),
('SOC201', 'Elementary Analysis of Social System', '3', 2, 1, 11, 'C', 2),
('SOC202', 'Introduction to Descriptive Statistics', '3', 2, 2, 11, 'C', 2),
('SOC203', 'Impact of Colonialism', '3', 2, 1, 11, 'R', 2),
('SOC204', 'Theories and Principle of Social-Cultural Cha', '3', 2, 2, 11, 'C', 2),
('SOC205', 'Introduction to Medical Sociology', '3', 2, 1, 11, 'C', 2),
('SOC206', 'Concept in Social Anthropology', '3', 2, 2, 11, 'R', 2),
('SOC208              ', 'Sociology of Education      ', '2', 2, 2, 11, 'E', 2),
('SOC209              ', 'Language in Society and Culture         ', '2', 2, 1, 11, 'E', 2),
('SOC210              ', 'Sociology of Family               ', '2', 2, 2, 11, 'E', 2),
('SOC211 ', 'Sociology of Knowledge and Technology ', '2', 2, 1, 11, 'E', 2),
('SOC212             ', 'People and Culture of Nigeria  ', '2', 2, 2, 11, 'E', 2),
('SOC213  ', 'Introductions to Population Studies', '2', 2, 1, 11, 'E', 2),
('STA101', 'Introductory Statistics', '3', 1, 1, 1, 'C', 1),
('STA201', 'Statistical Methods', '3', 1, 2, 1, 'C', 1),
('STA210', 'Probability II', '3', 2, 2, 1, 'C', 1),
('STAT201', 'Biometry', '2', 1, 2, 5, 'C', 1),
('ZAS201', 'Invertebrates', '3', 1, 2, 5, 'C', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`sn`, `name`, `collegeId`) VALUES
(1, 'Department of Mathematics and Computer Sciences', 1),
(2, 'Department of Chemical Sciences', 1),
(3, 'Department of Physics and Earth Sciences', 1),
(4, 'Department of GNS Unit', 2),
(5, 'Department of Biological Sciences', 1),
(6, 'Department of Accounting and Finance', 2),
(7, 'Department of Business Administration', 2),
(8, 'Department of Economics and Financial Studies', 2),
(9, 'Department of Mass Communication', 2),
(10, 'Department of Political Science and Public Administration', 2),
(11, 'Department of Sociology and International Relation', 2);

-- --------------------------------------------------------

--
-- Table structure for table `editlogs`
--

CREATE TABLE IF NOT EXISTS `editlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resultId` int(11) NOT NULL,
  `type` text NOT NULL,
  `prevScore` text NOT NULL,
  `newScore` text NOT NULL,
  `dateEdited` datetime NOT NULL,
  `editedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `editlogs`
--

INSERT INTO `editlogs` (`id`, `resultId`, `type`, `prevScore`, `newScore`, `dateEdited`, `editedBy`) VALUES
(1, 2, 'CA', '23', '29', '2016-08-17 06:33:23', 71),
(2, 2, 'CA', '29', '23', '2016-08-17 07:19:11', 71),
(3, 2, 'CA', '23', '29', '2016-08-17 07:21:56', 71),
(4, 2, 'Exam', '45', '29', '2016-08-17 07:22:05', 71),
(5, 2, 'Exam', '29', '40', '2016-08-17 07:22:23', 71);

-- --------------------------------------------------------

--
-- Table structure for table `editrequests`
--

CREATE TABLE IF NOT EXISTS `editrequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lecturerId` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `handledBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `editrequests`
--

INSERT INTO `editrequests` (`id`, `lecturerId`, `status`, `date`, `handledBy`) VALUES
(1, 17, 3, '2016-08-16 13:05:12', 3),
(2, 19, 1, '2016-08-16 13:48:32', 3),
(3, 71, 3, '2016-08-16 13:57:41', 3),
(4, 71, 1, '2016-08-16 14:05:14', 3);

-- --------------------------------------------------------

--
-- Table structure for table `examofficer_info`
--

CREATE TABLE IF NOT EXISTS `examofficer_info` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `lecturerId` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `examofficer_info`
--

INSERT INTO `examofficer_info` (`sn`, `lecturerId`, `departmentId`) VALUES
(1, 5, 1),
(2, 42, 10);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hod_info`
--

INSERT INTO `hod_info` (`sn`, `lecturerId`, `departmentId`) VALUES
(5, 20, 6),
(6, 41, 10),
(7, 71, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE IF NOT EXISTS `hostel` (
  `name` varchar(30) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`name`, `sex`, `sn`) VALUES
('Henry Alex Duduyemi Adegunwa', 'Male', 1),
('Block C', 'Male', 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80 ;

--
-- Dumping data for table `lecturer_info`
--

INSERT INTO `lecturer_info` (`sn`, `firstName`, `middleName`, `lastName`, `rankId`, `statusId`, `collegeId`, `departmentId`, `phoneNumber`, `email`, `password`, `address`) VALUES
(17, 'Sirajudeen', 'Femi', 'Bakrin', 5, 1, 2, 4, '', 'bakrin.sirajudeen@fuo.edu.ng', 'Bakrin', ''),
(18, 'Mujidat', 'Adeola', 'Bello', 5, 1, 2, 4, '', 'bello.mujidat@fuo.edu.ng', 'Bello', ''),
(19, 'Mustapha', '', 'Bojuwon', 4, 1, 2, 6, '', 'bojuwon.mustapha@fuo.edu.ng', 'Bojuwon', ''),
(20, 'Fatimoh', '', 'Mohammed', 5, 1, 2, 6, '', 'mohammed.fatimoh@fuo.edu.ng', 'Mohammed', ''),
(21, 'Akanni', 'AbdulGaniyy', 'Agbaje', 5, 1, 2, 6, '', 'agbaje.abdulganiyy@fuo.edu.ng', 'Agbaje', ''),
(22, 'Aderibigbe', 'Idowu', 'Sadiq', 5, 1, 2, 6, '', 'sadiq aderibigbe idowu', 'Sadiq', ''),
(23, 'Sadiq', 'Ademola', 'Raji', 6, 1, 2, 6, '', 'raji.sadiq@fuo.edu.ng', 'Raji', ''),
(24, 'Mobolaji', 'Kafayat', 'Abidoye', 7, 1, 2, 6, '', 'mobolaji.kafayat@fuo.edu.ng', 'Abidoye', ''),
(25, 'Sulaimon', 'Olanrewaju', 'Adebiyi', 4, 1, 2, 7, '', 'adebiyi.sulaimon@fuo.edu.ng', 'Adebiyi', ''),
(26, 'Isaac', 'Olugbenga', 'Fadeyibi', 4, 1, 2, 7, '', 'fadeyibi.isaac@fuo.edu.ng', 'Fadeyibi', ''),
(27, 'Micheal', 'Oyewale', 'Babatunde', 5, 1, 2, 7, '', 'babatunde.micheal@fuo.edu.ng', 'Babatunde', ''),
(28, 'Akeem', 'Adewale', 'Bakare', 6, 1, 2, 7, '', 'bakare.akeem@fuo.edu.ng', 'Bakare', ''),
(29, 'Omoshalewa', 'Maryam', 'Fetuga', 7, 1, 2, 7, '', 'fetuga.maryam@fuo.edu.ng', 'Fetuga', ''),
(30, 'Kareem', 'Abidemi', 'Arikewuyo', 5, 1, 2, 6, '', 'arikewuyo.kareem@fuo.edu.ng', 'Arikewuyo', ''),
(31, 'Taiwo', 'Adewale', 'Muritala', 5, 1, 2, 6, '', 'muritala.taiwo@fuo.edu.ng', 'Muritala', ''),
(32, 'Lateef', 'Abimbola', 'Adebayo', 5, 1, 2, 6, '', 'adebayo.lateef@fuo.edu.ng', 'Adebayo', ''),
(33, 'Abdullateef', '', 'Usman', 1, 1, 2, 8, '', 'usman.abdullateef@fuo.edu.ng', 'Usman', ''),
(34, 'Tajudeen', '', 'Egbetunde', 3, 1, 2, 8, '', 'egbetunde.tajudeen@fuo.edu.ng', 'Egbetunde', ''),
(35, 'Ismail', 'Oladimeji', 'Soile', 4, 1, 2, 8, '', 'soile.ismail@fuo.edu.ng', 'Soile', ''),
(36, 'Ibrahim', 'Saliu', 'Alley', 4, 1, 2, 8, '', 'alley.ibrahim@fuo.edu.ng', 'Alley', ''),
(37, 'Taofeek', 'Olusola', 'Ayinde', 6, 1, 2, 8, '', 'ayinde.taofeek@fuo.edu.ng', 'Ayinde', ''),
(38, 'Busrat', 'Abidemi', 'Agbaje', 6, 1, 2, 8, '', 'agbaje.busrat@fuo.edu.ng', 'Agbaje', ''),
(39, 'Fatimah', 'Adenike', 'Bamidele', 7, 1, 2, 8, '', 'bamidele.fatimah@fuo.edu.ng', 'Bamidele', ''),
(40, 'Abidemi', 'Oyegoke', 'Lalude', 1, 1, 2, 10, '', 'allude.abidemi@fuo.edu.ng', 'Lalude', ''),
(41, 'Mojeed', 'Ayobami', 'Animashaun', 4, 1, 2, 10, '', 'animashaun.mojeed@fuo.edu.ng ', 'Animashaun', ''),
(42, 'Rasheed', 'Obaseroke', 'Garuba', 6, 1, 2, 10, '', 'garuba.rasheed@fuo.edu.ng', 'Garuba', ''),
(43, 'Amidu', 'Tadese', 'Raheem', 5, 1, 2, 10, '', 'raheem.amidu@fuo.edu.ng ', 'Raheem', ''),
(44, 'Fatai', 'Adesina', 'Raji', 5, 1, 2, 10, '', 'raji.fatai@fuo.edu.ng ', 'Raji', ''),
(45, 'Olusegun', 'Fariudeen', 'Liadi', 4, 1, 2, 11, '', 'liadi.fariudeen@fuo.edu.ng', 'Liadi', ''),
(46, 'Bamidele', '', 'Rasaki', 5, 1, 2, 11, '', 'rasaki.bamidele@fuo.edu.ng', 'Rasaki', ''),
(47, 'Rasaq', 'Omokeji', 'Ganiyu', 5, 1, 2, 11, '', 'ganiyu.rasaq@fuo.edu.ng ', 'Ganiyu', ''),
(48, 'Tajudeen', 'Yusuf', 'Adeyinka', 6, 1, 2, 11, '', 'adeyinka.tajudeen@fuo.edu.ng', 'Adeyinka', ''),
(49, 'Ridwan', 'Abdur-Raheem', 'Adeyemi', 3, 1, 2, 9, '', 'adeyemi.ridwan@fuo.edu.ng ', 'Adeyemi', ''),
(50, 'Fadhilat', 'A.', 'Adebisi', 5, 1, 2, 9, '', 'adebisi.fadhilat@fuo.edu.ng  ', 'Adebisi', ''),
(51, 'Rasheed', 'Ademola', 'Adebiyi', 6, 1, 2, 9, '', 'adebiyi.rasheed@fuo.edu.ng ', 'Adebiyi', ''),
(52, 'Kamoru', 'Aremu', 'Salaudeen', 6, 1, 2, 9, '', 'salaudeen.kamoru@fuo.edu.ng ', 'Salaudeen', ''),
(53, 'Azeez', 'Olusegun', 'Sanni', 6, 1, 2, 9, '', 'sanni.azeez@fuo.edu.ng ', 'Sanni', ''),
(54, 'AbdulHafeez', 'A.', 'Adedimeji', 5, 1, 2, 4, '', 'adedimeji.abdulhafeez@fuo.edu.ng ', 'Adedimeji', ''),
(55, 'Nafisah', 'Bola', 'Raji', 5, 1, 2, 4, '', 'raji.nafisah@fuo.edu.ng ', 'Raji', ''),
(56, 'Ayanniyi', 'Isiaka', 'Orokola', 6, 1, 2, 4, '', 'orokola.isiaka@fuo.edu.ng', 'Orokola', ''),
(57, 'Omolaran', 'Bashir', 'Bello', 2, 1, 1, 5, '', 'bello.bashir@fuo.edu.ng', 'Bello', ''),
(58, 'Muse', '', 'Oke', 3, 1, 1, 5, '', 'oke.muse@fuo.edu.ng', 'Oke', ''),
(59, 'Simiat', 'Olanike', 'Jimoh', 4, 1, 1, 5, '', 'jimoh.simiat@fuo.edu.ng ', 'Jimoh', ''),
(60, 'Tajudeen', 'Oladunni', 'Ganiyu', 5, 1, 1, 5, '', 'ganiyu.tajudeen@fuo.edu.ng ', 'Ganiyu', ''),
(61, 'Aminat', 'Oluwadamilola', 'Fajingbesi', 7, 1, 1, 5, '', 'fajingbesi.aminat@fuo.edu.ng ', 'Fajingbesi', ''),
(62, 'Tosin', 'Yetunde', 'Senbadejo', 7, 1, 1, 5, '', 'senbadejo.tosin@fuo.edu.ng ', 'Senbadejo', ''),
(63, 'Nusrah', 'Bolatito', 'Afolabi-Balogun', 3, 1, 1, 2, '', 'afolabi-balogun.nusrah@fuo.edu.ng ', 'Afolabi-Balogun', ''),
(64, 'Amadu', 'Kayode', 'Salau', 4, 1, 1, 2, '', 'salau.amadu@fuo.edu.ng ', 'Salau', ''),
(65, 'Simiat', 'Modupe', 'Ogunbode', 4, 1, 1, 2, '', 'ogunbode.simiat@fuo.edu.ng ', 'Ogunbode', ''),
(66, 'Kazeem', 'Adelani', 'Alabi', 5, 1, 1, 2, '', 'alibi.kazeem@fuo.edu.ng ', 'Alabi', ''),
(67, 'Suaib', 'Olasupo', 'Osineye', 6, 1, 1, 2, '', 'osineye.suaib@fuo.edu.ng ', 'Osineye', ''),
(68, 'Tunbosun', 'AbdulAzeez', 'Lawal', 1, 1, 1, 2, '', 'lawal.abdulazeez@fuo.edu.ng', 'Lawal', ''),
(69, 'Mariam', 'Dasola', 'Adeoye', 3, 1, 1, 2, '', 'adeoye.mariam@fuo.edu.ng ', 'Adeoye', ''),
(70, 'Ibrahim', 'Olasegun', 'Abdusalami', 5, 1, 1, 2, '', 'abdusalami.ibrahim@fuo.edu.ng ', 'Abdusalami', ''),
(71, 'AbdulJeleel', 'Kehinde', 'Shittu', 2, 1, 1, 1, '', 'shittu.abduljeleel@fuo.edu.ng ', 'Shittu', ''),
(72, 'Raheem', 'Ajetola', 'Azeez', 4, 1, 1, 1, '', 'azeez.raheem@fuo.edu.ng ', 'Azeez', ''),
(73, 'Mutiat', 'Adebukola', 'Ogunrinde', 5, 1, 1, 1, '', 'ogunrinde.mutiat@fuo.edu.ng ', 'Ogunrinde', ''),
(74, 'Baseerat', 'Adebola', 'Abdulsalami', 6, 1, 1, 1, '', 'abdulsalami.baseerat @fuo.edu.ng', 'Abdulsalami', ''),
(75, 'Abiodun', 'Adebayo', 'Owolabi', 4, 1, 1, 1, '', 'owolabi.abiodun@fuo.edu.ng ', 'Owolabi', ''),
(76, 'Mohammed', '', 'Lawal', 5, 1, 1, 1, '', 'lawal.mohammed@fuo.edu.ng', 'Lawal', ''),
(77, 'Hakeem', 'Sanya', 'Bolarinwa', 4, 1, 1, 3, '', 'bolarinwa.hakeem@fuo.edu.ng ', 'Bolarinwa', ''),
(78, 'Abdulhamid', '', 'Yusuf', 5, 1, 1, 3, '', 'yusuf.abdulhamid@fuo.edu.ng', 'Yusuf', ''),
(79, 'Fawwaz', 'Eniola', 'Fajingbesi', 7, 1, 1, 3, '', 'fajingbesi.fawwaz@fuo.edu.ng ', 'Fajingbesi', '');

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
-- Table structure for table `leveladviser`
--

CREATE TABLE IF NOT EXISTS `leveladviser` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `lecturerId` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `levelId` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`sn`, `name`, `departmentId`) VALUES
(1, 'Computer Science', 1),
(3, 'Industrial and Environmental Chemistry', 2),
(4, 'Mathematics', 1),
(5, 'Physics with Electronics', 3),
(6, 'Biochemistry and Nutrition', 2),
(7, 'Microbiology', 5),
(8, 'Accounting', 6),
(9, 'Banking and Finance', 6),
(10, 'Economics', 8),
(11, 'Business Administration', 7),
(12, 'Mass Communication', 9),
(13, 'Political Science and Public Administration', 10),
(14, 'Sociology and Industrial Relation', 11);

-- --------------------------------------------------------

--
-- Table structure for table `modeofentry`
--

CREATE TABLE IF NOT EXISTS `modeofentry` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `modeOfEntry` varchar(10) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `modeofentry`
--

INSERT INTO `modeofentry` (`sn`, `modeOfEntry`) VALUES
(1, 'UTME'),
(2, 'D/E'),
(3, 'D/E 300'),
(4, 'IUT');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `prerequisites`
--

INSERT INTO `prerequisites` (`sn`, `code`, `prerequisite`, `active`) VALUES
(1, 'MAT201', 'MAT101', 1),
(5, 'MAT201', 'MAT102', 1),
(6, 'MAT102', 'MAT101', 0),
(8, 'MAT202', 'MAT201', 1),
(10, 'CHM101', 'CHM104', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `registerredcourses`
--

INSERT INTO `registerredcourses` (`sn`, `code`, `matricNo`, `levelId`, `semester`, `sessionId`) VALUES
(1, 'CHM101', 'NAS/15105', 1, 1, 1),
(2, 'CPS101', 'NAS/15105', 1, 1, 1),
(3, 'PHY103', 'NAS/15105', 1, 1, 1),
(4, 'GNS103', 'NAS/15105', 1, 1, 1),
(5, 'MAT101', 'NAS/15105', 1, 1, 1),
(6, 'CHM103', 'NAS/15105', 1, 1, 1),
(7, 'GNS101', 'NAS/15105', 1, 1, 1),
(8, 'PHY101', 'NAS/15105', 1, 1, 1),
(9, 'STA101', 'NAS/15105', 1, 1, 1),
(10, 'GNS105', 'NAS/15105', 1, 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

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
(13, 1, 'CHM101', 1),
(17, 1, 'GNS102', 1),
(18, 1, 'CHM104', 1),
(19, 1, 'CHM103', 1),
(20, 1, 'CHM102', 1),
(21, 1, 'CPS102', 1),
(22, 1, 'CPS201', 2),
(23, 1, 'CPS202', 2),
(24, 1, 'CPS203', 2),
(25, 1, 'CPS205', 2),
(26, 1, 'CPS208', 2),
(27, 1, 'CPS212', 2),
(28, 1, 'CPS218', 2),
(30, 1, 'GNS103', 1),
(31, 1, 'GNS104', 1),
(32, 1, 'GNS105', 1),
(33, 1, 'GNS106', 1),
(34, 1, 'GNS201', 2),
(35, 1, 'GNS202', 2),
(36, 1, 'GNS203', 2),
(37, 1, 'MAT104', 1),
(38, 1, 'MAT202', 2),
(39, 1, 'MAT204', 2),
(40, 1, 'MAT205', 2),
(41, 1, 'MAT206', 2),
(42, 1, 'PHY102', 1),
(43, 1, 'PHY103', 1),
(44, 1, 'PHY104', 1),
(45, 1, 'PHY201', 2),
(46, 1, 'STA101', 1),
(48, 1, 'STA210', 2),
(49, 1, 'GNS101', 1),
(50, 3, 'CPS101', 1),
(52, 1, 'PHY203', 2),
(53, 8, 'ACC101', 1);

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
  `sessionId` int(11) DEFAULT NULL,
  `semester` int(11) NOT NULL,
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `rel` int(11) DEFAULT NULL,
  `gp` int(11) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `result_info`
--

INSERT INTO `result_info` (`code`, `matricNo`, `ca`, `exam`, `final`, `grade`, `sessionId`, `semester`, `sn`, `rel`, `gp`, `statusId`) VALUES
('CPS101', 'NAS/15105', '29', '40', '69', 'B', 1, 1, 2, 0, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `resultgpa`
--

CREATE TABLE IF NOT EXISTS `resultgpa` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `gpa` varchar(5) NOT NULL,
  `cgpa` varchar(5) DEFAULT NULL,
  `matricNo` varchar(10) DEFAULT NULL,
  `rel` int(11) DEFAULT NULL,
  `tcp` varchar(3) NOT NULL,
  `tnu` varchar(3) NOT NULL,
  `ctcp` varchar(6) NOT NULL,
  `ctnu` varchar(6) NOT NULL,
  `prev_cgpa` varchar(6) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  `prev_ctcp` varchar(6) NOT NULL,
  `prev_ctnu` varchar(6) NOT NULL,
  `prev_tce` varchar(6) NOT NULL,
  `tce` varchar(6) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `name` varchar(20) NOT NULL,
  `hostelId` int(11) NOT NULL,
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`name`, `hostelId`, `sn`) VALUES
('101', 1, 1),
('102', 1, 3),
('103', 1, 4),
('1', 2, 5),
('2', 2, 6),
('3', 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `roomallocation`
--

CREATE TABLE IF NOT EXISTS `roomallocation` (
  `matricNo` varchar(20) NOT NULL,
  `roomId` int(11) NOT NULL,
  `sessionId` int(11) NOT NULL,
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `roomallocation`
--

INSERT INTO `roomallocation` (`matricNo`, `roomId`, `sessionId`, `sn`) VALUES
('NAS/15105', 5, 1, 2),
('NAS/12048', 1, 1, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`sn`, `session`) VALUES
(1, '2014/2015');

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE IF NOT EXISTS `student_info` (
  `matricNo` varchar(20) NOT NULL DEFAULT '',
  `firstName` varchar(45) DEFAULT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `dateBirth` date DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `stateOrigin` varchar(20) DEFAULT NULL,
  `lga` varchar(20) DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `nextOfKin` varchar(100) DEFAULT NULL,
  `nextOfKinAddress` longtext,
  `collegeId` int(11) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `majorId` int(11) DEFAULT NULL,
  `levelId` varchar(20) DEFAULT NULL,
  `modeOfEntryId` varchar(10) DEFAULT NULL,
  `password` varchar(40) NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  `levelAdviserId` int(11) DEFAULT NULL,
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `town` varchar(30) DEFAULT NULL,
  `genotype` varchar(10) DEFAULT NULL,
  `bloodGroup` varchar(10) DEFAULT NULL,
  `oLevel` varchar(30) DEFAULT NULL,
  `parentNo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`matricNo`, `firstName`, `middleName`, `lastName`, `sex`, `email`, `phoneNumber`, `dateBirth`, `nationality`, `stateOrigin`, `lga`, `religion`, `address`, `nextOfKin`, `nextOfKinAddress`, `collegeId`, `departmentId`, `majorId`, `levelId`, `modeOfEntryId`, `password`, `img`, `levelAdviserId`, `sn`, `status`, `town`, `genotype`, `bloodGroup`, `oLevel`, `parentNo`) VALUES
('NAS/15105', 'Abduljaleel', 'Kehinde', 'Abdulsalami', 'Male', 'aderemi.iyabo@fuo.edu.ng', '8062425791', '1987-08-20', 'Nigerian', 'Osun', 'Ibadan North East', 'Islam', 'Fountain University Osogbo, Osun State,', 'Mr. Saheed', 'Fountain University Osogbo, Osun State,', 1, 1, 1, '1', '1', '12344', NULL, NULL, 33, 0, 'Osogbo', 'AA', 'O+', 'WAEC/GCE', '09087654321'),
('NAS/12048', 'Olufemi', 'Paul', 'Lasisi', 'Male', 'lasisi28@gmail.com', '07037286040', '1992-11-26', 'Nigerian', 'Osun', 'Ijebu', 'Christianity', 'Fountain', 'Mrs Monica', 'Fountain', 1, 1, 1, '1', '1', 'punch8', NULL, NULL, 36, 0, 'Ile-Ife', 'AA', 'O-', 'WAEC/NECO', '08062425791'),
('NAS/14016', 'Jamilu', 'ola', 'Shittu', 'Male', 'aderemi.iyabo@fuo.edu.ng', '7037286040', '1987-03-11', 'Nigerian', 'Osun', 'Gusau', 'Islam', 'Fountain University Osogbo, Osun State,', 'Mrs Monica Lasisi', 'Fountain University Osogbo, Osun State,', 1, 2, 6, '1', '1', 'punch8', NULL, NULL, 37, 0, 'Osogbo', 'AS', 'B+', 'WAEC', '09087654321'),
('MAS/14057', 'Baseerat', 'Kehinde', 'Bakrin', 'Female', 'adamibnlukman@gmail.com', '7037286040', '1999-07-01', 'Nigerian', 'Osun', 'Gusau', 'Islam', 'Fountain University Osogbo, Osun State,', 'Mr. Saheed', 'Fountain University Osogbo, Osun State,', 2, 6, 8, '1', '4', '1999-07-01', NULL, NULL, 60, 0, 'Osogbo', 'SS', 'A-', 'NECO', '09087654321'),
('NAS/14031', '', '', '', '', '', '', '1999-01-24', '', '', '', '', '', '', '', 1, 1, 1, '1', '1', '1/24/1999', NULL, NULL, 78, 0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `studentaffair`
--

CREATE TABLE IF NOT EXISTS `studentaffair` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT NULL,
  `middleName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `studentaffair`
--

INSERT INTO `studentaffair` (`sn`, `firstName`, `middleName`, `lastName`, `email`, `password`, `sex`, `position`) VALUES
(1, 'Abduljaleel', 'Kehinde', 'Aderemi', 'bellfulani26@gmail.com', '1234', 'Male', 0),
(3, 'Femi', 'Paul', 'Lasisi', 'femi@fuo.edu.ng', 'punch8', 'Male', 1),
(5, 'Tayo', 'Tolu', 'Oribogunje', 'tayo@fuo.edu.ng', 'punch8', 'Male', 2);

-- --------------------------------------------------------

--
-- Table structure for table `wavedcourses`
--

CREATE TABLE IF NOT EXISTS `wavedcourses` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `wavedBy` int(11) NOT NULL,
  `matricNo` varchar(20) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `unique_sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
