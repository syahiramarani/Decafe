-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Nov 2023 pada 07.39
-- Versi server: 10.6.15-MariaDB-cll-lve
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u837952942_fadlymaulana`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bayar`
--

CREATE TABLE `tb_bayar` (
  `id_bayar` bigint(20) NOT NULL,
  `nominal_bayar` bigint(20) DEFAULT NULL,
  `total_bayar` bigint(20) DEFAULT NULL,
  `waktu_bayar` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_bayar`
--

INSERT INTO `tb_bayar` (`id_bayar`, `nominal_bayar`, `total_bayar`, `waktu_bayar`) VALUES
(2311060508714, 1000000, 16000, '2023-11-11 15:25:32'),
(2311060508717, 16000, 16000, '2023-11-11 23:37:00'),
(2311120637324, 150000, 120000, '2023-11-11 23:40:53'),
(2311120942618, 200000, 158000, '2023-11-12 02:54:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_daftar_menu`
--

CREATE TABLE `tb_daftar_menu` (
  `id` int(11) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `nama_menu` varchar(200) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `kategori` int(11) DEFAULT NULL,
  `harga` varchar(50) DEFAULT NULL,
  `stok` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_daftar_menu`
--

INSERT INTO `tb_daftar_menu` (`id`, `foto`, `nama_menu`, `keterangan`, `kategori`, `harga`, `stok`) VALUES
(1, '1.png', 'Mie Ayam', 'Pedes asli dari Aceh', 4, '5000', '8'),
(2, '2.png', 'Burger', 'Pakai kejudan beragam varian', 4, '4000', '12'),
(3, '3.png', 'Kari Kambing', 'Daging asli dari etawa', 2, '2000', '10'),
(4, '4.png', 'Kopi Sanger', 'Dingin/panas', 1, '3000', '4'),
(5, '5.png', 'S Timun', ' Cocok saat cuaca panas', 3, '4000', '12'),
(6, '6.png', 'Mie Udang', 'Sedap dan gurih', 1, '5000', '12'),
(7, '7.png', 'Mie Bakso', 'Pedas dan sedap', 4, '10000', '22'),
(8, '8.png', 'Nasi Uduk', 'Gurih dan lezat', 3, '8000', '18'),
(9, '9.png', 'Lontong Mak Cik', 'Lontong yang sangat gurih', 3, '6000', '15'),
(10, '10.png', 'Teh', 'Panas/dingin', 1, '5000', '12'),
(11, '11.png', 'S Boba', 'Dengan single shot espreso dipadukan dengan susu steam dan boba terciptalah menu yang jos', 2, '8000', '22'),
(12, '12.png', 'Jus Mangga', 'Segar', 2, '6000', '18'),
(13, '13.png', 'Jus Jeruk', 'Segar', 2, '6000', '17'),
(14, '14.png', 'Kepiting Saus Tiram', 'Kepiting lvl 5', 4, '20000', '15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori_menu`
--

CREATE TABLE `tb_kategori_menu` (
  `id_kat_menu` int(11) NOT NULL,
  `jenis_menu` int(11) DEFAULT NULL,
  `kategori_menu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kategori_menu`
--

INSERT INTO `tb_kategori_menu` (`id_kat_menu`, `jenis_menu`, `kategori_menu`) VALUES
(1, 2, 'Kopi'),
(2, 2, 'Juz'),
(3, 1, 'Nasi'),
(4, 1, 'Snack');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_list_order`
--

CREATE TABLE `tb_list_order` (
  `id_list_order` int(11) NOT NULL,
  `menu` int(11) DEFAULT NULL,
  `kode_order` bigint(20) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `catatan` varchar(300) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_list_order`
--

INSERT INTO `tb_list_order` (`id_list_order`, `menu`, `kode_order`, `jumlah`, `catatan`, `status`) VALUES
(1, 2, 2311060508714, 4, '', 2),
(2, 5, 2311060508717, 4, 'Dingin', 2),
(3, 1, 2311120637324, 8, 'Pedas', 2),
(4, 10, 2311120637324, 4, 'Dingin', 2),
(5, 7, 2311120637324, 6, 'Pedas', 2),
(7, 3, 2311060510641, 5, 'Banyak Daging', 1),
(8, 4, 2311060510641, 4, 'Dingin', 1),
(9, 5, 2311060510641, 2, 'Dingin', NULL),
(10, 6, 2311120937392, 2, 'Banyak Kuah', NULL),
(11, 13, 2311120937392, 7, 'Dingin', NULL),
(12, 14, 2311120937392, 3, 'Kecapnya banyak ok', NULL),
(13, 12, 2311120937392, 5, 'Dingin', 1),
(14, 11, 2311120942618, 6, 'Banyak S nya', 1),
(15, 9, 2311120942618, 5, 'Pedas ', 1),
(16, 8, 2311120942618, 10, 'Panas', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` bigint(20) NOT NULL DEFAULT 0,
  `pelanggan` varchar(200) DEFAULT NULL,
  `meja` int(11) DEFAULT NULL,
  `pelayan` int(11) DEFAULT NULL,
  `waktu_order` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_order`
--

INSERT INTO `tb_order` (`id_order`, `pelanggan`, `meja`, `pelayan`, `waktu_order`) VALUES
(2311060508714, 'ani', 1, 1, '2023-11-05 22:08:41'),
(2311060508717, 'beala', 2, 1, '2023-11-05 22:09:04'),
(2311060509141, 'cipa', 3, 1, '2023-11-05 22:09:29'),
(2311060509258, 'andi', 5, 1, '2023-11-05 22:09:56'),
(2311060510641, 'budi', 5, 1, '2023-11-05 22:10:14'),
(2311120637324, 'Udin', 7, 1, '2023-11-11 23:39:15'),
(2311120937392, 'Agus', 14, 4, '2023-11-12 02:38:33'),
(2311120942618, 'Ika', 23, 4, '2023-11-12 02:42:42'),
(2311121009607, 'Rija', 8, 1, '2023-11-12 03:45:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `nohp` varchar(15) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `level`, `nohp`, `alamat`) VALUES
(1, 'owner', 'admin@admin.com', '5f4dcc3b5aa765d61d8327deb882cf99', 1, '089561728910', 'lhokseumawe'),
(2, 'kasir', 'kasir@cafe.com', '5f4dcc3b5aa765d61d8327deb882cf99', 2, '089561728910', 'lhokseumawe'),
(3, 'dapur', 'dapur@cafe.com', '5f4dcc3b5aa765d61d8327deb882cf99', 4, '089561728910', 'lhokseumawe'),
(4, 'pelayan', 'pelayan@cafe.com', '5f4dcc3b5aa765d61d8327deb882cf99', 3, '089561728910', 'Lhokseumawe\r\n');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_bayar`
--
ALTER TABLE `tb_bayar`
  ADD PRIMARY KEY (`id_bayar`);

--
-- Indeks untuk tabel `tb_daftar_menu`
--
ALTER TABLE `tb_daftar_menu`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_tb_daftar_menu_tb_kategori_menu` (`kategori`) USING BTREE;

--
-- Indeks untuk tabel `tb_kategori_menu`
--
ALTER TABLE `tb_kategori_menu`
  ADD PRIMARY KEY (`id_kat_menu`) USING BTREE;

--
-- Indeks untuk tabel `tb_list_order`
--
ALTER TABLE `tb_list_order`
  ADD PRIMARY KEY (`id_list_order`) USING BTREE,
  ADD KEY `menu` (`menu`),
  ADD KEY `order` (`kode_order`) USING BTREE;

--
-- Indeks untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`) USING BTREE,
  ADD KEY `pelayan` (`pelayan`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_daftar_menu`
--
ALTER TABLE `tb_daftar_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori_menu`
--
ALTER TABLE `tb_kategori_menu`
  MODIFY `id_kat_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_list_order`
--
ALTER TABLE `tb_list_order`
  MODIFY `id_list_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_daftar_menu`
--
ALTER TABLE `tb_daftar_menu`
  ADD CONSTRAINT `FK_tb_daftar_menu_tb_kategori_menu` FOREIGN KEY (`kategori`) REFERENCES `tb_kategori_menu` (`id_kat_menu`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_list_order`
--
ALTER TABLE `tb_list_order`
  ADD CONSTRAINT `FK_tb_list_order_tb_daftar_menu` FOREIGN KEY (`menu`) REFERENCES `tb_daftar_menu` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tb_list_order_tb_order` FOREIGN KEY (`kode_order`) REFERENCES `tb_order` (`id_order`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `FK_tb_order_tb_user` FOREIGN KEY (`pelayan`) REFERENCES `tb_user` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
