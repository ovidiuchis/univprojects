/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : ce

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-05-29 18:33:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categorii
-- ----------------------------
DROP TABLE IF EXISTS `categorii`;
CREATE TABLE `categorii` (
  `denumire` varchar(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observatii` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categorii
-- ----------------------------
INSERT INTO `categorii` VALUES ('Smartphones', '1', 'Cele mai inteligente telefoane cu sisteme de operare precum Android sau iOS');
INSERT INTO `categorii` VALUES ('HDD portabile', '2', 'Hard diskuri portabile de la cei mai mari producatori din domeniu.');
INSERT INTO `categorii` VALUES ('Electrocasnice', '3', 'Da');
INSERT INTO `categorii` VALUES ('Gradina si casa', '4', 'Da');
INSERT INTO `categorii` VALUES ('Frumusete personala', '5', 'Nu');
INSERT INTO `categorii` VALUES ('Frumusete impersonala', '6', 'Da');

-- ----------------------------
-- Table structure for comenzi
-- ----------------------------
DROP TABLE IF EXISTS `comenzi`;
CREATE TABLE `comenzi` (
  `idutilizator` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  `stare` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fku` (`idutilizator`),
  CONSTRAINT `fku` FOREIGN KEY (`idutilizator`) REFERENCES `utilizatori` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of comenzi
-- ----------------------------

-- ----------------------------
-- Table structure for pozitiicomenzi
-- ----------------------------
DROP TABLE IF EXISTS `pozitiicomenzi`;
CREATE TABLE `pozitiicomenzi` (
  `idComanda` int(11) DEFAULT NULL,
  `idProdus` int(11) DEFAULT NULL,
  `Cantitate` int(11) DEFAULT NULL,
  `Pret` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pozitiicomenzi
-- ----------------------------

-- ----------------------------
-- Table structure for produse
-- ----------------------------
DROP TABLE IF EXISTS `produse`;
CREATE TABLE `produse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produs` varchar(200) DEFAULT NULL,
  `detalii` varchar(5000) DEFAULT NULL,
  `urlpoza` varchar(500) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `pret` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of produse
-- ----------------------------
INSERT INTO `produse` VALUES ('1', 'HTC Desire S', '2G Network     GSM 850 / 900 / 1800 / 1900\r\n3G Network     HSDPA 900 / 2100\r\nDimensions     115 x 59.8 x 11.6 mm\r\nWeight     130 g\r\n- Multi-touch input method\r\n- Accelerometer sensor for UI auto-rotate\r\n- Proximity sensor for auto turn-off\r\n- HTC Sense v3.0 UI\r\n- Touch-sensitive controls\r\n', 'desires.jpg', '1', '1299');
INSERT INTO `produse` VALUES ('2', 'Samsung Galaxy S Plus', 'Retea 2G:	 GSM 850 / 900 / 1800 / 1900\r\nRetea 3G:	 HSDPA 900 / 1900 / 2100\r\nMP3:	 Da\r\nVibratii:	 Da\r\nAgenda:	 Intrari nelimitate\r\nIstoric apeluri: Nelimitat\r\nInterna:	 8GB\r\n1.4 GHz Scorpion processor\r\nTransmisie date\r\nCamera:	 Da\r\nSenzor (MP): 5', 'samsung.jpg', '1', '2500');
INSERT INTO `produse` VALUES ('3', 'iPhone 4s', '2G Network     GSM 850 / 900 / 1800 / 1900\r\n3G Network     HSDPA 850 / 900 / 1900 / 2100\r\nDimensions     115.2 x 58.6 x 9.3 mm\r\nWeight     140 g\r\n- Scratch-resistant oleophobic surface\r\n- Multi-touch input method\r\n- Accelerometer sensor for auto-rotate\r\n- Three-axis gyro sensor\r\n- Proximity sensor for auto turn-off', 'iphone.jpg', '1', '2200');
INSERT INTO `produse` VALUES ('4', 'Toshiba S456 2TB', 'Interfata: USB 2.0\r\nCapacitate: 2000 GB\r\nDimensiuni: 195 x 115 x 52 mm\r\nPortabil: 3.5 inch', 'toshiba.jpg', '2', '2590');
INSERT INTO `produse` VALUES ('5', 'Verbatim GT 500GB', 'Interfata: USB 2.0\r\nCapacitate: 2000 GB\r\nDimensiuni: 195 x 115 x 52 mm\r\nPortabil: 3.5 inch', 'verbatim.jpg', '2', '125');
INSERT INTO `produse` VALUES ('8', 'Philips Mixer HR 1560', 'Mixer Cuccina,350 W, 3 viteze + turbo + pozitie impuls, culoare: fildes / albastru sidefat.', 'mixer.jpg', '3', '352');
INSERT INTO `produse` VALUES ('9', '\r\n\r\nPhilips Mixer HR 1364', 'Putere:500W;Accesorii:1 pahar de 1 l;Tocator;Tija din plastic;Tel.Dimensiuni(LxlxH):24x13x42', 'mixer2.jpg', '3', '310');
INSERT INTO `produse` VALUES ('12', 'Laptop Toshiba', '15 inch display, WiDi capable, full size keyboard', 'toshiba2.jpg', '3', '3500');
INSERT INTO `produse` VALUES ('13', 'Teste', 'testete', 'test.jpg', '1', '13');

-- ----------------------------
-- Table structure for utilizatori
-- ----------------------------
DROP TABLE IF EXISTS `utilizatori`;
CREATE TABLE `utilizatori` (
  `nume` varchar(200) DEFAULT NULL,
  `utilizator` varchar(200) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detalii` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of utilizatori
-- ----------------------------
INSERT INTO `utilizatori` VALUES ('Ovidiu', 'ov.chis@gmail.com', '1', 'Client promo');
INSERT INTO `utilizatori` VALUES ('Daniel', 'dani.bruda@gmail.com', '2', 'Inscris din promo');
INSERT INTO `utilizatori` VALUES ('test', 'test@test.com', '3', null);
