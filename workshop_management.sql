-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2021 at 06:05 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `workshop_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `username`, `password`) VALUES
(1, 'admin', 'asdfgh');

-- --------------------------------------------------------

--
-- Table structure for table `deadstock`
--

CREATE TABLE `deadstock` (
  `deadId` int(11) NOT NULL,
  `itemCode` varchar(12) NOT NULL,
  `description` varchar(80) NOT NULL,
  `endDate` datetime NOT NULL,
  `deadReason` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deadstock`
--

INSERT INTO `deadstock` (`deadId`, `itemCode`, `description`, `endDate`, `deadReason`) VALUES
(1, 'HKS02', 'medium size', '2020-08-13 18:20:12', 'damaged');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `employeeId` varchar(12) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` varchar(80) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `emailId` varchar(80) NOT NULL,
  `profile` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`employeeId`, `name`, `image`, `contact`, `emailId`, `profile`) VALUES
('A015', 'Vrashal Verma', 'rty.jpg', 9634520134, 'vrashal.verma@avantika.edu.in', 'UI/UX designer'),
('A032', 'Ravi Jadhav', 'jhk.jpg', 9751234562, 'ravi.jadhav@avantika.edu.in', 'Professor');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `catCode` varchar(12) NOT NULL,
  `category` varchar(30) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `t_qty` int(11) NOT NULL,
  `a_qty` int(11) NOT NULL,
  `adminId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`catCode`, `category`, `type`, `t_qty`, `a_qty`, `adminId`) VALUES
