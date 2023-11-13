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

-- Dumping structure for table decafe.tb_bayar
CREATE TABLE IF NOT EXISTS `tb_bayar` (
  `id_bayar` bigint NOT NULL,
  `nominal_bayar` bigint DEFAULT NULL,
  `total_bayar` bigint DEFAULT NULL,
  `waktu_bayar` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_bayar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table decafe.tb_bayar: ~4 rows (approximately)
INSERT INTO `tb_bayar` (`id_bayar`, `nominal_bayar`, `total_bayar`, `waktu_bayar`) VALUES
	(2311060508714, 1000000, 16000, '2023-11-11 15:25:32'),
	(2311060508717, 16000, 16000, '2023-11-11 23:37:00'),
	(2311120637324, 150000, 120000, '2023-11-11 23:40:53'),
	(2311120942618, 200000, 158000, '2023-11-12 02:54:13');

-- Dumping structure for table decafe.tb_daftar_menu
CREATE TABLE IF NOT EXISTS `tb_daftar_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foto` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_menu` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kategori` int DEFAULT NULL,
  `harga` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stok` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_tb_daftar_menu_tb_kategori_menu` (`kategori`) USING BTREE,
  CONSTRAINT `FK_tb_daftar_menu_tb_kategori_menu` FOREIGN KEY (`kategori`) REFERENCES `tb_kategori_menu` (`id_kat_menu`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table decafe.tb_daftar_menu: ~14 rows (approximately)
INSERT INTO `tb_daftar_menu` (`id`, `foto`, `nama_menu`, `keterangan`, `kategori`, `harga`, `stok`) VALUES
	(1, '1.png', 'Mie Ayam', 'Pedes asli dari Aceh', 4, '5000', '8'),
	(2, '2.png', 'Burger', 'Pakai kejudan beragam varian', 4, '4000', '12'),
	(3, '3.png', 'Kari Kambing', 'Daging asli dari etawa', 2, '2000', '10'),
	(4, '67751-8.png', '  Kopi Sanger', '  Dingin/panas', 1, '15000', '30'),
	(5, '5.png', 'S Timun', ' Cocok saat cuaca panas', 3, '4000', '12'),
	(6, '6.png', 'Mie Udang', 'Sedap dan gurih', 1, '5000', '12'),
	(7, '7.png', 'Mie Bakso', 'Pedas dan sedap', 4, '10000', '22'),
	(8, '80737-4.png', '  Nasi Uduk', '  Gurih dan lezat', 3, '5000', '900'),
	(9, '9.png', 'Lontong Mak Cik', 'Lontong yang sangat gurih', 3, '6000', '15'),
	(10, '10.png', 'Teh', 'Panas/dingin', 1, '5000', '12'),
	(11, '11.png', 'S Boba', 'Dengan single shot espreso dipadukan dengan susu steam dan boba terciptalah menu yang jos', 2, '8000', '22'),
	(12, '34118-13.png', ' Jus Mangga', ' segar', 2, '10000', '50'),
	(13, '13.png', 'Jus Jeruk', 'Segar', 2, '6000', '17'),
	(14, '14.png', 'Kepiting Saus Tiram', 'Kepiting lvl 5', 4, '20000', '15'),
	(15, '98700-14.png', 'Kepiting Bali', 'Ahlinya seafood', 4, '45000', '30');

-- Dumping structure for table decafe.tb_kategori_menu
CREATE TABLE IF NOT EXISTS `tb_kategori_menu` (
  `id_kat_menu` int NOT NULL AUTO_INCREMENT,
  `jenis_menu` int DEFAULT NULL,
  `kategori_menu` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_kat_menu`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table decafe.tb_kategori_menu: ~4 rows (approximately)
INSERT INTO `tb_kategori_menu` (`id_kat_menu`, `jenis_menu`, `kategori_menu`) VALUES
	(1, 2, 'Kopi'),
	(2, 2, 'Jus'),
	(3, 1, 'Nasi'),
	(4, 1, 'Snack');

-- Dumping structure for table decafe.tb_list_order
CREATE TABLE IF NOT EXISTS `tb_list_order` (
  `id_list_order` int NOT NULL AUTO_INCREMENT,
  `menu` int DEFAULT NULL,
  `kode_order` bigint DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `catatan` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_list_order`) USING BTREE,
  KEY `menu` (`menu`),
  KEY `order` (`kode_order`) USING BTREE,
  CONSTRAINT `FK_tb_list_order_tb_daftar_menu` FOREIGN KEY (`menu`) REFERENCES `tb_daftar_menu` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_list_order_tb_order` FOREIGN KEY (`kode_order`) REFERENCES `tb_order` (`id_order`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table decafe.tb_list_order: ~15 rows (approximately)
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

-- Dumping structure for table decafe.tb_order
CREATE TABLE IF NOT EXISTS `tb_order` (
  `id_order` bigint NOT NULL DEFAULT '0',
  `pelanggan` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `meja` int DEFAULT NULL,
  `pelayan` int DEFAULT NULL,
  `waktu_order` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_order`) USING BTREE,
  KEY `pelayan` (`pelayan`),
  CONSTRAINT `FK_tb_order_tb_user` FOREIGN KEY (`pelayan`) REFERENCES `tb_user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table decafe.tb_order: ~0 rows (approximately)
INSERT INTO `tb_order` (`id_order`, `pelanggan`, `meja`, `pelayan`, `waktu_order`) VALUES
	(2311060508714, 'anisa putri', 1, 1, '2023-11-13 02:09:02'),
	(2311060508717, 'latucorsina', 2, 1, '2023-11-13 02:09:08'),
	(2311060509141, 'lupi', 3, 1, '2023-11-13 02:09:11'),
	(2311060509258, 'safira', 5, 1, '2023-11-13 02:09:15'),
	(2311060510641, 'srimutia', 5, 1, '2023-11-13 02:09:18'),
	(2311120637324, 'syahira', 7, 1, '2023-11-13 02:09:21'),
	(2311120937392, 'setiawan', 14, 4, '2023-11-13 02:09:26'),
	(2311120942618, 'gani', 23, 4, '2023-11-13 02:09:29'),
	(2311121009607, 'sarah', 8, 1, '2023-11-13 02:09:36');

-- Dumping structure for table decafe.tb_user
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `nohp` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table decafe.tb_user: ~4 rows (approximately)
INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `level`, `nohp`, `alamat`) VALUES
	(1, 'owner', 'admin@admin.com', '5f4dcc3b5aa765d61d8327deb882cf99', 1, '089561728910', 'lhokseumawe'),
	(2, 'kasir', 'kasir@cafe.com', '5f4dcc3b5aa765d61d8327deb882cf99', 2, '089561728910', 'lhokseumawe'),
	(3, 'dapur', 'dapur@cafe.com', '5f4dcc3b5aa765d61d8327deb882cf99', 4, '089561728910', 'lhokseumawe'),
	(4, 'pelayan', 'pelayan@cafe.com', '5f4dcc3b5aa765d61d8327deb882cf99', 3, '089561728910', 'Lhokseumawe\r\n');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
