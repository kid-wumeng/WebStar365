/*
Navicat MySQL Data Transfer

Source Server         : 本地 MySQL
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : webstar365

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-02-07 13:16:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `adminAccount` varchar(255) NOT NULL COMMENT '管理员帐号',
  `adminPass` varchar(255) NOT NULL COMMENT '管理员密码',
  `adminName` varchar(255) NOT NULL COMMENT '管理员名',
  `adminLv` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员级别\r\n0级：无任何操作权限',
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `index_adminAccount` (`adminAccount`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'unicornkid', '65105854', 'KID', '7');

-- ----------------------------
-- Table structure for adminact_addwebsite
-- ----------------------------
DROP TABLE IF EXISTS `adminact_addwebsite`;
CREATE TABLE `adminact_addwebsite` (
  `adminId` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理员编号',
  `websiteId` int(10) unsigned NOT NULL COMMENT '网站编号',
  `websiteAddDateTime` datetime NOT NULL COMMENT '添加网站的日期与时间',
  PRIMARY KEY (`adminId`,`websiteId`),
  KEY `index_websiteId` (`websiteId`) USING BTREE,
  CONSTRAINT `adminact_addwebsite_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adminact_addwebsite_ibfk_2` FOREIGN KEY (`websiteId`) REFERENCES `website` (`websiteId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminact_addwebsite
-- ----------------------------

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `areaId` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '地区编号',
  `areaName` varchar(255) NOT NULL COMMENT '地区名',
  `areaLv` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '地区级别',
  `parentAreaId` smallint(6) unsigned DEFAULT NULL COMMENT '上级地区编号',
  PRIMARY KEY (`areaId`),
  KEY `index_parentAreaId` (`parentAreaId`) USING BTREE,
  CONSTRAINT `area_ibfk_1` FOREIGN KEY (`parentAreaId`) REFERENCES `area` (`areaId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', '安徽', '1', null);
INSERT INTO `area` VALUES ('2', '北京', '1', null);
INSERT INTO `area` VALUES ('3', '重庆', '1', null);
INSERT INTO `area` VALUES ('4', '福建', '1', null);
INSERT INTO `area` VALUES ('5', '甘肃', '1', null);
INSERT INTO `area` VALUES ('6', '广东', '1', null);
INSERT INTO `area` VALUES ('7', '广西', '1', null);
INSERT INTO `area` VALUES ('8', '贵州', '1', null);
INSERT INTO `area` VALUES ('9', '海南', '1', null);
INSERT INTO `area` VALUES ('10', '河北', '1', null);
INSERT INTO `area` VALUES ('11', '黑龙江', '1', null);
INSERT INTO `area` VALUES ('12', '河南', '1', null);
INSERT INTO `area` VALUES ('13', '湖北', '1', null);
INSERT INTO `area` VALUES ('14', '湖南', '1', null);
INSERT INTO `area` VALUES ('15', '内蒙古', '1', null);
INSERT INTO `area` VALUES ('16', '江苏', '1', null);
INSERT INTO `area` VALUES ('17', '江西', '1', null);
INSERT INTO `area` VALUES ('18', '吉林', '1', null);
INSERT INTO `area` VALUES ('19', '辽宁', '1', null);
INSERT INTO `area` VALUES ('20', '宁夏', '1', null);
INSERT INTO `area` VALUES ('21', '青海', '1', null);
INSERT INTO `area` VALUES ('22', '山西', '1', null);
INSERT INTO `area` VALUES ('23', '山东', '1', null);
INSERT INTO `area` VALUES ('24', '上海', '1', null);
INSERT INTO `area` VALUES ('25', '四川', '1', null);
INSERT INTO `area` VALUES ('26', '天津', '1', null);
INSERT INTO `area` VALUES ('27', '西藏', '1', null);
INSERT INTO `area` VALUES ('28', '新疆', '1', null);
INSERT INTO `area` VALUES ('29', '云南', '1', null);
INSERT INTO `area` VALUES ('30', '浙江', '1', null);
INSERT INTO `area` VALUES ('31', '陕西', '1', null);
INSERT INTO `area` VALUES ('32', '台湾', '1', null);
INSERT INTO `area` VALUES ('33', '香港', '1', null);
INSERT INTO `area` VALUES ('34', '澳门', '1', null);
INSERT INTO `area` VALUES ('35', '海外', '1', null);
INSERT INTO `area` VALUES ('36', '合肥', '2', '1');
INSERT INTO `area` VALUES ('37', '芜湖', '2', '1');
INSERT INTO `area` VALUES ('38', '蚌埠', '2', '1');
INSERT INTO `area` VALUES ('39', '淮南', '2', '1');
INSERT INTO `area` VALUES ('40', '马鞍山', '2', '1');
INSERT INTO `area` VALUES ('41', '淮北', '2', '1');
INSERT INTO `area` VALUES ('42', '铜陵', '2', '1');
INSERT INTO `area` VALUES ('43', '安庆', '2', '1');
INSERT INTO `area` VALUES ('44', '黄山', '2', '1');
INSERT INTO `area` VALUES ('45', '阜阳', '2', '1');
INSERT INTO `area` VALUES ('46', '宿州', '2', '1');
INSERT INTO `area` VALUES ('47', '滁州', '2', '1');
INSERT INTO `area` VALUES ('48', '六安', '2', '1');
INSERT INTO `area` VALUES ('49', '宣城', '2', '1');
INSERT INTO `area` VALUES ('50', '池州', '2', '1');
INSERT INTO `area` VALUES ('51', '毫州', '2', '1');
INSERT INTO `area` VALUES ('52', '东城区', '2', '2');
INSERT INTO `area` VALUES ('53', '西城区', '2', '2');
INSERT INTO `area` VALUES ('54', '海淀区', '2', '2');
INSERT INTO `area` VALUES ('55', '朝阳区', '2', '2');
INSERT INTO `area` VALUES ('56', '丰台区', '2', '2');
INSERT INTO `area` VALUES ('57', '石景山区', '2', '2');
INSERT INTO `area` VALUES ('58', '通州区', '2', '2');
INSERT INTO `area` VALUES ('59', '顺义区', '2', '2');
INSERT INTO `area` VALUES ('60', '房山区', '2', '2');
INSERT INTO `area` VALUES ('61', '大兴区', '2', '2');
INSERT INTO `area` VALUES ('62', '昌平区', '2', '2');
INSERT INTO `area` VALUES ('63', '怀柔区', '2', '2');
INSERT INTO `area` VALUES ('64', '平谷区', '2', '2');
INSERT INTO `area` VALUES ('65', '门头沟区', '2', '2');
INSERT INTO `area` VALUES ('66', '密云县', '2', '2');
INSERT INTO `area` VALUES ('67', '延庆县', '2', '2');
INSERT INTO `area` VALUES ('68', '渝中区', '2', '3');
INSERT INTO `area` VALUES ('69', '大渡口区', '2', '3');
INSERT INTO `area` VALUES ('70', '江北区', '2', '3');
INSERT INTO `area` VALUES ('71', '沙坪坝区', '2', '3');
INSERT INTO `area` VALUES ('72', '九龙坡区', '2', '3');
INSERT INTO `area` VALUES ('73', '南岸区', '2', '3');
INSERT INTO `area` VALUES ('74', '北碚区', '2', '3');
INSERT INTO `area` VALUES ('75', '綦江区', '2', '3');
INSERT INTO `area` VALUES ('76', '双桥区', '2', '3');
INSERT INTO `area` VALUES ('77', '渝北区', '2', '3');
INSERT INTO `area` VALUES ('78', '巴南区', '2', '3');
INSERT INTO `area` VALUES ('79', '万州区', '2', '3');
INSERT INTO `area` VALUES ('80', '涪陵区', '2', '3');
INSERT INTO `area` VALUES ('81', '黔江区', '2', '3');
INSERT INTO `area` VALUES ('82', '长寿区', '2', '3');
INSERT INTO `area` VALUES ('83', '江津区', '2', '3');
INSERT INTO `area` VALUES ('84', '合川区', '2', '3');
INSERT INTO `area` VALUES ('85', '永川区', '2', '3');
INSERT INTO `area` VALUES ('86', '南川区', '2', '3');
INSERT INTO `area` VALUES ('87', '潼南', '2', '3');
INSERT INTO `area` VALUES ('88', '铜梁', '2', '3');
INSERT INTO `area` VALUES ('89', '大足', '2', '3');
INSERT INTO `area` VALUES ('90', '荣昌', '2', '3');
INSERT INTO `area` VALUES ('91', '璧山', '2', '3');
INSERT INTO `area` VALUES ('92', '梁平', '2', '3');
INSERT INTO `area` VALUES ('93', '城口', '2', '3');
INSERT INTO `area` VALUES ('94', '丰都', '2', '3');
INSERT INTO `area` VALUES ('95', '垫江', '2', '3');
INSERT INTO `area` VALUES ('96', '武隆', '2', '3');
INSERT INTO `area` VALUES ('97', '忠县', '2', '3');
INSERT INTO `area` VALUES ('98', '开县', '2', '3');
INSERT INTO `area` VALUES ('99', '云阳', '2', '3');
INSERT INTO `area` VALUES ('100', '奉节', '2', '3');
INSERT INTO `area` VALUES ('101', '巫山', '2', '3');
INSERT INTO `area` VALUES ('102', '巫溪', '2', '3');
INSERT INTO `area` VALUES ('103', '石柱', '2', '3');
INSERT INTO `area` VALUES ('104', '秀山', '2', '3');
INSERT INTO `area` VALUES ('105', '酉阳', '2', '3');
INSERT INTO `area` VALUES ('106', '彭水', '2', '3');
INSERT INTO `area` VALUES ('107', '厦门', '2', '4');
INSERT INTO `area` VALUES ('108', '福州', '2', '4');
INSERT INTO `area` VALUES ('109', '泉州', '2', '4');
INSERT INTO `area` VALUES ('110', '莆田', '2', '4');
INSERT INTO `area` VALUES ('111', '三明', '2', '4');
INSERT INTO `area` VALUES ('112', '漳州', '2', '4');
INSERT INTO `area` VALUES ('113', '南平', '2', '4');
INSERT INTO `area` VALUES ('114', '龙岩', '2', '4');
INSERT INTO `area` VALUES ('115', '宁德', '2', '4');
INSERT INTO `area` VALUES ('116', '兰州', '2', '5');
INSERT INTO `area` VALUES ('117', '嘉峪关', '2', '5');
INSERT INTO `area` VALUES ('118', '金昌', '2', '5');
INSERT INTO `area` VALUES ('119', '白银', '2', '5');
INSERT INTO `area` VALUES ('120', '天水', '2', '5');
INSERT INTO `area` VALUES ('121', '武威', '2', '5');
INSERT INTO `area` VALUES ('122', '张掖', '2', '5');
INSERT INTO `area` VALUES ('123', '酒泉', '2', '5');
INSERT INTO `area` VALUES ('124', '平凉', '2', '5');
INSERT INTO `area` VALUES ('125', '庆阳', '2', '5');
INSERT INTO `area` VALUES ('126', '定西', '2', '5');
INSERT INTO `area` VALUES ('127', '陇南', '2', '5');
INSERT INTO `area` VALUES ('128', '临夏', '2', '5');
INSERT INTO `area` VALUES ('129', '甘南', '2', '5');
INSERT INTO `area` VALUES ('130', '广州', '2', '6');
INSERT INTO `area` VALUES ('131', '深圳', '2', '6');
INSERT INTO `area` VALUES ('132', '珠海', '2', '6');
INSERT INTO `area` VALUES ('133', '汕头', '2', '6');
INSERT INTO `area` VALUES ('134', '佛山', '2', '6');
INSERT INTO `area` VALUES ('135', '韶关', '2', '6');
INSERT INTO `area` VALUES ('136', '湛江', '2', '6');
INSERT INTO `area` VALUES ('137', '江门', '2', '6');
INSERT INTO `area` VALUES ('138', '肇庆', '2', '6');
INSERT INTO `area` VALUES ('139', '茂名', '2', '6');
INSERT INTO `area` VALUES ('140', '惠州', '2', '6');
INSERT INTO `area` VALUES ('141', '梅州', '2', '6');
INSERT INTO `area` VALUES ('142', '汕尾', '2', '6');
INSERT INTO `area` VALUES ('143', '河源', '2', '6');
INSERT INTO `area` VALUES ('144', '阳江', '2', '6');
INSERT INTO `area` VALUES ('145', '清远', '2', '6');
INSERT INTO `area` VALUES ('146', '东莞', '2', '6');
INSERT INTO `area` VALUES ('147', '中山', '2', '6');
INSERT INTO `area` VALUES ('148', '潮州', '2', '6');
INSERT INTO `area` VALUES ('149', '揭阳', '2', '6');
INSERT INTO `area` VALUES ('150', '云浮', '2', '6');
INSERT INTO `area` VALUES ('151', '南宁', '2', '7');
INSERT INTO `area` VALUES ('152', '柳州', '2', '7');
INSERT INTO `area` VALUES ('153', '桂林', '2', '7');
INSERT INTO `area` VALUES ('154', '梧州', '2', '7');
INSERT INTO `area` VALUES ('155', '北海', '2', '7');
INSERT INTO `area` VALUES ('156', '防城港', '2', '7');
INSERT INTO `area` VALUES ('157', '钦州', '2', '7');
INSERT INTO `area` VALUES ('158', '贵港', '2', '7');
INSERT INTO `area` VALUES ('159', '玉林', '2', '7');
INSERT INTO `area` VALUES ('160', '百色', '2', '7');
INSERT INTO `area` VALUES ('161', '贺州', '2', '7');
INSERT INTO `area` VALUES ('162', '河池', '2', '7');
INSERT INTO `area` VALUES ('163', '来宾', '2', '7');
INSERT INTO `area` VALUES ('164', '崇左', '2', '7');
INSERT INTO `area` VALUES ('165', '贵阳', '2', '8');
INSERT INTO `area` VALUES ('166', '六盘水', '2', '8');
INSERT INTO `area` VALUES ('167', '遵义', '2', '8');
INSERT INTO `area` VALUES ('168', '铜仁', '2', '8');
INSERT INTO `area` VALUES ('169', '黔西南', '2', '8');
INSERT INTO `area` VALUES ('170', '毕节', '2', '8');
INSERT INTO `area` VALUES ('171', '安顺', '2', '8');
INSERT INTO `area` VALUES ('172', '黔东南', '2', '8');
INSERT INTO `area` VALUES ('173', '黔南', '2', '8');
INSERT INTO `area` VALUES ('174', '海口', '2', '9');
INSERT INTO `area` VALUES ('175', '三亚', '2', '9');
INSERT INTO `area` VALUES ('176', '三沙', '2', '9');
INSERT INTO `area` VALUES ('177', '五指山', '2', '9');
INSERT INTO `area` VALUES ('178', '琼海', '2', '9');
INSERT INTO `area` VALUES ('179', '儋州', '2', '9');
INSERT INTO `area` VALUES ('180', '文昌', '2', '9');
INSERT INTO `area` VALUES ('181', '万宁', '2', '9');
INSERT INTO `area` VALUES ('182', '东方', '2', '9');
INSERT INTO `area` VALUES ('183', '澄迈', '2', '9');
INSERT INTO `area` VALUES ('184', '定安', '2', '9');
INSERT INTO `area` VALUES ('185', '屯昌', '2', '9');
INSERT INTO `area` VALUES ('186', '临高', '2', '9');
INSERT INTO `area` VALUES ('187', '白沙', '2', '9');
INSERT INTO `area` VALUES ('188', '昌江', '2', '9');
INSERT INTO `area` VALUES ('189', '乐东', '2', '9');
INSERT INTO `area` VALUES ('190', '陵水', '2', '9');
INSERT INTO `area` VALUES ('191', '保亭', '2', '9');
INSERT INTO `area` VALUES ('192', '琼中', '2', '9');
INSERT INTO `area` VALUES ('193', '洋浦', '2', '9');
INSERT INTO `area` VALUES ('194', '石家庄', '2', '10');
INSERT INTO `area` VALUES ('195', '保定', '2', '10');
INSERT INTO `area` VALUES ('196', '邯郸', '2', '10');
INSERT INTO `area` VALUES ('197', '秦皇岛', '2', '10');
INSERT INTO `area` VALUES ('198', '张家口', '2', '10');
INSERT INTO `area` VALUES ('199', '唐山', '2', '10');
INSERT INTO `area` VALUES ('200', '承德', '2', '10');
INSERT INTO `area` VALUES ('201', '廊坊', '2', '10');
INSERT INTO `area` VALUES ('202', '沧州', '2', '10');
INSERT INTO `area` VALUES ('203', '衡水', '2', '10');
INSERT INTO `area` VALUES ('204', '邢台', '2', '10');
INSERT INTO `area` VALUES ('205', '哈尔滨', '2', '11');
INSERT INTO `area` VALUES ('206', '齐齐哈尔', '2', '11');
INSERT INTO `area` VALUES ('207', '牡丹江', '2', '11');
INSERT INTO `area` VALUES ('208', '佳木斯', '2', '11');
INSERT INTO `area` VALUES ('209', '大庆', '2', '11');
INSERT INTO `area` VALUES ('210', '鸡西', '2', '11');
INSERT INTO `area` VALUES ('211', '双鸭山', '2', '11');
INSERT INTO `area` VALUES ('212', '伊春', '2', '11');
INSERT INTO `area` VALUES ('213', '七台河', '2', '11');
INSERT INTO `area` VALUES ('214', '鹤岗', '2', '11');
INSERT INTO `area` VALUES ('215', '黑河', '2', '11');
INSERT INTO `area` VALUES ('216', '绥化', '2', '11');
INSERT INTO `area` VALUES ('217', '大兴安岭', '2', '11');
INSERT INTO `area` VALUES ('218', '郑州', '2', '12');
INSERT INTO `area` VALUES ('219', '开封', '2', '12');
INSERT INTO `area` VALUES ('220', '平顶山', '2', '12');
INSERT INTO `area` VALUES ('221', '洛阳', '2', '12');
INSERT INTO `area` VALUES ('222', '商丘', '2', '12');
INSERT INTO `area` VALUES ('223', '安阳', '2', '12');
INSERT INTO `area` VALUES ('224', '新乡', '2', '12');
INSERT INTO `area` VALUES ('225', '许昌', '2', '12');
INSERT INTO `area` VALUES ('226', '鹤壁', '2', '12');
INSERT INTO `area` VALUES ('227', '焦作', '2', '12');
INSERT INTO `area` VALUES ('228', '濮阳', '2', '12');
INSERT INTO `area` VALUES ('229', '漯河', '2', '12');
INSERT INTO `area` VALUES ('230', '三门峡', '2', '12');
INSERT INTO `area` VALUES ('231', '周口', '2', '12');
INSERT INTO `area` VALUES ('232', '驻马店', '2', '12');
INSERT INTO `area` VALUES ('233', '南阳', '2', '12');
INSERT INTO `area` VALUES ('234', '信阳', '2', '12');
INSERT INTO `area` VALUES ('235', '济源', '2', '12');
INSERT INTO `area` VALUES ('236', '武汉', '2', '13');
INSERT INTO `area` VALUES ('237', '黄石', '2', '13');
INSERT INTO `area` VALUES ('238', '十堰', '2', '13');
INSERT INTO `area` VALUES ('239', '荆州', '2', '13');
INSERT INTO `area` VALUES ('240', '宜昌', '2', '13');
INSERT INTO `area` VALUES ('241', '襄阳', '2', '13');
INSERT INTO `area` VALUES ('242', '鄂州', '2', '13');
INSERT INTO `area` VALUES ('243', '荆门', '2', '13');
INSERT INTO `area` VALUES ('244', '孝感', '2', '13');
INSERT INTO `area` VALUES ('245', '黄冈', '2', '13');
INSERT INTO `area` VALUES ('246', '咸宁', '2', '13');
INSERT INTO `area` VALUES ('247', '随州', '2', '13');
INSERT INTO `area` VALUES ('248', '恩施', '2', '13');
INSERT INTO `area` VALUES ('249', '仙桃', '2', '13');
INSERT INTO `area` VALUES ('250', '天门', '2', '13');
INSERT INTO `area` VALUES ('251', '潜江', '2', '13');
INSERT INTO `area` VALUES ('252', '神农架', '2', '13');
INSERT INTO `area` VALUES ('253', '长沙', '2', '14');
INSERT INTO `area` VALUES ('254', '株洲', '2', '14');
INSERT INTO `area` VALUES ('255', '湘潭', '2', '14');
INSERT INTO `area` VALUES ('256', '衡阳', '2', '14');
INSERT INTO `area` VALUES ('257', '邵阳', '2', '14');
INSERT INTO `area` VALUES ('258', '岳阳', '2', '14');
INSERT INTO `area` VALUES ('259', '张家界', '2', '14');
INSERT INTO `area` VALUES ('260', '益阳', '2', '14');
INSERT INTO `area` VALUES ('261', '常德', '2', '14');
INSERT INTO `area` VALUES ('262', '娄底', '2', '14');
INSERT INTO `area` VALUES ('263', '郴州', '2', '14');
INSERT INTO `area` VALUES ('264', '永州', '2', '14');
INSERT INTO `area` VALUES ('265', '怀化', '2', '14');
INSERT INTO `area` VALUES ('266', '湘西', '2', '14');
INSERT INTO `area` VALUES ('267', '呼和浩特', '2', '15');
INSERT INTO `area` VALUES ('268', '包头', '2', '15');
INSERT INTO `area` VALUES ('269', '乌海', '2', '15');
INSERT INTO `area` VALUES ('270', '赤峰', '2', '15');
INSERT INTO `area` VALUES ('271', '通辽', '2', '15');
INSERT INTO `area` VALUES ('272', '鄂尔多斯', '2', '15');
INSERT INTO `area` VALUES ('273', '呼伦贝尔', '2', '15');
INSERT INTO `area` VALUES ('274', '巴彦淖尔', '2', '15');
INSERT INTO `area` VALUES ('275', '乌兰察布', '2', '15');
INSERT INTO `area` VALUES ('276', '兴安盟', '2', '15');
INSERT INTO `area` VALUES ('277', '锡林郭勒盟', '2', '15');
INSERT INTO `area` VALUES ('278', '阿拉善盟', '2', '15');
INSERT INTO `area` VALUES ('279', '南京', '2', '16');
INSERT INTO `area` VALUES ('280', '无锡', '2', '16');
INSERT INTO `area` VALUES ('281', '徐州', '2', '16');
INSERT INTO `area` VALUES ('282', '常州', '2', '16');
INSERT INTO `area` VALUES ('283', '苏州', '2', '16');
INSERT INTO `area` VALUES ('284', '南通', '2', '16');
INSERT INTO `area` VALUES ('285', '连云港', '2', '16');
INSERT INTO `area` VALUES ('286', '淮安', '2', '16');
INSERT INTO `area` VALUES ('287', '盐城', '2', '16');
INSERT INTO `area` VALUES ('288', '扬州', '2', '16');
INSERT INTO `area` VALUES ('289', '镇江', '2', '16');
INSERT INTO `area` VALUES ('290', '泰州', '2', '16');
INSERT INTO `area` VALUES ('291', '宿迁', '2', '16');
INSERT INTO `area` VALUES ('292', '南昌', '2', '17');
INSERT INTO `area` VALUES ('293', '上饶', '2', '17');
INSERT INTO `area` VALUES ('294', '九江', '2', '17');
INSERT INTO `area` VALUES ('295', '萍乡', '2', '17');
INSERT INTO `area` VALUES ('296', '新余', '2', '17');
INSERT INTO `area` VALUES ('297', '鹰潭', '2', '17');
INSERT INTO `area` VALUES ('298', '赣州', '2', '17');
INSERT INTO `area` VALUES ('299', '宜春', '2', '17');
INSERT INTO `area` VALUES ('300', '景德镇', '2', '17');
INSERT INTO `area` VALUES ('301', '吉安', '2', '17');
INSERT INTO `area` VALUES ('302', '抚州', '2', '17');
INSERT INTO `area` VALUES ('303', '长春', '2', '18');
INSERT INTO `area` VALUES ('304', '吉林', '2', '18');
INSERT INTO `area` VALUES ('305', '四平', '2', '18');
INSERT INTO `area` VALUES ('306', '辽源', '2', '18');
INSERT INTO `area` VALUES ('307', '通化', '2', '18');
INSERT INTO `area` VALUES ('308', '白山', '2', '18');
INSERT INTO `area` VALUES ('309', '松原', '2', '18');
INSERT INTO `area` VALUES ('310', '白城', '2', '18');
INSERT INTO `area` VALUES ('311', '延边', '2', '18');
INSERT INTO `area` VALUES ('312', '沈阳', '2', '19');
INSERT INTO `area` VALUES ('313', '大连', '2', '19');
INSERT INTO `area` VALUES ('314', '鞍山', '2', '19');
INSERT INTO `area` VALUES ('315', '抚顺', '2', '19');
INSERT INTO `area` VALUES ('316', '本溪', '2', '19');
INSERT INTO `area` VALUES ('317', '丹东', '2', '19');
INSERT INTO `area` VALUES ('318', '锦州', '2', '19');
INSERT INTO `area` VALUES ('319', '营口', '2', '19');
INSERT INTO `area` VALUES ('320', '阜新', '2', '19');
INSERT INTO `area` VALUES ('321', '辽阳', '2', '19');
INSERT INTO `area` VALUES ('322', '盘锦', '2', '19');
INSERT INTO `area` VALUES ('323', '铁岭', '2', '19');
INSERT INTO `area` VALUES ('324', '朝阳', '2', '19');
INSERT INTO `area` VALUES ('325', '葫芦岛', '2', '19');
INSERT INTO `area` VALUES ('326', '银川', '2', '20');
INSERT INTO `area` VALUES ('327', '石嘴山', '2', '20');
INSERT INTO `area` VALUES ('328', '吴忠', '2', '20');
INSERT INTO `area` VALUES ('329', '固原', '2', '20');
INSERT INTO `area` VALUES ('330', '中卫', '2', '20');
INSERT INTO `area` VALUES ('331', '西宁', '2', '21');
INSERT INTO `area` VALUES ('332', '海东', '2', '21');
INSERT INTO `area` VALUES ('333', '海北', '2', '21');
INSERT INTO `area` VALUES ('334', '黄南', '2', '21');
INSERT INTO `area` VALUES ('335', '海南', '2', '21');
INSERT INTO `area` VALUES ('336', '果洛', '2', '21');
INSERT INTO `area` VALUES ('337', '玉树', '2', '21');
INSERT INTO `area` VALUES ('338', '海西', '2', '21');
INSERT INTO `area` VALUES ('339', '太原', '2', '22');
INSERT INTO `area` VALUES ('340', '大同', '2', '22');
INSERT INTO `area` VALUES ('341', '阳泉', '2', '22');
INSERT INTO `area` VALUES ('342', '长治', '2', '22');
INSERT INTO `area` VALUES ('343', '晋城', '2', '22');
INSERT INTO `area` VALUES ('344', '朔州', '2', '22');
INSERT INTO `area` VALUES ('345', '晋中', '2', '22');
INSERT INTO `area` VALUES ('346', '运城', '2', '22');
INSERT INTO `area` VALUES ('347', '忻州', '2', '22');
INSERT INTO `area` VALUES ('348', '临汾', '2', '22');
INSERT INTO `area` VALUES ('349', '吕梁', '2', '22');
INSERT INTO `area` VALUES ('350', '济南', '2', '23');
INSERT INTO `area` VALUES ('351', '青岛', '2', '23');
INSERT INTO `area` VALUES ('352', '淄博', '2', '23');
INSERT INTO `area` VALUES ('353', '枣庄', '2', '23');
INSERT INTO `area` VALUES ('354', '东营', '2', '23');
INSERT INTO `area` VALUES ('355', '烟台', '2', '23');
INSERT INTO `area` VALUES ('356', '潍坊', '2', '23');
INSERT INTO `area` VALUES ('357', '济宁', '2', '23');
INSERT INTO `area` VALUES ('358', '泰安', '2', '23');
INSERT INTO `area` VALUES ('359', '威海', '2', '23');
INSERT INTO `area` VALUES ('360', '日照', '2', '23');
INSERT INTO `area` VALUES ('361', '滨州', '2', '23');
INSERT INTO `area` VALUES ('362', '德州', '2', '23');
INSERT INTO `area` VALUES ('363', '聊城', '2', '23');
INSERT INTO `area` VALUES ('364', '临沂', '2', '23');
INSERT INTO `area` VALUES ('365', '菏泽', '2', '23');
INSERT INTO `area` VALUES ('366', '莱芜', '2', '23');
INSERT INTO `area` VALUES ('367', '黄浦区', '2', '24');
INSERT INTO `area` VALUES ('368', '徐汇区', '2', '24');
INSERT INTO `area` VALUES ('369', '长宁区', '2', '24');
INSERT INTO `area` VALUES ('370', '静安区', '2', '24');
INSERT INTO `area` VALUES ('371', '普陀区', '2', '24');
INSERT INTO `area` VALUES ('372', '闸北区', '2', '24');
INSERT INTO `area` VALUES ('373', '虹口区', '2', '24');
INSERT INTO `area` VALUES ('374', '杨浦区', '2', '24');
INSERT INTO `area` VALUES ('375', '闵行区', '2', '24');
INSERT INTO `area` VALUES ('376', '宝山区', '2', '24');
INSERT INTO `area` VALUES ('377', '嘉定区', '2', '24');
INSERT INTO `area` VALUES ('378', '浦东新区', '2', '24');
INSERT INTO `area` VALUES ('379', '金山区', '2', '24');
INSERT INTO `area` VALUES ('380', '松江区', '2', '24');
INSERT INTO `area` VALUES ('381', '青浦区', '2', '24');
INSERT INTO `area` VALUES ('382', '奉贤区', '2', '24');
INSERT INTO `area` VALUES ('383', '崇明县', '2', '24');
INSERT INTO `area` VALUES ('384', '成都', '2', '25');
INSERT INTO `area` VALUES ('385', '自贡', '2', '25');
INSERT INTO `area` VALUES ('386', '攀枝花', '2', '25');
INSERT INTO `area` VALUES ('387', '泸州', '2', '25');
INSERT INTO `area` VALUES ('388', '德阳', '2', '25');
INSERT INTO `area` VALUES ('389', '绵阳', '2', '25');
INSERT INTO `area` VALUES ('390', '广元', '2', '25');
INSERT INTO `area` VALUES ('391', '遂宁', '2', '25');
INSERT INTO `area` VALUES ('392', '内江', '2', '25');
INSERT INTO `area` VALUES ('393', '乐山', '2', '25');
INSERT INTO `area` VALUES ('394', '南充', '2', '25');
INSERT INTO `area` VALUES ('395', '宜宾', '2', '25');
INSERT INTO `area` VALUES ('396', '眉山', '2', '25');
INSERT INTO `area` VALUES ('397', '广安', '2', '25');
INSERT INTO `area` VALUES ('398', '达州', '2', '25');
INSERT INTO `area` VALUES ('399', '雅安', '2', '25');
INSERT INTO `area` VALUES ('400', '巴中', '2', '25');
INSERT INTO `area` VALUES ('401', '资阳', '2', '25');
INSERT INTO `area` VALUES ('402', '阿坝', '2', '25');
INSERT INTO `area` VALUES ('403', '甘孜', '2', '25');
INSERT INTO `area` VALUES ('404', '凉山', '2', '25');
INSERT INTO `area` VALUES ('405', '和平区', '2', '26');
INSERT INTO `area` VALUES ('406', '河西区', '2', '26');
INSERT INTO `area` VALUES ('407', '南开区', '2', '26');
INSERT INTO `area` VALUES ('408', '河东区', '2', '26');
INSERT INTO `area` VALUES ('409', '河北区', '2', '26');
INSERT INTO `area` VALUES ('410', '红桥区', '2', '26');
INSERT INTO `area` VALUES ('411', '东丽区', '2', '26');
INSERT INTO `area` VALUES ('412', '津南区', '2', '26');
INSERT INTO `area` VALUES ('413', '西青区', '2', '26');
INSERT INTO `area` VALUES ('414', '北辰区', '2', '26');
INSERT INTO `area` VALUES ('415', '滨海新区', '2', '26');
INSERT INTO `area` VALUES ('416', '武清区', '2', '26');
INSERT INTO `area` VALUES ('417', '宝坻区', '2', '26');
INSERT INTO `area` VALUES ('418', '蓟县', '2', '26');
INSERT INTO `area` VALUES ('419', '宁河县', '2', '26');
INSERT INTO `area` VALUES ('420', '静海县', '2', '26');
INSERT INTO `area` VALUES ('421', '拉萨', '2', '27');
INSERT INTO `area` VALUES ('422', '昌都', '2', '27');
INSERT INTO `area` VALUES ('423', '林芝', '2', '27');
INSERT INTO `area` VALUES ('424', '山南', '2', '27');
INSERT INTO `area` VALUES ('425', '日喀则', '2', '27');
INSERT INTO `area` VALUES ('426', '那曲', '2', '27');
INSERT INTO `area` VALUES ('427', '阿里', '2', '27');
INSERT INTO `area` VALUES ('428', '乌鲁木齐', '2', '28');
INSERT INTO `area` VALUES ('429', '克拉玛依', '2', '28');
INSERT INTO `area` VALUES ('430', '吐鲁番', '2', '28');
INSERT INTO `area` VALUES ('431', '哈密', '2', '28');
INSERT INTO `area` VALUES ('432', '阿克苏', '2', '28');
INSERT INTO `area` VALUES ('433', '喀什', '2', '28');
INSERT INTO `area` VALUES ('434', '和田', '2', '28');
INSERT INTO `area` VALUES ('435', '阿勒泰', '2', '28');
INSERT INTO `area` VALUES ('436', '昌吉', '2', '28');
INSERT INTO `area` VALUES ('437', '博尔塔拉蒙古', '2', '28');
INSERT INTO `area` VALUES ('438', '巴音郭楞蒙古', '2', '28');
INSERT INTO `area` VALUES ('439', '克孜勒苏柯尔克孜', '2', '28');
INSERT INTO `area` VALUES ('440', '伊犁哈萨克', '2', '28');
INSERT INTO `area` VALUES ('441', '石河子', '2', '28');
INSERT INTO `area` VALUES ('442', '阿拉尔', '2', '28');
INSERT INTO `area` VALUES ('443', '图木舒克', '2', '28');
INSERT INTO `area` VALUES ('444', '五家渠', '2', '28');
INSERT INTO `area` VALUES ('445', '昆明', '2', '29');
INSERT INTO `area` VALUES ('446', '曲靖', '2', '29');
INSERT INTO `area` VALUES ('447', '玉溪', '2', '29');
INSERT INTO `area` VALUES ('448', '保山', '2', '29');
INSERT INTO `area` VALUES ('449', '昭通', '2', '29');
INSERT INTO `area` VALUES ('450', '丽江', '2', '29');
INSERT INTO `area` VALUES ('451', '普洱', '2', '29');
INSERT INTO `area` VALUES ('452', '临沧', '2', '29');
INSERT INTO `area` VALUES ('453', '楚雄', '2', '29');
INSERT INTO `area` VALUES ('454', '大理', '2', '29');
INSERT INTO `area` VALUES ('455', '红河', '2', '29');
INSERT INTO `area` VALUES ('456', '文山', '2', '29');
INSERT INTO `area` VALUES ('457', '西双版纳', '2', '29');
INSERT INTO `area` VALUES ('458', '德宏', '2', '29');
INSERT INTO `area` VALUES ('459', '怒江', '2', '29');
INSERT INTO `area` VALUES ('460', '迪庆', '2', '29');
INSERT INTO `area` VALUES ('461', '杭州', '2', '30');
INSERT INTO `area` VALUES ('462', '宁波', '2', '30');
INSERT INTO `area` VALUES ('463', '温州', '2', '30');
INSERT INTO `area` VALUES ('464', '嘉兴', '2', '30');
INSERT INTO `area` VALUES ('465', '湖州', '2', '30');
INSERT INTO `area` VALUES ('466', '绍兴', '2', '30');
INSERT INTO `area` VALUES ('467', '金华', '2', '30');
INSERT INTO `area` VALUES ('468', '衢州', '2', '30');
INSERT INTO `area` VALUES ('469', '舟山', '2', '30');
INSERT INTO `area` VALUES ('470', '台州', '2', '30');
INSERT INTO `area` VALUES ('471', '丽水', '2', '30');
INSERT INTO `area` VALUES ('472', '西安', '2', '31');
INSERT INTO `area` VALUES ('473', '宝鸡', '2', '31');
INSERT INTO `area` VALUES ('474', '咸阳', '2', '31');
INSERT INTO `area` VALUES ('475', '渭南', '2', '31');
INSERT INTO `area` VALUES ('476', '铜川', '2', '31');
INSERT INTO `area` VALUES ('477', '延安', '2', '31');
INSERT INTO `area` VALUES ('478', '榆林', '2', '31');
INSERT INTO `area` VALUES ('479', '汉中', '2', '31');
INSERT INTO `area` VALUES ('480', '安康', '2', '31');
INSERT INTO `area` VALUES ('481', '商洛', '2', '31');
INSERT INTO `area` VALUES ('482', '台北市', '2', '32');
INSERT INTO `area` VALUES ('483', '高雄市', '2', '32');
INSERT INTO `area` VALUES ('484', '新北市', '2', '32');
INSERT INTO `area` VALUES ('485', '台中市', '2', '32');
INSERT INTO `area` VALUES ('486', '台南市', '2', '32');
INSERT INTO `area` VALUES ('487', '基隆市', '2', '32');
INSERT INTO `area` VALUES ('488', '新竹市', '2', '32');
INSERT INTO `area` VALUES ('489', '嘉义市', '2', '32');
INSERT INTO `area` VALUES ('490', '桃园县', '2', '32');
INSERT INTO `area` VALUES ('491', '新竹县', '2', '32');
INSERT INTO `area` VALUES ('492', '苗栗县', '2', '32');
INSERT INTO `area` VALUES ('493', '彰化县', '2', '32');
INSERT INTO `area` VALUES ('494', '南投县', '2', '32');
INSERT INTO `area` VALUES ('495', '云林县', '2', '32');
INSERT INTO `area` VALUES ('496', '嘉义县', '2', '32');
INSERT INTO `area` VALUES ('497', '屏东县', '2', '32');
INSERT INTO `area` VALUES ('498', '宜兰县', '2', '32');
INSERT INTO `area` VALUES ('499', '花莲县', '2', '32');
INSERT INTO `area` VALUES ('500', '台东县', '2', '32');
INSERT INTO `area` VALUES ('501', '澎湖县', '2', '32');
INSERT INTO `area` VALUES ('502', '中西区', '2', '33');
INSERT INTO `area` VALUES ('503', '湾仔区', '2', '33');
INSERT INTO `area` VALUES ('504', '东区', '2', '33');
INSERT INTO `area` VALUES ('505', '南区', '2', '33');
INSERT INTO `area` VALUES ('506', '油尖旺区', '2', '33');
INSERT INTO `area` VALUES ('507', '深水埗区', '2', '33');
INSERT INTO `area` VALUES ('508', '九龙城区', '2', '33');
INSERT INTO `area` VALUES ('509', '黄大仙区', '2', '33');
INSERT INTO `area` VALUES ('510', '观塘区', '2', '33');
INSERT INTO `area` VALUES ('511', '北区', '2', '33');
INSERT INTO `area` VALUES ('512', '大埔区', '2', '33');
INSERT INTO `area` VALUES ('513', '沙田区', '2', '33');
INSERT INTO `area` VALUES ('514', '西贡区', '2', '33');
INSERT INTO `area` VALUES ('515', '荃湾区', '2', '33');
INSERT INTO `area` VALUES ('516', '屯门区', '2', '33');
INSERT INTO `area` VALUES ('517', '元朗区', '2', '33');
INSERT INTO `area` VALUES ('518', '葵青区', '2', '33');
INSERT INTO `area` VALUES ('519', '离岛区', '2', '33');
INSERT INTO `area` VALUES ('520', '花地玛堂区', '2', '34');
INSERT INTO `area` VALUES ('521', '圣安多尼堂区', '2', '34');
INSERT INTO `area` VALUES ('522', '大堂区', '2', '34');
INSERT INTO `area` VALUES ('523', '望德堂区', '2', '34');
INSERT INTO `area` VALUES ('524', '风顺堂区', '2', '34');
INSERT INTO `area` VALUES ('525', '嘉模堂区', '2', '34');
INSERT INTO `area` VALUES ('526', '圣方济各堂区', '2', '34');
INSERT INTO `area` VALUES ('527', '路氹城', '2', '34');
INSERT INTO `area` VALUES ('528', '阿联酋', '2', '35');
INSERT INTO `area` VALUES ('529', '阿根廷', '2', '35');
INSERT INTO `area` VALUES ('530', '澳大利亚', '2', '35');
INSERT INTO `area` VALUES ('531', '奥地利', '2', '35');
INSERT INTO `area` VALUES ('532', '比利时', '2', '35');
INSERT INTO `area` VALUES ('533', '巴西', '2', '35');
INSERT INTO `area` VALUES ('534', '保加利亚', '2', '35');
INSERT INTO `area` VALUES ('535', '加拿大', '2', '35');
INSERT INTO `area` VALUES ('536', '智利', '2', '35');
INSERT INTO `area` VALUES ('537', '古巴', '2', '35');
INSERT INTO `area` VALUES ('538', '捷克', '2', '35');
INSERT INTO `area` VALUES ('539', '丹麦', '2', '35');
INSERT INTO `area` VALUES ('540', '德国', '2', '35');
INSERT INTO `area` VALUES ('541', '埃及', '2', '35');
INSERT INTO `area` VALUES ('542', '西班牙', '2', '35');
INSERT INTO `area` VALUES ('543', '爱沙尼亚', '2', '35');
INSERT INTO `area` VALUES ('544', '芬兰', '2', '35');
INSERT INTO `area` VALUES ('545', '法国', '2', '35');
INSERT INTO `area` VALUES ('546', '希腊', '2', '35');
INSERT INTO `area` VALUES ('547', '英国', '2', '35');
INSERT INTO `area` VALUES ('548', '印度', '2', '35');
INSERT INTO `area` VALUES ('549', '印度尼西亚', '2', '35');
INSERT INTO `area` VALUES ('550', '爱尔兰', '2', '35');
INSERT INTO `area` VALUES ('551', '意大利', '2', '35');
INSERT INTO `area` VALUES ('552', '日本', '2', '35');
INSERT INTO `area` VALUES ('553', '朝鲜', '2', '35');
INSERT INTO `area` VALUES ('554', '韩国', '2', '35');
INSERT INTO `area` VALUES ('555', '马来西亚', '2', '35');
INSERT INTO `area` VALUES ('556', '墨西哥', '2', '35');
INSERT INTO `area` VALUES ('557', '荷兰', '2', '35');
INSERT INTO `area` VALUES ('558', '新西兰', '2', '35');
INSERT INTO `area` VALUES ('559', '挪威', '2', '35');
INSERT INTO `area` VALUES ('560', '巴基斯坦', '2', '35');
INSERT INTO `area` VALUES ('561', '菲律宾', '2', '35');
INSERT INTO `area` VALUES ('562', '波兰', '2', '35');
INSERT INTO `area` VALUES ('563', '葡萄牙', '2', '35');
INSERT INTO `area` VALUES ('564', '俄罗斯', '2', '35');
INSERT INTO `area` VALUES ('565', '沙特阿拉伯', '2', '35');
INSERT INTO `area` VALUES ('566', '新加坡', '2', '35');
INSERT INTO `area` VALUES ('567', '瑞典', '2', '35');
INSERT INTO `area` VALUES ('568', '泰国', '2', '35');
INSERT INTO `area` VALUES ('569', '土耳其', '2', '35');
INSERT INTO `area` VALUES ('570', '乌克兰', '2', '35');
INSERT INTO `area` VALUES ('571', '美国', '2', '35');
INSERT INTO `area` VALUES ('572', '南非', '2', '35');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `articleId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `articleTitle` varchar(255) NOT NULL COMMENT '文章标题',
  `articleNavRead` varchar(255) DEFAULT NULL COMMENT '文章导读',
  `articleLink` varchar(255) DEFAULT NULL COMMENT '文章链接',
  `articleCoverFlag` bit(1) NOT NULL DEFAULT b'0' COMMENT '文章是否有题图\r\n1：存在\r\n2：不存在',
  `articlePublishDateTime` datetime NOT NULL COMMENT '文章发表的日期与时间',
  PRIMARY KEY (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '移动开发者必须了解的10大跨平台工具', '在本文中，我们盘点了过去的一年里，最受开发者喜爱的跨平台应用及游戏开发工具，尤以HTML/JS/CSS为众。 ', 'http://www.csdn.net/article/2014-02-24/2818511-cross-platform-developer-tools', '', '2013-03-14 15:37:21');
INSERT INTO `article` VALUES ('2', 'NetBeans IDE 8.0新特性回眸一瞥', '', 'http://www.csdn.net/article/2014-03-11/2818718', '\0', '2013-03-14 16:00:47');
INSERT INTO `article` VALUES ('3', '福布斯：全球那些富可敌国的科技大佬们', '', 'http://www.csdn.net/article/2014-03-10/2818709-30-richest-techies-in-the-world', '\0', '2013-03-14 16:01:11');
INSERT INTO `article` VALUES ('4', '年交易额1800亿美元，揭秘PayPal成功背后的三大热门技术', '', 'http://www.csdn.net/article/2014-03-11/2818716-how-paypal-makes-merchants-smarter-through-data-mining', '\0', '2013-03-14 16:01:27');
INSERT INTO `article` VALUES ('5', 'iUI：移动Web应用开发必备的开源框架', '', 'http://www.csdn.net/article/2014-03-10/2818705-Framework-for-WebApp-iUI', '\0', '2013-03-14 16:02:05');
INSERT INTO `article` VALUES ('6', '微软确认今年推出新版Office for Mac', '', 'http://www.csdn.net/article/2014-03-12/2818731', '\0', '2013-03-14 16:02:16');

-- ----------------------------
-- Table structure for attr
-- ----------------------------
DROP TABLE IF EXISTS `attr`;
CREATE TABLE `attr` (
  `attrId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性编号',
  `attrName` varchar(255) NOT NULL COMMENT '属性名',
  `attrIntro` varchar(255) DEFAULT NULL COMMENT '属性介绍',
  PRIMARY KEY (`attrId`),
  UNIQUE KEY `index_attrName` (`attrName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='网站属性';

-- ----------------------------
-- Records of attr
-- ----------------------------
INSERT INTO `attr` VALUES ('1', '搜索引擎', '从互联网上检索信息的服务系统。');
INSERT INTO `attr` VALUES ('2', '综合门户', '提供综合性互联网资讯、资源服务的网站。');
INSERT INTO `attr` VALUES ('3', '新闻', '时政消息，新资讯。');
INSERT INTO `attr` VALUES ('4', '网址导航', '提供通往各类网站的入口。');
INSERT INTO `attr` VALUES ('5', '百科', '各领域的资料集。');
INSERT INTO `attr` VALUES ('6', '问答', '提问以求解答的平台。');
INSERT INTO `attr` VALUES ('7', '电子地图', '现实世界地图的数字化。');
INSERT INTO `attr` VALUES ('8', '译典', '翻译与辞典。');
INSERT INTO `attr` VALUES ('9', '博客', '提供博客服务的平台。');
INSERT INTO `attr` VALUES ('10', '微博客', '提供微博客服务的平台。');
INSERT INTO `attr` VALUES ('11', '轻博客', '提供轻博客服务的平台。');
INSERT INTO `attr` VALUES ('12', '电子邮箱', '通过互联网收发信息的平台。');
INSERT INTO `attr` VALUES ('13', '社交网络', '线上交友、互动的社会化平台。');
INSERT INTO `attr` VALUES ('14', '文学', '在线阅读服务，文学评论与探讨。');
INSERT INTO `attr` VALUES ('15', '音乐', '在线试听服务，音乐评论与探讨。');
INSERT INTO `attr` VALUES ('16', '影视', '在线视频观看服务，电影及各种视频的评论与探讨。');
INSERT INTO `attr` VALUES ('17', '设计', '设计教学、交流与素材共享。');
INSERT INTO `attr` VALUES ('18', '动漫', '动画、漫画及其衍生文化。');
INSERT INTO `attr` VALUES ('19', '游戏', '电子游戏、桌面游戏及其衍生文化。');
INSERT INTO `attr` VALUES ('20', '体育', '体力、脑力运动的文化传播与交流。');
INSERT INTO `attr` VALUES ('21', '娱乐圈', '');
INSERT INTO `attr` VALUES ('22', '科技', '');
INSERT INTO `attr` VALUES ('23', '婚恋', '');
INSERT INTO `attr` VALUES ('24', '宠物', '');
INSERT INTO `attr` VALUES ('25', '教育', '');
INSERT INTO `attr` VALUES ('26', 'IT', '');
INSERT INTO `attr` VALUES ('27', '软件', '');
INSERT INTO `attr` VALUES ('28', '资源共享', '');
INSERT INTO `attr` VALUES ('29', '文档', '');
INSERT INTO `attr` VALUES ('30', '论坛', '');
INSERT INTO `attr` VALUES ('31', 'B2B', '');
INSERT INTO `attr` VALUES ('32', 'B2C', '');
INSERT INTO `attr` VALUES ('33', 'C2C', '');
INSERT INTO `attr` VALUES ('34', '团购', '');

-- ----------------------------
-- Table structure for attrsynonym
-- ----------------------------
DROP TABLE IF EXISTS `attrsynonym`;
CREATE TABLE `attrsynonym` (
  `attrSynonymId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性近义词编号',
  `attrSynonymName` varchar(255) NOT NULL COMMENT '属性近义词名',
  `attrId` int(10) unsigned DEFAULT NULL COMMENT '属性近义词所对应的属性编号',
  PRIMARY KEY (`attrSynonymId`),
  KEY `index_attrId` (`attrId`) USING BTREE,
  CONSTRAINT `attrsynonym_ibfk_1` FOREIGN KEY (`attrId`) REFERENCES `attr` (`attrId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attrsynonym
-- ----------------------------
INSERT INTO `attrsynonym` VALUES ('1', '资讯', '3');
INSERT INTO `attrsynonym` VALUES ('2', '时事政治', '3');
INSERT INTO `attrsynonym` VALUES ('3', '时政', '3');
INSERT INTO `attrsynonym` VALUES ('4', '网站导航', '4');
INSERT INTO `attrsynonym` VALUES ('5', '大百科全书', '5');
INSERT INTO `attrsynonym` VALUES ('6', '问问题', '6');
INSERT INTO `attrsynonym` VALUES ('7', '围脖', '10');
INSERT INTO `attrsynonym` VALUES ('8', 'email', '12');
INSERT INTO `attrsynonym` VALUES ('9', 'e-mail', '12');
INSERT INTO `attrsynonym` VALUES ('10', 'SNS', '13');
INSERT INTO `attrsynonym` VALUES ('11', '社交网站', '13');
INSERT INTO `attrsynonym` VALUES ('12', '阅读书', '14');
INSERT INTO `attrsynonym` VALUES ('13', '歌曲', '15');
INSERT INTO `attrsynonym` VALUES ('14', '素材', '17');
INSERT INTO `attrsynonym` VALUES ('15', '动画片', '18');
INSERT INTO `attrsynonym` VALUES ('16', '卡通片', '18');
INSERT INTO `attrsynonym` VALUES ('17', '漫画', '18');
INSERT INTO `attrsynonym` VALUES ('18', '视频', '16');
INSERT INTO `attrsynonym` VALUES ('19', '运动', '20');
INSERT INTO `attrsynonym` VALUES ('20', 'bbs', '30');

-- ----------------------------
-- Table structure for cat
-- ----------------------------
DROP TABLE IF EXISTS `cat`;
CREATE TABLE `cat` (
  `catId` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `catName` varchar(255) NOT NULL COMMENT '分类名',
  PRIMARY KEY (`catId`),
  UNIQUE KEY `index_catName` (`catName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='网站分类';

-- ----------------------------
-- Records of cat
-- ----------------------------
INSERT INTO `cat` VALUES ('3', '电子商务');
INSERT INTO `cat` VALUES ('2', '社交互动');
INSERT INTO `cat` VALUES ('4', '网络服务');
INSERT INTO `cat` VALUES ('1', '资讯资源');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `commentStar` tinyint(4) NOT NULL COMMENT '网站星数',
  `commentContent` text COMMENT '评论内容',
  `commentPublishDateTime` datetime NOT NULL COMMENT '评论发布的日期时间',
  `commentLastEditDateTime` datetime NOT NULL COMMENT '评论最后修改的日期时间',
  `websiteId` int(10) unsigned NOT NULL COMMENT '评论所属网站编号',
  `userId` int(10) unsigned NOT NULL COMMENT '发表评论的用户编号',
  PRIMARY KEY (`commentId`),
  UNIQUE KEY `index_websiteId_userId` (`websiteId`,`userId`) USING BTREE,
  KEY `index_websiteId` (`websiteId`) USING BTREE,
  KEY `index_userId` (`userId`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`websiteId`) REFERENCES `website` (`websiteId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '6', '这个轻博客的优点是……扒拉扒拉扒拉', '2013-02-26 12:21:04', '2013-02-26 12:21:08', '179', '3');
INSERT INTO `comment` VALUES ('2', '3', '第二篇评论测试！', '2013-03-01 14:00:14', '2013-03-01 14:00:14', '179', '5');
INSERT INTO `comment` VALUES ('3', '6', '。。。', '2014-03-13 22:15:45', '2014-03-13 22:15:45', '45', '8');

-- ----------------------------
-- Table structure for echo
-- ----------------------------
DROP TABLE IF EXISTS `echo`;
CREATE TABLE `echo` (
  `echoId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '回应编号',
  `echoContent` text NOT NULL COMMENT '回应内容',
  `echoPublishDateTime` datetime NOT NULL COMMENT '回应发表的日期与时间',
  `commentId` int(10) unsigned DEFAULT NULL COMMENT '回应所属的评论编号',
  `userId` int(10) unsigned NOT NULL COMMENT '发表回应的用户编号',
  PRIMARY KEY (`echoId`),
  KEY `index_commentId` (`commentId`) USING BTREE,
  KEY `index_userId` (`userId`) USING BTREE,
  CONSTRAINT `echo_ibfk_1` FOREIGN KEY (`commentId`) REFERENCES `comment` (`commentId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `echo_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of echo
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `noticeId` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `noticeTitle` varchar(255) NOT NULL COMMENT '公告标题',
  `noticeContent` text COMMENT '公告内容',
  `noticePublishDateTime` datetime NOT NULL COMMENT '公告发布的日期与时间',
  `noticeLastEditDateTime` datetime NOT NULL COMMENT '公告最后编辑的日期与时间',
  `adminId` smallint(5) unsigned DEFAULT NULL COMMENT '发布公告的管理员编号',
  PRIMARY KEY (`noticeId`),
  KEY `index_adminId` (`adminId`) USING BTREE,
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `userAccount` varchar(255) NOT NULL COMMENT '用户帐号',
  `userPass` varchar(255) NOT NULL COMMENT '用户密码',
  `userNickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `userEmail` varchar(255) NOT NULL COMMENT '用户电子邮箱',
  `userFaceFlag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户是否有头像\r\n有：1\r\n无：0',
  `userStatus` tinyint(3) NOT NULL DEFAULT '1' COMMENT '用户状态\r\n\r\n0：刚注册，尚未通过邮箱验证\r\n1：通过邮箱验证的正式用户\r\n\r\n-1：禁言\r\n-2：黑名单（无法登录）\r\n-3：除名用户',
  `userPersonalIntro` varchar(255) DEFAULT NULL COMMENT '用户个人介绍',
  `userSex` tinyint(4) DEFAULT NULL COMMENT '用户性别\r\n1：男\r\n2：女',
  `userBirthday` date DEFAULT NULL COMMENT '用户生日',
  `areaId` smallint(4) unsigned DEFAULT NULL COMMENT '用户所在地',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `index_userAccount` (`userAccount`) USING BTREE,
  UNIQUE KEY `index_userNickName` (`userNickName`) USING BTREE,
  KEY `index_areaId` (`areaId`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', 'magic1412kid', '2bc85fdd7994d161273f991cac1e830f', '羽斗KID', '316942804@qq.com', '0', '1', null, null, null, null);
INSERT INTO `user` VALUES ('4', 'magic1412kid2', '2bc85fdd7994d161273f991cac1e830f', '测试2号机！', '316942804@qq.com', '1', '1', '测试人员', '1', '1951-04-03', '534');
INSERT INTO `user` VALUES ('5', 'magic1412kid234', '2bc85fdd7994d161273f991cac1e830f', 'KID222', 'magic1412kid@163.com', '1', '1', '1233444', '2', '1961-04-10', '188');
INSERT INTO `user` VALUES ('6', 'mofuli11', 'e8d155e6d0552b1598efad5e1a8ead53', 'mofuli', 'cherryyq@hotmail.com', '1', '1', '', '0', null, '369');
INSERT INTO `user` VALUES ('7', 'wumengyh3', '2bc85fdd7994d161273f991cac1e830f', 'hotmail测试帐号！', 'magic1412kid@hotmail.com', '0', '1', null, null, null, null);
INSERT INTO `user` VALUES ('8', 'unicornkid', '2bc85fdd7994d161273f991cac1e830f', 'Unicorn-KID', '316942804@qq.com', '0', '1', '', null, null, null);
INSERT INTO `user` VALUES ('9', '630637932', '3653bdbb6529ebf18663e57f45be9b0c', '紫氚', '630637932@qq.com', '0', '1', null, null, null, null);

-- ----------------------------
-- Table structure for user_waitvalidation
-- ----------------------------
DROP TABLE IF EXISTS `user_waitvalidation`;
CREATE TABLE `user_waitvalidation` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '待验证用户编号',
  `userAccount` varchar(255) NOT NULL COMMENT '待验证用户帐号',
  `userPass` varchar(255) NOT NULL COMMENT '待验证用户密码',
  `userNickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '待验证用户昵称',
  `userEmail` varchar(255) NOT NULL COMMENT '待验证用户电子邮箱',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `index_userAccount` (`userAccount`) USING BTREE,
  UNIQUE KEY `index_userNickName` (`userNickName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_waitvalidation
-- ----------------------------
INSERT INTO `user_waitvalidation` VALUES ('4', 'wumy', '202cb962ac59075b964b07152d234b70', '测试3号机！', 'magic1412kid@hotmail.com');
INSERT INTO `user_waitvalidation` VALUES ('5', 'magic1412kid222222', '202cb962ac59075b964b07152d234b70', '11122测试', 'magic1412kid@hotmail.com');
INSERT INTO `user_waitvalidation` VALUES ('6', 'magic1412kid2222223', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '11122测试11', 'magic1412kid@hotmail.com');
INSERT INTO `user_waitvalidation` VALUES ('7', 'magic1412kid22222234', '202cb962ac59075b964b07152d234b70', '11122测试1133', 'magic1412kid@hotmail.com');

-- ----------------------------
-- Table structure for website
-- ----------------------------
DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `websiteId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '网站编号',
  `websiteName` varchar(255) DEFAULT NULL COMMENT '网站名',
  `websiteDomain` varchar(255) DEFAULT NULL COMMENT '网站域名',
  `websiteBriefIntro` varchar(255) DEFAULT NULL COMMENT '网站简介',
  `websiteDetailedIntro` text COMMENT '网站详细介绍',
  `websiteOwner` varchar(255) DEFAULT NULL COMMENT '网站所有者（所有者为个人则设为“个人”）',
  `websiteEstablishYear` smallint(4) DEFAULT NULL COMMENT '成立日期的年份',
  `websiteEstablishMonth` tinyint(4) DEFAULT NULL COMMENT '成立日期的月份',
  `websiteEstablishDay` tinyint(4) DEFAULT NULL COMMENT '成立日期的日份',
  `catId` smallint(6) unsigned DEFAULT '0' COMMENT '网站分类',
  `websiteStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '网站状态\r\n 1 - 正常\r\n 0 - 待审核\r\n-1 - 进入回收站',
  PRIMARY KEY (`websiteId`),
  UNIQUE KEY `index_websiteDomain` (`websiteDomain`) USING BTREE,
  KEY `index_catId` (`catId`) USING BTREE,
  CONSTRAINT `website_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `cat` (`catId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8 COMMENT='网站';

-- ----------------------------
-- Records of website
-- ----------------------------
INSERT INTO `website` VALUES ('1', '星象仪', 'webstar365.com', '', '', '', '2013', null, null, '4', '0');
INSERT INTO `website` VALUES ('2', '百度', 'baidu.com', '提供对互联网资讯、资源的检索服务。', '', '北京百度网讯科技有限公司', '2000', '1', null, '4', '0');
INSERT INTO `website` VALUES ('3', '谷歌', 'google.com.hk', '提供对互联网资讯、资源的检索服务。', '', '', '1998', '9', '7', '4', '0');
INSERT INTO `website` VALUES ('4', '搜狗', 'sogou.com', '提供对互联网资讯、资源的检索服务。', '', '北京搜狗信息服务有限公司', '2004', '8', '3', '4', '0');
INSERT INTO `website` VALUES ('5', '雅虎全能搜', 'search.cn.yahoo.com', '提供对互联网资讯、资源的检索服务。', null, '北京阿里巴巴信息技术有限公司', '1994', '4', null, '4', '0');
INSERT INTO `website` VALUES ('6', '必应Bing', 'cn.bing.com', '提供对互联网资讯、资源的检索服务。', '', '上海美斯恩网络通讯技术有限公司', '2009', '5', '28', '4', '0');
INSERT INTO `website` VALUES ('7', 'SOSO搜搜', 'soso.com', '提供对互联网资讯、资源的检索服务。', '', '深圳市腾讯计算机系统有限公司', '2006', '3', null, '4', '0');
INSERT INTO `website` VALUES ('8', '360搜索', 'so.com', '提供对互联网资讯、资源的检索功能。', '', '北京奇虎科技有限公司', '2012', '8', null, '4', '0');
INSERT INTO `website` VALUES ('9', '有道', 'youdao.com', '提供对互联网资讯、资源的检索服务。', null, '北京网易有道计算机系统有限公司', '2007', '12', '11', '4', '0');
INSERT INTO `website` VALUES ('10', '即刻', 'jike.com', '提供对互联网资讯、资源的检索服务。', null, '人民搜索网络股份公司', '2011', '6', '20', '4', '0');
INSERT INTO `website` VALUES ('11', '中搜', 'zhongsou.com', '提供对互联网资讯、资源的检索服务。', null, '北京中搜网络技术股份有限公司', '2003', '8', null, '4', '0');
INSERT INTO `website` VALUES ('12', '盘古', 'panguso.com', '提供对互联网资讯、资源的检索服务。', null, '盘古文化传播有限公司', '2011', '2', '22', '4', '0');
INSERT INTO `website` VALUES ('13', '伍佰亿', 'wubaiyi.com', '提供对互联网资讯、资源的检索服务。', null, '北京亿企商科技有限公司', '2011', '10', '18', '4', '0');
INSERT INTO `website` VALUES ('14', '搜乐', 'sooule.com', '提供对互联网资讯、资源的检索服务。', null, '广州市明智科技有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('15', '搜乐', 'souhappy.com', '提供对互联网资讯、资源的检索服务。', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('16', '搜网全能搜', 'so.sowang.com', '提供对互联网资讯、资源的检索服务。', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('17', '百Google度', 'baigoogledu.com', '提供对互联网资讯、资源的检索服务。', '', '', '2005', null, null, '4', '0');
INSERT INTO `website` VALUES ('18', '全搜索', 'quanss.com', '提供对互联网资讯、资源的检索服务。', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('19', '全搜', '全搜.com', '提供对互联网资讯、资源的检索服务。', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('20', '元搜', 'yuanso.com', '提供对互联网资讯、资源的检索服务。', null, '', '2012', '5', '1', '4', '0');
INSERT INTO `website` VALUES ('21', '唯搜', 'waysoo.com', '提供对互联网资讯、资源的检索服务。', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('22', '搜库', 'soku.com', '提供对在线视频的检索服务。', '', '', '2010', '4', null, '4', '0');
INSERT INTO `website` VALUES ('23', '会搜', 'huisou.com', '提供对互联网资讯、资源的检索服务。', null, '杭州会搜科技有限公司', '2010', null, null, '4', '0');
INSERT INTO `website` VALUES ('24', '云云', 'yunyun.com', '提供对互联网资讯、资源的检索服务。', null, '云云（北京）信息技术有限公司', '2012', '12', '18', '4', '0');
INSERT INTO `website` VALUES ('25', '一搜视频', 'yisou.com', '提供对在线视频的检索服务。', null, '杭州阿里科技有限公司', '2011', '5', '21', '4', '0');
INSERT INTO `website` VALUES ('26', 'FindIcons', 'findicons.com', '提供对图标的检索服务。', '', '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('27', '一淘', 'etao.com', '提供对网上购物信息的检索服务。', null, '浙江淘宝网络有限公司', '2010', '10', '9', '4', '0');
INSERT INTO `website` VALUES ('28', '新浪网', 'sina.com.cn', '', null, '北京新浪互联信息服务有限公司', '1998', '12', null, '1', '0');
INSERT INTO `website` VALUES ('29', '网易', '163.com', '', null, '广州网易计算机系统有限公司', '1997', '6', null, '1', '0');
INSERT INTO `website` VALUES ('30', '搜狐', 'sohu.com', '', null, '北京搜狐互联网信息服务有限公司', '1998', '2', null, '1', '0');
INSERT INTO `website` VALUES ('31', '凤凰网', 'ifeng.com', '', '', '北京天盈九州网络技术有限公司', '1998', '6', null, '1', '0');
INSERT INTO `website` VALUES ('32', '腾讯网', 'qq.com', '', null, '深圳市腾讯计算机系统有限公司', '1998', '11', null, '1', '0');
INSERT INTO `website` VALUES ('33', 'TOM', 'tom.com', '', null, '北京雷霆万钧网络科技有限责任公司', '2000', null, null, '1', '0');
INSERT INTO `website` VALUES ('34', '环球网', 'huanqiu.com', '', null, '环球时报在线（北京）文化传播有限公司', '2007', '11', null, '1', '0');
INSERT INTO `website` VALUES ('35', '大旗网', 'daqi.com', '', null, '北京旗云互动广告有限公司', '2004', '11', null, '1', '0');
INSERT INTO `website` VALUES ('36', '人民网', 'people.com.cn', '', null, '人民网股份有限公司', '1997', '1', '1', '1', '0');
INSERT INTO `website` VALUES ('37', '央视网', 'cntv.cn', '', null, '央视国际网络有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('38', '中华网', 'china.com', '', null, '北京华网汇通技术服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('39', '国际在线', 'gb.cri.cn', '', '', '中国国际广播电台', '1998', '12', '26', '1', '0');
INSERT INTO `website` VALUES ('40', '21CN', '21cn.com', '', null, '世纪龙信息网络有限责任公司', '1999', null, null, '1', '0');
INSERT INTO `website` VALUES ('41', 'MSN中文网', 'cn.msn.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('42', '中国雅虎', 'cn.yahoo.com', '', '', '北京阿里巴巴信息技术有限公司', '1999', '9', null, '1', '0');
INSERT INTO `website` VALUES ('43', '新华网', 'xinhuanet.com', '', null, '新华网股份有限公司', '1997', '11', '7', '1', '0');
INSERT INTO `website` VALUES ('44', '中国新闻网', 'chinanews.com', '', null, '中国新闻社', '1999', '1', '1', '1', '0');
INSERT INTO `website` VALUES ('45', '百度网址大全', 'site.baidu.com', '', null, '北京百度网讯科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('46', 'hao123', 'hao123.com', '', null, '北京百度网讯科技有限公司', '1999', '5', null, '1', '0');
INSERT INTO `website` VALUES ('47', '去看看国外网站大全', 'qkankan.com', '', null, '', '2007', '10', null, '1', '0');
INSERT INTO `website` VALUES ('48', '2345网址导航', '2345.com', '', null, '上海瑞创网络科技发展有限公司', '2005', '9', null, '1', '0');
INSERT INTO `website` VALUES ('49', '265上网导航', '265.com', '', null, '', '2003', '4', null, '1', '0');
INSERT INTO `website` VALUES ('50', 'QQ导航', 'hao.qq.com', '', null, '深圳市腾讯计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('51', '360导航', 'hao.360.cn', '', null, '北京奇虎科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('52', '114啦网址导航', '114la.com', '', null, '广东雨林木风计算机科技有限公司', '2007', '7', null, '1', '0');
INSERT INTO `website` VALUES ('53', '9900台湾网站导航', '9900.com.tw', '', null, '', '2009', '10', null, '1', '0');
INSERT INTO `website` VALUES ('54', '46网址导航', '46.com', '', null, '', '2008', null, null, '1', '0');
INSERT INTO `website` VALUES ('55', 'hao1234网站导航', 'hao1234.net', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('56', '好1234网址之家', '1234h.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('57', '91网址导航', '123.91.com', '', null, '福建网龙计算机网络信息技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('58', '新浪网 新闻中心', 'news.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', '1998', '12', null, '1', '0');
INSERT INTO `website` VALUES ('59', '腾讯新闻', 'news.qq.com', '', null, '深圳市腾讯计算机系统有限公司', '1998', '11', null, '1', '0');
INSERT INTO `website` VALUES ('60', '搜狐新闻', 'news.sohu.com', '', null, '北京搜狐互联网信息服务有限公司', '1998', '2', null, '1', '0');
INSERT INTO `website` VALUES ('61', '网易新闻', 'news.163.com', '', null, '广州网易计算机系统有限公司', '1997', '6', null, '1', '0');
INSERT INTO `website` VALUES ('62', '联合早报网', 'zaobao.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('63', '联合国新闻', 'un.org/chinese/News/', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('64', '大公网', 'takungpao.com', '', null, '北京源码贸易有限公司', '1995', null, null, '1', '0');
INSERT INTO `website` VALUES ('65', '参考消息', 'cankaoxiaoxi.com', '', null, '参考消息报社', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('66', '星岛环球网', 'stnn.cc', '', null, '星岛新闻集团有限公司', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('67', '中国网', 'china.com.cn', '', null, '中国互联网新闻中心', '1997', null, null, '1', '0');
INSERT INTO `website` VALUES ('68', '光明网', 'gmw.cn', '', null, '光明网传媒有限公司', '1998', '1', '1', '1', '0');
INSERT INTO `website` VALUES ('69', '路透中文网', 'cn.reuters.com', '', null, '汤森路透集团', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('70', '俄罗斯之声', 'chinese.ruvr.ru', '', null, '', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('71', '中国日报网', 'chinadaily.com.cn', '', null, '北京英信联信息咨询公司', '1994', null, null, '1', '0');
INSERT INTO `website` VALUES ('72', '中国青年网', 'youth.cn', '', null, '中青网络科技（北京）有限公司', '1999', '5', '4', '1', '0');
INSERT INTO `website` VALUES ('73', '中国广播网', 'cnr.cn', '', null, '中央人民广播电台', '1998', '8', null, '1', '0');
INSERT INTO `website` VALUES ('74', 'SOSO新闻', 'news.soso.com', '', null, '深圳市腾讯计算机系统有限公司', '2006', '3', null, '1', '0');
INSERT INTO `website` VALUES ('75', '四月网', 'm4.cn', '', null, '四月华文（北京）文化传媒有限公司', '2008', null, null, '1', '0');
INSERT INTO `website` VALUES ('76', '金羊网', 'ycwb.com', '', null, '广东羊城晚报数字媒体有限公司', '2000', null, null, '1', '0');
INSERT INTO `website` VALUES ('77', 'TOM新闻中心', 'news.tom.com', '', null, '北京雷霆万钧网络科技有限责任公司', '2000', null, null, '1', '0');
INSERT INTO `website` VALUES ('78', '台海网', 'taihainet.com', '', null, '海峡导报社', '2006', '8', '25', '1', '0');
INSERT INTO `website` VALUES ('79', '中国雅虎资讯中心', 'news.cn.yahoo.com', '', null, '北京阿里巴巴信息技术有限公司', '1999', '9', null, '1', '0');
INSERT INTO `website` VALUES ('80', '千龙网', 'qianlong.com', '', null, '北京千龙新闻网络传播有限责任公司', '2000', '5', '25', '1', '0');
INSERT INTO `website` VALUES ('81', '中青在线', 'www.cyol.net', '', null, '北京中青报人新闻文化顾问公司', '2000', '5', '15', '1', '0');
INSERT INTO `website` VALUES ('82', '中评网', 'zhgpl.com', '', null, '北京中评时代传媒科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('83', '中国台湾网', 'www.chinataiwan.org', '', null, '九洲文化传播中心', '1999', '7', null, '1', '0');
INSERT INTO `website` VALUES ('84', '百度百科', 'baike.baidu.com', '', null, '北京百度网讯科技有限公司', '2006', '4', '20', '1', '0');
INSERT INTO `website` VALUES ('85', '维基百科', 'zh.wikipedia.org/wiki/Wikipedia:首页', '', null, '', '2001', '1', '15', '1', '0');
INSERT INTO `website` VALUES ('86', '互动百科', 'baike.com', '', null, '互动在线(北京)科技有限公司', '2005', '7', '18', '1', '0');
INSERT INTO `website` VALUES ('87', 'SOSO百科', 'baike.soso.com', '', null, '深圳市腾讯计算机系统有限公司', '2009', '3', null, '1', '0');
INSERT INTO `website` VALUES ('88', '中国百科网', 'chinabaike.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('89', '中文百科在线', 'zwbk.org', '', null, '北京四海书同文国际文化交流中心', '2010', '2', '8', '1', '0');
INSERT INTO `website` VALUES ('90', '百度知道', 'zhidao.baidu.com', '', null, '北京百度网讯科技有限公司', '2005', '6', '21', '2', '0');
INSERT INTO `website` VALUES ('91', '爱问知识人', 'iask.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('92', 'SOSO问问', 'wenwen.soso.com', '', null, '深圳市腾讯计算机系统有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('93', '360问答', 'wenda.so.com', '', null, '北京奇虎科技有限公司', '2012', '9', '22', '2', '0');
INSERT INTO `website` VALUES ('94', '雅虎知识堂', 'ks.cn.yahoo.com', '', null, '北京阿里巴巴信息技术有限公司', '2006', '1', '16', '2', '0');
INSERT INTO `website` VALUES ('95', '搜狐问答', 'wenda.sohu.com', '', null, '北京搜狐互联网信息服务有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('96', '天涯问答', 'wenda.tianya.cn', '', null, '海南天涯社区网络科技股份有限公司', '2007', '8', '20', '2', '0');
INSERT INTO `website` VALUES ('97', '果壳问答', 'guokr.com/ask/', '', null, '北京果壳互动科技传媒有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('98', '只有神知道的世界', 'shenzhidao.com', '', null, '', '2008', '6', '2', '2', '0');
INSERT INTO `website` VALUES ('99', '中华网问答', 'wenda.china.com', '', null, '北京华网汇通技术服务有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('100', '今题问答', 'wenda.jinti.com', '', null, '上海金题广告有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('101', '问你哇', 'www.weniwa.com', '', null, '', '2008', '6', '18', '2', '0');
INSERT INTO `website` VALUES ('102', '94问答网', '94ask.com', '', null, '', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('103', '百度地图', 'map.baidu.com', '', null, '北京百度网讯科技有限公司', '2005', '9', null, '4', '0');
INSERT INTO `website` VALUES ('104', 'Google地图', 'ditu.google.cn', '', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('105', '搜狗地图', 'map.sogou.com', '', null, '北京搜狗信息服务有限公司', '1999', null, null, '4', '0');
INSERT INTO `website` VALUES ('106', 'SOSO地图', 'map.soso.com', '', null, '深圳市腾讯计算机系统有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('107', '丁丁网', 'ddmap.com', '', null, '上海极索信息技术有限公司', '2005', '5', null, '4', '0');
INSERT INTO `website` VALUES ('108', '我要地图', '51ditu.com', '', null, '北京灵图软件技术有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('109', '图吧', 'mapbar.com', '', null, '北京图为先科技有限公司', '2004', null, null, '4', '0');
INSERT INTO `website` VALUES ('110', '城市吧', 'city8.com', '', null, '上海杰图软件技术有限公司', '2006', '7', '17', '4', '0');
INSERT INTO `website` VALUES ('111', '360地图', 'map.so.com', '', null, '北京奇虎科技有限公司', '2012', '11', '30', '4', '0');
INSERT INTO `website` VALUES ('112', '高德地图', 'amap.com', '', null, '高德软件有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('113', 'E都市', 'edushi.com', '', null, '杭州阿拉丁信息科技股份有限公司', '2004', '11', null, '4', '0');
INSERT INTO `website` VALUES ('114', '天地图', 'tianditu.cn/map/index.html', '', null, '', '2011', '1', '18', '4', '0');
INSERT INTO `website` VALUES ('115', '都市圈', 'o.cn', '', null, '广州都市圈网络科技有限公司', '2006', null, null, '4', '0');
INSERT INTO `website` VALUES ('116', '诺基亚地图', 'maps.nokia.com.cn', '', null, '诺基亚（中国）投资有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('117', '百度词典', 'dict.baidu.com', '', null, '北京百度网讯科技有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('118', '百度翻译', 'fanyi.baidu.com', '', null, '北京百度网讯科技有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('119', 'Google翻译', 'translate.google.cn', '', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('120', '有道词典', 'dict.youdao.com', '', null, '北京网易有道计算机系统有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('121', '有道翻译', 'fanyi.youdao.com', '', null, '北京网易有道计算机系统有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('122', '爱词霸词典', 'iciba.com', '', null, '北京金山数字娱乐科技有限公司', '2005', '11', '14', '4', '0');
INSERT INTO `website` VALUES ('123', '爱词霸翻译', 'fy.iciba.com', '', null, '北京金山数字娱乐科技有限公司', '2005', '11', '14', '4', '0');
INSERT INTO `website` VALUES ('124', '汉典', 'zdic.net', '', null, '', '2004', null, null, '4', '0');
INSERT INTO `website` VALUES ('125', '海词', 'dict.cn', '', null, '上海词海信息技术有限公司', '2003', '11', '27', '4', '0');
INSERT INTO `website` VALUES ('126', 'E度词典', 'cidian.eduu.com', '', null, '北京学而思网络科技有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('127', '在线新华词典', 'xh.5156edu.com', '', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('128', '中华在线词典', 'www.ourdict.cn', '', null, '长春市树勋小学', '2005', '5', null, '4', '0');
INSERT INTO `website` VALUES ('129', '必应词典', 'dict.bing.com.cn', '', null, '上海美斯恩网络通讯技术有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('130', '喜蜜滋成语大全', 'www.ximizi.com/Chengyu_Cidian.php', '', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('131', '喜蜜滋谚语大全', 'www.ximizi.com/YanYu_DaQuan.php', '', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('132', '喜蜜滋歇后语大全', 'www.ximizi.com/XieHouYu_YanYu.php', '', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('133', '词典网', 'www.cidianwang.com', '', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('134', 'n词酷', 'nciku.cn', '', null, '', '2007', '4', '17', '4', '0');
INSERT INTO `website` VALUES ('135', '查字典', 'www.chazidian.com', '', null, '厦门雅酷科技有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('136', '沪江小d', 'dict.hjenglish.com', '', null, '上海互加文化传播有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('137', '字典通', 'zidiantong.com', '', null, '', '2001', null, null, '4', '0');
INSERT INTO `website` VALUES ('138', '法语助手', 'frdic.com', '', null, '', '2001', null, null, '4', '0');
INSERT INTO `website` VALUES ('139', '译典通', 'dreye.com.cn', '', null, '英业达（上海）有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('140', '中国译典', 'tdict.com', '', null, '黄岩城关太阳风翻译文印社', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('141', '爱思英语词典', 'd.24en.com', '', null, '', '2009', '1', null, '4', '0');
INSERT INTO `website` VALUES ('142', 'QQ词典', 'dict.qq.com', '', null, '深圳市腾讯计算机系统有限公司', '2010', '5', '6', '4', '0');
INSERT INTO `website` VALUES ('143', '新东方学习宝典', 'tool.xdf.cn', '', null, '北京新东方教育科技(集团)有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('144', '词都', 'dictall.com', '', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('145', '一本词典', 'onedict.com', '', null, '北京语智云帆科技有限公司', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('146', '中教网成语词典', 'chengyu.teachercn.com', '', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('147', '金桥翻译', 'netat.net', '', null, '', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('148', '在线歇后语查询', 'xhy.xxkt.cn', '', null, '萧山区临浦镇第二小学', null, null, null, '4', '0');
INSERT INTO `website` VALUES ('149', '新浪博客', 'blog.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('150', '网易博客', 'blog.163.com', '', null, '广州网易计算机系统有限公司', '2006', '9', '1', '2', '0');
INSERT INTO `website` VALUES ('151', '博客中国', 'blogchina.com', '', null, '北京鼎智思维市场信息咨询有限责任公司', '2002', '8', '19', '2', '0');
INSERT INTO `website` VALUES ('152', '腾讯博客', 'blog.qq.com', '', null, '深圳市腾讯计算机系统有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('153', '搜狐博客', 'blog.sohu.com', '', null, '北京搜狐互联网信息服务有限公司', '2005', '11', '15', '2', '0');
INSERT INTO `website` VALUES ('154', '和讯博客', 'blog.hexun.com', '', null, '北京和讯在线信息咨询服务有限公司', '2004', '11', null, '2', '0');
INSERT INTO `website` VALUES ('155', '博客网', 'bokee.com', '', null, '', '2002', '8', null, '2', '0');
INSERT INTO `website` VALUES ('156', '环球博客', 'blog.huanqiu.com', '', null, '环球时报在线（北京）文化传播有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('157', '童鞋会', 'tongxiehui.net', '', null, '2010年', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('158', '央视博客', 'blog.cntv.cn', '', null, '央视国际网络有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('159', '凤凰网博报', 'blog.ifeng.com', '', null, '北京天盈九州网络技术有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('160', '天涯博客', 'www.tianya.cn/blog', '', null, '海南天涯社区网络科技股份有限公司', '2004', '1', null, '2', '0');
INSERT INTO `website` VALUES ('161', '博客大巴', 'blogbus.com', '', null, '上海信维文化传播有限公司', '2002', null, null, '2', '0');
INSERT INTO `website` VALUES ('162', '中国网专家博客', 'blog.china.com.cn', '', null, '中国互联网新闻中心', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('163', '东方博客', 'blog.eastday.com', '', null, '上海东方网股份有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('164', '雅虎香港Blog', 'blog.yahoo.com', '', null, '', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('165', '百度空间', 'hi.baidu.com', '', '', '北京百度网讯科技有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('166', '新浪微博', 'weibo.com', '', null, '北京微梦创科网络技术有限公司', '2009', '8', '14', '2', '0');
INSERT INTO `website` VALUES ('167', '腾讯微博', 't.qq.com', '', null, '深圳市腾讯计算机系统有限公司', '2010', '4', '1', '2', '0');
INSERT INTO `website` VALUES ('168', '搜狐微博', 't.sohu.com', '', null, '北京搜狐互联网信息服务有限公司', '2010', '4', '7', '2', '0');
INSERT INTO `website` VALUES ('169', '网易微博', 't.163.com', '', null, '广州网易计算机系统有限公司', '2010', '1', '20', '2', '0');
INSERT INTO `website` VALUES ('170', '凤凰网微博', 't.ifeng.com', '', null, '北京天盈九州网络技术有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('171', '人民微博', 't.people.com.cn', '', null, '人民网股份有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('172', '央视网微博', 't.cntv.cn', '', null, '央视国际网络有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('173', '和讯财经微博', 't.hexun.com', '', null, '北京和讯在线信息咨询服务有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('174', '饭否', 'fanfou.com', '', null, '深圳市中经饭否科技有限公司', '2007', '5', null, '2', '0');
INSERT INTO `website` VALUES ('175', '移动微博', 'weibo.10086.cn', '', null, '中国移动通信有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('176', '新华微博', 't.home.news.cn', '', null, '', '2011', '4', '19', '2', '0');
INSERT INTO `website` VALUES ('177', '点点网', 'diandian.com', '', null, '北京长滩科技有限公司', '2011', '4', '7', '2', '0');
INSERT INTO `website` VALUES ('178', '推他网', 'tuita.com', '', null, '', '2011', '6', null, '2', '0');
INSERT INTO `website` VALUES ('179', '网易轻博客', 'lofter.com', '', null, '广州网易计算机系统有限公司', '2011', '12', null, '2', '0');
INSERT INTO `website` VALUES ('180', '新浪轻博客', 'qing.weibo.com', '', null, '北京微梦创科网络技术有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('181', '6V', '6v.com', '', null, '深圳市乐讯科技有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('182', '西边雨', 'cibry.com', '', null, '', '2011', '4', null, '2', '0');
INSERT INTO `website` VALUES ('183', '博游吧', 'boyouba.com', '', null, '北京巨成博游科技有限责任公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('184', '喵友', 'catfan.me', '', null, '', '2010', '3', '8', '2', '0');
INSERT INTO `website` VALUES ('185', '我有料', 'woyouliao.com', '', null, '成都赢信商务服务有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('186', '人人小站', 'zhan.renren.com', '', null, '北京千橡网景科技发展有限公司', '2011', '7', '21', '2', '0');
INSERT INTO `website` VALUES ('187', '网易163邮箱', 'email.163.com', '', '', '广州网易计算机系统有限公司', '2000', '10', null, '2', '0');
INSERT INTO `website` VALUES ('188', 'TOM邮箱', 'mail.tom.com', '', null, '北京雷霆万钧网络科技有限责任公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('189', 'Gmail', 'mail.google.com', '', null, '', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('190', 'Hotmail', 'hotmail.com', '', null, '', '1996', '7', '4', '2', '0');
INSERT INTO `website` VALUES ('191', 'QQ邮箱', 'mail.qq.com', '', null, '深圳市腾讯计算机系统有限公司', '2002', null, null, '2', '0');
INSERT INTO `website` VALUES ('192', '新浪邮箱', 'mail.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('193', '网易126邮箱', '126.com', '', null, '广州网易计算机系统有限公司', '2001', '11', null, '2', '0');
INSERT INTO `website` VALUES ('194', '网易Yeah邮箱', 'yeah.net', '', null, '广州网易计算机系统有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('195', '搜狐闪电邮箱', 'mail.sohu.com', '', null, '北京搜狐互联网信息服务有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('196', '中国雅虎邮箱', 'mail.cn.yahoo.com', '', null, '北京阿里巴巴信息技术有限公司', '1996', null, null, '2', '0');
INSERT INTO `website` VALUES ('197', '和讯邮箱', 'mail.hexun.com', '', null, '北京和讯在线信息咨询服务有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('198', '21CN邮箱', 'mail.21cn.com', '', null, '世纪龙信息网络有限责任公司', '1999', '4', null, '2', '0');
INSERT INTO `website` VALUES ('199', '人人网', 'renren.com', '', null, '北京千橡网景科技发展有限公司', '1999', '5', null, '2', '0');
INSERT INTO `website` VALUES ('200', '豆瓣网', 'douban.com', '', null, '北京豆网科技有限公司', '2005', '3', '6', '2', '0');
INSERT INTO `website` VALUES ('201', '开心网', 'kaixin001.com', '', null, '北京开心人信息技术有限公司', '2008', '3', null, '2', '0');
INSERT INTO `website` VALUES ('202', 'Bangumi番组计划', 'bangumi.tv', '', null, '', '2008', null, null, '2', '0');
INSERT INTO `website` VALUES ('203', 'QQ空间', 'qzone.qq.com', '', null, '深圳市腾讯计算机系统有限公司', '2005', null, null, '2', '0');
INSERT INTO `website` VALUES ('204', '朋友网', 'pengyou.com', '', null, '深圳市腾讯计算机系统有限公司', '2009', '1', '6', '2', '0');
INSERT INTO `website` VALUES ('205', '爱哈友网', 'ihiyou.com', '', null, '杭州可乐视媒网络科技有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('206', '白社会', 'bai.sohu.com', '', null, '北京搜狐互联网信息服务有限公司', '2009', '5', null, '2', '0');
INSERT INTO `website` VALUES ('207', '51游戏社区', '51.com', '', null, '上海我要网络发展有限公司', '2005', '8', null, '2', '0');
INSERT INTO `website` VALUES ('208', '众众网', 'www.zonezone.com', '', null, '', '2012', null, null, '2', '0');
INSERT INTO `website` VALUES ('209', '易班', 'yiban.cn', '', null, '上海远程教育集团', '2007', '8', null, '2', '0');
INSERT INTO `website` VALUES ('210', '起点中文', 'qidian.com', '', null, '上海玄霆娱乐信息科技有限公司', '2003', '5', null, '1', '0');
INSERT INTO `website` VALUES ('211', '纵横中文网', 'zongheng.com', '', null, '北京幻想纵横网络技术有限公司', '2008', '9', null, '1', '0');
INSERT INTO `website` VALUES ('212', '看书网', 'kanshu.com', '', null, '成都古羌科技有限公司', '2004', null, null, '1', '0');
INSERT INTO `website` VALUES ('213', '榕树下', 'rongshuxia.com', '', null, '上海玄霆娱乐信息科技有限公司', '1997', '12', '25', '1', '0');
INSERT INTO `website` VALUES ('214', '妖屋小说网', 'www.15.net', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('215', '晋江文学城', 'jjwxc.net', '', null, '北京晋江原创网络科技有限公司', '2003', null, null, '1', '0');
INSERT INTO `website` VALUES ('216', '幻剑书盟', 'hjsm.tom.com', '', null, '北京雷霆万钧网络科技有限责任公司', '2001', '5', null, '1', '0');
INSERT INTO `website` VALUES ('217', '凤鸣轩小说网', 'fmx.cn', '', null, '成都凤鸣轩网络科技有限公司', '2000', null, null, '1', '0');
INSERT INTO `website` VALUES ('218', '3G书城', '3gsc.com.cn', '', null, '广州市久邦数码科技有限公司', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('219', '短文学网', 'duanwenxue.com', '', null, '', '2010', '9', '15', '1', '0');
INSERT INTO `website` VALUES ('220', '阿巴达小说下载网', 'abada.cn', '', null, '', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('221', '书香电子书', 'sxcnw.net', '', null, '', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('222', '小说阅读网', 'readnovel.com', '', null, '北京网文欣阅科技有限公司', '2004', '5', null, '1', '0');
INSERT INTO `website` VALUES ('223', '红袖添香小说网', 'hongxiu.com', '', null, '北京红袖添香科技发展有限公司', '1999', '8', '20', '1', '0');
INSERT INTO `website` VALUES ('224', '原文小说网', 'yuanwen.org', '', null, '', '2007', null, null, '1', '0');
INSERT INTO `website` VALUES ('225', '潇湘书院', 'xxsy.net', '', null, '', '2001', null, null, '1', '0');
INSERT INTO `website` VALUES ('226', '言情小说吧', 'xs8.cn', '', null, '北京阅言科技有限公司', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('227', '逐浪小说网', 'zhulang.com', '', null, '南京大众书网图书文化有限公司', '2003', '10', null, '1', '0');
INSERT INTO `website` VALUES ('228', '小说志', 'xiaoshuozhi.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('229', '世纪文学小说网', 'www.2100book.com', '', null, '', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('230', 'TXT小说网', 'txtbbs.com', '', null, '', '1999', null, null, '1', '0');
INSERT INTO `website` VALUES ('231', '心动言情网', 'xdyqw.com', '', null, '', '2009', '2', '1', '1', '0');
INSERT INTO `website` VALUES ('232', '红薯小说网', 'hongshu.com', '', null, '上海朗阅信息科技有限公司', '2009', '12', null, '1', '0');
INSERT INTO `website` VALUES ('233', '烟雨红尘', 'cc222.com', '', null, '', '2001', null, null, '1', '0');
INSERT INTO `website` VALUES ('234', '铁血读书', 'junshishu.com', '', null, '北京铁血科技有限责任公司', '2001', null, null, '1', '0');
INSERT INTO `website` VALUES ('235', '幻侠小说网', 'huanxia.com', '', null, '北京红袖添香科技发展有限公司', '2011', '6', null, '1', '0');
INSERT INTO `website` VALUES ('236', '飞卢小说网', 'faloo.com', '', null, '北京腾飞克科技有限公司', '2005', '5', null, '1', '0');
INSERT INTO `website` VALUES ('237', '文学屋', 'www.wenxuewu.com', '', null, '', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('238', '翠微居', 'cuiweiju.com', '', null, '', '2001', '3', '15', '1', '0');
INSERT INTO `website` VALUES ('239', '连城读书', 'lcread.com', '', null, '', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('240', '虾米音乐网', 'xiami.com', '', null, '杭州繆斯客网络科技有限公司', '2007', null, null, '1', '0');
INSERT INTO `website` VALUES ('241', '一听音乐网', '1ting.com', '', null, '北京易听信息技术有限公司', '2003', null, null, '1', '0');
INSERT INTO `website` VALUES ('242', '搜狗音乐', 'mp3.sogou.com', '', null, '北京搜狗信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('243', '百度音乐', 'music.baidu.com', '', null, '北京百度网讯科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('244', '天天动听', 'dongting.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('245', '音悦Tai', 'yinyuetai.com', '', null, '北京宽客网络技术有限公司', '2009', null, null, '1', '0');
INSERT INTO `website` VALUES ('246', 'QQ音乐', 'y.qq.com', '', null, '深圳市腾讯计算机系统有限公司', '1998', '11', null, '1', '0');
INSERT INTO `website` VALUES ('247', '酷狗音乐', 'kugou.com', '', null, '广州酷狗计算机科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('248', '酷我音乐', 'kuwo.cn', '', null, '北京酷我科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('249', '百度随心听', 'fm.baidu.com', '', null, '北京百度网讯科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('250', '豆瓣FM', 'douban.fm', '', null, '北京豆网科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('251', 'Last.fm', 'last.fm', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('252', 'SongTaste', 'songtaste.com', '', null, '北京好音味网络科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('253', '中国原创音乐基地', '5sing.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('254', '九天音乐网', '9sky.com', '', null, '上海岳盛信息技术有限公司', '1999', null, null, '1', '0');
INSERT INTO `website` VALUES ('255', '九酷音乐网', '9ku.com', '', null, '', '2001', null, null, '1', '0');
INSERT INTO `website` VALUES ('256', '优酷音乐', 'music.youku.com', '', null, '合一信息技术(北京)有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('257', 'DJ音乐厅', 'hcdj.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('258', 'DJ嗨嗨网', 'djkk.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('259', 'DJ35舞曲网', 'www.dj35.com', '', null, '', '2010', null, null, '1', '0');
INSERT INTO `website` VALUES ('260', '腾讯音乐', 'yue.qq.com', '', null, '深圳市腾讯计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('261', 'SOSO音乐', 'music.soso.com', '', null, '深圳市腾讯计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('262', '我爱歌词网', '5ilrc.com', '', null, '', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('263', '就爱歌词网', '9ilrc.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('264', '魔镜歌词网', 'mojim.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('265', '音乐翻唱', 'yyfc.iq123.com', '', null, '广州叁叁贰网络科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('266', '我久久伴奏网', 'wo99.com', '', null, '合肥天格网络科技有限公司', '2004', null, null, '1', '0');
INSERT INTO `website` VALUES ('267', '时光网', 'mtime.com', '', null, '北京动艺时光网络科技有限公司', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('268', '优酷', 'youku.com', '', null, '合一信息技术(北京)有限公司', '2006', '6', '21', '1', '0');
INSERT INTO `website` VALUES ('269', '土豆', 'tudou.com', '', null, '上海全土豆网络科技有限公司', '2005', '4', '15', '1', '0');
INSERT INTO `website` VALUES ('270', '人人影视', 'yyets.com', '', '', '', '2006', '6', '1', '1', '0');
INSERT INTO `website` VALUES ('271', '迅雷看看', 'kankan.com', '', null, '深圳市迅雷网络技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('272', '百度视频', 'video.baidu.com', '', null, '北京百度网讯科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('273', '腾讯视频', 'v.qq.com', '', null, '深圳市腾讯计算机系统有限公司', '2011', '4', null, '1', '0');
INSERT INTO `website` VALUES ('274', 'AcFun弹幕视频网', 'acfun.tv', '', null, '杭州游趣网络有限公司', '2007', '6', null, '1', '0');
INSERT INTO `website` VALUES ('275', '哔哩哔哩弹幕网', 'bilibili.tv', '', null, '杭州幻电科技有限公司', '2009', '6', '26', '1', '0');
INSERT INTO `website` VALUES ('276', '新浪视频', 'video.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', '2009', '3', null, '1', '0');
INSERT INTO `website` VALUES ('277', 'PPS网络电视', 'pps.tv', '', null, '上海众源网络有限公司', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('278', '我乐网', '56.com', '', null, '广州市千钧网络科技有限公司', '2005', '4', null, '1', '0');
INSERT INTO `website` VALUES ('279', '电影网', 'm1905.com', '', null, '', '2004', null, null, '1', '0');
INSERT INTO `website` VALUES ('280', '电影评论库', 'movku.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('281', 'MioMio弹幕网', 'miomio.tv', '', null, '', '2012', '9', '25', '1', '0');
INSERT INTO `website` VALUES ('282', 'UIUI弹幕网', 'uiui.tv', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('283', '吐槽网', 'tucao.cc', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('284', '爱奇艺', 'iqiyi.com', '', null, '北京爱奇艺科技有限公司', '2010', '4', '22', '1', '0');
INSERT INTO `website` VALUES ('285', '3E帝国', '3e-online.com', '', null, '', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('286', '乐视网', 'letv.com', '', null, '乐视网信息技术(北京)股份有限公司', '2004', '11', null, '1', '0');
INSERT INTO `website` VALUES ('287', '360影视', 'v.360.cn', '', null, '北京奇虎科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('288', '破烂熊乐园', 'www.ragbear.com', '', null, '', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('289', '天天美剧', 'ttmeiju.com', '', null, '', '2011', null, null, '1', '0');
INSERT INTO `website` VALUES ('290', '影评网', 'yingpingwang.com', '', null, '', '2008', null, null, '1', '0');
INSERT INTO `website` VALUES ('291', '风行网', 'funshion.com', '', null, '北京风行在线技术有限公司', '2005', '9', null, '1', '0');
INSERT INTO `website` VALUES ('292', '酷6网', 'ku6.com', '', null, '酷溜网（北京）信息技术有限公司', '2006', '7', null, '1', '0');
INSERT INTO `website` VALUES ('293', '搜狐视频', 'tv.sohu.com', '', null, '北京搜狐互联网信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('294', 'IMDb中文网', 'imdb.cn', '', null, '上海多拉爱梦电子商务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('295', '芒果TV', 'imgo.tv', '', null, '湖南快乐阳光互动娱乐传媒有限公司', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('296', '第一视频', 'v1.cn', '', null, '', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('297', '偶偶网', 'ouou.com', '', null, '北京偶偶网络科技有限公司', '2006', '7', null, '1', '0');
INSERT INTO `website` VALUES ('298', '站酷网', 'zcool.com.cn', '', null, '北京站酷网络科技有限公司', '2006', '8', null, '1', '0');
INSERT INTO `website` VALUES ('299', '桌面城市', 'deskcity.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('300', '中国设计网', 'cndesign.com', '', null, '', '1998', null, null, '1', '0');
INSERT INTO `website` VALUES ('301', '中国平面设计圈', '100365.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('302', '设友公社', 'uuuu.cc', '', null, '深圳市麦肯星河网络科技有限公司', '2004', '12', null, '1', '0');
INSERT INTO `website` VALUES ('303', 'NOWNESS', 'nowness.com', '', null, '', '2010', null, null, '1', '0');
INSERT INTO `website` VALUES ('304', '视觉同盟', 'visionunion.com', '', null, '北京先锋视觉文化发展有限公司', '2004', null, null, '1', '0');
INSERT INTO `website` VALUES ('305', '插画中国', 'www.chahua.org', '', null, '', '2003', null, null, '1', '0');
INSERT INTO `website` VALUES ('306', '中国艺术设计联盟', 'arting365.com', '', null, '广策文化传播有限公司', '2001', null, null, '1', '0');
INSERT INTO `website` VALUES ('307', '中国包装设计网', 'chndesign.com', '', null, '上海包联策划设计有限公司', '2000', null, null, '1', '0');
INSERT INTO `website` VALUES ('308', '优艾网', 'chinaui.com', '', null, '北京优艾互动科技有限公司', '2004', '11', null, '1', '0');
INSERT INTO `website` VALUES ('309', '设计青年', 'design521.com', '', null, '', '2007', '11', null, '1', '0');
INSERT INTO `website` VALUES ('310', '中国创意之都', 'www.cndu.cn', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('311', '图标粉丝网', 'iconfans.org', '', null, '', '2007', '7', null, '1', '0');
INSERT INTO `website` VALUES ('312', 'CG酒吧', 'www.cg98.cn', '', null, '', '2001', null, null, '1', '0');
INSERT INTO `website` VALUES ('313', '设计之家', 'sj33.cn', '', null, '', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('314', '蓝色理想', 'blueidea.com', '', null, '', '1999', '10', null, '1', '0');
INSERT INTO `website` VALUES ('315', '火星网', 'hxsd.com', '', null, '北京火星时代网络技术有限公司', '2001', null, null, '1', '0');
INSERT INTO `website` VALUES ('316', '翼虎网', 'yiihuu.com', '', null, '广州冠岳网络科技有限公司', '2011', null, null, '1', '0');
INSERT INTO `website` VALUES ('317', '游艺网', 'www.game798.com', '', '', '', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('318', 'Billwang工业设计网', 'billwang.net', '', null, '深圳市博望联动科技有限公司', '2000', '9', null, '1', '0');
INSERT INTO `website` VALUES ('319', '设计·中国', 'design.cn', '', null, '', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('320', '创意在线', '52design.com', '', null, '', '2001', null, null, '1', '0');
INSERT INTO `website` VALUES ('321', '网页设计师联盟', '68design.net', '', null, '合肥江洋网络科技有限公司', '2003', null, null, '1', '0');
INSERT INTO `website` VALUES ('322', '3D模型网', 'cguse.com', '', null, '', '2002', null, null, '1', '0');
INSERT INTO `website` VALUES ('323', '枫雪动漫', 'fxdm.net', '', null, '福建枫雪传媒有限公司', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('324', '有妖气原创漫画梦工厂', 'u17.com', '', null, '北京四月星空网络技术有限公司', '2006', '4', '15', '1', '0');
INSERT INTO `website` VALUES ('325', '漫游酷论坛', 'bbs.popgo.org/bbs', '', null, '', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('326', '动漫花园资源网', 'share.dmhy.org', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('327', '极影动漫', 'bt.ktxp.com', '', null, '', '2003', null, null, '1', '0');
INSERT INTO `website` VALUES ('328', '圣地昆仑', 'bbs.iiikl.net', '', null, '', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('329', '恶魔岛动漫世界', 'emland.net', '', null, '上海光尘信息科技有限公司', '2005', '10', null, '1', '0');
INSERT INTO `website` VALUES ('330', '腾讯动漫', 'comic.qq.com', '', null, '深圳市腾讯计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('331', '漫友网', 'comicfans.net', '', null, '广州漫友文化科技发展有限公司', '2002', null, null, '1', '0');
INSERT INTO `website` VALUES ('332', '轻之国度', 'lightnovel.cn', '', null, '', '2007', '2', '27', '2', '0');
INSERT INTO `website` VALUES ('333', '漫画大风堂', 'www.acwind.net', '', null, '', '2000', null, null, '1', '0');
INSERT INTO `website` VALUES ('334', '笨狗漫画网', 'bengou.com', '', null, '', '2009', null, null, '1', '0');
INSERT INTO `website` VALUES ('335', '动漫456', 'dm456.com', '', null, '', '2007', null, null, '1', '0');
INSERT INTO `website` VALUES ('336', 'SOSG动漫网', 'sosg.net', '', null, '', '2006', '5', '26', '2', '0');
INSERT INTO `website` VALUES ('337', '梦域动漫网', 'moejam.com', '', null, '', '2008', null, null, '1', '0');
INSERT INTO `website` VALUES ('338', '喵星球', 'catfun.tv', '', null, '', '2012', '7', '1', '1', '0');
INSERT INTO `website` VALUES ('339', '07073动漫频道', 'acg.07073.com', '', null, '沈阳芝麻开门科技有限公司', '2002', null, null, '1', '0');
INSERT INTO `website` VALUES ('340', 'ZERO动漫网', 'zerodm.cn', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('341', '漫客网', 'zymk.cn', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('342', '中国动漫网', 'comic.gov.cn', '', null, '温州市动画漫画协会', '2000', '3', null, '1', '0');
INSERT INTO `website` VALUES ('343', 'i尚漫', 'ishangman.com', '', null, '邮电出版有限责任公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('344', '漫奇网', 'comicqi.com', '', null, '', '2012', '10', null, '1', '0');
INSERT INTO `website` VALUES ('345', '风之动漫', 'fzdm.com', '', null, '', '2003', null, null, '1', '0');
INSERT INTO `website` VALUES ('346', 'MissEvan', 'missevan.cn', '', null, '', '2010', '6', null, '2', '0');
INSERT INTO `website` VALUES ('347', 'COMICV动漫频道', 'www.comicv.com', '', null, '', '2004', null, null, '1', '0');
INSERT INTO `website` VALUES ('348', '炫动卡通', 'toonmax.com', '', null, '上海炫动传播股份有限公司', '2004', null, null, '1', '0');
INSERT INTO `website` VALUES ('349', '爱漫画', 'imanhua.com', '', null, '', '2007', null, null, '1', '0');
INSERT INTO `website` VALUES ('350', '基德漫画网', 'jide123.com', '', null, '', '2011', null, null, '1', '0');
INSERT INTO `website` VALUES ('351', '酷米网', 'kumi.cn', '', null, '北京天天宽广网络科技有限公司', '2010', null, null, '1', '0');
INSERT INTO `website` VALUES ('352', '恶魔动漫网', 'emodm.com', '', null, '', '2011', null, null, '1', '0');
INSERT INTO `website` VALUES ('353', '中国动漫产业网', 'cccnews.com.cn', '', null, '甘肃蓝海科翔网络科技有限公司', '2011', null, null, '1', '0');
INSERT INTO `website` VALUES ('354', '新浪动漫', 'comic.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('355', '一起动漫网', '17dm.com', '', null, '', '2009', null, null, '1', '0');
INSERT INTO `website` VALUES ('356', '游侠网', 'ali213.net', '', null, '杭州凤侠网络科技有限公司', '1999', null, null, '1', '0');
INSERT INTO `website` VALUES ('357', '太平洋游戏网', 'pcgames.com.cn', '', null, '广东太平洋互联网信息服务有限公司', '2003', '12', null, '1', '0');
INSERT INTO `website` VALUES ('358', '游民星空', 'gamersky.com', '', null, '', '2003', null, null, '1', '0');
INSERT INTO `website` VALUES ('359', '17173', '17173.com', '', null, '北京搜狐互联网信息服务有限公司', '2001', '3', null, '1', '0');
INSERT INTO `website` VALUES ('360', '巴哈姆特电玩资讯站', 'www.gamer.com.tw', '', null, '', '1996', '11', '10', '1', '0');
INSERT INTO `website` VALUES ('361', '游久网', 'uuu9.com', '', null, '陕西游久数码科技有限公司', '2004', null, null, '1', '0');
INSERT INTO `website` VALUES ('362', '多玩游戏网', 'duowan.com', '', null, '广州华多网络科技有限公司', '2005', '4', null, '1', '0');
INSERT INTO `website` VALUES ('363', '新浪游戏', 'games.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('364', '网易游戏', 'game.163.com', '', null, '广州网易计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('365', '腾讯游戏', 'game.qq.com', '', null, '深圳市腾讯计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('366', '搜狐游戏', 'games.sohu.com', '', null, '北京搜狐互联网信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('367', '3DM游戏网', '3dmgame.com', '', null, '', '2001', null, null, '1', '0');
INSERT INTO `website` VALUES ('368', '电玩巴士', 'tgbus.com', '', null, '北京辉天盛世科技有限公司', '2004', '9', null, '1', '0');
INSERT INTO `website` VALUES ('369', '锐派游戏', 'replays.net', '', null, '北京迈动体育文化传播有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('370', '艾泽拉斯国家地理论坛', 'bbs.ngacn.cc', '', null, '', '2002', '5', null, '2', '0');
INSERT INTO `website` VALUES ('371', '澄空学园', 'bbs.sumisora.org', '', null, '', '2003', null, null, '2', '0');
INSERT INTO `website` VALUES ('372', '游戏风云', 'gamefy.cn', '', null, '上海文广互动电视有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('373', 'PLU', 'plu.cn', '', null, '苏州游视网络科技有限公司', '2000', null, null, '1', '0');
INSERT INTO `website` VALUES ('374', 'NEOTV', 'neotv.cn', '', null, '上海网映文化传播有限公司', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('375', '178游戏网', '178.com', '', null, '北京智珠网络技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('376', '游戏基地', 'gamespot.com.cn', '', null, '北京智德典康电子商务有限公司', '2000', '11', '16', '1', '0');
INSERT INTO `website` VALUES ('377', '中关村游戏网', 'game.zol.com.cn', '', null, '北京智德典康电子商务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('378', '猫扑游戏中心', 'game.mop.com', '', null, '北京千橡互联科技发展有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('379', '口袋巴士', 'ptbus.com', '', null, '北京辉天盛世科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('380', '超级玩家', 'sgamer.com', '', null, '武汉超玩在线科技有限公司', '2000', '7', null, '1', '0');
INSERT INTO `website` VALUES ('381', '52PK游戏网', '52pk.com', '', null, '重庆天极网络有限公司', '2002', null, null, '1', '0');
INSERT INTO `website` VALUES ('382', '游戏中国', 'game.com.cn', '', null, '上海势必游网络科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('383', '游讯网', 'yxdown.com', '', null, '', '2004', '3', null, '1', '0');
INSERT INTO `website` VALUES ('384', '玩家网', 'cngba.com', '', null, '广州史达泊雷网络科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('385', '兔友网', '2u.com.cn', '', null, '', '2007', '6', null, '1', '0');
INSERT INTO `website` VALUES ('386', '骄阳网', 'joyyang.com', '', null, '上海盛久网络科技发展有限公司', '2002', null, null, '1', '0');
INSERT INTO `website` VALUES ('387', '逗游网', 'doyo.cn', '', null, '北京逗游网络技术有限公司', '2010', null, null, '1', '0');
INSERT INTO `website` VALUES ('388', '虎扑体育网', 'hupu.com', '', null, '上海雷傲普文化传播有限公司', '2004', '1', null, '1', '0');
INSERT INTO `website` VALUES ('389', '新浪竞技风暴', 'sports.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('390', '腾讯体育', 'sports.qq.com', '', null, '深圳市腾讯计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('391', '网易体育', 'sports.163.com', '', null, '广州网易计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('392', '搜狐体育', 'sports.sohu.com', '', null, '北京搜狐互联网信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('393', '雅虎体育', 'sports.cn.yahoo.com', '', null, '北京阿里巴巴信息技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('394', '中国网络电视台体育台', 'sports.cntv.cn', '', null, '央视国际网络有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('395', '体坛网', 'titan24.com', '', null, '体坛传媒集团股份有限公司', '2008', '5', '1', '1', '0');
INSERT INTO `website` VALUES ('396', '7M体育', '7m.cn', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('397', '凤凰体育', 'sports.ifeng.com', '', null, '北京天盈九州网络技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('398', 'PPTV体育', 'sports.pptv.com', '', null, '上海聚力传媒技术有限公司', '2007', null, null, '1', '0');
INSERT INTO `website` VALUES ('399', '直播吧', 'zhibo8.cc', '', null, '', '2007', '3', '1', '1', '0');
INSERT INTO `website` VALUES ('400', '体育画报', 'sports.hexun.com', '', null, '北京和讯在线信息咨询服务有限公司', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('401', '优酷体育频道', 'sports.youku.com', '', null, '合一信息技术(北京)有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('402', 'ESPNSTAR中文网', 'www.espnstar.com.cn', '', null, '北京五洲纵横体育事业发展有限公司', '1998', null, null, '1', '0');
INSERT INTO `website` VALUES ('403', 'TOM体育', 'sports.tom.com', '', null, '北京雷霆万钧网络科技有限责任公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('404', '第一视频体育频道', 'sports.v1.cn', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('405', '体育吧', 'tiyuba.net', '', null, '', '2008', null, null, '1', '0');
INSERT INTO `website` VALUES ('406', '光明网体育频道', 'sports.gmw.cn', '', null, '光明网传媒有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('407', '中奢网体育频道', 'sports.chinaluxus.com', '', null, '广州市中奢网络科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('408', '新浪娱乐', 'ent.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('409', '腾讯娱乐', 'ent.qq.com', '', null, '深圳市腾讯计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('410', '明星网', 'mingxing.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('411', '搜狐娱乐', 'yule.sohu.com', '', null, '北京搜狐互联网信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('412', '环球网娱乐', 'ent.huanqiu.com', '', null, '环球时报在线（北京）文化传播有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('413', '网易娱乐', 'ent.163.com', '', null, '广州网易计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('414', '67中国娱乐网', '67.com', '', null, '北京星尚悦众传媒科技有限公司', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('415', '星明网', 'xmwww.com', '', null, '厦门万购网络科技有限公司', '2006', null, null, '1', '0');
INSERT INTO `website` VALUES ('416', '猫扑猫仔队', 'mz.mop.com', '', null, '北京千橡互联科技发展有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('417', '雅虎娱乐', 'ent.cn.yahoo.com', '', null, '北京阿里巴巴信息技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('418', '凤凰网娱乐', 'ent.ifeng.com', '', null, '北京天盈九州网络技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('419', '21CN娱乐', 'et.21cn.com', '', null, '世纪龙信息网络有限责任公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('420', '优酷娱乐', 'ent.youku.com', '', null, '合一信息技术(北京)有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('421', '爱奇艺娱乐频道', 'yule.iqiyi.com', '', null, '北京爱奇艺科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('422', '新华娱乐', 'xinhuanet.com/ent', '', null, '新华网股份有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('423', '大旗娱乐', 'ent.daqi.com', '', null, '北京旗云互动广告有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('424', '花边星闻', 'www.huabian.com', '', null, '', '2012', '6', null, '1', '0');
INSERT INTO `website` VALUES ('425', '中国网娱乐频道', 'ent.china.com.cn', '', null, '中国互联网新闻中心', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('426', '深圳热线娱乐八卦频道', 'ent.szonline.net', '', null, '深圳城市在线网络技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('427', '商都网娱乐频道', 'ent.shangdu.com', '', null, '中国网通(集团)有限公司郑州市分公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('428', '女人世界娱乐频道', 'ent.4738.com', '', null, '南宁四月网络科技有限责任公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('429', '7706娱乐网', 'www.7706.com', '', null, '', '2009', null, null, '1', '0');
INSERT INTO `website` VALUES ('430', '千龙娱乐', 'ent.qianlong.com', '', null, '北京千龙新闻网络传播有限责任公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('431', '明星写真馆', 'n63.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('432', '果壳网', 'guokr.com', '', null, '北京果壳互动科技传媒有限公司', '2010', null, null, '1', '0');
INSERT INTO `website` VALUES ('433', '科学松鼠会', 'songshuhui.net', '', null, '', '2008', '4', null, '1', '0');
INSERT INTO `website` VALUES ('434', '科技讯', 'kejixun.com', '', '', '', '2010', '3', null, '1', '0');
INSERT INTO `website` VALUES ('435', '最科技', 'zuitech.com', '', '', '', '2011', '12', '31', '1', '0');
INSERT INTO `website` VALUES ('436', 'Engadget中国版', 'cn.engadget.com', '', '', '', '2004', null, null, '1', '0');
INSERT INTO `website` VALUES ('437', '科技在线', 'zgkjzx.com', '', null, '启迪科创(北京)科技发展有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('438', '科技中国', 'techcn.com.cn', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('439', '雅虎科技', 'tech.cn.yahoo.com', '', '', '北京阿里巴巴信息技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('440', '科学网', 'sciencenet.cn', '', null, '科学时报社', '2007', '1', '18', '1', '0');
INSERT INTO `website` VALUES ('441', '饭饭科技网', '1000cms.cn', '', '', '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('442', '中国科技网', 'stdaily.com', '', null, '科技日报社', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('443', '新浪科技', 'tech.sina.com.cn', '', '', '北京新浪互联信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('444', '网易科技', 'tech.163.com', '', '', '广州网易计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('445', '腾讯科技', 'tech.qq.com', '', '', '深圳市腾讯计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('446', '凤凰网科技', 'tech.ifeng.com', '', '', '北京天盈九州网络技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('447', '优酷科技', 'tech.youku.com', '', '', '合一信息技术(北京)有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('448', '和讯科技', 'tech.hexun.com', '', '', '北京和讯在线信息咨询服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('449', 'MSN中国科技频道', 'it.msn.com.cn', '', '', '上海美斯恩网络通讯技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('450', '千龙科技', 'tech.qianlong.com', '', '', '北京千龙新闻网络传播有限责任公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('451', '世界科技报道', 'tech.icxo.com', '', null, '世界经理人资讯有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('452', '皆喜网', 'jiexi.com', '', null, '北京千橡网景科技发展有限公司', '2012', '7', null, '3', '0');
INSERT INTO `website` VALUES ('453', '新娘网', 'brides.com.cn', '', null, '北京《新娘》杂志社有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('454', '世纪佳缘', 'jiayuan.com', '', null, '上海花千树信息科技有限公司', '2003', '10', '8', '2', '0');
INSERT INTO `website` VALUES ('455', '百合网', 'baihe.com', '', null, '北京百合在线科技有限公司', '2005', '5', null, '2', '0');
INSERT INTO `website` VALUES ('456', '珍爱网', 'zhenai.com', '', null, '深圳市珍爱网信息技术有限公司', '1998', '5', null, '2', '0');
INSERT INTO `website` VALUES ('457', '钻石佳人网', 'zsjr.com', '', null, '武汉人和佳缘婚恋服务有限公司', '1998', null, null, '2', '0');
INSERT INTO `website` VALUES ('458', '丁丁结婚网', 'marry.ddmap.com', '', null, '上海极索信息技术有限公司', '2009', '12', null, '3', '0');
INSERT INTO `website` VALUES ('459', '中国结婚网', 'chinajiehun.com', '', null, '北京国藏盛世文化有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('460', '圈豆交友', 'quandou.cn', '', null, '', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('461', '赶集婚恋交友', 'love.ganji.com', '', null, '山景科创网络技术(北京)有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('462', '淘男网', '51taonan.com', '', null, '成都永盟软件发展有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('463', '嫁我网', 'marry5.com', '', null, '广州市盈海文化传有限公司', '2005', '10', null, '2', '0');
INSERT INTO `website` VALUES ('464', '聚缘网', 'juyuan.com', '', null, '陕西聚缘网络有限责任公司', '2008', '3', null, '2', '0');
INSERT INTO `website` VALUES ('465', '到喜啦婚宴网', 'daoxila.com', '', null, '上海到喜啦信息技术有限公司', '2010', '7', null, '3', '0');
INSERT INTO `website` VALUES ('466', '幸福婚嫁网', 'xfwed.com', '', null, '', '2007', '4', null, '3', '0');
INSERT INTO `website` VALUES ('467', '天天宠物网', 'ttpet.com', '', null, '上海灿通文化传播有限公司', '2004', '9', '20', '1', '0');
INSERT INTO `website` VALUES ('468', '宠物中国', 'chinapet.com', '', null, '北京五千年科技有限公司', '2003', '5', null, '2', '0');
INSERT INTO `website` VALUES ('469', '新浪宠物', 'pet.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('470', '宠物之家', 'mypethome.com', '', null, '北京联科创新技术有限公司', '1999', '10', null, '2', '0');
INSERT INTO `website` VALUES ('471', '中国宠物网', 'chinapet.net', '', null, '北京怡君爱宠信息技术有限公司', '1999', '10', null, '1', '0');
INSERT INTO `website` VALUES ('472', '太平洋女性网时尚宠物频道', 'pet.pclady.com.cn', '', null, '广东太平洋互联网信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('473', '猛犬俱乐部', 'bandog.cn', '', null, '', '2006', '1', '6', '2', '0');
INSERT INTO `website` VALUES ('474', '猫咪有约', 'movshow.com', '', null, '北京五千年科技有限公司', null, null, null, '2', '0');
INSERT INTO `website` VALUES ('475', '狗民网', 'goumin.com', '', null, '北京世纪良友科技有限公司', '2006', '9', '1', '1', '0');
INSERT INTO `website` VALUES ('476', '名犬网', 'cndog.net', '', null, '河南省特种动物养殖协会', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('477', '淘狗网', 'dog126.com', '', null, '北京派多格宠物用品有限公司', '2005', '2', null, '3', '0');
INSERT INTO `website` VALUES ('478', '藏獒在线', 'aiao.cn', '', null, '北京奥雷投资信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('479', '狗铺子', 'goupuzi.com', '', null, '', '2009', '5', '1', '3', '0');
INSERT INTO `website` VALUES ('480', '灵龟之家', 'bbs.reptilesworld.com', '', null, '', '2001', null, null, '2', '0');
INSERT INTO `website` VALUES ('481', '龟友之家', 'cngui.com', '', null, '', '2005', null, null, '2', '0');
INSERT INTO `website` VALUES ('482', '网易公开课', 'open.163.com', '', null, '广州网易计算机系统有限公司', '2010', '11', '1', '1', '0');
INSERT INTO `website` VALUES ('483', '新浪公开课', 'open.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('484', '中国教育在线', 'eol.cn', '', null, '赛尔互联（北京）教育科技有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('485', '新浪教育', 'edu.sina.com.cn', '', null, '北京新浪互联信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('486', '腾讯教育', 'edu.qq.com', '', null, '深圳市腾讯计算机系统有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('487', '凤凰网教育', 'edu.ifeng.com', '', null, '北京天盈九州网络技术有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('488', '多贝网', 'duobei.com', '', null, '北京醍醐兄弟科技发展有限公司', '2011', null, null, '1', '0');
INSERT INTO `website` VALUES ('489', '中国公开课', 'opencla.cntv.cn', '', null, '央视国际网络有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('490', '爱课程', 'www.icourses.edu.cn', '', null, '高等教育出版社', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('491', '第二教育网', 'dearedu.com', '', null, '北京盛世慧才教育科技有限公司', '2002', null, null, '1', '0');
INSERT INTO `website` VALUES ('492', '太平洋电脑网', 'pconline.com.cn', '', null, '广东太平洋互联网信息服务有限公司', '2009', null, null, '1', '0');
INSERT INTO `website` VALUES ('493', '天极网', 'yesky.com', '', null, '重庆天极网络有限公司', '1997', '2', null, '1', '0');
INSERT INTO `website` VALUES ('494', '中关村在线', 'zol.com.cn', '', null, '北京智德典康电子商务有限公司', '1999', '3', null, '1', '0');
INSERT INTO `website` VALUES ('495', 'CSDN', 'csdn.net', '', null, '北京创新乐知信息技术有限公司', '1999', '12', null, '1', '0');
INSERT INTO `website` VALUES ('496', '硅谷动力', 'enet.com.cn', '', null, '北京硅谷动力电子商务有限公司', '1999', '6', null, '1', '0');
INSERT INTO `website` VALUES ('497', 'IT世界网', 'it.com.cn', '', null, '广州颐高信息科技集团有限公司', '2005', null, null, '1', '0');
INSERT INTO `website` VALUES ('498', 'IT之家', 'ithome.com', '', null, '青岛软媒网络科技有限公司', '2011', '5', '27', '1', '0');
INSERT INTO `website` VALUES ('499', 'IT168', 'it168.com', '', null, '北京皓辰网域网络信息技术有限公司', '1999', null, null, '1', '0');
INSERT INTO `website` VALUES ('500', '比特网', 'chinabyte.com', '', null, '重庆天极网络有限公司', '1997', null, null, '1', '0');
INSERT INTO `website` VALUES ('501', 'TOM IT频道', 'it.tom.com', '', null, '北京雷霆万钧网络科技有限责任公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('502', 'IT人网', 'itren.cn', '', null, '合肥创展信息技术有限公司', '2004', null, null, '1', '0');
INSERT INTO `website` VALUES ('503', 'DoNews', 'donews.com', '', null, '北京千橡互联科技发展有限公司', '2000', '4', null, '1', '0');
INSERT INTO `website` VALUES ('504', 'IT专家网', 'ctocio.com.cn', '', null, '重庆天极网络有限公司', '2009', '11', null, '1', '0');
INSERT INTO `website` VALUES ('505', '奥博IT资讯', 'ooppoo.com', '', null, '', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('506', '搜狐IT', 'it.sohu.com', '', null, '北京搜狐互联网信息服务有限公司', null, null, null, '1', '0');
INSERT INTO `website` VALUES ('507', '阿里云', 'http://www.aliyun.com/', '阿里巴巴旗下云服务提供商', '', '阿里巴巴集团', '2003', '7', '10', '4', '0');
INSERT INTO `website` VALUES ('508', '马克飞象', 'maxiang.info', '阿里巴巴旗下云服务提供商', '', '', '2003', '7', '10', '4', '0');
INSERT INTO `website` VALUES ('509', '微博开放平台', 'open.weibo.com', '', '', '', '2000', '3', '7', '4', '0');
INSERT INTO `website` VALUES ('511', '上海师范大学', 'www.shnu.edu.cn', '', '', '', '1997', '5', '3', '1', '0');

-- ----------------------------
-- Table structure for website_attr
-- ----------------------------
DROP TABLE IF EXISTS `website_attr`;
CREATE TABLE `website_attr` (
  `websiteId` int(10) unsigned NOT NULL,
  `attrId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`websiteId`,`attrId`),
  KEY `index_attrId` (`attrId`) USING BTREE,
  CONSTRAINT `website_attr_ibfk_1` FOREIGN KEY (`attrId`) REFERENCES `attr` (`attrId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_attr_ibfk_2` FOREIGN KEY (`websiteId`) REFERENCES `website` (`websiteId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website_attr
-- ----------------------------
INSERT INTO `website_attr` VALUES ('2', '1');
INSERT INTO `website_attr` VALUES ('3', '1');
INSERT INTO `website_attr` VALUES ('4', '1');
INSERT INTO `website_attr` VALUES ('5', '1');
INSERT INTO `website_attr` VALUES ('6', '1');
INSERT INTO `website_attr` VALUES ('7', '1');
INSERT INTO `website_attr` VALUES ('8', '1');
INSERT INTO `website_attr` VALUES ('9', '1');
INSERT INTO `website_attr` VALUES ('10', '1');
INSERT INTO `website_attr` VALUES ('11', '1');
INSERT INTO `website_attr` VALUES ('12', '1');
INSERT INTO `website_attr` VALUES ('13', '1');
INSERT INTO `website_attr` VALUES ('14', '1');
INSERT INTO `website_attr` VALUES ('15', '1');
INSERT INTO `website_attr` VALUES ('16', '1');
INSERT INTO `website_attr` VALUES ('17', '1');
INSERT INTO `website_attr` VALUES ('18', '1');
INSERT INTO `website_attr` VALUES ('19', '1');
INSERT INTO `website_attr` VALUES ('20', '1');
INSERT INTO `website_attr` VALUES ('21', '1');
INSERT INTO `website_attr` VALUES ('22', '1');
INSERT INTO `website_attr` VALUES ('23', '1');
INSERT INTO `website_attr` VALUES ('24', '1');
INSERT INTO `website_attr` VALUES ('25', '1');
INSERT INTO `website_attr` VALUES ('26', '1');
INSERT INTO `website_attr` VALUES ('27', '1');
INSERT INTO `website_attr` VALUES ('31', '2');
INSERT INTO `website_attr` VALUES ('32', '2');
INSERT INTO `website_attr` VALUES ('33', '2');
INSERT INTO `website_attr` VALUES ('34', '2');
INSERT INTO `website_attr` VALUES ('35', '2');
INSERT INTO `website_attr` VALUES ('36', '2');
INSERT INTO `website_attr` VALUES ('37', '2');
INSERT INTO `website_attr` VALUES ('38', '2');
INSERT INTO `website_attr` VALUES ('40', '2');
INSERT INTO `website_attr` VALUES ('41', '2');
INSERT INTO `website_attr` VALUES ('42', '2');
INSERT INTO `website_attr` VALUES ('43', '2');
INSERT INTO `website_attr` VALUES ('44', '2');
INSERT INTO `website_attr` VALUES ('31', '3');
INSERT INTO `website_attr` VALUES ('32', '3');
INSERT INTO `website_attr` VALUES ('33', '3');
INSERT INTO `website_attr` VALUES ('34', '3');
INSERT INTO `website_attr` VALUES ('35', '3');
INSERT INTO `website_attr` VALUES ('36', '3');
INSERT INTO `website_attr` VALUES ('37', '3');
INSERT INTO `website_attr` VALUES ('38', '3');
INSERT INTO `website_attr` VALUES ('39', '3');
INSERT INTO `website_attr` VALUES ('40', '3');
INSERT INTO `website_attr` VALUES ('41', '3');
INSERT INTO `website_attr` VALUES ('42', '3');
INSERT INTO `website_attr` VALUES ('43', '3');
INSERT INTO `website_attr` VALUES ('44', '3');
INSERT INTO `website_attr` VALUES ('58', '3');
INSERT INTO `website_attr` VALUES ('59', '3');
INSERT INTO `website_attr` VALUES ('60', '3');
INSERT INTO `website_attr` VALUES ('61', '3');
INSERT INTO `website_attr` VALUES ('62', '3');
INSERT INTO `website_attr` VALUES ('63', '3');
INSERT INTO `website_attr` VALUES ('64', '3');
INSERT INTO `website_attr` VALUES ('65', '3');
INSERT INTO `website_attr` VALUES ('66', '3');
INSERT INTO `website_attr` VALUES ('67', '3');
INSERT INTO `website_attr` VALUES ('68', '3');
INSERT INTO `website_attr` VALUES ('69', '3');
INSERT INTO `website_attr` VALUES ('70', '3');
INSERT INTO `website_attr` VALUES ('71', '3');
INSERT INTO `website_attr` VALUES ('72', '3');
INSERT INTO `website_attr` VALUES ('73', '3');
INSERT INTO `website_attr` VALUES ('74', '3');
INSERT INTO `website_attr` VALUES ('75', '3');
INSERT INTO `website_attr` VALUES ('76', '3');
INSERT INTO `website_attr` VALUES ('77', '3');
INSERT INTO `website_attr` VALUES ('78', '3');
INSERT INTO `website_attr` VALUES ('79', '3');
INSERT INTO `website_attr` VALUES ('80', '3');
INSERT INTO `website_attr` VALUES ('81', '3');
INSERT INTO `website_attr` VALUES ('82', '3');
INSERT INTO `website_attr` VALUES ('83', '3');
INSERT INTO `website_attr` VALUES ('45', '4');
INSERT INTO `website_attr` VALUES ('46', '4');
INSERT INTO `website_attr` VALUES ('47', '4');
INSERT INTO `website_attr` VALUES ('48', '4');
INSERT INTO `website_attr` VALUES ('49', '4');
INSERT INTO `website_attr` VALUES ('50', '4');
INSERT INTO `website_attr` VALUES ('51', '4');
INSERT INTO `website_attr` VALUES ('52', '4');
INSERT INTO `website_attr` VALUES ('53', '4');
INSERT INTO `website_attr` VALUES ('54', '4');
INSERT INTO `website_attr` VALUES ('55', '4');
INSERT INTO `website_attr` VALUES ('56', '4');
INSERT INTO `website_attr` VALUES ('57', '4');
INSERT INTO `website_attr` VALUES ('84', '5');
INSERT INTO `website_attr` VALUES ('85', '5');
INSERT INTO `website_attr` VALUES ('86', '5');
INSERT INTO `website_attr` VALUES ('87', '5');
INSERT INTO `website_attr` VALUES ('88', '5');
INSERT INTO `website_attr` VALUES ('89', '5');
INSERT INTO `website_attr` VALUES ('90', '6');
INSERT INTO `website_attr` VALUES ('91', '6');
INSERT INTO `website_attr` VALUES ('92', '6');
INSERT INTO `website_attr` VALUES ('93', '6');
INSERT INTO `website_attr` VALUES ('94', '6');
INSERT INTO `website_attr` VALUES ('95', '6');
INSERT INTO `website_attr` VALUES ('96', '6');
INSERT INTO `website_attr` VALUES ('97', '6');
INSERT INTO `website_attr` VALUES ('98', '6');
INSERT INTO `website_attr` VALUES ('99', '6');
INSERT INTO `website_attr` VALUES ('100', '6');
INSERT INTO `website_attr` VALUES ('101', '6');
INSERT INTO `website_attr` VALUES ('102', '6');
INSERT INTO `website_attr` VALUES ('103', '7');
INSERT INTO `website_attr` VALUES ('104', '7');
INSERT INTO `website_attr` VALUES ('105', '7');
INSERT INTO `website_attr` VALUES ('106', '7');
INSERT INTO `website_attr` VALUES ('107', '7');
INSERT INTO `website_attr` VALUES ('108', '7');
INSERT INTO `website_attr` VALUES ('109', '7');
INSERT INTO `website_attr` VALUES ('110', '7');
INSERT INTO `website_attr` VALUES ('111', '7');
INSERT INTO `website_attr` VALUES ('112', '7');
INSERT INTO `website_attr` VALUES ('113', '7');
INSERT INTO `website_attr` VALUES ('114', '7');
INSERT INTO `website_attr` VALUES ('115', '7');
INSERT INTO `website_attr` VALUES ('116', '7');
INSERT INTO `website_attr` VALUES ('117', '8');
INSERT INTO `website_attr` VALUES ('118', '8');
INSERT INTO `website_attr` VALUES ('119', '8');
INSERT INTO `website_attr` VALUES ('120', '8');
INSERT INTO `website_attr` VALUES ('121', '8');
INSERT INTO `website_attr` VALUES ('122', '8');
INSERT INTO `website_attr` VALUES ('123', '8');
INSERT INTO `website_attr` VALUES ('124', '8');
INSERT INTO `website_attr` VALUES ('125', '8');
INSERT INTO `website_attr` VALUES ('126', '8');
INSERT INTO `website_attr` VALUES ('127', '8');
INSERT INTO `website_attr` VALUES ('128', '8');
INSERT INTO `website_attr` VALUES ('129', '8');
INSERT INTO `website_attr` VALUES ('130', '8');
INSERT INTO `website_attr` VALUES ('131', '8');
INSERT INTO `website_attr` VALUES ('132', '8');
INSERT INTO `website_attr` VALUES ('133', '8');
INSERT INTO `website_attr` VALUES ('134', '8');
INSERT INTO `website_attr` VALUES ('135', '8');
INSERT INTO `website_attr` VALUES ('136', '8');
INSERT INTO `website_attr` VALUES ('137', '8');
INSERT INTO `website_attr` VALUES ('138', '8');
INSERT INTO `website_attr` VALUES ('139', '8');
INSERT INTO `website_attr` VALUES ('140', '8');
INSERT INTO `website_attr` VALUES ('141', '8');
INSERT INTO `website_attr` VALUES ('142', '8');
INSERT INTO `website_attr` VALUES ('143', '8');
INSERT INTO `website_attr` VALUES ('144', '8');
INSERT INTO `website_attr` VALUES ('145', '8');
INSERT INTO `website_attr` VALUES ('146', '8');
INSERT INTO `website_attr` VALUES ('147', '8');
INSERT INTO `website_attr` VALUES ('148', '8');
INSERT INTO `website_attr` VALUES ('149', '9');
INSERT INTO `website_attr` VALUES ('150', '9');
INSERT INTO `website_attr` VALUES ('151', '9');
INSERT INTO `website_attr` VALUES ('152', '9');
INSERT INTO `website_attr` VALUES ('153', '9');
INSERT INTO `website_attr` VALUES ('154', '9');
INSERT INTO `website_attr` VALUES ('155', '9');
INSERT INTO `website_attr` VALUES ('156', '9');
INSERT INTO `website_attr` VALUES ('157', '9');
INSERT INTO `website_attr` VALUES ('158', '9');
INSERT INTO `website_attr` VALUES ('159', '9');
INSERT INTO `website_attr` VALUES ('160', '9');
INSERT INTO `website_attr` VALUES ('161', '9');
INSERT INTO `website_attr` VALUES ('162', '9');
INSERT INTO `website_attr` VALUES ('163', '9');
INSERT INTO `website_attr` VALUES ('164', '9');
INSERT INTO `website_attr` VALUES ('165', '9');
INSERT INTO `website_attr` VALUES ('166', '10');
INSERT INTO `website_attr` VALUES ('167', '10');
INSERT INTO `website_attr` VALUES ('168', '10');
INSERT INTO `website_attr` VALUES ('169', '10');
INSERT INTO `website_attr` VALUES ('170', '10');
INSERT INTO `website_attr` VALUES ('171', '10');
INSERT INTO `website_attr` VALUES ('172', '10');
INSERT INTO `website_attr` VALUES ('173', '10');
INSERT INTO `website_attr` VALUES ('174', '10');
INSERT INTO `website_attr` VALUES ('175', '10');
INSERT INTO `website_attr` VALUES ('176', '10');
INSERT INTO `website_attr` VALUES ('177', '11');
INSERT INTO `website_attr` VALUES ('178', '11');
INSERT INTO `website_attr` VALUES ('179', '11');
INSERT INTO `website_attr` VALUES ('180', '11');
INSERT INTO `website_attr` VALUES ('181', '11');
INSERT INTO `website_attr` VALUES ('182', '11');
INSERT INTO `website_attr` VALUES ('183', '11');
INSERT INTO `website_attr` VALUES ('184', '11');
INSERT INTO `website_attr` VALUES ('185', '11');
INSERT INTO `website_attr` VALUES ('186', '11');
INSERT INTO `website_attr` VALUES ('187', '12');
INSERT INTO `website_attr` VALUES ('188', '12');
INSERT INTO `website_attr` VALUES ('189', '12');
INSERT INTO `website_attr` VALUES ('190', '12');
INSERT INTO `website_attr` VALUES ('191', '12');
INSERT INTO `website_attr` VALUES ('192', '12');
INSERT INTO `website_attr` VALUES ('193', '12');
INSERT INTO `website_attr` VALUES ('194', '12');
INSERT INTO `website_attr` VALUES ('195', '12');
INSERT INTO `website_attr` VALUES ('196', '12');
INSERT INTO `website_attr` VALUES ('197', '12');
INSERT INTO `website_attr` VALUES ('198', '12');
INSERT INTO `website_attr` VALUES ('199', '13');
INSERT INTO `website_attr` VALUES ('200', '13');
INSERT INTO `website_attr` VALUES ('201', '13');
INSERT INTO `website_attr` VALUES ('202', '13');
INSERT INTO `website_attr` VALUES ('203', '13');
INSERT INTO `website_attr` VALUES ('204', '13');
INSERT INTO `website_attr` VALUES ('205', '13');
INSERT INTO `website_attr` VALUES ('206', '13');
INSERT INTO `website_attr` VALUES ('207', '13');
INSERT INTO `website_attr` VALUES ('208', '13');
INSERT INTO `website_attr` VALUES ('209', '13');
INSERT INTO `website_attr` VALUES ('200', '14');
INSERT INTO `website_attr` VALUES ('210', '14');
INSERT INTO `website_attr` VALUES ('211', '14');
INSERT INTO `website_attr` VALUES ('212', '14');
INSERT INTO `website_attr` VALUES ('213', '14');
INSERT INTO `website_attr` VALUES ('214', '14');
INSERT INTO `website_attr` VALUES ('215', '14');
INSERT INTO `website_attr` VALUES ('216', '14');
INSERT INTO `website_attr` VALUES ('217', '14');
INSERT INTO `website_attr` VALUES ('218', '14');
INSERT INTO `website_attr` VALUES ('219', '14');
INSERT INTO `website_attr` VALUES ('220', '14');
INSERT INTO `website_attr` VALUES ('221', '14');
INSERT INTO `website_attr` VALUES ('222', '14');
INSERT INTO `website_attr` VALUES ('223', '14');
INSERT INTO `website_attr` VALUES ('224', '14');
INSERT INTO `website_attr` VALUES ('225', '14');
INSERT INTO `website_attr` VALUES ('226', '14');
INSERT INTO `website_attr` VALUES ('227', '14');
INSERT INTO `website_attr` VALUES ('228', '14');
INSERT INTO `website_attr` VALUES ('229', '14');
INSERT INTO `website_attr` VALUES ('230', '14');
INSERT INTO `website_attr` VALUES ('231', '14');
INSERT INTO `website_attr` VALUES ('232', '14');
INSERT INTO `website_attr` VALUES ('233', '14');
INSERT INTO `website_attr` VALUES ('234', '14');
INSERT INTO `website_attr` VALUES ('235', '14');
INSERT INTO `website_attr` VALUES ('236', '14');
INSERT INTO `website_attr` VALUES ('237', '14');
INSERT INTO `website_attr` VALUES ('238', '14');
INSERT INTO `website_attr` VALUES ('239', '14');
INSERT INTO `website_attr` VALUES ('332', '14');
INSERT INTO `website_attr` VALUES ('200', '15');
INSERT INTO `website_attr` VALUES ('240', '15');
INSERT INTO `website_attr` VALUES ('241', '15');
INSERT INTO `website_attr` VALUES ('242', '15');
INSERT INTO `website_attr` VALUES ('243', '15');
INSERT INTO `website_attr` VALUES ('244', '15');
INSERT INTO `website_attr` VALUES ('245', '15');
INSERT INTO `website_attr` VALUES ('246', '15');
INSERT INTO `website_attr` VALUES ('247', '15');
INSERT INTO `website_attr` VALUES ('248', '15');
INSERT INTO `website_attr` VALUES ('249', '15');
INSERT INTO `website_attr` VALUES ('250', '15');
INSERT INTO `website_attr` VALUES ('251', '15');
INSERT INTO `website_attr` VALUES ('252', '15');
INSERT INTO `website_attr` VALUES ('253', '15');
INSERT INTO `website_attr` VALUES ('254', '15');
INSERT INTO `website_attr` VALUES ('255', '15');
INSERT INTO `website_attr` VALUES ('256', '15');
INSERT INTO `website_attr` VALUES ('257', '15');
INSERT INTO `website_attr` VALUES ('258', '15');
INSERT INTO `website_attr` VALUES ('259', '15');
INSERT INTO `website_attr` VALUES ('260', '15');
INSERT INTO `website_attr` VALUES ('261', '15');
INSERT INTO `website_attr` VALUES ('262', '15');
INSERT INTO `website_attr` VALUES ('263', '15');
INSERT INTO `website_attr` VALUES ('264', '15');
INSERT INTO `website_attr` VALUES ('265', '15');
INSERT INTO `website_attr` VALUES ('266', '15');
INSERT INTO `website_attr` VALUES ('200', '16');
INSERT INTO `website_attr` VALUES ('267', '16');
INSERT INTO `website_attr` VALUES ('268', '16');
INSERT INTO `website_attr` VALUES ('269', '16');
INSERT INTO `website_attr` VALUES ('270', '16');
INSERT INTO `website_attr` VALUES ('271', '16');
INSERT INTO `website_attr` VALUES ('272', '16');
INSERT INTO `website_attr` VALUES ('273', '16');
INSERT INTO `website_attr` VALUES ('274', '16');
INSERT INTO `website_attr` VALUES ('275', '16');
INSERT INTO `website_attr` VALUES ('276', '16');
INSERT INTO `website_attr` VALUES ('277', '16');
INSERT INTO `website_attr` VALUES ('278', '16');
INSERT INTO `website_attr` VALUES ('279', '16');
INSERT INTO `website_attr` VALUES ('280', '16');
INSERT INTO `website_attr` VALUES ('281', '16');
INSERT INTO `website_attr` VALUES ('282', '16');
INSERT INTO `website_attr` VALUES ('283', '16');
INSERT INTO `website_attr` VALUES ('284', '16');
INSERT INTO `website_attr` VALUES ('285', '16');
INSERT INTO `website_attr` VALUES ('286', '16');
INSERT INTO `website_attr` VALUES ('287', '16');
INSERT INTO `website_attr` VALUES ('288', '16');
INSERT INTO `website_attr` VALUES ('289', '16');
INSERT INTO `website_attr` VALUES ('290', '16');
INSERT INTO `website_attr` VALUES ('291', '16');
INSERT INTO `website_attr` VALUES ('292', '16');
INSERT INTO `website_attr` VALUES ('293', '16');
INSERT INTO `website_attr` VALUES ('294', '16');
INSERT INTO `website_attr` VALUES ('295', '16');
INSERT INTO `website_attr` VALUES ('296', '16');
INSERT INTO `website_attr` VALUES ('297', '16');
INSERT INTO `website_attr` VALUES ('338', '16');
INSERT INTO `website_attr` VALUES ('372', '16');
INSERT INTO `website_attr` VALUES ('373', '16');
INSERT INTO `website_attr` VALUES ('374', '16');
INSERT INTO `website_attr` VALUES ('394', '16');
INSERT INTO `website_attr` VALUES ('398', '16');
INSERT INTO `website_attr` VALUES ('399', '16');
INSERT INTO `website_attr` VALUES ('401', '16');
INSERT INTO `website_attr` VALUES ('404', '16');
INSERT INTO `website_attr` VALUES ('405', '16');
INSERT INTO `website_attr` VALUES ('420', '16');
INSERT INTO `website_attr` VALUES ('421', '16');
INSERT INTO `website_attr` VALUES ('447', '16');
INSERT INTO `website_attr` VALUES ('482', '16');
INSERT INTO `website_attr` VALUES ('483', '16');
INSERT INTO `website_attr` VALUES ('488', '16');
INSERT INTO `website_attr` VALUES ('489', '16');
INSERT INTO `website_attr` VALUES ('490', '16');
INSERT INTO `website_attr` VALUES ('26', '17');
INSERT INTO `website_attr` VALUES ('298', '17');
INSERT INTO `website_attr` VALUES ('299', '17');
INSERT INTO `website_attr` VALUES ('300', '17');
INSERT INTO `website_attr` VALUES ('301', '17');
INSERT INTO `website_attr` VALUES ('302', '17');
INSERT INTO `website_attr` VALUES ('303', '17');
INSERT INTO `website_attr` VALUES ('304', '17');
INSERT INTO `website_attr` VALUES ('305', '17');
INSERT INTO `website_attr` VALUES ('306', '17');
INSERT INTO `website_attr` VALUES ('307', '17');
INSERT INTO `website_attr` VALUES ('308', '17');
INSERT INTO `website_attr` VALUES ('309', '17');
INSERT INTO `website_attr` VALUES ('310', '17');
INSERT INTO `website_attr` VALUES ('311', '17');
INSERT INTO `website_attr` VALUES ('312', '17');
INSERT INTO `website_attr` VALUES ('313', '17');
INSERT INTO `website_attr` VALUES ('314', '17');
INSERT INTO `website_attr` VALUES ('315', '17');
INSERT INTO `website_attr` VALUES ('316', '17');
INSERT INTO `website_attr` VALUES ('317', '17');
INSERT INTO `website_attr` VALUES ('318', '17');
INSERT INTO `website_attr` VALUES ('319', '17');
INSERT INTO `website_attr` VALUES ('320', '17');
INSERT INTO `website_attr` VALUES ('321', '17');
INSERT INTO `website_attr` VALUES ('322', '17');
INSERT INTO `website_attr` VALUES ('202', '18');
INSERT INTO `website_attr` VALUES ('274', '18');
INSERT INTO `website_attr` VALUES ('275', '18');
INSERT INTO `website_attr` VALUES ('281', '18');
INSERT INTO `website_attr` VALUES ('282', '18');
INSERT INTO `website_attr` VALUES ('283', '18');
INSERT INTO `website_attr` VALUES ('323', '18');
INSERT INTO `website_attr` VALUES ('324', '18');
INSERT INTO `website_attr` VALUES ('325', '18');
INSERT INTO `website_attr` VALUES ('326', '18');
INSERT INTO `website_attr` VALUES ('327', '18');
INSERT INTO `website_attr` VALUES ('328', '18');
INSERT INTO `website_attr` VALUES ('329', '18');
INSERT INTO `website_attr` VALUES ('330', '18');
INSERT INTO `website_attr` VALUES ('331', '18');
INSERT INTO `website_attr` VALUES ('332', '18');
INSERT INTO `website_attr` VALUES ('333', '18');
INSERT INTO `website_attr` VALUES ('334', '18');
INSERT INTO `website_attr` VALUES ('335', '18');
INSERT INTO `website_attr` VALUES ('336', '18');
INSERT INTO `website_attr` VALUES ('337', '18');
INSERT INTO `website_attr` VALUES ('338', '18');
INSERT INTO `website_attr` VALUES ('339', '18');
INSERT INTO `website_attr` VALUES ('340', '18');
INSERT INTO `website_attr` VALUES ('341', '18');
INSERT INTO `website_attr` VALUES ('342', '18');
INSERT INTO `website_attr` VALUES ('343', '18');
INSERT INTO `website_attr` VALUES ('344', '18');
INSERT INTO `website_attr` VALUES ('345', '18');
INSERT INTO `website_attr` VALUES ('346', '18');
INSERT INTO `website_attr` VALUES ('347', '18');
INSERT INTO `website_attr` VALUES ('348', '18');
INSERT INTO `website_attr` VALUES ('349', '18');
INSERT INTO `website_attr` VALUES ('350', '18');
INSERT INTO `website_attr` VALUES ('351', '18');
INSERT INTO `website_attr` VALUES ('352', '18');
INSERT INTO `website_attr` VALUES ('353', '18');
INSERT INTO `website_attr` VALUES ('354', '18');
INSERT INTO `website_attr` VALUES ('355', '18');
INSERT INTO `website_attr` VALUES ('404', '18');
INSERT INTO `website_attr` VALUES ('405', '18');
INSERT INTO `website_attr` VALUES ('202', '19');
INSERT INTO `website_attr` VALUES ('351', '19');
INSERT INTO `website_attr` VALUES ('356', '19');
INSERT INTO `website_attr` VALUES ('357', '19');
INSERT INTO `website_attr` VALUES ('358', '19');
INSERT INTO `website_attr` VALUES ('359', '19');
INSERT INTO `website_attr` VALUES ('360', '19');
INSERT INTO `website_attr` VALUES ('361', '19');
INSERT INTO `website_attr` VALUES ('362', '19');
INSERT INTO `website_attr` VALUES ('363', '19');
INSERT INTO `website_attr` VALUES ('364', '19');
INSERT INTO `website_attr` VALUES ('365', '19');
INSERT INTO `website_attr` VALUES ('366', '19');
INSERT INTO `website_attr` VALUES ('367', '19');
INSERT INTO `website_attr` VALUES ('368', '19');
INSERT INTO `website_attr` VALUES ('369', '19');
INSERT INTO `website_attr` VALUES ('370', '19');
INSERT INTO `website_attr` VALUES ('371', '19');
INSERT INTO `website_attr` VALUES ('372', '19');
INSERT INTO `website_attr` VALUES ('373', '19');
INSERT INTO `website_attr` VALUES ('374', '19');
INSERT INTO `website_attr` VALUES ('375', '19');
INSERT INTO `website_attr` VALUES ('376', '19');
INSERT INTO `website_attr` VALUES ('377', '19');
INSERT INTO `website_attr` VALUES ('378', '19');
INSERT INTO `website_attr` VALUES ('379', '19');
INSERT INTO `website_attr` VALUES ('380', '19');
INSERT INTO `website_attr` VALUES ('381', '19');
INSERT INTO `website_attr` VALUES ('382', '19');
INSERT INTO `website_attr` VALUES ('383', '19');
INSERT INTO `website_attr` VALUES ('384', '19');
INSERT INTO `website_attr` VALUES ('385', '19');
INSERT INTO `website_attr` VALUES ('386', '19');
INSERT INTO `website_attr` VALUES ('387', '19');
INSERT INTO `website_attr` VALUES ('388', '20');
INSERT INTO `website_attr` VALUES ('389', '20');
INSERT INTO `website_attr` VALUES ('390', '20');
INSERT INTO `website_attr` VALUES ('391', '20');
INSERT INTO `website_attr` VALUES ('392', '20');
INSERT INTO `website_attr` VALUES ('393', '20');
INSERT INTO `website_attr` VALUES ('394', '20');
INSERT INTO `website_attr` VALUES ('395', '20');
INSERT INTO `website_attr` VALUES ('396', '20');
INSERT INTO `website_attr` VALUES ('397', '20');
INSERT INTO `website_attr` VALUES ('398', '20');
INSERT INTO `website_attr` VALUES ('399', '20');
INSERT INTO `website_attr` VALUES ('400', '20');
INSERT INTO `website_attr` VALUES ('401', '20');
INSERT INTO `website_attr` VALUES ('402', '20');
INSERT INTO `website_attr` VALUES ('403', '20');
INSERT INTO `website_attr` VALUES ('406', '20');
INSERT INTO `website_attr` VALUES ('407', '20');
INSERT INTO `website_attr` VALUES ('408', '21');
INSERT INTO `website_attr` VALUES ('409', '21');
INSERT INTO `website_attr` VALUES ('410', '21');
INSERT INTO `website_attr` VALUES ('411', '21');
INSERT INTO `website_attr` VALUES ('412', '21');
INSERT INTO `website_attr` VALUES ('413', '21');
INSERT INTO `website_attr` VALUES ('414', '21');
INSERT INTO `website_attr` VALUES ('415', '21');
INSERT INTO `website_attr` VALUES ('416', '21');
INSERT INTO `website_attr` VALUES ('417', '21');
INSERT INTO `website_attr` VALUES ('418', '21');
INSERT INTO `website_attr` VALUES ('419', '21');
INSERT INTO `website_attr` VALUES ('420', '21');
INSERT INTO `website_attr` VALUES ('421', '21');
INSERT INTO `website_attr` VALUES ('422', '21');
INSERT INTO `website_attr` VALUES ('423', '21');
INSERT INTO `website_attr` VALUES ('424', '21');
INSERT INTO `website_attr` VALUES ('425', '21');
INSERT INTO `website_attr` VALUES ('426', '21');
INSERT INTO `website_attr` VALUES ('427', '21');
INSERT INTO `website_attr` VALUES ('428', '21');
INSERT INTO `website_attr` VALUES ('429', '21');
INSERT INTO `website_attr` VALUES ('430', '21');
INSERT INTO `website_attr` VALUES ('431', '21');
INSERT INTO `website_attr` VALUES ('432', '22');
INSERT INTO `website_attr` VALUES ('433', '22');
INSERT INTO `website_attr` VALUES ('434', '22');
INSERT INTO `website_attr` VALUES ('435', '22');
INSERT INTO `website_attr` VALUES ('436', '22');
INSERT INTO `website_attr` VALUES ('437', '22');
INSERT INTO `website_attr` VALUES ('438', '22');
INSERT INTO `website_attr` VALUES ('439', '22');
INSERT INTO `website_attr` VALUES ('440', '22');
INSERT INTO `website_attr` VALUES ('441', '22');
INSERT INTO `website_attr` VALUES ('442', '22');
INSERT INTO `website_attr` VALUES ('443', '22');
INSERT INTO `website_attr` VALUES ('444', '22');
INSERT INTO `website_attr` VALUES ('445', '22');
INSERT INTO `website_attr` VALUES ('446', '22');
INSERT INTO `website_attr` VALUES ('447', '22');
INSERT INTO `website_attr` VALUES ('448', '22');
INSERT INTO `website_attr` VALUES ('449', '22');
INSERT INTO `website_attr` VALUES ('450', '22');
INSERT INTO `website_attr` VALUES ('451', '22');
INSERT INTO `website_attr` VALUES ('452', '23');
INSERT INTO `website_attr` VALUES ('453', '23');
INSERT INTO `website_attr` VALUES ('454', '23');
INSERT INTO `website_attr` VALUES ('455', '23');
INSERT INTO `website_attr` VALUES ('456', '23');
INSERT INTO `website_attr` VALUES ('457', '23');
INSERT INTO `website_attr` VALUES ('458', '23');
INSERT INTO `website_attr` VALUES ('459', '23');
INSERT INTO `website_attr` VALUES ('460', '23');
INSERT INTO `website_attr` VALUES ('461', '23');
INSERT INTO `website_attr` VALUES ('462', '23');
INSERT INTO `website_attr` VALUES ('463', '23');
INSERT INTO `website_attr` VALUES ('464', '23');
INSERT INTO `website_attr` VALUES ('465', '23');
INSERT INTO `website_attr` VALUES ('466', '23');
INSERT INTO `website_attr` VALUES ('467', '24');
INSERT INTO `website_attr` VALUES ('468', '24');
INSERT INTO `website_attr` VALUES ('469', '24');
INSERT INTO `website_attr` VALUES ('470', '24');
INSERT INTO `website_attr` VALUES ('471', '24');
INSERT INTO `website_attr` VALUES ('472', '24');
INSERT INTO `website_attr` VALUES ('473', '24');
INSERT INTO `website_attr` VALUES ('474', '24');
INSERT INTO `website_attr` VALUES ('475', '24');
INSERT INTO `website_attr` VALUES ('476', '24');
INSERT INTO `website_attr` VALUES ('477', '24');
INSERT INTO `website_attr` VALUES ('478', '24');
INSERT INTO `website_attr` VALUES ('479', '24');
INSERT INTO `website_attr` VALUES ('480', '24');
INSERT INTO `website_attr` VALUES ('481', '24');
INSERT INTO `website_attr` VALUES ('482', '25');
INSERT INTO `website_attr` VALUES ('483', '25');
INSERT INTO `website_attr` VALUES ('484', '25');
INSERT INTO `website_attr` VALUES ('485', '25');
INSERT INTO `website_attr` VALUES ('486', '25');
INSERT INTO `website_attr` VALUES ('487', '25');
INSERT INTO `website_attr` VALUES ('488', '25');
INSERT INTO `website_attr` VALUES ('489', '25');
INSERT INTO `website_attr` VALUES ('490', '25');
INSERT INTO `website_attr` VALUES ('491', '25');
INSERT INTO `website_attr` VALUES ('511', '25');
INSERT INTO `website_attr` VALUES ('434', '26');
INSERT INTO `website_attr` VALUES ('435', '26');
INSERT INTO `website_attr` VALUES ('436', '26');
INSERT INTO `website_attr` VALUES ('439', '26');
INSERT INTO `website_attr` VALUES ('441', '26');
INSERT INTO `website_attr` VALUES ('443', '26');
INSERT INTO `website_attr` VALUES ('444', '26');
INSERT INTO `website_attr` VALUES ('445', '26');
INSERT INTO `website_attr` VALUES ('446', '26');
INSERT INTO `website_attr` VALUES ('447', '26');
INSERT INTO `website_attr` VALUES ('448', '26');
INSERT INTO `website_attr` VALUES ('449', '26');
INSERT INTO `website_attr` VALUES ('450', '26');
INSERT INTO `website_attr` VALUES ('492', '26');
INSERT INTO `website_attr` VALUES ('493', '26');
INSERT INTO `website_attr` VALUES ('494', '26');
INSERT INTO `website_attr` VALUES ('495', '26');
INSERT INTO `website_attr` VALUES ('496', '26');
INSERT INTO `website_attr` VALUES ('497', '26');
INSERT INTO `website_attr` VALUES ('498', '26');
INSERT INTO `website_attr` VALUES ('499', '26');
INSERT INTO `website_attr` VALUES ('500', '26');
INSERT INTO `website_attr` VALUES ('501', '26');
INSERT INTO `website_attr` VALUES ('502', '26');
INSERT INTO `website_attr` VALUES ('503', '26');
INSERT INTO `website_attr` VALUES ('504', '26');
INSERT INTO `website_attr` VALUES ('505', '26');
INSERT INTO `website_attr` VALUES ('506', '26');
INSERT INTO `website_attr` VALUES ('507', '26');
INSERT INTO `website_attr` VALUES ('509', '26');
INSERT INTO `website_attr` VALUES ('507', '27');
INSERT INTO `website_attr` VALUES ('270', '28');
INSERT INTO `website_attr` VALUES ('326', '28');
INSERT INTO `website_attr` VALUES ('327', '28');
INSERT INTO `website_attr` VALUES ('356', '28');
INSERT INTO `website_attr` VALUES ('358', '28');
INSERT INTO `website_attr` VALUES ('362', '28');
INSERT INTO `website_attr` VALUES ('363', '28');
INSERT INTO `website_attr` VALUES ('367', '28');
INSERT INTO `website_attr` VALUES ('368', '28');
INSERT INTO `website_attr` VALUES ('379', '28');
INSERT INTO `website_attr` VALUES ('285', '30');
INSERT INTO `website_attr` VALUES ('288', '30');
INSERT INTO `website_attr` VALUES ('301', '30');
INSERT INTO `website_attr` VALUES ('311', '30');
INSERT INTO `website_attr` VALUES ('312', '30');
INSERT INTO `website_attr` VALUES ('328', '30');
INSERT INTO `website_attr` VALUES ('332', '30');
INSERT INTO `website_attr` VALUES ('336', '30');
INSERT INTO `website_attr` VALUES ('370', '30');
INSERT INTO `website_attr` VALUES ('473', '30');
INSERT INTO `website_attr` VALUES ('474', '30');
INSERT INTO `website_attr` VALUES ('480', '30');
INSERT INTO `website_attr` VALUES ('481', '30');
INSERT INTO `website_attr` VALUES ('477', '33');
INSERT INTO `website_attr` VALUES ('479', '33');

-- ----------------------------
-- Table structure for website_recommend
-- ----------------------------
DROP TABLE IF EXISTS `website_recommend`;
CREATE TABLE `website_recommend` (
  `websiteId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐网站编号',
  `websiteName` varchar(255) NOT NULL COMMENT '推荐网站名',
  `websiteDomain` varchar(255) NOT NULL COMMENT '推荐网站域名',
  `websiteIntro` text COMMENT '推荐网站介绍',
  `userId` int(11) unsigned NOT NULL COMMENT '推荐网站的用户编号',
  `adminId` smallint(6) unsigned DEFAULT NULL COMMENT '负责审核的管理员编号',
  `websiteCheckStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `websiteRecommendDateTime` datetime NOT NULL COMMENT '推荐网站的日期与时间',
  `websiteCheckPassDateTime` datetime DEFAULT NULL COMMENT '网站审核通过的日期与时间',
  `websiteCheckFailReason` varchar(255) DEFAULT NULL COMMENT '网站审核失败的理由',
  PRIMARY KEY (`websiteId`),
  UNIQUE KEY `index_userId_websiteDomain` (`websiteDomain`,`userId`) USING BTREE,
  KEY `index_userId` (`userId`) USING BTREE,
  KEY `index_adminId` (`adminId`) USING BTREE,
  CONSTRAINT `website_recommend_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `website_recommend_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website_recommend
-- ----------------------------

-- ----------------------------
-- Procedure structure for proc_addAttr
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_addAttr`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_addAttr`(IN `in_attrName` varchar(255),IN `in_attrIntro` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		INSERT INTO Attr(
										attrName,
										attrIntro
		)
		VALUES(
				in_attrName, 
				in_attrIntro
		);

		SELECT LAST_INSERT_ID()
		FROM Attr
		LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_addAttrSynonym
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_addAttrSynonym`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_addAttrSynonym`(IN `in_attrId` int,IN `in_attrSynonymName` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		INSERT INTO AttrSynonym(
					attrSynonymName,
					attrId
		)
		VALUE(
					in_attrSynonymName,
					in_attrId
		);

		SELECT LAST_INSERT_ID()
		FROM AttrSynonym
		LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_addComment
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_addComment`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_addComment`(IN `in_commentStar` tinyint,IN `in_commentContent` text,IN `in_websiteId` int,IN `in_userId` int)
    SQL SECURITY INVOKER
BEGIN
		INSERT INTO Comment(
				commentStar,
				commentContent,
				commentPublishDateTime,
				commentLastEditDateTime,
				websiteId,
				userId
		)
		VALUE(
				in_commentStar,
				in_commentContent,
				NOW(),
				NOW(),
				in_websiteId,
				in_userId
		);
		
		SELECT LAST_INSERT_ID()
		FROM Comment
		LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_addEcho
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_addEcho`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_addEcho`(IN `in_echoContent` text,IN `in_commentId` int,IN `in_userId` int)
    SQL SECURITY INVOKER
BEGIN
		INSERT INTO Echo(
								echoContent,
								echoPublishDateTime,
								commentId,
								userId
		)
		VALUE (
				in_echoContent,
				NOW(),
				in_commentId,
				in_userId
		);

		SELECT ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_addUserByUserWaitValidate
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_addUserByUserWaitValidate`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_addUserByUserWaitValidate`(IN `in_userId` int)
    SQL SECURITY INVOKER
BEGIN
		INSERT INTO User(
									userAccount,
									userPass,
									userNickName,
									userEmail
		)
		SELECT userAccount,
					 userPass,
					 userNickName,
					 userEmail
		FROM User_WaitValidation
		WHERE userId = in_userId;

		DELETE FROM User_WaitValidation
		WHERE userId = in_userId;

		SELECT LAST_INSERT_ID() 
		FROM User
		LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_addUserPassReset
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_addUserPassReset`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_addUserPassReset`(IN `in_userId` int,IN `in_validString` varchar(255),IN `in_mailSendDateTime` datetime)
    SQL SECURITY INVOKER
BEGIN
		UPDATE User_PassReset
		SET validStatus = 0
		WHERE userId = in_userId
			AND validStatus != 0;

		INSERT INTO User_PassReset(
													userId,
													validString,
													mailSendDateTime,
													validStatus
		)
		VALUE(
				in_userId,
				in_validString,
				in_mailSendDateTime,
				1
		);

		SELECT ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_addUserWaitValidate
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_addUserWaitValidate`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_addUserWaitValidate`(IN `in_userAccount` varchar(255),IN `in_userPass` varchar(255),IN `in_userNickName` varchar(255),IN `in_userEmail` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		INSERT INTO User_WaitValidation(
															userAccount,
															userPass,
															userNickName,
															userEmail
		)
		VALUES(
				in_userAccount,
				in_userPass,
				in_userNickName,
				in_userEmail
		);

		SELECT LAST_INSERT_ID() 
		FROM User_WaitValidation
		LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_addWebsite
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_addWebsite`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_addWebsite`(IN `in_websiteDomain` varchar(255),IN `in_websiteName` varchar(255),IN `in_websiteBriefIntro` varchar(255),IN `in_websiteDetailedIntro` text,IN `in_websiteOwner` varchar(255),IN `in_websiteEstablishYear` smallint,IN `in_websiteEstablishMonth` tinyint,IN `in_websiteEstablishDay` tinyint,IN `in_catId` smallint)
    SQL SECURITY INVOKER
BEGIN
		INSERT INTO Website(
										websiteDomain,
										websiteName,
										websiteBriefIntro,
										websiteDetailedIntro,
									  websiteOwner,
										websiteEstablishYear,
										websiteEstablishMonth,
										websiteEstablishDay,
										catId
		)
		VALUES(
				in_websiteDomain,
				in_websiteName,
				in_websiteBriefIntro,
				in_websiteDetailedIntro,
				in_websiteOwner,
				in_websiteEstablishYear,
        in_websiteEstablishMonth,
        in_websiteEstablishDay,
				in_catId
		);

		SELECT LAST_INSERT_ID()
		FROM Website
		LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_addWebsiteAttrsByWebsiteIdAndAttrId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_addWebsiteAttrsByWebsiteIdAndAttrId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_addWebsiteAttrsByWebsiteIdAndAttrId`(IN `in_websiteId` int,IN `in_attrId` int)
    SQL SECURITY INVOKER
BEGIN
		INSERT INTO Website_Attr(
										websiteId,
										attrId
		)
		VALUES(
				in_websiteId,
				in_attrId
		);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_addWebsiteRecommend
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_addWebsiteRecommend`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_addWebsiteRecommend`(IN `in_websiteName` varchar(255),IN `in_websiteDomain` varchar(255),IN `in_websiteIntro` text,IN `in_userId` int)
    SQL SECURITY INVOKER
BEGIN
		INSERT INTO Website_Recommend(
														websiteName,
														websiteDomain,
														websiteIntro,
														userId,
														websiteRecommendDateTime
		)
		VALUE(
				in_websiteName,
				in_websiteDomain,
				in_websiteIntro,
				in_userId,
				NOW()
		);
	
		SELECT LAST_INSERT_ID() 
		FROM Website_Recommend
		LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_countArticleNum
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_countArticleNum`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_countArticleNum`()
    SQL SECURITY INVOKER
BEGIN
	
		select count(*) from Article;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_countCommentNumByUserId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_countCommentNumByUserId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_countCommentNumByUserId`(IN `in_userId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT count(*) 
		FROM Comment
		WHERE userId = in_userId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_countCommentNumByWebsiteId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_countCommentNumByWebsiteId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_countCommentNumByWebsiteId`(IN `in_websiteId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT count(*) 
		FROM Comment
		WHERE websiteId = in_websiteId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_countEchoNumByCommentId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_countEchoNumByCommentId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_countEchoNumByCommentId`(IN `in_commentId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT count(*)
		FROM Echo
		WHERE commentId = in_commentId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_countWebsiteNum
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_countWebsiteNum`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_countWebsiteNum`()
    SQL SECURITY INVOKER
BEGIN
		SELECT COUNT(*)
		FROM Website;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_countWebsiteNumByAttrId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_countWebsiteNumByAttrId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_countWebsiteNumByAttrId`(IN `in_attrId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT COUNT(*)
		FROM Website_Attr
		WHERE attrId = in_attrId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_countWebsiteNumByCatId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_countWebsiteNumByCatId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_countWebsiteNumByCatId`(IN `in_catId` smallint)
    SQL SECURITY INVOKER
BEGIN
		SELECT COUNT(*)
		FROM Website
		WHERE catId = in_catId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_countWebsiteNumByKeywords
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_countWebsiteNumByKeywords`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_countWebsiteNumByKeywords`(IN `in_keywords` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		/* 声明变量 */
		DECLARE keywords VARCHAR(255) DEFAULT LTRIM(in_keywords);  /* 关键词的集合 */
		DECLARE keyword VARCHAR(255) DEFAULT "";  /* 单个关键词 */
		DECLARE split VARCHAR(1) DEFAULT " ";  /* 分割符 */
		DECLARE pageSize INT DEFAULT 10;
		DECLARE standardAttrName VARCHAR(255);  /* 标准属性名 */
		DECLARE count long;
		DECLARE curOver TINYINT DEFAULT 1;  /* 游标结束标志位，初始值为1 */
		/* 游标：定位关键词临时表的关键词 */
		DECLARE cur_keyword CURSOR FOR SELECT T_Keyword.keyword FROM T_Keyword;
		/* 游标读完后，结束标志位设置为0 */
		DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET curOver = NULL;
		

	
		/* 如果存在临时表，则删除 */
	  DROP TABLE IF EXISTS T_Keyword;  /* 删除网站临时表 */
		DROP TABLE IF EXISTS T_Website;  /* 删除关键词临时表 */


  	/* 创建关键词临时表 */
		CREATE TEMPORARY TABLE T_Keyword(
				t_PK INT PRIMARY KEY AUTO_INCREMENT,
				keyword VARCHAR(255)
		);

		/* 创建网站编号临时表 */
		CREATE TEMPORARY TABLE T_Website(
				t_PK INT PRIMARY KEY AUTO_INCREMENT,
				websiteId INT
		);
		

		/* 分解关键词，并存入关键词临时表 */
		WHILE CHAR_LENGTH(keywords) != 0 DO 
				SELECT SUBSTRING_INDEX(keywords,split,1) INTO keyword;  /* 返回一个关键词 */
				INSERT INTO T_Keyword(keyword) VALUES(keyword);  /* 存入关键词临时表 */
				SET keywords = SUBSTRING(keywords, CHAR_LENGTH(keyword) + 1);  /* 截取剩下的关键词的集合 */
				SET keywords = LTRIM(keywords);  /* 去除前导空白 */
		END WHILE;

		
		
		OPEN cur_keyword;  /* 打开游标 */
		FETCH cur_keyword INTO keyword;  /* 游标向下走一步 */
		/* 根据每个关键词查询网站 */
		WHILE curOver IS NOT NULL DO


				/* 根据关键词搜索网站名 */
				INSERT INTO T_Website(
													websiteId
				)
				SELECT websiteId
				FROM Website
				WHERE websiteName LIKE CONCAT('%', keyword, '%');


				/* 根据关键词搜索域名 */
				INSERT INTO T_Website(
													websiteId
				)
				SELECT websiteId
				FROM Website
				WHERE websiteDomain LIKE CONCAT('%', keyword, '%');


				/* 根据关键词搜索属性名、属性近义词名 */
				INSERT INTO T_Website(
													websiteId
				)
				SELECT Website.websiteId
				FROM Website,
						 Website_Attr
				WHERE Website.websiteId = Website_Attr.websiteId 
					AND Website_Attr.attrId IN(
																SELECT attrId 
																FROM Attr
																WHERE attrName LIKE CONCAT('%', keyword, '%') 
																	 OR attrId IN(
																						SELECT Attr.attrId 
																						FROM Attr,
																								 AttrSynonym 
																						WHERE Attr.attrId = AttrSynonym.attrId 
																							AND attrSynonymName LIKE CONCAT('%', keyword, '%')
																	 )
					);


				/* 根据关键词搜索网站简介 */
				INSERT INTO T_Website(
													websiteId
				)
				SELECT websiteId
				FROM Website
				WHERE websiteBriefIntro LIKE CONCAT('%', keyword, '%');


				FETCH cur_keyword INTO keyword;  /* 游标向下走一步 */
		END WHILE;
		CLOSE cur_keyword;  /* 关闭游标 */

	
		/* 获取符合条件的网站 */
		SELECT COUNT(DISTINCT websiteId)
		FROM T_Website;


		/* 删除临时表 */
	  DROP TABLE IF EXISTS T_Keyword;  /* 删除网站临时表 */
		DROP TABLE IF EXISTS T_Website;  /* 删除关键词临时表 */
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_countWebsiteRecommendNumByWebsiteCheckStatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_countWebsiteRecommendNumByWebsiteCheckStatus`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_countWebsiteRecommendNumByWebsiteCheckStatus`(IN `in_websiteCheckStatus` tinyint)
    SQL SECURITY INVOKER
