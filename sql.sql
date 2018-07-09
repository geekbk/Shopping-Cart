-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2018 at 07:54 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_table`
--

CREATE TABLE `customer_table` (
  `CustomerID` int(20) NOT NULL,
  `CustomerName` varchar(100) NOT NULL,
  `Address` varchar(300) NOT NULL,
  `City` varchar(50) NOT NULL,
  `ZipCode` varchar(20) NOT NULL,
  `State` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_table`
--

INSERT INTO `customer_table` (`CustomerID`, `CustomerName`, `Address`, `City`, `ZipCode`, `State`) VALUES
(1, 'Ravi', '27 , Ground Floor, Haji Habib Bldg, Dr.b.a.road, Opp Fire Bridage, Dadar(e)', 'Mumbai', '400014', ' Maharashtra'),
(2, 'Karan', '89  B, Sadananda Road, Kalighat', 'Kolkata', '700001', 'West Bengal'),
(3, 'Ravi', '27 , Ground Floor, Haji Habib Bldg, Dr.b.a.road, Opp Fire Bridage, Dadar(e)', 'Mumbai', '400014', ' Maharashtra'),
(4, 'Karan', '89  B, Sadananda Road, Kalighat', 'Kolkata', '700001', 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `creation_date` date NOT NULL,
  `order_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`order_id`, `customer_id`, `creation_date`, `order_status`) VALUES
(1, 1, '2018-07-09', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `product_order_detail`
--

CREATE TABLE `product_order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `product_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_order_detail`
--

INSERT INTO `product_order_detail` (`id`, `order_id`, `product_name`, `product_price`, `product_quantity`) VALUES
(11, 5, 'TJ-45-Shirt', 1500.00, 2),
(12, 6, 'TJ-45-Shirt', 1500.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_table`
--

CREATE TABLE `product_table` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_table`
--

INSERT INTO `product_table` (`id`, `name`, `image`, `price`) VALUES
(5, 'TJ-45-Shirt', '1.jpg', '1500'),
(6, 'TJ-46-Shirt', '2.jpg', '2000'),
(7, 'ZS-10-T-Shirt', '3.jpg', '2500'),
(8, 'ZS-29-T-Shirt', '4.jpg', '1200'),
(10, 'ZS-20-T-Shirt', '5.jpg', '1200'),
(11, 'ZS-21-T-Shirt', '6.jpg', '800'),
(12, 'ZS-33-T-Shirt', '7.jpg', '900'),
(13, 'ZS-42-T-Shirt', '8.jpg', '1250'),
(14, 'ZS-9-T-Shirt', '9.jpg', '1260'),
(15, 'ZS-90-T-Shirt', '10.jpg', '500'),
(16, 'ZS-23-T-Shirt', '11.jpg', '500'),
(17, 'ZS-12-T-Shirt', '12.jpg', '299');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_table`
--
ALTER TABLE `customer_table`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_table`
--
ALTER TABLE `product_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_table`
--
ALTER TABLE `customer_table`
  MODIFY `CustomerID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_table`
--
ALTER TABLE `product_table`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
