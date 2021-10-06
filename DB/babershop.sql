/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : babershop

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 06/10/2021 23:36:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'PAKET NORMAL', NULL, NULL);
INSERT INTO `categories` VALUES (2, 'PAKET MEMBERSHIP', NULL, NULL);
INSERT INTO `categories` VALUES (3, 'PAKET PERSONAL', NULL, NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of locations
-- ----------------------------
INSERT INTO `locations` VALUES (1, 'PASTEUR, BANDUNG', '#f56954', NULL, NULL);
INSERT INTO `locations` VALUES (2, 'SUKAJADI, BANDUNG', '#00a65a', NULL, NULL);
INSERT INTO `locations` VALUES (3, 'CICENDO, BANDUNG', '#f39c12', NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2021_08_05_014834_laratrust_setup_tables', 1);
INSERT INTO `migrations` VALUES (5, '2021_08_05_044325_create_locations_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_08_05_130616_create_categories_table', 1);
INSERT INTO `migrations` VALUES (7, '2021_08_05_130948_create_services_table', 1);
INSERT INTO `migrations` VALUES (8, '2021_08_05_140657_create_orders_table', 1);
INSERT INTO `migrations` VALUES (9, '2021_08_05_140851_create_order_service_table', 1);
INSERT INTO `migrations` VALUES (10, '2021_08_11_020746_create_payments_table', 1);
INSERT INTO `migrations` VALUES (11, '2021_09_01_144037_create_times_table', 1);

-- ----------------------------
-- Table structure for order_service
-- ----------------------------
DROP TABLE IF EXISTS `order_service`;
CREATE TABLE `order_service`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_service_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `order_service_service_id_foreign`(`service_id`) USING BTREE,
  CONSTRAINT `order_service_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_service
-- ----------------------------
INSERT INTO `order_service` VALUES (1, 1, 1, 1, 40, '2021-10-03 16:04:43', '2021-10-03 16:04:43');
INSERT INTO `order_service` VALUES (3, 3, 5, 1, 35, '2021-10-03 17:31:54', '2021-10-03 17:31:54');
INSERT INTO `order_service` VALUES (4, 3, 2, 1, 50, NULL, NULL);
INSERT INTO `order_service` VALUES (5, 4, 1, 1, 40, '2021-10-03 22:36:16', '2021-10-03 22:36:16');
INSERT INTO `order_service` VALUES (6, 5, 1, 1, 40, '2021-10-03 23:15:08', '2021-10-03 23:15:08');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NULL DEFAULT NULL,
  `time_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `net` int(11) NOT NULL,
  `gross` int(11) NOT NULL,
  `lunas` enum('Order','Payment','Approved') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Order',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'KODE1633251883', 5, 3, 1, 1, '2021-10-04', 16, 40, 40, 'Approved', NULL, NULL, '2021-10-03 16:04:43', '2021-10-03 16:06:17');
INSERT INTO `orders` VALUES (3, 'KODE1633257114', 6, 3, 2, 1, '2021-10-03', 15, 40, 40, 'Approved', 'Oke1', NULL, '2021-10-03 17:31:54', '2021-10-03 17:32:29');
INSERT INTO `orders` VALUES (4, 'KODE1633275376', 7, 3, 1, 1, '2021-10-04', NULL, 40, 40, 'Approved', NULL, NULL, '2021-10-03 22:36:16', '2021-10-03 22:37:00');
INSERT INTO `orders` VALUES (5, 'KODE1633277708', 8, 3, 1, 1, '2021-10-03', NULL, 40, 40, 'Approved', NULL, NULL, '2021-10-03 23:15:08', '2021-10-03 23:15:08');

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
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cabang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `an` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `norek` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES (1, 'Cast', NULL, NULL, NULL, NULL, '2021-10-03 19:05:15');
INSERT INTO `payments` VALUES (2, 'BNI', 'Cimahi', 'Bro', '987654321', NULL, NULL);
INSERT INTO `payments` VALUES (3, 'Mandiri', 'Kab. Bandung', 'Bam', '735327357234', NULL, NULL);

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (1, 1);
INSERT INTO `permission_role` VALUES (2, 1);
INSERT INTO `permission_role` VALUES (3, 1);
INSERT INTO `permission_role` VALUES (4, 1);
INSERT INTO `permission_role` VALUES (5, 1);
INSERT INTO `permission_role` VALUES (6, 1);
INSERT INTO `permission_role` VALUES (7, 1);
INSERT INTO `permission_role` VALUES (8, 1);
INSERT INTO `permission_role` VALUES (9, 1);
INSERT INTO `permission_role` VALUES (10, 1);
INSERT INTO `permission_role` VALUES (11, 1);
INSERT INTO `permission_role` VALUES (12, 1);
INSERT INTO `permission_role` VALUES (13, 1);
INSERT INTO `permission_role` VALUES (14, 1);
INSERT INTO `permission_role` VALUES (15, 1);
INSERT INTO `permission_role` VALUES (16, 1);
INSERT INTO `permission_role` VALUES (17, 1);
INSERT INTO `permission_role` VALUES (18, 1);
INSERT INTO `permission_role` VALUES (19, 1);
INSERT INTO `permission_role` VALUES (20, 1);
INSERT INTO `permission_role` VALUES (21, 1);
INSERT INTO `permission_role` VALUES (22, 1);
INSERT INTO `permission_role` VALUES (1, 2);
INSERT INTO `permission_role` VALUES (2, 2);
INSERT INTO `permission_role` VALUES (3, 2);
INSERT INTO `permission_role` VALUES (4, 2);
INSERT INTO `permission_role` VALUES (5, 2);
INSERT INTO `permission_role` VALUES (6, 2);
INSERT INTO `permission_role` VALUES (7, 2);
INSERT INTO `permission_role` VALUES (8, 2);
INSERT INTO `permission_role` VALUES (9, 2);
INSERT INTO `permission_role` VALUES (10, 2);
INSERT INTO `permission_role` VALUES (11, 2);
INSERT INTO `permission_role` VALUES (12, 2);
INSERT INTO `permission_role` VALUES (13, 2);
INSERT INTO `permission_role` VALUES (14, 2);
INSERT INTO `permission_role` VALUES (15, 2);
INSERT INTO `permission_role` VALUES (16, 2);
INSERT INTO `permission_role` VALUES (17, 2);
INSERT INTO `permission_role` VALUES (18, 2);
INSERT INTO `permission_role` VALUES (19, 2);
INSERT INTO `permission_role` VALUES (20, 2);
INSERT INTO `permission_role` VALUES (21, 2);
INSERT INTO `permission_role` VALUES (22, 2);
INSERT INTO `permission_role` VALUES (5, 3);
INSERT INTO `permission_role` VALUES (6, 3);
INSERT INTO `permission_role` VALUES (7, 3);
INSERT INTO `permission_role` VALUES (8, 3);
INSERT INTO `permission_role` VALUES (9, 3);
INSERT INTO `permission_role` VALUES (10, 3);
INSERT INTO `permission_role` VALUES (5, 4);
INSERT INTO `permission_role` VALUES (6, 4);
INSERT INTO `permission_role` VALUES (7, 4);
INSERT INTO `permission_role` VALUES (8, 4);

-- ----------------------------
-- Table structure for permission_user
-- ----------------------------
DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`, `permission_id`, `user_type`) USING BTREE,
  INDEX `permission_user_permission_id_foreign`(`permission_id`) USING BTREE,
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_user
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'users-create', 'Create Users', 'Create Users', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (2, 'users-read', 'Read Users', 'Read Users', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (3, 'users-update', 'Update Users', 'Update Users', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (4, 'users-delete', 'Delete Users', 'Delete Users', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (5, 'order-create', 'Create Order', 'Create Order', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (6, 'order-read', 'Read Order', 'Read Order', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (7, 'order-update', 'Update Order', 'Update Order', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (8, 'order-delete', 'Delete Order', 'Delete Order', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (9, 'profile-read', 'Read Profile', 'Read Profile', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (10, 'profile-update', 'Update Profile', 'Update Profile', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (11, 'location-create', 'Create Location', 'Create Location', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (12, 'location-read', 'Read Location', 'Read Location', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (13, 'location-update', 'Update Location', 'Update Location', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (14, 'location-delete', 'Delete Location', 'Delete Location', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (15, 'category-create', 'Create Category', 'Create Category', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (16, 'category-read', 'Read Category', 'Read Category', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (17, 'category-update', 'Update Category', 'Update Category', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (18, 'category-delete', 'Delete Category', 'Delete Category', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (19, 'service-create', 'Create Service', 'Create Service', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (20, 'service-read', 'Read Service', 'Read Service', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (21, 'service-update', 'Update Service', 'Update Service', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `permissions` VALUES (22, 'service-delete', 'Delete Service', 'Delete Service', '2021-10-03 15:10:38', '2021-10-03 15:10:38');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user`  (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`, `user_type`) USING BTREE,
  INDEX `role_user_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES (1, 1, 'App\\Models\\User');
INSERT INTO `role_user` VALUES (2, 2, 'App\\Models\\User');
INSERT INTO `role_user` VALUES (3, 3, 'App\\Models\\User');
INSERT INTO `role_user` VALUES (4, 4, 'App\\Models\\User');
INSERT INTO `role_user` VALUES (4, 5, 'App\\Models\\User');
INSERT INTO `role_user` VALUES (4, 6, 'App\\Models\\User');
INSERT INTO `role_user` VALUES (4, 7, 'App\\Models\\User');
INSERT INTO `role_user` VALUES (4, 8, 'App\\Models\\User');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'superadmin', 'Superadmin', 'Superadmin', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `roles` VALUES (2, 'owner', 'Owner', 'Owner', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `roles` VALUES (3, 'staff', 'Staff', 'Staff', '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `roles` VALUES (4, 'customer', 'Customer', 'Customer', '2021-10-03 15:10:38', '2021-10-03 15:10:38');

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `time` enum('Hr','mins') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES (1, 1, 'FAST HAIRCUT', 1, 'Hr', 40, 'HAIRCUT, STYLING, HAIRTONIC/POMADE', NULL, NULL);
INSERT INTO `services` VALUES (2, 1, 'BASIC HAIRCUT', 20, 'mins', 50, 'HAIRCUT, WASHING, MASSAGE', NULL, NULL);
INSERT INTO `services` VALUES (3, 1, 'SIGNATURE HAIRCUT', 30, 'mins', 70, 'HAIRCUT, WASHING, MASSAGE', NULL, NULL);
INSERT INTO `services` VALUES (4, 2, 'FATHER & SON', 1, 'Hr', 80, 'POTONG RAMBUT, KERAMAS, MASSAGE', NULL, NULL);
INSERT INTO `services` VALUES (5, 2, 'STUDENT SERVICE', 20, 'mins', 35, NULL, NULL, NULL);
INSERT INTO `services` VALUES (6, 3, 'CUKURAN DI RUMAH', 30, 'mins', 60, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for times
-- ----------------------------
DROP TABLE IF EXISTS `times`;
CREATE TABLE `times`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of times
-- ----------------------------
INSERT INTO `times` VALUES (1, '04.00', NULL, NULL);
INSERT INTO `times` VALUES (2, '04.30', NULL, NULL);
INSERT INTO `times` VALUES (3, '05.00', NULL, NULL);
INSERT INTO `times` VALUES (4, '05.30', NULL, NULL);
INSERT INTO `times` VALUES (5, '06.00', NULL, NULL);
INSERT INTO `times` VALUES (6, '06.30', NULL, NULL);
INSERT INTO `times` VALUES (7, '07.00', NULL, NULL);
INSERT INTO `times` VALUES (8, '06.30', NULL, NULL);
INSERT INTO `times` VALUES (9, '07.00', NULL, NULL);
INSERT INTO `times` VALUES (10, '07.30', NULL, NULL);
INSERT INTO `times` VALUES (11, '08.00', NULL, NULL);
INSERT INTO `times` VALUES (12, '08.30', NULL, NULL);
INSERT INTO `times` VALUES (13, '09.00', NULL, NULL);
INSERT INTO `times` VALUES (14, '09.30', NULL, NULL);
INSERT INTO `times` VALUES (15, '10.00', NULL, NULL);
INSERT INTO `times` VALUES (16, '10.30', NULL, NULL);
INSERT INTO `times` VALUES (17, '11.00', NULL, NULL);
INSERT INTO `times` VALUES (18, '11.30', NULL, NULL);
INSERT INTO `times` VALUES (19, '12.00', NULL, NULL);
INSERT INTO `times` VALUES (20, '12.30', NULL, NULL);
INSERT INTO `times` VALUES (21, '13.00', NULL, NULL);
INSERT INTO `times` VALUES (22, '13.30', NULL, NULL);
INSERT INTO `times` VALUES (23, '14.00', NULL, NULL);
INSERT INTO `times` VALUES (24, '14.30', NULL, NULL);
INSERT INTO `times` VALUES (25, '15.00', NULL, NULL);
INSERT INTO `times` VALUES (26, '15.30', NULL, NULL);
INSERT INTO `times` VALUES (27, '16.00', NULL, NULL);
INSERT INTO `times` VALUES (28, '16.30', NULL, NULL);
INSERT INTO `times` VALUES (29, '17.00', NULL, NULL);
INSERT INTO `times` VALUES (30, '17.30', NULL, NULL);
INSERT INTO `times` VALUES (31, '18.00', NULL, NULL);
INSERT INTO `times` VALUES (32, '18.30', NULL, NULL);
INSERT INTO `times` VALUES (33, '19.00', NULL, NULL);
INSERT INTO `times` VALUES (34, '19.30', NULL, NULL);
INSERT INTO `times` VALUES (35, '20.00', NULL, NULL);
INSERT INTO `times` VALUES (36, '20.30', NULL, NULL);
INSERT INTO `times` VALUES (37, '21.00', NULL, NULL);
INSERT INTO `times` VALUES (38, '21.30', NULL, NULL);
INSERT INTO `times` VALUES (39, '22.00', NULL, NULL);
INSERT INTO `times` VALUES (40, '22.30', NULL, NULL);
INSERT INTO `times` VALUES (41, '23.00', NULL, NULL);
INSERT INTO `times` VALUES (42, '23.30', NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'anonim',
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'anonim',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'Jember',
  `order` int(11) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'Superadmin', 'Superadmin', 'superadmin@gmail.com', '08134567890', 'Jl. superadmin', 1, NULL, '$2y$10$oSAd1VqeB92gpevylh8U..H.BifQLjaEztN.1M3apoEitcYgK0dhm', NULL, '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `users` VALUES (2, 1, 'Owner', 'Owner', 'owner@gmail.com', '08134567890', 'Jl. owner', 2, NULL, '$2y$10$2D7vPerzWPmwngDnjGIDSuEkQ3blOTubFMsN1UVG8GCTar9WX/bYu', NULL, '2021-10-03 15:10:38', '2021-10-03 16:08:52');
INSERT INTO `users` VALUES (3, 1, 'Staff', 'Staff', 'staff@gmail.com', '08134567890', 'Jl. staff', 1, NULL, '$2y$10$MEkgeWGJf41VFw/gFNGDMel4xnBguz8YR33CsOdkTVVn/Di3FAvFG', NULL, '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `users` VALUES (4, 1, 'Customer', 'Customer', 'customer@gmail.com', '08134567890', 'Jl. customer', 1, NULL, '$2y$10$lh3VnWHMC0GqvEU1PrNFB.45eXhnz8kMR6wnsqR0v70CIgENuZjYm', NULL, '2021-10-03 15:10:38', '2021-10-03 15:10:38');
INSERT INTO `users` VALUES (5, 1, 'febri', 'nq', 'email@gmail.com', '081216627447', 'situbodno', 1, NULL, '$2y$10$7CLKBnZ1CQnnocSzxS6oSOGi/GxDOkumx2cM/mZs3HpptmYbCLfcm', NULL, '2021-10-03 16:04:43', '2021-10-03 16:04:43');
INSERT INTO `users` VALUES (6, 2, 'febri1', 'nq1', 'mohfebrinq@gmail.com', '081216627441', 'Situbodno1', 1, NULL, '$2y$10$zjgEzFc2K4OjHBP61nTPZuca12L02vqw7wP2IMon1Gvy9OuXZc2oy', NULL, '2021-10-03 17:31:54', '2021-10-03 17:32:29');
INSERT INTO `users` VALUES (7, 1, 'febri', 'lala', 'yugo@gmail.com', '081216627447', 'Jember', 1, NULL, '$2y$10$.NYtVkBld1.VI.fwRtMabefmm9qndk/TVSPFTbuQm4FGYTo1lQzbe', NULL, '2021-10-03 22:36:16', '2021-10-03 23:27:51');
INSERT INTO `users` VALUES (8, 1, 'Anonim', NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$rahNdvU4iBK.IbV1kKqWh..d/NmlTdNkvM3QhWUBF1e3J9CwWNR/i', NULL, '2021-10-03 23:15:08', '2021-10-04 00:27:49');

SET FOREIGN_KEY_CHECKS = 1;
