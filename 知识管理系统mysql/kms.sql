/*
 Navicat Premium Data Transfer

 Source Server         : mysqltest
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : kms

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 15/05/2021 11:43:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for knowledge
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge`  (
  `Kid` int(0) NOT NULL,
  `Kcategory` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `Ktitle` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `Kauthor` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `AddTime` datetime(0) NOT NULL,
  `Kcontent` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  PRIMARY KEY (`Kid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
INSERT INTO `knowledge` VALUES (1, '1', '1', '1', '2021-05-13 11:33:59', '就是那么帅');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userAccount` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `userPassword` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `userPrivilege` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  PRIMARY KEY (`userAccount`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', 'admin', 'computer');
INSERT INTO `users` VALUES ('root', 'root', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
