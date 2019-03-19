/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : gas-monitor

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-03-19 17:12:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0是启用，1是未启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('0', 'main', '0', '0');
INSERT INTO `company` VALUES ('2', '山海关船厂', '3241', '0');
INSERT INTO `company` VALUES ('3', '广州黄船海洋工程', '3242', '0');
INSERT INTO `company` VALUES ('5', '澄西船厂', '3243', '0');
INSERT INTO `company` VALUES ('6', '测试平台', '3299', '0');
INSERT INTO `company` VALUES ('7', '中船黄埔文冲船舶', '3244', '0');
INSERT INTO `company` VALUES ('8', '广船国际', '3245', '0');

-- ----------------------------
-- Table structure for c_resource
-- ----------------------------
DROP TABLE IF EXISTS `c_resource`;
CREATE TABLE `c_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `pId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_resource
-- ----------------------------
INSERT INTO `c_resource` VALUES ('1', 'root', '根目录', '根目录', '1', 'blank', '0');
INSERT INTO `c_resource` VALUES ('12', 'resource', '资源', '资源模块', '1', 'blank', '1');
INSERT INTO `c_resource` VALUES ('13', 'resourceManager', '资源管理', '资源管理页面', '1', 'jsp/resources.jsp', '12');
INSERT INTO `c_resource` VALUES ('14', 'role', '角色', '角色模块', '1', 'blank', '1');
INSERT INTO `c_resource` VALUES ('15', 'roleManager', '角色管理', '角色列表页', '1', 'jsp/role_list.jsp', '14');
INSERT INTO `c_resource` VALUES ('16', 'system', '系统', '系统菜单', '1', 'blank', '1');
INSERT INTO `c_resource` VALUES ('18', 'userManager', '用户管理', '用户管理', '1', 'jsp/user_list.jsp', '16');
INSERT INTO `c_resource` VALUES ('19', 'companyManage', '船厂管理', '管理船厂信息', '1', 'jsp/company_list.jsp', '16');

-- ----------------------------
-- Table structure for c_role
-- ----------------------------
DROP TABLE IF EXISTS `c_role`;
CREATE TABLE `c_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  `roleName` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `rIds` varchar(255) DEFAULT NULL COMMENT '资源id集合',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_role
-- ----------------------------
INSERT INTO `c_role` VALUES ('0', 'admin', '超级管理员', '超级管理员', '0', '1,12,13,14,15,16,18,19,');
INSERT INTO `c_role` VALUES ('5', 'companyManager', '船厂管理员', '拥有管理本厂人员的角色', '0', '1,16,18,');
INSERT INTO `c_role` VALUES ('6', 'companyUser', '船厂员工', '拥有查看气体监控界面权限', '0', '');

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `realName` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `createTime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  `companyId` bigint(20) NOT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES ('0', 'admin', '超级管理员', '', '9439a8940b4b689718a08a38d5d62585', '2018-06-07 10:26:08', '1', '0', '0', null);
INSERT INTO `c_user` VALUES ('9', 'shanchuan1', '山船1', null, '96cf9fc1ef707054b98cd56b934f7804', '2018-11-20 13:44:35', '1', '5', '2', null);
INSERT INTO `c_user` VALUES ('14', 'shanchuan11', '山船11', null, 'd0ab548d6ca016d271afbc03b5718eca', '2018-11-20 16:01:19', '1', '6', '2', null);
INSERT INTO `c_user` VALUES ('15', 'huangpu1', '黄埔1', null, '6168ebce30d4024cebf624f24082d083', '2018-11-20 16:03:04', '1', '5', '3', null);
INSERT INTO `c_user` VALUES ('16', 'huangpu11', '黄埔11', null, '89a926293f86c321fc7aa72a03c7f87e', '2018-11-20 16:27:26', '1', '6', '3', null);
INSERT INTO `c_user` VALUES ('19', '718', 'DX', null, 'a5184adaa81a76cddadfa24b9f364334', '2019-03-13 08:24:57', '1', '5', '6', null);
INSERT INTO `c_user` VALUES ('20', 'zchpwc', '主管理员', null, 'e10adc3949ba59abbe56e057f20f883e', '2019-03-15 14:37:06', '1', '5', '7', null);

