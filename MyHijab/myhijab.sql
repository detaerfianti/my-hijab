SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `myhijab`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` int(100) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `nama_image` varchar(50) NOT NULL,
  `type_image` varchar(50) NOT NULL,
  `size_image` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `deskripsi`, `harga`, `stok`, `nama_image`, `type_image`, `size_image`) VALUES
(1, 'Hijab Segiempat Olivia', 50000, 50, '1.png', 'image/png', 534352),
(2, 'Hijab Segiempat Zahra', 50000, 50, '3.png', 'image/png', 475490),
(3, 'Hijab Segiempat Raisa', 50000, 50, '2.png', 'image/png', 516855),
(4, 'Hijab Segiempat Cinta', 50000, 100, '4.png', 'image/png', 543393),
(5, 'Hijab Segiempat Safira', 50000, 50, '5.png', 'image/png', 377830),
(6, 'Hijab Segiempat Anisa', 50000, 100, '6.png', 'image/png', 312361),
(7, 'Pashmina Modern Pink', 75000, 50, '11.png', 'image/png', 415753),
(8, 'Pashmina Modern Abu Tua', 75000, 50, '12.png', 'image/png', 411.838);
-- --------------------------------------------------------

--
-- Table structure for table `tbl_keranjang`
--

CREATE TABLE `tbl_keranjang` (
  `id` int(100) NOT NULL,
  `id_user` int(100) NOT NULL,
  `id_barang` int(100) NOT NULL,
  `qty` int(50) NOT NULL,
  `kurir` varchar(15) NOT NULL,
  `date_in` date NOT NULL,
  `total` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pesanan`
--

CREATE TABLE `tbl_pesanan` (
  `id_pesanan` int(100) NOT NULL,
  `id_user` int(100) NOT NULL,
  `id_barang` int(100) NOT NULL,
  `qty` int(50) NOT NULL,
  `kurir` varchar(15) NOT NULL,
  `date_in` date NOT NULL,
  `total` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pesanan`
--

INSERT INTO `tbl_pesanan` (`id_pesanan`, `id_user`, `id_barang`, `qty`, `kurir`, `date_in`, `total`) VALUES
(16, 4, 5, 1, 'JNE', '2023-03-17', 130000),
(17, 4, 6, 1, 'TIKI', '2023-03-17', 145000),
(19, 2, 8, 2, 'JNE', '2023-03-17', 270000),
(20, 3, 7, 2, 'KILAT', '2023-03-17', 260000),
(21, 5, 7, 3, 'JNE', '2023-03-17', 390000),
(22, 5, 2, 2, 'SICEPAT', '2023-03-17', 270000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id_user` int(100) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(6) NOT NULL,
  `password` varchar(6) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` text NOT NULL,
  `title` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id_user`, `nama_lengkap`, `email`, `username`, `password`, `alamat`, `no_hp`, `title`) VALUES
(1, 'Kelompok 5', 'kelompok5@gmail.com', 'kel5', 'admin', 'Jl. Utama no. 5', '082248080870', 'admin'),
(2, 'Intan Adriana', 'intan@gmail.com', 'Intan', 'intan123', 'Jl. Merdeka', '081344460967', 'user'),
(3, 'Ratih Puspa', 'ratih@gmail.com', 'Ratih', 'ratih999', 'Jl. Mawar', '088008800880', 'user'),
(4, 'Tika', 'tika@gmail.com', 'Tika', 'tika123', 'Jl. Merdeka Barat', '085244746050', 'user'),
(5, 'Azzahra', 'zahra@gmail.com', 'Zahra', 'zahra555', 'Jl. Jambu Merah', '085244746050', 'user'),
(6, 'Syaira', 'syaira@gmail.com', 'Syaira30', 'syaira123', 'Jl. Selatan', '083344556677', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id_barang` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  MODIFY `id_pesanan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id_user` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;