BEGIN
		SELECT COUNT(*)
		FROM Website_Recommend
		WHERE websiteCheckStatus = in_websiteCheckStatus
		ORDER BY websiteRecommendDateTime DESC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_deleteAttrByAttrId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_deleteAttrByAttrId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_deleteAttrByAttrId`(IN `in_attrId` int)
    SQL SECURITY INVOKER
BEGIN
		DELETE FROM attrs 
		WHERE attrId = in_attrId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_deleteAttrSynonymByAttrSynonymId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_deleteAttrSynonymByAttrSynonymId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_deleteAttrSynonymByAttrSynonymId`(IN `in_attrSynonymId` int)
    SQL SECURITY INVOKER
BEGIN
		DELETE FROM AttrSynonym
		WHERE attrSynonymId = in_attrSynonymId;

		SELECT ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_deleteCommentByCommentId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_deleteCommentByCommentId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_deleteCommentByCommentId`(IN `in_commentId` int)
    SQL SECURITY INVOKER
BEGIN
		DELETE FROM Comment
		WHERE commentId = in_commentId;
		
		SELECT ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_deleteWebsiteAttrsByWebsiteId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_deleteWebsiteAttrsByWebsiteId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_deleteWebsiteAttrsByWebsiteId`(IN `in_websiteId` int)
    SQL SECURITY INVOKER
