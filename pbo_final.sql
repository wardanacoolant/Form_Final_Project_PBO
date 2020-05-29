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
CREATE DATABASE IF NOT EXISTS `pbo_final` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pbo_final`;

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
  `saldo` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id_nasabah`, `no_rek`, `nama_nasabah`, `jenis_rek`, `no_ktp`, `saldo`, `tanggal`) VALUES
(1, 123, 'kiki', 'Bisnis', 123456, 2345000, '2021-11-11'),
(2, 123, 'ayuk', 'Biasa', 123456, 7234500, '2021-11-11'),
(3, 123, 'wardana', 'Bisnis', 123456, 7234500, '2021-11-11'),
(4, 1234, 'kii aja', 'Bisnis', 123456, 230000, '2020-11-12'),
(5, 123456, 'kiki dwi', 'Bisnis', 2312, 50000000, '2011-11-11');

--
-- Triggers `nasabah`
--
DROP TRIGGER IF EXISTS `saldoAwal`;
DELIMITER $$
CREATE TRIGGER `saldoAwal` AFTER INSERT ON `nasabah` FOR EACH ROW BEGIN 
	INSERT INTO saldo VALUES (' ', new.saldo, new.no_rek);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penarikan`
--

DROP TABLE IF EXISTS `penarikan`;
CREATE TABLE `penarikan` (
  `id_penarikan` int(11) NOT NULL,
  `jml_penarikan` int(11) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `nama_teller` varchar(20) DEFAULT NULL,
  `tanggal_penarikan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penyetoran`
--

DROP TABLE IF EXISTS `penyetoran`;
CREATE TABLE `penyetoran` (
  `id_penyetoran` int(11) NOT NULL,
  `no_rek` int(11) NOT NULL,
  `jml_penyetoran` int(11) DEFAULT NULL,
  `nama_teller` varchar(20) DEFAULT NULL,
  `tanggal_penyetoran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyetoran`
--

INSERT INTO `penyetoran` (`id_penyetoran`, `no_rek`, `jml_penyetoran`, `nama_teller`, `tanggal_penyetoran`) VALUES
(1, 123456, 500000, 'ayuk', '2018-12-10'),
(2, 123456, 40000, 'ayuk', '2018-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `saldo`
--

DROP TABLE IF EXISTS `saldo`;
CREATE TABLE `saldo` (
  `id_saldo` int(11) NOT NULL,
  `saldo` int(11) DEFAULT NULL,
  `no_rek` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saldo`
--

INSERT INTO `saldo` (`id_saldo`, `saldo`, `no_rek`) VALUES
(1, 4, 230000),
(2, 50000000, 123456);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id_nasabah`);

--
-- Indexes for table `penarikan`
--
ALTER TABLE `penarikan`
  ADD PRIMARY KEY (`id_penarikan`);

--
-- Indexes for table `penyetoran`
--
ALTER TABLE `penyetoran`
  ADD PRIMARY KEY (`id_penyetoran`);

--
-- Indexes for table `saldo`
--
ALTER TABLE `saldo`
  ADD PRIMARY KEY (`id_saldo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `penarikan`
--
ALTER TABLE `penarikan`
  MODIFY `id_penarikan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penyetoran`
--
ALTER TABLE `penyetoran`
  MODIFY `id_penyetoran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `saldo`
--
ALTER TABLE `saldo`
  MODIFY `id_saldo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
