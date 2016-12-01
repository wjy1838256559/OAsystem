/*
MySQL Data Transfer
Source Host: localhost
Source Database: oa
Target Host: localhost
Target Database: oa
Date: 2016/11/25 ������ 7:01:55
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
CREATE TABLE `admin` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `pwd` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for checker
-- ----------------------------
CREATE TABLE `checker` (
  `id` int(10) NOT NULL auto_increment,
  `eId` int(10) NOT NULL,
  `state` int(2) NOT NULL default '0' COMMENT '1表示已签到，0表示未签到',
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
  `dName` varchar(10) default NULL COMMENT '部门名称',
  `description` varchar(100) default NULL COMMENT '部门描述',
  `state` int(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
CREATE TABLE `employee` (
  `id` int(10) NOT NULL auto_increment,
  `sId` int(10) NOT NULL COMMENT '连接岗位外键',
  `number` varchar(10) NOT NULL,
  `name` varchar(8) NOT NULL COMMENT '姓名',
  `phonenumber` varchar(11) default NULL COMMENT '手机号',
  `startDate` date default NULL COMMENT '入职时间',
  `endDate` date default NULL COMMENT '离职时间',
  `pwd` varchar(255) default '000000' COMMENT '密码',
  `money` decimal(10,0) default NULL COMMENT '工资',
  `workExperience` varchar(255) default NULL COMMENT '工作经验',
  `state` int(2) default '1' COMMENT '状态  1表示可用  0表示不可用',
  `loseTime` int(10) default '0' COMMENT '缺勤数',
  `image` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `c` (`sId`),
  CONSTRAINT `c` FOREIGN KEY (`sId`) REFERENCES `station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for forum
-- ----------------------------
CREATE TABLE `forum` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `name` varchar(255) default NULL COMMENT '板块名称',
  `description` varchar(255) default NULL COMMENT '板块描述',
  `topicCount` int(11) default NULL COMMENT '主题数量',
  `articleCount` int(11) default NULL COMMENT '文章数量',
  `state` int(11) default NULL COMMENT '状态：1表示可用，0表示不可用',
  `position` int(11) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for leavelist
-- ----------------------------
CREATE TABLE `leavelist` (
  `id` int(10) NOT NULL auto_increment,
  `eId` int(10) NOT NULL COMMENT '外键 连接员工表',
  `reason` varchar(200) default NULL COMMENT '请假原因',
  `date` date default NULL COMMENT '请假时间',
  `state` int(1) default '1' COMMENT '状态  1时表示待审批  2表示审批成功  3表示审批拒绝  4表示过期',
  `cstate` int(2) default '1' COMMENT '是否存在的state',
  PRIMARY KEY  (`id`),
  KEY `e` (`eId`),
  CONSTRAINT `e` FOREIGN KEY (`eId`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notify
-- ----------------------------
CREATE TABLE `notify` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `eId` int(11) NOT NULL COMMENT '员工外键',
  `content` varchar(255) default NULL,
  `sendTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for performance
-- ----------------------------
CREATE TABLE `performance` (
  `id` int(10) NOT NULL auto_increment,
  `eId` int(10) NOT NULL COMMENT '连接员工表的外键 ',
  `expectNum` decimal(10,0) default NULL COMMENT '期望值',
  `finishNum` decimal(10,0) default '0' COMMENT '完成值',
  `startDate` date default NULL COMMENT '开始日期',
  `endDate` date default NULL COMMENT '结束日期',
  `bonus` decimal(10,0) default NULL COMMENT '金钱',
  `state` int(2) NOT NULL default '0' COMMENT '表示审批状态  0表示未审批  1表示审批',
  `repState` int(2) NOT NULL default '0' COMMENT '表示提醒的状态   0表示未提醒  1表示已提醒',
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
  `name` varchar(8) default NULL COMMENT '权限名称',
  `url` varchar(255) default NULL COMMENT '路径',
  PRIMARY KEY  (`id`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `parentId` FOREIGN KEY (`parentId`) REFERENCES `privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for privilege_role
-- ----------------------------
CREATE TABLE `privilege_role` (
  `id` int(10) NOT NULL auto_increment,
  `privilegeID` int(10) NOT NULL COMMENT '外键连接权限表',
  `roleId` int(10) NOT NULL COMMENT '外键连接角色表',
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
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `authorId` int(11) default NULL COMMENT '员工Id',
  `topicId` int(11) default NULL COMMENT '主题Id',
  `title` varchar(255) default NULL COMMENT '标题',
  `content` varchar(255) default NULL COMMENT '回复内容',
  `postTime` datetime default NULL COMMENT '发表时间',
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
  `name` varchar(8) default NULL COMMENT '角色名',
  `description` varchar(255) default NULL COMMENT '角色描述',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for station
-- ----------------------------
CREATE TABLE `station` (
  `id` int(10) NOT NULL auto_increment,
  `dId` int(10) NOT NULL default '1',
  `sName` varchar(10) default NULL COMMENT '岗位名称',
  `description` varchar(100) default NULL COMMENT '岗位描述',
  `state` int(2) NOT NULL default '1' COMMENT '1表示存在，0表示不存在',
  PRIMARY KEY  (`id`),
  KEY `ertyu` (`dId`),
  CONSTRAINT `ertyu` FOREIGN KEY (`dId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
CREATE TABLE `topic` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `authorId` int(11) default NULL COMMENT '员工Id',
  `forumId` int(11) default NULL COMMENT '板块Id',
  `title` varchar(255) default NULL COMMENT '题目',
  `content` varchar(255) default NULL COMMENT '内容',
  `postTime` datetime default NULL COMMENT '发表时间',
  `lastUpdateTime` datetime default NULL COMMENT '最后更新时间',
  `type` int(11) default NULL COMMENT '主题类型',
  `replyCount` int(11) default NULL COMMENT '回复数量',
  `state` int(11) default '1' COMMENT '状态：1表示可用，0表示不可用',
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
INSERT INTO `department` VALUES ('1', '行政部', '管理行政', '1');
INSERT INTO `department` VALUES ('2', '人力资源', '人事招聘与培训', '1');
INSERT INTO `department` VALUES ('3', '营销部', '负责对公司产品价值实现过程中各销售环节实行管理、监督、协调、服务', '1');
INSERT INTO `department` VALUES ('4', '人力资源部', '对企业中各类人员形成的资源（即把人作为资源）进行管理', '1');
INSERT INTO `department` VALUES ('5', '技术部', '负责技术开发', '1');
INSERT INTO `department` VALUES ('6', '管理', '一个公司的总管理', '1');
INSERT INTO `department` VALUES ('7', '培训部', '负责新人的培训工作', '1');
INSERT INTO `employee` VALUES ('1', '13', '201609001', '宋杰', '18266598634', '2016-09-01', '2017-01-01', '670b14728ad9902aecba32e22fa4f6bd', '0', '8', '1', '12', 'avatar.png');
INSERT INTO `employee` VALUES ('2', '5', '201609002', '顾长卫', '18635496273', '2016-09-01', '2017-01-01', '000000', '0', '8 ', '1', '45', 'avatar04.png');
INSERT INTO `employee` VALUES ('3', '11', '201609003', '左玉泉', '19567532495', '2016-09-01', '2017-01-01', '000000', '9000', '8', '1', '0', 'avatar5.png');
INSERT INTO `employee` VALUES ('4', '12', '201609004', '聂超', '17564982375', '2016-09-01', '2017-01-01', '000000', '8500', '8', '1', '0', 'avatar3.png');
INSERT INTO `employee` VALUES ('5', '25', '201609005', '李立三', '18532649762', '2016-09-01', '2017-01-01', '000000', '0', '8', '0', '0', 'avatar2.png');
INSERT INTO `employee` VALUES ('6', '28', '201609006', '褚启元', '12683459762', '2016-09-01', '2017-01-01', '000000', '0', '8', '0', '0', null);
INSERT INTO `employee` VALUES ('7', '24', '201609007', '王佩瑶', '18526437925', '2016-09-01', '2017-01-01', '000000', '8300', '8', '1', '0', null);
INSERT INTO `employee` VALUES ('8', '1', '201609008', '张云川', '13248657924', '2016-09-01', '2017-01-01', '000000', '5000', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('9', '2', '201609009', '陈紫涵', '16486293468', '2016-09-01', '2017-01-01', '000000', '6000', '5', '1', '0', null);
INSERT INTO `employee` VALUES ('10', '3', '201609010', '陈数', '18659433864', '2016-09-01', '2017-01-01', '000000', '6500', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('11', '4', '201609011', '陈宝莲', '16486459723', '2016-09-01', '2017-01-01', '000000', '0', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('12', '5', '201609012', '杨子佩', '19854623764', '2016-09-01', '2017-01-01', '000000', '5400', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('13', '6', '201609013', '刘金良', '18452673946', '2016-09-01', '2017-01-01', '000000', '5500', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('14', '7', '201609014', '杨思锐', '18792184645', '2016-09-01', '2017-01-01', '000000', '0', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('15', '9', '201609015', '张汉涛', '18452369752', '2016-09-01', '2017-01-01', '000000', '6900', '5', '1', '0', null);
INSERT INTO `employee` VALUES ('16', '10', '201609016', '赵焕臣', '13546988267', '2016-09-01', '2017-01-01', '000000', '0', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('17', '14', '201609017', '陈昌浩', '15842673956', '2016-09-01', '2017-01-01', '000000', '5300', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('18', '15', '201609018', '孙岳颁', '14852673954', '2016-09-01', '2017-01-01', '000000', '6200', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('19', '16', '201609019', '刘明明', '16485269875', '2016-09-01', '2017-01-01', '000000', '5900', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('20', '17', '201609020', '陈志朋', '15487985268', '2016-09-01', '2017-01-01', '000000', '5700', '1', '1', '0', null);
INSERT INTO `employee` VALUES ('21', '18', '201609021', '赵昆', '15487993256', '2016-09-01', '2017-01-01', '000000', '6200', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('22', '19', '201609022', '郭长久', '15487952368', '2016-09-01', '2017-01-01', '000000', '6400', '1', '1', '0', null);
INSERT INTO `employee` VALUES ('23', '20', '201609023', '马晓天', '15478963236', '2016-09-01', '2017-01-01', '000000', '6800', '1', '1', '0', null);
INSERT INTO `employee` VALUES ('24', '21', '201609024', '朱昌权', '12654789335', '2016-09-01', '2017-01-01', '000000', '6100', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('25', '22', '201609025', '罗虚百', '16549679878', '2016-09-01', '2017-01-01', '000000', '5800', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('26', '23', '201609026', '梁展强', '14656143238', '2016-09-01', '2017-01-01', '000000', '5300', '1', '1', '0', null);
INSERT INTO `employee` VALUES ('27', '24', '201609027', '孙奎', '16574947631', '2016-09-01', '2017-01-01', '000000', '5900', '1', '1', '0', null);
INSERT INTO `employee` VALUES ('28', '26', '201609028', '郭朝平', '16345979432', '2016-09-01', '2017-01-01', '000000', '6800', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('29', '29', '201609029', '刘瑞林', '19845623752', '2016-09-01', '2017-01-01', '000000', '6500', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('30', '27', '201609030', '罗雄才', '18462326496', '2016-09-01', '2017-01-01', '000000', '6500', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('31', '30', '201609031', '马福康', '18754269396', '2016-09-01', '2017-01-01', '000000', '5600', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('32', '31', '201609032', '周国贤', '18452669975', '2016-09-01', '2017-01-01', '000000', '5400', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('33', '32', '201609033', '徐乾清', '15874452698', '2016-09-01', '2017-01-01', '000000', '5900', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('34', '1', '201609034', '郭威杰', '18562347586', '2016-09-01', '2017-01-01', '000000', '5800', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('35', '1', '201609035', '徐松根', '16854235975', '2016-09-01', '2017-01-01', '000000', '5400', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('36', '2', '201609036', '孙纯一', '15842673956', '2016-09-01', '2017-01-01', '670b14728ad9902aecba32e22fa4f6bd', '0', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('37', '3', '201609037', '罗绍威', '13457956285', '2016-09-01', '2017-01-01', '000000', '6700', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('38', '4', '201609038', '孙鸿烈', '16547892526', '2016-09-01', '2017-01-01', '000000', '5500', '5', '1', '0', null);
INSERT INTO `employee` VALUES ('39', '7', '201609039', '罗元德', '18653235847', '2016-09-01', '2017-01-01', '000000', '5300', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('40', '7', '201609040', '马启伟', '17954268536', '2016-09-01', '2017-01-01', '000000', '5200', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('41', '9', '201609041', '孙岳颁', '14357989625', '2016-09-01', '2017-01-01', '000000', '5800', '2', '1', '0', null);
INSERT INTO `employee` VALUES ('42', '9', '201609042', '郭晋安', '15324879964', '2016-09-01', '2017-01-01', '000000', '6200', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('43', '10', '201609043', '马烈孙', '18452679536', '2016-09-01', '2017-01-01', '000000', '6800', '4', '1', '0', null);
INSERT INTO `employee` VALUES ('44', '27', '201609044', '徐世焘', '19562354789', '2016-09-01', '2017-01-01', '000000', '6700', '3', '1', '0', null);
INSERT INTO `employee` VALUES ('45', '27', '201609045', '孙思邈', '18452674953', '2016-09-01', '2017-01-01', '000000', '0', '2', '0', '0', null);
INSERT INTO `employee` VALUES ('46', '30', '201609046', '马玉涛', '17562438964', '2016-09-01', '2017-01-01', '000000', '5900', '0', '1', '0', null);
INSERT INTO `employee` VALUES ('47', '31', '201609047', '郭功森', '18645237956', '2016-09-01', '2017-01-01', '000000', '5600', '1', '0', '0', null);
INSERT INTO `employee` VALUES ('48', '11', '201611023', '公子羽', '18119612521', '2016-11-23', null, '000000', '0', '5', '0', '0', 'oaC.jpg');
INSERT INTO `employee` VALUES ('49', '29', '201611240', '褚先', '1789878902', '2016-11-01', null, '000000', '0', '7', '0', '0', '');
INSERT INTO `employee` VALUES ('50', '1', '201609888', '左键', '18612345678', '2016-11-09', null, '670b14728ad9902aecba32e22fa4f6bd', '9000', '5', '0', '0', 'a.jpg');
INSERT INTO `forum` VALUES ('1', '公司精英汇聚', '公司各部门精英讨论区。', '14', '114', '1', '0');
INSERT INTO `forum` VALUES ('2', '公司日常生活大杂烩', '聊公司日常生活，日常管理吐槽区。', '3', '38', '0', '0');
INSERT INTO `forum` VALUES ('3', '公司休息时间休闲区', '公司各人员可以聊家常，聊追剧。', '0', '0', '1', '0');
INSERT INTO `forum` VALUES ('4', '公司特色展示区', '展示公司活动，特色的地方。', '0', '0', '0', '0');
INSERT INTO `forum` VALUES ('5', '测试页面', '测试', '1', '1', '1', '3');
INSERT INTO `forum` VALUES ('7', '校园', '学生的空间', '0', '0', '1', '1');
INSERT INTO `forum` VALUES ('8', '公司休息时间休闲区', '公司各人员可以聊家常，聊追剧。', '0', '0', '1', '2');
INSERT INTO `forum` VALUES ('9', '校园', '学生的空间', '0', '0', '1', '0');
INSERT INTO `forum` VALUES ('10', '公司特色展示区', '展示公司活动，特色的地方。', '4', '2', '1', '1');
INSERT INTO `forum` VALUES ('11', '公司日常生活大杂烩', '聊公司日常生活，日常管理吐槽区。', '2', '4', '2', '1');
INSERT INTO `forum` VALUES ('12', '公司精英汇聚', '公司各部门精英讨论区。', '7', '3', '2', '1');
INSERT INTO `forum` VALUES ('13', ' 测试页面', '测试', '27', '21', '2', '1');
INSERT INTO `forum` VALUES ('14', ' 校园', '学生的空间', '25', '2', '1', '1');
INSERT INTO `forum` VALUES ('15', ' 公司特色展示区', '展示公司活动，特色的地方。', '15', '2', '3', '1');
INSERT INTO `forum` VALUES ('16', ' 公司休息时间休闲区', '公司各人员可以聊家常，聊追剧。', '11', '51', '2', '1');
INSERT INTO `forum` VALUES ('17', ' 公司精英汇聚', '公司各部门精英讨论区。', '10', '12', '23', '1');
INSERT INTO `forum` VALUES ('18', '公司特色展示区', '展示公司活动，特色的地方。', '13', '12', '1', '1');
INSERT INTO `forum` VALUES ('20', '答辩测试', '测试版块模块', '0', '0', '1', '1');
INSERT INTO `forum` VALUES ('23', '[object HTMLInputElement]', '[object HTMLInputElement]', '0', '0', '1', null);
INSERT INTO `leavelist` VALUES ('1', '39', '头疼，看病', '2016-11-02', '1', '1');
INSERT INTO `leavelist` VALUES ('2', '1', '父母来看望，陪父母', '2016-11-03', '1', '1');
INSERT INTO `leavelist` VALUES ('3', '26', '朋友结婚，吃喜酒', '2016-11-07', '1', '1');
INSERT INTO `leavelist` VALUES ('4', '1', '我失恋了，想散心', '2016-11-08', '3', '1');
INSERT INTO `leavelist` VALUES ('5', '1', '今天我结婚', '2016-11-08', '2', '1');
INSERT INTO `leavelist` VALUES ('6', '10', '表哥结婚，吃喜酒', '2016-11-09', '2', '1');
INSERT INTO `leavelist` VALUES ('7', '1', '身体不适，看病', '2016-11-11', '3', '0');
INSERT INTO `leavelist` VALUES ('8', '41', '目眩，看病', '2016-11-13', '2', '1');
INSERT INTO `leavelist` VALUES ('9', '1', '堂妹结婚，吃喜酒', '2016-11-14', '3', '1');
INSERT INTO `leavelist` VALUES ('10', '20', '祖母过世', '2016-11-14', '4', '1');
INSERT INTO `leavelist` VALUES ('11', '15', '肠胃不适，看病', '2016-11-15', '4', '1');
INSERT INTO `leavelist` VALUES ('12', '2', '女朋友生病，陪女友', '2016-11-16', '2', '1');
INSERT INTO `leavelist` VALUES ('13', '1', '高烧，看病', '2016-11-19', '4', '1');
INSERT INTO `leavelist` VALUES ('14', '47', '家里被盗，处理家事', '2016-11-21', '4', '1');
INSERT INTO `leavelist` VALUES ('15', '17', '今天我结婚', '2016-11-22', '4', '1');
INSERT INTO `leavelist` VALUES ('16', '27', '外祖父过世', '2016-11-28', '2', '1');
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
INSERT INTO `privilege` VALUES ('1', null, '基本管理', null);
INSERT INTO `privilege` VALUES ('2', '1', '人事管理', '/EmployeeListServlet');
INSERT INTO `privilege` VALUES ('3', '1', '部门管理', '/DepartmentServlet');
INSERT INTO `privilege` VALUES ('4', '1', '岗位管理', '/StationServlet');
INSERT INTO `privilege` VALUES ('5', '1', '绩效管理', '/PerformanceServlet');
INSERT INTO `privilege` VALUES ('6', '1', '考勤管理', '/CheckListServlet');
INSERT INTO `privilege` VALUES ('7', '2', '新增员工', '/AddEmployeeShowServlet');
INSERT INTO `privilege` VALUES ('8', '2', '修改员工', '/EmpolyeeShowServlet');
INSERT INTO `privilege` VALUES ('9', '2', '删除员工', '/EmployeeDeleteServlet');
INSERT INTO `privilege` VALUES ('10', '2', '初始化密码', '/InitPwdServlet');
INSERT INTO `privilege` VALUES ('11', '3', '新增部门', '/DepartmentAddServlet');
INSERT INTO `privilege` VALUES ('12', '3', '修改部门', '/DepartmentUpdateServlet');
INSERT INTO `privilege` VALUES ('13', '3', '删除部门', '/DepartmentDeleteServlet');
INSERT INTO `privilege` VALUES ('14', '4', '新增岗位', '/StationAddServlet');
INSERT INTO `privilege` VALUES ('15', '4', '修改岗位', '/StationUpdateServlet');
INSERT INTO `privilege` VALUES ('16', '4', '删除岗位', '/StationUpdateSqlServlet');
INSERT INTO `privilege` VALUES ('17', '4', '设置权限', '/StationSetPriServlet');
INSERT INTO `privilege` VALUES ('18', '5', '设置期望值', '/');
INSERT INTO `privilege` VALUES ('19', '5', '审批', '/');
INSERT INTO `privilege` VALUES ('20', '5', '提醒', '/');
INSERT INTO `privilege` VALUES ('21', '5', '提醒', '/');
INSERT INTO `privilege` VALUES ('22', null, '网上交流', null);
INSERT INTO `privilege` VALUES ('23', '22', '论坛', '/FornumServlet');
INSERT INTO `privilege` VALUES ('25', null, '审批流转', null);
INSERT INTO `privilege` VALUES ('26', '25', '审批流程管理', '/');
INSERT INTO `privilege` VALUES ('27', '25', '我的申请查询', '/');
INSERT INTO `privilege` VALUES ('28', '22', '论坛管理', '/FornumServlet');
INSERT INTO `reply` VALUES ('1', '2', '1', '下雪后的公司景色', '下雪啦 确实好美', '2016-09-01 09:00:36');
INSERT INTO `reply` VALUES ('2', '3', '1', '下雪后的公司景色', '是啊 好漂亮 就是好冷啊', '2016-09-01 09:01:03');
INSERT INTO `reply` VALUES ('3', '4', '1', '下雪后的公司景色', '大家注意保暖！', '2016-09-01 09:01:10');
INSERT INTO `reply` VALUES ('4', '4', '2', '技术部冬泳活动完美结束', '我参加了 哈哈  太刺激了。', '2016-11-22 13:23:05');
INSERT INTO `reply` VALUES ('5', '6', '2', '技术部冬泳活动完美结束', '看你们这么厉害 我在角落瑟瑟发抖', '2016-11-22 13:23:26');
INSERT INTO `reply` VALUES ('6', '13', '3', '技术部冬泳活动完美结束', '冬泳的都是大神 厉害厉害', '2016-11-22 13:23:54');
INSERT INTO `reply` VALUES ('7', '25', '3', '大雪纷飞', '这么快就入冬而且下这么大的雪  哈哈 兴奋', '2016-11-22 13:24:10');
INSERT INTO `reply` VALUES ('8', '24', '4', '大雪纷飞', '哈哈 待会可以打雪仗 拍雪景的', '2016-11-22 13:24:22');
INSERT INTO `reply` VALUES ('9', '17', '5', '工程部才艺表演完美结束！', '基哥唱的精忠报国可以的！', '2016-11-22 13:24:36');
INSERT INTO `reply` VALUES ('10', '35', '5', '工程部才艺表演完美结束！', '还不知道 我们公司这么多大神的啊 666', '2016-11-22 13:24:50');
INSERT INTO `reply` VALUES ('11', '26', '6', '工程部才艺表演完美结束！', '大饱眼福！ 大写的赞。', '2016-11-22 13:25:13');
INSERT INTO `reply` VALUES ('12', '41', '6', 'dsadawdadasdad', 'dasdasdadsadsa', '2016-11-22 13:25:23');
INSERT INTO `reply` VALUES ('13', '1', '1', 'whhwehg', 'hwerhwe', '2016-11-23 15:33:23');
INSERT INTO `reply` VALUES ('14', '1', '2', 'egwgewgwe', 'gewrherwg', '2016-11-23 15:34:10');
INSERT INTO `reply` VALUES ('15', '1', '8', '回复：冷啊', '确实', '2016-11-23 15:43:41');
INSERT INTO `reply` VALUES ('16', '1', '11', '精英', 'egewgwe', '2016-11-23 16:16:14');
INSERT INTO `reply` VALUES ('17', '48', '1', '回复：下雪后的公司景色', 'hehe ', '2016-11-23 18:45:12');
INSERT INTO `reply` VALUES ('18', '1', '2', '的所发生的', '东方闪电', '2016-11-25 11:55:11');
INSERT INTO `reply` VALUES ('19', '1', '7', '111', '1111', '2016-11-25 11:55:39');
INSERT INTO `station` VALUES ('1', '4', '区域销售经理', '负责公司销售部在某一省市或地区的销售', '1');
INSERT INTO `station` VALUES ('2', '3', '销售工程师', '能够独立管理和策划商品的区域销售，营销业务的高级销售人才；具有极高的市场经验和敏感的市场观察力，分析力；要求能够独立管理商品的销售业务', '1');
INSERT INTO `station` VALUES ('3', '3', '销售代表', '代表企业进行产品销售的销售人员', '1');
INSERT INTO `station` VALUES ('4', '1', '客户代表', '和客户建立联系，保持联系，为公司带来客户的订单，为客户推荐公司推出的最新项目，并随时为客户提供服务，解决客户在使用公司产品或服务遇到的问题', '1');
INSERT INTO `station` VALUES ('5', '3', '首席营销官', '在企业中对营销思想进行定位；把握市场机会，制定市场营销战略和实施计划，完成企业的营销目标；协调企业内外部关系，对企业市场营销战略计划的执行进行监督和控制；负责企业营销组织建设与激励工作', '1');
INSERT INTO `station` VALUES ('6', '3', '市场策划', '从事应用科学的思维和方法，对以赢利为目的的社会经济组织的整体活动进行系统、科学的创造构思、谋划和设计，以期达到最佳效果', '1');
INSERT INTO `station` VALUES ('7', '3', '市场专员', '销售员的专业名称，但相对于销售员的要求更高，需要更多的专业知识,专业术语，与普通的营销人员有一定的区分', '1');
INSERT INTO `station` VALUES ('8', '1', '公关经理', '计划和指导公关项目以创造和维持公司的公众形象', '1');
INSERT INTO `station` VALUES ('9', '1', '公关专员', '所谓的公关专员需要具备很高的综合素质，除了出众的外表和人际处理能力，更重要的是具备出色的问题敏感性，对可能的危机和产生不良影响的因素及事件有敏锐的知觉', '1');
INSERT INTO `station` VALUES ('10', '1', '会务专员', '主要负责安排嘉宾签到、住宿和餐饮，内勤保卫，制作会议通讯录，准备会议所需要的会议用品等琐碎工作', '1');
INSERT INTO `station` VALUES ('11', '5', '首席技术官', '技术资源的行政管理者', '1');
INSERT INTO `station` VALUES ('12', '5', '首席信息官', '负责一个公司信息技术和系统所有领域', '1');
INSERT INTO `station` VALUES ('13', '5', '技术总监', '负责一个企业的技术管理体系的建设和维护，制定技术业具有深入理解，对行业技术发展趋势和管理现状具有准确的判断', '1');
INSERT INTO `station` VALUES ('14', '5', '高级软件工程师', '独立承担项目软件开发；\r\n参与项目的整体规划与实施；\r\n负责与项目经理共同进行客户调研、业务流程分析设计；\r\n负责系统的总体技术方案与系统设计，系统的质量控制；\r\n负责跟客户沟通解决问题', '1');
INSERT INTO `station` VALUES ('15', '5', '硬件工程师', '熟悉计算机市场行情；制定计算机组装计划；能够选购组装需要的硬件设备，并能合理配置、安装计算机和外围设备；安装和配置计算机软件系统；保养硬件和外围设备；清晰描述出现的计算机软硬件故障', '1');
INSERT INTO `station` VALUES ('16', '5', '互联网软件开发工程师', '进行网站应用服务、模块设计等网站建设工作', '1');
INSERT INTO `station` VALUES ('17', '5', '网络工程师', '从事计算机信息系统的设计、建设、运行和维护工作', '1');
INSERT INTO `station` VALUES ('18', '5', '信息技术经理', '主要以外部支持和辅助主营业务为工作内容，需要管理信息技术团队，与各部门协调配合，为各部门提供信息技术支持', '1');
INSERT INTO `station` VALUES ('19', '5', '质量工程师', '要具备参与企业质量工作总体策划的能力，能具体负责落实企业的质量方针和质量目标，进行现场指导和帮助解决实际质量问题', '1');
INSERT INTO `station` VALUES ('20', '5', '系统工程师', '具备较高专业技术水平，能够分析商业需求，并使用各种系统平台和服务器软件来设计并实现商务解决方案的基础架构', '1');
INSERT INTO `station` VALUES ('21', '5', '系统分析师', '具有从事计算机应用系统的分析和设计工作能力及业务水平，能指导系统设计师和高级程序员', '1');
INSERT INTO `station` VALUES ('22', '5', '架构师', '既需要掌控整体又需要洞悉局部瓶颈并依据具体的业务场景给出解决方案', '1');
INSERT INTO `station` VALUES ('23', '5', '数据库管理员', '从事管理和维护数据库管理系统', '1');
INSERT INTO `station` VALUES ('24', '1', '行政经理', '计划、指导和协调机构的支持性服务，如记录保存、邮件分发、电话/前台接待和其它办公室支持服务。包括监督设备的准备、维护和保管', '1');
INSERT INTO `station` VALUES ('25', '4', '人力资源总监', '从战略高度努力构建高效实用的人力资源管理系统，成功进行人才选拔，建立科学的考核与激励机制，最大限度地激发人才潜能，创建优秀团队，塑造卓越的企业文化，推动组织变革与创新，最终实现组织的持续发展', '1');
INSERT INTO `station` VALUES ('26', '4', '人力资源经理', '计划、指导和协调机构的人事活动，确保人力资源合理利用，管理理赔、人事策略和招聘等', '1');
INSERT INTO `station` VALUES ('27', '4', '人力资源专员', '人力资源的入门职业', '1');
INSERT INTO `station` VALUES ('28', '2', '首席财务官', '从战略高度把握财务管理、公司治理、资本运营等方面的知识及其运作手段；必须大量接触国内外前沿性的财务管理知识和信息；真正具备全球战略眼光、深入了解相关国际规则', '1');
INSERT INTO `station` VALUES ('29', '2', '财务分析经理', '需要建立和完善财务分析体系，协助收集、修订和制定公司的内部财务控制制度并监督执行，还要定期编制财务分析报表', '1');
INSERT INTO `station` VALUES ('30', '2', '审计专员', '主要是编写审计报告，协助政府和会计师事务所对公司的审计活动，以及有关审计资料原始调查的收集、整理、建档工作', '1');
INSERT INTO `station` VALUES ('31', '1', '文员', '做些文字处理、文档整理、复印文件、接听电话及处理办公室日常事务（接待客人、清洁卫生、购买办公用品等）之类的工作', '1');
INSERT INTO `station` VALUES ('32', '1', '秘书', '写字楼及商业机构内的文员职位，专长是速记、打字、安排日程、会议、订机票、订酒店等', '1');
INSERT INTO `station` VALUES ('33', '6', '总经理', '一个公司的最高领导人或该公司的创始人', '1');
INSERT INTO `station` VALUES ('34', '1', '', '', '0');
INSERT INTO `station` VALUES ('35', '2', '财务经理', '管理财务', '1');
INSERT INTO `station` VALUES ('36', '5', 'java工程师', '负责java项目开发', '0');
INSERT INTO `station` VALUES ('37', '3', '', '', '1');
INSERT INTO `topic` VALUES ('1', '1', '1', '下雪后的公司景色', '下雪后的公司披上一层白装，显得更加的漂亮!', '2016-09-01 00:00:00', '2016-09-01 00:00:00', '1', '23', '1');
INSERT INTO `topic` VALUES ('2', '2', '1', '技术部冬泳活动完美结束', '技术部组织员工冬泳，敢于挑战的员工真的很厉害，提高员工抗寒能力。', '2016-09-01 00:00:00', '2016-09-01 00:00:00', '2', '16', '1');
INSERT INTO `topic` VALUES ('3', '6', '1', '大雪纷飞', '好大的雪啊  地上全白了 堆积的好厚！', '2016-09-03 10:12:15', '2016-11-03 13:33:41', '0', '7', '1');
INSERT INTO `topic` VALUES ('4', '23', '5', '工程部才艺表演完美结束！', '工程部举行的才艺表演完美结束了，让我们大饱眼福！ 没想到我们公司的人真的是多才多艺！', '2016-09-04 00:00:00', '2016-09-05 00:00:00', '2', '13', '1');
INSERT INTO `topic` VALUES ('5', '42', '5', 'gegaew', 'wdawdawddawda', '2016-09-07 10:15:19', '2016-09-07 16:23:47', '3', '15', '1');
INSERT INTO `topic` VALUES ('6', '26', '5', 'wgeege', 'wadawdawdawd', '2016-09-09 11:26:03', '2016-09-11 09:04:49', '1', '3', '1');
INSERT INTO `topic` VALUES ('7', '1', '1', '倒计时第二天', '哇哈哈哈', '2016-11-24 00:00:00', '2016-11-24 00:00:00', '2', '12', '1');
INSERT INTO `topic` VALUES ('8', '1', '1', '冷啊', '嗯嗯', '2016-11-23 15:43:20', '2016-11-23 15:43:20', '0', '0', '1');
INSERT INTO `topic` VALUES ('9', '1', '5', 'dbsd', 'bebwe', '2016-11-23 00:00:00', '2016-11-23 00:00:00', '2', '0', '1');
INSERT INTO `topic` VALUES ('10', '1', '5', 'wgewge', 'ewge', '2016-11-23 16:03:00', '2016-11-23 16:03:00', '0', '0', '1');
INSERT INTO `topic` VALUES ('11', '1', '5', 'wg', 'egw', '2016-11-23 00:00:00', '2016-11-23 00:00:00', '0', '0', '1');
INSERT INTO `topic` VALUES ('12', '1', '1', '撒浪嘿呦', '卜继卡', '2016-10-11 10:22:31', '2016-10-11 10:22:31', '0', '42', '1');
INSERT INTO `topic` VALUES ('13', '1', '1', '二附院', '染发膏纽约的撒', '2016-09-07 10:23:24', '2016-09-07 10:23:24', '0', '0', '1');
INSERT INTO `topic` VALUES ('14', '1', '1', '阿发女暗访', '反攻倒算公司', '2016-11-15 10:24:11', '2016-11-15 10:24:11', '0', '0', '1');
INSERT INTO `topic` VALUES ('15', '1', '1', '的纳差空间', '但代价的大大', '2016-11-22 10:24:50', '2016-11-22 10:24:50', '0', '0', '1');
INSERT INTO `topic` VALUES ('16', '1', '1', '却无法去玩', '沙南奥斯卡大', '2016-11-21 10:25:22', '2016-11-21 10:25:22', '0', '0', '1');
INSERT INTO `topic` VALUES ('17', '1', '1', '爱SD卡三季度卡', '达杀手牛大了口', '2016-11-20 10:25:48', '2016-11-20 10:25:48', '0', '0', '1');
INSERT INTO `topic` VALUES ('18', '1', '1', '就看到你卡机的', '那几款多砍', '2016-11-07 10:26:14', '2016-11-07 10:26:14', '0', '0', '1');
INSERT INTO `topic` VALUES ('19', '1', '1', '那尽快打开就能', '的那就看了就看了', '2016-11-14 10:26:39', '2016-11-14 10:26:39', '0', '0', '1');
INSERT INTO `topic` VALUES ('20', '1', '1', '的那军扩军刊', '安打卡了吗', '2016-11-19 10:27:04', '2016-11-19 10:27:04', '0', '0', '1');
INSERT INTO `topic` VALUES ('21', '2', '3', '啊山东潍坊', '第三方二号线', '2016-11-24 11:34:43', '2016-11-24 11:34:43', '0', '0', '1');
INSERT INTO `topic` VALUES ('22', '1', '9', '设备如何', 'dsgegrgeerh', '2016-11-24 15:24:44', '2016-11-24 15:24:44', '0', '0', '1');