BEGIN
		DELETE FROM Website_Attr
		WHERE websiteId = in_websiteId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_deleteWebsiteByWebsiteId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_deleteWebsiteByWebsiteId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_deleteWebsiteByWebsiteId`(IN `in_websiteId` int)
    SQL SECURITY INVOKER
BEGIN
		DELETE FROM Website
		WHERE websiteId = in_websiteId;

		SELECT websiteId 
		FROM Website
		WHERE websiteId = in_websiteId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAdminByAccountAndPass
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAdminByAccountAndPass`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAdminByAccountAndPass`(IN `in_adminAccount` varchar(255), IN `in_adminPass` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		SELECT adminId,
					 adminAccount,
					 adminName,
					 adminLv
		FROM Admin
		WHERE adminAccount = in_adminAccount
			AND	adminPass = in_adminPass;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAdminByAdminId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAdminByAdminId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAdminByAdminId`(IN `in_adminId` smallint)
    SQL SECURITY INVOKER
BEGIN
		SELECT adminId,
					 adminAccount,
					 adminName,
					 adminLv
		FROM Admin
		WHERE adminId = in_adminId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAllAdmins
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAllAdmins`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAllAdmins`()
    SQL SECURITY INVOKER
BEGIN
		SELECT adminId,
					 adminAccount,
					 adminName,
					 adminLv
		FROM Admin;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAllArticles
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAllArticles`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAllArticles`(IN `pageNo` int,IN `pageSize` int)
    SQL SECURITY INVOKER
