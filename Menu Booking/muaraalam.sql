-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Sep 2022 pada 09.20
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `muaraalam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_detail_perumahan`
--

CREATE TABLE `tbl_detail_perumahan` (
  `id` char(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `blok` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_detail_perumahan`
--

INSERT INTO `tbl_detail_perumahan` (`id`, `nama`, `blok`) VALUES
('A001', 'A1', 'A'),
('A002', 'A2', 'B');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_perumahan`
--

CREATE TABLE `tbl_perumahan` (
  `kode_perumahan` char(2) NOT NULL,
  `nama_perumahan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_perumahan`
--

INSERT INTO `tbl_perumahan` (`kode_perumahan`, `nama_perumahan`) VALUES
('A', 'Perumahan Blok A'),
('B', 'Perumahan Blok B');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_detail_perumahan`
--
ALTER TABLE `tbl_detail_perumahan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `perumahan` (`blok`);

--
-- Indeks untuk tabel `tbl_perumahan`
--
ALTER TABLE `tbl_perumahan`
  ADD KEY `kode_perumahan` (`kode_perumahan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_detail_perumahan`
--
ALTER TABLE `tbl_detail_perumahan`
  ADD CONSTRAINT `fk_perumahan` FOREIGN KEY (`blok`) REFERENCES `tbl_perumahan` (`kode_perumahan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
