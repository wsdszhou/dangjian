/*
 Navicat Premium Data Transfer

 Source Server         : 111.231.76.233
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 111.231.76.233:3306
 Source Schema         : dangjian

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 08/01/2019 19:01:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bmb
-- ----------------------------
DROP TABLE IF EXISTS `bmb`;
CREATE TABLE `bmb` (
  `bm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `bm_mc` varchar(32) NOT NULL COMMENT '部门名称',
  `bm_js` varchar(255) DEFAULT NULL COMMENT '部门介绍',
  `bm_yz` varchar(32) DEFAULT NULL COMMENT '院长',
  `bm_sj` varchar(32) DEFAULT NULL COMMENT '书记',
  `bm_cjsj` datetime DEFAULT NULL COMMENT '创建时间',
  `bm_xgsj` datetime DEFAULT NULL COMMENT '修改时间',
  `bm_logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bm_id`),
  KEY `bm_sj` (`bm_sj`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of bmb
-- ----------------------------
BEGIN;
INSERT INTO `bmb` VALUES (101, '信息科学与工程学院', '66', '001', '001', '2018-11-14 17:48:32', '2018-11-14 17:48:37', '\\d129180073504f8685924c52a214fe41.jpg');
INSERT INTO `bmb` VALUES (113, '土木与建筑工程学院', '66', '001', '001', '2018-11-14 17:48:35', '2018-11-14 17:48:40', '\\d129180073504f8685924c52a214fe41.jpg');
INSERT INTO `bmb` VALUES (117, '商学院', '11', '001', '001', '2018-11-08 19:41:53', '2018-11-08 19:41:53', 'E:\\application\\Java框架\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\dangjian-controller\\upload\\images\\department\\d129180073504f8685924c52a214fe41.jpg');
INSERT INTO `bmb` VALUES (120, '旅游学院', '旅游学院', '63ad96ade9d549d28e5502bcfad2cf2a', 'a50fa03e4f3847068442cb37e2f7efc5', '2018-11-11 16:25:42', '2018-12-25 19:47:50', 'E:\\application\\Java框架\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\dangjian-controller\\upload\\images\\department\\f244738ebafa477b985134c9c2e20e6d.jpg');
INSERT INTO `bmb` VALUES (122, '机械控制与工程学院', '机械控制与工程学院', '001', '002', '2018-11-28 20:51:00', '2018-11-28 20:51:00', '');
INSERT INTO `bmb` VALUES (123, '公共管理与传媒学院', '公共管理与传媒学院', '001', '002', '2018-11-28 20:51:41', '2018-11-28 20:51:41', '');
INSERT INTO `bmb` VALUES (124, '化学与生物工程学院', '化学与生物工程学院', '001', '002', '2018-11-29 10:02:11', '2018-11-29 10:02:11', '');
INSERT INTO `bmb` VALUES (125, '外国语学院', '外国语学院', '001', '002', '2018-11-29 10:03:06', '2018-11-29 10:03:06', '');
INSERT INTO `bmb` VALUES (128, '艺术学院', '你好不', 'a50fa03e4f3847068442cb37e2f7efc5', '161532e2add14c1c8c6272134baaa150', '2018-12-25 16:31:14', '2018-12-25 16:31:32', '上传成功');
INSERT INTO `bmb` VALUES (142, '测试', '141414', '002', '001', '2018-12-25 19:42:41', '2018-12-25 19:42:41', '/dangjian-controller/upload/images/department/d573d4996e7c4d8984eb07065f886e03.jpg');
COMMIT;

-- ----------------------------
-- Table structure for bmry
-- ----------------------------
DROP TABLE IF EXISTS `bmry`;
CREATE TABLE `bmry` (
  `bmry_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '荣誉项目id',
  `bmry_mc` varchar(32) NOT NULL COMMENT '荣誉名称',
  `bmry_hdsj` datetime NOT NULL COMMENT '获得荣誉时间',
  `bmry_js` varchar(255) DEFAULT NULL COMMENT '荣誉介绍',
  `bmry_bmdm` int(11) NOT NULL COMMENT '所属部门',
  `bmry_tp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bmry_id`),
  KEY `bmry_bm` (`bmry_bmdm`),
  CONSTRAINT `bmry_bm` FOREIGN KEY (`bmry_bmdm`) REFERENCES `bmb` (`bm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='部门荣誉';

-- ----------------------------
-- Records of bmry
-- ----------------------------
BEGIN;
INSERT INTO `bmry` VALUES (24, '最佳学院奖', '2019-01-06 09:40:24', '信息科学与工程学院（简称信息学院）成立于2009年，其前身是应用物理与计算机系（1992年成立）和电子与计算机系（1997年成立）。学院具有一支年龄结构、学历结构和职称结构合理、教学科研水平较高的师资队伍。现有教职工91人，其中专任教师81人，正高职称14人、副高职称33人，具有博士学位26人。', 101, '');
INSERT INTO `bmry` VALUES (25, '最厉害学院奖', '2019-01-06 09:41:07', '学院学科基础扎实，包括博士点支撑学科（控制科学与工程）；广西高校重点学科（计算机应用技术）；一级学科硕士点（计算机科学与技术、软件工程），教育部卓越工程师计划专业学位硕士点（计算机技术）；广西高校重点实验室（嵌入式技术与智能信息处理），区级实验教学示范中心（工程训练中心），桂林市制造业信息化推广应用中心；学校立项建设区域一流学科（计算机大类）；区级精品课程（《C语言程序设计》和《计算机网络》）等教学科研平台。学院与科研院所和企业联合建立校外实习基地10多个。', 101, '');
INSERT INTO `bmry` VALUES (26, '最最厉害学院奖', '2019-01-06 09:41:21', '学校立项建设区域一流学科（计算机大类）；区级精品课程（《C语言程序设计》和《计算机网络》）等教学科研平台。学院与科研院所和企业联合建立校外实习基地10多个。', 101, '');
INSERT INTO `bmry` VALUES (27, '超级厉害学院奖', '2019-01-06 09:41:44', '区级精品课程（《C语言程序设计》和《计算机网络》）等教学科研平台。学院与科研院所和企业联合建立校外实习基地10多个。', 101, '');
INSERT INTO `bmry` VALUES (28, '超级无敌厉害学院奖', '2019-01-06 09:42:09', '学院科研工作快速发展，近年来共获各类科研项目100多项，其中国家自然科学基金项目9项，国家863计划子课题2项', 101, '');
INSERT INTO `bmry` VALUES (29, '宇宙超级无敌厉害学院奖', '2019-01-06 09:42:27', '学院坚持育人为本的办学理念，加强学院内涵建设，努力建设成为特色鲜明、优势明显的区域内具有重要影响的信息类人才培养基地。', 101, '');
COMMIT;

-- ----------------------------
-- Table structure for bug
-- ----------------------------
DROP TABLE IF EXISTS `bug`;
CREATE TABLE `bug` (
  `id` varchar(32) NOT NULL COMMENT 'bug的id',
  `bt` varchar(255) DEFAULT NULL COMMENT '标题',
  `nr` text COMMENT 'bug的主要问题',
  `sj` datetime NOT NULL COMMENT '时间',
  `yhdm` varchar(32) NOT NULL COMMENT '用户',
  `sfyd` int(11) DEFAULT '0' COMMENT '0代表未读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='bug表\r\n';

-- ----------------------------
-- Table structure for djxx
-- ----------------------------
DROP TABLE IF EXISTS `djxx`;
CREATE TABLE `djxx` (
  `id` varchar(32) NOT NULL COMMENT '党籍id',
  `sqsj` datetime DEFAULT NULL,
  `spsj` datetime DEFAULT NULL,
  `rdsj` datetime DEFAULT NULL COMMENT '入党时间',
  `ms` varchar(255) DEFAULT NULL COMMENT '党籍描述',
  `zrsj` datetime DEFAULT NULL COMMENT '转入时间',
  `zcdd` varchar(255) DEFAULT NULL COMMENT '转出地点',
  `yhdm` varchar(32) DEFAULT NULL COMMENT '用户',
  `bmdm` int(11) DEFAULT NULL,
  `zbdm` int(11) DEFAULT NULL,
  `dnzwdm` int(11) DEFAULT NULL,
  `zzmmdm` int(11) DEFAULT NULL,
  `zt` int(11) DEFAULT '1' COMMENT '党籍状态（1在籍，转出2）',
  `result` int(11) DEFAULT '0' COMMENT '0代表为审批审批中，1通过，2未通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='党籍信息表';

-- ----------------------------
-- Table structure for dnzwb
-- ----------------------------
DROP TABLE IF EXISTS `dnzwb`;
CREATE TABLE `dnzwb` (
  `dnzw_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '党内职务id',
  `dnzw_mc` varchar(64) DEFAULT NULL COMMENT '党内职务名称',
  `dnzw_jb` int(11) DEFAULT '3' COMMENT '任职级别（1表示校级，2表示学院级，3表示支部级）',
  PRIMARY KEY (`dnzw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='党内职务表';

-- ----------------------------
-- Records of dnzwb
-- ----------------------------
BEGIN;
INSERT INTO `dnzwb` VALUES (101, '党员', 3);
INSERT INTO `dnzwb` VALUES (102, '支部书记', 3);
INSERT INTO `dnzwb` VALUES (103, '组织委员', 3);
INSERT INTO `dnzwb` VALUES (104, '宣传委员', 3);
INSERT INTO `dnzwb` VALUES (111, '学院党委书记', 2);
INSERT INTO `dnzwb` VALUES (113, '学院宣传委员', 2);
INSERT INTO `dnzwb` VALUES (114, '学院党委', 2);
INSERT INTO `dnzwb` VALUES (115, '学院党委副书记', 2);
INSERT INTO `dnzwb` VALUES (116, '学校书记', 1);
INSERT INTO `dnzwb` VALUES (117, '宣传部长', 1);
INSERT INTO `dnzwb` VALUES (118, '组织部长', 1);
INSERT INTO `dnzwb` VALUES (119, '学校副书记', 1);
COMMIT;

-- ----------------------------
-- Table structure for gnb
-- ----------------------------
DROP TABLE IF EXISTS `gnb`;
CREATE TABLE `gnb` (
  `gn_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `gn_mc` varchar(32) DEFAULT NULL COMMENT '功能名称',
  `gn_lj` varchar(64) DEFAULT NULL COMMENT '功能路径',
  `gn_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10032 DEFAULT CHARSET=utf8 COMMENT='功能表';

-- ----------------------------
-- Records of gnb
-- ----------------------------
BEGIN;
INSERT INTO `gnb` VALUES (10002, '视频管理', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10003, '图片管理', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10004, '功能模块管理', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10005, '党建门户', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10006, '部门管理', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10007, '民生平台', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10008, '党建监督', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10009, '党员工作平台', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10010, '党员教育', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10011, '通知公告', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10012, '新闻管理', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10013, '党务管理', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10014, '党建大数据', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10029, '考试中心', NULL, NULL);
INSERT INTO `gnb` VALUES (10030, '系统管理', NULL, 'icon-man');
INSERT INTO `gnb` VALUES (10031, '审批管理', NULL, 'icon-man');
COMMIT;

-- ----------------------------
-- Table structure for hb_hblxb
-- ----------------------------
DROP TABLE IF EXISTS `hb_hblxb`;
CREATE TABLE `hb_hblxb` (
  `hblx_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '汇报类型id',
  `hblx_mc` varchar(32) DEFAULT NULL COMMENT '汇报类型名称',
  PRIMARY KEY (`hblx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='汇报类型表';

-- ----------------------------
-- Table structure for hb_hbwzb
-- ----------------------------
DROP TABLE IF EXISTS `hb_hbwzb`;
CREATE TABLE `hb_hbwzb` (
  `hbwz_id` varchar(32) NOT NULL COMMENT '汇报文章id',
  `hbwz_yhdm` varchar(23) NOT NULL COMMENT '汇报人',
  `hbwz_bt` varchar(255) DEFAULT NULL COMMENT '汇报标题',
  `hbwz_nr` text COMMENT '内容',
  `hbwz_sj` date DEFAULT NULL COMMENT '汇报时间',
  `hbwz_lxdm` int(11) NOT NULL COMMENT '汇报类型',
  PRIMARY KEY (`hbwz_id`),
  KEY `hbwz_lx` (`hbwz_lxdm`),
  KEY `hbwz_yh` (`hbwz_yhdm`),
  CONSTRAINT `hbwz_lx` FOREIGN KEY (`hbwz_lxdm`) REFERENCES `hb_hblxb` (`hblx_id`),
  CONSTRAINT `hbwz_yh` FOREIGN KEY (`hbwz_yhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='汇报文章表';

-- ----------------------------
-- Table structure for hy_hyb
-- ----------------------------
DROP TABLE IF EXISTS `hy_hyb`;
CREATE TABLE `hy_hyb` (
  `hy_id` varchar(32) NOT NULL COMMENT '会议id',
  `hy_jb` int(11) DEFAULT NULL COMMENT '会议级别',
  `hy_dd` varchar(32) DEFAULT NULL COMMENT '会议地点',
  `hy_zt` varchar(255) DEFAULT NULL COMMENT '会议主题',
  `hy_yhjlxx` text COMMENT '会议记录信息',
  `hy_zcrdm` varchar(32) NOT NULL COMMENT '主持人',
  PRIMARY KEY (`hy_id`),
  KEY `hy_yh` (`hy_zcrdm`),
  CONSTRAINT `hy_yh` FOREIGN KEY (`hy_zcrdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议表';

-- ----------------------------
-- Table structure for hy_hylbb
-- ----------------------------
DROP TABLE IF EXISTS `hy_hylbb`;
CREATE TABLE `hy_hylbb` (
  `hylb_id` varchar(32) NOT NULL COMMENT '会议列表Id',
  `hylb_hydm` varchar(32) NOT NULL COMMENT '会议表',
  `hylb_yhzt` varchar(255) DEFAULT NULL COMMENT '会议主题',
  `hylb_kssj` datetime DEFAULT NULL COMMENT '会议开始时间',
  `hylb_cjsj` datetime DEFAULT NULL COMMENT '会议创建时间',
  `hylb_yhdm` varchar(32) NOT NULL COMMENT '用户表',
  `hylb_yhmc` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `hylb_hyzt` int(11) DEFAULT NULL COMMENT '会议状态',
  PRIMARY KEY (`hylb_id`),
  KEY `hylb_hy` (`hylb_hydm`),
  KEY `hylb_yh` (`hylb_yhdm`),
  CONSTRAINT `hylb_hy` FOREIGN KEY (`hylb_hydm`) REFERENCES `hy_hyb` (`hy_id`),
  CONSTRAINT `hylb_yh` FOREIGN KEY (`hylb_yhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议列表表';

-- ----------------------------
-- Table structure for hy_hyyhb
-- ----------------------------
DROP TABLE IF EXISTS `hy_hyyhb`;
CREATE TABLE `hy_hyyhb` (
  `hyyh_id` varchar(32) NOT NULL COMMENT '会议用户表id',
  `hyyh_hydm` varchar(32) NOT NULL COMMENT '参会人',
  `hyyh_yhdm` varchar(32) NOT NULL COMMENT '会议',
  `hyyh_sfdq` int(11) DEFAULT '1' COMMENT '是否参会',
  `hyyh_sfqj` int(11) DEFAULT '0' COMMENT '是否请假',
  PRIMARY KEY (`hyyh_id`),
  KEY `hyyh_hy` (`hyyh_hydm`),
  KEY `hyyh_yh` (`hyyh_yhdm`),
  CONSTRAINT `hyyh_hy` FOREIGN KEY (`hyyh_hydm`) REFERENCES `hy_hyb` (`hy_id`),
  CONSTRAINT `hyyh_yh` FOREIGN KEY (`hyyh_yhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议用户表';

-- ----------------------------
-- Table structure for hy_ppyzwppb
-- ----------------------------
DROP TABLE IF EXISTS `hy_ppyzwppb`;
CREATE TABLE `hy_ppyzwppb` (
  `ppyzwpp_id` varchar(32) NOT NULL COMMENT '批评与自我批评id',
  `ppyzwpp_yhdm` varchar(32) NOT NULL COMMENT '批评人',
  `ppyzwpp_nr` text COMMENT '批评内容',
  `ppyzwpp_sj` datetime DEFAULT NULL COMMENT '批评时间',
  `ppyzwpp_hydm` varchar(32) NOT NULL COMMENT '会议表',
  PRIMARY KEY (`ppyzwpp_id`),
  KEY `ppyzwpp_hy` (`ppyzwpp_hydm`),
  KEY `ppyzwpp_yh` (`ppyzwpp_yhdm`),
  CONSTRAINT `ppyzwpp_hy` FOREIGN KEY (`ppyzwpp_hydm`) REFERENCES `hy_hyb` (`hy_id`),
  CONSTRAINT `ppyzwpp_yh` FOREIGN KEY (`ppyzwpp_yhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批评与自我批评表';

-- ----------------------------
-- Table structure for jfb
-- ----------------------------
DROP TABLE IF EXISTS `jfb`;
CREATE TABLE `jfb` (
  `jf_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分id',
  `jf_yhdm` varchar(32) NOT NULL COMMENT '用户表',
  `jf_jfs` int(11) DEFAULT NULL COMMENT '积分数',
  `jf_yhmc` varchar(32) DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`jf_id`),
  KEY `jf_yh` (`jf_yhdm`),
  CONSTRAINT `jf_yh` FOREIGN KEY (`jf_yhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分表';

-- ----------------------------
-- Table structure for jgb
-- ----------------------------
DROP TABLE IF EXISTS `jgb`;
CREATE TABLE `jgb` (
  `jg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '籍贯id',
  `js_szs_id` int(11) DEFAULT NULL COMMENT '所在省id',
  `js_szqx_mc` varchar(32) DEFAULT NULL COMMENT '所在区县名称',
  `jg_szs_mc` varchar(32) DEFAULT NULL COMMENT '籍贯名称',
  PRIMARY KEY (`jg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=820001 DEFAULT CHARSET=utf8 COMMENT='籍贯表';

-- ----------------------------
-- Records of jgb
-- ----------------------------
BEGIN;
INSERT INTO `jgb` VALUES (110000, 110000, '北京市', '北京市');
INSERT INTO `jgb` VALUES (110101, 110000, '东城区', '北京市');
INSERT INTO `jgb` VALUES (110102, 110000, '西城区', '北京市');
INSERT INTO `jgb` VALUES (110105, 110000, '朝阳区', '北京市');
INSERT INTO `jgb` VALUES (110106, 110000, '丰台区', '北京市');
INSERT INTO `jgb` VALUES (110107, 110000, '石景山区', '北京市');
INSERT INTO `jgb` VALUES (110108, 110000, '海淀区', '北京市');
INSERT INTO `jgb` VALUES (110109, 110000, '门头沟区', '北京市');
INSERT INTO `jgb` VALUES (110111, 110000, '房山区', '北京市');
INSERT INTO `jgb` VALUES (110112, 110000, '通州区', '北京市');
INSERT INTO `jgb` VALUES (110113, 110000, '顺义区', '北京市');
INSERT INTO `jgb` VALUES (110114, 110000, '昌平区', '北京市');
INSERT INTO `jgb` VALUES (110115, 110000, '大兴区', '北京市');
INSERT INTO `jgb` VALUES (110116, 110000, '怀柔区', '北京市');
INSERT INTO `jgb` VALUES (110117, 110000, '平谷区', '北京市');
INSERT INTO `jgb` VALUES (110118, 110000, '密云区', '北京市');
INSERT INTO `jgb` VALUES (110119, 110000, '延庆区', '北京市');
INSERT INTO `jgb` VALUES (120000, 120000, '天津市', '天津市');
INSERT INTO `jgb` VALUES (120101, 120000, '和平区', '天津市');
INSERT INTO `jgb` VALUES (120102, 120000, '河东区', '天津市');
INSERT INTO `jgb` VALUES (120103, 120000, '河西区', '天津市');
INSERT INTO `jgb` VALUES (120104, 120000, '南开区', '天津市');
INSERT INTO `jgb` VALUES (120105, 120000, '河北区', '天津市');
INSERT INTO `jgb` VALUES (120106, 120000, '红桥区', '天津市');
INSERT INTO `jgb` VALUES (120110, 120000, '东丽区', '天津市');
INSERT INTO `jgb` VALUES (120111, 120000, '西青区', '天津市');
INSERT INTO `jgb` VALUES (120112, 120000, '津南区', '天津市');
INSERT INTO `jgb` VALUES (120113, 120000, '北辰区', '天津市');
INSERT INTO `jgb` VALUES (120114, 120000, '武清区', '天津市');
INSERT INTO `jgb` VALUES (120115, 120000, '宝坻区', '天津市');
INSERT INTO `jgb` VALUES (120116, 120000, '滨海新区', '天津市');
INSERT INTO `jgb` VALUES (120117, 120000, '宁河区', '天津市');
INSERT INTO `jgb` VALUES (120118, 120000, '静海区', '天津市');
INSERT INTO `jgb` VALUES (120119, 120000, '蓟州区', '天津市');
INSERT INTO `jgb` VALUES (130000, 130000, '河北省', '河北省');
INSERT INTO `jgb` VALUES (130100, 130000, '石家庄市', '河北省');
INSERT INTO `jgb` VALUES (130102, 130000, '长安区', '河北省');
INSERT INTO `jgb` VALUES (130104, 130000, '桥西区', '河北省');
INSERT INTO `jgb` VALUES (130105, 130000, '新华区', '河北省');
INSERT INTO `jgb` VALUES (130107, 130000, '井陉矿区', '河北省');
INSERT INTO `jgb` VALUES (130108, 130000, '裕华区', '河北省');
INSERT INTO `jgb` VALUES (130109, 130000, '藁城区', '河北省');
INSERT INTO `jgb` VALUES (130110, 130000, '鹿泉区', '河北省');
INSERT INTO `jgb` VALUES (130111, 130000, '栾城区', '河北省');
INSERT INTO `jgb` VALUES (130121, 130000, '井陉县', '河北省');
INSERT INTO `jgb` VALUES (130123, 130000, '正定县', '河北省');
INSERT INTO `jgb` VALUES (130125, 130000, '行唐县', '河北省');
INSERT INTO `jgb` VALUES (130126, 130000, '灵寿县', '河北省');
INSERT INTO `jgb` VALUES (130127, 130000, '高邑县', '河北省');
INSERT INTO `jgb` VALUES (130128, 130000, '深泽县', '河北省');
INSERT INTO `jgb` VALUES (130129, 130000, '赞皇县', '河北省');
INSERT INTO `jgb` VALUES (130130, 130000, '无极县', '河北省');
INSERT INTO `jgb` VALUES (130131, 130000, '平山县', '河北省');
INSERT INTO `jgb` VALUES (130132, 130000, '元氏县', '河北省');
INSERT INTO `jgb` VALUES (130133, 130000, '赵县', '河北省');
INSERT INTO `jgb` VALUES (130181, 130000, '辛集市', '河北省');
INSERT INTO `jgb` VALUES (130183, 130000, '晋州市', '河北省');
INSERT INTO `jgb` VALUES (130184, 130000, '新乐市', '河北省');
INSERT INTO `jgb` VALUES (130200, 130000, '唐山市', '河北省');
INSERT INTO `jgb` VALUES (130202, 130000, '路南区', '河北省');
INSERT INTO `jgb` VALUES (130203, 130000, '路北区', '河北省');
INSERT INTO `jgb` VALUES (130204, 130000, '古冶区', '河北省');
INSERT INTO `jgb` VALUES (130205, 130000, '开平区', '河北省');
INSERT INTO `jgb` VALUES (130207, 130000, '丰南区', '河北省');
INSERT INTO `jgb` VALUES (130208, 130000, '丰润区', '河北省');
INSERT INTO `jgb` VALUES (130209, 130000, '曹妃甸区', '河北省');
INSERT INTO `jgb` VALUES (130223, 130000, '滦县', '河北省');
INSERT INTO `jgb` VALUES (130224, 130000, '滦南县', '河北省');
INSERT INTO `jgb` VALUES (130225, 130000, '乐亭县', '河北省');
INSERT INTO `jgb` VALUES (130227, 130000, '迁西县', '河北省');
INSERT INTO `jgb` VALUES (130229, 130000, '玉田县', '河北省');
INSERT INTO `jgb` VALUES (130281, 130000, '遵化市', '河北省');
INSERT INTO `jgb` VALUES (130283, 130000, '迁安市', '河北省');
INSERT INTO `jgb` VALUES (130300, 130000, '秦皇岛市', '河北省');
INSERT INTO `jgb` VALUES (130302, 130000, '海港区', '河北省');
INSERT INTO `jgb` VALUES (130303, 130000, '山海关区', '河北省');
INSERT INTO `jgb` VALUES (130304, 130000, '北戴河区', '河北省');
INSERT INTO `jgb` VALUES (130306, 130000, '抚宁区', '河北省');
INSERT INTO `jgb` VALUES (130321, 130000, '青龙满族自治县', '河北省');
INSERT INTO `jgb` VALUES (130322, 130000, '昌黎县', '河北省');
INSERT INTO `jgb` VALUES (130324, 130000, '卢龙县', '河北省');
INSERT INTO `jgb` VALUES (130400, 130000, '邯郸市', '河北省');
INSERT INTO `jgb` VALUES (130402, 130000, '邯山区', '河北省');
INSERT INTO `jgb` VALUES (130403, 130000, '丛台区', '河北省');
INSERT INTO `jgb` VALUES (130404, 130000, '复兴区', '河北省');
INSERT INTO `jgb` VALUES (130406, 130000, '峰峰矿区', '河北省');
INSERT INTO `jgb` VALUES (130407, 130000, '肥乡区', '河北省');
INSERT INTO `jgb` VALUES (130408, 130000, '永年区', '河北省');
INSERT INTO `jgb` VALUES (130423, 130000, '临漳县', '河北省');
INSERT INTO `jgb` VALUES (130424, 130000, '成安县', '河北省');
INSERT INTO `jgb` VALUES (130425, 130000, '大名县', '河北省');
INSERT INTO `jgb` VALUES (130426, 130000, '涉县', '河北省');
INSERT INTO `jgb` VALUES (130427, 130000, '磁县', '河北省');
INSERT INTO `jgb` VALUES (130430, 130000, '邱县', '河北省');
INSERT INTO `jgb` VALUES (130431, 130000, '鸡泽县', '河北省');
INSERT INTO `jgb` VALUES (130432, 130000, '广平县', '河北省');
INSERT INTO `jgb` VALUES (130433, 130000, '馆陶县', '河北省');
INSERT INTO `jgb` VALUES (130434, 130000, '魏县', '河北省');
INSERT INTO `jgb` VALUES (130435, 130000, '曲周县', '河北省');
INSERT INTO `jgb` VALUES (130481, 130000, '武安市', '河北省');
INSERT INTO `jgb` VALUES (130500, 130000, '邢台市', '河北省');
INSERT INTO `jgb` VALUES (130502, 130000, '桥东区', '河北省');
INSERT INTO `jgb` VALUES (130503, 130000, '桥西区', '河北省');
INSERT INTO `jgb` VALUES (130521, 130000, '邢台县', '河北省');
INSERT INTO `jgb` VALUES (130522, 130000, '临城县', '河北省');
INSERT INTO `jgb` VALUES (130523, 130000, '内丘县', '河北省');
INSERT INTO `jgb` VALUES (130524, 130000, '柏乡县', '河北省');
INSERT INTO `jgb` VALUES (130525, 130000, '隆尧县', '河北省');
INSERT INTO `jgb` VALUES (130526, 130000, '任县', '河北省');
INSERT INTO `jgb` VALUES (130527, 130000, '南和县', '河北省');
INSERT INTO `jgb` VALUES (130528, 130000, '宁晋县', '河北省');
INSERT INTO `jgb` VALUES (130529, 130000, '巨鹿县', '河北省');
INSERT INTO `jgb` VALUES (130530, 130000, '新河县', '河北省');
INSERT INTO `jgb` VALUES (130531, 130000, '广宗县', '河北省');
INSERT INTO `jgb` VALUES (130532, 130000, '平乡县', '河北省');
INSERT INTO `jgb` VALUES (130533, 130000, '威县', '河北省');
INSERT INTO `jgb` VALUES (130534, 130000, '清河县', '河北省');
INSERT INTO `jgb` VALUES (130535, 130000, '临西县', '河北省');
INSERT INTO `jgb` VALUES (130581, 130000, '南宫市', '河北省');
INSERT INTO `jgb` VALUES (130582, 130000, '沙河市', '河北省');
INSERT INTO `jgb` VALUES (130600, 130000, '保定市', '河北省');
INSERT INTO `jgb` VALUES (130602, 130000, '竞秀区', '河北省');
INSERT INTO `jgb` VALUES (130606, 130000, '莲池区', '河北省');
INSERT INTO `jgb` VALUES (130607, 130000, '满城区', '河北省');
INSERT INTO `jgb` VALUES (130608, 130000, '清苑区', '河北省');
INSERT INTO `jgb` VALUES (130609, 130000, '徐水区', '河北省');
INSERT INTO `jgb` VALUES (130623, 130000, '涞水县', '河北省');
INSERT INTO `jgb` VALUES (130624, 130000, '阜平县', '河北省');
INSERT INTO `jgb` VALUES (130626, 130000, '定兴县', '河北省');
INSERT INTO `jgb` VALUES (130627, 130000, '唐县', '河北省');
INSERT INTO `jgb` VALUES (130628, 130000, '高阳县', '河北省');
INSERT INTO `jgb` VALUES (130629, 130000, '容城县', '河北省');
INSERT INTO `jgb` VALUES (130630, 130000, '涞源县', '河北省');
INSERT INTO `jgb` VALUES (130631, 130000, '望都县', '河北省');
INSERT INTO `jgb` VALUES (130632, 130000, '安新县', '河北省');
INSERT INTO `jgb` VALUES (130633, 130000, '易县', '河北省');
INSERT INTO `jgb` VALUES (130634, 130000, '曲阳县', '河北省');
INSERT INTO `jgb` VALUES (130635, 130000, '蠡县', '河北省');
INSERT INTO `jgb` VALUES (130636, 130000, '顺平县', '河北省');
INSERT INTO `jgb` VALUES (130637, 130000, '博野县', '河北省');
INSERT INTO `jgb` VALUES (130638, 130000, '雄县', '河北省');
INSERT INTO `jgb` VALUES (130681, 130000, '涿州市', '河北省');
INSERT INTO `jgb` VALUES (130682, 130000, '定州市', '河北省');
INSERT INTO `jgb` VALUES (130683, 130000, '安国市', '河北省');
INSERT INTO `jgb` VALUES (130684, 130000, '高碑店市', '河北省');
INSERT INTO `jgb` VALUES (130700, 130000, '张家口市', '河北省');
INSERT INTO `jgb` VALUES (130702, 130000, '桥东区', '河北省');
INSERT INTO `jgb` VALUES (130703, 130000, '桥西区', '河北省');
INSERT INTO `jgb` VALUES (130705, 130000, '宣化区', '河北省');
INSERT INTO `jgb` VALUES (130706, 130000, '下花园区', '河北省');
INSERT INTO `jgb` VALUES (130708, 130000, '万全区', '河北省');
INSERT INTO `jgb` VALUES (130709, 130000, '崇礼区', '河北省');
INSERT INTO `jgb` VALUES (130722, 130000, '张北县', '河北省');
INSERT INTO `jgb` VALUES (130723, 130000, '康保县', '河北省');
INSERT INTO `jgb` VALUES (130724, 130000, '沽源县', '河北省');
INSERT INTO `jgb` VALUES (130725, 130000, '尚义县', '河北省');
INSERT INTO `jgb` VALUES (130726, 130000, '蔚县', '河北省');
INSERT INTO `jgb` VALUES (130727, 130000, '阳原县', '河北省');
INSERT INTO `jgb` VALUES (130728, 130000, '怀安县', '河北省');
INSERT INTO `jgb` VALUES (130730, 130000, '怀来县', '河北省');
INSERT INTO `jgb` VALUES (130731, 130000, '涿鹿县', '河北省');
INSERT INTO `jgb` VALUES (130732, 130000, '赤城县', '河北省');
INSERT INTO `jgb` VALUES (130800, 130000, '承德市', '河北省');
INSERT INTO `jgb` VALUES (130802, 130000, '双桥区', '河北省');
INSERT INTO `jgb` VALUES (130803, 130000, '双滦区', '河北省');
INSERT INTO `jgb` VALUES (130804, 130000, '鹰手营子矿区', '河北省');
INSERT INTO `jgb` VALUES (130821, 130000, '承德县', '河北省');
INSERT INTO `jgb` VALUES (130822, 130000, '兴隆县', '河北省');
INSERT INTO `jgb` VALUES (130824, 130000, '滦平县', '河北省');
INSERT INTO `jgb` VALUES (130825, 130000, '隆化县', '河北省');
INSERT INTO `jgb` VALUES (130826, 130000, '丰宁满族自治县', '河北省');
INSERT INTO `jgb` VALUES (130827, 130000, '宽城满族自治县', '河北省');
INSERT INTO `jgb` VALUES (130828, 130000, '围场满族蒙古族自治县', '河北省');
INSERT INTO `jgb` VALUES (130881, 130000, '平泉市', '河北省');
INSERT INTO `jgb` VALUES (130900, 130000, '沧州市', '河北省');
INSERT INTO `jgb` VALUES (130902, 130000, '新华区', '河北省');
INSERT INTO `jgb` VALUES (130903, 130000, '运河区', '河北省');
INSERT INTO `jgb` VALUES (130921, 130000, '沧县', '河北省');
INSERT INTO `jgb` VALUES (130922, 130000, '青县', '河北省');
INSERT INTO `jgb` VALUES (130923, 130000, '东光县', '河北省');
INSERT INTO `jgb` VALUES (130924, 130000, '海兴县', '河北省');
INSERT INTO `jgb` VALUES (130925, 130000, '盐山县', '河北省');
INSERT INTO `jgb` VALUES (130926, 130000, '肃宁县', '河北省');
INSERT INTO `jgb` VALUES (130927, 130000, '南皮县', '河北省');
INSERT INTO `jgb` VALUES (130928, 130000, '吴桥县', '河北省');
INSERT INTO `jgb` VALUES (130929, 130000, '献县', '河北省');
INSERT INTO `jgb` VALUES (130930, 130000, '孟村回族自治县', '河北省');
INSERT INTO `jgb` VALUES (130981, 130000, '泊头市', '河北省');
INSERT INTO `jgb` VALUES (130982, 130000, '任丘市', '河北省');
INSERT INTO `jgb` VALUES (130983, 130000, '黄骅市', '河北省');
INSERT INTO `jgb` VALUES (130984, 130000, '河间市', '河北省');
INSERT INTO `jgb` VALUES (131000, 130000, '廊坊市', '河北省');
INSERT INTO `jgb` VALUES (131002, 130000, '安次区', '河北省');
INSERT INTO `jgb` VALUES (131003, 130000, '广阳区', '河北省');
INSERT INTO `jgb` VALUES (131022, 130000, '固安县', '河北省');
INSERT INTO `jgb` VALUES (131023, 130000, '永清县', '河北省');
INSERT INTO `jgb` VALUES (131024, 130000, '香河县', '河北省');
INSERT INTO `jgb` VALUES (131025, 130000, '大城县', '河北省');
INSERT INTO `jgb` VALUES (131026, 130000, '文安县', '河北省');
INSERT INTO `jgb` VALUES (131028, 130000, '大厂回族自治县', '河北省');
INSERT INTO `jgb` VALUES (131081, 130000, '霸州市', '河北省');
INSERT INTO `jgb` VALUES (131082, 130000, '三河市', '河北省');
INSERT INTO `jgb` VALUES (131100, 130000, '衡水市', '河北省');
INSERT INTO `jgb` VALUES (131102, 130000, '桃城区', '河北省');
INSERT INTO `jgb` VALUES (131103, 130000, '冀州区', '河北省');
INSERT INTO `jgb` VALUES (131121, 130000, '枣强县', '河北省');
INSERT INTO `jgb` VALUES (131122, 130000, '武邑县', '河北省');
INSERT INTO `jgb` VALUES (131123, 130000, '武强县', '河北省');
INSERT INTO `jgb` VALUES (131124, 130000, '饶阳县', '河北省');
INSERT INTO `jgb` VALUES (131125, 130000, '安平县', '河北省');
INSERT INTO `jgb` VALUES (131126, 130000, '故城县', '河北省');
INSERT INTO `jgb` VALUES (131127, 130000, '景县', '河北省');
INSERT INTO `jgb` VALUES (131128, 130000, '阜城县', '河北省');
INSERT INTO `jgb` VALUES (131182, 130000, '深州市', '河北省');
INSERT INTO `jgb` VALUES (140000, 140000, '山西省', '山西省');
INSERT INTO `jgb` VALUES (140100, 140000, '太原市', '山西省');
INSERT INTO `jgb` VALUES (140105, 140000, '小店区', '山西省');
INSERT INTO `jgb` VALUES (140106, 140000, '迎泽区', '山西省');
INSERT INTO `jgb` VALUES (140107, 140000, '杏花岭区', '山西省');
INSERT INTO `jgb` VALUES (140108, 140000, '尖草坪区', '山西省');
INSERT INTO `jgb` VALUES (140109, 140000, '万柏林区', '山西省');
INSERT INTO `jgb` VALUES (140110, 140000, '晋源区', '山西省');
INSERT INTO `jgb` VALUES (140121, 140000, '清徐县', '山西省');
INSERT INTO `jgb` VALUES (140122, 140000, '阳曲县', '山西省');
INSERT INTO `jgb` VALUES (140123, 140000, '娄烦县', '山西省');
INSERT INTO `jgb` VALUES (140181, 140000, '古交市', '山西省');
INSERT INTO `jgb` VALUES (140200, 140000, '大同市', '山西省');
INSERT INTO `jgb` VALUES (140202, 140000, '城区', '山西省');
INSERT INTO `jgb` VALUES (140203, 140000, '矿区', '山西省');
INSERT INTO `jgb` VALUES (140211, 140000, '南郊区', '山西省');
INSERT INTO `jgb` VALUES (140212, 140000, '新荣区', '山西省');
INSERT INTO `jgb` VALUES (140221, 140000, '阳高县', '山西省');
INSERT INTO `jgb` VALUES (140222, 140000, '天镇县', '山西省');
INSERT INTO `jgb` VALUES (140223, 140000, '广灵县', '山西省');
INSERT INTO `jgb` VALUES (140224, 140000, '灵丘县', '山西省');
INSERT INTO `jgb` VALUES (140225, 140000, '浑源县', '山西省');
INSERT INTO `jgb` VALUES (140226, 140000, '左云县', '山西省');
INSERT INTO `jgb` VALUES (140227, 140000, '大同县', '山西省');
INSERT INTO `jgb` VALUES (140300, 140000, '阳泉市', '山西省');
INSERT INTO `jgb` VALUES (140302, 140000, '城区', '山西省');
INSERT INTO `jgb` VALUES (140303, 140000, '矿区', '山西省');
INSERT INTO `jgb` VALUES (140311, 140000, '郊区', '山西省');
INSERT INTO `jgb` VALUES (140321, 140000, '平定县', '山西省');
INSERT INTO `jgb` VALUES (140322, 140000, '盂县', '山西省');
INSERT INTO `jgb` VALUES (140400, 140000, '长治市', '山西省');
INSERT INTO `jgb` VALUES (140402, 140000, '城区', '山西省');
INSERT INTO `jgb` VALUES (140411, 140000, '郊区', '山西省');
INSERT INTO `jgb` VALUES (140421, 140000, '长治县', '山西省');
INSERT INTO `jgb` VALUES (140423, 140000, '襄垣县', '山西省');
INSERT INTO `jgb` VALUES (140424, 140000, '屯留县', '山西省');
INSERT INTO `jgb` VALUES (140425, 140000, '平顺县', '山西省');
INSERT INTO `jgb` VALUES (140426, 140000, '黎城县', '山西省');
INSERT INTO `jgb` VALUES (140427, 140000, '壶关县', '山西省');
INSERT INTO `jgb` VALUES (140428, 140000, '长子县', '山西省');
INSERT INTO `jgb` VALUES (140429, 140000, '武乡县', '山西省');
INSERT INTO `jgb` VALUES (140430, 140000, '沁县', '山西省');
INSERT INTO `jgb` VALUES (140431, 140000, '沁源县', '山西省');
INSERT INTO `jgb` VALUES (140481, 140000, '潞城市', '山西省');
INSERT INTO `jgb` VALUES (140500, 140000, '晋城市', '山西省');
INSERT INTO `jgb` VALUES (140502, 140000, '城区', '山西省');
INSERT INTO `jgb` VALUES (140521, 140000, '沁水县', '山西省');
INSERT INTO `jgb` VALUES (140522, 140000, '阳城县', '山西省');
INSERT INTO `jgb` VALUES (140524, 140000, '陵川县', '山西省');
INSERT INTO `jgb` VALUES (140525, 140000, '泽州县', '山西省');
INSERT INTO `jgb` VALUES (140581, 140000, '高平市', '山西省');
INSERT INTO `jgb` VALUES (140600, 140000, '朔州市', '山西省');
INSERT INTO `jgb` VALUES (140602, 140000, '朔城区', '山西省');
INSERT INTO `jgb` VALUES (140603, 140000, '平鲁区', '山西省');
INSERT INTO `jgb` VALUES (140621, 140000, '山阴县', '山西省');
INSERT INTO `jgb` VALUES (140622, 140000, '应县', '山西省');
INSERT INTO `jgb` VALUES (140623, 140000, '右玉县', '山西省');
INSERT INTO `jgb` VALUES (140624, 140000, '怀仁县', '山西省');
INSERT INTO `jgb` VALUES (140700, 140000, '晋中市', '山西省');
INSERT INTO `jgb` VALUES (140702, 140000, '榆次区', '山西省');
INSERT INTO `jgb` VALUES (140721, 140000, '榆社县', '山西省');
INSERT INTO `jgb` VALUES (140722, 140000, '左权县', '山西省');
INSERT INTO `jgb` VALUES (140723, 140000, '和顺县', '山西省');
INSERT INTO `jgb` VALUES (140724, 140000, '昔阳县', '山西省');
INSERT INTO `jgb` VALUES (140725, 140000, '寿阳县', '山西省');
INSERT INTO `jgb` VALUES (140726, 140000, '太谷县', '山西省');
INSERT INTO `jgb` VALUES (140727, 140000, '祁县', '山西省');
INSERT INTO `jgb` VALUES (140728, 140000, '平遥县', '山西省');
INSERT INTO `jgb` VALUES (140729, 140000, '灵石县', '山西省');
INSERT INTO `jgb` VALUES (140781, 140000, '介休市', '山西省');
INSERT INTO `jgb` VALUES (140800, 140000, '运城市', '山西省');
INSERT INTO `jgb` VALUES (140802, 140000, '盐湖区', '山西省');
INSERT INTO `jgb` VALUES (140821, 140000, '临猗县', '山西省');
INSERT INTO `jgb` VALUES (140822, 140000, '万荣县', '山西省');
INSERT INTO `jgb` VALUES (140823, 140000, '闻喜县', '山西省');
INSERT INTO `jgb` VALUES (140824, 140000, '稷山县', '山西省');
INSERT INTO `jgb` VALUES (140825, 140000, '新绛县', '山西省');
INSERT INTO `jgb` VALUES (140826, 140000, '绛县', '山西省');
INSERT INTO `jgb` VALUES (140827, 140000, '垣曲县', '山西省');
INSERT INTO `jgb` VALUES (140828, 140000, '夏县', '山西省');
INSERT INTO `jgb` VALUES (140829, 140000, '平陆县', '山西省');
INSERT INTO `jgb` VALUES (140830, 140000, '芮城县', '山西省');
INSERT INTO `jgb` VALUES (140881, 140000, '永济市', '山西省');
INSERT INTO `jgb` VALUES (140882, 140000, '河津市', '山西省');
INSERT INTO `jgb` VALUES (140900, 140000, '忻州市', '山西省');
INSERT INTO `jgb` VALUES (140902, 140000, '忻府区', '山西省');
INSERT INTO `jgb` VALUES (140921, 140000, '定襄县', '山西省');
INSERT INTO `jgb` VALUES (140922, 140000, '五台县', '山西省');
INSERT INTO `jgb` VALUES (140923, 140000, '代县', '山西省');
INSERT INTO `jgb` VALUES (140924, 140000, '繁峙县', '山西省');
INSERT INTO `jgb` VALUES (140925, 140000, '宁武县', '山西省');
INSERT INTO `jgb` VALUES (140926, 140000, '静乐县', '山西省');
INSERT INTO `jgb` VALUES (140927, 140000, '神池县', '山西省');
INSERT INTO `jgb` VALUES (140928, 140000, '五寨县', '山西省');
INSERT INTO `jgb` VALUES (140929, 140000, '岢岚县', '山西省');
INSERT INTO `jgb` VALUES (140930, 140000, '河曲县', '山西省');
INSERT INTO `jgb` VALUES (140931, 140000, '保德县', '山西省');
INSERT INTO `jgb` VALUES (140932, 140000, '偏关县', '山西省');
INSERT INTO `jgb` VALUES (140981, 140000, '原平市', '山西省');
INSERT INTO `jgb` VALUES (141000, 140000, '临汾市', '山西省');
INSERT INTO `jgb` VALUES (141002, 140000, '尧都区', '山西省');
INSERT INTO `jgb` VALUES (141021, 140000, '曲沃县', '山西省');
INSERT INTO `jgb` VALUES (141022, 140000, '翼城县', '山西省');
INSERT INTO `jgb` VALUES (141023, 140000, '襄汾县', '山西省');
INSERT INTO `jgb` VALUES (141024, 140000, '洪洞县', '山西省');
INSERT INTO `jgb` VALUES (141025, 140000, '古县', '山西省');
INSERT INTO `jgb` VALUES (141026, 140000, '安泽县', '山西省');
INSERT INTO `jgb` VALUES (141027, 140000, '浮山县', '山西省');
INSERT INTO `jgb` VALUES (141028, 140000, '吉县', '山西省');
INSERT INTO `jgb` VALUES (141029, 140000, '乡宁县', '山西省');
INSERT INTO `jgb` VALUES (141030, 140000, '大宁县', '山西省');
INSERT INTO `jgb` VALUES (141031, 140000, '隰县', '山西省');
INSERT INTO `jgb` VALUES (141032, 140000, '永和县', '山西省');
INSERT INTO `jgb` VALUES (141033, 140000, '蒲县', '山西省');
INSERT INTO `jgb` VALUES (141034, 140000, '汾西县', '山西省');
INSERT INTO `jgb` VALUES (141081, 140000, '侯马市', '山西省');
INSERT INTO `jgb` VALUES (141082, 140000, '霍州市', '山西省');
INSERT INTO `jgb` VALUES (141100, 140000, '吕梁市', '山西省');
INSERT INTO `jgb` VALUES (141102, 140000, '离石区', '山西省');
INSERT INTO `jgb` VALUES (141121, 140000, '文水县', '山西省');
INSERT INTO `jgb` VALUES (141122, 140000, '交城县', '山西省');
INSERT INTO `jgb` VALUES (141123, 140000, '兴县', '山西省');
INSERT INTO `jgb` VALUES (141124, 140000, '临县', '山西省');
INSERT INTO `jgb` VALUES (141125, 140000, '柳林县', '山西省');
INSERT INTO `jgb` VALUES (141126, 140000, '石楼县', '山西省');
INSERT INTO `jgb` VALUES (141127, 140000, '岚县', '山西省');
INSERT INTO `jgb` VALUES (141128, 140000, '方山县', '山西省');
INSERT INTO `jgb` VALUES (141129, 140000, '中阳县', '山西省');
INSERT INTO `jgb` VALUES (141130, 140000, '交口县', '山西省');
INSERT INTO `jgb` VALUES (141181, 140000, '孝义市', '山西省');
INSERT INTO `jgb` VALUES (141182, 140000, '汾阳市', '山西省');
INSERT INTO `jgb` VALUES (150000, 150000, '内蒙古自治区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150100, 150000, '呼和浩特市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150102, 150000, '新城区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150103, 150000, '回民区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150104, 150000, '玉泉区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150105, 150000, '赛罕区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150121, 150000, '土默特左旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150122, 150000, '托克托县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150123, 150000, '和林格尔县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150124, 150000, '清水河县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150125, 150000, '武川县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150200, 150000, '包头市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150202, 150000, '东河区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150203, 150000, '昆都仑区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150204, 150000, '青山区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150205, 150000, '石拐区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150206, 150000, '白云鄂博矿区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150207, 150000, '九原区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150221, 150000, '土默特右旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150222, 150000, '固阳县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150223, 150000, '达尔罕茂明安联合旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150300, 150000, '乌海市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150302, 150000, '海勃湾区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150303, 150000, '海南区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150304, 150000, '乌达区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150400, 150000, '赤峰市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150402, 150000, '红山区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150403, 150000, '元宝山区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150404, 150000, '松山区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150421, 150000, '阿鲁科尔沁旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150422, 150000, '巴林左旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150423, 150000, '巴林右旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150424, 150000, '林西县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150425, 150000, '克什克腾旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150426, 150000, '翁牛特旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150428, 150000, '喀喇沁旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150429, 150000, '宁城县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150430, 150000, '敖汉旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150500, 150000, '通辽市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150502, 150000, '科尔沁区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150521, 150000, '科尔沁左翼中旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150522, 150000, '科尔沁左翼后旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150523, 150000, '开鲁县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150524, 150000, '库伦旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150525, 150000, '奈曼旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150526, 150000, '扎鲁特旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150581, 150000, '霍林郭勒市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150600, 150000, '鄂尔多斯市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150602, 150000, '东胜区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150603, 150000, '康巴什区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150621, 150000, '达拉特旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150622, 150000, '准格尔旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150623, 150000, '鄂托克前旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150624, 150000, '鄂托克旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150625, 150000, '杭锦旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150626, 150000, '乌审旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150627, 150000, '伊金霍洛旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150700, 150000, '呼伦贝尔市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150702, 150000, '海拉尔区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150703, 150000, '扎赉诺尔区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150721, 150000, '阿荣旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150722, 150000, '莫力达瓦达斡尔族自治旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150723, 150000, '鄂伦春自治旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150724, 150000, '鄂温克族自治旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150725, 150000, '陈巴尔虎旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150726, 150000, '新巴尔虎左旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150727, 150000, '新巴尔虎右旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150781, 150000, '满洲里市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150782, 150000, '牙克石市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150783, 150000, '扎兰屯市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150784, 150000, '额尔古纳市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150785, 150000, '根河市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150800, 150000, '巴彦淖尔市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150802, 150000, '临河区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150821, 150000, '五原县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150822, 150000, '磴口县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150823, 150000, '乌拉特前旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150824, 150000, '乌拉特中旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150825, 150000, '乌拉特后旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150826, 150000, '杭锦后旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150900, 150000, '乌兰察布市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150902, 150000, '集宁区', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150921, 150000, '卓资县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150922, 150000, '化德县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150923, 150000, '商都县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150924, 150000, '兴和县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150925, 150000, '凉城县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150926, 150000, '察哈尔右翼前旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150927, 150000, '察哈尔右翼中旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150928, 150000, '察哈尔右翼后旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150929, 150000, '四子王旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (150981, 150000, '丰镇市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152200, 150000, '兴安盟', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152201, 150000, '乌兰浩特市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152202, 150000, '阿尔山市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152221, 150000, '科尔沁右翼前旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152222, 150000, '科尔沁右翼中旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152223, 150000, '扎赉特旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152224, 150000, '突泉县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152500, 150000, '锡林郭勒盟', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152501, 150000, '二连浩特市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152502, 150000, '锡林浩特市', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152522, 150000, '阿巴嘎旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152523, 150000, '苏尼特左旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152524, 150000, '苏尼特右旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152525, 150000, '东乌珠穆沁旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152526, 150000, '西乌珠穆沁旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152527, 150000, '太仆寺旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152528, 150000, '镶黄旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152529, 150000, '正镶白旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152530, 150000, '正蓝旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152531, 150000, '多伦县', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152900, 150000, '阿拉善盟', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152921, 150000, '阿拉善左旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152922, 150000, '阿拉善右旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (152923, 150000, '额济纳旗', '内蒙古自治区');
INSERT INTO `jgb` VALUES (210000, 210000, '辽宁省', '辽宁省');
INSERT INTO `jgb` VALUES (210100, 210000, '沈阳市', '辽宁省');
INSERT INTO `jgb` VALUES (210102, 210000, '和平区', '辽宁省');
INSERT INTO `jgb` VALUES (210103, 210000, '沈河区', '辽宁省');
INSERT INTO `jgb` VALUES (210104, 210000, '大东区', '辽宁省');
INSERT INTO `jgb` VALUES (210105, 210000, '皇姑区', '辽宁省');
INSERT INTO `jgb` VALUES (210106, 210000, '铁西区', '辽宁省');
INSERT INTO `jgb` VALUES (210111, 210000, '苏家屯区', '辽宁省');
INSERT INTO `jgb` VALUES (210112, 210000, '浑南区', '辽宁省');
INSERT INTO `jgb` VALUES (210113, 210000, '沈北新区', '辽宁省');
INSERT INTO `jgb` VALUES (210114, 210000, '于洪区', '辽宁省');
INSERT INTO `jgb` VALUES (210115, 210000, '辽中区', '辽宁省');
INSERT INTO `jgb` VALUES (210123, 210000, '康平县', '辽宁省');
INSERT INTO `jgb` VALUES (210124, 210000, '法库县', '辽宁省');
INSERT INTO `jgb` VALUES (210181, 210000, '新民市', '辽宁省');
INSERT INTO `jgb` VALUES (210200, 210000, '大连市', '辽宁省');
INSERT INTO `jgb` VALUES (210202, 210000, '中山区', '辽宁省');
INSERT INTO `jgb` VALUES (210203, 210000, '西岗区', '辽宁省');
INSERT INTO `jgb` VALUES (210204, 210000, '沙河口区', '辽宁省');
INSERT INTO `jgb` VALUES (210211, 210000, '甘井子区', '辽宁省');
INSERT INTO `jgb` VALUES (210212, 210000, '旅顺口区', '辽宁省');
INSERT INTO `jgb` VALUES (210213, 210000, '金州区', '辽宁省');
INSERT INTO `jgb` VALUES (210214, 210000, '普兰店区', '辽宁省');
INSERT INTO `jgb` VALUES (210224, 210000, '长海县', '辽宁省');
INSERT INTO `jgb` VALUES (210281, 210000, '瓦房店市', '辽宁省');
INSERT INTO `jgb` VALUES (210283, 210000, '庄河市', '辽宁省');
INSERT INTO `jgb` VALUES (210300, 210000, '鞍山市', '辽宁省');
INSERT INTO `jgb` VALUES (210302, 210000, '铁东区', '辽宁省');
INSERT INTO `jgb` VALUES (210303, 210000, '铁西区', '辽宁省');
INSERT INTO `jgb` VALUES (210304, 210000, '立山区', '辽宁省');
INSERT INTO `jgb` VALUES (210311, 210000, '千山区', '辽宁省');
INSERT INTO `jgb` VALUES (210321, 210000, '台安县', '辽宁省');
INSERT INTO `jgb` VALUES (210323, 210000, '岫岩满族自治县', '辽宁省');
INSERT INTO `jgb` VALUES (210381, 210000, '海城市', '辽宁省');
INSERT INTO `jgb` VALUES (210400, 210000, '抚顺市', '辽宁省');
INSERT INTO `jgb` VALUES (210402, 210000, '新抚区', '辽宁省');
INSERT INTO `jgb` VALUES (210403, 210000, '东洲区', '辽宁省');
INSERT INTO `jgb` VALUES (210404, 210000, '望花区', '辽宁省');
INSERT INTO `jgb` VALUES (210411, 210000, '顺城区', '辽宁省');
INSERT INTO `jgb` VALUES (210421, 210000, '抚顺县', '辽宁省');
INSERT INTO `jgb` VALUES (210422, 210000, '新宾满族自治县', '辽宁省');
INSERT INTO `jgb` VALUES (210423, 210000, '清原满族自治县', '辽宁省');
INSERT INTO `jgb` VALUES (210500, 210000, '本溪市', '辽宁省');
INSERT INTO `jgb` VALUES (210502, 210000, '平山区', '辽宁省');
INSERT INTO `jgb` VALUES (210503, 210000, '溪湖区', '辽宁省');
INSERT INTO `jgb` VALUES (210504, 210000, '明山区', '辽宁省');
INSERT INTO `jgb` VALUES (210505, 210000, '南芬区', '辽宁省');
INSERT INTO `jgb` VALUES (210521, 210000, '本溪满族自治县', '辽宁省');
INSERT INTO `jgb` VALUES (210522, 210000, '桓仁满族自治县', '辽宁省');
INSERT INTO `jgb` VALUES (210600, 210000, '丹东市', '辽宁省');
INSERT INTO `jgb` VALUES (210602, 210000, '元宝区', '辽宁省');
INSERT INTO `jgb` VALUES (210603, 210000, '振兴区', '辽宁省');
INSERT INTO `jgb` VALUES (210604, 210000, '振安区', '辽宁省');
INSERT INTO `jgb` VALUES (210624, 210000, '宽甸满族自治县', '辽宁省');
INSERT INTO `jgb` VALUES (210681, 210000, '东港市', '辽宁省');
INSERT INTO `jgb` VALUES (210682, 210000, '凤城市', '辽宁省');
INSERT INTO `jgb` VALUES (210700, 210000, '锦州市', '辽宁省');
INSERT INTO `jgb` VALUES (210702, 210000, '古塔区', '辽宁省');
INSERT INTO `jgb` VALUES (210703, 210000, '凌河区', '辽宁省');
INSERT INTO `jgb` VALUES (210711, 210000, '太和区', '辽宁省');
INSERT INTO `jgb` VALUES (210726, 210000, '黑山县', '辽宁省');
INSERT INTO `jgb` VALUES (210727, 210000, '义县', '辽宁省');
INSERT INTO `jgb` VALUES (210781, 210000, '凌海市', '辽宁省');
INSERT INTO `jgb` VALUES (210782, 210000, '北镇市', '辽宁省');
INSERT INTO `jgb` VALUES (210800, 210000, '营口市', '辽宁省');
INSERT INTO `jgb` VALUES (210802, 210000, '站前区', '辽宁省');
INSERT INTO `jgb` VALUES (210803, 210000, '西市区', '辽宁省');
INSERT INTO `jgb` VALUES (210804, 210000, '鲅鱼圈区', '辽宁省');
INSERT INTO `jgb` VALUES (210811, 210000, '老边区', '辽宁省');
INSERT INTO `jgb` VALUES (210881, 210000, '盖州市', '辽宁省');
INSERT INTO `jgb` VALUES (210882, 210000, '大石桥市', '辽宁省');
INSERT INTO `jgb` VALUES (210900, 210000, '阜新市', '辽宁省');
INSERT INTO `jgb` VALUES (210902, 210000, '海州区', '辽宁省');
INSERT INTO `jgb` VALUES (210903, 210000, '新邱区', '辽宁省');
INSERT INTO `jgb` VALUES (210904, 210000, '太平区', '辽宁省');
INSERT INTO `jgb` VALUES (210905, 210000, '清河门区', '辽宁省');
INSERT INTO `jgb` VALUES (210911, 210000, '细河区', '辽宁省');
INSERT INTO `jgb` VALUES (210921, 210000, '阜新蒙古族自治县', '辽宁省');
INSERT INTO `jgb` VALUES (210922, 210000, '彰武县', '辽宁省');
INSERT INTO `jgb` VALUES (211000, 210000, '辽阳市', '辽宁省');
INSERT INTO `jgb` VALUES (211002, 210000, '白塔区', '辽宁省');
INSERT INTO `jgb` VALUES (211003, 210000, '文圣区', '辽宁省');
INSERT INTO `jgb` VALUES (211004, 210000, '宏伟区', '辽宁省');
INSERT INTO `jgb` VALUES (211005, 210000, '弓长岭区', '辽宁省');
INSERT INTO `jgb` VALUES (211011, 210000, '太子河区', '辽宁省');
INSERT INTO `jgb` VALUES (211021, 210000, '辽阳县', '辽宁省');
INSERT INTO `jgb` VALUES (211081, 210000, '灯塔市', '辽宁省');
INSERT INTO `jgb` VALUES (211100, 210000, '盘锦市', '辽宁省');
INSERT INTO `jgb` VALUES (211102, 210000, '双台子区', '辽宁省');
INSERT INTO `jgb` VALUES (211103, 210000, '兴隆台区', '辽宁省');
INSERT INTO `jgb` VALUES (211104, 210000, '大洼区', '辽宁省');
INSERT INTO `jgb` VALUES (211122, 210000, '盘山县', '辽宁省');
INSERT INTO `jgb` VALUES (211200, 210000, '铁岭市', '辽宁省');
INSERT INTO `jgb` VALUES (211202, 210000, '银州区', '辽宁省');
INSERT INTO `jgb` VALUES (211204, 210000, '清河区', '辽宁省');
INSERT INTO `jgb` VALUES (211221, 210000, '铁岭县', '辽宁省');
INSERT INTO `jgb` VALUES (211223, 210000, '西丰县', '辽宁省');
INSERT INTO `jgb` VALUES (211224, 210000, '昌图县', '辽宁省');
INSERT INTO `jgb` VALUES (211281, 210000, '调兵山市', '辽宁省');
INSERT INTO `jgb` VALUES (211282, 210000, '开原市', '辽宁省');
INSERT INTO `jgb` VALUES (211300, 210000, '朝阳市', '辽宁省');
INSERT INTO `jgb` VALUES (211302, 210000, '双塔区', '辽宁省');
INSERT INTO `jgb` VALUES (211303, 210000, '龙城区', '辽宁省');
INSERT INTO `jgb` VALUES (211321, 210000, '朝阳县', '辽宁省');
INSERT INTO `jgb` VALUES (211322, 210000, '建平县', '辽宁省');
INSERT INTO `jgb` VALUES (211324, 210000, '喀喇沁左翼蒙古族自治县', '辽宁省');
INSERT INTO `jgb` VALUES (211381, 210000, '北票市', '辽宁省');
INSERT INTO `jgb` VALUES (211382, 210000, '凌源市', '辽宁省');
INSERT INTO `jgb` VALUES (211400, 210000, '葫芦岛市', '辽宁省');
INSERT INTO `jgb` VALUES (211402, 210000, '连山区', '辽宁省');
INSERT INTO `jgb` VALUES (211403, 210000, '龙港区', '辽宁省');
INSERT INTO `jgb` VALUES (211404, 210000, '南票区', '辽宁省');
INSERT INTO `jgb` VALUES (211421, 210000, '绥中县', '辽宁省');
INSERT INTO `jgb` VALUES (211422, 210000, '建昌县', '辽宁省');
INSERT INTO `jgb` VALUES (211481, 210000, '兴城市', '辽宁省');
INSERT INTO `jgb` VALUES (220000, 220000, '吉林省', '吉林省');
INSERT INTO `jgb` VALUES (220100, 220000, '长春市', '吉林省');
INSERT INTO `jgb` VALUES (220102, 220000, '南关区', '吉林省');
INSERT INTO `jgb` VALUES (220103, 220000, '宽城区', '吉林省');
INSERT INTO `jgb` VALUES (220104, 220000, '朝阳区', '吉林省');
INSERT INTO `jgb` VALUES (220105, 220000, '二道区', '吉林省');
INSERT INTO `jgb` VALUES (220106, 220000, '绿园区', '吉林省');
INSERT INTO `jgb` VALUES (220112, 220000, '双阳区', '吉林省');
INSERT INTO `jgb` VALUES (220113, 220000, '九台区', '吉林省');
INSERT INTO `jgb` VALUES (220122, 220000, '农安县', '吉林省');
INSERT INTO `jgb` VALUES (220182, 220000, '榆树市', '吉林省');
INSERT INTO `jgb` VALUES (220183, 220000, '德惠市', '吉林省');
INSERT INTO `jgb` VALUES (220200, 220000, '吉林市', '吉林省');
INSERT INTO `jgb` VALUES (220202, 220000, '昌邑区', '吉林省');
INSERT INTO `jgb` VALUES (220203, 220000, '龙潭区', '吉林省');
INSERT INTO `jgb` VALUES (220204, 220000, '船营区', '吉林省');
INSERT INTO `jgb` VALUES (220211, 220000, '丰满区', '吉林省');
INSERT INTO `jgb` VALUES (220221, 220000, '永吉县', '吉林省');
INSERT INTO `jgb` VALUES (220281, 220000, '蛟河市', '吉林省');
INSERT INTO `jgb` VALUES (220282, 220000, '桦甸市', '吉林省');
INSERT INTO `jgb` VALUES (220283, 220000, '舒兰市', '吉林省');
INSERT INTO `jgb` VALUES (220284, 220000, '磐石市', '吉林省');
INSERT INTO `jgb` VALUES (220300, 220000, '四平市', '吉林省');
INSERT INTO `jgb` VALUES (220302, 220000, '铁西区', '吉林省');
INSERT INTO `jgb` VALUES (220303, 220000, '铁东区', '吉林省');
INSERT INTO `jgb` VALUES (220322, 220000, '梨树县', '吉林省');
INSERT INTO `jgb` VALUES (220323, 220000, '伊通满族自治县', '吉林省');
INSERT INTO `jgb` VALUES (220381, 220000, '公主岭市', '吉林省');
INSERT INTO `jgb` VALUES (220382, 220000, '双辽市', '吉林省');
INSERT INTO `jgb` VALUES (220400, 220000, '辽源市', '吉林省');
INSERT INTO `jgb` VALUES (220402, 220000, '龙山区', '吉林省');
INSERT INTO `jgb` VALUES (220403, 220000, '西安区', '吉林省');
INSERT INTO `jgb` VALUES (220421, 220000, '东丰县', '吉林省');
INSERT INTO `jgb` VALUES (220422, 220000, '东辽县', '吉林省');
INSERT INTO `jgb` VALUES (220500, 220000, '通化市', '吉林省');
INSERT INTO `jgb` VALUES (220502, 220000, '东昌区', '吉林省');
INSERT INTO `jgb` VALUES (220503, 220000, '二道江区', '吉林省');
INSERT INTO `jgb` VALUES (220521, 220000, '通化县', '吉林省');
INSERT INTO `jgb` VALUES (220523, 220000, '辉南县', '吉林省');
INSERT INTO `jgb` VALUES (220524, 220000, '柳河县', '吉林省');
INSERT INTO `jgb` VALUES (220581, 220000, '梅河口市', '吉林省');
INSERT INTO `jgb` VALUES (220582, 220000, '集安市', '吉林省');
INSERT INTO `jgb` VALUES (220600, 220000, '白山市', '吉林省');
INSERT INTO `jgb` VALUES (220602, 220000, '浑江区', '吉林省');
INSERT INTO `jgb` VALUES (220605, 220000, '江源区', '吉林省');
INSERT INTO `jgb` VALUES (220621, 220000, '抚松县', '吉林省');
INSERT INTO `jgb` VALUES (220622, 220000, '靖宇县', '吉林省');
INSERT INTO `jgb` VALUES (220623, 220000, '长白朝鲜族自治县', '吉林省');
INSERT INTO `jgb` VALUES (220681, 220000, '临江市', '吉林省');
INSERT INTO `jgb` VALUES (220700, 220000, '松原市', '吉林省');
INSERT INTO `jgb` VALUES (220702, 220000, '宁江区', '吉林省');
INSERT INTO `jgb` VALUES (220721, 220000, '前郭尔罗斯蒙古族自治县', '吉林省');
INSERT INTO `jgb` VALUES (220722, 220000, '长岭县', '吉林省');
INSERT INTO `jgb` VALUES (220723, 220000, '乾安县', '吉林省');
INSERT INTO `jgb` VALUES (220781, 220000, '扶余市', '吉林省');
INSERT INTO `jgb` VALUES (220800, 220000, '白城市', '吉林省');
INSERT INTO `jgb` VALUES (220802, 220000, '洮北区', '吉林省');
INSERT INTO `jgb` VALUES (220821, 220000, '镇赉县', '吉林省');
INSERT INTO `jgb` VALUES (220822, 220000, '通榆县', '吉林省');
INSERT INTO `jgb` VALUES (220881, 220000, '洮南市', '吉林省');
INSERT INTO `jgb` VALUES (220882, 220000, '大安市', '吉林省');
INSERT INTO `jgb` VALUES (222400, 220000, '延边朝鲜族自治州', '吉林省');
INSERT INTO `jgb` VALUES (222401, 220000, '延吉市', '吉林省');
INSERT INTO `jgb` VALUES (222402, 220000, '图们市', '吉林省');
INSERT INTO `jgb` VALUES (222403, 220000, '敦化市', '吉林省');
INSERT INTO `jgb` VALUES (222404, 220000, '珲春市', '吉林省');
INSERT INTO `jgb` VALUES (222405, 220000, '龙井市', '吉林省');
INSERT INTO `jgb` VALUES (222406, 220000, '和龙市', '吉林省');
INSERT INTO `jgb` VALUES (222424, 220000, '汪清县', '吉林省');
INSERT INTO `jgb` VALUES (222426, 220000, '安图县', '吉林省');
INSERT INTO `jgb` VALUES (230000, 230000, '黑龙江省', '黑龙江省');
INSERT INTO `jgb` VALUES (230100, 230000, '哈尔滨市', '黑龙江省');
INSERT INTO `jgb` VALUES (230102, 230000, '道里区', '黑龙江省');
INSERT INTO `jgb` VALUES (230103, 230000, '南岗区', '黑龙江省');
INSERT INTO `jgb` VALUES (230104, 230000, '道外区', '黑龙江省');
INSERT INTO `jgb` VALUES (230108, 230000, '平房区', '黑龙江省');
INSERT INTO `jgb` VALUES (230109, 230000, '松北区', '黑龙江省');
INSERT INTO `jgb` VALUES (230110, 230000, '香坊区', '黑龙江省');
INSERT INTO `jgb` VALUES (230111, 230000, '呼兰区', '黑龙江省');
INSERT INTO `jgb` VALUES (230112, 230000, '阿城区', '黑龙江省');
INSERT INTO `jgb` VALUES (230113, 230000, '双城区', '黑龙江省');
INSERT INTO `jgb` VALUES (230123, 230000, '依兰县', '黑龙江省');
INSERT INTO `jgb` VALUES (230124, 230000, '方正县', '黑龙江省');
INSERT INTO `jgb` VALUES (230125, 230000, '宾县', '黑龙江省');
INSERT INTO `jgb` VALUES (230126, 230000, '巴彦县', '黑龙江省');
INSERT INTO `jgb` VALUES (230127, 230000, '木兰县', '黑龙江省');
INSERT INTO `jgb` VALUES (230128, 230000, '通河县', '黑龙江省');
INSERT INTO `jgb` VALUES (230129, 230000, '延寿县', '黑龙江省');
INSERT INTO `jgb` VALUES (230183, 230000, '尚志市', '黑龙江省');
INSERT INTO `jgb` VALUES (230184, 230000, '五常市', '黑龙江省');
INSERT INTO `jgb` VALUES (230200, 230000, '齐齐哈尔市', '黑龙江省');
INSERT INTO `jgb` VALUES (230202, 230000, '龙沙区', '黑龙江省');
INSERT INTO `jgb` VALUES (230203, 230000, '建华区', '黑龙江省');
INSERT INTO `jgb` VALUES (230204, 230000, '铁锋区', '黑龙江省');
INSERT INTO `jgb` VALUES (230205, 230000, '昂昂溪区', '黑龙江省');
INSERT INTO `jgb` VALUES (230206, 230000, '富拉尔基区', '黑龙江省');
INSERT INTO `jgb` VALUES (230207, 230000, '碾子山区', '黑龙江省');
INSERT INTO `jgb` VALUES (230208, 230000, '梅里斯达斡尔族区', '黑龙江省');
INSERT INTO `jgb` VALUES (230221, 230000, '龙江县', '黑龙江省');
INSERT INTO `jgb` VALUES (230223, 230000, '依安县', '黑龙江省');
INSERT INTO `jgb` VALUES (230224, 230000, '泰来县', '黑龙江省');
INSERT INTO `jgb` VALUES (230225, 230000, '甘南县', '黑龙江省');
INSERT INTO `jgb` VALUES (230227, 230000, '富裕县', '黑龙江省');
INSERT INTO `jgb` VALUES (230229, 230000, '克山县', '黑龙江省');
INSERT INTO `jgb` VALUES (230230, 230000, '克东县', '黑龙江省');
INSERT INTO `jgb` VALUES (230231, 230000, '拜泉县', '黑龙江省');
INSERT INTO `jgb` VALUES (230281, 230000, '讷河市', '黑龙江省');
INSERT INTO `jgb` VALUES (230300, 230000, '鸡西市', '黑龙江省');
INSERT INTO `jgb` VALUES (230302, 230000, '鸡冠区', '黑龙江省');
INSERT INTO `jgb` VALUES (230303, 230000, '恒山区', '黑龙江省');
INSERT INTO `jgb` VALUES (230304, 230000, '滴道区', '黑龙江省');
INSERT INTO `jgb` VALUES (230305, 230000, '梨树区', '黑龙江省');
INSERT INTO `jgb` VALUES (230306, 230000, '城子河区', '黑龙江省');
INSERT INTO `jgb` VALUES (230307, 230000, '麻山区', '黑龙江省');
INSERT INTO `jgb` VALUES (230321, 230000, '鸡东县', '黑龙江省');
INSERT INTO `jgb` VALUES (230381, 230000, '虎林市', '黑龙江省');
INSERT INTO `jgb` VALUES (230382, 230000, '密山市', '黑龙江省');
INSERT INTO `jgb` VALUES (230400, 230000, '鹤岗市', '黑龙江省');
INSERT INTO `jgb` VALUES (230402, 230000, '向阳区', '黑龙江省');
INSERT INTO `jgb` VALUES (230403, 230000, '工农区', '黑龙江省');
INSERT INTO `jgb` VALUES (230404, 230000, '南山区', '黑龙江省');
INSERT INTO `jgb` VALUES (230405, 230000, '兴安区', '黑龙江省');
INSERT INTO `jgb` VALUES (230406, 230000, '东山区', '黑龙江省');
INSERT INTO `jgb` VALUES (230407, 230000, '兴山区', '黑龙江省');
INSERT INTO `jgb` VALUES (230421, 230000, '萝北县', '黑龙江省');
INSERT INTO `jgb` VALUES (230422, 230000, '绥滨县', '黑龙江省');
INSERT INTO `jgb` VALUES (230500, 230000, '双鸭山市', '黑龙江省');
INSERT INTO `jgb` VALUES (230502, 230000, '尖山区', '黑龙江省');
INSERT INTO `jgb` VALUES (230503, 230000, '岭东区', '黑龙江省');
INSERT INTO `jgb` VALUES (230505, 230000, '四方台区', '黑龙江省');
INSERT INTO `jgb` VALUES (230506, 230000, '宝山区', '黑龙江省');
INSERT INTO `jgb` VALUES (230521, 230000, '集贤县', '黑龙江省');
INSERT INTO `jgb` VALUES (230522, 230000, '友谊县', '黑龙江省');
INSERT INTO `jgb` VALUES (230523, 230000, '宝清县', '黑龙江省');
INSERT INTO `jgb` VALUES (230524, 230000, '饶河县', '黑龙江省');
INSERT INTO `jgb` VALUES (230600, 230000, '大庆市', '黑龙江省');
INSERT INTO `jgb` VALUES (230602, 230000, '萨尔图区', '黑龙江省');
INSERT INTO `jgb` VALUES (230603, 230000, '龙凤区', '黑龙江省');
INSERT INTO `jgb` VALUES (230604, 230000, '让胡路区', '黑龙江省');
INSERT INTO `jgb` VALUES (230605, 230000, '红岗区', '黑龙江省');
INSERT INTO `jgb` VALUES (230606, 230000, '大同区', '黑龙江省');
INSERT INTO `jgb` VALUES (230621, 230000, '肇州县', '黑龙江省');
INSERT INTO `jgb` VALUES (230622, 230000, '肇源县', '黑龙江省');
INSERT INTO `jgb` VALUES (230623, 230000, '林甸县', '黑龙江省');
INSERT INTO `jgb` VALUES (230624, 230000, '杜尔伯特蒙古族自治县', '黑龙江省');
INSERT INTO `jgb` VALUES (230700, 230000, '伊春市', '黑龙江省');
INSERT INTO `jgb` VALUES (230702, 230000, '伊春区', '黑龙江省');
INSERT INTO `jgb` VALUES (230703, 230000, '南岔区', '黑龙江省');
INSERT INTO `jgb` VALUES (230704, 230000, '友好区', '黑龙江省');
INSERT INTO `jgb` VALUES (230705, 230000, '西林区', '黑龙江省');
INSERT INTO `jgb` VALUES (230706, 230000, '翠峦区', '黑龙江省');
INSERT INTO `jgb` VALUES (230707, 230000, '新青区', '黑龙江省');
INSERT INTO `jgb` VALUES (230708, 230000, '美溪区', '黑龙江省');
INSERT INTO `jgb` VALUES (230709, 230000, '金山屯区', '黑龙江省');
INSERT INTO `jgb` VALUES (230710, 230000, '五营区', '黑龙江省');
INSERT INTO `jgb` VALUES (230711, 230000, '乌马河区', '黑龙江省');
INSERT INTO `jgb` VALUES (230712, 230000, '汤旺河区', '黑龙江省');
INSERT INTO `jgb` VALUES (230713, 230000, '带岭区', '黑龙江省');
INSERT INTO `jgb` VALUES (230714, 230000, '乌伊岭区', '黑龙江省');
INSERT INTO `jgb` VALUES (230715, 230000, '红星区', '黑龙江省');
INSERT INTO `jgb` VALUES (230716, 230000, '上甘岭区', '黑龙江省');
INSERT INTO `jgb` VALUES (230722, 230000, '嘉荫县', '黑龙江省');
INSERT INTO `jgb` VALUES (230781, 230000, '铁力市', '黑龙江省');
INSERT INTO `jgb` VALUES (230800, 230000, '佳木斯市', '黑龙江省');
INSERT INTO `jgb` VALUES (230803, 230000, '向阳区', '黑龙江省');
INSERT INTO `jgb` VALUES (230804, 230000, '前进区', '黑龙江省');
INSERT INTO `jgb` VALUES (230805, 230000, '东风区', '黑龙江省');
INSERT INTO `jgb` VALUES (230811, 230000, '郊区', '黑龙江省');
INSERT INTO `jgb` VALUES (230822, 230000, '桦南县', '黑龙江省');
INSERT INTO `jgb` VALUES (230826, 230000, '桦川县', '黑龙江省');
INSERT INTO `jgb` VALUES (230828, 230000, '汤原县', '黑龙江省');
INSERT INTO `jgb` VALUES (230881, 230000, '同江市', '黑龙江省');
INSERT INTO `jgb` VALUES (230882, 230000, '富锦市', '黑龙江省');
INSERT INTO `jgb` VALUES (230883, 230000, '抚远市', '黑龙江省');
INSERT INTO `jgb` VALUES (230900, 230000, '七台河市', '黑龙江省');
INSERT INTO `jgb` VALUES (230902, 230000, '新兴区', '黑龙江省');
INSERT INTO `jgb` VALUES (230903, 230000, '桃山区', '黑龙江省');
INSERT INTO `jgb` VALUES (230904, 230000, '茄子河区', '黑龙江省');
INSERT INTO `jgb` VALUES (230921, 230000, '勃利县', '黑龙江省');
INSERT INTO `jgb` VALUES (231000, 230000, '牡丹江市', '黑龙江省');
INSERT INTO `jgb` VALUES (231002, 230000, '东安区', '黑龙江省');
INSERT INTO `jgb` VALUES (231003, 230000, '阳明区', '黑龙江省');
INSERT INTO `jgb` VALUES (231004, 230000, '爱民区', '黑龙江省');
INSERT INTO `jgb` VALUES (231005, 230000, '西安区', '黑龙江省');
INSERT INTO `jgb` VALUES (231025, 230000, '林口县', '黑龙江省');
INSERT INTO `jgb` VALUES (231081, 230000, '绥芬河市', '黑龙江省');
INSERT INTO `jgb` VALUES (231083, 230000, '海林市', '黑龙江省');
INSERT INTO `jgb` VALUES (231084, 230000, '宁安市', '黑龙江省');
INSERT INTO `jgb` VALUES (231085, 230000, '穆棱市', '黑龙江省');
INSERT INTO `jgb` VALUES (231086, 230000, '东宁市', '黑龙江省');
INSERT INTO `jgb` VALUES (231100, 230000, '黑河市', '黑龙江省');
INSERT INTO `jgb` VALUES (231102, 230000, '爱辉区', '黑龙江省');
INSERT INTO `jgb` VALUES (231121, 230000, '嫩江县', '黑龙江省');
INSERT INTO `jgb` VALUES (231123, 230000, '逊克县', '黑龙江省');
INSERT INTO `jgb` VALUES (231124, 230000, '孙吴县', '黑龙江省');
INSERT INTO `jgb` VALUES (231181, 230000, '北安市', '黑龙江省');
INSERT INTO `jgb` VALUES (231182, 230000, '五大连池市', '黑龙江省');
INSERT INTO `jgb` VALUES (231200, 230000, '绥化市', '黑龙江省');
INSERT INTO `jgb` VALUES (231202, 230000, '北林区', '黑龙江省');
INSERT INTO `jgb` VALUES (231221, 230000, '望奎县', '黑龙江省');
INSERT INTO `jgb` VALUES (231222, 230000, '兰西县', '黑龙江省');
INSERT INTO `jgb` VALUES (231223, 230000, '青冈县', '黑龙江省');
INSERT INTO `jgb` VALUES (231224, 230000, '庆安县', '黑龙江省');
INSERT INTO `jgb` VALUES (231225, 230000, '明水县', '黑龙江省');
INSERT INTO `jgb` VALUES (231226, 230000, '绥棱县', '黑龙江省');
INSERT INTO `jgb` VALUES (231281, 230000, '安达市', '黑龙江省');
INSERT INTO `jgb` VALUES (231282, 230000, '肇东市', '黑龙江省');
INSERT INTO `jgb` VALUES (231283, 230000, '海伦市', '黑龙江省');
INSERT INTO `jgb` VALUES (232700, 230000, '大兴安岭地区', '黑龙江省');
INSERT INTO `jgb` VALUES (232721, 230000, '呼玛县', '黑龙江省');
INSERT INTO `jgb` VALUES (232722, 230000, '塔河县', '黑龙江省');
INSERT INTO `jgb` VALUES (232723, 230000, '漠河县', '黑龙江省');
INSERT INTO `jgb` VALUES (310000, 310000, '上海市', '上海市');
INSERT INTO `jgb` VALUES (310101, 310000, '黄浦区', '上海市');
INSERT INTO `jgb` VALUES (310104, 310000, '徐汇区', '上海市');
INSERT INTO `jgb` VALUES (310105, 310000, '长宁区', '上海市');
INSERT INTO `jgb` VALUES (310106, 310000, '静安区', '上海市');
INSERT INTO `jgb` VALUES (310107, 310000, '普陀区', '上海市');
INSERT INTO `jgb` VALUES (310109, 310000, '虹口区', '上海市');
INSERT INTO `jgb` VALUES (310110, 310000, '杨浦区', '上海市');
INSERT INTO `jgb` VALUES (310112, 310000, '闵行区', '上海市');
INSERT INTO `jgb` VALUES (310113, 310000, '宝山区', '上海市');
INSERT INTO `jgb` VALUES (310114, 310000, '嘉定区', '上海市');
INSERT INTO `jgb` VALUES (310115, 310000, '浦东新区', '上海市');
INSERT INTO `jgb` VALUES (310116, 310000, '金山区', '上海市');
INSERT INTO `jgb` VALUES (310117, 310000, '松江区', '上海市');
INSERT INTO `jgb` VALUES (310118, 310000, '青浦区', '上海市');
INSERT INTO `jgb` VALUES (310120, 310000, '奉贤区', '上海市');
INSERT INTO `jgb` VALUES (310151, 310000, '崇明区', '上海市');
INSERT INTO `jgb` VALUES (320000, 320000, '江苏省', '江苏省');
INSERT INTO `jgb` VALUES (320100, 320000, '南京市', '江苏省');
INSERT INTO `jgb` VALUES (320102, 320000, '玄武区', '江苏省');
INSERT INTO `jgb` VALUES (320104, 320000, '秦淮区', '江苏省');
INSERT INTO `jgb` VALUES (320105, 320000, '建邺区', '江苏省');
INSERT INTO `jgb` VALUES (320106, 320000, '鼓楼区', '江苏省');
INSERT INTO `jgb` VALUES (320111, 320000, '浦口区', '江苏省');
INSERT INTO `jgb` VALUES (320113, 320000, '栖霞区', '江苏省');
INSERT INTO `jgb` VALUES (320114, 320000, '雨花台区', '江苏省');
INSERT INTO `jgb` VALUES (320115, 320000, '江宁区', '江苏省');
INSERT INTO `jgb` VALUES (320116, 320000, '六合区', '江苏省');
INSERT INTO `jgb` VALUES (320117, 320000, '溧水区', '江苏省');
INSERT INTO `jgb` VALUES (320118, 320000, '高淳区', '江苏省');
INSERT INTO `jgb` VALUES (320200, 320000, '无锡市', '江苏省');
INSERT INTO `jgb` VALUES (320205, 320000, '锡山区', '江苏省');
INSERT INTO `jgb` VALUES (320206, 320000, '惠山区', '江苏省');
INSERT INTO `jgb` VALUES (320211, 320000, '滨湖区', '江苏省');
INSERT INTO `jgb` VALUES (320213, 320000, '梁溪区', '江苏省');
INSERT INTO `jgb` VALUES (320214, 320000, '新吴区', '江苏省');
INSERT INTO `jgb` VALUES (320281, 320000, '江阴市', '江苏省');
INSERT INTO `jgb` VALUES (320282, 320000, '宜兴市', '江苏省');
INSERT INTO `jgb` VALUES (320300, 320000, '徐州市', '江苏省');
INSERT INTO `jgb` VALUES (320302, 320000, '鼓楼区', '江苏省');
INSERT INTO `jgb` VALUES (320303, 320000, '云龙区', '江苏省');
INSERT INTO `jgb` VALUES (320305, 320000, '贾汪区', '江苏省');
INSERT INTO `jgb` VALUES (320311, 320000, '泉山区', '江苏省');
INSERT INTO `jgb` VALUES (320312, 320000, '铜山区', '江苏省');
INSERT INTO `jgb` VALUES (320321, 320000, '丰县', '江苏省');
INSERT INTO `jgb` VALUES (320322, 320000, '沛县', '江苏省');
INSERT INTO `jgb` VALUES (320324, 320000, '睢宁县', '江苏省');
INSERT INTO `jgb` VALUES (320381, 320000, '新沂市', '江苏省');
INSERT INTO `jgb` VALUES (320382, 320000, '邳州市', '江苏省');
INSERT INTO `jgb` VALUES (320400, 320000, '常州市', '江苏省');
INSERT INTO `jgb` VALUES (320402, 320000, '天宁区', '江苏省');
INSERT INTO `jgb` VALUES (320404, 320000, '钟楼区', '江苏省');
INSERT INTO `jgb` VALUES (320411, 320000, '新北区', '江苏省');
INSERT INTO `jgb` VALUES (320412, 320000, '武进区', '江苏省');
INSERT INTO `jgb` VALUES (320413, 320000, '金坛区', '江苏省');
INSERT INTO `jgb` VALUES (320481, 320000, '溧阳市', '江苏省');
INSERT INTO `jgb` VALUES (320500, 320000, '苏州市', '江苏省');
INSERT INTO `jgb` VALUES (320505, 320000, '虎丘区', '江苏省');
INSERT INTO `jgb` VALUES (320506, 320000, '吴中区', '江苏省');
INSERT INTO `jgb` VALUES (320507, 320000, '相城区', '江苏省');
INSERT INTO `jgb` VALUES (320508, 320000, '姑苏区', '江苏省');
INSERT INTO `jgb` VALUES (320509, 320000, '吴江区', '江苏省');
INSERT INTO `jgb` VALUES (320581, 320000, '常熟市', '江苏省');
INSERT INTO `jgb` VALUES (320582, 320000, '张家港市', '江苏省');
INSERT INTO `jgb` VALUES (320583, 320000, '昆山市', '江苏省');
INSERT INTO `jgb` VALUES (320585, 320000, '太仓市', '江苏省');
INSERT INTO `jgb` VALUES (320600, 320000, '南通市', '江苏省');
INSERT INTO `jgb` VALUES (320602, 320000, '崇川区', '江苏省');
INSERT INTO `jgb` VALUES (320611, 320000, '港闸区', '江苏省');
INSERT INTO `jgb` VALUES (320612, 320000, '通州区', '江苏省');
INSERT INTO `jgb` VALUES (320621, 320000, '海安县', '江苏省');
INSERT INTO `jgb` VALUES (320623, 320000, '如东县', '江苏省');
INSERT INTO `jgb` VALUES (320681, 320000, '启东市', '江苏省');
INSERT INTO `jgb` VALUES (320682, 320000, '如皋市', '江苏省');
INSERT INTO `jgb` VALUES (320684, 320000, '海门市', '江苏省');
INSERT INTO `jgb` VALUES (320700, 320000, '连云港市', '江苏省');
INSERT INTO `jgb` VALUES (320703, 320000, '连云区', '江苏省');
INSERT INTO `jgb` VALUES (320706, 320000, '海州区', '江苏省');
INSERT INTO `jgb` VALUES (320707, 320000, '赣榆区', '江苏省');
INSERT INTO `jgb` VALUES (320722, 320000, '东海县', '江苏省');
INSERT INTO `jgb` VALUES (320723, 320000, '灌云县', '江苏省');
INSERT INTO `jgb` VALUES (320724, 320000, '灌南县', '江苏省');
INSERT INTO `jgb` VALUES (320800, 320000, '淮安市', '江苏省');
INSERT INTO `jgb` VALUES (320803, 320000, '淮安区', '江苏省');
INSERT INTO `jgb` VALUES (320804, 320000, '淮阴区', '江苏省');
INSERT INTO `jgb` VALUES (320812, 320000, '清江浦区', '江苏省');
INSERT INTO `jgb` VALUES (320813, 320000, '洪泽区', '江苏省');
INSERT INTO `jgb` VALUES (320826, 320000, '涟水县', '江苏省');
INSERT INTO `jgb` VALUES (320830, 320000, '盱眙县', '江苏省');
INSERT INTO `jgb` VALUES (320831, 320000, '金湖县', '江苏省');
INSERT INTO `jgb` VALUES (320900, 320000, '盐城市', '江苏省');
INSERT INTO `jgb` VALUES (320902, 320000, '亭湖区', '江苏省');
INSERT INTO `jgb` VALUES (320903, 320000, '盐都区', '江苏省');
INSERT INTO `jgb` VALUES (320904, 320000, '大丰区', '江苏省');
INSERT INTO `jgb` VALUES (320921, 320000, '响水县', '江苏省');
INSERT INTO `jgb` VALUES (320922, 320000, '滨海县', '江苏省');
INSERT INTO `jgb` VALUES (320923, 320000, '阜宁县', '江苏省');
INSERT INTO `jgb` VALUES (320924, 320000, '射阳县', '江苏省');
INSERT INTO `jgb` VALUES (320925, 320000, '建湖县', '江苏省');
INSERT INTO `jgb` VALUES (320981, 320000, '东台市', '江苏省');
INSERT INTO `jgb` VALUES (321000, 320000, '扬州市', '江苏省');
INSERT INTO `jgb` VALUES (321002, 320000, '广陵区', '江苏省');
INSERT INTO `jgb` VALUES (321003, 320000, '邗江区', '江苏省');
INSERT INTO `jgb` VALUES (321012, 320000, '江都区', '江苏省');
INSERT INTO `jgb` VALUES (321023, 320000, '宝应县', '江苏省');
INSERT INTO `jgb` VALUES (321081, 320000, '仪征市', '江苏省');
INSERT INTO `jgb` VALUES (321084, 320000, '高邮市', '江苏省');
INSERT INTO `jgb` VALUES (321100, 320000, '镇江市', '江苏省');
INSERT INTO `jgb` VALUES (321102, 320000, '京口区', '江苏省');
INSERT INTO `jgb` VALUES (321111, 320000, '润州区', '江苏省');
INSERT INTO `jgb` VALUES (321112, 320000, '丹徒区', '江苏省');
INSERT INTO `jgb` VALUES (321181, 320000, '丹阳市', '江苏省');
INSERT INTO `jgb` VALUES (321182, 320000, '扬中市', '江苏省');
INSERT INTO `jgb` VALUES (321183, 320000, '句容市', '江苏省');
INSERT INTO `jgb` VALUES (321200, 320000, '泰州市', '江苏省');
INSERT INTO `jgb` VALUES (321202, 320000, '海陵区', '江苏省');
INSERT INTO `jgb` VALUES (321203, 320000, '高港区', '江苏省');
INSERT INTO `jgb` VALUES (321204, 320000, '姜堰区', '江苏省');
INSERT INTO `jgb` VALUES (321281, 320000, '兴化市', '江苏省');
INSERT INTO `jgb` VALUES (321282, 320000, '靖江市', '江苏省');
INSERT INTO `jgb` VALUES (321283, 320000, '泰兴市', '江苏省');
INSERT INTO `jgb` VALUES (321300, 320000, '宿迁市', '江苏省');
INSERT INTO `jgb` VALUES (321302, 320000, '宿城区', '江苏省');
INSERT INTO `jgb` VALUES (321311, 320000, '宿豫区', '江苏省');
INSERT INTO `jgb` VALUES (321322, 320000, '沭阳县', '江苏省');
INSERT INTO `jgb` VALUES (321323, 320000, '泗阳县', '江苏省');
INSERT INTO `jgb` VALUES (321324, 320000, '泗洪县', '江苏省');
INSERT INTO `jgb` VALUES (330000, 330000, '浙江省', '浙江省');
INSERT INTO `jgb` VALUES (330100, 330000, '杭州市', '浙江省');
INSERT INTO `jgb` VALUES (330102, 330000, '上城区', '浙江省');
INSERT INTO `jgb` VALUES (330103, 330000, '下城区', '浙江省');
INSERT INTO `jgb` VALUES (330104, 330000, '江干区', '浙江省');
INSERT INTO `jgb` VALUES (330105, 330000, '拱墅区', '浙江省');
INSERT INTO `jgb` VALUES (330106, 330000, '西湖区', '浙江省');
INSERT INTO `jgb` VALUES (330108, 330000, '滨江区', '浙江省');
INSERT INTO `jgb` VALUES (330109, 330000, '萧山区', '浙江省');
INSERT INTO `jgb` VALUES (330110, 330000, '余杭区', '浙江省');
INSERT INTO `jgb` VALUES (330111, 330000, '富阳区', '浙江省');
INSERT INTO `jgb` VALUES (330112, 330000, '临安区', '浙江省');
INSERT INTO `jgb` VALUES (330122, 330000, '桐庐县', '浙江省');
INSERT INTO `jgb` VALUES (330127, 330000, '淳安县', '浙江省');
INSERT INTO `jgb` VALUES (330182, 330000, '建德市', '浙江省');
INSERT INTO `jgb` VALUES (330200, 330000, '宁波市', '浙江省');
INSERT INTO `jgb` VALUES (330203, 330000, '海曙区', '浙江省');
INSERT INTO `jgb` VALUES (330205, 330000, '江北区', '浙江省');
INSERT INTO `jgb` VALUES (330206, 330000, '北仑区', '浙江省');
INSERT INTO `jgb` VALUES (330211, 330000, '镇海区', '浙江省');
INSERT INTO `jgb` VALUES (330212, 330000, '鄞州区', '浙江省');
INSERT INTO `jgb` VALUES (330213, 330000, '奉化区', '浙江省');
INSERT INTO `jgb` VALUES (330225, 330000, '象山县', '浙江省');
INSERT INTO `jgb` VALUES (330226, 330000, '宁海县', '浙江省');
INSERT INTO `jgb` VALUES (330281, 330000, '余姚市', '浙江省');
INSERT INTO `jgb` VALUES (330282, 330000, '慈溪市', '浙江省');
INSERT INTO `jgb` VALUES (330300, 330000, '温州市', '浙江省');
INSERT INTO `jgb` VALUES (330302, 330000, '鹿城区', '浙江省');
INSERT INTO `jgb` VALUES (330303, 330000, '龙湾区', '浙江省');
INSERT INTO `jgb` VALUES (330304, 330000, '瓯海区', '浙江省');
INSERT INTO `jgb` VALUES (330305, 330000, '洞头区', '浙江省');
INSERT INTO `jgb` VALUES (330324, 330000, '永嘉县', '浙江省');
INSERT INTO `jgb` VALUES (330326, 330000, '平阳县', '浙江省');
INSERT INTO `jgb` VALUES (330327, 330000, '苍南县', '浙江省');
INSERT INTO `jgb` VALUES (330328, 330000, '文成县', '浙江省');
INSERT INTO `jgb` VALUES (330329, 330000, '泰顺县', '浙江省');
INSERT INTO `jgb` VALUES (330381, 330000, '瑞安市', '浙江省');
INSERT INTO `jgb` VALUES (330382, 330000, '乐清市', '浙江省');
INSERT INTO `jgb` VALUES (330400, 330000, '嘉兴市', '浙江省');
INSERT INTO `jgb` VALUES (330402, 330000, '南湖区', '浙江省');
INSERT INTO `jgb` VALUES (330411, 330000, '秀洲区', '浙江省');
INSERT INTO `jgb` VALUES (330421, 330000, '嘉善县', '浙江省');
INSERT INTO `jgb` VALUES (330424, 330000, '海盐县', '浙江省');
INSERT INTO `jgb` VALUES (330481, 330000, '海宁市', '浙江省');
INSERT INTO `jgb` VALUES (330482, 330000, '平湖市', '浙江省');
INSERT INTO `jgb` VALUES (330483, 330000, '桐乡市', '浙江省');
INSERT INTO `jgb` VALUES (330500, 330000, '湖州市', '浙江省');
INSERT INTO `jgb` VALUES (330502, 330000, '吴兴区', '浙江省');
INSERT INTO `jgb` VALUES (330503, 330000, '南浔区', '浙江省');
INSERT INTO `jgb` VALUES (330521, 330000, '德清县', '浙江省');
INSERT INTO `jgb` VALUES (330522, 330000, '长兴县', '浙江省');
INSERT INTO `jgb` VALUES (330523, 330000, '安吉县', '浙江省');
INSERT INTO `jgb` VALUES (330600, 330000, '绍兴市', '浙江省');
INSERT INTO `jgb` VALUES (330602, 330000, '越城区', '浙江省');
INSERT INTO `jgb` VALUES (330603, 330000, '柯桥区', '浙江省');
INSERT INTO `jgb` VALUES (330604, 330000, '上虞区', '浙江省');
INSERT INTO `jgb` VALUES (330624, 330000, '新昌县', '浙江省');
INSERT INTO `jgb` VALUES (330681, 330000, '诸暨市', '浙江省');
INSERT INTO `jgb` VALUES (330683, 330000, '嵊州市', '浙江省');
INSERT INTO `jgb` VALUES (330700, 330000, '金华市', '浙江省');
INSERT INTO `jgb` VALUES (330702, 330000, '婺城区', '浙江省');
INSERT INTO `jgb` VALUES (330703, 330000, '金东区', '浙江省');
INSERT INTO `jgb` VALUES (330723, 330000, '武义县', '浙江省');
INSERT INTO `jgb` VALUES (330726, 330000, '浦江县', '浙江省');
INSERT INTO `jgb` VALUES (330727, 330000, '磐安县', '浙江省');
INSERT INTO `jgb` VALUES (330781, 330000, '兰溪市', '浙江省');
INSERT INTO `jgb` VALUES (330782, 330000, '义乌市', '浙江省');
INSERT INTO `jgb` VALUES (330783, 330000, '东阳市', '浙江省');
INSERT INTO `jgb` VALUES (330784, 330000, '永康市', '浙江省');
INSERT INTO `jgb` VALUES (330800, 330000, '衢州市', '浙江省');
INSERT INTO `jgb` VALUES (330802, 330000, '柯城区', '浙江省');
INSERT INTO `jgb` VALUES (330803, 330000, '衢江区', '浙江省');
INSERT INTO `jgb` VALUES (330822, 330000, '常山县', '浙江省');
INSERT INTO `jgb` VALUES (330824, 330000, '开化县', '浙江省');
INSERT INTO `jgb` VALUES (330825, 330000, '龙游县', '浙江省');
INSERT INTO `jgb` VALUES (330881, 330000, '江山市', '浙江省');
INSERT INTO `jgb` VALUES (330900, 330000, '舟山市', '浙江省');
INSERT INTO `jgb` VALUES (330902, 330000, '定海区', '浙江省');
INSERT INTO `jgb` VALUES (330903, 330000, '普陀区', '浙江省');
INSERT INTO `jgb` VALUES (330921, 330000, '岱山县', '浙江省');
INSERT INTO `jgb` VALUES (330922, 330000, '嵊泗县', '浙江省');
INSERT INTO `jgb` VALUES (331000, 330000, '台州市', '浙江省');
INSERT INTO `jgb` VALUES (331002, 330000, '椒江区', '浙江省');
INSERT INTO `jgb` VALUES (331003, 330000, '黄岩区', '浙江省');
INSERT INTO `jgb` VALUES (331004, 330000, '路桥区', '浙江省');
INSERT INTO `jgb` VALUES (331022, 330000, '三门县', '浙江省');
INSERT INTO `jgb` VALUES (331023, 330000, '天台县', '浙江省');
INSERT INTO `jgb` VALUES (331024, 330000, '仙居县', '浙江省');
INSERT INTO `jgb` VALUES (331081, 330000, '温岭市', '浙江省');
INSERT INTO `jgb` VALUES (331082, 330000, '临海市', '浙江省');
INSERT INTO `jgb` VALUES (331083, 330000, '玉环市', '浙江省');
INSERT INTO `jgb` VALUES (331100, 330000, '丽水市', '浙江省');
INSERT INTO `jgb` VALUES (331102, 330000, '莲都区', '浙江省');
INSERT INTO `jgb` VALUES (331121, 330000, '青田县', '浙江省');
INSERT INTO `jgb` VALUES (331122, 330000, '缙云县', '浙江省');
INSERT INTO `jgb` VALUES (331123, 330000, '遂昌县', '浙江省');
INSERT INTO `jgb` VALUES (331124, 330000, '松阳县', '浙江省');
INSERT INTO `jgb` VALUES (331125, 330000, '云和县', '浙江省');
INSERT INTO `jgb` VALUES (331126, 330000, '庆元县', '浙江省');
INSERT INTO `jgb` VALUES (331127, 330000, '景宁畲族自治县', '浙江省');
INSERT INTO `jgb` VALUES (331181, 330000, '龙泉市', '浙江省');
INSERT INTO `jgb` VALUES (340000, 340000, '安徽省', '安徽省');
INSERT INTO `jgb` VALUES (340100, 340000, '合肥市', '安徽省');
INSERT INTO `jgb` VALUES (340102, 340000, '瑶海区', '安徽省');
INSERT INTO `jgb` VALUES (340103, 340000, '庐阳区', '安徽省');
INSERT INTO `jgb` VALUES (340104, 340000, '蜀山区', '安徽省');
INSERT INTO `jgb` VALUES (340111, 340000, '包河区', '安徽省');
INSERT INTO `jgb` VALUES (340121, 340000, '长丰县', '安徽省');
INSERT INTO `jgb` VALUES (340122, 340000, '肥东县', '安徽省');
INSERT INTO `jgb` VALUES (340123, 340000, '肥西县', '安徽省');
INSERT INTO `jgb` VALUES (340124, 340000, '庐江县', '安徽省');
INSERT INTO `jgb` VALUES (340181, 340000, '巢湖市', '安徽省');
INSERT INTO `jgb` VALUES (340200, 340000, '芜湖市', '安徽省');
INSERT INTO `jgb` VALUES (340202, 340000, '镜湖区', '安徽省');
INSERT INTO `jgb` VALUES (340203, 340000, '弋江区', '安徽省');
INSERT INTO `jgb` VALUES (340207, 340000, '鸠江区', '安徽省');
INSERT INTO `jgb` VALUES (340208, 340000, '三山区', '安徽省');
INSERT INTO `jgb` VALUES (340221, 340000, '芜湖县', '安徽省');
INSERT INTO `jgb` VALUES (340222, 340000, '繁昌县', '安徽省');
INSERT INTO `jgb` VALUES (340223, 340000, '南陵县', '安徽省');
INSERT INTO `jgb` VALUES (340225, 340000, '无为县', '安徽省');
INSERT INTO `jgb` VALUES (340300, 340000, '蚌埠市', '安徽省');
INSERT INTO `jgb` VALUES (340302, 340000, '龙子湖区', '安徽省');
INSERT INTO `jgb` VALUES (340303, 340000, '蚌山区', '安徽省');
INSERT INTO `jgb` VALUES (340304, 340000, '禹会区', '安徽省');
INSERT INTO `jgb` VALUES (340311, 340000, '淮上区', '安徽省');
INSERT INTO `jgb` VALUES (340321, 340000, '怀远县', '安徽省');
INSERT INTO `jgb` VALUES (340322, 340000, '五河县', '安徽省');
INSERT INTO `jgb` VALUES (340323, 340000, '固镇县', '安徽省');
INSERT INTO `jgb` VALUES (340400, 340000, '淮南市', '安徽省');
INSERT INTO `jgb` VALUES (340402, 340000, '大通区', '安徽省');
INSERT INTO `jgb` VALUES (340403, 340000, '田家庵区', '安徽省');
INSERT INTO `jgb` VALUES (340404, 340000, '谢家集区', '安徽省');
INSERT INTO `jgb` VALUES (340405, 340000, '八公山区', '安徽省');
INSERT INTO `jgb` VALUES (340406, 340000, '潘集区', '安徽省');
INSERT INTO `jgb` VALUES (340421, 340000, '凤台县', '安徽省');
INSERT INTO `jgb` VALUES (340422, 340000, '寿县', '安徽省');
INSERT INTO `jgb` VALUES (340500, 340000, '马鞍山市', '安徽省');
INSERT INTO `jgb` VALUES (340503, 340000, '花山区', '安徽省');
INSERT INTO `jgb` VALUES (340504, 340000, '雨山区', '安徽省');
INSERT INTO `jgb` VALUES (340506, 340000, '博望区', '安徽省');
INSERT INTO `jgb` VALUES (340521, 340000, '当涂县', '安徽省');
INSERT INTO `jgb` VALUES (340522, 340000, '含山县', '安徽省');
INSERT INTO `jgb` VALUES (340523, 340000, '和县', '安徽省');
INSERT INTO `jgb` VALUES (340600, 340000, '淮北市', '安徽省');
INSERT INTO `jgb` VALUES (340602, 340000, '杜集区', '安徽省');
INSERT INTO `jgb` VALUES (340603, 340000, '相山区', '安徽省');
INSERT INTO `jgb` VALUES (340604, 340000, '烈山区', '安徽省');
INSERT INTO `jgb` VALUES (340621, 340000, '濉溪县', '安徽省');
INSERT INTO `jgb` VALUES (340700, 340000, '铜陵市', '安徽省');
INSERT INTO `jgb` VALUES (340705, 340000, '铜官区', '安徽省');
INSERT INTO `jgb` VALUES (340706, 340000, '义安区', '安徽省');
INSERT INTO `jgb` VALUES (340711, 340000, '郊区', '安徽省');
INSERT INTO `jgb` VALUES (340722, 340000, '枞阳县', '安徽省');
INSERT INTO `jgb` VALUES (340800, 340000, '安庆市', '安徽省');
INSERT INTO `jgb` VALUES (340802, 340000, '迎江区', '安徽省');
INSERT INTO `jgb` VALUES (340803, 340000, '大观区', '安徽省');
INSERT INTO `jgb` VALUES (340811, 340000, '宜秀区', '安徽省');
INSERT INTO `jgb` VALUES (340822, 340000, '怀宁县', '安徽省');
INSERT INTO `jgb` VALUES (340824, 340000, '潜山县', '安徽省');
INSERT INTO `jgb` VALUES (340825, 340000, '太湖县', '安徽省');
INSERT INTO `jgb` VALUES (340826, 340000, '宿松县', '安徽省');
INSERT INTO `jgb` VALUES (340827, 340000, '望江县', '安徽省');
INSERT INTO `jgb` VALUES (340828, 340000, '岳西县', '安徽省');
INSERT INTO `jgb` VALUES (340881, 340000, '桐城市', '安徽省');
INSERT INTO `jgb` VALUES (341000, 340000, '黄山市', '安徽省');
INSERT INTO `jgb` VALUES (341002, 340000, '屯溪区', '安徽省');
INSERT INTO `jgb` VALUES (341003, 340000, '黄山区', '安徽省');
INSERT INTO `jgb` VALUES (341004, 340000, '徽州区', '安徽省');
INSERT INTO `jgb` VALUES (341021, 340000, '歙县', '安徽省');
INSERT INTO `jgb` VALUES (341022, 340000, '休宁县', '安徽省');
INSERT INTO `jgb` VALUES (341023, 340000, '黟县', '安徽省');
INSERT INTO `jgb` VALUES (341024, 340000, '祁门县', '安徽省');
INSERT INTO `jgb` VALUES (341100, 340000, '滁州市', '安徽省');
INSERT INTO `jgb` VALUES (341102, 340000, '琅琊区', '安徽省');
INSERT INTO `jgb` VALUES (341103, 340000, '南谯区', '安徽省');
INSERT INTO `jgb` VALUES (341122, 340000, '来安县', '安徽省');
INSERT INTO `jgb` VALUES (341124, 340000, '全椒县', '安徽省');
INSERT INTO `jgb` VALUES (341125, 340000, '定远县', '安徽省');
INSERT INTO `jgb` VALUES (341126, 340000, '凤阳县', '安徽省');
INSERT INTO `jgb` VALUES (341181, 340000, '天长市', '安徽省');
INSERT INTO `jgb` VALUES (341182, 340000, '明光市', '安徽省');
INSERT INTO `jgb` VALUES (341200, 340000, '阜阳市', '安徽省');
INSERT INTO `jgb` VALUES (341202, 340000, '颍州区', '安徽省');
INSERT INTO `jgb` VALUES (341203, 340000, '颍东区', '安徽省');
INSERT INTO `jgb` VALUES (341204, 340000, '颍泉区', '安徽省');
INSERT INTO `jgb` VALUES (341221, 340000, '临泉县', '安徽省');
INSERT INTO `jgb` VALUES (341222, 340000, '太和县', '安徽省');
INSERT INTO `jgb` VALUES (341225, 340000, '阜南县', '安徽省');
INSERT INTO `jgb` VALUES (341226, 340000, '颍上县', '安徽省');
INSERT INTO `jgb` VALUES (341282, 340000, '界首市', '安徽省');
INSERT INTO `jgb` VALUES (341300, 340000, '宿州市', '安徽省');
INSERT INTO `jgb` VALUES (341302, 340000, '埇桥区', '安徽省');
INSERT INTO `jgb` VALUES (341321, 340000, '砀山县', '安徽省');
INSERT INTO `jgb` VALUES (341322, 340000, '萧县', '安徽省');
INSERT INTO `jgb` VALUES (341323, 340000, '灵璧县', '安徽省');
INSERT INTO `jgb` VALUES (341324, 340000, '泗县', '安徽省');
INSERT INTO `jgb` VALUES (341500, 340000, '六安市', '安徽省');
INSERT INTO `jgb` VALUES (341502, 340000, '金安区', '安徽省');
INSERT INTO `jgb` VALUES (341503, 340000, '裕安区', '安徽省');
INSERT INTO `jgb` VALUES (341504, 340000, '叶集区', '安徽省');
INSERT INTO `jgb` VALUES (341522, 340000, '霍邱县', '安徽省');
INSERT INTO `jgb` VALUES (341523, 340000, '舒城县', '安徽省');
INSERT INTO `jgb` VALUES (341524, 340000, '金寨县', '安徽省');
INSERT INTO `jgb` VALUES (341525, 340000, '霍山县', '安徽省');
INSERT INTO `jgb` VALUES (341600, 340000, '亳州市', '安徽省');
INSERT INTO `jgb` VALUES (341602, 340000, '谯城区', '安徽省');
INSERT INTO `jgb` VALUES (341621, 340000, '涡阳县', '安徽省');
INSERT INTO `jgb` VALUES (341622, 340000, '蒙城县', '安徽省');
INSERT INTO `jgb` VALUES (341623, 340000, '利辛县', '安徽省');
INSERT INTO `jgb` VALUES (341700, 340000, '池州市', '安徽省');
INSERT INTO `jgb` VALUES (341702, 340000, '贵池区', '安徽省');
INSERT INTO `jgb` VALUES (341721, 340000, '东至县', '安徽省');
INSERT INTO `jgb` VALUES (341722, 340000, '石台县', '安徽省');
INSERT INTO `jgb` VALUES (341723, 340000, '青阳县', '安徽省');
INSERT INTO `jgb` VALUES (341800, 340000, '宣城市', '安徽省');
INSERT INTO `jgb` VALUES (341802, 340000, '宣州区', '安徽省');
INSERT INTO `jgb` VALUES (341821, 340000, '郎溪县', '安徽省');
INSERT INTO `jgb` VALUES (341822, 340000, '广德县', '安徽省');
INSERT INTO `jgb` VALUES (341823, 340000, '泾县', '安徽省');
INSERT INTO `jgb` VALUES (341824, 340000, '绩溪县', '安徽省');
INSERT INTO `jgb` VALUES (341825, 340000, '旌德县', '安徽省');
INSERT INTO `jgb` VALUES (341881, 340000, '宁国市', '安徽省');
INSERT INTO `jgb` VALUES (350000, 350000, '福建省', '福建省');
INSERT INTO `jgb` VALUES (350100, 350000, '福州市', '福建省');
INSERT INTO `jgb` VALUES (350102, 350000, '鼓楼区', '福建省');
INSERT INTO `jgb` VALUES (350103, 350000, '台江区', '福建省');
INSERT INTO `jgb` VALUES (350104, 350000, '仓山区', '福建省');
INSERT INTO `jgb` VALUES (350105, 350000, '马尾区', '福建省');
INSERT INTO `jgb` VALUES (350111, 350000, '晋安区', '福建省');
INSERT INTO `jgb` VALUES (350112, 350000, '长乐区', '福建省');
INSERT INTO `jgb` VALUES (350121, 350000, '闽侯县', '福建省');
INSERT INTO `jgb` VALUES (350122, 350000, '连江县', '福建省');
INSERT INTO `jgb` VALUES (350123, 350000, '罗源县', '福建省');
INSERT INTO `jgb` VALUES (350124, 350000, '闽清县', '福建省');
INSERT INTO `jgb` VALUES (350125, 350000, '永泰县', '福建省');
INSERT INTO `jgb` VALUES (350128, 350000, '平潭县', '福建省');
INSERT INTO `jgb` VALUES (350181, 350000, '福清市', '福建省');
INSERT INTO `jgb` VALUES (350200, 350000, '厦门市', '福建省');
INSERT INTO `jgb` VALUES (350203, 350000, '思明区', '福建省');
INSERT INTO `jgb` VALUES (350205, 350000, '海沧区', '福建省');
INSERT INTO `jgb` VALUES (350206, 350000, '湖里区', '福建省');
INSERT INTO `jgb` VALUES (350211, 350000, '集美区', '福建省');
INSERT INTO `jgb` VALUES (350212, 350000, '同安区', '福建省');
INSERT INTO `jgb` VALUES (350213, 350000, '翔安区', '福建省');
INSERT INTO `jgb` VALUES (350300, 350000, '莆田市', '福建省');
INSERT INTO `jgb` VALUES (350302, 350000, '城厢区', '福建省');
INSERT INTO `jgb` VALUES (350303, 350000, '涵江区', '福建省');
INSERT INTO `jgb` VALUES (350304, 350000, '荔城区', '福建省');
INSERT INTO `jgb` VALUES (350305, 350000, '秀屿区', '福建省');
INSERT INTO `jgb` VALUES (350322, 350000, '仙游县', '福建省');
INSERT INTO `jgb` VALUES (350400, 350000, '三明市', '福建省');
INSERT INTO `jgb` VALUES (350402, 350000, '梅列区', '福建省');
INSERT INTO `jgb` VALUES (350403, 350000, '三元区', '福建省');
INSERT INTO `jgb` VALUES (350421, 350000, '明溪县', '福建省');
INSERT INTO `jgb` VALUES (350423, 350000, '清流县', '福建省');
INSERT INTO `jgb` VALUES (350424, 350000, '宁化县', '福建省');
INSERT INTO `jgb` VALUES (350425, 350000, '大田县', '福建省');
INSERT INTO `jgb` VALUES (350426, 350000, '尤溪县', '福建省');
INSERT INTO `jgb` VALUES (350427, 350000, '沙县', '福建省');
INSERT INTO `jgb` VALUES (350428, 350000, '将乐县', '福建省');
INSERT INTO `jgb` VALUES (350429, 350000, '泰宁县', '福建省');
INSERT INTO `jgb` VALUES (350430, 350000, '建宁县', '福建省');
INSERT INTO `jgb` VALUES (350481, 350000, '永安市', '福建省');
INSERT INTO `jgb` VALUES (350500, 350000, '泉州市', '福建省');
INSERT INTO `jgb` VALUES (350502, 350000, '鲤城区', '福建省');
INSERT INTO `jgb` VALUES (350503, 350000, '丰泽区', '福建省');
INSERT INTO `jgb` VALUES (350504, 350000, '洛江区', '福建省');
INSERT INTO `jgb` VALUES (350505, 350000, '泉港区', '福建省');
INSERT INTO `jgb` VALUES (350521, 350000, '惠安县', '福建省');
INSERT INTO `jgb` VALUES (350524, 350000, '安溪县', '福建省');
INSERT INTO `jgb` VALUES (350525, 350000, '永春县', '福建省');
INSERT INTO `jgb` VALUES (350526, 350000, '德化县', '福建省');
INSERT INTO `jgb` VALUES (350527, 350000, '金门县', '福建省');
INSERT INTO `jgb` VALUES (350581, 350000, '石狮市', '福建省');
INSERT INTO `jgb` VALUES (350582, 350000, '晋江市', '福建省');
INSERT INTO `jgb` VALUES (350583, 350000, '南安市', '福建省');
INSERT INTO `jgb` VALUES (350600, 350000, '漳州市', '福建省');
INSERT INTO `jgb` VALUES (350602, 350000, '芗城区', '福建省');
INSERT INTO `jgb` VALUES (350603, 350000, '龙文区', '福建省');
INSERT INTO `jgb` VALUES (350622, 350000, '云霄县', '福建省');
INSERT INTO `jgb` VALUES (350623, 350000, '漳浦县', '福建省');
INSERT INTO `jgb` VALUES (350624, 350000, '诏安县', '福建省');
INSERT INTO `jgb` VALUES (350625, 350000, '长泰县', '福建省');
INSERT INTO `jgb` VALUES (350626, 350000, '东山县', '福建省');
INSERT INTO `jgb` VALUES (350627, 350000, '南靖县', '福建省');
INSERT INTO `jgb` VALUES (350628, 350000, '平和县', '福建省');
INSERT INTO `jgb` VALUES (350629, 350000, '华安县', '福建省');
INSERT INTO `jgb` VALUES (350681, 350000, '龙海市', '福建省');
INSERT INTO `jgb` VALUES (350700, 350000, '南平市', '福建省');
INSERT INTO `jgb` VALUES (350702, 350000, '延平区', '福建省');
INSERT INTO `jgb` VALUES (350703, 350000, '建阳区', '福建省');
INSERT INTO `jgb` VALUES (350721, 350000, '顺昌县', '福建省');
INSERT INTO `jgb` VALUES (350722, 350000, '浦城县', '福建省');
INSERT INTO `jgb` VALUES (350723, 350000, '光泽县', '福建省');
INSERT INTO `jgb` VALUES (350724, 350000, '松溪县', '福建省');
INSERT INTO `jgb` VALUES (350725, 350000, '政和县', '福建省');
INSERT INTO `jgb` VALUES (350781, 350000, '邵武市', '福建省');
INSERT INTO `jgb` VALUES (350782, 350000, '武夷山市', '福建省');
INSERT INTO `jgb` VALUES (350783, 350000, '建瓯市', '福建省');
INSERT INTO `jgb` VALUES (350800, 350000, '龙岩市', '福建省');
INSERT INTO `jgb` VALUES (350802, 350000, '新罗区', '福建省');
INSERT INTO `jgb` VALUES (350803, 350000, '永定区', '福建省');
INSERT INTO `jgb` VALUES (350821, 350000, '长汀县', '福建省');
INSERT INTO `jgb` VALUES (350823, 350000, '上杭县', '福建省');
INSERT INTO `jgb` VALUES (350824, 350000, '武平县', '福建省');
INSERT INTO `jgb` VALUES (350825, 350000, '连城县', '福建省');
INSERT INTO `jgb` VALUES (350881, 350000, '漳平市', '福建省');
INSERT INTO `jgb` VALUES (350900, 350000, '宁德市', '福建省');
INSERT INTO `jgb` VALUES (350902, 350000, '蕉城区', '福建省');
INSERT INTO `jgb` VALUES (350921, 350000, '霞浦县', '福建省');
INSERT INTO `jgb` VALUES (350922, 350000, '古田县', '福建省');
INSERT INTO `jgb` VALUES (350923, 350000, '屏南县', '福建省');
INSERT INTO `jgb` VALUES (350924, 350000, '寿宁县', '福建省');
INSERT INTO `jgb` VALUES (350925, 350000, '周宁县', '福建省');
INSERT INTO `jgb` VALUES (350926, 350000, '柘荣县', '福建省');
INSERT INTO `jgb` VALUES (350981, 350000, '福安市', '福建省');
INSERT INTO `jgb` VALUES (350982, 350000, '福鼎市', '福建省');
INSERT INTO `jgb` VALUES (360000, 360000, '江西省', '江西省');
INSERT INTO `jgb` VALUES (360100, 360000, '南昌市', '江西省');
INSERT INTO `jgb` VALUES (360102, 360000, '东湖区', '江西省');
INSERT INTO `jgb` VALUES (360103, 360000, '西湖区', '江西省');
INSERT INTO `jgb` VALUES (360104, 360000, '青云谱区', '江西省');
INSERT INTO `jgb` VALUES (360105, 360000, '湾里区', '江西省');
INSERT INTO `jgb` VALUES (360111, 360000, '青山湖区', '江西省');
INSERT INTO `jgb` VALUES (360112, 360000, '新建区', '江西省');
INSERT INTO `jgb` VALUES (360121, 360000, '南昌县', '江西省');
INSERT INTO `jgb` VALUES (360123, 360000, '安义县', '江西省');
INSERT INTO `jgb` VALUES (360124, 360000, '进贤县', '江西省');
INSERT INTO `jgb` VALUES (360200, 360000, '景德镇市', '江西省');
INSERT INTO `jgb` VALUES (360202, 360000, '昌江区', '江西省');
INSERT INTO `jgb` VALUES (360203, 360000, '珠山区', '江西省');
INSERT INTO `jgb` VALUES (360222, 360000, '浮梁县', '江西省');
INSERT INTO `jgb` VALUES (360281, 360000, '乐平市', '江西省');
INSERT INTO `jgb` VALUES (360300, 360000, '萍乡市', '江西省');
INSERT INTO `jgb` VALUES (360302, 360000, '安源区', '江西省');
INSERT INTO `jgb` VALUES (360313, 360000, '湘东区', '江西省');
INSERT INTO `jgb` VALUES (360321, 360000, '莲花县', '江西省');
INSERT INTO `jgb` VALUES (360322, 360000, '上栗县', '江西省');
INSERT INTO `jgb` VALUES (360323, 360000, '芦溪县', '江西省');
INSERT INTO `jgb` VALUES (360400, 360000, '九江市', '江西省');
INSERT INTO `jgb` VALUES (360402, 360000, '濂溪区', '江西省');
INSERT INTO `jgb` VALUES (360403, 360000, '浔阳区', '江西省');
INSERT INTO `jgb` VALUES (360404, 360000, '柴桑区', '江西省');
INSERT INTO `jgb` VALUES (360423, 360000, '武宁县', '江西省');
INSERT INTO `jgb` VALUES (360424, 360000, '修水县', '江西省');
INSERT INTO `jgb` VALUES (360425, 360000, '永修县', '江西省');
INSERT INTO `jgb` VALUES (360426, 360000, '德安县', '江西省');
INSERT INTO `jgb` VALUES (360428, 360000, '都昌县', '江西省');
INSERT INTO `jgb` VALUES (360429, 360000, '湖口县', '江西省');
INSERT INTO `jgb` VALUES (360430, 360000, '彭泽县', '江西省');
INSERT INTO `jgb` VALUES (360481, 360000, '瑞昌市', '江西省');
INSERT INTO `jgb` VALUES (360482, 360000, '共青城市', '江西省');
INSERT INTO `jgb` VALUES (360483, 360000, '庐山市', '江西省');
INSERT INTO `jgb` VALUES (360500, 360000, '新余市', '江西省');
INSERT INTO `jgb` VALUES (360502, 360000, '渝水区', '江西省');
INSERT INTO `jgb` VALUES (360521, 360000, '分宜县', '江西省');
INSERT INTO `jgb` VALUES (360600, 360000, '鹰潭市', '江西省');
INSERT INTO `jgb` VALUES (360602, 360000, '月湖区', '江西省');
INSERT INTO `jgb` VALUES (360622, 360000, '余江县', '江西省');
INSERT INTO `jgb` VALUES (360681, 360000, '贵溪市', '江西省');
INSERT INTO `jgb` VALUES (360700, 360000, '赣州市', '江西省');
INSERT INTO `jgb` VALUES (360702, 360000, '章贡区', '江西省');
INSERT INTO `jgb` VALUES (360703, 360000, '南康区', '江西省');
INSERT INTO `jgb` VALUES (360704, 360000, '赣县区', '江西省');
INSERT INTO `jgb` VALUES (360722, 360000, '信丰县', '江西省');
INSERT INTO `jgb` VALUES (360723, 360000, '大余县', '江西省');
INSERT INTO `jgb` VALUES (360724, 360000, '上犹县', '江西省');
INSERT INTO `jgb` VALUES (360725, 360000, '崇义县', '江西省');
INSERT INTO `jgb` VALUES (360726, 360000, '安远县', '江西省');
INSERT INTO `jgb` VALUES (360727, 360000, '龙南县', '江西省');
INSERT INTO `jgb` VALUES (360728, 360000, '定南县', '江西省');
INSERT INTO `jgb` VALUES (360729, 360000, '全南县', '江西省');
INSERT INTO `jgb` VALUES (360730, 360000, '宁都县', '江西省');
INSERT INTO `jgb` VALUES (360731, 360000, '于都县', '江西省');
INSERT INTO `jgb` VALUES (360732, 360000, '兴国县', '江西省');
INSERT INTO `jgb` VALUES (360733, 360000, '会昌县', '江西省');
INSERT INTO `jgb` VALUES (360734, 360000, '寻乌县', '江西省');
INSERT INTO `jgb` VALUES (360735, 360000, '石城县', '江西省');
INSERT INTO `jgb` VALUES (360781, 360000, '瑞金市', '江西省');
INSERT INTO `jgb` VALUES (360800, 360000, '吉安市', '江西省');
INSERT INTO `jgb` VALUES (360802, 360000, '吉州区', '江西省');
INSERT INTO `jgb` VALUES (360803, 360000, '青原区', '江西省');
INSERT INTO `jgb` VALUES (360821, 360000, '吉安县', '江西省');
INSERT INTO `jgb` VALUES (360822, 360000, '吉水县', '江西省');
INSERT INTO `jgb` VALUES (360823, 360000, '峡江县', '江西省');
INSERT INTO `jgb` VALUES (360824, 360000, '新干县', '江西省');
INSERT INTO `jgb` VALUES (360825, 360000, '永丰县', '江西省');
INSERT INTO `jgb` VALUES (360826, 360000, '泰和县', '江西省');
INSERT INTO `jgb` VALUES (360827, 360000, '遂川县', '江西省');
INSERT INTO `jgb` VALUES (360828, 360000, '万安县', '江西省');
INSERT INTO `jgb` VALUES (360829, 360000, '安福县', '江西省');
INSERT INTO `jgb` VALUES (360830, 360000, '永新县', '江西省');
INSERT INTO `jgb` VALUES (360881, 360000, '井冈山市', '江西省');
INSERT INTO `jgb` VALUES (360900, 360000, '宜春市', '江西省');
INSERT INTO `jgb` VALUES (360902, 360000, '袁州区', '江西省');
INSERT INTO `jgb` VALUES (360921, 360000, '奉新县', '江西省');
INSERT INTO `jgb` VALUES (360922, 360000, '万载县', '江西省');
INSERT INTO `jgb` VALUES (360923, 360000, '上高县', '江西省');
INSERT INTO `jgb` VALUES (360924, 360000, '宜丰县', '江西省');
INSERT INTO `jgb` VALUES (360925, 360000, '靖安县', '江西省');
INSERT INTO `jgb` VALUES (360926, 360000, '铜鼓县', '江西省');
INSERT INTO `jgb` VALUES (360981, 360000, '丰城市', '江西省');
INSERT INTO `jgb` VALUES (360982, 360000, '樟树市', '江西省');
INSERT INTO `jgb` VALUES (360983, 360000, '高安市', '江西省');
INSERT INTO `jgb` VALUES (361000, 360000, '抚州市', '江西省');
INSERT INTO `jgb` VALUES (361002, 360000, '临川区', '江西省');
INSERT INTO `jgb` VALUES (361003, 360000, '东乡区', '江西省');
INSERT INTO `jgb` VALUES (361021, 360000, '南城县', '江西省');
INSERT INTO `jgb` VALUES (361022, 360000, '黎川县', '江西省');
INSERT INTO `jgb` VALUES (361023, 360000, '南丰县', '江西省');
INSERT INTO `jgb` VALUES (361024, 360000, '崇仁县', '江西省');
INSERT INTO `jgb` VALUES (361025, 360000, '乐安县', '江西省');
INSERT INTO `jgb` VALUES (361026, 360000, '宜黄县', '江西省');
INSERT INTO `jgb` VALUES (361027, 360000, '金溪县', '江西省');
INSERT INTO `jgb` VALUES (361028, 360000, '资溪县', '江西省');
INSERT INTO `jgb` VALUES (361030, 360000, '广昌县', '江西省');
INSERT INTO `jgb` VALUES (361100, 360000, '上饶市', '江西省');
INSERT INTO `jgb` VALUES (361102, 360000, '信州区', '江西省');
INSERT INTO `jgb` VALUES (361103, 360000, '广丰区', '江西省');
INSERT INTO `jgb` VALUES (361121, 360000, '上饶县', '江西省');
INSERT INTO `jgb` VALUES (361123, 360000, '玉山县', '江西省');
INSERT INTO `jgb` VALUES (361124, 360000, '铅山县', '江西省');
INSERT INTO `jgb` VALUES (361125, 360000, '横峰县', '江西省');
INSERT INTO `jgb` VALUES (361126, 360000, '弋阳县', '江西省');
INSERT INTO `jgb` VALUES (361127, 360000, '余干县', '江西省');
INSERT INTO `jgb` VALUES (361128, 360000, '鄱阳县', '江西省');
INSERT INTO `jgb` VALUES (361129, 360000, '万年县', '江西省');
INSERT INTO `jgb` VALUES (361130, 360000, '婺源县', '江西省');
INSERT INTO `jgb` VALUES (361181, 360000, '德兴市', '江西省');
INSERT INTO `jgb` VALUES (370000, 370000, '山东省', '山东省');
INSERT INTO `jgb` VALUES (370100, 370000, '济南市', '山东省');
INSERT INTO `jgb` VALUES (370102, 370000, '历下区', '山东省');
INSERT INTO `jgb` VALUES (370103, 370000, '市中区', '山东省');
INSERT INTO `jgb` VALUES (370104, 370000, '槐荫区', '山东省');
INSERT INTO `jgb` VALUES (370105, 370000, '天桥区', '山东省');
INSERT INTO `jgb` VALUES (370112, 370000, '历城区', '山东省');
INSERT INTO `jgb` VALUES (370113, 370000, '长清区', '山东省');
INSERT INTO `jgb` VALUES (370114, 370000, '章丘区', '山东省');
INSERT INTO `jgb` VALUES (370124, 370000, '平阴县', '山东省');
INSERT INTO `jgb` VALUES (370125, 370000, '济阳县', '山东省');
INSERT INTO `jgb` VALUES (370126, 370000, '商河县', '山东省');
INSERT INTO `jgb` VALUES (370200, 370000, '青岛市', '山东省');
INSERT INTO `jgb` VALUES (370202, 370000, '市南区', '山东省');
INSERT INTO `jgb` VALUES (370203, 370000, '市北区', '山东省');
INSERT INTO `jgb` VALUES (370211, 370000, '黄岛区', '山东省');
INSERT INTO `jgb` VALUES (370212, 370000, '崂山区', '山东省');
INSERT INTO `jgb` VALUES (370213, 370000, '李沧区', '山东省');
INSERT INTO `jgb` VALUES (370214, 370000, '城阳区', '山东省');
INSERT INTO `jgb` VALUES (370215, 370000, '即墨区', '山东省');
INSERT INTO `jgb` VALUES (370281, 370000, '胶州市', '山东省');
INSERT INTO `jgb` VALUES (370283, 370000, '平度市', '山东省');
INSERT INTO `jgb` VALUES (370285, 370000, '莱西市', '山东省');
INSERT INTO `jgb` VALUES (370300, 370000, '淄博市', '山东省');
INSERT INTO `jgb` VALUES (370302, 370000, '淄川区', '山东省');
INSERT INTO `jgb` VALUES (370303, 370000, '张店区', '山东省');
INSERT INTO `jgb` VALUES (370304, 370000, '博山区', '山东省');
INSERT INTO `jgb` VALUES (370305, 370000, '临淄区', '山东省');
INSERT INTO `jgb` VALUES (370306, 370000, '周村区', '山东省');
INSERT INTO `jgb` VALUES (370321, 370000, '桓台县', '山东省');
INSERT INTO `jgb` VALUES (370322, 370000, '高青县', '山东省');
INSERT INTO `jgb` VALUES (370323, 370000, '沂源县', '山东省');
INSERT INTO `jgb` VALUES (370400, 370000, '枣庄市', '山东省');
INSERT INTO `jgb` VALUES (370402, 370000, '市中区', '山东省');
INSERT INTO `jgb` VALUES (370403, 370000, '薛城区', '山东省');
INSERT INTO `jgb` VALUES (370404, 370000, '峄城区', '山东省');
INSERT INTO `jgb` VALUES (370405, 370000, '台儿庄区', '山东省');
INSERT INTO `jgb` VALUES (370406, 370000, '山亭区', '山东省');
INSERT INTO `jgb` VALUES (370481, 370000, '滕州市', '山东省');
INSERT INTO `jgb` VALUES (370500, 370000, '东营市', '山东省');
INSERT INTO `jgb` VALUES (370502, 370000, '东营区', '山东省');
INSERT INTO `jgb` VALUES (370503, 370000, '河口区', '山东省');
INSERT INTO `jgb` VALUES (370505, 370000, '垦利区', '山东省');
INSERT INTO `jgb` VALUES (370522, 370000, '利津县', '山东省');
INSERT INTO `jgb` VALUES (370523, 370000, '广饶县', '山东省');
INSERT INTO `jgb` VALUES (370600, 370000, '烟台市', '山东省');
INSERT INTO `jgb` VALUES (370602, 370000, '芝罘区', '山东省');
INSERT INTO `jgb` VALUES (370611, 370000, '福山区', '山东省');
INSERT INTO `jgb` VALUES (370612, 370000, '牟平区', '山东省');
INSERT INTO `jgb` VALUES (370613, 370000, '莱山区', '山东省');
INSERT INTO `jgb` VALUES (370634, 370000, '长岛县', '山东省');
INSERT INTO `jgb` VALUES (370681, 370000, '龙口市', '山东省');
INSERT INTO `jgb` VALUES (370682, 370000, '莱阳市', '山东省');
INSERT INTO `jgb` VALUES (370683, 370000, '莱州市', '山东省');
INSERT INTO `jgb` VALUES (370684, 370000, '蓬莱市', '山东省');
INSERT INTO `jgb` VALUES (370685, 370000, '招远市', '山东省');
INSERT INTO `jgb` VALUES (370686, 370000, '栖霞市', '山东省');
INSERT INTO `jgb` VALUES (370687, 370000, '海阳市', '山东省');
INSERT INTO `jgb` VALUES (370700, 370000, '潍坊市', '山东省');
INSERT INTO `jgb` VALUES (370702, 370000, '潍城区', '山东省');
INSERT INTO `jgb` VALUES (370703, 370000, '寒亭区', '山东省');
INSERT INTO `jgb` VALUES (370704, 370000, '坊子区', '山东省');
INSERT INTO `jgb` VALUES (370705, 370000, '奎文区', '山东省');
INSERT INTO `jgb` VALUES (370724, 370000, '临朐县', '山东省');
INSERT INTO `jgb` VALUES (370725, 370000, '昌乐县', '山东省');
INSERT INTO `jgb` VALUES (370781, 370000, '青州市', '山东省');
INSERT INTO `jgb` VALUES (370782, 370000, '诸城市', '山东省');
INSERT INTO `jgb` VALUES (370783, 370000, '寿光市', '山东省');
INSERT INTO `jgb` VALUES (370784, 370000, '安丘市', '山东省');
INSERT INTO `jgb` VALUES (370785, 370000, '高密市', '山东省');
INSERT INTO `jgb` VALUES (370786, 370000, '昌邑市', '山东省');
INSERT INTO `jgb` VALUES (370800, 370000, '济宁市', '山东省');
INSERT INTO `jgb` VALUES (370811, 370000, '任城区', '山东省');
INSERT INTO `jgb` VALUES (370812, 370000, '兖州区', '山东省');
INSERT INTO `jgb` VALUES (370826, 370000, '微山县', '山东省');
INSERT INTO `jgb` VALUES (370827, 370000, '鱼台县', '山东省');
INSERT INTO `jgb` VALUES (370828, 370000, '金乡县', '山东省');
INSERT INTO `jgb` VALUES (370829, 370000, '嘉祥县', '山东省');
INSERT INTO `jgb` VALUES (370830, 370000, '汶上县', '山东省');
INSERT INTO `jgb` VALUES (370831, 370000, '泗水县', '山东省');
INSERT INTO `jgb` VALUES (370832, 370000, '梁山县', '山东省');
INSERT INTO `jgb` VALUES (370881, 370000, '曲阜市', '山东省');
INSERT INTO `jgb` VALUES (370883, 370000, '邹城市', '山东省');
INSERT INTO `jgb` VALUES (370900, 370000, '泰安市', '山东省');
INSERT INTO `jgb` VALUES (370902, 370000, '泰山区', '山东省');
INSERT INTO `jgb` VALUES (370911, 370000, '岱岳区', '山东省');
INSERT INTO `jgb` VALUES (370921, 370000, '宁阳县', '山东省');
INSERT INTO `jgb` VALUES (370923, 370000, '东平县', '山东省');
INSERT INTO `jgb` VALUES (370982, 370000, '新泰市', '山东省');
INSERT INTO `jgb` VALUES (370983, 370000, '肥城市', '山东省');
INSERT INTO `jgb` VALUES (371000, 370000, '威海市', '山东省');
INSERT INTO `jgb` VALUES (371002, 370000, '环翠区', '山东省');
INSERT INTO `jgb` VALUES (371003, 370000, '文登区', '山东省');
INSERT INTO `jgb` VALUES (371082, 370000, '荣成市', '山东省');
INSERT INTO `jgb` VALUES (371083, 370000, '乳山市', '山东省');
INSERT INTO `jgb` VALUES (371100, 370000, '日照市', '山东省');
INSERT INTO `jgb` VALUES (371102, 370000, '东港区', '山东省');
INSERT INTO `jgb` VALUES (371103, 370000, '岚山区', '山东省');
INSERT INTO `jgb` VALUES (371121, 370000, '五莲县', '山东省');
INSERT INTO `jgb` VALUES (371122, 370000, '莒县', '山东省');
INSERT INTO `jgb` VALUES (371200, 370000, '莱芜市', '山东省');
INSERT INTO `jgb` VALUES (371202, 370000, '莱城区', '山东省');
INSERT INTO `jgb` VALUES (371203, 370000, '钢城区', '山东省');
INSERT INTO `jgb` VALUES (371300, 370000, '临沂市', '山东省');
INSERT INTO `jgb` VALUES (371302, 370000, '兰山区', '山东省');
INSERT INTO `jgb` VALUES (371311, 370000, '罗庄区', '山东省');
INSERT INTO `jgb` VALUES (371312, 370000, '河东区', '山东省');
INSERT INTO `jgb` VALUES (371321, 370000, '沂南县', '山东省');
INSERT INTO `jgb` VALUES (371322, 370000, '郯城县', '山东省');
INSERT INTO `jgb` VALUES (371323, 370000, '沂水县', '山东省');
INSERT INTO `jgb` VALUES (371324, 370000, '兰陵县', '山东省');
INSERT INTO `jgb` VALUES (371325, 370000, '费县', '山东省');
INSERT INTO `jgb` VALUES (371326, 370000, '平邑县', '山东省');
INSERT INTO `jgb` VALUES (371327, 370000, '莒南县', '山东省');
INSERT INTO `jgb` VALUES (371328, 370000, '蒙阴县', '山东省');
INSERT INTO `jgb` VALUES (371329, 370000, '临沭县', '山东省');
INSERT INTO `jgb` VALUES (371400, 370000, '德州市', '山东省');
INSERT INTO `jgb` VALUES (371402, 370000, '德城区', '山东省');
INSERT INTO `jgb` VALUES (371403, 370000, '陵城区', '山东省');
INSERT INTO `jgb` VALUES (371422, 370000, '宁津县', '山东省');
INSERT INTO `jgb` VALUES (371423, 370000, '庆云县', '山东省');
INSERT INTO `jgb` VALUES (371424, 370000, '临邑县', '山东省');
INSERT INTO `jgb` VALUES (371425, 370000, '齐河县', '山东省');
INSERT INTO `jgb` VALUES (371426, 370000, '平原县', '山东省');
INSERT INTO `jgb` VALUES (371427, 370000, '夏津县', '山东省');
INSERT INTO `jgb` VALUES (371428, 370000, '武城县', '山东省');
INSERT INTO `jgb` VALUES (371481, 370000, '乐陵市', '山东省');
INSERT INTO `jgb` VALUES (371482, 370000, '禹城市', '山东省');
INSERT INTO `jgb` VALUES (371500, 370000, '聊城市', '山东省');
INSERT INTO `jgb` VALUES (371502, 370000, '东昌府区', '山东省');
INSERT INTO `jgb` VALUES (371521, 370000, '阳谷县', '山东省');
INSERT INTO `jgb` VALUES (371522, 370000, '莘县', '山东省');
INSERT INTO `jgb` VALUES (371523, 370000, '茌平县', '山东省');
INSERT INTO `jgb` VALUES (371524, 370000, '东阿县', '山东省');
INSERT INTO `jgb` VALUES (371525, 370000, '冠县', '山东省');
INSERT INTO `jgb` VALUES (371526, 370000, '高唐县', '山东省');
INSERT INTO `jgb` VALUES (371581, 370000, '临清市', '山东省');
INSERT INTO `jgb` VALUES (371600, 370000, '滨州市', '山东省');
INSERT INTO `jgb` VALUES (371602, 370000, '滨城区', '山东省');
INSERT INTO `jgb` VALUES (371603, 370000, '沾化区', '山东省');
INSERT INTO `jgb` VALUES (371621, 370000, '惠民县', '山东省');
INSERT INTO `jgb` VALUES (371622, 370000, '阳信县', '山东省');
INSERT INTO `jgb` VALUES (371623, 370000, '无棣县', '山东省');
INSERT INTO `jgb` VALUES (371625, 370000, '博兴县', '山东省');
INSERT INTO `jgb` VALUES (371626, 370000, '邹平县', '山东省');
INSERT INTO `jgb` VALUES (371700, 370000, '菏泽市', '山东省');
INSERT INTO `jgb` VALUES (371702, 370000, '牡丹区', '山东省');
INSERT INTO `jgb` VALUES (371703, 370000, '定陶区', '山东省');
INSERT INTO `jgb` VALUES (371721, 370000, '曹县', '山东省');
INSERT INTO `jgb` VALUES (371722, 370000, '单县', '山东省');
INSERT INTO `jgb` VALUES (371723, 370000, '成武县', '山东省');
INSERT INTO `jgb` VALUES (371724, 370000, '巨野县', '山东省');
INSERT INTO `jgb` VALUES (371725, 370000, '郓城县', '山东省');
INSERT INTO `jgb` VALUES (371726, 370000, '鄄城县', '山东省');
INSERT INTO `jgb` VALUES (371728, 370000, '东明县', '山东省');
INSERT INTO `jgb` VALUES (410000, 410000, '河南省', '河南省');
INSERT INTO `jgb` VALUES (410100, 410000, '郑州市', '河南省');
INSERT INTO `jgb` VALUES (410102, 410000, '中原区', '河南省');
INSERT INTO `jgb` VALUES (410103, 410000, '二七区', '河南省');
INSERT INTO `jgb` VALUES (410104, 410000, '管城回族区', '河南省');
INSERT INTO `jgb` VALUES (410105, 410000, '金水区', '河南省');
INSERT INTO `jgb` VALUES (410106, 410000, '上街区', '河南省');
INSERT INTO `jgb` VALUES (410108, 410000, '惠济区', '河南省');
INSERT INTO `jgb` VALUES (410122, 410000, '中牟县', '河南省');
INSERT INTO `jgb` VALUES (410181, 410000, '巩义市', '河南省');
INSERT INTO `jgb` VALUES (410182, 410000, '荥阳市', '河南省');
INSERT INTO `jgb` VALUES (410183, 410000, '新密市', '河南省');
INSERT INTO `jgb` VALUES (410184, 410000, '新郑市', '河南省');
INSERT INTO `jgb` VALUES (410185, 410000, '登封市', '河南省');
INSERT INTO `jgb` VALUES (410200, 410000, '开封市', '河南省');
INSERT INTO `jgb` VALUES (410202, 410000, '龙亭区', '河南省');
INSERT INTO `jgb` VALUES (410203, 410000, '顺河回族区', '河南省');
INSERT INTO `jgb` VALUES (410204, 410000, '鼓楼区', '河南省');
INSERT INTO `jgb` VALUES (410205, 410000, '禹王台区', '河南省');
INSERT INTO `jgb` VALUES (410212, 410000, '祥符区', '河南省');
INSERT INTO `jgb` VALUES (410221, 410000, '杞县', '河南省');
INSERT INTO `jgb` VALUES (410222, 410000, '通许县', '河南省');
INSERT INTO `jgb` VALUES (410223, 410000, '尉氏县', '河南省');
INSERT INTO `jgb` VALUES (410225, 410000, '兰考县', '河南省');
INSERT INTO `jgb` VALUES (410300, 410000, '洛阳市', '河南省');
INSERT INTO `jgb` VALUES (410302, 410000, '老城区', '河南省');
INSERT INTO `jgb` VALUES (410303, 410000, '西工区', '河南省');
INSERT INTO `jgb` VALUES (410304, 410000, '瀍河回族区', '河南省');
INSERT INTO `jgb` VALUES (410305, 410000, '涧西区', '河南省');
INSERT INTO `jgb` VALUES (410306, 410000, '吉利区', '河南省');
INSERT INTO `jgb` VALUES (410311, 410000, '洛龙区', '河南省');
INSERT INTO `jgb` VALUES (410322, 410000, '孟津县', '河南省');
INSERT INTO `jgb` VALUES (410323, 410000, '新安县', '河南省');
INSERT INTO `jgb` VALUES (410324, 410000, '栾川县', '河南省');
INSERT INTO `jgb` VALUES (410325, 410000, '嵩县', '河南省');
INSERT INTO `jgb` VALUES (410326, 410000, '汝阳县', '河南省');
INSERT INTO `jgb` VALUES (410327, 410000, '宜阳县', '河南省');
INSERT INTO `jgb` VALUES (410328, 410000, '洛宁县', '河南省');
INSERT INTO `jgb` VALUES (410329, 410000, '伊川县', '河南省');
INSERT INTO `jgb` VALUES (410381, 410000, '偃师市', '河南省');
INSERT INTO `jgb` VALUES (410400, 410000, '平顶山市', '河南省');
INSERT INTO `jgb` VALUES (410402, 410000, '新华区', '河南省');
INSERT INTO `jgb` VALUES (410403, 410000, '卫东区', '河南省');
INSERT INTO `jgb` VALUES (410404, 410000, '石龙区', '河南省');
INSERT INTO `jgb` VALUES (410411, 410000, '湛河区', '河南省');
INSERT INTO `jgb` VALUES (410421, 410000, '宝丰县', '河南省');
INSERT INTO `jgb` VALUES (410422, 410000, '叶县', '河南省');
INSERT INTO `jgb` VALUES (410423, 410000, '鲁山县', '河南省');
INSERT INTO `jgb` VALUES (410425, 410000, '郏县', '河南省');
INSERT INTO `jgb` VALUES (410481, 410000, '舞钢市', '河南省');
INSERT INTO `jgb` VALUES (410482, 410000, '汝州市', '河南省');
INSERT INTO `jgb` VALUES (410500, 410000, '安阳市', '河南省');
INSERT INTO `jgb` VALUES (410502, 410000, '文峰区', '河南省');
INSERT INTO `jgb` VALUES (410503, 410000, '北关区', '河南省');
INSERT INTO `jgb` VALUES (410505, 410000, '殷都区', '河南省');
INSERT INTO `jgb` VALUES (410506, 410000, '龙安区', '河南省');
INSERT INTO `jgb` VALUES (410522, 410000, '安阳县', '河南省');
INSERT INTO `jgb` VALUES (410523, 410000, '汤阴县', '河南省');
INSERT INTO `jgb` VALUES (410526, 410000, '滑县', '河南省');
INSERT INTO `jgb` VALUES (410527, 410000, '内黄县', '河南省');
INSERT INTO `jgb` VALUES (410581, 410000, '林州市', '河南省');
INSERT INTO `jgb` VALUES (410600, 410000, '鹤壁市', '河南省');
INSERT INTO `jgb` VALUES (410602, 410000, '鹤山区', '河南省');
INSERT INTO `jgb` VALUES (410603, 410000, '山城区', '河南省');
INSERT INTO `jgb` VALUES (410611, 410000, '淇滨区', '河南省');
INSERT INTO `jgb` VALUES (410621, 410000, '浚县', '河南省');
INSERT INTO `jgb` VALUES (410622, 410000, '淇县', '河南省');
INSERT INTO `jgb` VALUES (410700, 410000, '新乡市', '河南省');
INSERT INTO `jgb` VALUES (410702, 410000, '红旗区', '河南省');
INSERT INTO `jgb` VALUES (410703, 410000, '卫滨区', '河南省');
INSERT INTO `jgb` VALUES (410704, 410000, '凤泉区', '河南省');
INSERT INTO `jgb` VALUES (410711, 410000, '牧野区', '河南省');
INSERT INTO `jgb` VALUES (410721, 410000, '新乡县', '河南省');
INSERT INTO `jgb` VALUES (410724, 410000, '获嘉县', '河南省');
INSERT INTO `jgb` VALUES (410725, 410000, '原阳县', '河南省');
INSERT INTO `jgb` VALUES (410726, 410000, '延津县', '河南省');
INSERT INTO `jgb` VALUES (410727, 410000, '封丘县', '河南省');
INSERT INTO `jgb` VALUES (410728, 410000, '长垣县', '河南省');
INSERT INTO `jgb` VALUES (410781, 410000, '卫辉市', '河南省');
INSERT INTO `jgb` VALUES (410782, 410000, '辉县市', '河南省');
INSERT INTO `jgb` VALUES (410800, 410000, '焦作市', '河南省');
INSERT INTO `jgb` VALUES (410802, 410000, '解放区', '河南省');
INSERT INTO `jgb` VALUES (410803, 410000, '中站区', '河南省');
INSERT INTO `jgb` VALUES (410804, 410000, '马村区', '河南省');
INSERT INTO `jgb` VALUES (410811, 410000, '山阳区', '河南省');
INSERT INTO `jgb` VALUES (410821, 410000, '修武县', '河南省');
INSERT INTO `jgb` VALUES (410822, 410000, '博爱县', '河南省');
INSERT INTO `jgb` VALUES (410823, 410000, '武陟县', '河南省');
INSERT INTO `jgb` VALUES (410825, 410000, '温县', '河南省');
INSERT INTO `jgb` VALUES (410882, 410000, '沁阳市', '河南省');
INSERT INTO `jgb` VALUES (410883, 410000, '孟州市', '河南省');
INSERT INTO `jgb` VALUES (410900, 410000, '濮阳市', '河南省');
INSERT INTO `jgb` VALUES (410902, 410000, '华龙区', '河南省');
INSERT INTO `jgb` VALUES (410922, 410000, '清丰县', '河南省');
INSERT INTO `jgb` VALUES (410923, 410000, '南乐县', '河南省');
INSERT INTO `jgb` VALUES (410926, 410000, '范县', '河南省');
INSERT INTO `jgb` VALUES (410927, 410000, '台前县', '河南省');
INSERT INTO `jgb` VALUES (410928, 410000, '濮阳县', '河南省');
INSERT INTO `jgb` VALUES (411000, 410000, '许昌市', '河南省');
INSERT INTO `jgb` VALUES (411002, 410000, '魏都区', '河南省');
INSERT INTO `jgb` VALUES (411003, 410000, '建安区', '河南省');
INSERT INTO `jgb` VALUES (411024, 410000, '鄢陵县', '河南省');
INSERT INTO `jgb` VALUES (411025, 410000, '襄城县', '河南省');
INSERT INTO `jgb` VALUES (411081, 410000, '禹州市', '河南省');
INSERT INTO `jgb` VALUES (411082, 410000, '长葛市', '河南省');
INSERT INTO `jgb` VALUES (411100, 410000, '漯河市', '河南省');
INSERT INTO `jgb` VALUES (411102, 410000, '源汇区', '河南省');
INSERT INTO `jgb` VALUES (411103, 410000, '郾城区', '河南省');
INSERT INTO `jgb` VALUES (411104, 410000, '召陵区', '河南省');
INSERT INTO `jgb` VALUES (411121, 410000, '舞阳县', '河南省');
INSERT INTO `jgb` VALUES (411122, 410000, '临颍县', '河南省');
INSERT INTO `jgb` VALUES (411200, 410000, '三门峡市', '河南省');
INSERT INTO `jgb` VALUES (411202, 410000, '湖滨区', '河南省');
INSERT INTO `jgb` VALUES (411203, 410000, '陕州区', '河南省');
INSERT INTO `jgb` VALUES (411221, 410000, '渑池县', '河南省');
INSERT INTO `jgb` VALUES (411224, 410000, '卢氏县', '河南省');
INSERT INTO `jgb` VALUES (411281, 410000, '义马市', '河南省');
INSERT INTO `jgb` VALUES (411282, 410000, '灵宝市', '河南省');
INSERT INTO `jgb` VALUES (411300, 410000, '南阳市', '河南省');
INSERT INTO `jgb` VALUES (411302, 410000, '宛城区', '河南省');
INSERT INTO `jgb` VALUES (411303, 410000, '卧龙区', '河南省');
INSERT INTO `jgb` VALUES (411321, 410000, '南召县', '河南省');
INSERT INTO `jgb` VALUES (411322, 410000, '方城县', '河南省');
INSERT INTO `jgb` VALUES (411323, 410000, '西峡县', '河南省');
INSERT INTO `jgb` VALUES (411324, 410000, '镇平县', '河南省');
INSERT INTO `jgb` VALUES (411325, 410000, '内乡县', '河南省');
INSERT INTO `jgb` VALUES (411326, 410000, '淅川县', '河南省');
INSERT INTO `jgb` VALUES (411327, 410000, '社旗县', '河南省');
INSERT INTO `jgb` VALUES (411328, 410000, '唐河县', '河南省');
INSERT INTO `jgb` VALUES (411329, 410000, '新野县', '河南省');
INSERT INTO `jgb` VALUES (411330, 410000, '桐柏县', '河南省');
INSERT INTO `jgb` VALUES (411381, 410000, '邓州市', '河南省');
INSERT INTO `jgb` VALUES (411400, 410000, '商丘市', '河南省');
INSERT INTO `jgb` VALUES (411402, 410000, '梁园区', '河南省');
INSERT INTO `jgb` VALUES (411403, 410000, '睢阳区', '河南省');
INSERT INTO `jgb` VALUES (411421, 410000, '民权县', '河南省');
INSERT INTO `jgb` VALUES (411422, 410000, '睢县', '河南省');
INSERT INTO `jgb` VALUES (411423, 410000, '宁陵县', '河南省');
INSERT INTO `jgb` VALUES (411424, 410000, '柘城县', '河南省');
INSERT INTO `jgb` VALUES (411425, 410000, '虞城县', '河南省');
INSERT INTO `jgb` VALUES (411426, 410000, '夏邑县', '河南省');
INSERT INTO `jgb` VALUES (411481, 410000, '永城市', '河南省');
INSERT INTO `jgb` VALUES (411500, 410000, '信阳市', '河南省');
INSERT INTO `jgb` VALUES (411502, 410000, '浉河区', '河南省');
INSERT INTO `jgb` VALUES (411503, 410000, '平桥区', '河南省');
INSERT INTO `jgb` VALUES (411521, 410000, '罗山县', '河南省');
INSERT INTO `jgb` VALUES (411522, 410000, '光山县', '河南省');
INSERT INTO `jgb` VALUES (411523, 410000, '新县', '河南省');
INSERT INTO `jgb` VALUES (411524, 410000, '商城县', '河南省');
INSERT INTO `jgb` VALUES (411525, 410000, '固始县', '河南省');
INSERT INTO `jgb` VALUES (411526, 410000, '潢川县', '河南省');
INSERT INTO `jgb` VALUES (411527, 410000, '淮滨县', '河南省');
INSERT INTO `jgb` VALUES (411528, 410000, '息县', '河南省');
INSERT INTO `jgb` VALUES (411600, 410000, '周口市', '河南省');
INSERT INTO `jgb` VALUES (411602, 410000, '川汇区', '河南省');
INSERT INTO `jgb` VALUES (411621, 410000, '扶沟县', '河南省');
INSERT INTO `jgb` VALUES (411622, 410000, '西华县', '河南省');
INSERT INTO `jgb` VALUES (411623, 410000, '商水县', '河南省');
INSERT INTO `jgb` VALUES (411624, 410000, '沈丘县', '河南省');
INSERT INTO `jgb` VALUES (411625, 410000, '郸城县', '河南省');
INSERT INTO `jgb` VALUES (411626, 410000, '淮阳县', '河南省');
INSERT INTO `jgb` VALUES (411627, 410000, '太康县', '河南省');
INSERT INTO `jgb` VALUES (411628, 410000, '鹿邑县', '河南省');
INSERT INTO `jgb` VALUES (411681, 410000, '项城市', '河南省');
INSERT INTO `jgb` VALUES (411700, 410000, '驻马店市', '河南省');
INSERT INTO `jgb` VALUES (411702, 410000, '驿城区', '河南省');
INSERT INTO `jgb` VALUES (411721, 410000, '西平县', '河南省');
INSERT INTO `jgb` VALUES (411722, 410000, '上蔡县', '河南省');
INSERT INTO `jgb` VALUES (411723, 410000, '平舆县', '河南省');
INSERT INTO `jgb` VALUES (411724, 410000, '正阳县', '河南省');
INSERT INTO `jgb` VALUES (411725, 410000, '确山县', '河南省');
INSERT INTO `jgb` VALUES (411726, 410000, '泌阳县', '河南省');
INSERT INTO `jgb` VALUES (411727, 410000, '汝南县', '河南省');
INSERT INTO `jgb` VALUES (411728, 410000, '遂平县', '河南省');
INSERT INTO `jgb` VALUES (411729, 410000, '新蔡县', '河南省');
INSERT INTO `jgb` VALUES (419001, 410000, '济源市', '河南省');
INSERT INTO `jgb` VALUES (420000, 420000, '湖北省', '湖北省');
INSERT INTO `jgb` VALUES (420100, 420000, '武汉市', '湖北省');
INSERT INTO `jgb` VALUES (420102, 420000, '江岸区', '湖北省');
INSERT INTO `jgb` VALUES (420103, 420000, '江汉区', '湖北省');
INSERT INTO `jgb` VALUES (420104, 420000, '硚口区', '湖北省');
INSERT INTO `jgb` VALUES (420105, 420000, '汉阳区', '湖北省');
INSERT INTO `jgb` VALUES (420106, 420000, '武昌区', '湖北省');
INSERT INTO `jgb` VALUES (420107, 420000, '青山区', '湖北省');
INSERT INTO `jgb` VALUES (420111, 420000, '洪山区', '湖北省');
INSERT INTO `jgb` VALUES (420112, 420000, '东西湖区', '湖北省');
INSERT INTO `jgb` VALUES (420113, 420000, '汉南区', '湖北省');
INSERT INTO `jgb` VALUES (420114, 420000, '蔡甸区', '湖北省');
INSERT INTO `jgb` VALUES (420115, 420000, '江夏区', '湖北省');
INSERT INTO `jgb` VALUES (420116, 420000, '黄陂区', '湖北省');
INSERT INTO `jgb` VALUES (420117, 420000, '新洲区', '湖北省');
INSERT INTO `jgb` VALUES (420200, 420000, '黄石市', '湖北省');
INSERT INTO `jgb` VALUES (420202, 420000, '黄石港区', '湖北省');
INSERT INTO `jgb` VALUES (420203, 420000, '西塞山区', '湖北省');
INSERT INTO `jgb` VALUES (420204, 420000, '下陆区', '湖北省');
INSERT INTO `jgb` VALUES (420205, 420000, '铁山区', '湖北省');
INSERT INTO `jgb` VALUES (420222, 420000, '阳新县', '湖北省');
INSERT INTO `jgb` VALUES (420281, 420000, '大冶市', '湖北省');
INSERT INTO `jgb` VALUES (420300, 420000, '十堰市', '湖北省');
INSERT INTO `jgb` VALUES (420302, 420000, '茅箭区', '湖北省');
INSERT INTO `jgb` VALUES (420303, 420000, '张湾区', '湖北省');
INSERT INTO `jgb` VALUES (420304, 420000, '郧阳区', '湖北省');
INSERT INTO `jgb` VALUES (420322, 420000, '郧西县', '湖北省');
INSERT INTO `jgb` VALUES (420323, 420000, '竹山县', '湖北省');
INSERT INTO `jgb` VALUES (420324, 420000, '竹溪县', '湖北省');
INSERT INTO `jgb` VALUES (420325, 420000, '房县', '湖北省');
INSERT INTO `jgb` VALUES (420381, 420000, '丹江口市', '湖北省');
INSERT INTO `jgb` VALUES (420500, 420000, '宜昌市', '湖北省');
INSERT INTO `jgb` VALUES (420502, 420000, '西陵区', '湖北省');
INSERT INTO `jgb` VALUES (420503, 420000, '伍家岗区', '湖北省');
INSERT INTO `jgb` VALUES (420504, 420000, '点军区', '湖北省');
INSERT INTO `jgb` VALUES (420505, 420000, '猇亭区', '湖北省');
INSERT INTO `jgb` VALUES (420506, 420000, '夷陵区', '湖北省');
INSERT INTO `jgb` VALUES (420525, 420000, '远安县', '湖北省');
INSERT INTO `jgb` VALUES (420526, 420000, '兴山县', '湖北省');
INSERT INTO `jgb` VALUES (420527, 420000, '秭归县', '湖北省');
INSERT INTO `jgb` VALUES (420528, 420000, '长阳土家族自治县', '湖北省');
INSERT INTO `jgb` VALUES (420529, 420000, '五峰土家族自治县', '湖北省');
INSERT INTO `jgb` VALUES (420581, 420000, '宜都市', '湖北省');
INSERT INTO `jgb` VALUES (420582, 420000, '当阳市', '湖北省');
INSERT INTO `jgb` VALUES (420583, 420000, '枝江市', '湖北省');
INSERT INTO `jgb` VALUES (420600, 420000, '襄阳市', '湖北省');
INSERT INTO `jgb` VALUES (420602, 420000, '襄城区', '湖北省');
INSERT INTO `jgb` VALUES (420606, 420000, '樊城区', '湖北省');
INSERT INTO `jgb` VALUES (420607, 420000, '襄州区', '湖北省');
INSERT INTO `jgb` VALUES (420624, 420000, '南漳县', '湖北省');
INSERT INTO `jgb` VALUES (420625, 420000, '谷城县', '湖北省');
INSERT INTO `jgb` VALUES (420626, 420000, '保康县', '湖北省');
INSERT INTO `jgb` VALUES (420682, 420000, '老河口市', '湖北省');
INSERT INTO `jgb` VALUES (420683, 420000, '枣阳市', '湖北省');
INSERT INTO `jgb` VALUES (420684, 420000, '宜城市', '湖北省');
INSERT INTO `jgb` VALUES (420700, 420000, '鄂州市', '湖北省');
INSERT INTO `jgb` VALUES (420702, 420000, '梁子湖区', '湖北省');
INSERT INTO `jgb` VALUES (420703, 420000, '华容区', '湖北省');
INSERT INTO `jgb` VALUES (420704, 420000, '鄂城区', '湖北省');
INSERT INTO `jgb` VALUES (420800, 420000, '荆门市', '湖北省');
INSERT INTO `jgb` VALUES (420802, 420000, '东宝区', '湖北省');
INSERT INTO `jgb` VALUES (420804, 420000, '掇刀区', '湖北省');
INSERT INTO `jgb` VALUES (420821, 420000, '京山县', '湖北省');
INSERT INTO `jgb` VALUES (420822, 420000, '沙洋县', '湖北省');
INSERT INTO `jgb` VALUES (420881, 420000, '钟祥市', '湖北省');
INSERT INTO `jgb` VALUES (420900, 420000, '孝感市', '湖北省');
INSERT INTO `jgb` VALUES (420902, 420000, '孝南区', '湖北省');
INSERT INTO `jgb` VALUES (420921, 420000, '孝昌县', '湖北省');
INSERT INTO `jgb` VALUES (420922, 420000, '大悟县', '湖北省');
INSERT INTO `jgb` VALUES (420923, 420000, '云梦县', '湖北省');
INSERT INTO `jgb` VALUES (420981, 420000, '应城市', '湖北省');
INSERT INTO `jgb` VALUES (420982, 420000, '安陆市', '湖北省');
INSERT INTO `jgb` VALUES (420984, 420000, '汉川市', '湖北省');
INSERT INTO `jgb` VALUES (421000, 420000, '荆州市', '湖北省');
INSERT INTO `jgb` VALUES (421002, 420000, '沙市区', '湖北省');
INSERT INTO `jgb` VALUES (421003, 420000, '荆州区', '湖北省');
INSERT INTO `jgb` VALUES (421022, 420000, '公安县', '湖北省');
INSERT INTO `jgb` VALUES (421023, 420000, '监利县', '湖北省');
INSERT INTO `jgb` VALUES (421024, 420000, '江陵县', '湖北省');
INSERT INTO `jgb` VALUES (421081, 420000, '石首市', '湖北省');
INSERT INTO `jgb` VALUES (421083, 420000, '洪湖市', '湖北省');
INSERT INTO `jgb` VALUES (421087, 420000, '松滋市', '湖北省');
INSERT INTO `jgb` VALUES (421100, 420000, '黄冈市', '湖北省');
INSERT INTO `jgb` VALUES (421102, 420000, '黄州区', '湖北省');
INSERT INTO `jgb` VALUES (421121, 420000, '团风县', '湖北省');
INSERT INTO `jgb` VALUES (421122, 420000, '红安县', '湖北省');
INSERT INTO `jgb` VALUES (421123, 420000, '罗田县', '湖北省');
INSERT INTO `jgb` VALUES (421124, 420000, '英山县', '湖北省');
INSERT INTO `jgb` VALUES (421125, 420000, '浠水县', '湖北省');
INSERT INTO `jgb` VALUES (421126, 420000, '蕲春县', '湖北省');
INSERT INTO `jgb` VALUES (421127, 420000, '黄梅县', '湖北省');
INSERT INTO `jgb` VALUES (421181, 420000, '麻城市', '湖北省');
INSERT INTO `jgb` VALUES (421182, 420000, '武穴市', '湖北省');
INSERT INTO `jgb` VALUES (421200, 420000, '咸宁市', '湖北省');
INSERT INTO `jgb` VALUES (421202, 420000, '咸安区', '湖北省');
INSERT INTO `jgb` VALUES (421221, 420000, '嘉鱼县', '湖北省');
INSERT INTO `jgb` VALUES (421222, 420000, '通城县', '湖北省');
INSERT INTO `jgb` VALUES (421223, 420000, '崇阳县', '湖北省');
INSERT INTO `jgb` VALUES (421224, 420000, '通山县', '湖北省');
INSERT INTO `jgb` VALUES (421281, 420000, '赤壁市', '湖北省');
INSERT INTO `jgb` VALUES (421300, 420000, '随州市', '湖北省');
INSERT INTO `jgb` VALUES (421303, 420000, '曾都区', '湖北省');
INSERT INTO `jgb` VALUES (421321, 420000, '随县', '湖北省');
INSERT INTO `jgb` VALUES (421381, 420000, '广水市', '湖北省');
INSERT INTO `jgb` VALUES (422800, 420000, '恩施土家族苗族自治州', '湖北省');
INSERT INTO `jgb` VALUES (422801, 420000, '恩施市', '湖北省');
INSERT INTO `jgb` VALUES (422802, 420000, '利川市', '湖北省');
INSERT INTO `jgb` VALUES (422822, 420000, '建始县', '湖北省');
INSERT INTO `jgb` VALUES (422823, 420000, '巴东县', '湖北省');
INSERT INTO `jgb` VALUES (422825, 420000, '宣恩县', '湖北省');
INSERT INTO `jgb` VALUES (422826, 420000, '咸丰县', '湖北省');
INSERT INTO `jgb` VALUES (422827, 420000, '来凤县', '湖北省');
INSERT INTO `jgb` VALUES (422828, 420000, '鹤峰县', '湖北省');
INSERT INTO `jgb` VALUES (429004, 420000, '仙桃市', '湖北省');
INSERT INTO `jgb` VALUES (429005, 420000, '潜江市', '湖北省');
INSERT INTO `jgb` VALUES (429006, 420000, '天门市', '湖北省');
INSERT INTO `jgb` VALUES (429021, 420000, '神农架林区', '湖北省');
INSERT INTO `jgb` VALUES (430000, 430000, '湖南省', '湖南省');
INSERT INTO `jgb` VALUES (430100, 430000, '长沙市', '湖南省');
INSERT INTO `jgb` VALUES (430102, 430000, '芙蓉区', '湖南省');
INSERT INTO `jgb` VALUES (430103, 430000, '天心区', '湖南省');
INSERT INTO `jgb` VALUES (430104, 430000, '岳麓区', '湖南省');
INSERT INTO `jgb` VALUES (430105, 430000, '开福区', '湖南省');
INSERT INTO `jgb` VALUES (430111, 430000, '雨花区', '湖南省');
INSERT INTO `jgb` VALUES (430112, 430000, '望城区', '湖南省');
INSERT INTO `jgb` VALUES (430121, 430000, '长沙县', '湖南省');
INSERT INTO `jgb` VALUES (430181, 430000, '浏阳市', '湖南省');
INSERT INTO `jgb` VALUES (430182, 430000, '宁乡市', '湖南省');
INSERT INTO `jgb` VALUES (430200, 430000, '株洲市', '湖南省');
INSERT INTO `jgb` VALUES (430202, 430000, '荷塘区', '湖南省');
INSERT INTO `jgb` VALUES (430203, 430000, '芦淞区', '湖南省');
INSERT INTO `jgb` VALUES (430204, 430000, '石峰区', '湖南省');
INSERT INTO `jgb` VALUES (430211, 430000, '天元区', '湖南省');
INSERT INTO `jgb` VALUES (430221, 430000, '株洲县', '湖南省');
INSERT INTO `jgb` VALUES (430223, 430000, '攸县', '湖南省');
INSERT INTO `jgb` VALUES (430224, 430000, '茶陵县', '湖南省');
INSERT INTO `jgb` VALUES (430225, 430000, '炎陵县', '湖南省');
INSERT INTO `jgb` VALUES (430281, 430000, '醴陵市', '湖南省');
INSERT INTO `jgb` VALUES (430300, 430000, '湘潭市', '湖南省');
INSERT INTO `jgb` VALUES (430302, 430000, '雨湖区', '湖南省');
INSERT INTO `jgb` VALUES (430304, 430000, '岳塘区', '湖南省');
INSERT INTO `jgb` VALUES (430321, 430000, '湘潭县', '湖南省');
INSERT INTO `jgb` VALUES (430381, 430000, '湘乡市', '湖南省');
INSERT INTO `jgb` VALUES (430382, 430000, '韶山市', '湖南省');
INSERT INTO `jgb` VALUES (430400, 430000, '衡阳市', '湖南省');
INSERT INTO `jgb` VALUES (430405, 430000, '珠晖区', '湖南省');
INSERT INTO `jgb` VALUES (430406, 430000, '雁峰区', '湖南省');
INSERT INTO `jgb` VALUES (430407, 430000, '石鼓区', '湖南省');
INSERT INTO `jgb` VALUES (430408, 430000, '蒸湘区', '湖南省');
INSERT INTO `jgb` VALUES (430412, 430000, '南岳区', '湖南省');
INSERT INTO `jgb` VALUES (430421, 430000, '衡阳县', '湖南省');
INSERT INTO `jgb` VALUES (430422, 430000, '衡南县', '湖南省');
INSERT INTO `jgb` VALUES (430423, 430000, '衡山县', '湖南省');
INSERT INTO `jgb` VALUES (430424, 430000, '衡东县', '湖南省');
INSERT INTO `jgb` VALUES (430426, 430000, '祁东县', '湖南省');
INSERT INTO `jgb` VALUES (430481, 430000, '耒阳市', '湖南省');
INSERT INTO `jgb` VALUES (430482, 430000, '常宁市', '湖南省');
INSERT INTO `jgb` VALUES (430500, 430000, '邵阳市', '湖南省');
INSERT INTO `jgb` VALUES (430502, 430000, '双清区', '湖南省');
INSERT INTO `jgb` VALUES (430503, 430000, '大祥区', '湖南省');
INSERT INTO `jgb` VALUES (430511, 430000, '北塔区', '湖南省');
INSERT INTO `jgb` VALUES (430521, 430000, '邵东县', '湖南省');
INSERT INTO `jgb` VALUES (430522, 430000, '新邵县', '湖南省');
INSERT INTO `jgb` VALUES (430523, 430000, '邵阳县', '湖南省');
INSERT INTO `jgb` VALUES (430524, 430000, '隆回县', '湖南省');
INSERT INTO `jgb` VALUES (430525, 430000, '洞口县', '湖南省');
INSERT INTO `jgb` VALUES (430527, 430000, '绥宁县', '湖南省');
INSERT INTO `jgb` VALUES (430528, 430000, '新宁县', '湖南省');
INSERT INTO `jgb` VALUES (430529, 430000, '城步苗族自治县', '湖南省');
INSERT INTO `jgb` VALUES (430581, 430000, '武冈市', '湖南省');
INSERT INTO `jgb` VALUES (430600, 430000, '岳阳市', '湖南省');
INSERT INTO `jgb` VALUES (430602, 430000, '岳阳楼区', '湖南省');
INSERT INTO `jgb` VALUES (430603, 430000, '云溪区', '湖南省');
INSERT INTO `jgb` VALUES (430611, 430000, '君山区', '湖南省');
INSERT INTO `jgb` VALUES (430621, 430000, '岳阳县', '湖南省');
INSERT INTO `jgb` VALUES (430623, 430000, '华容县', '湖南省');
INSERT INTO `jgb` VALUES (430624, 430000, '湘阴县', '湖南省');
INSERT INTO `jgb` VALUES (430626, 430000, '平江县', '湖南省');
INSERT INTO `jgb` VALUES (430681, 430000, '汨罗市', '湖南省');
INSERT INTO `jgb` VALUES (430682, 430000, '临湘市', '湖南省');
INSERT INTO `jgb` VALUES (430700, 430000, '常德市', '湖南省');
INSERT INTO `jgb` VALUES (430702, 430000, '武陵区', '湖南省');
INSERT INTO `jgb` VALUES (430703, 430000, '鼎城区', '湖南省');
INSERT INTO `jgb` VALUES (430721, 430000, '安乡县', '湖南省');
INSERT INTO `jgb` VALUES (430722, 430000, '汉寿县', '湖南省');
INSERT INTO `jgb` VALUES (430723, 430000, '澧县', '湖南省');
INSERT INTO `jgb` VALUES (430724, 430000, '临澧县', '湖南省');
INSERT INTO `jgb` VALUES (430725, 430000, '桃源县', '湖南省');
INSERT INTO `jgb` VALUES (430726, 430000, '石门县', '湖南省');
INSERT INTO `jgb` VALUES (430781, 430000, '津市市', '湖南省');
INSERT INTO `jgb` VALUES (430800, 430000, '张家界市', '湖南省');
INSERT INTO `jgb` VALUES (430802, 430000, '永定区', '湖南省');
INSERT INTO `jgb` VALUES (430811, 430000, '武陵源区', '湖南省');
INSERT INTO `jgb` VALUES (430821, 430000, '慈利县', '湖南省');
INSERT INTO `jgb` VALUES (430822, 430000, '桑植县', '湖南省');
INSERT INTO `jgb` VALUES (430900, 430000, '益阳市', '湖南省');
INSERT INTO `jgb` VALUES (430902, 430000, '资阳区', '湖南省');
INSERT INTO `jgb` VALUES (430903, 430000, '赫山区', '湖南省');
INSERT INTO `jgb` VALUES (430921, 430000, '南县', '湖南省');
INSERT INTO `jgb` VALUES (430922, 430000, '桃江县', '湖南省');
INSERT INTO `jgb` VALUES (430923, 430000, '安化县', '湖南省');
INSERT INTO `jgb` VALUES (430981, 430000, '沅江市', '湖南省');
INSERT INTO `jgb` VALUES (431000, 430000, '郴州市', '湖南省');
INSERT INTO `jgb` VALUES (431002, 430000, '北湖区', '湖南省');
INSERT INTO `jgb` VALUES (431003, 430000, '苏仙区', '湖南省');
INSERT INTO `jgb` VALUES (431021, 430000, '桂阳县', '湖南省');
INSERT INTO `jgb` VALUES (431022, 430000, '宜章县', '湖南省');
INSERT INTO `jgb` VALUES (431023, 430000, '永兴县', '湖南省');
INSERT INTO `jgb` VALUES (431024, 430000, '嘉禾县', '湖南省');
INSERT INTO `jgb` VALUES (431025, 430000, '临武县', '湖南省');
INSERT INTO `jgb` VALUES (431026, 430000, '汝城县', '湖南省');
INSERT INTO `jgb` VALUES (431027, 430000, '桂东县', '湖南省');
INSERT INTO `jgb` VALUES (431028, 430000, '安仁县', '湖南省');
INSERT INTO `jgb` VALUES (431081, 430000, '资兴市', '湖南省');
INSERT INTO `jgb` VALUES (431100, 430000, '永州市', '湖南省');
INSERT INTO `jgb` VALUES (431102, 430000, '零陵区', '湖南省');
INSERT INTO `jgb` VALUES (431103, 430000, '冷水滩区', '湖南省');
INSERT INTO `jgb` VALUES (431121, 430000, '祁阳县', '湖南省');
INSERT INTO `jgb` VALUES (431122, 430000, '东安县', '湖南省');
INSERT INTO `jgb` VALUES (431123, 430000, '双牌县', '湖南省');
INSERT INTO `jgb` VALUES (431124, 430000, '道县', '湖南省');
INSERT INTO `jgb` VALUES (431125, 430000, '江永县', '湖南省');
INSERT INTO `jgb` VALUES (431126, 430000, '宁远县', '湖南省');
INSERT INTO `jgb` VALUES (431127, 430000, '蓝山县', '湖南省');
INSERT INTO `jgb` VALUES (431128, 430000, '新田县', '湖南省');
INSERT INTO `jgb` VALUES (431129, 430000, '江华瑶族自治县', '湖南省');
INSERT INTO `jgb` VALUES (431200, 430000, '怀化市', '湖南省');
INSERT INTO `jgb` VALUES (431202, 430000, '鹤城区', '湖南省');
INSERT INTO `jgb` VALUES (431221, 430000, '中方县', '湖南省');
INSERT INTO `jgb` VALUES (431222, 430000, '沅陵县', '湖南省');
INSERT INTO `jgb` VALUES (431223, 430000, '辰溪县', '湖南省');
INSERT INTO `jgb` VALUES (431224, 430000, '溆浦县', '湖南省');
INSERT INTO `jgb` VALUES (431225, 430000, '会同县', '湖南省');
INSERT INTO `jgb` VALUES (431226, 430000, '麻阳苗族自治县', '湖南省');
INSERT INTO `jgb` VALUES (431227, 430000, '新晃侗族自治县', '湖南省');
INSERT INTO `jgb` VALUES (431228, 430000, '芷江侗族自治县', '湖南省');
INSERT INTO `jgb` VALUES (431229, 430000, '靖州苗族侗族自治县', '湖南省');
INSERT INTO `jgb` VALUES (431230, 430000, '通道侗族自治县', '湖南省');
INSERT INTO `jgb` VALUES (431281, 430000, '洪江市', '湖南省');
INSERT INTO `jgb` VALUES (431300, 430000, '娄底市', '湖南省');
INSERT INTO `jgb` VALUES (431302, 430000, '娄星区', '湖南省');
INSERT INTO `jgb` VALUES (431321, 430000, '双峰县', '湖南省');
INSERT INTO `jgb` VALUES (431322, 430000, '新化县', '湖南省');
INSERT INTO `jgb` VALUES (431381, 430000, '冷水江市', '湖南省');
INSERT INTO `jgb` VALUES (431382, 430000, '涟源市', '湖南省');
INSERT INTO `jgb` VALUES (433100, 430000, '湘西土家族苗族自治州', '湖南省');
INSERT INTO `jgb` VALUES (433101, 430000, '吉首市', '湖南省');
INSERT INTO `jgb` VALUES (433122, 430000, '泸溪县', '湖南省');
INSERT INTO `jgb` VALUES (433123, 430000, '凤凰县', '湖南省');
INSERT INTO `jgb` VALUES (433124, 430000, '花垣县', '湖南省');
INSERT INTO `jgb` VALUES (433125, 430000, '保靖县', '湖南省');
INSERT INTO `jgb` VALUES (433126, 430000, '古丈县', '湖南省');
INSERT INTO `jgb` VALUES (433127, 430000, '永顺县', '湖南省');
INSERT INTO `jgb` VALUES (433130, 430000, '龙山县', '湖南省');
INSERT INTO `jgb` VALUES (440000, 440000, '广东省', '广东省');
INSERT INTO `jgb` VALUES (440100, 440000, '广州市', '广东省');
INSERT INTO `jgb` VALUES (440103, 440000, '荔湾区', '广东省');
INSERT INTO `jgb` VALUES (440104, 440000, '越秀区', '广东省');
INSERT INTO `jgb` VALUES (440105, 440000, '海珠区', '广东省');
INSERT INTO `jgb` VALUES (440106, 440000, '天河区', '广东省');
INSERT INTO `jgb` VALUES (440111, 440000, '白云区', '广东省');
INSERT INTO `jgb` VALUES (440112, 440000, '黄埔区', '广东省');
INSERT INTO `jgb` VALUES (440113, 440000, '番禺区', '广东省');
INSERT INTO `jgb` VALUES (440114, 440000, '花都区', '广东省');
INSERT INTO `jgb` VALUES (440115, 440000, '南沙区', '广东省');
INSERT INTO `jgb` VALUES (440117, 440000, '从化区', '广东省');
INSERT INTO `jgb` VALUES (440118, 440000, '增城区', '广东省');
INSERT INTO `jgb` VALUES (440200, 440000, '韶关市', '广东省');
INSERT INTO `jgb` VALUES (440203, 440000, '武江区', '广东省');
INSERT INTO `jgb` VALUES (440204, 440000, '浈江区', '广东省');
INSERT INTO `jgb` VALUES (440205, 440000, '曲江区', '广东省');
INSERT INTO `jgb` VALUES (440222, 440000, '始兴县', '广东省');
INSERT INTO `jgb` VALUES (440224, 440000, '仁化县', '广东省');
INSERT INTO `jgb` VALUES (440229, 440000, '翁源县', '广东省');
INSERT INTO `jgb` VALUES (440232, 440000, '乳源瑶族自治县', '广东省');
INSERT INTO `jgb` VALUES (440233, 440000, '新丰县', '广东省');
INSERT INTO `jgb` VALUES (440281, 440000, '乐昌市', '广东省');
INSERT INTO `jgb` VALUES (440282, 440000, '南雄市', '广东省');
INSERT INTO `jgb` VALUES (440300, 440000, '深圳市', '广东省');
INSERT INTO `jgb` VALUES (440303, 440000, '罗湖区', '广东省');
INSERT INTO `jgb` VALUES (440304, 440000, '福田区', '广东省');
INSERT INTO `jgb` VALUES (440305, 440000, '南山区', '广东省');
INSERT INTO `jgb` VALUES (440306, 440000, '宝安区', '广东省');
INSERT INTO `jgb` VALUES (440307, 440000, '龙岗区', '广东省');
INSERT INTO `jgb` VALUES (440308, 440000, '盐田区', '广东省');
INSERT INTO `jgb` VALUES (440309, 440000, '龙华区', '广东省');
INSERT INTO `jgb` VALUES (440310, 440000, '坪山区', '广东省');
INSERT INTO `jgb` VALUES (440400, 440000, '珠海市', '广东省');
INSERT INTO `jgb` VALUES (440402, 440000, '香洲区', '广东省');
INSERT INTO `jgb` VALUES (440403, 440000, '斗门区', '广东省');
INSERT INTO `jgb` VALUES (440404, 440000, '金湾区', '广东省');
INSERT INTO `jgb` VALUES (440500, 440000, '汕头市', '广东省');
INSERT INTO `jgb` VALUES (440507, 440000, '龙湖区', '广东省');
INSERT INTO `jgb` VALUES (440511, 440000, '金平区', '广东省');
INSERT INTO `jgb` VALUES (440512, 440000, '濠江区', '广东省');
INSERT INTO `jgb` VALUES (440513, 440000, '潮阳区', '广东省');
INSERT INTO `jgb` VALUES (440514, 440000, '潮南区', '广东省');
INSERT INTO `jgb` VALUES (440515, 440000, '澄海区', '广东省');
INSERT INTO `jgb` VALUES (440523, 440000, '南澳县', '广东省');
INSERT INTO `jgb` VALUES (440600, 440000, '佛山市', '广东省');
INSERT INTO `jgb` VALUES (440604, 440000, '禅城区', '广东省');
INSERT INTO `jgb` VALUES (440605, 440000, '南海区', '广东省');
INSERT INTO `jgb` VALUES (440606, 440000, '顺德区', '广东省');
INSERT INTO `jgb` VALUES (440607, 440000, '三水区', '广东省');
INSERT INTO `jgb` VALUES (440608, 440000, '高明区', '广东省');
INSERT INTO `jgb` VALUES (440700, 440000, '江门市', '广东省');
INSERT INTO `jgb` VALUES (440703, 440000, '蓬江区', '广东省');
INSERT INTO `jgb` VALUES (440704, 440000, '江海区', '广东省');
INSERT INTO `jgb` VALUES (440705, 440000, '新会区', '广东省');
INSERT INTO `jgb` VALUES (440781, 440000, '台山市', '广东省');
INSERT INTO `jgb` VALUES (440783, 440000, '开平市', '广东省');
INSERT INTO `jgb` VALUES (440784, 440000, '鹤山市', '广东省');
INSERT INTO `jgb` VALUES (440785, 440000, '恩平市', '广东省');
INSERT INTO `jgb` VALUES (440800, 440000, '湛江市', '广东省');
INSERT INTO `jgb` VALUES (440802, 440000, '赤坎区', '广东省');
INSERT INTO `jgb` VALUES (440803, 440000, '霞山区', '广东省');
INSERT INTO `jgb` VALUES (440804, 440000, '坡头区', '广东省');
INSERT INTO `jgb` VALUES (440811, 440000, '麻章区', '广东省');
INSERT INTO `jgb` VALUES (440823, 440000, '遂溪县', '广东省');
INSERT INTO `jgb` VALUES (440825, 440000, '徐闻县', '广东省');
INSERT INTO `jgb` VALUES (440881, 440000, '廉江市', '广东省');
INSERT INTO `jgb` VALUES (440882, 440000, '雷州市', '广东省');
INSERT INTO `jgb` VALUES (440883, 440000, '吴川市', '广东省');
INSERT INTO `jgb` VALUES (440900, 440000, '茂名市', '广东省');
INSERT INTO `jgb` VALUES (440902, 440000, '茂南区', '广东省');
INSERT INTO `jgb` VALUES (440904, 440000, '电白区', '广东省');
INSERT INTO `jgb` VALUES (440981, 440000, '高州市', '广东省');
INSERT INTO `jgb` VALUES (440982, 440000, '化州市', '广东省');
INSERT INTO `jgb` VALUES (440983, 440000, '信宜市', '广东省');
INSERT INTO `jgb` VALUES (441200, 440000, '肇庆市', '广东省');
INSERT INTO `jgb` VALUES (441202, 440000, '端州区', '广东省');
INSERT INTO `jgb` VALUES (441203, 440000, '鼎湖区', '广东省');
INSERT INTO `jgb` VALUES (441204, 440000, '高要区', '广东省');
INSERT INTO `jgb` VALUES (441223, 440000, '广宁县', '广东省');
INSERT INTO `jgb` VALUES (441224, 440000, '怀集县', '广东省');
INSERT INTO `jgb` VALUES (441225, 440000, '封开县', '广东省');
INSERT INTO `jgb` VALUES (441226, 440000, '德庆县', '广东省');
INSERT INTO `jgb` VALUES (441284, 440000, '四会市', '广东省');
INSERT INTO `jgb` VALUES (441300, 440000, '惠州市', '广东省');
INSERT INTO `jgb` VALUES (441302, 440000, '惠城区', '广东省');
INSERT INTO `jgb` VALUES (441303, 440000, '惠阳区', '广东省');
INSERT INTO `jgb` VALUES (441322, 440000, '博罗县', '广东省');
INSERT INTO `jgb` VALUES (441323, 440000, '惠东县', '广东省');
INSERT INTO `jgb` VALUES (441324, 440000, '龙门县', '广东省');
INSERT INTO `jgb` VALUES (441400, 440000, '梅州市', '广东省');
INSERT INTO `jgb` VALUES (441402, 440000, '梅江区', '广东省');
INSERT INTO `jgb` VALUES (441403, 440000, '梅县区', '广东省');
INSERT INTO `jgb` VALUES (441422, 440000, '大埔县', '广东省');
INSERT INTO `jgb` VALUES (441423, 440000, '丰顺县', '广东省');
INSERT INTO `jgb` VALUES (441424, 440000, '五华县', '广东省');
INSERT INTO `jgb` VALUES (441426, 440000, '平远县', '广东省');
INSERT INTO `jgb` VALUES (441427, 440000, '蕉岭县', '广东省');
INSERT INTO `jgb` VALUES (441481, 440000, '兴宁市', '广东省');
INSERT INTO `jgb` VALUES (441500, 440000, '汕尾市', '广东省');
INSERT INTO `jgb` VALUES (441502, 440000, '城区', '广东省');
INSERT INTO `jgb` VALUES (441521, 440000, '海丰县', '广东省');
INSERT INTO `jgb` VALUES (441523, 440000, '陆河县', '广东省');
INSERT INTO `jgb` VALUES (441581, 440000, '陆丰市', '广东省');
INSERT INTO `jgb` VALUES (441600, 440000, '河源市', '广东省');
INSERT INTO `jgb` VALUES (441602, 440000, '源城区', '广东省');
INSERT INTO `jgb` VALUES (441621, 440000, '紫金县', '广东省');
INSERT INTO `jgb` VALUES (441622, 440000, '龙川县', '广东省');
INSERT INTO `jgb` VALUES (441623, 440000, '连平县', '广东省');
INSERT INTO `jgb` VALUES (441624, 440000, '和平县', '广东省');
INSERT INTO `jgb` VALUES (441625, 440000, '东源县', '广东省');
INSERT INTO `jgb` VALUES (441700, 440000, '阳江市', '广东省');
INSERT INTO `jgb` VALUES (441702, 440000, '江城区', '广东省');
INSERT INTO `jgb` VALUES (441704, 440000, '阳东区', '广东省');
INSERT INTO `jgb` VALUES (441721, 440000, '阳西县', '广东省');
INSERT INTO `jgb` VALUES (441781, 440000, '阳春市', '广东省');
INSERT INTO `jgb` VALUES (441800, 440000, '清远市', '广东省');
INSERT INTO `jgb` VALUES (441802, 440000, '清城区', '广东省');
INSERT INTO `jgb` VALUES (441803, 440000, '清新区', '广东省');
INSERT INTO `jgb` VALUES (441821, 440000, '佛冈县', '广东省');
INSERT INTO `jgb` VALUES (441823, 440000, '阳山县', '广东省');
INSERT INTO `jgb` VALUES (441825, 440000, '连山壮族瑶族自治县', '广东省');
INSERT INTO `jgb` VALUES (441826, 440000, '连南瑶族自治县', '广东省');
INSERT INTO `jgb` VALUES (441881, 440000, '英德市', '广东省');
INSERT INTO `jgb` VALUES (441882, 440000, '连州市', '广东省');
INSERT INTO `jgb` VALUES (441900, 440000, '东莞市', '广东省');
INSERT INTO `jgb` VALUES (442000, 440000, '中山市', '广东省');
INSERT INTO `jgb` VALUES (445100, 440000, '潮州市', '广东省');
INSERT INTO `jgb` VALUES (445102, 440000, '湘桥区', '广东省');
INSERT INTO `jgb` VALUES (445103, 440000, '潮安区', '广东省');
INSERT INTO `jgb` VALUES (445122, 440000, '饶平县', '广东省');
INSERT INTO `jgb` VALUES (445200, 440000, '揭阳市', '广东省');
INSERT INTO `jgb` VALUES (445202, 440000, '榕城区', '广东省');
INSERT INTO `jgb` VALUES (445203, 440000, '揭东区', '广东省');
INSERT INTO `jgb` VALUES (445222, 440000, '揭西县', '广东省');
INSERT INTO `jgb` VALUES (445224, 440000, '惠来县', '广东省');
INSERT INTO `jgb` VALUES (445281, 440000, '普宁市', '广东省');
INSERT INTO `jgb` VALUES (445300, 440000, '云浮市', '广东省');
INSERT INTO `jgb` VALUES (445302, 440000, '云城区', '广东省');
INSERT INTO `jgb` VALUES (445303, 440000, '云安区', '广东省');
INSERT INTO `jgb` VALUES (445321, 440000, '新兴县', '广东省');
INSERT INTO `jgb` VALUES (445322, 440000, '郁南县', '广东省');
INSERT INTO `jgb` VALUES (445381, 440000, '罗定市', '广东省');
INSERT INTO `jgb` VALUES (450000, 450000, '广西壮族自治区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450100, 450000, '南宁市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450102, 450000, '兴宁区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450103, 450000, '青秀区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450105, 450000, '江南区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450107, 450000, '西乡塘区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450108, 450000, '良庆区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450109, 450000, '邕宁区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450110, 450000, '武鸣区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450123, 450000, '隆安县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450124, 450000, '马山县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450125, 450000, '上林县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450126, 450000, '宾阳县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450127, 450000, '横县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450200, 450000, '柳州市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450202, 450000, '城中区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450203, 450000, '鱼峰区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450204, 450000, '柳南区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450205, 450000, '柳北区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450206, 450000, '柳江区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450222, 450000, '柳城县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450223, 450000, '鹿寨县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450224, 450000, '融安县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450225, 450000, '融水苗族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450226, 450000, '三江侗族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450300, 450000, '桂林市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450302, 450000, '秀峰区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450303, 450000, '叠彩区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450304, 450000, '象山区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450305, 450000, '七星区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450311, 450000, '雁山区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450312, 450000, '临桂区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450321, 450000, '阳朔县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450323, 450000, '灵川县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450324, 450000, '全州县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450325, 450000, '兴安县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450326, 450000, '永福县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450327, 450000, '灌阳县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450328, 450000, '龙胜各族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450329, 450000, '资源县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450330, 450000, '平乐县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450331, 450000, '荔浦县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450332, 450000, '恭城瑶族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450400, 450000, '梧州市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450403, 450000, '万秀区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450405, 450000, '长洲区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450406, 450000, '龙圩区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450421, 450000, '苍梧县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450422, 450000, '藤县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450423, 450000, '蒙山县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450481, 450000, '岑溪市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450500, 450000, '北海市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450502, 450000, '海城区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450503, 450000, '银海区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450512, 450000, '铁山港区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450521, 450000, '合浦县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450600, 450000, '防城港市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450602, 450000, '港口区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450603, 450000, '防城区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450621, 450000, '上思县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450681, 450000, '东兴市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450700, 450000, '钦州市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450702, 450000, '钦南区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450703, 450000, '钦北区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450721, 450000, '灵山县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450722, 450000, '浦北县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450800, 450000, '贵港市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450802, 450000, '港北区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450803, 450000, '港南区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450804, 450000, '覃塘区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450821, 450000, '平南县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450881, 450000, '桂平市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450900, 450000, '玉林市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450902, 450000, '玉州区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450903, 450000, '福绵区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450921, 450000, '容县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450922, 450000, '陆川县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450923, 450000, '博白县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450924, 450000, '兴业县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (450981, 450000, '北流市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451000, 450000, '百色市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451002, 450000, '右江区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451021, 450000, '田阳县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451022, 450000, '田东县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451023, 450000, '平果县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451024, 450000, '德保县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451026, 450000, '那坡县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451027, 450000, '凌云县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451028, 450000, '乐业县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451029, 450000, '田林县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451030, 450000, '西林县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451031, 450000, '隆林各族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451081, 450000, '靖西市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451100, 450000, '贺州市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451102, 450000, '八步区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451103, 450000, '平桂区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451121, 450000, '昭平县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451122, 450000, '钟山县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451123, 450000, '富川瑶族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451200, 450000, '河池市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451202, 450000, '金城江区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451203, 450000, '宜州区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451221, 450000, '南丹县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451222, 450000, '天峨县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451223, 450000, '凤山县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451224, 450000, '东兰县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451225, 450000, '罗城仫佬族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451226, 450000, '环江毛南族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451227, 450000, '巴马瑶族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451228, 450000, '都安瑶族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451229, 450000, '大化瑶族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451300, 450000, '来宾市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451302, 450000, '兴宾区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451321, 450000, '忻城县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451322, 450000, '象州县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451323, 450000, '武宣县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451324, 450000, '金秀瑶族自治县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451381, 450000, '合山市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451400, 450000, '崇左市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451402, 450000, '江州区', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451421, 450000, '扶绥县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451422, 450000, '宁明县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451423, 450000, '龙州县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451424, 450000, '大新县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451425, 450000, '天等县', '广西壮族自治区');
INSERT INTO `jgb` VALUES (451481, 450000, '凭祥市', '广西壮族自治区');
INSERT INTO `jgb` VALUES (460000, 460000, '海南省', '海南省');
INSERT INTO `jgb` VALUES (460100, 460000, '海口市', '海南省');
INSERT INTO `jgb` VALUES (460105, 460000, '秀英区', '海南省');
INSERT INTO `jgb` VALUES (460106, 460000, '龙华区', '海南省');
INSERT INTO `jgb` VALUES (460107, 460000, '琼山区', '海南省');
INSERT INTO `jgb` VALUES (460108, 460000, '美兰区', '海南省');
INSERT INTO `jgb` VALUES (460200, 460000, '三亚市', '海南省');
INSERT INTO `jgb` VALUES (460202, 460000, '海棠区', '海南省');
INSERT INTO `jgb` VALUES (460203, 460000, '吉阳区', '海南省');
INSERT INTO `jgb` VALUES (460204, 460000, '天涯区', '海南省');
INSERT INTO `jgb` VALUES (460205, 460000, '崖州区', '海南省');
INSERT INTO `jgb` VALUES (460300, 460000, '三沙市', '海南省');
INSERT INTO `jgb` VALUES (460400, 460000, '儋州市', '海南省');
INSERT INTO `jgb` VALUES (469001, 460000, '五指山市', '海南省');
INSERT INTO `jgb` VALUES (469002, 460000, '琼海市', '海南省');
INSERT INTO `jgb` VALUES (469005, 460000, '文昌市', '海南省');
INSERT INTO `jgb` VALUES (469006, 460000, '万宁市', '海南省');
INSERT INTO `jgb` VALUES (469007, 460000, '东方市', '海南省');
INSERT INTO `jgb` VALUES (469021, 460000, '定安县', '海南省');
INSERT INTO `jgb` VALUES (469022, 460000, '屯昌县', '海南省');
INSERT INTO `jgb` VALUES (469023, 460000, '澄迈县', '海南省');
INSERT INTO `jgb` VALUES (469024, 460000, '临高县', '海南省');
INSERT INTO `jgb` VALUES (469025, 460000, '白沙黎族自治县', '海南省');
INSERT INTO `jgb` VALUES (469026, 460000, '昌江黎族自治县', '海南省');
INSERT INTO `jgb` VALUES (469027, 460000, '乐东黎族自治县', '海南省');
INSERT INTO `jgb` VALUES (469028, 460000, '陵水黎族自治县', '海南省');
INSERT INTO `jgb` VALUES (469029, 460000, '保亭黎族苗族自治县', '海南省');
INSERT INTO `jgb` VALUES (469030, 460000, '琼中黎族苗族自治县', '海南省');
INSERT INTO `jgb` VALUES (500000, 500000, '重庆市', '重庆市');
INSERT INTO `jgb` VALUES (500101, 500000, '万州区', '重庆市');
INSERT INTO `jgb` VALUES (500102, 500000, '涪陵区', '重庆市');
INSERT INTO `jgb` VALUES (500103, 500000, '渝中区', '重庆市');
INSERT INTO `jgb` VALUES (500104, 500000, '大渡口区', '重庆市');
INSERT INTO `jgb` VALUES (500105, 500000, '江北区', '重庆市');
INSERT INTO `jgb` VALUES (500106, 500000, '沙坪坝区', '重庆市');
INSERT INTO `jgb` VALUES (500107, 500000, '九龙坡区', '重庆市');
INSERT INTO `jgb` VALUES (500108, 500000, '南岸区', '重庆市');
INSERT INTO `jgb` VALUES (500109, 500000, '北碚区', '重庆市');
INSERT INTO `jgb` VALUES (500110, 500000, '綦江区', '重庆市');
INSERT INTO `jgb` VALUES (500111, 500000, '大足区', '重庆市');
INSERT INTO `jgb` VALUES (500112, 500000, '渝北区', '重庆市');
INSERT INTO `jgb` VALUES (500113, 500000, '巴南区', '重庆市');
INSERT INTO `jgb` VALUES (500114, 500000, '黔江区', '重庆市');
INSERT INTO `jgb` VALUES (500115, 500000, '长寿区', '重庆市');
INSERT INTO `jgb` VALUES (500116, 500000, '江津区', '重庆市');
INSERT INTO `jgb` VALUES (500117, 500000, '合川区', '重庆市');
INSERT INTO `jgb` VALUES (500118, 500000, '永川区', '重庆市');
INSERT INTO `jgb` VALUES (500119, 500000, '南川区', '重庆市');
INSERT INTO `jgb` VALUES (500120, 500000, '璧山区', '重庆市');
INSERT INTO `jgb` VALUES (500151, 500000, '铜梁区', '重庆市');
INSERT INTO `jgb` VALUES (500152, 500000, '潼南区', '重庆市');
INSERT INTO `jgb` VALUES (500153, 500000, '荣昌区', '重庆市');
INSERT INTO `jgb` VALUES (500154, 500000, '开州区', '重庆市');
INSERT INTO `jgb` VALUES (500155, 500000, '梁平区', '重庆市');
INSERT INTO `jgb` VALUES (500156, 500000, '武隆区', '重庆市');
INSERT INTO `jgb` VALUES (500229, 500000, '城口县', '重庆市');
INSERT INTO `jgb` VALUES (500230, 500000, '丰都县', '重庆市');
INSERT INTO `jgb` VALUES (500231, 500000, '垫江县', '重庆市');
INSERT INTO `jgb` VALUES (500233, 500000, '忠县', '重庆市');
INSERT INTO `jgb` VALUES (500235, 500000, '云阳县', '重庆市');
INSERT INTO `jgb` VALUES (500236, 500000, '奉节县', '重庆市');
INSERT INTO `jgb` VALUES (500237, 500000, '巫山县', '重庆市');
INSERT INTO `jgb` VALUES (500238, 500000, '巫溪县', '重庆市');
INSERT INTO `jgb` VALUES (500240, 500000, '石柱土家族自治县', '重庆市');
INSERT INTO `jgb` VALUES (500241, 500000, '秀山土家族苗族自治县', '重庆市');
INSERT INTO `jgb` VALUES (500242, 500000, '酉阳土家族苗族自治县', '重庆市');
INSERT INTO `jgb` VALUES (500243, 500000, '彭水苗族土家族自治县', '重庆市');
INSERT INTO `jgb` VALUES (510000, 510000, '四川省', '四川省');
INSERT INTO `jgb` VALUES (510100, 510000, '成都市', '四川省');
INSERT INTO `jgb` VALUES (510104, 510000, '锦江区', '四川省');
INSERT INTO `jgb` VALUES (510105, 510000, '青羊区', '四川省');
INSERT INTO `jgb` VALUES (510106, 510000, '金牛区', '四川省');
INSERT INTO `jgb` VALUES (510107, 510000, '武侯区', '四川省');
INSERT INTO `jgb` VALUES (510108, 510000, '成华区', '四川省');
INSERT INTO `jgb` VALUES (510112, 510000, '龙泉驿区', '四川省');
INSERT INTO `jgb` VALUES (510113, 510000, '青白江区', '四川省');
INSERT INTO `jgb` VALUES (510114, 510000, '新都区', '四川省');
INSERT INTO `jgb` VALUES (510115, 510000, '温江区', '四川省');
INSERT INTO `jgb` VALUES (510116, 510000, '双流区', '四川省');
INSERT INTO `jgb` VALUES (510117, 510000, '郫都区', '四川省');
INSERT INTO `jgb` VALUES (510121, 510000, '金堂县', '四川省');
INSERT INTO `jgb` VALUES (510129, 510000, '大邑县', '四川省');
INSERT INTO `jgb` VALUES (510131, 510000, '蒲江县', '四川省');
INSERT INTO `jgb` VALUES (510132, 510000, '新津县', '四川省');
INSERT INTO `jgb` VALUES (510181, 510000, '都江堰市', '四川省');
INSERT INTO `jgb` VALUES (510182, 510000, '彭州市', '四川省');
INSERT INTO `jgb` VALUES (510183, 510000, '邛崃市', '四川省');
INSERT INTO `jgb` VALUES (510184, 510000, '崇州市', '四川省');
INSERT INTO `jgb` VALUES (510185, 510000, '简阳市', '四川省');
INSERT INTO `jgb` VALUES (510300, 510000, '自贡市', '四川省');
INSERT INTO `jgb` VALUES (510302, 510000, '自流井区', '四川省');
INSERT INTO `jgb` VALUES (510303, 510000, '贡井区', '四川省');
INSERT INTO `jgb` VALUES (510304, 510000, '大安区', '四川省');
INSERT INTO `jgb` VALUES (510311, 510000, '沿滩区', '四川省');
INSERT INTO `jgb` VALUES (510321, 510000, '荣县', '四川省');
INSERT INTO `jgb` VALUES (510322, 510000, '富顺县', '四川省');
INSERT INTO `jgb` VALUES (510400, 510000, '攀枝花市', '四川省');
INSERT INTO `jgb` VALUES (510402, 510000, '东区', '四川省');
INSERT INTO `jgb` VALUES (510403, 510000, '西区', '四川省');
INSERT INTO `jgb` VALUES (510411, 510000, '仁和区', '四川省');
INSERT INTO `jgb` VALUES (510421, 510000, '米易县', '四川省');
INSERT INTO `jgb` VALUES (510422, 510000, '盐边县', '四川省');
INSERT INTO `jgb` VALUES (510500, 510000, '泸州市', '四川省');
INSERT INTO `jgb` VALUES (510502, 510000, '江阳区', '四川省');
INSERT INTO `jgb` VALUES (510503, 510000, '纳溪区', '四川省');
INSERT INTO `jgb` VALUES (510504, 510000, '龙马潭区', '四川省');
INSERT INTO `jgb` VALUES (510521, 510000, '泸县', '四川省');
INSERT INTO `jgb` VALUES (510522, 510000, '合江县', '四川省');
INSERT INTO `jgb` VALUES (510524, 510000, '叙永县', '四川省');
INSERT INTO `jgb` VALUES (510525, 510000, '古蔺县', '四川省');
INSERT INTO `jgb` VALUES (510600, 510000, '德阳市', '四川省');
INSERT INTO `jgb` VALUES (510603, 510000, '旌阳区', '四川省');
INSERT INTO `jgb` VALUES (510604, 510000, '罗江区', '四川省');
INSERT INTO `jgb` VALUES (510623, 510000, '中江县', '四川省');
INSERT INTO `jgb` VALUES (510681, 510000, '广汉市', '四川省');
INSERT INTO `jgb` VALUES (510682, 510000, '什邡市', '四川省');
INSERT INTO `jgb` VALUES (510683, 510000, '绵竹市', '四川省');
INSERT INTO `jgb` VALUES (510700, 510000, '绵阳市', '四川省');
INSERT INTO `jgb` VALUES (510703, 510000, '涪城区', '四川省');
INSERT INTO `jgb` VALUES (510704, 510000, '游仙区', '四川省');
INSERT INTO `jgb` VALUES (510705, 510000, '安州区', '四川省');
INSERT INTO `jgb` VALUES (510722, 510000, '三台县', '四川省');
INSERT INTO `jgb` VALUES (510723, 510000, '盐亭县', '四川省');
INSERT INTO `jgb` VALUES (510725, 510000, '梓潼县', '四川省');
INSERT INTO `jgb` VALUES (510726, 510000, '北川羌族自治县', '四川省');
INSERT INTO `jgb` VALUES (510727, 510000, '平武县', '四川省');
INSERT INTO `jgb` VALUES (510781, 510000, '江油市', '四川省');
INSERT INTO `jgb` VALUES (510800, 510000, '广元市', '四川省');
INSERT INTO `jgb` VALUES (510802, 510000, '利州区', '四川省');
INSERT INTO `jgb` VALUES (510811, 510000, '昭化区', '四川省');
INSERT INTO `jgb` VALUES (510812, 510000, '朝天区', '四川省');
INSERT INTO `jgb` VALUES (510821, 510000, '旺苍县', '四川省');
INSERT INTO `jgb` VALUES (510822, 510000, '青川县', '四川省');
INSERT INTO `jgb` VALUES (510823, 510000, '剑阁县', '四川省');
INSERT INTO `jgb` VALUES (510824, 510000, '苍溪县', '四川省');
INSERT INTO `jgb` VALUES (510900, 510000, '遂宁市', '四川省');
INSERT INTO `jgb` VALUES (510903, 510000, '船山区', '四川省');
INSERT INTO `jgb` VALUES (510904, 510000, '安居区', '四川省');
INSERT INTO `jgb` VALUES (510921, 510000, '蓬溪县', '四川省');
INSERT INTO `jgb` VALUES (510922, 510000, '射洪县', '四川省');
INSERT INTO `jgb` VALUES (510923, 510000, '大英县', '四川省');
INSERT INTO `jgb` VALUES (511000, 510000, '内江市', '四川省');
INSERT INTO `jgb` VALUES (511002, 510000, '市中区', '四川省');
INSERT INTO `jgb` VALUES (511011, 510000, '东兴区', '四川省');
INSERT INTO `jgb` VALUES (511024, 510000, '威远县', '四川省');
INSERT INTO `jgb` VALUES (511025, 510000, '资中县', '四川省');
INSERT INTO `jgb` VALUES (511083, 510000, '隆昌市', '四川省');
INSERT INTO `jgb` VALUES (511100, 510000, '乐山市', '四川省');
INSERT INTO `jgb` VALUES (511102, 510000, '市中区', '四川省');
INSERT INTO `jgb` VALUES (511111, 510000, '沙湾区', '四川省');
INSERT INTO `jgb` VALUES (511112, 510000, '五通桥区', '四川省');
INSERT INTO `jgb` VALUES (511113, 510000, '金口河区', '四川省');
INSERT INTO `jgb` VALUES (511123, 510000, '犍为县', '四川省');
INSERT INTO `jgb` VALUES (511124, 510000, '井研县', '四川省');
INSERT INTO `jgb` VALUES (511126, 510000, '夹江县', '四川省');
INSERT INTO `jgb` VALUES (511129, 510000, '沐川县', '四川省');
INSERT INTO `jgb` VALUES (511132, 510000, '峨边彝族自治县', '四川省');
INSERT INTO `jgb` VALUES (511133, 510000, '马边彝族自治县', '四川省');
INSERT INTO `jgb` VALUES (511181, 510000, '峨眉山市', '四川省');
INSERT INTO `jgb` VALUES (511300, 510000, '南充市', '四川省');
INSERT INTO `jgb` VALUES (511302, 510000, '顺庆区', '四川省');
INSERT INTO `jgb` VALUES (511303, 510000, '高坪区', '四川省');
INSERT INTO `jgb` VALUES (511304, 510000, '嘉陵区', '四川省');
INSERT INTO `jgb` VALUES (511321, 510000, '南部县', '四川省');
INSERT INTO `jgb` VALUES (511322, 510000, '营山县', '四川省');
INSERT INTO `jgb` VALUES (511323, 510000, '蓬安县', '四川省');
INSERT INTO `jgb` VALUES (511324, 510000, '仪陇县', '四川省');
INSERT INTO `jgb` VALUES (511325, 510000, '西充县', '四川省');
INSERT INTO `jgb` VALUES (511381, 510000, '阆中市', '四川省');
INSERT INTO `jgb` VALUES (511400, 510000, '眉山市', '四川省');
INSERT INTO `jgb` VALUES (511402, 510000, '东坡区', '四川省');
INSERT INTO `jgb` VALUES (511403, 510000, '彭山区', '四川省');
INSERT INTO `jgb` VALUES (511421, 510000, '仁寿县', '四川省');
INSERT INTO `jgb` VALUES (511423, 510000, '洪雅县', '四川省');
INSERT INTO `jgb` VALUES (511424, 510000, '丹棱县', '四川省');
INSERT INTO `jgb` VALUES (511425, 510000, '青神县', '四川省');
INSERT INTO `jgb` VALUES (511500, 510000, '宜宾市', '四川省');
INSERT INTO `jgb` VALUES (511502, 510000, '翠屏区', '四川省');
INSERT INTO `jgb` VALUES (511503, 510000, '南溪区', '四川省');
INSERT INTO `jgb` VALUES (511521, 510000, '宜宾县', '四川省');
INSERT INTO `jgb` VALUES (511523, 510000, '江安县', '四川省');
INSERT INTO `jgb` VALUES (511524, 510000, '长宁县', '四川省');
INSERT INTO `jgb` VALUES (511525, 510000, '高县', '四川省');
INSERT INTO `jgb` VALUES (511526, 510000, '珙县', '四川省');
INSERT INTO `jgb` VALUES (511527, 510000, '筠连县', '四川省');
INSERT INTO `jgb` VALUES (511528, 510000, '兴文县', '四川省');
INSERT INTO `jgb` VALUES (511529, 510000, '屏山县', '四川省');
INSERT INTO `jgb` VALUES (511600, 510000, '广安市', '四川省');
INSERT INTO `jgb` VALUES (511602, 510000, '广安区', '四川省');
INSERT INTO `jgb` VALUES (511603, 510000, '前锋区', '四川省');
INSERT INTO `jgb` VALUES (511621, 510000, '岳池县', '四川省');
INSERT INTO `jgb` VALUES (511622, 510000, '武胜县', '四川省');
INSERT INTO `jgb` VALUES (511623, 510000, '邻水县', '四川省');
INSERT INTO `jgb` VALUES (511681, 510000, '华蓥市', '四川省');
INSERT INTO `jgb` VALUES (511700, 510000, '达州市', '四川省');
INSERT INTO `jgb` VALUES (511702, 510000, '通川区', '四川省');
INSERT INTO `jgb` VALUES (511703, 510000, '达川区', '四川省');
INSERT INTO `jgb` VALUES (511722, 510000, '宣汉县', '四川省');
INSERT INTO `jgb` VALUES (511723, 510000, '开江县', '四川省');
INSERT INTO `jgb` VALUES (511724, 510000, '大竹县', '四川省');
INSERT INTO `jgb` VALUES (511725, 510000, '渠县', '四川省');
INSERT INTO `jgb` VALUES (511781, 510000, '万源市', '四川省');
INSERT INTO `jgb` VALUES (511800, 510000, '雅安市', '四川省');
INSERT INTO `jgb` VALUES (511802, 510000, '雨城区', '四川省');
INSERT INTO `jgb` VALUES (511803, 510000, '名山区', '四川省');
INSERT INTO `jgb` VALUES (511822, 510000, '荥经县', '四川省');
INSERT INTO `jgb` VALUES (511823, 510000, '汉源县', '四川省');
INSERT INTO `jgb` VALUES (511824, 510000, '石棉县', '四川省');
INSERT INTO `jgb` VALUES (511825, 510000, '天全县', '四川省');
INSERT INTO `jgb` VALUES (511826, 510000, '芦山县', '四川省');
INSERT INTO `jgb` VALUES (511827, 510000, '宝兴县', '四川省');
INSERT INTO `jgb` VALUES (511900, 510000, '巴中市', '四川省');
INSERT INTO `jgb` VALUES (511902, 510000, '巴州区', '四川省');
INSERT INTO `jgb` VALUES (511903, 510000, '恩阳区', '四川省');
INSERT INTO `jgb` VALUES (511921, 510000, '通江县', '四川省');
INSERT INTO `jgb` VALUES (511922, 510000, '南江县', '四川省');
INSERT INTO `jgb` VALUES (511923, 510000, '平昌县', '四川省');
INSERT INTO `jgb` VALUES (512000, 510000, '资阳市', '四川省');
INSERT INTO `jgb` VALUES (512002, 510000, '雁江区', '四川省');
INSERT INTO `jgb` VALUES (512021, 510000, '安岳县', '四川省');
INSERT INTO `jgb` VALUES (512022, 510000, '乐至县', '四川省');
INSERT INTO `jgb` VALUES (513200, 510000, '阿坝藏族羌族自治州', '四川省');
INSERT INTO `jgb` VALUES (513201, 510000, '马尔康市', '四川省');
INSERT INTO `jgb` VALUES (513221, 510000, '汶川县', '四川省');
INSERT INTO `jgb` VALUES (513222, 510000, '理县', '四川省');
INSERT INTO `jgb` VALUES (513223, 510000, '茂县', '四川省');
INSERT INTO `jgb` VALUES (513224, 510000, '松潘县', '四川省');
INSERT INTO `jgb` VALUES (513225, 510000, '九寨沟县', '四川省');
INSERT INTO `jgb` VALUES (513226, 510000, '金川县', '四川省');
INSERT INTO `jgb` VALUES (513227, 510000, '小金县', '四川省');
INSERT INTO `jgb` VALUES (513228, 510000, '黑水县', '四川省');
INSERT INTO `jgb` VALUES (513230, 510000, '壤塘县', '四川省');
INSERT INTO `jgb` VALUES (513231, 510000, '阿坝县', '四川省');
INSERT INTO `jgb` VALUES (513232, 510000, '若尔盖县', '四川省');
INSERT INTO `jgb` VALUES (513233, 510000, '红原县', '四川省');
INSERT INTO `jgb` VALUES (513300, 510000, '甘孜藏族自治州', '四川省');
INSERT INTO `jgb` VALUES (513301, 510000, '康定市', '四川省');
INSERT INTO `jgb` VALUES (513322, 510000, '泸定县', '四川省');
INSERT INTO `jgb` VALUES (513323, 510000, '丹巴县', '四川省');
INSERT INTO `jgb` VALUES (513324, 510000, '九龙县', '四川省');
INSERT INTO `jgb` VALUES (513325, 510000, '雅江县', '四川省');
INSERT INTO `jgb` VALUES (513326, 510000, '道孚县', '四川省');
INSERT INTO `jgb` VALUES (513327, 510000, '炉霍县', '四川省');
INSERT INTO `jgb` VALUES (513328, 510000, '甘孜县', '四川省');
INSERT INTO `jgb` VALUES (513329, 510000, '新龙县', '四川省');
INSERT INTO `jgb` VALUES (513330, 510000, '德格县', '四川省');
INSERT INTO `jgb` VALUES (513331, 510000, '白玉县', '四川省');
INSERT INTO `jgb` VALUES (513332, 510000, '石渠县', '四川省');
INSERT INTO `jgb` VALUES (513333, 510000, '色达县', '四川省');
INSERT INTO `jgb` VALUES (513334, 510000, '理塘县', '四川省');
INSERT INTO `jgb` VALUES (513335, 510000, '巴塘县', '四川省');
INSERT INTO `jgb` VALUES (513336, 510000, '乡城县', '四川省');
INSERT INTO `jgb` VALUES (513337, 510000, '稻城县', '四川省');
INSERT INTO `jgb` VALUES (513338, 510000, '得荣县', '四川省');
INSERT INTO `jgb` VALUES (513400, 510000, '凉山彝族自治州', '四川省');
INSERT INTO `jgb` VALUES (513401, 510000, '西昌市', '四川省');
INSERT INTO `jgb` VALUES (513422, 510000, '木里藏族自治县', '四川省');
INSERT INTO `jgb` VALUES (513423, 510000, '盐源县', '四川省');
INSERT INTO `jgb` VALUES (513424, 510000, '德昌县', '四川省');
INSERT INTO `jgb` VALUES (513425, 510000, '会理县', '四川省');
INSERT INTO `jgb` VALUES (513426, 510000, '会东县', '四川省');
INSERT INTO `jgb` VALUES (513427, 510000, '宁南县', '四川省');
INSERT INTO `jgb` VALUES (513428, 510000, '普格县', '四川省');
INSERT INTO `jgb` VALUES (513429, 510000, '布拖县', '四川省');
INSERT INTO `jgb` VALUES (513430, 510000, '金阳县', '四川省');
INSERT INTO `jgb` VALUES (513431, 510000, '昭觉县', '四川省');
INSERT INTO `jgb` VALUES (513432, 510000, '喜德县', '四川省');
INSERT INTO `jgb` VALUES (513433, 510000, '冕宁县', '四川省');
INSERT INTO `jgb` VALUES (513434, 510000, '越西县', '四川省');
INSERT INTO `jgb` VALUES (513435, 510000, '甘洛县', '四川省');
INSERT INTO `jgb` VALUES (513436, 510000, '美姑县', '四川省');
INSERT INTO `jgb` VALUES (513437, 510000, '雷波县', '四川省');
INSERT INTO `jgb` VALUES (520000, 520000, '贵州省', '贵州省');
INSERT INTO `jgb` VALUES (520100, 520000, '贵阳市', '贵州省');
INSERT INTO `jgb` VALUES (520102, 520000, '南明区', '贵州省');
INSERT INTO `jgb` VALUES (520103, 520000, '云岩区', '贵州省');
INSERT INTO `jgb` VALUES (520111, 520000, '花溪区', '贵州省');
INSERT INTO `jgb` VALUES (520112, 520000, '乌当区', '贵州省');
INSERT INTO `jgb` VALUES (520113, 520000, '白云区', '贵州省');
INSERT INTO `jgb` VALUES (520115, 520000, '观山湖区', '贵州省');
INSERT INTO `jgb` VALUES (520121, 520000, '开阳县', '贵州省');
INSERT INTO `jgb` VALUES (520122, 520000, '息烽县', '贵州省');
INSERT INTO `jgb` VALUES (520123, 520000, '修文县', '贵州省');
INSERT INTO `jgb` VALUES (520181, 520000, '清镇市', '贵州省');
INSERT INTO `jgb` VALUES (520200, 520000, '六盘水市', '贵州省');
INSERT INTO `jgb` VALUES (520201, 520000, '钟山区', '贵州省');
INSERT INTO `jgb` VALUES (520203, 520000, '六枝特区', '贵州省');
INSERT INTO `jgb` VALUES (520221, 520000, '水城县', '贵州省');
INSERT INTO `jgb` VALUES (520281, 520000, '盘州市', '贵州省');
INSERT INTO `jgb` VALUES (520300, 520000, '遵义市', '贵州省');
INSERT INTO `jgb` VALUES (520302, 520000, '红花岗区', '贵州省');
INSERT INTO `jgb` VALUES (520303, 520000, '汇川区', '贵州省');
INSERT INTO `jgb` VALUES (520304, 520000, '播州区', '贵州省');
INSERT INTO `jgb` VALUES (520322, 520000, '桐梓县', '贵州省');
INSERT INTO `jgb` VALUES (520323, 520000, '绥阳县', '贵州省');
INSERT INTO `jgb` VALUES (520324, 520000, '正安县', '贵州省');
INSERT INTO `jgb` VALUES (520325, 520000, '道真仡佬族苗族自治县', '贵州省');
INSERT INTO `jgb` VALUES (520326, 520000, '务川仡佬族苗族自治县', '贵州省');
INSERT INTO `jgb` VALUES (520327, 520000, '凤冈县', '贵州省');
INSERT INTO `jgb` VALUES (520328, 520000, '湄潭县', '贵州省');
INSERT INTO `jgb` VALUES (520329, 520000, '余庆县', '贵州省');
INSERT INTO `jgb` VALUES (520330, 520000, '习水县', '贵州省');
INSERT INTO `jgb` VALUES (520381, 520000, '赤水市', '贵州省');
INSERT INTO `jgb` VALUES (520382, 520000, '仁怀市', '贵州省');
INSERT INTO `jgb` VALUES (520400, 520000, '安顺市', '贵州省');
INSERT INTO `jgb` VALUES (520402, 520000, '西秀区', '贵州省');
INSERT INTO `jgb` VALUES (520403, 520000, '平坝区', '贵州省');
INSERT INTO `jgb` VALUES (520422, 520000, '普定县', '贵州省');
INSERT INTO `jgb` VALUES (520423, 520000, '镇宁布依族苗族自治县', '贵州省');
INSERT INTO `jgb` VALUES (520424, 520000, '关岭布依族苗族自治县', '贵州省');
INSERT INTO `jgb` VALUES (520425, 520000, '紫云苗族布依族自治县', '贵州省');
INSERT INTO `jgb` VALUES (520500, 520000, '毕节市', '贵州省');
INSERT INTO `jgb` VALUES (520502, 520000, '七星关区', '贵州省');
INSERT INTO `jgb` VALUES (520521, 520000, '大方县', '贵州省');
INSERT INTO `jgb` VALUES (520522, 520000, '黔西县', '贵州省');
INSERT INTO `jgb` VALUES (520523, 520000, '金沙县', '贵州省');
INSERT INTO `jgb` VALUES (520524, 520000, '织金县', '贵州省');
INSERT INTO `jgb` VALUES (520525, 520000, '纳雍县', '贵州省');
INSERT INTO `jgb` VALUES (520526, 520000, '威宁彝族回族苗族自治县', '贵州省');
INSERT INTO `jgb` VALUES (520527, 520000, '赫章县', '贵州省');
INSERT INTO `jgb` VALUES (520600, 520000, '铜仁市', '贵州省');
INSERT INTO `jgb` VALUES (520602, 520000, '碧江区', '贵州省');
INSERT INTO `jgb` VALUES (520603, 520000, '万山区', '贵州省');
INSERT INTO `jgb` VALUES (520621, 520000, '江口县', '贵州省');
INSERT INTO `jgb` VALUES (520622, 520000, '玉屏侗族自治县', '贵州省');
INSERT INTO `jgb` VALUES (520623, 520000, '石阡县', '贵州省');
INSERT INTO `jgb` VALUES (520624, 520000, '思南县', '贵州省');
INSERT INTO `jgb` VALUES (520625, 520000, '印江土家族苗族自治县', '贵州省');
INSERT INTO `jgb` VALUES (520626, 520000, '德江县', '贵州省');
INSERT INTO `jgb` VALUES (520627, 520000, '沿河土家族自治县', '贵州省');
INSERT INTO `jgb` VALUES (520628, 520000, '松桃苗族自治县', '贵州省');
INSERT INTO `jgb` VALUES (522300, 520000, '黔西南布依族苗族自治州', '贵州省');
INSERT INTO `jgb` VALUES (522301, 520000, '兴义市', '贵州省');
INSERT INTO `jgb` VALUES (522322, 520000, '兴仁县', '贵州省');
INSERT INTO `jgb` VALUES (522323, 520000, '普安县', '贵州省');
INSERT INTO `jgb` VALUES (522324, 520000, '晴隆县', '贵州省');
INSERT INTO `jgb` VALUES (522325, 520000, '贞丰县', '贵州省');
INSERT INTO `jgb` VALUES (522326, 520000, '望谟县', '贵州省');
INSERT INTO `jgb` VALUES (522327, 520000, '册亨县', '贵州省');
INSERT INTO `jgb` VALUES (522328, 520000, '安龙县', '贵州省');
INSERT INTO `jgb` VALUES (522600, 520000, '黔东南苗族侗族自治州', '贵州省');
INSERT INTO `jgb` VALUES (522601, 520000, '凯里市', '贵州省');
INSERT INTO `jgb` VALUES (522622, 520000, '黄平县', '贵州省');
INSERT INTO `jgb` VALUES (522623, 520000, '施秉县', '贵州省');
INSERT INTO `jgb` VALUES (522624, 520000, '三穗县', '贵州省');
INSERT INTO `jgb` VALUES (522625, 520000, '镇远县', '贵州省');
INSERT INTO `jgb` VALUES (522626, 520000, '岑巩县', '贵州省');
INSERT INTO `jgb` VALUES (522627, 520000, '天柱县', '贵州省');
INSERT INTO `jgb` VALUES (522628, 520000, '锦屏县', '贵州省');
INSERT INTO `jgb` VALUES (522629, 520000, '剑河县', '贵州省');
INSERT INTO `jgb` VALUES (522630, 520000, '台江县', '贵州省');
INSERT INTO `jgb` VALUES (522631, 520000, '黎平县', '贵州省');
INSERT INTO `jgb` VALUES (522632, 520000, '榕江县', '贵州省');
INSERT INTO `jgb` VALUES (522633, 520000, '从江县', '贵州省');
INSERT INTO `jgb` VALUES (522634, 520000, '雷山县', '贵州省');
INSERT INTO `jgb` VALUES (522635, 520000, '麻江县', '贵州省');
INSERT INTO `jgb` VALUES (522636, 520000, '丹寨县', '贵州省');
INSERT INTO `jgb` VALUES (522700, 520000, '黔南布依族苗族自治州', '贵州省');
INSERT INTO `jgb` VALUES (522701, 520000, '都匀市', '贵州省');
INSERT INTO `jgb` VALUES (522702, 520000, '福泉市', '贵州省');
INSERT INTO `jgb` VALUES (522722, 520000, '荔波县', '贵州省');
INSERT INTO `jgb` VALUES (522723, 520000, '贵定县', '贵州省');
INSERT INTO `jgb` VALUES (522725, 520000, '瓮安县', '贵州省');
INSERT INTO `jgb` VALUES (522726, 520000, '独山县', '贵州省');
INSERT INTO `jgb` VALUES (522727, 520000, '平塘县', '贵州省');
INSERT INTO `jgb` VALUES (522728, 520000, '罗甸县', '贵州省');
INSERT INTO `jgb` VALUES (522729, 520000, '长顺县', '贵州省');
INSERT INTO `jgb` VALUES (522730, 520000, '龙里县', '贵州省');
INSERT INTO `jgb` VALUES (522731, 520000, '惠水县', '贵州省');
INSERT INTO `jgb` VALUES (522732, 520000, '三都水族自治县', '贵州省');
INSERT INTO `jgb` VALUES (530000, 530000, '云南省', '云南省');
INSERT INTO `jgb` VALUES (530100, 530000, '昆明市', '云南省');
INSERT INTO `jgb` VALUES (530102, 530000, '五华区', '云南省');
INSERT INTO `jgb` VALUES (530103, 530000, '盘龙区', '云南省');
INSERT INTO `jgb` VALUES (530111, 530000, '官渡区', '云南省');
INSERT INTO `jgb` VALUES (530112, 530000, '西山区', '云南省');
INSERT INTO `jgb` VALUES (530113, 530000, '东川区', '云南省');
INSERT INTO `jgb` VALUES (530114, 530000, '呈贡区', '云南省');
INSERT INTO `jgb` VALUES (530115, 530000, '晋宁区', '云南省');
INSERT INTO `jgb` VALUES (530124, 530000, '富民县', '云南省');
INSERT INTO `jgb` VALUES (530125, 530000, '宜良县', '云南省');
INSERT INTO `jgb` VALUES (530126, 530000, '石林彝族自治县', '云南省');
INSERT INTO `jgb` VALUES (530127, 530000, '嵩明县', '云南省');
INSERT INTO `jgb` VALUES (530128, 530000, '禄劝彝族苗族自治县', '云南省');
INSERT INTO `jgb` VALUES (530129, 530000, '寻甸回族彝族自治县', '云南省');
INSERT INTO `jgb` VALUES (530181, 530000, '安宁市', '云南省');
INSERT INTO `jgb` VALUES (530300, 530000, '曲靖市', '云南省');
INSERT INTO `jgb` VALUES (530302, 530000, '麒麟区', '云南省');
INSERT INTO `jgb` VALUES (530303, 530000, '沾益区', '云南省');
INSERT INTO `jgb` VALUES (530321, 530000, '马龙县', '云南省');
INSERT INTO `jgb` VALUES (530322, 530000, '陆良县', '云南省');
INSERT INTO `jgb` VALUES (530323, 530000, '师宗县', '云南省');
INSERT INTO `jgb` VALUES (530324, 530000, '罗平县', '云南省');
INSERT INTO `jgb` VALUES (530325, 530000, '富源县', '云南省');
INSERT INTO `jgb` VALUES (530326, 530000, '会泽县', '云南省');
INSERT INTO `jgb` VALUES (530381, 530000, '宣威市', '云南省');
INSERT INTO `jgb` VALUES (530400, 530000, '玉溪市', '云南省');
INSERT INTO `jgb` VALUES (530402, 530000, '红塔区', '云南省');
INSERT INTO `jgb` VALUES (530403, 530000, '江川区', '云南省');
INSERT INTO `jgb` VALUES (530422, 530000, '澄江县', '云南省');
INSERT INTO `jgb` VALUES (530423, 530000, '通海县', '云南省');
INSERT INTO `jgb` VALUES (530424, 530000, '华宁县', '云南省');
INSERT INTO `jgb` VALUES (530425, 530000, '易门县', '云南省');
INSERT INTO `jgb` VALUES (530426, 530000, '峨山彝族自治县', '云南省');
INSERT INTO `jgb` VALUES (530427, 530000, '新平彝族傣族自治县', '云南省');
INSERT INTO `jgb` VALUES (530428, 530000, '元江哈尼族彝族傣族自治县', '云南省');
INSERT INTO `jgb` VALUES (530500, 530000, '保山市', '云南省');
INSERT INTO `jgb` VALUES (530502, 530000, '隆阳区', '云南省');
INSERT INTO `jgb` VALUES (530521, 530000, '施甸县', '云南省');
INSERT INTO `jgb` VALUES (530523, 530000, '龙陵县', '云南省');
INSERT INTO `jgb` VALUES (530524, 530000, '昌宁县', '云南省');
INSERT INTO `jgb` VALUES (530581, 530000, '腾冲市', '云南省');
INSERT INTO `jgb` VALUES (530600, 530000, '昭通市', '云南省');
INSERT INTO `jgb` VALUES (530602, 530000, '昭阳区', '云南省');
INSERT INTO `jgb` VALUES (530621, 530000, '鲁甸县', '云南省');
INSERT INTO `jgb` VALUES (530622, 530000, '巧家县', '云南省');
INSERT INTO `jgb` VALUES (530623, 530000, '盐津县', '云南省');
INSERT INTO `jgb` VALUES (530624, 530000, '大关县', '云南省');
INSERT INTO `jgb` VALUES (530625, 530000, '永善县', '云南省');
INSERT INTO `jgb` VALUES (530626, 530000, '绥江县', '云南省');
INSERT INTO `jgb` VALUES (530627, 530000, '镇雄县', '云南省');
INSERT INTO `jgb` VALUES (530628, 530000, '彝良县', '云南省');
INSERT INTO `jgb` VALUES (530629, 530000, '威信县', '云南省');
INSERT INTO `jgb` VALUES (530630, 530000, '水富县', '云南省');
INSERT INTO `jgb` VALUES (530700, 530000, '丽江市', '云南省');
INSERT INTO `jgb` VALUES (530702, 530000, '古城区', '云南省');
INSERT INTO `jgb` VALUES (530721, 530000, '玉龙纳西族自治县', '云南省');
INSERT INTO `jgb` VALUES (530722, 530000, '永胜县', '云南省');
INSERT INTO `jgb` VALUES (530723, 530000, '华坪县', '云南省');
INSERT INTO `jgb` VALUES (530724, 530000, '宁蒗彝族自治县', '云南省');
INSERT INTO `jgb` VALUES (530800, 530000, '普洱市', '云南省');
INSERT INTO `jgb` VALUES (530802, 530000, '思茅区', '云南省');
INSERT INTO `jgb` VALUES (530821, 530000, '宁洱哈尼族彝族自治县', '云南省');
INSERT INTO `jgb` VALUES (530822, 530000, '墨江哈尼族自治县', '云南省');
INSERT INTO `jgb` VALUES (530823, 530000, '景东彝族自治县', '云南省');
INSERT INTO `jgb` VALUES (530824, 530000, '景谷傣族彝族自治县', '云南省');
INSERT INTO `jgb` VALUES (530825, 530000, '镇沅彝族哈尼族拉祜族自治县', '云南省');
INSERT INTO `jgb` VALUES (530826, 530000, '江城哈尼族彝族自治县', '云南省');
INSERT INTO `jgb` VALUES (530827, 530000, '孟连傣族拉祜族佤族自治县', '云南省');
INSERT INTO `jgb` VALUES (530828, 530000, '澜沧拉祜族自治县', '云南省');
INSERT INTO `jgb` VALUES (530829, 530000, '西盟佤族自治县', '云南省');
INSERT INTO `jgb` VALUES (530900, 530000, '临沧市', '云南省');
INSERT INTO `jgb` VALUES (530902, 530000, '临翔区', '云南省');
INSERT INTO `jgb` VALUES (530921, 530000, '凤庆县', '云南省');
INSERT INTO `jgb` VALUES (530922, 530000, '云县', '云南省');
INSERT INTO `jgb` VALUES (530923, 530000, '永德县', '云南省');
INSERT INTO `jgb` VALUES (530924, 530000, '镇康县', '云南省');
INSERT INTO `jgb` VALUES (530925, 530000, '双江拉祜族佤族布朗族傣族自治县', '云南省');
INSERT INTO `jgb` VALUES (530926, 530000, '耿马傣族佤族自治县', '云南省');
INSERT INTO `jgb` VALUES (530927, 530000, '沧源佤族自治县', '云南省');
INSERT INTO `jgb` VALUES (532300, 530000, '楚雄彝族自治州', '云南省');
INSERT INTO `jgb` VALUES (532301, 530000, '楚雄市', '云南省');
INSERT INTO `jgb` VALUES (532322, 530000, '双柏县', '云南省');
INSERT INTO `jgb` VALUES (532323, 530000, '牟定县', '云南省');
INSERT INTO `jgb` VALUES (532324, 530000, '南华县', '云南省');
INSERT INTO `jgb` VALUES (532325, 530000, '姚安县', '云南省');
INSERT INTO `jgb` VALUES (532326, 530000, '大姚县', '云南省');
INSERT INTO `jgb` VALUES (532327, 530000, '永仁县', '云南省');
INSERT INTO `jgb` VALUES (532328, 530000, '元谋县', '云南省');
INSERT INTO `jgb` VALUES (532329, 530000, '武定县', '云南省');
INSERT INTO `jgb` VALUES (532331, 530000, '禄丰县', '云南省');
INSERT INTO `jgb` VALUES (532500, 530000, '红河哈尼族彝族自治州', '云南省');
INSERT INTO `jgb` VALUES (532501, 530000, '个旧市', '云南省');
INSERT INTO `jgb` VALUES (532502, 530000, '开远市', '云南省');
INSERT INTO `jgb` VALUES (532503, 530000, '蒙自市', '云南省');
INSERT INTO `jgb` VALUES (532504, 530000, '弥勒市', '云南省');
INSERT INTO `jgb` VALUES (532523, 530000, '屏边苗族自治县', '云南省');
INSERT INTO `jgb` VALUES (532524, 530000, '建水县', '云南省');
INSERT INTO `jgb` VALUES (532525, 530000, '石屏县', '云南省');
INSERT INTO `jgb` VALUES (532527, 530000, '泸西县', '云南省');
INSERT INTO `jgb` VALUES (532528, 530000, '元阳县', '云南省');
INSERT INTO `jgb` VALUES (532529, 530000, '红河县', '云南省');
INSERT INTO `jgb` VALUES (532530, 530000, '金平苗族瑶族傣族自治县', '云南省');
INSERT INTO `jgb` VALUES (532531, 530000, '绿春县', '云南省');
INSERT INTO `jgb` VALUES (532532, 530000, '河口瑶族自治县', '云南省');
INSERT INTO `jgb` VALUES (532600, 530000, '文山壮族苗族自治州', '云南省');
INSERT INTO `jgb` VALUES (532601, 530000, '文山市', '云南省');
INSERT INTO `jgb` VALUES (532622, 530000, '砚山县', '云南省');
INSERT INTO `jgb` VALUES (532623, 530000, '西畴县', '云南省');
INSERT INTO `jgb` VALUES (532624, 530000, '麻栗坡县', '云南省');
INSERT INTO `jgb` VALUES (532625, 530000, '马关县', '云南省');
INSERT INTO `jgb` VALUES (532626, 530000, '丘北县', '云南省');
INSERT INTO `jgb` VALUES (532627, 530000, '广南县', '云南省');
INSERT INTO `jgb` VALUES (532628, 530000, '富宁县', '云南省');
INSERT INTO `jgb` VALUES (532800, 530000, '西双版纳傣族自治州', '云南省');
INSERT INTO `jgb` VALUES (532801, 530000, '景洪市', '云南省');
INSERT INTO `jgb` VALUES (532822, 530000, '勐海县', '云南省');
INSERT INTO `jgb` VALUES (532823, 530000, '勐腊县', '云南省');
INSERT INTO `jgb` VALUES (532900, 530000, '大理白族自治州', '云南省');
INSERT INTO `jgb` VALUES (532901, 530000, '大理市', '云南省');
INSERT INTO `jgb` VALUES (532922, 530000, '漾濞彝族自治县', '云南省');
INSERT INTO `jgb` VALUES (532923, 530000, '祥云县', '云南省');
INSERT INTO `jgb` VALUES (532924, 530000, '宾川县', '云南省');
INSERT INTO `jgb` VALUES (532925, 530000, '弥渡县', '云南省');
INSERT INTO `jgb` VALUES (532926, 530000, '南涧彝族自治县', '云南省');
INSERT INTO `jgb` VALUES (532927, 530000, '巍山彝族回族自治县', '云南省');
INSERT INTO `jgb` VALUES (532928, 530000, '永平县', '云南省');
INSERT INTO `jgb` VALUES (532929, 530000, '云龙县', '云南省');
INSERT INTO `jgb` VALUES (532930, 530000, '洱源县', '云南省');
INSERT INTO `jgb` VALUES (532931, 530000, '剑川县', '云南省');
INSERT INTO `jgb` VALUES (532932, 530000, '鹤庆县', '云南省');
INSERT INTO `jgb` VALUES (533100, 530000, '德宏傣族景颇族自治州', '云南省');
INSERT INTO `jgb` VALUES (533102, 530000, '瑞丽市', '云南省');
INSERT INTO `jgb` VALUES (533103, 530000, '芒市', '云南省');
INSERT INTO `jgb` VALUES (533122, 530000, '梁河县', '云南省');
INSERT INTO `jgb` VALUES (533123, 530000, '盈江县', '云南省');
INSERT INTO `jgb` VALUES (533124, 530000, '陇川县', '云南省');
INSERT INTO `jgb` VALUES (533300, 530000, '怒江傈僳族自治州', '云南省');
INSERT INTO `jgb` VALUES (533301, 530000, '泸水市', '云南省');
INSERT INTO `jgb` VALUES (533323, 530000, '福贡县', '云南省');
INSERT INTO `jgb` VALUES (533324, 530000, '贡山独龙族怒族自治县', '云南省');
INSERT INTO `jgb` VALUES (533325, 530000, '兰坪白族普米族自治县', '云南省');
INSERT INTO `jgb` VALUES (533400, 530000, '迪庆藏族自治州', '云南省');
INSERT INTO `jgb` VALUES (533401, 530000, '香格里拉市', '云南省');
INSERT INTO `jgb` VALUES (533422, 530000, '德钦县', '云南省');
INSERT INTO `jgb` VALUES (533423, 530000, '维西傈僳族自治县', '云南省');
INSERT INTO `jgb` VALUES (540000, 540000, '西藏自治区', '西藏自治区');
INSERT INTO `jgb` VALUES (540100, 540000, '拉萨市', '西藏自治区');
INSERT INTO `jgb` VALUES (540102, 540000, '城关区', '西藏自治区');
INSERT INTO `jgb` VALUES (540103, 540000, '堆龙德庆区', '西藏自治区');
INSERT INTO `jgb` VALUES (540104, 540000, '达孜区', '西藏自治区');
INSERT INTO `jgb` VALUES (540121, 540000, '林周县', '西藏自治区');
INSERT INTO `jgb` VALUES (540122, 540000, '当雄县', '西藏自治区');
INSERT INTO `jgb` VALUES (540123, 540000, '尼木县', '西藏自治区');
INSERT INTO `jgb` VALUES (540124, 540000, '曲水县', '西藏自治区');
INSERT INTO `jgb` VALUES (540127, 540000, '墨竹工卡县', '西藏自治区');
INSERT INTO `jgb` VALUES (540200, 540000, '日喀则市', '西藏自治区');
INSERT INTO `jgb` VALUES (540202, 540000, '桑珠孜区', '西藏自治区');
INSERT INTO `jgb` VALUES (540221, 540000, '南木林县', '西藏自治区');
INSERT INTO `jgb` VALUES (540222, 540000, '江孜县', '西藏自治区');
INSERT INTO `jgb` VALUES (540223, 540000, '定日县', '西藏自治区');
INSERT INTO `jgb` VALUES (540224, 540000, '萨迦县', '西藏自治区');
INSERT INTO `jgb` VALUES (540225, 540000, '拉孜县', '西藏自治区');
INSERT INTO `jgb` VALUES (540226, 540000, '昂仁县', '西藏自治区');
INSERT INTO `jgb` VALUES (540227, 540000, '谢通门县', '西藏自治区');
INSERT INTO `jgb` VALUES (540228, 540000, '白朗县', '西藏自治区');
INSERT INTO `jgb` VALUES (540229, 540000, '仁布县', '西藏自治区');
INSERT INTO `jgb` VALUES (540230, 540000, '康马县', '西藏自治区');
INSERT INTO `jgb` VALUES (540231, 540000, '定结县', '西藏自治区');
INSERT INTO `jgb` VALUES (540232, 540000, '仲巴县', '西藏自治区');
INSERT INTO `jgb` VALUES (540233, 540000, '亚东县', '西藏自治区');
INSERT INTO `jgb` VALUES (540234, 540000, '吉隆县', '西藏自治区');
INSERT INTO `jgb` VALUES (540235, 540000, '聂拉木县', '西藏自治区');
INSERT INTO `jgb` VALUES (540236, 540000, '萨嘎县', '西藏自治区');
INSERT INTO `jgb` VALUES (540237, 540000, '岗巴县', '西藏自治区');
INSERT INTO `jgb` VALUES (540300, 540000, '昌都市', '西藏自治区');
INSERT INTO `jgb` VALUES (540302, 540000, '卡若区', '西藏自治区');
INSERT INTO `jgb` VALUES (540321, 540000, '江达县', '西藏自治区');
INSERT INTO `jgb` VALUES (540322, 540000, '贡觉县', '西藏自治区');
INSERT INTO `jgb` VALUES (540323, 540000, '类乌齐县', '西藏自治区');
INSERT INTO `jgb` VALUES (540324, 540000, '丁青县', '西藏自治区');
INSERT INTO `jgb` VALUES (540325, 540000, '察雅县', '西藏自治区');
INSERT INTO `jgb` VALUES (540326, 540000, '八宿县', '西藏自治区');
INSERT INTO `jgb` VALUES (540327, 540000, '左贡县', '西藏自治区');
INSERT INTO `jgb` VALUES (540328, 540000, '芒康县', '西藏自治区');
INSERT INTO `jgb` VALUES (540329, 540000, '洛隆县', '西藏自治区');
INSERT INTO `jgb` VALUES (540330, 540000, '边坝县', '西藏自治区');
INSERT INTO `jgb` VALUES (540400, 540000, '林芝市', '西藏自治区');
INSERT INTO `jgb` VALUES (540402, 540000, '巴宜区', '西藏自治区');
INSERT INTO `jgb` VALUES (540421, 540000, '工布江达县', '西藏自治区');
INSERT INTO `jgb` VALUES (540422, 540000, '米林县', '西藏自治区');
INSERT INTO `jgb` VALUES (540423, 540000, '墨脱县', '西藏自治区');
INSERT INTO `jgb` VALUES (540424, 540000, '波密县', '西藏自治区');
INSERT INTO `jgb` VALUES (540425, 540000, '察隅县', '西藏自治区');
INSERT INTO `jgb` VALUES (540426, 540000, '朗县', '西藏自治区');
INSERT INTO `jgb` VALUES (540500, 540000, '山南市', '西藏自治区');
INSERT INTO `jgb` VALUES (540502, 540000, '乃东区', '西藏自治区');
INSERT INTO `jgb` VALUES (540521, 540000, '扎囊县', '西藏自治区');
INSERT INTO `jgb` VALUES (540522, 540000, '贡嘎县', '西藏自治区');
INSERT INTO `jgb` VALUES (540523, 540000, '桑日县', '西藏自治区');
INSERT INTO `jgb` VALUES (540524, 540000, '琼结县', '西藏自治区');
INSERT INTO `jgb` VALUES (540525, 540000, '曲松县', '西藏自治区');
INSERT INTO `jgb` VALUES (540526, 540000, '措美县', '西藏自治区');
INSERT INTO `jgb` VALUES (540527, 540000, '洛扎县', '西藏自治区');
INSERT INTO `jgb` VALUES (540528, 540000, '加查县', '西藏自治区');
INSERT INTO `jgb` VALUES (540529, 540000, '隆子县', '西藏自治区');
INSERT INTO `jgb` VALUES (540530, 540000, '错那县', '西藏自治区');
INSERT INTO `jgb` VALUES (540531, 540000, '浪卡子县', '西藏自治区');
INSERT INTO `jgb` VALUES (540600, 540000, '那曲市', '西藏自治区');
INSERT INTO `jgb` VALUES (540602, 540000, '色尼区', '西藏自治区');
INSERT INTO `jgb` VALUES (540621, 540000, '嘉黎县 ', '西藏自治区');
INSERT INTO `jgb` VALUES (540622, 540000, '比如县 ', '西藏自治区');
INSERT INTO `jgb` VALUES (540623, 540000, '聂荣县 ', '西藏自治区');
INSERT INTO `jgb` VALUES (540624, 540000, '安多县 ', '西藏自治区');
INSERT INTO `jgb` VALUES (540625, 540000, '申扎县 ', '西藏自治区');
INSERT INTO `jgb` VALUES (540626, 540000, '索县   ', '西藏自治区');
INSERT INTO `jgb` VALUES (540627, 540000, '班戈县 ', '西藏自治区');
INSERT INTO `jgb` VALUES (540628, 540000, '巴青县 ', '西藏自治区');
INSERT INTO `jgb` VALUES (540629, 540000, '尼玛县 ', '西藏自治区');
INSERT INTO `jgb` VALUES (540630, 540000, '双湖县 ', '西藏自治区');
INSERT INTO `jgb` VALUES (542500, 540000, '阿里地区', '西藏自治区');
INSERT INTO `jgb` VALUES (542521, 540000, '普兰县', '西藏自治区');
INSERT INTO `jgb` VALUES (542522, 540000, '札达县', '西藏自治区');
INSERT INTO `jgb` VALUES (542523, 540000, '噶尔县', '西藏自治区');
INSERT INTO `jgb` VALUES (542524, 540000, '日土县', '西藏自治区');
INSERT INTO `jgb` VALUES (542525, 540000, '革吉县', '西藏自治区');
INSERT INTO `jgb` VALUES (542526, 540000, '改则县', '西藏自治区');
INSERT INTO `jgb` VALUES (542527, 540000, '措勤县', '西藏自治区');
INSERT INTO `jgb` VALUES (610000, 610000, '陕西省', '陕西省');
INSERT INTO `jgb` VALUES (610100, 610000, '西安市', '陕西省');
INSERT INTO `jgb` VALUES (610102, 610000, '新城区', '陕西省');
INSERT INTO `jgb` VALUES (610103, 610000, '碑林区', '陕西省');
INSERT INTO `jgb` VALUES (610104, 610000, '莲湖区', '陕西省');
INSERT INTO `jgb` VALUES (610111, 610000, '灞桥区', '陕西省');
INSERT INTO `jgb` VALUES (610112, 610000, '未央区', '陕西省');
INSERT INTO `jgb` VALUES (610113, 610000, '雁塔区', '陕西省');
INSERT INTO `jgb` VALUES (610114, 610000, '阎良区', '陕西省');
INSERT INTO `jgb` VALUES (610115, 610000, '临潼区', '陕西省');
INSERT INTO `jgb` VALUES (610116, 610000, '长安区', '陕西省');
INSERT INTO `jgb` VALUES (610117, 610000, '高陵区', '陕西省');
INSERT INTO `jgb` VALUES (610118, 610000, '鄠邑区', '陕西省');
INSERT INTO `jgb` VALUES (610122, 610000, '蓝田县', '陕西省');
INSERT INTO `jgb` VALUES (610124, 610000, '周至县', '陕西省');
INSERT INTO `jgb` VALUES (610200, 610000, '铜川市', '陕西省');
INSERT INTO `jgb` VALUES (610202, 610000, '王益区', '陕西省');
INSERT INTO `jgb` VALUES (610203, 610000, '印台区', '陕西省');
INSERT INTO `jgb` VALUES (610204, 610000, '耀州区', '陕西省');
INSERT INTO `jgb` VALUES (610222, 610000, '宜君县', '陕西省');
INSERT INTO `jgb` VALUES (610300, 610000, '宝鸡市', '陕西省');
INSERT INTO `jgb` VALUES (610302, 610000, '渭滨区', '陕西省');
INSERT INTO `jgb` VALUES (610303, 610000, '金台区', '陕西省');
INSERT INTO `jgb` VALUES (610304, 610000, '陈仓区', '陕西省');
INSERT INTO `jgb` VALUES (610322, 610000, '凤翔县', '陕西省');
INSERT INTO `jgb` VALUES (610323, 610000, '岐山县', '陕西省');
INSERT INTO `jgb` VALUES (610324, 610000, '扶风县', '陕西省');
INSERT INTO `jgb` VALUES (610326, 610000, '眉县', '陕西省');
INSERT INTO `jgb` VALUES (610327, 610000, '陇县', '陕西省');
INSERT INTO `jgb` VALUES (610328, 610000, '千阳县', '陕西省');
INSERT INTO `jgb` VALUES (610329, 610000, '麟游县', '陕西省');
INSERT INTO `jgb` VALUES (610330, 610000, '凤县', '陕西省');
INSERT INTO `jgb` VALUES (610331, 610000, '太白县', '陕西省');
INSERT INTO `jgb` VALUES (610400, 610000, '咸阳市', '陕西省');
INSERT INTO `jgb` VALUES (610402, 610000, '秦都区', '陕西省');
INSERT INTO `jgb` VALUES (610403, 610000, '杨陵区', '陕西省');
INSERT INTO `jgb` VALUES (610404, 610000, '渭城区', '陕西省');
INSERT INTO `jgb` VALUES (610422, 610000, '三原县', '陕西省');
INSERT INTO `jgb` VALUES (610423, 610000, '泾阳县', '陕西省');
INSERT INTO `jgb` VALUES (610424, 610000, '乾县', '陕西省');
INSERT INTO `jgb` VALUES (610425, 610000, '礼泉县', '陕西省');
INSERT INTO `jgb` VALUES (610426, 610000, '永寿县', '陕西省');
INSERT INTO `jgb` VALUES (610427, 610000, '彬县', '陕西省');
INSERT INTO `jgb` VALUES (610428, 610000, '长武县', '陕西省');
INSERT INTO `jgb` VALUES (610429, 610000, '旬邑县', '陕西省');
INSERT INTO `jgb` VALUES (610430, 610000, '淳化县', '陕西省');
INSERT INTO `jgb` VALUES (610431, 610000, '武功县', '陕西省');
INSERT INTO `jgb` VALUES (610481, 610000, '兴平市', '陕西省');
INSERT INTO `jgb` VALUES (610500, 610000, '渭南市', '陕西省');
INSERT INTO `jgb` VALUES (610502, 610000, '临渭区', '陕西省');
INSERT INTO `jgb` VALUES (610503, 610000, '华州区', '陕西省');
INSERT INTO `jgb` VALUES (610522, 610000, '潼关县', '陕西省');
INSERT INTO `jgb` VALUES (610523, 610000, '大荔县', '陕西省');
INSERT INTO `jgb` VALUES (610524, 610000, '合阳县', '陕西省');
INSERT INTO `jgb` VALUES (610525, 610000, '澄城县', '陕西省');
INSERT INTO `jgb` VALUES (610526, 610000, '蒲城县', '陕西省');
INSERT INTO `jgb` VALUES (610527, 610000, '白水县', '陕西省');
INSERT INTO `jgb` VALUES (610528, 610000, '富平县', '陕西省');
INSERT INTO `jgb` VALUES (610581, 610000, '韩城市', '陕西省');
INSERT INTO `jgb` VALUES (610582, 610000, '华阴市', '陕西省');
INSERT INTO `jgb` VALUES (610600, 610000, '延安市', '陕西省');
INSERT INTO `jgb` VALUES (610602, 610000, '宝塔区', '陕西省');
INSERT INTO `jgb` VALUES (610603, 610000, '安塞区', '陕西省');
INSERT INTO `jgb` VALUES (610621, 610000, '延长县', '陕西省');
INSERT INTO `jgb` VALUES (610622, 610000, '延川县', '陕西省');
INSERT INTO `jgb` VALUES (610623, 610000, '子长县', '陕西省');
INSERT INTO `jgb` VALUES (610625, 610000, '志丹县', '陕西省');
INSERT INTO `jgb` VALUES (610626, 610000, '吴起县', '陕西省');
INSERT INTO `jgb` VALUES (610627, 610000, '甘泉县', '陕西省');
INSERT INTO `jgb` VALUES (610628, 610000, '富县', '陕西省');
INSERT INTO `jgb` VALUES (610629, 610000, '洛川县', '陕西省');
INSERT INTO `jgb` VALUES (610630, 610000, '宜川县', '陕西省');
INSERT INTO `jgb` VALUES (610631, 610000, '黄龙县', '陕西省');
INSERT INTO `jgb` VALUES (610632, 610000, '黄陵县', '陕西省');
INSERT INTO `jgb` VALUES (610700, 610000, '汉中市', '陕西省');
INSERT INTO `jgb` VALUES (610702, 610000, '汉台区', '陕西省');
INSERT INTO `jgb` VALUES (610703, 610000, '南郑区', '陕西省');
INSERT INTO `jgb` VALUES (610722, 610000, '城固县', '陕西省');
INSERT INTO `jgb` VALUES (610723, 610000, '洋县', '陕西省');
INSERT INTO `jgb` VALUES (610724, 610000, '西乡县', '陕西省');
INSERT INTO `jgb` VALUES (610725, 610000, '勉县', '陕西省');
INSERT INTO `jgb` VALUES (610726, 610000, '宁强县', '陕西省');
INSERT INTO `jgb` VALUES (610727, 610000, '略阳县', '陕西省');
INSERT INTO `jgb` VALUES (610728, 610000, '镇巴县', '陕西省');
INSERT INTO `jgb` VALUES (610729, 610000, '留坝县', '陕西省');
INSERT INTO `jgb` VALUES (610730, 610000, '佛坪县', '陕西省');
INSERT INTO `jgb` VALUES (610800, 610000, '榆林市', '陕西省');
INSERT INTO `jgb` VALUES (610802, 610000, '榆阳区', '陕西省');
INSERT INTO `jgb` VALUES (610803, 610000, '横山区', '陕西省');
INSERT INTO `jgb` VALUES (610822, 610000, '府谷县', '陕西省');
INSERT INTO `jgb` VALUES (610824, 610000, '靖边县', '陕西省');
INSERT INTO `jgb` VALUES (610825, 610000, '定边县', '陕西省');
INSERT INTO `jgb` VALUES (610826, 610000, '绥德县', '陕西省');
INSERT INTO `jgb` VALUES (610827, 610000, '米脂县', '陕西省');
INSERT INTO `jgb` VALUES (610828, 610000, '佳县', '陕西省');
INSERT INTO `jgb` VALUES (610829, 610000, '吴堡县', '陕西省');
INSERT INTO `jgb` VALUES (610830, 610000, '清涧县', '陕西省');
INSERT INTO `jgb` VALUES (610831, 610000, '子洲县', '陕西省');
INSERT INTO `jgb` VALUES (610881, 610000, '神木市', '陕西省');
INSERT INTO `jgb` VALUES (610900, 610000, '安康市', '陕西省');
INSERT INTO `jgb` VALUES (610902, 610000, '汉滨区', '陕西省');
INSERT INTO `jgb` VALUES (610921, 610000, '汉阴县', '陕西省');
INSERT INTO `jgb` VALUES (610922, 610000, '石泉县', '陕西省');
INSERT INTO `jgb` VALUES (610923, 610000, '宁陕县', '陕西省');
INSERT INTO `jgb` VALUES (610924, 610000, '紫阳县', '陕西省');
INSERT INTO `jgb` VALUES (610925, 610000, '岚皋县', '陕西省');
INSERT INTO `jgb` VALUES (610926, 610000, '平利县', '陕西省');
INSERT INTO `jgb` VALUES (610927, 610000, '镇坪县', '陕西省');
INSERT INTO `jgb` VALUES (610928, 610000, '旬阳县', '陕西省');
INSERT INTO `jgb` VALUES (610929, 610000, '白河县', '陕西省');
INSERT INTO `jgb` VALUES (611000, 610000, '商洛市', '陕西省');
INSERT INTO `jgb` VALUES (611002, 610000, '商州区', '陕西省');
INSERT INTO `jgb` VALUES (611021, 610000, '洛南县', '陕西省');
INSERT INTO `jgb` VALUES (611022, 610000, '丹凤县', '陕西省');
INSERT INTO `jgb` VALUES (611023, 610000, '商南县', '陕西省');
INSERT INTO `jgb` VALUES (611024, 610000, '山阳县', '陕西省');
INSERT INTO `jgb` VALUES (611025, 610000, '镇安县', '陕西省');
INSERT INTO `jgb` VALUES (611026, 610000, '柞水县', '陕西省');
INSERT INTO `jgb` VALUES (620000, 620000, '甘肃省', '甘肃省');
INSERT INTO `jgb` VALUES (620100, 620000, '兰州市', '甘肃省');
INSERT INTO `jgb` VALUES (620102, 620000, '城关区', '甘肃省');
INSERT INTO `jgb` VALUES (620103, 620000, '七里河区', '甘肃省');
INSERT INTO `jgb` VALUES (620104, 620000, '西固区', '甘肃省');
INSERT INTO `jgb` VALUES (620105, 620000, '安宁区', '甘肃省');
INSERT INTO `jgb` VALUES (620111, 620000, '红古区', '甘肃省');
INSERT INTO `jgb` VALUES (620121, 620000, '永登县', '甘肃省');
INSERT INTO `jgb` VALUES (620122, 620000, '皋兰县', '甘肃省');
INSERT INTO `jgb` VALUES (620123, 620000, '榆中县', '甘肃省');
INSERT INTO `jgb` VALUES (620200, 620000, '嘉峪关市', '甘肃省');
INSERT INTO `jgb` VALUES (620300, 620000, '金昌市', '甘肃省');
INSERT INTO `jgb` VALUES (620302, 620000, '金川区', '甘肃省');
INSERT INTO `jgb` VALUES (620321, 620000, '永昌县', '甘肃省');
INSERT INTO `jgb` VALUES (620400, 620000, '白银市', '甘肃省');
INSERT INTO `jgb` VALUES (620402, 620000, '白银区', '甘肃省');
INSERT INTO `jgb` VALUES (620403, 620000, '平川区', '甘肃省');
INSERT INTO `jgb` VALUES (620421, 620000, '靖远县', '甘肃省');
INSERT INTO `jgb` VALUES (620422, 620000, '会宁县', '甘肃省');
INSERT INTO `jgb` VALUES (620423, 620000, '景泰县', '甘肃省');
INSERT INTO `jgb` VALUES (620500, 620000, '天水市', '甘肃省');
INSERT INTO `jgb` VALUES (620502, 620000, '秦州区', '甘肃省');
INSERT INTO `jgb` VALUES (620503, 620000, '麦积区', '甘肃省');
INSERT INTO `jgb` VALUES (620521, 620000, '清水县', '甘肃省');
INSERT INTO `jgb` VALUES (620522, 620000, '秦安县', '甘肃省');
INSERT INTO `jgb` VALUES (620523, 620000, '甘谷县', '甘肃省');
INSERT INTO `jgb` VALUES (620524, 620000, '武山县', '甘肃省');
INSERT INTO `jgb` VALUES (620525, 620000, '张家川回族自治县', '甘肃省');
INSERT INTO `jgb` VALUES (620600, 620000, '武威市', '甘肃省');
INSERT INTO `jgb` VALUES (620602, 620000, '凉州区', '甘肃省');
INSERT INTO `jgb` VALUES (620621, 620000, '民勤县', '甘肃省');
INSERT INTO `jgb` VALUES (620622, 620000, '古浪县', '甘肃省');
INSERT INTO `jgb` VALUES (620623, 620000, '天祝藏族自治县', '甘肃省');
INSERT INTO `jgb` VALUES (620700, 620000, '张掖市', '甘肃省');
INSERT INTO `jgb` VALUES (620702, 620000, '甘州区', '甘肃省');
INSERT INTO `jgb` VALUES (620721, 620000, '肃南裕固族自治县', '甘肃省');
INSERT INTO `jgb` VALUES (620722, 620000, '民乐县', '甘肃省');
INSERT INTO `jgb` VALUES (620723, 620000, '临泽县', '甘肃省');
INSERT INTO `jgb` VALUES (620724, 620000, '高台县', '甘肃省');
INSERT INTO `jgb` VALUES (620725, 620000, '山丹县', '甘肃省');
INSERT INTO `jgb` VALUES (620800, 620000, '平凉市', '甘肃省');
INSERT INTO `jgb` VALUES (620802, 620000, '崆峒区', '甘肃省');
INSERT INTO `jgb` VALUES (620821, 620000, '泾川县', '甘肃省');
INSERT INTO `jgb` VALUES (620822, 620000, '灵台县', '甘肃省');
INSERT INTO `jgb` VALUES (620823, 620000, '崇信县', '甘肃省');
INSERT INTO `jgb` VALUES (620824, 620000, '华亭县', '甘肃省');
INSERT INTO `jgb` VALUES (620825, 620000, '庄浪县', '甘肃省');
INSERT INTO `jgb` VALUES (620826, 620000, '静宁县', '甘肃省');
INSERT INTO `jgb` VALUES (620900, 620000, '酒泉市', '甘肃省');
INSERT INTO `jgb` VALUES (620902, 620000, '肃州区', '甘肃省');
INSERT INTO `jgb` VALUES (620921, 620000, '金塔县', '甘肃省');
INSERT INTO `jgb` VALUES (620922, 620000, '瓜州县', '甘肃省');
INSERT INTO `jgb` VALUES (620923, 620000, '肃北蒙古族自治县', '甘肃省');
INSERT INTO `jgb` VALUES (620924, 620000, '阿克塞哈萨克族自治县', '甘肃省');
INSERT INTO `jgb` VALUES (620981, 620000, '玉门市', '甘肃省');
INSERT INTO `jgb` VALUES (620982, 620000, '敦煌市', '甘肃省');
INSERT INTO `jgb` VALUES (621000, 620000, '庆阳市', '甘肃省');
INSERT INTO `jgb` VALUES (621002, 620000, '西峰区', '甘肃省');
INSERT INTO `jgb` VALUES (621021, 620000, '庆城县', '甘肃省');
INSERT INTO `jgb` VALUES (621022, 620000, '环县', '甘肃省');
INSERT INTO `jgb` VALUES (621023, 620000, '华池县', '甘肃省');
INSERT INTO `jgb` VALUES (621024, 620000, '合水县', '甘肃省');
INSERT INTO `jgb` VALUES (621025, 620000, '正宁县', '甘肃省');
INSERT INTO `jgb` VALUES (621026, 620000, '宁县', '甘肃省');
INSERT INTO `jgb` VALUES (621027, 620000, '镇原县', '甘肃省');
INSERT INTO `jgb` VALUES (621100, 620000, '定西市', '甘肃省');
INSERT INTO `jgb` VALUES (621102, 620000, '安定区', '甘肃省');
INSERT INTO `jgb` VALUES (621121, 620000, '通渭县', '甘肃省');
INSERT INTO `jgb` VALUES (621122, 620000, '陇西县', '甘肃省');
INSERT INTO `jgb` VALUES (621123, 620000, '渭源县', '甘肃省');
INSERT INTO `jgb` VALUES (621124, 620000, '临洮县', '甘肃省');
INSERT INTO `jgb` VALUES (621125, 620000, '漳县', '甘肃省');
INSERT INTO `jgb` VALUES (621126, 620000, '岷县', '甘肃省');
INSERT INTO `jgb` VALUES (621200, 620000, '陇南市', '甘肃省');
INSERT INTO `jgb` VALUES (621202, 620000, '武都区', '甘肃省');
INSERT INTO `jgb` VALUES (621221, 620000, '成县', '甘肃省');
INSERT INTO `jgb` VALUES (621222, 620000, '文县', '甘肃省');
INSERT INTO `jgb` VALUES (621223, 620000, '宕昌县', '甘肃省');
INSERT INTO `jgb` VALUES (621224, 620000, '康县', '甘肃省');
INSERT INTO `jgb` VALUES (621225, 620000, '西和县', '甘肃省');
INSERT INTO `jgb` VALUES (621226, 620000, '礼县', '甘肃省');
INSERT INTO `jgb` VALUES (621227, 620000, '徽县', '甘肃省');
INSERT INTO `jgb` VALUES (621228, 620000, '两当县', '甘肃省');
INSERT INTO `jgb` VALUES (622900, 620000, '临夏回族自治州', '甘肃省');
INSERT INTO `jgb` VALUES (622901, 620000, '临夏市', '甘肃省');
INSERT INTO `jgb` VALUES (622921, 620000, '临夏县', '甘肃省');
INSERT INTO `jgb` VALUES (622922, 620000, '康乐县', '甘肃省');
INSERT INTO `jgb` VALUES (622923, 620000, '永靖县', '甘肃省');
INSERT INTO `jgb` VALUES (622924, 620000, '广河县', '甘肃省');
INSERT INTO `jgb` VALUES (622925, 620000, '和政县', '甘肃省');
INSERT INTO `jgb` VALUES (622926, 620000, '东乡族自治县', '甘肃省');
INSERT INTO `jgb` VALUES (622927, 620000, '积石山保安族东乡族撒拉族自治县', '甘肃省');
INSERT INTO `jgb` VALUES (623000, 620000, '甘南藏族自治州', '甘肃省');
INSERT INTO `jgb` VALUES (623001, 620000, '合作市', '甘肃省');
INSERT INTO `jgb` VALUES (623021, 620000, '临潭县', '甘肃省');
INSERT INTO `jgb` VALUES (623022, 620000, '卓尼县', '甘肃省');
INSERT INTO `jgb` VALUES (623023, 620000, '舟曲县', '甘肃省');
INSERT INTO `jgb` VALUES (623024, 620000, '迭部县', '甘肃省');
INSERT INTO `jgb` VALUES (623025, 620000, '玛曲县', '甘肃省');
INSERT INTO `jgb` VALUES (623026, 620000, '碌曲县', '甘肃省');
INSERT INTO `jgb` VALUES (623027, 620000, '夏河县', '甘肃省');
INSERT INTO `jgb` VALUES (630000, 630000, '青海省', '青海省');
INSERT INTO `jgb` VALUES (630100, 630000, '西宁市', '青海省');
INSERT INTO `jgb` VALUES (630102, 630000, '城东区', '青海省');
INSERT INTO `jgb` VALUES (630103, 630000, '城中区', '青海省');
INSERT INTO `jgb` VALUES (630104, 630000, '城西区', '青海省');
INSERT INTO `jgb` VALUES (630105, 630000, '城北区', '青海省');
INSERT INTO `jgb` VALUES (630121, 630000, '大通回族土族自治县', '青海省');
INSERT INTO `jgb` VALUES (630122, 630000, '湟中县', '青海省');
INSERT INTO `jgb` VALUES (630123, 630000, '湟源县', '青海省');
INSERT INTO `jgb` VALUES (630200, 630000, '海东市', '青海省');
INSERT INTO `jgb` VALUES (630202, 630000, '乐都区', '青海省');
INSERT INTO `jgb` VALUES (630203, 630000, '平安区', '青海省');
INSERT INTO `jgb` VALUES (630222, 630000, '民和回族土族自治县', '青海省');
INSERT INTO `jgb` VALUES (630223, 630000, '互助土族自治县', '青海省');
INSERT INTO `jgb` VALUES (630224, 630000, '化隆回族自治县', '青海省');
INSERT INTO `jgb` VALUES (630225, 630000, '循化撒拉族自治县', '青海省');
INSERT INTO `jgb` VALUES (632200, 630000, '海北藏族自治州', '青海省');
INSERT INTO `jgb` VALUES (632221, 630000, '门源回族自治县', '青海省');
INSERT INTO `jgb` VALUES (632222, 630000, '祁连县', '青海省');
INSERT INTO `jgb` VALUES (632223, 630000, '海晏县', '青海省');
INSERT INTO `jgb` VALUES (632224, 630000, '刚察县', '青海省');
INSERT INTO `jgb` VALUES (632300, 630000, '黄南藏族自治州', '青海省');
INSERT INTO `jgb` VALUES (632321, 630000, '同仁县', '青海省');
INSERT INTO `jgb` VALUES (632322, 630000, '尖扎县', '青海省');
INSERT INTO `jgb` VALUES (632323, 630000, '泽库县', '青海省');
INSERT INTO `jgb` VALUES (632324, 630000, '河南蒙古族自治县', '青海省');
INSERT INTO `jgb` VALUES (632500, 630000, '海南藏族自治州', '青海省');
INSERT INTO `jgb` VALUES (632521, 630000, '共和县', '青海省');
INSERT INTO `jgb` VALUES (632522, 630000, '同德县', '青海省');
INSERT INTO `jgb` VALUES (632523, 630000, '贵德县', '青海省');
INSERT INTO `jgb` VALUES (632524, 630000, '兴海县', '青海省');
INSERT INTO `jgb` VALUES (632525, 630000, '贵南县', '青海省');
INSERT INTO `jgb` VALUES (632600, 630000, '果洛藏族自治州', '青海省');
INSERT INTO `jgb` VALUES (632621, 630000, '玛沁县', '青海省');
INSERT INTO `jgb` VALUES (632622, 630000, '班玛县', '青海省');
INSERT INTO `jgb` VALUES (632623, 630000, '甘德县', '青海省');
INSERT INTO `jgb` VALUES (632624, 630000, '达日县', '青海省');
INSERT INTO `jgb` VALUES (632625, 630000, '久治县', '青海省');
INSERT INTO `jgb` VALUES (632626, 630000, '玛多县', '青海省');
INSERT INTO `jgb` VALUES (632700, 630000, '玉树藏族自治州', '青海省');
INSERT INTO `jgb` VALUES (632701, 630000, '玉树市', '青海省');
INSERT INTO `jgb` VALUES (632722, 630000, '杂多县', '青海省');
INSERT INTO `jgb` VALUES (632723, 630000, '称多县', '青海省');
INSERT INTO `jgb` VALUES (632724, 630000, '治多县', '青海省');
INSERT INTO `jgb` VALUES (632725, 630000, '囊谦县', '青海省');
INSERT INTO `jgb` VALUES (632726, 630000, '曲麻莱县', '青海省');
INSERT INTO `jgb` VALUES (632800, 630000, '海西蒙古族藏族自治州', '青海省');
INSERT INTO `jgb` VALUES (632801, 630000, '格尔木市', '青海省');
INSERT INTO `jgb` VALUES (632802, 630000, '德令哈市', '青海省');
INSERT INTO `jgb` VALUES (632821, 630000, '乌兰县', '青海省');
INSERT INTO `jgb` VALUES (632822, 630000, '都兰县', '青海省');
INSERT INTO `jgb` VALUES (632823, 630000, '天峻县', '青海省');
INSERT INTO `jgb` VALUES (640000, 640000, '宁夏回族自治区', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640100, 640000, '银川市', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640104, 640000, '兴庆区', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640105, 640000, '西夏区', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640106, 640000, '金凤区', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640121, 640000, '永宁县', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640122, 640000, '贺兰县', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640181, 640000, '灵武市', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640200, 640000, '石嘴山市', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640202, 640000, '大武口区', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640205, 640000, '惠农区', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640221, 640000, '平罗县', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640300, 640000, '吴忠市', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640302, 640000, '利通区', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640303, 640000, '红寺堡区', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640323, 640000, '盐池县', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640324, 640000, '同心县', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640381, 640000, '青铜峡市', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640400, 640000, '固原市', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640402, 640000, '原州区', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640422, 640000, '西吉县', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640423, 640000, '隆德县', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640424, 640000, '泾源县', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640425, 640000, '彭阳县', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640500, 640000, '中卫市', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640502, 640000, '沙坡头区', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640521, 640000, '中宁县', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (640522, 640000, '海原县', '宁夏回族自治区');
INSERT INTO `jgb` VALUES (650000, 650000, '新疆维吾尔自治区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650100, 650000, '乌鲁木齐市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650102, 650000, '天山区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650103, 650000, '沙依巴克区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650104, 650000, '新市区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650105, 650000, '水磨沟区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650106, 650000, '头屯河区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650107, 650000, '达坂城区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650109, 650000, '米东区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650121, 650000, '乌鲁木齐县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650200, 650000, '克拉玛依市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650202, 650000, '独山子区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650203, 650000, '克拉玛依区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650204, 650000, '白碱滩区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650205, 650000, '乌尔禾区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650400, 650000, '吐鲁番市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650402, 650000, '高昌区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650421, 650000, '鄯善县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650422, 650000, '托克逊县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650500, 650000, '哈密市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650502, 650000, '伊州区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650521, 650000, '巴里坤哈萨克自治县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (650522, 650000, '伊吾县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652300, 650000, '昌吉回族自治州', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652301, 650000, '昌吉市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652302, 650000, '阜康市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652323, 650000, '呼图壁县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652324, 650000, '玛纳斯县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652325, 650000, '奇台县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652327, 650000, '吉木萨尔县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652328, 650000, '木垒哈萨克自治县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652700, 650000, '博尔塔拉蒙古自治州', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652701, 650000, '博乐市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652702, 650000, '阿拉山口市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652722, 650000, '精河县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652723, 650000, '温泉县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652800, 650000, '巴音郭楞蒙古自治州', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652801, 650000, '库尔勒市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652822, 650000, '轮台县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652823, 650000, '尉犁县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652824, 650000, '若羌县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652825, 650000, '且末县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652826, 650000, '焉耆回族自治县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652827, 650000, '和静县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652828, 650000, '和硕县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652829, 650000, '博湖县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652900, 650000, '阿克苏地区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652901, 650000, '阿克苏市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652922, 650000, '温宿县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652923, 650000, '库车县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652924, 650000, '沙雅县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652925, 650000, '新和县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652926, 650000, '拜城县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652927, 650000, '乌什县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652928, 650000, '阿瓦提县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (652929, 650000, '柯坪县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653000, 650000, '克孜勒苏柯尔克孜自治州', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653001, 650000, '阿图什市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653022, 650000, '阿克陶县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653023, 650000, '阿合奇县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653024, 650000, '乌恰县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653100, 650000, '喀什地区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653101, 650000, '喀什市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653121, 650000, '疏附县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653122, 650000, '疏勒县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653123, 650000, '英吉沙县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653124, 650000, '泽普县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653125, 650000, '莎车县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653126, 650000, '叶城县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653127, 650000, '麦盖提县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653128, 650000, '岳普湖县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653129, 650000, '伽师县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653130, 650000, '巴楚县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653131, 650000, '塔什库尔干塔吉克自治县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653200, 650000, '和田地区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653201, 650000, '和田市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653221, 650000, '和田县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653222, 650000, '墨玉县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653223, 650000, '皮山县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653224, 650000, '洛浦县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653225, 650000, '策勒县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653226, 650000, '于田县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (653227, 650000, '民丰县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654000, 650000, '伊犁哈萨克自治州', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654002, 650000, '伊宁市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654003, 650000, '奎屯市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654004, 650000, '霍尔果斯市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654021, 650000, '伊宁县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654022, 650000, '察布查尔锡伯自治县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654023, 650000, '霍城县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654024, 650000, '巩留县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654025, 650000, '新源县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654026, 650000, '昭苏县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654027, 650000, '特克斯县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654028, 650000, '尼勒克县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654200, 650000, '塔城地区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654201, 650000, '塔城市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654202, 650000, '乌苏市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654221, 650000, '额敏县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654223, 650000, '沙湾县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654224, 650000, '托里县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654225, 650000, '裕民县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654226, 650000, '和布克赛尔蒙古自治县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654300, 650000, '阿勒泰地区', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654301, 650000, '阿勒泰市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654321, 650000, '布尔津县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654322, 650000, '富蕴县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654323, 650000, '福海县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654324, 650000, '哈巴河县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654325, 650000, '青河县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (654326, 650000, '吉木乃县', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (659001, 650000, '石河子市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (659002, 650000, '阿拉尔市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (659003, 650000, '图木舒克市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (659004, 650000, '五家渠市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (659005, 650000, '北屯市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (659006, 650000, '铁门关市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (659007, 650000, '双河市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (659008, 650000, '可克达拉市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (659009, 650000, '昆玉市', '新疆维吾尔自治区');
INSERT INTO `jgb` VALUES (710000, 710000, '台湾省', '台湾省');
INSERT INTO `jgb` VALUES (810000, 810000, '香港特别行政区', '香港特别行政区');
INSERT INTO `jgb` VALUES (820000, 820000, '澳门特别行政区', '澳门特别行政区');
COMMIT;

-- ----------------------------
-- Table structure for js_mk
-- ----------------------------
DROP TABLE IF EXISTS `js_mk`;
CREATE TABLE `js_mk` (
  `js_id` int(11) NOT NULL COMMENT '角色id',
  `mk_id` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`js_id`,`mk_id`),
  KEY `js_id` (`js_id`),
  KEY `mk_id` (`mk_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of js_mk
-- ----------------------------
BEGIN;
INSERT INTO `js_mk` VALUES (36, 10006);
INSERT INTO `js_mk` VALUES (36, 10007);
INSERT INTO `js_mk` VALUES (36, 10010);
INSERT INTO `js_mk` VALUES (36, 10011);
INSERT INTO `js_mk` VALUES (36, 10012);
INSERT INTO `js_mk` VALUES (36, 10014);
INSERT INTO `js_mk` VALUES (36, 10030);
INSERT INTO `js_mk` VALUES (36, 10031);
INSERT INTO `js_mk` VALUES (36, 10032);
INSERT INTO `js_mk` VALUES (36, 20020);
INSERT INTO `js_mk` VALUES (36, 20021);
INSERT INTO `js_mk` VALUES (36, 20022);
INSERT INTO `js_mk` VALUES (36, 20023);
INSERT INTO `js_mk` VALUES (36, 20039);
INSERT INTO `js_mk` VALUES (36, 20040);
INSERT INTO `js_mk` VALUES (36, 20049);
INSERT INTO `js_mk` VALUES (36, 20050);
INSERT INTO `js_mk` VALUES (36, 20051);
INSERT INTO `js_mk` VALUES (36, 20110);
INSERT INTO `js_mk` VALUES (36, 20111);
INSERT INTO `js_mk` VALUES (36, 20112);
INSERT INTO `js_mk` VALUES (36, 20120);
INSERT INTO `js_mk` VALUES (36, 20121);
INSERT INTO `js_mk` VALUES (36, 20122);
INSERT INTO `js_mk` VALUES (36, 20140);
INSERT INTO `js_mk` VALUES (36, 20141);
INSERT INTO `js_mk` VALUES (36, 20211);
INSERT INTO `js_mk` VALUES (36, 20212);
INSERT INTO `js_mk` VALUES (36, 20213);
INSERT INTO `js_mk` VALUES (36, 20214);
INSERT INTO `js_mk` VALUES (36, 20215);
INSERT INTO `js_mk` VALUES (36, 20311);
INSERT INTO `js_mk` VALUES (36, 20312);
INSERT INTO `js_mk` VALUES (36, 20313);
INSERT INTO `js_mk` VALUES (36, 20411);
INSERT INTO `js_mk` VALUES (36, 20412);
INSERT INTO `js_mk` VALUES (36, 20418);
INSERT INTO `js_mk` VALUES (36, 20422);
INSERT INTO `js_mk` VALUES (36, 20423);
INSERT INTO `js_mk` VALUES (36, 20501);
INSERT INTO `js_mk` VALUES (36, 20511);
INSERT INTO `js_mk` VALUES (36, 20512);
INSERT INTO `js_mk` VALUES (36, 20513);
INSERT INTO `js_mk` VALUES (36, 20514);
INSERT INTO `js_mk` VALUES (36, 20515);
INSERT INTO `js_mk` VALUES (36, 20516);
INSERT INTO `js_mk` VALUES (36, 20517);
INSERT INTO `js_mk` VALUES (36, 20518);
INSERT INTO `js_mk` VALUES (36, 20519);
INSERT INTO `js_mk` VALUES (36, 20520);
INSERT INTO `js_mk` VALUES (36, 20521);
INSERT INTO `js_mk` VALUES (36, 20522);
INSERT INTO `js_mk` VALUES (36, 20523);
INSERT INTO `js_mk` VALUES (36, 20524);
INSERT INTO `js_mk` VALUES (36, 20525);
INSERT INTO `js_mk` VALUES (36, 20526);
INSERT INTO `js_mk` VALUES (36, 20527);
INSERT INTO `js_mk` VALUES (36, 20528);
INSERT INTO `js_mk` VALUES (36, 20529);
INSERT INTO `js_mk` VALUES (36, 20530);
INSERT INTO `js_mk` VALUES (36, 20531);
INSERT INTO `js_mk` VALUES (36, 20532);
INSERT INTO `js_mk` VALUES (36, 20533);
INSERT INTO `js_mk` VALUES (36, 20534);
INSERT INTO `js_mk` VALUES (36, 20535);
INSERT INTO `js_mk` VALUES (36, 20536);
INSERT INTO `js_mk` VALUES (36, 20537);
INSERT INTO `js_mk` VALUES (36, 20538);
INSERT INTO `js_mk` VALUES (36, 20539);
INSERT INTO `js_mk` VALUES (36, 20540);
INSERT INTO `js_mk` VALUES (36, 20541);
INSERT INTO `js_mk` VALUES (36, 20542);
INSERT INTO `js_mk` VALUES (36, 20543);
INSERT INTO `js_mk` VALUES (36, 20544);
INSERT INTO `js_mk` VALUES (36, 20545);
INSERT INTO `js_mk` VALUES (36, 20546);
INSERT INTO `js_mk` VALUES (36, 20547);
INSERT INTO `js_mk` VALUES (36, 20548);
INSERT INTO `js_mk` VALUES (36, 20549);
INSERT INTO `js_mk` VALUES (36, 20550);
INSERT INTO `js_mk` VALUES (36, 20551);
INSERT INTO `js_mk` VALUES (36, 20552);
INSERT INTO `js_mk` VALUES (36, 20553);
INSERT INTO `js_mk` VALUES (36, 20554);
INSERT INTO `js_mk` VALUES (36, 20555);
INSERT INTO `js_mk` VALUES (36, 20556);
INSERT INTO `js_mk` VALUES (36, 20557);
INSERT INTO `js_mk` VALUES (36, 20558);
INSERT INTO `js_mk` VALUES (36, 20559);
INSERT INTO `js_mk` VALUES (36, 20560);
INSERT INTO `js_mk` VALUES (36, 20561);
INSERT INTO `js_mk` VALUES (36, 20562);
INSERT INTO `js_mk` VALUES (36, 20563);
INSERT INTO `js_mk` VALUES (36, 20564);
INSERT INTO `js_mk` VALUES (36, 20565);
INSERT INTO `js_mk` VALUES (36, 20566);
INSERT INTO `js_mk` VALUES (36, 20567);
INSERT INTO `js_mk` VALUES (36, 20568);
INSERT INTO `js_mk` VALUES (36, 20569);
INSERT INTO `js_mk` VALUES (36, 20570);
INSERT INTO `js_mk` VALUES (36, 20571);
INSERT INTO `js_mk` VALUES (36, 20572);
INSERT INTO `js_mk` VALUES (36, 20573);
INSERT INTO `js_mk` VALUES (36, 20574);
INSERT INTO `js_mk` VALUES (36, 20575);
INSERT INTO `js_mk` VALUES (36, 20576);
INSERT INTO `js_mk` VALUES (36, 20577);
INSERT INTO `js_mk` VALUES (36, 20578);
INSERT INTO `js_mk` VALUES (36, 20579);
INSERT INTO `js_mk` VALUES (36, 20580);
INSERT INTO `js_mk` VALUES (36, 20581);
INSERT INTO `js_mk` VALUES (36, 20582);
INSERT INTO `js_mk` VALUES (36, 20583);
INSERT INTO `js_mk` VALUES (36, 20584);
INSERT INTO `js_mk` VALUES (36, 20585);
INSERT INTO `js_mk` VALUES (36, 20586);
INSERT INTO `js_mk` VALUES (36, 20587);
INSERT INTO `js_mk` VALUES (36, 20588);
INSERT INTO `js_mk` VALUES (36, 20589);
INSERT INTO `js_mk` VALUES (36, 20590);
INSERT INTO `js_mk` VALUES (36, 20591);
INSERT INTO `js_mk` VALUES (36, 20592);
INSERT INTO `js_mk` VALUES (36, 20593);
INSERT INTO `js_mk` VALUES (36, 20594);
INSERT INTO `js_mk` VALUES (36, 20595);
INSERT INTO `js_mk` VALUES (36, 20596);
INSERT INTO `js_mk` VALUES (36, 20597);
INSERT INTO `js_mk` VALUES (36, 20598);
INSERT INTO `js_mk` VALUES (36, 20599);
INSERT INTO `js_mk` VALUES (36, 20600);
INSERT INTO `js_mk` VALUES (36, 20601);
INSERT INTO `js_mk` VALUES (36, 20602);
INSERT INTO `js_mk` VALUES (36, 20603);
INSERT INTO `js_mk` VALUES (36, 20604);
INSERT INTO `js_mk` VALUES (36, 20605);
INSERT INTO `js_mk` VALUES (36, 20606);
INSERT INTO `js_mk` VALUES (36, 20607);
INSERT INTO `js_mk` VALUES (36, 20608);
INSERT INTO `js_mk` VALUES (39, 10006);
INSERT INTO `js_mk` VALUES (39, 10030);
INSERT INTO `js_mk` VALUES (39, 20020);
INSERT INTO `js_mk` VALUES (39, 20021);
INSERT INTO `js_mk` VALUES (39, 20022);
INSERT INTO `js_mk` VALUES (39, 20023);
INSERT INTO `js_mk` VALUES (39, 20110);
INSERT INTO `js_mk` VALUES (39, 20111);
INSERT INTO `js_mk` VALUES (39, 20112);
INSERT INTO `js_mk` VALUES (39, 20586);
INSERT INTO `js_mk` VALUES (39, 20587);
INSERT INTO `js_mk` VALUES (39, 20588);
INSERT INTO `js_mk` VALUES (39, 20589);
INSERT INTO `js_mk` VALUES (39, 20590);
INSERT INTO `js_mk` VALUES (39, 20591);
INSERT INTO `js_mk` VALUES (39, 20592);
INSERT INTO `js_mk` VALUES (39, 20593);
INSERT INTO `js_mk` VALUES (39, 20594);
INSERT INTO `js_mk` VALUES (39, 20595);
INSERT INTO `js_mk` VALUES (39, 20596);
INSERT INTO `js_mk` VALUES (39, 20597);
INSERT INTO `js_mk` VALUES (39, 20598);
INSERT INTO `js_mk` VALUES (39, 20599);
INSERT INTO `js_mk` VALUES (39, 20600);
INSERT INTO `js_mk` VALUES (39, 20601);
INSERT INTO `js_mk` VALUES (39, 20602);
INSERT INTO `js_mk` VALUES (40, 10007);
INSERT INTO `js_mk` VALUES (40, 10030);
INSERT INTO `js_mk` VALUES (40, 20110);
INSERT INTO `js_mk` VALUES (40, 20111);
INSERT INTO `js_mk` VALUES (40, 20112);
INSERT INTO `js_mk` VALUES (40, 20501);
INSERT INTO `js_mk` VALUES (40, 20584);
INSERT INTO `js_mk` VALUES (40, 20585);
INSERT INTO `js_mk` VALUES (41, 10011);
INSERT INTO `js_mk` VALUES (41, 10030);
INSERT INTO `js_mk` VALUES (41, 20110);
INSERT INTO `js_mk` VALUES (41, 20111);
INSERT INTO `js_mk` VALUES (41, 20112);
INSERT INTO `js_mk` VALUES (41, 20211);
INSERT INTO `js_mk` VALUES (41, 20212);
INSERT INTO `js_mk` VALUES (41, 20213);
INSERT INTO `js_mk` VALUES (41, 20214);
INSERT INTO `js_mk` VALUES (41, 20215);
INSERT INTO `js_mk` VALUES (41, 20558);
INSERT INTO `js_mk` VALUES (41, 20559);
INSERT INTO `js_mk` VALUES (41, 20560);
INSERT INTO `js_mk` VALUES (41, 20561);
INSERT INTO `js_mk` VALUES (41, 20562);
INSERT INTO `js_mk` VALUES (41, 20563);
INSERT INTO `js_mk` VALUES (41, 20564);
INSERT INTO `js_mk` VALUES (41, 20565);
INSERT INTO `js_mk` VALUES (41, 20566);
INSERT INTO `js_mk` VALUES (41, 20567);
INSERT INTO `js_mk` VALUES (41, 20568);
INSERT INTO `js_mk` VALUES (41, 20569);
INSERT INTO `js_mk` VALUES (41, 20570);
INSERT INTO `js_mk` VALUES (41, 20571);
INSERT INTO `js_mk` VALUES (41, 20603);
INSERT INTO `js_mk` VALUES (41, 20604);
INSERT INTO `js_mk` VALUES (41, 20605);
INSERT INTO `js_mk` VALUES (41, 20606);
INSERT INTO `js_mk` VALUES (42, 10012);
INSERT INTO `js_mk` VALUES (42, 10030);
INSERT INTO `js_mk` VALUES (42, 20110);
INSERT INTO `js_mk` VALUES (42, 20111);
INSERT INTO `js_mk` VALUES (42, 20112);
INSERT INTO `js_mk` VALUES (42, 20411);
INSERT INTO `js_mk` VALUES (42, 20412);
INSERT INTO `js_mk` VALUES (42, 20550);
INSERT INTO `js_mk` VALUES (42, 20551);
INSERT INTO `js_mk` VALUES (42, 20552);
INSERT INTO `js_mk` VALUES (42, 20553);
INSERT INTO `js_mk` VALUES (42, 20554);
INSERT INTO `js_mk` VALUES (42, 20555);
INSERT INTO `js_mk` VALUES (42, 20556);
INSERT INTO `js_mk` VALUES (42, 20557);
INSERT INTO `js_mk` VALUES (43, 10014);
INSERT INTO `js_mk` VALUES (43, 10030);
INSERT INTO `js_mk` VALUES (43, 20049);
INSERT INTO `js_mk` VALUES (43, 20050);
INSERT INTO `js_mk` VALUES (43, 20051);
INSERT INTO `js_mk` VALUES (43, 20110);
INSERT INTO `js_mk` VALUES (43, 20111);
INSERT INTO `js_mk` VALUES (43, 20112);
INSERT INTO `js_mk` VALUES (44, 10030);
INSERT INTO `js_mk` VALUES (44, 20110);
INSERT INTO `js_mk` VALUES (44, 20111);
INSERT INTO `js_mk` VALUES (44, 20112);
INSERT INTO `js_mk` VALUES (44, 20120);
INSERT INTO `js_mk` VALUES (44, 20121);
INSERT INTO `js_mk` VALUES (44, 20122);
INSERT INTO `js_mk` VALUES (44, 20140);
INSERT INTO `js_mk` VALUES (44, 20141);
INSERT INTO `js_mk` VALUES (44, 20418);
INSERT INTO `js_mk` VALUES (44, 20534);
INSERT INTO `js_mk` VALUES (44, 20535);
INSERT INTO `js_mk` VALUES (44, 20536);
INSERT INTO `js_mk` VALUES (44, 20537);
INSERT INTO `js_mk` VALUES (44, 20538);
INSERT INTO `js_mk` VALUES (44, 20539);
INSERT INTO `js_mk` VALUES (44, 20540);
INSERT INTO `js_mk` VALUES (44, 20541);
INSERT INTO `js_mk` VALUES (44, 20542);
INSERT INTO `js_mk` VALUES (44, 20543);
INSERT INTO `js_mk` VALUES (44, 20544);
INSERT INTO `js_mk` VALUES (44, 20545);
INSERT INTO `js_mk` VALUES (44, 20546);
INSERT INTO `js_mk` VALUES (44, 20547);
INSERT INTO `js_mk` VALUES (44, 20548);
INSERT INTO `js_mk` VALUES (44, 20549);
INSERT INTO `js_mk` VALUES (44, 20607);
INSERT INTO `js_mk` VALUES (45, 10030);
INSERT INTO `js_mk` VALUES (45, 10031);
INSERT INTO `js_mk` VALUES (45, 20110);
INSERT INTO `js_mk` VALUES (45, 20111);
INSERT INTO `js_mk` VALUES (45, 20112);
INSERT INTO `js_mk` VALUES (45, 20311);
INSERT INTO `js_mk` VALUES (45, 20312);
INSERT INTO `js_mk` VALUES (45, 20313);
INSERT INTO `js_mk` VALUES (45, 20514);
INSERT INTO `js_mk` VALUES (45, 20515);
INSERT INTO `js_mk` VALUES (45, 20516);
INSERT INTO `js_mk` VALUES (45, 20517);
INSERT INTO `js_mk` VALUES (45, 20518);
INSERT INTO `js_mk` VALUES (45, 20519);
INSERT INTO `js_mk` VALUES (45, 20520);
INSERT INTO `js_mk` VALUES (45, 20521);
INSERT INTO `js_mk` VALUES (45, 20522);
INSERT INTO `js_mk` VALUES (45, 20523);
INSERT INTO `js_mk` VALUES (45, 20524);
INSERT INTO `js_mk` VALUES (45, 20525);
INSERT INTO `js_mk` VALUES (45, 20526);
INSERT INTO `js_mk` VALUES (45, 20527);
INSERT INTO `js_mk` VALUES (45, 20528);
INSERT INTO `js_mk` VALUES (45, 20529);
INSERT INTO `js_mk` VALUES (45, 20530);
INSERT INTO `js_mk` VALUES (45, 20531);
INSERT INTO `js_mk` VALUES (45, 20532);
INSERT INTO `js_mk` VALUES (45, 20533);
INSERT INTO `js_mk` VALUES (46, 10030);
INSERT INTO `js_mk` VALUES (46, 10032);
INSERT INTO `js_mk` VALUES (46, 20110);
INSERT INTO `js_mk` VALUES (46, 20111);
INSERT INTO `js_mk` VALUES (46, 20112);
INSERT INTO `js_mk` VALUES (46, 20511);
INSERT INTO `js_mk` VALUES (46, 20512);
INSERT INTO `js_mk` VALUES (46, 20513);
INSERT INTO `js_mk` VALUES (47, 10010);
INSERT INTO `js_mk` VALUES (47, 10030);
INSERT INTO `js_mk` VALUES (47, 20040);
INSERT INTO `js_mk` VALUES (47, 20110);
INSERT INTO `js_mk` VALUES (47, 20111);
INSERT INTO `js_mk` VALUES (47, 20112);
INSERT INTO `js_mk` VALUES (47, 20422);
INSERT INTO `js_mk` VALUES (47, 20423);
INSERT INTO `js_mk` VALUES (47, 20576);
INSERT INTO `js_mk` VALUES (47, 20577);
INSERT INTO `js_mk` VALUES (47, 20578);
INSERT INTO `js_mk` VALUES (47, 20579);
INSERT INTO `js_mk` VALUES (47, 20580);
INSERT INTO `js_mk` VALUES (47, 20581);
INSERT INTO `js_mk` VALUES (47, 20582);
INSERT INTO `js_mk` VALUES (47, 20583);
INSERT INTO `js_mk` VALUES (47, 20608);
INSERT INTO `js_mk` VALUES (48, 10030);
INSERT INTO `js_mk` VALUES (48, 20110);
INSERT INTO `js_mk` VALUES (48, 20111);
INSERT INTO `js_mk` VALUES (48, 20112);
INSERT INTO `js_mk` VALUES (48, 20418);
INSERT INTO `js_mk` VALUES (48, 20534);
INSERT INTO `js_mk` VALUES (48, 20535);
INSERT INTO `js_mk` VALUES (48, 20536);
INSERT INTO `js_mk` VALUES (48, 20537);
INSERT INTO `js_mk` VALUES (48, 20538);
INSERT INTO `js_mk` VALUES (48, 20539);
INSERT INTO `js_mk` VALUES (48, 20540);
INSERT INTO `js_mk` VALUES (48, 20541);
INSERT INTO `js_mk` VALUES (49, 10030);
INSERT INTO `js_mk` VALUES (49, 20120);
INSERT INTO `js_mk` VALUES (49, 20121);
INSERT INTO `js_mk` VALUES (49, 20122);
INSERT INTO `js_mk` VALUES (49, 20542);
INSERT INTO `js_mk` VALUES (49, 20543);
INSERT INTO `js_mk` VALUES (49, 20544);
INSERT INTO `js_mk` VALUES (49, 20545);
INSERT INTO `js_mk` VALUES (49, 20546);
INSERT INTO `js_mk` VALUES (49, 20547);
INSERT INTO `js_mk` VALUES (49, 20548);
INSERT INTO `js_mk` VALUES (49, 20549);
INSERT INTO `js_mk` VALUES (50, 10030);
INSERT INTO `js_mk` VALUES (50, 20140);
INSERT INTO `js_mk` VALUES (50, 20141);
INSERT INTO `js_mk` VALUES (50, 20607);
INSERT INTO `js_mk` VALUES (51, 10030);
INSERT INTO `js_mk` VALUES (51, 20110);
INSERT INTO `js_mk` VALUES (51, 20111);
INSERT INTO `js_mk` VALUES (51, 20112);
COMMIT;

-- ----------------------------
-- Table structure for jsb
-- ----------------------------
DROP TABLE IF EXISTS `jsb`;
CREATE TABLE `jsb` (
  `js_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `js_mc` varchar(32) NOT NULL COMMENT '角色名称',
  `js_xgsj` datetime NOT NULL COMMENT '角色修改时间',
  `js_code` varchar(255) NOT NULL COMMENT '角色标识',
  `js_ms` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `js_yxj` int(11) DEFAULT '99' COMMENT '角色等级（优先级）',
  PRIMARY KEY (`js_id`,`js_mc`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of jsb
-- ----------------------------
BEGIN;
INSERT INTO `jsb` VALUES (36, '超级管理员', '2018-12-26 18:42:41', 'admin', '111', 0);
INSERT INTO `jsb` VALUES (39, '部门管理员', '2018-12-26 19:10:47', 'dept', '部门模块所有操作', 99);
INSERT INTO `jsb` VALUES (40, '党籍管理员', '2018-12-26 18:46:13', 'part', '党籍工作平台所有的操作', 99);
INSERT INTO `jsb` VALUES (41, '通知管理员', '2018-12-26 18:46:29', 'notice', '通知所有操作', 99);
INSERT INTO `jsb` VALUES (42, '新闻管理员', '2018-12-26 18:46:48', 'news', '新闻模块所有操作', 99);
INSERT INTO `jsb` VALUES (43, '大数据管理员员', '2018-12-26 18:47:00', 'data', '党建大数据所有操作', 99);
INSERT INTO `jsb` VALUES (44, '系统管理员', '2018-12-26 18:47:20', 'system', '系统管理所有操作', 99);
INSERT INTO `jsb` VALUES (45, '审批管理员', '2018-12-26 18:47:34', 'approval', '审批模块所有操作', 99);
INSERT INTO `jsb` VALUES (46, '日志管理员', '2018-12-26 18:47:49', 'log', '日志管理所有操作', 99);
INSERT INTO `jsb` VALUES (47, '考试中心管理员', '2018-12-26 18:48:12', 'exam', '考试中心所有操作', 99);
INSERT INTO `jsb` VALUES (48, '用户管理员', '2018-12-26 18:48:22', 'user', '用户管理所有操作', 99);
INSERT INTO `jsb` VALUES (49, '权限管理', '2018-12-26 18:48:32', 'authority', '权限管理所有操作', 99);
INSERT INTO `jsb` VALUES (50, '图片管理', '2018-12-26 18:48:42', 'picture', '图片管理员', 99);
INSERT INTO `jsb` VALUES (51, '基础个人信息', '2018-12-26 18:48:52', 'baseUser', '个人信息展示以及个人信息修改', 99);
COMMIT;

-- ----------------------------
-- Table structure for kszx_sj
-- ----------------------------
DROP TABLE IF EXISTS `kszx_sj`;
CREATE TABLE `kszx_sj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sjbt` varchar(255) NOT NULL COMMENT '试卷标题',
  `sjlb` int(11) NOT NULL COMMENT '试卷分类',
  `kssm` text COMMENT '考试说明',
  `zjfs` int(11) NOT NULL COMMENT '组卷方式：1表示固定试题，2表示随机抽题，3表示固定+随机抽题',
  `stzs` int(11) DEFAULT NULL COMMENT '试题总数',
  `sjzf` int(11) DEFAULT NULL COMMENT '试卷总分',
  `jgfs` int(11) DEFAULT '60' COMMENT '及格分数',
  `dxtssl` int(11) DEFAULT NULL COMMENT '多选题数量',
  `dxtsl` int(11) DEFAULT NULL COMMENT '单选题数量',
  `pdtsl` int(11) DEFAULT NULL COMMENT '判断题数量',
  `dxtfs` int(11) DEFAULT NULL COMMENT '单选题每题分数',
  `dxtsfs` int(11) DEFAULT NULL COMMENT '多选题每题分数',
  `pdtfs` int(11) DEFAULT NULL COMMENT '判断题每题分数',
  `djsj` int(11) DEFAULT NULL COMMENT '答卷时间',
  `kssj` datetime DEFAULT NULL COMMENT '开始时间',
  `jssj` datetime DEFAULT NULL COMMENT '考试截止时间',
  `sjzt` int(11) NOT NULL DEFAULT '1' COMMENT '试卷状态',
  `zdjj` int(11) DEFAULT '1' COMMENT '自动交卷开关',
  `cjrq` date DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='考试中心-试卷表';

-- ----------------------------
-- Records of kszx_sj
-- ----------------------------
BEGIN;
INSERT INTO `kszx_sj` VALUES (27, '公务员考试001', 1, '<p><span>公务员考试常识考试</span></p>', 1, 45, 65, 60, 20, 25, 0, 1, 2, 1, 100, '2019-12-01 16:00:00', '2019-03-31 16:00:00', 1, 1, '2018-12-16');
INSERT INTO `kszx_sj` VALUES (28, '公务员考试002', 1, '<p><span>公务员考试002</span></p>', 1, 45, 130, 60, 20, 25, 0, 2, 4, 2, 100, '2019-01-01 00:00:00', '2019-05-28 00:00:00', 1, 1, '2018-12-17');
INSERT INTO `kszx_sj` VALUES (29, '公务员考试003', 1, '<p><span>公务员考试003</span></p>', 1, 10, 45, 60, 5, 5, 0, 3, 6, 3, 100, '2019-01-01 00:00:00', '2019-03-07 00:00:00', 1, 1, '2018-12-17');
INSERT INTO `kszx_sj` VALUES (30, '公务员考试004', 1, '<p><span>公务员考试004</span></p>', 1, 10, 80, 60, 10, 0, 0, 4, 8, 4, 100, '2019-01-01 00:00:00', '2019-03-22 00:00:00', 1, 1, '2018-12-17');
INSERT INTO `kszx_sj` VALUES (31, '公务员考试005', 1, '<p><span>公务员考试005</span></p>', 1, 10, 75, 60, 5, 5, 0, 5, 10, 5, 100, '2018-12-17 00:00:00', '2019-03-18 00:00:00', 1, 1, '2018-12-17');
INSERT INTO `kszx_sj` VALUES (32, '公务员考试006', 1, '<p><span>公务员考试006</span></p>', 1, 10, 60, 60, 0, 10, 0, 6, 12, 6, 130, '2018-12-17 00:00:00', '2018-12-23 00:00:00', 1, 1, '2018-12-17');
INSERT INTO `kszx_sj` VALUES (33, '第一份试卷', 1, 'asd', 1, 11, 11, 60, 5, 6, 0, 1, 1, 1, 100, '2018-12-15 00:00:00', '2019-03-15 00:00:00', 1, 1, '2018-12-17');
INSERT INTO `kszx_sj` VALUES (34, 'huahua', 1, '', 1, 45, 45, 60, 20, 25, 0, 1, 1, 1, 100, '2018-12-20 00:00:00', '2019-04-06 00:00:00', 1, 1, '2018-12-21');
COMMIT;

-- ----------------------------
-- Table structure for kszx_sj_gdst
-- ----------------------------
DROP TABLE IF EXISTS `kszx_sj_gdst`;
CREATE TABLE `kszx_sj_gdst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stlx` varchar(255) DEFAULT NULL COMMENT '试题类型',
  `sj` int(11) DEFAULT NULL COMMENT '所属试卷ID',
  `st` int(11) DEFAULT NULL COMMENT '试题ID',
  `fs` int(11) DEFAULT NULL COMMENT '题目分值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8 COMMENT='考试中心-试卷固定题目表';

-- ----------------------------
-- Records of kszx_sj_gdst
-- ----------------------------
BEGIN;
INSERT INTO `kszx_sj_gdst` VALUES (109, '单选题', 27, 1000033, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (110, '单选题', 27, 1000034, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (111, '单选题', 27, 1000035, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (112, '单选题', 27, 1000036, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (113, '单选题', 27, 1000037, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (114, '多选题', 27, 1000038, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (115, '多选题', 27, 1000039, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (116, '多选题', 27, 1000040, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (117, '多选题', 27, 1000041, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (118, '多选题', 27, 1000042, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (119, '多选题', 27, 1000043, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (120, '多选题', 27, 1000044, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (121, '多选题', 27, 1000045, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (123, '多选题', 27, 1000047, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (124, '多选题', 27, 1000048, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (125, '多选题', 27, 1000049, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (126, '多选题', 27, 1000046, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (127, '多选题', 27, 1000050, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (128, '多选题', 27, 1000051, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (129, '多选题', 27, 1000052, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (130, '多选题', 27, 1000053, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (131, '多选题', 27, 1000054, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (132, '多选题', 27, 1000055, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (134, '多选题', 27, 1000057, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (135, '单选题', 27, 1000058, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (136, '多选题', 27, 1000056, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (137, '单选题', 27, 1000059, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (138, '单选题', 27, 1000060, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (139, '单选题', 27, 1000061, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (140, '单选题', 27, 1000062, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (141, '单选题', 27, 1000063, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (142, '单选题', 27, 1000064, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (143, '单选题', 27, 1000065, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (144, '单选题', 27, 1000066, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (145, '单选题', 27, 1000067, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (146, '单选题', 27, 1000068, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (147, '单选题', 27, 1000069, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (148, '单选题', 27, 1000070, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (149, '单选题', 27, 1000071, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (150, '单选题', 27, 1000072, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (151, '单选题', 27, 1000073, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (152, '单选题', 27, 1000074, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (153, '单选题', 27, 1000075, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (154, '单选题', 27, 1000076, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (155, '单选题', 27, 1000077, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (156, '单选题', 28, 1000033, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (157, '单选题', 28, 1000034, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (158, '单选题', 28, 1000036, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (159, '单选题', 28, 1000035, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (160, '单选题', 28, 1000037, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (161, '多选题', 28, 1000038, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (162, '多选题', 28, 1000039, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (163, '多选题', 28, 1000040, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (164, '多选题', 28, 1000041, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (165, '多选题', 28, 1000042, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (166, '多选题', 28, 1000043, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (167, '多选题', 28, 1000044, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (168, '多选题', 28, 1000045, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (169, '多选题', 28, 1000046, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (170, '多选题', 28, 1000047, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (171, '多选题', 28, 1000048, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (172, '多选题', 28, 1000049, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (173, '多选题', 28, 1000050, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (174, '多选题', 28, 1000051, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (175, '多选题', 28, 1000052, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (176, '多选题', 28, 1000053, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (177, '多选题', 28, 1000054, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (178, '多选题', 28, 1000055, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (179, '多选题', 28, 1000056, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (180, '多选题', 28, 1000057, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (181, '单选题', 28, 1000058, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (182, '单选题', 28, 1000059, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (183, '单选题', 28, 1000060, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (184, '单选题', 28, 1000061, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (185, '单选题', 28, 1000062, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (186, '单选题', 28, 1000063, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (187, '单选题', 28, 1000064, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (188, '单选题', 28, 1000065, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (189, '单选题', 28, 1000066, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (190, '单选题', 28, 1000067, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (191, '单选题', 28, 1000068, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (192, '单选题', 28, 1000069, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (193, '单选题', 28, 1000070, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (194, '单选题', 28, 1000071, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (195, '单选题', 28, 1000072, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (196, '单选题', 28, 1000073, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (197, '单选题', 28, 1000074, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (198, '单选题', 28, 1000075, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (199, '单选题', 28, 1000076, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (200, '单选题', 28, 1000077, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (201, '单选题', 29, 1000033, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (202, '单选题', 29, 1000034, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (203, '单选题', 29, 1000035, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (204, '单选题', 29, 1000036, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (205, '单选题', 29, 1000037, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (206, '多选题', 29, 1000038, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (207, '多选题', 29, 1000039, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (208, '多选题', 29, 1000040, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (209, '多选题', 29, 1000041, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (210, '多选题', 29, 1000042, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (211, '多选题', 30, 1000043, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (212, '多选题', 30, 1000044, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (213, '多选题', 30, 1000045, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (214, '多选题', 30, 1000046, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (215, '多选题', 30, 1000047, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (216, '多选题', 30, 1000048, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (217, '多选题', 30, 1000049, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (218, '多选题', 30, 1000050, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (219, '多选题', 30, 1000051, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (220, '多选题', 30, 1000052, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (221, '多选题', 31, 1000053, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (222, '多选题', 31, 1000054, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (223, '多选题', 31, 1000055, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (224, '多选题', 31, 1000056, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (225, '多选题', 31, 1000057, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (226, '单选题', 31, 1000058, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (227, '单选题', 31, 1000059, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (228, '单选题', 31, 1000060, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (229, '单选题', 31, 1000061, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (230, '单选题', 31, 1000062, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (231, '单选题', 32, 1000063, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (232, '单选题', 32, 1000064, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (233, '单选题', 32, 1000065, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (234, '单选题', 32, 1000066, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (235, '单选题', 32, 1000067, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (236, '单选题', 32, 1000068, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (237, '单选题', 32, 1000069, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (238, '单选题', 32, 1000070, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (239, '单选题', 32, 1000071, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (240, '单选题', 32, 1000072, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (241, '单选题', 33, 1000033, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (242, '单选题', 33, 1000035, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (243, '单选题', 33, 1000034, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (244, '单选题', 33, 1000036, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (245, '单选题', 33, 1000037, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (246, '单选题', 33, 1000058, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (247, '多选题', 33, 1000038, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (248, '多选题', 33, 1000039, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (249, '多选题', 33, 1000040, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (250, '多选题', 33, 1000041, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (251, '多选题', 33, 1000042, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (252, '单选题', 34, 1000033, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (253, '单选题', 34, 1000034, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (254, '单选题', 34, 1000035, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (255, '单选题', 34, 1000036, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (256, '单选题', 34, 1000037, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (257, '多选题', 34, 1000038, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (258, '多选题', 34, 1000039, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (259, '多选题', 34, 1000040, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (260, '多选题', 34, 1000041, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (261, '多选题', 34, 1000042, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (262, '多选题', 34, 1000043, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (263, '多选题', 34, 1000044, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (264, '多选题', 34, 1000045, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (265, '多选题', 34, 1000046, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (266, '多选题', 34, 1000047, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (267, '多选题', 34, 1000048, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (268, '多选题', 34, 1000049, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (269, '多选题', 34, 1000050, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (270, '多选题', 34, 1000051, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (271, '多选题', 34, 1000052, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (272, '多选题', 34, 1000053, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (273, '多选题', 34, 1000054, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (274, '多选题', 34, 1000055, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (275, '多选题', 34, 1000056, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (276, '多选题', 34, 1000057, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (277, '单选题', 34, 1000058, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (278, '单选题', 34, 1000059, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (279, '单选题', 34, 1000060, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (280, '单选题', 34, 1000061, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (281, '单选题', 34, 1000062, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (282, '单选题', 34, 1000063, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (283, '单选题', 34, 1000064, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (284, '单选题', 34, 1000065, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (285, '单选题', 34, 1000066, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (286, '单选题', 34, 1000067, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (287, '单选题', 34, 1000068, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (288, '单选题', 34, 1000069, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (289, '单选题', 34, 1000070, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (290, '单选题', 34, 1000071, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (291, '单选题', 34, 1000072, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (292, '单选题', 34, 1000073, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (293, '单选题', 34, 1000074, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (294, '单选题', 34, 1000075, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (295, '单选题', 34, 1000076, NULL);
INSERT INTO `kszx_sj_gdst` VALUES (296, '单选题', 34, 1000077, NULL);
COMMIT;

-- ----------------------------
-- Table structure for kszx_sj_sjst
-- ----------------------------
DROP TABLE IF EXISTS `kszx_sj_sjst`;
CREATE TABLE `kszx_sj_sjst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sj` int(11) DEFAULT NULL COMMENT '所属试卷ID',
  `stfl` int(11) DEFAULT NULL COMMENT '试题分类',
  `stnd` int(11) DEFAULT NULL COMMENT '试题难度',
  `pdtsl` int(11) DEFAULT NULL COMMENT '判断题数量',
  `dxtsl` int(11) DEFAULT NULL COMMENT '单选题数量',
  `dxtssl` int(11) DEFAULT NULL COMMENT '多选题数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='考试中心-随机试题表';

-- ----------------------------
-- Table structure for kszx_sjfl
-- ----------------------------
DROP TABLE IF EXISTS `kszx_sjfl`;
CREATE TABLE `kszx_sjfl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '试卷分类名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='考试中心-试卷分类表';

-- ----------------------------
-- Records of kszx_sjfl
-- ----------------------------
BEGIN;
INSERT INTO `kszx_sjfl` VALUES (1, '默认分类', 0);
INSERT INTO `kszx_sjfl` VALUES (8, '一级1', 0);
INSERT INTO `kszx_sjfl` VALUES (9, '二级', 0);
INSERT INTO `kszx_sjfl` VALUES (10, '三级', 0);
COMMIT;

-- ----------------------------
-- Table structure for kszx_st
-- ----------------------------
DROP TABLE IF EXISTS `kszx_st`;
CREATE TABLE `kszx_st` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stmc` varchar(255) DEFAULT NULL COMMENT '试题名称',
  `stzz` varchar(255) DEFAULT NULL COMMENT '作者',
  `stfl` int(11) DEFAULT '99999' COMMENT '分类',
  `stlx` varchar(50) DEFAULT NULL COMMENT '类型',
  `stfs` int(11) DEFAULT NULL COMMENT '分值',
  `stjx` varchar(255) DEFAULT NULL COMMENT '解析',
  `stnd` varchar(20) DEFAULT NULL COMMENT '试题难度',
  `stda` varchar(255) DEFAULT NULL COMMENT '试题答案',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000079 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考试中心-试题';

-- ----------------------------
-- Records of kszx_st
-- ----------------------------
BEGIN;
INSERT INTO `kszx_st` VALUES (1000033, '在我国，全国武装力量由（）领导并统一指挥。', 'lsd', 100040, '单选题', NULL, '', '2', 'B');
INSERT INTO `kszx_st` VALUES (1000034, '由于某化肥厂长期排污，该地域内两个村庄几年来多人患有罕见的严重疾病，根据《环境保护法》的规定，下列哪一选项是错误的（）', 'lsd', 100040, '单选题', NULL, '', '1', 'D');
INSERT INTO `kszx_st` VALUES (1000035, '我国《物权法》中的物权，是指权利人依法对特定的物享有直接支配和排他的权利。包括所有权、用益物权和______三大类。', 'lsd', 100040, '单选题', NULL, '', '3', 'A');
INSERT INTO `kszx_st` VALUES (1000036, '吉林省人大常务委员会认为一项法律的个别条款在适用上存在某些困难，并认为有必要对该条款作出法律解释。根据我国宪法和立法法规规定，吉林省人大常委会正确的做法是（ ）。', 'lsd', 100040, '单选题', NULL, '', '1', 'C');
INSERT INTO `kszx_st` VALUES (1000037, '某甲共育有三儿一女，2000年甲在公证机关公证下立a遗嘱将其财产给予其小儿子所有，后因与小儿子关系恶化，甲又自书b遗嘱决定将财产给予二儿子所有。根据我国《继承法》的相关规定，下列表述正确的是（  ）', 'lsd', 100040, '单选题', NULL, '', '2', 'A');
INSERT INTO `kszx_st` VALUES (1000038, '计算机安全是当前安全保密工作的重点之一。下列选项中，（  ）属于对计算机安全保密认识的误区，如果不加以纠正，就有可能导致泄密事件的发生。', 'lsd', 100040, '多选题', NULL, NULL, '1', 'ABC');
INSERT INTO `kszx_st` VALUES (1000039, '党的十八大报告中提出“为全面建成小康社会丽奋斗”，与十七大报告中提出的“为夺取全面建设小康社会新胜利而奋斗”的表述不同，从“建设”到“建成”，一词之变说明', 'lsd', 100040, '多选题', NULL, '', '2', 'BCD');
INSERT INTO `kszx_st` VALUES (1000040, '社会管理是人类社会必不可少的一项管理活动。在我们这样一个有13亿人口、经济社会快速发展的社会，社会管理任务更为艰巨繁重。加强和创新社会管理的根本目的是（    ），为党和国家事业发展营造良好社会环境。', 'lsd', 100040, '多选题', NULL, NULL, '3', 'AC');
INSERT INTO `kszx_st` VALUES (1000041, '稀土作为一种重要的战略资源，是很多高精尖产业所必不可少的原料。中国有不少战略资源（如铁矿等）贫乏，但稀土资源却非常丰富。下列关于稀土的说法，正确的有（  ）。', 'lsd', 100040, '多选题', NULL, NULL, '1', 'BD');
INSERT INTO `kszx_st` VALUES (1000042, '一百年前爆发的辛亥革命，结束了中国长达两千年之久的君主专制制度，是近代中国比较完全意义上的资产阶级革命，它在政治上、思想上给中国人民带来了不可低估的解放作用。下列关于辛亥革命的表述中，正确的是（）', 'lsd', 100040, '多选题', NULL, '', '2', 'AB');
INSERT INTO `kszx_st` VALUES (1000043, '有的地方动用执法部门设关卡，不让外地某些产品流入本地；有的公开限制外地产品流入本地市场，强令推销当地产品；有的组织质量监管部门专拣外地产品“曝光”，以达到“扫地出门”的目的。这些做法（  ）', 'lsd', 100040, '多选题', NULL, NULL, '3', 'BD');
INSERT INTO `kszx_st` VALUES (1000044, '地震带是地震集中分布的地带。在地震带内地震密集，在地震带外，地震分布零散。世界上的地震主要集中分布在（  ）', 'lsd', 100040, '多选题', NULL, NULL, '1', 'BD');
INSERT INTO `kszx_st` VALUES (1000045, '依法行政,就是政府及其工作人员作为行政主体在行使公共权力､管理行政事务时,必须以法律为依据,依照法律履行职责权限｡依法行政首先意味着（  ）', 'lsd', 100040, '多选题', NULL, '', '2', 'BD');
INSERT INTO `kszx_st` VALUES (1000046, '在社会主义市场经济体制中，政府的经济职能主要有（）', 'lsd', 100040, '多选题', NULL, NULL, '3', 'AB');
INSERT INTO `kszx_st` VALUES (1000047, '2010年10月18日，中共十七届五中全会通过了《中共中央关于制定国民经济和社会发展第十二个五年规划的建议》。“十二五”规划建议首次明确提出（   ）', 'lsd', 100040, '多选题', NULL, NULL, '1', 'AB');
INSERT INTO `kszx_st` VALUES (1000048, '最近，被命名为NDM-1的超级细菌在世界范围内引起人们的高度关注。下列关于NDM-1超级细菌的表述，正确的是（）', 'lsd', 100040, '多选题', NULL, NULL, '2', 'AC');
INSERT INTO `kszx_st` VALUES (1000049, '下列关于欧洲联盟的表述中，正确的是（  ）。', 'lsd', 100040, '多选题', NULL, NULL, '3', 'BCD');
INSERT INTO `kszx_st` VALUES (1000050, '在电子文件内容鉴定的方法中，对电子文件采取逐件地审阅，而不仅是单纯的查看文件的标题、名称和密级等，也不是很据案卷目录和案卷标题来判定其价值，这种方法称之为（）', 'lsd', 100040, '多选题', NULL, NULL, '1', 'AC');
INSERT INTO `kszx_st` VALUES (1000051, '2010年8月3日，第三十四届世界遗产大会在巴西利亚闭幕。这次大会审议和批准了20余处新的世界遗产。在这次大会上，（   ）', 'lsd', 100040, '多选题', NULL, NULL, '2', 'ABC');
INSERT INTO `kszx_st` VALUES (1000052, '2010年6月3日,全面模拟载人火星探测的“火星—500”载人航天飞行全封闭试验在莫斯科正式启动,来自（  ）的6名志愿者正式踏上长达520天的“火星之旅”｡这是人类进行的首次全面模拟载人火星探测试验｡', 'lsd', 100040, '多选题', NULL, NULL, '3', 'BCD');
INSERT INTO `kszx_st` VALUES (1000053, '2010年11月16日，联合国教科文组织保护非物质文化遗产政府间委员会第五次会议在肯尼亚首都内罗毕举行。在这次会议上，中国申报的（  ）被成功列入人类非物质文化遗产代表作名录。', 'lsd', 100040, '多选题', NULL, '', '1', 'ABC');
INSERT INTO `kszx_st` VALUES (1000054, '《北京市全民健身措施计划（2011-2015年）》提出，为实现目标任务，将要采取的措施有（  ）', 'lsd', 100040, '多选题', NULL, '', '2', 'BCD');
INSERT INTO `kszx_st` VALUES (1000055, '科学家通过对周口店北京猿人遗址的长期发掘和研究，发现北京猿人（  ）', 'lsd', 100040, '多选题', NULL, NULL, '3', 'ABC');
INSERT INTO `kszx_st` VALUES (1000056, '下列处罚方式中，不属于治安管理处罚的是（）', 'lsd', 100040, '多选题', NULL, NULL, '1', 'ABCD');
INSERT INTO `kszx_st` VALUES (1000057, '在经济理论界，有一种观点认为劳动生产率与工资水平是正相关关系，虽然支付高工资会增加企业成本，但可以通过提高员工的劳动积极性、队伍素质，降低离职率等是企业得到更大的效率，这主要是强调了（）', 'lsd', 100040, '多选题', NULL, NULL, '2', 'BC');
INSERT INTO `kszx_st` VALUES (1000058, '下列语句与出片对应错误的是（  ）', 'lsd', 100040, '单选题', NULL, NULL, '3', 'A');
INSERT INTO `kszx_st` VALUES (1000059, '为贯彻党的十七届四中全会精神，加快推进海峡西岸经济区建设，福建省委省政府提出要把海峡西岸经济区建设成为科学发展之区，改革开放之区，文明祥和之区与（  ）', 'lsd', 100040, '单选题', NULL, NULL, '1', 'B');
INSERT INTO `kszx_st` VALUES (1000060, '下列思想流派与产生时代对应错误的是：（）', 'lsd', 100040, '单选题', NULL, NULL, '2', 'C');
INSERT INTO `kszx_st` VALUES (1000061, '下列做法正确的是（）', 'lsd', 100040, '单选题', NULL, NULL, '3', 'D');
INSERT INTO `kszx_st` VALUES (1000062, '职业精神与人们职业活动紧密联系，是具有自身职业特征的精神。我国公务员职业精神的本质是（  ）', 'lsd', 100040, '单选题', NULL, NULL, '1', 'A');
INSERT INTO `kszx_st` VALUES (1000063, '挂在墙壁上的石英钟，当电能耗尽而停止走动时，其秒针往往会停在哪个数字上（  ）', 'lsd', 100040, '单选题', NULL, NULL, '2', 'B');
INSERT INTO `kszx_st` VALUES (1000064, '目前，我国银行尚不能代理的业务是（ ）。', 'lsd', 100040, '单选题', NULL, NULL, '3', 'C');
INSERT INTO `kszx_st` VALUES (1000065, '我国古代有许多伟大的思想家，其中提出“民为贵，社稷次之，君为轻”的是（  ）', 'lsd', 100040, '单选题', NULL, NULL, '1', 'D');
INSERT INTO `kszx_st` VALUES (1000066, '下列论述错误的是（  ）', 'lsd', 100040, '单选题', NULL, NULL, '2', 'A');
INSERT INTO `kszx_st` VALUES (1000067, '下列关于科技常识的表述中，不正确的是（　）', 'lsd', 100040, '单选题', NULL, NULL, '3', 'B');
INSERT INTO `kszx_st` VALUES (1000068, '宋玉在形容他的邻人东家之子时说，这个女子“增之一分则太长，减之一分则太短，著粉则太白，施朱则太赤”。东家之子的美貌反映了（）的辩证关系。', 'lsd', 100040, '单选题', NULL, NULL, '1', 'C');
INSERT INTO `kszx_st` VALUES (1000069, '关于琴棋书画，下列说法不正确的是（  ）', 'lsd', 100040, '单选题', NULL, NULL, '2', 'D');
INSERT INTO `kszx_st` VALUES (1000070, '下列中国名花与其美称对应正确的是：（）', 'lsd', 100040, '单选题', NULL, NULL, '3', 'A');
INSERT INTO `kszx_st` VALUES (1000071, '孔子是我国古代伟大的思想家和教育家，儒家学派创始人，世界最著名的文化名人之一。下列不是孔子名言的是（  ）', 'lsd', 100040, '单选题', NULL, NULL, '1', 'B');
INSERT INTO `kszx_st` VALUES (1000072, '下列疾病不是由病毒引起的是（  ）', 'lsd', 100040, '单选题', NULL, NULL, '2', 'C');
INSERT INTO `kszx_st` VALUES (1000073, '应对物价上涨，可采取的措施是（  ）', 'lsd', 100040, '单选题', NULL, NULL, '3', 'D');
INSERT INTO `kszx_st` VALUES (1000074, '2010年11月16日，联合国教科文组织将中国申报的《中国针灸》和（  ）列入人类非物质文化遗产代表作名录。', 'lsd', 100040, '单选题', NULL, NULL, '1', 'A');
INSERT INTO `kszx_st` VALUES (1000075, '中国共产党第十六届中央委员会第五次全体会议，于2005年10月8日至11日在北京举行。全会听取和讨论了胡锦涛受中央政治局委托作的工作报告，审议通过了（    ）', 'lsd', 100040, '单选题', NULL, NULL, '2', 'B');
INSERT INTO `kszx_st` VALUES (1000076, '电炉丝通电后热得发红，而与电炉丝连接的铜导线却不太热，这是因为（ ）。', 'lsd', 100040, '单选题', NULL, NULL, '3', 'C');
INSERT INTO `kszx_st` VALUES (1000077, '西方一位资产阶级政治家曾说：“民主国家乃是这样的国家，在那里，主权的人民受自己制定的法律领导，自己去做可能做的一切事情。”这段话的观点在于启示我们（ ）', 'lsd', 100040, '单选题', NULL, NULL, '1', 'D');
COMMIT;

-- ----------------------------
-- Table structure for kszx_stxx
-- ----------------------------
DROP TABLE IF EXISTS `kszx_stxx`;
CREATE TABLE `kszx_stxx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xx` int(11) DEFAULT NULL,
  `xxz` varchar(255) DEFAULT NULL,
  `stid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100340 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考试中心-试题选项表';

-- ----------------------------
-- Records of kszx_stxx
-- ----------------------------
BEGIN;
INSERT INTO `kszx_stxx` VALUES (100116, 1, '国务院', 1000033);
INSERT INTO `kszx_stxx` VALUES (100117, 2, '中央军事委员会', 1000033);
INSERT INTO `kszx_stxx` VALUES (100118, 3, '中华人民共和国主席', 1000033);
INSERT INTO `kszx_stxx` VALUES (100119, 4, '国防部', 1000033);
INSERT INTO `kszx_stxx` VALUES (100120, 1, '受害村民有权对该厂提起民事诉讼', 1000034);
INSERT INTO `kszx_stxx` VALUES (100121, 2, '因环境污染引起的民事诉讼时效为3年', 1000034);
INSERT INTO `kszx_stxx` VALUES (100122, 3, '环境污染民事责任的归责原则实行公平责任原则', 1000034);
INSERT INTO `kszx_stxx` VALUES (100123, 4, '本案由化肥厂承担其排污行为和损害结果之间是否存在因果关系的举证责任', 1000034);
INSERT INTO `kszx_stxx` VALUES (100124, 1, '地役权', 1000035);
INSERT INTO `kszx_stxx` VALUES (100125, 2, '质权', 1000035);
INSERT INTO `kszx_stxx` VALUES (100126, 3, '担保物权', 1000035);
INSERT INTO `kszx_stxx` VALUES (100127, 4, '留置权', 1000035);
INSERT INTO `kszx_stxx` VALUES (100132, 1, 'a遗嘱因经公证而效力优先，故应以a遗嘱为准', 1000037);
INSERT INTO `kszx_stxx` VALUES (100133, 2, 'b遗嘱为后立遗嘱，故应以b遗嘱为准', 1000037);
INSERT INTO `kszx_stxx` VALUES (100134, 3, 'a、b遗嘱均因侵犯其他继承人的合法权利而无效', 1000037);
INSERT INTO `kszx_stxx` VALUES (100135, 4, 'a、b遗嘱均因可能侵犯其他继承人的合法权利而效力待定', 1000037);
INSERT INTO `kszx_stxx` VALUES (100136, 1, '文件删除后就不可恢复', 1000038);
INSERT INTO `kszx_stxx` VALUES (100137, 2, '在内网上以文件共享方式传递文件是安全的', 1000038);
INSERT INTO `kszx_stxx` VALUES (100138, 3, '计算机病毒是造成计算机系统安全问题的主要原因', 1000038);
INSERT INTO `kszx_stxx` VALUES (100139, 4, '防火墙安装得越多，越有安全保障', 1000038);
INSERT INTO `kszx_stxx` VALUES (100144, 1, '维护社会秩序', 1000040);
INSERT INTO `kszx_stxx` VALUES (100145, 2, '协调社会关系', 1000040);
INSERT INTO `kszx_stxx` VALUES (100146, 3, '保障人民安居乐业', 1000040);
INSERT INTO `kszx_stxx` VALUES (100147, 4, '促进社会和谐', 1000040);
INSERT INTO `kszx_stxx` VALUES (100148, 1, '稀土元素可以提高植物的叶绿素含量，增强光合作用', 1000041);
INSERT INTO `kszx_stxx` VALUES (100149, 2, '稀土是用途广泛的一类非金属元素', 1000041);
INSERT INTO `kszx_stxx` VALUES (100150, 3, '稀土在世界上的储量非常稀有', 1000041);
INSERT INTO `kszx_stxx` VALUES (100151, 4, '稀土不仅可以添加至有色合金中，也可以添加至非金属材料中', 1000041);
INSERT INTO `kszx_stxx` VALUES (100156, 1, '是实行地方保护主义，不利于开放', 1000043);
INSERT INTO `kszx_stxx` VALUES (100157, 2, '有利于本地区经济的发展', 1000043);
INSERT INTO `kszx_stxx` VALUES (100158, 3, '违背了市场经济竞争的基本原则', 1000043);
INSERT INTO `kszx_stxx` VALUES (100159, 4, '抹杀了社会主义市场经济开放性的特点', 1000043);
INSERT INTO `kszx_stxx` VALUES (100160, 1, '环太平洋地震带、印度洋地震带和海岭地震带', 1000044);
INSERT INTO `kszx_stxx` VALUES (100161, 2, '环太平洋地震带、地中海-喜马拉雅地震带和海崔地震带', 1000044);
INSERT INTO `kszx_stxx` VALUES (100162, 3, '地中海-喜马拉雅地震带、北冰洋地震带和环太平洋地震带', 1000044);
INSERT INTO `kszx_stxx` VALUES (100163, 4, '印度洋地震带、北冰洋地震带和环太平洋地震带', 1000044);
INSERT INTO `kszx_stxx` VALUES (100168, 1, '调节收入分配和进行资源配置', 1000046);
INSERT INTO `kszx_stxx` VALUES (100169, 2, '制定市场规则和维护市场秩序', 1000046);
INSERT INTO `kszx_stxx` VALUES (100170, 3, '制定财政政策和货币政策，干预经济运行', 1000046);
INSERT INTO `kszx_stxx` VALUES (100171, 4, '制定经济发展计划和产业政策，引导资源流向', 1000046);
INSERT INTO `kszx_stxx` VALUES (100172, 1, '居民收入增长和CPI增长同步', 1000047);
INSERT INTO `kszx_stxx` VALUES (100173, 2, '居民收入增长和经济发展同步', 1000047);
INSERT INTO `kszx_stxx` VALUES (100174, 3, '劳动报酬增长和劳动生产率提高同步', 1000047);
INSERT INTO `kszx_stxx` VALUES (100175, 4, '经济发展和城镇化发展同步', 1000047);
INSERT INTO `kszx_stxx` VALUES (100176, 1, '这种超级细菌具有超强的抗生素耐药性', 1000048);
INSERT INTO `kszx_stxx` VALUES (100177, 2, 'NDM-1是一种耐药基因，能在细菌之间传递，一旦细菌获得这种基因，就可能变为超级耐药细菌', 1000048);
INSERT INTO `kszx_stxx` VALUES (100178, 3, '携带NDM-1基因的细菌能产生“超级病菌”', 1000048);
INSERT INTO `kszx_stxx` VALUES (100179, 4, '甲流、SARS和禽流感不能用抗生素治疗，原因就在于它们都携带了这一基因', 1000048);
INSERT INTO `kszx_stxx` VALUES (100180, 1, '由欧洲共同体发展而来', 1000049);
INSERT INTO `kszx_stxx` VALUES (100181, 2, '它是一个经济合作组织', 1000049);
INSERT INTO `kszx_stxx` VALUES (100182, 3, '最初由五个国家组成', 1000049);
INSERT INTO `kszx_stxx` VALUES (100183, 4, '它是一个政治军事组织', 1000049);
INSERT INTO `kszx_stxx` VALUES (100184, 1, '间接鉴定', 1000050);
INSERT INTO `kszx_stxx` VALUES (100185, 2, '职能鉴定', 1000050);
INSERT INTO `kszx_stxx` VALUES (100186, 3, '直接鉴定', 1000050);
INSERT INTO `kszx_stxx` VALUES (100187, 4, '可读鉴定', 1000050);
INSERT INTO `kszx_stxx` VALUES (100188, 1, '中国登封的“天地之中”历史建筑群被列入自然遗产', 1000051);
INSERT INTO `kszx_stxx` VALUES (100189, 2, '中国丹霞地貌被列入自然遗产', 1000051);
INSERT INTO `kszx_stxx` VALUES (100190, 3, '中国“三江并流”被批准扩大遗产保护区域', 1000051);
INSERT INTO `kszx_stxx` VALUES (100191, 4, '大会主席巴西文化部长费雷拉指出,这次大会的最大成果就是发达国家被认定的世界遗产数量明显增加，发达国家参与世界遗产保护的热情在增强', 1000051);
INSERT INTO `kszx_stxx` VALUES (100192, 1, '俄罗斯', 1000052);
INSERT INTO `kszx_stxx` VALUES (100193, 2, '意大利', 1000052);
INSERT INTO `kszx_stxx` VALUES (100194, 3, '中国', 1000052);
INSERT INTO `kszx_stxx` VALUES (100195, 4, '法国', 1000052);
INSERT INTO `kszx_stxx` VALUES (100204, 1, '群居洞穴', 1000055);
INSERT INTO `kszx_stxx` VALUES (100205, 2, '已经学会使用火', 1000055);
INSERT INTO `kszx_stxx` VALUES (100206, 3, '还不能直立行走', 1000055);
INSERT INTO `kszx_stxx` VALUES (100207, 4, '不会使用工具', 1000055);
INSERT INTO `kszx_stxx` VALUES (100208, 1, '罚款', 1000056);
INSERT INTO `kszx_stxx` VALUES (100209, 2, '罚金', 1000056);
INSERT INTO `kszx_stxx` VALUES (100210, 3, '拘役', 1000056);
INSERT INTO `kszx_stxx` VALUES (100211, 4, '剥夺政治权利', 1000056);
INSERT INTO `kszx_stxx` VALUES (100212, 1, '必须坚持按劳分配和按生产要素分配相结合', 1000057);
INSERT INTO `kszx_stxx` VALUES (100213, 2, '让劳动者分享发展成果也符合企业的长远利益', 1000057);
INSERT INTO `kszx_stxx` VALUES (100214, 3, '不断扩大消费是促进社会生产的有效途径', 1000057);
INSERT INTO `kszx_stxx` VALUES (100215, 4, '必须正确处理国家、企业和劳动者三者之间的关系', 1000057);
INSERT INTO `kszx_stxx` VALUES (100216, 1, '对该条款直接作出法律解释', 1000036);
INSERT INTO `kszx_stxx` VALUES (100217, 2, '提请最高人民法院就该条款作出司法解释', 1000036);
INSERT INTO `kszx_stxx` VALUES (100218, 3, '提请全国人民代表大会常务委员会就该条款作出法律解释', 1000036);
INSERT INTO `kszx_stxx` VALUES (100219, 4, '提请全国人民代表大会就该条款作出法律解释', 1000036);
INSERT INTO `kszx_stxx` VALUES (100220, 5, '这个歌事实啊的拉升的老大', 1000036);
INSERT INTO `kszx_stxx` VALUES (100221, 1, '意识对物质具有推动作用', 1000039);
INSERT INTO `kszx_stxx` VALUES (100222, 2, '主观与客观要做到具体的、历史的统一', 1000039);
INSERT INTO `kszx_stxx` VALUES (100223, 3, '真理是一个由不正确到正确的发展过程', 1000039);
INSERT INTO `kszx_stxx` VALUES (100224, 4, '认识总是随着实践的发展而变化', 1000039);
INSERT INTO `kszx_stxx` VALUES (100225, 5, '啊数量等哈来结束多哈上看见的', 1000039);
INSERT INTO `kszx_stxx` VALUES (100226, 6, '钱我怕日期温柔哟去无烟日', 1000039);
INSERT INTO `kszx_stxx` VALUES (100227, 7, '去外皮却脾气唔配全无', 1000039);
INSERT INTO `kszx_stxx` VALUES (100228, 1, '辛亥革命是一场深刻的思想启蒙运动，它使民主共和观念深入人心', 1000042);
INSERT INTO `kszx_stxx` VALUES (100229, 2, '在辛亥革命中，平民阶层对革命的参与改变了其生存条件，从而构建了新的社会结构', 1000042);
INSERT INTO `kszx_stxx` VALUES (100230, 3, '辛亥革命推翻了清朝的专制统治，完成了反帝反封建的革命任务', 1000042);
INSERT INTO `kszx_stxx` VALUES (100231, 4, '辛亥革命在亚洲打响了民主的第一枪，对近代亚洲各国被压迫民族的解放运动，产生了比较广泛的影响', 1000042);
INSERT INTO `kszx_stxx` VALUES (100232, 5, '脾胃去诶趣味u帕克萨家里的卡上', 1000042);
INSERT INTO `kszx_stxx` VALUES (100233, 6, 'IP请问u我去诶UI大', 1000042);
INSERT INTO `kszx_stxx` VALUES (100234, 7, '哦请问浦片区我u情人', 1000042);
INSERT INTO `kszx_stxx` VALUES (100235, 1, '行为合法', 1000045);
INSERT INTO `kszx_stxx` VALUES (100236, 2, '程序合法', 1000045);
INSERT INTO `kszx_stxx` VALUES (100237, 3, '权限法定', 1000045);
INSERT INTO `kszx_stxx` VALUES (100238, 4, '信息公开', 1000045);
INSERT INTO `kszx_stxx` VALUES (100239, 5, '气温UI脾气唔配全无恶', 1000045);
INSERT INTO `kszx_stxx` VALUES (100240, 6, '其喷雾器因为i配u迫切', 1000045);
INSERT INTO `kszx_stxx` VALUES (100241, 1, '强化政府公共服务职责，大力推进全民健身公共服务体系建设', 1000054);
INSERT INTO `kszx_stxx` VALUES (100242, 2, '加大科学健身指导力度', 1000054);
INSERT INTO `kszx_stxx` VALUES (100243, 3, '组织各项体育比赛活动，形成长效机制', 1000054);
INSERT INTO `kszx_stxx` VALUES (100244, 4, '促进全民健身服务业发展，引导城乡居民体消费', 1000054);
INSERT INTO `kszx_stxx` VALUES (100245, 5, 'i无皮却哦i权威啊空间的轮廓卡圣诞节啊哭', 1000054);
INSERT INTO `kszx_stxx` VALUES (100246, 6, 'pqiweuqiweuuakds.nlk.mxzcb，们兴致勃勃 ', 1000054);
INSERT INTO `kszx_stxx` VALUES (100247, 1, '川剧', 1000053);
INSERT INTO `kszx_stxx` VALUES (100248, 2, '京剧', 1000053);
INSERT INTO `kszx_stxx` VALUES (100249, 3, '中医药', 1000053);
INSERT INTO `kszx_stxx` VALUES (100250, 4, '中医针灸', 1000053);
INSERT INTO `kszx_stxx` VALUES (100251, 5, 'i请问哦；就啊上看见啦考试的哈结束的好机会', 1000053);
INSERT INTO `kszx_stxx` VALUES (100252, 6, '就啊黎世东结果就啊可是肚子，每次被美男子', 1000053);
INSERT INTO `kszx_stxx` VALUES (100253, 1, '不战而屈人之兵－《孙子兵法》', 1000058);
INSERT INTO `kszx_stxx` VALUES (100254, 2, '知之为知之，不知为不知，是知也－《韩非子》', 1000058);
INSERT INTO `kszx_stxx` VALUES (100255, 3, '天时不如地利，地利不如人和－为《孟子》', 1000058);
INSERT INTO `kszx_stxx` VALUES (100256, 4, '青出于蓝而胜于蓝－《荀子》', 1000058);
INSERT INTO `kszx_stxx` VALUES (100257, 1, '科技创新之区', 1000059);
INSERT INTO `kszx_stxx` VALUES (100258, 2, '生态优美之区', 1000059);
INSERT INTO `kszx_stxx` VALUES (100259, 3, '两岸交流之区', 1000059);
INSERT INTO `kszx_stxx` VALUES (100260, 4, '先行先试之区', 1000059);
INSERT INTO `kszx_stxx` VALUES (100261, 1, '心学——明代', 1000060);
INSERT INTO `kszx_stxx` VALUES (100262, 2, '理学——宋代', 1000060);
INSERT INTO `kszx_stxx` VALUES (100263, 3, '玄学——魏晋', 1000060);
INSERT INTO `kszx_stxx` VALUES (100264, 4, '儒学——战国', 1000060);
INSERT INTO `kszx_stxx` VALUES (100265, 1, '油锅起火后立即用水扑火，并迅速熄灭炉火', 1000061);
INSERT INTO `kszx_stxx` VALUES (100266, 2, '电路保险丝（片）熔断，用铜线代替以保护电器', 1000061);
INSERT INTO `kszx_stxx` VALUES (100267, 3, '身上着火，就地打滚，或用厚重衣物覆盖压灭火苗', 1000061);
INSERT INTO `kszx_stxx` VALUES (100268, 4, '停电的夜晚发现煤气泄漏后，点燃蜡烛查找泄漏原因', 1000061);
INSERT INTO `kszx_stxx` VALUES (100269, 1, '恪尽职守', 1000062);
INSERT INTO `kszx_stxx` VALUES (100270, 2, '诚实守信', 1000062);
INSERT INTO `kszx_stxx` VALUES (100271, 3, '公而忘私', 1000062);
INSERT INTO `kszx_stxx` VALUES (100272, 4, '服务人民', 1000062);
INSERT INTO `kszx_stxx` VALUES (100273, 1, '3', 1000063);
INSERT INTO `kszx_stxx` VALUES (100274, 2, '6', 1000063);
INSERT INTO `kszx_stxx` VALUES (100275, 3, '9', 1000063);
INSERT INTO `kszx_stxx` VALUES (100276, 4, '12', 1000063);
INSERT INTO `kszx_stxx` VALUES (100277, 1, '交电话费', 1000064);
INSERT INTO `kszx_stxx` VALUES (100278, 2, '代收保险费', 1000064);
INSERT INTO `kszx_stxx` VALUES (100279, 3, '代为保管贵重物品', 1000064);
INSERT INTO `kszx_stxx` VALUES (100280, 4, '买卖股票', 1000064);
INSERT INTO `kszx_stxx` VALUES (100281, 1, '董仲舒', 1000065);
INSERT INTO `kszx_stxx` VALUES (100282, 2, '老子', 1000065);
INSERT INTO `kszx_stxx` VALUES (100283, 3, '孟子', 1000065);
INSERT INTO `kszx_stxx` VALUES (100284, 4, '庄子', 1000065);
INSERT INTO `kszx_stxx` VALUES (100285, 1, '产业“空心化”弱化物质生产的地位', 1000066);
INSERT INTO `kszx_stxx` VALUES (100286, 2, '人口“老龄化”加重政府的财政负担', 1000066);
INSERT INTO `kszx_stxx` VALUES (100287, 3, '“城镇化”可以促进经济社会的发展', 1000066);
INSERT INTO `kszx_stxx` VALUES (100288, 4, '经济“全球化”有助于化解金融风险', 1000066);
INSERT INTO `kszx_stxx` VALUES (100289, 1, '弗莱明发明了青霉素', 1000067);
INSERT INTO `kszx_stxx` VALUES (100290, 2, '魏格纳提出了大陆漂移学说', 1000067);
INSERT INTO `kszx_stxx` VALUES (100291, 3, '爱因斯坦创立了狭义相对论', 1000067);
INSERT INTO `kszx_stxx` VALUES (100292, 4, '麦克斯韦发现了电磁感应', 1000067);
INSERT INTO `kszx_stxx` VALUES (100293, 1, '质量与数量', 1000068);
INSERT INTO `kszx_stxx` VALUES (100294, 2, '运动与静止', 1000068);
INSERT INTO `kszx_stxx` VALUES (100295, 3, '时间与空间', 1000068);
INSERT INTO `kszx_stxx` VALUES (100296, 4, '肯定与否定', 1000068);
INSERT INTO `kszx_stxx` VALUES (100297, 1, '米芾的山水画自成一家', 1000069);
INSERT INTO `kszx_stxx` VALUES (100298, 2, '东晋书法家王献之被称为“书圣”', 1000069);
INSERT INTO `kszx_stxx` VALUES (100299, 3, '围棋在我国古代被称为“弈”', 1000069);
INSERT INTO `kszx_stxx` VALUES (100300, 4, '“高山流水”讲的是琴师俞伯牙和樵夫钟子期的故事', 1000069);
INSERT INTO `kszx_stxx` VALUES (100301, 1, '牡丹——花魁', 1000070);
INSERT INTO `kszx_stxx` VALUES (100302, 2, '杜鹃——花中君子', 1000070);
INSERT INTO `kszx_stxx` VALUES (100303, 3, '月季——花中皇后', 1000070);
INSERT INTO `kszx_stxx` VALUES (100304, 4, '荷花——凌波仙子', 1000070);
INSERT INTO `kszx_stxx` VALUES (100305, 1, '温故而知新，可以为师矣', 1000071);
INSERT INTO `kszx_stxx` VALUES (100306, 2, '三人行，必有我师焉', 1000071);
INSERT INTO `kszx_stxx` VALUES (100307, 3, '小不忍则乱大谋', 1000071);
INSERT INTO `kszx_stxx` VALUES (100308, 4, '上善若水，水善利万物而不争', 1000071);
INSERT INTO `kszx_stxx` VALUES (100309, 1, '足癣和手癣', 1000072);
INSERT INTO `kszx_stxx` VALUES (100310, 2, '艾滋病', 1000072);
INSERT INTO `kszx_stxx` VALUES (100311, 3, '鸡瘟或猪瘟', 1000072);
INSERT INTO `kszx_stxx` VALUES (100312, 4, '非典', 1000072);
INSERT INTO `kszx_stxx` VALUES (100313, 1, '降低基准利率', 1000073);
INSERT INTO `kszx_stxx` VALUES (100314, 2, '扩大财政支出', 1000073);
INSERT INTO `kszx_stxx` VALUES (100315, 3, '提高存款准备金率', 1000073);
INSERT INTO `kszx_stxx` VALUES (100316, 4, '扩大财政赤字', 1000073);
INSERT INTO `kszx_stxx` VALUES (100317, 1, '徽剧', 1000074);
INSERT INTO `kszx_stxx` VALUES (100318, 2, '粤剧', 1000074);
INSERT INTO `kszx_stxx` VALUES (100319, 3, '京剧', 1000074);
INSERT INTO `kszx_stxx` VALUES (100320, 4, '越剧', 1000074);
INSERT INTO `kszx_stxx` VALUES (100321, 1, '《中共中央关于制定国民经济和社会发展第十一个五年规划的建议》', 1000075);
INSERT INTO `kszx_stxx` VALUES (100322, 2, '《中共中央关于制定国民经济和社会发展第十个五年规划的建议》', 1000075);
INSERT INTO `kszx_stxx` VALUES (100323, 3, '《中共中央关于制定国民经济和社会发展第十一个五年计划的建议》', 1000075);
INSERT INTO `kszx_stxx` VALUES (100324, 4, '《中共中央关于制定国民经济和社会发展第十个五年计划的建议》', 1000075);
INSERT INTO `kszx_stxx` VALUES (100325, 1, '通过电炉丝的电流强度比通过铜导线的电流强度大', 1000076);
INSERT INTO `kszx_stxx` VALUES (100326, 2, '铜导线的电阻小，所以消耗的电能少，电炉丝的电阻大，消耗的能量多，所以热得发红', 1000076);
INSERT INTO `kszx_stxx` VALUES (100327, 3, '铜导丝有绝缘层，所以不怎么热', 1000076);
INSERT INTO `kszx_stxx` VALUES (100328, 4, '铜导线比电阻丝传热快，所以不怎么热', 1000076);
INSERT INTO `kszx_stxx` VALUES (100329, 1, '民主国家的法律都是人民自己制定的', 1000077);
INSERT INTO `kszx_stxx` VALUES (100330, 2, '民主国家的法律是保护人民利益的法律', 1000077);
INSERT INTO `kszx_stxx` VALUES (100331, 3, '民主国家的法律保护法律制定者', 1000077);
INSERT INTO `kszx_stxx` VALUES (100332, 4, '民主国家的法律是人人享受平等的法律', 1000077);
COMMIT;

-- ----------------------------
-- Table structure for kszx_tmfl
-- ----------------------------
DROP TABLE IF EXISTS `kszx_tmfl`;
CREATE TABLE `kszx_tmfl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `children` tinyint(4) DEFAULT '0' COMMENT '是否含有子节点',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100043 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考试中心-题目分类';

-- ----------------------------
-- Records of kszx_tmfl
-- ----------------------------
BEGIN;
INSERT INTO `kszx_tmfl` VALUES (99999, '默认分类', 0, 0);
INSERT INTO `kszx_tmfl` VALUES (100038, '公务员考试', 0, 0);
INSERT INTO `kszx_tmfl` VALUES (100039, '言语理解与表达', 0, 100038);
INSERT INTO `kszx_tmfl` VALUES (100040, '常识判断', 0, 100038);
INSERT INTO `kszx_tmfl` VALUES (100041, '判读推理', 0, 100038);
INSERT INTO `kszx_tmfl` VALUES (100042, '资料分析', 0, 100038);
COMMIT;

-- ----------------------------
-- Table structure for kszx_yhda
-- ----------------------------
DROP TABLE IF EXISTS `kszx_yhda`;
CREATE TABLE `kszx_yhda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yhid` varchar(32) DEFAULT NULL COMMENT '用户id',
  `sjid` int(11) DEFAULT NULL COMMENT '试卷id',
  `stid` int(11) DEFAULT NULL COMMENT '试题id',
  `xsda` varchar(255) DEFAULT NULL COMMENT '学生答案',
  PRIMARY KEY (`id`),
  UNIQUE KEY `唯一` (`yhid`,`sjid`,`stid`) USING BTREE COMMENT '唯一键'
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kszx_yhda
-- ----------------------------
BEGIN;
INSERT INTO `kszx_yhda` VALUES (218, 'db154f465ff740df9dff311a34efd34d', 27, 1000060, 'C');
INSERT INTO `kszx_yhda` VALUES (219, 'db154f465ff740df9dff311a34efd34d', 27, 1000059, 'C');
INSERT INTO `kszx_yhda` VALUES (220, 'db154f465ff740df9dff311a34efd34d', 27, 1000066, 'C');
INSERT INTO `kszx_yhda` VALUES (221, 'db154f465ff740df9dff311a34efd34d', 27, 1000071, 'A');
INSERT INTO `kszx_yhda` VALUES (222, 'db154f465ff740df9dff311a34efd34d', 27, 1000037, 'A');
INSERT INTO `kszx_yhda` VALUES (223, 'db154f465ff740df9dff311a34efd34d', 27, 1000075, 'A');
INSERT INTO `kszx_yhda` VALUES (224, 'db154f465ff740df9dff311a34efd34d', 27, 1000062, 'A');
INSERT INTO `kszx_yhda` VALUES (225, 'db154f465ff740df9dff311a34efd34d', 27, 1000068, 'A');
INSERT INTO `kszx_yhda` VALUES (226, 'db154f465ff740df9dff311a34efd34d', 27, 1000074, 'A');
INSERT INTO `kszx_yhda` VALUES (227, 'db154f465ff740df9dff311a34efd34d', 27, 1000034, 'A');
INSERT INTO `kszx_yhda` VALUES (228, 'db154f465ff740df9dff311a34efd34d', 27, 1000065, 'A');
INSERT INTO `kszx_yhda` VALUES (229, 'db154f465ff740df9dff311a34efd34d', 27, 1000070, 'A');
INSERT INTO `kszx_yhda` VALUES (230, 'db154f465ff740df9dff311a34efd34d', 27, 1000036, 'D');
INSERT INTO `kszx_yhda` VALUES (231, 'db154f465ff740df9dff311a34efd34d', 27, 1000061, 'C');
INSERT INTO `kszx_yhda` VALUES (232, 'db154f465ff740df9dff311a34efd34d', 27, 1000058, 'B');
INSERT INTO `kszx_yhda` VALUES (233, 'db154f465ff740df9dff311a34efd34d', 27, 1000072, 'C');
INSERT INTO `kszx_yhda` VALUES (234, 'db154f465ff740df9dff311a34efd34d', 27, 1000069, 'C');
INSERT INTO `kszx_yhda` VALUES (235, 'db154f465ff740df9dff311a34efd34d', 27, 1000077, 'B');
INSERT INTO `kszx_yhda` VALUES (236, 'db154f465ff740df9dff311a34efd34d', 27, 1000067, 'C');
INSERT INTO `kszx_yhda` VALUES (237, 'db154f465ff740df9dff311a34efd34d', 27, 1000076, 'D');
INSERT INTO `kszx_yhda` VALUES (238, 'db154f465ff740df9dff311a34efd34d', 27, 1000035, 'B');
INSERT INTO `kszx_yhda` VALUES (239, 'db154f465ff740df9dff311a34efd34d', 27, 1000063, 'C');
INSERT INTO `kszx_yhda` VALUES (240, 'db154f465ff740df9dff311a34efd34d', 27, 1000064, 'B');
INSERT INTO `kszx_yhda` VALUES (241, 'db154f465ff740df9dff311a34efd34d', 27, 1000073, 'B');
INSERT INTO `kszx_yhda` VALUES (242, 'db154f465ff740df9dff311a34efd34d', 27, 1000033, 'C');
INSERT INTO `kszx_yhda` VALUES (243, 'db154f465ff740df9dff311a34efd34d', 27, 1000048, 'BC');
INSERT INTO `kszx_yhda` VALUES (244, 'db154f465ff740df9dff311a34efd34d', 29, 1000037, 'C');
INSERT INTO `kszx_yhda` VALUES (245, 'db154f465ff740df9dff311a34efd34d', 29, 1000036, 'A');
INSERT INTO `kszx_yhda` VALUES (246, 'db154f465ff740df9dff311a34efd34d', 29, 1000035, 'A');
INSERT INTO `kszx_yhda` VALUES (247, 'db154f465ff740df9dff311a34efd34d', 29, 1000033, 'B');
INSERT INTO `kszx_yhda` VALUES (248, 'db154f465ff740df9dff311a34efd34d', 29, 1000034, 'A');
INSERT INTO `kszx_yhda` VALUES (249, 'db154f465ff740df9dff311a34efd34d', 29, 1000039, 'ABC');
INSERT INTO `kszx_yhda` VALUES (250, 'db154f465ff740df9dff311a34efd34d', 29, 1000040, 'AB');
INSERT INTO `kszx_yhda` VALUES (251, 'db154f465ff740df9dff311a34efd34d', 29, 1000041, 'AB');
INSERT INTO `kszx_yhda` VALUES (252, 'db154f465ff740df9dff311a34efd34d', 29, 1000038, 'BC');
INSERT INTO `kszx_yhda` VALUES (253, 'db154f465ff740df9dff311a34efd34d', 29, 1000042, 'AB');
INSERT INTO `kszx_yhda` VALUES (254, 'db154f465ff740df9dff311a34efd34d', 33, 1000034, 'D');
INSERT INTO `kszx_yhda` VALUES (255, 'db154f465ff740df9dff311a34efd34d', 33, 1000036, 'B');
INSERT INTO `kszx_yhda` VALUES (256, 'db154f465ff740df9dff311a34efd34d', 33, 1000035, 'C');
INSERT INTO `kszx_yhda` VALUES (257, 'db154f465ff740df9dff311a34efd34d', 33, 1000033, 'C');
INSERT INTO `kszx_yhda` VALUES (258, 'db154f465ff740df9dff311a34efd34d', 33, 1000058, 'D');
INSERT INTO `kszx_yhda` VALUES (259, 'db154f465ff740df9dff311a34efd34d', 33, 1000037, 'B');
INSERT INTO `kszx_yhda` VALUES (260, '002', 27, 1000062, 'A');
INSERT INTO `kszx_yhda` VALUES (261, '002', 27, 1000036, 'A');
INSERT INTO `kszx_yhda` VALUES (262, '002', 27, 1000077, 'A');
INSERT INTO `kszx_yhda` VALUES (263, '002', 27, 1000066, 'A');
INSERT INTO `kszx_yhda` VALUES (264, '002', 27, 1000034, 'A');
INSERT INTO `kszx_yhda` VALUES (265, '002', 27, 1000037, 'A');
INSERT INTO `kszx_yhda` VALUES (266, '002', 27, 1000073, 'A');
INSERT INTO `kszx_yhda` VALUES (267, '002', 27, 1000061, 'A');
INSERT INTO `kszx_yhda` VALUES (268, '002', 27, 1000068, 'B');
INSERT INTO `kszx_yhda` VALUES (269, '002', 27, 1000058, 'A');
INSERT INTO `kszx_yhda` VALUES (270, '002', 27, 1000035, 'A');
INSERT INTO `kszx_yhda` VALUES (271, '002', 27, 1000067, 'C');
INSERT INTO `kszx_yhda` VALUES (272, '002', 27, 1000075, 'A');
INSERT INTO `kszx_yhda` VALUES (273, '002', 27, 1000060, 'A');
INSERT INTO `kszx_yhda` VALUES (274, '002', 27, 1000033, 'A');
INSERT INTO `kszx_yhda` VALUES (275, '002', 27, 1000069, 'A');
INSERT INTO `kszx_yhda` VALUES (276, '002', 27, 1000074, 'A');
INSERT INTO `kszx_yhda` VALUES (277, '002', 27, 1000063, 'B');
INSERT INTO `kszx_yhda` VALUES (278, '002', 27, 1000071, 'A');
INSERT INTO `kszx_yhda` VALUES (279, '002', 27, 1000065, 'A');
INSERT INTO `kszx_yhda` VALUES (280, '002', 27, 1000059, 'A');
INSERT INTO `kszx_yhda` VALUES (281, '002', 27, 1000070, 'A');
INSERT INTO `kszx_yhda` VALUES (282, '002', 27, 1000072, 'B');
INSERT INTO `kszx_yhda` VALUES (283, '002', 27, 1000064, 'A');
INSERT INTO `kszx_yhda` VALUES (284, '002', 27, 1000076, 'A');
INSERT INTO `kszx_yhda` VALUES (285, '002', 27, 1000049, 'AB');
INSERT INTO `kszx_yhda` VALUES (286, '002', 27, 1000055, 'AB');
INSERT INTO `kszx_yhda` VALUES (287, '002', 27, 1000038, 'AB');
INSERT INTO `kszx_yhda` VALUES (288, '002', 27, 1000042, 'AB');
INSERT INTO `kszx_yhda` VALUES (289, '002', 27, 1000044, 'AB');
INSERT INTO `kszx_yhda` VALUES (290, '002', 27, 1000054, 'AB');
INSERT INTO `kszx_yhda` VALUES (291, '002', 27, 1000051, 'AB');
INSERT INTO `kszx_yhda` VALUES (292, '002', 27, 1000052, 'AB');
INSERT INTO `kszx_yhda` VALUES (293, '002', 27, 1000053, 'AB');
INSERT INTO `kszx_yhda` VALUES (294, '002', 27, 1000050, 'AB');
INSERT INTO `kszx_yhda` VALUES (295, '002', 27, 1000057, 'AB');
INSERT INTO `kszx_yhda` VALUES (296, '002', 28, 1000064, 'A');
INSERT INTO `kszx_yhda` VALUES (297, '002', 28, 1000065, 'A');
INSERT INTO `kszx_yhda` VALUES (298, '002', 28, 1000074, 'A');
INSERT INTO `kszx_yhda` VALUES (299, '002', 28, 1000073, 'A');
INSERT INTO `kszx_yhda` VALUES (300, '002', 28, 1000034, 'A');
INSERT INTO `kszx_yhda` VALUES (301, '002', 28, 1000069, 'A');
INSERT INTO `kszx_yhda` VALUES (302, '002', 28, 1000062, 'A');
INSERT INTO `kszx_yhda` VALUES (303, '002', 28, 1000068, 'A');
INSERT INTO `kszx_yhda` VALUES (304, '002', 28, 1000075, 'A');
INSERT INTO `kszx_yhda` VALUES (305, '002', 28, 1000033, 'A');
INSERT INTO `kszx_yhda` VALUES (306, '002', 28, 1000071, 'A');
INSERT INTO `kszx_yhda` VALUES (307, '002', 28, 1000066, 'A');
INSERT INTO `kszx_yhda` VALUES (308, '002', 28, 1000067, 'A');
INSERT INTO `kszx_yhda` VALUES (309, '002', 28, 1000037, 'A');
INSERT INTO `kszx_yhda` VALUES (310, '002', 28, 1000035, 'A');
INSERT INTO `kszx_yhda` VALUES (311, '002', 28, 1000077, 'A');
INSERT INTO `kszx_yhda` VALUES (312, '002', 28, 1000036, 'A');
INSERT INTO `kszx_yhda` VALUES (313, '002', 28, 1000059, 'A');
INSERT INTO `kszx_yhda` VALUES (314, '002', 28, 1000070, 'A');
INSERT INTO `kszx_yhda` VALUES (315, '002', 28, 1000060, 'A');
INSERT INTO `kszx_yhda` VALUES (316, '002', 28, 1000072, 'A');
INSERT INTO `kszx_yhda` VALUES (317, '002', 28, 1000058, 'A');
INSERT INTO `kszx_yhda` VALUES (318, '002', 28, 1000061, 'A');
INSERT INTO `kszx_yhda` VALUES (319, '002', 28, 1000063, 'A');
INSERT INTO `kszx_yhda` VALUES (320, '002', 28, 1000076, 'A');
INSERT INTO `kszx_yhda` VALUES (321, '002', 28, 1000040, 'AB');
INSERT INTO `kszx_yhda` VALUES (322, 'db154f465ff740df9dff311a34efd34d', 34, 1000037, 'C');
INSERT INTO `kszx_yhda` VALUES (323, 'db154f465ff740df9dff311a34efd34d', 34, 1000075, 'B');
INSERT INTO `kszx_yhda` VALUES (324, 'db154f465ff740df9dff311a34efd34d', 34, 1000064, 'C');
INSERT INTO `kszx_yhda` VALUES (325, 'db154f465ff740df9dff311a34efd34d', 34, 1000039, 'BDEundefined');
INSERT INTO `kszx_yhda` VALUES (326, '002', 29, 1000035, 'C');
INSERT INTO `kszx_yhda` VALUES (327, '002', 29, 1000034, 'B');
INSERT INTO `kszx_yhda` VALUES (328, '002', 29, 1000036, 'C');
INSERT INTO `kszx_yhda` VALUES (329, '002', 29, 1000033, 'B');
INSERT INTO `kszx_yhda` VALUES (330, '002', 29, 1000037, 'B');
INSERT INTO `kszx_yhda` VALUES (331, '002', 29, 1000038, 'BC');
INSERT INTO `kszx_yhda` VALUES (332, '002', 29, 1000041, 'ABC');
INSERT INTO `kszx_yhda` VALUES (333, '002', 29, 1000042, 'BC');
INSERT INTO `kszx_yhda` VALUES (334, '002', 29, 1000039, 'BD');
INSERT INTO `kszx_yhda` VALUES (335, '002', 29, 1000040, 'BC');
COMMIT;

-- ----------------------------
-- Table structure for kszx_yhsj
-- ----------------------------
DROP TABLE IF EXISTS `kszx_yhsj`;
CREATE TABLE `kszx_yhsj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yhid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `sjid` int(11) DEFAULT NULL COMMENT '试卷ID',
  `st` text COMMENT '试题id列表用逗号隔开',
  `xscj` int(11) DEFAULT NULL COMMENT '学生成绩',
  `ksdjsj` datetime DEFAULT NULL COMMENT '开始答卷时间',
  `jsdjsj` datetime DEFAULT NULL COMMENT '结束答卷时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kszx_yhsj
-- ----------------------------
BEGIN;
INSERT INTO `kszx_yhsj` VALUES (84, 'db154f465ff740df9dff311a34efd34d', 27, '1000033,1000034,1000035,1000037,1000038,1000040,1000041,1000043,1000044,1000046,1000047,1000048,1000049,1000050,1000051,1000052,1000055,1000056,1000057,1000036,1000039,1000042,1000045,1000054,1000053,1000058,1000059,1000060,1000061,1000062,1000063,1000064,1000065,1000066,1000067,1000068,1000069,1000070,1000071,1000072,1000073,1000074,1000075,1000076,1000077', 6, '2018-12-24 20:44:06', '2018-12-24 22:24:06');
INSERT INTO `kszx_yhsj` VALUES (85, 'db154f465ff740df9dff311a34efd34d', 29, '1000033,1000034,1000035,1000037,1000038,1000040,1000041,1000036,1000039,1000042', 15, '2018-12-24 21:32:47', '2018-12-24 23:12:47');
INSERT INTO `kszx_yhsj` VALUES (86, 'db154f465ff740df9dff311a34efd34d', 28, '1000033,1000034,1000035,1000037,1000038,1000040,1000041,1000043,1000044,1000046,1000047,1000048,1000049,1000050,1000051,1000052,1000055,1000056,1000057,1000036,1000039,1000042,1000045,1000054,1000053,1000058,1000059,1000060,1000061,1000062,1000063,1000064,1000065,1000066,1000067,1000068,1000069,1000070,1000071,1000072,1000073,1000074,1000075,1000076,1000077', NULL, '2018-12-24 21:47:27', '2018-12-24 23:27:27');
INSERT INTO `kszx_yhsj` VALUES (87, 'db154f465ff740df9dff311a34efd34d', 31, '1000055,1000056,1000057,1000054,1000053,1000058,1000059,1000060,1000061,1000062', 10, '2018-12-25 09:12:09', '2018-12-25 10:52:09');
INSERT INTO `kszx_yhsj` VALUES (88, 'db154f465ff740df9dff311a34efd34d', 33, '1000033,1000034,1000035,1000037,1000038,1000040,1000041,1000036,1000039,1000042,1000058', 5, '2018-12-25 10:47:40', '2018-12-25 12:27:40');
INSERT INTO `kszx_yhsj` VALUES (89, '002', 27, '1000033,1000034,1000035,1000037,1000038,1000040,1000041,1000043,1000044,1000046,1000047,1000048,1000049,1000050,1000051,1000052,1000055,1000056,1000057,1000036,1000039,1000042,1000045,1000054,1000053,1000058,1000059,1000060,1000061,1000062,1000063,1000064,1000065,1000066,1000067,1000068,1000069,1000070,1000071,1000072,1000073,1000074,1000075,1000076,1000077', 10, '2018-12-25 14:46:48', '2018-12-25 16:26:48');
INSERT INTO `kszx_yhsj` VALUES (90, '508d53fd0a084a5dad5399e239369c97', 27, '1000033,1000034,1000035,1000037,1000038,1000040,1000041,1000043,1000044,1000046,1000047,1000048,1000049,1000050,1000051,1000052,1000055,1000056,1000057,1000036,1000039,1000042,1000045,1000054,1000053,1000058,1000059,1000060,1000061,1000062,1000063,1000064,1000065,1000066,1000067,1000068,1000069,1000070,1000071,1000072,1000073,1000074,1000075,1000076,1000077', NULL, '2018-12-25 14:47:17', '2018-12-25 16:27:17');
INSERT INTO `kszx_yhsj` VALUES (91, '002', 28, '1000033,1000034,1000035,1000037,1000038,1000040,1000041,1000043,1000044,1000046,1000047,1000048,1000049,1000050,1000051,1000052,1000055,1000056,1000057,1000036,1000039,1000042,1000045,1000054,1000053,1000058,1000059,1000060,1000061,1000062,1000063,1000064,1000065,1000066,1000067,1000068,1000069,1000070,1000071,1000072,1000073,1000074,1000075,1000076,1000077', 34, '2018-12-25 14:48:45', '2018-12-25 16:28:45');
INSERT INTO `kszx_yhsj` VALUES (92, 'db154f465ff740df9dff311a34efd34d', 34, '1000033,1000034,1000035,1000037,1000038,1000040,1000041,1000043,1000044,1000046,1000047,1000048,1000049,1000050,1000051,1000052,1000055,1000056,1000057,1000036,1000039,1000042,1000045,1000054,1000053,1000058,1000059,1000060,1000061,1000062,1000063,1000064,1000065,1000066,1000067,1000068,1000069,1000070,1000071,1000072,1000073,1000074,1000075,1000076,1000077', 12, '2018-12-25 16:17:22', '2018-12-25 17:57:22');
INSERT INTO `kszx_yhsj` VALUES (93, 'db154f465ff740df9dff311a34efd34d', 30, '1000043,1000044,1000046,1000047,1000048,1000049,1000050,1000051,1000052,1000045', NULL, '2018-12-25 16:46:04', '2018-12-25 18:26:04');
INSERT INTO `kszx_yhsj` VALUES (94, '508d53fd0a084a5dad5399e239369c97', 28, '1000033,1000034,1000035,1000037,1000038,1000040,1000041,1000043,1000044,1000046,1000047,1000048,1000049,1000050,1000051,1000052,1000055,1000056,1000057,1000036,1000039,1000042,1000045,1000054,1000053,1000058,1000059,1000060,1000061,1000062,1000063,1000064,1000065,1000066,1000067,1000068,1000069,1000070,1000071,1000072,1000073,1000074,1000075,1000076,1000077', 0, '2018-12-25 16:59:26', '2018-12-25 18:39:26');
INSERT INTO `kszx_yhsj` VALUES (95, '002', 29, '1000033,1000034,1000035,1000037,1000038,1000040,1000041,1000036,1000039,1000042', 24, '2019-01-08 09:31:40', '2019-01-08 11:11:40');
COMMIT;

-- ----------------------------
-- Table structure for lmb
-- ----------------------------
DROP TABLE IF EXISTS `lmb`;
CREATE TABLE `lmb` (
  `lm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `lm_mc` varchar(32) DEFAULT NULL COMMENT '栏目名称',
  `lm_fid` int(11) DEFAULT NULL COMMENT '栏目父id',
  `lm_ms` varchar(255) DEFAULT NULL COMMENT '栏目描述',
  `lm_xgsj` datetime DEFAULT NULL COMMENT '修改时间',
  `lm_mkdm` int(11) DEFAULT NULL,
  PRIMARY KEY (`lm_id`),
  KEY `lm_mk` (`lm_mkdm`),
  CONSTRAINT `lm_mk` FOREIGN KEY (`lm_mkdm`) REFERENCES `mkb` (`mk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of lmb
-- ----------------------------
BEGIN;
INSERT INTO `lmb` VALUES (1, '党建门户', 0, NULL, NULL, NULL);
INSERT INTO `lmb` VALUES (2, '党员教育', 0, '这还少党员教育的描述', '2018-07-29 15:32:09', 20411);
INSERT INTO `lmb` VALUES (3, '学习专题活动', 2, '这是学习专题活动的描述', '2018-07-29 17:24:55', 20411);
INSERT INTO `lmb` VALUES (4, '网络党校', 2, '这是网路党校的描述', '2018-08-26 16:10:09', 20411);
INSERT INTO `lmb` VALUES (5, '廉洁建设', 1, '这是廉洁建设的描述', '2018-07-29 17:26:31', 20411);
INSERT INTO `lmb` VALUES (6, '党员发展', 1, '这是党员发展的描述', '2018-07-29 17:26:54', 20411);
INSERT INTO `lmb` VALUES (7, '政策学习', 2, '这是政策学习的描述', '2018-08-04 16:04:07', 20411);
INSERT INTO `lmb` VALUES (8, '党建宣传', 1, '这是党建宣传的描述', '2018-07-31 15:52:23', 20411);
COMMIT;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` varchar(32) NOT NULL,
  `yhdm` varchar(32) DEFAULT NULL,
  `login_ip` varchar(32) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1添加2修改3删除4查询',
  `operation` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
BEGIN;
INSERT INTO `log` VALUES ('1f6bcab15cfb4fce95075319305afc99', '002', '0:0:0:0:0:0:0:1', 4, '用户授权', '2019-01-06 14:51:40', 'com.glut.dangjian.background.controller.system.UserController.authorityUser');
COMMIT;

-- ----------------------------
-- Table structure for mkb
-- ----------------------------
DROP TABLE IF EXISTS `mkb`;
CREATE TABLE `mkb` (
  `mk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块id',
  `mk_mc` varchar(64) DEFAULT NULL COMMENT 'mk名称',
  `mk_code` varchar(64) DEFAULT NULL,
  `mk_f_id` int(11) NOT NULL DEFAULT '0' COMMENT '模块父id',
  `mk_sfsccd` int(11) DEFAULT '1' COMMENT '是否成功菜单',
  `mk_px` int(11) DEFAULT '0' COMMENT '模块排序',
  `mk_url` varchar(255) DEFAULT NULL COMMENT '模块url',
  `mk_ms` varchar(255) DEFAULT NULL COMMENT '模块描述',
  `mk_icon` varchar(255) DEFAULT NULL COMMENT '模块图标',
  `mk_xgsj` datetime DEFAULT NULL,
  PRIMARY KEY (`mk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20609 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of mkb
-- ----------------------------
BEGIN;
INSERT INTO `mkb` VALUES (10006, '部门管理', 'dept', 0, 1, 0, NULL, NULL, NULL, '2018-08-23 09:06:01');
INSERT INTO `mkb` VALUES (10007, '党籍工作平台', 'part', 0, 1, 0, NULL, NULL, NULL, '2018-11-30 18:46:45');
INSERT INTO `mkb` VALUES (10010, '党员教育', 'education', 0, 1, 0, NULL, NULL, NULL, '2018-12-04 16:27:38');
INSERT INTO `mkb` VALUES (10011, '通知公告', 'notice', 0, 1, 0, NULL, NULL, NULL, '2018-08-23 09:04:03');
INSERT INTO `mkb` VALUES (10012, '新闻管理', 'news', 0, 1, 0, NULL, NULL, NULL, '2018-08-23 09:02:41');
INSERT INTO `mkb` VALUES (10014, '党建大数据', 'bigData', 0, 1, 0, NULL, NULL, NULL, '2018-08-23 09:06:44');
INSERT INTO `mkb` VALUES (10030, '系统管理', 'system', 0, 1, 0, NULL, NULL, NULL, '2018-08-23 09:04:56');
INSERT INTO `mkb` VALUES (10031, '审批管理', 'approval', 0, 1, 0, NULL, NULL, NULL, '2018-08-23 09:03:19');
INSERT INTO `mkb` VALUES (10032, '日志管理', 'log', 0, 1, NULL, '', NULL, NULL, '2018-12-04 16:27:35');
INSERT INTO `mkb` VALUES (20020, '部门荣誉', 'departmentHonor', 10006, 1, NULL, '/dangjian-controller/back/department/honor/toList', NULL, '../jsAndCss/themes/icons/reload.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20021, '部门维护', 'department', 10006, 1, NULL, '/dangjian-controller/back/department/toList', NULL, '../jsAndCss/themes/icons/man.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20022, '支部维护', 'branch', 10006, 1, NULL, '/dangjian-controller/back/branch/toList', NULL, '../jsAndCss/themes/icons/reload.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20023, '支部荣誉', 'branchHonor', 10006, 1, NULL, '/dangjian-controller/back/branch/honor/toList', NULL, '../jsAndCss/themes/icons/man.png', '2018-11-13 17:10:35');
INSERT INTO `mkb` VALUES (20039, '网络党校', 'video', 10010, 1, NULL, '/dangjian-controller/back/video/toList', NULL, '../jsAndCss/themes/icons/tip.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20040, '考试中心', 'exam', 10010, 1, NULL, NULL, NULL, NULL, '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20049, '党员数据', 'partUserData', 10014, 1, NULL, NULL, NULL, '../jsAndCss/themes/icons/sum.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20050, '党组织数据', 'partOrganic', 10014, 1, NULL, NULL, NULL, '../jsAndCss/themes/icons/sum.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20051, '组织活动数据', 'partActivity', 10014, 1, NULL, NULL, NULL, '../jsAndCss/themes/icons/sum.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20110, '用户管理', 'user', 10030, 1, NULL, NULL, NULL, NULL, '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20111, '用户信息', 'user-info', 20110, 1, NULL, '/dangjian-controller/back/user/toYhxx', NULL, '../jsAndCss/themes/icons/search.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20112, '用户信息修改', 'user-update', 20110, 1, NULL, '/dangjian-controller/back/user/toUpdateYhxx', NULL, '../jsAndCss/themes/icons/edit_add.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20120, '权限管理', 'authority', 10030, 1, NULL, NULL, NULL, NULL, '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20121, '角色管理', 'role', 20120, 1, NULL, '/dangjian-controller/back/role/toList', NULL, '../jsAndCss/themes/icons/lock.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20122, '功能权限管理', 'function', 20120, 1, NULL, '/dangjian-controller/back/function/toList', NULL, '../jsAndCss/themes/icons/lock.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20140, '图片管理', 'picture', 10030, 1, NULL, NULL, NULL, NULL, '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20141, '图片维护', 'pictureinfo', 20140, 1, NULL, '/dangjian-controller/back/news/picture/', NULL, '../jsAndCss/themes/icons/edit_remove.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20211, '全校通知管理', 'schoolNotice', 10011, 1, NULL, '/dangjian-controller/back/notice/school/toList', NULL, '../jsAndCss/themes/icons/tip.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20212, '部门通知管理', 'deptNotice', 10011, 1, NULL, '/dangjian-controller/back/notice/academy/toList', NULL, '../jsAndCss/themes/icons/tip.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20213, '支部通知管理', 'branchNotice', 10011, 1, NULL, '/dangjian-controller/back/notice/branch/toList', NULL, '../jsAndCss/themes/icons/tip.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20214, '个人通知管理', 'selfNotice', 10011, 1, NULL, '/dangjian-controller/back/notice/myself/toList', NULL, '../jsAndCss/themes/icons/edit_add.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20215, '通知类型管理', 'noticeType', 10011, 1, NULL, '/dangjian-controller/back/notice/range/toList', NULL, '../jsAndCss/themes/icons/lock.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20311, '审批项目列表', 'approvalProject', 10031, 1, NULL, '/dangjian-controller/back/approval/project/toList', NULL, '../jsAndCss/themes/icons/edit_add.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20312, '审批流程管理', 'approvalProcess', 10031, 1, NULL, '/dangjian-controller/back/approval/process/toList', NULL, '../jsAndCss/themes/icons/tip.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20313, '审批岗位管理', 'approvalJob', 10031, 1, NULL, '/dangjian-controller/back/approval/job/list', NULL, '../jsAndCss/themes/icons/tip.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20411, '新闻栏目管理', 'newsColumn', 10012, 1, NULL, '/dangjian-controller/newsProgramManage', NULL, '../jsAndCss/themes/icons/lock.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20412, '新闻文章管理', 'newsContent', 10012, 1, NULL, '/dangjian-controller/back/news/gotoNewList', NULL, '../jsAndCss/themes/icons/edit_add.png', '2018-08-23 09:00:20');
INSERT INTO `mkb` VALUES (20418, '用户列表', 'userList', 20110, 1, 1, '/dangjian-controller/back/user/toUserList', '这是用户列表', '../jsAndCss/themes/icons/more.png', '2018-08-24 21:26:17');
INSERT INTO `mkb` VALUES (20422, '题库管理', 'tkgl', 20040, 1, NULL, '/dangjian-controller/kszx/tkgl/', '题库管理', '../jsAndCss/themes/icons/print.png', '2018-11-19 17:29:16');
INSERT INTO `mkb` VALUES (20423, '试卷管理', 'sjgl', 20040, 1, NULL, '/dangjian-controller/kszx/sjgl/index', '试卷管理', '../jsAndCss/themes/icons/print.png', '2018-12-09 20:36:43');
INSERT INTO `mkb` VALUES (20501, '党籍管理', 'publicity', 10007, 1, 0, '/dangjian-controller/back/partyInfo/toList', NULL, '../jsAndCss/themes/icons/tip.png', '2018-11-30 18:50:05');
INSERT INTO `mkb` VALUES (20511, '日志信息', 'logInfo', 10032, 1, NULL, '/dangjian-controller/back/log/toList', NULL, '../jsAndCss/themes/icons/search.png', '2018-12-04 16:30:56');
INSERT INTO `mkb` VALUES (20512, '查询日志', 'log-search', 20511, 0, 1, '', '查询日志操作', NULL, '2018-12-05 15:00:28');
INSERT INTO `mkb` VALUES (20513, '删除日志', 'log-delete', 20511, 0, 2, '', '删除日志操作', NULL, '2018-12-05 15:01:18');
INSERT INTO `mkb` VALUES (20514, '审批项目删除', 'approvalProject-delete', 20311, 0, 1, '', '审批项目列表删除操作', NULL, '2018-12-05 15:06:29');
INSERT INTO `mkb` VALUES (20515, '审批项目查询', 'approvalProject-search', 20311, 0, 2, '', '审批项目删除操作', NULL, '2018-12-05 15:07:17');
INSERT INTO `mkb` VALUES (20516, '审批路程添加', 'approvalProcess-add', 20312, 0, 1, '', '审批路程添加操作', NULL, '2018-12-05 15:08:36');
INSERT INTO `mkb` VALUES (20517, '审批流程修改', 'approvalProcess-update', 20312, 0, 2, '', '审批流程修改操作', NULL, '2018-12-05 15:09:22');
INSERT INTO `mkb` VALUES (20518, '审批流程删除', 'approvalProcess-delete', 20312, 0, 3, '', '审批流程删除操作', NULL, '2018-12-05 15:10:06');
INSERT INTO `mkb` VALUES (20519, '查看审批节点', 'approvalProcess-searchNode', 20312, 0, 5, '', '查看审批节点操作', NULL, '2018-12-05 15:11:28');
INSERT INTO `mkb` VALUES (20520, '返回审批流程管理', 'approvaNode-return', 20312, 0, 1, '', '返回审批流程管理操作', NULL, '2018-12-05 15:13:23');
INSERT INTO `mkb` VALUES (20521, '添加审批节点', 'approvalNode-add', 20312, 0, 2, '', '添加审批节点操作', NULL, '2018-12-05 15:15:42');
INSERT INTO `mkb` VALUES (20522, '审批节点修改', 'approvalNode-update', 20312, 0, 3, '', '审批节点修改操作', NULL, '2018-12-05 15:16:29');
INSERT INTO `mkb` VALUES (20523, '审批接单删除', 'approvalNode-delete', 20312, 0, 4, '', '审批接单删除操作', NULL, '2018-12-05 15:17:03');
INSERT INTO `mkb` VALUES (20524, '审批节点调整', 'approvalNode-adjust', 20312, 0, 5, '', '审批节点调整操作', NULL, '2018-12-05 15:18:48');
INSERT INTO `mkb` VALUES (20525, '审批岗位添加', 'approvalJob-add', 20313, 0, 1, '', '审批岗位添加操作', NULL, '2018-12-05 15:19:55');
INSERT INTO `mkb` VALUES (20526, '审批岗位修改', 'approvalJob-update', 20313, 0, 2, '', '审批岗位修改操作', NULL, '2018-12-05 15:20:40');
INSERT INTO `mkb` VALUES (20527, '审批岗位删除', 'approvalJob-delete', 20313, 0, 3, '', '审批岗位删除操作', NULL, '2018-12-05 15:21:23');
INSERT INTO `mkb` VALUES (20528, '查看审批岗位人员', 'approvalJob-searchUser', 20313, 0, 4, '', '查看审批岗位人员操作', NULL, '2018-12-05 15:22:38');
INSERT INTO `mkb` VALUES (20529, '审批岗位人员添加', 'approvalUser-add', 20313, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20530, '审批岗位人员修改', 'approvalUser-update', 20313, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20531, '审批岗位人员删除', 'approvalUser-delete', 20313, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20532, '审批岗位人员查询', 'approvalUser-search', 20313, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20533, '审批岗位人员返回上一层', 'approvalUser-return', 20313, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20534, '用户添加', 'user-add', 20418, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20535, '用户修改', 'user-update', 20418, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20536, '用户删除', 'user-delete', 20418, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20537, '用户导入', 'user-import', 20418, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20538, '用户导出', 'user-export', 20418, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20539, '用户导出模板', 'user-exportTemplate', 20418, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20540, '用户查询', 'user-search', 20418, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20541, '用户授权', 'user-authority', 20418, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20542, '角色添加', 'role-add', 20121, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20543, '角色修改', 'role-update', 20121, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20544, '角色删除', 'role-delete', 20121, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20545, '角色查询', 'role-search', 20121, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20546, '模块添加', 'function-add', 20120, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20547, '模块修改', 'function-update', 20120, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20548, '模块删除', 'function-delete', 20120, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20549, '模块查询', 'function-search', 20120, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20550, '栏目添加', 'column-add', 20411, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20551, '栏目修改', 'column-update', 20411, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20552, '栏目删除', 'column-delete', 20411, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20553, '栏目查询', 'column-search', 20411, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20554, '新闻添加', 'news-add', 20412, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20555, '新闻修改', 'news-update', 20412, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20556, '新闻删除', 'news-delete', 20412, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20557, '新闻查询', 'news-search', 20412, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20558, '学校通知查询', 'schoolNotice-search', 20211, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20559, '学校通知修改', 'schoolNotice-update', 20211, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20560, '学校通知添加', 'schoolNotice-add', 20211, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20561, '学校通知删除', 'schoolNotice-delete', 20211, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20562, '部门通知添加', 'deptNotice-add', 20212, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20563, '部门通知修改', 'deptNotice-update', 20212, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20564, '部门通知删除', 'deptNotice-delete', 20212, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20565, '部门通知查询', 'deptNotice-search', 20212, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20566, '支部通知添加', 'branchNotice-add', 20213, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20567, '支部通知修改', 'branchNotice-update', 20213, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20568, '支部通知删除', 'branchNotice-delete', 20213, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20569, '支部通知查询', 'branchNotice-search', 20213, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20570, '个人通知查询', 'selfNotice-notice', 20214, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20571, '个人通知删除', 'selfNotice-delete', 20214, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20572, '网络党校添加', 'video-add', 20039, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20573, '网络党校修改', 'video-update', 20039, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20574, '网络党校删除', 'video-delete', 20039, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20575, '网络党校查询', 'video-search', 20039, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20576, '试题导入', 'exam-questions-import', 20422, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20577, '试题导入模板', 'exam-questions-importTemplate', 20422, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20578, '试题删除', 'exam-questions-delete', 20422, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20579, '试题添加', 'exam-questions-add', 20422, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20580, '试卷添加', 'exam-paper-add', 20423, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20581, '试卷修改', 'exam-paper-update', 20423, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20582, '试卷删除', 'exam-paper-delete', 20423, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20583, '试卷查询', 'exam-paper-search', 20423, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20584, '党籍添加', 'part-add', 20501, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20585, '党籍查询', 'part-search', 20501, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20586, '支部荣誉添加', 'branchHonor-add', 20023, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20587, '支部荣誉修改', 'branchHonor-update', 20023, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20588, '支部荣誉删除', 'branchHonor-delete', 20023, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20589, '支部荣誉查询', 'branchHonor-search', 20023, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20590, '支部添加', 'branch-add', 20022, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20591, '部门修改logo', 'dept-udpdate-logo', 20021, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20592, '部门删除', 'dept-delete', 20021, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20593, '部门修改', 'dept-update', 20021, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20594, '部门添加', 'dept-add', 20021, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20595, '部门荣誉查询', 'deptHonor-search', 20020, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20596, '部门荣誉删除', 'deptHonor-delete', 20020, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20597, '部门荣誉修改', 'deptHonor-update', 20020, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20598, '部门荣誉添加', 'deptHonor-add', 20020, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20599, '支部修改', 'branch-update', 20022, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20600, '支部删除', 'branch-delete', 20022, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20601, '支部查询', 'branch-search', 20022, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20602, '支部人员查询', 'branch-user-search', 20022, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20603, '通知类型添加', 'noticeType-add', 20214, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20604, '通知类型修改', 'noticeType-update', 20214, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20605, '通知类型删除', 'noticeType-delete', 20214, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20606, '通知类型查询', 'noticeType-search', 20214, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20607, '图片删除', 'picture-delete', 20141, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `mkb` VALUES (20608, '成绩管理', 'cjgl', 20040, 1, 1, '/dangjian-controller/kszx/cjgl/', '成绩管理', '', '2018-12-24 21:23:02');
COMMIT;

-- ----------------------------
-- Table structure for mzb
-- ----------------------------
DROP TABLE IF EXISTS `mzb`;
CREATE TABLE `mzb` (
  `mz_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '民族id',
  `mz_mc` varchar(32) DEFAULT NULL COMMENT '民族名称',
  PRIMARY KEY (`mz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COMMENT='民族表';

-- ----------------------------
-- Records of mzb
-- ----------------------------
BEGIN;
INSERT INTO `mzb` VALUES (101, '汉族');
INSERT INTO `mzb` VALUES (102, '蒙古族');
INSERT INTO `mzb` VALUES (103, '回族');
INSERT INTO `mzb` VALUES (104, '藏族');
INSERT INTO `mzb` VALUES (105, '维吾尔族');
INSERT INTO `mzb` VALUES (106, '苗族');
INSERT INTO `mzb` VALUES (107, '彝族');
INSERT INTO `mzb` VALUES (108, '壮族');
INSERT INTO `mzb` VALUES (109, '布依族');
INSERT INTO `mzb` VALUES (110, '朝鲜族');
INSERT INTO `mzb` VALUES (111, '满族');
INSERT INTO `mzb` VALUES (112, '侗族');
INSERT INTO `mzb` VALUES (113, '瑶族');
INSERT INTO `mzb` VALUES (114, '白族');
INSERT INTO `mzb` VALUES (115, '土家族');
INSERT INTO `mzb` VALUES (116, '哈尼族');
INSERT INTO `mzb` VALUES (117, '哈萨克族');
INSERT INTO `mzb` VALUES (118, '傣族');
INSERT INTO `mzb` VALUES (119, '黎族');
INSERT INTO `mzb` VALUES (120, '傈傈族');
INSERT INTO `mzb` VALUES (121, '佤族');
INSERT INTO `mzb` VALUES (122, '畲族');
INSERT INTO `mzb` VALUES (123, '高山族');
INSERT INTO `mzb` VALUES (124, '拉祜族');
INSERT INTO `mzb` VALUES (125, '水族');
INSERT INTO `mzb` VALUES (126, '东乡族');
INSERT INTO `mzb` VALUES (127, '纳西族');
INSERT INTO `mzb` VALUES (128, '景颇族');
INSERT INTO `mzb` VALUES (129, '柯尔族');
INSERT INTO `mzb` VALUES (130, '土族');
INSERT INTO `mzb` VALUES (131, '达斡尔族');
INSERT INTO `mzb` VALUES (132, '仫佬族');
INSERT INTO `mzb` VALUES (133, '羌族');
INSERT INTO `mzb` VALUES (134, '布朗族');
INSERT INTO `mzb` VALUES (135, '撒拉族');
INSERT INTO `mzb` VALUES (136, '毛难族');
INSERT INTO `mzb` VALUES (137, '仡佬族');
INSERT INTO `mzb` VALUES (138, '锡伯族');
INSERT INTO `mzb` VALUES (139, '阿昌族');
INSERT INTO `mzb` VALUES (140, '普米族');
INSERT INTO `mzb` VALUES (141, '塔吉克族');
INSERT INTO `mzb` VALUES (142, '怒族');
INSERT INTO `mzb` VALUES (143, '乌孜别克族');
INSERT INTO `mzb` VALUES (144, '俄罗斯族');
INSERT INTO `mzb` VALUES (145, '鄂温克族');
INSERT INTO `mzb` VALUES (146, '崩龙族');
INSERT INTO `mzb` VALUES (147, '保安族');
INSERT INTO `mzb` VALUES (148, '裕固族');
INSERT INTO `mzb` VALUES (149, '京族');
INSERT INTO `mzb` VALUES (150, '塔塔尔族');
INSERT INTO `mzb` VALUES (151, '独龙族');
INSERT INTO `mzb` VALUES (152, '鄂伦春族');
INSERT INTO `mzb` VALUES (153, '赫哲族');
INSERT INTO `mzb` VALUES (154, '门巴族');
INSERT INTO `mzb` VALUES (155, '珞巴族');
INSERT INTO `mzb` VALUES (156, '基诺族');
INSERT INTO `mzb` VALUES (197, '其他');
INSERT INTO `mzb` VALUES (198, '外国血统中国籍人士');
COMMIT;

-- ----------------------------
-- Table structure for qd_hyqdewmb
-- ----------------------------
DROP TABLE IF EXISTS `qd_hyqdewmb`;
CREATE TABLE `qd_hyqdewmb` (
  `hyqdewm_id` varchar(32) NOT NULL COMMENT '会议签到二维码表',
  `hyqdewm_hydm` varchar(32) NOT NULL COMMENT '会议表',
  `hyqdewm_ewmzf` varchar(32) DEFAULT NULL COMMENT '二维码字符串',
  `hyqdewm_sdsrq` varchar(6) NOT NULL COMMENT '手动输入二维码',
  PRIMARY KEY (`hyqdewm_id`),
  KEY `hyqdewm_hy` (`hyqdewm_hydm`),
  CONSTRAINT `hyqdewm_hy` FOREIGN KEY (`hyqdewm_hydm`) REFERENCES `hy_hyb` (`hy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议签到二维码';

-- ----------------------------
-- Table structure for qd_qdlbb
-- ----------------------------
DROP TABLE IF EXISTS `qd_qdlbb`;
CREATE TABLE `qd_qdlbb` (
  `qdlb_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '签到列表id',
  `qdlb_hydm` varchar(32) NOT NULL COMMENT '会议表',
  `qdlb_hyzt` varchar(255) DEFAULT NULL COMMENT '会议主题',
  PRIMARY KEY (`qdlb_id`),
  KEY `qdlb_hy` (`qdlb_hydm`),
  CONSTRAINT `qdlb_hy` FOREIGN KEY (`qdlb_hydm`) REFERENCES `hy_hyb` (`hy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议椅签到列表';

-- ----------------------------
-- Table structure for qd_yh_qdjlb
-- ----------------------------
DROP TABLE IF EXISTS `qd_yh_qdjlb`;
CREATE TABLE `qd_yh_qdjlb` (
  `qdjl_id` varchar(32) NOT NULL COMMENT '会议签到记录表id',
  `qdjl_hydm` varchar(32) NOT NULL COMMENT '签到会议',
  `qdjl_yhdm` varchar(32) NOT NULL COMMENT '签到用户',
  `qdjl_qdzt` int(11) DEFAULT NULL COMMENT '是否状态',
  `qdjl_hyewmdm` varchar(32) DEFAULT NULL COMMENT '会议签到二维码',
  PRIMARY KEY (`qdjl_id`),
  KEY `qdjl_yh` (`qdjl_yhdm`),
  KEY `qdjl_hy` (`qdjl_hydm`),
  KEY `qdjl_ewm` (`qdjl_hyewmdm`),
  CONSTRAINT `qdjl_ewm` FOREIGN KEY (`qdjl_hyewmdm`) REFERENCES `qd_hyqdewmb` (`hyqdewm_id`),
  CONSTRAINT `qdjl_hy` FOREIGN KEY (`qdjl_hydm`) REFERENCES `hy_hyb` (`hy_id`),
  CONSTRAINT `qdjl_yh` FOREIGN KEY (`qdjl_yhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议签到记录表';

-- ----------------------------
-- Table structure for qxb
-- ----------------------------
DROP TABLE IF EXISTS `qxb`;
CREATE TABLE `qxb` (
  `qx_id` int(11) NOT NULL COMMENT '角色表id',
  `qx_fid` int(11) NOT NULL COMMENT '功能表id',
  `qx_mc` varchar(255) DEFAULT NULL,
  `qx_code` varchar(255) DEFAULT NULL,
  `qx_ms` varchar(255) DEFAULT NULL,
  `qx_sfsccd` int(11) DEFAULT NULL,
  `qx_jb` int(11) DEFAULT NULL,
  `jsqx_dxzt` int(11) DEFAULT NULL COMMENT '读写状态',
  PRIMARY KEY (`qx_id`),
  KEY `jsqx_js` (`qx_id`),
  CONSTRAINT `jsqx_js` FOREIGN KEY (`qx_id`) REFERENCES `js_mk` (`mk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Table structure for rz_yhczrzb
-- ----------------------------
DROP TABLE IF EXISTS `rz_yhczrzb`;
CREATE TABLE `rz_yhczrzb` (
  `yhczrz_id` varchar(32) NOT NULL COMMENT '用户操作日志',
  `yhczrz_yhdm` varchar(32) NOT NULL COMMENT '用户表',
  `yhczrz_yhmc` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `yhczrz_bmdm` int(11) NOT NULL COMMENT '部门表',
  `yhczrz_cznr` text COMMENT '记录内容',
  `yhczrz_czdz` varchar(32) DEFAULT NULL COMMENT '操作地址',
  `yhczrz_czsj` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`yhczrz_id`),
  KEY `yhczrj_yh` (`yhczrz_yhdm`),
  KEY `yhczrj_bm` (`yhczrz_bmdm`),
  CONSTRAINT `yhczrj_bm` FOREIGN KEY (`yhczrz_bmdm`) REFERENCES `bmb` (`bm_id`),
  CONSTRAINT `yhczrj_yh` FOREIGN KEY (`yhczrz_yhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作日志';

-- ----------------------------
-- Table structure for rz_yhdlrzb
-- ----------------------------
DROP TABLE IF EXISTS `rz_yhdlrzb`;
CREATE TABLE `rz_yhdlrzb` (
  `yhdlrz_id` varchar(32) NOT NULL COMMENT '用户登录日志id',
  `yhdlrz_yhdm` varchar(32) NOT NULL COMMENT '用户表',
  `yhdlrz_yhmc` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `yhdlrz_bmdm` int(11) NOT NULL COMMENT '部门表',
  `yhdlrz_rznr` text COMMENT '日志内容',
  `yhdlrz_jlsj` datetime DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`yhdlrz_id`),
  KEY `yhdlrz_yh` (`yhdlrz_yhdm`),
  KEY `yhczrz_bm` (`yhdlrz_bmdm`),
  CONSTRAINT `yhczrz_bm` FOREIGN KEY (`yhdlrz_bmdm`) REFERENCES `bmb` (`bm_id`),
  CONSTRAINT `yhdlrz_yh` FOREIGN KEY (`yhdlrz_yhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录日志';

-- ----------------------------
-- Table structure for sp
-- ----------------------------
DROP TABLE IF EXISTS `sp`;
CREATE TABLE `sp` (
  `sp_id` varchar(32) NOT NULL COMMENT '视频id',
  `sp_mc` varchar(32) DEFAULT NULL COMMENT '视频名称',
  `sp_ms` varchar(32) DEFAULT NULL COMMENT '视频描述',
  `sp_scsj` datetime DEFAULT NULL COMMENT '视频上传时间',
  `sp_lj` varchar(255) DEFAULT NULL COMMENT '视频路径',
  `sp_xwwjdm` varchar(32) DEFAULT NULL COMMENT '所属的新闻文件表',
  `sp_scyhdm` varchar(32) DEFAULT NULL COMMENT '上传用户',
  `sp_slt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sp_id`),
  KEY `sp_xxwj` (`sp_xwwjdm`),
  CONSTRAINT `sp_xxwj` FOREIGN KEY (`sp_xwwjdm`) REFERENCES `xw_wjb` (`xwfj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频表';

-- ----------------------------
-- Records of sp
-- ----------------------------
BEGIN;
INSERT INTO `sp` VALUES ('844ffd8750764c43bd2a36738a265bda', '测试', '你好', '2019-01-08 11:11:14', 'upload\\images\\video\\/1b7fbde8e54d4b3497b70c4c75bf0e56.avi', NULL, 'admin', '/dangjian-controller/upload/images/video/slt/46c31f7c7d6c4f12ab740509e159ef42.jpg');
COMMIT;

-- ----------------------------
-- Table structure for sp_lcxmb
-- ----------------------------
DROP TABLE IF EXISTS `sp_lcxmb`;
CREATE TABLE `sp_lcxmb` (
  `lcxm_id` varchar(32) NOT NULL COMMENT '流程项目id',
  `lcxm_mc` varchar(64) NOT NULL COMMENT '流程项目名称',
  `lcxm_splcdm` int(11) DEFAULT NULL COMMENT '审批流程表',
  `lcxm_xmms` varchar(255) DEFAULT NULL COMMENT '项目描述',
  `lcxm_dqjddm` int(11) DEFAULT NULL COMMENT '当前审批节点表',
  `lcxm_dqspzt` int(11) DEFAULT '0' COMMENT '当前审批状态，（0代表未审批）',
  `lcxm_resulte` int(11) DEFAULT '0' COMMENT ' 审批结果:0代表为审批，1代表通过，2代表不通过',
  `lcxm_xgsj` datetime DEFAULT NULL COMMENT '修改时间',
  `lcxm_dxId` varchar(32) DEFAULT NULL COMMENT '需要提交的审批的对象id',
  PRIMARY KEY (`lcxm_id`),
  KEY `lcxm_splc` (`lcxm_splcdm`),
  KEY `lcxm_dqjd` (`lcxm_dqjddm`),
  CONSTRAINT `lcxm_dqjd` FOREIGN KEY (`lcxm_dqjddm`) REFERENCES `sp_spjdb` (`spjd_id`),
  CONSTRAINT `lcxm_splc` FOREIGN KEY (`lcxm_splcdm`) REFERENCES `sp_splcb` (`splc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程项目表';

-- ----------------------------
-- Table structure for sp_ryb
-- ----------------------------
DROP TABLE IF EXISTS `sp_ryb`;
CREATE TABLE `sp_ryb` (
  `spry_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '瀹℃壒浜哄憳id',
  `spry_yh` varchar(32) NOT NULL COMMENT '瀹℃壒浜哄憳',
  `spry_spgwdm` int(11) NOT NULL COMMENT '瀹℃壒宀椾綅',
  `spry_bmdm` int(11) NOT NULL,
  PRIMARY KEY (`spry_id`),
  KEY `spry_spgw` (`spry_spgwdm`),
  KEY `spry_yh` (`spry_yh`),
  KEY `spry_bm` (`spry_bmdm`),
  CONSTRAINT `spry_bm` FOREIGN KEY (`spry_bmdm`) REFERENCES `bmb` (`bm_id`),
  CONSTRAINT `spry_spgw` FOREIGN KEY (`spry_spgwdm`) REFERENCES `sp_spgwb` (`spgw_id`),
  CONSTRAINT `spry_yh` FOREIGN KEY (`spry_yh`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_ryb
-- ----------------------------
BEGIN;
INSERT INTO `sp_ryb` VALUES (21, '001', 7, 101);
INSERT INTO `sp_ryb` VALUES (22, '002', 7, 101);
INSERT INTO `sp_ryb` VALUES (28, '001', 10, 120);
INSERT INTO `sp_ryb` VALUES (29, '002', 10, 120);
INSERT INTO `sp_ryb` VALUES (31, '002', 9, 120);
INSERT INTO `sp_ryb` VALUES (34, '002', 1, 120);
INSERT INTO `sp_ryb` VALUES (35, '00a877119bca4eeea7fb0f7ddef48e6f', 2, 101);
INSERT INTO `sp_ryb` VALUES (36, '508d53fd0a084a5dad5399e239369c97', 8, 101);
INSERT INTO `sp_ryb` VALUES (37, '001', 1, 120);
INSERT INTO `sp_ryb` VALUES (38, '161532e2add14c1c8c6272134baaa150', 1, 101);
INSERT INTO `sp_ryb` VALUES (39, 'admin', 10, 101);
INSERT INTO `sp_ryb` VALUES (40, '508d53fd0a084a5dad5399e239369c97', 1, 101);
INSERT INTO `sp_ryb` VALUES (41, '508d53fd0a084a5dad5399e239369c97', 9, 101);
COMMIT;

-- ----------------------------
-- Table structure for sp_spgwb
-- ----------------------------
DROP TABLE IF EXISTS `sp_spgwb`;
CREATE TABLE `sp_spgwb` (
  `spgw_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spgw_spgwmc` varchar(255) DEFAULT NULL COMMENT '审批岗位名称',
  `spgw_lcdm` int(11) DEFAULT NULL,
  PRIMARY KEY (`spgw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='审批岗位表';

-- ----------------------------
-- Records of sp_spgwb
-- ----------------------------
BEGIN;
INSERT INTO `sp_spgwb` VALUES (1, '学工处组长', NULL);
INSERT INTO `sp_spgwb` VALUES (2, '学院党委副书记', NULL);
INSERT INTO `sp_spgwb` VALUES (7, '学院党委书记', NULL);
INSERT INTO `sp_spgwb` VALUES (8, '学院主管新闻的领导', NULL);
INSERT INTO `sp_spgwb` VALUES (9, '学院党委书记秘书', NULL);
INSERT INTO `sp_spgwb` VALUES (10, '文章编辑者', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sp_spjdb
-- ----------------------------
DROP TABLE IF EXISTS `sp_spjdb`;
CREATE TABLE `sp_spjdb` (
  `spjd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批节点id',
  `spjd_mc` varchar(32) NOT NULL COMMENT '节点名称',
  `spjd_lcdm` int(11) NOT NULL COMMENT '审批流程表',
  `spjd_dqspzt` int(11) DEFAULT '0' COMMENT '当前审批状态',
  `spjd_xyspjddm` int(11) DEFAULT '-1' COMMENT '下一审批节点代码（0表示最后一个节点）',
  `spjd_xyjdmc` varchar(64) DEFAULT NULL COMMENT '下一节点名称',
  `spjd_gwdm` int(11) NOT NULL COMMENT '审批岗位表',
  `spjd_isFirst` int(11) DEFAULT '0',
  PRIMARY KEY (`spjd_id`),
  KEY `spjd_lc` (`spjd_lcdm`),
  KEY `spjd_gw` (`spjd_gwdm`),
  CONSTRAINT `spjd_gw` FOREIGN KEY (`spjd_gwdm`) REFERENCES `sp_spgwb` (`spgw_id`),
  CONSTRAINT `spjd_lcxm` FOREIGN KEY (`spjd_lcdm`) REFERENCES `sp_splcb` (`splc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='审批节点表';

-- ----------------------------
-- Records of sp_spjdb
-- ----------------------------
BEGIN;
INSERT INTO `sp_spjdb` VALUES (2, '学院副书记', 7, 0, 0, '', 2, 0);
INSERT INTO `sp_spjdb` VALUES (3, '主管新闻领导审批', 7, 0, 2, '学院副书记', 8, 0);
INSERT INTO `sp_spjdb` VALUES (4, '学工处组长', 7, 0, 3, '主管新闻领导审批', 1, 1);
INSERT INTO `sp_spjdb` VALUES (35, '党籍审批', 11, 0, 0, '', 9, 1);
INSERT INTO `sp_spjdb` VALUES (70, '精选文章评论', 9, 0, 0, NULL, 10, 1);
COMMIT;

-- ----------------------------
-- Table structure for sp_splcb
-- ----------------------------
DROP TABLE IF EXISTS `sp_splcb`;
CREATE TABLE `sp_splcb` (
  `splc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批流程id',
  `splc_mc` varchar(64) NOT NULL COMMENT '审批流程名称',
  `splc_state` int(11) DEFAULT '0' COMMENT '0代表没有启动，1代表已经启动',
  `splc_ywdm` varchar(32) DEFAULT NULL COMMENT '业务代码',
  PRIMARY KEY (`splc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='审批流程表';

-- ----------------------------
-- Records of sp_splcb
-- ----------------------------
BEGIN;
INSERT INTO `sp_splcb` VALUES (7, '新闻审批', 1, NULL);
INSERT INTO `sp_splcb` VALUES (8, '考试审批', 1, NULL);
INSERT INTO `sp_splcb` VALUES (9, '新闻评论精选审批', 1, NULL);
INSERT INTO `sp_splcb` VALUES (11, '党籍信息审批', 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tz_fw
-- ----------------------------
DROP TABLE IF EXISTS `tz_fw`;
CREATE TABLE `tz_fw` (
  `tzfw_id` int(11) NOT NULL AUTO_INCREMENT,
  `tzfw_mc` varchar(32) NOT NULL,
  PRIMARY KEY (`tzfw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='通知l表';

-- ----------------------------
-- Records of tz_fw
-- ----------------------------
BEGIN;
INSERT INTO `tz_fw` VALUES (1, '个人通知');
INSERT INTO `tz_fw` VALUES (2, '全校师生');
INSERT INTO `tz_fw` VALUES (3, '学院全体师生');
INSERT INTO `tz_fw` VALUES (4, '支部全体党员');
COMMIT;

-- ----------------------------
-- Table structure for tz_jyxjb
-- ----------------------------
DROP TABLE IF EXISTS `tz_jyxjb`;
CREATE TABLE `tz_jyxjb` (
  `jyxj_id` varchar(32) NOT NULL COMMENT '建言献计id',
  `jyxj_yhmc` varchar(32) DEFAULT NULL COMMENT '献计人名称',
  `jyxj_yhdm` varchar(32) NOT NULL COMMENT '用户表',
  `jyxj_nr` text COMMENT '建言献计内容',
  `jyxj_sj` datetime DEFAULT NULL COMMENT '建言献计时间',
  `jyxj_sfyd` int(11) DEFAULT NULL COMMENT '是否已读',
  PRIMARY KEY (`jyxj_id`),
  KEY `jyxj_yh` (`jyxj_yhdm`),
  CONSTRAINT `jyxj_yh` FOREIGN KEY (`jyxj_yhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='建言献计表';

-- ----------------------------
-- Table structure for tz_tzb
-- ----------------------------
DROP TABLE IF EXISTS `tz_tzb`;
CREATE TABLE `tz_tzb` (
  `tz_id` varchar(32) NOT NULL COMMENT '通知表id',
  `tz_bt` varchar(255) NOT NULL COMMENT '通知标题',
  `tz_nr` varchar(255) DEFAULT NULL COMMENT '通知内容',
  `tz_fbsj` datetime DEFAULT NULL COMMENT '发布时间',
  `tz_fbrdm` varchar(32) NOT NULL COMMENT '发布人（用户代码）',
  `tz_fbrmc` varchar(32) DEFAULT NULL COMMENT '发布通知人名称',
  `tz_jssj` datetime DEFAULT NULL COMMENT '通知结束时间',
  `tz_fwdm` int(11) NOT NULL COMMENT '通知范围',
  `tz_yxj` int(11) DEFAULT '0' COMMENT '通知优先级',
  `tz_spId` varchar(32) DEFAULT NULL COMMENT '审批id',
  PRIMARY KEY (`tz_id`),
  KEY `tz_fw` (`tz_fwdm`),
  KEY `tz_yh` (`tz_fbrdm`),
  CONSTRAINT `tz_fw` FOREIGN KEY (`tz_fwdm`) REFERENCES `tz_fw` (`tzfw_id`),
  CONSTRAINT `tz_yh` FOREIGN KEY (`tz_fbrdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Table structure for tz_tzdxb
-- ----------------------------
DROP TABLE IF EXISTS `tz_tzdxb`;
CREATE TABLE `tz_tzdxb` (
  `tzdx_id` varchar(32) NOT NULL COMMENT '通知对象id',
  `tzdx_tzdm` varchar(32) NOT NULL COMMENT '通知表',
  `tzdx_btzyhdm` varchar(32) DEFAULT NULL COMMENT '被通知用户',
  `tzdx_sfyd` int(11) DEFAULT '0' COMMENT '是否已读',
  `tzdx_ydsj` datetime DEFAULT NULL COMMENT '阅读时间',
  `tzdx_bmdm` int(11) DEFAULT NULL COMMENT '部门代码',
  `tzdx_zbdm` int(11) DEFAULT NULL COMMENT '支部代码',
  PRIMARY KEY (`tzdx_id`),
  KEY `tzrylb_tz` (`tzdx_tzdm`),
  KEY `tzrylb_yh` (`tzdx_btzyhdm`),
  KEY `tzdx_bm` (`tzdx_bmdm`),
  KEY `tzdx_zb` (`tzdx_zbdm`),
  CONSTRAINT `tzdx_bm` FOREIGN KEY (`tzdx_bmdm`) REFERENCES `bmb` (`bm_id`),
  CONSTRAINT `tzdx_zb` FOREIGN KEY (`tzdx_zbdm`) REFERENCES `zbb` (`zb_id`),
  CONSTRAINT `tzrylb_tz` FOREIGN KEY (`tzdx_tzdm`) REFERENCES `tz_tzb` (`tz_id`),
  CONSTRAINT `tzrylb_yh` FOREIGN KEY (`tzdx_btzyhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='被通知用户表';

-- ----------------------------
-- Table structure for xlb
-- ----------------------------
DROP TABLE IF EXISTS `xlb`;
CREATE TABLE `xlb` (
  `xl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学历id',
  `xl_mc` varchar(32) DEFAULT NULL COMMENT '学历名称',
  PRIMARY KEY (`xl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='学历表';

-- ----------------------------
-- Records of xlb
-- ----------------------------
BEGIN;
INSERT INTO `xlb` VALUES (11, '博士');
INSERT INTO `xlb` VALUES (14, '研究生');
INSERT INTO `xlb` VALUES (21, '本科');
INSERT INTO `xlb` VALUES (31, '大专');
INSERT INTO `xlb` VALUES (41, '中专');
INSERT INTO `xlb` VALUES (44, '高中');
INSERT INTO `xlb` VALUES (71, '初中');
INSERT INTO `xlb` VALUES (90, '其他');
COMMIT;

-- ----------------------------
-- Table structure for xw_dzb
-- ----------------------------
DROP TABLE IF EXISTS `xw_dzb`;
CREATE TABLE `xw_dzb` (
  `dz_id` varchar(32) NOT NULL COMMENT '点赞表id',
  `dz_xwdm` varchar(32) NOT NULL COMMENT '新闻表id',
  `dz_yhdm` varchar(32) NOT NULL COMMENT '用户表id',
  PRIMARY KEY (`dz_id`),
  KEY `dz_xw` (`dz_xwdm`),
  KEY `dz_yh` (`dz_yhdm`),
  CONSTRAINT `dz_xw` FOREIGN KEY (`dz_xwdm`) REFERENCES `xwb` (`xw_id`),
  CONSTRAINT `dz_yh` FOREIGN KEY (`dz_yhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻点赞表';

-- ----------------------------
-- Records of xw_dzb
-- ----------------------------
BEGIN;
INSERT INTO `xw_dzb` VALUES ('93cda72e4429419aa041fb88cc4bfb3e', 'dadbea7a136a4b3e820c9841716fbd39', '002');
COMMIT;

-- ----------------------------
-- Table structure for xw_fjb
-- ----------------------------
DROP TABLE IF EXISTS `xw_fjb`;
CREATE TABLE `xw_fjb` (
  `xwfj_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻附加id',
  `xwfj_xwdm` varchar(32) NOT NULL COMMENT '新闻表',
  `xwfj_wjdm` varchar(32) NOT NULL COMMENT '新闻文件表',
  PRIMARY KEY (`xwfj_id`),
  KEY `xwfj_xw` (`xwfj_xwdm`),
  KEY `xwfj_wj` (`xwfj_wjdm`),
  CONSTRAINT `xwfj_wj` FOREIGN KEY (`xwfj_wjdm`) REFERENCES `xw_wjb` (`xwfj_id`),
  CONSTRAINT `xwfj_xw` FOREIGN KEY (`xwfj_xwdm`) REFERENCES `xwb` (`xw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻附加表';

-- ----------------------------
-- Table structure for xw_hf_dz
-- ----------------------------
DROP TABLE IF EXISTS `xw_hf_dz`;
CREATE TABLE `xw_hf_dz` (
  `hf_id` varchar(32) NOT NULL,
  `hfdm` varchar(32) NOT NULL,
  `hf_yhdm` varchar(32) NOT NULL,
  PRIMARY KEY (`hf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='回复点赞';

-- ----------------------------
-- Table structure for xw_pl_hf
-- ----------------------------
DROP TABLE IF EXISTS `xw_pl_hf`;
CREATE TABLE `xw_pl_hf` (
  `id` varchar(32) NOT NULL COMMENT '评论回复id',
  `pldm` varchar(32) NOT NULL COMMENT '评论表代码',
  `reply_id` varchar(32) DEFAULT NULL COMMENT '回复目标id',
  `reply_type` int(11) DEFAULT NULL COMMENT '1表示回复pl表，2表示回复的回复',
  `nr` varchar(1024) DEFAULT NULL,
  `hf_yhdm` varchar(32) DEFAULT NULL COMMENT '回复用户id',
  `mb_yh_id` varchar(32) DEFAULT NULL COMMENT '目标用户id',
  `sj` datetime DEFAULT NULL COMMENT '回复时间',
  `flag` int(11) DEFAULT NULL COMMENT '评论标识：1标识显示，2标识软删除不显示或者是禁止',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xw_plb
-- ----------------------------
DROP TABLE IF EXISTS `xw_plb`;
CREATE TABLE `xw_plb` (
  `id` varchar(32) NOT NULL COMMENT '新闻评论id',
  `xwdm` varchar(32) NOT NULL COMMENT '评论新闻表',
  `zw` varchar(255) DEFAULT NULL COMMENT '评论正文',
  `sj` datetime DEFAULT NULL COMMENT '评论时间',
  `yhdm` varchar(32) NOT NULL COMMENT '用户表',
  `flag` int(11) DEFAULT '0' COMMENT '评论标识：0标识没有审批，1表示已经审批',
  PRIMARY KEY (`id`),
  KEY `pl_xw` (`xwdm`),
  KEY `pl_yh` (`yhdm`),
  CONSTRAINT `pl_xw` FOREIGN KEY (`xwdm`) REFERENCES `xwb` (`xw_id`),
  CONSTRAINT `pl_yh` FOREIGN KEY (`yhdm`) REFERENCES `yhb` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻评论表';

-- ----------------------------
-- Records of xw_plb
-- ----------------------------
BEGIN;
INSERT INTO `xw_plb` VALUES ('260ba6c1b11b48a785c9cb5b22b9cfb7', '1b1ad7ae917149288b2baf8f6060a1f8', '123123123123', '2019-01-07 21:09:50', '002', 0);
INSERT INTO `xw_plb` VALUES ('5dff85739b8d478d9c4de16bd85bb16c', '1b1ad7ae917149288b2baf8f6060a1f8', 'asdasdasdasd', '2019-01-07 21:09:43', '002', 0);
INSERT INTO `xw_plb` VALUES ('763b801e60184a659b85e7760b4ddccc', '1b1ad7ae917149288b2baf8f6060a1f8', 'asda阿斯顿阿斯顿阿三', '2019-01-08 10:34:02', '002', 0);
INSERT INTO `xw_plb` VALUES ('77a7e6b48ae64921b0d5f737bd7a2b1e', '1b1ad7ae917149288b2baf8f6060a1f8', 'asdasd', '2019-01-06 22:08:19', '002', 1);
INSERT INTO `xw_plb` VALUES ('94da213685184cda9f388868f1c413f1', 'dadbea7a136a4b3e820c9841716fbd39', 'jjjvdv', '2019-01-08 09:33:09', '002', 0);
INSERT INTO `xw_plb` VALUES ('9c52564c24ea4d8eb0a0bbfa8fd59185', '2b42af5513ce4629bfcdd8f2f3785ca1', 'hhhhh', '2019-01-06 20:52:31', '002', 1);
INSERT INTO `xw_plb` VALUES ('a5366513a9a84beb89e90749cc9f0238', 'd004bc7eb748450cb3feefbeae4d8b06', '社会人啊你', '2019-01-07 20:52:28', '002', 0);
INSERT INTO `xw_plb` VALUES ('b0c433de778e48d3abce937bcd61a4c6', 'dadbea7a136a4b3e820c9841716fbd39', 'jjjvdv', '2019-01-08 09:33:05', '002', 0);
INSERT INTO `xw_plb` VALUES ('b85afacea636450283a01f5d3c47a277', '1b1ad7ae917149288b2baf8f6060a1f8', '哈哈哈', '2019-01-08 10:32:15', 'admin', 0);
INSERT INTO `xw_plb` VALUES ('bf067428160b4f9792dad7d4dda062a3', '1b1ad7ae917149288b2baf8f6060a1f8', 'kjashdkjash', '2019-01-07 20:52:13', '002', 0);
COMMIT;

-- ----------------------------
-- Table structure for xw_pldzb
-- ----------------------------
DROP TABLE IF EXISTS `xw_pldzb`;
CREATE TABLE `xw_pldzb` (
  `pldz_id` varchar(32) NOT NULL COMMENT '评论id',
  `pldz_pldm` varchar(32) NOT NULL COMMENT '评论表',
  `pldz_yhdm` varchar(32) NOT NULL COMMENT '用户表',
  PRIMARY KEY (`pldz_id`),
  KEY `pldz_pl` (`pldz_pldm`),
  KEY `pldz_yh` (`pldz_yhdm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻评论表';

-- ----------------------------
-- Records of xw_pldzb
-- ----------------------------
BEGIN;
INSERT INTO `xw_pldzb` VALUES ('3d5216546274425a98a17fd7b46d074e', 'b85afacea636450283a01f5d3c47a277', '0');
INSERT INTO `xw_pldzb` VALUES ('599cee7bf063413f9b5c99d8f3b00e55', '763b801e60184a659b85e7760b4ddccc', '0');
COMMIT;

-- ----------------------------
-- Table structure for xw_qtwjb
-- ----------------------------
DROP TABLE IF EXISTS `xw_qtwjb`;
CREATE TABLE `xw_qtwjb` (
  `jqwj_id` varchar(32) NOT NULL COMMENT '其他文件id',
  `jqwj_sjmc` varchar(32) DEFAULT NULL COMMENT '其他文件实际名称',
  `jqwj_xsmc` varchar(32) DEFAULT NULL COMMENT '其他文件显示名称',
  `jqwj_xdlj` varchar(255) DEFAULT NULL COMMENT '其他文件相对路径',
  `jqwj_lmdm` int(11) DEFAULT NULL COMMENT '所属栏目',
  `jqwj_jdlj` varchar(255) DEFAULT NULL COMMENT '其他文件绝对路径',
  `jqwj_xwdm` varchar(32) DEFAULT NULL COMMENT '所属的新闻文件表',
  PRIMARY KEY (`jqwj_id`),
  KEY `jqwj_xwwj` (`jqwj_xwdm`),
  KEY `jqwj_lm` (`jqwj_lmdm`),
  CONSTRAINT `jqwj_lm` FOREIGN KEY (`jqwj_lmdm`) REFERENCES `lmb` (`lm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其他文件';

-- ----------------------------
-- Records of xw_qtwjb
-- ----------------------------
BEGIN;
INSERT INTO `xw_qtwjb` VALUES ('05a82b8333604aaf99a483aff85556ce', '徐兰孔.docx', '20190106105446_741.docx', '/dangjian-controller/upload/images/news/file/20190106/20190106105446_741.docx', 5, 'E:\\application\\Java框架\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\dangjian-controller\\upload\\images\\news\\file/20190106/20190106105446_741.docx', 'de7c484e94a04728a89efa7d75288116');
COMMIT;

-- ----------------------------
-- Table structure for xw_tpb
-- ----------------------------
DROP TABLE IF EXISTS `xw_tpb`;
CREATE TABLE `xw_tpb` (
  `tp_id` varchar(32) NOT NULL COMMENT '图片id',
  `tp_sjmc` varchar(255) DEFAULT NULL COMMENT '图片实际名称',
  `tp_xsmc` varchar(255) DEFAULT NULL COMMENT '图片显示名称',
  `tp_xdlj` varchar(255) DEFAULT NULL COMMENT '图片相对路径',
  `tp_lmdm` int(11) DEFAULT NULL,
  `tp_jdlj` varchar(255) DEFAULT NULL COMMENT '图片绝对路径',
  `tp_xwdm` varchar(32) DEFAULT NULL COMMENT '所属的新闻文件表',
  PRIMARY KEY (`tp_id`),
  KEY `tp_xwwj` (`tp_xwdm`),
  KEY `tp_lm` (`tp_lmdm`),
  CONSTRAINT `tp_lm` FOREIGN KEY (`tp_lmdm`) REFERENCES `lmb` (`lm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of xw_tpb
-- ----------------------------
BEGIN;
INSERT INTO `xw_tpb` VALUES ('30d0b901b918453ba6d2e83413dfd3b4', NULL, NULL, '/dangjian-controller/upload/images/news/e2c263a5080a4f48b0a44d90ce21dd5b.jpg', NULL, NULL, NULL);
INSERT INTO `xw_tpb` VALUES ('3867c58112864318b6a332f9e062cb1a', NULL, NULL, '/dangjian-controller/upload/images/video/slt/055f7ff89bdc48809cec91876cb353bf.png', NULL, NULL, NULL);
INSERT INTO `xw_tpb` VALUES ('393912b00f624417a3c8e549355c15b5', 'IMG_2913.jpg', '20190106105401_421.jpg', '/dangjian-controller/upload/images/news/image/20190106/20190106105401_421.jpg', 5, 'E:\\application\\Java框架\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\dangjian-controller\\upload\\images\\news\\image/20190106/20190106105401_421.jpg', 'de7c484e94a04728a89efa7d75288116');
INSERT INTO `xw_tpb` VALUES ('516bfd781e074e778eebd50a5bf8bef3', 'IMG_2974.jpg', '20190106105302_487.jpg', '/dangjian-controller/upload/images/news/image/20190106/20190106105302_487.jpg', 5, 'E:\\application\\Java框架\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\dangjian-controller\\upload\\images\\news\\image/20190106/20190106105302_487.jpg', 'dadbea7a136a4b3e820c9841716fbd39');
INSERT INTO `xw_tpb` VALUES ('6a660342ffe14f25b1ffe3847ad12271', NULL, NULL, '/dangjian-controller/upload/images/news/5308a0bd18984024a9274dab14888f84.jpg', NULL, NULL, NULL);
INSERT INTO `xw_tpb` VALUES ('7b6ad84b6d824ddaad971b2d1a21e842', NULL, NULL, '/dangjian-controller/upload/images/news/d1f4cdf76ee3478c8f4e08f0bde0805f.jpg', 5, NULL, 'df3fc77c710e47cf8be52a990ec339e1');
INSERT INTO `xw_tpb` VALUES ('c911b0debc3c4bdaaf95abda15a4b6d6', NULL, NULL, '/dangjian-controller/upload/images/news/57d9c0016b29408d8ccdb2acae811c65.jpg', 5, NULL, '7769e324ff734bf5885817fa6d0e1cc8');
INSERT INTO `xw_tpb` VALUES ('cb77bb2566784f9587b7d680f5006ad4', NULL, NULL, '/dangjian-controller/upload/images/video/slt/f35e0c20e3674749862d8929ae256ab9.png', NULL, NULL, NULL);
INSERT INTO `xw_tpb` VALUES ('e081825662d24b20a965a5c8d8c21fdf', 'IMG_2970.jpg', '20190108103735_725.jpg', '/dangjian-controller/upload/images/news/image/20190108/20190108103735_725.jpg', 5, 'E:\\application\\Java框架\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\dangjian-controller\\upload\\images\\news\\image/20190108/20190108103735_725.jpg', NULL);
INSERT INTO `xw_tpb` VALUES ('f1cba2a6ea0f41dc993efa98d3b050a8', NULL, NULL, '/dangjian-controller/upload/images/video/slt/46c31f7c7d6c4f12ab740509e159ef42.jpg', NULL, NULL, '844ffd8750764c43bd2a36738a265bda');
INSERT INTO `xw_tpb` VALUES ('f9a8784af0c04a9ea6d66bf38a2821db', 'IMG_2977.jpg', '20190106105418_807.jpg', '/dangjian-controller/upload/images/news/image/20190106/20190106105418_807.jpg', 5, 'E:\\application\\Java框架\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\dangjian-controller\\upload\\images\\news\\image/20190106/20190106105418_807.jpg', 'de7c484e94a04728a89efa7d75288116');
COMMIT;

-- ----------------------------
-- Table structure for xw_wjb
-- ----------------------------
DROP TABLE IF EXISTS `xw_wjb`;
CREATE TABLE `xw_wjb` (
  `xwfj_id` varchar(32) NOT NULL COMMENT '文件id',
  `xwfj_gndm` int(11) NOT NULL COMMENT '功能表',
  `xwfj_mkdm` int(11) NOT NULL COMMENT '模块表',
  PRIMARY KEY (`xwfj_id`),
  KEY `wj_gn` (`xwfj_gndm`),
  KEY `wj_mk` (`xwfj_mkdm`),
  CONSTRAINT `wj_gn` FOREIGN KEY (`xwfj_gndm`) REFERENCES `gnb` (`gn_id`),
  CONSTRAINT `wj_mk` FOREIGN KEY (`xwfj_mkdm`) REFERENCES `mkb` (`mk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Table structure for xw_ztb
-- ----------------------------
DROP TABLE IF EXISTS `xw_ztb`;
CREATE TABLE `xw_ztb` (
  `xwzt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻状态id',
  `xwzt_mc` varchar(32) DEFAULT NULL COMMENT '新闻状态名称',
  PRIMARY KEY (`xwzt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='新闻状态表';

-- ----------------------------
-- Records of xw_ztb
-- ----------------------------
BEGIN;
INSERT INTO `xw_ztb` VALUES (1, '未编辑完成');
INSERT INTO `xw_ztb` VALUES (2, '审核中');
INSERT INTO `xw_ztb` VALUES (3, '已发布');
INSERT INTO `xw_ztb` VALUES (4, '审批不通过');
COMMIT;

-- ----------------------------
-- Table structure for xwb
-- ----------------------------
DROP TABLE IF EXISTS `xwb`;
CREATE TABLE `xwb` (
  `xw_id` varchar(32) NOT NULL COMMENT '新闻id',
  `xw_bt` varchar(64) DEFAULT NULL COMMENT '新闻标题',
  `xw_fbrdm` varchar(32) NOT NULL COMMENT '发布人—用户id',
  `xw_fbsj` datetime DEFAULT NULL COMMENT '发布时间',
  `xw_zw` blob COMMENT '新闻html代码',
  `xw_ydrs` int(11) DEFAULT NULL COMMENT '阅读人数',
  `xw_xwztdm` int(11) NOT NULL DEFAULT '1' COMMENT '发布状态',
  `xw_yhm` varchar(32) DEFAULT NULL COMMENT '发布人名称',
  `xw_bmdm` int(11) NOT NULL COMMENT '部门表',
  `xw_bmmc` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `xw_xgsj` datetime DEFAULT NULL COMMENT '新闻修改时间',
  `xw_lmdm` int(11) NOT NULL COMMENT '栏目id',
  `xw_sfpl` int(11) DEFAULT '1' COMMENT '是否评论',
  `xw_yxj` int(11) DEFAULT '0' COMMENT '优先级',
  `xw_slt` varchar(255) DEFAULT NULL COMMENT '新闻缩略图',
  `xw_splc` int(11) DEFAULT NULL COMMENT '审批类型',
  PRIMARY KEY (`xw_id`),
  KEY `xw_yh` (`xw_fbrdm`),
  KEY `xw_zt` (`xw_xwztdm`),
  KEY `xw_bm` (`xw_bmdm`),
  KEY `xwb_lmdm` (`xw_lmdm`),
  CONSTRAINT `xw_bm` FOREIGN KEY (`xw_bmdm`) REFERENCES `bmb` (`bm_id`),
  CONSTRAINT `xw_yh` FOREIGN KEY (`xw_fbrdm`) REFERENCES `yhb` (`user_id`),
  CONSTRAINT `xw_zt` FOREIGN KEY (`xw_xwztdm`) REFERENCES `xw_ztb` (`xwzt_id`),
  CONSTRAINT `xwb_lm` FOREIGN KEY (`xw_lmdm`) REFERENCES `lmb` (`lm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of xwb
-- ----------------------------
BEGIN;
INSERT INTO `xwb` VALUES ('1b1ad7ae917149288b2baf8f6060a1f8', '学校副厅级调研员张劲松检查元旦期间学生安全稳定工作情况', '508d53fd0a084a5dad5399e239369c97', '2019-01-06 22:03:56', 0x3C70207374796C653D22666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB913B636F6C6F723A233333333333333B666F6E742D73697A653A313470783B6261636B67726F756E642D636F6C6F723A234646464646463B223E0D0A093C7370616E207374796C653D22666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB912C202671756F743B666F6E742D73697A653A313670783B223E266E6273703B20266E6273703B20266E6273703B20E4B8BAE6B7B1E585A5E890BDE5AE9EE5ADA6E6A0A1E58187E69C9FE5AE89E585A8E7A8B3E5AE9AE5B7A5E4BD9CE79BB8E585B3E983A8E7BDB2E5928CE8A681E6B182EFBC8CE7A1AEE4BF9DE58583E697A6E69C9FE997B4E6A0A1E59BADE5AE89E585A8E7A8B3E5AE9AEFBC8C3132E69C883331E4B88BE58D88EFBC8CE5ADA6E6A0A1E589AFE58E85E7BAA7E8B083E7A094E59198E5BCA0E58AB2E69DBEE59CA8E5ADA6E5B7A5E983A8EFBC88E5A484EFBC89E38081E6A0A1E59BA2E5A794E7AD89E79BB8E585B3E983A8E997A8E8B49FE8B4A3E4BABAE999AAE5908CE4B88BE6B7B1E585A5E59084E4BA8CE7BAA7E5ADA6E999A2E5928CE5ADA6E7949FE5AEBFE8888DEFBC8CE6A380E69FA5E68C87E5AFBCE5AE89E585A8E7A8B3E5AE9AE5B7A5E4BD9CEFBC8CE59091E59D9AE5AE88E4B880E7BABFE79A84E5ADA6E5B7A5E7B3BBE7BB9FE580BCE78FADE4BABAE59198E38081E79599E6A0A1E5ADA6E7949FE98081E4B88AE88A82E697A5E79A84E7A59DE7A68FE4B88EE997AEE58099E380823C2F7370616E3E0D0A3C2F703E0D0A3C70207374796C653D22666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB913B636F6C6F723A233333333333333B666F6E742D73697A653A313470783B6261636B67726F756E642D636F6C6F723A234646464646463B223E0D0A093C7370616E207374796C653D22666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB912C202671756F743B666F6E742D73697A653A313670783B223E26656D73703B26656D73703BE5BCA0E58AB2E69DBEE589AFE58E85E7BAA7E8B083E7A094E59198E4B880E8A18CE9A696E58588E69DA5E588B0E99B81E5B1B1E5ADA6E7949FE5AEBFE8888DE7BB84E59BA2E58CBAEFBC8CE79C8BE69C9BE5ADA6E7949FEFBC8CE8AFA6E7BB86E4BA86E8A7A3E5ADA6E7949FE5ADA6E4B9A0E7949FE6B4BBE68385E586B5E380823C7370616E3EE59CA8E6A380E69FA5E8B5B0E8AEBFE8BF87E7A88BE4B8ADEFBC8CE5BCA0E58AB2E69DBEE589AFE58E85E7BAA7E8B083E7A094E59198E58588E5908EE588B0E79086E5ADA6E999A2E38081E69CBAE6A2B0E4B88EE68EA7E588B6E5B7A5E7A88BE5ADA6E999A2E38081E78EAFE5A283E7A791E5ADA6E4B88EE5B7A5E7A88BE5ADA6E999A2EFBC8CE8AFA6E7BB86E4BA86E8A7A3E4BA8CE7BAA7E5ADA6E999A2E58187E69C9FE580BCE78FADE5AE89E68E92EFBC8CE78EB0E59CBAE6A380E69FA5E5ADA6E5B7A5E4BABAE59198E5B8A6E78FADE580BCE78FADE38081E58187E69C9FE5AE89E585A8E7A8B3E5AE9AE5B7A5E4BD9CE983A8E7BDB2E4BBA5E58F8AE890BDE5AE9EE68385E586B5EFBC8CE590ACE58F96E4BA86E5ADA6E999A2E580BCE78FADE4BABAE59198E79A84E5AE89E585A8E7A8B3E5AE9AE5B7A5E4BD9CE68385E586B5E6B187E68AA5EFBC8CE5B0B1E58187E69C9FE580BCE78FADE5B8A6E78FADE38081E79599E6A0A1E5ADA6E7949FE7AEA1E79086E7AD89E5B7A5E4BD9CE5819AE587BAE4BA86E585B7E4BD93E68C87E5AFBCEFBC8CE68F90E587BAE4BA86E6988EE7A1AEE8A681E6B182E38082E4BB96E5BCBAE8B083EFBC8CE59084E5ADA6E999A2E8A681E4B8A5E6A0BCE689A7E8A18CE580BCE78FADE5B8A6E78FADE588B6E5BAA6EFBC8CE697B6E588BBE7BBB7E7B4A7E5AE89E585A8E7A8B3E5AE9AE8BF99E6A0B9E5BCA6EFBC8CE58887E5AE9EE58AA0E5BCBAE5ADA6E6A0A1E88A82E58187E697A5E69C9FE997B4E59084E9A1B9E69C8DE58AA1E4BF9DE99A9CE5B7A5E4BD9CEFBC9BE8A681E7A1AEE4BF9DE4BABAE59198E59CA8E5B297E38081E8B4A3E4BBBBE588B0E4BD8DEFBC8CE69E84E7AD91E5ADA6E6A0A1E5AE89E585A8E4BF9DE99A9CE59D9AE5AE9EE998B2E7BABFEFBC9BE8A681E7A7AFE69E81E890A5E980A0E5928CE8B090E69C89E5BA8FE79A84E6A0A1E59BADE6B09BE59BB4EFBC8CE7A1AEE4BF9DE5908CE5ADA6E4BBACE59CA8E5ADA6E6A0A1E5BAA6E8BF87E4B880E4B8AAE6ACA2E4B990E7A5A5E5928CE79A84E58583E697A6E58187E69C9FE380823C2F7370616E3E3C2F7370616E3E0D0A3C2F703E, 11, 3, '小乔', 101, '信息科学与工程学院学生第一党支部', '2019-01-06 21:25:40', 5, 1, 0, '', 7);
INSERT INTO `xwb` VALUES ('2b42af5513ce4629bfcdd8f2f3785ca1', '12123123123123', '002', NULL, 0xE4BC81E9B985E5A794E5B188E5A794E5B188E5A794E5B188E4BF84E4BC81E9B985E4BC81E9B985E4BC81E9B985, 3, 3, '黎世东', 120, '旅游学院学生第三党支部', '2019-01-06 15:58:25', 5, 1, 0, '', 7);
INSERT INTO `xwb` VALUES ('363f12e9a71e4bcaa3bab9fbf224bec2', '打死你', 'admin', NULL, 0xE68993E4B88DE6ADBBE4BDA0E5958A3C6272202F3E, 1, 3, 'admin', 101, '信息科学与工程学院学生第一党支部', '2019-01-06 10:52:19', 5, 1, 1, '/dangjian-controller/upload/images/news/b909464bb62b499988c2da8f331e5f2d.jpg', 7);
INSERT INTO `xwb` VALUES ('6a74243686fe411fa3b778fcd0901838', '学校党委副书记、副校长吴志强到理学院调研', '508d53fd0a084a5dad5399e239369c97', '2019-01-07 20:35:30', 0x3C7370616E207374796C653D22636F6C6F723A233333333333333B666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB912C202671756F743B6261636B67726F756E642D636F6C6F723A234646464646463B223E266E6273703B20266E6273703B20266E6273703B20E8BF91E697A5EFBC8CE5ADA6E6A0A1E5859AE5A794E589AFE4B9A6E8AEB0E38081E589AFE6A0A1E995BFE590B4E5BF97E5BCBAE588B0E79086E5ADA6E999A2E8B083E7A094EFBC8CE79086E5ADA6E999A2E585A8E4BD93E9A286E5AFBCE78FADE5AD90E68890E59198E999AAE5908CE8B083E7A094E380823C2F7370616E3E3C6272202F3E0D0A3C7370616E207374796C653D22636F6C6F723A233333333333333B666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB912C202671756F743B6261636B67726F756E642D636F6C6F723A234646464646463B223E26656D73703B26656D73703BE590B4E5BF97E5BCBAE589AFE4B9A6E8AEB0E38081E589AFE6A0A1E995BFE69DA5E588B0E79086E5ADA6E999A2E58A9EE585ACE5AEA4E38081E69599E7A094E5AEA4E38081E5AE9EE9AA8CE5AEA4E38081E8BE85E5AFBCE59198E5B7A5E4BD9CE5AEA4E5928CE5ADA6E7949FE5B7A5E4BD9CE5AEA4E7AD89E5B7A5E4BD9CE59CBAE68980EFBC8CE4B88EE5ADA6E999A2E69599E8818CE59198E5B7A5E5928CE5ADA6E7949FE4BBACE4BAB2E58887E4BAA4E6B581EFBC8CE58585E58886E4BA86E8A7A3E68385E586B5E38082E5AE9EE59CB0E8B5B0E8AEBFE5908EEFBC8CE590B4E5BF97E5BCBAE589AFE4B9A6E8AEB0E38081E589AFE6A0A1E995BFE4B88EE79086E5ADA6E999A2E9A286E5AFBCE78FADE5AD90E8BF9BE8A18CE4BA86E5BAA7E8B088E38082E79086E5ADA6E999A2E9A286E5AFBCE78FADE5AD90E5AFB9E5ADA6E999A2E5859AE5BBBAE38081E6809DE683B3E694BFE6B2BBE5928CE6848FE8AF86E5BDA2E68081E5B7A5E4BD9CEFBC8CE8BF91E5B9B4E69DA5E69CACE7A791E5928CE7A094E7A9B6E7949FE69599E882B2E69599E5ADA6E5B7A5E4BD9CEFBC8CE4BBA5E58F8AE7A791E7A094E38081E5ADA6E7A791E5BBBAE8AEBEE7AD89E696B9E99DA2E58F96E5BE97E79A84E68890E7BBA9E5928CE58F91E5B195E8BF87E7A88BE4B8ADE5AD98E59CA8E79A84E59BB0E99ABEE4BD9CE4BA86E6B187E68AA5E380823C2F7370616E3E3C6272202F3E0D0A3C7370616E207374796C653D22636F6C6F723A233333333333333B666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB912C202671756F743B6261636B67726F756E642D636F6C6F723A234646464646463B223E26656D73703B26656D73703BE590B4E5BF97E5BCBAE589AFE4B9A6E8AEB0E38081E589AFE6A0A1E995BFE8AEA4E79C9FE590ACE58F96E4BA86E6B187E68AA5EFBC8CE5AFB9E5ADA6E999A2E58F96E5BE97E79A84E68890E7BBA9E7BB99E4BA88E4BA86E58585E58886E79A84E882AFE5AE9AE38082E5B9B6E5AFB9E79086E5ADA6E999A2E4BB8AE5908EE79A84E5B7A5E4BD9CE68F90E587BAE4BA86E4B889E782B9E8A681E6B182EFBC8CE4B880E698AFE8A681E58AA0E5BCBAE5859AE79A84E9A286E5AFBCEFBC8CE68A93E5A5BDE59FBAE5B182E5859AE7BB84E7BB87E5BBBAE8AEBEEFBC8CE68A8AE5859AE5BBBAE5928CE6848FE8AF86E5BDA2E68081E7AD89E5B7A5E4BD9CE5819AE5AE9EE5819AE7BB86EFBC9BE4BA8CE698AFE8A681E4BBA5E58AA0E5BCBAE5B888E8B584E9989FE4BC8DE5BBBAE8AEBEE4B8BAE68A93E6898BEFBC8CE5BCBAE58C96E5ADA6E7A791E5BBBAE8AEBEEFBC8CE5819AE5A5BDE69599E5ADA6E38081E7A791E7A094E5B7A5E4BD9CEFBC9BE4B889E698AFE59D9AE68C81E4BBA5E7AB8BE5BEB7E6A091E4BABAE4B8BAE6A0B9E69CACEFBC8CE58AAAE58A9BE68F90E9AB98E69CACE7A791E5928CE7A094E7A9B6E7949FE69599E882B2E69599E5ADA6E6B0B4E5B9B3EFBC8CE4B88DE696ADE68EA8E8BF9BE4BABAE6898DE59FB9E585BBE8B4A8E9878FE5868DE4B88AE696B0E58FB0E998B6E380823C2F7370616E3E, 0, 3, '小乔', 101, '信息科学与工程学院学生第一党支部', '2019-01-06 21:24:28', 5, 1, 0, '', 7);
INSERT INTO `xwb` VALUES ('7769e324ff734bf5885817fa6d0e1cc8', '牛逼牛逼', 'admin', NULL, 0xE7899BE597A8E7899BE597A8E7899BE597A8E7899BE597A8E7899BE597A8E7899BE597A8, 0, 2, 'admin', 101, '信息科学与工程学院学生第一党支部', '2019-01-08 10:44:30', 5, 1, 0, '/dangjian-controller/upload/images/news/57d9c0016b29408d8ccdb2acae811c65.jpg', 7);
INSERT INTO `xwb` VALUES ('80f71127f9894ab1979969b550eeeb5f', '我校连续第六年荣获全国大学生志愿服务西部计划“优秀等次项目办”称号', '508d53fd0a084a5dad5399e239369c97', NULL, 0x3C70207374796C653D22666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB913B636F6C6F723A233333333333333B666F6E742D73697A653A313470783B6261636B67726F756E642D636F6C6F723A234646464646463B223E0D0A093C7370616E207374796C653D22666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB912C202671756F743B666F6E742D73697A653A313670783B223E266E6273703B20266E6273703B20266E6273703B20E697A5E5898DEFBC8C32303137EFBC8D32303138E5B9B4E5BAA6E8A5BFE983A8E8AEA1E58892E7BBA9E69588E88083E6A0B8E8AF84E98089E4BC98E7A780E7AD89E6ACA1E69C8DE58AA1E58EBFE5928CE9AB98E6A0A1E9A1B9E79BAEE58A9EE5908DE58D95E68FADE69993E38082E68891E6A0A1E9A1B9E79BAEE58A9EE8A2ABE8AF84E4B8BAE585A8E59BBDE5A4A7E5ADA6E7949FE5BF97E684BFE69C8DE58AA1E8A5BFE983A8E8AEA1E58892E4BC98E7A780E9AB98E6A0A1E9A1B9E79BAEE58A9EEFBC8CE8BF99E698AFE68891E6A0A1E887AA32303133E5B9B4E4BBA5E69DA5E8BF9EE7BBADE7ACACE585ADE5B9B4E88EB7E6ADA4E8A1A8E5BDB0E380823C2F7370616E3E0D0A3C2F703E0D0A3C70207374796C653D22666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB913B636F6C6F723A233333333333333B666F6E742D73697A653A313470783B6261636B67726F756E642D636F6C6F723A234646464646463B223E0D0A093C7370616E207374796C653D22666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB912C202671756F743B666F6E742D73697A653A313670783B223E26656D73703B26656D73703BE4BB8AE5B9B4EFBC8CE887AAE68891E6A0A1E590AFE58AA8E8A5BFE983A8E8AEA1E58892E5BF97E684BFE88085E68B9BE58B9FE5B7A5E4BD9CE4BBA5E69DA5EFBC8CE68B9BE58B9FE98089E68B94E8A784E6A8A1E68C81E7BBADE8B5B0E9AB98EFBC8CE68AA5E5908DE4BABAE695B0333530E4BABAE38082E7BB8FE8BF87E4B8A5E6A0BCE79A84E7AC94E8AF95E38081E99DA2E8AF95E38081E7BBBCE59088E88083E5AF9FE7AD89E78EAFE88A82EFBC8CE69C80E7BB88E7A1AEE5AE9A3237E5908DE5908CE5ADA6E4B8BAE68891E6A0A132303138E5B9B4E5A4A7E5ADA6E7949FE5BF97E684BFE69C8DE58AA1E8A5BFE983A8E8AEA1E58892E5BF97E684BFE88085EFBC8CE585B6E4B8AD34E5908DE4B8BAE7A094E7A9B6E7949FE694AFE69599E59BA2EFBC8CE8A5BFE983A8E8AEA1E58892E5BF97E684BFE88085E68AA5E5908DE4BABAE695B0E5928CE585A5E98089E5908DE9A29DE59D87E4B8BAE5B9BFE8A5BFE9AB98E6A0A1E5898DE58897E380823C2F7370616E3E0D0A3C2F703E0D0A3C70207374796C653D22666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB913B636F6C6F723A233333333333333B666F6E742D73697A653A313470783B6261636B67726F756E642D636F6C6F723A234646464646463B223E0D0A093C7370616E207374796C653D22666F6E742D66616D696C793AE5BEAEE8BDAFE99B85E9BB912C202671756F743B666F6E742D73697A653A313670783B223E26656D73703B26656D73703BE4B880E79BB4E4BBA5E69DA5EFBC8CE68891E6A0A1E8A5BFE983A8E8AEA1E58892E9A1B9E79BAEE58A9EE7A7AFE69E81E5938DE5BA94E585A8E59BBDE9A1B9E79BAEE58A9EE38081E887AAE6B2BBE58CBAE9A1B9E79BAEE58A9EE79A84E58FB7E58FACEFBC8CE5A4A7E58A9BE694AFE68C81E5A4A7E5ADA6E7949FE5BF97E684BFE69C8DE58AA1E8A5BFE983A8E8AEA1E58892E5B7A5E4BD9CEFBC8CE9BC93E58AB1E5A4A7E5ADA6E7949FE588B0E8A5BFE983A8E58EBBEFBC8CE588B0E7A596E59BBDE69C80E99C80E8A681E79A84E59CB0E696B9E58EBBEFBC8CE4B8BAE8A5BFE983A8E8AEA1E58892E5B7A5E4BD9CE68F90E4BE9BE4BA86E5A4A7E9878FE79A84E4BC98E7A780E5BF97E684BFE88085E38082E688AAE887B3E79BAEE5898DEFBC8CE68891E6A0A1E585B1E98089E6B4BEE4BA86313830E5908DE6AF95E4B89AE7949FE5A594E8B5B4E696B0E79686E38081E8A5BFE8978FE38081E5B9BFE8A5BFE7AD89E59CB0E5BC80E5B195E4B8BAE69C9F31E887B333E5B9B4E79A84E5BF97E684BFE69C8DE58AA1E6B4BBE58AA8EFBC8CE5BF97E684BFE88085E4BBACE6898EE6A0B9E8A5BFE983A8EFBC8CE6B7B1E585A5E59FBAE5B182EFBC8CE5BC80E5B195E4BA86E2809CE5BEAEE5B09820E689ACE6A2A6E2809DE585B3E788B1E79599E5AE88E584BFE7ABA5E5BF97E684BFE69C8DE58AA1E8AEA1E58892E38081E2809CE59BADE6B181E59BADE591B3E2809DE585ACE79B8AE689B6E8B4ABE9A1B9E79BAEE38081E7BAA2E9A286E5B7BEE58AA9E5ADA6E68EA5E58A9BE9A1B9E79BAEE38081E6BC82E6B581E793B6E585B1E8AFBBE8AEA1E58892E38081E79599E5AE88E584BFE7ABA5E5AE88E68AA4E8AEA1E58892E7AD89E4B880E7B3BBE58897E5BF97E684BFE69C8DE58AA1E59381E7898CE9A1B9E79BAEE380823C2F7370616E3E0D0A3C2F703E, 0, 2, '小乔', 101, '信息科学与工程学院学生第一党支部', '2019-01-06 21:25:05', 5, 1, 0, '', 7);
INSERT INTO `xwb` VALUES ('d004bc7eb748450cb3feefbeae4d8b06', '社会人', 'admin', NULL, 0xE4BDA0E5A5BDE58E89E5AEB3E5958A3C6272202F3E, 0, 3, 'admin', 101, '信息科学与工程学院学生第一党支部', '2019-01-06 10:52:37', 5, 1, 1, '/dangjian-controller/upload/images/news/b909464bb62b499988c2da8f331e5f2d.jpg', 7);
INSERT INTO `xwb` VALUES ('dadbea7a136a4b3e820c9841716fbd39', '你很秀', 'admin', NULL, 0x3C703E0D0A09E5BE88E7A780E5BE88E7A7800D0A3C2F703E0D0A3C703E0D0A093C696D67207372633D222F64616E676A69616E2D636F6E74726F6C6C65722F75706C6F61642F696D616765732F6E6577732F696D6167652F32303139303130362F32303139303130363130353330325F3438372E6A70672220616C743D2222207469746C653D22222077696474683D2233303022206865696768743D223435302220616C69676E3D2222202F3E0D0A3C2F703E0D0A3C703E0D0A093C6272202F3E0D0A3C2F703E, 3, 3, 'admin', 101, '信息科学与工程学院学生第一党支部', '2019-01-06 10:53:31', 5, 1, 1, '/dangjian-controller/upload/images/news/b909464bb62b499988c2da8f331e5f2d.jpg', 7);
INSERT INTO `xwb` VALUES ('de7c484e94a04728a89efa7d75288116', '修起来', 'admin', NULL, 0x3C703E0D0A09E5BE88E7A780E5BE88E7A78075E4B880E6A0B70D0A3C2F703E0D0A3C703E0D0A093C6272202F3E0D0A3C2F703E0D0A3C703E0D0A093C6272202F3E0D0A3C2F703E0D0A3C703E0D0A093C696D67207372633D222F64616E676A69616E2D636F6E74726F6C6C65722F75706C6F61642F696D616765732F6E6577732F696D6167652F32303139303130362F32303139303130363130353430315F3432312E6A70672220616C743D2222207469746C653D22222077696474683D2233353022206865696768743D223233332220616C69676E3D2222202F3E200D0A3C2F703E0D0A3C703E0D0A093C696D67207372633D222F64616E676A69616E2D636F6E74726F6C6C65722F75706C6F61642F696D616765732F6E6577732F696D6167652F32303139303130362F32303139303130363130353431385F3830372E6A70672220616C743D2222207469746C653D22222077696474683D2232353022206865696768743D223337352220616C69676E3D2222202F3E200D0A3C2F703E0D0A3C703E0D0A093C6272202F3E0D0A3C2F703E0D0A3C703E0D0A093C6120636C6173733D226B652D696E7365727466696C652220687265663D222F64616E676A69616E2D636F6E74726F6C6C65722F75706C6F61642F696D616765732F6E6577732F66696C652F32303139303130362F32303139303130363130353434365F3734312E646F637822207461726765743D225F626C616E6B223EE5B086E59BBDE99985E58C963C2F613E200D0A3C2F703E0D0A3C703E0D0A093C6272202F3E0D0A3C2F703E0D0A3C703E0D0A093C6272202F3E0D0A3C2F703E, 2, 3, 'admin', 101, '信息科学与工程学院学生第一党支部', '2019-01-06 10:56:15', 5, 1, 1, '/dangjian-controller/upload/images/news/b909464bb62b499988c2da8f331e5f2d.jpg', 7);
COMMIT;

-- ----------------------------
-- Table structure for xzzwb
-- ----------------------------
DROP TABLE IF EXISTS `xzzwb`;
CREATE TABLE `xzzwb` (
  `xzzw_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '行政职务id',
  `xzzw_mc` varchar(32) DEFAULT NULL COMMENT '行政职务名称',
  `xzzw_jb` int(11) DEFAULT '3' COMMENT '任职级别（1表示校级，2表示学院级，3表示支部级）',
  PRIMARY KEY (`xzzw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='行政职务名称';

-- ----------------------------
-- Records of xzzwb
-- ----------------------------
BEGIN;
INSERT INTO `xzzwb` VALUES (101, '无', 3);
INSERT INTO `xzzwb` VALUES (102, '学院院长', 2);
INSERT INTO `xzzwb` VALUES (103, '学院副院长', 2);
INSERT INTO `xzzwb` VALUES (104, '校长', 1);
INSERT INTO `xzzwb` VALUES (105, '副校长', 1);
INSERT INTO `xzzwb` VALUES (106, '学工组长', 3);
COMMIT;

-- ----------------------------
-- Table structure for yh_jsb
-- ----------------------------
DROP TABLE IF EXISTS `yh_jsb`;
CREATE TABLE `yh_jsb` (
  `yh_id` varchar(32) NOT NULL COMMENT '用户id',
  `js_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`yh_id`,`js_id`),
  KEY `yhjs_yh` (`yh_id`),
  KEY `yhjs_js` (`js_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of yh_jsb
-- ----------------------------
BEGIN;
INSERT INTO `yh_jsb` VALUES ('001', 36);
INSERT INTO `yh_jsb` VALUES ('002', 36);
INSERT INTO `yh_jsb` VALUES ('00a877119bca4eeea7fb0f7ddef48e6f', 36);
INSERT INTO `yh_jsb` VALUES ('161532e2add14c1c8c6272134baaa150', 36);
INSERT INTO `yh_jsb` VALUES ('4a6400d35e6f4b218331e0b46952147c', 36);
INSERT INTO `yh_jsb` VALUES ('508d53fd0a084a5dad5399e239369c97', 36);
INSERT INTO `yh_jsb` VALUES ('63ad96ade9d549d28e5502bcfad2cf2a', 36);
INSERT INTO `yh_jsb` VALUES ('a4038d464c1d42798fb28432c5cb2813', 36);
INSERT INTO `yh_jsb` VALUES ('a50fa03e4f3847068442cb37e2f7efc5', 36);
INSERT INTO `yh_jsb` VALUES ('b35583b1d7e645c599297cac7f741eb5', 36);
INSERT INTO `yh_jsb` VALUES ('db154f465ff740df9dff311a34efd34d', 36);
INSERT INTO `yh_jsb` VALUES ('001', 39);
INSERT INTO `yh_jsb` VALUES ('002', 39);
INSERT INTO `yh_jsb` VALUES ('001', 40);
INSERT INTO `yh_jsb` VALUES ('002', 40);
INSERT INTO `yh_jsb` VALUES ('002', 41);
INSERT INTO `yh_jsb` VALUES ('001', 42);
INSERT INTO `yh_jsb` VALUES ('002', 42);
INSERT INTO `yh_jsb` VALUES ('001', 43);
INSERT INTO `yh_jsb` VALUES ('002', 43);
INSERT INTO `yh_jsb` VALUES ('001', 44);
INSERT INTO `yh_jsb` VALUES ('002', 44);
INSERT INTO `yh_jsb` VALUES ('001', 45);
INSERT INTO `yh_jsb` VALUES ('002', 45);
INSERT INTO `yh_jsb` VALUES ('001', 46);
INSERT INTO `yh_jsb` VALUES ('002', 46);
INSERT INTO `yh_jsb` VALUES ('001', 47);
INSERT INTO `yh_jsb` VALUES ('002', 47);
INSERT INTO `yh_jsb` VALUES ('001', 48);
INSERT INTO `yh_jsb` VALUES ('002', 48);
INSERT INTO `yh_jsb` VALUES ('001', 49);
INSERT INTO `yh_jsb` VALUES ('002', 49);
INSERT INTO `yh_jsb` VALUES ('001', 50);
INSERT INTO `yh_jsb` VALUES ('002', 50);
INSERT INTO `yh_jsb` VALUES ('001', 51);
INSERT INTO `yh_jsb` VALUES ('002', 51);
COMMIT;

-- ----------------------------
-- Table structure for yh_xxb
-- ----------------------------
DROP TABLE IF EXISTS `yh_xxb`;
CREATE TABLE `yh_xxb` (
  `yhxx_id` varchar(32) NOT NULL COMMENT '用户信息id',
  `yhxx_xm` varchar(32) DEFAULT NULL COMMENT '用户信息姓名',
  `yhxx_xb` varchar(32) DEFAULT NULL COMMENT '用户信息性别',
  `yhxx_csrq` date DEFAULT NULL COMMENT '用户信息出生日期',
  `yhxx_dhhm` varchar(11) DEFAULT NULL,
  `yhxx_sjh` varchar(16) DEFAULT NULL COMMENT '用户信息手机号',
  `yhxx_yx` varchar(32) DEFAULT NULL COMMENT '用户信息邮箱',
  `yhxx_sfzh` varchar(20) DEFAULT NULL COMMENT '用户信息身份证',
  `yhxx_tx` varchar(255) DEFAULT NULL COMMENT '用户信息头像',
  `yhxx_ms` varchar(255) DEFAULT '' COMMENT '描述',
  `yhxx_da` varchar(255) DEFAULT NULL COMMENT '档案',
  `yhxx_xldm` int(11) NOT NULL COMMENT '学历表',
  `yhxx_zzmmdm` int(11) NOT NULL COMMENT '政治面貌表',
  `yhxx_jgdm` int(11) NOT NULL COMMENT '籍贯表',
  `yhxx_mzdm` int(11) NOT NULL COMMENT '民族表',
  `yhxx_dnzwdm` int(11) NOT NULL COMMENT '党内职务表',
  `yhxx_xzzwdm` int(11) NOT NULL COMMENT '行政职务表',
  `yhxx_bmdm` int(11) NOT NULL COMMENT '部门表',
  `yhxx_zbdm` int(11) DEFAULT NULL COMMENT '支部表',
  `yhxx_mj` varchar(4) DEFAULT NULL COMMENT '年级',
  PRIMARY KEY (`yhxx_id`),
  KEY `yhxx_xl` (`yhxx_xldm`),
  KEY `yhxx_zzmm` (`yhxx_zzmmdm`),
  KEY `yhxx_jg` (`yhxx_jgdm`),
  KEY `yhxx_mz` (`yhxx_mzdm`),
  KEY `yhxx_dnzw` (`yhxx_dnzwdm`),
  KEY `yhxx_xzzw` (`yhxx_xzzwdm`),
  KEY `yhxx_bm` (`yhxx_bmdm`),
  KEY `yhxx_zb` (`yhxx_zbdm`),
  KEY `yhxx_nj` (`yhxx_mj`),
  CONSTRAINT `yhxx_bm` FOREIGN KEY (`yhxx_bmdm`) REFERENCES `bmb` (`bm_id`),
  CONSTRAINT `yhxx_dnzw` FOREIGN KEY (`yhxx_dnzwdm`) REFERENCES `dnzwb` (`dnzw_id`),
  CONSTRAINT `yhxx_jg` FOREIGN KEY (`yhxx_jgdm`) REFERENCES `jgb` (`jg_id`),
  CONSTRAINT `yhxx_mz` FOREIGN KEY (`yhxx_mzdm`) REFERENCES `mzb` (`mz_id`),
  CONSTRAINT `yhxx_xl` FOREIGN KEY (`yhxx_xldm`) REFERENCES `xlb` (`xl_id`),
  CONSTRAINT `yhxx_xzzw` FOREIGN KEY (`yhxx_xzzwdm`) REFERENCES `xzzwb` (`xzzw_id`),
  CONSTRAINT `yhxx_zb` FOREIGN KEY (`yhxx_zbdm`) REFERENCES `zbb` (`zb_id`),
  CONSTRAINT `yhxx_zzmm` FOREIGN KEY (`yhxx_zzmmdm`) REFERENCES `zzmmb` (`zzmm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of yh_xxb
-- ----------------------------
BEGIN;
INSERT INTO `yh_xxb` VALUES ('001', '徐兰孔', '男', '2018-07-25', NULL, '15807738705', '333333', '123456789', '31520520', '开发人员01', NULL, 21, 101, 110000, 101, 111, 101, 120, 103, '2015');
INSERT INTO `yh_xxb` VALUES ('002', '黎世东', '男', '2018-08-06', NULL, '15174193721', '12345678@qq.com', '33333', NULL, '你好啊', NULL, 11, 102, 110000, 101, 102, 102, 101, 101, '2015');
INSERT INTO `yh_xxb` VALUES ('00ddb0a560a849788f18c6948b917bf8', '小乔', '女', '2018-01-12', '7758269', '13712345443', '123467@qq.com', '222402198205173372', NULL, '', NULL, 21, 101, 220104, 113, 101, 101, 101, 101, '2014');
INSERT INTO `yh_xxb` VALUES ('1cbb9b43ca084d998ea3cb3c6c66cadb', '貂蝉', '女', '2018-01-10', '7758267', '13712345441', '123465@qq.com', '210421198403162020', NULL, '', NULL, 14, 101, 220104, 101, 101, 101, 120, 103, '2015');
INSERT INTO `yh_xxb` VALUES ('3601329bf44d4e3b87a283b4b26f27f1', '徐兰孔', '男', '2018-08-10', NULL, '15807738705', 'lanlan@qq.com', '1234567890', NULL, '你好啊', NULL, 21, 101, 110000, 101, 101, 101, 101, 101, NULL);
INSERT INTO `yh_xxb` VALUES ('40ef2104cde24f1f862594f61167b5c3', '测试用户', '男', '2018-11-30', NULL, '14174193721', '123456@qq.com', '411426198203239951', NULL, 'qwertyuiop', NULL, 11, 103, 110102, 102, 102, 101, 101, 101, NULL);
INSERT INTO `yh_xxb` VALUES ('4fb366c675e8445bb644f7290ba60a3d', '大乔', '女', '2018-01-13', '7758270', '13712345444', '123468@qq.com', '411426198203239951', NULL, '', NULL, 14, 103, 220104, 106, 102, 101, 101, 101, '2013');
INSERT INTO `yh_xxb` VALUES ('6b55fea6c5bd4052a724e4ed7a7f3d76', '西施', '女', '2018-01-15', '7758272', '13712345446', '123470@qq.com', '370283790911703111', NULL, '', NULL, 14, 101, 220104, 106, 101, 101, 113, 106, '2015');
INSERT INTO `yh_xxb` VALUES ('88e3f8781a82451697774c9170061ea5', '司马懿', '男', '2018-01-09', '7758266', '13712345440', '123464@qq.com', '41142619890912956X', NULL, '', NULL, 14, 101, 220104, 113, 101, 102, 113, 106, '2014');
INSERT INTO `yh_xxb` VALUES ('88e9c1b97f184a17a6ce68191dfb7c6e', '张三', '男', '2018-01-01', '7758258', '13712345432', '123456@qq.com', '150981197202284550', NULL, '', NULL, 21, 101, 220104, 101, 103, 101, 101, 101, '2014');
INSERT INTO `yh_xxb` VALUES ('8b40572a9d5345cdb80f2e5eb6f9d69a', '杨贵妃', '女', '2018-01-14', '7758271', '13712345445', '123469@qq.com', '372922198012224773', NULL, '', NULL, 21, 101, 220104, 108, 102, 101, 101, 101, '2015');
INSERT INTO `yh_xxb` VALUES ('a306811f7e3a4d08a84378b0fdfacc60', '刘备', '男', '2018-01-06', '7758263', '13712345437', '123461@qq.com', '21031119850417003x', NULL, '', NULL, 14, 103, 220104, 101, 101, 101, 101, 101, '2013');
INSERT INTO `yh_xxb` VALUES ('a478047cb1744e5cb6449fabbd9aef06', '关羽', '男', '2018-01-05', '7758262', '13712345436', '123460@qq.com', '411426198006131706', NULL, '', NULL, 21, 101, 220104, 113, 101, 101, 113, 106, '2014');
INSERT INTO `yh_xxb` VALUES ('admin', 'admin', '男', '2018-12-06', '110', '120', '119@qq.com', '41142619890912956X', NULL, '0.0', NULL, 21, 101, 110000, 101, 101, 101, 101, 101, '2015');
INSERT INTO `yh_xxb` VALUES ('c28d8c226a3a4fe48a2a401d3aedbac7', '李四', '男', '2018-01-02', '7758259', '13712345433', '123457@qq.com', '211003198407230111', NULL, '', NULL, 14, 104, 220104, 108, 104, 101, 101, 110, '2015');
INSERT INTO `yh_xxb` VALUES ('c3c17b85c2c742c28997d13619a695ec', '赵云', '男', '2018-01-04', '7758261', '13712345435', '123459@qq.com', '120107198507020611', NULL, '', NULL, 14, 101, 220104, 101, 101, 101, 101, 101, '2015');
INSERT INTO `yh_xxb` VALUES ('cc64e0b606444c12bdd7bb6111dec6ad', '张飞', '男', '2018-01-07', '7758264', '13712345438', '123462@qq.com', '210303198508131214', NULL, '', NULL, 14, 101, 220104, 101, 102, 101, 101, 101, '2015');
INSERT INTO `yh_xxb` VALUES ('ce389516998d4c738cf30c633d161a03', '王昭君', '女', '2018-01-11', '7758268', '13712345442', '123466@qq.com', '211481197507197853', NULL, '', NULL, 14, 101, 220104, 101, 101, 101, 101, 101, '2013');
INSERT INTO `yh_xxb` VALUES ('d1ec9fec72f24a089f02bd61c2626ec0', '王五', '男', '2018-01-03', '7758260', '13712345434', '123458@qq.com', '510112198906172130', NULL, '', NULL, 14, 104, 220104, 106, 101, 101, 113, 106, '2014');
INSERT INTO `yh_xxb` VALUES ('d770b66e212d4940a4ce0a1bbea7e2c2', '诸葛亮', '男', '2018-01-08', '7758265', '13712345439', '123463@qq.com', '230307198207265808', NULL, '', NULL, 21, 101, 220104, 106, 101, 101, 101, 101, '2015');
INSERT INTO `yh_xxb` VALUES ('dd900d1de0ef4d16a2b911ee13ecbd09', '你好', '男', '2018-08-26', NULL, '222', '31231', '3131', NULL, '312', NULL, 14, 103, 110102, 103, 102, 101, 101, 101, NULL);
INSERT INTO `yh_xxb` VALUES ('ysh', '易顺华', '男', '2019-01-06', NULL, '123121213', '12312312', '1231213', NULL, '吊毛', NULL, 21, 101, 110000, 101, 111, 101, 120, 103, '2015');
COMMIT;

-- ----------------------------
-- Table structure for yh_ztb
-- ----------------------------
DROP TABLE IF EXISTS `yh_ztb`;
CREATE TABLE `yh_ztb` (
  `zt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '状态id',
  `zt_mc` varchar(255) DEFAULT NULL COMMENT '状态名称',
  PRIMARY KEY (`zt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='状态表';

-- ----------------------------
-- Records of yh_ztb
-- ----------------------------
BEGIN;
INSERT INTO `yh_ztb` VALUES (1, '在校学生');
INSERT INTO `yh_ztb` VALUES (2, '在校老师');
INSERT INTO `yh_ztb` VALUES (3, '离校学生');
INSERT INTO `yh_ztb` VALUES (4, '离校老师');
COMMIT;

-- ----------------------------
-- Table structure for yhb
-- ----------------------------
DROP TABLE IF EXISTS `yhb`;
CREATE TABLE `yhb` (
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `user_mc` varchar(32) NOT NULL COMMENT '用户名称',
  `user_pwk` varchar(6) DEFAULT NULL COMMENT '密码加密密文',
  `user_mm` varchar(32) NOT NULL COMMENT '密码',
  `user_wx_id` varchar(32) DEFAULT NULL COMMENT '微信id',
  `user_wxm` varchar(32) DEFAULT NULL COMMENT '微信名',
  `user_ms` varchar(255) DEFAULT '' COMMENT '用户描述',
  `user_cjrq` datetime NOT NULL COMMENT '用创建日期',
  `user_ztdm` int(11) NOT NULL COMMENT '状态表 1代表是学生 2代表是老师',
  `user_flag` int(11) DEFAULT '1' COMMENT '1表示后台用户',
  `user_yhxxdm` varchar(32) DEFAULT NULL COMMENT '用户详细信息表',
  PRIMARY KEY (`user_id`),
  KEY `yh_yhxx` (`user_yhxxdm`),
  KEY `yh_yhzt` (`user_ztdm`),
  CONSTRAINT `yh_yhxx` FOREIGN KEY (`user_yhxxdm`) REFERENCES `yh_xxb` (`yhxx_id`),
  CONSTRAINT `yh_yhzt` FOREIGN KEY (`user_ztdm`) REFERENCES `yh_ztb` (`zt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of yhb
-- ----------------------------
BEGIN;
INSERT INTO `yhb` VALUES ('001', 'lanlan', '', '202cb962ac59075b964b07152d234b70', '001', 'lanlan', '开发人员01', '2018-07-25 10:42:53', 1, 1, '001');
INSERT INTO `yhb` VALUES ('002', 'lsd', '', '202cb962ac59075b964b07152d234b70', '001', 'lsd', '开发人员', '2018-07-29 11:19:09', 1, 0, '002');
INSERT INTO `yhb` VALUES ('00a877119bca4eeea7fb0f7ddef48e6f', 'daqiao', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 1, 1, '4fb366c675e8445bb644f7290ba60a3d');
INSERT INTO `yhb` VALUES ('0c4dd3458c774b82b567f87b307b2691', 'wangwu', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 1, 1, 'd1ec9fec72f24a089f02bd61c2626ec0');
INSERT INTO `yhb` VALUES ('161532e2add14c1c8c6272134baaa150', 'zhangsan', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 2, 1, '88e9c1b97f184a17a6ce68191dfb7c6e');
INSERT INTO `yhb` VALUES ('17d0659d52864489981c9eb9ac61d090', 'nihap', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '312', '2018-08-26 20:34:15', 1, 1, 'dd900d1de0ef4d16a2b911ee13ecbd09');
INSERT INTO `yhb` VALUES ('2edf893353b445ac9ed1b44b81e11795', 'zhaozilong', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 2, 1, 'c3c17b85c2c742c28997d13619a695ec');
INSERT INTO `yhb` VALUES ('4a6400d35e6f4b218331e0b46952147c', 'testuser', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, 'qwertyuiop', '2018-11-30 20:10:30', 1, 1, '40ef2104cde24f1f862594f61167b5c3');
INSERT INTO `yhb` VALUES ('4edd5f072dfd4ad9bc8f54520ab09ad0', 'wangzhaojun', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 1, 1, 'ce389516998d4c738cf30c633d161a03');
INSERT INTO `yhb` VALUES ('508d53fd0a084a5dad5399e239369c97', 'xiaoqiao', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 2, 1, '00ddb0a560a849788f18c6948b917bf8');
INSERT INTO `yhb` VALUES ('5920e67f29a4439a90235cdc98327c55', 'diaochan', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 1, 1, '1cbb9b43ca084d998ea3cb3c6c66cadb');
INSERT INTO `yhb` VALUES ('63ad96ade9d549d28e5502bcfad2cf2a', 'simayi', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 1, 1, '88e3f8781a82451697774c9170061ea5');
INSERT INTO `yhb` VALUES ('78ba9c867797459dbbe15fe7123281ef', 'zhangfei', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 1, 1, 'cc64e0b606444c12bdd7bb6111dec6ad');
INSERT INTO `yhb` VALUES ('941940aa187840a38ae9a5617b25162f', 'xulankong', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '你好啊', '2018-08-25 20:57:36', 1, 0, '3601329bf44d4e3b87a283b4b26f27f1');
INSERT INTO `yhb` VALUES ('a4038d464c1d42798fb28432c5cb2813', 'yangguifei', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 2, 1, '8b40572a9d5345cdb80f2e5eb6f9d69a');
INSERT INTO `yhb` VALUES ('a50fa03e4f3847068442cb37e2f7efc5', 'xishi', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 1, 1, '6b55fea6c5bd4052a724e4ed7a7f3d76');
INSERT INTO `yhb` VALUES ('a9a3bc60d6184a86a7c2c3647d687bdb', 'zhugeliang', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 2, 1, 'd770b66e212d4940a4ce0a1bbea7e2c2');
INSERT INTO `yhb` VALUES ('admin', 'admin', NULL, '202cb962ac59075b964b07152d234b70', '001', 'lanlan', '', '2018-12-06 19:08:09', 1, 1, 'admin');
INSERT INTO `yhb` VALUES ('b35583b1d7e645c599297cac7f741eb5', 'liubei', NULL, '250cf8b51c773f3f8dc8b4be867a9a02', NULL, NULL, '', '2018-11-30 18:00:34', 1, 1, 'a306811f7e3a4d08a84378b0fdfacc60');
INSERT INTO `yhb` VALUES ('db154f465ff740df9dff311a34efd34d', 'guanyu', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 1, 1, 'a478047cb1744e5cb6449fabbd9aef06');
INSERT INTO `yhb` VALUES ('e32b7b75144a46708670a8fc74f787cc', 'lisi', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, '', '2018-11-30 18:00:34', 1, 1, 'c28d8c226a3a4fe48a2a401d3aedbac7');
INSERT INTO `yhb` VALUES ('ysh', 'ysh', NULL, '202cb962ac59075b964b07152d234b70', '001', 'ysh', '吊毛', '2019-01-06 18:30:58', 1, 0, 'ysh');
COMMIT;

-- ----------------------------
-- Table structure for zb_cyb
-- ----------------------------
DROP TABLE IF EXISTS `zb_cyb`;
CREATE TABLE `zb_cyb` (
  `zbcy_zbdm` int(11) NOT NULL COMMENT '支部id',
  `zbcy_yhdm` varchar(32) DEFAULT NULL COMMENT '支部成员id',
  `zbcy_zw` varchar(32) DEFAULT NULL COMMENT '支部职务',
  `zbcy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支部成员表id',
  PRIMARY KEY (`zbcy_id`),
  KEY `zbcy_yh` (`zbcy_yhdm`),
  KEY `zbcy_zb` (`zbcy_zbdm`),
  CONSTRAINT `zbcy_yh` FOREIGN KEY (`zbcy_yhdm`) REFERENCES `yhb` (`user_id`),
  CONSTRAINT `zbcy_zb` FOREIGN KEY (`zbcy_zbdm`) REFERENCES `zbb` (`zb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支部成员表';

-- ----------------------------
-- Table structure for zb_lxb
-- ----------------------------
DROP TABLE IF EXISTS `zb_lxb`;
CREATE TABLE `zb_lxb` (
  `zblx_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支部类型id',
  `zblx_mc` varchar(32) DEFAULT NULL COMMENT '支部类型名称',
  PRIMARY KEY (`zblx_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='支部类型表';

-- ----------------------------
-- Records of zb_lxb
-- ----------------------------
BEGIN;
INSERT INTO `zb_lxb` VALUES (101, '服务型');
INSERT INTO `zb_lxb` VALUES (102, '创新型');
INSERT INTO `zb_lxb` VALUES (103, '学习型');
COMMIT;

-- ----------------------------
-- Table structure for zbb
-- ----------------------------
DROP TABLE IF EXISTS `zbb`;
CREATE TABLE `zbb` (
  `zb_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支部id',
  `zb_mc` varchar(32) NOT NULL COMMENT '支部名称',
  `zb_ssbmdm` int(11) DEFAULT NULL COMMENT '所属部门表',
  `zb_lxdm` int(11) DEFAULT NULL COMMENT '支部类型',
  `zb_ms` varchar(255) DEFAULT NULL COMMENT '支部描述',
  `zb_sj` varchar(32) DEFAULT NULL,
  `zb_zzwy` varchar(32) DEFAULT NULL,
  `zb_xcwy` varchar(32) DEFAULT NULL,
  `zb_xgsj` datetime DEFAULT NULL,
  PRIMARY KEY (`zb_id`),
  KEY `zb_bm` (`zb_ssbmdm`),
  KEY `zb_zblx` (`zb_lxdm`),
  CONSTRAINT `zb_bm` FOREIGN KEY (`zb_ssbmdm`) REFERENCES `bmb` (`bm_id`),
  CONSTRAINT `zb_zblx` FOREIGN KEY (`zb_lxdm`) REFERENCES `zb_lxb` (`zblx_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='支部表';

-- ----------------------------
-- Records of zbb
-- ----------------------------
BEGIN;
INSERT INTO `zbb` VALUES (101, '信息科学与工程学院学生第一党支部', 101, 101, '你好', '001', '001', '001', '2018-11-14 17:49:13');
INSERT INTO `zbb` VALUES (102, '旅游学院学生第二党支部', 120, 101, '大萨达所', '001', '5920e67f29a4439a90235cdc98327c55', '002', '2018-12-04 20:42:52');
INSERT INTO `zbb` VALUES (103, '旅游学院学生第三党支部', 120, 101, '大萨达所', '001', '161532e2add14c1c8c6272134baaa150', '002', '2018-12-04 20:42:39');
INSERT INTO `zbb` VALUES (105, '旅游学院第四党支部嗯嗯嗯', 120, 101, '哈哈哈哈哈哈', '001', '001', '001', '2018-11-13 16:03:17');
INSERT INTO `zbb` VALUES (106, '土木学院学生第一党支部', 113, 101, '你好不，很不好', '5920e67f29a4439a90235cdc98327c55', '4a6400d35e6f4b218331e0b46952147c', 'a50fa03e4f3847068442cb37e2f7efc5', '2018-12-25 16:35:50');
INSERT INTO `zbb` VALUES (109, '化学与生物工程学院学生第一党支部', 124, 101, '2323232', '2edf893353b445ac9ed1b44b81e11795', '4edd5f072dfd4ad9bc8f54520ab09ad0', '161532e2add14c1c8c6272134baaa150', '2018-12-25 19:52:38');
INSERT INTO `zbb` VALUES (110, '信息学院学生第二党支部', 101, 101, '我去恶趣味气味', '161532e2add14c1c8c6272134baaa150', '2edf893353b445ac9ed1b44b81e11795', '0c4dd3458c774b82b567f87b307b2691', '2019-01-01 15:24:33');
COMMIT;

-- ----------------------------
-- Table structure for zbry
-- ----------------------------
DROP TABLE IF EXISTS `zbry`;
CREATE TABLE `zbry` (
  `zbry_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '荣誉项目id',
  `zbry_mc` varchar(32) NOT NULL COMMENT '荣誉名称',
  `zbry_hdsj` datetime NOT NULL COMMENT '获得荣誉时间',
  `zbry_js` varchar(255) DEFAULT NULL COMMENT '荣誉介绍',
  `zbry_zbdm` int(11) NOT NULL COMMENT '所属支部',
  `zbry_tp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zbry_id`),
  KEY `zbry_zb` (`zbry_zbdm`),
  CONSTRAINT `zbry_zb` FOREIGN KEY (`zbry_zbdm`) REFERENCES `zbb` (`zb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='支部荣誉';

-- ----------------------------
-- Records of zbry
-- ----------------------------
BEGIN;
INSERT INTO `zbry` VALUES (28, '最佳支部奖', '2019-01-06 10:03:28', '中共桂林理工大学委员会党校是在学校党委直接领导下，培训党员、干部和党员发展对象的党委工作机构，是学习、研究和宣传马克思列宁主义、毛泽东思想、邓小平理论、“三个代表”重要思想、科学发展观、习近平新时代中国特色社会主义思想等重大战略思想的重要阵地，是干部和入党积极分子、党员发展对象加强党性锻炼的熔炉。', 101, '');
INSERT INTO `zbry` VALUES (29, '就是这么秀支部奖', '2019-01-06 10:04:13', '学校党委党校由学校党委副书记王赣华同志任校长，实行党委党校——二级党校两级培训格局。多年来', 101, '');
INSERT INTO `zbry` VALUES (30, '最强支部奖', '2019-01-06 10:04:32', '学校党委党校始终坚持以马克思列宁主义、毛泽东思想、邓小平理论、“三个代表”重要思想、科学发展观', 101, '');
INSERT INTO `zbry` VALUES (31, '无敌支部奖', '2019-01-06 10:04:40', '习近平新时代中国特色社会主义思想为指导，积极开展党员、干部和入党积极分子、党员发展对象培训，努力为学校建设一支党性强、觉悟高、作风正的党员队伍，德才兼备的干部队伍和德智体美全面发展的学生骨干队伍，为学校的建设发展提供坚强的组织保证。', 101, '');
INSERT INTO `zbry` VALUES (32, '最厉害的支部奖', '2019-01-06 10:04:51', '习近平新时代中国特色社会主义思想为指导，积极开展党员、干部和入党积极分子、党员发展对象培训，努力为学校建设一支党性强、觉悟高、作风正的党员队伍，德才兼备的干部队伍和德智体美全面发展的学生骨干队伍，为学校的建设发展提供坚强的组织保证。', 101, '');
COMMIT;

-- ----------------------------
-- Table structure for zzmmb
-- ----------------------------
DROP TABLE IF EXISTS `zzmmb`;
CREATE TABLE `zzmmb` (
  `zzmm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '政治面貌id',
  `zzmm_mc` varchar(32) DEFAULT NULL COMMENT '政治面貌名称',
  PRIMARY KEY (`zzmm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='政治面貌表';

-- ----------------------------
-- Records of zzmmb
-- ----------------------------
BEGIN;
INSERT INTO `zzmmb` VALUES (101, '中共党员');
INSERT INTO `zzmmb` VALUES (102, '中共预备党员');
INSERT INTO `zzmmb` VALUES (103, '共青团员');
INSERT INTO `zzmmb` VALUES (104, '民革会员');
INSERT INTO `zzmmb` VALUES (105, '民盟盟员');
INSERT INTO `zzmmb` VALUES (106, '民建会员');
INSERT INTO `zzmmb` VALUES (107, '民进会员');
INSERT INTO `zzmmb` VALUES (108, '农工党党员');
INSERT INTO `zzmmb` VALUES (109, '致公党党员');
INSERT INTO `zzmmb` VALUES (110, '九三学社社员');
INSERT INTO `zzmmb` VALUES (111, '台盟盟员');
INSERT INTO `zzmmb` VALUES (112, '无党派民主人士');
INSERT INTO `zzmmb` VALUES (113, '群众');
COMMIT;

-- ----------------------------
-- View structure for view_approval_job_user
-- ----------------------------
DROP VIEW IF EXISTS `view_approval_job_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_approval_job_user` AS select `gw`.`spgw_id` AS `spgw_id`,`gw`.`spgw_spgwmc` AS `spgw_spgwmc`,`ry`.`spry_id` AS `spry_id`,`yh`.`user_mc` AS `user_mc`,`xx`.`yhxx_xm` AS `yhxx_xm`,`yh`.`user_id` AS `user_id`,`bm`.`bm_id` AS `bm_id`,`bm`.`bm_mc` AS `bm_mc`,`jd`.`spjd_id` AS `spjd_id`,`jd`.`spjd_mc` AS `spjd_mc`,`jd`.`spjd_dqspzt` AS `spjd_dqspzt`,`jd`.`spjd_xyspjddm` AS `spjd_xyspjdId`,`jd`.`spjd_xyjdmc` AS `spjd_xyjdmc` from (((((`sp_spgwb` `gw` join `sp_ryb` `ry`) join `yhb` `yh`) join `yh_xxb` `xx`) join `bmb` `bm`) join `sp_spjdb` `jd`) where ((`ry`.`spry_spgwdm` = `gw`.`spgw_id`) and (`jd`.`spjd_gwdm` = `gw`.`spgw_id`) and (`ry`.`spry_bmdm` = `bm`.`bm_id`) and (`ry`.`spry_yh` = `yh`.`user_id`) and (`yh`.`user_yhxxdm` = `xx`.`yhxx_id`));

-- ----------------------------
-- View structure for view_approval_node
-- ----------------------------
DROP VIEW IF EXISTS `view_approval_node`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_approval_node` AS select `jd`.`spjd_id` AS `spjd_id`,`jd`.`spjd_mc` AS `spjd_mc`,`jd`.`spjd_dqspzt` AS `spjd_dqspzt`,`jd`.`spjd_xyspjddm` AS `spjd_xyspjdId`,`jd`.`spjd_xyjdmc` AS `spjd_xyjdmc`,`jd`.`spjd_isFirst` AS `spjd_isFirst`,`lc`.`splc_id` AS `splc_id`,`lc`.`splc_state` AS `splc_state`,`lc`.`splc_mc` AS `splc_mc`,`lc`.`splc_ywdm` AS `splc_ywdm`,`gw`.`spgw_id` AS `spgw_id`,`gw`.`spgw_spgwmc` AS `spgw_spgwmc` from ((`sp_spjdb` `jd` join `sp_splcb` `lc`) join `sp_spgwb` `gw`) where ((`jd`.`spjd_lcdm` = `lc`.`splc_id`) and (`jd`.`spjd_gwdm` = `gw`.`spgw_id`));

-- ----------------------------
-- View structure for view_approval_project_process_node
-- ----------------------------
DROP VIEW IF EXISTS `view_approval_project_process_node`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_approval_project_process_node` AS select `xm`.`lcxm_id` AS `lcxm_id`,`xm`.`lcxm_mc` AS `lcxm_mc`,`xm`.`lcxm_xmms` AS `lcxm_xmms`,`xm`.`lcxm_dqspzt` AS `lcxm_dqspzt`,`xm`.`lcxm_resulte` AS `lcxm_resulte`,`xm`.`lcxm_xgsj` AS `lcxm_xgsj`,`xm`.`lcxm_dxId` AS `lcxm_dxId`,`jd`.`spjd_id` AS `spjd_id`,`jd`.`spjd_mc` AS `spjd_mc`,`jd`.`spjd_dqspzt` AS `spjd_dqspzt`,`jd`.`spjd_xyspjddm` AS `spjd_xyspjddm`,`jd`.`spjd_xyjdmc` AS `spjd_xyjdmc`,`jd`.`spjd_isFirst` AS `spjd_isFirst`,`lc`.`splc_id` AS `splc_id`,`lc`.`splc_mc` AS `splc_mc`,`lc`.`splc_state` AS `splc_state`,`lc`.`splc_ywdm` AS `splc_ywdm`,`gw`.`spgw_id` AS `spgw_id`,`gw`.`spgw_spgwmc` AS `spgw_spgwmc` from (((`sp_lcxmb` `xm` join `sp_spjdb` `jd`) join `sp_splcb` `lc`) join `sp_spgwb` `gw`) where ((`xm`.`lcxm_splcdm` = `lc`.`splc_id`) and (`xm`.`lcxm_dqjddm` = `jd`.`spjd_id`) and (`jd`.`spjd_gwdm` = `gw`.`spgw_id`));

-- ----------------------------
-- View structure for view_branch
-- ----------------------------
DROP VIEW IF EXISTS `view_branch`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_branch` AS select `zb`.`zb_id` AS `zb_id`,`zb`.`zb_mc` AS `zb_mc`,`zb`.`zb_ms` AS `zb_ms`,`zb`.`zb_xgsj` AS `zb_xgsj`,`bmb`.`bm_id` AS `bm_id`,`bmb`.`bm_mc` AS `bm_mc`,`zb_lxb`.`zblx_id` AS `zblx_id`,`zb_lxb`.`zblx_mc` AS `zblx_mc`,`yhxx1`.`user_id` AS `sjId`,`yhxx1`.`yhxx_xm` AS `sjXm`,`yhxx2`.`user_id` AS `zzwyId`,`yhxx2`.`yhxx_xm` AS `zzwyXm`,`yhxx3`.`user_id` AS `xcwyId`,`yhxx3`.`yhxx_xm` AS `xcwyXm` from (((((`zbb` `zb` left join `view_yhxx` `yhxx1` on((`zb`.`zb_sj` = `yhxx1`.`user_id`))) left join `view_yhxx` `yhxx2` on((`zb`.`zb_zzwy` = `yhxx2`.`user_id`))) left join `view_yhxx` `yhxx3` on((`zb`.`zb_xcwy` = `yhxx3`.`user_id`))) left join `bmb` on((`zb`.`zb_ssbmdm` = `bmb`.`bm_id`))) left join `zb_lxb` on((`zb`.`zb_lxdm` = `zb_lxb`.`zblx_id`)));

-- ----------------------------
-- View structure for view_branch_user
-- ----------------------------
DROP VIEW IF EXISTS `view_branch_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_branch_user` AS select `yhb`.`user_id` AS `user_id`,`yhb`.`user_mc` AS `user_mc`,`yh_xxb`.`yhxx_xm` AS `yhxx_xm`,`yh_xxb`.`yhxx_xb` AS `yhxx_xb`,`yh_xxb`.`yhxx_csrq` AS `yhxx_csrq`,`dnzwb`.`dnzw_id` AS `dnzw_id`,`dnzwb`.`dnzw_mc` AS `dnzw_mc`,`dnzwb`.`dnzw_jb` AS `dnzw_jb`,`xzzwb`.`xzzw_id` AS `xzzw_id`,`xzzwb`.`xzzw_mc` AS `xzzw_mc`,`xzzwb`.`xzzw_jb` AS `xzzw_jb`,`zbb`.`zb_id` AS `zb_id`,`zbb`.`zb_mc` AS `zb_mc`,`zbb`.`zb_ms` AS `zb_ms`,`zb_lxb`.`zblx_id` AS `zblx_id`,`zb_lxb`.`zblx_mc` AS `zblx_mc`,`bmb`.`bm_id` AS `bm_id`,`bmb`.`bm_mc` AS `bm_mc` from ((((((`yhb` join `yh_xxb`) join `dnzwb`) join `xzzwb`) join `zbb`) join `zb_lxb`) join `bmb`) where ((`yh_xxb`.`yhxx_id` = `yhb`.`user_yhxxdm`) and (`yh_xxb`.`yhxx_dnzwdm` = `dnzwb`.`dnzw_id`) and (`yh_xxb`.`yhxx_xzzwdm` = `xzzwb`.`xzzw_id`) and (`yh_xxb`.`yhxx_zbdm` = `zbb`.`zb_id`) and (`yh_xxb`.`yhxx_bmdm` = `bmb`.`bm_id`) and (`zbb`.`zb_lxdm` = `zb_lxb`.`zblx_id`));

-- ----------------------------
-- View structure for view_bug
-- ----------------------------
DROP VIEW IF EXISTS `view_bug`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_bug` AS select `bug`.`id` AS `id`,`bug`.`bt` AS `bt`,`bug`.`sj` AS `sj`,`bug`.`sfyd` AS `sfyd`,`bug`.`yhdm` AS `yhdm`,`bug`.`nr` AS `nr`,`yhb`.`user_id` AS `user_id`,`yhb`.`user_mc` AS `user_mc`,`yh_xxb`.`yhxx_xm` AS `yhxx_xm` from ((`bug` join `yhb`) join `yh_xxb`) where ((`bug`.`yhdm` = `yhb`.`user_id`) and (`yhb`.`user_yhxxdm` = `yh_xxb`.`yhxx_id`));

-- ----------------------------
-- View structure for view_comment_praise
-- ----------------------------
DROP VIEW IF EXISTS `view_comment_praise`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_comment_praise` AS select `pl`.`id` AS `pl_id`,`pl`.`zw` AS `pl_zw`,`pl`.`sj` AS `pl_sj`,`pl`.`flag` AS `pl_flag`,`pl`.`xwdm` AS `pl_xwdm`,`pl`.`yhdm` AS `pl_yhdm`,`xw_pldzb`.`pldz_id` AS `pldz_id`,`yhb`.`user_id` AS `pldz_userId`,`yh_xxb`.`yhxx_xm` AS `pldz_userName` from (((`xw_plb` `pl` join `yhb`) join `yh_xxb`) join `xw_pldzb`) where ((`xw_pldzb`.`pldz_pldm` = `pl`.`id`) and (`xw_pldzb`.`pldz_yhdm` = `yhb`.`user_id`) and (`yhb`.`user_yhxxdm` = `yh_xxb`.`yhxx_id`));

-- ----------------------------
-- View structure for view_comment_reply
-- ----------------------------
DROP VIEW IF EXISTS `view_comment_reply`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_comment_reply` AS select `pl`.`id` AS `pl_id`,`pl`.`zw` AS `pl_zw`,`pl`.`sj` AS `pl_sj`,`pl`.`flag` AS `pl_flag`,`pl`.`xwdm` AS `pl_xwdm`,`pl`.`yhdm` AS `pl_yhdm`,`hf`.`id` AS `hf_id`,`hf`.`reply_id` AS `hf_reply_id`,`hf`.`reply_type` AS `hf_reply_type`,`hf`.`nr` AS `hf_nr`,`hf`.`mb_yh_id` AS `hf_mb_yh_id`,`hf`.`sj` AS `hf_sj`,`hf`.`flag` AS `hf_flag`,`yhb`.`user_id` AS `hf_userId`,`yh_xxb`.`yhxx_xm` AS `hf_userName` from (((`yhb` join `yh_xxb`) join `xw_plb` `pl`) join `xw_pl_hf` `hf`) where ((`hf`.`pldm` = `pl`.`id`) and (`hf`.`hf_yhdm` = `yhb`.`user_id`) and (`yhb`.`user_yhxxdm` = `yh_xxb`.`yhxx_id`));

-- ----------------------------
-- View structure for view_department
-- ----------------------------
DROP VIEW IF EXISTS `view_department`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_department` AS select distinct `bm`.`bm_id` AS `bm_id`,`bm`.`bm_mc` AS `bm_mc`,`bm`.`bm_js` AS `bm_js`,`bm`.`bm_cjsj` AS `bm_cjsj`,`bm`.`bm_xgsj` AS `bm_xgsj`,`bm`.`bm_logo` AS `bm_logo`,`yh1`.`user_id` AS `secretaryId`,`xx1`.`yhxx_xm` AS `secretaryName`,`yh2`.`user_id` AS `deanId`,`xx2`.`yhxx_xm` AS `deanName` from ((((`bmb` `bm` join `yhb` `yh1`) join `yh_xxb` `xx1`) join `yhb` `yh2`) join `yh_xxb` `xx2`) where ((`bm`.`bm_sj` = `yh1`.`user_id`) and (`bm`.`bm_yz` = `yh2`.`user_id`) and (`yh1`.`user_yhxxdm` = `xx1`.`yhxx_id`) and (`yh2`.`user_yhxxdm` = `xx2`.`yhxx_id`));

-- ----------------------------
-- View structure for view_gnmk
-- ----------------------------
DROP VIEW IF EXISTS `view_gnmk`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_gnmk` AS select `b`.`mk_id` AS `mk_id`,`b`.`mk_mc` AS `mk_mc`,`b`.`mk_url` AS `mk_url`,`b`.`mk_icon` AS `mk_icon`,`a`.`gn_id` AS `gn_id`,`a`.`gn_mc` AS `gn_mc`,`a`.`gn_icon` AS `gn_icon` from (`gnb` `a` left join `mkb` `b` on((`a`.`gn_id` = `b`.`gnb`)));

-- ----------------------------
-- View structure for view_job_user
-- ----------------------------
DROP VIEW IF EXISTS `view_job_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_job_user` AS select `sp_spgwb`.`spgw_id` AS `spgw_id`,`sp_spgwb`.`spgw_spgwmc` AS `spgw_spgwmc`,`ry`.`spry_id` AS `spry_id`,`yhb`.`user_id` AS `user_id`,`yhb`.`user_mc` AS `user_mc`,`yh_xxb`.`yhxx_xm` AS `yhxx_xm`,`bmb`.`bm_id` AS `bm_id`,`bmb`.`bm_mc` AS `bm_mc` from ((((`sp_ryb` `ry` join `sp_spgwb`) join `yhb`) join `yh_xxb`) join `bmb`) where ((`ry`.`spry_bmdm` = `bmb`.`bm_id`) and (`ry`.`spry_spgwdm` = `sp_spgwb`.`spgw_id`) and (`ry`.`spry_yh` = `yhb`.`user_id`) and (`yhb`.`user_yhxxdm` = `yh_xxb`.`yhxx_id`));

-- ----------------------------
-- View structure for view_log
-- ----------------------------
DROP VIEW IF EXISTS `view_log`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_log` AS select `l`.`id` AS `id`,`l`.`login_ip` AS `login_ip`,`l`.`type` AS `type`,`l`.`operation` AS `operation`,`l`.`create_time` AS `create_time`,`l`.`remark` AS `remark`,`yhb`.`user_id` AS `user_id`,`yhb`.`user_mc` AS `user_mc`,`xx`.`yhxx_id` AS `yhxx_id`,`xx`.`yhxx_xm` AS `yhxx_xm` from ((`log` `l` join `yhb`) join `yh_xxb` `xx`) where ((`l`.`yhdm` = `yhb`.`user_id`) and (`yhb`.`user_yhxxdm` = `xx`.`yhxx_id`));

-- ----------------------------
-- View structure for view_myself_notice
-- ----------------------------
DROP VIEW IF EXISTS `view_myself_notice`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_myself_notice` AS select `tz`.`tz_id` AS `tz_id`,`tz`.`tz_bt` AS `tz_bt`,`tz`.`tz_nr` AS `tz_nr`,`tz`.`tz_fbsj` AS `tz_fbsj`,`tz`.`tz_fbrdm` AS `tz_fbrdm`,`tz`.`tz_fbrmc` AS `tz_fbrmc`,`tz`.`tz_jssj` AS `tz_jssj`,`tz`.`tz_yxj` AS `tz_yxj`,`dx`.`tzdx_id` AS `tzdx_id`,`dx`.`tzdx_btzyhdm` AS `tzdx_btzyhdm`,`xx`.`yhxx_xm` AS `tzdx_btzyhXm`,`dx`.`tzdx_sfyd` AS `tzdx_sfyd`,`dx`.`tzdx_ydsj` AS `tzdx_ydsj`,`bm`.`bm_id` AS `bm_id`,`bm`.`bm_mc` AS `bm_mc`,`fw`.`tzfw_id` AS `tzfw_id`,`fw`.`tzfw_mc` AS `tzfw_mc`,`xx`.`yhxx_xm` AS `yhxx_xm` from (((((`tz_fw` `fw` join `tz_tzb` `tz`) join `tz_tzdxb` `dx`) join `bmb` `bm`) join `yhb` `yh`) join `yh_xxb` `xx`) where ((`tz`.`tz_fwdm` = `fw`.`tzfw_id`) and (`dx`.`tzdx_tzdm` = `tz`.`tz_id`) and (`dx`.`tzdx_btzyhdm` = `yh`.`user_id`) and (`yh`.`user_yhxxdm` = `xx`.`yhxx_id`));

-- ----------------------------
-- View structure for view_news
-- ----------------------------
DROP VIEW IF EXISTS `view_news`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_news` AS select `xwb`.`xw_id` AS `xw_id`,`xwb`.`xw_slt` AS `xw_slt`,`xwb`.`xw_bt` AS `xw_bt`,`xwb`.`xw_fbsj` AS `xw_fbsj`,`xwb`.`xw_zw` AS `xw_zw`,`xwb`.`xw_ydrs` AS `xw_ydrs`,`xwb`.`xw_xgsj` AS `xw_xgsj`,`xwb`.`xw_sfpl` AS `xw_sfpl`,`xwb`.`xw_splc` AS `xw_splc`,`yhb`.`user_id` AS `fbr_userId`,`yh_xxb`.`yhxx_xm` AS `fbr_userName`,`xw_ztb`.`xwzt_id` AS `xwzt_id`,`xw_ztb`.`xwzt_mc` AS `xwzt_mc`,`lmb`.`lm_id` AS `lm_id`,`lmb`.`lm_mc` AS `lm_mc`,`bmb`.`bm_id` AS `bm_id`,`bmb`.`bm_mc` AS `bm_mc` from (((((`xwb` join `yhb`) join `yh_xxb`) join `bmb`) join `xw_ztb`) join `lmb`) where ((`xwb`.`xw_fbrdm` = `yhb`.`user_id`) and (`yhb`.`user_yhxxdm` = `yh_xxb`.`yhxx_id`) and (`xwb`.`xw_xwztdm` = `xw_ztb`.`xwzt_id`) and (`xwb`.`xw_lmdm` = `lmb`.`lm_id`) and (`xwb`.`xw_bmdm` = `bmb`.`bm_id`));

-- ----------------------------
-- View structure for view_news_comment
-- ----------------------------
DROP VIEW IF EXISTS `view_news_comment`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_news_comment` AS select `xwb`.`xw_id` AS `xw_id`,`xwb`.`xw_bt` AS `xw_bt`,`xwb`.`xw_fbsj` AS `xw_fbsj`,`xwb`.`xw_zw` AS `xw_zw`,`xwb`.`xw_ydrs` AS `xw_ydrs`,`xwb`.`xw_xgsj` AS `xw_xgsj`,`xwb`.`xw_sfpl` AS `xw_sfpl`,`xwb`.`xw_splc` AS `xw_splc`,`xw_plb`.`id` AS `id`,`xw_plb`.`zw` AS `zw`,`xw_plb`.`sj` AS `sj`,`xw_plb`.`flag` AS `flag`,`yhb`.`user_id` AS `pl_userId`,`yh_xxb`.`yhxx_xm` AS `pl_userName` from (((`xwb` join `yhb`) join `yh_xxb`) join `xw_plb`) where ((`xw_plb`.`xwdm` = `xwb`.`xw_id`) and (`xw_plb`.`yhdm` = `yhb`.`user_id`) and (`yhb`.`user_yhxxdm` = `yh_xxb`.`yhxx_id`));

-- ----------------------------
-- View structure for view_news_praise
-- ----------------------------
DROP VIEW IF EXISTS `view_news_praise`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_news_praise` AS select `xwb`.`xw_id` AS `xw_id`,`xwb`.`xw_bt` AS `xw_bt`,`xwb`.`xw_fbsj` AS `xw_fbsj`,`xwb`.`xw_zw` AS `xw_zw`,`xwb`.`xw_ydrs` AS `xw_ydrs`,`xwb`.`xw_xgsj` AS `xw_xgsj`,`xwb`.`xw_sfpl` AS `xw_sfpl`,`xwb`.`xw_splc` AS `xw_splc`,`xw_dzb`.`dz_id` AS `dz_id`,`yhb`.`user_id` AS `dz_userId`,`yh_xxb`.`yhxx_xm` AS `dz_userName` from (((`xwb` join `yhb`) join `yh_xxb`) join `xw_dzb`) where ((`xw_dzb`.`dz_xwdm` = `xwb`.`xw_id`) and (`xw_dzb`.`dz_yhdm` = `yhb`.`user_id`) and (`yhb`.`user_yhxxdm` = `yh_xxb`.`yhxx_id`));

-- ----------------------------
-- View structure for view_notice
-- ----------------------------
DROP VIEW IF EXISTS `view_notice`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_notice` AS select `dx`.`tzdx_id` AS `tzdx_id`,`dx`.`tzdx_sfyd` AS `tzdx_sfyd`,`dx`.`tzdx_ydsj` AS `tzdx_ydsj`,`dx`.`tzdx_bmdm` AS `tzdx_bmdm`,`dx`.`tzdx_zbdm` AS `tzdx_zbdm`,`tz`.`tz_id` AS `tz_id`,`tz`.`tz_bt` AS `tz_bt`,`tz`.`tz_nr` AS `tz_nr`,`tz`.`tz_fbsj` AS `tz_fbsj`,`tz`.`tz_fbrmc` AS `tz_fbrmc`,`tz`.`tz_jssj` AS `tz_jssj`,`tz`.`tz_fwdm` AS `tz_fwdm`,`tz`.`tz_yxj` AS `tz_yxj`,`tz`.`tz_spId` AS `tz_spId`,`yh1`.`user_id` AS `btzdxId`,`yh1`.`user_mc` AS `btzdxMc`,`yhxx1`.`yhxx_id` AS `btzdxYhxxId`,`yhxx1`.`yhxx_xm` AS `btzdxXm`,`yh2`.`user_id` AS `fbrId`,`yh2`.`user_mc` AS `fbrMc`,`yhxx2`.`yhxx_id` AS `fbrYhxxId`,`yhxx2`.`yhxx_xm` AS `fbrXm` from (((((`tz_tzdxb` `dx` join `tz_tzb` `tz`) join `yhb` `yh1`) join `yh_xxb` `yhxx1`) join `yhb` `yh2`) join `yh_xxb` `yhxx2`) where ((`dx`.`tzdx_tzdm` = `tz`.`tz_id`) and (`dx`.`tzdx_btzyhdm` = `yh1`.`user_id`) and (`yh1`.`user_yhxxdm` = `yhxx1`.`yhxx_id`) and (`tz`.`tz_fbrdm` = `yh2`.`user_id`) and (`yh2`.`user_yhxxdm` = `yhxx2`.`yhxx_id`));

-- ----------------------------
-- View structure for view_notice_common
-- ----------------------------
DROP VIEW IF EXISTS `view_notice_common`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_notice_common` AS select `dx`.`tzdx_id` AS `tzdx_id`,`dx`.`tzdx_sfyd` AS `tzdx_sfyd`,`dx`.`tzdx_ydsj` AS `tzdx_ydsj`,`dx`.`tzdx_bmdm` AS `tzdx_bmdm`,`dx`.`tzdx_zbdm` AS `tzdx_zbdm`,`tz`.`tz_id` AS `tz_id`,`tz`.`tz_bt` AS `tz_bt`,`tz`.`tz_nr` AS `tz_nr`,`tz`.`tz_fbsj` AS `tz_fbsj`,`tz`.`tz_fbrmc` AS `tz_fbrmc`,`tz`.`tz_jssj` AS `tz_jssj`,`tz`.`tz_fwdm` AS `tz_fwdm`,`tz`.`tz_yxj` AS `tz_yxj`,`tz`.`tz_spId` AS `tz_spId`,`yh2`.`user_id` AS `fbrId`,`yh2`.`user_mc` AS `fbrMc`,`yhxx2`.`yhxx_id` AS `fbrYhxxId`,`yhxx2`.`yhxx_xm` AS `fbrXm` from (((`tz_tzdxb` `dx` join `tz_tzb` `tz`) join `yhb` `yh2`) join `yh_xxb` `yhxx2`) where ((`tz`.`tz_fbrdm` = `yh2`.`user_id`) and (`yh2`.`user_yhxxdm` = `yhxx2`.`yhxx_id`) and (`dx`.`tzdx_tzdm` = `tz`.`tz_id`) and isnull(`dx`.`tzdx_btzyhdm`));

-- ----------------------------
-- View structure for view_partyInfo
-- ----------------------------
DROP VIEW IF EXISTS `view_partyInfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_partyInfo` AS select `djxx`.`id` AS `id`,`djxx`.`sqsj` AS `sqsj`,`djxx`.`spsj` AS `spsj`,`djxx`.`rdsj` AS `rdsj`,`djxx`.`ms` AS `ms`,`djxx`.`zrsj` AS `zrsj`,`djxx`.`zcdd` AS `zcdd`,`djxx`.`zt` AS `zt`,`djxx`.`result` AS `result`,`djxx`.`bmdm` AS `bmdm`,`djxx`.`zbdm` AS `zbdm`,`djxx`.`dnzwdm` AS `dnzwdm`,`djxx`.`zzmmdm` AS `zzmmdm`,`yhb`.`user_id` AS `user_id`,`yhb`.`user_mc` AS `user_mc`,`xx`.`yhxx_id` AS `yhxx_id`,`xx`.`yhxx_xm` AS `yhxx_xm`,`xx`.`yhxx_xb` AS `yhxx_xb`,`xx`.`yhxx_csrq` AS `yhxx_csrq`,`xx`.`yhxx_dhhm` AS `yhxx_dhhm`,`xx`.`yhxx_sjh` AS `yhxx_sjh`,`xx`.`yhxx_yx` AS `yhxx_yx`,`xx`.`yhxx_sfzh` AS `yhxx_sfzh`,`xlb`.`xl_id` AS `xl_id`,`xlb`.`xl_mc` AS `xl_mc`,`zzmmb`.`zzmm_id` AS `zzmm_id`,`zzmmb`.`zzmm_mc` AS `zzmm_mc`,`jgb`.`jg_id` AS `jg_id`,`jgb`.`js_szqx_mc` AS `js_szqx_mc`,`jgb`.`jg_szs_mc` AS `jg_szs_mc`,`mzb`.`mz_id` AS `mz_id`,`mzb`.`mz_mc` AS `mz_mc`,`dnzwb`.`dnzw_id` AS `dnzw_id`,`dnzwb`.`dnzw_mc` AS `dnzw_mc`,`dnzwb`.`dnzw_jb` AS `dnzw_jb`,`xzzwb`.`xzzw_id` AS `xzzw_id`,`xzzwb`.`xzzw_mc` AS `xzzw_mc`,`xzzwb`.`xzzw_jb` AS `xzzw_jb`,`bmb`.`bm_id` AS `bm_id`,`bmb`.`bm_mc` AS `bm_mc`,`zbb`.`zb_id` AS `zb_id`,`zbb`.`zb_mc` AS `zb_mc` from ((((((((((`djxx` join `yhb`) join `yh_xxb` `xx`) join `xlb`) join `zzmmb`) join `jgb`) join `mzb`) join `dnzwb`) join `xzzwb`) join `bmb`) join `zbb`) where ((`djxx`.`yhdm` = `yhb`.`user_id`) and (`yhb`.`user_yhxxdm` = `xx`.`yhxx_id`) and (`xx`.`yhxx_xldm` = `xlb`.`xl_id`) and (`xx`.`yhxx_jgdm` = `jgb`.`jg_id`) and (`xx`.`yhxx_mzdm` = `mzb`.`mz_id`) and (`xx`.`yhxx_xzzwdm` = `xzzwb`.`xzzw_id`) and (`xx`.`yhxx_zzmmdm` = `zzmmb`.`zzmm_id`) and (`xx`.`yhxx_dnzwdm` = `dnzwb`.`dnzw_id`) and (`xx`.`yhxx_bmdm` = `bmb`.`bm_id`) and (`xx`.`yhxx_zbdm` = `zbb`.`zb_id`));

-- ----------------------------
-- View structure for view_user_role_function
-- ----------------------------
DROP VIEW IF EXISTS `view_user_role_function`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_user_role_function` AS select `mkb`.`mk_id` AS `mk_id`,`mkb`.`mk_mc` AS `mk_mc`,`mkb`.`mk_code` AS `mk_code`,`mkb`.`mk_f_id` AS `mk_f_id`,`mkb`.`mk_sfsccd` AS `mk_sfsccd`,`mkb`.`mk_px` AS `mk_px`,`mkb`.`mk_url` AS `mk_url`,`mkb`.`mk_ms` AS `mk_ms`,`mkb`.`mk_icon` AS `mk_icon`,`mkb`.`mk_xgsj` AS `mk_xgsj`,`yhb`.`user_id` AS `user_id`,`yhb`.`user_mc` AS `user_mc`,`yh_xxb`.`yhxx_id` AS `yhxx_id`,`yh_xxb`.`yhxx_xm` AS `yhxx_xm`,`jsb`.`js_id` AS `js_id`,`jsb`.`js_mc` AS `js_mc`,`jsb`.`js_xgsj` AS `js_xgsj`,`jsb`.`js_code` AS `js_code`,`jsb`.`js_ms` AS `js_ms`,`jsb`.`js_yxj` AS `js_yxj` from (((((`yhb` join `yh_xxb`) join `yh_jsb`) join `jsb`) join `js_mk`) join `mkb`) where ((`yhb`.`user_yhxxdm` = `yh_xxb`.`yhxx_id`) and (`yhb`.`user_id` = `yh_jsb`.`yh_id`) and (`jsb`.`js_id` = `yh_jsb`.`js_id`) and (`jsb`.`js_id` = `js_mk`.`js_id`) and (`mkb`.`mk_id` = `js_mk`.`mk_id`));

-- ----------------------------
-- View structure for view_yhxx
-- ----------------------------
DROP VIEW IF EXISTS `view_yhxx`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_yhxx` AS select `xxb`.`yhxx_id` AS `yhxx_id`,`xxb`.`yhxx_xm` AS `yhxx_xm`,`xxb`.`yhxx_dhhm` AS `yhxx_dhhm`,`xxb`.`yhxx_xb` AS `yhxx_xb`,`xxb`.`yhxx_csrq` AS `yhxx_csrq`,`xxb`.`yhxx_sjh` AS `yhxx_sjh`,`xxb`.`yhxx_mj` AS `yhxx_mj`,`xxb`.`yhxx_yx` AS `yhxx_yx`,`xxb`.`yhxx_sfzh` AS `yhxx_sfzh`,`xxb`.`yhxx_tx` AS `yhxx_tx`,`xxb`.`yhxx_ms` AS `yhxx_ms`,`xxb`.`yhxx_da` AS `yhxx_da`,`a`.`xl_id` AS `xl_id`,`a`.`xl_mc` AS `xl_mc`,`b`.`zzmm_id` AS `zzmm_id`,`b`.`zzmm_mc` AS `zzmm_mc`,`c`.`jg_id` AS `jg_id`,`c`.`js_szs_id` AS `js_szs_id`,`c`.`js_szqx_mc` AS `js_szqx_mc`,`c`.`jg_szs_mc` AS `jg_szs_mc`,`d`.`mz_id` AS `mz_id`,`d`.`mz_mc` AS `mz_mc`,`e`.`dnzw_id` AS `dnzw_id`,`e`.`dnzw_mc` AS `dnzw_mc`,`e`.`dnzw_jb` AS `dnzw_jb`,`f`.`xzzw_id` AS `xzzw_id`,`f`.`xzzw_mc` AS `xzzw_mc`,`f`.`xzzw_jb` AS `xzzw_jb`,`g`.`bm_id` AS `bm_id`,`g`.`bm_mc` AS `bm_mc`,`h`.`zb_id` AS `zb_id`,`h`.`zb_mc` AS `zb_mc`,`h`.`zb_ssbmdm` AS `zb_ssbmdm`,`h`.`zb_lxdm` AS `zb_lxdm`,`h`.`zb_ms` AS `zb_ms`,`yh`.`user_id` AS `user_id`,`yh`.`user_mc` AS `user_mc`,`yh`.`user_pwk` AS `user_pwk`,`yh`.`user_mm` AS `user_mm`,`yh`.`user_wx_id` AS `user_wx_id`,`yh`.`user_wxm` AS `user_wxm`,`yh`.`user_ms` AS `user_ms`,`yh`.`user_cjrq` AS `user_cjrq`,`yh`.`user_yhxxdm` AS `user_yhxxdm`,`yh`.`user_ztdm` AS `user_ztId`,`zt`.`zt_mc` AS `user_ztMc` from ((((((((((`yh_xxb` `xxb` join `xlb` `a`) join `zzmmb` `b`) join `jgb` `c`) join `mzb` `d`) join `dnzwb` `e`) join `xzzwb` `f`) join `bmb` `g`) join `zbb` `h`) join `yhb` `yh`) join `yh_ztb` `zt`) where ((`xxb`.`yhxx_xldm` = `a`.`xl_id`) and (`xxb`.`yhxx_zzmmdm` = `b`.`zzmm_id`) and (`xxb`.`yhxx_jgdm` = `c`.`jg_id`) and (`xxb`.`yhxx_mzdm` = `d`.`mz_id`) and (`xxb`.`yhxx_dnzwdm` = `e`.`dnzw_id`) and (`xxb`.`yhxx_xzzwdm` = `f`.`xzzw_id`) and (`xxb`.`yhxx_bmdm` = `g`.`bm_id`) and (`xxb`.`yhxx_zbdm` = `h`.`zb_id`) and (`yh`.`user_yhxxdm` = `xxb`.`yhxx_id`) and (`yh`.`user_ztdm` = `zt`.`zt_id`));

SET FOREIGN_KEY_CHECKS = 1;
