-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2017 at 01:37 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apiandroidcrud`
--

-- --------------------------------------------------------

--
-- Table structure for table `biodata`
--

CREATE TABLE `biodata` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `biodata`
--

INSERT INTO `biodata` (`id`, `nama`, `alamat`) VALUES
(1, 'Garan Prasasta', 'Ds. Bambu No. 293, Probolinggo 50568, SumUt'),
(2, 'Restu Hani Padmasari', 'Ds. M.T. Haryono No. 65, Kotamobagu 41208, Maluku'),
(3, 'Belinda Mayasari', 'Kpg. Bakau No. 343, Bandung 19015, PapBar'),
(4, 'Silvia Rika Maryati ', 'Jr. Yogyakarta No. 374, Payakumbuh 87129, SulBar'),
(5, 'Panji Kusuma Pradana', 'Jln. Laswi No. 812, Mataram 57948, Gorontalo'),
(6, 'Darmana Pradipta M.K', 'Gg. Babakan No. 426, Cirebon 36259, SumUt'),
(7, 'Karimah Pudjiastuti', 'Jr. Umalas No. 743, Pematangsiantar 41054, KalTim'),
(8, 'Lantar Mariadi Megan', 'Ki. Cemara No. 827, Langsa 75891, Banten'),
(9, 'Caraka Prabowo', 'Jln. Casablanca No. 841, Palu 23412, Banten'),
(10, 'Mahbub Furniture', 'Gg. Eka No. 201, Lhokseumawe 58935, JaTim'),
(11, 'andis', 'tekeyan'),
(12, 'qanita', 'mlonggo'),
(13, 'OK ', 'Wes '),
(14, 'Mahfud Firgantoro', 'Dk. Banda No. 368, Semarang 11995, KalTeng'),
(15, 'Daru Wibisono', 'Ki. Tangkuban Perahu No. 75, Tanjung Pinang 46353, MalUt'),
(16, 'Salimah Kusmawati', 'Kpg. Ikan No. 972, Tangerang Selatan 97838, Papua'),
(17, 'Among Sitompul', 'Jln. BKR No. 136, Palangka Raya 45305, DIY'),
(18, 'Dimas Anggriawan', 'Ds. Basuki No. 914, Tangerang 71464, KalBar'),
(19, 'Maras Gaiman Waskita', 'Ds. Kiaracondong No. 548, Administrasi Jakarta Timur 19395, Aceh'),
(20, 'Qori Suartini', 'Jr. Baha No. 967, Bekasi 12517, Riau'),
(21, 'Zelda Suartini', 'Jln. Yogyakarta No. 422, Semarang 63925, SulUt'),
(22, 'Tomi Maheswara M.Kom', 'Ki. Jakarta No. 340, Cirebon 43778, JaBar'),
(23, 'Puput Sadina Anggrai', 'Psr. Jagakarsa No. 609, Makassar 12355, JaTeng'),
(24, 'Yusuf Lazuardi S.Pt', 'Kpg. Haji No. 582, Mataram 31282, SumUt'),
(25, 'Laras Laksita', 'Jln. Industri No. 990, Bitung 40563, PapBar'),
(26, 'Gasti Ami Mayasari S', 'Jln. Tangkuban Perahu No. 171, Sorong 21316, SulSel'),
(27, 'Ulva Restu Handayani', 'Jln. Haji No. 735, Banda Aceh 34943, Bengkulu'),
(28, 'Luthfi Panji Suryono', 'Psr. Bak Air No. 980, Surabaya 19252, DKI'),
(29, 'Halima Nurdiyanti S.', 'Jln. Camar No. 412, Jambi 36599, JaTeng'),
(30, 'Mutia Lailasari', 'Dk. Bappenas No. 3, Tangerang Selatan 26404, DKI'),
(31, 'Prayitna Iswahyudi', 'Kpg. Adisucipto No. 753, Banjarmasin 98240, BaBel'),
(32, 'Zulfa Tira Suryatmi ', 'Dk. Adisucipto No. 44, Tarakan 66092, Bali'),
(33, 'Erik Wacana', 'Gg. Baranang Siang No. 332, Magelang 88139, Banten'),
(34, 'Uchita Purnawati M.T', 'Ds. Banal No. 54, Administrasi Jakarta Barat 75398, KepR'),
(35, 'Sakti Cayadi Hutapea', 'Jr. Salatiga No. 221, Serang 78136, Lampung'),
(36, 'Yance Prastuti', 'Jln. Banda No. 627, Pekanbaru 33327, JaBar'),
(37, 'Kamila Zelaya Nurain', 'Ki. Wahid Hasyim No. 862, Jambi 54781, Maluku'),
(38, 'Raden Wasita', 'Ds. Antapani Lama No. 100, Pekanbaru 26596, Riau'),
(39, 'Purwanto Simbolon', 'Ds. Yos No. 735, Batu 79108, KalUt'),
(40, 'Bajragin Suwarno', 'Psr. Bak Air No. 256, Tanjung Pinang 36982, NTB'),
(41, 'Vero Adriansyah', 'Jr. Uluwatu No. 67, Balikpapan 81893, Papua'),
(42, 'Hani Tami Palastri M', 'Dk. Acordion No. 249, Singkawang 85712, SulBar'),
(43, 'Gamanto Digdaya Iswa', 'Gg. Industri No. 199, Tebing Tinggi 94267, SulBar'),
(44, 'Atmaja Mansur', 'Gg. W.R. Supratman No. 687, Tual 24230, JaTeng'),
(45, 'Jefri Hutagalung', 'Dk. Teuku Umar No. 628, Payakumbuh 17783, KalTeng'),
(46, 'Eja Ibun Tampubolon ', 'Kpg. Imam No. 215, Kupang 92442, DKI'),
(47, 'Hardi Sihombing', 'Kpg. Casablanca No. 451, Gorontalo 31334, KalTeng'),
(48, 'Lala Umi Riyanti', 'Dk. Jaksa No. 498, Ternate 32798, KepR'),
(49, 'Raina Hastuti', 'Ds. Villa No. 355, Administrasi Jakarta Timur 65462, Aceh'),
(50, 'Azalea Pratiwi', 'Psr. Abdul. Muis No. 238, Pekalongan 46849, JaTim'),
(51, 'Fathonah Suci Maryat', 'Psr. Badak No. 783, Depok 15105, SulSel'),
(52, 'Tomi Tamba S.IP', 'Ds. Wahid Hasyim No. 385, Tarakan 52096, Bali'),
(53, 'Opung Dipa Hutasoit ', 'Psr. Kalimalang No. 760, Administrasi Jakarta Timur 58057, Aceh'),
(54, 'Genta Ulya Padmasari', 'Psr. Villa No. 978, Kupang 66226, KalTeng'),
(55, 'Patricia Hariyah', 'Jr. Cikapayang No. 733, Bontang 84367, Gorontalo'),
(56, 'Ina Nuraini', 'Psr. Gatot Subroto No. 530, Parepare 37678, NTB'),
(57, 'Amelia Kuswandari', 'Psr. Camar No. 52, Surabaya 68746, JaBar'),
(58, 'Putri Fitriani Winar', 'Ds. Sutarto No. 682, Cilegon 24198, PapBar'),
(59, 'Cornelia Rahmawati M', 'Jr. Sutarto No. 324, Kotamobagu 67018, SumSel'),
(60, 'Lalita Padma Susanti', 'Psr. Antapani Lama No. 626, Pekanbaru 90714, KalSel'),
(61, 'Ian Hakim', 'Ki. Gotong Royong No. 943, Administrasi Jakarta Barat 21609, Maluku'),
(62, 'Umi Rahayu Rahayu', 'Ds. Gajah Mada No. 453, Denpasar 24064, SulUt'),
(63, 'Paramita Susantiiiii', 'Gg. Perintis Kemerdekaan No. 798, Tomohon 80691, PapBar'),
(65, 'Capa Irawan', 'Dk. Flores No. 674, Medan 52209, KepR'),
(66, 'Calista Wastuti M.TI', 'Jr. Tubagus Ismail No. 856, Tual 15828, KalTeng'),
(67, 'Natalia Shakila Sudi', 'Ki. Barasak No. 559, Bekasi 92508, KalUt'),
(68, 'Ade Sudiati M.M.', 'Psr. Ters. Jakarta No. 63, Surakarta 60401, DIY'),
(69, 'Amalia Purnawati', 'Gg. Thamrin No. 674, Kotamobagu 33706, SulTra'),
(70, 'Najwa Mardhiyah', 'Jr. Banda No. 158, Pasuruan 58169, SumBar'),
(71, 'Cakrabuana Wibisono', 'Dk. Siliwangi No. 275, Depok 64889, JaBar'),
(72, 'Ratna Rahayu Usamah', 'Kpg. Jend. Sudirman No. 974, Administrasi Jakarta Barat 25809, JaTeng'),
(73, 'Novi Nurdiyanti', 'Jln. Basoka No. 451, Kendari 30386, JaBar'),
(74, 'Mala Ika Wijayanti S', 'Kpg. Perintis Kemerdekaan No. 249, Balikpapan 89339, KalTeng');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(23) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `encrypted_password` varchar(80) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `unique_id`, `name`, `email`, `encrypted_password`, `salt`, `created_at`, `updated_at`) VALUES
(1, '59027ea44b00c1.71910494', 'mahbub', 'mahbub@gmail.com', 'S+hOYMeKyPT/pDw4KdzUovfElBsxMDQwZGZmY2E4', '1040dffca8', '2017-04-28 06:28:36', NULL),
(2, '5903a9e15730b7.33103274', 'David', 'amrizakisi@gmail.com', 'pY5VDg+6//94rbKpADcgV1dEhqEwZjdjYmU3ZDc0', '0f7cbe7d74', '2017-04-29 03:45:21', NULL),
(3, '5908397981f147.02959157', 'khanifzyen', 'khanif.zyen@gmail.com', '03SDLkGX4w1sgrn9Vk32U6EVT2Y5YWVkZjBhODJh', '9aedf0a82a', '2017-05-02 14:47:05', NULL),
(4, '591f8eb1d40ca1.30790171', 'Andi', 'a@gmail.com', 'DcO/H199v6ViP8EvmWm39iYhJGU3OGM2YjY0OWFj', '78c6b649ac', '2017-05-20 07:32:49', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`unique_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `biodata`
--
ALTER TABLE `biodata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
