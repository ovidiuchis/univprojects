/*
Navicat MySQL Data Transfer

Source Server         : MysqlMeu
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : cobd0429

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2012-01-17 17:52:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `zboruri`
-- ----------------------------
DROP TABLE IF EXISTS `zboruri`;
CREATE TABLE `zboruri` (
  `idAvion` int(11) DEFAULT NULL,
  `idSursa` int(11) DEFAULT NULL,
  `idDestinatie` int(11) DEFAULT NULL,
  `durata` int(11) DEFAULT NULL,
  `legaturi` int(11) DEFAULT NULL,
  `compania` varchar(200) DEFAULT NULL,
  KEY `relAv` (`idAvion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zboruri
-- ----------------------------
