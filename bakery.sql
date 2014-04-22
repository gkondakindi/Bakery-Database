-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2014 at 11:36 PM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bakery`
--
CREATE DATABASE IF NOT EXISTS `bakery` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bakery`;

-- --------------------------------------------------------

--
-- Table structure for table `cake`
--

CREATE TABLE IF NOT EXISTS `cake` (
  `cakeid` int(10) NOT NULL AUTO_INCREMENT,
  `cakename` varchar(100) DEFAULT NULL,
  `slices` int(4) NOT NULL,
  PRIMARY KEY (`cakeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `cake`
--

INSERT INTO `cake` (`cakeid`, `cakename`, `slices`) VALUES
(1, 'Apple Pie', 6),
(2, 'Brownie', 8),
(3, 'Chocolate Delight', 3),
(4, 'Red bean cake', 5),
(5, 'Italian', 7),
(6, 'Lemon cake', 4),
(7, 'Vanilla cake', 10),
(8, 'Strawberry cake', 5);

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE IF NOT EXISTS `contains` (
  `cakeid` int(10) NOT NULL,
  `ingredid` int(10) NOT NULL,
  `qty` int(5) NOT NULL,
  PRIMARY KEY (`cakeid`,`ingredid`),
  KEY `ingredid` (`ingredid`),
  KEY `cakeid` (`cakeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contains`
--

INSERT INTO `contains` (`cakeid`, `ingredid`, `qty`) VALUES
(1, 1, 2),
(1, 3, 1),
(1, 4, 1),
(2, 2, 2),
(2, 3, 4),
(3, 1, 2),
(3, 4, 2),
(4, 2, 2),
(4, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `custid` int(11) NOT NULL AUTO_INCREMENT,
  `custname` varchar(50) DEFAULT NULL,
  `ccn` varchar(50) NOT NULL,
  `phoneno` int(10) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `zip` int(11) NOT NULL,
  PRIMARY KEY (`custid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custid`, `custname`, `ccn`, `phoneno`, `address`, `city`, `zip`) VALUES
(1, 'Mike', '2147483647', 2018763524, '16 Bronx Street, New York', 'Bronx', 11205),
(2, 'Fu', '2147483647', 2018763524, 'Bronx Street, New York', 'Bronx', 11205),
(3, 'John', '2147483647', 2015467782, '26 Varick Street', 'New York', 11207),
(4, 'Kumar', '23874328487823432', 2017849867, '26 Saint Paul', 'Jersey', 7301),
(5, 'Jin', '2384932473234343', 2018403211, '50 Journal Square', 'Jersey', 7301);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE IF NOT EXISTS `ingredient` (
  `ingredid` int(10) NOT NULL AUTO_INCREMENT,
  `iname` varchar(50) DEFAULT NULL,
  `price` int(3) NOT NULL,
  PRIMARY KEY (`ingredid`),
  KEY `ingredid` (`ingredid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`ingredid`, `iname`, `price`) VALUES
(1, 'flour', 3),
(2, 'eggs', 4),
(3, 'sugar', 2),
(4, 'milk', 5);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `custid` int(11) NOT NULL,
  `cakeid` int(10) NOT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pickuptime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pricepaid` int(6) NOT NULL,
  PRIMARY KEY (`custid`,`cakeid`,`ordertime`),
  KEY `custid` (`custid`),
  KEY `cakeid` (`cakeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `orders` (`custid`, `cakeid`, `ordertime`, `pickuptime`, `pricepaid`) VALUES
(1, 1, '2014-03-20 22:34:46', '2014-03-24 04:00:00', 12),
(1, 2, '2014-03-20 22:35:07', '2014-03-26 04:00:00', 10),
(2, 8, '2014-03-20 22:35:30', '2014-03-27 04:00:00', 25),
(3, 3, '2014-03-20 22:36:07', '2014-03-28 04:00:00', 30),
(3, 4, '2014-03-20 22:35:48', '2014-03-26 04:00:00', 30),
(4, 7, '2014-03-20 22:36:25', '2014-03-28 04:00:00', 28);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `fk_ingredid` FOREIGN KEY (`ingredid`) REFERENCES `ingredient` (`ingredid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cakeid` FOREIGN KEY (`cakeid`) REFERENCES `cake` (`cakeid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_cakeid` FOREIGN KEY (`cakeid`) REFERENCES `cake` (`cakeid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_custid` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
