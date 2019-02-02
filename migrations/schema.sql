-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 02, 2019 at 08:45 PM
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
(34, 'price'),
(35, 'color'),
(36, 'size'),
(37, 'item_type');

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
(5, 'Hound'),
(6, 'Chameleon'),
(7, 'Chihuahua'),
(8, 'Golden Retriever'),
(9, 'Poodle'),
(10, 'Beagle'),
(11, 'Large Carrier'),
(12, 'Small Carrier'),
(13, 'Medium Carrier'),
(14, 'Giant Carrier'),
(15, 'Gold Carrier'),
(16, 'Persian'),
(17, 'Siamese'),
(18, 'Scottish Fold'),
(19, 'Maine Coon'),
(20, 'Bobcat'),
(21, 'Python'),
(22, 'Bearded Dragon'),
(23, 'Gecko'),
(24, 'Iguana'),
(25, 'Bone Large'),
(26, 'Bone Small'),
(27, 'Ball - Red'),
(28, 'Ball - Blue'),
(29, 'Cat Tower');

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
(8, 6, '75', 34),
(11, 7, '75', 34),
(12, 5, '150', 34),
(20, 5, 'red / white', 35),
(22, 7, '12', 33),
(23, 7, '2', 32),
(25, 8, 'dog', 31),
(26, 8, '10', 32),
(27, 8, '12', 33),
(28, 8, '200', 34),
(29, 9, 'dog', 31),
(30, 9, '12', 33),
(31, 9, '5', 32),
(33, 9, '250', 34),
(34, 10, '120', 34),
(35, 10, '12', 33),
(36, 10, '4', 32),
(37, 10, 'dog', 31),
(38, 14, '100', 36),
(39, 14, '100', 34),
(40, 14, 'white', 35),
(41, 11, '80', 34),
(42, 11, '80', 36),
(43, 13, '60', 36),
(44, 13, '60', 34),
(47, 12, '40', 36),
(48, 12, '40', 34),
(49, 15, '500', 34),
(50, 15, 'Golden', 35),
(51, 16, 'cat', 31),
(52, 17, 'cat', 31),
(53, 18, 'cat', 31),
(54, 19, 'cat', 31),
(55, 20, 'cat', 31),
(56, 16, '200', 34),
(57, 17, '150', 34),
(58, 18, '120', 34),
(59, 19, '145', 34),
(60, 20, '800', 34),
(61, 16, '15', 33),
(62, 17, '15', 33),
(63, 18, '15', 33),
(64, 19, '15', 33),
(65, 20, '15', 33),
(66, 16, '4', 32),
(67, 17, '9', 32),
(68, 18, '12', 32),
(69, 19, '1', 32),
(70, 20, '12', 32),
(71, 13, 'carrier', 37),
(72, 12, 'carrier', 37),
(73, 14, 'carrier', 37),
(74, 15, 'carrier', 37),
(75, 11, 'carrier', 37),
(77, 22, '45', 34),
(78, 23, '25', 34),
(79, 21, '85', 34),
(80, 24, '35', 34),
(81, 22, 'reptile', 31),
(82, 24, 'reptile', 31),
(83, 23, 'reptile', 31),
(84, 21, 'reptile', 31),
(85, 22, '9', 32),
(86, 23, '1', 32),
(87, 24, '7', 32),
(88, 21, '10', 32),
(89, 22, '10', 33),
(90, 23, '5', 33),
(91, 24, '10', 33),
(92, 21, '18', 33),
(93, 28, '12', 34),
(94, 25, '15', 34),
(95, 26, '12', 34),
(96, 27, '15', 34),
(97, 29, '45', 34),
(98, 28, 'Blue', 35),
(99, 27, 'Red', 35),
(100, 28, 'toy', 37),
(101, 27, 'toy', 37),
(102, 25, 'toy', 37),
(103, 26, 'toy', 37),
(104, 29, 'toy', 37);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `catalog_item`
--
ALTER TABLE `catalog_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `catalog_item_attribute`
--
ALTER TABLE `catalog_item_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
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
