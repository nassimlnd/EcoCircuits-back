/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : circuits_courts

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2023-05-02 15:13:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `commandes`
-- ----------------------------
DROP TABLE IF EXISTS `commandes`;
CREATE TABLE `commandes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_producteur` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of commandes
-- ----------------------------
INSERT INTO `commandes` VALUES ('1', '1', '1');
