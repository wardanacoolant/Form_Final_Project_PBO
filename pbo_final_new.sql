-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2018 at 03:16 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbo_final`
--
CREATE DATABASE IF NOT EXISTS `pbo_final_new` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pbo_final_new`;

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

DROP TABLE IF EXISTS `nasabah`;
CREATE TABLE `nasabah` (
  `id_nasabah` int(11) NOT NULL,
  `no_rek` int(11) DEFAULT NULL,
  `nama_nasabah` varchar(20) DEFAULT NULL,
  `jenis_rek` varchar(10) DEFAULT NULL,
  `no_ktp` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nasabah`
--

--
-- Triggers `nasabah`
--


-- --------------------------------------------------------

--
-- Table structure for table `penarikan`
--


-- --------------------------------------------------------

DROP TABLE IF EXISTS `saldo`;
CREATE TABLE `saldo` (
  `id_saldo` int(11) NOT NULL,
  `saldo` int(11) DEFAULT NULL,
  `no_rek` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `saldo`
--

--
-- Dumping data for table `saldo`
--



--
-- Indexes for dumped tables
--

DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE transaksi(
  id_transaksi INT (5),
    id_teller INT(20),
    id_customer INT(20),
    nominal INT(16),
    tanggal DATE,
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `status`;
CREATE TABLE STATUS(
    id_status int(5) PRIMARY key,
    nama_transaksi CHAR(30)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `teller`;
CREATE TABLE TELLER(
    id_teller int(5) PRIMARY key,
    nama_teller CHAR(30),
    pass CHAR(10)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id_nasabah`);

--
-- Indexes for table `saldo`
--
ALTER TABLE `saldo`
  ADD PRIMARY KEY (`id_saldo`);

--
-- AUTO_INCREMENT for dumped tables
--



--
-- AUTO_INCREMENT for table `saldo`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
