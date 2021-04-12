-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 27, 2020 at 12:51 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aweb_prodavnica`
--
CREATE DATABASE IF NOT EXISTS `aweb_prodavnica` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aweb_prodavnica`;

-- --------------------------------------------------------

--
-- Table structure for table `kredit`
--

DROP TABLE IF EXISTS `kredit`;
CREATE TABLE IF NOT EXISTS `kredit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kredit`
--

INSERT INTO `kredit` (`id`, `amount`, `username`) VALUES
(8, 10000, 'Borko'),
(7, 10000, 'Marija');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cena` double NOT NULL,
  `naziv` varchar(255) DEFAULT NULL,
  `opis` varchar(255) DEFAULT NULL,
  `slika` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `cena`, `naziv`, `opis`, `slika`) VALUES
(1, 3500, 'Stolica', 'Stolica od kovanog gvodzdja.', '7c7746b7-dc07-4677-820b-71330c2ea417_8SA_9339.jpg'),
(6, 6000, 'Civiluk', 'Civiluk od kovanog gvodzdja.', '5628d43e-fafd-4e25-a2a2-927ae70f1e2e_8SA_9365.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `purchasedproducts`
--

DROP TABLE IF EXISTS `purchasedproducts`;
CREATE TABLE IF NOT EXISTS `purchasedproducts` (
  `purchasedProductsId` int(11) NOT NULL AUTO_INCREMENT,
  `cena` double NOT NULL,
  `naziv` varchar(255) DEFAULT NULL,
  `opis` varchar(255) DEFAULT NULL,
  `productid` int(11) NOT NULL,
  `slika` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`purchasedProductsId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchasedproducts`
--

INSERT INTO `purchasedproducts` (`purchasedProductsId`, `cena`, `naziv`, `opis`, `productid`, `slika`, `username`) VALUES
(1, 2000, 'Visoki sto', 'Visoki sto od kovanog gvodzdja.', 2, '5df88a01-eb9f-4874-81d5-f2de3977bc91_8SA_9382.jpg', 'Marija'),
(2, 3000, 'Polica', 'Polica od kovanog gvodzdja.', 3, '85dc2f35-d2e4-4c14-86be-354e83c0173a_8SA_9410.jpg', 'Borko');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit` double NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `credit`, `password`, `status`, `username`) VALUES
(1, 1000, '123', 1, 'Aleksandar'),
(2, 113000, '234', 2, 'Marija'),
(3, 22000, '345', 2, 'Borko');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
