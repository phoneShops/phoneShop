/*
Navicat MySQL Data Transfer

Source Server         : aliyun
Source Server Version : 50718
Source Host           : 120.79.43.33:6033
Source Database       : eason_phone

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-05-18 18:15:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cid` int(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `uid` int(20) DEFAULT NULL,
  `pid` int(20) DEFAULT NULL,
  `count` int(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `cid` int(11) DEFAULT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `pv_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '北京市', '1');
INSERT INTO `city` VALUES ('2', '天津市', '2');
INSERT INTO `city` VALUES ('3', '上海市', '3');
INSERT INTO `city` VALUES ('4', '重庆市', '4');
INSERT INTO `city` VALUES ('5', '石家庄市', '5');
INSERT INTO `city` VALUES ('6', '唐山市', '5');
INSERT INTO `city` VALUES ('7', '秦皇岛市', '5');
INSERT INTO `city` VALUES ('8', '邯郸市', '5');
INSERT INTO `city` VALUES ('9', '邢台市', '5');
INSERT INTO `city` VALUES ('10', '保定市', '5');
INSERT INTO `city` VALUES ('11', '张家口市', '5');
INSERT INTO `city` VALUES ('12', '承德市', '5');
INSERT INTO `city` VALUES ('13', '沧州市', '5');
INSERT INTO `city` VALUES ('14', '廊坊市', '5');
INSERT INTO `city` VALUES ('15', '衡水市', '5');
INSERT INTO `city` VALUES ('16', '太原市', '6');
INSERT INTO `city` VALUES ('17', '大同市', '6');
INSERT INTO `city` VALUES ('18', '阳泉市', '6');
INSERT INTO `city` VALUES ('19', '长治市', '6');
INSERT INTO `city` VALUES ('20', '晋城市', '6');
INSERT INTO `city` VALUES ('21', '朔州市', '6');
INSERT INTO `city` VALUES ('22', '晋中市', '6');
INSERT INTO `city` VALUES ('23', '运城市', '6');
INSERT INTO `city` VALUES ('24', '忻州市', '6');
INSERT INTO `city` VALUES ('25', '临汾市', '6');
INSERT INTO `city` VALUES ('26', '吕梁市', '6');
INSERT INTO `city` VALUES ('27', '台北市', '7');
INSERT INTO `city` VALUES ('28', '高雄市', '7');
INSERT INTO `city` VALUES ('29', '基隆市', '7');
INSERT INTO `city` VALUES ('30', '台中市', '7');
INSERT INTO `city` VALUES ('31', '台南市', '7');
INSERT INTO `city` VALUES ('32', '新竹市', '7');
INSERT INTO `city` VALUES ('33', '嘉义市', '7');
INSERT INTO `city` VALUES ('34', '台北县', '7');
INSERT INTO `city` VALUES ('35', '宜兰县', '7');
INSERT INTO `city` VALUES ('36', '桃园县', '7');
INSERT INTO `city` VALUES ('37', '新竹县', '7');
INSERT INTO `city` VALUES ('38', '苗栗县', '7');
INSERT INTO `city` VALUES ('39', '台中县', '7');
INSERT INTO `city` VALUES ('40', '彰化县', '7');
INSERT INTO `city` VALUES ('41', '南投县', '7');
INSERT INTO `city` VALUES ('42', '云林县', '7');
INSERT INTO `city` VALUES ('43', '嘉义县', '7');
INSERT INTO `city` VALUES ('44', '台南县', '7');
INSERT INTO `city` VALUES ('45', '高雄县', '7');
INSERT INTO `city` VALUES ('46', '屏东县', '7');
INSERT INTO `city` VALUES ('47', '澎湖县', '7');
INSERT INTO `city` VALUES ('48', '台东县', '7');
INSERT INTO `city` VALUES ('49', '花莲县', '7');
INSERT INTO `city` VALUES ('50', '沈阳市', '8');
INSERT INTO `city` VALUES ('51', '大连市', '8');
INSERT INTO `city` VALUES ('52', '鞍山市', '8');
INSERT INTO `city` VALUES ('53', '抚顺市', '8');
INSERT INTO `city` VALUES ('54', '本溪市', '8');
INSERT INTO `city` VALUES ('55', '丹东市', '8');
INSERT INTO `city` VALUES ('56', '锦州市', '8');
INSERT INTO `city` VALUES ('57', '营口市', '8');
INSERT INTO `city` VALUES ('58', '阜新市', '8');
INSERT INTO `city` VALUES ('59', '辽阳市', '8');
INSERT INTO `city` VALUES ('60', '盘锦市', '8');
INSERT INTO `city` VALUES ('61', '铁岭市', '8');
INSERT INTO `city` VALUES ('62', '朝阳市', '8');
INSERT INTO `city` VALUES ('63', '葫芦岛市', '8');
INSERT INTO `city` VALUES ('64', '长春市', '9');
INSERT INTO `city` VALUES ('65', '吉林市', '9');
INSERT INTO `city` VALUES ('66', '四平市', '9');
INSERT INTO `city` VALUES ('67', '辽源市', '9');
INSERT INTO `city` VALUES ('68', '通化市', '9');
INSERT INTO `city` VALUES ('69', '白山市', '9');
INSERT INTO `city` VALUES ('70', '松原市', '9');
INSERT INTO `city` VALUES ('71', '白城市', '9');
INSERT INTO `city` VALUES ('72', '延边朝鲜族自治州', '9');
INSERT INTO `city` VALUES ('73', '哈尔滨市', '10');
INSERT INTO `city` VALUES ('74', '齐齐哈尔市', '10');
INSERT INTO `city` VALUES ('75', '鹤 岗 市', '10');
INSERT INTO `city` VALUES ('76', '双鸭山市', '10');
INSERT INTO `city` VALUES ('77', '鸡 西 市', '10');
INSERT INTO `city` VALUES ('78', '大 庆 市', '10');
INSERT INTO `city` VALUES ('79', '伊 春 市', '10');
INSERT INTO `city` VALUES ('80', '牡丹江市', '10');
INSERT INTO `city` VALUES ('81', '佳木斯市', '10');
INSERT INTO `city` VALUES ('82', '七台河市', '10');
INSERT INTO `city` VALUES ('83', '黑 河 市', '10');
INSERT INTO `city` VALUES ('84', '绥 化 市', '10');
INSERT INTO `city` VALUES ('85', '大兴安岭地区', '10');
INSERT INTO `city` VALUES ('86', '南京市', '11');
INSERT INTO `city` VALUES ('87', '无锡市', '11');
INSERT INTO `city` VALUES ('88', '徐州市', '11');
INSERT INTO `city` VALUES ('89', '常州市', '11');
INSERT INTO `city` VALUES ('90', '苏州市', '11');
INSERT INTO `city` VALUES ('91', '南通市', '11');
INSERT INTO `city` VALUES ('92', '连云港市', '11');
INSERT INTO `city` VALUES ('93', '淮安市', '11');
INSERT INTO `city` VALUES ('94', '盐城市', '11');
INSERT INTO `city` VALUES ('95', '扬州市', '11');
INSERT INTO `city` VALUES ('96', '镇江市', '11');
INSERT INTO `city` VALUES ('97', '泰州市', '11');
INSERT INTO `city` VALUES ('98', '宿迁市', '11');
INSERT INTO `city` VALUES ('99', '杭州市', '12');
INSERT INTO `city` VALUES ('100', '宁波市', '12');
INSERT INTO `city` VALUES ('101', '温州市', '12');
INSERT INTO `city` VALUES ('102', '嘉兴市', '12');
INSERT INTO `city` VALUES ('103', '湖州市', '12');
INSERT INTO `city` VALUES ('104', '绍兴市', '12');
INSERT INTO `city` VALUES ('105', '金华市', '12');
INSERT INTO `city` VALUES ('106', '衢州市', '12');
INSERT INTO `city` VALUES ('107', '舟山市', '12');
INSERT INTO `city` VALUES ('108', '台州市', '12');
INSERT INTO `city` VALUES ('109', '丽水市', '12');
INSERT INTO `city` VALUES ('110', '合肥市', '13');
INSERT INTO `city` VALUES ('111', '芜湖市', '13');
INSERT INTO `city` VALUES ('112', '蚌埠市', '13');
INSERT INTO `city` VALUES ('113', '淮南市', '13');
INSERT INTO `city` VALUES ('114', '马鞍山市', '13');
INSERT INTO `city` VALUES ('115', '淮北市', '13');
INSERT INTO `city` VALUES ('116', '铜陵市', '13');
INSERT INTO `city` VALUES ('117', '安庆市', '13');
INSERT INTO `city` VALUES ('118', '黄山市', '13');
INSERT INTO `city` VALUES ('119', '滁州市', '13');
INSERT INTO `city` VALUES ('120', '阜阳市', '13');
INSERT INTO `city` VALUES ('121', '宿州市', '13');
INSERT INTO `city` VALUES ('122', '巢湖市', '13');
INSERT INTO `city` VALUES ('123', '六安市', '13');
INSERT INTO `city` VALUES ('124', '亳州市', '13');
INSERT INTO `city` VALUES ('125', '池州市', '13');
INSERT INTO `city` VALUES ('126', '宣城市', '13');
INSERT INTO `city` VALUES ('127', '福州市', '14');
INSERT INTO `city` VALUES ('128', '厦门市', '14');
INSERT INTO `city` VALUES ('129', '莆田市', '14');
INSERT INTO `city` VALUES ('130', '三明市', '14');
INSERT INTO `city` VALUES ('131', '泉州市', '14');
INSERT INTO `city` VALUES ('132', '漳州市', '14');
INSERT INTO `city` VALUES ('133', '南平市', '14');
INSERT INTO `city` VALUES ('134', '龙岩市', '14');
INSERT INTO `city` VALUES ('135', '宁德市', '14');
INSERT INTO `city` VALUES ('136', '南昌市', '15');
INSERT INTO `city` VALUES ('137', '景德镇市', '15');
INSERT INTO `city` VALUES ('138', '萍乡市', '15');
INSERT INTO `city` VALUES ('139', '九江市', '15');
INSERT INTO `city` VALUES ('140', '新余市', '15');
INSERT INTO `city` VALUES ('141', '鹰潭市', '15');
INSERT INTO `city` VALUES ('142', '赣州市', '15');
INSERT INTO `city` VALUES ('143', '吉安市', '15');
INSERT INTO `city` VALUES ('144', '宜春市', '15');
INSERT INTO `city` VALUES ('145', '抚州市', '15');
INSERT INTO `city` VALUES ('146', '上饶市', '15');
INSERT INTO `city` VALUES ('147', '济南市', '16');
INSERT INTO `city` VALUES ('148', '青岛市', '16');
INSERT INTO `city` VALUES ('149', '淄博市', '16');
INSERT INTO `city` VALUES ('150', '枣庄市', '16');
INSERT INTO `city` VALUES ('151', '东营市', '16');
INSERT INTO `city` VALUES ('152', '烟台市', '16');
INSERT INTO `city` VALUES ('153', '潍坊市', '16');
INSERT INTO `city` VALUES ('154', '济宁市', '16');
INSERT INTO `city` VALUES ('155', '泰安市', '16');
INSERT INTO `city` VALUES ('156', '威海市', '16');
INSERT INTO `city` VALUES ('157', '日照市', '16');
INSERT INTO `city` VALUES ('158', '莱芜市', '16');
INSERT INTO `city` VALUES ('159', '临沂市', '16');
INSERT INTO `city` VALUES ('160', '德州市', '16');
INSERT INTO `city` VALUES ('161', '聊城市', '16');
INSERT INTO `city` VALUES ('162', '滨州市', '16');
INSERT INTO `city` VALUES ('163', '菏泽市', '16');
INSERT INTO `city` VALUES ('164', '郑州市', '17');
INSERT INTO `city` VALUES ('165', '开封市', '17');
INSERT INTO `city` VALUES ('166', '洛阳市', '17');
INSERT INTO `city` VALUES ('167', '平顶山市', '17');
INSERT INTO `city` VALUES ('168', '安阳市', '17');
INSERT INTO `city` VALUES ('169', '鹤壁市', '17');
INSERT INTO `city` VALUES ('170', '新乡市', '17');
INSERT INTO `city` VALUES ('171', '焦作市', '17');
INSERT INTO `city` VALUES ('172', '濮阳市', '17');
INSERT INTO `city` VALUES ('173', '许昌市', '17');
INSERT INTO `city` VALUES ('174', '漯河市', '17');
INSERT INTO `city` VALUES ('175', '三门峡市', '17');
INSERT INTO `city` VALUES ('176', '南阳市', '17');
INSERT INTO `city` VALUES ('177', '商丘市', '17');
INSERT INTO `city` VALUES ('178', '信阳市', '17');
INSERT INTO `city` VALUES ('179', '周口市', '17');
INSERT INTO `city` VALUES ('180', '驻马店市', '17');
INSERT INTO `city` VALUES ('181', '济源市', '17');
INSERT INTO `city` VALUES ('182', '武汉市', '18');
INSERT INTO `city` VALUES ('183', '黄石市', '18');
INSERT INTO `city` VALUES ('184', '十堰市', '18');
INSERT INTO `city` VALUES ('185', '荆州市', '18');
INSERT INTO `city` VALUES ('186', '宜昌市', '18');
INSERT INTO `city` VALUES ('187', '襄樊市', '18');
INSERT INTO `city` VALUES ('188', '鄂州市', '18');
INSERT INTO `city` VALUES ('189', '荆门市', '18');
INSERT INTO `city` VALUES ('190', '孝感市', '18');
INSERT INTO `city` VALUES ('191', '黄冈市', '18');
INSERT INTO `city` VALUES ('192', '咸宁市', '18');
INSERT INTO `city` VALUES ('193', '随州市', '18');
INSERT INTO `city` VALUES ('194', '仙桃市', '18');
INSERT INTO `city` VALUES ('195', '天门市', '18');
INSERT INTO `city` VALUES ('196', '潜江市', '18');
INSERT INTO `city` VALUES ('197', '神农架林区', '18');
INSERT INTO `city` VALUES ('198', '恩施土家族苗族自治州', '18');
INSERT INTO `city` VALUES ('199', '长沙市', '19');
INSERT INTO `city` VALUES ('200', '株洲市', '19');
INSERT INTO `city` VALUES ('201', '湘潭市', '19');
INSERT INTO `city` VALUES ('202', '衡阳市', '19');
INSERT INTO `city` VALUES ('203', '邵阳市', '19');
INSERT INTO `city` VALUES ('204', '岳阳市', '19');
INSERT INTO `city` VALUES ('205', '常德市', '19');
INSERT INTO `city` VALUES ('206', '张家界市', '19');
INSERT INTO `city` VALUES ('207', '益阳市', '19');
INSERT INTO `city` VALUES ('208', '郴州市', '19');
INSERT INTO `city` VALUES ('209', '永州市', '19');
INSERT INTO `city` VALUES ('210', '怀化市', '19');
INSERT INTO `city` VALUES ('211', '娄底市', '19');
INSERT INTO `city` VALUES ('212', '湘西土家族苗族自治州', '19');
INSERT INTO `city` VALUES ('213', '广州市', '20');
INSERT INTO `city` VALUES ('214', '深圳市', '20');
INSERT INTO `city` VALUES ('215', '珠海市', '20');
INSERT INTO `city` VALUES ('216', '汕头市', '20');
INSERT INTO `city` VALUES ('217', '韶关市', '20');
INSERT INTO `city` VALUES ('218', '佛山市', '20');
INSERT INTO `city` VALUES ('219', '江门市', '20');
INSERT INTO `city` VALUES ('220', '湛江市', '20');
INSERT INTO `city` VALUES ('221', '茂名市', '20');
INSERT INTO `city` VALUES ('222', '肇庆市', '20');
INSERT INTO `city` VALUES ('223', '惠州市', '20');
INSERT INTO `city` VALUES ('224', '梅州市', '20');
INSERT INTO `city` VALUES ('225', '汕尾市', '20');
INSERT INTO `city` VALUES ('226', '河源市', '20');
INSERT INTO `city` VALUES ('227', '阳江市', '20');
INSERT INTO `city` VALUES ('228', '清远市', '20');
INSERT INTO `city` VALUES ('229', '东莞市', '20');
INSERT INTO `city` VALUES ('230', '中山市', '20');
INSERT INTO `city` VALUES ('231', '潮州市', '20');
INSERT INTO `city` VALUES ('232', '揭阳市', '20');
INSERT INTO `city` VALUES ('233', '云浮市', '20');
INSERT INTO `city` VALUES ('234', '兰州市', '21');
INSERT INTO `city` VALUES ('235', '金昌市', '21');
INSERT INTO `city` VALUES ('236', '白银市', '21');
INSERT INTO `city` VALUES ('237', '天水市', '21');
INSERT INTO `city` VALUES ('238', '嘉峪关市', '21');
INSERT INTO `city` VALUES ('239', '武威市', '21');
INSERT INTO `city` VALUES ('240', '张掖市', '21');
INSERT INTO `city` VALUES ('241', '平凉市', '21');
INSERT INTO `city` VALUES ('242', '酒泉市', '21');
INSERT INTO `city` VALUES ('243', '庆阳市', '21');
INSERT INTO `city` VALUES ('244', '定西市', '21');
INSERT INTO `city` VALUES ('245', '陇南市', '21');
INSERT INTO `city` VALUES ('246', '临夏回族自治州', '21');
INSERT INTO `city` VALUES ('247', '甘南藏族自治州', '21');
INSERT INTO `city` VALUES ('248', '成都市', '22');
INSERT INTO `city` VALUES ('249', '自贡市', '22');
INSERT INTO `city` VALUES ('250', '攀枝花市', '22');
INSERT INTO `city` VALUES ('251', '泸州市', '22');
INSERT INTO `city` VALUES ('252', '德阳市', '22');
INSERT INTO `city` VALUES ('253', '绵阳市', '22');
INSERT INTO `city` VALUES ('254', '广元市', '22');
INSERT INTO `city` VALUES ('255', '遂宁市', '22');
INSERT INTO `city` VALUES ('256', '内江市', '22');
INSERT INTO `city` VALUES ('257', '乐山市', '22');
INSERT INTO `city` VALUES ('258', '南充市', '22');
INSERT INTO `city` VALUES ('259', '眉山市', '22');
INSERT INTO `city` VALUES ('260', '宜宾市', '22');
INSERT INTO `city` VALUES ('261', '广安市', '22');
INSERT INTO `city` VALUES ('262', '达州市', '22');
INSERT INTO `city` VALUES ('263', '雅安市', '22');
INSERT INTO `city` VALUES ('264', '巴中市', '22');
INSERT INTO `city` VALUES ('265', '资阳市', '22');
INSERT INTO `city` VALUES ('266', '阿坝藏族羌族自治州', '22');
INSERT INTO `city` VALUES ('267', '甘孜藏族自治州', '22');
INSERT INTO `city` VALUES ('268', '凉山彝族自治州', '22');
INSERT INTO `city` VALUES ('269', '贵阳市', '23');
INSERT INTO `city` VALUES ('270', '六盘水市', '23');
INSERT INTO `city` VALUES ('271', '遵义市', '23');
INSERT INTO `city` VALUES ('272', '安顺市', '23');
INSERT INTO `city` VALUES ('273', '铜仁地区', '23');
INSERT INTO `city` VALUES ('274', '毕节地区', '23');
INSERT INTO `city` VALUES ('275', '黔西南布依族苗族自治州', '23');
INSERT INTO `city` VALUES ('276', '黔东南苗族侗族自治州', '23');
INSERT INTO `city` VALUES ('277', '黔南布依族苗族自治州', '23');
INSERT INTO `city` VALUES ('278', '海口市', '24');
INSERT INTO `city` VALUES ('279', '三亚市', '24');
INSERT INTO `city` VALUES ('280', '五指山市', '24');
INSERT INTO `city` VALUES ('281', '琼海市', '24');
INSERT INTO `city` VALUES ('282', '儋州市', '24');
INSERT INTO `city` VALUES ('283', '文昌市', '24');
INSERT INTO `city` VALUES ('284', '万宁市', '24');
INSERT INTO `city` VALUES ('285', '东方市', '24');
INSERT INTO `city` VALUES ('286', '澄迈县', '24');
INSERT INTO `city` VALUES ('287', '定安县', '24');
INSERT INTO `city` VALUES ('288', '屯昌县', '24');
INSERT INTO `city` VALUES ('289', '临高县', '24');
INSERT INTO `city` VALUES ('290', '白沙黎族自治县', '24');
INSERT INTO `city` VALUES ('291', '昌江黎族自治县', '24');
INSERT INTO `city` VALUES ('292', '乐东黎族自治县', '24');
INSERT INTO `city` VALUES ('293', '陵水黎族自治县', '24');
INSERT INTO `city` VALUES ('294', '保亭黎族苗族自治县', '24');
INSERT INTO `city` VALUES ('295', '琼中黎族苗族自治县', '24');
INSERT INTO `city` VALUES ('296', '昆明市', '25');
INSERT INTO `city` VALUES ('297', '曲靖市', '25');
INSERT INTO `city` VALUES ('298', '玉溪市', '25');
INSERT INTO `city` VALUES ('299', '保山市', '25');
INSERT INTO `city` VALUES ('300', '昭通市', '25');
INSERT INTO `city` VALUES ('301', '丽江市', '25');
INSERT INTO `city` VALUES ('302', '思茅市', '25');
INSERT INTO `city` VALUES ('303', '临沧市', '25');
INSERT INTO `city` VALUES ('304', '文山壮族苗族自治州', '25');
INSERT INTO `city` VALUES ('305', '红河哈尼族彝族自治州', '25');
INSERT INTO `city` VALUES ('306', '西双版纳傣族自治州', '25');
INSERT INTO `city` VALUES ('307', '楚雄彝族自治州', '25');
INSERT INTO `city` VALUES ('308', '大理白族自治州', '25');
INSERT INTO `city` VALUES ('309', '德宏傣族景颇族自治州', '25');
INSERT INTO `city` VALUES ('310', '怒江傈傈族自治州', '25');
INSERT INTO `city` VALUES ('311', '迪庆藏族自治州', '25');
INSERT INTO `city` VALUES ('312', '西宁市', '26');
INSERT INTO `city` VALUES ('313', '海东地区', '26');
INSERT INTO `city` VALUES ('314', '海北藏族自治州', '26');
INSERT INTO `city` VALUES ('315', '黄南藏族自治州', '26');
INSERT INTO `city` VALUES ('316', '海南藏族自治州', '26');
INSERT INTO `city` VALUES ('317', '果洛藏族自治州', '26');
INSERT INTO `city` VALUES ('318', '玉树藏族自治州', '26');
INSERT INTO `city` VALUES ('319', '海西蒙古族藏族自治州', '26');
INSERT INTO `city` VALUES ('320', '西安市', '27');
INSERT INTO `city` VALUES ('321', '铜川市', '27');
INSERT INTO `city` VALUES ('322', '宝鸡市', '27');
INSERT INTO `city` VALUES ('323', '咸阳市', '27');
INSERT INTO `city` VALUES ('324', '渭南市', '27');
INSERT INTO `city` VALUES ('325', '延安市', '27');
INSERT INTO `city` VALUES ('326', '汉中市', '27');
INSERT INTO `city` VALUES ('327', '榆林市', '27');
INSERT INTO `city` VALUES ('328', '安康市', '27');
INSERT INTO `city` VALUES ('329', '商洛市', '27');
INSERT INTO `city` VALUES ('330', '南宁市', '28');
INSERT INTO `city` VALUES ('331', '柳州市', '28');
INSERT INTO `city` VALUES ('332', '桂林市', '28');
INSERT INTO `city` VALUES ('333', '梧州市', '28');
INSERT INTO `city` VALUES ('334', '北海市', '28');
INSERT INTO `city` VALUES ('335', '防城港市', '28');
INSERT INTO `city` VALUES ('336', '钦州市', '28');
INSERT INTO `city` VALUES ('337', '贵港市', '28');
INSERT INTO `city` VALUES ('338', '玉林市', '28');
INSERT INTO `city` VALUES ('339', '百色市', '28');
INSERT INTO `city` VALUES ('340', '贺州市', '28');
INSERT INTO `city` VALUES ('341', '河池市', '28');
INSERT INTO `city` VALUES ('342', '来宾市', '28');
INSERT INTO `city` VALUES ('343', '崇左市', '28');
INSERT INTO `city` VALUES ('344', '拉萨市', '29');
INSERT INTO `city` VALUES ('345', '那曲地区', '29');
INSERT INTO `city` VALUES ('346', '昌都地区', '29');
INSERT INTO `city` VALUES ('347', '山南地区', '29');
INSERT INTO `city` VALUES ('348', '日喀则地区', '29');
INSERT INTO `city` VALUES ('349', '阿里地区', '29');
INSERT INTO `city` VALUES ('350', '林芝地区', '29');
INSERT INTO `city` VALUES ('351', '银川市', '30');
INSERT INTO `city` VALUES ('352', '石嘴山市', '30');
INSERT INTO `city` VALUES ('353', '吴忠市', '30');
INSERT INTO `city` VALUES ('354', '固原市', '30');
INSERT INTO `city` VALUES ('355', '中卫市', '30');
INSERT INTO `city` VALUES ('356', '乌鲁木齐市', '31');
INSERT INTO `city` VALUES ('357', '克拉玛依市', '31');
INSERT INTO `city` VALUES ('358', '石河子市　', '31');
INSERT INTO `city` VALUES ('359', '阿拉尔市', '31');
INSERT INTO `city` VALUES ('360', '图木舒克市', '31');
INSERT INTO `city` VALUES ('361', '五家渠市', '31');
INSERT INTO `city` VALUES ('362', '吐鲁番市', '31');
INSERT INTO `city` VALUES ('363', '阿克苏市', '31');
INSERT INTO `city` VALUES ('364', '喀什市', '31');
INSERT INTO `city` VALUES ('365', '哈密市', '31');
INSERT INTO `city` VALUES ('366', '和田市', '31');
INSERT INTO `city` VALUES ('367', '阿图什市', '31');
INSERT INTO `city` VALUES ('368', '库尔勒市', '31');
INSERT INTO `city` VALUES ('369', '昌吉市　', '31');
INSERT INTO `city` VALUES ('370', '阜康市', '31');
INSERT INTO `city` VALUES ('371', '米泉市', '31');
INSERT INTO `city` VALUES ('372', '博乐市', '31');
INSERT INTO `city` VALUES ('373', '伊宁市', '31');
INSERT INTO `city` VALUES ('374', '奎屯市', '31');
INSERT INTO `city` VALUES ('375', '塔城市', '31');
INSERT INTO `city` VALUES ('376', '乌苏市', '31');
INSERT INTO `city` VALUES ('377', '阿勒泰市', '31');
INSERT INTO `city` VALUES ('378', '呼和浩特市', '32');
INSERT INTO `city` VALUES ('379', '包头市', '32');
INSERT INTO `city` VALUES ('380', '乌海市', '32');
INSERT INTO `city` VALUES ('381', '赤峰市', '32');
INSERT INTO `city` VALUES ('382', '通辽市', '32');
INSERT INTO `city` VALUES ('383', '鄂尔多斯市', '32');
INSERT INTO `city` VALUES ('384', '呼伦贝尔市', '32');
INSERT INTO `city` VALUES ('385', '巴彦淖尔市', '32');
INSERT INTO `city` VALUES ('386', '乌兰察布市', '32');
INSERT INTO `city` VALUES ('387', '锡林郭勒盟', '32');
INSERT INTO `city` VALUES ('388', '兴安盟', '32');
INSERT INTO `city` VALUES ('389', '阿拉善盟', '32');
INSERT INTO `city` VALUES ('390', '澳门特别行政区', '33');
INSERT INTO `city` VALUES ('391', '香港特别行政区', '34');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `manme` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `login_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) NOT NULL,
  `type_id` int(10) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  `describes` varchar(255) DEFAULT NULL COMMENT '产品描述',
  `detail` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `stock` int(10) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'Galaxy S8', '1', '3000.00', '5', '1', 'http://detail.zol.com.cn/1143/1142397/param.shtml', '6', '0');
INSERT INTO `product` VALUES ('2', 'Galaxy S8+', '1', '5000.00', '5', '1', '1', '9', '0');
INSERT INTO `product` VALUES ('3', 'Galaxy-S4', '1', '3500.00', '5', '1', '1', '10', '0');
INSERT INTO `product` VALUES ('38', 'bv', '1', '5555.00', '7', ' 5', null, '55', '1');
INSERT INTO `product` VALUES ('39', 'n\'n', '1', '4444.00', '4', ' 3', null, '33', '1');
INSERT INTO `product` VALUES ('40', 'm\'m', '1', '6666.00', '8', ' 6', null, '66', '1');
INSERT INTO `product` VALUES ('41', 'nb', '1', '3000.00', '8', ' 啊', null, '12', '1');

-- ----------------------------
-- Table structure for product_attr_biz
-- ----------------------------
DROP TABLE IF EXISTS `product_attr_biz`;
CREATE TABLE `product_attr_biz` (
  `pid` int(11) NOT NULL,
  `attr_code` varchar(255) NOT NULL,
  `attr_name` varchar(255) NOT NULL,
  `attr_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_attr_biz
-- ----------------------------
INSERT INTO `product_attr_biz` VALUES ('1', 'ROM', '内存大小', '64G');
INSERT INTO `product_attr_biz` VALUES ('1', 'color', '机身颜色', '黑色');
INSERT INTO `product_attr_biz` VALUES ('1', 'size', '屏幕大小', '5.5');
INSERT INTO `product_attr_biz` VALUES ('1', 'network', '网络制式', '全网通');
INSERT INTO `product_attr_biz` VALUES ('1', 'Edition', '版本类型', '国行');
INSERT INTO `product_attr_biz` VALUES ('3', 'ROM', '内存大小', '64G');
INSERT INTO `product_attr_biz` VALUES ('3', 'size', '屏幕大小', '5.5');
INSERT INTO `product_attr_biz` VALUES ('3', 'color', '机身颜色', '黑色');
INSERT INTO `product_attr_biz` VALUES ('3', 'network', '网络制式', '全网通');
INSERT INTO `product_attr_biz` VALUES ('3', 'Edition', '版本类型', '国行');
INSERT INTO `product_attr_biz` VALUES ('6', 'ROM', '内存大小', '64G');
INSERT INTO `product_attr_biz` VALUES ('6', 'color', '机身颜色', '黑色');
INSERT INTO `product_attr_biz` VALUES ('6', 'size', '屏幕大小', '5.0');
INSERT INTO `product_attr_biz` VALUES ('6', 'network', '网络制式', '全网通');
INSERT INTO `product_attr_biz` VALUES ('6', 'Edition', '版本类型', '国行');
INSERT INTO `product_attr_biz` VALUES ('38', 'ROM', '内存大小', '32');
INSERT INTO `product_attr_biz` VALUES ('40', 'ROM', '内存大小', '32');
INSERT INTO `product_attr_biz` VALUES ('40', 'color', '机身颜色', '白');
INSERT INTO `product_attr_biz` VALUES ('41', 'ROM', '内存大小', '54');
INSERT INTO `product_attr_biz` VALUES ('41', 'color', '机身颜色', '红');
INSERT INTO `product_attr_biz` VALUES ('41', 'size', '屏幕大小', '32');
INSERT INTO `product_attr_biz` VALUES ('41', 'network', '网络制式', '全网通');
INSERT INTO `product_attr_biz` VALUES ('41', 'Edition', '版本类型', '国行');

-- ----------------------------
-- Table structure for product_bh_order
-- ----------------------------
DROP TABLE IF EXISTS `product_bh_order`;
CREATE TABLE `product_bh_order` (
  `bhid` int(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `uid` int(20) NOT NULL,
  `pid` int(20) NOT NULL,
  `cout` int(20) DEFAULT NULL,
  `finish_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`bhid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_bh_order
-- ----------------------------
INSERT INTO `product_bh_order` VALUES ('10', '20180514172735034', '2', '3', '1', '2018-05-15 13:54:30', '3500.00');
INSERT INTO `product_bh_order` VALUES ('11', '20180514173227985', '2', '2', '1', '2018-05-15 13:55:17', '5000.00');
INSERT INTO `product_bh_order` VALUES ('12', '20180515135702527', '2', '3', '2', '2018-05-15 13:57:31', '7000.00');
INSERT INTO `product_bh_order` VALUES ('13', '20180515135702527', '2', '1', '2', '2018-05-15 13:57:43', '6000.00');
INSERT INTO `product_bh_order` VALUES ('14', '20180515135851717', '2', '3', '1', '2018-05-15 13:59:19', '3500.00');
INSERT INTO `product_bh_order` VALUES ('15', '20180515135937051', '2', '2', '1', '2018-05-15 14:00:05', '5000.00');
INSERT INTO `product_bh_order` VALUES ('16', '20180515163419814', '2', '3', '2', '2018-05-15 16:34:54', '7000.00');
INSERT INTO `product_bh_order` VALUES ('17', '20180515163832985', '2', '2', '2', '2018-05-15 16:39:15', '10000.00');
INSERT INTO `product_bh_order` VALUES ('18', '20180515204355464', '7', '3', '2', '2018-05-15 20:44:50', '7000.00');
INSERT INTO `product_bh_order` VALUES ('19', '20180515173019538', '2', '3', '1', '2018-05-17 08:18:16', '3500.00');
INSERT INTO `product_bh_order` VALUES ('20', '20180517081609906', '2', '6', '1', '2018-05-17 08:19:22', '4000.00');
INSERT INTO `product_bh_order` VALUES ('21', '20180515213630614', '2', '3', '4', '2018-05-17 08:50:02', '14000.00');
INSERT INTO `product_bh_order` VALUES ('22', '20180515164907540', '2', '2', '1', '2018-05-18 09:32:24', '5000.00');
INSERT INTO `product_bh_order` VALUES ('23', '20180515173019538', '2', '1', '1', '2018-05-18 09:33:39', '3000.00');

-- ----------------------------
-- Table structure for product_b_order
-- ----------------------------
DROP TABLE IF EXISTS `product_b_order`;
CREATE TABLE `product_b_order` (
  `oid` int(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `uid` int(20) NOT NULL,
  `pid` int(20) NOT NULL,
  `addressId` int(20) NOT NULL,
  `cout` int(20) NOT NULL,
  `price` double(10,2) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `order_status` int(20) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_b_order
-- ----------------------------
INSERT INTO `product_b_order` VALUES ('35', '20180516100140226', '2', '2', '1', '1', '5000.00', '2018-05-17 08:17:14', '3');
INSERT INTO `product_b_order` VALUES ('36', '20180516175336798', '2', '3', '1', '1', '3500.00', '2018-05-17 08:17:13', '3');
INSERT INTO `product_b_order` VALUES ('37', '20180516194551404', '2', '3', '1', '1', '3500.00', '2018-05-17 08:17:12', '3');
INSERT INTO `product_b_order` VALUES ('38', '20180516194551404', '2', '6', '1', '1', '4000.00', '2018-05-17 08:17:11', '3');
INSERT INTO `product_b_order` VALUES ('40', '20180517213650441', '2', '6', '1', '1', '4000.00', '2018-05-17 21:37:36', '0');
INSERT INTO `product_b_order` VALUES ('41', '20180518083725554', '11', '1', '1', '2', '6000.00', '2018-05-18 08:37:47', '0');
INSERT INTO `product_b_order` VALUES ('42', '20180518092532185', '2', '6', '1', '7', '28000.00', '2018-05-18 09:25:42', '0');
INSERT INTO `product_b_order` VALUES ('43', '20180518093958737', '11', '2', '1', '1', '5000.00', '2018-05-18 09:40:03', '0');

-- ----------------------------
-- Table structure for product_comment
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment` (
  `comid` int(20) NOT NULL AUTO_INCREMENT,
  `pid` int(20) DEFAULT NULL,
  `uid` int(20) DEFAULT NULL,
  `commentTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `commentMsg` varchar(255) NOT NULL,
  PRIMARY KEY (`comid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_comment
-- ----------------------------
INSERT INTO `product_comment` VALUES ('8', '1', '2', '2018-05-15 16:34:54', '挺好的 推荐购买！！！');
INSERT INTO `product_comment` VALUES ('9', '3', '2', '2018-05-15 16:34:54', '挺好的 推荐 推荐！！！');
INSERT INTO `product_comment` VALUES ('10', '2', '2', '2018-05-15 16:34:54', '123465');
INSERT INTO `product_comment` VALUES ('11', '3', '2', '2018-05-15 16:34:54', '好好好 ！！');
INSERT INTO `product_comment` VALUES ('12', '1', '2', '2018-05-15 16:34:54', ' 推荐购买  好好啊');
INSERT INTO `product_comment` VALUES ('13', '3', '2', '2018-05-15 16:34:54', '');
INSERT INTO `product_comment` VALUES ('14', '2', '2', '2018-05-15 20:42:01', '推荐 推荐购买，买回来已经有 几个月了，还是这么好用 挺好的');
INSERT INTO `product_comment` VALUES ('15', '3', '2', '2018-05-15 16:34:54', '挺好的  推荐');
INSERT INTO `product_comment` VALUES ('16', '2', '2', '2018-05-15 16:39:15', '推荐购买');
INSERT INTO `product_comment` VALUES ('17', '3', '7', '2018-05-15 20:44:50', '推荐购买 真的很好用 屏幕很好看 电量也很耐用');
INSERT INTO `product_comment` VALUES ('18', '3', '2', '2018-05-17 08:18:16', '不错 推荐购买！！！');
INSERT INTO `product_comment` VALUES ('19', '6', '2', '2018-05-17 08:19:22', '推荐推荐  屏幕真的很好 ！！！');
INSERT INTO `product_comment` VALUES ('20', '3', '2', '2018-05-17 08:50:02', '还行 用了一个多月了 很好用 推荐购买');
INSERT INTO `product_comment` VALUES ('21', '2', '2', '2018-05-18 09:32:24', '还行 推荐购买 ....');
INSERT INTO `product_comment` VALUES ('22', '1', '2', '2018-05-18 09:33:39', '还行 不错');

-- ----------------------------
-- Table structure for product_picture
-- ----------------------------
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE `product_picture` (
  `pr_id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `pr_address` varchar(255) DEFAULT NULL,
  `pr_status` int(10) NOT NULL,
  PRIMARY KEY (`pr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_picture
-- ----------------------------
INSERT INTO `product_picture` VALUES ('1', '1', '/sanxingS8.jpg', '0');
INSERT INTO `product_picture` VALUES ('2', '2', '/sanxingS8+.jpg', '0');
INSERT INTO `product_picture` VALUES ('3', '3', '/sanxingS4.png', '0');
INSERT INTO `product_picture` VALUES ('4', '3', '/galaxy-note-2.jpg', '1');
INSERT INTO `product_picture` VALUES ('5', '3', '/galaxy-note-3.jpg', '1');
INSERT INTO `product_picture` VALUES ('6', '3', '/galaxy-note-4.jpg', '1');
INSERT INTO `product_picture` VALUES ('7', '6', '/iphone.png', '0');
INSERT INTO `product_picture` VALUES ('8', '13', '/sanxingS6Ege.jpg', '0');

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES ('1', '三星');
INSERT INTO `product_type` VALUES ('2', '苹果');
INSERT INTO `product_type` VALUES ('3', '诺基亚');
INSERT INTO `product_type` VALUES ('4', '联想');
INSERT INTO `product_type` VALUES ('5', '谷歌');
INSERT INTO `product_type` VALUES ('6', 'LG');
INSERT INTO `product_type` VALUES ('7', 'Dell');
INSERT INTO `product_type` VALUES ('8', 'OPPO');
INSERT INTO `product_type` VALUES ('9', 'HTC');
INSERT INTO `product_type` VALUES ('10', 'SONY');
INSERT INTO `product_type` VALUES ('11', '华为');
INSERT INTO `product_type` VALUES ('12', '小米');
INSERT INTO `product_type` VALUES ('13', 'VIVO');
INSERT INTO `product_type` VALUES ('14', '一加');

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `pv_id` int(11) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '北京市');
INSERT INTO `province` VALUES ('2', '天津市');
INSERT INTO `province` VALUES ('3', '上海市');
INSERT INTO `province` VALUES ('4', '重庆市');
INSERT INTO `province` VALUES ('5', '河北省');
INSERT INTO `province` VALUES ('6', '山西省');
INSERT INTO `province` VALUES ('7', '台湾省');
INSERT INTO `province` VALUES ('8', '辽宁省');
INSERT INTO `province` VALUES ('9', '吉林省');
INSERT INTO `province` VALUES ('10', '黑龙江省');
INSERT INTO `province` VALUES ('11', '江苏省');
INSERT INTO `province` VALUES ('12', '浙江省');
INSERT INTO `province` VALUES ('13', '安徽省');
INSERT INTO `province` VALUES ('14', '福建省');
INSERT INTO `province` VALUES ('15', '江西省');
INSERT INTO `province` VALUES ('16', '山东省');
INSERT INTO `province` VALUES ('17', '河南省');
INSERT INTO `province` VALUES ('18', '湖北省');
INSERT INTO `province` VALUES ('19', '湖南省');
INSERT INTO `province` VALUES ('20', '广东省');
INSERT INTO `province` VALUES ('21', '甘肃省');
INSERT INTO `province` VALUES ('22', '四川省');
INSERT INTO `province` VALUES ('23', '贵州省');
INSERT INTO `province` VALUES ('24', '海南省');
INSERT INTO `province` VALUES ('25', '云南省');
INSERT INTO `province` VALUES ('26', '青海省');
INSERT INTO `province` VALUES ('27', '陕西省');
INSERT INTO `province` VALUES ('28', '广西壮族自治区');
INSERT INTO `province` VALUES ('29', '西藏自治区');
INSERT INTO `province` VALUES ('30', '宁夏回族自治区');
INSERT INTO `province` VALUES ('31', '新疆维吾尔自治区');
INSERT INTO `province` VALUES ('32', '内蒙古自治区');
INSERT INTO `province` VALUES ('33', '澳门特别行政区');
INSERT INTO `province` VALUES ('34', '香港特别行政区');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `card` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `reg_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `login_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'pp', 'c2078605ca67fc9a06ab290d3978d9ce', '431202199611300017', '13787019873', '2018-05-09 20:55:35', '2018-05-09 20:55:35', '19', '199', '芙蓉区 106号', '0');
INSERT INTO `user` VALUES ('2', 'pangpan', 'f379eaf3c831b04de153469d1bec345e', '431202199611300017', '13100216878', '2018-05-13 09:44:18', '2018-05-18 09:25:01', '19', '207', '开福区 104号', '0');
INSERT INTO `user` VALUES ('3', 'uiui', 'f379eaf3c831b04de153469d1bec345e', '431202199611300012', '13100216874', '2018-05-09 20:55:16', '2018-05-09 20:55:16', '28', '337', 'xx', '1');
INSERT INTO `user` VALUES ('4', 'lirs', 'f379eaf3c831b04de153469d1bec345e', '430124199602094271', '15874222781', '2018-05-06 02:02:35', '2018-05-06 02:02:35', '19', '199', '湖南长沙', '0');
INSERT INTO `user` VALUES ('5', 'hj', 'f379eaf3c831b04de153469d1bec345e', '431202199612014574', '13100216854', '2018-05-03 11:05:31', '2018-05-03 11:05:31', '4', '4', 'xx', '0');
INSERT INTO `user` VALUES ('6', 'plc', 'f379eaf3c831b04de153469d1bec345e', '431202196801058020', '13467626086', '2018-04-29 19:41:15', '2018-04-29 19:43:45', '19', '199', '芙蓉区火怜路', '0');
INSERT INTO `user` VALUES ('7', 'MrQ', 'f379eaf3c831b04de153469d1bec345e', '429001199507075196', '15586875112', '2018-05-04 15:01:08', '2018-05-15 20:43:42', '18', '182', 'ilughlghiu', '0');
INSERT INTO `user` VALUES ('8', 'OO', 'f379eaf3c831b04de153469d1bec345e', '421124199511090536', '18154382131', '2018-05-04 15:20:21', '2018-05-04 15:28:50', '18', '182', '1111', '0');
INSERT INTO `user` VALUES ('9', 'LLL', 'f379eaf3c831b04de153469d1bec345e', '421124199611060362', '18154382136', '2018-05-04 15:31:38', '2018-05-09 08:45:05', '18', '182', 'WWWW', '0');
INSERT INTO `user` VALUES ('10', 'hsw', 'f379eaf3c831b04de153469d1bec345e', '429004199412151565', '13296607362', '2018-05-04 15:42:22', '2018-05-04 15:42:44', '18', '182', 'hse', '0');
INSERT INTO `user` VALUES ('11', 'aaa', 'f379eaf3c831b04de153469d1bec345e', '430124199602094422', '15458741258', '2018-05-08 23:21:14', '2018-05-18 09:38:49', '18', '182', 'adsdsdasd', '0');

-- ----------------------------
-- Table structure for useraddress
-- ----------------------------
DROP TABLE IF EXISTS `useraddress`;
CREATE TABLE `useraddress` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `aname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `areaProvince` varchar(255) DEFAULT NULL,
  `areaCity` varchar(255) DEFAULT NULL,
  `areaDetail` varchar(255) DEFAULT NULL,
  `areaStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useraddress
-- ----------------------------
INSERT INTO `useraddress` VALUES ('1', '2', '张三', '13154782521', '天津市', '天津市', '八方小区', '0');
INSERT INTO `useraddress` VALUES ('3', '2', '张三', '13100216873', '湖南省', '长沙市', 'XXX 观沙岭街道 八方小区 14栋', '1');
INSERT INTO `useraddress` VALUES ('7', '7', '庞攀', '13100216873', '台湾省', '台北市', 'XXX 802号房间', '0');
INSERT INTO `useraddress` VALUES ('8', '11', 'uiui', '13100216874', '山西省', '太原市', 'XXX 小区 XXX栋 102房间', '0');
