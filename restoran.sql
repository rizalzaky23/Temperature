-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2025 at 02:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `Id_karyawan` char(5) NOT NULL,
  `Nama_lengkap` varchar(100) NOT NULL,
  `Jabatan` varchar(50) DEFAULT NULL,
  `No_Telp` varchar(15) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Tanggal_masuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`Id_karyawan`, `Nama_lengkap`, `Jabatan`, `No_Telp`, `Alamat`, `Tanggal_masuk`) VALUES
('K0001', 'Rina Agustin', 'Manager', '08110011001', 'Jl. Raya Utama No. 1', '2020-05-10'),
('K0002', 'Joko Susilo', 'Kepala Toko', '08110022002', 'Jl. Kemuning 45', '2021-08-20'),
('K0003', 'Lia Handayani', 'Kasir', '08110033003', 'Perum. Hijau Blok A', '2022-01-05'),
('K0004', 'Maman Suryadi', 'Waiter', '08110044004', 'Jl. Anggrek 12', '2023-03-15'),
('K0005', 'Nia Ramadhani', 'Chef', '08110055005', 'Komplek Harapan', '2021-11-25'),
('K0006', 'Bagus Prasetyo', 'Waiter', '08110066006', 'Jl. Veteran No. 7', '2023-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `Id_kategori` char(5) NOT NULL,
  `Nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`Id_kategori`, `Nama_kategori`) VALUES
('KT001', 'Appetizer'),
('KT002', 'Main Course'),
('KT003', 'Dessert'),
('KT004', 'Side Dish'),
('KT005', 'Beverages');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `Id_menu` char(5) NOT NULL,
  `Id_kategori` char(5) NOT NULL,
  `Nama_menu` varchar(100) NOT NULL,
  `Harga` decimal(10,2) NOT NULL,
  `Stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`Id_menu`, `Id_kategori`, `Nama_menu`, `Harga`, `Stok`) VALUES
('M0001', 'KT003', 'Brownies', 45000.00, 25),
('M0002', 'KT003', 'Tiramisu', 55000.00, 30),
('M0003', 'KT004', 'Mashed Potato', 35000.00, 50),
('M0004', 'KT001', 'Calamari', 40000.00, 45),
('M0005', 'KT002', 'Grilled Salmon', 120000.00, 20),
('M0006', 'KT002', 'Wagyu Steak', 250000.00, 30),
('M0007', 'KT005', 'Orange Juice', 35000.00, 100),
('M0008', 'KT005', 'Iced Tea', 25000.00, 90),
('M0009', 'KT002', 'Chicken Katsu', 75000.00, 40),
('M0010', 'KT004', 'Butter Rice', 25000.00, 60),
('M0011', 'KT001', 'Caesar Salad', 50000.00, 20),
('M0012', 'KT005', 'Mineral Water', 10000.00, 100);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `Id_pelanggan` char(5) NOT NULL,
  `Nama_depan` varchar(50) NOT NULL,
  `Nama_belakang` varchar(50) DEFAULT NULL,
  `No_Telp` varchar(15) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`Id_pelanggan`, `Nama_depan`, `Nama_belakang`, `No_Telp`, `Alamat`, `Email`) VALUES
('P0001', 'Budi', 'Santoso', '08112233445', 'Jl. Merdeka No. 10', 'budi.s@mail.com'),
('P0002', 'Ani', 'Wijaya', '08123456789', 'Jl. Sudirman Kav. 5', 'ani.w@mail.com'),
('P0003', 'Citra', 'Dewi', '08567890123', 'Perum. Indah Blok B', 'citra.d@mail.com'),
('P0004', 'Dedi', 'Kusuma', '08778899001', 'Jl. Pahlawan 15', 'dedi.k@mail.com'),
('P0005', 'Eka', 'Fitri', '08990011223', 'Komplek Mawar No. 8', 'eka.f@mail.com'),
('P0006', 'Fajar', 'Nugroho', '08134455667', 'Griya Sentosa Timur', 'fajar.n@mail.com'),
('P0007', 'Gita', 'Lestari', '08225566778', 'Apartemen Tulip Lt. 2', 'gita.l@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `Id_transaksi` char(5) NOT NULL,
  `Id_pelanggan` char(5) NOT NULL,
  `Id_karyawan` char(5) NOT NULL,
  `Id_menu` char(5) NOT NULL,
  `Tanggal_transaksi` datetime NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Total_harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`Id_transaksi`, `Id_pelanggan`, `Id_karyawan`, `Id_menu`, `Tanggal_transaksi`, `Jumlah`, `Total_harga`) VALUES
('T0001', 'P0001', 'K0003', 'M0006', '2024-05-23 19:15:00', 1, 250000.00),
('T0002', 'P0002', 'K0004', 'M0005', '2024-05-23 20:30:00', 1, 120000.00),
('T0003', 'P0003', 'K0003', 'M0007', '2024-05-24 14:00:00', 2, 70000.00),
('T0004', 'P0004', 'K0004', 'M0002', '2024-05-24 13:45:00', 1, 55000.00),
('T0005', 'P0005', 'K0003', 'M0008', '2024-05-24 15:20:00', 3, 75000.00),
('T0006', 'P0006', 'K0004', 'M0004', '2024-05-25 18:30:00', 2, 80000.00),
('T0007', 'P0007', 'K0003', 'M0003', '2024-05-25 12:40:00', 1, 35000.00),
('T0008', 'P0001', 'K0004', 'M0009', '2024-05-26 16:00:00', 1, 75000.00),
('T0009', 'P0002', 'K0003', 'M0001', '2024-05-26 10:00:00', 1, 45000.00),
('T0010', 'P0004', 'K0004', 'M0010', '2024-05-26 14:30:00', 2, 50000.00),
('T0011', 'P0005', 'K0003', 'M0006', '2024-05-27 19:50:00', 1, 250000.00),
('T0012', 'P0006', 'K0004', 'M0011', '2024-05-27 18:00:00', 1, 50000.00),
('T0013', 'P0001', 'K0003', 'M0005', '2024-05-28 12:10:00', 2, 240000.00),
('T0014', 'P0007', 'K0004', 'M0012', '2024-05-28 21:05:00', 4, 40000.00),
('T0015', 'P0003', 'K0003', 'M0002', '2024-05-29 11:45:00', 1, 55000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`Id_karyawan`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`Id_kategori`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`Id_menu`),
  ADD KEY `fk_kategori_menu` (`Id_kategori`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`Id_pelanggan`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`Id_transaksi`),
  ADD KEY `fk_pelanggan_transaksi` (`Id_pelanggan`),
  ADD KEY `fk_karyawan_transaksi` (`Id_karyawan`),
  ADD KEY `fk_menu_transaksi` (`Id_menu`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_kategori_menu` FOREIGN KEY (`Id_kategori`) REFERENCES `kategori` (`Id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_karyawan_transaksi` FOREIGN KEY (`Id_karyawan`) REFERENCES `karyawan` (`Id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menu_transaksi` FOREIGN KEY (`Id_menu`) REFERENCES `menu` (`Id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pelanggan_transaksi` FOREIGN KEY (`Id_pelanggan`) REFERENCES `pelanggan` (`Id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