-- ----------------------------
-- Table structure for device-position
-- ----------------------------
DROP TABLE IF EXISTS `device-position`;
CREATE TABLE `device-position` (
  `deviceNo` bigint(20) NOT NULL,
  `companyId` int(11) NOT NULL,
  `position` varchar(4999) DEFAULT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`deviceNo`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device-position
-- ----------------------------
INSERT INTO `device-position` VALUES ('3', '3', '52F', '2019-03-14 14:22:19');
INSERT INTO `device-position` VALUES ('6', '3', '53F', '2019-03-14 14:22:29');
INSERT INTO `device-position` VALUES ('7', '3', '52G', '2019-03-14 14:22:37');
INSERT INTO `device-position` VALUES ('8', '3', '53G', '2019-03-14 14:22:56');

-- ----------------------------
-- Table structure for gas-data
-- ----------------------------
DROP TABLE IF EXISTS `gas-data`;
CREATE TABLE `gas-data` (
  `deviceNo` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL COMMENT '数据字符串',
  `createTime` datetime NOT NULL,
  `gas` varchar(10) NOT NULL,
  `dataUnit` varchar(10) NOT NULL,
  `gasLevel` float NOT NULL,
  `low` float NOT NULL,
  `high` float NOT NULL,
  `gas1` varchar(10) NOT NULL,
  `gasLevel1` float NOT NULL,
  `low1` float NOT NULL,
  `dataUnit1` varchar(10) NOT NULL,
  `high1` float NOT NULL,
  `temperature` float NOT NULL,
  `deO2Voltage` float NOT NULL,
  `deComVoltage` float NOT NULL,
  `dePowerVoltage` float NOT NULL,
  `deTemp` int(11) NOT NULL,
  `check` varchar(10) NOT NULL,
  `warningState` tinyint(4) NOT NULL,
  `O2Warning` tinyint(4) NOT NULL,
  `CH4Warning` tinyint(4) NOT NULL,
  PRIMARY KEY (`deviceNo`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gas-data
-- ----------------------------
INSERT INTO `gas-data` VALUES ('1', '2', '1', '2018-12-12 08:59:27', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '18', '1726', '38', '3608', '6', '185', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('1', '3', '1', '2019-03-14 10:24:10', 'O2', '%VOL', '20.9', '19', '23', 'EX', '1.4', '5', '%LEL', '25', '27', '1920', '58', '4028', '0', '37', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('2', '2', '1', '2018-12-12 08:59:19', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0', '5', '%LEL', '10', '18', '1616', '30', '3504', '6', '150', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('2', '3', '1', '2019-03-14 10:24:13', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0', '5', '%LEL', '25', '26', '1741', '21', '4026', '0', '5', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('2', '6', '1', '2019-03-14 15:26:24', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0', '5', '%LEL', '25', '27', '1888', '19', '3772', '0', '113', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('3', '2', '1', '2018-12-12 10:13:03', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '21', '2027', '31', '3992', '4', '14', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('3', '3', '1', '2019-03-14 16:11:57', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0.1', '5', '%LEL', '25', '25', '1953', '33', '3942', '0', '120', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('3', '6', '1', '2019-03-14 15:26:20', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '28', '1703', '30', '3746', '0', '72', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('4', '2', '1', '2018-08-18 16:11:38', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0', '5', '%LEL', '10', '31', '1790', '15', '3694', '0', '47', '0', '1', '0');
INSERT INTO `gas-data` VALUES ('4', '3', '1', '2019-03-13 11:37:01', 'O2', '%VOL', '20.7', '19', '23', 'EX', '0', '5', '%LEL', '25', '28', '1960', '28', '4002', '0', '56', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('4', '6', '1', '2019-03-14 15:25:45', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0', '5', '%LEL', '25', '30', '1905', '33', '3814', '0', '35', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('5', '2', '1', '2018-12-12 10:13:07', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0.3', '5', '%LEL', '10', '20', '1655', '42', '4010', '4', '97', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('5', '3', '1', '2019-03-13 11:37:04', 'O2', '%VOL', '20.7', '19', '23', 'EX', '0.1', '5', '%LEL', '25', '25', '1757', '21', '4068', '0', '202', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('6', '2', '1', '2018-12-12 08:59:13', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '18', '1784', '13', '3622', '0', '139', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('6', '3', '1', '2019-03-14 16:11:46', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '25', '24', '1893', '29', '4042', '0', '83', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('7', '2', '1', '2018-12-12 09:00:44', 'O2', '%VOL', '20.7', '19', '23', 'EX', '0.4', '5', '%LEL', '10', '18', '1745', '37', '3590', '5', '177', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('7', '3', '1', '2019-03-14 16:12:04', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0.1', '5', '%LEL', '25', '25', '1732', '27', '3922', '0', '108', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('8', '2', '1', '2018-12-12 09:01:24', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '18', '1780', '24', '3526', '4', '223', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('8', '3', '1', '2019-03-14 16:12:07', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '25', '25', '1683', '21', '3964', '0', '121', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('9', '2', '1', '2018-12-12 09:01:08', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0.2', '5', '%LEL', '10', '18', '1524', '25', '3550', '0', '199', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('9', '3', '1', '2019-03-13 11:37:04', 'O2', '%VOL', '20.7', '19', '23', 'EX', '0.1', '5', '%LEL', '25', '25', '1693', '21', '3964', '0', '110', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('10', '2', '1', '2018-12-12 10:12:37', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0.1', '5', '%LEL', '10', '21', '1702', '30', '4008', '4', '61', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('10', '3', '1', '2019-03-14 16:11:49', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '25', '25', '1741', '35', '4004', '0', '7', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('11', '2', '1', '2018-12-12 09:02:41', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '19', '1621', '28', '3536', '0', '112', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('11', '3', '1', '2018-12-19 12:47:20', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0', '5', '%LEL', '25', '29', '1666', '29', '4026', '0', '60', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('12', '2', '1', '2018-12-12 10:13:16', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '21', '1832', '35', '4018', '0', '174', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('13', '2', '1', '2018-12-12 10:11:39', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0', '5', '%LEL', '10', '21', '1627', '11', '3938', '0', '226', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('14', '2', '1', '2018-12-12 10:12:05', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '21', '1727', '39', '3984', '0', '52', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('15', '2', '1', '2018-12-12 10:11:16', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '20', '1880', '36', '4024', '0', '117', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('16', '2', '1', '2018-12-12 10:11:23', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '20', '1836', '29', '4018', '0', '173', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('17', '2', '1', '2018-12-12 10:12:14', 'O2', '%VOL', '21', '19', '23', 'EX', '0', '5', '%LEL', '10', '21', '1601', '53', '4038', '0', '114', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('18', '2', '1', '2018-12-12 10:12:05', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0.1', '5', '%LEL', '10', '20', '1481', '24', '4022', '0', '15', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('19', '2', '1', '2018-12-12 10:12:25', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '21', '1753', '24', '3978', '0', '42', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('20', '2', '1', '2018-12-12 10:12:38', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '21', '1856', '49', '4020', '0', '126', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('20', '3', '1', '2018-12-19 12:47:11', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '25', '29', '1581', '21', '4010', '0', '161', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('21', '2', '1', '2018-12-12 10:13:37', 'O2', '%VOL', '20.7', '19', '23', 'EX', '0', '5', '%LEL', '10', '24', '2050', '29', '3974', '0', '250', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('22', '2', '1', '2018-12-12 10:13:38', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '22', '1800', '26', '3986', '0', '236', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('23', '2', '1', '2018-12-12 10:13:30', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '21', '1767', '8', '4022', '0', '252', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('24', '2', '1', '2018-08-18 16:11:19', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0', '5', '%LEL', '10', '31', '1926', '0', '3780', '0', '75', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('25', '2', '1', '2018-12-12 10:13:26', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0.3', '5', '%LEL', '10', '21', '1809', '25', '3952', '0', '1', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('26', '2', '1', '2018-12-12 09:02:36', 'O2', '%VOL', '20.7', '19', '23', 'EX', '0', '5', '%LEL', '10', '18', '2281', '38', '3480', '0', '251', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('27', '2', '1', '2018-12-12 10:13:21', 'O2', '%VOL', '20.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '21', '1986', '37', '3894', '0', '127', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('28', '2', '1', '2018-12-12 10:13:51', 'O2', '%VOL', '20.9', '19', '23', 'EX', '0', '5', '%LEL', '10', '21', '2079', '51', '4000', '0', '167', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('29', '2', '1', '2018-12-12 10:12:41', 'O2', '%VOL', '21', '19', '23', 'EX', '0', '5', '%LEL', '10', '21', '1563', '56', '3972', '0', '203', '0', '0', '0');
INSERT INTO `gas-data` VALUES ('30', '2', '1', '2018-12-12 09:02:42', 'O2', '%VOL', '20.7', '19', '23', 'EX', '0', '5', '%LEL', '10', '19', '2013', '26', '3570', '0', '181', '0', '0', '0');

-- ----------------------------
-- Table structure for gas-warn-data
-- ----------------------------
DROP TABLE IF EXISTS `gas-warn-data`;
CREATE TABLE `gas-warn-data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deviceNo` bigint(10) NOT NULL,
  `companyId` int(11) DEFAULT NULL,
  `state` tinyint(4) NOT NULL COMMENT '数据字符串',
  `createTime` datetime NOT NULL,
  `gas` varchar(10) NOT NULL,
  `dataUnit` varchar(10) NOT NULL,
  `gasLevel` float NOT NULL,
  `low` float NOT NULL,
  `high` float NOT NULL,
  `gas1` varchar(10) NOT NULL,
  `gasLevel1` float NOT NULL,
  `low1` float NOT NULL,
  `dataUnit1` varchar(10) NOT NULL,
  `high1` float NOT NULL,
  `temperature` float NOT NULL,
  `deO2Voltage` float NOT NULL,
  `deComVoltage` float NOT NULL,
  `dePowerVoltage` float NOT NULL,
  `deTemp` int(11) NOT NULL,
  `check` varchar(10) NOT NULL,
  `warningState` tinyint(4) NOT NULL,
  `O2Warning` tinyint(4) NOT NULL,
  `CH4Warning` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gas-warn-data
-- ----------------------------
INSERT INTO `gas-warn-data` VALUES ('1', '21', '2', '1', '2018-08-13 16:41:40', 'O2', '%VOL', '17.8', '19', '23', 'EX', '0', '5', '%LEL', '10', '33', '1717', '17', '3644', '0', '153', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('2', '21', '2', '1', '2018-08-13 16:42:28', 'O2', '%VOL', '16.4', '19', '23', 'EX', '0', '5', '%LEL', '10', '33', '1578', '10', '3602', '0', '90', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('3', '21', '2', '4', '2018-08-15 09:20:40', 'O2', '%VOL', '23', '19', '23', 'EX', '0', '5', '%LEL', '10', '32', '2271', '19', '3374', '0', '122', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('4', '21', '2', '4', '2018-08-15 09:20:50', 'O2', '%VOL', '23', '19', '23', 'EX', '0', '5', '%LEL', '10', '32', '2271', '17', '3374', '0', '124', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('5', '21', '2', '1', '2018-08-15 09:21:57', 'O2', '%VOL', '23', '19', '23', 'EX', '0', '5', '%LEL', '10', '32', '2273', '15', '3570', '0', '187', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('6', '1', '2', '1', '2018-09-21 10:39:38', 'O2', '%VOL', '18.3', '19', '23', 'EX', '0', '5', '%LEL', '10', '27', '1808', '17', '4100', '0', '145', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('7', '1', '2', '1', '2018-09-21 10:39:41', 'O2', '%VOL', '15.5', '19', '23', 'EX', '0', '5', '%LEL', '10', '27', '1531', '24', '4100', '0', '162', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('8', '1', '2', '1', '2018-09-21 10:39:45', 'O2', '%VOL', '15.9', '19', '23', 'EX', '0', '5', '%LEL', '10', '27', '1571', '25', '4100', '0', '116', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('9', '1', '2', '1', '2018-09-21 10:39:49', 'O2', '%VOL', '18.4', '19', '23', 'EX', '0', '5', '%LEL', '10', '27', '1819', '24', '4100', '0', '126', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('10', '1', '2', '1', '2018-09-21 10:39:52', 'O2', '%VOL', '16.5', '19', '23', 'EX', '0', '5', '%LEL', '10', '27', '1629', '24', '4100', '0', '62', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('11', '1', '2', '1', '2018-09-21 13:30:49', 'O2', '%VOL', '15.5', '19', '23', 'EX', '0.1', '5', '%LEL', '10', '34', '1535', '20', '3974', '0', '25', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('12', '1', '2', '1', '2018-09-21 13:30:52', 'O2', '%VOL', '16.1', '19', '23', 'EX', '0.3', '5', '%LEL', '10', '34', '1595', '23', '3974', '0', '218', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('13', '1', '2', '1', '2018-09-21 13:30:56', 'O2', '%VOL', '18.6', '19', '23', 'EX', '0.2', '5', '%LEL', '10', '34', '1838', '21', '3974', '0', '226', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('14', '16', '2', '1', '2018-09-27 10:24:28', 'O2', '%VOL', '21', '19', '23', 'EX', '5.2', '5', '%LEL', '10', '28', '1832', '186', '4040', '0', '246', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('15', '16', '2', '1', '2018-09-27 10:24:45', 'O2', '%VOL', '21.1', '19', '23', 'EX', '23.2', '5', '%LEL', '10', '28', '1835', '593', '3968', '0', '143', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('16', '16', '2', '1', '2018-09-27 10:27:04', 'O2', '%VOL', '21', '19', '23', 'EX', '16.8', '5', '%LEL', '10', '28', '1833', '447', '3916', '0', '90', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('17', '16', '2', '1', '2018-09-27 10:27:12', 'O2', '%VOL', '20.6', '19', '23', 'EX', '109.2', '5', '%LEL', '10', '28', '1793', '2534', '3914', '0', '249', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('18', '16', '2', '1', '2018-09-27 10:27:20', 'O2', '%VOL', '21', '19', '23', 'EX', '23.2', '5', '%LEL', '10', '28', '1833', '593', '3912', '0', '202', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('19', '16', '2', '1', '2018-09-27 10:27:28', 'O2', '%VOL', '21.1', '19', '23', 'EX', '7.4', '5', '%LEL', '10', '28', '1835', '235', '3910', '0', '63', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('20', '20', '2', '1', '2018-09-30 09:25:42', 'O2', '%VOL', '21', '19', '23', 'EX', '6.5', '5', '%LEL', '10', '21', '1853', '197', '4038', '0', '215', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('21', '1', '2', '1', '2018-10-17 10:57:33', 'O2', '%VOL', '21', '19', '23', 'EX', '87', '5', '%LEL', '10', '18', '1742', '2044', '3616', '0', '122', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('22', '1', '2', '1', '2018-10-17 10:57:55', 'O2', '%VOL', '21.4', '19', '23', 'EX', '10.2', '5', '%LEL', '10', '18', '1781', '275', '3622', '0', '131', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('23', '2', '2', '1', '2018-10-17 11:03:34', 'O2', '%VOL', '21.7', '19', '23', 'EX', '80.3', '5', '%LEL', '10', '19', '1702', '1891', '3664', '0', '6', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('24', '2', '2', '1', '2018-10-17 11:03:55', 'O2', '%VOL', '22', '19', '23', 'EX', '17.6', '5', '%LEL', '10', '19', '1728', '445', '3676', '0', '206', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('25', '2', '2', '1', '2018-10-17 11:04:00', 'O2', '%VOL', '22', '19', '23', 'EX', '14.1', '5', '%LEL', '10', '19', '1729', '365', '3664', '0', '49', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('26', '2', '2', '1', '2018-10-17 11:04:16', 'O2', '%VOL', '22.1', '19', '23', 'EX', '6.4', '5', '%LEL', '10', '19', '1735', '187', '3680', '0', '210', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('27', '5', '2', '1', '2018-10-18 15:25:17', 'O2', '%VOL', '21.1', '19', '23', 'EX', '69.8', '5', '%LEL', '10', '25', '1653', '1646', '3756', '0', '212', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('28', '5', '2', '1', '2018-10-18 15:35:31', 'O2', '%VOL', '21.1', '19', '23', 'EX', '80.6', '5', '%LEL', '10', '26', '1658', '1872', '3740', '0', '242', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('29', '5', '2', '1', '2018-10-18 15:35:36', 'O2', '%VOL', '21.1', '19', '23', 'EX', '21.4', '5', '%LEL', '10', '26', '1659', '583', '3748', '0', '52', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('30', '5', '2', '1', '2018-10-18 15:37:42', 'O2', '%VOL', '21.1', '19', '23', 'EX', '6.4', '5', '%LEL', '10', '26', '1660', '255', '3738', '0', '150', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('31', '5', '2', '1', '2018-10-18 15:39:24', 'O2', '%VOL', '23.2', '19', '23', 'EX', '0', '5', '%LEL', '10', '26', '1876', '45', '3740', '0', '148', '0', '1', '0');
INSERT INTO `gas-warn-data` VALUES ('32', '22', '2', '1', '2018-11-16 15:23:38', 'O2', '%VOL', '20.7', '19', '23', 'EX', '87.8', '5', '%LEL', '10', '12', '1813', '2069', '3914', '0', '208', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('33', '2', '6', '1', '2019-03-13 10:49:25', 'O2', '%VOL', '16', '19', '23', 'EX', '0', '5', '%LEL', '25', '33', '1874', '22', '4078', '0', '69', '0', '0', '0');
INSERT INTO `gas-warn-data` VALUES ('34', '3', '6', '1', '2019-03-13 14:36:14', 'O2', '%VOL', '21', '19', '23', 'EX', '112.1', '5', '%LEL', '10', '36', '1697', '2624', '4052', '0', '125', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('35', '3', '6', '1', '2019-03-13 14:36:18', 'O2', '%VOL', '20.9', '19', '23', 'EX', '59.7', '5', '%LEL', '10', '36', '1693', '1416', '4052', '0', '101', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('36', '3', '6', '1', '2019-03-13 14:36:27', 'O2', '%VOL', '21', '19', '23', 'EX', '9.9', '5', '%LEL', '10', '36', '1696', '245', '4052', '0', '50', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('37', '3', '6', '1', '2019-03-13 14:36:31', 'O2', '%VOL', '21', '19', '23', 'EX', '9.2', '5', '%LEL', '10', '36', '1696', '160', '4052', '0', '142', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('38', '1', '3', '1', '2019-03-14 10:17:04', 'O2', '%VOL', '20.9', '19', '23', 'EX', '11', '5', '%LEL', '25', '28', '1915', '274', '3972', '0', '130', '1', '0', '1');
INSERT INTO `gas-warn-data` VALUES ('39', '1', '3', '1', '2019-03-14 10:17:07', 'O2', '%VOL', '20.9', '19', '23', 'EX', '9.3', '5', '%LEL', '25', '28', '1915', '150', '3966', '0', '4', '1', '0', '1');