('CHL', 'Chisel', 'Non-Consumable', 4, 4, 1),
('DRM', 'Drill Machine', 'Non-Consumable', 4, 3, 1),
('FBD', 'Fevi Bond', 'Consumable', 2, 2, 1),
('FIL', 'FILE', 'Non-Consumable', 3, 2, 1),
('HKS', 'Hacksaw', 'Non-Consumable', 3, 2, 1),
('HRM', 'Hammer', 'Consumable', 1, 1, 1),
('JIS', 'Jigsaw', 'Non-Consumable', 2, 2, 1),
('MTP', 'Measuring Tape', 'Non-Consumable', 2, 2, 1),
('NAL', 'Nails', 'Consumable', 100, 100, 1),
('SCI', 'Scissor', 'Non-Consumable', 5, 5, 1),
('SCR', 'Screw', 'Consumable', 50, 50, 1),
('SND', 'Sand Paper', 'Consumable', 10, 10, 1),
('STP', 'Sticking Tape', 'Consumable', 3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `itemtransaction`
--

CREATE TABLE `itemtransaction` (
  `transactionId` int(11) NOT NULL,
  `fId` varchar(12) DEFAULT NULL,
  `sId` varchar(12) DEFAULT NULL,
  `bType` varchar(12) NOT NULL,
  `adminId` int(11) NOT NULL,
  `itemCode` varchar(12) NOT NULL,
  `issueDate` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `returnDate` datetime DEFAULT NULL,
  `itemCondition` varchar(50) NOT NULL,
  `penalty` float NOT NULL,
  `status` varchar(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itemtransaction`
--

INSERT INTO `itemtransaction` (`transactionId`, `fId`, `sId`, `bType`, `adminId`, `itemCode`, `issueDate`, `duration`, `returnDate`, `itemCondition`, `penalty`, `status`, `description`) VALUES
(1, 'A032', NULL, 'faculty', 1, 'HKS03', '2018-01-11 10:20:40', 1, '2018-01-13 13:23:44', 'damaged', 55, 'pending', 'Broken part'),
(2, 'A032', NULL, 'faculty', 1, 'HKS03', '2018-01-11 10:20:40', 1, '2018-01-13 13:23:44', 'damaged', 55, 'pending', 'Broken part'),
(3, NULL, 'AU19B1005', 'student', 1, 'HKS01', '2021-10-20 10:10:10', 2, NULL, 'misplaced', 0, 'pending', NULL),
(12, NULL, 'AU19B1005', 'Student', 1, 'HKS01', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 'Damaged', 0, 'Pending', ''),
(13, NULL, 'AU19B1005', 'Student', 1, 'HKS01', '0000-00-00 00:00:00', 1, '2021-12-03 14:22:00', 'Original', 0, 'clear', ''),
(14, NULL, 'AU19B1005', 'Student', 1, 'HKS01', '0000-00-00 00:00:00', 1, '2021-12-03 14:32:07', 'Original', 0, 'Clear', ''),
(15, NULL, 'AU19B1005', 'Student', 1, 'HKS01', '0000-00-00 00:00:00', 5, '2021-12-03 15:14:32', 'Choose Option', 0, 'Clear', ''),
(16, NULL, 'AU19B1005', 'Student', 1, 'HKS01', '0000-00-00 00:00:00', 5, NULL, '', 0, 'Issued', NULL),
(17, NULL, 'AU19B1004', 'Student', 1, 'HKS01', '0000-00-00 00:00:00', 6, '0000-00-00 00:00:00', 'Original', 0, 'Clear', ''),
(18, NULL, 'AU19B1004', 'Student', 1, 'HKS01', '0000-00-00 00:00:00', 6, NULL, '', 0, 'Issued', NULL),
(19, 'A032', NULL, 'Faculty', 1, 'HKS02', '0000-00-00 00:00:00', 1, NULL, '', 0, 'Issued', NULL),
(21, NULL, 'AU19B1004', 'Student', 1, 'HKS01', '0000-00-00 00:00:00', 1, NULL, '', 0, 'Issued', NULL),
(22, NULL, 'AU19B1005', 'Student', 1, 'HKS02', '0000-00-00 00:00:00', 2, NULL, '', 0, 'Issued', NULL),
(23, NULL, 'AU19B1005', 'Student', 1, 'HKS02', '0000-00-00 00:00:00', 2, NULL, '', 0, 'Issued', NULL),
(24, NULL, 'AU19B1004', 'Student', 1, 'HKS01', '0000-00-00 00:00:00', 1, NULL, '', 0, 'Issued', NULL),
(25, NULL, 'AU19B1004', 'Student', 1, 'HKS02', '0000-00-00 00:00:00', 2, NULL, '', 0, 'Issued', NULL),
(26, NULL, 'AU19B1004', 'Student', 1, 'HKS02', '0000-00-00 00:00:00', 2, NULL, '', 0, 'Issued', NULL),
(27, 'a032', NULL, 'Faculty', 1, 'HKS02', '2021-12-03 14:40:34', 2, NULL, '', 0, 'Issued', NULL),
(28, 'a032', NULL, 'Faculty', 1, 'HKS02', '2021-12-03 14:40:34', 2, NULL, '', 0, 'Issued', NULL),
(29, 'a032', NULL, 'Faculty', 1, 'HKS02', '2021-12-03 14:43:08', 3, NULL, '', 0, 'Issued', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itemtype1`
--

CREATE TABLE `itemtype1` (
  `itemCode` varchar(12) NOT NULL,
  `availability` int(11) NOT NULL,
  `size` varchar(20) NOT NULL,
  `cost` float NOT NULL,
  `purchaseDate` datetime NOT NULL,
  `catCode` varchar(12) NOT NULL,
  `dead` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itemtype1`
--

INSERT INTO `itemtype1` (`itemCode`, `availability`, `size`, `cost`, `purchaseDate`, `catCode`, `dead`) VALUES
('HKS01', 1, 'small', 150, '2021-12-01 12:08:10', 'HKS', 'no'),
('HKS02', 1, 'medium', 850, '2015-07-10 11:33:14', 'HKS', 'yes'),
('HKS03', 0, 'small', 650, '2020-09-28 19:46:32', 'HKS', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `enrolmentId` varchar(12) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` varchar(80) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `emailId` varchar(80) NOT NULL,
  `batch` int(11) NOT NULL,
  `dept` varchar(30) NOT NULL,
  `stream` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`enrolmentId`, `name`, `image`, `contact`, `emailId`, `batch`, `dept`, `stream`) VALUES
('AU17B1022', 'Rahul Nahar', 'qwe.jpg', 9452035614, 'rahul.nahar@avantika.edu.in', 2017, 'SoD', 'UI/UX'),
('AU19B1004', 'Nitya Kasturey', 'zyx.jpg', 9476733853, 'nitya.kasturey@avantika.edu.in', 2019, 'SoE', 'CSE'),
('AU19B1005', 'Muskan Jain', 'abc.jpg', 9770733811, 'muskan.jain@avantika.edu.in', 2019, 'SoE', 'CSE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `deadstock`
--
ALTER TABLE `deadstock`
  ADD PRIMARY KEY (`deadId`),
  ADD KEY `itemCode` (`itemCode`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`employeeId`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`catCode`),
  ADD KEY `adminId` (`adminId`);

--
-- Indexes for table `itemtransaction`
--
ALTER TABLE `itemtransaction`
  ADD PRIMARY KEY (`transactionId`),
  ADD KEY `fId` (`fId`),
  ADD KEY `sId` (`sId`),
  ADD KEY `adminId` (`adminId`);

--
-- Indexes for table `itemtype1`
--
ALTER TABLE `itemtype1`
  ADD PRIMARY KEY (`itemCode`),
  ADD KEY `catCode` (`catCode`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`enrolmentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deadstock`
--
ALTER TABLE `deadstock`
  MODIFY `deadId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `itemtransaction`
--
ALTER TABLE `itemtransaction`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deadstock`
--
ALTER TABLE `deadstock`
  ADD CONSTRAINT `deadstock_ibfk_1` FOREIGN KEY (`itemCode`) REFERENCES `itemtype1` (`itemCode`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`);

--
-- Constraints for table `itemtransaction`
--
ALTER TABLE `itemtransaction`
  ADD CONSTRAINT `itemtransaction_ibfk_1` FOREIGN KEY (`fId`) REFERENCES `faculties` (`employeeId`),
  ADD CONSTRAINT `itemtransaction_ibfk_2` FOREIGN KEY (`sId`) REFERENCES `students` (`enrolmentId`),
  ADD CONSTRAINT `itemtransaction_ibfk_3` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`);

--
-- Constraints for table `itemtype1`
--
ALTER TABLE `itemtype1`
  ADD CONSTRAINT `itemtype1_ibfk_1` FOREIGN KEY (`catCode`) REFERENCES `inventory` (`catCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
