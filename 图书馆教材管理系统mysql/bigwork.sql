/*
 Navicat Premium Data Transfer

 Source Server         : mysqltest
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : bigwork

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 15/05/2021 10:33:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(0) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `amount` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `note` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'ASP.NET程序设计', '编程', '12', '12', NULL);
INSERT INTO `book` VALUES (2, 'JAVA程序开发设计', '编程', '54', '15', NULL);
INSERT INTO `book` VALUES (3, '鸟哥的私房菜', 'linux', '64', '15', NULL);
INSERT INTO `book` VALUES (4, '傲慢与偏见', '小说', '56', '12', NULL);

-- ----------------------------
-- Table structure for bookout
-- ----------------------------
DROP TABLE IF EXISTS `bookout`;
CREATE TABLE `bookout`  (
  `academy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `classid` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bookid` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bookname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `note` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookout
-- ----------------------------
INSERT INTO `bookout` VALUES ('软件', '182', '1', '小陈', '1', 'ASP.NET程序设计', NULL);
INSERT INTO `bookout` VALUES ('软件', '182', '2', '小明', '2', 'Java程序设计', NULL);

-- ----------------------------
-- Table structure for buy_msg
-- ----------------------------
DROP TABLE IF EXISTS `buy_msg`;
CREATE TABLE `buy_msg`  (
  `bookid` int(0) NOT NULL,
  `bookname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bookprice` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `booktype` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `amount` int(0) NULL DEFAULT NULL,
  `note` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bookid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buy_msg
-- ----------------------------
INSERT INTO `buy_msg` VALUES (1, 'ASP.NET程序设计', '12', '编程', 'root', 15, NULL);
INSERT INTO `buy_msg` VALUES (2, 'Java程序设计', '54', '编程', 'root', 15, NULL);
INSERT INTO `buy_msg` VALUES (3, '鸟哥的私房菜', '64', 'linux', 'root', 15, NULL);
INSERT INTO `buy_msg` VALUES (4, '傲慢与偏见', '56', '小说', 'root', 12, NULL);

-- ----------------------------
-- Table structure for mybook
-- ----------------------------
DROP TABLE IF EXISTS `mybook`;
CREATE TABLE `mybook`  (
  `id` int(0) NOT NULL,
  `bookname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `returndate` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mybook
-- ----------------------------
INSERT INTO `mybook` VALUES (2, 'Java程序设计', '2020-06-03', '2020-04-05');

-- ----------------------------
-- Table structure for std_msg
-- ----------------------------
DROP TABLE IF EXISTS `std_msg`;
CREATE TABLE `std_msg`  (
  `id` int(0) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `classid` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `academy` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bookid` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `note` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of std_msg
-- ----------------------------
INSERT INTO `std_msg` VALUES (1, 'i小陈长', '制造', '就是0', '0', '1');
INSERT INTO `std_msg` VALUES (2, '小明岩', '制造', '1', '1', '1');
INSERT INTO `std_msg` VALUES (3, '小明', '软件电气182', '软件学院', '1', NULL);
INSERT INTO `std_msg` VALUES (4, '小大', '软件资源182', '软件学院', NULL, NULL);

-- ----------------------------
-- Table structure for submit
-- ----------------------------
DROP TABLE IF EXISTS `submit`;
CREATE TABLE `submit`  (
  `id` int(0) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bookid` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bookname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `number` int(0) NULL DEFAULT NULL,
  `note` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of submit
-- ----------------------------
INSERT INTO `submit` VALUES (1, '2020-06-03', 'root', '1', 'asp.net程序开发', 14, NULL);
INSERT INTO `submit` VALUES (2, '2020-06-04', 'admin', '1', 'asp.net程序开发', 15, NULL);
INSERT INTO `submit` VALUES (3, '2020-06-07', 'root', '2', 'JAVA`', 16, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pwd` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('', '');
INSERT INTO `user` VALUES ('1567', 'root');
INSERT INTO `user` VALUES ('34343', '123');
INSERT INTO `user` VALUES ('456465', '465465');
INSERT INTO `user` VALUES ('admin', 'root');
INSERT INTO `user` VALUES ('chang', '123');
INSERT INTO `user` VALUES ('finnian', '123');
INSERT INTO `user` VALUES ('root', 'root');
INSERT INTO `user` VALUES ('xfn', 'root');
INSERT INTO `user` VALUES ('xfnn', '12333');
INSERT INTO `user` VALUES ('xxxx', '12344');
INSERT INTO `user` VALUES ('周', '1223');
INSERT INTO `user` VALUES ('要', '123');

SET FOREIGN_KEY_CHECKS = 1;
