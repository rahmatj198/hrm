/*
 Navicat Premium Data Transfer

 Source Server         : lokal
 Source Server Type    : MySQL
 Source Server Version : 100425
 Source Host           : 127.0.0.1:3306
 Source Schema         : myapp

 Target Server Type    : MySQL
 Target Server Version : 100425
 File Encoding         : 65001

 Date: 07/01/2023 14:28:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for imports_histories
-- ----------------------------
DROP TABLE IF EXISTS `imports_histories`;
CREATE TABLE `imports_histories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `table_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `import_fname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of imports_histories
-- ----------------------------
INSERT INTO `imports_histories` VALUES (1, 'P001', 'mst_customers', '20221218-customer.csv', '2022-12-18 12:52:55', 'administrator', NULL, NULL);
INSERT INTO `imports_histories` VALUES (2, 'P001', 'mst_products', '20221218-prod.csv', '2022-12-18 13:08:00', 'administrator', NULL, NULL);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` enum('newpage','kategori','report','table','summary','masterdetail','link') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'table',
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent` int NULL DEFAULT 0,
  `url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_allowed` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y',
  `aclass` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N',
  `report_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_order` int(10) UNSIGNED ZEROFILL NULL DEFAULT 0000000000,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menu_unique_key`(`nama`, `parent`) USING BTREE,
  INDEX `search_parent`(`parent`) USING BTREE,
  INDEX `search_enabled`(`enabled`) USING BTREE,
  INDEX `search_level_allowed`(`role_allowed`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, NULL, 'kategori', 'Dashboard', 0, '#', '1,2,3', 'fa fa-lg fa-fw fa-home', 'Y', 'dashboard', NULL, 0000000001, '0000-00-00 00:00:00', NULL, '2016-08-07 15:17:10', 'demo');
INSERT INTO `menus` VALUES (2, NULL, 'kategori', 'Admin', 0, '#', '1', 'fa fa-lg fa-fw fa-group', 'Y', 'admin', NULL, 0000000005, '0000-00-00 00:00:00', NULL, '2014-11-13 14:04:35', 'rahmat');
INSERT INTO `menus` VALUES (3, NULL, 'kategori', 'Master', 0, '#', '1,2', 'fa fa-lg fa-fw fa-wrench', 'Y', 'master', NULL, 0000000007, '0000-00-00 00:00:00', NULL, '2015-03-05 05:45:21', 'azka');
INSERT INTO `menus` VALUES (4, NULL, 'kategori', 'Import Data', 0, '#', '1', 'fa fa-lg fa-fw fa-file-excel-o', 'Y', 'import_data', NULL, 0000000027, '0000-00-00 00:00:00', NULL, '2015-03-05 05:45:21', 'azka');
INSERT INTO `menus` VALUES (5, NULL, 'kategori', 'Report', 0, '#', '1,2,3', 'fa fa-lg fa-fw fa-file-pdf-o', 'Y', 'report', NULL, 0000000055, '0000-00-00 00:00:00', NULL, '2015-04-03 03:47:28', 'rahmat');
INSERT INTO `menus` VALUES (6, NULL, 'kategori', 'Transaction', 0, '#', '1,2', 'fa fa-lg fa-fw fa-database', 'Y', 'transaction', NULL, 0000000060, '0000-00-00 00:00:00', NULL, '2015-04-03 03:47:28', 'rahmat');
INSERT INTO `menus` VALUES (7, 'Dashboard', 'summary', 'Dashboard', 1, 'dashboard', '1,2,3', 'fa fa-home', 'Y', 'dashboard_c', NULL, 0000000999, '2014-11-08 05:00:35', 'rahmat', '2015-04-02 11:09:57', 'rahmat');
INSERT INTO `menus` VALUES (8, 'Admin User Management', 'table', 'User Management', 2, 'appuser', '1', 'fa fa-user', 'Y', 'user_management', NULL, 0000000999, '0000-00-00 00:00:00', NULL, '2014-12-11 08:43:36', 'rahmat');
INSERT INTO `menus` VALUES (9, 'Admin Menu Management', 'table', 'Menu Management', 2, 'appmenu', '1', 'fa fa-align-justify', 'Y', 'menu_management', NULL, 0000000999, '2014-11-08 05:00:35', 'rahmat', '2015-04-02 11:09:57', 'rahmat');
INSERT INTO `menus` VALUES (10, 'Admin Level Management', 'table', 'Level Management', 2, 'applevel', '1', 'fa fa-level-up', 'Y', 'level_management', NULL, 0000000999, '2014-11-08 05:00:35', 'rahmat', '2015-04-02 11:09:57', 'rahmat');
INSERT INTO `menus` VALUES (11, 'User Table Privilage', 'table', 'User Table Privilage', 2, 'appusrtab', '1,2', 'fa fa-database', 'Y', 'user_table_privilage', NULL, 0000000999, NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (12, 'Master Customers', 'table', 'Customers', 3, 'customer', '1,2', 'fa fa-male', 'Y', 'customers', '', 0000000999, '2022-11-04 09:05:25', 'administrator', '2022-11-04 09:06:27', 'administrator');
INSERT INTO `menus` VALUES (13, 'Master Products', 'table', 'Products', 3, 'product', '1,2', 'fa fa-list-alt', 'Y', 'products', '', 0000000999, '2022-11-04 09:06:19', 'administrator', '2022-11-04 09:07:26', 'administrator');
INSERT INTO `menus` VALUES (14, 'Import Master Data', 'link', 'Master', 4, 'import', '1', 'fa fa-file-excel-o', 'Y', 'import_master', NULL, 0000000999, '0000-00-00 00:00:00', '', '2019-05-18 09:47:51', 'rahmat');
INSERT INTO `menus` VALUES (15, 'Report Order Summary', 'newpage', 'Order Summary', 5, 'order_summary', '1,2,3', 'fa fa-lg fa-file-pdf-o', 'Y', 'order_summay', 'main_orders.mrt', 0000000999, '2022-11-07 02:00:40', 'administrator', '2022-11-07 08:42:57', 'administrator');
INSERT INTO `menus` VALUES (16, 'Report Order Detail', 'report', 'Order Detail', 5, 'order_detail', '1,2,3', 'fa fa-lg fa-file-pdf-o', 'Y', 'order_detail', 'order_detail.mrt', 0000000999, '2022-11-07 08:46:25', 'administrator', '2022-11-07 08:48:25', 'administrator');
INSERT INTO `menus` VALUES (17, 'Transaction Order', 'masterdetail', 'Order', 6, 'md_order', '1,2', 'fa fa-reorder', 'Y', 'order', '', 0000000999, '2022-11-04 10:19:53', 'administrator', '2022-11-04 10:20:11', 'administrator');
INSERT INTO `menus` VALUES (18, 'Orders', 'table', 'Order Sheetview', 6, 'sv_orders', '1,2', 'fa fa-database', 'Y', 'orders', '', 0000000999, '2022-11-04 10:19:53', 'administrator', '2022-11-04 10:20:11', 'administrator');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2022_11_26_122618_add_is_admin_to_users_table', 2);
INSERT INTO `migrations` VALUES (6, '2022_11_26_230923_add_is_entrydata_to_users_table', 3);
INSERT INTO `migrations` VALUES (7, '2022_12_01_054357_create_tasks_table', 4);

-- ----------------------------
-- Table structure for mst_categories
-- ----------------------------
DROP TABLE IF EXISTS `mst_categories`;
CREATE TABLE `mst_categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `category_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `import_fname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_name`(`category_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mst_categories
-- ----------------------------
INSERT INTO `mst_categories` VALUES (1, 'P001', 'Beverages', 'Soft drinks, coffees, teas, beers, and ales', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_categories` VALUES (2, 'P001', 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_categories` VALUES (3, 'P001', 'Confections', 'Desserts, candies, and sweet breads', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_categories` VALUES (4, 'P001', 'Dairy products', 'Cheeses', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_categories` VALUES (5, 'P001', 'Grains/Cereals', 'Breads, crackers, pasta, and cereal', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_categories` VALUES (6, 'P001', 'Meat/Poultry', 'Prepared meats', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_categories` VALUES (7, 'P001', 'Produce', 'Dried fruit and bean curd', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_categories` VALUES (8, 'P001', 'Seafood', 'Seaweed and fish', '', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mst_customers
-- ----------------------------
DROP TABLE IF EXISTS `mst_customers`;
CREATE TABLE `mst_customers`  (
  `id` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `project_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `region` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fax` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `import_fname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `city`(`city`) USING BTREE,
  INDEX `company_name`(`company_name`) USING BTREE,
  INDEX `postal_code`(`postal_code`) USING BTREE,
  INDEX `region`(`region`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mst_customers
-- ----------------------------
INSERT INTO `mst_customers` VALUES ('ALFKI', 'P001', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', '', '12209', 'Germany', '030-0074321', '030-0076545', '', '2022-11-04 00:00:00', 'administrator', NULL, '');
INSERT INTO `mst_customers` VALUES ('ANATR', 'P001', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('ANTON', 'P001', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('AROUT', 'P001', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London', '', 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6751', '', '2022-11-04 00:00:00', 'administrator', '2022-11-04 00:00:00', 'administrator');
INSERT INTO `mst_customers` VALUES ('BERGS', 'P001', 'Berglunds snabbköp', 'Christina Berglund', 'Order Administrator', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('BLAUS', 'P001', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', '0621-08460', '0621-08924', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('BLONP', 'P001', 'Blondesddsl père et fils', 'Frédérique Citeaux', 'Marketing Manager', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', '88.60.15.31', '88.60.15.32', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('BOLID', 'P001', 'Bólido Comidas preparadas', 'Martín Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('BONAP', 'P001', 'Bon app\'', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', '91.24.45.40', '91.24.45.41', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('BOTTM', 'P001', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('BSBEV', 'P001', 'B\'s Beverages', 'Victoria Ashworth', 'Sales Representative', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', '(171) 555-1212', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('CACTU', 'P001', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Sales Agent', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('CENTC', 'P001', 'Centro comercial Moctezuma', 'Francisco Chang', 'Marketing Manager', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'Mexico', '(5) 555-3392', '(5) 555-7293', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('CHOPS', 'P001', 'Chop-suey Chinese', 'Yang Wang', 'Owner', 'Hauptstr. 29', 'Bern', NULL, '3012', 'Switzerland', '0452-076545', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('COMMI', 'P001', 'Comércio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('CONSH', 'P001', 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('DRACD', 'P001', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', '0241-039123', '0241-059428', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('DUMON', 'P001', 'Du monde entier', 'Janine Labrune', 'Owner', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', '40.67.88.88', '40.67.89.89', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('EASTC', 'P001', 'Eastern Connection', 'Ann Devon', 'Sales Agent', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', '(171) 555-0297', '(171) 555-3373', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('ERNSH', 'P001', 'Ernst Handel', 'Roland Mendel', 'Sales Manager', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', '7675-3425', '7675-3426', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('FAMIA', 'P001', 'Familia Arquibaldo', 'Aria Cruz', 'Marketing Assistant', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', '(11) 555-9857', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('FISSA', 'P001', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Accounting Manager', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'Spain', '(91) 555 94 44', '(91) 555 55 93', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('FOLIG', 'P001', 'Folies gourmandes', 'Martine Rancé', 'Assistant Sales Agent', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France', '20.16.10.16', '20.16.10.17', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('FOLKO', 'P001', 'Folk och fä HB', 'Maria Larsson', 'Owner', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', '0695-34 67 21', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('FRANK', 'P001', 'Frankenversand', 'Peter Franken', 'Marketing Manager', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', '089-0877310', '089-0877451', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('FRANR', 'P001', 'France restauration', 'Carine Schmitt', 'Marketing Manager', '54, rue Royale', 'Nantes', NULL, '44000', 'France', '40.32.21.21', '40.32.21.20', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('FRANS', 'P001', 'Franchi S.p.A.', 'Paolo Accorti', 'Sales Representative', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', '011-4988260', '011-4988261', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('FURIB', 'P001', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('GALED', 'P001', 'Galería del gastrónomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '08022', 'Spain', '(93) 203 4560', '(93) 203 4561', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('GODOS', 'P001', 'Godos Cocina Típica', 'José Pedro Freyre', 'Sales Manager', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', '(95) 555 82 82', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('GOURL', 'P001', 'Gourmet Lanchonetes', 'André Fonseca', 'Sales Associate', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('GREAL', 'P001', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('GROSR', 'P001', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('HANAR', 'P001', 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('HILAA', 'P001', 'HILARION-Abastos', 'Carlos Hernández', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('HUNGC', 'P001', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874', '(503) 555-2376', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('HUNGO', 'P001', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', '2967 542', '2967 3333', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('ISLAT', 'P001', 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('KOENE', 'P001', 'Königlich Essen', 'Philip Cramer', 'Sales Associate', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', '0555-09876', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('LACOR', 'P001', 'La corne d\'abondance', 'Daniel Tonini', 'Sales Representative', '67, avenue de l\'Europe', 'Versailles', NULL, '78000', 'France', '30.59.84.10', '30.59.85.11', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('LAMAI', 'P001', 'La maison d\'Asie', 'Annette Roulet', 'Sales Manager', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', '61.77.61.10', '61.77.61.11', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('LAUGB', 'P001', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Marketing Assistant', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', '(604) 555-3392', '(604) 555-7293', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('LAZYK', 'P001', 'Lazy K Kountry Store', 'John Steel', 'Marketing Manager', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', '(509) 555-7969', '(509) 555-6221', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('LEHMS', 'P001', 'Lehmanns Marktstand', 'Renate Messner', 'Sales Representative', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', '069-0245984', '069-0245874', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('LETSS', 'P001', 'Let\'s Stop N Shop', 'Jaime Yorres', 'Owner', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('LILAS', 'P001', 'LILA-Supermercado', 'Carlos González', 'Accounting Manager', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('LINOD', 'P001', 'LINO-Delicateses', 'Felipe Izquierdo', 'Owner', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('LONEP', 'P001', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Sales Manager', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', '(503) 555-9573', '(503) 555-9646', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('MAGAA', 'P001', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Marketing Manager', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', '035-640230', '035-640231', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('MAISD', 'P001', 'Maison Dewey', 'Catherine Dewey', 'Sales Agent', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', '(02) 201 24 67', '(02) 201 24 68', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('MEREP', 'P001', 'Mère Paillarde', 'Jean Fresnière', 'Marketing Assistant', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-8054', '(514) 555-8055', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('MORGK', 'P001', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Marketing Assistant', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', '0342-023176', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('NORTS', 'P001', 'North/South', 'Simon Crowther', 'Sales Associate', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK', '(171) 555-7733', '(171) 555-2530', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('OCEAN', 'P001', 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Sales Agent', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('OLDWO', 'P001', 'Old World Delicatessen', 'Rene Phillips', 'Sales Representative', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', '(907) 555-7584', '(907) 555-2880', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('OTTIK', 'P001', 'Ottilies Käseladen', 'Henriette Pfalzheim', 'Owner', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', '0221-0644327', '0221-0765721', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('PARIS', 'P001', 'Paris spécialités', 'Marie Bertrand', 'Owner', '265, boulevard Charonne', 'Paris', NULL, '75012', 'France', '(1) 42.34.22.66', '(1) 42.34.22.77', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('PERIC', 'P001', 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Sales Representative', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico', '(5) 552-3745', '(5) 545-3745', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('PICCO', 'P001', 'Piccolo und mehr', 'Georg Pipps', 'Sales Manager', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', '6562-9722', '6562-9723', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('PRCM', 'P001', 'Procims', 'Rahmat', 'Owner', 'Indonesia', 'Jawa Barat', 'PW', '41174', 'Indonesia', '123312123', '432434', '', '2022-11-04 00:00:00', 'administrator', '2022-11-04 00:00:00', 'administrator');
INSERT INTO `mst_customers` VALUES ('PRINI', 'P001', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Sales Representative', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('QUEDE', 'P001', 'Que Delícia', 'Bernardo Batista', 'Accounting Manager', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', '(21) 555-4252', '(21) 555-4545', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('QUEEN', 'P001', 'Queen Cozinha', 'Lúcia Carvalho', 'Marketing Assistant', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', '(11) 555-1189', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('QUICK', 'P001', 'QUICK-Stop', 'Horst Kloss', 'Accounting Manager', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', '0372-035188', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('RANCH', 'P001', 'Rancho grande', 'Sergio Gutiérrez', 'Sales Representative', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('RATTC', 'P001', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistant Sales Representative', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', '(505) 555-5939', '(505) 555-3620', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('REGGC', 'P001', 'Reggiani Caseifici', 'Maurizio Moroni', 'Sales Associate', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', '0522-556721', '0522-556722', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('RICAR', 'P001', 'Ricardo Adocicados', 'Janete Limeira', 'Assistant Sales Agent', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', '(21) 555-3412', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('RICSU', 'P001', 'Richter Supermarkt', 'Michael Holz', 'Sales Manager', 'Grenzacherweg 237', 'Genève', NULL, '1203', 'Switzerland', '0897-034214', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('ROMEY', 'P001', 'Romero y tomillo', 'Alejandra Camino', 'Accounting Manager', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain', '(91) 745 6200', '(91) 745 6210', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('SANTG', 'P001', 'Santé Gourmet', 'Jonas Bergulfsen', 'Owner', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', '07-98 92 35', '07-98 92 47', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('SAVEA', 'P001', 'Save-a-lot Markets', 'Jose Pavarotti', 'Sales Representative', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', '(208) 555-8097', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('SEVES', 'P001', 'Seven Seas Imports', 'Hari Kumar', 'Sales Manager', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', '(171) 555-1717', '(171) 555-5646', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('SIMOB', 'P001', 'Simons bistro', 'Jytte Petersen', 'Owner', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', '31 12 34 56', '31 13 35 57', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('SPECD', 'P001', 'Spécialités du monde', 'Dominique Perrier', 'Marketing Manager', '25, rue Lauriston', 'Paris', NULL, '75016', 'France', '(1) 47.55.60.10', '(1) 47.55.60.20', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('SPLIR', 'P001', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Sales Manager', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', '(307) 555-4680', '(307) 555-6525', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('SUPRD', 'P001', 'Suprêmes délices', 'Pascale Cartrain', 'Accounting Manager', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', '(071) 23 67 22 20', '(071) 23 67 22 21', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('THEBI', 'P001', 'The Big Cheese', 'Liz Nixon', 'Marketing Manager', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', '(503) 555-3612', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('THECR', 'P001', 'The Cracker Box', 'Liu Wong', 'Marketing Assistant', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', '(406) 555-5834', '(406) 555-8083', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('TOMSP', 'P001', 'Toms Spezialitäten', 'Karin Josephs', 'Marketing Manager', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany', '0251-031259', '0251-035695', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('TORTU', 'P001', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Owner', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', '(5) 555-2933', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('TRADH', 'P001', 'Tradição Hipermercados', 'Anabela Domingues', 'Sales Representative', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', '(11) 555-2167', '(11) 555-2168', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('TRAIH', 'P001', 'Trail\'s Head Gourmet Provisioners', 'Helvetius Nagy', 'Sales Associate', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', '(206) 555-8257', '(206) 555-2174', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('VAFFE', 'P001', 'Vaffeljernet', 'Palle Ibsen', 'Sales Manager', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', '86 21 32 43', '86 22 33 44', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('VICTE', 'P001', 'Victuailles en stock', 'Mary Saveley', 'Sales Agent', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', '78.32.54.86', '78.32.54.87', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('VINET', 'P001', 'Vins et alcools Chevalier', 'Paul Henriot', 'Accounting Manager', '59 rue de l\'Abbaye', 'Reims', NULL, '51100', 'France', '26.47.15.10', '26.47.15.11', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('WANDK', 'P001', 'Die Wandernde Kuh', 'Rita Müller', 'Sales Representative', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', '0711-020361', '0711-035428', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('WARTH', 'P001', 'Wartian Herkku', 'Pirkko Koskitalo', 'Accounting Manager', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', '981-443655', '981-443655', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('WELLI', 'P001', 'Wellington Importadora', 'Paula Parente', 'Sales Manager', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', '(14) 555-8122', NULL, '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('WHITC', 'P001', 'White Clover Markets', 'Karl Jablonski', 'Owner', '305 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', 'USA', '(206) 555-4112', '(206) 555-4115', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('WILMK', 'P001', 'Wilman Kala', 'Matti Karttunen', 'Owner/Marketing Assistant', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', '90-224 8858', '90-224 8858', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);
INSERT INTO `mst_customers` VALUES ('WOLZA', 'P001', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Owner', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', '(26) 642-7012', '(26) 642-7012', '', '2022-11-04 00:00:00', 'administrator', NULL, NULL);

-- ----------------------------
-- Table structure for mst_employees
-- ----------------------------
DROP TABLE IF EXISTS `mst_employees`;
CREATE TABLE `mst_employees`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_of_courtesy` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `birth_date` date NULL DEFAULT NULL,
  `hire_date` date NULL DEFAULT NULL,
  `address` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `region` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `home_phone` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extension` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `photo` blob NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `reports_to` int NULL DEFAULT NULL,
  `photo_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `last_name`(`last_name`) USING BTREE,
  INDEX `postal_code`(`postal_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mst_employees
-- ----------------------------
INSERT INTO `mst_employees` VALUES (1, 'P001', 'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '1992-05-01', '507 - 20th Ave. E. Apt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', NULL, 'Education includes a BA in psychology from Colorado State University in 1970.  She also completed \"The Art of the Cold Call.\"  Nancy is a member of Toastmasters International.', 2, 'http://accweb/emmployees/davolio.bmp', NULL, NULL, NULL, NULL);
INSERT INTO `mst_employees` VALUES (2, 'P001', 'Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-02-19', '1992-08-14', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '(206) 555-9482', '3457', NULL, 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.', NULL, 'http://accweb/emmployees/fuller.bmp', NULL, NULL, NULL, NULL);
INSERT INTO `mst_employees` VALUES (3, 'P001', 'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30', '1992-04-01', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '3355', NULL, 'Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', 2, 'http://accweb/emmployees/leverling.bmp', NULL, NULL, NULL, NULL);
INSERT INTO `mst_employees` VALUES (4, 'P001', 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-09-19', '1993-05-03', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '5176', NULL, 'Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.', 2, 'http://accweb/emmployees/peacock.bmp', NULL, NULL, NULL, NULL);
INSERT INTO `mst_employees` VALUES (5, 'P001', 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04', '1993-10-17', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'UK', '(71) 555-4848', '3453', NULL, 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses \"Successful Telemarketing\" and \"International Sales Management.\"  He is fluent in French.', 2, 'http://accweb/emmployees/buchanan.bmp', NULL, NULL, NULL, NULL);
INSERT INTO `mst_employees` VALUES (6, 'P001', 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02', '1993-10-17', 'Coventry House Miner Rd.', 'London', NULL, 'EC2 7JR', 'UK', '(71) 555-7773', '428', NULL, 'Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses \"Multi-Cultural Selling\" and \"Time Management for the Sales Professional.\"  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', 5, 'http://accweb/emmployees/davolio.bmp', NULL, NULL, NULL, NULL);
INSERT INTO `mst_employees` VALUES (7, 'P001', 'King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29', '1994-01-02', 'Edgeham Hollow Winchester Way', 'London', NULL, 'RG1 9SP', 'UK', '(71) 555-5598', '465', NULL, 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled \"Selling in Europe,\" he was transferred to the London office in March 1993.', 5, 'http://accweb/emmployees/davolio.bmp', NULL, NULL, NULL, NULL);
INSERT INTO `mst_employees` VALUES (8, 'P001', 'Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-01-09', '1994-03-05', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '2344', NULL, 'Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.', 2, 'http://accweb/emmployees/davolio.bmp', NULL, NULL, NULL, NULL);
INSERT INTO `mst_employees` VALUES (9, 'P001', 'Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1966-01-27', '1994-11-15', '7 Houndstooth Rd.', 'London', NULL, 'WG2 7LT', 'UK', '(71) 555-4444', '452', NULL, 'Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.', 5, 'http://accweb/emmployees/davolio.bmp', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mst_products
-- ----------------------------
DROP TABLE IF EXISTS `mst_products`;
CREATE TABLE `mst_products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `supplier_id` int NULL DEFAULT NULL,
  `category_id` int NULL DEFAULT NULL,
  `quantity_per_unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit_price` decimal(19, 2) NULL DEFAULT 0.00,
  `units_in_stock` smallint NULL DEFAULT 0,
  `units_on_order` smallint NULL DEFAULT 0,
  `reorder_level` smallint NULL DEFAULT 0,
  `discontinued` bit(1) NOT NULL DEFAULT b'0',
  `import_fname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `img_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categoriesproducts`(`category_id`) USING BTREE,
  INDEX `categoryid`(`category_id`) USING BTREE,
  INDEX `productname`(`product_name`) USING BTREE,
  INDEX `supplierid`(`supplier_id`) USING BTREE,
  INDEX `suppliersproducts`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mst_products
-- ----------------------------
INSERT INTO `mst_products` VALUES (1, 'P001', 'Chai', 1, 1, '10 boxes x 20 bags', 20.00, 39, 0, 10, b'1', 'product_02.png', '', NULL, '', '2022-11-09', 'demo');
INSERT INTO `mst_products` VALUES (2, 'P001', 'Max Juice', 1, 1, '24 - 12 oz bottles', 19.00, 17, 40, 25, b'0', 'product_05.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (3, 'P001', 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10.00, 13, 70, 25, b'0', 'product_14.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (4, 'P001', 'Chef Anton\'s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22.00, 53, 0, 0, b'0', 'product_09.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (5, 'P001', 'Chef Anton\'s Gumbo Mix', 2, 2, '36 boxes', 21.35, 0, 0, 0, b'1', 'product_13.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (6, 'P001', 'Grandma\'s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25.00, 120, 0, 25, b'0', 'product_06.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (7, 'P001', 'Uncle Bob\'s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30.00, 15, 0, 10, b'0', 'product_11.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (8, 'P001', 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40.00, 6, 0, 0, b'0', 'product_05.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (9, 'P001', 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97.00, 29, 0, 0, b'1', 'product_06.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (10, 'P001', 'Ikura', 4, 8, '12 - 200 ml jars', 31.00, 31, 0, 0, b'0', 'product_02.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (11, 'P001', 'Queso Cabrales', 5, 4, '1 kg pkg.', 21.00, 22, 30, 30, b'0', 'product_10.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (12, 'P001', 'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38.00, 86, 0, 0, b'0', 'product_16.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (13, 'P001', 'Konbu', 6, 8, '2 kg box', 6.00, 24, 0, 5, b'0', 'product_11.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (14, 'P001', 'Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, b'0', 'product_05.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (15, 'P001', 'Genen Shouyu', 6, 2, '24 - 250 ml bottles', 15.50, 39, 0, 5, b'0', 'product_10.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (16, 'P001', 'Pavlova', 7, 3, '32 - 500 g boxes', 17.45, 29, 0, 10, b'0', 'product_16.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (17, 'P001', 'Alice Mutton', 7, 6, '20 - 1 kg tins', 39.00, 0, 0, 0, b'1', 'product_03.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (18, 'P001', 'Carnarvon Tigers', 7, 8, '16 kg pkg.', 62.50, 42, 0, 0, b'0', 'product_12.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (19, 'P001', 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 9.20, 25, 0, 5, b'0', 'product_05.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (20, 'P001', 'Sir Rodney\'s Marmalade', 8, 3, '30 gift boxes', 81.00, 40, 0, 0, b'0', 'product_16.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (21, 'P001', 'Sir Rodney\'s Scones', 8, 3, '24 pkgs. x 4 pieces', 10.00, 3, 40, 5, b'0', 'product_06.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (22, 'P001', 'Gustaf\'s Knäckebröd', 9, 5, '24 - 500 g pkgs.', 21.00, 104, 0, 25, b'0', 'product_01.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (23, 'P001', 'Tunnbröd', 9, 5, '12 - 250 g pkgs.', 9.00, 61, 0, 25, b'0', 'product_17.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (24, 'P001', 'Guaraná Fantástica', 10, 1, '12 - 355 ml cans', 4.50, 20, 0, 0, b'1', 'product_15.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (25, 'P001', 'NuNuCa Nuß-Nougat-Creme', 11, 3, '20 - 450 g glasses', 14.00, 76, 0, 30, b'0', 'product_03.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (26, 'P001', 'Gumbär Gummibärchen', 11, 3, '100 - 250 g bags', 31.23, 15, 0, 0, b'0', 'product_02.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (27, 'P001', 'Schoggi Schokolade', 11, 3, '100 - 100 g pieces', 43.90, 49, 0, 30, b'0', 'product_14.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (28, 'P001', 'Rössle Sauerkraut', 12, 7, '25 - 825 g cans', 45.60, 26, 0, 0, b'1', 'product_13.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (29, 'P001', 'Thüringer Rostbratwurst', 12, 6, '50 bags x 30 sausgs.', 123.79, 0, 0, 0, b'1', 'product_11.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (30, 'P001', 'Nord-Ost Matjeshering', 13, 8, '10 - 200 g glasses', 25.89, 10, 0, 15, b'0', 'product_07.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (31, 'P001', 'Gorgonzola Telino', 14, 4, '12 - 100 g pkgs', 12.50, 0, 70, 20, b'0', 'product_06.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (32, 'P001', 'Mascarpone Fabioli', 14, 4, '24 - 200 g pkgs.', 32.00, 9, 40, 25, b'0', 'product_13.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (33, 'P001', 'Geitost', 15, 4, '500 g', 2.50, 112, 0, 20, b'0', 'product_06.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (34, 'P001', 'Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14.00, 111, 0, 15, b'0', 'product_16.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (35, 'P001', 'Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18.00, 20, 0, 15, b'0', 'product_01.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (36, 'P001', 'Inlagd Sill', 17, 8, '24 - 250 g  jars', 19.00, 112, 0, 20, b'0', 'product_15.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (37, 'P001', 'Gravad lax', 17, 8, '12 - 500 g pkgs.', 26.00, 11, 50, 25, b'0', 'product_14.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (38, 'P001', 'Côte de Blaye', 18, 1, '12 - 75 cl bottles', 263.50, 17, 0, 15, b'0', 'product_02.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (39, 'P001', 'Chartreuse verte', 18, 1, '750 cc per bottle', 18.00, 69, 0, 5, b'0', 'product_13.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (40, 'P001', 'Boston Crab Meat', 19, 8, '24 - 4 oz tins', 18.40, 123, 0, 30, b'0', 'product_07.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (41, 'P001', 'Jack\'s New England Clam Chowder', 19, 8, '12 - 12 oz cans', 9.65, 85, 0, 10, b'0', 'product_08.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (42, 'P001', 'Singaporean Hokkien Fried Mee', 20, 5, '32 - 1 kg pkgs.', 14.00, 26, 0, 0, b'1', 'product_03.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (43, 'P001', 'Ipoh Coffee', 20, 1, '16 - 500 g tins', 46.00, 17, 10, 25, b'0', 'product_17.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (44, 'P001', 'Gula Malacca', 20, 2, '20 - 2 kg bags', 19.45, 27, 0, 15, b'0', 'product_17.png', '', NULL, NULL, '2023-01-07', 'api');
INSERT INTO `mst_products` VALUES (45, 'P001', 'Rogede sild', 21, 8, '1k pkg.', 9.50, 5, 70, 15, b'0', 'product_03.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (46, 'P001', 'Spegesild', 21, 8, '4 - 450 g glasses', 12.00, 95, 0, 0, b'0', 'product_14.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (47, 'P001', 'Zaanse koeken', 22, 3, '10 - 4 oz boxes', 9.50, 36, 0, 0, b'0', 'product_13.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (48, 'P001', 'Chocolade', 22, 3, '10 pkgs.', 12.75, 15, 70, 25, b'0', 'product_16.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (49, 'P001', 'Maxilaku', 23, 3, '24 - 50 g pkgs.', 20.00, 10, 60, 15, b'0', 'product_06.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (50, 'P001', 'Valkoinen suklaa', 23, 3, '12 - 100 g bars', 16.25, 65, 0, 30, b'0', 'product_09.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (51, 'P001', 'Manjimup Dried Apples', 24, 7, '50 - 300 g pkgs.', 53.00, 20, 0, 10, b'0', 'product_15.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (52, 'P001', 'Filo Mix', 24, 5, '16 - 2 kg boxes', 7.00, 38, 0, 25, b'0', 'product_06.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (53, 'P001', 'Perth Pasties', 24, 6, '48 pieces', 32.80, 0, 0, 0, b'1', 'product_10.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (54, 'P001', 'Tourtière', 25, 6, '16 pies', 7.45, 21, 0, 10, b'0', 'product_05.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (55, 'P001', 'Pâté chinois', 25, 6, '24 boxes x 2 pies', 24.00, 115, 0, 20, b'0', 'product_16.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (56, 'P001', 'Gnocchi di nonna Alice', 26, 5, '24 - 250 g pkgs.', 38.00, 21, 10, 30, b'0', 'product_01.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (57, 'P001', 'Ravioli Angelo', 26, 5, '24 - 250 g pkgs.', 19.50, 36, 0, 20, b'0', 'product_08.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (58, 'P001', 'Escargots de Bourgogne', 27, 8, '24 pieces', 13.25, 62, 0, 20, b'0', 'product_11.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (59, 'P001', 'Raclette Courdavault', 28, 4, '5 kg pkg.', 55.00, 79, 0, 0, b'0', 'product_02.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (60, 'P001', 'Camembert Pierrot', 28, 4, '15 - 300 g rounds', 34.00, 19, 0, 0, b'0', 'product_17.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (61, 'P001', 'Sirop d\'érable', 29, 2, '24 - 500 ml bottles', 28.50, 113, 0, 25, b'0', 'product_11.png', '', NULL, NULL, '2023-01-07', 'api');
INSERT INTO `mst_products` VALUES (62, 'P001', 'Tarte au sucre', 29, 3, '48 pies', 49.30, 17, 0, 0, b'0', 'product_15.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (63, 'P001', 'Vegie-spread', 7, 2, '15 - 625 g jars', 43.90, 24, 0, 5, b'0', 'product_06.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (64, 'P001', 'Wimmers gute Semmelknödel', 12, 5, '20 bags x 4 pieces', 33.25, 22, 80, 30, b'0', 'product_16.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (65, 'P001', 'Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 - 8 oz bottles', 21.05, 76, 0, 0, b'0', 'product_13.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (66, 'P001', 'Louisiana Hot Spiced Okra', 2, 2, '24 - 8 oz jars', 17.00, 4, 100, 20, b'0', 'product_14.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (67, 'P001', 'Laughing Lumberjack Lager', 16, 1, '24 - 12 oz bottles', 14.00, 52, 0, 10, b'0', 'product_03.png', '', NULL, NULL, '2023-01-07', 'api');
INSERT INTO `mst_products` VALUES (68, 'P001', 'Scottish Longbreads', 8, 3, '10 boxes x 8 pieces', 12.50, 6, 10, 15, b'0', 'product_13.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (69, 'P001', 'Gudbrandsdalsost', 15, 4, '10 kg pkg.', 36.00, 26, 0, 15, b'0', 'product_14.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (70, 'P001', 'Outback Lager', 7, 1, '24 - 355 ml bottles', 15.00, 15, 10, 30, b'0', 'product_11.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (71, 'P001', 'Flotemysost', 15, 4, '10 - 500 g pkgs.', 21.50, 26, 0, 0, b'0', 'product_06.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (72, 'P001', 'Mozzarella di Giovanni', 14, 4, '24 - 200 g pkgs.', 34.80, 14, 0, 0, b'0', 'product_04.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (73, 'P001', 'Röd Kaviar', 17, 8, '24 - 150 g jars', 15.00, 101, 0, 5, b'0', 'product_03.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (74, 'P001', 'Longlife Tofu', 4, 7, '5 kg pkg.', 10.00, 4, 20, 5, b'0', 'product_14.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (75, 'P001', 'Rhönbräu Klosterbier', 12, 1, '24 - 0.5 l bottles', 7.75, 125, 0, 25, b'0', 'product_01.png', '', NULL, NULL, NULL, NULL);
INSERT INTO `mst_products` VALUES (76, 'P001', 'Lakkalikööri', 23, 1, '500 ml', 18.00, 57, 0, 20, b'0', 'product_08.png', '', NULL, NULL, '2023-01-07', 'api');
INSERT INTO `mst_products` VALUES (77, 'P001', 'Original Frankfurter grüne Soße', 12, 2, '12 boxes', 13.00, 32, 0, 15, b'0', 'product_06.png', '', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mst_shippers
-- ----------------------------
DROP TABLE IF EXISTS `mst_shippers`;
CREATE TABLE `mst_shippers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mst_shippers
-- ----------------------------
INSERT INTO `mst_shippers` VALUES (1, 'P001', 'Speedy Express', '(503) 555-9831', NULL, NULL, NULL, NULL);
INSERT INTO `mst_shippers` VALUES (2, 'P001', 'United Package', '(503) 555-3199', NULL, NULL, NULL, NULL);
INSERT INTO `mst_shippers` VALUES (3, 'P001', 'Federal Shipping', '(503) 555-9931', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mst_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `mst_suppliers`;
CREATE TABLE `mst_suppliers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `region` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fax` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `homepage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_name`(`company_name`) USING BTREE,
  INDEX `postal_code`(`postal_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mst_suppliers
-- ----------------------------
INSERT INTO `mst_suppliers` VALUES (1, 'P001', 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (2, 'P001', 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, '#CAJUN.HTM#', NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (3, 'P001', 'Grandma Kelly\'s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (4, 'P001', 'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai Musashino-shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (5, 'P001', 'Cooperativa de Quesos \'Las Cabras\'', 'Antonio del Valle Saavedra', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (6, 'P001', 'Mayumi\'s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko Chuo-ku', 'Osaka', NULL, '545', 'Japan', '(06) 431-7877', NULL, 'Mayumi\'s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#', NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (7, 'P001', 'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (8, 'P001', 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King\'s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (9, 'P001', 'PB Knäckebröd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Göteborg', NULL, 'S-345 67', 'Sweden', '031-987 65 43', '031-987 65 91', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (10, 'P001', 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'Sao Paulo', NULL, '5442', 'Brazil', '(11) 555 4640', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (11, 'P001', 'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstraße 5', 'Berlin', NULL, '10785', 'Germany', '(010) 9984510', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (12, 'P001', 'Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Germany', '(069) 992755', NULL, 'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#', NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (13, 'P001', 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Germany', '(04721) 8713', '(04721) 8714', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (14, 'P001', 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italy', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#', NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (15, 'P001', 'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Norway', '(0)2-953010', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (16, 'P001', 'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue Suite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (17, 'P001', 'Svensk Sjöföda AB', 'Michael Björn', 'Sales Representative', 'Brovallavägen 231', 'Stockholm', NULL, 'S-123 45', 'Sweden', '08-123 45 67', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (18, 'P001', 'Aux joyeux ecclésiastiques', 'Guylène Nodier', 'Sales Manager', '203, Rue des Francs-Bourgeois', 'Paris', NULL, '75004', 'France', '(1) 03.83.00.68', '(1) 03.83.00.62', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (19, 'P001', 'New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept. 2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'USA', '(617) 555-3267', '(617) 555-3389', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (20, 'P001', 'Leka Trading', 'Chandra Leka', 'Owner', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Singapore', '555-8787', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (21, 'P001', 'Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild Fiskebakken 10', 'Lyngby', NULL, '2800', 'Denmark', '43844108', '43844115', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (22, 'P001', 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop Rijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 1210', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (23, 'P001', 'Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finland', '(953) 10956', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (24, 'P001', 'G\'day, Mate', 'Wendy Mackenzie', 'Sales Representative', '170 Prince Edward Parade Hunter\'s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', 'G\'day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#', NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (25, 'P001', 'Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '2960 Rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-9022', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (26, 'P001', 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Italy', '(089) 6547665', '(089) 6547667', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (27, 'P001', 'Escargots Nouveaux', 'Marie Delamare', 'Sales Manager', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'France', '85.57.00.07', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (28, 'P001', 'Gai pâturage', 'Eliane Noz', 'Sales Representative', 'Bat. B 3, rue des Alpes', 'Annecy', NULL, '74000', 'France', '38.76.98.06', '38.76.98.58', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mst_suppliers` VALUES (29, 'P001', 'Forêts d\'érables', 'Chantal Goulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'Québec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 4, 'API Token', '731f29362e40910b0bc436263a473881d22d2928c80be36e524cce69501c5ad3', '[\"*\"]', NULL, NULL, '2022-12-01 06:18:17', '2022-12-01 06:18:17');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', 4, 'API Token', '8a5c49115bd41f9273d984f8ba1652e8456872c8a1bc54b25d7c1b78b4a52a13', '[\"*\"]', '2022-12-01 10:37:29', NULL, '2022-12-01 10:35:47', '2022-12-01 10:37:29');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Administrator', NULL, NULL, NULL, NULL);
INSERT INTO `roles` VALUES (2, 'User', NULL, NULL, NULL, NULL);
INSERT INTO `roles` VALUES (3, 'Manager', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tasks_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (1, 2, 'Est consequatur atque hic aliquam accusamus mollitia ut.', 'Test Consequuntur beatae cupiditate inventore. Earum minima ut corporis blanditiis aliquid qui officiis voluptatem. Expedita sint ea impedit unde. Libero dolor repudiandae sed sint adipisci non.', 'low', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (2, 4, 'Omnis autem autem sit suscipit neque.', 'Natus qui possimus error eius et. Cupiditate harum excepturi omnis. Tempore tenetur non dolores quia voluptas reprehenderit et. Reprehenderit qui et omnis modi magnam.', 'high', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (3, 2, 'A vel et cum eveniet.', 'Aut et modi voluptas eum. Ut magni consectetur est omnis quod nobis ipsam velit. Cupiditate consectetur vitae in qui repudiandae est. Maxime modi asperiores et omnis nisi rerum consequatur.', 'medium', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (4, 3, 'Aut natus fugiat voluptates ipsam.', 'Dicta non ut incidunt qui. Facilis iure qui animi facere corporis. Ratione eum qui impedit dignissimos error omnis. Excepturi eius quo ex soluta necessitatibus suscipit exercitationem.', 'high', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (6, 4, 'Cumque consequatur quo sit sed officiis quis.', 'Enim quia aut voluptate. Voluptatum reprehenderit voluptatem expedita nisi. Non eveniet minima ut. Illo illo numquam voluptatum suscipit ex magnam.', 'high', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (7, 3, 'Quo praesentium magnam sit eos non magni dicta.', 'Amet totam est ut molestiae fugit doloribus. Sed aut saepe modi eum. Delectus numquam qui sapiente exercitationem adipisci harum. Ea unde modi atque omnis nulla maiores voluptates asperiores.', 'medium', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (8, 1, 'Inventore deserunt nemo dolor exercitationem consectetur.', 'Dolore minus quod consequatur ea iusto earum libero. Esse neque facilis et consequatur assumenda. Error ipsum laboriosam beatae.', 'high', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (9, 2, 'Quae quidem inventore ea aut laboriosam unde.', 'Sed aliquam adipisci minus voluptatem et a sed. Consequatur necessitatibus ut magnam esse. Corrupti ad voluptas aliquam ea eos.', 'medium', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (10, 2, 'Nesciunt laudantium dolorem libero qui sed id esse perspiciatis.', 'Aliquid consequatur et qui id optio. Rerum est nulla eos impedit. Accusamus est numquam est eos. Et amet est recusandae sit.', 'low', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (11, 1, 'Facilis aperiam repellendus placeat nihil.', 'Dolorem quaerat dignissimos consequuntur. Facere a molestiae qui. Et at ullam ut itaque nobis. Voluptatum sed iure nostrum.', 'medium', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (12, 1, 'Suscipit at voluptatibus sapiente.', 'Nobis nemo aut ea cumque dicta. Qui quas molestiae rerum et. Ea rerum quis sit est eaque velit necessitatibus. Totam ut optio aspernatur et quo.', 'high', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (13, 3, 'Debitis neque laborum recusandae aut voluptas voluptates.', 'Nam ut quod est error omnis. Aut maxime molestiae iusto ea iure aut. Aut suscipit molestiae cumque cum. Consequatur ex vel quos. Quo at quia quis ea excepturi sunt praesentium nihil.', 'medium', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (14, 2, 'Sequi nihil quia magnam facilis dolore nihil earum aliquid.', 'Labore quaerat provident ut quas quibusdam. Est iste blanditiis nihil saepe quas voluptatum. Molestiae rerum in adipisci aperiam ut eveniet. Saepe reprehenderit assumenda qui eius ipsa.', 'low', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (15, 1, 'Nesciunt molestiae omnis qui tempore.', 'Officiis quos porro doloremque consectetur iure delectus. Maxime laboriosam aut tempora culpa adipisci cum. Et sed sit beatae qui nulla tempore unde.', 'medium', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (16, 4, 'Qui libero occaecati blanditiis culpa debitis aspernatur.', 'Reprehenderit et ut ea eveniet minima vel. Repudiandae voluptatibus vel et distinctio. Natus inventore eos neque dolore consequuntur.', 'low', '2022-12-01 07:21:36', '2022-12-01 07:21:36');
INSERT INTO `tasks` VALUES (17, 3, 'Sed quasi corporis numquam asperiores.', 'Corrupti quo quidem aut rerum et. Et perferendis non adipisci ut qui eveniet dolores dolor. Unde est unde at ut earum. Dignissimos quod facere error dolores. Minima corrupti neque qui.', 'high', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (18, 2, 'Maiores praesentium nam quisquam nemo dicta id.', 'Vel quis est asperiores harum sed et vitae. Et sapiente nesciunt quibusdam ea.', 'medium', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (19, 2, 'Et tenetur est aperiam sunt repellat ut.', 'Quos incidunt autem rerum et ut velit. Sed repudiandae totam asperiores veritatis eaque hic aperiam.', 'low', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (20, 4, 'In atque corporis aperiam totam.', 'Optio sequi repellat optio repudiandae. Fugiat quasi qui voluptas voluptas.', 'low', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (21, 2, 'Minus facere excepturi labore deserunt nemo sit qui.', 'Quisquam quia aut dignissimos ab aut quo. Sint minima ut maxime et. Enim et ex ut voluptatem error molestias. Excepturi adipisci reprehenderit eius tempora.', 'high', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (22, 3, 'Occaecati sunt vel omnis nesciunt eaque soluta omnis at.', 'Sint nihil sapiente sunt quidem reprehenderit necessitatibus molestiae. Eveniet fuga esse velit. Et ducimus est illum dolores temporibus quam repellat.', 'medium', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (23, 2, 'Qui quia est nihil et tempora.', 'Aperiam sed eos aut eius repellendus ut. Nostrum ad sint sapiente accusamus sunt veritatis ut.', 'medium', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (24, 2, 'Sunt quas voluptatibus eum commodi.', 'Veritatis repellendus fugiat sit sint nesciunt soluta. Animi quia inventore corporis possimus.', 'medium', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (25, 3, 'Ut temporibus molestias fugit rerum aperiam.', 'Quo consectetur sint aut. Modi incidunt architecto a exercitationem natus. Ducimus cupiditate repellat consequatur quibusdam sed. Porro quibusdam sint corrupti at explicabo esse.', 'high', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (26, 1, 'Ut est ad dignissimos sit unde nemo numquam.', 'Minima molestiae aut commodi est dicta. Omnis id quia optio necessitatibus soluta beatae.', 'low', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (27, 3, 'Occaecati consequuntur dolore animi ea aperiam.', 'Sunt tempore similique atque asperiores quidem. Nostrum ipsa ab aut sint. Commodi porro itaque quidem sit id sunt. Cum quis necessitatibus sapiente omnis nostrum. Ab et labore ut vero cumque in.', 'high', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (28, 2, 'Architecto exercitationem nihil nihil deleniti dolorum porro.', 'Praesentium incidunt sapiente est voluptatem. Accusamus doloremque totam ut quia voluptas. Sunt explicabo ullam voluptatibus ipsa optio deserunt delectus.', 'high', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (29, 4, 'Cumque fugiat ipsum ut eum assumenda.', 'Ut sunt quibusdam hic officia placeat nulla. Qui ullam exercitationem vero porro vero ut. Aliquam atque magnam culpa commodi dolor. Nobis non voluptatem fugit quasi facilis cum.', 'medium', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (30, 1, 'Repellat veritatis minima non hic et vel.', 'Quia hic voluptates quibusdam odit nobis. Corporis vitae ea quidem tempore repellendus. Atque autem voluptas in laudantium et maiores. Qui natus voluptatum doloremque sint autem qui amet.', 'low', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (31, 2, 'Aliquid nobis animi ab harum.', 'Ad hic dolorem suscipit consectetur est non ipsum. Hic eaque magni quia beatae non. Facilis voluptates tenetur aut voluptatem qui delectus.', 'low', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (32, 4, 'Asperiores adipisci ea consequatur sapiente.', 'Amet voluptas voluptatibus ad quis in qui facere. Vel sunt totam inventore impedit.', 'medium', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (33, 4, 'Et sint necessitatibus voluptas.', 'Deleniti vero molestiae repudiandae distinctio. Possimus quos odio non illo. Nisi et quia maiores officia.', 'low', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (34, 2, 'Delectus beatae tenetur eum iure ut at temporibus.', 'Et voluptatem quas veritatis voluptatem consequatur. Omnis ad ab odit fuga libero accusantium. Et deleniti aliquam dolores.', 'high', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (35, 4, 'Tempora sit autem recusandae voluptatum at quae.', 'Consequatur voluptates est ea quaerat non distinctio. Corrupti consequatur rem nisi aut repellendus voluptas. Voluptatem et voluptatem nemo fugiat amet.', 'low', '2022-12-01 07:21:37', '2022-12-01 07:21:37');
INSERT INTO `tasks` VALUES (36, 2, 'Magnam odio asperiores inventore delectus quaerat doloribus est.', 'Ipsa blanditiis odit corporis. Laboriosam nam iusto nam neque aut ipsum. Vel expedita cum nihil tempora ea. Provident aut est sunt consectetur repellendus at.', 'medium', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (37, 1, 'Deserunt voluptas est vel in reprehenderit mollitia.', 'Saepe delectus optio harum similique. Aut libero quasi debitis corrupti quos illum. Minima est quos non unde eligendi nobis illum. Debitis magnam non non molestiae autem nihil optio.', 'high', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (38, 1, 'Tempore ut magnam reprehenderit perspiciatis aspernatur non quo.', 'Fugit sit voluptatem ullam velit. Earum tempora et rerum corrupti ipsam nostrum.', 'medium', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (39, 4, 'Sit rerum facilis ut mollitia voluptatibus.', 'Voluptas cumque ut et libero quia. Facere assumenda modi non est mollitia cum. Aut et ipsa non. Veritatis eos est in dignissimos voluptates maxime.', 'low', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (40, 1, 'Eligendi ad ex sint veritatis facere quas necessitatibus et.', 'Odio culpa quia et quo placeat velit. Rerum beatae quis non esse nobis ut. Atque ea doloremque quas voluptatem autem rerum rerum. Aspernatur sed aut culpa incidunt enim quia cupiditate voluptatem.', 'low', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (41, 4, 'Recusandae cumque nobis adipisci nesciunt.', 'Consectetur similique omnis temporibus neque assumenda inventore. Quaerat laborum saepe laborum. Quisquam voluptas saepe et laudantium ea. Deleniti beatae voluptatem cumque.', 'high', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (42, 4, 'Modi non perferendis nulla est enim iste est.', 'Consectetur quis maxime cum totam beatae ad. Laudantium aut necessitatibus ex in provident. Voluptatem ipsa quis alias temporibus eos sit voluptas. Doloribus sint consectetur eum voluptatem.', 'low', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (43, 1, 'Enim in necessitatibus omnis sed.', 'Voluptates dicta ex architecto nihil enim praesentium. Doloremque accusantium omnis qui sit eos expedita.', 'medium', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (44, 4, 'Nostrum architecto corporis provident in placeat maiores.', 'Ut ut assumenda velit consequuntur eius totam. Commodi sequi quas est quia amet. Dolorum dolores nihil consequatur rem quasi. Eos eveniet quisquam iure laudantium impedit.', 'high', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (45, 2, 'Omnis repellat quas et aut vel consequatur cumque laborum.', 'Sit porro est ut modi dolorum. Aut et non tempore cum maiores sequi earum. Nesciunt quae eos id non. In dolor cum qui similique.', 'medium', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (46, 2, 'Distinctio ratione debitis neque sunt sit.', 'Dolor a repudiandae debitis provident. Dicta corrupti officiis facere ratione nihil. Ut ut voluptas sit. Laudantium dolorem voluptatem rerum praesentium.', 'high', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (47, 1, 'Est est et dolorem natus.', 'Voluptatem ratione voluptatem quis blanditiis aut. Voluptatibus id asperiores inventore neque laudantium ea.', 'low', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (48, 2, 'Autem debitis qui deleniti non.', 'Quasi enim eligendi nam sit iusto aperiam. Nihil recusandae sapiente aperiam ducimus. In fugiat ut incidunt quis. Assumenda enim saepe quasi nihil et voluptatem eius harum.', 'medium', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (49, 2, 'Magnam nemo tempore quia maxime adipisci.', 'Rem voluptate voluptas autem officia aut fugit eum. Unde nam rerum fugiat molestias et molestiae quos. Eos doloribus minima accusantium eius aut.', 'medium', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (50, 4, 'Quis in aut nemo et et facere ullam impedit.', 'Enim autem magni nesciunt numquam voluptas. Corrupti cum voluptates iste aut distinctio saepe. Cumque repudiandae qui doloremque iste totam. Repellat inventore eum voluptatem sunt sit qui.', 'high', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (51, 1, 'Rerum est est porro saepe sit est.', 'Qui aliquam porro tempore facilis ex. Recusandae rerum ut exercitationem dolores. Accusamus doloribus porro dolor blanditiis. Id incidunt nulla inventore nesciunt.', 'high', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (52, 3, 'Totam esse quam consequatur dolores quam sint aut.', 'Velit ex repudiandae cupiditate error nulla assumenda. Alias quis et maxime praesentium dolores recusandae. Accusantium repellat autem cumque ratione debitis rem tenetur et.', 'low', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (53, 3, 'Asperiores deserunt qui dolorem.', 'Libero in aut in animi et et est. Laborum vel autem commodi eos accusantium aut quasi.', 'low', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (54, 1, 'Iste doloremque rerum suscipit perferendis debitis distinctio impedit.', 'Animi cum tempora voluptates consequatur quae sunt tenetur. Ipsum aut aliquam at nisi non at. Aliquam eum ullam quam vel eum.', 'low', '2022-12-01 07:21:38', '2022-12-01 07:21:38');
INSERT INTO `tasks` VALUES (55, 2, 'Voluptas exercitationem ut porro natus officia.', 'Et eligendi dicta non nesciunt deserunt earum. Omnis eligendi qui vel adipisci facere. Officia laboriosam dolor aut ex impedit explicabo laboriosam.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (56, 2, 'Odio qui dolorem non beatae.', 'Totam quisquam ut labore magnam. Doloribus nihil qui eius distinctio. Consequatur veritatis ea id voluptatem.', 'low', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (57, 4, 'Amet ut dolore suscipit ut molestias voluptatibus.', 'Adipisci ex qui ut qui qui ullam. Aut illo est quis at dolorem illum sunt. Tenetur veritatis optio illum expedita eos et. Modi repellat aut praesentium.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (58, 2, 'Exercitationem voluptatem aut qui eligendi aut.', 'Reprehenderit vero molestias sint dolores vel quia doloremque. Vel numquam nemo beatae officia repellendus vel neque. Corrupti voluptate officiis non.', 'low', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (59, 2, 'Laboriosam minima qui dicta doloremque.', 'Enim ut aut architecto quibusdam. Fuga saepe placeat velit et atque assumenda quia. Quia in modi est libero quo. Commodi quibusdam corrupti quae consequatur corrupti ea consequatur.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (60, 4, 'Eos deleniti vel eaque sapiente.', 'Sed aut illum facilis et cum quaerat. Quas vel aut rerum accusantium qui. Et odio consequatur maxime sit voluptate quisquam. Quia nihil magnam aut.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (61, 1, 'Fugiat rerum commodi ad.', 'Molestiae et natus in dolores sed. Qui consequatur ducimus iusto. Sit molestiae porro voluptatem tempore aspernatur quis iusto.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (62, 1, 'Occaecati voluptatum consectetur ut voluptates recusandae laborum.', 'Alias provident ipsum exercitationem. Nobis fugit vel magnam molestiae. Quis ab cum qui velit qui sed consequatur. Soluta at rerum quis explicabo voluptates.', 'medium', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (63, 4, 'Aut repudiandae nulla dolores corrupti magni omnis.', 'Officia voluptatibus id et perferendis. Rerum soluta atque non ipsa. Dicta facere omnis iure magnam officiis magnam. Fugit quos porro aspernatur dicta adipisci iusto laborum occaecati.', 'medium', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (64, 3, 'Ea veritatis ipsa qui eveniet necessitatibus in nesciunt.', 'Ut totam qui commodi consequatur eius. Minima ipsa porro enim earum. Eveniet sint veritatis enim doloremque inventore. Provident expedita est eum tempora.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (65, 1, 'Ipsa ea quis porro veniam est nihil debitis.', 'Porro laboriosam dolorum debitis quas. Aliquam sunt autem magnam est. Facere illo esse inventore in consequuntur.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (66, 4, 'Et sed ut numquam inventore ut velit placeat qui.', 'Ipsam et saepe enim consequatur officiis. Vel est praesentium est consectetur unde. Rerum libero nemo ratione voluptates.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (67, 4, 'Et voluptas minus aut explicabo officia facilis ab.', 'Repellendus amet nam architecto sunt est doloribus tenetur. Non neque atque maxime quidem odit. Aut qui rerum facere nam eligendi et voluptatem. Ut iusto vel est temporibus. Quasi odio ad eum.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (68, 4, 'Quia repudiandae ipsa aut ipsa consequatur labore fugit nobis.', 'Autem facere exercitationem iure sit. Molestiae quasi rerum animi voluptatum recusandae. Neque dolor explicabo quisquam. Nostrum et vel vel ea.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (69, 4, 'Assumenda dolore ea illo consequatur ipsa quia.', 'In aut similique quas at officia quo. Repellat sed natus ea alias delectus. Sed rerum quo modi architecto et sequi id beatae.', 'low', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (70, 3, 'Dolores sapiente non aspernatur accusamus.', 'Aliquam ut blanditiis consequatur amet. Ipsa consequatur consectetur a excepturi. Repudiandae totam tenetur autem quae et. Inventore voluptatem sit libero.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (71, 3, 'Incidunt qui provident molestiae.', 'Quisquam consequuntur est ut vitae sunt aspernatur qui. Tenetur iste voluptatum aut. Quo a amet voluptas quisquam mollitia eum.', 'low', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (72, 1, 'Totam numquam earum odio quis tenetur dolorem et.', 'Id eaque architecto nisi vel voluptatem fugiat cupiditate. Quisquam officiis nihil sit cum sapiente voluptas perspiciatis et. Molestiae consequatur eum perferendis quo.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (73, 1, 'Ullam sint sint commodi.', 'Voluptate et et quam praesentium atque. Eos aut commodi architecto fugit. Corrupti doloremque beatae dolorum.', 'low', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (74, 1, 'Hic non consequatur odit dignissimos unde aut voluptatem esse.', 'Aut impedit unde optio et ut voluptas nesciunt quisquam. Dolorem occaecati tempora molestiae ad voluptatum.', 'medium', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (75, 3, 'Recusandae maiores alias et eum.', 'Ad molestiae ea rerum corrupti. Dolorem aut eum accusantium laboriosam. Excepturi occaecati asperiores sunt. Nihil quod quod est et commodi voluptate porro.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (76, 1, 'Hic illo similique veritatis.', 'Reiciendis sunt qui a quia fugiat excepturi occaecati. Nulla repellendus omnis expedita adipisci aut quaerat omnis. Non delectus et maiores quaerat.', 'low', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (77, 4, 'Odit id qui numquam quibusdam.', 'Accusamus velit id est vel labore amet. Ut esse esse qui blanditiis qui nemo error. Ad qui harum voluptas molestiae. Iure veritatis voluptate laboriosam ratione.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (78, 3, 'Saepe amet nihil nemo praesentium consequatur nesciunt et.', 'Id nam in voluptate incidunt quia. Animi enim velit illo laboriosam ratione vero sed. A libero sapiente numquam possimus et.', 'medium', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (79, 2, 'Quasi sit nobis sunt rerum quas.', 'Tenetur quo enim ea est. Dolore quae modi adipisci nemo. Vel quia vel illo nesciunt.', 'medium', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (80, 3, 'Praesentium aut odit earum.', 'At sed similique eius rerum. Deleniti illo nostrum dolores aut sunt. Voluptas vel officiis repellat eos qui ea numquam. Dolor pariatur incidunt assumenda quae.', 'high', '2022-12-01 07:21:39', '2022-12-01 07:21:39');
INSERT INTO `tasks` VALUES (81, 1, 'Vitae tempora ut ut ab sint necessitatibus officiis.', 'Veniam itaque aliquam cum. Molestiae voluptas ducimus quo voluptatibus ex sequi.', 'high', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (82, 3, 'Quos quod sit necessitatibus et.', 'Ab ut non rerum atque numquam quia est veritatis. Libero qui illum et facere dolores quae quia. Sapiente et quia exercitationem quo. Provident qui vel non consequuntur ut.', 'low', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (83, 2, 'Animi reprehenderit vel maiores quis.', 'Rerum voluptatibus nobis voluptas at esse culpa consequuntur. Quam voluptatem quis pariatur. Aut eos distinctio odit corporis ad.', 'low', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (84, 3, 'Et nesciunt qui quis.', 'Quia similique ipsa modi voluptatem. Reprehenderit laboriosam autem et et id consectetur. Commodi nostrum aliquid doloribus est. Est quis voluptatem natus eos.', 'high', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (85, 4, 'Necessitatibus ut magnam aliquid hic corrupti iure.', 'Aut soluta sed ipsum libero ipsa aut alias est. Qui et enim dicta itaque. Velit necessitatibus dolores numquam quisquam corrupti asperiores. Veniam minima neque eum eaque.', 'low', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (86, 4, 'Facilis sunt nihil blanditiis eos est laborum.', 'Aspernatur quis quam cum. At aut fugiat odio accusantium nulla dignissimos cupiditate itaque. Rem quam quia eaque accusantium vel hic dolor. Natus natus natus sequi consectetur similique ex.', 'low', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (87, 3, 'Temporibus et ut ea et.', 'Laudantium et sed corporis et. Quae molestias quisquam rem. Est quae ea minus. Molestiae voluptatem in voluptas aut voluptas placeat architecto.', 'low', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (88, 3, 'Deserunt dolores aut aspernatur quod qui molestias.', 'Nobis laudantium quo dolorum voluptatum nihil provident. Occaecati ut odio ut. Optio illum dolore beatae.', 'high', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (89, 1, 'Sit consequatur quasi consequatur repellendus voluptatem.', 'Consequatur dolor voluptatibus inventore aliquam. Labore nisi quasi eos consequatur animi quod debitis. Vel qui labore et. Placeat et iusto facere impedit quidem et et ad.', 'medium', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (90, 2, 'Non illo accusantium labore alias.', 'Sequi et nobis molestiae facere commodi neque. Vel maxime id unde illo est. Porro sunt repellat et. Et amet sint aliquam libero ipsam.', 'low', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (91, 1, 'Incidunt quisquam consequuntur alias reprehenderit esse unde.', 'Quisquam voluptates possimus et id iste placeat quo. Placeat saepe est labore non autem. Non et dolor totam assumenda quaerat corporis ducimus dolore.', 'medium', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (92, 2, 'Sed eaque voluptas ipsam aut.', 'Numquam qui quia aspernatur tempore non et. Dignissimos impedit neque velit odit. Repellat id magni nisi porro nihil. Dolores laboriosam et ut dolores.', 'medium', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (93, 3, 'Qui illo amet non fugit accusantium.', 'Vero reiciendis dolorem exercitationem ut velit at. Repellendus voluptatem et nulla deleniti sed. Commodi vitae aut ut expedita nihil qui.', 'low', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (94, 3, 'Quisquam occaecati cumque hic iste.', 'Consectetur corrupti magnam in sint consequuntur. Quam corrupti ipsum labore quo. Ut ut adipisci ea.', 'high', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (95, 1, 'Odit est unde et cum.', 'Eius rerum tenetur maiores doloremque. Ut voluptatem consequatur at ut commodi. Dolorem quia accusantium velit ut quis debitis minima nostrum. Ea ad reiciendis voluptate.', 'high', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (96, 1, 'Sapiente voluptatem voluptatem molestias ut nemo perferendis in.', 'Placeat sed consequuntur consequuntur omnis eos iure dolor. Hic est libero incidunt delectus.', 'medium', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (97, 3, 'Facere ab veritatis nobis magni amet.', 'Voluptatum qui inventore suscipit dolor nam esse sed est. Enim quia eveniet dicta qui. Eos nulla impedit quibusdam id delectus. Libero voluptas aut incidunt maiores eaque.', 'low', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (98, 3, 'Molestiae dolorem quasi rerum eius.', 'Error ea distinctio quam repellendus cumque iste. Omnis molestias autem aut quae voluptatem voluptatem ad culpa. Eum repellat sed reiciendis est. Optio veniam itaque sint accusantium.', 'low', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (99, 3, 'Ea nostrum consequatur est occaecati et.', 'Corporis accusamus fugit enim et impedit. Rerum recusandae cum cum. Voluptatibus qui esse minus sapiente quo aspernatur corrupti omnis. Aut amet aliquid dolorem provident minima soluta et.', 'medium', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (100, 4, 'Perspiciatis ut non provident qui.', 'Rem nihil voluptatem suscipit explicabo omnis. Et doloribus aut officia corporis ea quis dolorem. Possimus eos voluptatem voluptate et. Quaerat et dolorem dignissimos et consequatur commodi optio et.', 'low', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (101, 3, 'Repellat esse magnam sit provident vero.', 'Quia voluptatem aut amet sit qui molestias. Modi totam sint similique tempora porro voluptates rerum. Eligendi similique rerum assumenda autem et eum.', 'medium', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (102, 1, 'Rerum commodi adipisci vel nihil nam repellat omnis aliquam.', 'Expedita quia nihil porro quas. Asperiores et quia eveniet. Deleniti enim fugiat amet ad qui.', 'medium', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (103, 3, 'Tempore ut vel ut alias ut.', 'Impedit voluptates voluptate iste nisi eos. Rem facere expedita non quae corporis expedita eum. Dolores libero minima quam officiis.', 'high', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (104, 2, 'Ducimus sequi non maxime consequatur ea eum distinctio.', 'Debitis maiores dolorem neque. Ratione inventore perspiciatis est ut deleniti enim omnis. Adipisci quam illum id. Ut distinctio odio quia illum ut veniam.', 'high', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (105, 2, 'Nam laudantium ut qui velit repellendus culpa qui.', 'Veniam harum deserunt mollitia. Sint iste et numquam impedit et omnis aspernatur. Suscipit repellendus dolores quia molestias doloremque veniam porro. Quia et est alias id.', 'low', '2022-12-01 07:21:40', '2022-12-01 07:21:40');
INSERT INTO `tasks` VALUES (106, 1, 'Quisquam ea ipsa dolor dolorem.', 'Et modi est id sunt autem est. Est fugit laborum cum tenetur molestias. Voluptas voluptatum nisi ad doloremque atque. Non voluptate harum magni ipsam nihil eos.', 'high', '2022-12-01 07:21:41', '2022-12-01 07:21:41');
INSERT INTO `tasks` VALUES (107, 1, 'Omnis delectus quia nesciunt illo illum doloribus temporibus.', 'Dicta iste vel incidunt saepe. Minus quis ut provident quaerat id. Corporis fugit enim sint porro corporis. Non iusto officia et repellendus asperiores ullam possimus magni.', 'low', '2022-12-01 07:21:41', '2022-12-01 07:21:41');
INSERT INTO `tasks` VALUES (108, 3, 'Ut ab dolorem doloribus.', 'Cumque optio temporibus qui sit et sed consequatur repellendus. Enim sed commodi velit aliquam quia quidem. Itaque sed rerum et. Ut voluptas dignissimos est eligendi nihil velit fugiat.', 'low', '2022-12-01 07:21:41', '2022-12-01 07:21:41');
INSERT INTO `tasks` VALUES (109, 1, 'Ipsam vel ea possimus minima et incidunt atque.', 'Soluta voluptatem adipisci repellat debitis repellat voluptatem nesciunt. Omnis nostrum aliquam eum. Cumque assumenda perferendis aut delectus qui corrupti. Eum quam dicta placeat omnis.', 'low', '2022-12-01 07:21:41', '2022-12-01 07:21:41');
INSERT INTO `tasks` VALUES (110, 3, 'Aliquam dolores sed ratione quis deserunt.', 'Possimus dolorum rem fugit deleniti ut at. Molestiae sint iste voluptate modi. Sunt ea voluptatibus sint ut neque commodi vel.', 'medium', '2022-12-01 07:21:41', '2022-12-01 07:21:41');
INSERT INTO `tasks` VALUES (111, 4, 'Non laborum et earum velit architecto.', 'Dolorum exercitationem asperiores maxime aut eum. Tempore quas aliquam voluptatum itaque aspernatur totam eum. Impedit reprehenderit enim ullam et nemo ut.', 'high', '2022-12-01 07:21:41', '2022-12-01 07:21:41');
INSERT INTO `tasks` VALUES (112, 2, 'Est dolor beatae nisi commodi inventore ut neque.', 'Quos consectetur tempore consequuntur nam. Voluptate cupiditate est omnis. Voluptatem sed facere aut inventore.', 'high', '2022-12-01 07:21:41', '2022-12-01 07:21:41');
INSERT INTO `tasks` VALUES (113, 4, 'Quia nostrum magnam sint excepturi maiores quasi.', 'Et non officia quia. Id iure eos cupiditate id architecto facere sed necessitatibus. Rerum qui voluptas harum eos et laudantium nisi.', 'low', '2022-12-01 07:21:41', '2022-12-01 07:21:41');
INSERT INTO `tasks` VALUES (114, 3, 'Laudantium accusantium magni repellendus non temporibus dolores dolorem.', 'Laboriosam quo illo qui eum odio quaerat. Totam ut et laudantium placeat dolorum. A iusto totam quod expedita. Reiciendis placeat inventore omnis non laudantium animi est.', 'high', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (115, 4, 'Dolor veniam quibusdam sed et.', 'Nemo magni quos nihil et perspiciatis. Vel deleniti quas rerum eum voluptates et vero. Error quia et fuga laudantium.', 'medium', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (116, 4, 'Possimus quo impedit veniam corrupti.', 'Ex deserunt quia nisi voluptatibus voluptate sunt. Maiores et exercitationem sed ab minima. Natus et accusamus dolores quas ut aspernatur aut eos. Aut qui voluptatem maiores optio.', 'low', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (117, 2, 'Beatae corrupti aut et minus laborum laudantium esse.', 'Maiores est qui sed possimus doloribus dolores. Consequuntur iste voluptatem inventore. Itaque unde illo quis adipisci est sit. Optio nihil et corporis officia porro harum pariatur.', 'low', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (118, 4, 'Ex est deserunt voluptas.', 'Ut maiores iusto facilis voluptatem accusamus vel autem. Aperiam nobis ratione non ullam officia. Cum voluptas rem autem et expedita corrupti debitis.', 'high', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (119, 4, 'Et sed sit repellat aut distinctio.', 'Deleniti labore voluptatem ut illo mollitia. Reprehenderit voluptatum tempore excepturi aut.', 'high', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (120, 4, 'Illo nostrum laborum necessitatibus eos dolor omnis.', 'Eveniet enim aut cum eligendi et. Quod nisi quo facere voluptates ducimus. Quis praesentium aliquam sit et nisi. Recusandae voluptas et molestiae et aut dicta.', 'low', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (121, 4, 'Libero libero harum consequuntur repellendus reiciendis assumenda blanditiis.', 'Voluptas ratione rerum ipsum quos veniam vitae. Voluptas molestias iure numquam asperiores quis est alias numquam.', 'low', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (122, 1, 'Magnam expedita sed neque voluptatem.', 'Enim aut et accusamus sit. Deleniti qui ullam tenetur incidunt voluptatem. Laboriosam dicta ut voluptatum corporis. Dolores voluptate laborum sint quis est.', 'medium', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (123, 1, 'Ea et repellendus enim corrupti.', 'Eum rem animi ut et est rerum. Dolore aliquam saepe aut. Vitae dolores officiis delectus aut. Non animi deserunt aut totam est.', 'medium', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (124, 3, 'Error fuga veniam eligendi quas voluptatem.', 'Et exercitationem recusandae laudantium optio aut autem. Est laudantium ullam sit aut. Animi voluptatibus quia incidunt eos.', 'medium', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (125, 3, 'Sint earum sapiente impedit aut accusamus expedita et.', 'Voluptatem quam et et et et. Quos autem et aperiam et aut quasi nesciunt. Saepe expedita sed velit ex et voluptas dicta.', 'low', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (126, 3, 'Explicabo incidunt natus inventore fuga eos est.', 'Totam itaque quos distinctio quia adipisci. Qui quia id repellat nemo autem. Dicta corporis ipsum ullam itaque cupiditate laudantium. Rerum in debitis ipsam possimus minus.', 'high', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (127, 1, 'Doloribus est voluptatem placeat praesentium.', 'Est cum accusantium omnis temporibus assumenda vitae delectus voluptatibus. Nisi ut temporibus similique. Mollitia laudantium et neque commodi. Laborum illum placeat vel dolorum.', 'high', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (128, 2, 'Molestias animi voluptatum veritatis voluptatem.', 'Unde nihil deleniti animi quod voluptatem molestiae. Ut voluptatem qui minima cupiditate et quis quo. Et eum maxime ut ipsa excepturi temporibus laudantium nihil. Quia harum omnis reprehenderit a.', 'medium', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (129, 2, 'Rerum ut itaque adipisci iusto aliquam aliquam corporis.', 'In est qui est. Sunt molestiae est doloribus id alias sunt. Labore laudantium qui eos asperiores.', 'medium', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (130, 1, 'Aut debitis sit veritatis numquam similique aut qui.', 'Reprehenderit eveniet quos error possimus est doloremque. Repellendus voluptatem sed minima ullam at excepturi. Aut repellendus molestias suscipit omnis.', 'low', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (131, 2, 'Fugit qui sit porro reiciendis non sequi repellat aliquam.', 'Saepe vel magnam molestias ea et quia dolorem. Et non provident quod commodi doloremque consectetur. Quos ullam beatae quasi suscipit. Qui voluptatem aut rerum praesentium.', 'low', '2022-12-01 07:21:42', '2022-12-01 07:21:42');
INSERT INTO `tasks` VALUES (132, 3, 'Est modi doloribus voluptatem id aut.', 'In numquam deserunt at vel commodi sed. Laboriosam sint non iusto. Quae iure voluptas quia autem at eum.', 'medium', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (133, 3, 'Tempore sit animi maiores accusantium.', 'Totam ex tempore temporibus repellat deleniti neque. Adipisci saepe voluptatibus voluptate quidem excepturi non. Illo molestias quasi nobis quos saepe.', 'high', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (134, 2, 'Sequi minus qui magnam et voluptatem quos blanditiis.', 'Molestias voluptas inventore doloribus corrupti harum dolorum eos dolorum. Quibusdam nemo aperiam atque ut dolorum quis. Qui repudiandae rerum nihil reiciendis in neque occaecati.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (135, 3, 'Tempora quam at tenetur at.', 'Modi velit aut ipsum eaque fuga. Eos velit autem ipsam ad. Accusantium corporis ex recusandae sapiente enim aliquam. Autem quia voluptas aliquid accusamus quisquam ipsam ad.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (136, 4, 'Eos voluptatem nemo vel magni.', 'Enim molestias non fugiat expedita veritatis. Nihil aut molestiae iste aut occaecati deserunt. Quia ut ducimus laboriosam distinctio et. Soluta ut ut cum consequatur voluptas vero.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (137, 2, 'Qui et minus perferendis omnis odit quis.', 'Sint magni est enim vitae iure aut impedit. Nemo incidunt labore qui facere temporibus blanditiis.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (138, 1, 'Sit autem optio animi omnis nam aliquam.', 'Laborum molestiae id fugiat qui. Est possimus et adipisci aspernatur. Autem error eum assumenda provident. Suscipit doloribus et dolor omnis. Quis molestiae in nisi sunt consectetur enim.', 'medium', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (139, 4, 'Sequi explicabo error sapiente et molestiae corporis.', 'Ea non sequi et ea sit illo minus voluptatem. Fugiat laudantium id quae est. Veniam molestias non quia maxime iusto ab. Dolores repudiandae provident neque repellat cum.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (140, 1, 'Est voluptatem consequatur officia laboriosam dolore ut.', 'Quia corrupti voluptate eum quia error natus suscipit. Modi ea quis et ipsam rerum aspernatur molestias. Quae distinctio est iure ut.', 'medium', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (141, 1, 'Corrupti nam laudantium quia et rerum omnis.', 'Quisquam molestiae reprehenderit aut itaque accusantium ullam hic. Corrupti quasi labore dolorem adipisci fugit reiciendis. Est occaecati consectetur rerum quia facilis.', 'medium', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (142, 1, 'Autem autem at ea totam.', 'Quia id autem eum perspiciatis. Repellat et ut voluptate qui illum delectus itaque facilis. Quidem nesciunt voluptatum illum non. Culpa dolorem culpa in ut voluptas voluptatem.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (143, 3, 'Mollitia explicabo maiores corrupti omnis sed.', 'Aliquam beatae neque excepturi eum. Distinctio eos pariatur officiis enim autem error. Enim quia neque qui necessitatibus dolorem et officia. Molestias voluptatem odit et voluptatem.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (144, 2, 'Libero id maiores rerum porro.', 'Voluptas et tempore rem facilis. Velit laboriosam non et rerum. Et rem distinctio fugit non recusandae dolorum. Temporibus delectus ullam nostrum eius consequatur.', 'medium', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (145, 3, 'Et quaerat architecto voluptatem magnam dicta modi dolorem et.', 'Sit accusamus rerum tempore explicabo. Accusantium et et itaque qui quasi non reiciendis. Ut voluptas quae ea et.', 'high', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (146, 2, 'Asperiores sed voluptate exercitationem nemo quis.', 'Sapiente a quia non qui ullam ut. Et a sint rem velit suscipit ut ipsum voluptas. Earum soluta voluptas eius veritatis cupiditate officia.', 'medium', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (147, 2, 'Aut qui omnis facere explicabo consequatur aut nam.', 'Reprehenderit cumque tempore quo sunt qui. Esse iste ad cupiditate possimus soluta quod. Quo adipisci ratione error assumenda.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (148, 4, 'Eveniet enim modi voluptatibus pariatur.', 'A consequuntur reprehenderit molestias voluptas. Corporis a omnis delectus rerum et maxime soluta mollitia. Cupiditate veniam repellendus eum aperiam corporis.', 'high', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (149, 2, 'Eveniet minus animi repellendus officiis est est in.', 'Dicta sunt qui quia corporis. Reprehenderit blanditiis et tempore eveniet id nihil. Nostrum modi labore et voluptas magnam assumenda modi sit. Alias numquam et nemo quos omnis minima explicabo.', 'medium', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (150, 2, 'Eos libero ex quia sed commodi occaecati.', 'Provident et recusandae qui. Vero consequatur modi tenetur nulla quam repudiandae iure. Est veritatis nulla culpa voluptate.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (151, 2, 'Et enim rerum consequuntur voluptatem molestias necessitatibus.', 'Expedita beatae soluta molestiae incidunt quia enim quia. Repudiandae et molestiae omnis dolorem fugit quos possimus.', 'medium', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (152, 2, 'Non assumenda explicabo qui eius fuga quam.', 'Rerum vitae consequuntur distinctio sint ab optio eos. Voluptatem qui rerum soluta omnis et aut labore. Aut perspiciatis omnis expedita cum dolores fugit eum. Id consequatur et corrupti deserunt sit.', 'medium', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (153, 3, 'Incidunt esse distinctio perspiciatis est.', 'Veritatis saepe debitis laboriosam tenetur. Est quaerat vel id animi qui. Minima sit dolor fugiat doloribus odio laborum.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (154, 4, 'Iusto adipisci consectetur debitis.', 'Natus sit natus illo fuga eligendi itaque perspiciatis. Quos rerum fugiat qui. Ratione praesentium voluptatibus incidunt iste.', 'high', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (155, 4, 'Sequi qui ea sunt rerum quis.', 'Temporibus eos eos ex nostrum numquam sint. Vitae expedita quae nesciunt qui maiores sunt. Architecto a et quo eligendi fugiat. Adipisci quos voluptatem qui illo. Ab repellendus et dolorem.', 'high', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (156, 4, 'Cumque consequatur tenetur ratione doloremque totam.', 'Atque qui qui aut qui. A et sunt eius nostrum quidem quis. Adipisci necessitatibus veritatis earum. Neque expedita a et iure omnis est.', 'medium', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (157, 3, 'Ea debitis esse ratione error facilis ut.', 'Itaque sit doloremque autem optio ex. Id quos ducimus et magni quia sint repellat. Reiciendis reiciendis et illo. Necessitatibus soluta quisquam iure.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (158, 2, 'Qui minus fugiat neque facilis cumque.', 'Rerum eaque nesciunt ratione sapiente aliquid id. Fugiat repellendus iusto dolore non maiores cum omnis. Et cumque doloremque nihil dolor ipsa hic.', 'low', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (159, 2, 'Laudantium in et aut voluptatem quo.', 'Esse voluptatibus repellendus quam sunt. Ratione quis est alias et.', 'medium', '2022-12-01 07:21:43', '2022-12-01 07:21:43');
INSERT INTO `tasks` VALUES (160, 3, 'Voluptates nam pariatur quia qui quo.', 'Id quas placeat voluptas neque illum. Non deleniti amet enim et autem. Ipsum nobis labore quisquam sit blanditiis mollitia ipsam ut. Consequatur sapiente quia quo.', 'high', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (161, 4, 'Aut id ut ipsum reprehenderit et officiis dolorem sapiente.', 'Voluptatem tempore a ea et expedita culpa. Qui minima ut tempora et. Unde et hic aut odio. Dicta explicabo sit explicabo quasi quidem ipsam eum. Repellendus quis fugit dolores amet rerum.', 'high', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (162, 1, 'Et voluptas itaque quaerat sit in.', 'Cupiditate reiciendis consectetur animi assumenda facilis expedita sint. Molestiae fugit ducimus dolorem aspernatur reiciendis sunt ea. Sit porro fugiat culpa. Ea laboriosam et cum ipsum enim.', 'medium', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (163, 4, 'Ut quas autem recusandae asperiores.', 'Rerum consequuntur et accusamus. Odio voluptatum perferendis reprehenderit rem. Sit eum et natus itaque perferendis ipsam ipsum. Rem magni nemo cumque eius ab eos dolores.', 'low', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (164, 3, 'Sequi eveniet magnam sint quas qui eaque dolorem.', 'Unde id sunt est cum molestiae consequuntur. Aut et voluptatem natus omnis. Enim aut voluptatum quam dolores vero.', 'high', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (165, 4, 'Fugit earum deserunt et.', 'Aut commodi earum ut dolorem molestias qui. Neque est assumenda qui labore qui. Aspernatur tempora corrupti nisi enim.', 'low', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (166, 2, 'Cum itaque esse id et.', 'Ut et dolorem reprehenderit nostrum animi occaecati. Voluptates harum non repellat vel quidem voluptatem illum praesentium. Aliquid officiis autem iure enim error dolorem voluptatibus.', 'high', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (167, 2, 'Inventore totam et velit nostrum repudiandae adipisci beatae.', 'Numquam saepe ut est adipisci dolorem facilis. Voluptas et mollitia voluptas. Voluptate ea aut numquam. Non quibusdam libero libero deserunt placeat nobis sed sunt.', 'medium', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (168, 4, 'Neque velit voluptatem sint distinctio voluptatem libero.', 'Distinctio ullam magnam consectetur optio ipsam nemo. Et ipsam dicta velit odit. Voluptatem minus qui ab rerum ratione sit rerum.', 'medium', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (169, 4, 'Exercitationem atque nobis illum delectus.', 'Mollitia consequatur fuga voluptatem reiciendis dolorum. Tempora aut aut ea ipsum ut quia ut.', 'medium', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (170, 1, 'Non modi maiores nostrum dolores quis.', 'Quidem est commodi et consectetur numquam dolor consequatur odio. Libero et ut aliquid. Quisquam nulla pariatur nam laborum. Esse totam iusto et debitis tempore qui.', 'high', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (171, 3, 'Pariatur iure perspiciatis aliquam aspernatur quas.', 'Qui labore fugit nam omnis facere. Ut sint illo enim. Repellat repellendus non modi inventore.', 'medium', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (172, 4, 'Nulla porro fuga saepe error architecto sit labore.', 'Quisquam sed quia nostrum error. Voluptatem vel et et nesciunt illum mollitia. Eum assumenda cumque nobis autem. Consectetur aut labore possimus similique excepturi.', 'low', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (173, 4, 'Provident vel nesciunt quos dolor atque similique.', 'Itaque nesciunt quidem possimus. Velit in quia hic aut. Neque ipsam quia vel autem unde nihil illum. Aliquam quo et illo labore. Ipsum tenetur temporibus consequatur nostrum.', 'low', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (174, 1, 'Unde ut maiores repellendus et impedit perferendis.', 'Enim qui possimus voluptas. Corporis non ut est eligendi ea. Sed repudiandae excepturi assumenda labore quaerat vel. Saepe exercitationem deleniti impedit et impedit.', 'high', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (175, 3, 'Sit magni explicabo similique voluptatibus.', 'Rem voluptas nemo nam odit labore. Illo delectus voluptas voluptas. Earum quo tenetur ipsum. Aut ea debitis dolore quia mollitia nihil quidem.', 'low', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (176, 3, 'Quos autem velit voluptatem dolor amet.', 'Deserunt dolore eveniet sed porro adipisci odit. Qui est deleniti cum voluptas. Voluptatem autem sit totam optio sunt. Debitis et perspiciatis eaque quos iusto dolorem ut.', 'medium', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (177, 3, 'Voluptas ad voluptatem ratione eum.', 'Aut pariatur dolorem iste quidem maxime. Culpa sit delectus molestiae ratione. Impedit debitis eos ullam voluptatibus voluptas. Sint ad eius inventore expedita eligendi.', 'medium', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (178, 4, 'Error at rerum qui alias deleniti.', 'Id cupiditate laboriosam impedit non eum rerum. Et distinctio quasi cupiditate voluptate. Corporis asperiores magnam tenetur error est dolor.', 'medium', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (179, 2, 'Doloremque ex sunt vitae corrupti vel nisi.', 'Sed est non enim voluptate hic aut illum. Aut ab quaerat repellat id in quia. Quia reprehenderit perferendis quidem tempore. Assumenda dolor sint vel quis.', 'low', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (180, 3, 'Ea ut officiis ullam est aliquid error quia.', 'Expedita non fuga totam non. Laboriosam ad qui cumque at. Numquam repellendus ex non.', 'medium', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (181, 1, 'Quam dolorem ratione saepe.', 'Soluta cumque et eos impedit quaerat sunt. Ullam aut qui voluptatem id inventore. Nam nihil deleniti et nam ducimus. Ut aut cum in dolorem. Libero nobis dolores et quibusdam architecto.', 'medium', '2022-12-01 07:21:44', '2022-12-01 07:21:44');
INSERT INTO `tasks` VALUES (182, 2, 'Accusamus deleniti omnis a eius.', 'Vel fugit perspiciatis eum consectetur id. Aut illum omnis facere corrupti velit alias. Quisquam et nam soluta quia aliquid culpa expedita eum. Illum consectetur tempora omnis ad temporibus.', 'medium', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (183, 1, 'Quo quo et culpa ipsum voluptas.', 'Ea odit ut enim qui et. Adipisci voluptate sit iure voluptatem necessitatibus voluptas sit excepturi. Laudantium veniam sint est cumque ea consectetur.', 'medium', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (184, 3, 'Eveniet non quia officiis et.', 'Provident vel cupiditate dolore accusamus modi qui et. Quia hic sapiente neque id beatae et. Earum adipisci sunt molestias assumenda aut. Sit molestias et omnis delectus est cupiditate voluptatem.', 'high', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (185, 1, 'Saepe tenetur quasi est officia.', 'Neque qui labore ut. Earum et distinctio deserunt quidem. Dignissimos unde et doloribus porro molestiae suscipit. Laboriosam laborum molestiae consequatur ipsam sit beatae.', 'low', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (186, 2, 'Est deleniti occaecati quisquam facilis aut voluptatem et.', 'Quis cum nobis officia itaque at. Mollitia rerum voluptas quo et. Sit nam repellat eum. Assumenda qui veritatis nisi aut dolorem voluptate.', 'medium', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (187, 3, 'Assumenda eveniet ducimus sit consectetur.', 'Ipsum rem at asperiores nisi mollitia. Animi natus saepe aspernatur possimus id rerum rerum. Vitae qui debitis sint.', 'high', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (188, 4, 'Recusandae voluptas earum voluptate blanditiis.', 'Esse alias eligendi quas qui nemo. Autem voluptate explicabo totam est sint porro est. Ipsam repellendus placeat minima itaque. Aspernatur veniam quidem omnis officiis.', 'medium', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (189, 4, 'Itaque eos explicabo voluptas enim.', 'Eaque laboriosam aut eaque vel autem velit optio. Dignissimos explicabo est iure rerum natus consequatur et. Corporis sed nam consequatur rerum sit excepturi. Totam voluptas quia ea veritatis.', 'high', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (190, 1, 'Est voluptas reiciendis ad sint veniam rerum modi.', 'Ut quia temporibus est sunt. Aspernatur fugiat quisquam mollitia et. Et consequatur eaque ut. Facere distinctio earum amet rerum eum autem et.', 'high', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (191, 3, 'Sunt nulla ut sit autem nam.', 'Eveniet corporis et voluptate modi sunt. Dolorum id dicta sed ut. Molestiae autem tenetur voluptatem in nulla et repellat. Pariatur quidem aut inventore esse aut.', 'medium', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (192, 2, 'Accusantium reiciendis cupiditate recusandae incidunt architecto.', 'Facere fuga recusandae quos dolorem qui natus consequuntur. In nihil fuga dignissimos nemo nisi voluptatibus velit. Sapiente quam nobis eos ipsam. Sit culpa maxime autem esse et maxime.', 'high', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (193, 3, 'Sed consequatur quidem soluta.', 'Autem labore deleniti nemo et iure. Aut ea corporis alias atque harum consectetur eius maiores. Omnis quis sit quasi fuga accusamus atque. Hic maiores quibusdam qui aut.', 'medium', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (194, 3, 'Praesentium distinctio quam quam explicabo dignissimos nisi autem.', 'Aut tenetur et nihil rerum rem odit. Et minus vitae labore. Dicta commodi dolore non laborum quis quidem et ad. Quisquam deserunt molestiae itaque illo nisi.', 'high', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (195, 4, 'Tempora doloribus corrupti fuga quam.', 'Architecto est doloribus ea velit. Hic quaerat minima a quis beatae ipsam. Quisquam voluptatem expedita quisquam doloribus et ab saepe. Enim ea omnis repudiandae dolore neque fugiat dolores hic.', 'low', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (196, 4, 'Asperiores temporibus quae ut iste debitis vitae ea fugit.', 'Eveniet voluptates corporis facere qui. Ut voluptatem facere aperiam nihil quia veritatis maiores. Numquam eveniet atque ab optio repudiandae. Corrupti enim voluptatum aut doloremque.', 'medium', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (197, 3, 'Omnis facere consequatur quae molestiae quaerat.', 'Qui qui asperiores quas alias reprehenderit architecto sit. Praesentium aut et eos minima.', 'low', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (198, 1, 'Totam sed nobis pariatur qui.', 'Asperiores autem rerum voluptatem error. Deleniti quae sit quaerat. Quaerat sit velit quisquam tempora iusto doloribus commodi maxime.', 'high', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (199, 2, 'Et non explicabo illo exercitationem.', 'Quisquam vel sint porro quasi deleniti nisi cum. Ratione dolorem molestiae facilis earum mollitia. Qui et nihil consequatur dolores ut. Nesciunt quidem vero magni aut deserunt harum dolore.', 'medium', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (200, 4, 'Quibusdam aut quisquam omnis.', 'Accusamus quod placeat non blanditiis. Non possimus qui unde assumenda laborum eaque est. Velit ut unde vero deleniti a eum. Sint asperiores laboriosam dolore ducimus.', 'medium', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (201, 3, 'Beatae ducimus enim aut mollitia perferendis.', 'Et expedita est aut eveniet reprehenderit aut. Incidunt quidem est voluptas aliquid. Qui quibusdam aut illo sint occaecati quae. Vel rerum et sit est reprehenderit.', 'high', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (202, 2, 'Incidunt ut culpa est ex.', 'Voluptas nihil id vero possimus. Sequi exercitationem dolor tempore et rem.', 'medium', '2022-12-01 07:21:45', '2022-12-01 07:21:45');
INSERT INTO `tasks` VALUES (203, 3, 'Vel dolores fuga et blanditiis autem accusantium.', 'Rerum sit perferendis voluptatum quam. Veritatis eligendi repellat expedita eos. Maxime nulla aut et expedita quo voluptas. Rerum itaque at quia minus quaerat culpa. Et dolores voluptas expedita.', 'medium', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (204, 1, 'Dicta saepe dolorem neque nemo laboriosam repellat earum facilis.', 'Qui eos et dolorem dolorem. In in at ut voluptatem. Suscipit aut omnis voluptates repellendus ut.', 'medium', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (205, 4, 'Molestias quia voluptatibus consequatur voluptatem a nisi.', 'Natus et tenetur est in et atque eos. Rerum ea dolor qui ipsa. Alias dicta rerum nostrum quia voluptas vel et. Eos iusto alias temporibus veritatis consectetur.', 'medium', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (206, 3, 'Eum sint ex vel distinctio est.', 'Ullam quia magni sit rerum sint. Rerum assumenda cum consectetur pariatur doloremque. Delectus voluptas laborum et repellendus aut dolorum hic at.', 'medium', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (207, 4, 'Consectetur saepe aut ut ipsa aspernatur minus occaecati atque.', 'Quia rerum necessitatibus veniam eius. Ullam praesentium sed harum accusantium nostrum. Ad aperiam aspernatur assumenda velit.', 'medium', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (208, 1, 'Neque illo est provident sapiente.', 'Eius labore commodi delectus consequuntur incidunt nisi. Officiis aut ad nobis eligendi. Illo quaerat accusamus sit libero excepturi fugit. Ea id qui a consequuntur sed.', 'high', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (209, 1, 'Laudantium libero eligendi sed quis.', 'Dolore temporibus sequi quo consequatur est id quis doloribus. Libero in deleniti eum et perspiciatis sapiente labore. Doloremque in vero sit eos omnis incidunt. Eaque et et nisi impedit.', 'low', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (210, 3, 'Molestiae quaerat sint ut ut distinctio rerum.', 'Quis mollitia eum iste officia eius et earum harum. Quod mollitia molestiae sint qui et quidem. Consectetur omnis eum quia hic autem qui. Aperiam odio voluptates qui qui ipsum.', 'low', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (211, 1, 'Ut voluptatem consequatur incidunt qui nisi mollitia non perferendis.', 'Sed veniam consequatur eligendi ratione. Odit nostrum iste est magnam quos ut consequatur. Sunt asperiores est rerum. Voluptate doloribus dolorum nihil quis libero facere repellat.', 'high', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (212, 1, 'Praesentium voluptatum nisi atque aut sint.', 'Quaerat quisquam sed quisquam eum. Neque et id cum omnis velit eius voluptas. Sunt optio nihil aliquid ad dicta qui quas. Ipsa et sint est ut. Et aut nulla sapiente. Eius alias et eius fugit.', 'medium', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (213, 3, 'Officia et suscipit id neque at.', 'Repudiandae omnis at aspernatur animi. Placeat explicabo quia quidem atque. Dolorem quia dolores et repellendus expedita aut.', 'low', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (214, 3, 'Quae eveniet aperiam aut laboriosam voluptatem earum quas.', 'Aut omnis incidunt nihil numquam culpa. Aut nam saepe doloribus dolor omnis et sapiente asperiores. Omnis maxime ipsum quod saepe inventore vero modi. Nisi voluptatibus tenetur quia aut unde.', 'high', '2022-12-01 07:21:46', '2022-12-01 07:21:46');
INSERT INTO `tasks` VALUES (215, 3, 'Praesentium facilis dolore laborum repudiandae voluptatem non.', 'Quia expedita est voluptatem labore corrupti. Explicabo illum adipisci molestiae eos.', 'high', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (216, 1, 'Dolor eos et quod voluptate aut tenetur.', 'Officia hic sunt dicta ut. Enim ducimus voluptatibus aut repellendus itaque. Sunt voluptates dicta quibusdam quos maiores minus non dolor. Et provident officiis fugiat aut nesciunt magnam.', 'low', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (217, 1, 'Aut quaerat asperiores molestias voluptatibus odit est.', 'Non id ut placeat atque molestias qui commodi explicabo. Eligendi earum velit ea ut fugiat sunt qui. Minus eveniet eaque qui tempore debitis vitae ut.', 'low', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (218, 1, 'Enim et enim dolor dignissimos.', 'Occaecati et maiores dolorem aspernatur sit exercitationem sequi. Voluptatibus quis nisi perspiciatis cum.', 'low', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (219, 1, 'Cumque dolor temporibus at vero sint iusto.', 'Amet nulla ut perspiciatis veritatis beatae dolores. Officiis velit non molestias. Dolorum suscipit doloribus similique tempora ut.', 'low', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (220, 4, 'Ut sed quia atque placeat quaerat maiores.', 'Ducimus nihil delectus ut explicabo. Deserunt omnis sint odit est. Iusto ipsam alias numquam assumenda quaerat quae sapiente.', 'high', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (221, 4, 'Dolorum eveniet sequi ea aliquam quis.', 'Dolorem fugit omnis quia quia modi laborum id. Quis aut dolor iste quo veniam. Blanditiis eligendi quidem eaque omnis quis.', 'low', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (222, 2, 'Et mollitia et quasi in.', 'Recusandae iure ducimus id impedit suscipit aperiam et aut. Est rerum rerum sit aperiam odit aliquam et corporis. Aut et magnam autem perspiciatis. Culpa doloribus debitis ad sapiente molestias.', 'high', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (223, 2, 'Fuga esse fugiat non dolorum.', 'Et aut quibusdam et voluptatem rerum eos non est. Et officiis veritatis alias. Beatae fuga mollitia placeat soluta aut aperiam. Sint ab fuga quaerat quis.', 'high', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (224, 4, 'Quidem asperiores ut est veniam.', 'Qui nihil quo voluptate nemo accusantium. A repudiandae voluptatem et. Tempore sapiente vero nihil aut iure.', 'high', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (225, 1, 'Et quae eveniet occaecati ut quia ut nesciunt.', 'Rerum repellendus facere harum soluta quo. Minima dignissimos nostrum cumque.', 'high', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (226, 3, 'Quia sint aut doloremque.', 'Laudantium sit id odit quaerat. Beatae dolores aut enim odio. Suscipit aut est est error consequatur consequatur voluptate.', 'medium', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (227, 2, 'Quasi facilis tempore et quam aperiam laudantium.', 'Enim qui aliquid repellendus expedita dolor et. Quisquam officia molestias qui recusandae aliquid. Qui et corporis sequi. Ratione fuga et necessitatibus est dignissimos voluptates.', 'low', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (228, 2, 'Et voluptas qui aut et dignissimos.', 'Nobis architecto accusantium et atque. Reiciendis esse harum odit facilis eum adipisci. Sequi perferendis totam ut.', 'low', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (229, 2, 'Eius odio qui aut eveniet quibusdam.', 'Impedit veniam nemo possimus harum in nostrum quia cum. Neque sit et facilis deleniti. Placeat est qui eos ut a quia sint. Nam et qui porro quia.', 'medium', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (230, 2, 'Iusto officiis aliquam modi voluptatem doloribus in.', 'Aperiam nihil nostrum adipisci facere sapiente reprehenderit molestiae aut. Omnis facere qui unde illo. Sed non explicabo natus.', 'low', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (231, 2, 'Officiis incidunt dignissimos culpa esse.', 'Error dolor quo non ea voluptatum molestiae ipsum. Numquam libero dolor et debitis modi eligendi quos. Alias fugit sit modi et est qui consectetur. Qui qui reprehenderit non non cupiditate.', 'low', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (232, 3, 'Deleniti rerum doloremque hic.', 'Dolor odio ea sint quasi quis. Neque impedit qui eius ea autem ea. Nisi aut blanditiis iste id. Autem adipisci praesentium ut sunt repellat.', 'high', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (233, 1, 'Eveniet ea est sit amet sed qui quas.', 'Veniam neque et aut fugit. Nostrum similique enim quae nemo. Provident deleniti molestiae dolores accusamus dolore quia eaque. Ea architecto quidem autem id. Tenetur quidem aut assumenda consequatur.', 'high', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (234, 1, 'Cumque neque rem consequatur ut.', 'Amet et ex corporis alias. Tenetur impedit qui alias nihil ab. Doloribus aut inventore excepturi officia.', 'medium', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (235, 4, 'Rerum repellat accusantium aperiam dolores quasi ipsa.', 'Ab eaque et id. Nobis earum cumque qui est natus consectetur. Consequuntur dolores quia amet qui eligendi quia quasi sint. Mollitia vero iure excepturi aliquid.', 'high', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (236, 1, 'Temporibus sequi ducimus quia sunt natus illum.', 'Vel commodi maxime consectetur qui nemo aut. Quidem autem explicabo iusto non explicabo qui soluta aut. Molestias consequuntur omnis iusto sit animi sed.', 'low', '2022-12-01 07:21:47', '2022-12-01 07:21:47');
INSERT INTO `tasks` VALUES (237, 2, 'Dolorem rem quia excepturi quis sint aut asperiores.', 'Nihil non saepe vel aliquam a numquam et. Quas blanditiis totam dolore iure. Dolorem pariatur voluptas sunt hic ex.', 'low', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (238, 2, 'Consequatur laboriosam quod cupiditate amet facilis.', 'Voluptatibus et molestias impedit ipsa. Odit dolorem quod laudantium sint repudiandae. Earum quam eveniet numquam animi nostrum et. Atque iure eveniet enim doloribus adipisci quidem.', 'low', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (239, 3, 'Modi asperiores harum omnis sapiente.', 'Minima rerum laboriosam ea dolorem. Nobis sint ut saepe illum. Perferendis quisquam et quasi dolor nemo officiis accusamus. Aut dolore atque ducimus et.', 'medium', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (240, 2, 'Qui eos illum consequuntur neque exercitationem rerum.', 'Architecto voluptatibus laborum facere provident. Quo cupiditate optio ut repellendus. Dolores ipsa aliquam veritatis repellendus eaque pariatur quo qui.', 'medium', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (241, 3, 'Occaecati voluptatem consequatur vitae blanditiis.', 'Natus quidem quas nam est nulla quas eos. Ullam ab aspernatur nostrum et. Delectus dolore ut maiores illo qui pariatur quis. Distinctio officiis ea dolor aut vitae. Officia rerum ad velit.', 'medium', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (242, 3, 'Doloribus corrupti delectus perferendis id assumenda qui quaerat natus.', 'Et sed exercitationem consequatur culpa exercitationem. Nobis rerum officia ut qui vitae optio ipsam. Ut dolores quos aut.', 'high', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (243, 2, 'At repellendus doloribus asperiores eligendi totam rerum.', 'Debitis quisquam aperiam nisi itaque eum dolores impedit. Sint omnis ut est ab velit ut rerum. Quis sed qui alias eum. Fugiat impedit eaque sit ab quisquam.', 'high', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (244, 2, 'Dignissimos quod non blanditiis voluptatem.', 'Beatae ipsa unde molestiae dolorum. Dolorem et sit rem. Tempora animi ut magni in. Porro possimus consequatur asperiores accusamus explicabo officiis adipisci. Velit impedit ab quia quos vero id aut.', 'high', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (245, 4, 'Mollitia ipsam consequuntur quos esse.', 'Dolor eligendi et ipsum in. Sit eveniet illo dolorem autem. Voluptatem nihil consequatur quos est vel qui. Quidem omnis tenetur veniam et assumenda repellat.', 'medium', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (246, 2, 'Est recusandae cumque dignissimos autem.', 'Adipisci enim laudantium dignissimos doloremque aperiam. Laborum aperiam et architecto quis fugiat. Praesentium incidunt doloribus excepturi suscipit itaque doloribus.', 'medium', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (247, 4, 'Voluptas veniam nostrum impedit.', 'Quia error sit consequatur. Voluptas aspernatur architecto impedit. Laudantium accusantium corporis cum nulla voluptatem et voluptatibus quos.', 'medium', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (248, 1, 'Qui est quia amet ipsum fuga non.', 'Numquam quasi ad quam esse accusantium fugiat. Qui eligendi est est et ea sit dolores. Autem et est libero. Aut non earum modi nostrum rem ex. Inventore est pariatur sit facere neque quis.', 'medium', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (249, 3, 'Debitis culpa architecto occaecati quos quia officiis in neque.', 'Voluptas at eligendi cumque. Excepturi est mollitia et rerum earum debitis. Officia repellendus ipsum molestiae et delectus voluptas ut. Officia deserunt et dolor ut.', 'low', '2022-12-01 07:21:48', '2022-12-01 07:21:48');
INSERT INTO `tasks` VALUES (250, 3, 'Sed quam unde omnis non incidunt.', 'Ipsum rerum sit ea cupiditate repellendus est excepturi dolorum. Odio et nisi qui nesciunt. Iste omnis est at reprehenderit et culpa. Dolores quia eos velit perferendis aperiam.', 'medium', '2022-12-01 07:21:48', '2022-12-01 07:21:48');

-- ----------------------------
-- Table structure for tr_order_details
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_details`;
CREATE TABLE `tr_order_details`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `unit_price` decimal(19, 2) NOT NULL DEFAULT 0.00,
  `quantity` smallint NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 0,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderid`(`order_id`) USING BTREE,
  INDEX `ordersdrder_details`(`order_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `oroducdsorder_details`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2159 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tr_order_details
-- ----------------------------
INSERT INTO `tr_order_details` VALUES (1, 'P001', 10248, 11, 14.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2, 'P001', 10248, 42, 9.80, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (3, 'P001', 10248, 72, 34.80, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (4, 'P001', 10249, 14, 18.60, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (5, 'P001', 10249, 51, 42.40, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (6, 'P001', 10250, 41, 7.70, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (7, 'P001', 10250, 51, 42.40, 35, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (8, 'P001', 10250, 65, 16.80, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (9, 'P001', 10251, 22, 16.80, 6, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (10, 'P001', 10251, 57, 15.60, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (11, 'P001', 10251, 65, 16.80, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (12, 'P001', 10252, 20, 64.80, 40, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (13, 'P001', 10252, 33, 2.00, 25, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (14, 'P001', 10252, 60, 27.20, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (15, 'P001', 10253, 31, 10.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (16, 'P001', 10253, 39, 14.40, 42, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (17, 'P001', 10253, 49, 16.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (18, 'P001', 10254, 24, 3.60, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (19, 'P001', 10254, 55, 19.20, 21, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (20, 'P001', 10254, 74, 8.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (21, 'P001', 10255, 2, 15.20, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (22, 'P001', 10255, 16, 13.90, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (23, 'P001', 10255, 36, 15.20, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (24, 'P001', 10255, 59, 44.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (25, 'P001', 10256, 53, 26.20, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (26, 'P001', 10256, 77, 10.40, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (27, 'P001', 10257, 27, 35.10, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (28, 'P001', 10257, 39, 14.40, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (29, 'P001', 10257, 77, 10.40, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (30, 'P001', 10258, 2, 15.20, 50, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (31, 'P001', 10258, 5, 17.00, 65, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (32, 'P001', 10258, 32, 25.60, 6, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (33, 'P001', 10259, 21, 8.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (34, 'P001', 10259, 37, 20.80, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (35, 'P001', 10260, 41, 7.70, 16, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (36, 'P001', 10260, 57, 15.60, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (37, 'P001', 10260, 62, 39.40, 15, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (38, 'P001', 10260, 70, 12.00, 21, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (39, 'P001', 10261, 21, 8.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (40, 'P001', 10261, 35, 14.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (41, 'P001', 10262, 5, 17.00, 12, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (42, 'P001', 10262, 7, 24.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (43, 'P001', 10262, 56, 30.40, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (44, 'P001', 10263, 16, 13.90, 60, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (45, 'P001', 10263, 24, 3.60, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (46, 'P001', 10263, 30, 20.70, 60, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (47, 'P001', 10263, 74, 8.00, 36, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (48, 'P001', 10264, 2, 15.20, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (49, 'P001', 10264, 41, 7.70, 25, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (50, 'P001', 10265, 17, 31.20, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (51, 'P001', 10265, 70, 12.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (52, 'P001', 10266, 12, 30.40, 12, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (53, 'P001', 10267, 40, 14.70, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (54, 'P001', 10267, 59, 44.00, 70, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (55, 'P001', 10267, 76, 14.40, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (56, 'P001', 10268, 29, 99.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (57, 'P001', 10268, 72, 27.80, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (58, 'P001', 10269, 33, 2.00, 60, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (59, 'P001', 10269, 72, 27.80, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (60, 'P001', 10270, 36, 15.20, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (61, 'P001', 10270, 43, 36.80, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (62, 'P001', 10271, 33, 2.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (63, 'P001', 10272, 20, 64.80, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (64, 'P001', 10272, 31, 10.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (65, 'P001', 10272, 72, 27.80, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (66, 'P001', 10273, 10, 24.80, 24, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (67, 'P001', 10273, 31, 10.00, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (68, 'P001', 10273, 33, 2.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (69, 'P001', 10273, 40, 14.70, 60, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (70, 'P001', 10273, 76, 14.40, 33, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (71, 'P001', 10274, 71, 17.20, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (72, 'P001', 10274, 72, 27.80, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (73, 'P001', 10275, 24, 3.60, 12, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (74, 'P001', 10275, 59, 44.00, 6, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (75, 'P001', 10276, 10, 24.80, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (76, 'P001', 10276, 13, 4.80, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (77, 'P001', 10277, 28, 36.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (78, 'P001', 10277, 62, 39.40, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (79, 'P001', 10278, 44, 15.50, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (80, 'P001', 10278, 59, 44.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (81, 'P001', 10278, 63, 35.10, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (82, 'P001', 10278, 73, 12.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (83, 'P001', 10279, 17, 31.20, 15, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (84, 'P001', 10280, 24, 3.60, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (85, 'P001', 10280, 55, 19.20, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (86, 'P001', 10280, 75, 6.20, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (87, 'P001', 10281, 19, 7.30, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (88, 'P001', 10281, 24, 3.60, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (89, 'P001', 10281, 35, 14.40, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (90, 'P001', 10282, 30, 20.70, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (91, 'P001', 10282, 57, 15.60, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (92, 'P001', 10283, 15, 12.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (93, 'P001', 10283, 19, 7.30, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (94, 'P001', 10283, 60, 27.20, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (95, 'P001', 10283, 72, 27.80, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (96, 'P001', 10284, 27, 35.10, 15, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (97, 'P001', 10284, 44, 15.50, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (98, 'P001', 10284, 60, 27.20, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (99, 'P001', 10284, 67, 11.20, 5, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (100, 'P001', 10285, 1, 14.40, 45, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (101, 'P001', 10285, 40, 14.70, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (102, 'P001', 10285, 53, 26.20, 36, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (103, 'P001', 10286, 35, 14.40, 100, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (104, 'P001', 10286, 62, 39.40, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (105, 'P001', 10287, 16, 13.90, 40, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (106, 'P001', 10287, 34, 11.20, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (107, 'P001', 10287, 46, 9.60, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (108, 'P001', 10288, 54, 5.90, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (109, 'P001', 10288, 68, 10.00, 3, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (110, 'P001', 10289, 3, 8.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (111, 'P001', 10289, 64, 26.60, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (112, 'P001', 10290, 5, 17.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (113, 'P001', 10290, 29, 99.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (114, 'P001', 10290, 49, 16.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (115, 'P001', 10290, 77, 10.40, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (116, 'P001', 10291, 13, 4.80, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (117, 'P001', 10291, 44, 15.50, 24, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (118, 'P001', 10291, 51, 42.40, 2, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (119, 'P001', 10292, 20, 64.80, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (120, 'P001', 10293, 18, 50.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (121, 'P001', 10293, 24, 3.60, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (122, 'P001', 10293, 63, 35.10, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (123, 'P001', 10293, 75, 6.20, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (124, 'P001', 10294, 1, 14.40, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (125, 'P001', 10294, 17, 31.20, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (126, 'P001', 10294, 43, 36.80, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (127, 'P001', 10294, 60, 27.20, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (128, 'P001', 10294, 75, 6.20, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (129, 'P001', 10295, 56, 30.40, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (130, 'P001', 10296, 11, 16.80, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (131, 'P001', 10296, 16, 13.90, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (132, 'P001', 10296, 69, 28.80, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (133, 'P001', 10297, 39, 14.40, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (134, 'P001', 10297, 72, 27.80, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (135, 'P001', 10298, 2, 15.20, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (136, 'P001', 10298, 36, 15.20, 40, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (137, 'P001', 10298, 59, 44.00, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (138, 'P001', 10298, 62, 39.40, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (139, 'P001', 10299, 19, 7.30, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (140, 'P001', 10299, 70, 12.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (141, 'P001', 10300, 66, 13.60, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (142, 'P001', 10300, 68, 10.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (143, 'P001', 10301, 40, 14.70, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (144, 'P001', 10301, 56, 30.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (145, 'P001', 10302, 17, 31.20, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (146, 'P001', 10302, 28, 36.40, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (147, 'P001', 10302, 43, 36.80, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (148, 'P001', 10303, 40, 14.70, 40, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (149, 'P001', 10303, 65, 16.80, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (150, 'P001', 10303, 68, 10.00, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (151, 'P001', 10304, 49, 16.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (152, 'P001', 10304, 59, 44.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (153, 'P001', 10304, 71, 17.20, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (154, 'P001', 10305, 18, 50.00, 25, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (155, 'P001', 10305, 29, 99.00, 25, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (156, 'P001', 10305, 39, 14.40, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (157, 'P001', 10306, 30, 20.70, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (158, 'P001', 10306, 53, 26.20, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (159, 'P001', 10306, 54, 5.90, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (160, 'P001', 10307, 62, 39.40, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (161, 'P001', 10307, 68, 10.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (162, 'P001', 10308, 69, 28.80, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (163, 'P001', 10308, 70, 12.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (164, 'P001', 10309, 4, 17.60, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (165, 'P001', 10309, 6, 20.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (166, 'P001', 10309, 42, 11.20, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (167, 'P001', 10309, 43, 36.80, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (168, 'P001', 10309, 71, 17.20, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (169, 'P001', 10310, 16, 13.90, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (170, 'P001', 10310, 62, 39.40, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (171, 'P001', 10311, 42, 11.20, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (172, 'P001', 10311, 69, 28.80, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (173, 'P001', 10312, 28, 36.40, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (174, 'P001', 10312, 43, 36.80, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (175, 'P001', 10312, 53, 26.20, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (176, 'P001', 10312, 75, 6.20, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (177, 'P001', 10313, 36, 15.20, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (178, 'P001', 10314, 32, 25.60, 40, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (179, 'P001', 10314, 58, 10.60, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (180, 'P001', 10314, 62, 39.40, 25, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (181, 'P001', 10315, 34, 11.20, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (182, 'P001', 10315, 70, 12.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (183, 'P001', 10316, 41, 7.70, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (184, 'P001', 10316, 62, 39.40, 70, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (185, 'P001', 10317, 1, 14.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (186, 'P001', 10318, 41, 7.70, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (187, 'P001', 10318, 76, 14.40, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (188, 'P001', 10319, 17, 31.20, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (189, 'P001', 10319, 28, 36.40, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (190, 'P001', 10319, 76, 14.40, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (191, 'P001', 10320, 71, 17.20, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (192, 'P001', 10321, 35, 14.40, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (193, 'P001', 10322, 52, 5.60, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (194, 'P001', 10323, 15, 12.40, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (195, 'P001', 10323, 25, 11.20, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (196, 'P001', 10323, 39, 14.40, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (197, 'P001', 10324, 16, 13.90, 21, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (198, 'P001', 10324, 35, 14.40, 70, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (199, 'P001', 10324, 46, 9.60, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (200, 'P001', 10324, 59, 44.00, 40, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (201, 'P001', 10324, 63, 35.10, 80, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (202, 'P001', 10325, 6, 20.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (203, 'P001', 10325, 13, 4.80, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (204, 'P001', 10325, 14, 18.60, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (205, 'P001', 10325, 31, 10.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (206, 'P001', 10325, 72, 27.80, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (207, 'P001', 10326, 4, 17.60, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (208, 'P001', 10326, 57, 15.60, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (209, 'P001', 10326, 75, 6.20, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (210, 'P001', 10327, 2, 15.20, 25, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (211, 'P001', 10327, 11, 16.80, 50, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (212, 'P001', 10327, 30, 20.70, 35, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (213, 'P001', 10327, 58, 10.60, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (214, 'P001', 10328, 59, 44.00, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (215, 'P001', 10328, 65, 16.80, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (216, 'P001', 10328, 68, 10.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (217, 'P001', 10329, 19, 7.30, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (218, 'P001', 10329, 30, 20.70, 8, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (219, 'P001', 10329, 38, 210.80, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (220, 'P001', 10329, 56, 30.40, 12, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (221, 'P001', 10330, 26, 24.90, 50, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (222, 'P001', 10330, 72, 27.80, 25, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (223, 'P001', 10331, 54, 5.90, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (224, 'P001', 10332, 18, 50.00, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (225, 'P001', 10332, 42, 11.20, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (226, 'P001', 10332, 47, 7.60, 16, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (227, 'P001', 10333, 14, 18.60, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (228, 'P001', 10333, 21, 8.00, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (229, 'P001', 10333, 71, 17.20, 40, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (230, 'P001', 10334, 52, 5.60, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (231, 'P001', 10334, 68, 10.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (232, 'P001', 10335, 2, 15.20, 7, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (233, 'P001', 10335, 31, 10.00, 25, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (234, 'P001', 10335, 32, 25.60, 6, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (235, 'P001', 10335, 51, 42.40, 48, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (236, 'P001', 10336, 4, 17.60, 18, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (237, 'P001', 10337, 23, 7.20, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (238, 'P001', 10337, 26, 24.90, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (239, 'P001', 10337, 36, 15.20, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (240, 'P001', 10337, 37, 20.80, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (241, 'P001', 10337, 72, 27.80, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (242, 'P001', 10338, 17, 31.20, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (243, 'P001', 10338, 30, 20.70, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (244, 'P001', 10339, 4, 17.60, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (245, 'P001', 10339, 17, 31.20, 70, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (246, 'P001', 10339, 62, 39.40, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (247, 'P001', 10340, 18, 50.00, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (248, 'P001', 10340, 41, 7.70, 12, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (249, 'P001', 10340, 43, 36.80, 40, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (250, 'P001', 10341, 33, 2.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (251, 'P001', 10341, 59, 44.00, 9, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (252, 'P001', 10342, 2, 15.20, 24, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (253, 'P001', 10342, 31, 10.00, 56, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (254, 'P001', 10342, 36, 15.20, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (255, 'P001', 10342, 55, 19.20, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (256, 'P001', 10343, 64, 26.60, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (257, 'P001', 10343, 68, 10.00, 4, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (258, 'P001', 10343, 76, 14.40, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (259, 'P001', 10344, 4, 17.60, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (260, 'P001', 10344, 8, 32.00, 70, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (261, 'P001', 10345, 8, 32.00, 70, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (262, 'P001', 10345, 19, 7.30, 80, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (263, 'P001', 10345, 42, 11.20, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (264, 'P001', 10346, 17, 31.20, 36, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (265, 'P001', 10346, 56, 30.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (266, 'P001', 10347, 25, 11.20, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (267, 'P001', 10347, 39, 14.40, 50, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (268, 'P001', 10347, 40, 14.70, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (269, 'P001', 10347, 75, 6.20, 6, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (270, 'P001', 10348, 1, 14.40, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (271, 'P001', 10348, 23, 7.20, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (272, 'P001', 10349, 54, 5.90, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (273, 'P001', 10350, 50, 13.00, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (274, 'P001', 10350, 69, 28.80, 18, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (275, 'P001', 10351, 38, 210.80, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (276, 'P001', 10351, 41, 7.70, 13, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (277, 'P001', 10351, 44, 15.50, 77, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (278, 'P001', 10351, 65, 16.80, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (279, 'P001', 10352, 24, 3.60, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (280, 'P001', 10352, 54, 5.90, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (281, 'P001', 10353, 11, 16.80, 12, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (282, 'P001', 10353, 38, 210.80, 50, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (283, 'P001', 10354, 1, 14.40, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (284, 'P001', 10354, 29, 99.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (285, 'P001', 10355, 24, 3.60, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (286, 'P001', 10355, 57, 15.60, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (287, 'P001', 10356, 31, 10.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (288, 'P001', 10356, 55, 19.20, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (289, 'P001', 10356, 69, 28.80, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (290, 'P001', 10357, 10, 24.80, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (291, 'P001', 10357, 26, 24.90, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (292, 'P001', 10357, 60, 27.20, 8, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (293, 'P001', 10358, 24, 3.60, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (294, 'P001', 10358, 34, 11.20, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (295, 'P001', 10358, 36, 15.20, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (296, 'P001', 10359, 16, 13.90, 56, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (297, 'P001', 10359, 31, 10.00, 70, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (298, 'P001', 10359, 60, 27.20, 80, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (299, 'P001', 10360, 28, 36.40, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (300, 'P001', 10360, 29, 99.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (301, 'P001', 10360, 38, 210.80, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (302, 'P001', 10360, 49, 16.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (303, 'P001', 10360, 54, 5.90, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (304, 'P001', 10361, 39, 14.40, 54, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (305, 'P001', 10361, 60, 27.20, 55, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (306, 'P001', 10362, 25, 11.20, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (307, 'P001', 10362, 51, 42.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (308, 'P001', 10362, 54, 5.90, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (309, 'P001', 10363, 31, 10.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (310, 'P001', 10363, 75, 6.20, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (311, 'P001', 10363, 76, 14.40, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (312, 'P001', 10364, 69, 28.80, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (313, 'P001', 10364, 71, 17.20, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (314, 'P001', 10365, 11, 16.80, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (315, 'P001', 10366, 65, 16.80, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (316, 'P001', 10366, 77, 10.40, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (317, 'P001', 10367, 34, 11.20, 36, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (318, 'P001', 10367, 54, 5.90, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (319, 'P001', 10367, 65, 16.80, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (320, 'P001', 10367, 77, 10.40, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (321, 'P001', 10368, 21, 8.00, 5, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (322, 'P001', 10368, 28, 36.40, 13, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (323, 'P001', 10368, 57, 15.60, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (324, 'P001', 10368, 64, 26.60, 35, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (325, 'P001', 10369, 29, 99.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (326, 'P001', 10369, 56, 30.40, 18, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (327, 'P001', 10370, 1, 14.40, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (328, 'P001', 10370, 64, 26.60, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (329, 'P001', 10370, 74, 8.00, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (330, 'P001', 10371, 36, 15.20, 6, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (331, 'P001', 10372, 20, 64.80, 12, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (332, 'P001', 10372, 38, 210.80, 40, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (333, 'P001', 10372, 60, 27.20, 70, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (334, 'P001', 10372, 72, 27.80, 42, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (335, 'P001', 10373, 58, 10.60, 80, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (336, 'P001', 10373, 71, 17.20, 50, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (337, 'P001', 10374, 31, 10.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (338, 'P001', 10374, 58, 10.60, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (339, 'P001', 10375, 14, 18.60, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (340, 'P001', 10375, 54, 5.90, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (341, 'P001', 10376, 31, 10.00, 42, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (342, 'P001', 10377, 28, 36.40, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (343, 'P001', 10377, 39, 14.40, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (344, 'P001', 10378, 71, 17.20, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (345, 'P001', 10379, 41, 7.70, 8, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (346, 'P001', 10379, 63, 35.10, 16, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (347, 'P001', 10379, 65, 16.80, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (348, 'P001', 10380, 30, 20.70, 18, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (349, 'P001', 10380, 53, 26.20, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (350, 'P001', 10380, 60, 27.20, 6, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (351, 'P001', 10380, 70, 12.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (352, 'P001', 10381, 74, 8.00, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (353, 'P001', 10382, 5, 17.00, 32, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (354, 'P001', 10382, 18, 50.00, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (355, 'P001', 10382, 29, 99.00, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (356, 'P001', 10382, 33, 2.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (357, 'P001', 10382, 74, 8.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (358, 'P001', 10383, 13, 4.80, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (359, 'P001', 10383, 50, 13.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (360, 'P001', 10383, 56, 30.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (361, 'P001', 10384, 20, 64.80, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (362, 'P001', 10384, 60, 27.20, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (363, 'P001', 10385, 7, 24.00, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (364, 'P001', 10385, 60, 27.20, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (365, 'P001', 10385, 68, 10.00, 8, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (366, 'P001', 10386, 24, 3.60, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (367, 'P001', 10386, 34, 11.20, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (368, 'P001', 10387, 24, 3.60, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (369, 'P001', 10387, 28, 36.40, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (370, 'P001', 10387, 59, 44.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (371, 'P001', 10387, 71, 17.20, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (372, 'P001', 10388, 45, 7.60, 15, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (373, 'P001', 10388, 52, 5.60, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (374, 'P001', 10388, 53, 26.20, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (375, 'P001', 10389, 10, 24.80, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (376, 'P001', 10389, 55, 19.20, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (377, 'P001', 10389, 62, 39.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (378, 'P001', 10389, 70, 12.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (379, 'P001', 10390, 31, 10.00, 60, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (380, 'P001', 10390, 35, 14.40, 40, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (381, 'P001', 10390, 46, 9.60, 45, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (382, 'P001', 10390, 72, 27.80, 24, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (383, 'P001', 10391, 13, 4.80, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (384, 'P001', 10392, 69, 28.80, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (385, 'P001', 10393, 2, 15.20, 25, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (386, 'P001', 10393, 14, 18.60, 42, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (387, 'P001', 10393, 25, 11.20, 7, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (388, 'P001', 10393, 26, 24.90, 70, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (389, 'P001', 10393, 31, 10.00, 32, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (390, 'P001', 10394, 13, 4.80, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (391, 'P001', 10394, 62, 39.40, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (392, 'P001', 10395, 46, 9.60, 28, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (393, 'P001', 10395, 53, 26.20, 70, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (394, 'P001', 10395, 69, 28.80, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (395, 'P001', 10396, 23, 7.20, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (396, 'P001', 10396, 71, 17.20, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (397, 'P001', 10396, 72, 27.80, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (398, 'P001', 10397, 21, 8.00, 10, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (399, 'P001', 10397, 51, 42.40, 18, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (400, 'P001', 10398, 35, 14.40, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (401, 'P001', 10398, 55, 19.20, 120, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (402, 'P001', 10399, 68, 10.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (403, 'P001', 10399, 71, 17.20, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (404, 'P001', 10399, 76, 14.40, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (405, 'P001', 10399, 77, 10.40, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (406, 'P001', 10400, 29, 99.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (407, 'P001', 10400, 35, 14.40, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (408, 'P001', 10400, 49, 16.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (409, 'P001', 10401, 30, 20.70, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (410, 'P001', 10401, 56, 30.40, 70, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (411, 'P001', 10401, 65, 16.80, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (412, 'P001', 10401, 71, 17.20, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (413, 'P001', 10402, 23, 7.20, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (414, 'P001', 10402, 63, 35.10, 65, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (415, 'P001', 10403, 16, 13.90, 21, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (416, 'P001', 10403, 48, 10.20, 70, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (417, 'P001', 10404, 26, 24.90, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (418, 'P001', 10404, 42, 11.20, 40, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (419, 'P001', 10404, 49, 16.00, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (420, 'P001', 10405, 3, 8.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (421, 'P001', 10406, 1, 14.40, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (422, 'P001', 10406, 21, 8.00, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (423, 'P001', 10406, 28, 36.40, 42, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (424, 'P001', 10406, 36, 15.20, 5, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (425, 'P001', 10406, 40, 14.70, 2, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (426, 'P001', 10407, 11, 16.80, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (427, 'P001', 10407, 69, 28.80, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (428, 'P001', 10407, 71, 17.20, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (429, 'P001', 10408, 37, 20.80, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (430, 'P001', 10408, 54, 5.90, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (431, 'P001', 10408, 62, 39.40, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (432, 'P001', 10409, 14, 18.60, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (433, 'P001', 10409, 21, 8.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (434, 'P001', 10410, 33, 2.00, 49, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (435, 'P001', 10410, 59, 44.00, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (436, 'P001', 10411, 41, 7.70, 25, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (437, 'P001', 10411, 44, 15.50, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (438, 'P001', 10411, 59, 44.00, 9, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (439, 'P001', 10412, 14, 18.60, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (440, 'P001', 10413, 1, 14.40, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (441, 'P001', 10413, 62, 39.40, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (442, 'P001', 10413, 76, 14.40, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (443, 'P001', 10414, 19, 7.30, 18, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (444, 'P001', 10414, 33, 2.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (445, 'P001', 10415, 17, 31.20, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (446, 'P001', 10415, 33, 2.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (447, 'P001', 10416, 19, 7.30, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (448, 'P001', 10416, 53, 26.20, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (449, 'P001', 10416, 57, 15.60, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (450, 'P001', 10417, 38, 210.80, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (451, 'P001', 10417, 46, 9.60, 2, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (452, 'P001', 10417, 68, 10.00, 36, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (453, 'P001', 10417, 77, 10.40, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (454, 'P001', 10418, 2, 15.20, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (455, 'P001', 10418, 47, 7.60, 55, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (456, 'P001', 10418, 61, 22.80, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (457, 'P001', 10418, 74, 8.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (458, 'P001', 10419, 60, 27.20, 60, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (459, 'P001', 10419, 69, 28.80, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (460, 'P001', 10420, 9, 77.60, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (461, 'P001', 10420, 13, 4.80, 2, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (462, 'P001', 10420, 70, 12.00, 8, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (463, 'P001', 10420, 73, 12.00, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (464, 'P001', 10421, 19, 7.30, 4, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (465, 'P001', 10421, 26, 24.90, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (466, 'P001', 10421, 53, 26.20, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (467, 'P001', 10421, 77, 10.40, 10, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (468, 'P001', 10422, 26, 24.90, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (469, 'P001', 10423, 31, 10.00, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (470, 'P001', 10423, 59, 44.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (471, 'P001', 10424, 35, 14.40, 60, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (472, 'P001', 10424, 38, 210.80, 49, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (473, 'P001', 10424, 68, 10.00, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (474, 'P001', 10425, 55, 19.20, 10, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (475, 'P001', 10425, 76, 14.40, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (476, 'P001', 10426, 56, 30.40, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (477, 'P001', 10426, 64, 26.60, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (478, 'P001', 10427, 14, 18.60, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (479, 'P001', 10428, 46, 9.60, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (480, 'P001', 10429, 50, 13.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (481, 'P001', 10429, 63, 35.10, 35, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (482, 'P001', 10430, 17, 31.20, 45, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (483, 'P001', 10430, 21, 8.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (484, 'P001', 10430, 56, 30.40, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (485, 'P001', 10430, 59, 44.00, 70, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (486, 'P001', 10431, 17, 31.20, 50, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (487, 'P001', 10431, 40, 14.70, 50, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (488, 'P001', 10431, 47, 7.60, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (489, 'P001', 10432, 26, 24.90, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (490, 'P001', 10432, 54, 5.90, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (491, 'P001', 10433, 56, 30.40, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (492, 'P001', 10434, 11, 16.80, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (493, 'P001', 10434, 76, 14.40, 18, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (494, 'P001', 10435, 2, 15.20, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (495, 'P001', 10435, 22, 16.80, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (496, 'P001', 10435, 72, 27.80, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (497, 'P001', 10436, 46, 9.60, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (498, 'P001', 10436, 56, 30.40, 40, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (499, 'P001', 10436, 64, 26.60, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (500, 'P001', 10436, 75, 6.20, 24, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (501, 'P001', 10437, 53, 26.20, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (502, 'P001', 10438, 19, 7.30, 15, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (503, 'P001', 10438, 34, 11.20, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (504, 'P001', 10438, 57, 15.60, 15, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (505, 'P001', 10439, 12, 30.40, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (506, 'P001', 10439, 16, 13.90, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (507, 'P001', 10439, 64, 26.60, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (508, 'P001', 10439, 74, 8.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (509, 'P001', 10440, 2, 15.20, 45, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (510, 'P001', 10440, 16, 13.90, 49, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (511, 'P001', 10440, 29, 99.00, 24, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (512, 'P001', 10440, 61, 22.80, 90, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (513, 'P001', 10441, 27, 35.10, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (514, 'P001', 10442, 11, 16.80, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (515, 'P001', 10442, 54, 5.90, 80, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (516, 'P001', 10442, 66, 13.60, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (517, 'P001', 10443, 11, 16.80, 6, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (518, 'P001', 10443, 28, 36.40, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (519, 'P001', 10444, 17, 31.20, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (520, 'P001', 10444, 26, 24.90, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (521, 'P001', 10444, 35, 14.40, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (522, 'P001', 10444, 41, 7.70, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (523, 'P001', 10445, 39, 14.40, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (524, 'P001', 10445, 54, 5.90, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (525, 'P001', 10446, 19, 7.30, 12, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (526, 'P001', 10446, 24, 3.60, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (527, 'P001', 10446, 31, 10.00, 3, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (528, 'P001', 10446, 52, 5.60, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (529, 'P001', 10447, 19, 7.30, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (530, 'P001', 10447, 65, 16.80, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (531, 'P001', 10447, 71, 17.20, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (532, 'P001', 10448, 26, 24.90, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (533, 'P001', 10448, 40, 14.70, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (534, 'P001', 10449, 10, 24.80, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (535, 'P001', 10449, 52, 5.60, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (536, 'P001', 10449, 62, 39.40, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (537, 'P001', 10450, 10, 24.80, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (538, 'P001', 10450, 54, 5.90, 6, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (539, 'P001', 10451, 55, 19.20, 120, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (540, 'P001', 10451, 64, 26.60, 35, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (541, 'P001', 10451, 65, 16.80, 28, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (542, 'P001', 10451, 77, 10.40, 55, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (543, 'P001', 10452, 28, 36.40, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (544, 'P001', 10452, 44, 15.50, 100, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (545, 'P001', 10453, 48, 10.20, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (546, 'P001', 10453, 70, 12.00, 25, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (547, 'P001', 10454, 16, 13.90, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (548, 'P001', 10454, 33, 2.00, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (549, 'P001', 10454, 46, 9.60, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (550, 'P001', 10455, 39, 14.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (551, 'P001', 10455, 53, 26.20, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (552, 'P001', 10455, 61, 22.80, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (553, 'P001', 10455, 71, 17.20, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (554, 'P001', 10456, 21, 8.00, 40, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (555, 'P001', 10456, 49, 16.00, 21, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (556, 'P001', 10457, 59, 44.00, 36, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (557, 'P001', 10458, 26, 24.90, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (558, 'P001', 10458, 28, 36.40, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (559, 'P001', 10458, 43, 36.80, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (560, 'P001', 10458, 56, 30.40, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (561, 'P001', 10458, 71, 17.20, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (562, 'P001', 10459, 7, 24.00, 16, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (563, 'P001', 10459, 46, 9.60, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (564, 'P001', 10459, 72, 27.80, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (565, 'P001', 10460, 68, 10.00, 21, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (566, 'P001', 10460, 75, 6.20, 4, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (567, 'P001', 10461, 21, 8.00, 40, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (568, 'P001', 10461, 30, 20.70, 28, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (569, 'P001', 10461, 55, 19.20, 60, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (570, 'P001', 10462, 13, 4.80, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (571, 'P001', 10462, 23, 7.20, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (572, 'P001', 10463, 19, 7.30, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (573, 'P001', 10463, 42, 11.20, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (574, 'P001', 10464, 4, 17.60, 16, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (575, 'P001', 10464, 43, 36.80, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (576, 'P001', 10464, 56, 30.40, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (577, 'P001', 10464, 60, 27.20, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (578, 'P001', 10465, 24, 3.60, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (579, 'P001', 10465, 29, 99.00, 18, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (580, 'P001', 10465, 40, 14.70, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (581, 'P001', 10465, 45, 7.60, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (582, 'P001', 10465, 50, 13.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (583, 'P001', 10466, 11, 16.80, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (584, 'P001', 10466, 46, 9.60, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (585, 'P001', 10467, 24, 3.60, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (586, 'P001', 10467, 25, 11.20, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (587, 'P001', 10468, 30, 20.70, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (588, 'P001', 10468, 43, 36.80, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (589, 'P001', 10469, 2, 15.20, 40, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (590, 'P001', 10469, 16, 13.90, 35, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (591, 'P001', 10469, 44, 15.50, 2, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (592, 'P001', 10470, 18, 50.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (593, 'P001', 10470, 23, 7.20, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (594, 'P001', 10470, 64, 26.60, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (595, 'P001', 10471, 7, 24.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (596, 'P001', 10471, 56, 30.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (597, 'P001', 10472, 24, 3.60, 80, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (598, 'P001', 10472, 51, 42.40, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (599, 'P001', 10473, 33, 2.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (600, 'P001', 10473, 71, 17.20, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (601, 'P001', 10474, 14, 18.60, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (602, 'P001', 10474, 28, 36.40, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (603, 'P001', 10474, 40, 14.70, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (604, 'P001', 10474, 75, 6.20, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (605, 'P001', 10475, 31, 10.00, 35, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (606, 'P001', 10475, 66, 13.60, 60, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (607, 'P001', 10475, 76, 14.40, 42, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (608, 'P001', 10476, 55, 19.20, 2, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (609, 'P001', 10476, 70, 12.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (610, 'P001', 10477, 1, 14.40, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (611, 'P001', 10477, 21, 8.00, 21, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (612, 'P001', 10477, 39, 14.40, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (613, 'P001', 10478, 10, 24.80, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (614, 'P001', 10479, 38, 210.80, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (615, 'P001', 10479, 53, 26.20, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (616, 'P001', 10479, 59, 44.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (617, 'P001', 10479, 64, 26.60, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (618, 'P001', 10480, 47, 7.60, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (619, 'P001', 10480, 59, 44.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (620, 'P001', 10481, 49, 16.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (621, 'P001', 10481, 60, 27.20, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (622, 'P001', 10482, 40, 14.70, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (623, 'P001', 10483, 34, 11.20, 35, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (624, 'P001', 10483, 77, 10.40, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (625, 'P001', 10484, 21, 8.00, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (626, 'P001', 10484, 40, 14.70, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (627, 'P001', 10484, 51, 42.40, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (628, 'P001', 10485, 2, 15.20, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (629, 'P001', 10485, 3, 8.00, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (630, 'P001', 10485, 55, 19.20, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (631, 'P001', 10485, 70, 12.00, 60, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (632, 'P001', 10486, 11, 16.80, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (633, 'P001', 10486, 51, 42.40, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (634, 'P001', 10486, 74, 8.00, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (635, 'P001', 10487, 19, 7.30, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (636, 'P001', 10487, 26, 24.90, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (637, 'P001', 10487, 54, 5.90, 24, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (638, 'P001', 10488, 59, 44.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (639, 'P001', 10488, 73, 12.00, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (640, 'P001', 10489, 11, 16.80, 15, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (641, 'P001', 10489, 16, 13.90, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (642, 'P001', 10490, 59, 44.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (643, 'P001', 10490, 68, 10.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (644, 'P001', 10490, 75, 6.20, 36, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (645, 'P001', 10491, 44, 15.50, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (646, 'P001', 10491, 77, 10.40, 7, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (647, 'P001', 10492, 25, 11.20, 60, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (648, 'P001', 10492, 42, 11.20, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (649, 'P001', 10493, 65, 16.80, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (650, 'P001', 10493, 66, 13.60, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (651, 'P001', 10493, 69, 28.80, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (652, 'P001', 10494, 56, 30.40, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (653, 'P001', 10495, 23, 7.20, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (654, 'P001', 10495, 41, 7.70, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (655, 'P001', 10495, 77, 10.40, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (656, 'P001', 10496, 31, 10.00, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (657, 'P001', 10497, 56, 30.40, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (658, 'P001', 10497, 72, 27.80, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (659, 'P001', 10497, 77, 10.40, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (660, 'P001', 10498, 24, 4.50, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (661, 'P001', 10498, 40, 18.40, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (662, 'P001', 10498, 42, 14.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (663, 'P001', 10499, 28, 45.60, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (664, 'P001', 10499, 49, 20.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (665, 'P001', 10500, 15, 15.50, 12, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (666, 'P001', 10500, 28, 45.60, 8, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (667, 'P001', 10501, 54, 7.45, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (668, 'P001', 10502, 45, 9.50, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (669, 'P001', 10502, 53, 32.80, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (670, 'P001', 10502, 67, 14.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (671, 'P001', 10503, 14, 23.25, 70, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (672, 'P001', 10503, 65, 21.05, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (673, 'P001', 10504, 2, 19.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (674, 'P001', 10504, 21, 10.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (675, 'P001', 10504, 53, 32.80, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (676, 'P001', 10504, 61, 28.50, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (677, 'P001', 10505, 62, 49.30, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (678, 'P001', 10506, 25, 14.00, 18, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (679, 'P001', 10506, 70, 15.00, 14, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (680, 'P001', 10507, 43, 46.00, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (681, 'P001', 10507, 48, 12.75, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (682, 'P001', 10508, 13, 6.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (683, 'P001', 10508, 39, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (684, 'P001', 10509, 28, 45.60, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (685, 'P001', 10510, 29, 123.79, 36, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (686, 'P001', 10510, 75, 7.75, 36, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (687, 'P001', 10511, 4, 22.00, 50, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (688, 'P001', 10511, 7, 30.00, 50, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (689, 'P001', 10511, 8, 40.00, 10, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (690, 'P001', 10512, 24, 4.50, 10, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (691, 'P001', 10512, 46, 12.00, 9, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (692, 'P001', 10512, 47, 9.50, 6, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (693, 'P001', 10512, 60, 34.00, 12, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (694, 'P001', 10513, 21, 10.00, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (695, 'P001', 10513, 32, 32.00, 50, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (696, 'P001', 10513, 61, 28.50, 15, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (697, 'P001', 10514, 20, 81.00, 39, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (698, 'P001', 10514, 28, 45.60, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (699, 'P001', 10514, 56, 38.00, 70, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (700, 'P001', 10514, 65, 21.05, 39, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (701, 'P001', 10514, 75, 7.75, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (702, 'P001', 10515, 9, 97.00, 16, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (703, 'P001', 10515, 16, 17.45, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (704, 'P001', 10515, 27, 43.90, 120, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (705, 'P001', 10515, 33, 2.50, 16, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (706, 'P001', 10515, 60, 34.00, 84, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (707, 'P001', 10516, 18, 62.50, 25, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (708, 'P001', 10516, 41, 9.65, 80, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (709, 'P001', 10516, 42, 14.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (710, 'P001', 10517, 52, 7.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (711, 'P001', 10517, 59, 55.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (712, 'P001', 10517, 70, 15.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (713, 'P001', 10518, 24, 4.50, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (714, 'P001', 10518, 38, 263.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (715, 'P001', 10518, 44, 19.45, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (716, 'P001', 10519, 10, 31.00, 16, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (717, 'P001', 10519, 56, 38.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (718, 'P001', 10519, 60, 34.00, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (719, 'P001', 10520, 24, 4.50, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (720, 'P001', 10520, 53, 32.80, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (721, 'P001', 10521, 35, 18.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (722, 'P001', 10521, 41, 9.65, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (723, 'P001', 10521, 68, 12.50, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (724, 'P001', 10522, 1, 18.00, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (725, 'P001', 10522, 8, 40.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (726, 'P001', 10522, 30, 25.89, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (727, 'P001', 10522, 40, 18.40, 25, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (728, 'P001', 10523, 17, 39.00, 25, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (729, 'P001', 10523, 20, 81.00, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (730, 'P001', 10523, 37, 26.00, 18, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (731, 'P001', 10523, 41, 9.65, 6, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (732, 'P001', 10524, 10, 31.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (733, 'P001', 10524, 30, 25.89, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (734, 'P001', 10524, 43, 46.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (735, 'P001', 10524, 54, 7.45, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (736, 'P001', 10525, 36, 19.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (737, 'P001', 10525, 40, 18.40, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (738, 'P001', 10526, 1, 18.00, 8, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (739, 'P001', 10526, 13, 6.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (740, 'P001', 10526, 56, 38.00, 30, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (741, 'P001', 10527, 4, 22.00, 50, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (742, 'P001', 10527, 36, 19.00, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (743, 'P001', 10528, 11, 21.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (744, 'P001', 10528, 33, 2.50, 8, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (745, 'P001', 10528, 72, 34.80, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (746, 'P001', 10529, 55, 24.00, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (747, 'P001', 10529, 68, 12.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (748, 'P001', 10529, 69, 36.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (749, 'P001', 10530, 17, 39.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (750, 'P001', 10530, 43, 46.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (751, 'P001', 10530, 61, 28.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (752, 'P001', 10530, 76, 18.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (753, 'P001', 10531, 59, 55.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (754, 'P001', 10532, 30, 25.89, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (755, 'P001', 10532, 66, 17.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (756, 'P001', 10533, 4, 22.00, 50, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (757, 'P001', 10533, 72, 34.80, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (758, 'P001', 10533, 73, 15.00, 24, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (759, 'P001', 10534, 30, 25.89, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (760, 'P001', 10534, 40, 18.40, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (761, 'P001', 10534, 54, 7.45, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (762, 'P001', 10535, 11, 21.00, 50, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (763, 'P001', 10535, 40, 18.40, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (764, 'P001', 10535, 57, 19.50, 5, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (765, 'P001', 10535, 59, 55.00, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (766, 'P001', 10536, 12, 38.00, 15, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (767, 'P001', 10536, 31, 12.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (768, 'P001', 10536, 33, 2.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (769, 'P001', 10536, 60, 34.00, 35, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (770, 'P001', 10537, 31, 12.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (771, 'P001', 10537, 51, 53.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (772, 'P001', 10537, 58, 13.25, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (773, 'P001', 10537, 72, 34.80, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (774, 'P001', 10537, 73, 15.00, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (775, 'P001', 10538, 70, 15.00, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (776, 'P001', 10538, 72, 34.80, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (777, 'P001', 10539, 13, 6.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (778, 'P001', 10539, 21, 10.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (779, 'P001', 10539, 33, 2.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (780, 'P001', 10539, 49, 20.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (781, 'P001', 10540, 3, 10.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (782, 'P001', 10540, 26, 31.23, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (783, 'P001', 10540, 38, 263.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (784, 'P001', 10540, 68, 12.50, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (785, 'P001', 10541, 24, 4.50, 35, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (786, 'P001', 10541, 38, 263.50, 4, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (787, 'P001', 10541, 65, 21.05, 36, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (788, 'P001', 10541, 71, 21.50, 9, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (789, 'P001', 10542, 11, 21.00, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (790, 'P001', 10542, 54, 7.45, 24, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (791, 'P001', 10543, 12, 38.00, 30, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (792, 'P001', 10543, 23, 9.00, 70, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (793, 'P001', 10544, 28, 45.60, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (794, 'P001', 10544, 67, 14.00, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (795, 'P001', 10545, 11, 21.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (796, 'P001', 10546, 7, 30.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (797, 'P001', 10546, 35, 18.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (798, 'P001', 10546, 62, 49.30, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (799, 'P001', 10547, 32, 32.00, 24, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (800, 'P001', 10547, 36, 19.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (801, 'P001', 10548, 34, 14.00, 10, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (802, 'P001', 10548, 41, 9.65, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (803, 'P001', 10549, 31, 12.50, 55, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (804, 'P001', 10549, 45, 9.50, 100, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (805, 'P001', 10549, 51, 53.00, 48, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (806, 'P001', 10550, 17, 39.00, 8, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (807, 'P001', 10550, 19, 9.20, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (808, 'P001', 10550, 21, 10.00, 6, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (809, 'P001', 10550, 61, 28.50, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (810, 'P001', 10551, 16, 17.45, 40, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (811, 'P001', 10551, 35, 18.00, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (812, 'P001', 10551, 44, 19.45, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (813, 'P001', 10552, 69, 36.00, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (814, 'P001', 10552, 75, 7.75, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (815, 'P001', 10553, 11, 21.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (816, 'P001', 10553, 16, 17.45, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (817, 'P001', 10553, 22, 21.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (818, 'P001', 10553, 31, 12.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (819, 'P001', 10553, 35, 18.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (820, 'P001', 10554, 16, 17.45, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (821, 'P001', 10554, 23, 9.00, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (822, 'P001', 10554, 62, 49.30, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (823, 'P001', 10554, 77, 13.00, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (824, 'P001', 10555, 14, 23.25, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (825, 'P001', 10555, 19, 9.20, 35, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (826, 'P001', 10555, 24, 4.50, 18, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (827, 'P001', 10555, 51, 53.00, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (828, 'P001', 10555, 56, 38.00, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (829, 'P001', 10556, 72, 34.80, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (830, 'P001', 10557, 64, 33.25, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (831, 'P001', 10557, 75, 7.75, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (832, 'P001', 10558, 47, 9.50, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (833, 'P001', 10558, 51, 53.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (834, 'P001', 10558, 52, 7.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (835, 'P001', 10558, 53, 32.80, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (836, 'P001', 10558, 73, 15.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (837, 'P001', 10559, 41, 9.65, 12, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (838, 'P001', 10559, 55, 24.00, 18, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (839, 'P001', 10560, 30, 25.89, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (840, 'P001', 10560, 62, 49.30, 15, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (841, 'P001', 10561, 44, 19.45, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (842, 'P001', 10561, 51, 53.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (843, 'P001', 10562, 33, 2.50, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (844, 'P001', 10562, 62, 49.30, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (845, 'P001', 10563, 36, 19.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (846, 'P001', 10563, 52, 7.00, 70, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (847, 'P001', 10564, 17, 39.00, 16, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (848, 'P001', 10564, 31, 12.50, 6, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (849, 'P001', 10564, 55, 24.00, 25, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (850, 'P001', 10565, 24, 4.50, 25, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (851, 'P001', 10565, 64, 33.25, 18, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (852, 'P001', 10566, 11, 21.00, 35, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (853, 'P001', 10566, 18, 62.50, 18, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (854, 'P001', 10566, 76, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (855, 'P001', 10567, 31, 12.50, 60, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (856, 'P001', 10567, 51, 53.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (857, 'P001', 10567, 59, 55.00, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (858, 'P001', 10568, 10, 31.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (859, 'P001', 10569, 31, 12.50, 35, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (860, 'P001', 10569, 76, 18.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (861, 'P001', 10570, 11, 21.00, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (862, 'P001', 10570, 56, 38.00, 60, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (863, 'P001', 10571, 14, 23.25, 11, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (864, 'P001', 10571, 42, 14.00, 28, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (865, 'P001', 10572, 16, 17.45, 12, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (866, 'P001', 10572, 32, 32.00, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (867, 'P001', 10572, 40, 18.40, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (868, 'P001', 10572, 75, 7.75, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (869, 'P001', 10573, 17, 39.00, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (870, 'P001', 10573, 34, 14.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (871, 'P001', 10573, 53, 32.80, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (872, 'P001', 10574, 33, 2.50, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (873, 'P001', 10574, 40, 18.40, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (874, 'P001', 10574, 62, 49.30, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (875, 'P001', 10574, 64, 33.25, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (876, 'P001', 10575, 59, 55.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (877, 'P001', 10575, 63, 43.90, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (878, 'P001', 10575, 72, 34.80, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (879, 'P001', 10575, 76, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (880, 'P001', 10576, 1, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (881, 'P001', 10576, 31, 12.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (882, 'P001', 10576, 44, 19.45, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (883, 'P001', 10577, 39, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (884, 'P001', 10577, 75, 7.75, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (885, 'P001', 10577, 77, 13.00, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (886, 'P001', 10578, 35, 18.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (887, 'P001', 10578, 57, 19.50, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (888, 'P001', 10579, 15, 15.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (889, 'P001', 10579, 75, 7.75, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (890, 'P001', 10580, 14, 23.25, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (891, 'P001', 10580, 41, 9.65, 9, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (892, 'P001', 10580, 65, 21.05, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (893, 'P001', 10581, 75, 7.75, 50, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (894, 'P001', 10582, 57, 19.50, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (895, 'P001', 10582, 76, 18.00, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (896, 'P001', 10583, 29, 123.79, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (897, 'P001', 10583, 60, 34.00, 24, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (898, 'P001', 10583, 69, 36.00, 10, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (899, 'P001', 10584, 31, 12.50, 50, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (900, 'P001', 10585, 47, 9.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (901, 'P001', 10586, 52, 7.00, 4, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (902, 'P001', 10587, 26, 31.23, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (903, 'P001', 10587, 35, 18.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (904, 'P001', 10587, 77, 13.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (905, 'P001', 10588, 18, 62.50, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (906, 'P001', 10588, 42, 14.00, 100, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (907, 'P001', 10589, 35, 18.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (908, 'P001', 10590, 1, 18.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (909, 'P001', 10590, 77, 13.00, 60, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (910, 'P001', 10591, 3, 10.00, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (911, 'P001', 10591, 7, 30.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (912, 'P001', 10591, 54, 7.45, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (913, 'P001', 10592, 15, 15.50, 25, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (914, 'P001', 10592, 26, 31.23, 5, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (915, 'P001', 10593, 20, 81.00, 21, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (916, 'P001', 10593, 69, 36.00, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (917, 'P001', 10593, 76, 18.00, 4, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (918, 'P001', 10594, 52, 7.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (919, 'P001', 10594, 58, 13.25, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (920, 'P001', 10595, 35, 18.00, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (921, 'P001', 10595, 61, 28.50, 120, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (922, 'P001', 10595, 69, 36.00, 65, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (923, 'P001', 10596, 56, 38.00, 5, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (924, 'P001', 10596, 63, 43.90, 24, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (925, 'P001', 10596, 75, 7.75, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (926, 'P001', 10597, 24, 4.50, 35, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (927, 'P001', 10597, 57, 19.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (928, 'P001', 10597, 65, 21.05, 12, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (929, 'P001', 10598, 27, 43.90, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (930, 'P001', 10598, 71, 21.50, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (931, 'P001', 10599, 62, 49.30, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (932, 'P001', 10600, 54, 7.45, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (933, 'P001', 10600, 73, 15.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (934, 'P001', 10601, 13, 6.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (935, 'P001', 10601, 59, 55.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (936, 'P001', 10602, 77, 13.00, 5, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (937, 'P001', 10603, 22, 21.00, 48, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (938, 'P001', 10603, 49, 20.00, 25, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (939, 'P001', 10604, 48, 12.75, 6, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (940, 'P001', 10604, 76, 18.00, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (941, 'P001', 10605, 16, 17.45, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (942, 'P001', 10605, 59, 55.00, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (943, 'P001', 10605, 60, 34.00, 70, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (944, 'P001', 10605, 71, 21.50, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (945, 'P001', 10606, 4, 22.00, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (946, 'P001', 10606, 55, 24.00, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (947, 'P001', 10606, 62, 49.30, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (948, 'P001', 10607, 7, 30.00, 45, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (949, 'P001', 10607, 17, 39.00, 100, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (950, 'P001', 10607, 33, 2.50, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (951, 'P001', 10607, 40, 18.40, 42, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (952, 'P001', 10607, 72, 34.80, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (953, 'P001', 10608, 56, 38.00, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (954, 'P001', 10609, 1, 18.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (955, 'P001', 10609, 10, 31.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (956, 'P001', 10609, 21, 10.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (957, 'P001', 10610, 36, 19.00, 21, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (958, 'P001', 10611, 1, 18.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (959, 'P001', 10611, 2, 19.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (960, 'P001', 10611, 60, 34.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (961, 'P001', 10612, 10, 31.00, 70, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (962, 'P001', 10612, 36, 19.00, 55, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (963, 'P001', 10612, 49, 20.00, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (964, 'P001', 10612, 60, 34.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (965, 'P001', 10612, 76, 18.00, 80, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (966, 'P001', 10613, 13, 6.00, 8, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (967, 'P001', 10613, 75, 7.75, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (968, 'P001', 10614, 11, 21.00, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (969, 'P001', 10614, 21, 10.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (970, 'P001', 10614, 39, 18.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (971, 'P001', 10615, 55, 24.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (972, 'P001', 10616, 38, 263.50, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (973, 'P001', 10616, 56, 38.00, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (974, 'P001', 10616, 70, 15.00, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (975, 'P001', 10616, 71, 21.50, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (976, 'P001', 10617, 59, 55.00, 30, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (977, 'P001', 10618, 6, 25.00, 70, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (978, 'P001', 10618, 56, 38.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (979, 'P001', 10618, 68, 12.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (980, 'P001', 10619, 21, 10.00, 42, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (981, 'P001', 10619, 22, 21.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (982, 'P001', 10620, 24, 4.50, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (983, 'P001', 10620, 52, 7.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (984, 'P001', 10621, 19, 9.20, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (985, 'P001', 10621, 23, 9.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (986, 'P001', 10621, 70, 15.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (987, 'P001', 10621, 71, 21.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (988, 'P001', 10622, 2, 19.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (989, 'P001', 10622, 68, 12.50, 18, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (990, 'P001', 10623, 14, 23.25, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (991, 'P001', 10623, 19, 9.20, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (992, 'P001', 10623, 21, 10.00, 25, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (993, 'P001', 10623, 24, 4.50, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (994, 'P001', 10623, 35, 18.00, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (995, 'P001', 10624, 28, 45.60, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (996, 'P001', 10624, 29, 123.79, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (997, 'P001', 10624, 44, 19.45, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (998, 'P001', 10625, 14, 23.25, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (999, 'P001', 10625, 42, 14.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1000, 'P001', 10625, 60, 34.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1001, 'P001', 10626, 53, 32.80, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1002, 'P001', 10626, 60, 34.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1003, 'P001', 10626, 71, 21.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1004, 'P001', 10627, 62, 49.30, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1005, 'P001', 10627, 73, 15.00, 35, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1006, 'P001', 10628, 1, 18.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1007, 'P001', 10629, 29, 123.79, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1008, 'P001', 10629, 64, 33.25, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1009, 'P001', 10630, 55, 24.00, 12, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1010, 'P001', 10630, 76, 18.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1011, 'P001', 10631, 75, 7.75, 8, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1012, 'P001', 10632, 2, 19.00, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1013, 'P001', 10632, 33, 2.50, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1014, 'P001', 10633, 12, 38.00, 36, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1015, 'P001', 10633, 13, 6.00, 13, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1016, 'P001', 10633, 26, 31.23, 35, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1017, 'P001', 10633, 62, 49.30, 80, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1018, 'P001', 10634, 7, 30.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1019, 'P001', 10634, 18, 62.50, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1020, 'P001', 10634, 51, 53.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1021, 'P001', 10634, 75, 7.75, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1022, 'P001', 10635, 4, 22.00, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1023, 'P001', 10635, 5, 21.35, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1024, 'P001', 10635, 22, 21.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1025, 'P001', 10636, 4, 22.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1026, 'P001', 10636, 58, 13.25, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1027, 'P001', 10637, 11, 21.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1028, 'P001', 10637, 50, 16.25, 25, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1029, 'P001', 10637, 56, 38.00, 60, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1030, 'P001', 10638, 45, 9.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1031, 'P001', 10638, 65, 21.05, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1032, 'P001', 10638, 72, 34.80, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1033, 'P001', 10639, 18, 62.50, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1034, 'P001', 10640, 69, 36.00, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1035, 'P001', 10640, 70, 15.00, 15, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1036, 'P001', 10641, 2, 19.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1037, 'P001', 10641, 40, 18.40, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1038, 'P001', 10642, 21, 10.00, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1039, 'P001', 10642, 61, 28.50, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1040, 'P001', 10643, 28, 45.60, 15, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1041, 'P001', 10643, 39, 18.00, 21, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1042, 'P001', 10643, 46, 12.00, 2, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1043, 'P001', 10644, 18, 62.50, 4, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1044, 'P001', 10644, 43, 46.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1045, 'P001', 10644, 46, 12.00, 21, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1046, 'P001', 10645, 18, 62.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1047, 'P001', 10645, 36, 19.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1048, 'P001', 10646, 1, 18.00, 15, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1049, 'P001', 10646, 10, 31.00, 18, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1050, 'P001', 10646, 71, 21.50, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1051, 'P001', 10646, 77, 13.00, 35, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1052, 'P001', 10647, 19, 9.20, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1053, 'P001', 10647, 39, 18.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1054, 'P001', 10648, 22, 21.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1055, 'P001', 10648, 24, 4.50, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1056, 'P001', 10649, 28, 45.60, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1057, 'P001', 10649, 72, 34.80, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1058, 'P001', 10650, 30, 25.89, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1059, 'P001', 10650, 53, 32.80, 25, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1060, 'P001', 10650, 54, 7.45, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1061, 'P001', 10651, 19, 9.20, 12, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1062, 'P001', 10651, 22, 21.00, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1063, 'P001', 10652, 30, 25.89, 2, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1064, 'P001', 10652, 42, 14.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1065, 'P001', 10653, 16, 17.45, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1066, 'P001', 10653, 60, 34.00, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1067, 'P001', 10654, 4, 22.00, 12, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1068, 'P001', 10654, 39, 18.00, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1069, 'P001', 10654, 54, 7.45, 6, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1070, 'P001', 10655, 41, 9.65, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1071, 'P001', 10656, 14, 23.25, 3, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1072, 'P001', 10656, 44, 19.45, 28, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1073, 'P001', 10656, 47, 9.50, 6, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1074, 'P001', 10657, 15, 15.50, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1075, 'P001', 10657, 41, 9.65, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1076, 'P001', 10657, 46, 12.00, 45, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1077, 'P001', 10657, 47, 9.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1078, 'P001', 10657, 56, 38.00, 45, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1079, 'P001', 10657, 60, 34.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1080, 'P001', 10658, 21, 10.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1081, 'P001', 10658, 40, 18.40, 70, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1082, 'P001', 10658, 60, 34.00, 55, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1083, 'P001', 10658, 77, 13.00, 70, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1084, 'P001', 10659, 31, 12.50, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1085, 'P001', 10659, 40, 18.40, 24, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1086, 'P001', 10659, 70, 15.00, 40, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1087, 'P001', 10660, 20, 81.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1088, 'P001', 10661, 39, 18.00, 3, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1089, 'P001', 10661, 58, 13.25, 49, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1090, 'P001', 10662, 68, 12.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1091, 'P001', 10663, 40, 18.40, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1092, 'P001', 10663, 42, 14.00, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1093, 'P001', 10663, 51, 53.00, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1094, 'P001', 10664, 10, 31.00, 24, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1095, 'P001', 10664, 56, 38.00, 12, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1096, 'P001', 10664, 65, 21.05, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1097, 'P001', 10665, 51, 53.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1098, 'P001', 10665, 59, 55.00, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1099, 'P001', 10665, 76, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1100, 'P001', 10666, 29, 123.79, 36, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1101, 'P001', 10666, 65, 21.05, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1102, 'P001', 10667, 69, 36.00, 45, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1103, 'P001', 10667, 71, 21.50, 14, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1104, 'P001', 10668, 31, 12.50, 8, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1105, 'P001', 10668, 55, 24.00, 4, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1106, 'P001', 10668, 64, 33.25, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1107, 'P001', 10669, 36, 19.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1108, 'P001', 10670, 23, 9.00, 32, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1109, 'P001', 10670, 46, 12.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1110, 'P001', 10670, 67, 14.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1111, 'P001', 10670, 73, 15.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1112, 'P001', 10670, 75, 7.75, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1113, 'P001', 10671, 16, 17.45, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1114, 'P001', 10671, 62, 49.30, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1115, 'P001', 10671, 65, 21.05, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1116, 'P001', 10672, 38, 263.50, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1117, 'P001', 10672, 71, 21.50, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1118, 'P001', 10673, 16, 17.45, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1119, 'P001', 10673, 42, 14.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1120, 'P001', 10673, 43, 46.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1121, 'P001', 10674, 23, 9.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1122, 'P001', 10675, 14, 23.25, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1123, 'P001', 10675, 53, 32.80, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1124, 'P001', 10675, 58, 13.25, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1125, 'P001', 10676, 10, 31.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1126, 'P001', 10676, 19, 9.20, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1127, 'P001', 10676, 44, 19.45, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1128, 'P001', 10677, 26, 31.23, 30, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1129, 'P001', 10677, 33, 2.50, 8, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1130, 'P001', 10678, 12, 38.00, 100, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1131, 'P001', 10678, 33, 2.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1132, 'P001', 10678, 41, 9.65, 120, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1133, 'P001', 10678, 54, 7.45, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1134, 'P001', 10679, 59, 55.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1135, 'P001', 10680, 16, 17.45, 50, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1136, 'P001', 10680, 31, 12.50, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1137, 'P001', 10680, 42, 14.00, 40, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1138, 'P001', 10681, 19, 9.20, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1139, 'P001', 10681, 21, 10.00, 12, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1140, 'P001', 10681, 64, 33.25, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1141, 'P001', 10682, 33, 2.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1142, 'P001', 10682, 66, 17.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1143, 'P001', 10682, 75, 7.75, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1144, 'P001', 10683, 52, 7.00, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1145, 'P001', 10684, 40, 18.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1146, 'P001', 10684, 47, 9.50, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1147, 'P001', 10684, 60, 34.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1148, 'P001', 10685, 10, 31.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1149, 'P001', 10685, 41, 9.65, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1150, 'P001', 10685, 47, 9.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1151, 'P001', 10686, 17, 39.00, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1152, 'P001', 10686, 26, 31.23, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1153, 'P001', 10687, 9, 97.00, 50, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1154, 'P001', 10687, 29, 123.79, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1155, 'P001', 10687, 36, 19.00, 6, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1156, 'P001', 10688, 10, 31.00, 18, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1157, 'P001', 10688, 28, 45.60, 60, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1158, 'P001', 10688, 34, 14.00, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1159, 'P001', 10689, 1, 18.00, 35, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1160, 'P001', 10690, 56, 38.00, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1161, 'P001', 10690, 77, 13.00, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1162, 'P001', 10691, 1, 18.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1163, 'P001', 10691, 29, 123.79, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1164, 'P001', 10691, 43, 46.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1165, 'P001', 10691, 44, 19.45, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1166, 'P001', 10691, 62, 49.30, 48, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1167, 'P001', 10692, 63, 43.90, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1168, 'P001', 10693, 9, 97.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1169, 'P001', 10693, 54, 7.45, 60, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1170, 'P001', 10693, 69, 36.00, 30, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1171, 'P001', 10693, 73, 15.00, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1172, 'P001', 10694, 7, 30.00, 90, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1173, 'P001', 10694, 59, 55.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1174, 'P001', 10694, 70, 15.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1175, 'P001', 10695, 8, 40.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1176, 'P001', 10695, 12, 38.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1177, 'P001', 10695, 24, 4.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1178, 'P001', 10696, 17, 39.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1179, 'P001', 10696, 46, 12.00, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1180, 'P001', 10697, 19, 9.20, 7, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1181, 'P001', 10697, 35, 18.00, 9, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1182, 'P001', 10697, 58, 13.25, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1183, 'P001', 10697, 70, 15.00, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1184, 'P001', 10698, 11, 21.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1185, 'P001', 10698, 17, 39.00, 8, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1186, 'P001', 10698, 29, 123.79, 12, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1187, 'P001', 10698, 65, 21.05, 65, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1188, 'P001', 10698, 70, 15.00, 8, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1189, 'P001', 10699, 47, 9.50, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1190, 'P001', 10700, 1, 18.00, 5, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1191, 'P001', 10700, 34, 14.00, 12, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1192, 'P001', 10700, 68, 12.50, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1193, 'P001', 10700, 71, 21.50, 60, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1194, 'P001', 10701, 59, 55.00, 42, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1195, 'P001', 10701, 71, 21.50, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1196, 'P001', 10701, 76, 18.00, 35, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1197, 'P001', 10702, 3, 10.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1198, 'P001', 10702, 76, 18.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1199, 'P001', 10703, 2, 19.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1200, 'P001', 10703, 59, 55.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1201, 'P001', 10703, 73, 15.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1202, 'P001', 10704, 4, 22.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1203, 'P001', 10704, 24, 4.50, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1204, 'P001', 10704, 48, 12.75, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1205, 'P001', 10705, 31, 12.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1206, 'P001', 10705, 32, 32.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1207, 'P001', 10706, 16, 17.45, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1208, 'P001', 10706, 43, 46.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1209, 'P001', 10706, 59, 55.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1210, 'P001', 10707, 55, 24.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1211, 'P001', 10707, 57, 19.50, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1212, 'P001', 10707, 70, 15.00, 28, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1213, 'P001', 10708, 5, 21.35, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1214, 'P001', 10708, 36, 19.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1215, 'P001', 10709, 8, 40.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1216, 'P001', 10709, 51, 53.00, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1217, 'P001', 10709, 60, 34.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1218, 'P001', 10710, 19, 9.20, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1219, 'P001', 10710, 47, 9.50, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1220, 'P001', 10711, 19, 9.20, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1221, 'P001', 10711, 41, 9.65, 42, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1222, 'P001', 10711, 53, 32.80, 120, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1223, 'P001', 10712, 53, 32.80, 3, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1224, 'P001', 10712, 56, 38.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1225, 'P001', 10713, 10, 31.00, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1226, 'P001', 10713, 26, 31.23, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1227, 'P001', 10713, 45, 9.50, 110, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1228, 'P001', 10713, 46, 12.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1229, 'P001', 10714, 2, 19.00, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1230, 'P001', 10714, 17, 39.00, 27, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1231, 'P001', 10714, 47, 9.50, 50, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1232, 'P001', 10714, 56, 38.00, 18, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1233, 'P001', 10714, 58, 13.25, 12, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1234, 'P001', 10715, 10, 31.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1235, 'P001', 10715, 71, 21.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1236, 'P001', 10716, 21, 10.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1237, 'P001', 10716, 51, 53.00, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1238, 'P001', 10716, 61, 28.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1239, 'P001', 10717, 21, 10.00, 32, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1240, 'P001', 10717, 54, 7.45, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1241, 'P001', 10717, 69, 36.00, 25, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1242, 'P001', 10718, 12, 38.00, 36, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1243, 'P001', 10718, 16, 17.45, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1244, 'P001', 10718, 36, 19.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1245, 'P001', 10718, 62, 49.30, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1246, 'P001', 10719, 18, 62.50, 12, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1247, 'P001', 10719, 30, 25.89, 3, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1248, 'P001', 10719, 54, 7.45, 40, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1249, 'P001', 10720, 35, 18.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1250, 'P001', 10720, 71, 21.50, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1251, 'P001', 10721, 44, 19.45, 50, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1252, 'P001', 10722, 2, 19.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1253, 'P001', 10722, 31, 12.50, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1254, 'P001', 10722, 68, 12.50, 45, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1255, 'P001', 10722, 75, 7.75, 42, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1256, 'P001', 10723, 26, 31.23, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1257, 'P001', 10724, 10, 31.00, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1258, 'P001', 10724, 61, 28.50, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1259, 'P001', 10725, 41, 9.65, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1260, 'P001', 10725, 52, 7.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1261, 'P001', 10725, 55, 24.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1262, 'P001', 10726, 4, 22.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1263, 'P001', 10726, 11, 21.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1264, 'P001', 10727, 17, 39.00, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1265, 'P001', 10727, 56, 38.00, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1266, 'P001', 10727, 59, 55.00, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1267, 'P001', 10728, 30, 25.89, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1268, 'P001', 10728, 40, 18.40, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1269, 'P001', 10728, 55, 24.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1270, 'P001', 10728, 60, 34.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1271, 'P001', 10729, 1, 18.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1272, 'P001', 10729, 21, 10.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1273, 'P001', 10729, 50, 16.25, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1274, 'P001', 10730, 16, 17.45, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1275, 'P001', 10730, 31, 12.50, 3, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1276, 'P001', 10730, 65, 21.05, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1277, 'P001', 10731, 21, 10.00, 40, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1278, 'P001', 10731, 51, 53.00, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1279, 'P001', 10732, 76, 18.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1280, 'P001', 10733, 14, 23.25, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1281, 'P001', 10733, 28, 45.60, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1282, 'P001', 10733, 52, 7.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1283, 'P001', 10734, 6, 25.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1284, 'P001', 10734, 30, 25.89, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1285, 'P001', 10734, 76, 18.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1286, 'P001', 10735, 61, 28.50, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1287, 'P001', 10735, 77, 13.00, 2, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1288, 'P001', 10736, 65, 21.05, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1289, 'P001', 10736, 75, 7.75, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1290, 'P001', 10737, 13, 6.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1291, 'P001', 10737, 41, 9.65, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1292, 'P001', 10738, 16, 17.45, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1293, 'P001', 10739, 36, 19.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1294, 'P001', 10739, 52, 7.00, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1295, 'P001', 10740, 28, 45.60, 5, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1296, 'P001', 10740, 35, 18.00, 35, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1297, 'P001', 10740, 45, 9.50, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1298, 'P001', 10740, 56, 38.00, 14, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1299, 'P001', 10741, 2, 19.00, 15, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1300, 'P001', 10742, 3, 10.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1301, 'P001', 10742, 60, 34.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1302, 'P001', 10742, 72, 34.80, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1303, 'P001', 10743, 46, 12.00, 28, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1304, 'P001', 10744, 40, 18.40, 50, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1305, 'P001', 10745, 18, 62.50, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1306, 'P001', 10745, 44, 19.45, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1307, 'P001', 10745, 59, 55.00, 45, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1308, 'P001', 10745, 72, 34.80, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1309, 'P001', 10746, 13, 6.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1310, 'P001', 10746, 42, 14.00, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1311, 'P001', 10746, 62, 49.30, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1312, 'P001', 10746, 69, 36.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1313, 'P001', 10747, 31, 12.50, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1314, 'P001', 10747, 41, 9.65, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1315, 'P001', 10747, 63, 43.90, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1316, 'P001', 10747, 69, 36.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1317, 'P001', 10748, 23, 9.00, 44, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1318, 'P001', 10748, 40, 18.40, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1319, 'P001', 10748, 56, 38.00, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1320, 'P001', 10749, 56, 38.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1321, 'P001', 10749, 59, 55.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1322, 'P001', 10749, 76, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1323, 'P001', 10750, 14, 23.25, 5, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1324, 'P001', 10750, 45, 9.50, 40, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1325, 'P001', 10750, 59, 55.00, 25, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1326, 'P001', 10751, 26, 31.23, 12, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1327, 'P001', 10751, 30, 25.89, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1328, 'P001', 10751, 50, 16.25, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1329, 'P001', 10751, 73, 15.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1330, 'P001', 10752, 1, 18.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1331, 'P001', 10752, 69, 36.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1332, 'P001', 10753, 45, 9.50, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1333, 'P001', 10753, 74, 10.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1334, 'P001', 10754, 40, 18.40, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1335, 'P001', 10755, 47, 9.50, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1336, 'P001', 10755, 56, 38.00, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1337, 'P001', 10755, 57, 19.50, 14, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1338, 'P001', 10755, 69, 36.00, 25, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1339, 'P001', 10756, 18, 62.50, 21, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1340, 'P001', 10756, 36, 19.00, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1341, 'P001', 10756, 68, 12.50, 6, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1342, 'P001', 10756, 69, 36.00, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1343, 'P001', 10757, 34, 14.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1344, 'P001', 10757, 59, 55.00, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1345, 'P001', 10757, 62, 49.30, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1346, 'P001', 10757, 64, 33.25, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1347, 'P001', 10758, 26, 31.23, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1348, 'P001', 10758, 52, 7.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1349, 'P001', 10758, 70, 15.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1350, 'P001', 10759, 32, 32.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1351, 'P001', 10760, 25, 14.00, 12, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1352, 'P001', 10760, 27, 43.90, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1353, 'P001', 10760, 43, 46.00, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1354, 'P001', 10761, 25, 14.00, 35, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1355, 'P001', 10761, 75, 7.75, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1356, 'P001', 10762, 39, 18.00, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1357, 'P001', 10762, 47, 9.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1358, 'P001', 10762, 51, 53.00, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1359, 'P001', 10762, 56, 38.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1360, 'P001', 10763, 21, 10.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1361, 'P001', 10763, 22, 21.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1362, 'P001', 10763, 24, 4.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1363, 'P001', 10764, 3, 10.00, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1364, 'P001', 10764, 39, 18.00, 130, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1365, 'P001', 10765, 65, 21.05, 80, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1366, 'P001', 10766, 2, 19.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1367, 'P001', 10766, 7, 30.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1368, 'P001', 10766, 68, 12.50, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1369, 'P001', 10767, 42, 14.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1370, 'P001', 10768, 22, 21.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1371, 'P001', 10768, 31, 12.50, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1372, 'P001', 10768, 60, 34.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1373, 'P001', 10768, 71, 21.50, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1374, 'P001', 10769, 41, 9.65, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1375, 'P001', 10769, 52, 7.00, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1376, 'P001', 10769, 61, 28.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1377, 'P001', 10769, 62, 49.30, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1378, 'P001', 10770, 11, 21.00, 15, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1379, 'P001', 10771, 71, 21.50, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1380, 'P001', 10772, 29, 123.79, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1381, 'P001', 10772, 59, 55.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1382, 'P001', 10773, 17, 39.00, 33, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1383, 'P001', 10773, 31, 12.50, 70, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1384, 'P001', 10773, 75, 7.75, 7, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1385, 'P001', 10774, 31, 12.50, 2, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1386, 'P001', 10774, 66, 17.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1387, 'P001', 10775, 10, 31.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1388, 'P001', 10775, 67, 14.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1389, 'P001', 10776, 31, 12.50, 16, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1390, 'P001', 10776, 42, 14.00, 12, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1391, 'P001', 10776, 45, 9.50, 27, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1392, 'P001', 10776, 51, 53.00, 120, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1393, 'P001', 10777, 42, 14.00, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1394, 'P001', 10778, 41, 9.65, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1395, 'P001', 10779, 16, 17.45, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1396, 'P001', 10779, 62, 49.30, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1397, 'P001', 10780, 70, 15.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1398, 'P001', 10780, 77, 13.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1399, 'P001', 10781, 54, 7.45, 3, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1400, 'P001', 10781, 56, 38.00, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1401, 'P001', 10781, 74, 10.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1402, 'P001', 10782, 31, 12.50, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1403, 'P001', 10783, 31, 12.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1404, 'P001', 10783, 38, 263.50, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1405, 'P001', 10784, 36, 19.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1406, 'P001', 10784, 39, 18.00, 2, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1407, 'P001', 10784, 72, 34.80, 30, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1408, 'P001', 10785, 10, 31.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1409, 'P001', 10785, 75, 7.75, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1410, 'P001', 10786, 8, 40.00, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1411, 'P001', 10786, 30, 25.89, 15, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1412, 'P001', 10786, 75, 7.75, 42, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1413, 'P001', 10787, 2, 19.00, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1414, 'P001', 10787, 29, 123.79, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1415, 'P001', 10788, 19, 9.20, 50, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1416, 'P001', 10788, 75, 7.75, 40, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1417, 'P001', 10789, 18, 62.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1418, 'P001', 10789, 35, 18.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1419, 'P001', 10789, 63, 43.90, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1420, 'P001', 10789, 68, 12.50, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1421, 'P001', 10790, 7, 30.00, 3, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1422, 'P001', 10790, 56, 38.00, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1423, 'P001', 10791, 29, 123.79, 14, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1424, 'P001', 10791, 41, 9.65, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1425, 'P001', 10792, 2, 19.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1426, 'P001', 10792, 54, 7.45, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1427, 'P001', 10792, 68, 12.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1428, 'P001', 10793, 41, 9.65, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1429, 'P001', 10793, 52, 7.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1430, 'P001', 10794, 14, 23.25, 15, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1431, 'P001', 10794, 54, 7.45, 6, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1432, 'P001', 10795, 16, 17.45, 65, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1433, 'P001', 10795, 17, 39.00, 35, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1434, 'P001', 10796, 26, 31.23, 21, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1435, 'P001', 10796, 44, 19.45, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1436, 'P001', 10796, 64, 33.25, 35, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1437, 'P001', 10796, 69, 36.00, 24, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1438, 'P001', 10797, 11, 21.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1439, 'P001', 10798, 62, 49.30, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1440, 'P001', 10798, 72, 34.80, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1441, 'P001', 10799, 13, 6.00, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1442, 'P001', 10799, 24, 4.50, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1443, 'P001', 10799, 59, 55.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1444, 'P001', 10800, 11, 21.00, 50, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1445, 'P001', 10800, 51, 53.00, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1446, 'P001', 10800, 54, 7.45, 7, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1447, 'P001', 10801, 17, 39.00, 40, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1448, 'P001', 10801, 29, 123.79, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1449, 'P001', 10802, 30, 25.89, 25, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1450, 'P001', 10802, 51, 53.00, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1451, 'P001', 10802, 55, 24.00, 60, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1452, 'P001', 10802, 62, 49.30, 5, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1453, 'P001', 10803, 19, 9.20, 24, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1454, 'P001', 10803, 25, 14.00, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1455, 'P001', 10803, 59, 55.00, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1456, 'P001', 10804, 10, 31.00, 36, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1457, 'P001', 10804, 28, 45.60, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1458, 'P001', 10804, 49, 20.00, 4, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1459, 'P001', 10805, 34, 14.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1460, 'P001', 10805, 38, 263.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1461, 'P001', 10806, 2, 19.00, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1462, 'P001', 10806, 65, 21.05, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1463, 'P001', 10806, 74, 10.00, 15, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1464, 'P001', 10807, 40, 18.40, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1465, 'P001', 10808, 56, 38.00, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1466, 'P001', 10808, 76, 18.00, 50, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1467, 'P001', 10809, 52, 7.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1468, 'P001', 10810, 13, 6.00, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1469, 'P001', 10810, 25, 14.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1470, 'P001', 10810, 70, 15.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1471, 'P001', 10811, 19, 9.20, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1472, 'P001', 10811, 23, 9.00, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1473, 'P001', 10811, 40, 18.40, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1474, 'P001', 10812, 31, 12.50, 16, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1475, 'P001', 10812, 72, 34.80, 40, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1476, 'P001', 10812, 77, 13.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1477, 'P001', 10813, 2, 19.00, 12, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1478, 'P001', 10813, 46, 12.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1479, 'P001', 10814, 41, 9.65, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1480, 'P001', 10814, 43, 46.00, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1481, 'P001', 10814, 48, 12.75, 8, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1482, 'P001', 10814, 61, 28.50, 30, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1483, 'P001', 10815, 33, 2.50, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1484, 'P001', 10816, 38, 263.50, 30, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1485, 'P001', 10816, 62, 49.30, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1486, 'P001', 10817, 26, 31.23, 40, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1487, 'P001', 10817, 38, 263.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1488, 'P001', 10817, 40, 18.40, 60, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1489, 'P001', 10817, 62, 49.30, 25, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1490, 'P001', 10818, 32, 32.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1491, 'P001', 10818, 41, 9.65, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1492, 'P001', 10819, 43, 46.00, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1493, 'P001', 10819, 75, 7.75, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1494, 'P001', 10820, 56, 38.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1495, 'P001', 10821, 35, 18.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1496, 'P001', 10821, 51, 53.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1497, 'P001', 10822, 62, 49.30, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1498, 'P001', 10822, 70, 15.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1499, 'P001', 10823, 11, 21.00, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1500, 'P001', 10823, 57, 19.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1501, 'P001', 10823, 59, 55.00, 40, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1502, 'P001', 10823, 77, 13.00, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1503, 'P001', 10824, 41, 9.65, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1504, 'P001', 10824, 70, 15.00, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1505, 'P001', 10825, 26, 31.23, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1506, 'P001', 10825, 53, 32.80, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1507, 'P001', 10826, 31, 12.50, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1508, 'P001', 10826, 57, 19.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1509, 'P001', 10827, 10, 31.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1510, 'P001', 10827, 39, 18.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1511, 'P001', 10828, 20, 81.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1512, 'P001', 10828, 38, 263.50, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1513, 'P001', 10829, 2, 19.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1514, 'P001', 10829, 8, 40.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1515, 'P001', 10829, 13, 6.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1516, 'P001', 10829, 60, 34.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1517, 'P001', 10830, 6, 25.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1518, 'P001', 10830, 39, 18.00, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1519, 'P001', 10830, 60, 34.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1520, 'P001', 10830, 68, 12.50, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1521, 'P001', 10831, 19, 9.20, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1522, 'P001', 10831, 35, 18.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1523, 'P001', 10831, 38, 263.50, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1524, 'P001', 10831, 43, 46.00, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1525, 'P001', 10832, 13, 6.00, 3, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1526, 'P001', 10832, 25, 14.00, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1527, 'P001', 10832, 44, 19.45, 16, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1528, 'P001', 10832, 64, 33.25, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1529, 'P001', 10833, 7, 30.00, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1530, 'P001', 10833, 31, 12.50, 9, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1531, 'P001', 10833, 53, 32.80, 9, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1532, 'P001', 10834, 29, 123.79, 8, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1533, 'P001', 10834, 30, 25.89, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1534, 'P001', 10835, 59, 55.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1535, 'P001', 10835, 77, 13.00, 2, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1536, 'P001', 10836, 22, 21.00, 52, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1537, 'P001', 10836, 35, 18.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1538, 'P001', 10836, 57, 19.50, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1539, 'P001', 10836, 60, 34.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1540, 'P001', 10836, 64, 33.25, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1541, 'P001', 10837, 13, 6.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1542, 'P001', 10837, 40, 18.40, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1543, 'P001', 10837, 47, 9.50, 40, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1544, 'P001', 10837, 76, 18.00, 21, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1545, 'P001', 10838, 1, 18.00, 4, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1546, 'P001', 10838, 18, 62.50, 25, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1547, 'P001', 10838, 36, 19.00, 50, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1548, 'P001', 10839, 58, 13.25, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1549, 'P001', 10839, 72, 34.80, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1550, 'P001', 10840, 25, 14.00, 6, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1551, 'P001', 10840, 39, 18.00, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1552, 'P001', 10841, 10, 31.00, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1553, 'P001', 10841, 56, 38.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1554, 'P001', 10841, 59, 55.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1555, 'P001', 10841, 77, 13.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1556, 'P001', 10842, 11, 21.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1557, 'P001', 10842, 43, 46.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1558, 'P001', 10842, 68, 12.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1559, 'P001', 10842, 70, 15.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1560, 'P001', 10843, 51, 53.00, 4, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1561, 'P001', 10844, 22, 21.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1562, 'P001', 10845, 23, 9.00, 70, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1563, 'P001', 10845, 35, 18.00, 25, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1564, 'P001', 10845, 42, 14.00, 42, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1565, 'P001', 10845, 58, 13.25, 60, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1566, 'P001', 10845, 64, 33.25, 48, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1567, 'P001', 10846, 4, 22.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1568, 'P001', 10846, 70, 15.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1569, 'P001', 10846, 74, 10.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1570, 'P001', 10847, 1, 18.00, 80, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1571, 'P001', 10847, 19, 9.20, 12, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1572, 'P001', 10847, 37, 26.00, 60, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1573, 'P001', 10847, 45, 9.50, 36, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1574, 'P001', 10847, 60, 34.00, 45, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1575, 'P001', 10847, 71, 21.50, 55, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1576, 'P001', 10848, 5, 21.35, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1577, 'P001', 10848, 9, 97.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1578, 'P001', 10849, 3, 10.00, 49, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1579, 'P001', 10849, 26, 31.23, 18, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1580, 'P001', 10850, 25, 14.00, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1581, 'P001', 10850, 33, 2.50, 4, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1582, 'P001', 10850, 70, 15.00, 30, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1583, 'P001', 10851, 2, 19.00, 5, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1584, 'P001', 10851, 25, 14.00, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1585, 'P001', 10851, 57, 19.50, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1586, 'P001', 10851, 59, 55.00, 42, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1587, 'P001', 10852, 2, 19.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1588, 'P001', 10852, 17, 39.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1589, 'P001', 10852, 62, 49.30, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1590, 'P001', 10853, 18, 62.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1591, 'P001', 10854, 10, 31.00, 100, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1592, 'P001', 10854, 13, 6.00, 65, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1593, 'P001', 10855, 16, 17.45, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1594, 'P001', 10855, 31, 12.50, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1595, 'P001', 10855, 56, 38.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1596, 'P001', 10855, 65, 21.05, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1597, 'P001', 10856, 2, 19.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1598, 'P001', 10856, 42, 14.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1599, 'P001', 10857, 3, 10.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1600, 'P001', 10857, 26, 31.23, 35, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1601, 'P001', 10857, 29, 123.79, 10, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1602, 'P001', 10858, 7, 30.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1603, 'P001', 10858, 27, 43.90, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1604, 'P001', 10858, 70, 15.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1605, 'P001', 10859, 24, 4.50, 40, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1606, 'P001', 10859, 54, 7.45, 35, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1607, 'P001', 10859, 64, 33.25, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1608, 'P001', 10860, 51, 53.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1609, 'P001', 10860, 76, 18.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1610, 'P001', 10861, 17, 39.00, 42, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1611, 'P001', 10861, 18, 62.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1612, 'P001', 10861, 21, 10.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1613, 'P001', 10861, 33, 2.50, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1614, 'P001', 10861, 62, 49.30, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1615, 'P001', 10862, 11, 21.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1616, 'P001', 10862, 52, 7.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1617, 'P001', 10863, 1, 18.00, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1618, 'P001', 10863, 58, 13.25, 12, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1619, 'P001', 10864, 35, 18.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1620, 'P001', 10864, 67, 14.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1621, 'P001', 10865, 38, 263.50, 60, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1622, 'P001', 10865, 39, 18.00, 80, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1623, 'P001', 10866, 2, 19.00, 21, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1624, 'P001', 10866, 24, 4.50, 6, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1625, 'P001', 10866, 30, 25.89, 40, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1626, 'P001', 10867, 53, 32.80, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1627, 'P001', 10868, 26, 31.23, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1628, 'P001', 10868, 35, 18.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1629, 'P001', 10868, 49, 20.00, 42, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1630, 'P001', 10869, 1, 18.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1631, 'P001', 10869, 11, 21.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1632, 'P001', 10869, 23, 9.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1633, 'P001', 10869, 68, 12.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1634, 'P001', 10870, 35, 18.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1635, 'P001', 10870, 51, 53.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1636, 'P001', 10871, 6, 25.00, 50, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1637, 'P001', 10871, 16, 17.45, 12, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1638, 'P001', 10871, 17, 39.00, 16, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1639, 'P001', 10872, 55, 24.00, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1640, 'P001', 10872, 62, 49.30, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1641, 'P001', 10872, 64, 33.25, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1642, 'P001', 10872, 65, 21.05, 21, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1643, 'P001', 10873, 21, 10.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1644, 'P001', 10873, 28, 45.60, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1645, 'P001', 10874, 10, 31.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1646, 'P001', 10875, 19, 9.20, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1647, 'P001', 10875, 47, 9.50, 21, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1648, 'P001', 10875, 49, 20.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1649, 'P001', 10876, 46, 12.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1650, 'P001', 10876, 64, 33.25, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1651, 'P001', 10877, 16, 17.45, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1652, 'P001', 10877, 18, 62.50, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1653, 'P001', 10878, 20, 81.00, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1654, 'P001', 10879, 40, 18.40, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1655, 'P001', 10879, 65, 21.05, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1656, 'P001', 10879, 76, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1657, 'P001', 10880, 23, 9.00, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1658, 'P001', 10880, 61, 28.50, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1659, 'P001', 10880, 70, 15.00, 50, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1660, 'P001', 10881, 73, 15.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1661, 'P001', 10882, 42, 14.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1662, 'P001', 10882, 49, 20.00, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1663, 'P001', 10882, 54, 7.45, 32, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1664, 'P001', 10883, 24, 4.50, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1665, 'P001', 10884, 21, 10.00, 40, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1666, 'P001', 10884, 56, 38.00, 21, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1667, 'P001', 10884, 65, 21.05, 12, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1668, 'P001', 10885, 2, 19.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1669, 'P001', 10885, 24, 4.50, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1670, 'P001', 10885, 70, 15.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1671, 'P001', 10885, 77, 13.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1672, 'P001', 10886, 10, 31.00, 70, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1673, 'P001', 10886, 31, 12.50, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1674, 'P001', 10886, 77, 13.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1675, 'P001', 10887, 25, 14.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1676, 'P001', 10888, 2, 19.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1677, 'P001', 10888, 68, 12.50, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1678, 'P001', 10889, 11, 21.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1679, 'P001', 10889, 38, 263.50, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1680, 'P001', 10890, 17, 39.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1681, 'P001', 10890, 34, 14.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1682, 'P001', 10890, 41, 9.65, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1683, 'P001', 10891, 30, 25.89, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1684, 'P001', 10892, 59, 55.00, 40, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1685, 'P001', 10893, 8, 40.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1686, 'P001', 10893, 24, 4.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1687, 'P001', 10893, 29, 123.79, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1688, 'P001', 10893, 30, 25.89, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1689, 'P001', 10893, 36, 19.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1690, 'P001', 10894, 13, 6.00, 28, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1691, 'P001', 10894, 69, 36.00, 50, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1692, 'P001', 10894, 75, 7.75, 120, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1693, 'P001', 10895, 24, 4.50, 110, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1694, 'P001', 10895, 39, 18.00, 45, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1695, 'P001', 10895, 40, 18.40, 91, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1696, 'P001', 10895, 60, 34.00, 100, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1697, 'P001', 10896, 45, 9.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1698, 'P001', 10896, 56, 38.00, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1699, 'P001', 10897, 29, 123.79, 80, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1700, 'P001', 10897, 30, 25.89, 36, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1701, 'P001', 10898, 13, 6.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1702, 'P001', 10899, 39, 18.00, 8, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1703, 'P001', 10900, 70, 15.00, 3, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1704, 'P001', 10901, 41, 9.65, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1705, 'P001', 10901, 71, 21.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1706, 'P001', 10902, 55, 24.00, 30, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1707, 'P001', 10902, 62, 49.30, 6, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1708, 'P001', 10903, 13, 6.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1709, 'P001', 10903, 65, 21.05, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1710, 'P001', 10903, 68, 12.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1711, 'P001', 10904, 58, 13.25, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1712, 'P001', 10904, 62, 49.30, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1713, 'P001', 10905, 1, 18.00, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1714, 'P001', 10906, 61, 28.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1715, 'P001', 10907, 75, 7.75, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1716, 'P001', 10908, 7, 30.00, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1717, 'P001', 10908, 52, 7.00, 14, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1718, 'P001', 10909, 7, 30.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1719, 'P001', 10909, 16, 17.45, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1720, 'P001', 10909, 41, 9.65, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1721, 'P001', 10910, 19, 9.20, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1722, 'P001', 10910, 49, 20.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1723, 'P001', 10910, 61, 28.50, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1724, 'P001', 10911, 1, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1725, 'P001', 10911, 17, 39.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1726, 'P001', 10911, 67, 14.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1727, 'P001', 10912, 11, 21.00, 40, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1728, 'P001', 10912, 29, 123.79, 60, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1729, 'P001', 10913, 4, 22.00, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1730, 'P001', 10913, 33, 2.50, 40, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1731, 'P001', 10913, 58, 13.25, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1732, 'P001', 10914, 71, 21.50, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1733, 'P001', 10915, 17, 39.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1734, 'P001', 10915, 33, 2.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1735, 'P001', 10915, 54, 7.45, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1736, 'P001', 10916, 16, 17.45, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1737, 'P001', 10916, 32, 32.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1738, 'P001', 10916, 57, 19.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1739, 'P001', 10917, 30, 25.89, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1740, 'P001', 10917, 60, 34.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1741, 'P001', 10918, 1, 18.00, 60, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1742, 'P001', 10918, 60, 34.00, 25, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1743, 'P001', 10919, 16, 17.45, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1744, 'P001', 10919, 25, 14.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1745, 'P001', 10919, 40, 18.40, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1746, 'P001', 10920, 50, 16.25, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1747, 'P001', 10921, 35, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1748, 'P001', 10921, 63, 43.90, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1749, 'P001', 10922, 17, 39.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1750, 'P001', 10922, 24, 4.50, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1751, 'P001', 10923, 42, 14.00, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1752, 'P001', 10923, 43, 46.00, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1753, 'P001', 10923, 67, 14.00, 24, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1754, 'P001', 10924, 10, 31.00, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1755, 'P001', 10924, 28, 45.60, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1756, 'P001', 10924, 75, 7.75, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1757, 'P001', 10925, 36, 19.00, 25, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1758, 'P001', 10925, 52, 7.00, 12, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1759, 'P001', 10926, 11, 21.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1760, 'P001', 10926, 13, 6.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1761, 'P001', 10926, 19, 9.20, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1762, 'P001', 10926, 72, 34.80, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1763, 'P001', 10927, 20, 81.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1764, 'P001', 10927, 52, 7.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1765, 'P001', 10927, 76, 18.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1766, 'P001', 10928, 47, 9.50, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1767, 'P001', 10928, 76, 18.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1768, 'P001', 10929, 21, 10.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1769, 'P001', 10929, 75, 7.75, 49, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1770, 'P001', 10929, 77, 13.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1771, 'P001', 10930, 21, 10.00, 36, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1772, 'P001', 10930, 27, 43.90, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1773, 'P001', 10930, 55, 24.00, 25, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1774, 'P001', 10930, 58, 13.25, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1775, 'P001', 10931, 13, 6.00, 42, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1776, 'P001', 10931, 57, 19.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1777, 'P001', 10932, 16, 17.45, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1778, 'P001', 10932, 62, 49.30, 14, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1779, 'P001', 10932, 72, 34.80, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1780, 'P001', 10932, 75, 7.75, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1781, 'P001', 10933, 53, 32.80, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1782, 'P001', 10933, 61, 28.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1783, 'P001', 10934, 6, 25.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1784, 'P001', 10935, 1, 18.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1785, 'P001', 10935, 18, 62.50, 4, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1786, 'P001', 10935, 23, 9.00, 8, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1787, 'P001', 10936, 36, 19.00, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1788, 'P001', 10937, 28, 45.60, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1789, 'P001', 10937, 34, 14.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1790, 'P001', 10938, 13, 6.00, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1791, 'P001', 10938, 43, 46.00, 24, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1792, 'P001', 10938, 60, 34.00, 49, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1793, 'P001', 10938, 71, 21.50, 35, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1794, 'P001', 10939, 2, 19.00, 10, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1795, 'P001', 10939, 67, 14.00, 40, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1796, 'P001', 10940, 7, 30.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1797, 'P001', 10940, 13, 6.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1798, 'P001', 10941, 31, 12.50, 44, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1799, 'P001', 10941, 62, 49.30, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1800, 'P001', 10941, 68, 12.50, 80, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1801, 'P001', 10941, 72, 34.80, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1802, 'P001', 10942, 49, 20.00, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1803, 'P001', 10943, 13, 6.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1804, 'P001', 10943, 22, 21.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1805, 'P001', 10943, 46, 12.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1806, 'P001', 10944, 11, 21.00, 5, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1807, 'P001', 10944, 44, 19.45, 18, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1808, 'P001', 10944, 56, 38.00, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1809, 'P001', 10945, 13, 6.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1810, 'P001', 10945, 31, 12.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1811, 'P001', 10946, 10, 31.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1812, 'P001', 10946, 24, 4.50, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1813, 'P001', 10946, 77, 13.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1814, 'P001', 10947, 59, 55.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1815, 'P001', 10948, 50, 16.25, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1816, 'P001', 10948, 51, 53.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1817, 'P001', 10948, 55, 24.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1818, 'P001', 10949, 6, 25.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1819, 'P001', 10949, 10, 31.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1820, 'P001', 10949, 17, 39.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1821, 'P001', 10949, 62, 49.30, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1822, 'P001', 10950, 4, 22.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1823, 'P001', 10951, 33, 2.50, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1824, 'P001', 10951, 41, 9.65, 6, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1825, 'P001', 10951, 75, 7.75, 50, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1826, 'P001', 10952, 6, 25.00, 16, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1827, 'P001', 10952, 28, 45.60, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1828, 'P001', 10953, 20, 81.00, 50, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1829, 'P001', 10953, 31, 12.50, 50, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1830, 'P001', 10954, 16, 17.45, 28, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1831, 'P001', 10954, 31, 12.50, 25, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1832, 'P001', 10954, 45, 9.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1833, 'P001', 10954, 60, 34.00, 24, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1834, 'P001', 10955, 75, 7.75, 12, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1835, 'P001', 10956, 21, 10.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1836, 'P001', 10956, 47, 9.50, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1837, 'P001', 10956, 51, 53.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1838, 'P001', 10957, 30, 25.89, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1839, 'P001', 10957, 35, 18.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1840, 'P001', 10957, 64, 33.25, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1841, 'P001', 10958, 5, 21.35, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1842, 'P001', 10958, 7, 30.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1843, 'P001', 10958, 72, 34.80, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1844, 'P001', 10959, 75, 7.75, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1845, 'P001', 10960, 24, 4.50, 10, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1846, 'P001', 10960, 41, 9.65, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1847, 'P001', 10961, 52, 7.00, 6, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1848, 'P001', 10961, 76, 18.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1849, 'P001', 10962, 7, 30.00, 45, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1850, 'P001', 10962, 13, 6.00, 77, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1851, 'P001', 10962, 53, 32.80, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1852, 'P001', 10962, 69, 36.00, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1853, 'P001', 10962, 76, 18.00, 44, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1854, 'P001', 10963, 60, 34.00, 2, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1855, 'P001', 10964, 18, 62.50, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1856, 'P001', 10964, 38, 263.50, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1857, 'P001', 10964, 69, 36.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1858, 'P001', 10965, 51, 53.00, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1859, 'P001', 10966, 37, 26.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1860, 'P001', 10966, 56, 38.00, 12, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1861, 'P001', 10966, 62, 49.30, 12, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1862, 'P001', 10967, 19, 9.20, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1863, 'P001', 10967, 49, 20.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1864, 'P001', 10968, 12, 38.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1865, 'P001', 10968, 24, 4.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1866, 'P001', 10968, 64, 33.25, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1867, 'P001', 10969, 46, 12.00, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1868, 'P001', 10970, 52, 7.00, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1869, 'P001', 10971, 29, 123.79, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1870, 'P001', 10972, 17, 39.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1871, 'P001', 10972, 33, 2.50, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1872, 'P001', 10973, 26, 31.23, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1873, 'P001', 10973, 41, 9.65, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1874, 'P001', 10973, 75, 7.75, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1875, 'P001', 10974, 63, 43.90, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1876, 'P001', 10975, 8, 40.00, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1877, 'P001', 10975, 75, 7.75, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1878, 'P001', 10976, 28, 45.60, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1879, 'P001', 10977, 39, 18.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1880, 'P001', 10977, 47, 9.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1881, 'P001', 10977, 51, 53.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1882, 'P001', 10977, 63, 43.90, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1883, 'P001', 10978, 8, 40.00, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1884, 'P001', 10978, 21, 10.00, 40, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1885, 'P001', 10978, 40, 18.40, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1886, 'P001', 10978, 44, 19.45, 6, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1887, 'P001', 10979, 7, 30.00, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1888, 'P001', 10979, 12, 38.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1889, 'P001', 10979, 24, 4.50, 80, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1890, 'P001', 10979, 27, 43.90, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1891, 'P001', 10979, 31, 12.50, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1892, 'P001', 10979, 63, 43.90, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1893, 'P001', 10980, 75, 7.75, 40, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1894, 'P001', 10981, 38, 263.50, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1895, 'P001', 10982, 7, 30.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1896, 'P001', 10982, 43, 46.00, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1897, 'P001', 10983, 13, 6.00, 84, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1898, 'P001', 10983, 57, 19.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1899, 'P001', 10984, 16, 17.45, 55, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1900, 'P001', 10984, 24, 4.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1901, 'P001', 10984, 36, 19.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1902, 'P001', 10985, 16, 17.45, 36, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1903, 'P001', 10985, 18, 62.50, 8, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1904, 'P001', 10985, 32, 32.00, 35, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1905, 'P001', 10986, 11, 21.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1906, 'P001', 10986, 20, 81.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1907, 'P001', 10986, 76, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1908, 'P001', 10986, 77, 13.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1909, 'P001', 10987, 7, 30.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1910, 'P001', 10987, 43, 46.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1911, 'P001', 10987, 72, 34.80, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1912, 'P001', 10988, 7, 30.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1913, 'P001', 10988, 62, 49.30, 40, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1914, 'P001', 10989, 6, 25.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1915, 'P001', 10989, 11, 21.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1916, 'P001', 10989, 41, 9.65, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1917, 'P001', 10990, 21, 10.00, 65, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1918, 'P001', 10990, 34, 14.00, 60, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1919, 'P001', 10990, 55, 24.00, 65, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1920, 'P001', 10990, 61, 28.50, 66, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1921, 'P001', 10991, 2, 19.00, 50, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1922, 'P001', 10991, 70, 15.00, 20, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1923, 'P001', 10991, 76, 18.00, 90, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1924, 'P001', 10992, 72, 34.80, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1925, 'P001', 10993, 29, 123.79, 50, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1926, 'P001', 10993, 41, 9.65, 35, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1927, 'P001', 10994, 59, 55.00, 18, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1928, 'P001', 10995, 51, 53.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1929, 'P001', 10995, 60, 34.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1930, 'P001', 10996, 42, 14.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1931, 'P001', 10997, 32, 32.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1932, 'P001', 10997, 46, 12.00, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1933, 'P001', 10997, 52, 7.00, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1934, 'P001', 10998, 24, 4.50, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1935, 'P001', 10998, 61, 28.50, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1936, 'P001', 10998, 74, 10.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1937, 'P001', 10998, 75, 7.75, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1938, 'P001', 10999, 41, 9.65, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1939, 'P001', 10999, 51, 53.00, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1940, 'P001', 10999, 77, 13.00, 21, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1941, 'P001', 11000, 4, 22.00, 25, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1942, 'P001', 11000, 24, 4.50, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1943, 'P001', 11000, 77, 13.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1944, 'P001', 11001, 7, 30.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1945, 'P001', 11001, 22, 21.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1946, 'P001', 11001, 46, 12.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1947, 'P001', 11001, 55, 24.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1948, 'P001', 11002, 13, 6.00, 56, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1949, 'P001', 11002, 35, 18.00, 15, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1950, 'P001', 11002, 42, 14.00, 24, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1951, 'P001', 11002, 55, 24.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1952, 'P001', 11003, 1, 18.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1953, 'P001', 11003, 40, 18.40, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1954, 'P001', 11003, 52, 7.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1955, 'P001', 11004, 26, 31.23, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1956, 'P001', 11004, 76, 18.00, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1957, 'P001', 11005, 1, 18.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1958, 'P001', 11005, 59, 55.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1959, 'P001', 11006, 1, 18.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1960, 'P001', 11006, 29, 123.79, 2, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1961, 'P001', 11007, 8, 40.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1962, 'P001', 11007, 29, 123.79, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1963, 'P001', 11007, 42, 14.00, 14, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1964, 'P001', 11008, 28, 45.60, 70, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1965, 'P001', 11008, 34, 14.00, 90, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1966, 'P001', 11008, 71, 21.50, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1967, 'P001', 11009, 24, 4.50, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1968, 'P001', 11009, 36, 19.00, 18, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1969, 'P001', 11009, 60, 34.00, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1970, 'P001', 11010, 7, 30.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1971, 'P001', 11010, 24, 4.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1972, 'P001', 11011, 58, 13.25, 40, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1973, 'P001', 11011, 71, 21.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1974, 'P001', 11012, 19, 9.20, 50, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1975, 'P001', 11012, 60, 34.00, 36, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1976, 'P001', 11012, 71, 21.50, 60, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1977, 'P001', 11013, 23, 9.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1978, 'P001', 11013, 42, 14.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1979, 'P001', 11013, 45, 9.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1980, 'P001', 11013, 68, 12.50, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1981, 'P001', 11014, 41, 9.65, 28, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1982, 'P001', 11015, 30, 25.89, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1983, 'P001', 11015, 77, 13.00, 18, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1984, 'P001', 11016, 31, 12.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1985, 'P001', 11016, 36, 19.00, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1986, 'P001', 11017, 3, 10.00, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1987, 'P001', 11017, 59, 55.00, 110, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1988, 'P001', 11017, 70, 15.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1989, 'P001', 11018, 12, 38.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1990, 'P001', 11018, 18, 62.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1991, 'P001', 11018, 56, 38.00, 5, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1992, 'P001', 11019, 46, 12.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1993, 'P001', 11019, 49, 20.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1994, 'P001', 11020, 10, 31.00, 24, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1995, 'P001', 11021, 2, 19.00, 11, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1996, 'P001', 11021, 20, 81.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1997, 'P001', 11021, 26, 31.23, 63, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1998, 'P001', 11021, 51, 53.00, 44, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (1999, 'P001', 11021, 72, 34.80, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2000, 'P001', 11022, 19, 9.20, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2001, 'P001', 11022, 69, 36.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2002, 'P001', 11023, 7, 30.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2003, 'P001', 11023, 43, 46.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2004, 'P001', 11024, 26, 31.23, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2005, 'P001', 11024, 33, 2.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2006, 'P001', 11024, 65, 21.05, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2007, 'P001', 11024, 71, 21.50, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2008, 'P001', 11025, 1, 18.00, 10, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2009, 'P001', 11025, 13, 6.00, 20, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2010, 'P001', 11026, 18, 62.50, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2011, 'P001', 11026, 51, 53.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2012, 'P001', 11027, 24, 4.50, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2013, 'P001', 11027, 62, 49.30, 21, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2014, 'P001', 11028, 55, 24.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2015, 'P001', 11028, 59, 55.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2016, 'P001', 11029, 56, 38.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2017, 'P001', 11029, 63, 43.90, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2018, 'P001', 11030, 2, 19.00, 100, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2019, 'P001', 11030, 5, 21.35, 70, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2020, 'P001', 11030, 29, 123.79, 60, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2021, 'P001', 11030, 59, 55.00, 100, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2022, 'P001', 11031, 1, 18.00, 45, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2023, 'P001', 11031, 13, 6.00, 80, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2024, 'P001', 11031, 24, 4.50, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2025, 'P001', 11031, 64, 33.25, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2026, 'P001', 11031, 71, 21.50, 16, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2027, 'P001', 11032, 36, 19.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2028, 'P001', 11032, 38, 263.50, 25, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2029, 'P001', 11032, 59, 55.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2030, 'P001', 11033, 53, 32.80, 70, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2031, 'P001', 11033, 69, 36.00, 36, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2032, 'P001', 11034, 21, 10.00, 15, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2033, 'P001', 11034, 44, 19.45, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2034, 'P001', 11034, 61, 28.50, 6, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2035, 'P001', 11035, 1, 18.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2036, 'P001', 11035, 35, 18.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2037, 'P001', 11035, 42, 14.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2038, 'P001', 11035, 54, 7.45, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2039, 'P001', 11036, 13, 6.00, 7, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2040, 'P001', 11036, 59, 55.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2041, 'P001', 11037, 70, 15.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2042, 'P001', 11038, 40, 18.40, 5, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2043, 'P001', 11038, 52, 7.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2044, 'P001', 11038, 71, 21.50, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2045, 'P001', 11039, 28, 45.60, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2046, 'P001', 11039, 35, 18.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2047, 'P001', 11039, 49, 20.00, 60, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2048, 'P001', 11039, 57, 19.50, 28, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2049, 'P001', 11040, 21, 10.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2050, 'P001', 11041, 2, 19.00, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2051, 'P001', 11041, 63, 43.90, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2052, 'P001', 11042, 44, 19.45, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2053, 'P001', 11042, 61, 28.50, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2054, 'P001', 11043, 11, 21.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2055, 'P001', 11044, 62, 49.30, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2056, 'P001', 11045, 33, 2.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2057, 'P001', 11045, 51, 53.00, 24, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2058, 'P001', 11046, 12, 38.00, 20, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2059, 'P001', 11046, 32, 32.00, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2060, 'P001', 11046, 35, 18.00, 18, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2061, 'P001', 11047, 1, 18.00, 25, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2062, 'P001', 11047, 5, 21.35, 30, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2063, 'P001', 11048, 68, 12.50, 42, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2064, 'P001', 11049, 2, 19.00, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2065, 'P001', 11049, 12, 38.00, 4, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2066, 'P001', 11050, 76, 18.00, 50, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2067, 'P001', 11051, 24, 4.50, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2068, 'P001', 11052, 43, 46.00, 30, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2069, 'P001', 11052, 61, 28.50, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2070, 'P001', 11053, 18, 62.50, 35, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2071, 'P001', 11053, 32, 32.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2072, 'P001', 11053, 64, 33.25, 25, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2073, 'P001', 11054, 33, 2.50, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2074, 'P001', 11054, 67, 14.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2075, 'P001', 11055, 24, 4.50, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2076, 'P001', 11055, 25, 14.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2077, 'P001', 11055, 51, 53.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2078, 'P001', 11055, 57, 19.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2079, 'P001', 11056, 7, 30.00, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2080, 'P001', 11056, 55, 24.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2081, 'P001', 11056, 60, 34.00, 50, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2082, 'P001', 11057, 70, 15.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2083, 'P001', 11058, 21, 10.00, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2084, 'P001', 11058, 60, 34.00, 21, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2085, 'P001', 11058, 61, 28.50, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2086, 'P001', 11059, 13, 6.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2087, 'P001', 11059, 17, 39.00, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2088, 'P001', 11059, 60, 34.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2089, 'P001', 11060, 60, 34.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2090, 'P001', 11060, 77, 13.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2091, 'P001', 11061, 60, 34.00, 15, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2092, 'P001', 11062, 53, 32.80, 10, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2093, 'P001', 11062, 70, 15.00, 12, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2094, 'P001', 11063, 34, 14.00, 30, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2095, 'P001', 11063, 40, 18.40, 40, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2096, 'P001', 11063, 41, 9.65, 30, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2097, 'P001', 11064, 17, 39.00, 77, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2098, 'P001', 11064, 41, 9.65, 12, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2099, 'P001', 11064, 53, 32.80, 25, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2100, 'P001', 11064, 55, 24.00, 4, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2101, 'P001', 11064, 68, 12.50, 55, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2102, 'P001', 11065, 30, 25.89, 4, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2103, 'P001', 11065, 54, 7.45, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2104, 'P001', 11066, 16, 17.45, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2105, 'P001', 11066, 19, 9.20, 42, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2106, 'P001', 11066, 34, 14.00, 35, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2107, 'P001', 11067, 41, 9.65, 9, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2108, 'P001', 11068, 28, 45.60, 8, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2109, 'P001', 11068, 43, 46.00, 36, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2110, 'P001', 11068, 77, 13.00, 28, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2111, 'P001', 11069, 39, 18.00, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2112, 'P001', 11070, 1, 18.00, 40, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2113, 'P001', 11070, 2, 19.00, 20, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2114, 'P001', 11070, 16, 17.45, 30, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2115, 'P001', 11070, 31, 12.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2116, 'P001', 11071, 7, 30.00, 15, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2117, 'P001', 11071, 13, 6.00, 10, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2118, 'P001', 11072, 2, 19.00, 8, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2119, 'P001', 11072, 41, 9.65, 40, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2120, 'P001', 11072, 50, 16.25, 22, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2121, 'P001', 11072, 64, 33.25, 130, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2122, 'P001', 11073, 11, 21.00, 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2123, 'P001', 11073, 24, 4.50, 20, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2124, 'P001', 11074, 16, 17.45, 14, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2125, 'P001', 11075, 2, 19.00, 10, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2126, 'P001', 11075, 46, 12.00, 30, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2127, 'P001', 11075, 76, 18.00, 2, 0.15, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2128, 'P001', 11076, 6, 25.00, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2129, 'P001', 11076, 14, 23.25, 20, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2130, 'P001', 11076, 19, 9.20, 10, 0.25, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2131, 'P001', 11077, 2, 19.00, 24, 0.2, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2132, 'P001', 11077, 3, 10.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2133, 'P001', 11077, 4, 22.00, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2134, 'P001', 11077, 6, 25.00, 1, 0.02, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2135, 'P001', 11077, 7, 30.00, 1, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2136, 'P001', 11077, 8, 40.00, 2, 0.1, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2137, 'P001', 11077, 10, 31.00, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2138, 'P001', 11077, 12, 38.00, 2, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2139, 'P001', 11077, 13, 6.00, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2140, 'P001', 11077, 14, 23.25, 1, 0.03, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2141, 'P001', 11077, 16, 17.45, 2, 0.03, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2142, 'P001', 11077, 20, 81.00, 1, 0.04, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2143, 'P001', 11077, 23, 9.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2144, 'P001', 11077, 32, 32.00, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2145, 'P001', 11077, 39, 18.00, 2, 0.05, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2146, 'P001', 11077, 41, 9.65, 3, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2147, 'P001', 11077, 46, 12.00, 3, 0.02, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2148, 'P001', 11077, 52, 7.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2149, 'P001', 11077, 55, 24.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2150, 'P001', 11077, 60, 34.00, 2, 0.06, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2151, 'P001', 11077, 64, 33.25, 2, 0.03, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2152, 'P001', 11077, 66, 17.00, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2153, 'P001', 11077, 73, 15.00, 2, 0.01, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2154, 'P001', 11077, 75, 7.75, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2155, 'P001', 11077, 77, 13.00, 2, 0, NULL, NULL, NULL, NULL);
INSERT INTO `tr_order_details` VALUES (2157, 'P001', 10248, 1, 18.00, 1, 0, '2022-11-06 00:00:00', 'rahmat198@gmail.com', '2022-11-06 00:00:00', 'rahmat198@gmail.com');
INSERT INTO `tr_order_details` VALUES (2158, 'P001', 10257, 1, 18.00, 1, 0, '2022-11-06 00:00:00', 'rahmat198@gmail.com', NULL, '');

-- ----------------------------
-- Table structure for tr_order_files
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_files`;
CREATE TABLE `tr_order_files`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `order_id` int NULL DEFAULT NULL,
  `attachment` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `attachment_description` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_key_lunfiles`(`project_code`, `order_id`, `attachment`) USING BTREE,
  INDEX `lun_files_lunno`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tr_order_files
-- ----------------------------
INSERT INTO `tr_order_files` VALUES (1, 'P001', 10248, 'assets/uploads/query/note.txt', 'test upload', '2022-11-05 06:36:06', 'administrator', NULL, NULL);
INSERT INTO `tr_order_files` VALUES (2, 'P001', 10249, 'assets/uploads/orders/note.txt', 'test upload 3', '2022-11-05 06:48:28', 'administrator', NULL, NULL);

-- ----------------------------
-- Table structure for tr_orders
-- ----------------------------
DROP TABLE IF EXISTS `tr_orders`;
CREATE TABLE `tr_orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `customer_id` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `employee_id` int NULL DEFAULT NULL,
  `order_date` date NULL DEFAULT NULL,
  `required_date` date NULL DEFAULT NULL,
  `shipped_date` date NULL DEFAULT NULL,
  `ship_via` int NULL DEFAULT NULL,
  `freight` decimal(19, 4) NULL DEFAULT 0.0000,
  `ship_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ship_address` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ship_city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ship_region` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ship_postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ship_country` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('created','in progress','completed','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customerid`(`customer_id`) USING BTREE,
  INDEX `oustomersorders`(`customer_id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE,
  INDEX `omployeesorders`(`employee_id`) USING BTREE,
  INDEX `orderdate`(`order_date`) USING BTREE,
  INDEX `shippeddate`(`shipped_date`) USING BTREE,
  INDEX `ohippersorders`(`ship_via`) USING BTREE,
  INDEX `shippostalcode`(`ship_postal_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11078 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tr_orders
-- ----------------------------
INSERT INTO `tr_orders` VALUES (10248, 'P001', 'VINET', 5, '1996-07-04', '1996-08-01', '1996-07-16', 1, 32.3800, 'Vins et alcools Chevalier', '59 rue de l\'Abbaye', 'Reims', '', '51100', 'France', 'created', NULL, '', '2022-11-07 00:00:00', 'rahmat198@gmail.com');
INSERT INTO `tr_orders` VALUES (10249, 'P001', 'TOMSP', 6, '1996-07-05', '1996-08-16', '1996-07-10', 1, 11.6100, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10250, 'P001', 'HANAR', 4, '1996-07-08', '1996-08-05', '1996-07-12', 2, 65.8300, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10251, 'P001', 'VICTE', 3, '1996-07-08', '1996-08-05', '1996-07-15', 1, 41.3400, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10252, 'P001', 'SUPRD', 4, '1996-07-09', '1996-08-06', '1996-07-11', 2, 51.3000, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10253, 'P001', 'HANAR', 3, '1996-07-10', '1996-07-24', '1996-07-16', 2, 58.1700, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10254, 'P001', 'CHOPS', 5, '1996-07-11', '1996-08-08', '1996-07-23', 2, 22.9800, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10255, 'P001', 'RICSU', 9, '1996-07-12', '1996-08-09', '1996-07-15', 3, 148.3300, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10256, 'P001', 'WELLI', 3, '1996-07-15', '1996-08-12', '1996-07-17', 2, 13.9700, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10257, 'P001', 'HILAA', 4, '1996-07-16', '1996-08-13', '1996-07-22', 3, 81.9100, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10258, 'P001', 'ERNSH', 1, '1996-07-17', '1996-08-14', '1996-07-23', 1, 140.5100, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10259, 'P001', 'CENTC', 4, '1996-07-18', '1996-08-15', '1996-07-25', 3, 3.2500, 'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'Mexico', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10260, 'P001', 'OTTIK', 4, '1996-07-19', '1996-08-16', '1996-07-29', 1, 55.0900, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10261, 'P001', 'QUEDE', 4, '1996-07-19', '1996-08-16', '1996-07-30', 2, 3.0500, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10262, 'P001', 'RATTC', 8, '1996-07-22', '1996-08-19', '1996-07-25', 3, 48.2900, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10263, 'P001', 'ERNSH', 9, '1996-07-23', '1996-08-20', '1996-07-31', 3, 146.0600, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10264, 'P001', 'FOLKO', 6, '1996-07-24', '1996-08-21', '1996-08-23', 3, 3.6700, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10265, 'P001', 'BLONP', 2, '1996-07-25', '1996-08-22', '1996-08-12', 1, 55.2800, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10266, 'P001', 'WARTH', 3, '1996-07-26', '1996-09-06', '1996-07-31', 3, 25.7300, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10267, 'P001', 'FRANK', 4, '1996-07-29', '1996-08-26', '1996-08-06', 1, 208.5800, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10268, 'P001', 'GROSR', 8, '1996-07-30', '1996-08-27', '1996-08-02', 3, 66.2900, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10269, 'P001', 'WHITC', 5, '1996-07-31', '1996-08-14', '1996-08-09', 1, 4.5600, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10270, 'P001', 'WARTH', 1, '1996-08-01', '1996-08-29', '1996-08-02', 1, 136.5400, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10271, 'P001', 'SPLIR', 6, '1996-08-01', '1996-08-29', '1996-08-30', 2, 4.5400, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10272, 'P001', 'RATTC', 6, '1996-08-02', '1996-08-30', '1996-08-06', 2, 98.0300, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10273, 'P001', 'QUICK', 3, '1996-08-05', '1996-09-02', '1996-08-12', 3, 76.0700, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10274, 'P001', 'VINET', 6, '1996-08-06', '1996-09-03', '1996-08-16', 1, 6.0100, 'Vins et alcools Chevalier', '59 rue de l\'Abbaye', 'Reims', NULL, '51100', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10275, 'P001', 'MAGAA', 1, '1996-08-07', '1996-09-04', '1996-08-09', 1, 26.9300, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10276, 'P001', 'TORTU', 8, '1996-08-08', '1996-08-22', '1996-08-14', 3, 13.8400, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10277, 'P001', 'MORGK', 2, '1996-08-09', '1996-09-06', '1996-08-13', 3, 125.7700, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10278, 'P001', 'BERGS', 8, '1996-08-12', '1996-09-09', '1996-08-16', 2, 92.6900, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10279, 'P001', 'LEHMS', 8, '1996-08-13', '1996-09-10', '1996-08-16', 2, 25.8300, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10280, 'P001', 'BERGS', 2, '1996-08-14', '1996-09-11', '1996-09-12', 1, 8.9800, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10281, 'P001', 'ROMEY', 4, '1996-08-14', '1996-08-28', '1996-08-21', 1, 2.9400, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10282, 'P001', 'ROMEY', 4, '1996-08-15', '1996-09-12', '1996-08-21', 1, 12.6900, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10283, 'P001', 'LILAS', 3, '1996-08-16', '1996-09-13', '1996-08-23', 3, 84.8100, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10284, 'P001', 'LEHMS', 4, '1996-08-19', '1996-09-16', '1996-08-27', 1, 76.5600, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10285, 'P001', 'QUICK', 1, '1996-08-20', '1996-09-17', '1996-08-26', 2, 76.8300, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10286, 'P001', 'QUICK', 8, '1996-08-21', '1996-09-18', '1996-08-30', 3, 229.2400, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10287, 'P001', 'RICAR', 8, '1996-08-22', '1996-09-19', '1996-08-28', 3, 12.7600, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10288, 'P001', 'REGGC', 4, '1996-08-23', '1996-09-20', '1996-09-03', 1, 7.4500, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10289, 'P001', 'BSBEV', 7, '1996-08-26', '1996-09-23', '1996-08-28', 3, 22.7700, 'B\'s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10290, 'P001', 'COMMI', 8, '1996-08-27', '1996-09-24', '1996-09-03', 1, 79.7000, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10291, 'P001', 'QUEDE', 6, '1996-08-27', '1996-09-24', '1996-09-04', 2, 6.4000, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10292, 'P001', 'TRADH', 1, '1996-08-28', '1996-09-25', '1996-09-02', 2, 1.3500, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10293, 'P001', 'TORTU', 1, '1996-08-29', '1996-09-26', '1996-09-11', 3, 21.1800, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10294, 'P001', 'RATTC', 4, '1996-08-30', '1996-09-27', '1996-09-05', 2, 147.2600, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10295, 'P001', 'VINET', 2, '1996-09-02', '1996-09-30', '1996-09-10', 2, 1.1500, 'Vins et alcools Chevalier', '59 rue de l\'Abbaye', 'Reims', NULL, '51100', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10296, 'P001', 'LILAS', 6, '1996-09-03', '1996-10-01', '1996-09-11', 1, 0.1200, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10297, 'P001', 'BLONP', 5, '1996-09-04', '1996-10-16', '1996-09-10', 2, 5.7400, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10298, 'P001', 'HUNGO', 6, '1996-09-05', '1996-10-03', '1996-09-11', 2, 168.2200, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10299, 'P001', 'RICAR', 4, '1996-09-06', '1996-10-04', '1996-09-13', 2, 29.7600, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10300, 'P001', 'MAGAA', 2, '1996-09-09', '1996-10-07', '1996-09-18', 2, 17.6800, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10301, 'P001', 'WANDK', 8, '1996-09-09', '1996-10-07', '1996-09-17', 2, 45.0800, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10302, 'P001', 'SUPRD', 4, '1996-09-10', '1996-10-08', '1996-10-09', 2, 6.2700, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10303, 'P001', 'GODOS', 7, '1996-09-11', '1996-10-09', '1996-09-18', 2, 107.8300, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10304, 'P001', 'TORTU', 1, '1996-09-12', '1996-10-10', '1996-09-17', 2, 63.7900, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10305, 'P001', 'OLDWO', 8, '1996-09-13', '1996-10-11', '1996-10-09', 3, 257.6200, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10306, 'P001', 'ROMEY', 1, '1996-09-16', '1996-10-14', '1996-09-23', 3, 7.5600, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10307, 'P001', 'LONEP', 2, '1996-09-17', '1996-10-15', '1996-09-25', 2, 0.5600, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10308, 'P001', 'ANATR', 7, '1996-09-18', '1996-10-16', '1996-09-24', 3, 1.6100, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10309, 'P001', 'HUNGO', 3, '1996-09-19', '1996-10-17', '1996-10-23', 1, 47.3000, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10310, 'P001', 'THEBI', 8, '1996-09-20', '1996-10-18', '1996-09-27', 2, 17.5200, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10311, 'P001', 'DUMON', 1, '1996-09-20', '1996-10-04', '1996-09-26', 3, 24.6900, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10312, 'P001', 'WANDK', 2, '1996-09-23', '1996-10-21', '1996-10-03', 2, 40.2600, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10313, 'P001', 'QUICK', 2, '1996-09-24', '1996-10-22', '1996-10-04', 2, 1.9600, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10314, 'P001', 'RATTC', 1, '1996-09-25', '1996-10-23', '1996-10-04', 2, 74.1600, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10315, 'P001', 'ISLAT', 4, '1996-09-26', '1996-10-24', '1996-10-03', 2, 41.7600, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10316, 'P001', 'RATTC', 1, '1996-09-27', '1996-10-25', '1996-10-08', 3, 150.1500, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10317, 'P001', 'LONEP', 6, '1996-09-30', '1996-10-28', '1996-10-10', 1, 12.6900, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10318, 'P001', 'ISLAT', 8, '1996-10-01', '1996-10-29', '1996-10-04', 2, 4.7300, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10319, 'P001', 'TORTU', 7, '1996-10-02', '1996-10-30', '1996-10-11', 3, 64.5000, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10320, 'P001', 'WARTH', 5, '1996-10-03', '1996-10-17', '1996-10-18', 3, 34.5700, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10321, 'P001', 'ISLAT', 3, '1996-10-03', '1996-10-31', '1996-10-11', 2, 3.4300, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10322, 'P001', 'PERIC', 7, '1996-10-04', '1996-11-01', '1996-10-23', 3, 0.4000, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10323, 'P001', 'KOENE', 4, '1996-10-07', '1996-11-04', '1996-10-14', 1, 4.8800, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10324, 'P001', 'SAVEA', 9, '1996-10-08', '1996-11-05', '1996-10-10', 1, 214.2700, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10325, 'P001', 'KOENE', 1, '1996-10-09', '1996-10-23', '1996-10-14', 3, 64.8600, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10326, 'P001', 'BOLID', 4, '1996-10-10', '1996-11-07', '1996-10-14', 2, 77.9200, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10327, 'P001', 'FOLKO', 2, '1996-10-11', '1996-11-08', '1996-10-14', 1, 63.3600, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10328, 'P001', 'FURIB', 4, '1996-10-14', '1996-11-11', '1996-10-17', 3, 87.0300, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10329, 'P001', 'SPLIR', 4, '1996-10-15', '1996-11-26', '1996-10-23', 2, 191.6700, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10330, 'P001', 'LILAS', 3, '1996-10-16', '1996-11-13', '1996-10-28', 1, 12.7500, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10331, 'P001', 'BONAP', 9, '1996-10-16', '1996-11-27', '1996-10-21', 1, 10.1900, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10332, 'P001', 'MEREP', 3, '1996-10-17', '1996-11-28', '1996-10-21', 2, 52.8400, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10333, 'P001', 'WARTH', 5, '1996-10-18', '1996-11-15', '1996-10-25', 3, 0.5900, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10334, 'P001', 'VICTE', 8, '1996-10-21', '1996-11-18', '1996-10-28', 2, 8.5600, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10335, 'P001', 'HUNGO', 7, '1996-10-22', '1996-11-19', '1996-10-24', 2, 42.1100, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10336, 'P001', 'PRINI', 7, '1996-10-23', '1996-11-20', '1996-10-25', 2, 15.5100, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10337, 'P001', 'FRANK', 4, '1996-10-24', '1996-11-21', '1996-10-29', 3, 108.2600, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10338, 'P001', 'OLDWO', 4, '1996-10-25', '1996-11-22', '1996-10-29', 3, 84.2100, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10339, 'P001', 'MEREP', 2, '1996-10-28', '1996-11-25', '1996-11-04', 2, 15.6600, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10340, 'P001', 'BONAP', 1, '1996-10-29', '1996-11-26', '1996-11-08', 3, 166.3100, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10341, 'P001', 'SIMOB', 7, '1996-10-29', '1996-11-26', '1996-11-05', 3, 26.7800, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10342, 'P001', 'FRANK', 4, '1996-10-30', '1996-11-13', '1996-11-04', 2, 54.8300, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10343, 'P001', 'LEHMS', 4, '1996-10-31', '1996-11-28', '1996-11-06', 1, 110.3700, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10344, 'P001', 'WHITC', 4, '1996-11-01', '1996-11-29', '1996-11-05', 2, 23.2900, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10345, 'P001', 'QUICK', 2, '1996-11-04', '1996-12-02', '1996-11-11', 2, 249.0600, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10346, 'P001', 'RATTC', 3, '1996-11-05', '1996-12-17', '1996-11-08', 3, 142.0800, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10347, 'P001', 'FAMIA', 4, '1996-11-06', '1996-12-04', '1996-11-08', 3, 3.1000, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10348, 'P001', 'WANDK', 4, '1996-11-07', '1996-12-05', '1996-11-15', 2, 0.7800, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10349, 'P001', 'SPLIR', 7, '1996-11-08', '1996-12-06', '1996-11-15', 1, 8.6300, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10350, 'P001', 'LAMAI', 6, '1996-11-11', '1996-12-09', '1996-12-03', 2, 64.1900, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10351, 'P001', 'ERNSH', 1, '1996-11-11', '1996-12-09', '1996-11-20', 1, 162.3300, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10352, 'P001', 'FURIB', 3, '1996-11-12', '1996-11-26', '1996-11-18', 3, 1.3000, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10353, 'P001', 'PICCO', 7, '1996-11-13', '1996-12-11', '1996-11-25', 3, 360.6300, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10354, 'P001', 'PERIC', 8, '1996-11-14', '1996-12-12', '1996-11-20', 3, 53.8000, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10355, 'P001', 'AROUT', 6, '1996-11-15', '1996-12-13', '1996-11-20', 1, 41.9500, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10356, 'P001', 'WANDK', 6, '1996-11-18', '1996-12-16', '1996-11-27', 2, 36.7100, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10357, 'P001', 'LILAS', 1, '1996-11-19', '1996-12-17', '1996-12-02', 3, 34.8800, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10358, 'P001', 'LAMAI', 5, '1996-11-20', '1996-12-18', '1996-11-27', 1, 19.6400, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10359, 'P001', 'SEVES', 5, '1996-11-21', '1996-12-19', '1996-11-26', 3, 288.4300, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10360, 'P001', 'BLONP', 4, '1996-11-22', '1996-12-20', '1996-12-02', 3, 131.7000, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10361, 'P001', 'QUICK', 1, '1996-11-22', '1996-12-20', '1996-12-03', 2, 183.1700, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10362, 'P001', 'BONAP', 3, '1996-11-25', '1996-12-23', '1996-11-28', 1, 96.0400, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10363, 'P001', 'DRACD', 4, '1996-11-26', '1996-12-24', '1996-12-04', 3, 30.5400, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10364, 'P001', 'EASTC', 1, '1996-11-26', '1997-01-07', '1996-12-04', 1, 71.9700, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10365, 'P001', 'ANTON', 3, '1996-11-27', '1996-12-25', '1996-12-02', 2, 22.0000, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10366, 'P001', 'GALED', 8, '1996-11-28', '1997-01-09', '1996-12-30', 2, 10.1400, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10367, 'P001', 'VAFFE', 7, '1996-11-28', '1996-12-26', '1996-12-02', 3, 13.5500, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10368, 'P001', 'ERNSH', 2, '1996-11-29', '1996-12-27', '1996-12-02', 2, 101.9500, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10369, 'P001', 'SPLIR', 8, '1996-12-02', '1996-12-30', '1996-12-09', 2, 195.6800, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10370, 'P001', 'CHOPS', 6, '1996-12-03', '1996-12-31', '1996-12-27', 2, 1.1700, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10371, 'P001', 'LAMAI', 1, '1996-12-03', '1996-12-31', '1996-12-24', 1, 0.4500, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10372, 'P001', 'QUEEN', 5, '1996-12-04', '1997-01-01', '1996-12-09', 2, 890.7800, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10373, 'P001', 'HUNGO', 4, '1996-12-05', '1997-01-02', '1996-12-11', 3, 124.1200, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10374, 'P001', 'WOLZA', 1, '1996-12-05', '1997-01-02', '1996-12-09', 3, 3.9400, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10375, 'P001', 'HUNGC', 3, '1996-12-06', '1997-01-03', '1996-12-09', 2, 20.1200, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10376, 'P001', 'MEREP', 1, '1996-12-09', '1997-01-06', '1996-12-13', 2, 20.3900, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10377, 'P001', 'SEVES', 1, '1996-12-09', '1997-01-06', '1996-12-13', 3, 22.2100, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10378, 'P001', 'FOLKO', 5, '1996-12-10', '1997-01-07', '1996-12-19', 3, 5.4400, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10379, 'P001', 'QUEDE', 2, '1996-12-11', '1997-01-08', '1996-12-13', 1, 45.0300, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10380, 'P001', 'HUNGO', 8, '1996-12-12', '1997-01-09', '1997-01-16', 3, 35.0300, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10381, 'P001', 'LILAS', 3, '1996-12-12', '1997-01-09', '1996-12-13', 3, 7.9900, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10382, 'P001', 'ERNSH', 4, '1996-12-13', '1997-01-10', '1996-12-16', 1, 94.7700, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10383, 'P001', 'AROUT', 8, '1996-12-16', '1997-01-13', '1996-12-18', 3, 34.2400, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10384, 'P001', 'BERGS', 3, '1996-12-16', '1997-01-13', '1996-12-20', 3, 168.6400, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10385, 'P001', 'SPLIR', 1, '1996-12-17', '1997-01-14', '1996-12-23', 2, 30.9600, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10386, 'P001', 'FAMIA', 9, '1996-12-18', '1997-01-01', '1996-12-25', 3, 13.9900, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10387, 'P001', 'SANTG', 1, '1996-12-18', '1997-01-15', '1996-12-20', 2, 93.6300, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10388, 'P001', 'SEVES', 2, '1996-12-19', '1997-01-16', '1996-12-20', 1, 34.8600, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10389, 'P001', 'BOTTM', 4, '1996-12-20', '1997-01-17', '1996-12-24', 2, 47.4200, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10390, 'P001', 'ERNSH', 6, '1996-12-23', '1997-01-20', '1996-12-26', 1, 126.3800, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10391, 'P001', 'DRACD', 3, '1996-12-23', '1997-01-20', '1996-12-31', 3, 5.4500, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10392, 'P001', 'PICCO', 2, '1996-12-24', '1997-01-21', '1997-01-01', 3, 122.4600, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10393, 'P001', 'SAVEA', 1, '1996-12-25', '1997-01-22', '1997-01-03', 3, 126.5600, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10394, 'P001', 'HUNGC', 1, '1996-12-25', '1997-01-22', '1997-01-03', 3, 30.3400, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10395, 'P001', 'HILAA', 6, '1996-12-26', '1997-01-23', '1997-01-03', 1, 184.4100, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10396, 'P001', 'FRANK', 1, '1996-12-27', '1997-01-10', '1997-01-06', 3, 135.3500, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10397, 'P001', 'PRINI', 5, '1996-12-27', '1997-01-24', '1997-01-02', 1, 60.2600, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10398, 'P001', 'SAVEA', 2, '1996-12-30', '1997-01-27', '1997-01-09', 3, 89.1600, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10399, 'P001', 'VAFFE', 8, '1996-12-31', '1997-01-14', '1997-01-08', 3, 27.3600, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10400, 'P001', 'EASTC', 1, '1997-01-01', '1997-01-29', '1997-01-16', 3, 83.9300, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10401, 'P001', 'RATTC', 1, '1997-01-01', '1997-01-29', '1997-01-10', 1, 12.5100, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10402, 'P001', 'ERNSH', 8, '1997-01-02', '1997-02-13', '1997-01-10', 2, 67.8800, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10403, 'P001', 'ERNSH', 4, '1997-01-03', '1997-01-31', '1997-01-09', 3, 73.7900, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10404, 'P001', 'MAGAA', 2, '1997-01-03', '1997-01-31', '1997-01-08', 1, 155.9700, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10405, 'P001', 'LINOD', 1, '1997-01-06', '1997-02-03', '1997-01-22', 1, 34.8200, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10406, 'P001', 'QUEEN', 7, '1997-01-07', '1997-02-18', '1997-01-13', 1, 108.0400, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10407, 'P001', 'OTTIK', 2, '1997-01-07', '1997-02-04', '1997-01-30', 2, 91.4800, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10408, 'P001', 'FOLIG', 8, '1997-01-08', '1997-02-05', '1997-01-14', 1, 11.2600, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10409, 'P001', 'OCEAN', 3, '1997-01-09', '1997-02-06', '1997-01-14', 1, 29.8300, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10410, 'P001', 'BOTTM', 3, '1997-01-10', '1997-02-07', '1997-01-15', 3, 2.4000, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10411, 'P001', 'BOTTM', 9, '1997-01-10', '1997-02-07', '1997-01-21', 3, 23.6500, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10412, 'P001', 'WARTH', 8, '1997-01-13', '1997-02-10', '1997-01-15', 2, 3.7700, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10413, 'P001', 'LAMAI', 3, '1997-01-14', '1997-02-11', '1997-01-16', 2, 95.6600, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10414, 'P001', 'FAMIA', 2, '1997-01-14', '1997-02-11', '1997-01-17', 3, 21.4800, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10415, 'P001', 'HUNGC', 3, '1997-01-15', '1997-02-12', '1997-01-24', 1, 0.2000, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10416, 'P001', 'WARTH', 8, '1997-01-16', '1997-02-13', '1997-01-27', 3, 22.7200, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10417, 'P001', 'SIMOB', 4, '1997-01-16', '1997-02-13', '1997-01-28', 3, 70.2900, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10418, 'P001', 'QUICK', 4, '1997-01-17', '1997-02-14', '1997-01-24', 1, 17.5500, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10419, 'P001', 'RICSU', 4, '1997-01-20', '1997-02-17', '1997-01-30', 2, 137.3500, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10420, 'P001', 'WELLI', 3, '1997-01-21', '1997-02-18', '1997-01-27', 1, 44.1200, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10421, 'P001', 'QUEDE', 8, '1997-01-21', '1997-03-04', '1997-01-27', 1, 99.2300, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10422, 'P001', 'FRANS', 2, '1997-01-22', '1997-02-19', '1997-01-31', 1, 3.0200, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10423, 'P001', 'GOURL', 6, '1997-01-23', '1997-02-06', '1997-02-24', 3, 24.5000, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10424, 'P001', 'MEREP', 7, '1997-01-23', '1997-02-20', '1997-01-27', 2, 370.6100, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10425, 'P001', 'LAMAI', 6, '1997-01-24', '1997-02-21', '1997-02-14', 2, 7.9300, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10426, 'P001', 'GALED', 4, '1997-01-27', '1997-02-24', '1997-02-06', 1, 18.6900, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10427, 'P001', 'PICCO', 4, '1997-01-27', '1997-02-24', '1997-03-03', 2, 31.2900, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10428, 'P001', 'REGGC', 7, '1997-01-28', '1997-02-25', '1997-02-04', 1, 11.0900, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10429, 'P001', 'HUNGO', 3, '1997-01-29', '1997-03-12', '1997-02-07', 2, 56.6300, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10430, 'P001', 'ERNSH', 4, '1997-01-30', '1997-02-13', '1997-02-03', 1, 458.7800, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10431, 'P001', 'BOTTM', 4, '1997-01-30', '1997-02-13', '1997-02-07', 2, 44.1700, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10432, 'P001', 'SPLIR', 3, '1997-01-31', '1997-02-14', '1997-02-07', 2, 4.3400, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10433, 'P001', 'PRINI', 3, '1997-02-03', '1997-03-03', '1997-03-04', 3, 73.8300, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10434, 'P001', 'FOLKO', 3, '1997-02-03', '1997-03-03', '1997-02-13', 2, 17.9200, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10435, 'P001', 'CONSH', 8, '1997-02-04', '1997-03-18', '1997-02-07', 2, 9.2100, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10436, 'P001', 'BLONP', 3, '1997-02-05', '1997-03-05', '1997-02-11', 2, 156.6600, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10437, 'P001', 'WARTH', 8, '1997-02-05', '1997-03-05', '1997-02-12', 1, 19.9700, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10438, 'P001', 'TOMSP', 3, '1997-02-06', '1997-03-06', '1997-02-14', 2, 8.2400, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10439, 'P001', 'MEREP', 6, '1997-02-07', '1997-03-07', '1997-02-10', 3, 4.0700, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10440, 'P001', 'SAVEA', 4, '1997-02-10', '1997-03-10', '1997-02-28', 2, 86.5300, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10441, 'P001', 'OLDWO', 3, '1997-02-10', '1997-03-24', '1997-03-14', 2, 73.0200, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10442, 'P001', 'ERNSH', 3, '1997-02-11', '1997-03-11', '1997-02-18', 2, 47.9400, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10443, 'P001', 'REGGC', 8, '1997-02-12', '1997-03-12', '1997-02-14', 1, 13.9500, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10444, 'P001', 'BERGS', 3, '1997-02-12', '1997-03-12', '1997-02-21', 3, 3.5000, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10445, 'P001', 'BERGS', 3, '1997-02-13', '1997-03-13', '1997-02-20', 1, 9.3000, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10446, 'P001', 'TOMSP', 6, '1997-02-14', '1997-03-14', '1997-02-19', 1, 14.6800, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10447, 'P001', 'RICAR', 4, '1997-02-14', '1997-03-14', '1997-03-07', 2, 68.6600, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10448, 'P001', 'RANCH', 4, '1997-02-17', '1997-03-17', '1997-02-24', 2, 38.8200, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10449, 'P001', 'BLONP', 3, '1997-02-18', '1997-03-18', '1997-02-27', 2, 53.3000, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10450, 'P001', 'VICTE', 8, '1997-02-19', '1997-03-19', '1997-03-11', 2, 7.2300, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10451, 'P001', 'QUICK', 4, '1997-02-19', '1997-03-05', '1997-03-12', 3, 189.0900, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10452, 'P001', 'SAVEA', 8, '1997-02-20', '1997-03-20', '1997-02-26', 1, 140.2600, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10453, 'P001', 'AROUT', 1, '1997-02-21', '1997-03-21', '1997-02-26', 2, 25.3600, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10454, 'P001', 'LAMAI', 4, '1997-02-21', '1997-03-21', '1997-02-25', 3, 2.7400, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10455, 'P001', 'WARTH', 8, '1997-02-24', '1997-04-07', '1997-03-03', 2, 180.4500, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10456, 'P001', 'KOENE', 8, '1997-02-25', '1997-04-08', '1997-02-28', 2, 8.1200, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10457, 'P001', 'KOENE', 2, '1997-02-25', '1997-03-25', '1997-03-03', 1, 11.5700, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10458, 'P001', 'SUPRD', 7, '1997-02-26', '1997-03-26', '1997-03-04', 3, 147.0600, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10459, 'P001', 'VICTE', 4, '1997-02-27', '1997-03-27', '1997-02-28', 2, 25.0900, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10460, 'P001', 'FOLKO', 8, '1997-02-28', '1997-03-28', '1997-03-03', 1, 16.2700, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10461, 'P001', 'LILAS', 1, '1997-02-28', '1997-03-28', '1997-03-05', 3, 148.6100, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10462, 'P001', 'CONSH', 2, '1997-03-03', '1997-03-31', '1997-03-18', 1, 6.1700, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10463, 'P001', 'SUPRD', 5, '1997-03-04', '1997-04-01', '1997-03-06', 3, 14.7800, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10464, 'P001', 'FURIB', 4, '1997-03-04', '1997-04-01', '1997-03-14', 2, 89.0000, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10465, 'P001', 'VAFFE', 1, '1997-03-05', '1997-04-02', '1997-03-14', 3, 145.0400, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10466, 'P001', 'COMMI', 4, '1997-03-06', '1997-04-03', '1997-03-13', 1, 11.9300, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10467, 'P001', 'MAGAA', 8, '1997-03-06', '1997-04-03', '1997-03-11', 2, 4.9300, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10468, 'P001', 'KOENE', 3, '1997-03-07', '1997-04-04', '1997-03-12', 3, 44.1200, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10469, 'P001', 'WHITC', 1, '1997-03-10', '1997-04-07', '1997-03-14', 1, 60.1800, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10470, 'P001', 'BONAP', 4, '1997-03-11', '1997-04-08', '1997-03-14', 2, 64.5600, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10471, 'P001', 'BSBEV', 2, '1997-03-11', '1997-04-08', '1997-03-18', 3, 45.5900, 'B\'s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10472, 'P001', 'SEVES', 8, '1997-03-12', '1997-04-09', '1997-03-19', 1, 4.2000, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10473, 'P001', 'ISLAT', 1, '1997-03-13', '1997-03-27', '1997-03-21', 3, 16.3700, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10474, 'P001', 'PERIC', 5, '1997-03-13', '1997-04-10', '1997-03-21', 2, 83.4900, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10475, 'P001', 'SUPRD', 9, '1997-03-14', '1997-04-11', '1997-04-04', 1, 68.5200, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10476, 'P001', 'HILAA', 8, '1997-03-17', '1997-04-14', '1997-03-24', 3, 4.4100, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10477, 'P001', 'PRINI', 5, '1997-03-17', '1997-04-14', '1997-03-25', 2, 13.0200, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10478, 'P001', 'VICTE', 2, '1997-03-18', '1997-04-01', '1997-03-26', 3, 4.8100, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10479, 'P001', 'RATTC', 3, '1997-03-19', '1997-04-16', '1997-03-21', 3, 708.9500, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10480, 'P001', 'FOLIG', 6, '1997-03-20', '1997-04-17', '1997-03-24', 2, 1.3500, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10481, 'P001', 'RICAR', 8, '1997-03-20', '1997-04-17', '1997-03-25', 2, 64.3300, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10482, 'P001', 'LAZYK', 1, '1997-03-21', '1997-04-18', '1997-04-10', 3, 7.4800, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10483, 'P001', 'WHITC', 7, '1997-03-24', '1997-04-21', '1997-04-25', 2, 15.2800, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10484, 'P001', 'BSBEV', 3, '1997-03-24', '1997-04-21', '1997-04-01', 3, 6.8800, 'B\'s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10485, 'P001', 'LINOD', 4, '1997-03-25', '1997-04-08', '1997-03-31', 2, 64.4500, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10486, 'P001', 'HILAA', 1, '1997-03-26', '1997-04-23', '1997-04-02', 2, 30.5300, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10487, 'P001', 'QUEEN', 2, '1997-03-26', '1997-04-23', '1997-03-28', 2, 71.0700, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10488, 'P001', 'FRANK', 8, '1997-03-27', '1997-04-24', '1997-04-02', 2, 4.9300, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10489, 'P001', 'PICCO', 6, '1997-03-28', '1997-04-25', '1997-04-09', 2, 5.2900, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10490, 'P001', 'HILAA', 7, '1997-03-31', '1997-04-28', '1997-04-03', 2, 210.1900, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10491, 'P001', 'FURIB', 8, '1997-03-31', '1997-04-28', '1997-04-08', 3, 16.9600, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10492, 'P001', 'BOTTM', 3, '1997-04-01', '1997-04-29', '1997-04-11', 1, 62.8900, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10493, 'P001', 'LAMAI', 4, '1997-04-02', '1997-04-30', '1997-04-10', 3, 10.6400, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10494, 'P001', 'COMMI', 4, '1997-04-02', '1997-04-30', '1997-04-09', 2, 65.9900, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10495, 'P001', 'LAUGB', 3, '1997-04-03', '1997-05-01', '1997-04-11', 3, 4.6500, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10496, 'P001', 'TRADH', 7, '1997-04-04', '1997-05-02', '1997-04-07', 2, 46.7700, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10497, 'P001', 'LEHMS', 7, '1997-04-04', '1997-05-02', '1997-04-07', 1, 36.2100, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10498, 'P001', 'HILAA', 8, '1997-04-07', '1997-05-05', '1997-04-11', 2, 29.7500, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10499, 'P001', 'LILAS', 4, '1997-04-08', '1997-05-06', '1997-04-16', 2, 102.0200, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10500, 'P001', 'LAMAI', 6, '1997-04-09', '1997-05-07', '1997-04-17', 1, 42.6800, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10501, 'P001', 'BLAUS', 9, '1997-04-09', '1997-05-07', '1997-04-16', 3, 8.8500, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10502, 'P001', 'PERIC', 2, '1997-04-10', '1997-05-08', '1997-04-29', 1, 69.3200, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10503, 'P001', 'HUNGO', 6, '1997-04-11', '1997-05-09', '1997-04-16', 2, 16.7400, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10504, 'P001', 'WHITC', 4, '1997-04-11', '1997-05-09', '1997-04-18', 3, 59.1300, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10505, 'P001', 'MEREP', 3, '1997-04-14', '1997-05-12', '1997-04-21', 3, 7.1300, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10506, 'P001', 'KOENE', 9, '1997-04-15', '1997-05-13', '1997-05-02', 2, 21.1900, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10507, 'P001', 'ANTON', 7, '1997-04-15', '1997-05-13', '1997-04-22', 1, 47.4500, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10508, 'P001', 'OTTIK', 1, '1997-04-16', '1997-05-14', '1997-05-13', 2, 4.9900, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10509, 'P001', 'BLAUS', 4, '1997-04-17', '1997-05-15', '1997-04-29', 1, 0.1500, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10510, 'P001', 'SAVEA', 6, '1997-04-18', '1997-05-16', '1997-04-28', 3, 367.6300, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10511, 'P001', 'BONAP', 4, '1997-04-18', '1997-05-16', '1997-04-21', 3, 350.6400, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10512, 'P001', 'FAMIA', 7, '1997-04-21', '1997-05-19', '1997-04-24', 2, 3.5300, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10513, 'P001', 'WANDK', 7, '1997-04-22', '1997-06-03', '1997-04-28', 1, 105.6500, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10514, 'P001', 'ERNSH', 3, '1997-04-22', '1997-05-20', '1997-05-16', 2, 789.9500, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10515, 'P001', 'QUICK', 2, '1997-04-23', '1997-05-07', '1997-05-23', 1, 204.4700, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10516, 'P001', 'HUNGO', 2, '1997-04-24', '1997-05-22', '1997-05-01', 3, 62.7800, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10517, 'P001', 'NORTS', 3, '1997-04-24', '1997-05-22', '1997-04-29', 3, 32.0700, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10518, 'P001', 'TORTU', 4, '1997-04-25', '1997-05-09', '1997-05-05', 2, 218.1500, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10519, 'P001', 'CHOPS', 6, '1997-04-28', '1997-05-26', '1997-05-01', 3, 91.7600, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10520, 'P001', 'SANTG', 7, '1997-04-29', '1997-05-27', '1997-05-01', 1, 13.3700, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10521, 'P001', 'CACTU', 8, '1997-04-29', '1997-05-27', '1997-05-02', 2, 17.2200, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10522, 'P001', 'LEHMS', 4, '1997-04-30', '1997-05-28', '1997-05-06', 1, 45.3300, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10523, 'P001', 'SEVES', 7, '1997-05-01', '1997-05-29', '1997-05-30', 2, 77.6300, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10524, 'P001', 'BERGS', 1, '1997-05-01', '1997-05-29', '1997-05-07', 2, 244.7900, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10525, 'P001', 'BONAP', 1, '1997-05-02', '1997-05-30', '1997-05-23', 2, 11.0600, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10526, 'P001', 'WARTH', 4, '1997-05-05', '1997-06-02', '1997-05-15', 2, 58.5900, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10527, 'P001', 'QUICK', 7, '1997-05-05', '1997-06-02', '1997-05-07', 1, 41.9000, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10528, 'P001', 'GREAL', 6, '1997-05-06', '1997-05-20', '1997-05-09', 2, 3.3500, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10529, 'P001', 'MAISD', 5, '1997-05-07', '1997-06-04', '1997-05-09', 2, 66.6900, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10530, 'P001', 'PICCO', 3, '1997-05-08', '1997-06-05', '1997-05-12', 2, 339.2200, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10531, 'P001', 'OCEAN', 7, '1997-05-08', '1997-06-05', '1997-05-19', 1, 8.1200, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10532, 'P001', 'EASTC', 7, '1997-05-09', '1997-06-06', '1997-05-12', 3, 74.4600, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10533, 'P001', 'FOLKO', 8, '1997-05-12', '1997-06-09', '1997-05-22', 1, 188.0400, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10534, 'P001', 'LEHMS', 8, '1997-05-12', '1997-06-09', '1997-05-14', 2, 27.9400, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10535, 'P001', 'ANTON', 4, '1997-05-13', '1997-06-10', '1997-05-21', 1, 15.6400, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10536, 'P001', 'LEHMS', 3, '1997-05-14', '1997-06-11', '1997-06-06', 2, 58.8800, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10537, 'P001', 'RICSU', 1, '1997-05-14', '1997-05-28', '1997-05-19', 1, 78.8500, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10538, 'P001', 'BSBEV', 9, '1997-05-15', '1997-06-12', '1997-05-16', 3, 4.8700, 'B\'s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10539, 'P001', 'BSBEV', 6, '1997-05-16', '1997-06-13', '1997-05-23', 3, 12.3600, 'B\'s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10540, 'P001', 'QUICK', 3, '1997-05-19', '1997-06-16', '1997-06-13', 3, 1007.6400, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10541, 'P001', 'HANAR', 2, '1997-05-19', '1997-06-16', '1997-05-29', 1, 68.6500, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10542, 'P001', 'KOENE', 1, '1997-05-20', '1997-06-17', '1997-05-26', 3, 10.9500, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10543, 'P001', 'LILAS', 8, '1997-05-21', '1997-06-18', '1997-05-23', 2, 48.1700, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10544, 'P001', 'LONEP', 4, '1997-05-21', '1997-06-18', '1997-05-30', 1, 24.9100, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10545, 'P001', 'LAZYK', 8, '1997-05-22', '1997-06-19', '1997-06-26', 2, 11.9200, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10546, 'P001', 'VICTE', 1, '1997-05-23', '1997-06-20', '1997-05-27', 3, 194.7200, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10547, 'P001', 'SEVES', 3, '1997-05-23', '1997-06-20', '1997-06-02', 2, 178.4300, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10548, 'P001', 'TOMSP', 3, '1997-05-26', '1997-06-23', '1997-06-02', 2, 1.4300, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10549, 'P001', 'QUICK', 5, '1997-05-27', '1997-06-10', '1997-05-30', 1, 171.2400, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10550, 'P001', 'GODOS', 7, '1997-05-28', '1997-06-25', '1997-06-06', 3, 4.3200, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10551, 'P001', 'FURIB', 4, '1997-05-28', '1997-07-09', '1997-06-06', 3, 72.9500, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10552, 'P001', 'HILAA', 2, '1997-05-29', '1997-06-26', '1997-06-05', 1, 83.2200, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10553, 'P001', 'WARTH', 2, '1997-05-30', '1997-06-27', '1997-06-03', 2, 149.4900, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10554, 'P001', 'OTTIK', 4, '1997-05-30', '1997-06-27', '1997-06-05', 3, 120.9700, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10555, 'P001', 'SAVEA', 6, '1997-06-02', '1997-06-30', '1997-06-04', 3, 252.4900, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10556, 'P001', 'SIMOB', 2, '1997-06-03', '1997-07-15', '1997-06-13', 1, 9.8000, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10557, 'P001', 'LEHMS', 9, '1997-06-03', '1997-06-17', '1997-06-06', 2, 96.7200, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10558, 'P001', 'AROUT', 1, '1997-06-04', '1997-07-02', '1997-06-10', 2, 72.9700, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10559, 'P001', 'BLONP', 6, '1997-06-05', '1997-07-03', '1997-06-13', 1, 8.0500, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10560, 'P001', 'FRANK', 8, '1997-06-06', '1997-07-04', '1997-06-09', 1, 36.6500, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10561, 'P001', 'FOLKO', 2, '1997-06-06', '1997-07-04', '1997-06-09', 2, 242.2100, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10562, 'P001', 'REGGC', 1, '1997-06-09', '1997-07-07', '1997-06-12', 1, 22.9500, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10563, 'P001', 'RICAR', 2, '1997-06-10', '1997-07-22', '1997-06-24', 2, 60.4300, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10564, 'P001', 'RATTC', 4, '1997-06-10', '1997-07-08', '1997-06-16', 3, 13.7500, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10565, 'P001', 'MEREP', 8, '1997-06-11', '1997-07-09', '1997-06-18', 2, 7.1500, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10566, 'P001', 'BLONP', 9, '1997-06-12', '1997-07-10', '1997-06-18', 1, 88.4000, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10567, 'P001', 'HUNGO', 1, '1997-06-12', '1997-07-10', '1997-06-17', 1, 33.9700, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10568, 'P001', 'GALED', 3, '1997-06-13', '1997-07-11', '1997-07-09', 3, 6.5400, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10569, 'P001', 'RATTC', 5, '1997-06-16', '1997-07-14', '1997-07-11', 1, 58.9800, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10570, 'P001', 'MEREP', 3, '1997-06-17', '1997-07-15', '1997-06-19', 3, 188.9900, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10571, 'P001', 'ERNSH', 8, '1997-06-17', '1997-07-29', '1997-07-04', 3, 26.0600, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10572, 'P001', 'BERGS', 3, '1997-06-18', '1997-07-16', '1997-06-25', 2, 116.4300, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10573, 'P001', 'ANTON', 7, '1997-06-19', '1997-07-17', '1997-06-20', 3, 84.8400, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10574, 'P001', 'TRAIH', 4, '1997-06-19', '1997-07-17', '1997-06-30', 2, 37.6000, 'Trail\'s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10575, 'P001', 'MORGK', 5, '1997-06-20', '1997-07-04', '1997-06-30', 1, 127.3400, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10576, 'P001', 'TORTU', 3, '1997-06-23', '1997-07-07', '1997-06-30', 3, 18.5600, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10577, 'P001', 'TRAIH', 9, '1997-06-23', '1997-08-04', '1997-06-30', 2, 25.4100, 'Trail\'s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10578, 'P001', 'BSBEV', 4, '1997-06-24', '1997-07-22', '1997-07-25', 3, 29.6000, 'B\'s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10579, 'P001', 'LETSS', 1, '1997-06-25', '1997-07-23', '1997-07-04', 2, 13.7300, 'Let\'s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10580, 'P001', 'OTTIK', 4, '1997-06-26', '1997-07-24', '1997-07-01', 3, 75.8900, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10581, 'P001', 'FAMIA', 3, '1997-06-26', '1997-07-24', '1997-07-02', 1, 3.0100, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10582, 'P001', 'BLAUS', 3, '1997-06-27', '1997-07-25', '1997-07-14', 2, 27.7100, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10583, 'P001', 'WARTH', 2, '1997-06-30', '1997-07-28', '1997-07-04', 2, 7.2800, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10584, 'P001', 'BLONP', 4, '1997-06-30', '1997-07-28', '1997-07-04', 1, 59.1400, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10585, 'P001', 'WELLI', 7, '1997-07-01', '1997-07-29', '1997-07-10', 1, 13.4100, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10586, 'P001', 'REGGC', 9, '1997-07-02', '1997-07-30', '1997-07-09', 1, 0.4800, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10587, 'P001', 'QUEDE', 1, '1997-07-02', '1997-07-30', '1997-07-09', 1, 62.5200, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10588, 'P001', 'QUICK', 2, '1997-07-03', '1997-07-31', '1997-07-10', 3, 194.6700, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10589, 'P001', 'GREAL', 8, '1997-07-04', '1997-08-01', '1997-07-14', 2, 4.4200, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10590, 'P001', 'MEREP', 4, '1997-07-07', '1997-08-04', '1997-07-14', 3, 44.7700, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10591, 'P001', 'VAFFE', 1, '1997-07-07', '1997-07-21', '1997-07-16', 1, 55.9200, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10592, 'P001', 'LEHMS', 3, '1997-07-08', '1997-08-05', '1997-07-16', 1, 32.1000, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10593, 'P001', 'LEHMS', 7, '1997-07-09', '1997-08-06', '1997-08-13', 2, 174.2000, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10594, 'P001', 'OLDWO', 3, '1997-07-09', '1997-08-06', '1997-07-16', 2, 5.2400, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10595, 'P001', 'ERNSH', 2, '1997-07-10', '1997-08-07', '1997-07-14', 1, 96.7800, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10596, 'P001', 'WHITC', 8, '1997-07-11', '1997-08-08', '1997-08-12', 1, 16.3400, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10597, 'P001', 'PICCO', 7, '1997-07-11', '1997-08-08', '1997-07-18', 3, 35.1200, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10598, 'P001', 'RATTC', 1, '1997-07-14', '1997-08-11', '1997-07-18', 3, 44.4200, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10599, 'P001', 'BSBEV', 6, '1997-07-15', '1997-08-26', '1997-07-21', 3, 29.9800, 'B\'s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10600, 'P001', 'HUNGC', 4, '1997-07-16', '1997-08-13', '1997-07-21', 1, 45.1300, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10601, 'P001', 'HILAA', 7, '1997-07-16', '1997-08-27', '1997-07-22', 1, 58.3000, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10602, 'P001', 'VAFFE', 8, '1997-07-17', '1997-08-14', '1997-07-22', 2, 2.9200, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10603, 'P001', 'SAVEA', 8, '1997-07-18', '1997-08-15', '1997-08-08', 2, 48.7700, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10604, 'P001', 'FURIB', 1, '1997-07-18', '1997-08-15', '1997-07-29', 1, 7.4600, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10605, 'P001', 'MEREP', 1, '1997-07-21', '1997-08-18', '1997-07-29', 2, 379.1300, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10606, 'P001', 'TRADH', 4, '1997-07-22', '1997-08-19', '1997-07-31', 3, 79.4000, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10607, 'P001', 'SAVEA', 5, '1997-07-22', '1997-08-19', '1997-07-25', 1, 200.2400, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10608, 'P001', 'TOMSP', 4, '1997-07-23', '1997-08-20', '1997-08-01', 2, 27.7900, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10609, 'P001', 'DUMON', 7, '1997-07-24', '1997-08-21', '1997-07-30', 2, 1.8500, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10610, 'P001', 'LAMAI', 8, '1997-07-25', '1997-08-22', '1997-08-06', 1, 26.7800, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10611, 'P001', 'WOLZA', 6, '1997-07-25', '1997-08-22', '1997-08-01', 2, 80.6500, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10612, 'P001', 'SAVEA', 1, '1997-07-28', '1997-08-25', '1997-08-01', 2, 544.0800, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10613, 'P001', 'HILAA', 4, '1997-07-29', '1997-08-26', '1997-08-01', 2, 8.1100, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10614, 'P001', 'BLAUS', 8, '1997-07-29', '1997-08-26', '1997-08-01', 3, 1.9300, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10615, 'P001', 'WILMK', 2, '1997-07-30', '1997-08-27', '1997-08-06', 3, 0.7500, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10616, 'P001', 'GREAL', 1, '1997-07-31', '1997-08-28', '1997-08-05', 2, 116.5300, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10617, 'P001', 'GREAL', 4, '1997-07-31', '1997-08-28', '1997-08-04', 2, 18.5300, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10618, 'P001', 'MEREP', 1, '1997-08-01', '1997-09-12', '1997-08-08', 1, 154.6800, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10619, 'P001', 'MEREP', 3, '1997-08-04', '1997-09-01', '1997-08-07', 3, 91.0500, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10620, 'P001', 'LAUGB', 2, '1997-08-05', '1997-09-02', '1997-08-14', 3, 0.9400, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10621, 'P001', 'ISLAT', 4, '1997-08-05', '1997-09-02', '1997-08-11', 2, 23.7300, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10622, 'P001', 'RICAR', 4, '1997-08-06', '1997-09-03', '1997-08-11', 3, 50.9700, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10623, 'P001', 'FRANK', 8, '1997-08-07', '1997-09-04', '1997-08-12', 2, 97.1800, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10624, 'P001', 'THECR', 4, '1997-08-07', '1997-09-04', '1997-08-19', 2, 94.8000, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10625, 'P001', 'ANATR', 3, '1997-08-08', '1997-09-05', '1997-08-14', 1, 43.9000, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10626, 'P001', 'BERGS', 1, '1997-08-11', '1997-09-08', '1997-08-20', 2, 138.6900, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10627, 'P001', 'SAVEA', 8, '1997-08-11', '1997-09-22', '1997-08-21', 3, 107.4600, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10628, 'P001', 'BLONP', 4, '1997-08-12', '1997-09-09', '1997-08-20', 3, 30.3600, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10629, 'P001', 'GODOS', 4, '1997-08-12', '1997-09-09', '1997-08-20', 3, 85.4600, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10630, 'P001', 'KOENE', 1, '1997-08-13', '1997-09-10', '1997-08-19', 2, 32.3500, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10631, 'P001', 'LAMAI', 8, '1997-08-14', '1997-09-11', '1997-08-15', 1, 0.8700, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10632, 'P001', 'WANDK', 8, '1997-08-14', '1997-09-11', '1997-08-19', 1, 41.3800, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10633, 'P001', 'ERNSH', 7, '1997-08-15', '1997-09-12', '1997-08-18', 3, 477.9000, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10634, 'P001', 'FOLIG', 4, '1997-08-15', '1997-09-12', '1997-08-21', 3, 487.3800, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10635, 'P001', 'MAGAA', 8, '1997-08-18', '1997-09-15', '1997-08-21', 3, 47.4600, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10636, 'P001', 'WARTH', 4, '1997-08-19', '1997-09-16', '1997-08-26', 1, 1.1500, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10637, 'P001', 'QUEEN', 6, '1997-08-19', '1997-09-16', '1997-08-26', 1, 201.2900, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10638, 'P001', 'LINOD', 3, '1997-08-20', '1997-09-17', '1997-09-01', 1, 158.4400, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10639, 'P001', 'SANTG', 7, '1997-08-20', '1997-09-17', '1997-08-27', 3, 38.6400, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10640, 'P001', 'WANDK', 4, '1997-08-21', '1997-09-18', '1997-08-28', 1, 23.5500, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10641, 'P001', 'HILAA', 4, '1997-08-22', '1997-09-19', '1997-08-26', 2, 179.6100, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10642, 'P001', 'SIMOB', 7, '1997-08-22', '1997-09-19', '1997-09-05', 3, 41.8900, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10643, 'P001', 'ALFKI', 6, '1997-08-25', '1997-09-22', '1997-09-02', 1, 29.4600, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10644, 'P001', 'WELLI', 3, '1997-08-25', '1997-09-22', '1997-09-01', 2, 0.1400, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10645, 'P001', 'HANAR', 4, '1997-08-26', '1997-09-23', '1997-09-02', 1, 12.4100, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10646, 'P001', 'HUNGO', 9, '1997-08-27', '1997-10-08', '1997-09-03', 3, 142.3300, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10647, 'P001', 'QUEDE', 4, '1997-08-27', '1997-09-10', '1997-09-03', 2, 45.5400, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10648, 'P001', 'RICAR', 5, '1997-08-28', '1997-10-09', '1997-09-09', 2, 14.2500, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10649, 'P001', 'MAISD', 5, '1997-08-28', '1997-09-25', '1997-08-29', 3, 6.2000, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10650, 'P001', 'FAMIA', 5, '1997-08-29', '1997-09-26', '1997-09-03', 3, 176.8100, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10651, 'P001', 'WANDK', 8, '1997-09-01', '1997-09-29', '1997-09-11', 2, 20.6000, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10652, 'P001', 'GOURL', 4, '1997-09-01', '1997-09-29', '1997-09-08', 2, 7.1400, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10653, 'P001', 'FRANK', 1, '1997-09-02', '1997-09-30', '1997-09-19', 1, 93.2500, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10654, 'P001', 'BERGS', 5, '1997-09-02', '1997-09-30', '1997-09-11', 1, 55.2600, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10655, 'P001', 'REGGC', 1, '1997-09-03', '1997-10-01', '1997-09-11', 2, 4.4100, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10656, 'P001', 'GREAL', 6, '1997-09-04', '1997-10-02', '1997-09-10', 1, 57.1500, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10657, 'P001', 'SAVEA', 2, '1997-09-04', '1997-10-02', '1997-09-15', 2, 352.6900, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10658, 'P001', 'QUICK', 4, '1997-09-05', '1997-10-03', '1997-09-08', 1, 364.1500, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10659, 'P001', 'QUEEN', 7, '1997-09-05', '1997-10-03', '1997-09-10', 2, 105.8100, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10660, 'P001', 'HUNGC', 8, '1997-09-08', '1997-10-06', '1997-10-15', 1, 111.2900, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10661, 'P001', 'HUNGO', 7, '1997-09-09', '1997-10-07', '1997-09-15', 3, 17.5500, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10662, 'P001', 'LONEP', 3, '1997-09-09', '1997-10-07', '1997-09-18', 2, 1.2800, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10663, 'P001', 'BONAP', 2, '1997-09-10', '1997-09-24', '1997-10-03', 2, 113.1500, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10664, 'P001', 'FURIB', 1, '1997-09-10', '1997-10-08', '1997-09-19', 3, 1.2700, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10665, 'P001', 'LONEP', 1, '1997-09-11', '1997-10-09', '1997-09-17', 2, 26.3100, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10666, 'P001', 'RICSU', 7, '1997-09-12', '1997-10-10', '1997-09-22', 2, 232.4200, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10667, 'P001', 'ERNSH', 7, '1997-09-12', '1997-10-10', '1997-09-19', 1, 78.0900, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10668, 'P001', 'WANDK', 1, '1997-09-15', '1997-10-13', '1997-09-23', 2, 47.2200, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10669, 'P001', 'SIMOB', 2, '1997-09-15', '1997-10-13', '1997-09-22', 1, 24.3900, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10670, 'P001', 'FRANK', 4, '1997-09-16', '1997-10-14', '1997-09-18', 1, 203.4800, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10671, 'P001', 'FRANR', 1, '1997-09-17', '1997-10-15', '1997-09-24', 1, 30.3400, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10672, 'P001', 'BERGS', 9, '1997-09-17', '1997-10-01', '1997-09-26', 2, 95.7500, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10673, 'P001', 'WILMK', 2, '1997-09-18', '1997-10-16', '1997-09-19', 1, 22.7600, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10674, 'P001', 'ISLAT', 4, '1997-09-18', '1997-10-16', '1997-09-30', 2, 0.9000, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10675, 'P001', 'FRANK', 5, '1997-09-19', '1997-10-17', '1997-09-23', 2, 31.8500, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10676, 'P001', 'TORTU', 2, '1997-09-22', '1997-10-20', '1997-09-29', 2, 2.0100, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10677, 'P001', 'ANTON', 1, '1997-09-22', '1997-10-20', '1997-09-26', 3, 4.0300, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10678, 'P001', 'SAVEA', 7, '1997-09-23', '1997-10-21', '1997-10-16', 3, 388.9800, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10679, 'P001', 'BLONP', 8, '1997-09-23', '1997-10-21', '1997-09-30', 3, 27.9400, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10680, 'P001', 'OLDWO', 1, '1997-09-24', '1997-10-22', '1997-09-26', 1, 26.6100, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10681, 'P001', 'GREAL', 3, '1997-09-25', '1997-10-23', '1997-09-30', 3, 76.1300, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10682, 'P001', 'ANTON', 3, '1997-09-25', '1997-10-23', '1997-10-01', 2, 36.1300, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10683, 'P001', 'DUMON', 2, '1997-09-26', '1997-10-24', '1997-10-01', 1, 4.4000, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10684, 'P001', 'OTTIK', 3, '1997-09-26', '1997-10-24', '1997-09-30', 1, 145.6300, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10685, 'P001', 'GOURL', 4, '1997-09-29', '1997-10-13', '1997-10-03', 2, 33.7500, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10686, 'P001', 'PICCO', 2, '1997-09-30', '1997-10-28', '1997-10-08', 1, 96.5000, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10687, 'P001', 'HUNGO', 9, '1997-09-30', '1997-10-28', '1997-10-30', 2, 296.4300, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10688, 'P001', 'VAFFE', 4, '1997-10-01', '1997-10-15', '1997-10-07', 2, 299.0900, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10689, 'P001', 'BERGS', 1, '1997-10-01', '1997-10-29', '1997-10-07', 2, 13.4200, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10690, 'P001', 'HANAR', 1, '1997-10-02', '1997-10-30', '1997-10-03', 1, 15.8000, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10691, 'P001', 'QUICK', 2, '1997-10-03', '1997-11-14', '1997-10-22', 2, 810.0500, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10692, 'P001', 'ALFKI', 4, '1997-10-03', '1997-10-31', '1997-10-13', 2, 61.0200, 'Alfred\'s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10693, 'P001', 'WHITC', 3, '1997-10-06', '1997-10-20', '1997-10-10', 3, 139.3400, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10694, 'P001', 'QUICK', 8, '1997-10-06', '1997-11-03', '1997-10-09', 3, 398.3600, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10695, 'P001', 'WILMK', 7, '1997-10-07', '1997-11-18', '1997-10-14', 1, 16.7200, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10696, 'P001', 'WHITC', 8, '1997-10-08', '1997-11-19', '1997-10-14', 3, 102.5500, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10697, 'P001', 'LINOD', 3, '1997-10-08', '1997-11-05', '1997-10-14', 1, 45.5200, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10698, 'P001', 'ERNSH', 4, '1997-10-09', '1997-11-06', '1997-10-17', 1, 272.4700, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10699, 'P001', 'MORGK', 3, '1997-10-09', '1997-11-06', '1997-10-13', 3, 0.5800, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10700, 'P001', 'SAVEA', 3, '1997-10-10', '1997-11-07', '1997-10-16', 1, 65.1000, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10701, 'P001', 'HUNGO', 6, '1997-10-13', '1997-10-27', '1997-10-15', 3, 220.3100, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10702, 'P001', 'ALFKI', 4, '1997-10-13', '1997-11-24', '1997-10-21', 1, 23.9400, 'Alfred\'s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10703, 'P001', 'FOLKO', 6, '1997-10-14', '1997-11-11', '1997-10-20', 2, 152.3000, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10704, 'P001', 'QUEEN', 6, '1997-10-14', '1997-11-11', '1997-11-07', 1, 4.7800, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10705, 'P001', 'HILAA', 9, '1997-10-15', '1997-11-12', '1997-11-18', 2, 3.5200, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10706, 'P001', 'OLDWO', 8, '1997-10-16', '1997-11-13', '1997-10-21', 3, 135.6300, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10707, 'P001', 'AROUT', 4, '1997-10-16', '1997-10-30', '1997-10-23', 3, 21.7400, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10708, 'P001', 'THEBI', 6, '1997-10-17', '1997-11-28', '1997-11-05', 2, 2.9600, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10709, 'P001', 'GOURL', 1, '1997-10-17', '1997-11-14', '1997-11-20', 3, 210.8000, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10710, 'P001', 'FRANS', 1, '1997-10-20', '1997-11-17', '1997-10-23', 1, 4.9800, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10711, 'P001', 'SAVEA', 5, '1997-10-21', '1997-12-02', '1997-10-29', 2, 52.4100, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10712, 'P001', 'HUNGO', 3, '1997-10-21', '1997-11-18', '1997-10-31', 1, 89.9300, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10713, 'P001', 'SAVEA', 1, '1997-10-22', '1997-11-19', '1997-10-24', 1, 167.0500, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10714, 'P001', 'SAVEA', 5, '1997-10-22', '1997-11-19', '1997-10-27', 3, 24.4900, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10715, 'P001', 'BONAP', 3, '1997-10-23', '1997-11-06', '1997-10-29', 1, 63.2000, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10716, 'P001', 'RANCH', 4, '1997-10-24', '1997-11-21', '1997-10-27', 2, 22.5700, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10717, 'P001', 'FRANK', 1, '1997-10-24', '1997-11-21', '1997-10-29', 2, 59.2500, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10718, 'P001', 'KOENE', 1, '1997-10-27', '1997-11-24', '1997-10-29', 3, 170.8800, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10719, 'P001', 'LETSS', 8, '1997-10-27', '1997-11-24', '1997-11-05', 2, 51.4400, 'Let\'s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10720, 'P001', 'QUEDE', 8, '1997-10-28', '1997-11-11', '1997-11-05', 2, 9.5300, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10721, 'P001', 'QUICK', 5, '1997-10-29', '1997-11-26', '1997-10-31', 3, 48.9200, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10722, 'P001', 'SAVEA', 8, '1997-10-29', '1997-12-10', '1997-11-04', 1, 74.5800, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10723, 'P001', 'WHITC', 3, '1997-10-30', '1997-11-27', '1997-11-25', 1, 21.7200, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10724, 'P001', 'MEREP', 8, '1997-10-30', '1997-12-11', '1997-11-05', 2, 57.7500, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10725, 'P001', 'FAMIA', 4, '1997-10-31', '1997-11-28', '1997-11-05', 3, 10.8300, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10726, 'P001', 'EASTC', 4, '1997-11-03', '1997-11-17', '1997-12-05', 1, 16.5600, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10727, 'P001', 'REGGC', 2, '1997-11-03', '1997-12-01', '1997-12-05', 1, 89.9000, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10728, 'P001', 'QUEEN', 4, '1997-11-04', '1997-12-02', '1997-11-11', 2, 58.3300, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10729, 'P001', 'LINOD', 8, '1997-11-04', '1997-12-16', '1997-11-14', 3, 141.0600, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10730, 'P001', 'BONAP', 5, '1997-11-05', '1997-12-03', '1997-11-14', 1, 20.1200, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10731, 'P001', 'CHOPS', 7, '1997-11-06', '1997-12-04', '1997-11-14', 1, 96.6500, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10732, 'P001', 'BONAP', 3, '1997-11-06', '1997-12-04', '1997-11-07', 1, 16.9700, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10733, 'P001', 'BERGS', 1, '1997-11-07', '1997-12-05', '1997-11-10', 3, 110.1100, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10734, 'P001', 'GOURL', 2, '1997-11-07', '1997-12-05', '1997-11-12', 3, 1.6300, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10735, 'P001', 'LETSS', 6, '1997-11-10', '1997-12-08', '1997-11-21', 2, 45.9700, 'Let\'s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10736, 'P001', 'HUNGO', 9, '1997-11-11', '1997-12-09', '1997-11-21', 2, 44.1000, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10737, 'P001', 'VINET', 2, '1997-11-11', '1997-12-09', '1997-11-18', 2, 7.7900, 'Vins et alcools Chevalier', '59 rue de l\'Abbaye', 'Reims', NULL, '51100', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10738, 'P001', 'SPECD', 2, '1997-11-12', '1997-12-10', '1997-11-18', 1, 2.9100, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10739, 'P001', 'VINET', 3, '1997-11-12', '1997-12-10', '1997-11-17', 3, 11.0800, 'Vins et alcools Chevalier', '59 rue de l\'Abbaye', 'Reims', NULL, '51100', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10740, 'P001', 'WHITC', 4, '1997-11-13', '1997-12-11', '1997-11-25', 2, 81.8800, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10741, 'P001', 'AROUT', 4, '1997-11-14', '1997-11-28', '1997-11-18', 3, 10.9600, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10742, 'P001', 'BOTTM', 3, '1997-11-14', '1997-12-12', '1997-11-18', 3, 243.7300, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10743, 'P001', 'AROUT', 1, '1997-11-17', '1997-12-15', '1997-11-21', 2, 23.7200, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10744, 'P001', 'VAFFE', 6, '1997-11-17', '1997-12-15', '1997-11-24', 1, 69.1900, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10745, 'P001', 'QUICK', 9, '1997-11-18', '1997-12-16', '1997-11-27', 1, 3.5200, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10746, 'P001', 'CHOPS', 1, '1997-11-19', '1997-12-17', '1997-11-21', 3, 31.4300, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10747, 'P001', 'PICCO', 6, '1997-11-19', '1997-12-17', '1997-11-26', 1, 117.3300, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10748, 'P001', 'SAVEA', 3, '1997-11-20', '1997-12-18', '1997-11-28', 1, 232.5500, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10749, 'P001', 'ISLAT', 4, '1997-11-20', '1997-12-18', '1997-12-19', 2, 61.5300, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10750, 'P001', 'WARTH', 9, '1997-11-21', '1997-12-19', '1997-11-24', 1, 79.3000, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10751, 'P001', 'RICSU', 3, '1997-11-24', '1997-12-22', '1997-12-03', 3, 130.7900, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10752, 'P001', 'NORTS', 2, '1997-11-24', '1997-12-22', '1997-11-28', 3, 1.3900, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10753, 'P001', 'FRANS', 3, '1997-11-25', '1997-12-23', '1997-11-27', 1, 7.7000, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10754, 'P001', 'MAGAA', 6, '1997-11-25', '1997-12-23', '1997-11-27', 3, 2.3800, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10755, 'P001', 'BONAP', 4, '1997-11-26', '1997-12-24', '1997-11-28', 2, 16.7100, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10756, 'P001', 'SPLIR', 8, '1997-11-27', '1997-12-25', '1997-12-02', 2, 73.2100, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10757, 'P001', 'SAVEA', 6, '1997-11-27', '1997-12-25', '1997-12-15', 1, 8.1900, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10758, 'P001', 'RICSU', 3, '1997-11-28', '1997-12-26', '1997-12-04', 3, 138.1700, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10759, 'P001', 'ANATR', 3, '1997-11-28', '1997-12-26', '1997-12-12', 3, 11.9900, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10760, 'P001', 'MAISD', 4, '1997-12-01', '1997-12-29', '1997-12-10', 1, 155.6400, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10761, 'P001', 'RATTC', 5, '1997-12-02', '1997-12-30', '1997-12-08', 2, 18.6600, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10762, 'P001', 'FOLKO', 3, '1997-12-02', '1997-12-30', '1997-12-09', 1, 328.7400, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10763, 'P001', 'FOLIG', 3, '1997-12-03', '1997-12-31', '1997-12-08', 3, 37.3500, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10764, 'P001', 'ERNSH', 6, '1997-12-03', '1997-12-31', '1997-12-08', 3, 145.4500, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10765, 'P001', 'QUICK', 3, '1997-12-04', '1998-01-01', '1997-12-09', 3, 42.7400, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10766, 'P001', 'OTTIK', 4, '1997-12-05', '1998-01-02', '1997-12-09', 1, 157.5500, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10767, 'P001', 'SUPRD', 4, '1997-12-05', '1998-01-02', '1997-12-15', 3, 1.5900, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10768, 'P001', 'AROUT', 3, '1997-12-08', '1998-01-05', '1997-12-15', 2, 146.3200, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10769, 'P001', 'VAFFE', 3, '1997-12-08', '1998-01-05', '1997-12-12', 1, 65.0600, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10770, 'P001', 'HANAR', 8, '1997-12-09', '1998-01-06', '1997-12-17', 3, 5.3200, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10771, 'P001', 'ERNSH', 9, '1997-12-10', '1998-01-07', '1998-01-02', 2, 11.1900, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10772, 'P001', 'LEHMS', 3, '1997-12-10', '1998-01-07', '1997-12-19', 2, 91.2800, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10773, 'P001', 'ERNSH', 1, '1997-12-11', '1998-01-08', '1997-12-16', 3, 96.4300, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10774, 'P001', 'FOLKO', 4, '1997-12-11', '1997-12-25', '1997-12-12', 1, 48.2000, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10775, 'P001', 'THECR', 7, '1997-12-12', '1998-01-09', '1997-12-26', 1, 20.2500, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10776, 'P001', 'ERNSH', 1, '1997-12-15', '1998-01-12', '1997-12-18', 3, 351.5300, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10777, 'P001', 'GOURL', 7, '1997-12-15', '1997-12-29', '1998-01-21', 2, 3.0100, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10778, 'P001', 'BERGS', 3, '1997-12-16', '1998-01-13', '1997-12-24', 1, 6.7900, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10779, 'P001', 'MORGK', 3, '1997-12-16', '1998-01-13', '1998-01-14', 2, 58.1300, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10780, 'P001', 'LILAS', 2, '1997-12-16', '1997-12-30', '1997-12-25', 1, 42.1300, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10781, 'P001', 'WARTH', 2, '1997-12-17', '1998-01-14', '1997-12-19', 3, 73.1600, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10782, 'P001', 'CACTU', 9, '1997-12-17', '1998-01-14', '1997-12-22', 3, 1.1000, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10783, 'P001', 'HANAR', 4, '1997-12-18', '1998-01-15', '1997-12-19', 2, 124.9800, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10784, 'P001', 'MAGAA', 4, '1997-12-18', '1998-01-15', '1997-12-22', 3, 70.0900, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10785, 'P001', 'GROSR', 1, '1997-12-18', '1998-01-15', '1997-12-24', 3, 1.5100, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10786, 'P001', 'QUEEN', 8, '1997-12-19', '1998-01-16', '1997-12-23', 1, 110.8700, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10787, 'P001', 'LAMAI', 2, '1997-12-19', '1998-01-02', '1997-12-26', 1, 249.9300, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10788, 'P001', 'QUICK', 1, '1997-12-22', '1998-01-19', '1998-01-19', 2, 42.7000, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10789, 'P001', 'FOLIG', 1, '1997-12-22', '1998-01-19', '1997-12-31', 2, 100.6000, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10790, 'P001', 'GOURL', 6, '1997-12-22', '1998-01-19', '1997-12-26', 1, 28.2300, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10791, 'P001', 'FRANK', 6, '1997-12-23', '1998-01-20', '1998-01-01', 2, 16.8500, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10792, 'P001', 'WOLZA', 1, '1997-12-23', '1998-01-20', '1997-12-31', 3, 23.7900, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10793, 'P001', 'AROUT', 3, '1997-12-24', '1998-01-21', '1998-01-08', 3, 4.5200, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10794, 'P001', 'QUEDE', 6, '1997-12-24', '1998-01-21', '1998-01-02', 1, 21.4900, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10795, 'P001', 'ERNSH', 8, '1997-12-24', '1998-01-21', '1998-01-20', 2, 126.6600, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10796, 'P001', 'HILAA', 3, '1997-12-25', '1998-01-22', '1998-01-14', 1, 26.5200, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10797, 'P001', 'DRACD', 7, '1997-12-25', '1998-01-22', '1998-01-05', 2, 33.3500, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10798, 'P001', 'ISLAT', 2, '1997-12-26', '1998-01-23', '1998-01-05', 1, 2.3300, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10799, 'P001', 'KOENE', 9, '1997-12-26', '1998-02-06', '1998-01-05', 3, 30.7600, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10800, 'P001', 'SEVES', 1, '1997-12-26', '1998-01-23', '1998-01-05', 3, 137.4400, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10801, 'P001', 'BOLID', 4, '1997-12-29', '1998-01-26', '1997-12-31', 2, 97.0900, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10802, 'P001', 'SIMOB', 4, '1997-12-29', '1998-01-26', '1998-01-02', 2, 257.2600, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10803, 'P001', 'WELLI', 4, '1997-12-30', '1998-01-27', '1998-01-06', 1, 55.2300, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10804, 'P001', 'SEVES', 6, '1997-12-30', '1998-01-27', '1998-01-07', 2, 27.3300, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10805, 'P001', 'THEBI', 2, '1997-12-30', '1998-01-27', '1998-01-09', 3, 237.3400, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10806, 'P001', 'VICTE', 3, '1997-12-31', '1998-01-28', '1998-01-05', 2, 22.1100, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10807, 'P001', 'FRANS', 4, '1997-12-31', '1998-01-28', '1998-01-30', 1, 1.3600, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10808, 'P001', 'OLDWO', 2, '1998-01-01', '1998-01-29', '1998-01-09', 3, 45.5300, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10809, 'P001', 'WELLI', 7, '1998-01-01', '1998-01-29', '1998-01-07', 1, 4.8700, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10810, 'P001', 'LAUGB', 2, '1998-01-01', '1998-01-29', '1998-01-07', 3, 4.3300, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10811, 'P001', 'LINOD', 8, '1998-01-02', '1998-01-30', '1998-01-08', 1, 31.2200, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10812, 'P001', 'REGGC', 5, '1998-01-02', '1998-01-30', '1998-01-12', 1, 59.7800, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10813, 'P001', 'RICAR', 1, '1998-01-05', '1998-02-02', '1998-01-09', 1, 47.3800, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10814, 'P001', 'VICTE', 3, '1998-01-05', '1998-02-02', '1998-01-14', 3, 130.9400, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10815, 'P001', 'SAVEA', 2, '1998-01-05', '1998-02-02', '1998-01-14', 3, 14.6200, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10816, 'P001', 'GREAL', 4, '1998-01-06', '1998-02-03', '1998-02-04', 2, 719.7800, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10817, 'P001', 'KOENE', 3, '1998-01-06', '1998-01-20', '1998-01-13', 2, 306.0700, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10818, 'P001', 'MAGAA', 7, '1998-01-07', '1998-02-04', '1998-01-12', 3, 65.4800, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10819, 'P001', 'CACTU', 2, '1998-01-07', '1998-02-04', '1998-01-16', 3, 19.7600, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10820, 'P001', 'RATTC', 3, '1998-01-07', '1998-02-04', '1998-01-13', 2, 37.5200, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10821, 'P001', 'SPLIR', 1, '1998-01-08', '1998-02-05', '1998-01-15', 1, 36.6800, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10822, 'P001', 'TRAIH', 6, '1998-01-08', '1998-02-05', '1998-01-16', 3, 7.0000, 'Trail\'s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10823, 'P001', 'LILAS', 5, '1998-01-09', '1998-02-06', '1998-01-13', 2, 163.9700, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10824, 'P001', 'FOLKO', 8, '1998-01-09', '1998-02-06', '1998-01-30', 1, 1.2300, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10825, 'P001', 'DRACD', 1, '1998-01-09', '1998-02-06', '1998-01-14', 1, 79.2500, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10826, 'P001', 'BLONP', 6, '1998-01-12', '1998-02-09', '1998-02-06', 1, 7.0900, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10827, 'P001', 'BONAP', 1, '1998-01-12', '1998-01-26', '1998-02-06', 2, 63.5400, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10828, 'P001', 'RANCH', 9, '1998-01-13', '1998-01-27', '1998-02-04', 1, 90.8500, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10829, 'P001', 'ISLAT', 9, '1998-01-13', '1998-02-10', '1998-01-23', 1, 154.7200, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10830, 'P001', 'TRADH', 4, '1998-01-13', '1998-02-24', '1998-01-21', 2, 81.8300, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10831, 'P001', 'SANTG', 3, '1998-01-14', '1998-02-11', '1998-01-23', 2, 72.1900, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10832, 'P001', 'LAMAI', 2, '1998-01-14', '1998-02-11', '1998-01-19', 2, 43.2600, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10833, 'P001', 'OTTIK', 6, '1998-01-15', '1998-02-12', '1998-01-23', 2, 71.4900, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10834, 'P001', 'TRADH', 1, '1998-01-15', '1998-02-12', '1998-01-19', 3, 29.7800, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10835, 'P001', 'ALFKI', 1, '1998-01-15', '1998-02-12', '1998-01-21', 3, 69.5300, 'Alfred\'s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10836, 'P001', 'ERNSH', 7, '1998-01-16', '1998-02-13', '1998-01-21', 1, 411.8800, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10837, 'P001', 'BERGS', 9, '1998-01-16', '1998-02-13', '1998-01-23', 3, 13.3200, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10838, 'P001', 'LINOD', 3, '1998-01-19', '1998-02-16', '1998-01-23', 3, 59.2800, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10839, 'P001', 'TRADH', 3, '1998-01-19', '1998-02-16', '1998-01-22', 3, 35.4300, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10840, 'P001', 'LINOD', 4, '1998-01-19', '1998-03-02', '1998-02-16', 2, 2.7100, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10841, 'P001', 'SUPRD', 5, '1998-01-20', '1998-02-17', '1998-01-29', 2, 424.3000, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10842, 'P001', 'TORTU', 1, '1998-01-20', '1998-02-17', '1998-01-29', 3, 54.4200, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10843, 'P001', 'VICTE', 4, '1998-01-21', '1998-02-18', '1998-01-26', 2, 9.2600, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10844, 'P001', 'PICCO', 8, '1998-01-21', '1998-02-18', '1998-01-26', 2, 25.2200, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10845, 'P001', 'QUICK', 8, '1998-01-21', '1998-02-04', '1998-01-30', 1, 212.9800, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10846, 'P001', 'SUPRD', 2, '1998-01-22', '1998-03-05', '1998-01-23', 3, 56.4600, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10847, 'P001', 'SAVEA', 4, '1998-01-22', '1998-02-05', '1998-02-10', 3, 487.5700, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10848, 'P001', 'CONSH', 7, '1998-01-23', '1998-02-20', '1998-01-29', 2, 38.2400, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10849, 'P001', 'KOENE', 9, '1998-01-23', '1998-02-20', '1998-01-30', 2, 0.5600, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10850, 'P001', 'VICTE', 1, '1998-01-23', '1998-03-06', '1998-01-30', 1, 49.1900, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10851, 'P001', 'RICAR', 5, '1998-01-26', '1998-02-23', '1998-02-02', 1, 160.5500, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10852, 'P001', 'RATTC', 8, '1998-01-26', '1998-02-09', '1998-01-30', 1, 174.0500, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10853, 'P001', 'BLAUS', 9, '1998-01-27', '1998-02-24', '1998-02-03', 2, 53.8300, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10854, 'P001', 'ERNSH', 3, '1998-01-27', '1998-02-24', '1998-02-05', 2, 100.2200, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10855, 'P001', 'OLDWO', 3, '1998-01-27', '1998-02-24', '1998-02-04', 1, 170.9700, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10856, 'P001', 'ANTON', 3, '1998-01-28', '1998-02-25', '1998-02-10', 2, 58.4300, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10857, 'P001', 'BERGS', 8, '1998-01-28', '1998-02-25', '1998-02-06', 2, 188.8500, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10858, 'P001', 'LACOR', 2, '1998-01-29', '1998-02-26', '1998-02-03', 1, 52.5100, 'La corne d\'abondance', '67, avenue de l\'Europe', 'Versailles', NULL, '78000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10859, 'P001', 'FRANK', 1, '1998-01-29', '1998-02-26', '1998-02-02', 2, 76.1000, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10860, 'P001', 'FRANR', 3, '1998-01-29', '1998-02-26', '1998-02-04', 3, 19.2600, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10861, 'P001', 'WHITC', 4, '1998-01-30', '1998-02-27', '1998-02-17', 2, 14.9300, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10862, 'P001', 'LEHMS', 8, '1998-01-30', '1998-03-13', '1998-02-02', 2, 53.2300, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10863, 'P001', 'HILAA', 4, '1998-02-02', '1998-03-02', '1998-02-17', 2, 30.2600, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10864, 'P001', 'AROUT', 4, '1998-02-02', '1998-03-02', '1998-02-09', 2, 3.0400, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10865, 'P001', 'QUICK', 2, '1998-02-02', '1998-02-16', '1998-02-12', 1, 348.1400, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10866, 'P001', 'BERGS', 5, '1998-02-03', '1998-03-03', '1998-02-12', 1, 109.1100, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10867, 'P001', 'LONEP', 6, '1998-02-03', '1998-03-17', '1998-02-11', 1, 1.9300, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10868, 'P001', 'QUEEN', 7, '1998-02-04', '1998-03-04', '1998-02-23', 2, 191.2700, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10869, 'P001', 'SEVES', 5, '1998-02-04', '1998-03-04', '1998-02-09', 1, 143.2800, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10870, 'P001', 'WOLZA', 5, '1998-02-04', '1998-03-04', '1998-02-13', 3, 12.0400, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10871, 'P001', 'BONAP', 9, '1998-02-05', '1998-03-05', '1998-02-10', 2, 112.2700, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10872, 'P001', 'GODOS', 5, '1998-02-05', '1998-03-05', '1998-02-09', 2, 175.3200, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10873, 'P001', 'WILMK', 4, '1998-02-06', '1998-03-06', '1998-02-09', 1, 0.8200, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10874, 'P001', 'GODOS', 5, '1998-02-06', '1998-03-06', '1998-02-11', 2, 19.5800, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10875, 'P001', 'BERGS', 4, '1998-02-06', '1998-03-06', '1998-03-03', 2, 32.3700, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10876, 'P001', 'BONAP', 7, '1998-02-09', '1998-03-09', '1998-02-12', 3, 60.4200, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10877, 'P001', 'RICAR', 1, '1998-02-09', '1998-03-09', '1998-02-19', 1, 38.0600, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10878, 'P001', 'QUICK', 4, '1998-02-10', '1998-03-10', '1998-02-12', 1, 46.6900, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10879, 'P001', 'WILMK', 3, '1998-02-10', '1998-03-10', '1998-02-12', 3, 8.5000, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10880, 'P001', 'FOLKO', 7, '1998-02-10', '1998-03-24', '1998-02-18', 1, 88.0100, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10881, 'P001', 'CACTU', 4, '1998-02-11', '1998-03-11', '1998-02-18', 1, 2.8400, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10882, 'P001', 'SAVEA', 4, '1998-02-11', '1998-03-11', '1998-02-20', 3, 23.1000, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10883, 'P001', 'LONEP', 8, '1998-02-12', '1998-03-12', '1998-02-20', 3, 0.5300, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10884, 'P001', 'LETSS', 4, '1998-02-12', '1998-03-12', '1998-02-13', 2, 90.9700, 'Let\'s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10885, 'P001', 'SUPRD', 6, '1998-02-12', '1998-03-12', '1998-02-18', 3, 5.6400, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10886, 'P001', 'HANAR', 1, '1998-02-13', '1998-03-13', '1998-03-02', 1, 4.9900, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10887, 'P001', 'GALED', 8, '1998-02-13', '1998-03-13', '1998-02-16', 3, 1.2500, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10888, 'P001', 'GODOS', 1, '1998-02-16', '1998-03-16', '1998-02-23', 2, 51.8700, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10889, 'P001', 'RATTC', 9, '1998-02-16', '1998-03-16', '1998-02-23', 3, 280.6100, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10890, 'P001', 'DUMON', 7, '1998-02-16', '1998-03-16', '1998-02-18', 1, 32.7600, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10891, 'P001', 'LEHMS', 7, '1998-02-17', '1998-03-17', '1998-02-19', 2, 20.3700, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10892, 'P001', 'MAISD', 4, '1998-02-17', '1998-03-17', '1998-02-19', 2, 120.2700, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10893, 'P001', 'KOENE', 9, '1998-02-18', '1998-03-18', '1998-02-20', 2, 77.7800, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10894, 'P001', 'SAVEA', 1, '1998-02-18', '1998-03-18', '1998-02-20', 1, 116.1300, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10895, 'P001', 'ERNSH', 3, '1998-02-18', '1998-03-18', '1998-02-23', 1, 162.7500, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10896, 'P001', 'MAISD', 7, '1998-02-19', '1998-03-19', '1998-02-27', 3, 32.4500, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10897, 'P001', 'HUNGO', 3, '1998-02-19', '1998-03-19', '1998-02-25', 2, 603.5400, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10898, 'P001', 'OCEAN', 4, '1998-02-20', '1998-03-20', '1998-03-06', 2, 1.2700, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10899, 'P001', 'LILAS', 5, '1998-02-20', '1998-03-20', '1998-02-26', 3, 1.2100, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10900, 'P001', 'WELLI', 1, '1998-02-20', '1998-03-20', '1998-03-04', 2, 1.6600, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', 'completed', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10901, 'P001', 'HILAA', 4, '1998-02-23', '1998-03-23', '1998-02-26', 1, 62.0900, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10902, 'P001', 'FOLKO', 1, '1998-02-23', '1998-03-23', '1998-03-03', 1, 44.1500, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10903, 'P001', 'HANAR', 3, '1998-02-24', '1998-03-24', '1998-03-04', 3, 36.7100, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10904, 'P001', 'WHITC', 3, '1998-02-24', '1998-03-24', '1998-02-27', 3, 162.9500, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10905, 'P001', 'WELLI', 9, '1998-02-24', '1998-03-24', '1998-03-06', 2, 13.7200, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10906, 'P001', 'WOLZA', 4, '1998-02-25', '1998-03-11', '1998-03-03', 3, 26.2900, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10907, 'P001', 'SPECD', 6, '1998-02-25', '1998-03-25', '1998-02-27', 3, 9.1900, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10908, 'P001', 'REGGC', 4, '1998-02-26', '1998-03-26', '1998-03-06', 2, 32.9600, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10909, 'P001', 'SANTG', 1, '1998-02-26', '1998-03-26', '1998-03-10', 2, 53.0500, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10910, 'P001', 'WILMK', 1, '1998-02-26', '1998-03-26', '1998-03-04', 3, 38.1100, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10911, 'P001', 'GODOS', 3, '1998-02-26', '1998-03-26', '1998-03-05', 1, 38.1900, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10912, 'P001', 'HUNGO', 2, '1998-02-26', '1998-03-26', '1998-03-18', 2, 580.9100, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10913, 'P001', 'QUEEN', 4, '1998-02-26', '1998-03-26', '1998-03-04', 1, 33.0500, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10914, 'P001', 'QUEEN', 6, '1998-02-27', '1998-03-27', '1998-03-02', 1, 21.1900, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10915, 'P001', 'TORTU', 2, '1998-02-27', '1998-03-27', '1998-03-02', 2, 3.5100, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10916, 'P001', 'RANCH', 1, '1998-02-27', '1998-03-27', '1998-03-09', 2, 63.7700, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10917, 'P001', 'ROMEY', 4, '1998-03-02', '1998-03-30', '1998-03-11', 2, 8.2900, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10918, 'P001', 'BOTTM', 3, '1998-03-02', '1998-03-30', '1998-03-11', 3, 48.8300, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10919, 'P001', 'LINOD', 2, '1998-03-02', '1998-03-30', '1998-03-04', 2, 19.8000, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10920, 'P001', 'AROUT', 4, '1998-03-03', '1998-03-31', '1998-03-09', 2, 29.6100, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10921, 'P001', 'VAFFE', 1, '1998-03-03', '1998-04-14', '1998-03-09', 1, 176.4800, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10922, 'P001', 'HANAR', 5, '1998-03-03', '1998-03-31', '1998-03-05', 3, 62.7400, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10923, 'P001', 'LAMAI', 7, '1998-03-03', '1998-04-14', '1998-03-13', 3, 68.2600, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10924, 'P001', 'BERGS', 3, '1998-03-04', '1998-04-01', '1998-04-08', 2, 151.5200, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10925, 'P001', 'HANAR', 3, '1998-03-04', '1998-04-01', '1998-03-13', 1, 2.2700, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10926, 'P001', 'ANATR', 4, '1998-03-04', '1998-04-01', '1998-03-11', 3, 39.9200, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10927, 'P001', 'LACOR', 4, '1998-03-05', '1998-04-02', '1998-04-08', 1, 19.7900, 'La corne d\'abondance', '67, avenue de l\'Europe', 'Versailles', NULL, '78000', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10928, 'P001', 'GALED', 1, '1998-03-05', '1998-04-02', '1998-03-18', 1, 1.3600, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10929, 'P001', 'FRANK', 6, '1998-03-05', '1998-04-02', '1998-03-12', 1, 33.9300, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10930, 'P001', 'SUPRD', 4, '1998-03-06', '1998-04-17', '1998-03-18', 3, 15.5500, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10931, 'P001', 'RICSU', 4, '1998-03-06', '1998-03-20', '1998-03-19', 2, 13.6000, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10932, 'P001', 'BONAP', 8, '1998-03-06', '1998-04-03', '1998-03-24', 1, 134.6400, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10933, 'P001', 'ISLAT', 6, '1998-03-06', '1998-04-03', '1998-03-16', 3, 54.1500, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10934, 'P001', 'LEHMS', 3, '1998-03-09', '1998-04-06', '1998-03-12', 3, 32.0100, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10935, 'P001', 'WELLI', 4, '1998-03-09', '1998-04-06', '1998-03-18', 3, 47.5900, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10936, 'P001', 'GREAL', 3, '1998-03-09', '1998-04-06', '1998-03-18', 2, 33.6800, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10937, 'P001', 'CACTU', 7, '1998-03-10', '1998-03-24', '1998-03-13', 3, 31.5100, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10938, 'P001', 'QUICK', 3, '1998-03-10', '1998-04-07', '1998-03-16', 2, 31.8900, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10939, 'P001', 'MAGAA', 2, '1998-03-10', '1998-04-07', '1998-03-13', 2, 76.3300, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10940, 'P001', 'BONAP', 8, '1998-03-11', '1998-04-08', '1998-03-23', 3, 19.7700, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10941, 'P001', 'SAVEA', 7, '1998-03-11', '1998-04-08', '1998-03-20', 2, 400.8100, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10942, 'P001', 'REGGC', 9, '1998-03-11', '1998-04-08', '1998-03-18', 3, 17.9500, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10943, 'P001', 'BSBEV', 4, '1998-03-11', '1998-04-08', '1998-03-19', 2, 2.1700, 'B\'s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10944, 'P001', 'BOTTM', 6, '1998-03-12', '1998-03-26', '1998-03-13', 3, 52.9200, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10945, 'P001', 'MORGK', 4, '1998-03-12', '1998-04-09', '1998-03-18', 1, 10.2200, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10946, 'P001', 'VAFFE', 1, '1998-03-12', '1998-04-09', '1998-03-19', 2, 27.2000, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10947, 'P001', 'BSBEV', 3, '1998-03-13', '1998-04-10', '1998-03-16', 2, 3.2600, 'B\'s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10948, 'P001', 'GODOS', 3, '1998-03-13', '1998-04-10', '1998-03-19', 3, 23.3900, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10949, 'P001', 'BOTTM', 2, '1998-03-13', '1998-04-10', '1998-03-17', 3, 74.4400, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10950, 'P001', 'MAGAA', 1, '1998-03-16', '1998-04-13', '1998-03-23', 2, 2.5000, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10951, 'P001', 'RICSU', 9, '1998-03-16', '1998-04-27', '1998-04-07', 2, 30.8500, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10952, 'P001', 'ALFKI', 1, '1998-03-16', '1998-04-27', '1998-03-24', 1, 40.4200, 'Alfred\'s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10953, 'P001', 'AROUT', 9, '1998-03-16', '1998-03-30', '1998-03-25', 2, 23.7200, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10954, 'P001', 'LINOD', 5, '1998-03-17', '1998-04-28', '1998-03-20', 1, 27.9100, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10955, 'P001', 'FOLKO', 8, '1998-03-17', '1998-04-14', '1998-03-20', 2, 3.2600, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10956, 'P001', 'BLAUS', 6, '1998-03-17', '1998-04-28', '1998-03-20', 2, 44.6500, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10957, 'P001', 'HILAA', 8, '1998-03-18', '1998-04-15', '1998-03-27', 3, 105.3600, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10958, 'P001', 'OCEAN', 7, '1998-03-18', '1998-04-15', '1998-03-27', 2, 49.5600, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10959, 'P001', 'GOURL', 6, '1998-03-18', '1998-04-29', '1998-03-23', 2, 4.9800, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10960, 'P001', 'HILAA', 3, '1998-03-19', '1998-04-02', '1998-04-08', 1, 2.0800, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10961, 'P001', 'QUEEN', 8, '1998-03-19', '1998-04-16', '1998-03-30', 1, 104.4700, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10962, 'P001', 'QUICK', 8, '1998-03-19', '1998-04-16', '1998-03-23', 2, 275.7900, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10963, 'P001', 'FURIB', 9, '1998-03-19', '1998-04-16', '1998-03-26', 3, 2.7000, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10964, 'P001', 'SPECD', 3, '1998-03-20', '1998-04-17', '1998-03-24', 2, 87.3800, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10965, 'P001', 'OLDWO', 6, '1998-03-20', '1998-04-17', '1998-03-30', 3, 144.3800, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10966, 'P001', 'CHOPS', 4, '1998-03-20', '1998-04-17', '1998-04-08', 1, 27.1900, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10967, 'P001', 'TOMSP', 2, '1998-03-23', '1998-04-20', '1998-04-02', 2, 62.2200, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10968, 'P001', 'ERNSH', 1, '1998-03-23', '1998-04-20', '1998-04-01', 3, 74.6000, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10969, 'P001', 'COMMI', 1, '1998-03-23', '1998-04-20', '1998-03-30', 2, 0.2100, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10970, 'P001', 'BOLID', 9, '1998-03-24', '1998-04-07', '1998-04-24', 1, 16.1600, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10971, 'P001', 'FRANR', 2, '1998-03-24', '1998-04-21', '1998-04-02', 2, 121.8200, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10972, 'P001', 'LACOR', 4, '1998-03-24', '1998-04-21', '1998-03-26', 2, 0.0200, 'La corne d\'abondance', '67, avenue de l\'Europe', 'Versailles', NULL, '78000', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10973, 'P001', 'LACOR', 6, '1998-03-24', '1998-04-21', '1998-03-27', 2, 15.1700, 'La corne d\'abondance', '67, avenue de l\'Europe', 'Versailles', NULL, '78000', 'France', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10974, 'P001', 'SPLIR', 3, '1998-03-25', '1998-04-08', '1998-04-03', 3, 12.9600, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10975, 'P001', 'BOTTM', 1, '1998-03-25', '1998-04-22', '1998-03-27', 3, 32.2700, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10976, 'P001', 'HILAA', 1, '1998-03-25', '1998-05-06', '1998-04-03', 1, 37.9700, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10977, 'P001', 'FOLKO', 8, '1998-03-26', '1998-04-23', '1998-04-10', 3, 208.5000, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10978, 'P001', 'MAISD', 9, '1998-03-26', '1998-04-23', '1998-04-23', 2, 32.8200, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10979, 'P001', 'ERNSH', 8, '1998-03-26', '1998-04-23', '1998-03-31', 2, 353.0700, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10980, 'P001', 'FOLKO', 4, '1998-03-27', '1998-05-08', '1998-04-17', 1, 1.2600, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10981, 'P001', 'HANAR', 1, '1998-03-27', '1998-04-24', '1998-04-02', 2, 193.3700, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10982, 'P001', 'BOTTM', 2, '1998-03-27', '1998-04-24', '1998-04-08', 1, 14.0100, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10983, 'P001', 'SAVEA', 2, '1998-03-27', '1998-04-24', '1998-04-06', 2, 657.5400, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10984, 'P001', 'SAVEA', 1, '1998-03-30', '1998-04-27', '1998-04-03', 3, 211.2200, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10985, 'P001', 'HUNGO', 2, '1998-03-30', '1998-04-27', '1998-04-02', 1, 91.5100, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10986, 'P001', 'OCEAN', 8, '1998-03-30', '1998-04-27', '1998-04-21', 2, 217.8600, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10987, 'P001', 'EASTC', 8, '1998-03-31', '1998-04-28', '1998-04-06', 1, 185.4800, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10988, 'P001', 'RATTC', 3, '1998-03-31', '1998-04-28', '1998-04-10', 2, 61.1400, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10989, 'P001', 'QUEDE', 2, '1998-03-31', '1998-04-28', '1998-04-02', 1, 34.7600, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10990, 'P001', 'ERNSH', 2, '1998-04-01', '1998-05-13', '1998-04-07', 3, 117.6100, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10991, 'P001', 'QUICK', 1, '1998-04-01', '1998-04-29', '1998-04-07', 1, 38.5100, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10992, 'P001', 'THEBI', 1, '1998-04-01', '1998-04-29', '1998-04-03', 3, 4.2700, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10993, 'P001', 'FOLKO', 7, '1998-04-01', '1998-04-29', '1998-04-10', 3, 8.8100, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10994, 'P001', 'VAFFE', 2, '1998-04-02', '1998-04-16', '1998-04-09', 3, 65.5300, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10995, 'P001', 'PERIC', 1, '1998-04-02', '1998-04-30', '1998-04-06', 3, 46.0000, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10996, 'P001', 'QUICK', 4, '1998-04-02', '1998-04-30', '1998-04-10', 2, 1.1200, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10997, 'P001', 'LILAS', 8, '1998-04-03', '1998-05-15', '1998-04-13', 2, 73.9100, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10998, 'P001', 'WOLZA', 8, '1998-04-03', '1998-04-17', '1998-04-17', 2, 20.3100, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (10999, 'P001', 'OTTIK', 6, '1998-04-03', '1998-05-01', '1998-04-10', 2, 96.3500, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11000, 'P001', 'RATTC', 2, '1998-04-06', '1998-05-04', '1998-04-14', 3, 55.1200, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'in progress', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11001, 'P001', 'FOLKO', 2, '1998-04-06', '1998-05-04', '1998-04-14', 2, 197.3000, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11002, 'P001', 'SAVEA', 4, '1998-04-06', '1998-05-04', '1998-04-16', 1, 141.1600, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11003, 'P001', 'THECR', 3, '1998-04-06', '1998-05-04', '1998-04-08', 3, 14.9100, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11004, 'P001', 'MAISD', 3, '1998-04-07', '1998-05-05', '1998-04-20', 1, 44.8400, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11005, 'P001', 'WILMK', 2, '1998-04-07', '1998-05-05', '1998-04-10', 1, 0.7500, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11006, 'P001', 'GREAL', 3, '1998-04-07', '1998-05-05', '1998-04-15', 2, 25.1900, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11007, 'P001', 'PRINI', 8, '1998-04-08', '1998-05-06', '1998-04-13', 2, 202.2400, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11008, 'P001', 'ERNSH', 7, '1998-04-08', '1998-05-06', '1998-06-03', 3, 79.4600, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11009, 'P001', 'GODOS', 2, '1998-04-08', '1998-05-06', '1998-04-10', 1, 59.1100, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11010, 'P001', 'REGGC', 2, '1998-04-09', '1998-05-07', '1998-04-21', 2, 28.7100, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11011, 'P001', 'ALFKI', 3, '1998-04-09', '1998-05-07', '1998-04-13', 1, 1.2100, 'Alfred\'s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11012, 'P001', 'FRANK', 1, '1998-04-09', '1998-04-23', '1998-04-17', 3, 242.9500, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11013, 'P001', 'ROMEY', 2, '1998-04-09', '1998-05-07', '1998-04-10', 1, 32.9900, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11014, 'P001', 'LINOD', 2, '1998-04-10', '1998-05-08', '1998-04-15', 3, 23.6000, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11015, 'P001', 'SANTG', 2, '1998-04-10', '1998-04-24', '1998-04-20', 2, 4.6200, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11016, 'P001', 'AROUT', 9, '1998-04-10', '1998-05-08', '1998-04-13', 2, 33.8000, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11017, 'P001', 'ERNSH', 9, '1998-04-13', '1998-05-11', '1998-04-20', 2, 754.2600, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11018, 'P001', 'LONEP', 4, '1998-04-13', '1998-05-11', '1998-04-16', 2, 11.6500, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11019, 'P001', 'RANCH', 6, '1998-04-13', '1998-05-11', '1998-06-03', 3, 3.1700, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11020, 'P001', 'OTTIK', 2, '1998-04-14', '1998-05-12', '1998-04-16', 2, 43.3000, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11021, 'P001', 'QUICK', 3, '1998-04-14', '1998-05-12', '1998-04-21', 1, 297.1800, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11022, 'P001', 'HANAR', 9, '1998-04-14', '1998-05-12', '1998-05-04', 2, 6.2700, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11023, 'P001', 'BSBEV', 1, '1998-04-14', '1998-04-28', '1998-04-24', 2, 123.8300, 'B\'s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11024, 'P001', 'EASTC', 4, '1998-04-15', '1998-05-13', '1998-04-20', 1, 74.3600, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11025, 'P001', 'WARTH', 6, '1998-04-15', '1998-05-13', '1998-04-24', 3, 29.1700, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11026, 'P001', 'FRANS', 4, '1998-04-15', '1998-05-13', '1998-04-28', 1, 47.0900, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11027, 'P001', 'BOTTM', 1, '1998-04-16', '1998-05-14', '1998-04-20', 1, 52.5200, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11028, 'P001', 'KOENE', 2, '1998-04-16', '1998-05-14', '1998-04-22', 1, 29.5900, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11029, 'P001', 'CHOPS', 4, '1998-04-16', '1998-05-14', '1998-04-27', 1, 47.8400, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11030, 'P001', 'SAVEA', 7, '1998-04-17', '1998-05-15', '1998-04-27', 2, 830.7500, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11031, 'P001', 'SAVEA', 6, '1998-04-17', '1998-05-15', '1998-04-24', 2, 227.2200, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11032, 'P001', 'WHITC', 2, '1998-04-17', '1998-05-15', '1998-04-23', 3, 606.1900, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11033, 'P001', 'RICSU', 7, '1998-04-17', '1998-05-15', '1998-04-23', 3, 84.7400, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11034, 'P001', 'OLDWO', 8, '1998-04-20', '1998-06-01', '1998-04-27', 1, 40.3200, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11035, 'P001', 'SUPRD', 2, '1998-04-20', '1998-05-18', '1998-04-24', 2, 0.1700, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11036, 'P001', 'DRACD', 8, '1998-04-20', '1998-05-18', '1998-04-22', 3, 149.4700, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11037, 'P001', 'GODOS', 7, '1998-04-21', '1998-05-19', '1998-04-27', 1, 3.2000, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11038, 'P001', 'SUPRD', 1, '1998-04-21', '1998-05-19', '1998-04-30', 2, 29.5900, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11039, 'P001', 'LINOD', 1, '1998-04-21', '1998-05-19', '1998-06-03', 2, 65.0000, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11040, 'P001', 'GREAL', 4, '1998-04-22', '1998-05-20', '1998-06-03', 3, 18.8400, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11041, 'P001', 'CHOPS', 3, '1998-04-22', '1998-05-20', '1998-04-28', 2, 48.2200, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11042, 'P001', 'COMMI', 2, '1998-04-22', '1998-05-06', '1998-05-01', 1, 29.9900, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11043, 'P001', 'SPECD', 5, '1998-04-22', '1998-05-20', '1998-04-29', 2, 8.8000, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11044, 'P001', 'WOLZA', 4, '1998-04-23', '1998-05-21', '1998-05-01', 1, 8.7200, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11045, 'P001', 'BOTTM', 6, '1998-04-23', '1998-05-21', '1998-06-03', 2, 70.5800, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11046, 'P001', 'WANDK', 8, '1998-04-23', '1998-05-21', '1998-04-24', 2, 71.6400, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11047, 'P001', 'EASTC', 7, '1998-04-24', '1998-05-22', '1998-05-01', 3, 46.6200, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11048, 'P001', 'BOTTM', 7, '1998-04-24', '1998-05-22', '1998-04-30', 3, 24.1200, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11049, 'P001', 'GOURL', 3, '1998-04-24', '1998-05-22', '1998-05-04', 1, 8.3400, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11050, 'P001', 'FOLKO', 8, '1998-04-27', '1998-05-25', '1998-05-05', 2, 59.4100, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', 'created', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11051, 'P001', 'LAMAI', 7, '1998-04-27', '1998-05-25', '1998-06-03', 3, 2.7900, 'La maison d\'Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11052, 'P001', 'HANAR', 3, '1998-04-27', '1998-05-25', '1998-05-01', 1, 67.2600, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11053, 'P001', 'PICCO', 2, '1998-04-27', '1998-05-25', '1998-04-29', 2, 53.0500, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11054, 'P001', 'CACTU', 8, '1998-04-28', '1998-05-26', '1998-06-03', 1, 0.3300, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11055, 'P001', 'HILAA', 7, '1998-04-28', '1998-05-26', '1998-05-05', 2, 120.9200, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11056, 'P001', 'EASTC', 8, '1998-04-28', '1998-05-12', '1998-05-01', 2, 278.9600, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11057, 'P001', 'NORTS', 3, '1998-04-29', '1998-05-27', '1998-05-01', 3, 4.1300, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11058, 'P001', 'BLAUS', 9, '1998-04-29', '1998-05-27', '1998-06-03', 3, 31.1400, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11059, 'P001', 'RICAR', 2, '1998-04-29', '1998-06-10', '1998-06-03', 2, 85.8000, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11060, 'P001', 'FRANS', 2, '1998-04-30', '1998-05-28', '1998-05-04', 2, 10.9800, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11061, 'P001', 'GREAL', 4, '1998-04-30', '1998-06-11', '1998-06-03', 3, 14.0100, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11062, 'P001', 'REGGC', 4, '1998-04-30', '1998-05-28', '1998-06-03', 2, 29.9300, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11063, 'P001', 'HUNGO', 3, '1998-04-30', '1998-05-28', '1998-05-06', 2, 81.7300, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11064, 'P001', 'SAVEA', 1, '1998-05-01', '1998-05-29', '1998-05-04', 1, 30.0900, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11065, 'P001', 'LILAS', 8, '1998-05-01', '1998-05-29', '1998-06-03', 1, 12.9100, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11066, 'P001', 'WHITC', 7, '1998-05-01', '1998-05-29', '1998-05-04', 2, 44.7200, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11067, 'P001', 'DRACD', 1, '1998-05-04', '1998-05-18', '1998-05-06', 2, 7.9800, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11068, 'P001', 'QUEEN', 8, '1998-05-04', '1998-06-01', '1998-06-03', 2, 81.7500, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11069, 'P001', 'TORTU', 1, '1998-05-04', '1998-06-01', '1998-05-06', 2, 15.6700, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11070, 'P001', 'LEHMS', 2, '1998-05-05', '1998-06-02', '1998-06-03', 1, 136.0000, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11071, 'P001', 'LILAS', 1, '1998-05-05', '1998-06-02', '1998-06-03', 1, 0.9300, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11072, 'P001', 'ERNSH', 4, '1998-05-05', '1998-06-02', '1998-06-03', 2, 258.6400, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11073, 'P001', 'PERIC', 2, '1998-05-05', '1998-06-02', '1998-06-03', 2, 24.9500, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11074, 'P001', 'SIMOB', 7, '1998-05-06', '1998-06-03', '1998-06-03', 2, 18.4400, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11075, 'P001', 'RICSU', 8, '1998-05-06', '1998-06-03', '1998-06-03', 2, 6.1900, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11076, 'P001', 'BONAP', 4, '1998-05-06', '1998-06-03', '1998-06-03', 2, 38.2800, 'Bon app\'', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', 'cancelled', NULL, NULL, NULL, NULL);
INSERT INTO `tr_orders` VALUES (11077, 'P001', 'RATTC', 1, '1998-05-06', '1998-06-03', '1998-06-03', 2, 8.5300, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', 'cancelled', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'rahmat', 'rahmat198@gmail.com', '0000-00-00 00:00:00', '$2y$10$sPcE69T5q7F8CT190j.gCel8whw7Q8P8RkBeMW8ifMavtxUe1oSGW', '9wj6wjAZOzhBNHeMgwO9eDTQE80QnPNjOVTyngmncokQl5zKCnwJ5HmD1qZJ', NULL, NULL, 1);
INSERT INTO `users` VALUES (2, 'hardian', 'hardian@gmail.com', NULL, '$2y$10$sPcE69T5q7F8CT190j.gCel8whw7Q8P8RkBeMW8ifMavtxUe1oSGW', NULL, NULL, NULL, 2);
INSERT INTO `users` VALUES (3, 'ali', 'ali@gmail.com', NULL, '$2y$10$sPcE69T5q7F8CT190j.gCel8whw7Q8P8RkBeMW8ifMavtxUe1oSGW', NULL, NULL, NULL, 3);
INSERT INTO `users` VALUES (4, 'Azka Salman', 'azka198@gmail.com', NULL, '$2y$10$uZjYCYfPgJQjzEIqOSiCBu5G6i7ytGzd9.oBTqSbl5b/Mxzo4o4ei', NULL, '2022-12-01 06:18:17', '2022-12-01 06:18:17', 2);

-- ----------------------------
-- Table structure for users_privileges
-- ----------------------------
DROP TABLE IF EXISTS `users_privileges`;
CREATE TABLE `users_privileges`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_privileges
-- ----------------------------
INSERT INTO `users_privileges` VALUES (1, 'C', 'Create', NULL, NULL, NULL, NULL);
INSERT INTO `users_privileges` VALUES (2, 'R', 'Read', NULL, NULL, NULL, NULL);
INSERT INTO `users_privileges` VALUES (3, 'U', 'Update', NULL, NULL, NULL, NULL);
INSERT INTO `users_privileges` VALUES (4, 'D', 'Delete', NULL, NULL, NULL, NULL);
INSERT INTO `users_privileges` VALUES (5, 'B', 'Bulk Update', NULL, NULL, NULL, NULL);
INSERT INTO `users_privileges` VALUES (6, 'O', 'Clone', NULL, NULL, NULL, NULL);
INSERT INTO `users_privileges` VALUES (7, 'X', 'Export', NULL, NULL, NULL, NULL);
INSERT INTO `users_privileges` VALUES (8, 'SH', 'Show Hide Columns', NULL, NULL, NULL, NULL);
INSERT INTO `users_privileges` VALUES (9, 'I', 'Import', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users_tabs
-- ----------------------------
DROP TABLE IF EXISTS `users_tabs`;
CREATE TABLE `users_tabs`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `privileges` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_menu_priv_unique_key`(`menu_id`, `role_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_tabs
-- ----------------------------
INSERT INTO `users_tabs` VALUES (1, 8, 1, 'C,R,U,D,B', '2022-11-03 14:10:08', 'administrator', NULL, '');
INSERT INTO `users_tabs` VALUES (2, 9, 1, 'C,R,U,D,B', '2022-11-03 14:10:38', 'administrator', NULL, '');
INSERT INTO `users_tabs` VALUES (3, 10, 1, 'C,R,U,D,B', '2022-11-03 14:10:54', 'administrator', NULL, '');
INSERT INTO `users_tabs` VALUES (4, 11, 1, 'C,R,U,D,B', '2022-11-03 14:11:13', 'administrator', NULL, '');
INSERT INTO `users_tabs` VALUES (5, 12, 1, 'C,R,U,D,B', '2022-11-03 14:11:34', 'administrator', NULL, '');
INSERT INTO `users_tabs` VALUES (6, 13, 1, 'C,R,U,D,B', '2022-11-03 14:13:52', 'administrator', NULL, '');
INSERT INTO `users_tabs` VALUES (7, 12, 2, 'R,U', NULL, 'administrator', NULL, NULL);
INSERT INTO `users_tabs` VALUES (8, 13, 2, 'R,U', NULL, 'administrator', NULL, NULL);
INSERT INTO `users_tabs` VALUES (9, 17, 1, 'U,D', '2022-12-19 09:18:46', 'adminsitrator', NULL, NULL);
INSERT INTO `users_tabs` VALUES (10, 17, 2, 'U', '2022-12-19 09:19:11', 'administrator', NULL, NULL);
INSERT INTO `users_tabs` VALUES (11, 18, 1, 'C,R,U,D,B', '2022-12-19 09:19:11', 'administrator', NULL, NULL);
INSERT INTO `users_tabs` VALUES (12, 18, 2, 'C,R,U,D,B', '2022-12-19 09:19:11', 'administrator', NULL, NULL);

-- ----------------------------
-- View structure for v_main_orders
-- ----------------------------
DROP VIEW IF EXISTS `v_main_orders`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_main_orders` AS SELECT
	tr_orders.id,
	tr_orders.project_code, 
	mst_customers.id as customer_id,
	mst_customers.company_name as customer, 
	tr_orders.order_date, 
	mst_employees.id as employee_id,
	mst_employees.last_name as handle_by, 
	mst_shippers.company_name as shipper, 
	tr_orders.required_date, 
	tr_orders.shipped_date, 
	tr_orders.freight, 
	tr_orders.ship_country as country, 
	tr_orders.`status`
FROM
	tr_orders
	INNER JOIN
	mst_employees
	ON 
		tr_orders.employee_id = mst_employees.id
	INNER JOIN
	mst_customers
	ON 
		tr_orders.customer_id = mst_customers.id
	INNER JOIN
	mst_shippers
	ON 
		tr_orders.ship_via = mst_shippers.id ;

-- ----------------------------
-- View structure for v_main_order_details
-- ----------------------------
DROP VIEW IF EXISTS `v_main_order_details`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_main_order_details` AS SELECT
	tr_order_details.id, 
	tr_order_details.project_code, 
	tr_order_details.order_id, 
	tr_order_details.unit_price, 
	tr_order_details.quantity, 
	mst_products.id as product_id,
	mst_products.product_name, 
	mst_categories.category_name, 
	mst_suppliers.id as supplier_id,
	mst_suppliers.company_name as supplier
FROM
	tr_order_details
	INNER JOIN
	mst_products
	ON 
		tr_order_details.product_id = mst_products.id
	INNER JOIN
	mst_suppliers
	ON 
		mst_products.supplier_id = mst_suppliers.id
	INNER JOIN
	mst_categories
	ON 
		mst_products.category_id = mst_categories.id ;

-- ----------------------------
-- View structure for v_order_summary_by_country
-- ----------------------------
DROP VIEW IF EXISTS `v_order_summary_by_country`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_order_summary_by_country` AS SELECT tr_orders.project_code, tr_orders.ship_country,
		SUM( CASE	WHEN ( tr_orders.`status` = 'created' ) THEN 1 ELSE 0 END ) AS Created,
		SUM( CASE	WHEN ( tr_orders.`status` = 'in progress' ) THEN 1 ELSE 0 END ) AS Progress,
		SUM( CASE	WHEN ( tr_orders.`status` = 'completed' ) THEN 1 ELSE 0 END ) AS Completed,
		SUM( CASE	WHEN ( tr_orders.`status` = 'cancelled' ) THEN 1 ELSE 0 END ) AS Cancelled
FROM tr_orders
GROUP BY tr_orders.project_code, tr_orders.ship_country ;

-- ----------------------------
-- View structure for v_order_summary_by_employee
-- ----------------------------
DROP VIEW IF EXISTS `v_order_summary_by_employee`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_order_summary_by_employee` AS SELECT tr_orders.project_code, tr_orders.employee_id, mst_employees.last_name,
		SUM( CASE	WHEN ( tr_orders.`status` = 'created' ) THEN 1 ELSE 0 END ) AS Created,
		SUM( CASE	WHEN ( tr_orders.`status` = 'in progress' ) THEN 1 ELSE 0 END ) AS Progress,
		SUM( CASE	WHEN ( tr_orders.`status` = 'completed' ) THEN 1 ELSE 0 END ) AS Completed,
		SUM( CASE	WHEN ( tr_orders.`status` = 'cancelled' ) THEN 1 ELSE 0 END ) AS Cancelled
FROM tr_orders, mst_employees
WHERE tr_orders.employee_id = mst_employees.id
GROUP BY tr_orders.project_code, tr_orders.employee_id, mst_employees.last_name ;

-- ----------------------------
-- View structure for v_order_summary_by_shipper
-- ----------------------------
DROP VIEW IF EXISTS `v_order_summary_by_shipper`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_order_summary_by_shipper` AS SELECT tr_orders.project_code, tr_orders.ship_via, mst_shippers.company_name,
		SUM( CASE	WHEN ( tr_orders.`status` = 'created' ) THEN 1 ELSE 0 END ) AS Created,
		SUM( CASE	WHEN ( tr_orders.`status` = 'in progress' ) THEN 1 ELSE 0 END ) AS Progress,
		SUM( CASE	WHEN ( tr_orders.`status` = 'completed' ) THEN 1 ELSE 0 END ) AS Completed,
		SUM( CASE	WHEN ( tr_orders.`status` = 'cancelled' ) THEN 1 ELSE 0 END ) AS Cancelled
FROM tr_orders, mst_shippers
WHERE tr_orders.ship_via = mst_shippers.id
GROUP BY tr_orders.project_code, tr_orders.ship_via,mst_shippers.company_name ;

DROP VIEW IF EXISTS `v_products`;
CREATE VIEW `v_products` AS
SELECT p.id, p.project_code, p.product_name, p.supplier_id, s.company_name as supplier,
p.category_id, c.category_name as category, p.quantity_per_unit, p.unit_price, p.units_in_stock,
p.units_on_order, p.reorder_level, p.discontinued, p.img_path
FROM mst_products p, mst_suppliers s, mst_categories c
WHERE p.supplier_id = s.id AND p.category_id = c.id
ORDER BY p.id; 

SET FOREIGN_KEY_CHECKS = 1;