BEGIN
		
		SELECT articleId,
					 articleTitle,
					 articleNavRead,
					 articleLink,
					 articleCoverFlag,
					 articlePublishDateTime	
		FROM Article
		ORDER BY articlePublishDateTime DESC
		LIMIT 20;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAllAttrs
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAllAttrs`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAllAttrs`()
    SQL SECURITY INVOKER
BEGIN
		SELECT attrId,
					 attrName,
					 attrIntro
		FROM Attr;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAllCats
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAllCats`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAllCats`()
    SQL SECURITY INVOKER
BEGIN
		SELECT catId,
					 catName	
		FROM Cat;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAllWebsites
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAllWebsites`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAllWebsites`(IN `in_pageNo` int, IN `in_pageSize` int)
    SQL SECURITY INVOKER
BEGIN
		/* 获取全部网站 */
		SET @sql = CONCAT('SELECT Website.websiteId,
					                    websiteDomain,
															websiteName,
															websiteBriefIntro,
															websiteDetailedIntro,
														  websiteOwner,
															websiteEstablishYear,
															websiteEstablishMonth,
															websiteEstablishDay,
															catId,
															AVG(commentStar) AS websiteStar
											 FROM Website LEFT JOIN Comment
												 ON Website.websiteId = Comment.websiteId
											 GROUP BY Website.websiteId
											 ORDER BY websiteStar DESC
											 LIMIT ', (in_pageNo - 1) * in_pageSize, ',', in_pageSize);
		PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAreaByAreaId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAreaByAreaId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAreaByAreaId`(IN `in_areaId` smallint)
    SQL SECURITY INVOKER
BEGIN
		DECLARE t_areaLv TINYINT;
		
		SELECT areaLv INTO t_areaLv
		FROM Area
		WHERE areaId = in_areaId;
		
		IF(t_areaLv = 2) THEN
		  	SELECT lv2Area.areaId AS areaId,
  			    	 lv2Area.areaName AS areaName,
							 lv1Area.areaId AS parentAreaId,
							 lv1Area.areaName AS parentAreaName
				FROM Area lv1Area,
						 Area lv2Area
				WHERE lv1Area.areaId = lv2Area.parentAreaId
					AND lv2Area.areaId = in_areaId;
		ELSEIF(t_areaLv = 1) THEN
		  	SELECT areaId,
							 areaName,
							 null AS parentAreaId,
  			    	 null AS parentAreaName
				FROM Area
				WHERE Area.areaId = in_areaId;
		END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAreaByAreaLvAndParentAreaId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAreaByAreaLvAndParentAreaId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAreaByAreaLvAndParentAreaId`(IN `in_areaLv` tinyint,IN `in_parentAreaId` smallint)
    SQL SECURITY INVOKER
BEGIN
		IF(in_parentAreaId IS NULL) THEN
			SELECT areaId,
						 areaName,
						 areaLv,
						 parentAreaId
			FROM Area
			WHERE areaLv = in_areaLv
				AND parentAreaId IS NULL;
		ELSE
			SELECT areaId,
						 areaName,
						 areaLv,
						 parentAreaId
			FROM Area
			WHERE areaLv = in_areaLv
				AND parentAreaId = in_parentAreaId;	
		END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAttrByAttrId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAttrByAttrId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAttrByAttrId`(IN `in_attrId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT attrId,
					 attrName,
					 attrIntro
		FROM Attr
		WHERE attrId = in_attrId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAttrsByWebsiteId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAttrsByWebsiteId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAttrsByWebsiteId`(IN `in_websiteId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT Attr.attrId,
					 attrName,
					 attrIntro
		FROM Attr,
				 Website_Attr
		WHERE Attr.attrId = Website_Attr.attrId
			AND Website_Attr.websiteId = in_websiteId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAttrSynonymByAttrSynonymId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAttrSynonymByAttrSynonymId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAttrSynonymByAttrSynonymId`(IN `in_attrSynonymId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT attrSynonymId,
					 attrSynonymName,
					 attrId
		FROM AttrSynonym
		WHERE attrSynonymId = in_attrSynonymId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findAttrSynonymsByAttrId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findAttrSynonymsByAttrId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findAttrSynonymsByAttrId`(IN `in_attrId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT attrSynonymId,
					 attrSynonymName
		FROM AttrSynonym
		WHERE attrId = in_attrId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findCatByCatId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findCatByCatId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findCatByCatId`(IN `in_catId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT catId,
					 catName
		FROM Cat
		WHERE catId = in_catId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findCommentByCommentId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findCommentByCommentId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findCommentByCommentId`(IN `in_commentId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT commentId,
					 commentStar,
					 commentContent,
					 commentPublishDateTime,
				   commentLastEditDateTime,
					 websiteId,
					 userId
		FROM Comment
		WHERE commentId = in_commentId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findCommentByWebsiteIdAndUserId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findCommentByWebsiteIdAndUserId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findCommentByWebsiteIdAndUserId`(IN `in_websiteId` int,IN `in_userId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT commentId,
					 commentStar,
					 commentContent,
					 commentPublishDateTime,
				   commentLastEditDateTime
		FROM Comment
		WHERE websiteId = in_websiteId
			AND userId = in_userId
		ORDER BY commentLastEditDateTime DESC
		LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findCommentsByUserId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findCommentsByUserId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findCommentsByUserId`(IN `in_userId` int, IN `in_pageNo` int, IN `in_pageSize` int)
    SQL SECURITY INVOKER
BEGIN
		/* 获取符合条件的评论 */
		SET @sql = CONCAT('SELECT commentId,
															commentStar,
															commentContent,
															commentPublishDateTime,
															commentLastEditDateTime,
															websiteId,
															userId
											 FROM Comment
											 WHERE userId = ',in_userId, '
											 ORDER BY commentPublishDateTime DESC
											 LIMIT ', (in_pageNo - 1) * in_pageSize, ',', in_pageSize);
		PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findCommentsByWebsiteId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findCommentsByWebsiteId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findCommentsByWebsiteId`(IN `in_websiteId` int, IN `in_pageNo` int, IN `in_pageSize` int)
    SQL SECURITY INVOKER
BEGIN
		/* 获取符合条件的评论 */
		SET @sql = CONCAT('SELECT commentId,
															commentStar,
															commentContent,
															commentPublishDateTime,
															commentLastEditDateTime,
															userId
											 FROM Comment
											 WHERE websiteId = ',in_websiteId, '
											 ORDER BY commentPublishDateTime DESC
											 LIMIT ', (in_pageNo - 1) * in_pageSize, ',', in_pageSize);
		PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findEchoesByCommentId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findEchoesByCommentId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findEchoesByCommentId`(IN `in_commentId` int, IN `in_pageNo` int, IN `in_pageSize` int)
    SQL SECURITY INVOKER
BEGIN
		SET @sql = CONCAT('SELECT echoId,
															echoContent,
															echoPublishDateTime,
															commentId,
															userId
											 FROM Echo
											 WHERE commentId = ', in_commentId, '
											 ORDER BY echoPublishDateTime DESC
											 LIMIT ', (in_pageNo - 1) * in_pageSize, ',', in_pageSize);
		PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findHotAttrs
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findHotAttrs`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findHotAttrs`()
    SQL SECURITY INVOKER
BEGIN
		SELECT attrId,
					 attrName
		FROM Attr
		WHERE attrId IN(1,2,3,4,5,6,7,8,9,10);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findNewArticlesWithoutCover
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findNewArticlesWithoutCover`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findNewArticlesWithoutCover`()
    SQL SECURITY INVOKER
BEGIN
		DECLARE newArticleWithCoverId INT;

		SELECT articleId INTO newArticleWithCoverId
		FROM Article
		WHERE articleCoverFlag = 1
		ORDER BY articlePublishDateTime DESC
		LIMIT 1;

		SELECT articleId,
					 articleTitle,
					 articleNavRead,
					 articleLink,
					 articleCoverFlag,
					 articlePublishDateTime	
		FROM Article
		WHERE articleId != newArticleWithCoverId
		ORDER BY articlePublishDateTime DESC
		LIMIT 4;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findNewArticleWithCover
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findNewArticleWithCover`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findNewArticleWithCover`()
    SQL SECURITY INVOKER
BEGIN
		SELECT articleId,
					 articleTitle,
					 articleNavRead,
					 articleLink,
					 articleCoverFlag,
					 articlePublishDateTime	
		FROM Article
		WHERE articleCoverFlag = 1
		ORDER BY articlePublishDateTime DESC
		LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findNewCommentsByWebsiteId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findNewCommentsByWebsiteId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findNewCommentsByWebsiteId`(IN `in_websiteId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT commentId,
					 commentStar,
					 commentContent,
					 commentPublishDateTime,
				   commentLastEditDateTime,
					 userId
		FROM Comment
		WHERE websiteId = in_websiteId
		ORDER BY commentPublishDateTime DESC
		LIMIT 10;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findNewNotice
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findNewNotice`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findNewNotice`()
    SQL SECURITY INVOKER
BEGIN
		SELECT noticeId,
					 noticeTitle,
					 noticeContent,
					 noticePublishDateTime,
					 noticeLastEditDateTime,
					 adminId
		FROM Notice
		ORDER BY noticePublishDateTime DESC
		LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findUserByAccount
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findUserByAccount`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findUserByAccount`(IN `in_userAccount` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		SELECT userId
		FROM User 
		WHERE userAccount = in_userAccount
		UNION
		SELECT userId
		FROM User_WaitValidation
		WHERE userAccount = in_userAccount;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findUserByAccountAndPass
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findUserByAccountAndPass`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findUserByAccountAndPass`(IN `in_userAccount` varchar(255),IN `in_userPass` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		SELECT userId,
					 userAccount,
					 userNickName,
					 userEmail,
					 userStatus
		FROM User
		WHERE userAccount = in_userAccount
			AND userPass = in_userPass;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findUserByNickName
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findUserByNickName`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findUserByNickName`(IN `in_userNickName` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		SELECT userId
		FROM User 
		WHERE userNickName = in_userNickName
		UNION
		SELECT userId
		FROM User_WaitValidation
		WHERE userNickName = in_userNickName;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findUserByUserAccount
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findUserByUserAccount`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findUserByUserAccount`(IN `in_userAccount` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		SELECT userId,
					 userAccount,
					 userNickName,
					 userEmail,
					 userFaceFlag,
					 userStatus
		FROM User
		WHERE userAccount = in_userAccount;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findUserByUserId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findUserByUserId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findUserByUserId`(IN `in_userId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT userId,
					 userAccount,
					 userNickName,
					 userEmail,
					 userFaceFlag,
					 userStatus
		FROM User
		WHERE userId = in_userId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findUserDataByUserId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findUserDataByUserId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findUserDataByUserId`(IN `in_userId` int)
    SQL SECURITY INVOKER
BEGIN
		DECLARE userAreaLv TINYINT;

		SELECT areaLv INTO userAreaLv
		FROM User,
				 Area
		WHERE User.areaId = Area.areaId
			AND userId = in_userId;

		IF(userAreaLv = 1) THEN
				SELECT userId,
					 userAccount,
					 userNickName,
					 userEmail,
					 userFaceFlag,
					 userStatus,
					 userPersonalIntro,
					 userSex,
					 userBirthday,
					 areaId AS userLv1AreaId,
					 null AS userLv2AreaId
				FROM User
				WHERE userId = in_userId;
		ELSEIF(userAreaLv = 2) THEN
				SELECT userId,
					 userAccount,
					 userNickName,
					 userEmail,
					 userFaceFlag,
					 userStatus,
					 userPersonalIntro,
					 userSex,
					 userBirthday,
					 parentAreaId AS userLv1AreaId,
					 User.areaId AS userLv2AreaId
				FROM User,
						 Area
				WHERE User.areaId = Area.areaId
					AND userId = in_userId;
		ELSE 
				SELECT userId,
					 userAccount,
					 userNickName,
					 userEmail,
					 userFaceFlag,
					 userStatus,
					 userPersonalIntro,
					 userSex,
					 userBirthday,
					 null AS userLv1AreaId,
					 null AS userLv2AreaId
				FROM User
				WHERE userId = in_userId;
		END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findUserIdByCommentId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findUserIdByCommentId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findUserIdByCommentId`(IN `in_commentId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT userId 
		FROM Comment
		WHERE commentId = in_commentId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findUserPassResetByUserIdAndValidString
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findUserPassResetByUserIdAndValidString`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findUserPassResetByUserIdAndValidString`(IN `in_userId` int,IN `in_validString` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		SELECT userId,
					 validString,
					 mailSendDateTime,
					 validStatus
		FROM User_PassReset
		WHERE userId = in_userId
			AND validString = in_validString;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findUserWaitValidateByAccountAndPass
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findUserWaitValidateByAccountAndPass`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findUserWaitValidateByAccountAndPass`(IN `in_userAccount` varchar(255),IN `in_userPass` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		SELECT userId,
					 userAccount,
					 userNickName,
					 userEmail
		FROM User_WaitValidation
		WHERE userAccount = in_userAccount
			AND userPass = in_userPass;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findUserWaitValidateById
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findUserWaitValidateById`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findUserWaitValidateById`(IN `in_userId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT userId,
					 userAccount,
					 userNickName,
					 userEmail
		FROM User_WaitValidation
		WHERE userId = in_userId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findWebsiteByWebsiteDomain
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findWebsiteByWebsiteDomain`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findWebsiteByWebsiteDomain`(IN `in_websiteDomain` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		SELECT websiteId
		FROM Website
		WHERE websiteDomain = in_websiteDomain;		 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findWebsiteByWebsiteId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findWebsiteByWebsiteId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findWebsiteByWebsiteId`(IN `in_websiteId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT Website.websiteId,
					 websiteName,
					 websiteDomain,
					 websiteBriefIntro,
					 websiteDetailedIntro,
					 websiteOwner,
					 websiteEstablishYear,
           websiteEstablishMonth,
           websiteEstablishDay,
					 catId,
					 AVG(commentStar) AS websiteStar
		FROM Website,
				 Comment
		WHERE Website.websiteId = in_websiteId
		AND Website.websiteId = Comment.websiteId;		
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findWebsiteRecommendByWebsiteDomainAndUserId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findWebsiteRecommendByWebsiteDomainAndUserId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findWebsiteRecommendByWebsiteDomainAndUserId`(IN `in_websiteDomain` varchar(255),IN `in_userId` int)
    SQL SECURITY INVOKER
BEGIN
		SELECT websiteId,
		  	   websiteName,
					 websiteDomain,
					 websiteIntro,
					 userId,
					 adminId,
					 websiteCheckStatus,
					 websiteRecommendDateTime,
					 websiteCheckPassDateTime,
					 websiteCheckFailReason
		FROM Website_Recommend
		WHERE websiteDomain = in_websiteDomain
			AND	userId = in_userId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findWebsiteRecommendsByWebsiteCheckStatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findWebsiteRecommendsByWebsiteCheckStatus`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findWebsiteRecommendsByWebsiteCheckStatus`(IN `in_websiteCheckStatus` tinyint,IN `in_pageNo` int,IN `in_pageSize` int)
    SQL SECURITY INVOKER
BEGIN
		SET @sql = CONCAT('SELECT websiteId,
														  websiteName,
															websiteDomain,
															websiteIntro,
															userId,
															adminId,
															websiteCheckStatus,
															websiteRecommendDateTime,
															websiteCheckPassDateTime,
															websiteCheckFailReason
											FROM Website_Recommend
											WHERE websiteCheckStatus = ', in_websiteCheckStatus, '
											ORDER BY websiteRecommendDateTime DESC
											LIMIT ', (in_pageNo - 1) * in_pageSize, ',', in_pageSize);
		PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findWebsitesByAttrId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findWebsitesByAttrId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findWebsitesByAttrId`(IN `in_attrId` int, IN `in_pageNo` int, IN `in_pageSize` int)
    SQL SECURITY INVOKER
BEGIN
		SET @sql = CONCAT('SELECT Website.websiteId,
														  websiteDomain,
														  websiteName,
														  websiteBriefIntro,
														  websiteDetailedIntro,
														  websiteOwner,
														  websiteEstablishYear,
														  websiteEstablishMonth,
														  websiteEstablishDay,
														  catId,
													  	AVG(commentStar) AS websiteStar
											FROM Website LEFT JOIN Comment
											ON Website.websiteId = Comment.websiteId,
																						 Website_Attr
											WHERE Website.websiteId = Website_Attr.websiteId
												AND Website_Attr.attrId = ', in_attrId, '
											GROUP BY Website.websiteId
											ORDER BY websiteStar DESC
											LIMIT ', (in_pageNo - 1) * in_pageSize, ',', in_pageSize);
		PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findWebsitesByCatId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findWebsitesByCatId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findWebsitesByCatId`(IN `in_catId` smallint, IN `in_pageNo` int, IN `in_pageSize` int)
    SQL SECURITY INVOKER
BEGIN
		SET @sql = CONCAT('SELECT Website.websiteId,
														  websiteDomain,
														  websiteName,
														  websiteBriefIntro,
														  websiteDetailedIntro,
														  websiteOwner,
														  websiteEstablishYear,
														  websiteEstablishMonth,
														  websiteEstablishDay,
														  catId,
														  AVG(commentStar) AS websiteStar
											FROM Website LEFT JOIN Comment
											ON Website.websiteId = Comment.websiteId
											WHERE catId = ', in_catId, '
											GROUP BY Website.websiteId
											ORDER BY websiteStar DESC
											LIMIT ', (in_pageNo - 1) * in_pageSize, ',', in_pageSize);
		PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findWebsitesByKeywords
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findWebsitesByKeywords`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findWebsitesByKeywords`(IN `in_keywords` varchar(255), IN `in_pageNo` int, IN `in_pageSize` int)
    SQL SECURITY INVOKER
BEGIN
		/* 声明变量 */
		/* 星数的重要性分值为1~7之间 */
		DECLARE websiteNameImport FLOAT DEFAULT 10;  /* 网站名的重要性分值 */
		DECLARE websiteDomainImport FLOAT DEFAULT 10;  /* 网站域的名重要性分值 */
		DECLARE websiteAttrImport FLOAT DEFAULT 10;  /* 单个网站属性的重要性分值 */
		DECLARE websiteBriefIntroImport FLOAT DEFAULT 5;  /* 网站简介的重要性分值 */

		DECLARE keywords VARCHAR(255) DEFAULT TRIM(in_keywords);  /* 关键词的集合 */
		DECLARE keyword VARCHAR(255) DEFAULT "";  /* 单个关键词 */
		DECLARE split VARCHAR(1) DEFAULT " ";  /* 分割符 */
		DECLARE pageSize INT DEFAULT 10;
		DECLARE standardAttrName VARCHAR(255);  /* 标准属性名 */
		DECLARE count long;
		DECLARE curOver TINYINT DEFAULT 1;  /* 游标结束标志位，初始值为1 */
		/* 游标：定位关键词临时表的关键词 */
		DECLARE cur_keyword CURSOR FOR SELECT T_Keyword.keyword FROM T_Keyword;
		/* 游标读完后，结束标志位设置为0 */
		DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET curOver = NULL;
		

	
		/* 如果存在临时表，则删除 */
	  DROP TABLE IF EXISTS T_Keyword;  /* 删除网站临时表 */
		DROP TABLE IF EXISTS T_Website;  /* 删除关键词临时表 */


  	/* 创建关键词临时表 */
		CREATE TEMPORARY TABLE T_Keyword(
				t_PK INT PRIMARY KEY AUTO_INCREMENT,
				keyword VARCHAR(255)
		);

		/* 创建网站编号临时表 */
		CREATE TEMPORARY TABLE T_Website(
				t_PK INT PRIMARY KEY AUTO_INCREMENT,
				websiteId INT,
				websiteStar FLOAT DEFAULT 0,
				websiteImport FLOAT
		);
		

		/* 分解关键词，并存入关键词临时表 */
		WHILE CHAR_LENGTH(keywords) != 0 DO 
				SELECT SUBSTRING_INDEX(keywords,split,1) INTO keyword;  /* 返回一个关键词 */
				INSERT INTO T_Keyword(keyword) VALUES(keyword);  /* 存入关键词临时表 */
				SET keywords = SUBSTRING(keywords, CHAR_LENGTH(keyword) + 1);  /* 截取剩下的关键词的集合 */
				SET keywords = LTRIM(keywords);  /* 去除前导空白 */
		END WHILE;

		
		
		OPEN cur_keyword;  /* 打开游标 */
		FETCH cur_keyword INTO keyword;  /* 游标向下走一步 */
		/* 根据每个关键词查询网站 */
		WHILE curOver IS NOT NULL DO


				/* 根据关键词搜索网站名 */
				INSERT INTO T_Website(
													websiteId,
													websiteImport
				)
				SELECT websiteId,
							 websiteNameImport
				FROM Website
				WHERE websiteName LIKE CONCAT('%', keyword, '%')
					 OR keyword LIKE CONCAT('%', websiteName, '%');


				/* 根据关键词搜索域名 */
				INSERT INTO T_Website(
													websiteId,
													websiteImport
				)
				SELECT websiteId,
							 websiteDomainImport
				FROM Website
				WHERE websiteDomain LIKE CONCAT('%', keyword, '%')
					 OR keyword LIKE CONCAT('%', websiteDomain, '%');


				/* 根据关键词搜索属性名、属性近义词名 */
				INSERT INTO T_Website(
													websiteId,
													websiteImport
				)
				SELECT Website.websiteId,
							 websiteAttrImport
				FROM Website,
						 Website_Attr
				WHERE Website.websiteId = Website_Attr.websiteId 
					AND Website_Attr.attrId IN(
																SELECT attrId 
																FROM Attr
																WHERE attrName LIKE CONCAT('%', keyword, '%') 
																	 OR keyword LIKE CONCAT('%', attrName, '%') 
																	 OR attrId IN(
																						SELECT Attr.attrId 
																						FROM Attr,
																								 AttrSynonym 
																						WHERE Attr.attrId = AttrSynonym.attrId 
																							AND (attrSynonymName LIKE CONCAT('%', keyword, '%') OR keyword LIKE CONCAT('%', attrSynonymName, '%'))
																	 )
					);


				/* 根据关键词搜索网站简介 */
				INSERT INTO T_Website(
													websiteId,
													websiteImport
				)
				SELECT websiteId,
							 websiteBriefIntroImport
				FROM Website
				WHERE (websiteBriefIntro LIKE CONCAT('%', keyword, '%'))
					 OR (keyword LIKE CONCAT('%', websiteBriefIntro, '%') AND websiteBriefIntro != NULL);


				FETCH cur_keyword INTO keyword;  /* 游标向下走一步 */
		END WHILE;

		CLOSE cur_keyword;  /* 关闭游标 */


		/* 更新网站的星数 */
		UPDATE T_Website
		SET T_Website.websiteStar = (SELECT AVG(Comment.commentStar) FROM Website, Comment WHERE Website.websiteId = Comment.websiteId AND Website.websiteId = T_Website.websiteId)
		WHERE websiteId IN(SELECT websiteId FROM Comment GROUP BY websiteId);

	
		/* 获取符合条件的网站 */
		SET @sql = CONCAT('SELECT T_Website.websiteId,
					                    websiteDomain,
															websiteName,
															websiteBriefIntro,
															websiteDetailedIntro,
														  websiteOwner,
															websiteEstablishYear,
															websiteEstablishMonth,
															websiteEstablishDay,
															catId,
															T_Website.websiteStar,
															SUM(websiteImport) + T_Website.websiteStar AS websiteImport
											 FROM Website,
														T_Website
											 WHERE Website.websiteId = T_Website.websiteId
											 GROUP BY T_Website.websiteId
											 ORDER BY websiteImport DESC, websiteStar DESC
											 LIMIT ', (in_pageNo - 1) * in_pageSize, ',', in_pageSize);
		PREPARE stmt FROM @sql;
    EXECUTE stmt;


		/* 删除临时表 */
	  DROP TABLE IF EXISTS T_Keyword;  /* 删除网站临时表 */
		DROP TABLE IF EXISTS T_Website;  /* 删除关键词临时表 */
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_findWebsitesBySearchCondition
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_findWebsitesBySearchCondition`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_findWebsitesBySearchCondition`(IN `in_websiteNameKeyword` varchar(255),IN `in_websiteDomainKeyword` varchar(255),IN `in_websiteIdStart` int,IN `in_websiteIdEnd` int,IN `in_catId` smallint, IN `in_attrIds` varchar(255), IN `in_adminId` smallint,IN `in_addWebsiteDateStart` date,IN `in_addWebsiteDateEnd` date)
    SQL SECURITY INVOKER
BEGIN

		/* 声明变量	*/
		DECLARE attrIds VARCHAR(255) DEFAULT LTRIM(in_attrIds);  /* 属性编号集合 */
		DECLARE attrId INT;  /* 单个属性编号 */
		DECLARE split VARCHAR(1) DEFAULT " ";  /* 分割符 */


		/* 如果存在临时表，则删除 */
		DROP TABLE IF EXISTS T_Website;
		DROP TABLE IF EXISTS T_AttrId;


		/* 创建属性编号临时表 */
		CREATE TEMPORARY TABLE IF NOT EXISTS T_AttrId(
				t_PK INT PRIMARY KEY AUTO_INCREMENT,
				attrId INT 
		);


		/* 创建网站临时表 */
		CREATE TEMPORARY TABLE IF NOT EXISTS T_Website(
				t_PK INT PRIMARY KEY AUTO_INCREMENT,
				websiteId INT,
			  websiteDomain VARCHAR(255),
				websiteName VARCHAR(255),
				websiteBriefIntro VARCHAR(255),
				websiteDetailedIntro TEXT,
				websiteOwner VARCHAR(255),
				websiteEstablishYear SMALLINT,
        websiteEstablishMonth TINYINT,
        websiteEstablishDay TINYINT,
				catId SMALLINT,
				websiteStar FLOAT,
				flag TINYINT DEFAULT 1
		);
		

		/* 分解属性编号集合，并存入属性编号临时表 */
		WHILE CHAR_LENGTH(attrIds) != 0 DO 
				SELECT SUBSTRING_INDEX(attrIds,split,1) INTO attrId;  /* 返回一个关键词 */
				INSERT INTO T_AttrId(attrId) VALUES(attrId);  /* 存入属性编号临时表 */
				SET attrIds = SUBSTRING(attrId, CHAR_LENGTH(CAST(attrId AS CHAR)) + 1);  /* 截取剩下的属性编号集合 */
				SET attrIds = LTRIM(attrIds);  /* 去除前导空白 */
		END WHILE;


		/* 获取全部网站编号并存入网站编号临时表中 */
		INSERT INTO T_Website(websiteId)
		SELECT Website.websiteId
		FROM Website
		WHERE websiteId BETWEEN in_websiteIdStart AND in_websiteIdEnd;


		/* 如果网站名不为空，则所有不符合条件的网站的标志位变为0 */
	  IF(in_websiteNameKeyword != "") THEN	
				UPDATE T_Website
				SET flag = 0
				WHERE T_Website.websiteId NOT IN(
																			SELECT Website.websiteId 
																			FROM Website
																			WHERE websiteName LIKE CONCAT('%', in_websiteNameKeyword, '%')
				);
		END IF;

	/* 如果网站域名不为空，则所有不符合条件的网站的标志位变为0 */
	  IF(in_websiteDomainKeyword != "") THEN	
				UPDATE T_Website
				SET flag = 0
				WHERE T_Website.websiteId NOT IN(
																			SELECT Website.websiteId 
																			FROM Website
																			WHERE websiteDomain LIKE CONCAT('%', in_websiteDomainKeyword, '%')
				);
		END IF;


		/* 如果网站分类不为空，则所有不符合条件的网站的标志位变为0 */
	  IF(in_catId != 0) THEN	
				UPDATE T_Website
				SET flag = 0
				WHERE T_Website.websiteId NOT IN(
																			SELECT Website.websiteId 
																			FROM Website
																			WHERE catId = in_catId 
				);
		END IF;


		/* 如果添加网站的管理员编号不为空，则所有不符合条件的网站的标志位变为0 */
	  IF(in_adminId != 0) THEN	
				UPDATE T_Website
				SET flag = 0
				WHERE T_Website.websiteId NOT IN(
																			SELECT Website.websiteId 
																			FROM Website, AdminAct_addWebsite 
																			WHERE Website.websiteId = AdminAct_addWebsite.websiteId 
																			AND AdminAct_addWebsite.adminId = in_adminId
				);
		END IF;

		
		/* 如果网站属性不为空，则所有不符合条件的网站的标志位变为0 */
		IF(SELECT COUNT(t_PK) FROM T_AttrId) THEN	
				UPDATE T_Website
				SET flag = 0
				WHERE T_Website.websiteId NOT IN(
																					SELECT Website.websiteId
																					FROM Website,
																							 Attr,
																							 Website_Attr
																					WHERE Website.websiteId = Website_Attr.websiteId
																					AND Website_Attr.attrId = (SELECT T_AttrId.attrId FROM T_AttrId)
				);
		END IF;
	

		/* 如果添加网站的日期范围不为空（默认为1970年1月1日到当前日期），则所有不符合条件的网站的标志位变为0 */
		IF(!(in_addWebsiteDateStart = '1970-01-01' AND in_addWebsiteDateEnd = CAST(NOW() AS DATE))) THEN	
				UPDATE T_Website
				SET flag = 0
				WHERE T_Website.websiteId NOT IN(
																			SELECT Website.websiteId
																			FROM Website,
																					 AdminAct_addWebsite
																			WHERE Website.websiteId = AdminAct_addWebsite.websiteId
																			AND AdminAct_addWebsite.websiteAddDateTime BETWEEN in_addWebsiteDateStart AND in_addWebsiteDateEnd
				);
		END IF;


		/* 填充网站临时表中，所有符合条件（标志位为1）的网站的数据 */
		UPDATE T_Website, Website
		SET T_Website.websiteDomain = Website.websiteDomain,
				T_Website.websiteName = Website.websiteName,
				T_Website.websiteBriefIntro = Website.websiteBriefIntro,
				T_Website.websiteDetailedIntro = Website.websiteDetailedIntro,
				T_Website.websiteOwner = Website.websiteOwner,
				T_Website.websiteEstablishYear = Website.websiteEstablishYear,
        T_Website.websiteEstablishMonth = Website.websiteEstablishMonth,
        T_Website.websiteEstablishDay = Website.websiteEstablishDay,
				T_Website.catId = Website.catId,
				T_Website.websiteStar = (SELECT AVG(Comment.commentStar) FROM Website, Comment WHERE Website.websiteId = Comment.websiteId AND Website.websiteId = T_Website.websiteId)
		WHERE T_Website.websiteId = Website.websiteId
			AND flag = 1;


		/* 获取符合条件的网站 */
		SELECT T_Website.websiteId,
					 websiteDomain,
					 websiteName,
					 websiteBriefIntro,
					 websiteDetailedIntro,
					 websiteOwner,
					 websiteEstablishYear,
           websiteEstablishMonth,
           websiteEstablishDay,
					 T_Website.catId,
					 websiteStar
		FROM T_Website LEFT JOIN Cat ON T_Website.catId = Cat.catId
		WHERE flag = 1
		ORDER BY T_Website.websiteId;
		
	
		/* 删除临时表 */
		DROP TABLE IF EXISTS T_Website;
		DROP TABLE IF EXISTS T_AttrId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_modifyAttrIntroByAttrId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_modifyAttrIntroByAttrId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_modifyAttrIntroByAttrId`(IN `in_attrId` int,IN `in_attrIntro` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		UPDATE Attr		
		SET attrIntro = in_attrIntro
		WHERE attrId = in_attrId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_modifyAttrNameByAttrId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_modifyAttrNameByAttrId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_modifyAttrNameByAttrId`(IN `in_attrId` int, IN `in_attrName` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		UPDATE Attr 
		SET attrName = in_attrName
		WHERE attrId = in_attrId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_modifyAttrSynonymByAttrSynonymId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_modifyAttrSynonymByAttrSynonymId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_modifyAttrSynonymByAttrSynonymId`(IN `in_attrSynonymId` int,IN `in_attrSynonymName` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		UPDATE AttrSynonym
		SET attrSynonymName = in_attrSynonymName
		WHERE attrSynonymId = in_attrSynonymId;

		/* 获取受影响的行数 */
		SELECT ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_modifyCommentByCommentId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_modifyCommentByCommentId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_modifyCommentByCommentId`(IN `in_commentId` int,IN `in_commentStar` tinyint,IN `in_commentContent` text)
    SQL SECURITY INVOKER
BEGIN
		UPDATE Comment
		SET commentStar = in_commentStar,
				commentContent = in_commentContent,
				commentLastEditDateTime = NOW()
		WHERE commentId = in_commentId;

		/* 获取受影响的行数 */
		SELECT ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_modifyUserDataByUserId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_modifyUserDataByUserId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_modifyUserDataByUserId`(IN `in_userId` int,IN `in_userPersonalIntro` varchar(255),IN `in_userSex` tinyint,IN `in_userBirthday` date,IN `in_areaId` smallint)
    SQL SECURITY INVOKER
BEGIN
		UPDATE User
		SET userPersonalIntro = in_userPersonalIntro,
			  userSex = in_userSex,
			  userBirthday = in_userBirthday,
				areaId = in_areaId
		WHERE userId = in_userId;

		/* 获取受影响的行数 */
		SELECT ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_modifyUserFaceFlagByUserId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_modifyUserFaceFlagByUserId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_modifyUserFaceFlagByUserId`(IN `in_userId` int, IN `in_userFaceFlag` tinyint)
    SQL SECURITY INVOKER
BEGIN
		UPDATE user
		SET userFaceFlag = in_userFaceFlag
		WHERE userId = in_userId;
		
		SELECT ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_modifyUserPassByUserId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_modifyUserPassByUserId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_modifyUserPassByUserId`(IN `in_userId` int,IN `in_userPass` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		UPDATE User
		SET userPass = in_userPass
		WHERE userId = in_userId;

		SELECT ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_modifyUserPassResetValidStatusByUserId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_modifyUserPassResetValidStatusByUserId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_modifyUserPassResetValidStatusByUserId`(IN `in_userId` int)
    SQL SECURITY INVOKER
BEGIN
		UPDATE User_PassReset
		SET validStatus = 0
		WHERE userId = in_userId
			AND validStatus != 0;

		SELECT ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_modifyWebsiteByWebsiteId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_modifyWebsiteByWebsiteId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_modifyWebsiteByWebsiteId`(IN `in_websiteId` int,IN `in_websiteName` varchar(255),IN `in_websiteDomain` varchar(255),IN `in_websiteBriefIntro` varchar(255),IN `in_websiteDetailedIntro` text,IN `in_websiteOwner` varchar(255),IN `in_websiteEstablishYear` smallint,IN `in_websiteEstablishMonth` tinyint,IN `in_websiteEstablishDay` tinyint,IN `in_catId` smallint)
    SQL SECURITY INVOKER
BEGIN
		UPDATE Website 
		SET websiteName = in_websiteName,
			  websiteDomain = in_websiteDomain,
				websiteBriefIntro = in_websiteBriefIntro,
				websiteDetailedIntro = in_websiteDetailedIntro,
				websiteOwner = in_websiteOwner,
				websiteEstablishYear = in_websiteEstablishYear,
        websiteEstablishMonth = in_websiteEstablishMonth,
        websiteEstablishDay = in_websiteEstablishDay,
				catId = in_catId
		WHERE websiteId = in_websiteId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_modifyWebsiteRecommendCheckStatusByWebsiteId
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_modifyWebsiteRecommendCheckStatusByWebsiteId`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `proc_modifyWebsiteRecommendCheckStatusByWebsiteId`(IN `in_websiteId` int,IN `in_adminId` smallint,IN `in_websiteCheckStatus` tinyint,IN `in_websiteCheckFailReason` varchar(255))
    SQL SECURITY INVOKER
BEGIN
		UPDATE Website_Recommend
		SET adminId = in_adminId,
		    websiteCheckStatus = in_websiteCheckStatus,
				websiteCheckFailReason = in_websiteCheckFailReason
		WHERE websiteId = in_websiteId;

		SELECT ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test
-- ----------------------------
DROP PROCEDURE IF EXISTS `test`;
DELIMITER ;;
CREATE DEFINER=`webstar365`@`%` PROCEDURE `test`(IN `in_keyword` varchar(255))
    SQL SECURITY INVOKER
BEGIN
																SELECT attrId 
																FROM attr
																WHERE in_keyword LIKE CONCAT('%', attrName, '%');
		SELECT websiteName
				FROM Website,
						 Website_Attr
				WHERE Website.websiteId = Website_Attr.websiteId 
					AND Website_Attr.attrId IN(
																SELECT attrId 
																FROM Attr
																WHERE in_keyword LIKE CONCAT('%', attrName, '%')
	
					);
END
;;
DELIMITER ;
