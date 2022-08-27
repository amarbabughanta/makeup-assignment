-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table grocery.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `Brand_id` varchar(50) DEFAULT NULL,
  `Brand_name` varchar(50) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table grocery.brand: ~9 rows (approximately)
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` (`Brand_id`, `Brand_name`, `quantity`, `price`) VALUES
	('b2', 'colin', 1, 100.2),
	('b3', 'colgate', 1, 50),
	('b5', 'gf', 54, 45),
	('f6', '65', 65, 56),
	('g5', 'abc', 54, 54),
	('b6', 'gf', 45, 5),
	('b6', 'f', 9, 9),
	('b5', 'colgate', 1, 60),
	('rer', '4', 34, 34),
	('e3', 'rgfg', 45, 54),
	('g1', 'ghh', 54, 54),
	('y5', 'rt', 54, 54),
	('0056', 'abc', 43, 34);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;

-- Dumping structure for table grocery.category
CREATE TABLE IF NOT EXISTS `category` (
  `Category_id` varchar(50) DEFAULT NULL,
  `Category_name` varchar(50) DEFAULT NULL,
  `quantity` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table grocery.category: ~3 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`Category_id`, `Category_name`, `quantity`) VALUES
	('c1', 'gel', 1),
	('c2', 'cleaner', 1),
	('c3', 'toothpaste', 1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table grocery.customer_details
CREATE TABLE IF NOT EXISTS `customer_details` (
  `customer_id` varchar(50) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_address` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table grocery.customer_details: ~3 rows (approximately)
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` (`customer_id`, `customer_name`, `customer_address`, `phone_number`) VALUES
	('c1', 'john', 'ab street', '12112'),
	('c2', 'rik', 'ab lane', '2212'),
	('c3', 'riki', 'dc lane', '332434');
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;

-- Dumping structure for table grocery.glosary_items
CREATE TABLE IF NOT EXISTS `glosary_items` (
  `item_id` varchar(50) DEFAULT NULL,
  `stock` varchar(50) DEFAULT NULL,
  `quantity` int(20) DEFAULT NULL,
  `price` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table grocery.glosary_items: ~8 rows (approximately)
/*!40000 ALTER TABLE `glosary_items` DISABLE KEYS */;
INSERT INTO `glosary_items` (`item_id`, `stock`, `quantity`, `price`) VALUES
	('g1', '10 pices', 2, 100),
	('g2', '20 pices', 3, 150),
	('g3', '30 pices', 4, 200),
	('g4', '20 pices', 6, 600),
	('g5', '5', 6, 68),
	('g6', '4', 43, 43),
	('g7', '4', 5, 54),
	('g8', '23', 43, 34),
	('g9', '7', 7, 7),
	('g10', '7', 7, 7);
/*!40000 ALTER TABLE `glosary_items` ENABLE KEYS */;

-- Dumping structure for table grocery.store
CREATE TABLE IF NOT EXISTS `store` (
  `Store_id` varchar(50) DEFAULT NULL,
  `Store_name` varchar(50) DEFAULT NULL,
  `Total_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table grocery.store: ~3 rows (approximately)
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` (`Store_id`, `Store_name`, `Total_order`) VALUES
	('s1', 'gel store', 1),
	('s2', 'cleaner store', 2),
	('s3', 'toothpaste store', 3);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
