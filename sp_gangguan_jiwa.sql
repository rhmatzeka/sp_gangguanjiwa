-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 15, 2025 at 03:12 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sp_gangguan_jiwa`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_rule`
--

CREATE TABLE `detail_rule` (
  `id_detail_rule` int NOT NULL,
  `id_rule` varchar(4) DEFAULT NULL,
  `kode_gejala` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_rule`
--

INSERT INTO `detail_rule` (`id_detail_rule`, `id_rule`, `kode_gejala`) VALUES
(1, 'R1', 'G01'),
(2, 'R1', 'G02'),
(3, 'R1', 'G03'),
(4, 'R1', 'G04'),
(5, 'R1', 'G05'),
(6, 'R1', 'G06'),
(7, 'R1', 'G07'),
(8, 'R1', 'G16'),
(9, 'R2', 'G01'),
(10, 'R2', 'G02'),
(11, 'R2', 'G03'),
(12, 'R2', 'G04'),
(13, 'R2', 'G05'),
(14, 'R2', 'G06'),
(15, 'R2', 'G07'),
(16, 'R2', 'G15'),
(17, 'R2', 'G16'),
(18, 'R2', 'G18'),
(19, 'R3', 'G02'),
(20, 'R3', 'G08'),
(21, 'R3', 'G09'),
(22, 'R3', 'G10'),
(23, 'R3', 'G11'),
(24, 'R3', 'G12'),
(25, 'R3', 'G13'),
(26, 'R3', 'G14'),
(27, 'R4', 'G02'),
(28, 'R4', 'G17'),
(29, 'R4', 'G18'),
(30, 'R4', 'G19'),
(31, 'R4', 'G20'),
(32, 'R4', 'G23'),
(33, 'R4', 'G24'),
(34, 'R4', 'G26'),
(35, 'R5', 'G03'),
(36, 'R5', 'G16'),
(37, 'R5', 'G18'),
(38, 'R5', 'G20'),
(39, 'R5', 'G24'),
(40, 'R5', 'G25'),
(41, 'R6', 'G03'),
(42, 'R6', 'G17'),
(43, 'R6', 'G19'),
(44, 'R6', 'G20'),
(45, 'R6', 'G24'),
(46, 'R7', 'G03'),
(47, 'R7', 'G18'),
(48, 'R7', 'G20'),
(49, 'R7', 'G24'),
(50, 'R7', 'G25'),
(51, 'R8', 'G02'),
(52, 'R8', 'G05'),
(53, 'R8', 'G07'),
(54, 'R8', 'G15'),
(55, 'R8', 'G16'),
(56, 'R8', 'G18'),
(57, 'R8', 'G20'),
(58, 'R8', 'G21'),
(59, 'R8', 'G23'),
(60, 'R8', 'G26'),
(61, 'R9', 'G02'),
(62, 'R9', 'G05'),
(63, 'R9', 'G07'),
(64, 'R9', 'G15'),
(65, 'R9', 'G16'),
(66, 'R9', 'G24'),
(67, 'R9', 'G26');

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `kode_gejala` varchar(4) NOT NULL,
  `nama_gejala` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`) VALUES
('G01', 'Perubahan Nafsu Makan'),
('G02', 'Gangguan Tidur'),
('G03', 'Bicara/Bergerak Lebih Lambat'),
('G04', 'Kehilangan Kepercayaan Diri'),
('G05', 'Merasa bersalah pada diri sendiri'),
('G06', 'Berniat menyakiti diri sendiri / bunuh diri'),
('G07', 'Sering Merasa Sedih'),
('G08', 'Dada berdebar'),
('G09', 'Sulit bernafas'),
('G10', 'Merasa tercekik'),
('G11', 'Nyeri dan sesak di dada'),
('G12', 'Mual dan gangguan perut'),
('G13', 'Pusing atau sakit kepala'),
('G14', 'Rasa takut dan khawatir berlebih'),
('G15', 'Mudah tersinggung/curiga'),
('G16', 'Sulit konsentrasi'),
('G17', 'Mendengar atau melihat yang tidak ada (halusinasi)'),
('G18', 'Kurang bersosialisasi'),
('G19', 'Yakin terhadap sesuatu yang tidak nyata (Delusi)'),
('G20', 'Bicara yang tidak masuk akal'),
('G21', 'Terlalu percaya diri'),
('G22', 'Bicara cepat dan berganti-ganti topik'),
('G23', 'Gelisah dan mudah marah'),
('G24', 'Penurunan kemampuan berperilaku'),
('G25', 'Diam membisu/ekpresi datar'),
('G26', 'Senang berlebih');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_kepastian`
--

CREATE TABLE `nilai_kepastian` (
  `term` varchar(50) NOT NULL,
  `fk_user` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nilai_kepastian`
--

INSERT INTO `nilai_kepastian` (`term`, `fk_user`) VALUES
('Hampir Pasti', '0.80'),
('Hampir Tidak Pasti', '0.20'),
('Kemungkinan Besar', '0.70'),
('Kemungkinan Besar Tidak', '0.30'),
('Kemungkinan Kecil', '0.50'),
('Mungkin', '0.60'),
('Mungkin Tidak', '0.40'),
('Pasti', '1.00'),
('Tidak Pasti', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `kode_penyakit` varchar(4) NOT NULL,
  `nama_penyakit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`kode_penyakit`, `nama_penyakit`) VALUES
('P01', 'Gangguan Depresi'),
('P02', 'Gangguan Kecemasan Menyeluruh'),
('P03', 'Skizofrenia'),
('P04', 'Gangguan Bipolar');

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `id_rule` varchar(4) NOT NULL,
  `kode_penyakit` varchar(4) DEFAULT NULL,
  `fk_pakar` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`id_rule`, `kode_penyakit`, `fk_pakar`) VALUES
('R1', 'P01', '0.81'),
('R2', 'P01', '0.79'),
('R3', 'P02', '0.85'),
('R4', 'P03', '0.93'),
('R5', 'P03', '0.90'),
('R6', 'P03', '0.96'),
('R7', 'P03', '0.92'),
('R8', 'P04', '0.78'),
('R9', 'P04', '0.83');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_rule`
--
ALTER TABLE `detail_rule`
  ADD PRIMARY KEY (`id_detail_rule`),
  ADD KEY `id_rule` (`id_rule`),
  ADD KEY `kode_gejala` (`kode_gejala`);

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`kode_gejala`);

--
-- Indexes for table `nilai_kepastian`
--
ALTER TABLE `nilai_kepastian`
  ADD PRIMARY KEY (`term`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`kode_penyakit`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id_rule`),
  ADD KEY `kode_penyakit` (`kode_penyakit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_rule`
--
ALTER TABLE `detail_rule`
  MODIFY `id_detail_rule` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_rule`
--
ALTER TABLE `detail_rule`
  ADD CONSTRAINT `detail_rule_ibfk_1` FOREIGN KEY (`id_rule`) REFERENCES `rules` (`id_rule`),
  ADD CONSTRAINT `detail_rule_ibfk_2` FOREIGN KEY (`kode_gejala`) REFERENCES `gejala` (`kode_gejala`);

--
-- Constraints for table `rules`
--
ALTER TABLE `rules`
  ADD CONSTRAINT `rules_ibfk_1` FOREIGN KEY (`kode_penyakit`) REFERENCES `penyakit` (`kode_penyakit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
