-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2023 at 03:00 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelscapes`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `cityid` int(4) NOT NULL,
  `city` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `season` varchar(255) NOT NULL,
  `days` int(2) NOT NULL,
  `cost` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`cityid`, `city`, `region`, `season`, `days`, `cost`) VALUES
(1, 'Ladakh', 'North', 'Autumn', 10, 50000),
(2, 'Manali', 'North', 'Winter', 7, 35000),
(3, 'Chennai', 'South', 'Winter', 5, 30000),
(4, 'Sikkim', 'North-East', 'Spring', 7, 55000),
(5, 'Rajasthan', 'North', 'Winter', 7, 40000),
(6, 'Bhopal', 'Central', 'Winter', 3, 20000),
(7, 'Pune', 'Central', 'Winter', 3, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotelid` int(11) NOT NULL,
  `hotel` varchar(255) NOT NULL,
  `cityid` int(11) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `amenities` text DEFAULT NULL,
  `ratings` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotelid`, `hotel`, `cityid`, `cost`, `amenities`, `ratings`) VALUES
(1, 'JW Marriott', 7, 6000.00, '1. Luxurious Rooms\r\n2. Swimming Pool\r\n3. Fine Dining Restaurants\r\n4. 24/7 Service\r\n5. Complimentary Breakfast', 5),
(2, 'The Taj', 1, 8000.00, '1. Luxurious Rooms\r\n2. Swimming Pool\r\n3. Fine Dining Restaurants\r\n4. 24/7 Service\r\n5. Complimentary Breakfast', 5);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `usersid` int(4) NOT NULL,
  `usersEmail` varchar(128) NOT NULL,
  `usersuid` varchar(128) NOT NULL,
  `userspwd` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`usersid`, `usersEmail`, `usersuid`, `userspwd`) VALUES
(1, 'test@test.com', 'test', '$2y$10$flekLyq.6a/gn12Xsdm0v.SZZCrx3/.Pm3M3Ucvel8MwCzReorRsq'),
(2, 'test2@test.com', 'test2', '$2y$10$uqx8Jk9IDXZ8q1x4JFPR5OYiaCKYTquxsXH6A0OM7hTXkpEKXzjJG'),
(3, 'test3@test.com', 'test3', '$2y$10$OGLEA.ETOj1DB0fRhjjuduKb4OJ75.WB5wgs5UVUBPjTMbcoUVVgy'),
(5, 'test4@test.com', 'test4', '$2y$10$ikw.LpmUCDlMTuK2qdUyNuueZOn2Zrqkg4WLEuUaqDFLYh4YjrIlC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`cityid`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotelid`),
  ADD KEY `cityid` (`cityid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`usersid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `cityid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotelid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `usersid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`cityid`) REFERENCES `cities` (`cityid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
