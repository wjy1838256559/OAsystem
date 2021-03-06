/*
MySQL Data Transfer
Source Host: localhost
Source Database: oa
Target Host: localhost
Target Database: oa
Date: 2016/11/25 ÐÇÆÚÎå 7:01:55
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
CREATE TABLE `admin` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT 'ç¨æ·å',
  `pwd` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for checker
-- ----------------------------
CREATE TABLE `checker` (
  `id` int(10) NOT NULL auto_increment,
  `eId` int(10) NOT NULL,
  `state` int(2) NOT NULL default '0' COMMENT '1è¡¨ç¤ºå·²ç­¾å°ï¼0è¡¨ç¤ºæªç­¾å°',
  `checkDate` date NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ggg` USING BTREE (`eId`),
  CONSTRAINT `checker_ibfk_1` FOREIGN KEY (`eId`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 3072 kB; (`eId`) REFER `oa/employee`(`id`)';

-- ----------------------------
-- Table structure for department
-- ----------------------------
CREATE TABLE `department` (
  `id` int(10) NOT NULL auto_increment,
  `dName` varchar(10) default NULL COMMENT 'é¨é¨åç§°',
  `description` varchar(100) default NULL COMMENT 'é¨é¨æè¿°',
  `state` int(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
CREATE TABLE `employee` (
  `id` int(10) NOT NULL auto_increment,
  `sId` int(10) NOT NULL COMMENT 'è¿æ¥å²ä½å¤é®',
  `number` varchar(10) NOT NULL,
  `name` varchar(8) NOT NULL COMMENT 'å§å',
  `phonenumber` varchar(11) default NULL COMMENT 'ææºå·',
  `startDate` date default NULL COMMENT 'å¥èæ¶é´',
  `endDate` date default NULL COMMENT 'ç¦»èæ¶é´',
  `pwd` varchar(255) default '000000' COMMENT 'å¯ç ',
  `money` decimal(10,0) default NULL COMMENT 'å·¥èµ',
  `workExperience` varchar(255) default NULL COMMENT 'å·¥ä½ç»éª',
  `state` int(2) default '1' COMMENT 'ç¶æ  1è¡¨ç¤ºå¯ç¨  0è¡¨ç¤ºä¸å¯ç¨',
  `loseTime` int(10) default '0' COMMENT 'ç¼ºå¤æ°',
  `image` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `c` (`sId`),
  CONSTRAINT `c` FOREIGN KEY (`sId`) REFERENCES `station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for forum
-- ----------------------------
CREATE TABLE `forum` (
  `id` int(11) NOT NULL auto_increment COMMENT 'ä¸»é®',
  `name` varchar(255) default NULL COMMENT 'æ¿ååç§°',
  `description` varchar(255) default NULL COMMENT 'æ¿åæè¿°',
  `topicCount` int(11) default NULL COMMENT 'ä¸»é¢æ°é',
  `articleCount` int(11) default NULL COMMENT 'æç« æ°é',
  `state` int(11) default NULL COMMENT 'ç¶æï¼1è¡¨ç¤ºå¯ç¨ï¼0è¡¨ç¤ºä¸å¯ç¨',
  `position` int(11) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for leavelist
-- ----------------------------
CREATE TABLE `leavelist` (
  `id` int(10) NOT NULL auto_increment,
  `eId` int(10) NOT NULL COMMENT 'å¤é® è¿æ¥åå·¥è¡¨',
  `reason` varchar(200) default NULL COMMENT 'è¯·ååå ',
  `date` date default NULL COMMENT 'è¯·åæ¶é´',
  `state` int(1) default '1' COMMENT 'ç¶æ  1æ¶è¡¨ç¤ºå¾å®¡æ¹  2è¡¨ç¤ºå®¡æ¹æå  3è¡¨ç¤ºå®¡æ¹æç»  4è¡¨ç¤ºè¿æ',
  `cstate` int(2) default '1' COMMENT 'æ¯å¦å­å¨çstate',
  PRIMARY KEY  (`id`),
  KEY `e` (`eId`),
  CONSTRAINT `e` FOREIGN KEY (`eId`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notify
-- ----------------------------
CREATE TABLE `notify` (
  `id` int(11) NOT NULL auto_increment COMMENT 'ä¸»é®',
  `eId` int(11) NOT NULL COMMENT 'åå·¥å¤é®',
  `content` varchar(255) default NULL,
  `sendTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for performance
-- ----------------------------
CREATE TABLE `performance` (
  `id` int(10) NOT NULL auto_increment,
  `eId` int(10) NOT NULL COMMENT 'è¿æ¥åå·¥è¡¨çå¤é® ',
  `expectNum` decimal(10,0) default NULL COMMENT 'ææå¼',
  `finishNum` decimal(10,0) default '0' COMMENT 'å®æå¼',
  `startDate` date default NULL COMMENT 'å¼å§æ¥æ',
  `endDate` date default NULL COMMENT 'ç»ææ¥æ',
  `bonus` decimal(10,0) default NULL COMMENT 'éé±',
  `state` int(2) NOT NULL default '0' COMMENT 'è¡¨ç¤ºå®¡æ¹ç¶æ  0è¡¨ç¤ºæªå®¡æ¹  1è¡¨ç¤ºå®¡æ¹',
  `repState` int(2) NOT NULL default '0' COMMENT 'è¡¨ç¤ºæéçç¶æ   0è¡¨ç¤ºæªæé  1è¡¨ç¤ºå·²æé',
  PRIMARY KEY  (`id`),
  KEY `dsss` (`eId`),
  CONSTRAINT `dsss` FOREIGN KEY (`eId`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
CREATE TABLE `privilege` (
  `id` int(10) NOT NULL auto_increment,
  `parentId` int(11) default NULL,
  `name` varchar(8) default NULL COMMENT 'æéåç§°',
  `url` varchar(255) default NULL COMMENT 'è·¯å¾',
  PRIMARY KEY  (`id`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `parentId` FOREIGN KEY (`parentId`) REFERENCES `privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for privilege_role
-- ----------------------------
CREATE TABLE `privilege_role` (
  `id` int(10) NOT NULL auto_increment,
  `privilegeID` int(10) NOT NULL COMMENT 'å¤é®è¿æ¥æéè¡¨',
  `roleId` int(10) NOT NULL COMMENT 'å¤é®è¿æ¥è§è²è¡¨',
  PRIMARY KEY  (`id`),
  KEY `f` (`privilegeID`),
  KEY `g` (`roleId`),
  CONSTRAINT `df` FOREIGN KEY (`privilegeID`) REFERENCES `privilege` (`id`),
  CONSTRAINT `g` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
CREATE TABLE `reply` (
  `id` int(11) NOT NULL auto_increment COMMENT 'ä¸»é®',
  `authorId` int(11) default NULL COMMENT 'åå·¥Id',
  `topicId` int(11) default NULL COMMENT 'ä¸»é¢Id',
  `title` varchar(255) default NULL COMMENT 'æ é¢',
  `content` varchar(255) default NULL COMMENT 'åå¤åå®¹',
  `postTime` datetime default NULL COMMENT 'åè¡¨æ¶é´',
  PRIMARY KEY  (`id`),
  KEY `authorId` (`authorId`),
  KEY `topicId` (`topicId`),
  CONSTRAINT `authorId` FOREIGN KEY (`authorId`) REFERENCES `employee` (`id`),
  CONSTRAINT `topicId` FOREIGN KEY (`topicId`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE `role` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(8) default NULL COMMENT 'è§è²å',
  `description` varchar(255) default NULL COMMENT 'è§è²æè¿°',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for station
-- ----------------------------
CREATE TABLE `station` (
  `id` int(10) NOT NULL auto_increment,
  `dId` int(10) NOT NULL default '1',
  `sName` varchar(10) default NULL COMMENT 'å²ä½åç§°',
  `description` varchar(100) default NULL COMMENT 'å²ä½æè¿°',
  `state` int(2) NOT NULL default '1' COMMENT '1è¡¨ç¤ºå­å¨ï¼0è¡¨ç¤ºä¸å­å¨',
  PRIMARY KEY  (`id`),
  KEY `ertyu` (`dId`),
  CONSTRAINT `ertyu` FOREIGN KEY (`dId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
CREATE TABLE `topic` (
  `id` int(11) NOT NULL auto_increment COMMENT 'ä¸»é®',
  `authorId` int(11) default NULL COMMENT 'åå·¥Id',
  `forumId` int(11) default NULL COMMENT 'æ¿åId',
  `title` varchar(255) default NULL COMMENT 'é¢ç®',
  `content` varchar(255) default NULL COMMENT 'åå®¹',
  `postTime` datetime default NULL COMMENT 'åè¡¨æ¶é´',
  `lastUpdateTime` datetime default NULL COMMENT 'æåæ´æ°æ¶é´',
  `type` int(11) default NULL COMMENT 'ä¸»é¢ç±»å',
  `replyCount` int(11) default NULL COMMENT 'åå¤æ°é',
  `state` int(11) default '1' COMMENT 'ç¶æï¼1è¡¨ç¤ºå¯ç¨ï¼0è¡¨ç¤ºä¸å¯ç¨',
  PRIMARY KEY  (`id`),
  KEY `auId` (`authorId`),
  KEY `forumId` (`forumId`),
  CONSTRAINT `auId` FOREIGN KEY (`authorId`) REFERENCES `employee` (`id`),
  CONSTRAINT `forumId` FOREIGN KEY (`forumId`) REFERENCES `forum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');
INSERT INTO `checker` VALUES ('1', '1', '0', '2016-11-22');
INSERT INTO `checker` VALUES ('2', '1', '1', '2016-11-21');
INSERT INTO `checker` VALUES ('3', '1', '1', '2016-11-20');
INSERT INTO `checker` VALUES ('4', '2', '0', '2016-11-22');
INSERT INTO `checker` VALUES ('5', '2', '0', '2016-11-21');
INSERT INTO `checker` VALUES ('6', '2', '0', '2016-11-20');
INSERT INTO `checker` VALUES ('9', '48', '0', '2016-11-23');
INSERT INTO `checker` VALUES ('17', '1', '0', '2016-11-23');
INSERT INTO `checker` VALUES ('18', '6', '0', '2016-11-23');
INSERT INTO `checker` VALUES ('19', '7', '0', '2016-11-23');
INSERT INTO `checker` VALUES ('29', '1', '0', '2016-11-25');
INSERT INTO `department` VALUES ('1', 'è¡æ¿é¨', 'ç®¡çè¡æ¿', '1');
INSERT INTO `department` VALUES ('2', 'äººåèµæº', 'äººäºæèä¸å¹è®­', '1');
INSERT INTO `department` VALUES ('3', 'è¥éé¨', 'è´è´£å¯¹å¬å¸äº§åä»·å¼å®ç°è¿ç¨ä¸­åéå®ç¯èå®è¡ç®¡çãçç£ãåè°ãæå¡', '1');
INSERT INTO `department` VALUES ('4', 'äººåèµæºé¨', 'å¯¹ä¼ä¸ä¸­åç±»äººåå½¢æçèµæºï¼å³æäººä½ä¸ºèµæºï¼è¿è¡ç®¡ç', '1');
INSERT INTO `department` VALUES ('5', 'ææ¯é¨', 'è´è´£ææ¯å¼å', '1');
INSERT INTO `department` VALUES ('6', 'ç®¡ç', 'ä¸ä¸ªå¬å¸çæ»ç®¡ç', '1');
INSERT INTO `department` VALUES ('7', 'å¹è®­é¨', 'è´è´£æ°äººçå¹è®­å·¥ä½', '1');
INSERT INTO `employee` VALUES ('1', '13', '201609001', 'å®æ°', '18266598634', '2016-09-01', '2017-01-01', '670b14728ad9902aecba32e22fa4f6bd', '0', '8', '1', '12', 'avatar.png');
INSERT INTO `employee` VALUES ('2', '5', '201609002', 'é¡¾é¿å«', '18635496273', '2016-09-01', '2017-01-01', '000000', '0', '8 ', '1', '45', 'avatar04.png');
INSERT INTO `employee` VALUES ('3', '11', '201609003', 'å·¦çæ³', '19567532495', '2016-09-01', '2017-01-01', '000000', '9000', '8', '1', '0', 'avatar5.png');
INSERT INTO `employee` VALUES ('4', '12', '201609004', 'èè¶', '17564982375', '2016-09-01', '2017-01-01', '000000', '8500', '8', '1', '0', 'avatar3.png');
INSERT INTO `employee` VALUES ('5', '25', '201609005', 'æç«ä¸', '18532649762', '2016-09-01', '2017-01-01', '000000', '0', '8', '0', '0', 'avatar2.png');
INSERT INTO `employee` VALUES ('6', '28', '201609006', 'è¤å¯å', '12683459762', '2016-09-01', '2017-01-01', '000000', '0', '8', '0', '0', null);
INSERT INTO `employee` VALUES ('7', '24', '201609007', 'çä½©ç¶', '18526437925', '2016-09-01', '2017-01-01', '000000', '8300', '8', '1', '0', null);
INSERT INTO `employee` VALUES ('8', '1', '201609008', 'å¼ äºå·', '13248657924', '2016-09-01', '2017-01-01', '000000', '5000', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('9', '2', '201609009', 'éç´«æ¶µ', '16486293468', '2016-09-01', '2017-01-01', '000000', '6000', '5', '1', '0', null);
INSERT INTO `employee` VALUES ('10', '3', '201609010', 'éæ°', '18659433864', '2016-09-01', '2017-01-01', '000000', '6500', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('11', '4', '201609011', 'éå®è²', '16486459723', '2016-09-01', '2017-01-01', '000000', '0', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('12', '5', '201609012', 'æ¨å­ä½©', '19854623764', '2016-09-01', '2017-01-01', '000000', '5400', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('13', '6', '201609013', 'åéè¯', '18452673946', '2016-09-01', '2017-01-01', '000000', '5500', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('14', '7', '201609014', 'æ¨æé', '18792184645', '2016-09-01', '2017-01-01', '000000', '0', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('15', '9', '201609015', 'å¼ æ±æ¶', '18452369752', '2016-09-01', '2017-01-01', '000000', '6900', '5', '1', '0', null);
INSERT INTO `employee` VALUES ('16', '10', '201609016', 'èµµçè£', '13546988267', '2016-09-01', '2017-01-01', '000000', '0', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('17', '14', '201609017', 'éææµ©', '15842673956', '2016-09-01', '2017-01-01', '000000', '5300', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('18', '15', '201609018', 'å­å²³é¢', '14852673954', '2016-09-01', '2017-01-01', '000000', '6200', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('19', '16', '201609019', 'åææ', '16485269875', '2016-09-01', '2017-01-01', '000000', '5900', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('20', '17', '201609020', 'éå¿æ', '15487985268', '2016-09-01', '2017-01-01', '000000', '5700', '1', '1', '0', null);
INSERT INTO `employee` VALUES ('21', '18', '201609021', 'èµµæ', '15487993256', '2016-09-01', '2017-01-01', '000000', '6200', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('22', '19', '201609022', 'é­é¿ä¹', '15487952368', '2016-09-01', '2017-01-01', '000000', '6400', '1', '1', '0', null);
INSERT INTO `employee` VALUES ('23', '20', '201609023', 'é©¬æå¤©', '15478963236', '2016-09-01', '2017-01-01', '000000', '6800', '1', '1', '0', null);
INSERT INTO `employee` VALUES ('24', '21', '201609024', 'æ±ææ', '12654789335', '2016-09-01', '2017-01-01', '000000', '6100', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('25', '22', '201609025', 'ç½èç¾', '16549679878', '2016-09-01', '2017-01-01', '000000', '5800', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('26', '23', '201609026', 'æ¢å±å¼º', '14656143238', '2016-09-01', '2017-01-01', '000000', '5300', '1', '1', '0', null);
INSERT INTO `employee` VALUES ('27', '24', '201609027', 'å­å¥', '16574947631', '2016-09-01', '2017-01-01', '000000', '5900', '1', '1', '0', null);
INSERT INTO `employee` VALUES ('28', '26', '201609028', 'é­æå¹³', '16345979432', '2016-09-01', '2017-01-01', '000000', '6800', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('29', '29', '201609029', 'åçæ', '19845623752', '2016-09-01', '2017-01-01', '000000', '6500', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('30', '27', '201609030', 'ç½éæ', '18462326496', '2016-09-01', '2017-01-01', '000000', '6500', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('31', '30', '201609031', 'é©¬ç¦åº·', '18754269396', '2016-09-01', '2017-01-01', '000000', '5600', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('32', '31', '201609032', 'å¨å½è´¤', '18452669975', '2016-09-01', '2017-01-01', '000000', '5400', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('33', '32', '201609033', 'å¾ä¹¾æ¸', '15874452698', '2016-09-01', '2017-01-01', '000000', '5900', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('34', '1', '201609034', 'é­å¨æ°', '18562347586', '2016-09-01', '2017-01-01', '000000', '5800', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('35', '1', '201609035', 'å¾æ¾æ ¹', '16854235975', '2016-09-01', '2017-01-01', '000000', '5400', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('36', '2', '201609036', 'å­çº¯ä¸', '15842673956', '2016-09-01', '2017-01-01', '670b14728ad9902aecba32e22fa4f6bd', '0', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('37', '3', '201609037', 'ç½ç»å¨', '13457956285', '2016-09-01', '2017-01-01', '000000', '6700', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('38', '4', '201609038', 'å­é¸¿ç', '16547892526', '2016-09-01', '2017-01-01', '000000', '5500', '5', '1', '0', null);
INSERT INTO `employee` VALUES ('39', '7', '201609039', 'ç½åå¾·', '18653235847', '2016-09-01', '2017-01-01', '000000', '5300', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('40', '7', '201609040', 'é©¬å¯ä¼', '17954268536', '2016-09-01', '2017-01-01', '000000', '5200', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('41', '9', '201609041', 'å­å²³é¢', '14357989625', '2016-09-01', '2017-01-01', '000000', '5800', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('42', '9', '201609042', 'é­æå®', '15324879964', '2016-09-01', '2017-01-01', '000000', '6200', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('43', '10', '201609043', 'é©¬çå­', '18452679536', '2016-09-01', '2017-01-01', '000000', '6800', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('44', '27', '201609044', 'å¾ä¸ç', '19562354789', '2016-09-01', '2017-01-01', '000000', '6700', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('45', '27', '201609045', 'å­æé', '18452674953', '2016-09-01', '2017-01-01', '000000', '0', '2', '0', '0', null);
INSERT INTO `employee` VALUES ('46', '30', '201609046', 'é©¬çæ¶', '17562438964', '2016-09-01', '2017-01-01', '000000', '5900', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('47', '31', '201609047', 'é­åæ£®', '18645237956', '2016-09-01', '2017-01-01', '000000', '5600', '1', '0', '0', null);
INSERT INTO `employee` VALUES ('48', '11', '201611023', 'å¬å­ç¾½', '18119612521', '2016-11-23', null, '000000', '0', '5', '0', '0', 'oaC.jpg');
INSERT INTO `employee` VALUES ('49', '29', '201611240', 'è¤å', '1789878902', '2016-11-01', null, '000000', '0', '7', '0', '0', '');
INSERT INTO `employee` VALUES ('50', '1', '201609888', 'å·¦é®', '18612345678', '2016-11-09', null, '670b14728ad9902aecba32e22fa4f6bd', '9000', '5', '0', '0', 'a.jpg');
INSERT INTO `forum` VALUES ('1', 'å¬å¸ç²¾è±æ±è', 'å¬å¸åé¨é¨ç²¾è±è®¨è®ºåºã', '14', '114', '1', '0');
INSERT INTO `forum` VALUES ('2', 'å¬å¸æ¥å¸¸çæ´»å¤§æç©', 'èå¬å¸æ¥å¸¸çæ´»ï¼æ¥å¸¸ç®¡çåæ§½åºã', '3', '38', '0', '0');
INSERT INTO `forum` VALUES ('3', 'å¬å¸ä¼æ¯æ¶é´ä¼é²åº', 'å¬å¸åäººåå¯ä»¥èå®¶å¸¸ï¼èè¿½å§ã', '0', '0', '1', '0');
INSERT INTO `forum` VALUES ('4', 'å¬å¸ç¹è²å±ç¤ºåº', 'å±ç¤ºå¬å¸æ´»å¨ï¼ç¹è²çå°æ¹ã', '0', '0', '0', '0');
INSERT INTO `forum` VALUES ('5', 'æµè¯é¡µé¢', 'æµè¯', '1', '1', '1', '3');
INSERT INTO `forum` VALUES ('7', 'æ ¡å­', 'å­¦ççç©ºé´', '0', '0', '1', '1');
INSERT INTO `forum` VALUES ('8', 'å¬å¸ä¼æ¯æ¶é´ä¼é²åº', 'å¬å¸åäººåå¯ä»¥èå®¶å¸¸ï¼èè¿½å§ã', '0', '0', '1', '2');
INSERT INTO `forum` VALUES ('9', 'æ ¡å­', 'å­¦ççç©ºé´', '0', '0', '1', '0');
INSERT INTO `forum` VALUES ('10', 'å¬å¸ç¹è²å±ç¤ºåº', 'å±ç¤ºå¬å¸æ´»å¨ï¼ç¹è²çå°æ¹ã', '4', '2', '1', '1');
INSERT INTO `forum` VALUES ('11', 'å¬å¸æ¥å¸¸çæ´»å¤§æç©', 'èå¬å¸æ¥å¸¸çæ´»ï¼æ¥å¸¸ç®¡çåæ§½åºã', '2', '4', '2', '1');
INSERT INTO `forum` VALUES ('12', 'å¬å¸ç²¾è±æ±è', 'å¬å¸åé¨é¨ç²¾è±è®¨è®ºåºã', '7', '3', '2', '1');
INSERT INTO `forum` VALUES ('13', ' æµè¯é¡µé¢', 'æµè¯', '27', '21', '2', '1');
INSERT INTO `forum` VALUES ('14', ' æ ¡å­', 'å­¦ççç©ºé´', '25', '2', '1', '1');
INSERT INTO `forum` VALUES ('15', ' å¬å¸ç¹è²å±ç¤ºåº', 'å±ç¤ºå¬å¸æ´»å¨ï¼ç¹è²çå°æ¹ã', '15', '2', '3', '1');
INSERT INTO `forum` VALUES ('16', ' å¬å¸ä¼æ¯æ¶é´ä¼é²åº', 'å¬å¸åäººåå¯ä»¥èå®¶å¸¸ï¼èè¿½å§ã', '11', '51', '2', '1');
INSERT INTO `forum` VALUES ('17', ' å¬å¸ç²¾è±æ±è', 'å¬å¸åé¨é¨ç²¾è±è®¨è®ºåºã', '10', '12', '23', '1');
INSERT INTO `forum` VALUES ('18', 'å¬å¸ç¹è²å±ç¤ºåº', 'å±ç¤ºå¬å¸æ´»å¨ï¼ç¹è²çå°æ¹ã', '13', '12', '1', '1');
INSERT INTO `forum` VALUES ('20', 'ç­è¾©æµè¯', 'æµè¯çåæ¨¡å', '0', '0', '1', '1');
INSERT INTO `forum` VALUES ('23', '[object HTMLInputElement]', '[object HTMLInputElement]', '0', '0', '1', null);
INSERT INTO `leavelist` VALUES ('1', '39', 'å¤´ç¼ï¼çç', '2016-11-02', '1', '1');
INSERT INTO `leavelist` VALUES ('2', '1', 'ç¶æ¯æ¥çæï¼éªç¶æ¯', '2016-11-03', '1', '1');
INSERT INTO `leavelist` VALUES ('3', '26', 'æåç»å©ï¼ååé', '2016-11-07', '1', '1');
INSERT INTO `leavelist` VALUES ('4', '1', 'æå¤±æäºï¼æ³æ£å¿', '2016-11-08', '3', '1');
INSERT INTO `leavelist` VALUES ('5', '1', 'ä»å¤©æç»å©', '2016-11-08', '2', '1');
INSERT INTO `leavelist` VALUES ('6', '10', 'è¡¨å¥ç»å©ï¼ååé', '2016-11-09', '2', '1');
INSERT INTO `leavelist` VALUES ('7', '1', 'èº«ä½ä¸éï¼çç', '2016-11-11', '3', '0');
INSERT INTO `leavelist` VALUES ('8', '41', 'ç®ç©ï¼çç', '2016-11-13', '2', '1');
INSERT INTO `leavelist` VALUES ('9', '1', 'å å¦¹ç»å©ï¼ååé', '2016-11-14', '3', '1');
INSERT INTO `leavelist` VALUES ('10', '20', 'ç¥æ¯è¿ä¸', '2016-11-14', '4', '1');
INSERT INTO `leavelist` VALUES ('11', '15', 'è èä¸éï¼çç', '2016-11-15', '4', '1');
INSERT INTO `leavelist` VALUES ('12', '2', 'å¥³æåççï¼éªå¥³å', '2016-11-16', '2', '1');
INSERT INTO `leavelist` VALUES ('13', '1', 'é«ç§ï¼çç', '2016-11-19', '4', '1');
INSERT INTO `leavelist` VALUES ('14', '47', 'å®¶éè¢«çï¼å¤çå®¶äº', '2016-11-21', '4', '1');
INSERT INTO `leavelist` VALUES ('15', '17', 'ä»å¤©æç»å©', '2016-11-22', '4', '1');
INSERT INTO `leavelist` VALUES ('16', '27', 'å¤ç¥ç¶è¿ä¸', '2016-11-28', '2', '1');
INSERT INTO `leavelist` VALUES ('17', '1', 'dhafkjewanfj', '2016-11-02', '1', '1');
INSERT INTO `leavelist` VALUES ('18', '1', 'ddddd', '2010-01-01', '1', '1');
INSERT INTO `leavelist` VALUES ('19', '1', '0000000000000000000000000', '2017-01-01', '3', '1');
INSERT INTO `leavelist` VALUES ('20', '1', 'iugfviu', '2016-11-01', '1', '1');
INSERT INTO `leavelist` VALUES ('21', '1', '12345', '2016-11-02', '1', '1');
INSERT INTO `performance` VALUES ('1', '1', '45623', '45658', '2016-09-01', '2016-09-30', null, '1', '1');
INSERT INTO `performance` VALUES ('2', '1', '42358', '44754', '2016-10-01', '2016-10-30', null, '1', '1');
INSERT INTO `performance` VALUES ('3', '1', '56987', '54614', '2016-11-01', '2016-11-30', null, '1', '1');
INSERT INTO `performance` VALUES ('4', '2', '23584', '27443', '2016-09-01', '2016-09-30', null, '1', '1');
INSERT INTO `performance` VALUES ('5', '2', '12358', '14534', '2016-10-01', '2016-10-30', null, '0', '1');
INSERT INTO `performance` VALUES ('6', '2', '14753', '13241', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('7', '3', '16548', '11564', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('8', '3', '12584', '15684', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('9', '3', '13549', '15465', '2016-11-01', '2016-11-30', null, '0', '1');
INSERT INTO `performance` VALUES ('10', '4', '15842', '14686', '2016-09-01', '2016-09-30', null, '1', '1');
INSERT INTO `performance` VALUES ('11', '4', '16587', '14464', '2016-10-01', '2016-10-30', null, '1', '0');
INSERT INTO `performance` VALUES ('12', '4', '11315', '15466', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('13', '5', '16587', '14647', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('14', '5', '54882', '55651', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('15', '5', '24556', '24647', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('16', '6', '26656', '28465', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('17', '6', '35536', '34674', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('18', '6', '65955', '64647', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('19', '7', '59865', '52532', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('20', '7', '56583', '54315', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('21', '7', '65685', '64465', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('22', '8', '56582', '55134', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('23', '8', '65984', '64554', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('24', '8', '56893', '51342', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('25', '9', '41979', '42454', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('26', '9', '23549', '21343', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('27', '9', '85462', '84674', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('28', '10', '56846', '57446', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('29', '10', '26423', '25485', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('30', '10', '56532', '58585', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('31', '11', '59846', '58584', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('32', '11', '56862', '54565', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('33', '11', '14789', '17875', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('34', '12', '35656', '34585', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('35', '12', '13256', '18558', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('36', '12', '84652', '88959', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('37', '13', '26579', '25985', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('38', '13', '22368', '28555', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('39', '13', '49895', '45685', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('40', '14', '35684', '35685', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('41', '14', '35656', '35745', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('42', '14', '23568', '25682', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('43', '15', '89465', '83235', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('44', '15', '55265', '52026', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('45', '15', '89746', '82302', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('46', '16', '35684', '32352', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('47', '16', '25642', '23124', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('48', '16', '16562', '12652', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('49', '17', '56652', '52355', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('50', '17', '46595', '42352', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('51', '17', '65987', '66525', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('52', '18', '35648', '32652', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('53', '18', '16567', '12652', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('54', '18', '26984', '22652', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('55', '19', '89876', '86561', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('56', '19', '65645', '62652', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('57', '19', '89796', '85265', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('58', '20', '65896', '62621', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('59', '20', '89746', '85652', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('60', '20', '68965', '65462', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('61', '21', '32623', '32626', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('62', '21', '89465', '85623', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('63', '21', '76564', '73261', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('64', '22', '56231', '54744', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('65', '22', '96645', '94615', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('66', '22', '46523', '41654', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('67', '23', '15463', '14165', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('68', '23', '65987', '66523', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('69', '23', '65635', '65635', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('70', '24', '65653', '64612', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('71', '24', '26556', '24465', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('72', '24', '56894', '54645', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('73', '25', '68674', '65562', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('74', '25', '32689', '34954', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('75', '25', '46525', '45685', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('76', '26', '35642', '35689', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('77', '26', '89742', '85658', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('78', '26', '65562', '66585', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('79', '27', '65652', '65895', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('80', '27', '56645', '55685', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('81', '27', '23565', '24548', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('82', '28', '35646', '34557', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('83', '28', '35656', '35685', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('84', '28', '26565', '25685', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('85', '29', '56564', '55668', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('86', '29', '68945', '64567', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('87', '29', '56526', '55685', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('88', '30', '26846', '24556', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('89', '30', '87456', '86556', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('90', '30', '89774', '84544', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('91', '31', '35665', '34658', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('92', '31', '23564', '21553', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('93', '31', '88974', '88454', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('94', '32', '35646', '35685', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('95', '32', '89895', '85628', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('96', '32', '52548', '51412', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('97', '33', '22542', '25485', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('98', '33', '64235', '64542', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('99', '33', '68845', '64571', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('100', '34', '55426', '54154', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('101', '34', '87451', '84541', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('102', '34', '36845', '34615', '2016-11-01', '2016-11-30', null, '1', '0');
INSERT INTO `performance` VALUES ('103', '35', '36519', '34547', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('104', '35', '36547', '31542', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('105', '35', '33248', '35895', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('106', '36', '39556', '35684', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('107', '36', '58455', '55645', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('108', '36', '74575', '75685', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('109', '37', '36455', '35625', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('110', '37', '26544', '25682', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('111', '37', '32654', '35412', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('112', '38', '65452', '61121', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('113', '38', '87455', '84512', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('114', '38', '26455', '24541', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('115', '39', '24123', '25454', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('116', '39', '87442', '87452', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('117', '39', '84565', '89662', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('118', '40', '26552', '21542', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('119', '40', '65522', '62652', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('120', '40', '65232', '63636', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('121', '41', '26552', '22652', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('122', '41', '65226', '62652', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('123', '41', '32654', '32652', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('124', '42', '47485', '46653', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('125', '42', '25545', '24562', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('126', '42', '65874', '64565', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('127', '43', '68543', '65626', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('128', '43', '56685', '55652', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('129', '43', '65565', '65526', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('130', '44', '56551', '52665', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('131', '44', '87965', '83635', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('132', '44', '56849', '52626', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('133', '45', '59846', '55626', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('134', '45', '89855', '86952', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('135', '45', '56849', '52685', '2016-11-01', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('136', '46', '35965', '35925', '2016-09-01', '2016-09-30', null, '0', '1');
INSERT INTO `performance` VALUES ('137', '46', '59874', '55562', '2016-10-01', '2016-10-30', null, '0', '0');
INSERT INTO `performance` VALUES ('138', '46', '29654', '25684', '2016-11-01', '2016-11-30', null, '1', '0');
INSERT INTO `performance` VALUES ('139', '47', '56784', '52325', '2016-09-01', '2016-09-30', null, '0', '0');
INSERT INTO `performance` VALUES ('140', '47', '26554', '22652', '2016-10-01', '2016-10-30', null, '0', '1');
INSERT INTO `performance` VALUES ('141', '1', '1', '0', '2016-12-01', '2016-12-31', null, '1', '1');
INSERT INTO `performance` VALUES ('142', '1', '1000', '0', '2016-11-25', '2016-11-30', null, '1', '0');
INSERT INTO `performance` VALUES ('143', '44', '23333', '0', '2016-11-30', '2016-12-08', null, '0', '0');
INSERT INTO `performance` VALUES ('144', '44', '1234', '0', '2016-11-26', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('145', '3', '1111', '0', '2016-11-26', '2016-11-30', null, '0', '0');
INSERT INTO `performance` VALUES ('146', '3', '11', '0', '2016-11-30', '2016-12-14', null, '0', '0');
INSERT INTO `performance` VALUES ('147', '3', '90', '0', '2016-11-26', '2016-11-30', null, '1', '1');
INSERT INTO `privilege` VALUES ('1', null, 'åºæ¬ç®¡ç', null);
INSERT INTO `privilege` VALUES ('2', '1', 'äººäºç®¡ç', '/EmployeeListServlet');
INSERT INTO `privilege` VALUES ('3', '1', 'é¨é¨ç®¡ç', '/DepartmentServlet');
INSERT INTO `privilege` VALUES ('4', '1', 'å²ä½ç®¡ç', '/StationServlet');
INSERT INTO `privilege` VALUES ('5', '1', 'ç»©æç®¡ç', '/PerformanceServlet');
INSERT INTO `privilege` VALUES ('6', '1', 'èå¤ç®¡ç', '/CheckListServlet');
INSERT INTO `privilege` VALUES ('7', '2', 'æ°å¢åå·¥', '/AddEmployeeShowServlet');
INSERT INTO `privilege` VALUES ('8', '2', 'ä¿®æ¹åå·¥', '/EmpolyeeShowServlet');
INSERT INTO `privilege` VALUES ('9', '2', 'å é¤åå·¥', '/EmployeeDeleteServlet');
INSERT INTO `privilege` VALUES ('10', '2', 'åå§åå¯ç ', '/InitPwdServlet');
INSERT INTO `privilege` VALUES ('11', '3', 'æ°å¢é¨é¨', '/DepartmentAddServlet');
INSERT INTO `privilege` VALUES ('12', '3', 'ä¿®æ¹é¨é¨', '/DepartmentUpdateServlet');
INSERT INTO `privilege` VALUES ('13', '3', 'å é¤é¨é¨', '/DepartmentDeleteServlet');
INSERT INTO `privilege` VALUES ('14', '4', 'æ°å¢å²ä½', '/StationAddServlet');
INSERT INTO `privilege` VALUES ('15', '4', 'ä¿®æ¹å²ä½', '/StationUpdateServlet');
INSERT INTO `privilege` VALUES ('16', '4', 'å é¤å²ä½', '/StationUpdateSqlServlet');
INSERT INTO `privilege` VALUES ('17', '4', 'è®¾ç½®æé', '/StationSetPriServlet');
INSERT INTO `privilege` VALUES ('18', '5', 'è®¾ç½®ææå¼', '/');
INSERT INTO `privilege` VALUES ('19', '5', 'å®¡æ¹', '/');
INSERT INTO `privilege` VALUES ('20', '5', 'æé', '/');
INSERT INTO `privilege` VALUES ('21', '5', 'æé', '/');
INSERT INTO `privilege` VALUES ('22', null, 'ç½ä¸äº¤æµ', null);
INSERT INTO `privilege` VALUES ('23', '22', 'è®ºå', '/FornumServlet');
INSERT INTO `privilege` VALUES ('25', null, 'å®¡æ¹æµè½¬', null);
INSERT INTO `privilege` VALUES ('26', '25', 'å®¡æ¹æµç¨ç®¡ç', '/');
INSERT INTO `privilege` VALUES ('27', '25', 'æçç³è¯·æ¥è¯¢', '/');
INSERT INTO `privilege` VALUES ('28', '22', 'è®ºåç®¡ç', '/FornumServlet');
INSERT INTO `reply` VALUES ('1', '2', '1', 'ä¸éªåçå¬å¸æ¯è²', 'ä¸éªå¦ ç¡®å®å¥½ç¾', '2016-09-01 09:00:36');
INSERT INTO `reply` VALUES ('2', '3', '1', 'ä¸éªåçå¬å¸æ¯è²', 'æ¯å å¥½æ¼äº® å°±æ¯å¥½å·å', '2016-09-01 09:01:03');
INSERT INTO `reply` VALUES ('3', '4', '1', 'ä¸éªåçå¬å¸æ¯è²', 'å¤§å®¶æ³¨æä¿æï¼', '2016-09-01 09:01:10');
INSERT INTO `reply` VALUES ('4', '4', '2', 'ææ¯é¨å¬æ³³æ´»å¨å®ç¾ç»æ', 'æåå äº åå  å¤ªåºæ¿äºã', '2016-11-22 13:23:05');
INSERT INTO `reply` VALUES ('5', '6', '2', 'ææ¯é¨å¬æ³³æ´»å¨å®ç¾ç»æ', 'çä½ ä»¬è¿ä¹åå®³ æå¨è§è½ççåæ', '2016-11-22 13:23:26');
INSERT INTO `reply` VALUES ('6', '13', '3', 'ææ¯é¨å¬æ³³æ´»å¨å®ç¾ç»æ', 'å¬æ³³çé½æ¯å¤§ç¥ åå®³åå®³', '2016-11-22 13:23:54');
INSERT INTO `reply` VALUES ('7', '25', '3', 'å¤§éªçº·é£', 'è¿ä¹å¿«å°±å¥å¬èä¸ä¸è¿ä¹å¤§çéª  åå å´å¥', '2016-11-22 13:24:10');
INSERT INTO `reply` VALUES ('8', '24', '4', 'å¤§éªçº·é£', 'åå å¾ä¼å¯ä»¥æéªä» æéªæ¯ç', '2016-11-22 13:24:22');
INSERT INTO `reply` VALUES ('9', '17', '5', 'å·¥ç¨é¨æèºè¡¨æ¼å®ç¾ç»æï¼', 'åºå¥å±çç²¾å¿ æ¥å½å¯ä»¥çï¼', '2016-11-22 13:24:36');
INSERT INTO `reply` VALUES ('10', '35', '5', 'å·¥ç¨é¨æèºè¡¨æ¼å®ç¾ç»æï¼', 'è¿ä¸ç¥é æä»¬å¬å¸è¿ä¹å¤å¤§ç¥çå 666', '2016-11-22 13:24:50');
INSERT INTO `reply` VALUES ('11', '26', '6', 'å·¥ç¨é¨æèºè¡¨æ¼å®ç¾ç»æï¼', 'å¤§é¥±ç¼ç¦ï¼ å¤§åçèµã', '2016-11-22 13:25:13');
INSERT INTO `reply` VALUES ('12', '41', '6', 'dsadawdadasdad', 'dasdasdadsadsa', '2016-11-22 13:25:23');
INSERT INTO `reply` VALUES ('13', '1', '1', 'whhwehg', 'hwerhwe', '2016-11-23 15:33:23');
INSERT INTO `reply` VALUES ('14', '1', '2', 'egwgewgwe', 'gewrherwg', '2016-11-23 15:34:10');
INSERT INTO `reply` VALUES ('15', '1', '8', 'åå¤ï¼å·å', 'ç¡®å®', '2016-11-23 15:43:41');
INSERT INTO `reply` VALUES ('16', '1', '11', 'ç²¾è±', 'egewgwe', '2016-11-23 16:16:14');
INSERT INTO `reply` VALUES ('17', '48', '1', 'åå¤ï¼ä¸éªåçå¬å¸æ¯è²', 'hehe ', '2016-11-23 18:45:12');
INSERT INTO `reply` VALUES ('18', '1', '2', 'çæåçç', 'ä¸æ¹éªçµ', '2016-11-25 11:55:11');
INSERT INTO `reply` VALUES ('19', '1', '7', '111', '1111', '2016-11-25 11:55:39');
INSERT INTO `station` VALUES ('1', '4', 'åºåéå®ç»ç', 'è´è´£å¬å¸éå®é¨å¨æä¸çå¸æå°åºçéå®', '1');
INSERT INTO `station` VALUES ('2', '3', 'éå®å·¥ç¨å¸', 'è½å¤ç¬ç«ç®¡çåç­åååçåºåéå®ï¼è¥éä¸å¡çé«çº§éå®äººæï¼å·ææé«çå¸åºç»éªåææçå¸åºè§å¯åï¼åæåï¼è¦æ±è½å¤ç¬ç«ç®¡çååçéå®ä¸å¡', '1');
INSERT INTO `station` VALUES ('3', '3', 'éå®ä»£è¡¨', 'ä»£è¡¨ä¼ä¸è¿è¡äº§åéå®çéå®äººå', '1');
INSERT INTO `station` VALUES ('4', '1', 'å®¢æ·ä»£è¡¨', 'åå®¢æ·å»ºç«èç³»ï¼ä¿æèç³»ï¼ä¸ºå¬å¸å¸¦æ¥å®¢æ·çè®¢åï¼ä¸ºå®¢æ·æ¨èå¬å¸æ¨åºçææ°é¡¹ç®ï¼å¹¶éæ¶ä¸ºå®¢æ·æä¾æå¡ï¼è§£å³å®¢æ·å¨ä½¿ç¨å¬å¸äº§åææå¡éå°çé®é¢', '1');
INSERT INTO `station` VALUES ('5', '3', 'é¦å¸­è¥éå®', 'å¨ä¼ä¸ä¸­å¯¹è¥éææ³è¿è¡å®ä½ï¼ææ¡å¸åºæºä¼ï¼å¶å®å¸åºè¥éæç¥åå®æ½è®¡åï¼å®æä¼ä¸çè¥éç®æ ï¼åè°ä¼ä¸åå¤é¨å³ç³»ï¼å¯¹ä¼ä¸å¸åºè¥éæç¥è®¡åçæ§è¡è¿è¡çç£åæ§å¶ï¼è´è´£ä¼ä¸è¥éç»ç»å»ºè®¾ä¸æ¿å±å·¥ä½', '1');
INSERT INTO `station` VALUES ('6', '3', 'å¸åºç­å', 'ä»äºåºç¨ç§å­¦çæç»´åæ¹æ³ï¼å¯¹ä»¥èµ¢å©ä¸ºç®ççç¤¾ä¼ç»æµç»ç»çæ´ä½æ´»å¨è¿è¡ç³»ç»ãç§å­¦çåé ææãè°ååè®¾è®¡ï¼ä»¥æè¾¾å°æä½³ææ', '1');
INSERT INTO `station` VALUES ('7', '3', 'å¸åºä¸å', 'éå®åçä¸ä¸åç§°ï¼ä½ç¸å¯¹äºéå®åçè¦æ±æ´é«ï¼éè¦æ´å¤çä¸ä¸ç¥è¯,ä¸ä¸æ¯è¯­ï¼ä¸æ®éçè¥éäººåæä¸å®çåºå', '1');
INSERT INTO `station` VALUES ('8', '1', 'å¬å³ç»ç', 'è®¡ååæå¯¼å¬å³é¡¹ç®ä»¥åé åç»´æå¬å¸çå¬ä¼å½¢è±¡', '1');
INSERT INTO `station` VALUES ('9', '1', 'å¬å³ä¸å', 'æè°çå¬å³ä¸åéè¦å·å¤å¾é«çç»¼åç´ è´¨ï¼é¤äºåºä¼çå¤è¡¨åäººéå¤çè½åï¼æ´éè¦çæ¯å·å¤åºè²çé®é¢æææ§ï¼å¯¹å¯è½çå±æºåäº§çä¸è¯å½±åçå ç´ åäºä»¶ææéçç¥è§', '1');
INSERT INTO `station` VALUES ('10', '1', 'ä¼å¡ä¸å', 'ä¸»è¦è´è´£å®æåå®¾ç­¾å°ãä½å®¿åé¤é¥®ï¼åå¤ä¿å«ï¼å¶ä½ä¼è®®éè®¯å½ï¼åå¤ä¼è®®æéè¦çä¼è®®ç¨åç­çç¢å·¥ä½', '1');
INSERT INTO `station` VALUES ('11', '5', 'é¦å¸­ææ¯å®', 'ææ¯èµæºçè¡æ¿ç®¡çè', '1');
INSERT INTO `station` VALUES ('12', '5', 'é¦å¸­ä¿¡æ¯å®', 'è´è´£ä¸ä¸ªå¬å¸ä¿¡æ¯ææ¯åç³»ç»ææé¢å', '1');
INSERT INTO `station` VALUES ('13', '5', 'ææ¯æ»ç', 'è´è´£ä¸ä¸ªä¼ä¸çææ¯ç®¡çä½ç³»çå»ºè®¾åç»´æ¤ï¼å¶å®ææ¯ä¸å·ææ·±å¥çè§£ï¼å¯¹è¡ä¸ææ¯åå±è¶å¿åç®¡çç°ç¶å·æåç¡®çå¤æ­', '1');
INSERT INTO `station` VALUES ('14', '5', 'é«çº§è½¯ä»¶å·¥ç¨å¸', 'ç¬ç«æ¿æé¡¹ç®è½¯ä»¶å¼åï¼\r\nåä¸é¡¹ç®çæ´ä½è§åä¸å®æ½ï¼\r\nè´è´£ä¸é¡¹ç®ç»çå±åè¿è¡å®¢æ·è°ç ãä¸å¡æµç¨åæè®¾è®¡ï¼\r\nè´è´£ç³»ç»çæ»ä½ææ¯æ¹æ¡ä¸ç³»ç»è®¾è®¡ï¼ç³»ç»çè´¨éæ§å¶ï¼\r\nè´è´£è·å®¢æ·æ²éè§£å³é®é¢', '1');
INSERT INTO `station` VALUES ('15', '5', 'ç¡¬ä»¶å·¥ç¨å¸', 'çæè®¡ç®æºå¸åºè¡æï¼å¶å®è®¡ç®æºç»è£è®¡åï¼è½å¤éè´­ç»è£éè¦çç¡¬ä»¶è®¾å¤ï¼å¹¶è½åçéç½®ãå®è£è®¡ç®æºåå¤å´è®¾å¤ï¼å®è£åéç½®è®¡ç®æºè½¯ä»¶ç³»ç»ï¼ä¿å»ç¡¬ä»¶åå¤å´è®¾å¤ï¼æ¸æ°æè¿°åºç°çè®¡ç®æºè½¯ç¡¬ä»¶æé', '1');
INSERT INTO `station` VALUES ('16', '5', 'äºèç½è½¯ä»¶å¼åå·¥ç¨å¸', 'è¿è¡ç½ç«åºç¨æå¡ãæ¨¡åè®¾è®¡ç­ç½ç«å»ºè®¾å·¥ä½', '1');
INSERT INTO `station` VALUES ('17', '5', 'ç½ç»å·¥ç¨å¸', 'ä»äºè®¡ç®æºä¿¡æ¯ç³»ç»çè®¾è®¡ãå»ºè®¾ãè¿è¡åç»´æ¤å·¥ä½', '1');
INSERT INTO `station` VALUES ('18', '5', 'ä¿¡æ¯ææ¯ç»ç', 'ä¸»è¦ä»¥å¤é¨æ¯æåè¾å©ä¸»è¥ä¸å¡ä¸ºå·¥ä½åå®¹ï¼éè¦ç®¡çä¿¡æ¯ææ¯å¢éï¼ä¸åé¨é¨åè°éåï¼ä¸ºåé¨é¨æä¾ä¿¡æ¯ææ¯æ¯æ', '1');
INSERT INTO `station` VALUES ('19', '5', 'è´¨éå·¥ç¨å¸', 'è¦å·å¤åä¸ä¼ä¸è´¨éå·¥ä½æ»ä½ç­åçè½åï¼è½å·ä½è´è´£è½å®ä¼ä¸çè´¨éæ¹éåè´¨éç®æ ï¼è¿è¡ç°åºæå¯¼åå¸®å©è§£å³å®éè´¨éé®é¢', '1');
INSERT INTO `station` VALUES ('20', '5', 'ç³»ç»å·¥ç¨å¸', 'å·å¤è¾é«ä¸ä¸ææ¯æ°´å¹³ï¼è½å¤åæåä¸éæ±ï¼å¹¶ä½¿ç¨åç§ç³»ç»å¹³å°åæå¡å¨è½¯ä»¶æ¥è®¾è®¡å¹¶å®ç°åå¡è§£å³æ¹æ¡çåºç¡æ¶æ', '1');
INSERT INTO `station` VALUES ('21', '5', 'ç³»ç»åæå¸', 'å·æä»äºè®¡ç®æºåºç¨ç³»ç»çåæåè®¾è®¡å·¥ä½è½ååä¸å¡æ°´å¹³ï¼è½æå¯¼ç³»ç»è®¾è®¡å¸åé«çº§ç¨åºå', '1');
INSERT INTO `station` VALUES ('22', '5', 'æ¶æå¸', 'æ¢éè¦ææ§æ´ä½åéè¦æ´æå±é¨ç¶é¢å¹¶ä¾æ®å·ä½çä¸å¡åºæ¯ç»åºè§£å³æ¹æ¡', '1');
INSERT INTO `station` VALUES ('23', '5', 'æ°æ®åºç®¡çå', 'ä»äºç®¡çåç»´æ¤æ°æ®åºç®¡çç³»ç»', '1');
INSERT INTO `station` VALUES ('24', '1', 'è¡æ¿ç»ç', 'è®¡åãæå¯¼ååè°æºæçæ¯ææ§æå¡ï¼å¦è®°å½ä¿å­ãé®ä»¶ååãçµè¯/åå°æ¥å¾åå¶å®åå¬å®¤æ¯ææå¡ãåæ¬çç£è®¾å¤çåå¤ãç»´æ¤åä¿ç®¡', '1');
INSERT INTO `station` VALUES ('25', '4', 'äººåèµæºæ»ç', 'ä»æç¥é«åº¦åªåæå»ºé«æå®ç¨çäººåèµæºç®¡çç³»ç»ï¼æåè¿è¡äººæéæï¼å»ºç«ç§å­¦çèæ ¸ä¸æ¿å±æºå¶ï¼æå¤§éåº¦å°æ¿åäººææ½è½ï¼åå»ºä¼ç§å¢éï¼å¡é åè¶çä¼ä¸æåï¼æ¨å¨ç»ç»åé©ä¸åæ°ï¼æç»å®ç°ç»ç»çæç»­åå±', '1');
INSERT INTO `station` VALUES ('26', '4', 'äººåèµæºç»ç', 'è®¡åãæå¯¼ååè°æºæçäººäºæ´»å¨ï¼ç¡®ä¿äººåèµæºåçå©ç¨ï¼ç®¡ççèµãäººäºç­ç¥åæèç­', '1');
INSERT INTO `station` VALUES ('27', '4', 'äººåèµæºä¸å', 'äººåèµæºçå¥é¨èä¸', '1');
INSERT INTO `station` VALUES ('28', '2', 'é¦å¸­è´¢å¡å®', 'ä»æç¥é«åº¦ææ¡è´¢å¡ç®¡çãå¬å¸æ²»çãèµæ¬è¿è¥ç­æ¹é¢çç¥è¯åå¶è¿ä½ææ®µï¼å¿é¡»å¤§éæ¥è§¦å½åå¤åæ²¿æ§çè´¢å¡ç®¡çç¥è¯åä¿¡æ¯ï¼çæ­£å·å¤å¨çæç¥ç¼åãæ·±å¥äºè§£ç¸å³å½éè§å', '1');
INSERT INTO `station` VALUES ('29', '2', 'è´¢å¡åæç»ç', 'éè¦å»ºç«åå®åè´¢å¡åæä½ç³»ï¼åå©æ¶éãä¿®è®¢åå¶å®å¬å¸çåé¨è´¢å¡æ§å¶å¶åº¦å¹¶çç£æ§è¡ï¼è¿è¦å®æç¼å¶è´¢å¡åææ¥è¡¨', '1');
INSERT INTO `station` VALUES ('30', '2', 'å®¡è®¡ä¸å', 'ä¸»è¦æ¯ç¼åå®¡è®¡æ¥åï¼åå©æ¿åºåä¼è®¡å¸äºå¡æå¯¹å¬å¸çå®¡è®¡æ´»å¨ï¼ä»¥åæå³å®¡è®¡èµæåå§è°æ¥çæ¶éãæ´çãå»ºæ¡£å·¥ä½', '1');
INSERT INTO `station` VALUES ('31', '1', 'æå', 'åäºæå­å¤çãææ¡£æ´çãå¤å°æä»¶ãæ¥å¬çµè¯åå¤çåå¬å®¤æ¥å¸¸äºå¡ï¼æ¥å¾å®¢äººãæ¸æ´å«çãè´­ä¹°åå¬ç¨åç­ï¼ä¹ç±»çå·¥ä½', '1');
INSERT INTO `station` VALUES ('32', '1', 'ç§ä¹¦', 'åå­æ¥¼ååä¸æºæåçæåèä½ï¼ä¸é¿æ¯éè®°ãæå­ãå®ææ¥ç¨ãä¼è®®ãè®¢æºç¥¨ãè®¢éåºç­', '1');
INSERT INTO `station` VALUES ('33', '6', 'æ»ç»ç', 'ä¸ä¸ªå¬å¸çæé«é¢å¯¼äººæè¯¥å¬å¸çåå§äºº', '1');
INSERT INTO `station` VALUES ('34', '1', '', '', '0');
INSERT INTO `station` VALUES ('35', '2', 'è´¢å¡ç»ç', 'ç®¡çè´¢å¡', '1');
INSERT INTO `station` VALUES ('36', '5', 'javaå·¥ç¨å¸', 'è´è´£javaé¡¹ç®å¼å', '0');
INSERT INTO `station` VALUES ('37', '3', '', '', '1');
INSERT INTO `topic` VALUES ('1', '1', '1', 'ä¸éªåçå¬å¸æ¯è²', 'ä¸éªåçå¬å¸æ«ä¸ä¸å±ç½è£ï¼æ¾å¾æ´å çæ¼äº®!', '2016-09-01 00:00:00', '2016-09-01 00:00:00', '1', '23', '1');
INSERT INTO `topic` VALUES ('2', '2', '1', 'ææ¯é¨å¬æ³³æ´»å¨å®ç¾ç»æ', 'ææ¯é¨ç»ç»åå·¥å¬æ³³ï¼æ¢äºææçåå·¥ççå¾åå®³ï¼æé«åå·¥æå¯è½åã', '2016-09-01 00:00:00', '2016-09-01 00:00:00', '2', '16', '1');
INSERT INTO `topic` VALUES ('3', '6', '1', 'å¤§éªçº·é£', 'å¥½å¤§çéªå  å°ä¸å¨ç½äº å ç§¯çå¥½åï¼', '2016-09-03 10:12:15', '2016-11-03 13:33:41', '0', '7', '1');
INSERT INTO `topic` VALUES ('4', '23', '5', 'å·¥ç¨é¨æèºè¡¨æ¼å®ç¾ç»æï¼', 'å·¥ç¨é¨ä¸¾è¡çæèºè¡¨æ¼å®ç¾ç»æäºï¼è®©æä»¬å¤§é¥±ç¼ç¦ï¼ æ²¡æ³å°æä»¬å¬å¸çäººççæ¯å¤æå¤èºï¼', '2016-09-04 00:00:00', '2016-09-05 00:00:00', '2', '13', '1');
INSERT INTO `topic` VALUES ('5', '42', '5', 'gegaew', 'wdawdawddawda', '2016-09-07 10:15:19', '2016-09-07 16:23:47', '3', '15', '1');
INSERT INTO `topic` VALUES ('6', '26', '5', 'wgeege', 'wadawdawdawd', '2016-09-09 11:26:03', '2016-09-11 09:04:49', '1', '3', '1');
INSERT INTO `topic` VALUES ('7', '1', '1', 'åè®¡æ¶ç¬¬äºå¤©', 'åååå', '2016-11-24 00:00:00', '2016-11-24 00:00:00', '2', '12', '1');
INSERT INTO `topic` VALUES ('8', '1', '1', 'å·å', 'å¯å¯', '2016-11-23 15:43:20', '2016-11-23 15:43:20', '0', '0', '1');
INSERT INTO `topic` VALUES ('9', '1', '5', 'dbsd', 'bebwe', '2016-11-23 00:00:00', '2016-11-23 00:00:00', '2', '0', '1');
INSERT INTO `topic` VALUES ('10', '1', '5', 'wgewge', 'ewge', '2016-11-23 16:03:00', '2016-11-23 16:03:00', '0', '0', '1');
INSERT INTO `topic` VALUES ('11', '1', '5', 'wg', 'egw', '2016-11-23 00:00:00', '2016-11-23 00:00:00', '0', '0', '1');
INSERT INTO `topic` VALUES ('12', '1', '1', 'ææµªå¿å¦', 'åç»§å¡', '2016-10-11 10:22:31', '2016-10-11 10:22:31', '0', '42', '1');
INSERT INTO `topic` VALUES ('13', '1', '1', 'äºéé¢', 'æåèçº½çº¦çæ', '2016-09-07 10:23:24', '2016-09-07 10:23:24', '0', '0', '1');
INSERT INTO `topic` VALUES ('14', '1', '1', 'é¿åå¥³æè®¿', 'åæ»åç®å¬å¸', '2016-11-15 10:24:11', '2016-11-15 10:24:11', '0', '0', '1');
INSERT INTO `topic` VALUES ('15', '1', '1', 'ççº³å·®ç©ºé´', 'ä½ä»£ä»·çå¤§å¤§', '2016-11-22 10:24:50', '2016-11-22 10:24:50', '0', '0', '1');
INSERT INTO `topic` VALUES ('16', '1', '1', 'å´æ æ³å»ç©', 'æ²åå¥¥æ¯å¡å¤§', '2016-11-21 10:25:22', '2016-11-21 10:25:22', '0', '0', '1');
INSERT INTO `topic` VALUES ('17', '1', '1', 'ç±SDå¡ä¸å­£åº¦å¡', 'è¾¾ææçå¤§äºå£', '2016-11-20 10:25:48', '2016-11-20 10:25:48', '0', '0', '1');
INSERT INTO `topic` VALUES ('18', '1', '1', 'å°±çå°ä½ å¡æºç', 'é£å æ¬¾å¤ç ', '2016-11-07 10:26:14', '2016-11-07 10:26:14', '0', '0', '1');
INSERT INTO `topic` VALUES ('19', '1', '1', 'é£å°½å¿«æå¼å°±è½', 'çé£å°±çäºå°±çäº', '2016-11-14 10:26:39', '2016-11-14 10:26:39', '0', '0', '1');
INSERT INTO `topic` VALUES ('20', '1', '1', 'çé£åæ©åå', 'å®æå¡äºå', '2016-11-19 10:27:04', '2016-11-19 10:27:04', '0', '0', '1');
INSERT INTO `topic` VALUES ('21', '2', '3', 'åå±±ä¸æ½å', 'ç¬¬ä¸æ¹äºå·çº¿', '2016-11-24 11:34:43', '2016-11-24 11:34:43', '0', '0', '1');
INSERT INTO `topic` VALUES ('22', '1', '9', 'è®¾å¤å¦ä½', 'dsgegrgeerh', '2016-11-24 15:24:44', '2016-11-24 15:24:44', '0', '0', '1');
