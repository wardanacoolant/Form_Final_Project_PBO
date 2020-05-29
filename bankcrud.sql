-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Des 2018 pada 16.39
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankcrud`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat` (IN `no_rek_pen` INT)  BEGIN
	SELECT SUM(nominal) FROM transaksi WHERE no_rek=no_rek_pen AND id_status = 102 AND tanggal=CURRENT_DATE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambahPoin` (IN `no_rek` INT, IN `poin` INT)  BEGIN
	INSERT INTO poin VALUES (no_rek,poin);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `data_nasabah`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `data_nasabah` (
`tgl` date
,`transaksi` char(30)
,`teller` char(30)
,`nominal` int(16)
,`saldo` int(11)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nasabah`
--

CREATE TABLE `nasabah` (
  `no_rek` int(11) NOT NULL,
  `nama_nasabah` varchar(20) DEFAULT NULL,
  `jenis_rek` varchar(10) DEFAULT NULL,
  `no_ktp` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nasabah`
--

INSERT INTO `nasabah` (`no_rek`, `nama_nasabah`, `jenis_rek`, `no_ktp`, `tanggal`) VALUES
(408, 'ayuk', 'Biasa', 111222, '2018-12-17'),
(456, 'Hendra', 'Biasa', 123, '2018-12-16'),
(717, 'Guna', 'Biasa', 1717, '2018-12-17'),
(777, 'Chandra', 'Biasa', 777, '2018-12-16'),
(1998, 'kiki', 'Biasa', 1998, '2018-12-17'),
(2018, 'tangkas', 'Biasa', 1111222, '2018-12-17'),
(2019, 'tangkas', 'Bisnis', 1111222, '2018-12-17'),
(3300, 'Dharma', 'Biasa', 987, '2018-12-17'),
(7890, 'Tangkas', 'Biasa', 123456, '2018-12-17'),
(98031, 'Made Semblung', 'Biasa', 864121412, '2018-12-16'),
(111999, 'afif alfrabi', 'Bisnis', 19191919, '2018-12-16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `poin`
--

CREATE TABLE `poin` (
  `no_rek` int(11) NOT NULL,
  `jml_poin` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `saldo`
--

CREATE TABLE `saldo` (
  `saldo` int(11) DEFAULT NULL,
  `no_rek` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `saldo`
--

INSERT INTO `saldo` (`saldo`, `no_rek`) VALUES
(500000, 98031),
(51100000, 456),
(91000000, 111999),
(300000, 777),
(50000, 3300),
(100000, 3300),
(50000, 3300),
(1050000, 3300),
(1040000, 3300),
(50000, 717),
(70000, 717),
(50000, 7890),
(50000, 717),
(20000, 717),
(90980000, 111999),
(90940000, 111999),
(90930000, 111999),
(90910000, 111999),
(90890000, 111999),
(100000, 1998),
(50000, 1998),
(100000, 408),
(1000000, 2018),
(1000000, 2019);

-- --------------------------------------------------------

--
-- Struktur dari tabel `status`
--

CREATE TABLE `status` (
  `id_status` int(5) NOT NULL,
  `nama_transaksi` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `status`
--

INSERT INTO `status` (`id_status`, `nama_transaksi`) VALUES
(101, 'Deposit'),
(102, 'Kredit'),
(103, 'Bunga Bisnis'),
(104, 'Bunga Biasa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `teller`
--

CREATE TABLE `teller` (
  `id_teller` int(5) NOT NULL,
  `nama_teller` char(30) DEFAULT NULL,
  `pass` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `teller`
--

INSERT INTO `teller` (`id_teller`, `nama_teller`, `pass`) VALUES
(10023, 'SHANIA', '1234'),
(10024, 'Ayuk', '123'),
(10025, 'Kiki', '456'),
(10026, 'Wardana', '789');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(5) DEFAULT NULL,
  `id_teller` int(20) DEFAULT NULL,
  `no_rek` int(20) DEFAULT NULL,
  `nominal` int(16) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `id_status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_teller`, `no_rek`, `nominal`, `tanggal`, `id_status`) VALUES
(501, 10023, 98031, 500000, '2018-12-16', 101),
(502, 10024, 456, 234, '2018-12-16', 101),
(503, 10024, 456, 70000, '2018-12-16', 101),
(504, 10025, 456, 40468, '2018-12-16', 102),
(505, 10024, 456, 50000000, '2018-12-16', 101),
(506, 10024, 111999, 9000000, '2018-12-16', 102),
(507, 10024, 777, 200000, '2018-12-16', 101),
(508, 10026, 3300, 50000, '2018-12-17', 101),
(509, 10025, 3300, 50000, '2018-12-17', 102),
(510, 10024, 3300, 1000000, '2018-12-17', 101),
(511, 10025, 3300, 10000, '2018-12-17', 102),
(512, 10025, 717, 20000, '2018-12-17', 101),
(513, 10025, 717, 20000, '2018-12-17', 102),
(514, 10024, 717, 30000, '2018-12-17', 102),
(515, 10024, 111999, 20000, '2018-12-17', 102),
(516, 10024, 111999, 40000, '2018-12-17', 102),
(517, 10024, 111999, 10000, '2018-12-17', 102),
(518, 10024, 111999, 20000, '2018-12-17', 102),
(519, 10024, 111999, 20000, '2018-12-17', 102),
(520, 10024, 1998, 50000, '2018-12-17', 102);

-- --------------------------------------------------------

--
-- Struktur untuk view `data_nasabah`
--
DROP TABLE IF EXISTS `data_nasabah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_nasabah`  AS  select distinct `transaksi`.`tanggal` AS `tgl`,`status`.`nama_transaksi` AS `transaksi`,`teller`.`nama_teller` AS `teller`,`transaksi`.`nominal` AS `nominal`,`saldo`.`saldo` AS `saldo` from ((((`nasabah` join `saldo` on((`nasabah`.`no_rek` = `saldo`.`no_rek`))) join `transaksi` on((`nasabah`.`no_rek` = `transaksi`.`no_rek`))) join `status` on((`nasabah`.`no_rek` = `saldo`.`no_rek`))) join `teller` on((`transaksi`.`id_teller` = `teller`.`id_teller`))) where (`nasabah`.`no_rek` = 777) order by `transaksi`.`tanggal` desc ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`no_rek`);

--
-- Indeks untuk tabel `poin`
--
ALTER TABLE `poin`
  ADD UNIQUE KEY `no_rek` (`no_rek`);

--
-- Indeks untuk tabel `saldo`
--
ALTER TABLE `saldo`
  ADD KEY `no_rek` (`no_rek`);

--
-- Indeks untuk tabel `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indeks untuk tabel `teller`
--
ALTER TABLE `teller`
  ADD PRIMARY KEY (`id_teller`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD KEY `id_status` (`id_status`),
  ADD KEY `id_teller` (`id_teller`),
  ADD KEY `no_rek` (`no_rek`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `poin`
--
ALTER TABLE `poin`
  ADD CONSTRAINT `poin` FOREIGN KEY (`no_rek`) REFERENCES `nasabah` (`no_rek`);

--
-- Ketidakleluasaan untuk tabel `saldo`
--
ALTER TABLE `saldo`
  ADD CONSTRAINT `saldo_ibfk_1` FOREIGN KEY (`no_rek`) REFERENCES `nasabah` (`no_rek`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_teller`) REFERENCES `teller` (`id_teller`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`no_rek`) REFERENCES `nasabah` (`no_rek`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
