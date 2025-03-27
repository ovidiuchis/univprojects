/*
Navicat MySQL Data Transfer

Source Server         : MysqlMeu
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : tpjad

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2012-01-23 23:01:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `categorii`
-- ----------------------------
DROP TABLE IF EXISTS `categorii`;
CREATE TABLE `categorii` (
  `denumire` varchar(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observatii` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categorii
-- ----------------------------
INSERT INTO `categorii` VALUES ('Smartphones', '1', 'Cele mai inteligente telefoane cu sisteme de operare precum Android sau iOS');
INSERT INTO `categorii` VALUES ('HDD portabile', '2', 'Hard diskuri portabile de la cei mai mari producatori din domeniu.');
INSERT INTO `categorii` VALUES ('Electrocasnice', '3', 'Da');
INSERT INTO `categorii` VALUES ('Gradina si casa', '4', 'Da');

-- ----------------------------
-- Table structure for `magazine`
-- ----------------------------
DROP TABLE IF EXISTS `magazine`;
CREATE TABLE `magazine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denumire` varchar(200) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `urlpoza` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of magazine
-- ----------------------------
INSERT INTO `magazine` VALUES ('1', 'Emag', 'http://www.emag.ro', 'http://www.tehnopol.ro/UserFiles/article/emag-logo_04081428.png');
INSERT INTO `magazine` VALUES ('2', 'Koios', 'http://www.koyos.ro', 'http://client.koyos.ro/themes/client_default/logo_koyos.png');
INSERT INTO `magazine` VALUES ('3', 'Click shop', 'http://www.clickshop.ro/', 'http://www.underclick.ro/wp-content/uploads/2011/04/clickshop_logo.gif');
INSERT INTO `magazine` VALUES ('4', 'Media Dot', 'http://www.mediadot.ro/', 'http://www.antena3.ro/fotonew/logo_mdt_nou(2).jpg');

-- ----------------------------
-- Table structure for `oferte`
-- ----------------------------
DROP TABLE IF EXISTS `oferte`;
CREATE TABLE `oferte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pret` float DEFAULT NULL,
  `idMagazin` int(11) DEFAULT NULL,
  `idProdus` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oferte
-- ----------------------------
INSERT INTO `oferte` VALUES ('1', '1500', '1', '1', '2012-01-03 20:24:42');
INSERT INTO `oferte` VALUES ('2', '1550', '1', '2', '2011-12-14 20:24:59');
INSERT INTO `oferte` VALUES ('3', '1399', '2', '2', '2012-01-17 20:25:31');
INSERT INTO `oferte` VALUES ('4', '1299', '3', '2', '2012-01-12 20:25:41');
INSERT INTO `oferte` VALUES ('5', '2999', '3', '3', '2012-01-21 20:26:05');
INSERT INTO `oferte` VALUES ('6', '2999', '2', '3', '2012-01-23 20:26:17');
INSERT INTO `oferte` VALUES ('7', '599', '1', '4', '2012-01-25 20:26:34');
INSERT INTO `oferte` VALUES ('8', '559', '2', '4', '2012-01-18 20:26:50');
INSERT INTO `oferte` VALUES ('9', '399', '1', '5', '2012-01-02 20:27:00');
INSERT INTO `oferte` VALUES ('10', '399', '2', '5', '2012-01-09 20:27:08');
INSERT INTO `oferte` VALUES ('11', '339', '4', '5', '2012-01-16 20:27:28');
INSERT INTO `oferte` VALUES ('12', '199', '1', '8', '2012-01-24 22:50:47');
INSERT INTO `oferte` VALUES ('13', '189', '2', '8', '2011-12-06 22:50:57');
INSERT INTO `oferte` VALUES ('14', '399', '2', '9', '2012-01-12 22:51:11');
INSERT INTO `oferte` VALUES ('15', '599', '3', '10', '2011-11-08 22:53:16');
INSERT INTO `oferte` VALUES ('16', '569', '1', '10', '2012-01-17 22:53:30');
INSERT INTO `oferte` VALUES ('17', '189', '1', '11', '2012-01-23 22:56:45');

-- ----------------------------
-- Table structure for `produse`
-- ----------------------------
DROP TABLE IF EXISTS `produse`;
CREATE TABLE `produse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produs` varchar(200) DEFAULT NULL,
  `detalii` varchar(5000) DEFAULT NULL,
  `special` int(11) DEFAULT NULL,
  `urlpoza` varchar(500) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of produse
-- ----------------------------
INSERT INTO `produse` VALUES ('1', 'HTC Desire S', '2G Network     GSM 850 / 900 / 1800 / 1900\r\n3G Network     HSDPA 900 / 2100\r\nDimensions     115 x 59.8 x 11.6 mm\r\nWeight     130 g\r\n- Multi-touch input method\r\n- Accelerometer sensor for UI auto-rotate\r\n- Proximity sensor for auto turn-off\r\n- HTC Sense v3.0 UI\r\n- Touch-sensitive controls\r\n', '1', 'desires.jpg', '1');
INSERT INTO `produse` VALUES ('2', 'Samsung Galaxy S Plus', 'Retea 2G:	 GSM 850 / 900 / 1800 / 1900\r\nRetea 3G:	 HSDPA 900 / 1900 / 2100\r\nMP3:	 Da\r\nVibratii:	 Da\r\nAgenda:	 Intrari nelimitate\r\nIstoric apeluri: Nelimitat\r\nInterna:	 8GB\r\n1.4 GHz Scorpion processor\r\nTransmisie date\r\nCamera:	 Da\r\nSenzor (MP): 5', '0', 'samsung.jpg', '1');
INSERT INTO `produse` VALUES ('3', 'iPhone 4s', '2G Network     GSM 850 / 900 / 1800 / 1900\r\n3G Network     HSDPA 850 / 900 / 1900 / 2100\r\nDimensions     115.2 x 58.6 x 9.3 mm\r\nWeight     140 g\r\n- Scratch-resistant oleophobic surface\r\n- Multi-touch input method\r\n- Accelerometer sensor for auto-rotate\r\n- Three-axis gyro sensor\r\n- Proximity sensor for auto turn-off', '0', 'iphone.jpg', '1');
INSERT INTO `produse` VALUES ('4', 'Toshiba S456 2TB', 'Interfata: USB 2.0\r\nCapacitate: 2000 GB\r\nDimensiuni: 195 x 115 x 52 mm\r\nPortabil: 3.5 inch', '1', 'toshiba.jpg', '2');
INSERT INTO `produse` VALUES ('5', 'Verbatim GT 500GB', 'Interfata: USB 2.0\r\nCapacitate: 2000 GB\r\nDimensiuni: 195 x 115 x 52 mm\r\nPortabil: 3.5 inch', '0', 'verbatim.jpg', '2');
INSERT INTO `produse` VALUES ('8', 'Philips Mixer HR 1560', 'Mixer Cuccina,350 W, 3 viteze + turbo + pozitie impuls, culoare: fildes / albastru sidefat.', '0', 'mixer.jpg', '3');
INSERT INTO `produse` VALUES ('9', '\r\n\r\nPhilips Mixer HR 1364', 'Putere:500W;Accesorii:1 pahar de 1 l;Tocator;Tija din plastic;Tel.Dimensiuni(LxlxH):24x13x42', '1', 'mixer2.jpg', '3');
INSERT INTO `produse` VALUES ('10', 'Whirlpool CUPTOR MICROUNDE MT 46WH', 'CUPTOR MICROUNDE WHIRLPOOL MT 46WH, Capacitate 26 l, Distributia microundelor tridimensionala (sistem 3D), Grill quartz, Crisp, Autocrisp.', '0', 'cuptor.jpg', '3');
INSERT INTO `produse` VALUES ('11', 'Coasa electrica pentru tuns iarba Black&Decker GL350', '• Diametru de taiere 25cm\r\n• Sistem de alimentare automata cu fir dublu Reflex Plus\r\n• Maner secundar pentru manevrare controlata\r\n• Ax metalic\r\n• Functie de taiere a marginilor, la burdura', null, 'coasa1.jpg', '4');
