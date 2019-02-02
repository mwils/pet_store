-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 02, 2019 at 04:02 PM
-- Server version: 5.5.56
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_store`
--
CREATE DATABASE IF NOT EXISTS `pet_store` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pet_store`;

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `name`) VALUES
(31, 'pet_type'),
(32, 'age'),
(33, 'lifespan'),
(34, 'price');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_item`
--

DROP TABLE IF EXISTS `catalog_item`;
CREATE TABLE `catalog_item` (
  `id` int(11) NOT NULL,
  `title` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_item`
--

INSERT INTO `catalog_item` (`id`, `title`) VALUES
(5, 'hound'),
(6, 'chameleon'),
(7, 'chihuahua');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_item_attribute`
--

DROP TABLE IF EXISTS `catalog_item_attribute`;
CREATE TABLE `catalog_item_attribute` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `value` varchar(65025) NOT NULL,
  `attribute_name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_item_attribute`
--

INSERT INTO `catalog_item_attribute` (`id`, `item_id`, `value`, `attribute_name_id`) VALUES
(1, 5, 'dog', 31),
(2, 6, 'reptile', 31),
(3, 7, 'dog', 31),
(4, 5, '10', 32),
(5, 5, '12', 33),
(6, 6, '1', 32),
(7, 6, '5', 33),
(8, 6, '75.00', 34),
(11, 7, '75', 34),
(12, 5, '150', 34);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_item`
--
ALTER TABLE `catalog_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_item_attribute`
--
ALTER TABLE `catalog_item_attribute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_attribute` (`item_id`,`attribute_name_id`),
  ADD KEY `attribute_name_id` (`attribute_name_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `catalog_item`
--
ALTER TABLE `catalog_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `catalog_item_attribute`
--
ALTER TABLE `catalog_item_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `catalog_item_attribute`
--
ALTER TABLE `catalog_item_attribute`
  ADD CONSTRAINT `catalog_item_attribute_ibfk_2` FOREIGN KEY (`attribute_name_id`) REFERENCES `attribute` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `catalog_item_attribute_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `catalog_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
