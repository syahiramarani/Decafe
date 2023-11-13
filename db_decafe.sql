-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table db_decafe.tb_bayar
CREATE TABLE IF NOT EXISTS `tb_bayar` (
  `id_bayar` bigint NOT NULL,
  `nominal_bayar` bigint DEFAULT NULL,
  `total_bayar` bigint DEFAULT NULL,
  `waktu_bayar` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_bayar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_decafe.tb_bayar: ~6 rows (approximately)
INSERT INTO `tb_bayar` (`id_bayar`, `nominal_bayar`, `total_bayar`, `waktu_bayar`) VALUES
	(2311101829134, 200000, 196000, '2023-11-11 07:49:03'),
	(2311101830432, 8000000, 300000, '2023-11-11 01:29:18'),
	(2311101838709, 80000, 75000, '2023-11-11 01:32:29'),
	(2311102242535, 20000, 18000, '2023-11-11 01:44:34'),
	(2311110901143, 60000, 50000, '2023-11-11 02:02:53'),
	(2311111441116, 400000000000000, 360000, '2023-11-11 07:44:59'),
	(2311111453496, 304000, 300000, '2023-11-11 12:19:47'),
	(2311121127592, 2000000, 1020000, '2023-11-12 04:28:20');

-- Dumping structure for table db_decafe.tb_daftar_menu
CREATE TABLE IF NOT EXISTS `tb_daftar_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_menu` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kategori` int DEFAULT NULL,
  `harga` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stok` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_tb_daftar_menu_tb_kategori_menu` (`kategori`),
  CONSTRAINT `FK_tb_daftar_menu_tb_kategori_menu` FOREIGN KEY (`kategori`) REFERENCES `tb_kategori_menu` (`id_kat_menu`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_decafe.tb_daftar_menu: ~2 rows (approximately)
INSERT INTO `tb_daftar_menu` (`id`, `foto`, `nama_menu`, `keterangan`, `kategori`, `harga`, `stok`) VALUES
	(24, '48368-1.png', 'Mie aceh', 'Mie Asli Aceh yang menggunggah selera', 1, '25000', '12000'),
	(25, '75475-2.png', 'Burger', 'Burger Enak Dan lezat terbuat dari roti yang berkualitas', 2, '23000', '45000'),
	(26, '47724-10.png', 'Teh herbal', 'Teh herbal terbuat dari daun obat yang bisa menyembuhkan penyakit iri hati', 2, '9000', '10000'),
	(27, '55693-8.png', 'Boba', 'Terbuat dari susu prindapan yang murni dan sehat', 2, '30000', '9');

-- Dumping structure for table db_decafe.tb_kategori_menu
CREATE TABLE IF NOT EXISTS `tb_kategori_menu` (
  `id_kat_menu` int NOT NULL AUTO_INCREMENT,
  `jenis_menu` int DEFAULT NULL,
  `kategori_menu` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_kat_menu`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_decafe.tb_kategori_menu: ~3 rows (approximately)
INSERT INTO `tb_kategori_menu` (`id_kat_menu`, `jenis_menu`, `kategori_menu`) VALUES
	(1, 1, 'Nasi minang'),
	(2, 2, 'Kopi'),
	(3, 2, 'jus');

-- Dumping structure for table db_decafe.tb_list_order
CREATE TABLE IF NOT EXISTS `tb_list_order` (
  `id_list_order` int NOT NULL AUTO_INCREMENT,
  `menu` int DEFAULT NULL,
  `kode_order` bigint DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `catatan` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_list_order`),
  KEY `menu` (`menu`),
  KEY `order` (`kode_order`) USING BTREE,
  CONSTRAINT `FK_tb_list_order_tb_daftar_menu` FOREIGN KEY (`menu`) REFERENCES `tb_daftar_menu` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_list_order_tb_order` FOREIGN KEY (`kode_order`) REFERENCES `tb_order` (`id_order`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_decafe.tb_list_order: ~9 rows (approximately)
INSERT INTO `tb_list_order` (`id_list_order`, `menu`, `kode_order`, `jumlah`, `catatan`, `status`) VALUES
	(1, 24, 2311101838709, 3, '', 2),
	(3, 26, 2311101829134, 9, 'enak bingit', 2),
	(5, 24, 2311101830432, 12, '', 2),
	(6, 26, 2311102242535, 2, 'cocok', 2),
	(7, 24, 2311110901143, 2, 'jangan pedas', 2),
	(8, 25, 2311101829134, 5, 'Suka deh', 2),
	(9, 26, 2311111441116, 15, 'anjay mabar', NULL),
	(10, 24, 2311111441116, 9, 'Suka deh', NULL),
	(12, 24, 2311111453496, 12, 'anjay mabar slebew n', NULL),
	(17, 27, 2311121127592, 34, 'jangan pakai lama', NULL);

-- Dumping structure for table db_decafe.tb_order
CREATE TABLE IF NOT EXISTS `tb_order` (
  `id_order` bigint NOT NULL DEFAULT '0',
  `pelanggan` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `meja` int DEFAULT NULL,
  `pelayan` int DEFAULT NULL,
  `waktu_order` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_order`) USING BTREE,
  KEY `FK_tb_daftar_menu_tb_kategori_menu` (`pelayan`) USING BTREE,
  CONSTRAINT `FK_tb_order_tb_user` FOREIGN KEY (`pelayan`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_decafe.tb_order: ~7 rows (approximately)
INSERT INTO `tb_order` (`id_order`, `pelanggan`, `meja`, `pelayan`, `waktu_order`) VALUES
	(2311101829134, 'mutiasari', 3, 1, '2023-11-10 13:19:23'),
	(2311101830432, 'mariah', 2, 1, '2023-11-10 13:19:33'),
	(2311101838709, 'syahira', 1, 1, '2023-11-10 13:19:42'),
	(2311102242535, 'mulyadi', 5, 1, '2023-11-10 15:42:48'),
	(2311110901143, 'syahril', 4, 1, '2023-11-11 02:02:08'),
	(2311111441116, 'sinta', 8, 1, '2023-11-11 07:42:09'),
	(2311111453496, 'dupir aja lele', 10, 1, '2023-11-11 12:06:18'),
	(2311121127592, 'syahril luan', 5, 1, '2023-11-12 04:27:46');

-- Dumping structure for table db_decafe.tb_user
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `nohp` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_decafe.tb_user: ~7 rows (approximately)
INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `level`, `nohp`, `alamat`) VALUES
	(1, 'sayang bebeb', 'admin@admin.com', '5f4dcc3b5aa765d61d8327deb882cf99', 1, '123456789016', 'muara dua'),
	(2, 'abc2', 'abc2@abc.com', '5f4dcc3b5aa765d61d8327deb882cf99', 3, '123456789011', NULL),
	(4, 'lola', 'lola@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 1, '0859688', 'Cot girek'),
	(5, 'gani', 'gani@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 3, '0835688865', 'medan'),
	(6, 'slebew', 'slebew@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 2, '084311111', 'paya gaboh'),
	(7, 'kilau', 'kilau@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 2, '8744444', 'gunung bromo'),
	(18, 'syarini putri', 'Syarini@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 4, '943111', 'jalan merdeka desa kedondong');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
