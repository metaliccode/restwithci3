/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100420
 Source Host           : localhost:3306
 Source Schema         : dbtraining

 Target Server Type    : MySQL
 Target Server Version : 100420
 File Encoding         : 65001

 Date: 16/07/2021 15:11:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `productprice` decimal(10, 0) NULL DEFAULT NULL,
  `productimage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (11, 'Macbook Pro 2020', 35000000, 'mbprom1.jpg');
INSERT INTO `products` VALUES (12, 'Iphone 12 Pro Max', 23500000, 'iphone12.jpg');
INSERT INTO `products` VALUES (13, 'Apple AirPod Gen 1', 2350000, 'airpod3.jpg');
INSERT INTO `products` VALUES (14, 'Samsung S-20', 19500000, 'samsungs20.jpg');
INSERT INTO `products` VALUES (16, 'Apple Magic Mouse', 1200000, 'magicmouse.jpg');
INSERT INTO `products` VALUES (17, 'iMac CTO 2020', 76500000, 'imac.jpg');
INSERT INTO `products` VALUES (19, 'Apple Watch gen 4 Nike', 6850000, 'applewatch.jpg');
INSERT INTO `products` VALUES (30, 'Power Bank 10000Mah', 350000, 'Power_Bank_10000Mah.jpg');
INSERT INTO `products` VALUES (31, 'Magsafe iPhone 12', 850000, 'a50fdd661d5969615988f07bb3fb3a14.jpg');
INSERT INTO `products` VALUES (32, 'iPhone XS 64gb', 7850000, '318683581472ef5ac3e3032336f0f9b9.jpg');
INSERT INTO `products` VALUES (33, 'kabel data usb c', 25000, 'ea6958e0e64ab8d3a5e7b9be07643f5f.jpg');
INSERT INTO `products` VALUES (34, 'Monitor LCD LG 19 inch', 750000, '2e058c5a01b7ececf2fea3c5972be4d4.jpg');
INSERT INTO `products` VALUES (35, 'Meja belajar', 500000, 'f0d6292400d36da2c2f91edd50132fce.jpg');
INSERT INTO `products` VALUES (36, 'Nametag Pegawai', 4000, 'applewatch.jpg');
INSERT INTO `products` VALUES (37, 'Kabel Jack Audio', 100000, 'applewatch.jpg');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'adhimas', '$2y$10$T7c7bKIkONrYArDn0u9VH.PZmlRXpFeX0y/FXROrx0RyfcAochl1a', 'Adhimas Wisnuyudo');
INSERT INTO `users` VALUES (2, 'admin', '$2y$10$T7c7bKIkONrYArDn0u9VH.PZmlRXpFeX0y/FXROrx0RyfcAochl1a', 'Admin Utama');

SET FOREIGN_KEY_CHECKS = 1;
