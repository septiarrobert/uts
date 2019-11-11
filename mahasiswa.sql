-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2019 at 03:33 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mahasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) DEFAULT NULL,
  `nim` int(11) DEFAULT NULL,
  `no_hp_lama` varchar(15) DEFAULT NULL,
  `no_hp_baru` varchar(15) DEFAULT NULL,
  `tgl_diubah` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `nim`, `no_hp_lama`, `no_hp_baru`, `tgl_diubah`) VALUES
(4, 2147483647, '2147483647', '2147483647', '2019-10-29 15:03:40'),
(1, 2147483647, '2147483647', '2147483647', '2019-10-29 15:05:59'),
(2, 2147483647, '2147483647', '2147483647', '2019-10-29 15:06:17'),
(3, 2147483647, '818888888', '818888888', '2019-10-29 15:06:41'),
(4, 2147483647, '83333333', '83333333', '2019-10-29 15:07:04'),
(4, 2147483647, '83333333', '83333333', '2019-10-29 15:07:42'),
(4, 2147483647, '833378783', '833378783', '2019-10-29 15:09:30'),
(3, 2147483647, '818888888', '876567875', '2019-10-29 15:23:23'),
(4, 2147483647, '0833375283', '0833376555', '2019-10-29 15:27:13'),
(2, 2147483647, '089653630715', '089653630711', '2019-10-29 15:28:29'),
(1, 2147483647, '081575173500', '0815751738770', '2019-10-29 15:30:34'),
(1, 2147483647, '0815751738770', '0815751738970', '2019-10-29 15:30:43'),
(1, 2147483647, '0815751738970', '0815751738970', '2019-11-08 22:14:54'),
(1, 2147483647, '0815751738970', '0815751738970', '2019-11-08 22:15:02'),
(1, 2147483647, '0815751738970', '0815751738970', '2019-11-08 22:15:50'),
(1, 2147483647, '0815751738970', '0815751738970', '2019-11-08 22:16:11'),
(1, 2147483647, '0815751738970', '0815751738970', '2019-11-08 22:17:38'),
(1, 2147483647, '0815751738970', '0815751738970', '2019-11-08 22:18:39'),
(1, 2147483647, '0815751738970', '0815751738970', '2019-11-08 22:18:46'),
(1, 2147483647, '0815751738970', '0815751738970', '2019-11-08 22:20:58'),
(0, 2147483647, '123456789', '123456789', '2019-11-08 22:27:14'),
(0, 2147483647, '123456789', '123456789', '2019-11-08 22:29:31'),
(1, 2147483647, '0815751738970', '0815751738970', '2019-11-08 22:29:44');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jeniskelamin` varchar(30) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `jeniskelamin`, `alamat`, `no_hp`) VALUES
(0, '161240000533', 'Bos hikam', 'Laki-laki', 'Indonesia', '123456789'),
(1, '161240000509', 'Septiar Robert Islah', 'Perempuan', 'Desa Mambak Kabupaten Jepara', '0815751738970'),
(2, '161240000484', 'Mustofa Kamal Banga', 'L', 'Desa Konoha Kabupaten Jepara', '089653630711'),
(3, '161240000555', 'Muhammad Yusril Rosyadi', 'L', 'Desa Dempet Kabupaten Jepara', '0876567875'),
(4, '161240000438', 'Sigma Lukito ana', 'L', 'Desa Cepogo Kabupaten Jepara', '0833376555'),
(6, '161240000533', 'Bos hikam', 'P', 'Indonesia', '123456789');

--
-- Triggers `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `update_nomor` AFTER UPDATE ON `mahasiswa` FOR EACH ROW BEGIN
    INSERT INTO log
    set id = OLD.id,
    nim = OLD.nim,
    no_hp_lama=OLD.no_hp,
    no_hp_baru=new.no_hp,
    tgl_diubah = NOW(); 
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tampilkan_data`
-- (See below for the actual view)
--
CREATE TABLE `tampilkan_data` (
`id` int(11)
,`nim` varchar(12)
,`nama` varchar(50)
,`jeniskelamin` varchar(30)
,`alamat` varchar(200)
,`no_hp` varchar(15)
);

-- --------------------------------------------------------

--
-- Structure for view `tampilkan_data`
--
DROP TABLE IF EXISTS `tampilkan_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampilkan_data`  AS  select `id` AS `id`,`nim` AS `nim`,`nama` AS `nama`,`jeniskelamin` AS `jeniskelamin`,`alamat` AS `alamat`,`no_hp` AS `no_hp` from `mahasiswa` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
