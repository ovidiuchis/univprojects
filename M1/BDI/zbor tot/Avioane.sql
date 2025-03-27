/*
Navicat MySQL Data Transfer

Source Server         : MysqlMeu
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : cobd0429

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2012-01-17 17:52:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `avioane`
-- ----------------------------
DROP TABLE IF EXISTS `avioane`;
CREATE TABLE `avioane` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip` varchar(50) DEFAULT NULL,
  `capacitate` int(11) DEFAULT NULL,
  `urlpoza` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of avioane
-- ----------------------------
