/*
 Navicat Premium Data Transfer

 Source Server         : local_mysql
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : majoo

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 08/12/2021 01:25:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for merchants
-- ----------------------------
DROP TABLE IF EXISTS `merchants`;
CREATE TABLE `merchants`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `merchant_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `merchants_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `merchants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchants
-- ----------------------------
INSERT INTO `merchants` VALUES (1, 1, 'merchant 1', 1, 1, NULL, NULL);
INSERT INTO `merchants` VALUES (2, 2, 'merchant 2', 2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2021_12_06_154039_add_column_username_to_users_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_12_06_155159_create_merchants_table', 1);
INSERT INTO `migrations` VALUES (7, '2021_12_06_155538_create_outlets_table', 1);
INSERT INTO `migrations` VALUES (8, '2021_12_06_155706_create_transactions_table', 1);

-- ----------------------------
-- Table structure for outlets
-- ----------------------------
DROP TABLE IF EXISTS `outlets`;
CREATE TABLE `outlets`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) UNSIGNED NOT NULL,
  `outlet_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `outlets_merchant_id_foreign`(`merchant_id`) USING BTREE,
  CONSTRAINT `outlets_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of outlets
-- ----------------------------
INSERT INTO `outlets` VALUES (1, 1, 'Outlet 1', 1, 1, NULL, NULL);
INSERT INTO `outlets` VALUES (2, 1, 'Outlet 2', 1, 1, NULL, NULL);
INSERT INTO `outlets` VALUES (3, 2, 'Outlet 1', 2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) UNSIGNED NOT NULL,
  `outlet_id` bigint(20) UNSIGNED NOT NULL,
  `bill_total` double NOT NULL DEFAULT 0,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transactions_merchant_id_foreign`(`merchant_id`) USING BTREE,
  INDEX `transactions_outlet_id_foreign`(`outlet_id`) USING BTREE,
  CONSTRAINT `transactions_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_outlet_id_foreign` FOREIGN KEY (`outlet_id`) REFERENCES `outlets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transactions
-- ----------------------------
INSERT INTO `transactions` VALUES (1, 1, 1, 2000, 1, 1, '2021-11-01 12:30:04', '2021-11-01 12:30:04');
INSERT INTO `transactions` VALUES (2, 1, 1, 2500, 1, 1, '2021-11-01 17:20:14', '2021-11-01 17:20:14');
INSERT INTO `transactions` VALUES (3, 1, 1, 4000, 1, 1, '2021-11-02 12:30:04', '2021-11-02 12:30:04');
INSERT INTO `transactions` VALUES (4, 1, 1, 1000, 1, 1, '2021-11-04 12:30:04', '2021-11-04 12:30:04');
INSERT INTO `transactions` VALUES (5, 1, 1, 7000, 1, 1, '2021-11-05 16:59:30', '2021-11-05 16:59:30');
INSERT INTO `transactions` VALUES (6, 1, 3, 2000, 1, 1, '2021-11-02 18:30:04', '2021-11-02 18:30:04');
INSERT INTO `transactions` VALUES (7, 1, 3, 2500, 1, 1, '2021-11-03 17:20:14', '2021-11-03 17:20:14');
INSERT INTO `transactions` VALUES (8, 1, 3, 4000, 1, 1, '2021-11-04 12:30:04', '2021-11-04 12:30:04');
INSERT INTO `transactions` VALUES (9, 1, 3, 1000, 1, 1, '2021-11-04 12:31:04', '2021-11-04 12:31:04');
INSERT INTO `transactions` VALUES (10, 1, 3, 7000, 1, 1, '2021-11-05 16:59:30', '2021-11-05 16:59:30');
INSERT INTO `transactions` VALUES (11, 2, 2, 2000, 2, 2, '2021-11-01 18:30:04', '2021-11-01 18:30:04');
INSERT INTO `transactions` VALUES (12, 2, 2, 2500, 2, 2, '2021-11-02 17:20:14', '2021-11-02 17:20:14');
INSERT INTO `transactions` VALUES (13, 2, 2, 4000, 2, 2, '2021-11-03 12:30:04', '2021-11-03 12:30:04');
INSERT INTO `transactions` VALUES (14, 2, 2, 1000, 2, 2, '2021-11-04 12:31:04', '2021-11-04 12:31:04');
INSERT INTO `transactions` VALUES (15, 2, 2, 7000, 2, 2, '2021-11-05 16:59:30', '2021-11-05 16:59:30');
INSERT INTO `transactions` VALUES (16, 2, 2, 2000, 2, 2, '2021-11-05 18:30:04', '2021-11-05 18:30:04');
INSERT INTO `transactions` VALUES (17, 2, 2, 2500, 2, 2, '2021-11-06 17:20:14', '2021-11-06 17:20:14');
INSERT INTO `transactions` VALUES (18, 2, 2, 4000, 2, 2, '2021-11-07 12:30:04', '2021-11-07 12:30:04');
INSERT INTO `transactions` VALUES (19, 2, 2, 1000, 2, 2, '2021-11-08 12:31:04', '2021-11-08 12:31:04');
INSERT INTO `transactions` VALUES (20, 2, 2, 7000, 2, 2, '2021-11-09 16:59:30', '2021-11-09 16:59:30');
INSERT INTO `transactions` VALUES (21, 2, 2, 1000, 2, 2, '2021-11-10 12:31:04', '2021-11-10 12:31:04');
INSERT INTO `transactions` VALUES (22, 2, 2, 7000, 2, 2, '2021-11-11 16:59:30', '2021-11-11 16:59:30');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `user_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin 1', NULL, NULL, '$2y$10$F/s7XYTv0d4HTJb4DRumVe07YrtnSkdip8dmEH/aCV5sUuXLZebGK', NULL, NULL, NULL, 'admin1', 1, 1);
INSERT INTO `users` VALUES (2, 'Admin 2', NULL, NULL, '$2y$10$I/weIGEOYHni7r/quA2M1uHegOpzEbRpVw2FQT2jPqczD97DcM19.', NULL, NULL, NULL, 'admin2', 2, 2);
INSERT INTO `users` VALUES (3, 'test', NULL, NULL, '$2y$10$VCoOYuk31JdjVWUxVervCu6ovGwrwE8DewWYjjyfos6G/CqwzUq4O', NULL, '2021-12-06 18:39:02', '2021-12-06 18:39:02', 'test', 3, 3);
INSERT INTO `users` VALUES (4, 'test2', NULL, NULL, '$2y$10$EC924PBfJiEqFJbTyKkkVenIxJhcqRQWoggAdy8ieDgnb8NjTmmj.', NULL, '2021-12-06 19:35:08', '2021-12-06 19:35:09', 'test2', 4, 4);

SET FOREIGN_KEY_CHECKS = 1;
