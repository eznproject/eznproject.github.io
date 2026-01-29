-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2026 at 01:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `survey`
--

-- --------------------------------------------------------

--
-- Table structure for table `survey_questions`
--

CREATE TABLE `survey_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `survey_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `pertanyaan` text NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `placeholder` varchar(255) DEFAULT NULL,
  `help_text` varchar(255) DEFAULT NULL,
  `urutan` int(11) NOT NULL DEFAULT 1,
  `kategori` varchar(255) DEFAULT NULL,
  `conditional_parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `conditional_operator` varchar(255) DEFAULT NULL,
  `conditional_value` varchar(255) DEFAULT NULL,
  `skip_value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `skip_to_kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `survey_questions`
--

INSERT INTO `survey_questions` (`id`, `survey_id`, `section_id`, `kode`, `pertanyaan`, `tipe`, `is_required`, `placeholder`, `help_text`, `urutan`, `kategori`, `conditional_parent_id`, `conditional_operator`, `conditional_value`, `skip_value`, `created_at`, `updated_at`, `skip_to_kategori`) VALUES
(1, 1, 1, NULL, 'Nama Lengkap', 'text', 0, NULL, NULL, 1, 'Data Pribadi', NULL, NULL, NULL, NULL, '2026-01-18 02:23:14', '2026-01-24 11:24:55', NULL),
(2, 1, 1, '', 'No.Telepon/Hp', 'number', 0, '', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 1, '', 'Alamat Email', 'email', 0, 'mahasiswa@example.com', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-24 11:20:52', NULL),
(4, 1, 1, '', 'Alamat Rumah', 'text', 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 1, NULL, 'Jenis Kelamin', 'radio', 0, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, '2026-01-18 03:10:15', '2026-01-18 03:10:15', NULL),
(6, 1, 1, NULL, 'Asal Sekolah', 'text', 0, 'SMA SURABAYA', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2026-01-18 03:10:40', '2026-01-18 03:10:40', NULL),
(7, 1, 1, NULL, 'Program Studi', 'dynamic_select', 0, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, '2026-01-18 03:11:06', '2026-01-18 03:11:06', NULL),
(8, 1, 1, NULL, 'Pekerjaan', 'text', 0, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, '2026-01-18 03:12:09', '2026-01-18 03:12:09', NULL),
(9, 1, 1, NULL, 'Tahun Masuk', 'number', 0, '2018', NULL, 9, NULL, NULL, NULL, NULL, NULL, '2026-01-18 03:15:14', '2026-01-18 03:15:14', NULL),
(10, 1, 1, NULL, 'Tahun Lulus', 'number', 0, '2023', NULL, 10, NULL, NULL, NULL, NULL, NULL, '2026-01-18 03:15:34', '2026-01-18 03:15:42', NULL),
(11, 1, 1, NULL, 'Media Sosial (Facebook)', 'text', 0, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, '2026-01-18 03:16:04', '2026-01-18 03:16:04', NULL),
(12, 1, 1, NULL, 'Media Sosial (Instagram)', 'text', 0, NULL, 'Contoh : instagram.com/indira', 12, NULL, NULL, NULL, NULL, NULL, '2026-01-18 03:16:28', '2026-01-18 03:16:28', NULL),
(13, 1, 1, NULL, 'Media Sosial (Linkedin)', 'text', 0, 'id.linkedin.com/in/indira', NULL, 13, NULL, NULL, NULL, NULL, NULL, '2026-01-18 03:17:27', '2026-01-18 03:17:27', NULL),
(14, 1, 3, 'Q1', 'Kapan Anda mulai mencari pekerjaan? (Pekerjaan sambilan tidak termasuk)', 'radio', 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'tidak', NULL, '2026-01-24 10:37:28', 'pekerjaan'),
(15, 1, 3, 'Q1A', 'Berapa bulan sebelum lulus Anda mulai mencari pekerjaan?', 'number', 0, 'Jumlah bulan', NULL, 2, 'pekerjaan', 14, NULL, 'sebelum', NULL, NULL, NULL, NULL),
(16, 1, 3, 'Q1B', 'Berapa bulan sesudah lulus Anda mulai mencari pekerjaan?', 'number', 0, 'Jumlah bulan', NULL, 3, 'pekerjaan', 14, NULL, 'sesudah', NULL, NULL, NULL, NULL),
(17, 1, 3, 'Q2', 'Bagaimana anda mencari pekerjaan setelah lulus? Jawaban bisa lebih dari satu', 'checkbox', 1, NULL, NULL, 4, 'pekerjaan', NULL, NULL, NULL, NULL, '2026-01-21 07:38:06', '2026-01-24 10:37:46', NULL),
(18, 1, 3, 'Q2L', ' ', 'text', 0, NULL, NULL, 5, 'pekerjaan', 17, NULL, 'lain', NULL, '2026-01-21 07:49:47', NULL, NULL),
(19, 1, 3, 'Q3', 'Berapa bulan waktu yang dihabiskan (sebelum dan sesudah kelulusan) untuk memeroleh pekerjaan pertama?', 'radio', 1, NULL, NULL, 6, 'pekerjaan', NULL, NULL, NULL, NULL, '2026-01-21 08:03:17', '2026-01-24 10:38:12', NULL),
(20, 1, 3, 'Q3A', 'Kira-Kira berapa bulan sebelum lulus ujian', 'number', 0, 'Jumlah bulan', NULL, 7, 'pekerjaan', 19, NULL, 'sebelum', NULL, '2026-01-21 08:05:55', NULL, NULL),
(21, 1, 3, 'Q3B', 'Kira-kira berapa bulan setelah lulus ujian', 'number', 0, 'Jumlah bulan', NULL, 8, 'pekerjaan', 19, NULL, 'sesudah', NULL, '2026-01-21 08:05:58', NULL, NULL),
(22, 1, 3, 'Q4', 'Berapa perusahaan/instansi/institusi yang sudah anda lamar (lewat surat atau e-mail) sebelum anda memeroleh pekerjaan pertama?', 'number', 1, 'jumlah perusahaan/instansi/institusi', NULL, 9, 'pekerjaan', NULL, NULL, NULL, NULL, '2026-01-21 08:10:41', '2026-01-21 08:12:17', NULL),
(23, 1, 3, 'Q5', 'Berapa banyak perusahaan/instansi/institusi yang merespons lamaran anda?', 'number', 1, 'Jumlah perusahaan/instantsi/institusi', NULL, 10, 'pekerjaan', NULL, NULL, NULL, NULL, '2026-01-21 08:11:18', '2026-01-21 08:12:33', NULL),
(24, 1, 3, 'Q6', 'Berapa banyak perusahaan/instansi/institusi yang mengundang anda untuk wawancara?', 'number', 1, 'berapa perusahaan/instansi/institusi', NULL, 11, 'pekerjaan', NULL, NULL, NULL, NULL, '2026-01-21 08:12:09', '2026-01-21 08:12:09', NULL),
(25, 1, 3, 'Q7', 'Apakah anda bekerja saat ini (termasuk kerja sambilan dan wirausaha)?', 'radio', 0, NULL, NULL, 12, 'sambilan', NULL, NULL, NULL, NULL, '2026-01-21 08:14:16', '2026-01-21 08:14:16', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `survey_questions_survey_id_foreign` (`survey_id`) USING BTREE,
  ADD KEY `survey_questions_section_id_foreign` (`section_id`) USING BTREE,
  ADD KEY `survey_questions_conditional_parent_id_foreign` (`conditional_parent_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `survey_questions`
--
ALTER TABLE `survey_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD CONSTRAINT `survey_questions_conditional_parent_id_foreign` FOREIGN KEY (`conditional_parent_id`) REFERENCES `survey_questions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `survey_questions_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `survey_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `survey_questions_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
