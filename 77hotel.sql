-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2021 at 05:28 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `77hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `checkin`
--

CREATE TABLE `checkin` (
  `ID_Checkin` varchar(6) NOT NULL,
  `ID_Petugas` varchar(6) NOT NULL,
  `ID_tamu` varchar(6) NOT NULL,
  `Tanggal_Checkin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `ID_checkout` varchar(6) NOT NULL,
  `ID_Tamu` varchar(6) NOT NULL,
  `ID_Petugas` varchar(6) NOT NULL,
  `Tanggal_Checkout` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `Nomor_kamar` varchar(6) NOT NULL,
  `Status_kamar` tinyint(1) DEFAULT NULL,
  `ID_tamu` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `ID_pembayaran` varchar(6) NOT NULL,
  `ID_petugas` varchar(6) NOT NULL,
  `ID_tamu` varchar(6) NOT NULL,
  `ID_reservasi` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `ID_petugas` varchar(6) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Jabatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `ID_reservasi` varchar(6) NOT NULL,
  `tanggal_reservasi` date NOT NULL,
  `ID_checkin` varchar(6) NOT NULL,
  `ID_checkout` varchar(6) NOT NULL,
  `jumlah_kamar` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `ID_tamu` varchar(6) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `No_Telepon` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`ID_Checkin`),
  ADD KEY `ID_Petugas` (`ID_Petugas`),
  ADD KEY `ID_tamu` (`ID_tamu`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`ID_checkout`),
  ADD KEY `ID_Tamu` (`ID_Tamu`),
  ADD KEY `ID_Petugas` (`ID_Petugas`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`Nomor_kamar`),
  ADD KEY `ID_tamu` (`ID_tamu`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`ID_pembayaran`),
  ADD KEY `ID_petugas` (`ID_petugas`),
  ADD KEY `ID_tamu` (`ID_tamu`),
  ADD KEY `ID_reservasi` (`ID_reservasi`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`ID_petugas`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`ID_reservasi`),
  ADD KEY `ID_checkin` (`ID_checkin`),
  ADD KEY `ID_checkout` (`ID_checkout`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`ID_tamu`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkin`
--
ALTER TABLE `checkin`
  ADD CONSTRAINT `checkin_ibfk_1` FOREIGN KEY (`ID_Petugas`) REFERENCES `petugas` (`ID_petugas`),
  ADD CONSTRAINT `checkin_ibfk_2` FOREIGN KEY (`ID_tamu`) REFERENCES `tamu` (`ID_tamu`);

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`ID_Tamu`) REFERENCES `tamu` (`ID_tamu`),
  ADD CONSTRAINT `checkout_ibfk_2` FOREIGN KEY (`ID_Petugas`) REFERENCES `petugas` (`ID_petugas`);

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`ID_tamu`) REFERENCES `tamu` (`ID_tamu`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`ID_petugas`) REFERENCES `petugas` (`ID_petugas`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`ID_tamu`) REFERENCES `tamu` (`ID_tamu`),
  ADD CONSTRAINT `pembayaran_ibfk_3` FOREIGN KEY (`ID_reservasi`) REFERENCES `reservasi` (`ID_reservasi`);

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`ID_checkin`) REFERENCES `checkin` (`ID_Checkin`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`ID_checkout`) REFERENCES `checkout` (`ID_checkout`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
