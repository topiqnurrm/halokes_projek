-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2024 at 08:32 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_santri`
--

-- --------------------------------------------------------

--
-- Table structure for table `abdi`
--

CREATE TABLE `abdi` (
  `id_abdi` int(4) NOT NULL,
  `id_guru` char(4) NOT NULL,
  `id_masjid` char(4) NOT NULL,
  `tg_mulai` date NOT NULL,
  `tgl_berhenti` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abdi`
--

INSERT INTO `abdi` (`id_abdi`, `id_guru`, `id_masjid`, `tg_mulai`, `tgl_berhenti`) VALUES
(1, 'G001', 'M001', '2019-01-01', NULL),
(2, 'G002', 'M001', '1998-01-01', NULL),
(3, 'G003', 'M001', '2021-01-01', NULL),
(4, 'G004', 'M001', '2017-01-01', NULL),
(5, 'G005', 'M001', '2020-01-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aset`
--

CREATE TABLE `aset` (
  `id_aset` char(4) NOT NULL,
  `id_masjid` char(4) NOT NULL,
  `id_kitab` char(4) NOT NULL,
  `jumlah` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aset`
--

INSERT INTO `aset` (`id_aset`, `id_masjid`, `id_kitab`, `jumlah`) VALUES
('A001', 'M001', 'K001', 5),
('A002', 'M001', 'K002', 10),
('A003', 'M001', 'K003', 8),
('A004', 'M001', 'K004', 15),
('A005', 'M001', 'K005', 20),
('A006', 'M001', 'K006', 8),
('A007', 'M001', 'K007', 15),
('A008', 'M001', 'K008', 20);

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id_guru` char(4) NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `tgl_lahir` date NOT NULL,
  `bidang_ajar` enum('ngaji','fikih','akhlak','silat','tahfiz') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id_guru`, `alamat`, `telepon`, `nama`, `gender`, `tgl_lahir`, `bidang_ajar`) VALUES
('G001', 'Jl. Melati No 15', '08123456789', 'Ustadz Feri', 'L', '1980-05-20', 'ngaji'),
('G002', 'Jl. Teratai No 16', '08223456789', 'Ustadzah Riri', 'P', '1985-03-15', 'akhlak'),
('G003', 'Jl. Anggrek No 30', '08323456789', 'Kyai Ramlan', 'L', '1970-08-11', 'fikih'),
('G004', 'Jl. Melati No 15', '08423456789', 'Ustadz Yusuf', 'L', '1990-04-13', 'tahfiz'),
('G005', 'Jl. Dahlia No 44', '08523456789', 'Ustadzah Lia', 'P', '1988-07-21', 'silat');

-- --------------------------------------------------------

--
-- Table structure for table `hatam`
--

CREATE TABLE `hatam` (
  `id_hatam` char(4) NOT NULL,
  `id_santri` char(4) NOT NULL,
  `id_kitab` char(4) NOT NULL,
  `tgl_hatam` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hatam`
--

INSERT INTO `hatam` (`id_hatam`, `id_santri`, `id_kitab`, `tgl_hatam`) VALUES
('H001', 'S001', 'K001', '2023-01-10'),
('H002', 'S002', 'K002', '2019-01-11'),
('H003', 'S003', 'K003', '2020-01-12'),
('H004', 'S004', 'K004', '2023-08-13'),
('H005', 'S005', 'K005', '2023-11-14'),
('H006', 'S006', 'K006', '2014-01-15'),
('H007', 'S007', 'K007', '0000-00-00'),
('H008', 'S008', 'K008', '2023-09-17'),
('H009', 'S009', 'K001', '2019-04-18'),
('H010', 'S010', 'K002', '2021-03-19'),
('H011', 'S011', 'K003', '2023-01-20'),
('H012', 'S012', 'K004', '2023-01-21'),
('H013', 'S013', 'K005', '2023-01-22'),
('H014', 'S003', 'K001', '2021-08-17'),
('H015', 'S003', 'K002', '2022-03-22'),
('H016', 'S002', 'K003', '2022-09-30'),
('H024', 'S014', 'K001', '2023-02-27'),
('H025', 'S014', 'K002', '2023-03-05'),
('H026', 'S015', 'K003', '2021-10-17'),
('H027', 'S016', 'K004', '2023-02-13'),
('H028', 'S017', 'K005', '2020-04-14'),
('H029', 'S018', 'K006', '2022-07-28');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` char(4) NOT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `jam_mulai` time NOT NULL,
  `jam_berakhir` time NOT NULL,
  `tgl_jadwal` date NOT NULL,
  `kegiatan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `hari`, `jam_mulai`, `jam_berakhir`, `tgl_jadwal`, `kegiatan`) VALUES
('J001', 'Senin', '15:30:00', '16:30:00', '2023-12-04', 'Ngaji'),
('J002', 'Senin', '16:30:00', '17:30:00', '2023-12-04', 'Fikih'),
('J003', 'Selasa', '15:30:00', '16:30:00', '2023-12-05', 'Ngaji'),
('J004', 'Selasa', '16:30:00', '17:30:00', '2023-12-05', 'Fikih'),
('J005', 'Rabu', '15:30:00', '16:30:00', '2023-12-06', 'Ngaji'),
('J006', 'Rabu', '16:30:00', '17:30:00', '2023-12-06', 'Akhlak'),
('J007', 'Kamis', '15:30:00', '16:30:00', '2023-12-07', 'Ngaji'),
('J008', 'Kamis', '16:30:00', '17:30:00', '2023-12-07', 'Silat'),
('J009', 'Jumat', '15:30:00', '16:30:00', '2023-12-08', 'Ngaji'),
('J010', 'Jumat', '16:30:00', '17:30:00', '2023-12-08', 'Tahfiz');

-- --------------------------------------------------------

--
-- Table structure for table `jamaah`
--

CREATE TABLE `jamaah` (
  `id_jamaah` int(4) NOT NULL,
  `id_santri` char(4) NOT NULL,
  `id_masjid` char(4) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_berhenti` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jamaah`
--

INSERT INTO `jamaah` (`id_jamaah`, `id_santri`, `id_masjid`, `tgl_mulai`, `tgl_berhenti`) VALUES
(1, 'S001', 'M001', '2021-01-01', NULL),
(2, 'S002', 'M001', '2019-01-01', NULL),
(3, 'S003', 'M001', '2019-01-01', NULL),
(4, 'S004', 'M001', '2022-01-01', NULL),
(5, 'S005', 'M001', '2023-01-01', NULL),
(6, 'S006', 'M001', '2020-01-01', NULL),
(7, 'S007', 'M001', '2023-01-01', NULL),
(8, 'S008', 'M001', '2022-01-01', NULL),
(9, 'S009', 'M001', '2019-01-01', NULL),
(10, 'S010', 'M001', '2019-01-01', NULL),
(11, 'S011', 'M001', '2021-01-01', NULL),
(12, 'S012', 'M001', '2021-01-01', NULL),
(13, 'S013', 'M001', '2021-01-01', NULL),
(30, 'S014', 'M002', '2021-09-11', NULL),
(31, 'S015', 'M002', '2020-07-21', NULL),
(32, 'S016', 'M002', '2019-08-20', NULL),
(33, 'S017', 'M002', '2019-09-17', NULL),
(34, 'S018', 'M002', '2016-11-11', NULL),
(35, 'S014', 'M003', '2018-05-15', NULL),
(36, 'S015', 'M003', '2022-01-21', NULL),
(37, 'S016', 'M003', '2023-02-11', NULL),
(38, 'S017', 'M003', '2020-03-31', NULL),
(39, 'S018', 'M003', '2023-03-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kitab`
--

CREATE TABLE `kitab` (
  `id_kitab` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `pengarang` varchar(50) DEFAULT NULL,
  `isi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kitab`
--

INSERT INTO `kitab` (`id_kitab`, `nama`, `pengarang`, `isi`) VALUES
('K001', 'Sunan Ibnu Majah', 'Imam Ibnu Majah', 'Hadits-hadits yang diriwayatkan'),
('K002', 'Sunan Nasai', 'Imam An-Nasa\'i', 'Himpunan hadits'),
('K003', 'Sunan Tirmidzi', 'Imam Tirmidzi', 'Kumpulan hadits sahih'),
('K004', 'Shohih Muslim', 'Imam Muslim', 'Ensiklopedia hadits sahih'),
('K005', 'Shohih Bukhari', 'Imam Bukhari', 'Referensi hadits paling sahih'),
('K006', 'Al-Quran', 'Allah SWT melalui Jibril kepada Nabi Muhammad SAW', 'Kitab suci umat Islam'),
('K007', 'Kitab Mabadi', 'Syaikh Abdul Hamid Hakim', 'Buku dasar-dasar ilmu agama Islam'),
('K008', 'Kitab Nahwu Shorof', 'Imam Ibnu Malik', 'Pembahasan dasar-dasar ilmu Nahwu dan Shorof');

-- --------------------------------------------------------

--
-- Table structure for table `masjid`
--

CREATE TABLE `masjid` (
  `id_masjid` char(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `nama_tpa` varchar(50) DEFAULT NULL,
  `tahun_berdiri` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masjid`
--

INSERT INTO `masjid` (`id_masjid`, `nama`, `alamat`, `nama_tpa`, `tahun_berdiri`) VALUES
('M001', 'At Taqwa', 'Jl. Merdeka No. 10', 'TPA Miftahul Huda', '1990-01-01'),
('M002', 'Darussalam', 'Jl. Diponegoro No. 12', 'TPA An Nur', '2015-01-01'),
('M003', 'Al Ikhlas', 'Jl. Sudirman', 'TPA Assalam', '2022-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `orangtua`
--

CREATE TABLE `orangtua` (
  `id_orangtua` char(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `tgl_lahir` date NOT NULL,
  `gender` enum('L','P') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orangtua`
--

INSERT INTO `orangtua` (`id_orangtua`, `nama`, `alamat`, `telepon`, `tgl_lahir`, `gender`) VALUES
('O001', 'Soleh', 'Jl. Melati No 10', '08123456789', '1970-01-01', 'L'),
('O002', 'Linawati', 'Jl. Anggrek No 11', '08223456789', '1972-03-20', 'P'),
('O003', 'Jajang', 'Jl. Mawar No 12', '08323456789', '1960-08-17', 'L'),
('O004', 'Hasanah', 'Jl. Sedap Malam No 13', '08423456789', '1965-12-10', 'P'),
('O005', 'Sumarni', 'Jl. Kamboja No 14', '08523456789', '1975-09-11', 'P'),
('O006', 'Karman', 'Jl. Tulip No 15', '08623456789', '1963-04-12', 'L'),
('O007', 'Sukma', 'Jl. Melati No 16', '08723456789', '1971-11-23', 'P'),
('O008', 'David', 'Jl. Anggrek No 17', '08813456789', '1977-10-14', 'L'),
('O009', 'Farida', 'Jl. Mawar No 18', '08913456789', '1969-07-15', 'P'),
('O010', 'Jono', 'Jl. Sedap Malam No 19', '08953456789', '1959-03-16', 'L'),
('O011', 'Erik', 'Jl. Merpati No. 20', '08198587422', '1980-06-29', 'L'),
('O012', 'Wati', 'Jl. Kenanga No. 21', '08145632112', '1982-01-03', 'P'),
('O013', 'Agus', 'Jl. Melati No. 40', '08163214578', '1970-02-14', 'L'),
('O014', 'Wira', 'Jl. Melati No. 22', '08134526743', '1975-07-19', 'L'),
('O015', 'Nina', 'Jl. Sulung No. 21', '08129643211', '1981-05-02', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `presensi_guru`
--

CREATE TABLE `presensi_guru` (
  `id_guru` char(4) NOT NULL,
  `id_jadwal` char(4) NOT NULL,
  `kehadiran` enum('hadir','izin','alpa') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `presensi_guru`
--

INSERT INTO `presensi_guru` (`id_guru`, `id_jadwal`, `kehadiran`) VALUES
('G001', 'J001', 'hadir'),
('G001', 'J006', 'hadir'),
('G002', 'J002', 'izin'),
('G002', 'J007', 'izin'),
('G003', 'J003', 'alpa'),
('G003', 'J008', 'hadir'),
('G004', 'J004', 'hadir'),
('G004', 'J009', 'hadir'),
('G005', 'J005', 'hadir'),
('G005', 'J010', 'hadir');

-- --------------------------------------------------------

--
-- Table structure for table `presensi_santri`
--

CREATE TABLE `presensi_santri` (
  `id_santri` char(4) NOT NULL,
  `id_jadwal` char(4) NOT NULL,
  `kehadiran` enum('hadir','izin','alpa') DEFAULT NULL,
  `catatan_belajar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `presensi_santri`
--

INSERT INTO `presensi_santri` (`id_santri`, `id_jadwal`, `kehadiran`, `catatan_belajar`) VALUES
('S001', 'J001', 'hadir', 'Mengaji sampai halaman 500'),
('S001', 'J002', 'hadir', 'Paham materi'),
('S001', 'J003', 'hadir', 'Mengaji lancar'),
('S001', 'J004', 'hadir', 'Membaca lancar'),
('S001', 'J005', 'izin', 'sakit'),
('S001', 'J006', 'hadir', 'Membaca lancar tanpa bimbingan'),
('S001', 'J007', 'hadir', 'Membaca lancar'),
('S001', 'J008', 'hadir', 'Antusias mengikuti'),
('S001', 'J009', 'hadir', 'Menguasai materi'),
('S001', 'J010', 'hadir', 'Membaca lancar'),
('S002', 'J001', 'izin', 'acara keluarga'),
('S002', 'J002', 'hadir', 'Mampu jawab kuis'),
('S002', 'J003', 'alpa', '-'),
('S002', 'J004', 'izin', 'Izin sakit'),
('S002', 'J005', 'hadir', 'evaluasi baik'),
('S002', 'J006', 'hadir', 'Pengetahuan luas'),
('S002', 'J007', 'hadir', 'Hafalan bagus'),
('S002', 'J008', 'hadir', 'Pengetahuan mendalam'),
('S002', 'J009', 'hadir', 'Partisipasi aktif'),
('S002', 'J010', 'hadir', 'Pengetahuan luas'),
('S003', 'J001', 'alpa', 'tanpa keterangan'),
('S003', 'J002', 'izin', 'Izin sakit'),
('S003', 'J003', 'hadir', 'Hafal 1 halaman baru'),
('S003', 'J004', 'hadir', 'Praktek baik'),
('S003', 'J005', 'hadir', 'Tugas tepat waktu'),
('S003', 'J006', 'alpa', '-'),
('S003', 'J007', 'izin', 'Izin sakit'),
('S003', 'J008', 'hadir', 'Partisipasi aktif'),
('S003', 'J009', 'hadir', 'Pemahaman luas'),
('S003', 'J010', 'hadir', 'Pemahaman baik'),
('S004', 'J001', 'hadir', 'belajar di halaman 60'),
('S004', 'J002', 'hadir', 'Mengerjakan tugas'),
('S004', 'J003', 'hadir', 'Bacaan lancar'),
('S004', 'J004', 'hadir', 'Mengikuti pembelajaran'),
('S004', 'J005', 'hadir', 'Mengaji lancar'),
('S004', 'J006', 'hadir', 'Pengetahuan memadai'),
('S004', 'J007', 'hadir', 'Mengerjakan tugas tepat waktu'),
('S004', 'J008', 'alpa', '-'),
('S004', 'J009', 'alpa', '-'),
('S004', 'J010', 'izin', 'Izin'),
('S005', 'J001', 'hadir', 'mengaji sampai halaman 600'),
('S005', 'J002', 'hadir', 'Nilai evaluasi bagus'),
('S005', 'J003', 'hadir', 'Evaluasi baik'),
('S005', 'J004', 'hadir', 'Nilai bagus'),
('S005', 'J005', 'alpa', '-'),
('S005', 'J006', 'izin', 'Sakit'),
('S005', 'J007', 'alpa', '-'),
('S005', 'J008', 'hadir', 'Selalu bertanya'),
('S005', 'J009', 'hadir', 'Pengetahuan memadai'),
('S005', 'J010', 'alpa', '-'),
('S006', 'J001', 'hadir', 'belajar sampai halaman 100'),
('S006', 'J002', 'hadir', 'Mengikuti pembelajaran'),
('S006', 'J003', 'hadir', 'Tugas selesai tepat waktu'),
('S006', 'J004', 'alpa', '-'),
('S006', 'J005', 'hadir', 'Hafalan sempurna'),
('S006', 'J006', 'hadir', 'Bersemangat dalam belajar'),
('S006', 'J007', 'hadir', 'Antusias dalam pembelajaran'),
('S006', 'J008', 'hadir', 'Pengetahuan luas'),
('S006', 'J009', 'hadir', 'Bersemangat belajar'),
('S006', 'J010', 'hadir', 'Partisipasi aktif'),
('S007', 'J001', 'izin', 'Ada urusan sekolah'),
('S007', 'J002', 'alpa', '-'),
('S007', 'J003', 'alpa', '-'),
('S007', 'J004', 'hadir', 'Khat lebih rapih'),
('S007', 'J005', 'hadir', 'Tulisan rapi'),
('S007', 'J006', 'hadir', 'Mampu praktek mandiri'),
('S007', 'J007', 'hadir', 'Praktik memuaskan'),
('S007', 'J008', 'hadir', 'Bersemangat'),
('S007', 'J009', 'hadir', 'Tidak ada kesalahan'),
('S007', 'J010', 'hadir', 'Disiplin'),
('S008', 'J001', 'hadir', 'Aktif dalam pembelajaran silat'),
('S008', 'J002', 'hadir', 'Mengerjakan PR'),
('S008', 'J003', 'izin', 'Keperluan keluarga'),
('S008', 'J004', 'hadir', 'PR selesai'),
('S008', 'J005', 'hadir', 'Baca tanpa bimbingan'),
('S008', 'J006', 'hadir', 'Memiliki pemahaman yang baik'),
('S008', 'J007', 'hadir', 'Mengajukan pertanyaan'),
('S008', 'J008', 'hadir', 'Membaca lancar'),
('S008', 'J009', 'hadir', 'Evaluasi bagus'),
('S008', 'J010', 'hadir', 'Bersemangat'),
('S009', 'J001', 'hadir', 'Mengaji sampai halaman 340'),
('S009', 'J002', 'hadir', 'Paham materi pelajaran'),
('S009', 'J003', 'hadir', 'Sudah dewasa dalam mengaji'),
('S009', 'J004', 'hadir', 'Paham materi'),
('S009', 'J005', 'hadir', 'Presentasi bagus'),
('S009', 'J006', 'hadir', 'Menguasai materi'),
('S009', 'J007', 'hadir', 'Tidak ada kesalahan'),
('S009', 'J008', 'izin', 'Sakit'),
('S009', 'J009', 'izin', 'Izin mendadak'),
('S009', 'J010', 'hadir', 'Tidak ada kesalahan'),
('S010', 'J001', 'hadir', 'Belajar tahfiz di halaman 9'),
('S010', 'J002', 'hadir', 'Mampu praktik sendiri'),
('S010', 'J003', 'hadir', 'Praktik bagus'),
('S010', 'J004', 'hadir', 'Baca tanpa bimbingan'),
('S010', 'J005', 'hadir', 'portofolio bagus'),
('S010', 'J006', 'hadir', 'Partisipasi aktif'),
('S010', 'J007', 'hadir', 'Pengetahuan luas'),
('S010', 'J008', 'hadir', 'Pemahaman baik'),
('S010', 'J009', 'hadir', 'Portofolio lengkap'),
('S010', 'J010', 'hadir', 'Menguasai materi'),
('S011', 'J001', 'hadir', 'Mengaji sampai halaman 13'),
('S011', 'J002', 'izin', 'Izin'),
('S011', 'J003', 'hadir', 'Mengumpulkan tugas'),
('S011', 'J004', 'hadir', 'Praktek memuaskan'),
('S011', 'J005', 'hadir', 'Mengumpulkan tugas'),
('S011', 'J006', 'hadir', 'Antusias mengikuti pelajaran'),
('S011', 'J007', 'hadir', 'Bersemangat belajar'),
('S011', 'J008', 'hadir', 'Disiplin'),
('S011', 'J009', 'hadir', 'Praktik mandiri'),
('S011', 'J010', 'hadir', 'Praktik mandiri'),
('S012', 'J001', 'izin', 'Ada keperluan keluarga'),
('S012', 'J002', 'izin', 'Ada keperluan keluarga'),
('S012', 'J003', 'hadir', 'Mengikuti pembelajaran'),
('S012', 'J004', 'hadir', 'Menghafal baik'),
('S012', 'J005', 'hadir', 'Tidak ada kesalahan'),
('S012', 'J006', 'izin', 'Keperluan keluarga'),
('S012', 'J007', 'izin', 'Izin'),
('S012', 'J008', 'hadir', 'Hafalan sempurna'),
('S012', 'J009', 'hadir', 'Disiplin'),
('S012', 'J010', 'hadir', 'Evaluasi bagus'),
('S013', 'J001', 'alpa', 'Sakit'),
('S013', 'J002', 'hadir', 'Mengerjakan tugas tepat waktu'),
('S013', 'J003', 'alpa', 'Sakit'),
('S013', 'J004', 'izin', 'keperluan mendadak'),
('S013', 'J005', 'izin', 'Izin keperluan keluarga'),
('S013', 'J006', 'hadir', 'Selalu mengajukan pertanyaan'),
('S013', 'J007', 'hadir', 'Pengetahuan memadai'),
('S013', 'J008', 'hadir', 'Praktek mandiri'),
('S013', 'J009', 'hadir', 'Hafalan sempurna'),
('S013', 'J010', 'hadir', 'Hafalan sempurna');

-- --------------------------------------------------------

--
-- Table structure for table `santri`
--

CREATE TABLE `santri` (
  `id_santri` char(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `id_orangtua` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `santri`
--

INSERT INTO `santri` (`id_santri`, `nama`, `tgl_lahir`, `gender`, `alamat`, `id_orangtua`) VALUES
('S001', 'Ahmad', '2000-01-01', 'L', 'Jl. Melati No 10', 'O001'),
('S002', 'Fatimah', '2001-02-02', 'P', 'Jl. Anggrek No 11', 'O002'),
('S003', 'Budi', '2002-03-03', 'L', 'Jl. Mawar No 12', 'O003'),
('S004', 'Dini', '2004-04-04', 'P', 'Jl. Sedap Malam No 13', 'O004'),
('S005', 'Erika', '2003-05-05', 'P', 'Jl. Kamboja No 14', 'O005'),
('S006', 'Fahri', '2005-06-06', 'L', 'Jl. Tulip No 15', 'O006'),
('S007', 'Gilang', '2006-07-07', 'L', 'Jl. Melati No 16', 'O007'),
('S008', 'Hana', '2007-08-08', 'P', 'Jl. Anggrek No 17', 'O008'),
('S009', 'Iqbal', '2008-09-09', 'L', 'Jl. Mawar No 18', 'O009'),
('S010', 'Joni', '2009-10-10', 'L', 'Jl. Sedap Malam No 19', 'O010'),
('S011', 'santiho', '2004-08-06', 'L', 'Jl. Melati No 10', 'O001'),
('S012', 'roky', '2004-07-05', 'L', 'Jl. Wahid Hasyim No 5', 'O002'),
('S013', 'sibung', '2007-07-05', 'L', 'Jl. Melati No 10', 'O001'),
('S014', 'Adit', '2004-06-12', 'L', 'Jl. Merpati No 20', 'O011'),
('S015', 'Fiera', '2008-02-16', 'P', 'Jl. Kenanga No 21', 'O012'),
('S016', 'Bagus', '2002-01-23', 'L', 'Jl. Melati No 15', 'O013'),
('S017', 'Dara', '2001-08-30', 'P', 'Jl. Melati No 22', 'O014'),
('S018', 'Ella', '2009-09-01', 'P', 'Jl. Sulung No 21', 'O015');

-- --------------------------------------------------------

--
-- Table structure for table `tempat`
--

CREATE TABLE `tempat` (
  `id_tempat` char(4) NOT NULL,
  `bangunan` varchar(20) NOT NULL,
  `ruangan` varchar(20) NOT NULL,
  `id_jadwal` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tempat`
--

INSERT INTO `tempat` (`id_tempat`, `bangunan`, `ruangan`, `id_jadwal`) VALUES
('T001', 'Gedung A', 'Ruangan 101', 'J001'),
('T002', 'Gedung A', 'Ruangan 102', 'J002'),
('T003', 'Gedung A', 'Ruangan 103', 'J003'),
('T004', 'Gedung B', 'Ruangan 204', 'J004'),
('T005', 'Gedung B', 'Ruangan 205', 'J005'),
('T006', 'Gedung A', 'Ruangan 101', 'J006'),
('T007', 'Gedung A', 'Ruangan 102', 'J007'),
('T008', 'Gedung B', 'Ruangan 203', 'J008'),
('T009', 'Gedung B', 'Ruangan 204', 'J009'),
('T010', 'Gedung B', 'Ruangan 205', 'J010');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abdi`
--
ALTER TABLE `abdi`
  ADD PRIMARY KEY (`id_abdi`),
  ADD KEY `fk_abdi_masjid` (`id_masjid`),
  ADD KEY `fk_abdi_guru` (`id_guru`);

--
-- Indexes for table `aset`
--
ALTER TABLE `aset`
  ADD PRIMARY KEY (`id_aset`),
  ADD KEY `aset_masjid` (`id_masjid`),
  ADD KEY `aset_kitab` (`id_kitab`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `hatam`
--
ALTER TABLE `hatam`
  ADD PRIMARY KEY (`id_hatam`),
  ADD KEY `hatam_santri` (`id_santri`),
  ADD KEY `hatam_kitab` (`id_kitab`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `jamaah`
--
ALTER TABLE `jamaah`
  ADD PRIMARY KEY (`id_jamaah`),
  ADD KEY `fk_jamaah_santri` (`id_santri`),
  ADD KEY `fk_jamaah_masjid` (`id_masjid`);

--
-- Indexes for table `kitab`
--
ALTER TABLE `kitab`
  ADD PRIMARY KEY (`id_kitab`);

--
-- Indexes for table `masjid`
--
ALTER TABLE `masjid`
  ADD PRIMARY KEY (`id_masjid`);

--
-- Indexes for table `orangtua`
--
ALTER TABLE `orangtua`
  ADD PRIMARY KEY (`id_orangtua`);

--
-- Indexes for table `presensi_guru`
--
ALTER TABLE `presensi_guru`
  ADD PRIMARY KEY (`id_guru`,`id_jadwal`),
  ADD KEY `fk_presensi_guru_jadwal` (`id_jadwal`);

--
-- Indexes for table `presensi_santri`
--
ALTER TABLE `presensi_santri`
  ADD PRIMARY KEY (`id_santri`,`id_jadwal`),
  ADD KEY `presensi_santri_jadwal` (`id_jadwal`);

--
-- Indexes for table `santri`
--
ALTER TABLE `santri`
  ADD PRIMARY KEY (`id_santri`),
  ADD KEY `fk_santri_orangtua` (`id_orangtua`);

--
-- Indexes for table `tempat`
--
ALTER TABLE `tempat`
  ADD PRIMARY KEY (`id_tempat`),
  ADD KEY `fk_tempat_jadwal` (`id_jadwal`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abdi`
--
ALTER TABLE `abdi`
  ADD CONSTRAINT `fk_abdi_guru` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_abdi_masjid` FOREIGN KEY (`id_masjid`) REFERENCES `masjid` (`id_masjid`) ON UPDATE CASCADE;

--
-- Constraints for table `aset`
--
ALTER TABLE `aset`
  ADD CONSTRAINT `aset_kitab` FOREIGN KEY (`id_kitab`) REFERENCES `kitab` (`id_kitab`) ON UPDATE CASCADE,
  ADD CONSTRAINT `aset_masjid` FOREIGN KEY (`id_masjid`) REFERENCES `masjid` (`id_masjid`) ON UPDATE CASCADE;

--
-- Constraints for table `hatam`
--
ALTER TABLE `hatam`
  ADD CONSTRAINT `hatam_kitab` FOREIGN KEY (`id_kitab`) REFERENCES `kitab` (`id_kitab`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hatam_santri` FOREIGN KEY (`id_santri`) REFERENCES `santri` (`id_santri`) ON UPDATE CASCADE;

--
-- Constraints for table `jamaah`
--
ALTER TABLE `jamaah`
  ADD CONSTRAINT `fk_jamaah_masjid` FOREIGN KEY (`id_masjid`) REFERENCES `masjid` (`id_masjid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jamaah_santri` FOREIGN KEY (`id_santri`) REFERENCES `santri` (`id_santri`) ON UPDATE CASCADE;

--
-- Constraints for table `presensi_guru`
--
ALTER TABLE `presensi_guru`
  ADD CONSTRAINT `fk_presensi_guru_guru` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_presensi_guru_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON UPDATE CASCADE;

--
-- Constraints for table `presensi_santri`
--
ALTER TABLE `presensi_santri`
  ADD CONSTRAINT `presensi_santri_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `presensi_santri_santri` FOREIGN KEY (`id_santri`) REFERENCES `santri` (`id_santri`) ON UPDATE CASCADE;

--
-- Constraints for table `santri`
--
ALTER TABLE `santri`
  ADD CONSTRAINT `fk_santri_orangtua` FOREIGN KEY (`id_orangtua`) REFERENCES `orangtua` (`id_orangtua`) ON UPDATE CASCADE;

--
-- Constraints for table `tempat`
--
ALTER TABLE `tempat`
  ADD CONSTRAINT `fk_tempat_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
