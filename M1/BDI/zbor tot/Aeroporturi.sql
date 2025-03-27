/*
Navicat MySQL Data Transfer

Source Server         : MysqlMeu
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : cobd0429

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2012-01-17 17:51:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `aeroporturi`
-- ----------------------------
DROP TABLE IF EXISTS `aeroporturi`;
CREATE TABLE `aeroporturi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oras` varchar(200) DEFAULT NULL,
  `descriere` varchar(400) DEFAULT NULL,
  `facilitati` varchar(500) DEFAULT NULL,
  `parcare` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aeroporturi
-- ----------------------------
