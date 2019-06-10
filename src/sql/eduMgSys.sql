/*
Navicat MySQL Data Transfer

Source Server         : AliMysql
Source Server Version : 50723
Source Host           : 120.77.248.143:3306
Source Database       : eduMgSys

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-06-10 15:31:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom` (
  `uuid` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '元组唯一标识符',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教室编号',
  `build_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋名称',
  `floor` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼层',
  `room_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '房间号',
  `capacity` int(11) DEFAULT NULL COMMENT '教室容量',
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '教室状态',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='元组唯一标识符';

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES ('42c2c2f55cff11e9b2ad00163e0ed0cd', '10000', '2教', '4楼', '407', '67', '可用', '多媒体声音大  修改01');
INSERT INTO `classroom` VALUES ('ce38e52e5d2e11e9b2ad00163e0ed0cd', '10001', '第1实验楼', '1楼', '107', '50', '可用', '普通教室');
INSERT INTO `classroom` VALUES ('114d7b78764611e9a9cc00163e0ed0cd', '10002', '3教', '3楼', '407', '55', '可用', '发士大夫撒旦');
INSERT INTO `classroom` VALUES ('7576ec12785611e9a9cc00163e0ed0cd', '10003', '1教', '4楼', '401', '60', '可用', '多媒体声音大');
INSERT INTO `classroom` VALUES ('e654b92d789c11e9a9cc00163e0ed0cd', '10004', '3教', '3楼', '302', '50', '可用', '多媒体效果好');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `uuid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '元组唯一标识',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '科目编号',
  `course_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '科目名称',
  `course_hours` int(11) DEFAULT NULL COMMENT '课时',
  `course_book` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '科目教材',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('41c71dc0602b11e9a9cc00163e0ed0cd', '10000', '数据结构', '32', '数据结构 清华大学出版社');
INSERT INTO `course` VALUES ('60521ff761e311e9a9cc00163e0ed0cd', '10003', '数据库', '36', '数据库使用教程');
INSERT INTO `course` VALUES ('bc719881758811e9a9cc00163e0ed0cd', '10004', 'c语言程序设计', '32', 'C语言其实很简单');
INSERT INTO `course` VALUES ('3ebcd89e762311e9a9cc00163e0ed0cd', '10005', '计算机网络', '48', '计算机网络第六版');
INSERT INTO `course` VALUES ('f5c206cc764511e9a9cc00163e0ed0cd', '10006', '大学英语', '44', '大学英语三');
INSERT INTO `course` VALUES ('cfb14996785411e9a9cc00163e0ed0cd', '10008', '计算机导论', '18', '计算机导论课本');
INSERT INTO `course` VALUES ('b851e6c4785511e9a9cc00163e0ed0cd', '10009', '网页设计', '38', '网页设计编程');
INSERT INTO `course` VALUES ('73b5ad0a789d11e9a9cc00163e0ed0cd', '10010', '马克思主义基本原理', '20', '马克思主义基本原理');
INSERT INTO `course` VALUES ('84f0b4d8791811e9a9cc00163e0ed0cd', '10011', 'java程序语言设计', '32', 'java程序语言设计教材');

-- ----------------------------
-- Table structure for entity_course
-- ----------------------------
DROP TABLE IF EXISTS `entity_course`;
CREATE TABLE `entity_course` (
  `uuid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '元组唯一标识',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `course_id` int(11) DEFAULT NULL COMMENT '科目编号',
  `start_date` date DEFAULT NULL COMMENT '课程开始日期',
  `end_date` date DEFAULT NULL COMMENT '课程结束日期',
  `week` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT ' 上课星期',
  `str_time` int(11) DEFAULT NULL COMMENT '课程上课开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '课程上课结束时间',
  `cla_room_id` int(11) DEFAULT NULL COMMENT '上课教室id',
  `techer_id` int(11) DEFAULT NULL COMMENT '上课教师id',
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '课程状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100020 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of entity_course
-- ----------------------------
INSERT INTO `entity_course` VALUES ('6a851a1e61e611e9a9cc00163e0ed0cd', '100001', '10000', '2019-04-16', '2019-04-27', '星期三', '3', '4', '10001', '2008090003', '正在授课');
INSERT INTO `entity_course` VALUES ('a5e9e9b261f311e9a9cc00163e0ed0cd', '100003', '10003', '2019-04-19', '2019-04-19', '星期二', '1', '11', '10000', '2008090003', '已添加');
INSERT INTO `entity_course` VALUES ('beaae66a61f411e9a9cc00163e0ed0cd', '100008', '10000', '2019-04-19', '2019-04-19', '星期一', '1', '11', '10001', '2008090004', '已添加');
INSERT INTO `entity_course` VALUES ('dbd072a961f411e9a9cc00163e0ed0cd', '100009', '10003', '2019-04-19', '2019-04-19', '星期三', '1', '11', '10001', '2008090004', '待选课');
INSERT INTO `entity_course` VALUES ('3a659a3b62a811e9a9cc00163e0ed0cd', '100010', '10000', '2019-04-18', '2019-05-18', '星期二', '5', '6', '10001', '2008090003', '已添加');
INSERT INTO `entity_course` VALUES ('96e862eb758811e9a9cc00163e0ed0cd', '100011', '10000', '2019-05-13', '2019-05-25', '星期三', '5', '6', '10000', '2008090005', '已添加');
INSERT INTO `entity_course` VALUES ('04b86aa6758911e9a9cc00163e0ed0cd', '100012', '10004', '2019-05-07', '2019-12-14', '星期一', '7', '8', '10000', '2008090006', '正在授课');
INSERT INTO `entity_course` VALUES ('7e618fae762611e9a9cc00163e0ed0cd', '100013', '10005', '2019-05-14', '2019-05-30', '星期五', '5', '6', '10001', '2008090006', '待选课');
INSERT INTO `entity_course` VALUES ('995479ca762611e9a9cc00163e0ed0cd', '100014', '10000', '2019-05-14', '2019-05-23', '星期四', '10', '11', '10000', '2008090005', '已添加');
INSERT INTO `entity_course` VALUES ('acc1b161762611e9a9cc00163e0ed0cd', '100015', '10005', '2019-05-02', '2019-05-14', '星期二', '1', '2', '10001', '2008090005', '已结课');
INSERT INTO `entity_course` VALUES ('956ab3ed763111e9a9cc00163e0ed0cd', '100016', '10000', '2019-05-14', '2019-05-14', '星期四', '4', '8', '10001', '2008090005', '正在授课');
INSERT INTO `entity_course` VALUES ('2c342d82785611e9a9cc00163e0ed0cd', '100017', '10009', '2019-03-01', '2019-05-31', '星期三', '3', '4', '10000', '2008090005', '正在授课');
INSERT INTO `entity_course` VALUES ('a8fabeb0789d11e9a9cc00163e0ed0cd', '100018', '10010', '2019-03-01', '2019-05-31', '星期五', '5', '6', '10004', '2008090005', '已结课');
INSERT INTO `entity_course` VALUES ('86f28c3e791911e9a9cc00163e0ed0cd', '100019', '10011', '2019-05-03', '2019-05-18', '星期日', '1', '4', '10000', '2008090005', '待选课');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `uuid` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '唯一标识符',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '成绩id',
  `e_course_id` int(11) DEFAULT NULL COMMENT '课程id',
  `stu_id` int(11) DEFAULT NULL COMMENT '学生id',
  `grade` decimal(10,0) DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('96f9afc5762711e9a9cc00163e0ed0cd', '3', '100012', '2015090012', null);
INSERT INTO `grade` VALUES ('297888b0762b11e9a9cc00163e0ed0cd', '5', '100015', '2015090012', '76');
INSERT INTO `grade` VALUES ('882a42bf763411e9a9cc00163e0ed0cd', '9', '100016', '2015090012', null);
INSERT INTO `grade` VALUES ('144e92b8766011e9a9cc00163e0ed0cd', '10', '100013', '2015090012', null);
INSERT INTO `grade` VALUES ('4a9f0bf6785811e9a9cc00163e0ed0cd', '11', '100017', '2015090012', '69');
INSERT INTO `grade` VALUES ('f6b3972e789d11e9a9cc00163e0ed0cd', '12', '100018', '2015090012', '80');
INSERT INTO `grade` VALUES ('5bf0d5d0791911e9a9cc00163e0ed0cd', '13', '100013', '2015090013', null);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `uuid` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '元组唯一标识',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '点击菜单请求地址',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单名称',
  `leaf` bit(1) DEFAULT NULL COMMENT '是否叶子节点',
  `parentId` int(255) DEFAULT NULL COMMENT '父节点id',
  `role_uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属节点uuid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10020 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('b0ebede857a711e9b98500163e0ed0cd', '10003', 'renYuanGuanLi', '人员管理', '\0', '0', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('e137691857a711e9b98500163e0ed0cd', '10004', 'KeChengGuanLi', '课程管理', '\0', '0', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('4672aabb57a911e9b98500163e0ed0cd', '10005', 'app.view.personelMg.teachersMg', '教师管理', '', '10003', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('6338644c57a911e9b98500163e0ed0cd', '10006', 'app.view.personelMg.studentsMg', '学生管理', '', '10003', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('65b6341e57aa11e9b98500163e0ed0cd', '10007', 'app.view.personelMg.adminMg', '管理员管理', '', '10003', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('c72b110a57aa11e9b98500163e0ed0cd', '10008', 'app.view.courseMg.courseMg', '学科管理', '', '10004', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('dc0d560457aa11e9b98500163e0ed0cd', '10009', 'app.view.courseMg.entityCourseMg', '开课管理', '', '10004', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('7de559975b6511e9b2ad00163e0ed0cd', '10010', 'sheshiguanli', '设施管理', '\0', '0', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('f4a5b7d95b6511e9b2ad00163e0ed0cd', '10011', 'app.view.facilitiesMg.laboratoryMg', '实验室管理', '', '10010', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('4158d2355b6611e9b2ad00163e0ed0cd', '10012', 'xinxguanli', '信息管理', '\0', '0', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('68325d225b6611e9b2ad00163e0ed0cd', '10013', 'app.view.newsMg.newsMg', '竞赛信息', '', '10012', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('194ea55e5b6b11e9b2ad00163e0ed0cd', '10014', '教师课程', '课程', '\0', '0', 'fd22540a587611e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('792b99a55b6b11e9b2ad00163e0ed0cd', '10016', 'app.view.teaMyCourse.teaCourse', '我的课程', '', '10014', 'fd22540a587611e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('d9285bd46e7511e9a9cc00163e0ed0cd', '10017', '学生课程', '课程', '\0', '0', '1385f4a3587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('102784b16e7611e9a9cc00163e0ed0cd', '10018', 'app.view.student.stuChooseCourse', '选课', '', '10017', '1385f4a3587711e9b2ad00163e0ed0cd');
INSERT INTO `menu` VALUES ('e06bf266761811e9a9cc00163e0ed0cd', '10019', 'app.view.student.stuMyselfCourse', '我的课程', '', '10017', '1385f4a3587711e9b2ad00163e0ed0cd');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `uuid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '元组唯一标识符',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻编号',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻题目',
  `release_id` int(11) DEFAULT NULL COMMENT '发布编号',
  `release_date` datetime DEFAULT NULL COMMENT '发布时间',
  `details` text COLLATE utf8_unicode_ci COMMENT '新闻内容详情',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('f369a9316b3011e9a9cc00163e0ed0cd', '10006', '中国在太空有大动作？美国人惊呼:我们时间不多了', '10002', '2019-04-30 18:15:59', '<span style=\"color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">原标题：中国在太空又有大动作？美国人惊呼：快点，我们时间不多了！</span><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　参考消息网4月29日报道（文/董贝贝）在对太空领域的探索上，美国对中国的“紧盯”绝非一天两天了。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　而这种心态复杂的“惦记”，自今年1月“嫦娥”四号登陆月背以来，似乎愈演愈烈。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　“中国要着手在月球上建立科学研究基地！”</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　4月24日，美国多家媒体都报道了这一消息，称中国有意在十年内完成在月球南极建设科学研究站的计划。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　报道还指出，尽管关于中国长期月球计划的细节仍旧不详，但“中国国家航天局已经在探月方面迈出了重要的几步”。　很显然，对美国人而言，这是个大事情。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　而面对中国又一太空科研计划，有美国网友在社交媒体上揶揄美国总统特朗普，催促特朗普赶紧在美墨边境建墙和月球探索中做出选择。但显然，面对中国月球科研基地计划，美国作为先行者的心态有点“焦虑”——</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　正如《纽约邮报》所指出的那样：中国不是唯一考虑月球基地计划的国家。尤其是作为老牌探月国家的美国，更是早早制定出一系列月球开发的详细计划。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　与此同时，美国全国广播公司在今年年初的报道中也发出警告，“如果美国国家航空航天局在建造月球基地的项目上步履蹒跚，中国可能会采取行动，甚至加速这项任务”。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　《华尔街日报》则在本月初疾呼：“面对中国希望在未来十年内建立载人登月基地，美国应该做出回应”。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　考虑到美国总统特朗普认为月球开发也必须秉持的“美国优先”，美国舆论存在这种声音也不足为奇。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　不过，美国媒体虽然注意到这个信息，但却忽视了关键一点，中国在月球建立科研站是秉持着开放合作的心态。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　中国全国政协委员吴伟仁在今年3月份曾透露，未来十年左右，月球南极将出现中国主导、多国参与的月球科研站。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　<span style=\"font-weight: 700 !important;\">外国网友：“至少还有中国心怀宇宙”</span></p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　与美国方面对中国太空事业进步所表现出来的猜疑、忌惮心态形成鲜明对比的，是国外社交媒体上外国网友对中国太空行动的态度。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　在许多外国网友看来，中国下一步在月球开发方面的目标，不仅值得鼓励，更值得“感激”：当各国政府只顾眼前利益、没有考虑长远目标时，至少还有中国心怀宇宙。从这个意义上说，中国的成就无疑代表全人类在科学领域的进步。</p><p align=\"justify\" style=\"margin: 0px 0px 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px;\">　　也正如此前中国嫦娥四号成功着陆月背时收获大量外国网友的真心欢呼，此次面对中国拟建月球科研基地的消息，多数外国网友反应非常积极，表示期待中国带动世界和平利用太空。</p><div>水电费范德萨</div>', '2019-04-30 18:15:59');
INSERT INTO `news` VALUES ('35a2bffa764611e9a9cc00163e0ed0cd', '10007', '受贿7047万！陕西原副省长冯新柱被判15年罚700万', '10027', '2019-05-14 20:45:53', '<span style=\"background-color: rgb(249, 249, 249); color: rgb(25, 25, 25); font-family: &quot;\\&quot;PingFang SC\\&quot;,Arial,\\&quot;Microsoft yahei\\&quot;,simsun,\\&quot;sans-serif\\&quot;&quot;; font-size: 16px;\">2019年5月14日，浙江省杭州市中级人民法院公开宣判陕西省人民政府原副省长冯新柱受贿案，对被告人冯新柱以受贿罪判处有期徒刑十五年，并处罚金人民币七百万元；对冯新柱受贿犯罪所得赃款及其孳息予以追缴，上缴国库。冯新柱当庭表示服从判决，不上诉。</span><p style=\"margin: 10px 0px 20px; padding: 0px; list-style: none; line-height: 30px; font-size: 16px; word-break: break-all; color: rgb(25, 25, 25); font-family: &quot;\\&quot;PingFang SC\\&quot;,Arial,\\&quot;Microsoft yahei\\&quot;,simsun,\\&quot;sans-serif\\&quot;&quot;; background-color: rgb(249, 249, 249);\">经审理查明：1999年至2017年，被告人冯新柱利用担任陕西八大电力股份有限公司董事长，铜川市人民政府副市长、代市长、市长、中共铜川市委书记，陕西省人民政府副省长、杨凌农业高新技术产业示范区管委会主任等职务上的便利以及职权、地位形成的便利条件，为有关单位和个人在项目投资、矿产开发、资金借贷、工程承揽、职务调整等事项上提供帮助，直接或通过他人收受上述单位及个人给予的财物，共计折合人民币7047万余元。</p><p style=\"margin: 10px 0px 20px; padding: 0px; list-style: none; line-height: 30px; font-size: 16px; word-break: break-all; color: rgb(25, 25, 25); font-family: &quot;\\&quot;PingFang SC\\&quot;,Arial,\\&quot;Microsoft yahei\\&quot;,simsun,\\&quot;sans-serif\\&quot;&quot;; background-color: rgb(249, 249, 249);\">杭州市中级人民法院认为，被告人冯新柱的行为构成受贿罪，数额特别巨大，应依法惩处。鉴于冯新柱到案后能够如实供述自己的罪行，主动交代办案机关尚未掌握的大部分受贿犯罪事实，认罪悔罪，积极退赃，赃款赃物已全部追缴，依法可对其从轻处罚。法庭遂作出上述判决。</p>', '2019-05-14 20:45:53');
INSERT INTO `news` VALUES ('c684989b785611e9a9cc00163e0ed0cd', '10008', '北京市交通部门约谈滴滴出行：青桔单车未依法履行报备手续强行投放 责令回收', '10027', '2019-05-17 11:49:30', '<span style=\"background-color: rgb(255, 255, 255);\">​</span><span style=\"background-color: rgb(249, 249, 249); color: rgb(25, 25, 25); font-family: &quot;\\&quot;PingFang SC\\&quot;,Arial,\\&quot;Microsoft yahei\\&quot;,simsun,\\&quot;sans-serif\\&quot;&quot;; font-size: 16px;\">央视记者从北京市交通委获悉，近日，</span><span style=\"color: rgb(25, 25, 25); font-family: &quot;\\&quot;PingFang SC\\&quot;,Arial,\\&quot;Microsoft yahei\\&quot;,simsun,\\&quot;sans-serif\\&quot;&quot;; font-size: 16px; background-color: rgb(153, 204, 0);\">滴滴出行在北京市海淀区上地、中关村软件园、</span><span style=\"background-color: rgb(249, 249, 249); color: rgb(25, 25, 25); font-family: &quot;\\&quot;PingFang SC\\&quot;,Arial,\\&quot;Microsoft yahei\\&quot;,simsun,\\&quot;sans-serif\\&quot;&quot;; font-size: 16px;\">西二旗地铁站周边等区域投放新的青桔单车共计3000余辆，引发市民关注。</span><p style=\"background-color: rgb(249, 249, 249); margin: 10px 0px 20px; padding: 0px; list-style: none; line-height: 30px; font-size: 16px; word-break: break-all; color: rgb(25, 25, 25); font-family: &quot;\\&quot;PingFang SC\\&quot;,Arial,\\&quot;Microsoft yahei\\&quot;,simsun,\\&quot;sans-serif\\&quot;&quot;;\">5月16日上午，北京市交通部门对滴滴出行（北京小桔科技有限公司）进行约谈，指出其在未按照要求报备的情况下强行投放车辆，违反了《北京市非机动车管理条例》相关规定，严重扰乱了北京市互联网租赁自行车运营秩序。责令滴滴出行于5月16日下午进行车辆回收，5月17日12时前完成全部违规投放车辆的回收工作。同时，由市交通执法总队依法开展执法调查，并按程序对滴滴出行违规投放青桔单车一事实施处罚。5月17日12时前，滴滴出行如未完成车辆回收清理工作，由海淀区相关部门实施代清理。</p><p style=\"background-color: rgb(249, 249, 249); margin: 10px 0px 20px; padding: 0px; list-style: none; line-height: 30px; font-size: 16px; word-break: break-all; color: rgb(25, 25, 25); font-family: &quot;\\&quot;PingFang SC\\&quot;,Arial,\\&quot;Microsoft yahei\\&quot;,simsun,\\&quot;sans-serif\\&quot;&quot;;\">据悉，5月15日，海淀区交通委已就滴滴出行违规投放车辆问题进行了约谈，并要求滴滴出行相关部门负责人签署了承诺书，滴滴出行承诺将于5月16日6时前完成全部违规投放车辆的回收工作。但据海淀交通支队及上地街道办事处巡查情况反映，该企业并未按照承诺进行车辆回收，所投车辆仍于海淀区市政道路上进行运营。</p><p style=\"background-color: rgb(249, 249, 249); margin: 10px 0px 20px; padding: 0px; list-style: none; line-height: 30px; font-size: 16px; word-break: break-all; color: rgb(25, 25, 25); font-family: &quot;\\&quot;PingFang SC\\&quot;,Arial,\\&quot;Microsoft yahei\\&quot;,simsun,\\&quot;sans-serif\\&quot;&quot;;\">自5月13日起，北京市开展为期一个月的互联网租赁自行车专项治理行动，5月9日就召集各区和各互联网租赁自行车运营企业进行了部署，也下发了相关文件，滴滴出行此次违规投放青桔单车的行为情节非常严重，依法将必须给予严肃查处。下一步，市交通部门将继续加强对互联网租赁自行车市场的监管力度，重点针对乱停乱放、违规投放、破损废弃的互联网租赁自行车和违规投放的租赁电动自行车，予以清理或回收，并对相关责任企业依法查处，持续形成严查严管态势。</p>', '2019-05-17 11:49:30');
INSERT INTO `news` VALUES ('3793f79a789d11e9a9cc00163e0ed0cd', '10009', '战云密布！美国航母抵达阿拉伯海 伊朗全面戒备', '10027', '2019-05-17 20:13:44', '<span class=\"bjh-strong\" style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; font-size: 18px; font-weight: 700;\">海外网5月17日电</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 16px; text-align: justify;\">美国伊朗两国的关系近日越发紧张。最近，美国航母提前抵达阿拉伯海进行部署，而伊朗方面也表示做好了最高级别的防御准备。</span><p style=\"margin: 22px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial;\"><span class=\"bjh-p\">据福克斯新闻网16日报道，美国国防部官员称，美军的林肯号航母已提前两周抵达阿拉伯海。这些官员表示，航母上部署了F-18战机，其他的战舰上也有部署战斧巡航导弹。</span></p><p style=\"margin: 22px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial;\"><span class=\"bjh-p\">而伊朗方面也早有准备。15日，伊朗国防部部长阿米尔·哈塔米（Amir Hatami）强硬表态称，伊朗已做好最高级别的军事防御准备，以应对任何类型的威胁。他认为，伊朗将会击败美国及其盟友。</span></p>', '2019-05-17 20:13:44');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '元组唯一标识',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `secrity_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录框架角色名称',
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1000', 'fd22540a587611e9b2ad00163e0ed0cd', '教师', 'ROLE_TEACHER');
INSERT INTO `role` VALUES ('1001', '1385f4a3587711e9b2ad00163e0ed0cd', '学生', 'ROLE_STUDENT');
INSERT INTO `role` VALUES ('1002', '2237b983587711e9b2ad00163e0ed0cd', '管理员', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '元组唯一标识符',
  `user_uuid` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '对应用户uuid',
  `stu_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生编号',
  `stu_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT ' 学生姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `phone_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `college` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学院',
  `profession` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '专业',
  `in_sch_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入校学年',
  `stu_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`stu_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2015090017 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('08bff164719611e9a9cc00163e0ed0cd', '08bff164719611e9a9cc00163e0ed0cd', '2015090012', '小明', '20', '男', '12432545235', '计科院', '计本专业', '2015', '计本1班');
INSERT INTO `student` VALUES ('ec38fa31759211e9a9cc00163e0ed0cd', 'ec38fa31759211e9a9cc00163e0ed0cd', '2015090013', '小红', '19', '女', '321412421231232', '文学院', '师范', '2017', '二班');
INSERT INTO `student` VALUES ('cce04a2d764511e9a9cc00163e0ed0cd', 'cce04a2d764511e9a9cc00163e0ed0cd', '2015090014', '小蓝', '19', '女', '214344132412', '计科院', '计本', '2018', '1班');
INSERT INTO `student` VALUES ('19be2714785311e9a9cc00163e0ed0cd', '19be2714785311e9a9cc00163e0ed0cd', '2015090015', '小紫', '18', '男', '23231232132', '计科院', '软本', '2015', '2班');
INSERT INTO `student` VALUES ('ae411799789c11e9a9cc00163e0ed0cd', 'ae411799789c11e9a9cc00163e0ed0cd', '2015090016', '小雪', '22', '女', '1154646897', '计算机科学与工程', '计算机科学与技术', '2015', '1班');

-- ----------------------------
-- Table structure for sysadmin
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin`;
CREATE TABLE `sysadmin` (
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '元组唯一标识',
  `ad_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `ad_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '管理员姓名',
  `age` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '年龄',
  `sex` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `phone_num` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `user_uuid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对应用户uuid',
  PRIMARY KEY (`ad_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2017090020 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sysadmin
-- ----------------------------
INSERT INTO `sysadmin` VALUES ('f4846687719211e9a9cc00163e0ed0cd', '2017090018', '杨峰', '18', '男', '1321432143254', 'f4846687719211e9a9cc00163e0ed0cd');
INSERT INTO `sysadmin` VALUES ('e3c41243764511e9a9cc00163e0ed0cd', '2017090019', '王管理', '54', '男', '32143243124', 'e3c41243764511e9a9cc00163e0ed0cd');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '元组唯一标识',
  `tea_num` int(255) NOT NULL AUTO_INCREMENT COMMENT '教师编号',
  `tea_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '教师姓名',
  `age` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '年龄',
  `sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `phone_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `college` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学院',
  `in_sch_year` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入校学年',
  `user_uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对应用户uuid',
  PRIMARY KEY (`tea_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2008090011 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('a6029eae719511e9a9cc00163e0ed0cd', '2008090005', '王老师', '37', '男', '18515771823', '计算机科学与工程许愿', '2015', 'a6029eae719511e9a9cc00163e0ed0cd');
INSERT INTO `teacher` VALUES ('e16a594a758811e9a9cc00163e0ed0cd', '2008090006', '李老师', '34', '女', '1242435435454', '计算机科学与工程学院', '2008', 'e16a594a758811e9a9cc00163e0ed0cd');
INSERT INTO `teacher` VALUES ('b0bb1f8f764511e9a9cc00163e0ed0cd', '2008090007', '张老师', '27', '女', '12325415432432', '文学院', '2015', 'b0bb1f8f764511e9a9cc00163e0ed0cd');
INSERT INTO `teacher` VALUES ('5f97c375785311e9a9cc00163e0ed0cd', '2008090008', '郑老师', '45', '男', '214213241414232', '环化学院', '2018', '5f97c375785311e9a9cc00163e0ed0cd');
INSERT INTO `teacher` VALUES ('852970c9786a11e9a9cc00163e0ed0cd', '2008090009', '刘老师', '32', '男', '12345645', '体育学院', '2015', '852970c9786a11e9a9cc00163e0ed0cd');
INSERT INTO `teacher` VALUES ('539643a3789c11e9a9cc00163e0ed0cd', '2008090010', '袁老师', '45', '女', '13564646446', '计算机科学与工程', '2015', '539643a3789c11e9a9cc00163e0ed0cd');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '元组唯一标识',
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `user_psd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `info_table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对应人员所属表结构',
  `info_uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对应人员uuid',
  `role_uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对应角色uuid',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10040 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('f4846687719211e9a9cc00163e0ed0cd', '10027', '2017090018', '1cd7bec55712e165f0f65ad31d9926ae', 'sysadmin', 'f4846687719211e9a9cc00163e0ed0cd', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('a6029eae719511e9a9cc00163e0ed0cd', '10028', '2008090005', '806ccc0ca2ec49f1097df877d35589ba', 'teacher', 'a6029eae719511e9a9cc00163e0ed0cd', 'fd22540a587611e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('08bff164719611e9a9cc00163e0ed0cd', '10029', '2015090012', 'abc3043a82d9b3ef4f4c63034a220fc6', 'student', '08bff164719611e9a9cc00163e0ed0cd', '1385f4a3587711e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('e16a594a758811e9a9cc00163e0ed0cd', '10030', '2008090006', '3253a2013b4d5b009021e7155dde98c8', 'teacher', 'e16a594a758811e9a9cc00163e0ed0cd', 'fd22540a587611e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('ec38fa31759211e9a9cc00163e0ed0cd', '10031', '2015090013', 'bdf2a0f8fa592dd8e976d1a728c8ee7d', 'student', 'ec38fa31759211e9a9cc00163e0ed0cd', '1385f4a3587711e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('b0bb1f8f764511e9a9cc00163e0ed0cd', '10032', '2008090007', '7a852bc44431d65f1309eeff024d381e', 'teacher', 'b0bb1f8f764511e9a9cc00163e0ed0cd', 'fd22540a587611e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('cce04a2d764511e9a9cc00163e0ed0cd', '10033', '2015090014', 'a88b0d0357a9403513178bfb131b8ca0', 'student', 'cce04a2d764511e9a9cc00163e0ed0cd', '1385f4a3587711e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('e3c41243764511e9a9cc00163e0ed0cd', '10034', '2017090019', 'f73080ddf0d330a87dab18f183f63ea1', 'sysadmin', 'e3c41243764511e9a9cc00163e0ed0cd', '2237b983587711e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('19be2714785311e9a9cc00163e0ed0cd', '10035', '2015090015', '7385f3d0ca800d2ac66ee4b982d6fa3f', 'student', '19be2714785311e9a9cc00163e0ed0cd', '1385f4a3587711e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('5f97c375785311e9a9cc00163e0ed0cd', '10036', '2008090008', 'e903c165449e29b3b034881b614a27e1', 'teacher', '5f97c375785311e9a9cc00163e0ed0cd', 'fd22540a587611e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('852970c9786a11e9a9cc00163e0ed0cd', '10037', '2008090009', '52d4350cc36061abe6646fd2e3f7d1f8', 'teacher', '852970c9786a11e9a9cc00163e0ed0cd', 'fd22540a587611e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('539643a3789c11e9a9cc00163e0ed0cd', '10038', '2008090010', '08896fd23b4f2ffb346a57e195a18b0e', 'teacher', '539643a3789c11e9a9cc00163e0ed0cd', 'fd22540a587611e9b2ad00163e0ed0cd');
INSERT INTO `user` VALUES ('ae411799789c11e9a9cc00163e0ed0cd', '10039', '2015090016', 'd92cd930c3a4d1a59dcf3f52cf8e8f96', 'student', 'ae411799789c11e9a9cc00163e0ed0cd', '1385f4a3587711e9b2ad00163e0ed0cd');
