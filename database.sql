-- --------------------------------------------------------
-- Máy chủ:                      127.0.0.1
-- Server version:               8.0.34 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Phiên bản:           12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for store
CREATE DATABASE IF NOT EXISTS `store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `store`;

-- Dumping structure for table store.accessory
CREATE TABLE IF NOT EXISTS `accessory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `category_id` int NOT NULL,
  `sold` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK78k22tqvo8w0icau5am8064qr` (`category_id`),
  CONSTRAINT `FK78k22tqvo8w0icau5am8064qr` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table store.accessory: ~27 rows (approximately)
INSERT INTO `accessory` (`id`, `description`, `img_name`, `material`, `name`, `price`, `quantity`, `category_id`, `sold`) VALUES
	(1, 'Một sản phẩm phổ biến và được ưa chuộng trên toàn thế giới. Nó được làm từ vải denim chất lượng cao, có đặc điểm chắc chắn và bền bỉ.	', 'quanjean.jpg', 'demin', 'Jean men', 1.82, 50, 1, 2),
	(2, 'Một sản phẩm phổ biến và được ưa chuộng trên toàn thế giới. Nó được làm từ vải denim chất lượng cao, có đặc điểm chắc chắn và bền bỉ.	', 'quan-jean-nam-10s23dpa001_m_indigo_1__4_jpg.jpg', 'demin', 'Blue Jean', 4.123, 50, 1, 0),
	(3, 'Một sản phẩm phổ biến và được ưa chuộng trên toàn thế giới. Nó được làm từ vải denim chất lượng cao, có đặc điểm chắc chắn và bền bỉ.', 'quan-jean-nam-1010-10f23dpa022_black_1__4_jpg.jpg', 'demin', 'Black Jean', 3, 54, 1, 1),
	(4, 'Áo khoác jeans thường có cổ áo, tay dài và cổ tay có nút cài. Nó là một món đồ thời trang cổ điển và phổ biến.', 'th4.webp', 'vaise', 'denim jacket', 20, 27, 1, 1),
	(7, 'Phối đồ mùa đông nam theo phong cách coolboy', 'hmgoepprod.jpg', 'dlens', 'Black Jacket', 16.82, 111, 5, 3),
	(9, 'For men', 'th9.jpg', 'quasy', 'Blue Vest', 17.8, 25, 3, 1),
	(12, 'Phối đồ mùa hè nam theo phong cách softboy', 'th10.jpg', 'blens', 'Áo gile mỏng', 15.9, 8, 5, 2),
	(13, 'Sneaker Nike Air Max phong cách và thoải mái.', '2.jpg', 'cotton', 'Áo Thun Adidas Originals', 119.99, 20, 2, 0),
	(14, 'Áo Hoodie Puma Essential với chất liệu thoáng khí và thoải mái.', '8.jpg', 'cotton', 'Áo Hoodie Puma Essential', 59.99, 30, 2, 0),
	(15, 'Áo Polo Puma Golf với công nghệ DryCELL giúp kiểm soát độ ẩm.', '11.jpg', 'cotton', 'Áo Polo Puma Golf', 79.99, 25, 2, 0),
	(16, 'Áo Thun Nike Dry Fit với chất liệu thoáng khí và khả năng hút ẩm tốt.', '12.jpg', 'cotton', 'Áo Thun Nike Dry Fit', 45.99, 35, 2, 0),
	(17, 'Quần jeans nam Nike thoải mái và bền bỉ.', '6.jpg', 'denim', 'Quần Jeans Nam Nike', 59.99, 15, 1, 0),
	(18, 'Áo sơ mi nam trắng với thiết kế cổ điển.', 'so-mi-01.jpg', 'Cotton.', 'Áo sơ mi nam trắng', 35, 14, 2, 0),
	(19, 'Áo vest nam màu đen phong cách và lịch lãm.', 'z4282754315142_c50214ef02c6dd1a8cead61e702bf874.jpg', 'Vải polyester.', 'Áo vest nam màu đen', 80, 4, 3, 1),
	(20, 'Áo cardigan nam màu đen ấm áp và thời trang.', 'ao-len-nam-10-10f23kni008_black_1__1.jpg', 'Vải blend.', 'Áo cardigan nam màu đen', 15, 12, 5, 0),
	(21, 'Áo cardigan nam màu da ấm áp và thời trang.', 'th5.jpg', 'Vải blend.', 'Áo cardigan nam màu da', 20, 10, 5, 0),
	(22, 'Áo cardigan nam màu xanh lá ấm áp và thời trang.', 'ao-len-nam-10-10f23kni008_green_1__3.jpg', 'cotton', 'Áo cardigan nam màu xanh lá', 90, 29, 5, 0),
	(23, 'Bộ suit nam màu xám đẹp và sang trọng.', 'th8.jpg', 'Vải blend.', 'Bộ suit nam màu xám', 70, 2, 4, 0),
	(24, 'Bộ suit nam màu da đẹp và sang trọng.', 'ao-vest-nam-11-10f23ves002-lawel-oak-_1__1.jpg', 'Vải polyester.', 'Bộ suit nam màu da', 67, 4, 4, 0),
	(25, 'Áo cardigan nam màu đen ấm áp và thời trang.', 'th6.jpg', 'Vải blend.', 'Áo cardigan nam màu đen có họa tiết', 44, 22, 5, 0),
	(26, 'Sneaker Nike Air Max phong cách và thoải mái.', '1.jpg', 'Sneaker', 'Giày Sneaker Nike Air Max', 119.99, 10, 6, 0),
	(27, 'Giày thể thao Puma Flex linh hoạt và êm ái.', '5.jpg', 'Fabric', 'Giày Thể Thao Puma Flex', 79.99, 22, 6, 0),
	(28, 'Giày Sneaker Adidas Ultra Boost với đệm Boost êm ái và phong cách hiện đại.', '7.jpg', 'Synthetic materials', 'Giày Sneaker Adidas Ultra Boost', 149.99, 2, 6, 0),
	(29, 'Balo Puma Streetstyle thời trang và tiện lợi.', '3.jpg', 'cotton', 'Balo Puma Streetstyle', 39.99, 25, 6, 0),
	(30, 'Balo Nike Elemental với nhiều ngăn tiện ích và chất liệu chống nước.', '9.jpg', 'cotton', 'Balo Nike Elemental', 89.99, 41, 6, 0),
	(31, 'Nón Snapback Adidas phong cách và thoải mái.', '4.jpg', 'cotton', 'Nón Snapback Adidas', 29.99, 42, 6, 0),
	(32, 'Mũ Snapback Adidas Originals với logo độc đáo.', '10.jpg', 'cotton', 'Mũ Snapback Adidas', 34.99, 21, 6, 0);

-- Dumping structure for table store.cart_item
CREATE TABLE IF NOT EXISTS `cart_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `accessory_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk8xr9l31qmbjglieqrfcmcoge` (`accessory_id`),
  KEY `FK7t2otqau9itdooqxoe4nyev1j` (`member_id`),
  CONSTRAINT `FK7t2otqau9itdooqxoe4nyev1j` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  CONSTRAINT `FKk8xr9l31qmbjglieqrfcmcoge` FOREIGN KEY (`accessory_id`) REFERENCES `accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table store.cart_item: ~2 rows (approximately)
INSERT INTO `cart_item` (`id`, `quantity`, `accessory_id`, `member_id`) VALUES
	(29, 8, 12, 15),
	(30, 1, 2, 16);

-- Dumping structure for table store.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table store.category: ~6 rows (approximately)
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Jeans'),
	(2, 'Shirts'),
	(3, 'Vest'),
	(4, 'Suit'),
	(5, 'Cardigan'),
	(6, 'Others');

-- Dumping structure for table store.member
CREATE TABLE IF NOT EXISTS `member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table store.member: ~6 rows (approximately)
INSERT INTO `member` (`id`, `email`, `name`, `password`, `role`, `username`) VALUES
	(1, 'abc@gmail.com', 'Hung', '$2a$10$Ie1QDc7KD1ED6zdgbRWlU.VacxXpzJO0sBFKUiMvI.PqYF3gA0Sd.', 'ROLE_ADMIN', 'admin'),
	(2, 'abc123@gmail.com', 'Huy', '$2a$10$Ie1QDc7KD1ED6zdgbRWlU.VacxXpzJO0sBFKUiMvI.PqYF3gA0Sd.', 'ROLE_USER', 'user'),
	(15, 'a@gmail.com', 'anhquan', '$2a$10$pv0o9/yaGr5xRmprEtsxa.7ZAABSLcARDp9Xk2Do5icljlN8jNfi6', 'ROLE_ADMIN', '52100924'),
	(16, 'd@gmail.com', 'a', '$2a$10$mjwh9AU/HVmEfpY0RFJMwusnACMU/tf3PRBbbeJtNPoecetUMOUhu', 'ROLE_USER', '123'),
	(17, 'b@gmail.com', 'quan', '$2a$10$la0Aq6TCZPE1CrQ1K1Km0Ofl2XRi0x3sy3FZpfdNUywB/fhRwBUQu', 'ROLE_USER', 'quan'),
	(19, 'd@gmail.com', 'as', '$2a$10$bdn3jFZ88anWMNDAOe3qxOWVFKZhNKObHzuI10dvje.BnlC1emS/u', 'ROLE_USER', '1234');

-- Dumping structure for table store.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `accessory_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbgsvbk42lwb7en9k40y0o81qo` (`accessory_id`),
  KEY `FKdsh9an5gb725mpviriaad0xa4` (`member_id`),
  CONSTRAINT `FKbgsvbk42lwb7en9k40y0o81qo` FOREIGN KEY (`accessory_id`) REFERENCES `accessory` (`id`),
  CONSTRAINT `FKdsh9an5gb725mpviriaad0xa4` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table store.order_item: ~11 rows (approximately)
INSERT INTO `order_item` (`id`, `created_at`, `order_id`, `quantity`, `transaction_id`, `accessory_id`, `member_id`) VALUES
	(11, '2023-12-05 20:04:52.151000', '2DX86950PM384443Y', 5, '9D201213JU336472X', 2, 15),
	(12, '2023-12-05 20:04:52.190000', '2DX86950PM384443Y', 2, '9D201213JU336472X', 1, 15),
	(13, '2023-12-05 20:14:14.286000', '3S097232VB720014S', 1, '9L514695XS2910120', 19, 15),
	(14, '2023-12-05 20:17:28.064000', '6R7722685U380830Y', 1, '17558834E27738236', 4, 15),
	(15, '2023-12-05 20:27:38.765000', '3MJ884556B310632A', 1, '6UN69529N3503324F', 12, 15),
	(16, '2023-12-05 20:33:38.608000', '8KS28667S3480303U', 1, '66S26079VV127394G', 9, 15),
	(17, '2023-12-05 20:42:38.698000', '9NY67202B0634534H', 1, '91754914PW8551240', 12, 15),
	(18, '2023-12-05 20:46:20.079000', '2MH796655D552731E', 1, '7XR23553G7978905R', 3, 15),
	(19, '2023-12-05 21:54:46.621000', '6RY37009WK322461W', 3, '4MR46529P8409161F', 7, 16),
	(20, '2023-12-05 21:54:46.671000', '6RY37009WK322461W', 3, '4MR46529P8409161F', 2, 16),
	(21, '2023-12-05 23:06:23.495000', '97X9775916307071K', 3, '98231235FM7557443', 2, 17);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
