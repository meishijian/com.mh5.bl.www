/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : mh5_bl_app

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 25/02/2020 19:47:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bl_address
-- ----------------------------
DROP TABLE IF EXISTS `bl_address`;
CREATE TABLE `bl_address`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '收货信息表',
  `shr_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人姓名',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号码',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '市',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `isdefault` tinyint(3) UNSIGNED NOT NULL COMMENT '是否默认，0：不是  1：是',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户ID 关联shop_users 表中的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_address
-- ----------------------------
INSERT INTO `bl_address` VALUES (1, '张三', '17553041262', '江苏', '宿迁', '沭阳', '传智', 0, 1);
INSERT INTO `bl_address` VALUES (2, '账上', '17553041262', '江苏', '宿迁', '沭阳', '传智', 0, 2);
INSERT INTO `bl_address` VALUES (3, '没时间', '17553011262', '北京', '南京', '扣款', '123', 0, 1);
INSERT INTO `bl_address` VALUES (4, 'sad时间', '17553011262', 'sd京', '南sd', '扣2', '123', 0, 1);
INSERT INTO `bl_address` VALUES (5, '没时间', '17553011262', '北京', '南京', '扣款', '123', 0, 1);
INSERT INTO `bl_address` VALUES (6, '都', '17553011262', '北京', '南京', '扣款', '123', 0, 1);
INSERT INTO `bl_address` VALUES (7, '213', '17553041262', '河北省', '唐山市', '路南区', '杭州市西湖区 黄龙万科中心', 0, 2);
INSERT INTO `bl_address` VALUES (8, '123', '17553041262', '辽宁省', '大连市', '西岗区', '杭州市西湖区 黄龙万科中心', 0, 3);
INSERT INTO `bl_address` VALUES (9, '123', '17553041262', '辽宁省', '大连市', '西岗区', '杭州市西湖区 黄龙万科中心', 0, 4);
INSERT INTO `bl_address` VALUES (10, '123', '17553041262', '辽宁省', '大连市', '西岗区', '杭州市西湖区 黄龙万科中心', 0, 5);
INSERT INTO `bl_address` VALUES (11, '撒旦', '17553041262', '辽宁省', '大连市', '西岗区', '杭州市西湖区 黄龙万科中心', 0, 5);
INSERT INTO `bl_address` VALUES (12, 'rtrrt', '17553041262', '河北省', '唐山市', '路南区', '杭州市西湖区 黄龙万科中心', 0, 2);
INSERT INTO `bl_address` VALUES (13, 'fjhgf', '17553041262', '内蒙古自治区', '呼和浩特市', '回民区', '杭州市西湖区 黄龙万科中心', 0, 3);
INSERT INTO `bl_address` VALUES (14, '啊啊啊', '17553041262', '山西省', '太原市', '尖草坪区', '杭州市西湖区 黄龙万科中心', 0, 5);
INSERT INTO `bl_address` VALUES (15, '移动', '18573522318', '黑龙江省', '哈尔滨市', '道里区', '杭州市西湖区 黄龙万科中心', 1, 1);
INSERT INTO `bl_address` VALUES (16, '没时间', '17553041262', '内蒙古自治区', '呼和浩特市', '新城区', '杭州市西湖区 黄龙万科中心', 0, 8);
INSERT INTO `bl_address` VALUES (17, 'zX', '17553041262', '北京市', '北京市', '东城区', '杭州市西湖区 黄龙万科中心', 1, 8);
INSERT INTO `bl_address` VALUES (18, 'msj', '17553041262', '浙江省', '衢州市', '江山市', '杭州市西湖区 黄龙万科中心', 1, 9);

-- ----------------------------
-- Table structure for bl_brand
-- ----------------------------
DROP TABLE IF EXISTS `bl_brand`;
CREATE TABLE `bl_brand`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bra_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品牌名称',
  `bra_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品牌路径',
  `bra_region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区',
  `bra_introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺 用户名 手机号\r\n',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺 md5 密码 固定长度\r\n',
  `regtime` int(10) UNSIGNED NOT NULL COMMENT '注册用户的时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_brand
-- ----------------------------
INSERT INTO `bl_brand` VALUES (1, '宝鼎', 'http://img13.iblimg.com/goods-135/images/brand/baodin.jpg', NULL, NULL, '17553041261', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (2, '小林', 'http://img15.iblimg.com/goods-135/images/brand/1752381546.jpg', NULL, NULL, '17553041262', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (3, '汤米·希尔费格', 'http://img14.iblimg.com/goods-135/images/brand/487325877.jpg', NULL, NULL, '17553041263', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (4, 'VVC', 'http://img13.iblimg.com/goods-135/images/brand/2018/07/2115186464.jpg', NULL, NULL, '17553041264', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (5, '荟智', 'http://img15.iblimg.com/goods-135/images/brand/2018/06/2075061295.jpg', NULL, NULL, '17553041265', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (6, '苏秘37°', 'http://img11.iblimg.com/goods-135/images/brand/1413650448.jpg', NULL, NULL, '17553041266', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (7, '北美电器', 'http://img13.iblimg.com/goods-135/images/brand/ACA.jpg', NULL, NULL, '17553041267', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (8, '圣碧涛', 'http://img11.iblimg.com/goods-135/images/brand/san-benedetto.jpg', NULL, NULL, '17553041268', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (9, '脉动', 'http://img11.iblimg.com/goods-135/images/brand/2019/04/220373909.jpg', NULL, NULL, '17553041269', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (10, '加州乐事', 'http://img14.iblimg.com/goods-135/images/brand/jiazhouleshi.jpg', NULL, NULL, '17553041210', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (11, '鹿客', 'http://img11.iblimg.com/goods-135/images/brand/2086225538.jpg', NULL, NULL, '17553041211', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (12, '伊丽莎白雅顿', 'http://img12.iblimg.com/goods-135/images/brand/1471072625.jpg', NULL, NULL, '17553041212', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (14, '美年达', 'http://img15.iblimg.com/goods-135/images/brand/mirinda.jpg', NULL, NULL, '17553041213', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (15, '安牧家', 'http://img11.iblimg.com/goods-135/images/brand/2018/10/933767886.jpg', NULL, NULL, '17553041214', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (16, 'ATEX', 'http://img14.iblimg.com/goods-135/images/brand/721423545.jpg', NULL, NULL, '17553041215', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (17, '卡力特', 'http://img14.iblimg.com/goods-135/images/brand/1020525529.jpg', NULL, NULL, '17553041216', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (18, '圣醒', 'http://img11.iblimg.com/goods-135/images/brand/2018/03/1716497286.jpg', NULL, NULL, '17553041217', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (19, '网易严选', 'http://img12.iblimg.com/goods-135/images/brand/2018/07/1079022417.jpg', NULL, NULL, '17553041218', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (20, '茶花', 'http://img15.iblimg.com/goods-135/images/brand/chahua.jpg', NULL, NULL, '17553041219', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (21, '蝶翠诗', 'http://img15.iblimg.com/goods-135/images/brand/DHC.jpg', NULL, NULL, '17553041220', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (22, '东芝', 'http://img11.iblimg.com/goods-135/images/brand/dongzhi.jpg', NULL, NULL, '17553041221', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (23, '妙思乐', 'http://img12.iblimg.com/goods-135/images/brand/miaosile.jpg', NULL, NULL, '17553041222', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (24, '欧井', 'http://img13.iblimg.com/goods-135/images/brand/oujing.jpg', NULL, NULL, '17553041223', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (25, '海底捞', 'http://img12.iblimg.com/goods-135/images/brand/1426590711.jpg', NULL, NULL, '17553041224', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (26, '好丽友', 'http://img13.iblimg.com/goods-135/images/brand/6.jpg', NULL, NULL, '17553041225', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (27, '斯泰得乐', 'http://img13.iblimg.com/goods-135/images/brand/Stadler-Form(1).jpg', NULL, NULL, '17553041226', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (28, 'ELLE HOMME', 'http://img15.iblimg.com/goods-135/images/brand/2018/05/11091467.jpeg', NULL, NULL, '17553041227', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (29, '刘门果园', 'http://img12.iblimg.com/goods-135/images/brand/2019/04/2131162335.jpg', NULL, NULL, '17553041228', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (30, '乐维萨', 'http://img14.iblimg.com/goods-135/images/brand/Lavazza.jpg', NULL, NULL, '17553041229', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (31, '卡乐比', 'http://img15.iblimg.com/goods-135/images/brand/CLEBI(1).jpg', NULL, NULL, '17553041230', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (32, '锐澳', 'http://img13.iblimg.com/goods-135/images/brand/726106177.jpg', NULL, NULL, '17553041231', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (33, '茱蒂丝', 'http://img11.iblimg.com/goods-135/images/brand/zhudisi.jpg', NULL, NULL, '17553041232', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (34, '王子', 'http://img14.iblimg.com/goods-135/images/brand/2018/12/326711829.jpg', NULL, NULL, '17553041233', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (35, '贝亲', 'http://img14.iblimg.com/goods-135/images/brand/pigeon.jpg', NULL, NULL, '17553041234', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (36, '酣畅', 'http://img11.iblimg.com/goods-135/images/brand/1272281118.jpg', NULL, NULL, '17553041235', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (37, '滴露', 'http://img15.iblimg.com/goods-135/images/brand/dilu.jpg', NULL, NULL, '17553041236', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (38, '雪肌精', 'http://img11.iblimg.com/goods-135/images/brand/xuejijing.jpg', NULL, NULL, '17553041237', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (39, '龙溪', 'http://img15.iblimg.com/goods-135/images/brand/longxi.jpg', NULL, NULL, '17553041238', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (40, '妙而舒', 'http://img12.iblimg.com/goods-135/images/brand/merries.jpg', NULL, NULL, '17553041239', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (41, '苏菲', 'http://img13.iblimg.com/goods-135/images/brand/sufei.jpg', NULL, NULL, '17553041240', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (42, '双枪', 'http://img15.iblimg.com/goods-135/images/brand/shuagnqiang.jpg', NULL, NULL, '17553041241', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (43, '德运', 'http://img11.iblimg.com/goods-135/images/brand/deyun.jpg', NULL, NULL, '17553041242', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (44, '腾龙', 'http://img13.iblimg.com/goods-135/images/brand/TAMRON.jpg', NULL, NULL, '17553041243', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (45, '九阳', 'http://img15.iblimg.com/goods-135/images/brand/JOYOUNG.jpg', NULL, NULL, '17553041244', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (46, 'SUQQU', 'http://img13.iblimg.com/goods-135/images/brand/671104255.jpg', NULL, NULL, '17553041245', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (47, '漫步者', 'http://img13.iblimg.com/goods-135/images/brand/EDIFIER.jpg', NULL, NULL, '17553041246', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (48, '曼丹', 'http://img14.iblimg.com/goods-135/images/brand/342764299.jpg', NULL, NULL, '17553041247', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);
INSERT INTO `bl_brand` VALUES (49, '阿三鼎', 'http://img13.iblimg.com/goods-135/images/brand/baodin.jpg', NULL, NULL, '17553041248', '96597773c8e79ab3fb26fb82b1c68163', 1582525248);

-- ----------------------------
-- Table structure for bl_categories
-- ----------------------------
DROP TABLE IF EXISTS `bl_categories`;
CREATE TABLE `bl_categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '大标题下的小标题',
  `class_id` int(10) UNSIGNED NOT NULL COMMENT '连接 分类表',
  `cat_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_categories
-- ----------------------------
INSERT INTO `bl_categories` VALUES (1, 1, '进口美容护肤');
INSERT INTO `bl_categories` VALUES (2, 1, '进口个人护理');
INSERT INTO `bl_categories` VALUES (3, 1, '进口母婴');
INSERT INTO `bl_categories` VALUES (4, 1, '进口美食 进口营养保健');
INSERT INTO `bl_categories` VALUES (5, 1, '进口牛奶 冲饮 酒水');
INSERT INTO `bl_categories` VALUES (6, 1, '进口家庭清洁');
INSERT INTO `bl_categories` VALUES (7, 1, '进口品质家居');
INSERT INTO `bl_categories` VALUES (8, 1, '进口鞋靴箱包');
INSERT INTO `bl_categories` VALUES (9, 1, '进口饰品 进口手表');
INSERT INTO `bl_categories` VALUES (10, 2, '新鲜水果');
INSERT INTO `bl_categories` VALUES (11, 2, '精选肉类');
INSERT INTO `bl_categories` VALUES (12, 2, '海鲜水产');
INSERT INTO `bl_categories` VALUES (13, 2, '禽蛋类');
INSERT INTO `bl_categories` VALUES (14, 2, '冷冻速食');
INSERT INTO `bl_categories` VALUES (15, 2, '乳品烘焙');
INSERT INTO `bl_categories` VALUES (16, 2, '熟食方便菜');
INSERT INTO `bl_categories` VALUES (17, 3, '饼干糕点');
INSERT INTO `bl_categories` VALUES (18, 3, '休闲零食');
INSERT INTO `bl_categories` VALUES (19, 3, '食用油');
INSERT INTO `bl_categories` VALUES (20, 3, '米面粮');
INSERT INTO `bl_categories` VALUES (21, 3, '南北干货');
INSERT INTO `bl_categories` VALUES (22, 3, '方便速食');
INSERT INTO `bl_categories` VALUES (23, 3, '厨房调味');
INSERT INTO `bl_categories` VALUES (24, 4, '乳品');
INSERT INTO `bl_categories` VALUES (25, 4, '咖啡');
INSERT INTO `bl_categories` VALUES (26, 4, '茶叶');
INSERT INTO `bl_categories` VALUES (27, 4, '冲调饮品');
INSERT INTO `bl_categories` VALUES (28, 4, '饮料');
INSERT INTO `bl_categories` VALUES (29, 5, '面部护肤');
INSERT INTO `bl_categories` VALUES (30, 5, '美发护发');
INSERT INTO `bl_categories` VALUES (31, 5, '沐浴护理');
INSERT INTO `bl_categories` VALUES (32, 5, '彩妆');
INSERT INTO `bl_categories` VALUES (33, 5, '女性护理');
INSERT INTO `bl_categories` VALUES (34, 5, '口腔护理');
INSERT INTO `bl_categories` VALUES (35, 5, '男士护肤');
INSERT INTO `bl_categories` VALUES (36, 5, '美容工具 洗护用具');
INSERT INTO `bl_categories` VALUES (37, 6, '奶粉/辅食/营养品');
INSERT INTO `bl_categories` VALUES (38, 6, '尿裤/湿巾');
INSERT INTO `bl_categories` VALUES (39, 6, '宝宝洗护');
INSERT INTO `bl_categories` VALUES (40, 6, '哺育喂养用品');
INSERT INTO `bl_categories` VALUES (41, 6, '玩具');
INSERT INTO `bl_categories` VALUES (42, 6, '孕妈专区');
INSERT INTO `bl_categories` VALUES (43, 6, '婴童车床');
INSERT INTO `bl_categories` VALUES (44, 6, '童装童鞋');
INSERT INTO `bl_categories` VALUES (45, 6, '婴幼家纺');
INSERT INTO `bl_categories` VALUES (46, 6, '绘本图书');
INSERT INTO `bl_categories` VALUES (47, 7, '厨具锅具');
INSERT INTO `bl_categories` VALUES (48, 7, '餐具水具');
INSERT INTO `bl_categories` VALUES (49, 7, '床上用品');
INSERT INTO `bl_categories` VALUES (50, 7, '家纺布艺');
INSERT INTO `bl_categories` VALUES (51, 7, '收纳洗晒');
INSERT INTO `bl_categories` VALUES (52, 7, '居家日用');
INSERT INTO `bl_categories` VALUES (53, 7, '家饰绿植');
INSERT INTO `bl_categories` VALUES (54, 7, '家装建材');
INSERT INTO `bl_categories` VALUES (55, 7, '家具');
INSERT INTO `bl_categories` VALUES (56, 7, '宠物用品');
INSERT INTO `bl_categories` VALUES (57, 8, '纸制品');
INSERT INTO `bl_categories` VALUES (58, 8, '衣物清洁护理');
INSERT INTO `bl_categories` VALUES (59, 8, '厨卫清洁');
INSERT INTO `bl_categories` VALUES (60, 8, '居室清洁');
INSERT INTO `bl_categories` VALUES (61, 8, '一次性用品');
INSERT INTO `bl_categories` VALUES (62, 8, '清洁/卫浴用品');
INSERT INTO `bl_categories` VALUES (63, 9, '女士上装');
INSERT INTO `bl_categories` VALUES (64, 9, '女士裤装');
INSERT INTO `bl_categories` VALUES (65, 9, '女士裙装/套装');
INSERT INTO `bl_categories` VALUES (66, 9, '男士上装');
INSERT INTO `bl_categories` VALUES (67, 9, '男士裤装');
INSERT INTO `bl_categories` VALUES (68, 9, '内衣/内裤/袜子');
INSERT INTO `bl_categories` VALUES (69, 9, '文胸塑身');
INSERT INTO `bl_categories` VALUES (70, 9, '睡衣/家居服');
INSERT INTO `bl_categories` VALUES (71, 9, '服饰配件');
INSERT INTO `bl_categories` VALUES (72, 10, '女鞋');
INSERT INTO `bl_categories` VALUES (73, 10, '潮流女包');
INSERT INTO `bl_categories` VALUES (74, 10, '精品男包');
INSERT INTO `bl_categories` VALUES (75, 10, '男鞋');
INSERT INTO `bl_categories` VALUES (76, 10, '功能箱包');
INSERT INTO `bl_categories` VALUES (77, 11, '眼镜');
INSERT INTO `bl_categories` VALUES (78, 11, '流行饰品');
INSERT INTO `bl_categories` VALUES (79, 11, '金银珠宝');
INSERT INTO `bl_categories` VALUES (80, 11, '腕表');
INSERT INTO `bl_categories` VALUES (81, 12, '手机通讯');
INSERT INTO `bl_categories` VALUES (82, 12, '摄影摄像');
INSERT INTO `bl_categories` VALUES (83, 12, '时尚影音');
INSERT INTO `bl_categories` VALUES (84, 12, '智能设备');
INSERT INTO `bl_categories` VALUES (85, 12, '手机/数码配件');
INSERT INTO `bl_categories` VALUES (86, 12, '电子教育');
INSERT INTO `bl_categories` VALUES (87, 13, '电脑整机');
INSERT INTO `bl_categories` VALUES (88, 13, '电脑外设');
INSERT INTO `bl_categories` VALUES (89, 13, '网络设备');
INSERT INTO `bl_categories` VALUES (90, 13, '办公打印/耗材');
INSERT INTO `bl_categories` VALUES (91, 13, '办公文仪');
INSERT INTO `bl_categories` VALUES (92, 13, '学生文具');
INSERT INTO `bl_categories` VALUES (93, 14, '平板电视');
INSERT INTO `bl_categories` VALUES (94, 14, '空调');
INSERT INTO `bl_categories` VALUES (95, 14, '洗衣机');
INSERT INTO `bl_categories` VALUES (96, 14, '冰箱');
INSERT INTO `bl_categories` VALUES (97, 14, '厨卫大家电');
INSERT INTO `bl_categories` VALUES (98, 14, '中式厨房小电');
INSERT INTO `bl_categories` VALUES (99, 14, '西式厨房小电');
INSERT INTO `bl_categories` VALUES (100, 14, '生活电器');
INSERT INTO `bl_categories` VALUES (101, 14, '个护健康');
INSERT INTO `bl_categories` VALUES (102, 14, '影音视听');
INSERT INTO `bl_categories` VALUES (103, 15, '运动鞋服');
INSERT INTO `bl_categories` VALUES (104, 15, '户外鞋服');
INSERT INTO `bl_categories` VALUES (105, 15, '户外装备');
INSERT INTO `bl_categories` VALUES (106, 15, '运动器材');
INSERT INTO `bl_categories` VALUES (107, 16, '汽车养护');
INSERT INTO `bl_categories` VALUES (108, 16, '车载电器');
INSERT INTO `bl_categories` VALUES (109, 16, '汽车内饰 应急救援');
INSERT INTO `bl_categories` VALUES (110, 16, '美容清洗');
INSERT INTO `bl_categories` VALUES (111, 17, '夏季“清”补');
INSERT INTO `bl_categories` VALUES (112, 17, '进口保健品');
INSERT INTO `bl_categories` VALUES (113, 17, '传统滋补养生');
INSERT INTO `bl_categories` VALUES (114, 17, '基础营养');
INSERT INTO `bl_categories` VALUES (115, 17, '动植物提取物');
INSERT INTO `bl_categories` VALUES (116, 17, '维生素/矿物质');
INSERT INTO `bl_categories` VALUES (117, 17, '适用人群');
INSERT INTO `bl_categories` VALUES (118, 18, '文艺图书');
INSERT INTO `bl_categories` VALUES (119, 18, '少儿童书');
INSERT INTO `bl_categories` VALUES (120, 18, '人文社科');
INSERT INTO `bl_categories` VALUES (121, 18, '生活时尚');
INSERT INTO `bl_categories` VALUES (122, 18, '科学技术');
INSERT INTO `bl_categories` VALUES (123, 18, '教育考试');
INSERT INTO `bl_categories` VALUES (124, 19, '百联礼品卡');
INSERT INTO `bl_categories` VALUES (125, 19, '百联实体卡');
INSERT INTO `bl_categories` VALUES (126, 19, '百联卡面值');
INSERT INTO `bl_categories` VALUES (127, 19, '食品礼券');

-- ----------------------------
-- Table structure for bl_classify
-- ----------------------------
DROP TABLE IF EXISTS `bl_classify`;
CREATE TABLE `bl_classify`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品大标题表',
  `cla_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品大标题名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_classify
-- ----------------------------
INSERT INTO `bl_classify` VALUES (1, '百联进口');
INSERT INTO `bl_classify` VALUES (2, '生鲜食品');
INSERT INTO `bl_classify` VALUES (3, '食品粮油');
INSERT INTO `bl_classify` VALUES (4, '酒水冲饮');
INSERT INTO `bl_classify` VALUES (5, '美容护理');
INSERT INTO `bl_classify` VALUES (6, '母婴专区');
INSERT INTO `bl_classify` VALUES (7, '家居餐厨');
INSERT INTO `bl_classify` VALUES (8, '厨卫清洁');
INSERT INTO `bl_classify` VALUES (9, '服饰内衣');
INSERT INTO `bl_classify` VALUES (10, '鞋靴箱包');
INSERT INTO `bl_classify` VALUES (11, '腕表饰品');
INSERT INTO `bl_classify` VALUES (12, '手机数码');
INSERT INTO `bl_classify` VALUES (13, '电脑办公 ');
INSERT INTO `bl_classify` VALUES (14, '家用电器');
INSERT INTO `bl_classify` VALUES (15, '运动户外');
INSERT INTO `bl_classify` VALUES (16, '汽车用品');
INSERT INTO `bl_classify` VALUES (17, '营养保健');
INSERT INTO `bl_classify` VALUES (18, '图书音像');
INSERT INTO `bl_classify` VALUES (19, '礼品卡');

-- ----------------------------
-- Table structure for bl_goods
-- ----------------------------
DROP TABLE IF EXISTS `bl_goods`;
CREATE TABLE `bl_goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品',
  `cat_id` int(11) UNSIGNED NOT NULL COMMENT '连接分类表',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '商品价格',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品图片',
  `stock` int(255) UNSIGNED NOT NULL COMMENT '商品数量',
  `service` tinyint(1) UNSIGNED NOT NULL COMMENT '服务 比如 0 百股自营 1跨境',
  `volume` int(255) UNSIGNED NULL DEFAULT NULL COMMENT '销量',
  `brand_id` int(11) UNSIGNED NOT NULL COMMENT '商品店铺ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_goods
-- ----------------------------
INSERT INTO `bl_goods` VALUES (1, 1, 'SISLEY 希思黎 全能乳液 125ml', 1315.00, 'uploads\\20200224\\1582539996511.png', 9975, 0, NULL, 1);
INSERT INTO `bl_goods` VALUES (2, 1, 'Kiehls 科颜氏 高保湿面霜 125ml', 450.00, 'uploads\\20200224\\1582540137480.png', 12232, 1, NULL, 5);
INSERT INTO `bl_goods` VALUES (3, 1, '奥尔滨 Albion 清新活润渗透乳（保湿型） 200g 奥比虹 日本进口', 360.00, 'uploads\\20200225\\1582631110526.png', 999, 1, NULL, 6);

-- ----------------------------
-- Table structure for bl_goods_details
-- ----------------------------
DROP TABLE IF EXISTS `bl_goods_details`;
CREATE TABLE `bl_goods_details`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品详情Id',
  `goods_id` int(11) UNSIGNED NOT NULL COMMENT '连接 商品id',
  `goods_details_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详情图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_goods_details
-- ----------------------------
INSERT INTO `bl_goods_details` VALUES (1, 1, 'uploads\\20200224\\1582540012519.png');
INSERT INTO `bl_goods_details` VALUES (2, 1, 'uploads\\20200224\\1582540022154.png');
INSERT INTO `bl_goods_details` VALUES (3, 1, 'uploads\\20200224\\1582540050487.png');
INSERT INTO `bl_goods_details` VALUES (4, 1, 'uploads\\20200224\\1582540056388.png');
INSERT INTO `bl_goods_details` VALUES (5, 2, 'uploads\\20200224\\1582540160988.png');
INSERT INTO `bl_goods_details` VALUES (6, 2, 'uploads\\20200224\\1582540166223.png');
INSERT INTO `bl_goods_details` VALUES (7, 2, 'uploads\\20200224\\1582540173602.png');
INSERT INTO `bl_goods_details` VALUES (8, 2, 'uploads\\20200224\\1582540186923.png');
INSERT INTO `bl_goods_details` VALUES (9, 3, 'uploads\\20200225\\1582631196535.png');
INSERT INTO `bl_goods_details` VALUES (10, 3, 'uploads\\20200225\\1582631201312.png');
INSERT INTO `bl_goods_details` VALUES (11, 3, 'uploads\\20200225\\1582631206135.png');

-- ----------------------------
-- Table structure for bl_goods_swipe
-- ----------------------------
DROP TABLE IF EXISTS `bl_goods_swipe`;
CREATE TABLE `bl_goods_swipe`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品图片轮播Id',
  `goods_id` int(11) UNSIGNED NOT NULL COMMENT '连接 商品id',
  `goods_swipe_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '轮播图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_goods_swipe
-- ----------------------------
INSERT INTO `bl_goods_swipe` VALUES (1, 1, 'uploads\\20200224\\1582540002794.png');
INSERT INTO `bl_goods_swipe` VALUES (2, 2, 'uploads\\20200224\\1582540142654.png');
INSERT INTO `bl_goods_swipe` VALUES (3, 2, 'uploads\\20200224\\1582540147871.png');
INSERT INTO `bl_goods_swipe` VALUES (4, 2, 'uploads\\20200224\\1582540152820.png');
INSERT INTO `bl_goods_swipe` VALUES (5, 3, 'uploads\\20200225\\1582631131883.png');
INSERT INTO `bl_goods_swipe` VALUES (6, 3, 'uploads\\20200225\\1582631137074.png');
INSERT INTO `bl_goods_swipe` VALUES (7, 3, 'uploads\\20200225\\1582631176094.png');

-- ----------------------------
-- Table structure for bl_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `bl_order_goods`;
CREATE TABLE `bl_order_goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单商品表',
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID ，关联shop_goods表中的ID',
  `buy_count` tinyint(3) UNSIGNED NOT NULL COMMENT '购买的数量，最大只能买200个',
  `order_id` int(11) UNSIGNED NOT NULL COMMENT '订单ID ， 关防 shop_orders 表中的id',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '购买的价格',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品的名称',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品的图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_order_goods
-- ----------------------------
INSERT INTO `bl_order_goods` VALUES (124, 122, 2, 88, 1540.00, '【百联专柜直送】 后 天气丹花献光彩紧颜系列礼盒7件套 333ml', 'https://img17.iblimg.com/mp-175/mp/goods/772026683_200x200.jpg');
INSERT INTO `bl_order_goods` VALUES (125, 121, 1, 89, 1540.00, 'SKII 神仙水经典礼盒 295ml（SKII 护肤精华露230ml+SKII 嫩肤清莹露30ml+SKII 护肤洁面霜20g+SKII 微肌因赋活修护精华霜15g）神仙水 大红瓶', 'https://img18.iblimg.com/mp-175/mp/goods/547701713_200x200.jpg');
INSERT INTO `bl_order_goods` VALUES (126, 1, 6, 90, 495.00, 'Kiehls 科颜氏 高保湿面霜 125ml', 'https://img16.iblimg.com/mp-175/mp/goods/1150495629_200x200.jpg');
INSERT INTO `bl_order_goods` VALUES (127, 2, 1, 91, 1516.00, 'SISLEY 希思黎 全能乳液 125ml', 'https://img17.iblimg.com/mp-175/mp/goods/1003364565_200x200.jpg');
INSERT INTO `bl_order_goods` VALUES (128, 9, 3, 92, 115.00, 'Blackmores 澳佳宝 维生素E保湿润肤霜 冰冰霜 50g2 澳洲原装进口', 'https://img20.iblimg.com/mp-176/mp/goods/1358765487_200x200.jpg');
INSERT INTO `bl_order_goods` VALUES (129, 10, 3, 93, 194.00, 'Kao 花王 Curel 珂润 润浸保湿面霜 40g 日本原装进口', 'https://Img.iblimg.com/photo-42/3030/1842548886_200x200.jpg');
INSERT INTO `bl_order_goods` VALUES (130, 1, 1, 94, 495.00, 'Kiehls 科颜氏 高保湿面霜 125ml', 'https://img16.iblimg.com/mp-175/mp/goods/1150495629_200x200.jpg');
INSERT INTO `bl_order_goods` VALUES (131, 1, 1, 95, 495.00, 'Kiehls 科颜氏 高保湿面霜 125ml', 'https://img16.iblimg.com/mp-175/mp/goods/1150495629_200x200.jpg');

-- ----------------------------
-- Table structure for bl_orders
-- ----------------------------
DROP TABLE IF EXISTS `bl_orders`;
CREATE TABLE `bl_orders`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单基本信息表',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id，关联shop_users表中的id',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '下单的状态：  0：未支付    1：已支付，待发货      2：已发货，待收货    3：已收货  未评价   4：已评价  5 ：退款    6：取消  7：完成',
  `addtime` int(11) UNSIGNED NOT NULL COMMENT '下单的时间戳',
  `order_sn` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下单的 订单号',
  `shr_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人的姓名',
  `shr_mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人的电话',
  `shr_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省',
  `shr_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '市',
  `shr_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区',
  `shr_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `total_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '商品的总价',
  `post_order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_orders
-- ----------------------------
INSERT INTO `bl_orders` VALUES (88, 8, 6, 1574651508, '15746515083869170163', 'zX', '17553041262', '北京市', '北京市', '东城区', '杭州市西湖区 黄龙万科中心', 3080.00, NULL);
INSERT INTO `bl_orders` VALUES (89, 8, 2, 1574651900, '15746519001088958123', 'zX', '17553041262', '北京市', '北京市', '东城区', '杭州市西湖区 黄龙万科中心', 1540.00, NULL);
INSERT INTO `bl_orders` VALUES (90, 9, 5, 1574652826, '15746528263128374903', 'msj', '17553041262', '浙江省', '衢州市', '江山市', '杭州市西湖区 黄龙万科中心', 2970.00, NULL);
INSERT INTO `bl_orders` VALUES (91, 9, 7, 1574652869, '15746528693101184226', 'msj', '17553041262', '浙江省', '衢州市', '江山市', '杭州市西湖区 黄龙万科中心', 1516.00, NULL);
INSERT INTO `bl_orders` VALUES (92, 9, 3, 1574652911, '15746529112989641039', 'msj', '17553041262', '浙江省', '衢州市', '江山市', '杭州市西湖区 黄龙万科中心', 345.00, NULL);
INSERT INTO `bl_orders` VALUES (93, 9, 2, 1574653027, '1574653027009904440', 'msj', '17553041262', '浙江省', '衢州市', '江山市', '杭州市西湖区 黄龙万科中心', 582.00, NULL);
INSERT INTO `bl_orders` VALUES (94, 9, 6, 1574653051, '15746530511759974721', 'msj', '17553041262', '浙江省', '衢州市', '江山市', '杭州市西湖区 黄龙万科中心', 495.00, NULL);
INSERT INTO `bl_orders` VALUES (95, 9, 2, 1574674872, '15746748722912639921', 'msj', '17553041262', '浙江省', '衢州市', '江山市', '杭州市西湖区 黄龙万科中心', 495.00, NULL);

-- ----------------------------
-- Table structure for bl_root
-- ----------------------------
DROP TABLE IF EXISTS `bl_root`;
CREATE TABLE `bl_root`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'root',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名 手机号\r\n',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'md5 密码 固定长度\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_root
-- ----------------------------
INSERT INTO `bl_root` VALUES (1, '17553041262', '2a4c9da9d08b6b420bd725398b08dbbe');

-- ----------------------------
-- Table structure for bl_sort
-- ----------------------------
DROP TABLE IF EXISTS `bl_sort`;
CREATE TABLE `bl_sort`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类表',
  `cat_id` int(11) UNSIGNED NOT NULL COMMENT '连接 小标题 表',
  `sort_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `sort_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 881 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_sort
-- ----------------------------
INSERT INTO `bl_sort` VALUES (1, 1, '进口乳液/面霜', 'https://img14.iblimg.com/goods-135/2018/06/1527753542024b29f6ed.jpg');
INSERT INTO `bl_sort` VALUES (2, 1, '进口护肤套装', 'https://img11.iblimg.com/goods-135/2018/06/1527753542245f0a9383.jpg');
INSERT INTO `bl_sort` VALUES (3, 1, '进口面膜', 'https://img13.iblimg.com/goods-135/2018/06/1527753280450e792ed9.jpg');
INSERT INTO `bl_sort` VALUES (4, 1, '进口眼部护理', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1205515763.jpg');
INSERT INTO `bl_sort` VALUES (5, 1, '进口面部精华', 'https://img13.iblimg.com/goods-135/2018/06/1527753541672e3c490f.jpg');
INSERT INTO `bl_sort` VALUES (6, 1, '进口洁面', 'https://img11.iblimg.com/goods-135/2018/06/1527753278695542f4c1.jpg');
INSERT INTO `bl_sort` VALUES (7, 1, '进口化妆水', 'https://img12.iblimg.com/goods-135/2018/06/15277532956484170957.jpg');
INSERT INTO `bl_sort` VALUES (8, 1, '进口防晒', 'https://img15.iblimg.com/goods-135/2018/06/1527753541823f4cfea9.jpg');
INSERT INTO `bl_sort` VALUES (9, 1, '进口缤纷彩妆', 'https://img12.iblimg.com/goods-135/images/category/2018/05/608483805.jpg');
INSERT INTO `bl_sort` VALUES (10, 1, '进口口红', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1429081322.jpg');
INSERT INTO `bl_sort` VALUES (11, 1, '进口美颜仪', 'https://img12.iblimg.com/goods-135/images/category/2018/05/685690073.jpg');
INSERT INTO `bl_sort` VALUES (12, 1, '进口卸妆', 'https://img15.iblimg.com/goods-135/2018/06/1527753542418c36e73d.jpg');
INSERT INTO `bl_sort` VALUES (13, 1, '进口香水', 'https://img12.iblimg.com/goods-135/images/category/2018/05/997261183.jpg');
INSERT INTO `bl_sort` VALUES (14, 1, '美妆工具', 'https://img12.iblimg.com/goods-135/images/category/2018/05/767343250.jpg');
INSERT INTO `bl_sort` VALUES (15, 1, '进口男士护理', 'https://img11.iblimg.com/goods-135/2018/06/15277532962612db6734.jpg');
INSERT INTO `bl_sort` VALUES (16, 2, '进口洗发水', 'https://img12.iblimg.com/goods-135/images/category/2018/05/883301704.jpg');
INSERT INTO `bl_sort` VALUES (17, 2, '进口护发素', 'https://img12.iblimg.com/goods-135/images/category/2018/05/191872719.jpg');
INSERT INTO `bl_sort` VALUES (18, 2, '沐浴露', 'https://img12.iblimg.com/goods-135/images/category/2018/05/266353685.jpg');
INSERT INTO `bl_sort` VALUES (19, 2, '进口漱口水', 'https://img12.iblimg.com/goods-135/images/category/2018/05/933154053.jpg');
INSERT INTO `bl_sort` VALUES (20, 2, '进口牙刷', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1911468323.jpg');
INSERT INTO `bl_sort` VALUES (21, 2, '进口牙膏', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1988873158.jpg');
INSERT INTO `bl_sort` VALUES (22, 2, '进口身体乳', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1302839034.jpg');
INSERT INTO `bl_sort` VALUES (23, 2, '进口卫生巾', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1737517109.jpg');
INSERT INTO `bl_sort` VALUES (24, 3, '进口奶粉', 'https://img12.iblimg.com/goods-135/2018/06/1527753298339af3853f.jpg');
INSERT INTO `bl_sort` VALUES (25, 3, '进口辅食', 'https://img11.iblimg.com/goods-135/2018/06/15277532990023d259ec.jpg');
INSERT INTO `bl_sort` VALUES (26, 3, '进口纸尿裤', 'https://img11.iblimg.com/goods-135/2018/06/1527753297040cc0ce99.jpg');
INSERT INTO `bl_sort` VALUES (27, 3, '进口奶瓶奶嘴', 'https://img11.iblimg.com/goods-135/2018/06/15277532993915f3697e.jpg');
INSERT INTO `bl_sort` VALUES (28, 3, '进口水杯餐具', 'https://img11.iblimg.com/goods-135/images/category/2017/05/1945044562.png');
INSERT INTO `bl_sort` VALUES (29, 3, '进口洗发沐浴', 'https://img11.iblimg.com/goods-135/2018/06/15277532976806433cc3.jpg');
INSERT INTO `bl_sort` VALUES (30, 3, '进口宝宝护肤', 'https://img15.iblimg.com/goods-135/images/category/2017/05/506685031.jpg');
INSERT INTO `bl_sort` VALUES (31, 3, '进口手推车', 'https://img11.iblimg.com/goods-135/images/category/2017/05/1735806567.jpg');
INSERT INTO `bl_sort` VALUES (32, 3, '进口安全座椅', 'https://img11.iblimg.com/goods-135/2018/06/15277532997214293a5e.jpg');
INSERT INTO `bl_sort` VALUES (33, 3, '进口玩具', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1169506774.jpg');
INSERT INTO `bl_sort` VALUES (34, 4, '进口膨化食品', 'https://img12.iblimg.com/goods-135/2018/06/15277532810690a9118e.jpg');
INSERT INTO `bl_sort` VALUES (35, 4, '进口坚果炒货', 'https://img11.iblimg.com/goods-135/2018/06/1527753281842c712bee.jpg');
INSERT INTO `bl_sort` VALUES (36, 4, '进口蜜饯果干', 'https://img12.iblimg.com/goods-135/2018/06/15277532826462fdea89.jpg');
INSERT INTO `bl_sort` VALUES (37, 4, '进口糖果', 'https://img12.iblimg.com/goods-135/2018/06/1527753284674300b138.jpg');
INSERT INTO `bl_sort` VALUES (38, 4, '进口海苔', 'https://img15.iblimg.com/goods-135/2018/06/1527753283307b6defb1.jpg');
INSERT INTO `bl_sort` VALUES (39, 4, '进口饼干', 'https://img12.iblimg.com/goods-135/images/category/2018/05/179665056.jpg');
INSERT INTO `bl_sort` VALUES (40, 4, '进口曲奇', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1587643789.jpg');
INSERT INTO `bl_sort` VALUES (41, 4, '进口威化', 'https://img12.iblimg.com/goods-135/images/category/2018/05/772542832.jpg');
INSERT INTO `bl_sort` VALUES (42, 4, '进口意面', 'https://img12.iblimg.com/goods-135/2018/06/1527753286000d8d7f59.jpg');
INSERT INTO `bl_sort` VALUES (43, 4, '进口橄榄油', 'https://img13.iblimg.com/goods-135/2018/06/15277532752891593d55.jpg');
INSERT INTO `bl_sort` VALUES (44, 4, '进口厨房调味', 'https://img11.iblimg.com/goods-135/2018/06/1527753276658e2891ad.jpg');
INSERT INTO `bl_sort` VALUES (45, 4, '进口方便面', 'https://img13.iblimg.com/goods-135/2018/06/15277532759005a3f0ff.jpg');
INSERT INTO `bl_sort` VALUES (46, 4, '进口蜂蜜', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1841325844.jpg');
INSERT INTO `bl_sort` VALUES (47, 4, '进口维生素', 'https://img12.iblimg.com/goods-135/images/category/2018/05/588744708.jpg');
INSERT INTO `bl_sort` VALUES (48, 5, '进口牛奶', 'https://img14.iblimg.com/goods-135/2018/06/15277532865738342574.jpg');
INSERT INTO `bl_sort` VALUES (49, 5, '进口全脂牛奶', 'https://img12.iblimg.com/goods-135/images/category/2018/05/781778170.jpg');
INSERT INTO `bl_sort` VALUES (50, 5, '进口低脂牛奶', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1120231038.jpg');
INSERT INTO `bl_sort` VALUES (51, 5, '进口奶粉', 'https://img11.iblimg.com/goods-135/2018/06/152775328708497cf69d.jpg');
INSERT INTO `bl_sort` VALUES (52, 5, '进口营养谷物', 'https://img13.iblimg.com/goods-135/2018/06/15277532780048547b2b.jpg');
INSERT INTO `bl_sort` VALUES (53, 5, '进口咖啡', 'https://img11.iblimg.com/goods-135/2018/06/1527753291378a4beede.jpg');
INSERT INTO `bl_sort` VALUES (54, 5, '进口饮用水', 'https://img11.iblimg.com/goods-135/2018/06/15277532892701d195e5.jpg');
INSERT INTO `bl_sort` VALUES (55, 5, '进口饮料', 'https://img11.iblimg.com/goods-135/2018/06/152775328978067bc1c9.jpg');
INSERT INTO `bl_sort` VALUES (56, 5, '进口葡萄酒', 'https://img12.iblimg.com/goods-135/2018/06/15277532887157416eea.jpg');
INSERT INTO `bl_sort` VALUES (57, 5, '进口啤酒', 'https://img12.iblimg.com/goods-135/2018/06/152775328755244a11b6.jpg');
INSERT INTO `bl_sort` VALUES (58, 5, '进口洋酒', 'https://img12.iblimg.com/goods-135/2018/06/152775328810762e0445.jpg');
INSERT INTO `bl_sort` VALUES (59, 6, '进口洗衣液', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1995223889.jpg');
INSERT INTO `bl_sort` VALUES (60, 6, '进口洗衣凝珠', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1360605928.jpg');
INSERT INTO `bl_sort` VALUES (61, 6, '进口洗衣粉', 'https://img12.iblimg.com/goods-135/images/category/2018/05/2078083486.jpg');
INSERT INTO `bl_sort` VALUES (62, 6, '进口洗洁精', 'https://img12.iblimg.com/goods-135/images/category/2018/05/201864464.jpg');
INSERT INTO `bl_sort` VALUES (63, 6, '进口油污净', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1412595695.jpg');
INSERT INTO `bl_sort` VALUES (64, 6, '进口空气清新', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1007730168.jpg');
INSERT INTO `bl_sort` VALUES (65, 6, '多用途清洁剂', 'https://img12.iblimg.com/goods-135/images/category/2018/05/705115670.jpg');
INSERT INTO `bl_sort` VALUES (66, 6, '进口卫浴清洁', 'https://img12.iblimg.com/goods-135/images/category/2018/05/586728770.jpg');
INSERT INTO `bl_sort` VALUES (67, 6, '进口马桶清洁', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1644448692.jpg');
INSERT INTO `bl_sort` VALUES (68, 7, '进口锅具', 'https://img14.iblimg.com/goods-135/2018/06/152775330109773c3c73.jpg');
INSERT INTO `bl_sort` VALUES (69, 7, '进口厨具', 'https://img11.iblimg.com/goods-135/2018/06/1527753301606d3eb558.jpg');
INSERT INTO `bl_sort` VALUES (70, 7, '进口餐具', 'https://img12.iblimg.com/goods-135/2018/06/15277533021481130110.jpg');
INSERT INTO `bl_sort` VALUES (71, 7, '进口刀具', 'https://img12.iblimg.com/goods-135/2018/06/15277533026533b77537.jpg');
INSERT INTO `bl_sort` VALUES (72, 7, '进口水杯/水壶', 'https://img12.iblimg.com/goods-135/2018/06/1527753303116f16b66c.jpg');
INSERT INTO `bl_sort` VALUES (73, 7, '进口滤水壶', 'https://img11.iblimg.com/goods-135/2018/06/1527753303600da1b637.jpg');
INSERT INTO `bl_sort` VALUES (74, 7, '进口家庭清洁', 'https://img11.iblimg.com/goods-135/2018/06/1527753304120fb55bb7.jpg');
INSERT INTO `bl_sort` VALUES (75, 7, '进口衣物清洁', 'https://img12.iblimg.com/goods-135/2018/06/15277533046881ad9eb8.jpg');
INSERT INTO `bl_sort` VALUES (76, 8, 'GUCCI', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1927910292.bmp');
INSERT INTO `bl_sort` VALUES (77, 8, 'MICHAEL KORS', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1215785720.jpg');
INSERT INTO `bl_sort` VALUES (78, 8, 'KENZO', 'https://img12.iblimg.com/goods-135/images/category/2018/05/636416558.jpg');
INSERT INTO `bl_sort` VALUES (79, 8, 'Coach', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1790066582.jpg');
INSERT INTO `bl_sort` VALUES (80, 8, 'FURLA', 'https://img12.iblimg.com/goods-135/images/category/2018/05/793614160.jpg');
INSERT INTO `bl_sort` VALUES (81, 8, 'Longchamp', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1439390557.jpg');
INSERT INTO `bl_sort` VALUES (82, 8, 'ANELLO', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1035048647.jpg');
INSERT INTO `bl_sort` VALUES (83, 9, 'Daniel Wellington', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1112080658.jpg');
INSERT INTO `bl_sort` VALUES (84, 9, '雷朋', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1395675721.jpg');
INSERT INTO `bl_sort` VALUES (85, 9, '潘多拉', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1725563511.jpg');
INSERT INTO `bl_sort` VALUES (86, 9, 'CITIZEN', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1832462150.jpg');
INSERT INTO `bl_sort` VALUES (87, 9, 'CASIO', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1323958131.jpg');
INSERT INTO `bl_sort` VALUES (88, 9, '施华洛世奇', 'https://img12.iblimg.com/goods-135/images/category/2018/05/2125074044.jpg');
INSERT INTO `bl_sort` VALUES (89, 10, '进口水果', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1095068119.jpg');
INSERT INTO `bl_sort` VALUES (90, 10, '国产水果', 'https://img11.iblimg.com/goods-135/2018/06/15277532534966d01b7e.jpg');
INSERT INTO `bl_sort` VALUES (91, 10, '菠萝', 'https://img13.iblimg.com/goods-135/images/category/2018/05/434633116.jpg');
INSERT INTO `bl_sort` VALUES (92, 10, '芒果', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1314438308.jpg');
INSERT INTO `bl_sort` VALUES (93, 10, '猕猴桃', 'https://Img.iblimg.com/goods-1/images/category/2016/10/%E7%8C%95%E7%8C%B4%E6%A1%83.jpg');
INSERT INTO `bl_sort` VALUES (94, 10, '苹果', 'https://Img.iblimg.com/goods-1/images/category/2016/10/%E8%8B%B9%E6%9E%9C.jpg');
INSERT INTO `bl_sort` VALUES (95, 10, '柑/桔/橙', 'https://Img.iblimg.com/goods-1/images/category/2016/10/%E6%A9%99%E5%AD%90.jpg');
INSERT INTO `bl_sort` VALUES (96, 10, '龙眼', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1573668642.jpg');
INSERT INTO `bl_sort` VALUES (97, 10, '牛油果', 'https://Img.iblimg.com/goods-1/images/category/2016/10/%E7%89%9B%E6%B2%B9%E6%9E%9C.jpg');
INSERT INTO `bl_sort` VALUES (98, 10, '火龙果', 'https://Img.iblimg.com/goods-1/images/category/2016/10/%E7%81%AB%E9%BE%99%E6%9E%9C.jpg');
INSERT INTO `bl_sort` VALUES (99, 10, '梨', 'https://img15.iblimg.com/goods-135/images/category/2017/10/572627141.jpg');
INSERT INTO `bl_sort` VALUES (100, 10, '蓝莓', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1930315143.jpg');
INSERT INTO `bl_sort` VALUES (101, 10, '椰子', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1059996672.jpg');
INSERT INTO `bl_sort` VALUES (102, 11, '牛肉类', 'https://img14.iblimg.com/goods-135/2018/06/15277530723054db7b02.jpg');
INSERT INTO `bl_sort` VALUES (103, 11, '猪肉类', 'https://img15.iblimg.com/goods-135/images/category/2017/10/133840684.jpg');
INSERT INTO `bl_sort` VALUES (104, 11, '羊肉类', 'https://img15.iblimg.com/goods-135/2018/06/15277532443975c46f7e.jpg');
INSERT INTO `bl_sort` VALUES (105, 11, '牛排', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1063268976.jpg');
INSERT INTO `bl_sort` VALUES (106, 11, '牛腩', 'https://img13.iblimg.com/goods-135/images/category/2018/05/635162032.jpg');
INSERT INTO `bl_sort` VALUES (107, 11, '牛腱', 'https://img15.iblimg.com/goods-135/images/category/2017/10/107455843.jpg');
INSERT INTO `bl_sort` VALUES (108, 11, '牛尾', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1985644336.jpg');
INSERT INTO `bl_sort` VALUES (109, 12, '鱼类', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1261262913.jpg');
INSERT INTO `bl_sort` VALUES (110, 12, '三文鱼', 'https://img11.iblimg.com/goods-135/images/category/2017/10/779692398.jpg');
INSERT INTO `bl_sort` VALUES (111, 12, '鳕鱼', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1415192054.jpg');
INSERT INTO `bl_sort` VALUES (112, 12, '黄鱼', 'https://img15.iblimg.com/goods-135/images/category/2017/10/766278234.jpg');
INSERT INTO `bl_sort` VALUES (113, 12, '虾类', 'https://img11.iblimg.com/goods-135/images/category/2017/10/420337427.jpg');
INSERT INTO `bl_sort` VALUES (114, 12, '虾仁', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1761043723.jpg');
INSERT INTO `bl_sort` VALUES (115, 12, '蟹类', 'https://img11.iblimg.com/goods-135/images/category/2017/10/88487994.jpg');
INSERT INTO `bl_sort` VALUES (116, 12, '巴沙鱼', 'https://img11.iblimg.com/goods-135/images/category/2017/10/8642002.jpg');
INSERT INTO `bl_sort` VALUES (117, 12, '海参', 'https://img15.iblimg.com/goods-135/2018/06/1527753063566b0f9af0.jpg');
INSERT INTO `bl_sort` VALUES (118, 12, '贝类', 'https://img15.iblimg.com/goods-135/2018/06/1527753062964b7eb346.jpg');
INSERT INTO `bl_sort` VALUES (119, 12, '扇贝', 'https://img15.iblimg.com/goods-135/images/category/2017/10/663843003.jpg');
INSERT INTO `bl_sort` VALUES (120, 13, '鸡肉', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1551181748.jpg');
INSERT INTO `bl_sort` VALUES (121, 13, '鸡翅', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1059240064.jpg');
INSERT INTO `bl_sort` VALUES (122, 13, '鸭肉', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1351962382.jpg');
INSERT INTO `bl_sort` VALUES (123, 13, '鸡蛋', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1922252510.jpg');
INSERT INTO `bl_sort` VALUES (124, 13, '咸鸭蛋', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1589125859.jpg');
INSERT INTO `bl_sort` VALUES (125, 13, '松花皮蛋', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1938921332.jpg');
INSERT INTO `bl_sort` VALUES (126, 14, '水饺', 'https://img15.iblimg.com/goods-135/2018/06/152775299374009dd27b.jpg');
INSERT INTO `bl_sort` VALUES (127, 14, '汤圆', 'https://img15.iblimg.com/goods-135/2018/06/152775306229652ff4a0.jpg');
INSERT INTO `bl_sort` VALUES (128, 14, '馄饨', 'https://img11.iblimg.com/goods-135/2018/06/1527753022995a518eb3.jpg');
INSERT INTO `bl_sort` VALUES (129, 14, '包子', 'https://img12.iblimg.com/goods-135/2018/06/1527753271162e953f86.jpg');
INSERT INTO `bl_sort` VALUES (130, 14, '奶黄包', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1793879641.jpg');
INSERT INTO `bl_sort` VALUES (131, 14, '馒头/花卷', 'https://img11.iblimg.com/goods-135/2018/06/15277532718449b3b98f.jpg');
INSERT INTO `bl_sort` VALUES (132, 14, '面条', 'https://img15.iblimg.com/goods-135/2018/06/15277532685812172039.jpg');
INSERT INTO `bl_sort` VALUES (133, 14, '手抓饼', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1876299280.jpg');
INSERT INTO `bl_sort` VALUES (134, 14, '海鲜制品', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1165004357.jpg');
INSERT INTO `bl_sort` VALUES (135, 14, '丸子', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1522973087.jpg');
INSERT INTO `bl_sort` VALUES (136, 14, '年糕', 'https://img13.iblimg.com/goods-135/images/category/2018/05/2006804294.jpg');
INSERT INTO `bl_sort` VALUES (137, 14, '速冻蔬菜', 'https://img11.iblimg.com/goods-135/2018/06/152775326930753b2d8d.jpg');
INSERT INTO `bl_sort` VALUES (138, 14, '成品菜', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1151440279.jpg');
INSERT INTO `bl_sort` VALUES (139, 14, '肉类熟食', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1275345951.jpg');
INSERT INTO `bl_sort` VALUES (140, 15, '低温鲜奶', 'https://img15.iblimg.com/goods-135/images/category/2017/10/37762015.jpg');
INSERT INTO `bl_sort` VALUES (141, 15, '低温酸奶', 'https://img11.iblimg.com/goods-135/images/category/2017/10/283300993.jpg');
INSERT INTO `bl_sort` VALUES (142, 15, '冰激凌', 'https://img15.iblimg.com/goods-135/images/category/2017/10/868203718.jpg');
INSERT INTO `bl_sort` VALUES (143, 15, '奶酪', 'https://img15.iblimg.com/goods-135/images/category/2017/10/26041613.jpg');
INSERT INTO `bl_sort` VALUES (144, 15, '黄油', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1878572087.jpg');
INSERT INTO `bl_sort` VALUES (145, 15, '低温饮品', 'https://img13.iblimg.com/goods-135/images/category/2018/05/810458578.jpg');
INSERT INTO `bl_sort` VALUES (146, 16, '成品/半成品', 'https://img11.iblimg.com/goods-135/images/category/2017/10/288035423.jpg');
INSERT INTO `bl_sort` VALUES (147, 16, '熟食', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1934731331.jpg');
INSERT INTO `bl_sort` VALUES (148, 17, '饼干', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1186667418.jpg');
INSERT INTO `bl_sort` VALUES (149, 17, '曲奇饼干', 'https://img11.iblimg.com/goods-135/images/category/2017/10/96217422.jpg');
INSERT INTO `bl_sort` VALUES (150, 17, '威化饼干', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1333790038.jpg');
INSERT INTO `bl_sort` VALUES (151, 17, '苏打饼干', 'https://img11.iblimg.com/goods-135/images/category/2017/10/2046003425.jpg');
INSERT INTO `bl_sort` VALUES (152, 17, '夹心饼干', 'https://img14.iblimg.com/goods-135/2018/06/15277530235041a38f95.jpg');
INSERT INTO `bl_sort` VALUES (153, 17, '传统糕点', 'https://img12.iblimg.com/goods-135/2018/06/152775308070769c7b02.jpg');
INSERT INTO `bl_sort` VALUES (154, 17, '沙琪玛', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1138100038.jpg');
INSERT INTO `bl_sort` VALUES (155, 17, '西式糕点', 'https://img13.iblimg.com/goods-135/2018/06/15277530800187d31d0a.jpg');
INSERT INTO `bl_sort` VALUES (156, 17, '面包/蛋糕', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1640330900.jpg');
INSERT INTO `bl_sort` VALUES (157, 17, '蛋卷/卷心酥', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1109065543.jpg');
INSERT INTO `bl_sort` VALUES (158, 18, '膨化食品', 'https://img12.iblimg.com/goods-135/2018/06/1527753072996f851f0f.jpg');
INSERT INTO `bl_sort` VALUES (159, 18, '米饼', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1741992545.jpg');
INSERT INTO `bl_sort` VALUES (160, 18, '薯片', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1462241033.jpg');
INSERT INTO `bl_sort` VALUES (161, 18, '坚果炒货', 'https://img13.iblimg.com/goods-135/2018/06/1527753091536aa63623.jpg');
INSERT INTO `bl_sort` VALUES (162, 18, '杏仁', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1618516750.jpg');
INSERT INTO `bl_sort` VALUES (163, 18, '开心果', 'https://img12.iblimg.com/goods-135/images/category/2017/11/874514519.jpg');
INSERT INTO `bl_sort` VALUES (164, 18, '梅类', 'https://img15.iblimg.com/goods-135/images/category/2018/05/219802773.jpg');
INSERT INTO `bl_sort` VALUES (165, 18, '果干蜜饯', 'https://img13.iblimg.com/goods-135/2018/06/15277530681091788e33.jpg');
INSERT INTO `bl_sort` VALUES (166, 18, '芒果干', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1997712592.jpg');
INSERT INTO `bl_sort` VALUES (167, 18, '葡萄干', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1179689831.jpg');
INSERT INTO `bl_sort` VALUES (168, 18, '肉干肉脯', 'https://img14.iblimg.com/goods-135/2018/06/1527753306273395493b.jpg');
INSERT INTO `bl_sort` VALUES (169, 18, '豆制品零食', 'https://img13.iblimg.com/goods-135/2018/06/15277533057843ebce5c.jpg');
INSERT INTO `bl_sort` VALUES (170, 18, '海味零食', 'https://img15.iblimg.com/goods-135/2018/06/15277530414520525c86.jpg');
INSERT INTO `bl_sort` VALUES (171, 18, '海苔', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1242130760.jpg');
INSERT INTO `bl_sort` VALUES (172, 18, '巧克力', 'https://img15.iblimg.com/goods-135/images/category/2017/10/216238153.jpg');
INSERT INTO `bl_sort` VALUES (173, 19, '花生油', 'https://img12.iblimg.com/goods-135/2018/06/1527753544859db3e24c.jpg');
INSERT INTO `bl_sort` VALUES (174, 19, '菜籽油', 'https://img13.iblimg.com/goods-135/2018/06/15277535450108c01cb7.jpg');
INSERT INTO `bl_sort` VALUES (175, 19, '大豆油', 'https://img15.iblimg.com/goods-135/2018/06/1527753545186e6320c2.jpg');
INSERT INTO `bl_sort` VALUES (176, 19, '葵花籽油', 'https://img12.iblimg.com/goods-135/2018/06/15277535453435255646.jpg');
INSERT INTO `bl_sort` VALUES (177, 19, '玉米油', 'https://img11.iblimg.com/goods-135/2018/06/15277535454998ecb397.jpg');
INSERT INTO `bl_sort` VALUES (178, 19, '调合油', 'https://img13.iblimg.com/goods-135/2018/06/15277535456508060837.jpg');
INSERT INTO `bl_sort` VALUES (179, 19, '茶油', 'https://img11.iblimg.com/goods-135/2018/06/1527753545784da761b0.jpg');
INSERT INTO `bl_sort` VALUES (180, 19, '橄榄油', 'https://img13.iblimg.com/goods-135/2018/06/152775354592220a2bec.jpg');
INSERT INTO `bl_sort` VALUES (181, 20, '大米', 'https://img14.iblimg.com/goods-135/2018/06/15277530813307db56a0.jpg');
INSERT INTO `bl_sort` VALUES (182, 20, '面粉', 'https://img11.iblimg.com/goods-135/2018/06/1527753082040d3a5ae5.jpg');
INSERT INTO `bl_sort` VALUES (183, 20, '杂粮', 'https://img12.iblimg.com/goods-135/2018/06/152775354653052c53a1.jpg');
INSERT INTO `bl_sort` VALUES (184, 20, '面条', 'https://img11.iblimg.com/goods-135/2018/06/1527753016071d5cfd19.jpg');
INSERT INTO `bl_sort` VALUES (185, 20, '粉丝 粉条', 'https://img15.iblimg.com/goods-135/2018/06/152775301672045bff57.jpg');
INSERT INTO `bl_sort` VALUES (191, 22, '方便面', 'https://img13.iblimg.com/goods-135/2018/06/1527753015690f4aa6e7.jpg');
INSERT INTO `bl_sort` VALUES (192, 22, '进口泡面', 'https://img15.iblimg.com/goods-135/images/category/2018/05/492424659.jpg');
INSERT INTO `bl_sort` VALUES (193, 22, '挂面', 'https://img15.iblimg.com/goods-135/images/category/2018/05/112389561.jpg');
INSERT INTO `bl_sort` VALUES (194, 22, '火腿肠', 'https://img15.iblimg.com/goods-135/images/category/2018/05/200033048.jpg');
INSERT INTO `bl_sort` VALUES (195, 22, '罐头', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1948932803.jpg');
INSERT INTO `bl_sort` VALUES (196, 22, '八宝粥', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1312020691.jpg');
INSERT INTO `bl_sort` VALUES (197, 23, '食盐', 'https://img12.iblimg.com/goods-135/2018/06/1527753017098edb824d.jpg');
INSERT INTO `bl_sort` VALUES (198, 23, '鸡精/味精', 'https://img12.iblimg.com/goods-135/2018/06/1527753017449ae4103e.jpg');
INSERT INTO `bl_sort` VALUES (199, 23, '食糖', 'https://img14.iblimg.com/goods-135/2018/06/1527753014037ceb736e.jpg');
INSERT INTO `bl_sort` VALUES (200, 23, '酱油', 'https://img14.iblimg.com/goods-135/2018/06/15277530146120f6f13d.jpg');
INSERT INTO `bl_sort` VALUES (201, 23, '醋', 'https://img13.iblimg.com/goods-135/2018/06/1527753015178ccd5b6b.jpg');
INSERT INTO `bl_sort` VALUES (202, 23, '料酒', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1426504071.jpg');
INSERT INTO `bl_sort` VALUES (203, 23, '香油', 'https://img13.iblimg.com/goods-135/2018/06/152775301167861132f2.jpg');
INSERT INTO `bl_sort` VALUES (204, 23, '蚝油', 'https://img11.iblimg.com/goods-135/images/category/2017/10/575458566.jpg');
INSERT INTO `bl_sort` VALUES (205, 23, '淀粉', 'https://img11.iblimg.com/goods-135/images/category/2017/10/2070765685.jpg');
INSERT INTO `bl_sort` VALUES (206, 23, '调味料', 'https://img12.iblimg.com/goods-135/2018/06/1527752999167670f431.jpg');
INSERT INTO `bl_sort` VALUES (207, 23, '调味酱', 'https://img14.iblimg.com/goods-135/2018/06/1527752999754ff6b290.jpg');
INSERT INTO `bl_sort` VALUES (208, 23, '咖喱', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1072970112.jpg');
INSERT INTO `bl_sort` VALUES (209, 23, '番茄酱', 'https://img15.iblimg.com/goods-135/images/category/2017/10/1892144866.jpg');
INSERT INTO `bl_sort` VALUES (210, 23, '调味汁', 'https://img15.iblimg.com/goods-135/images/category/2017/10/167502330.jpg');
INSERT INTO `bl_sort` VALUES (211, 23, '酱菜', 'https://img11.iblimg.com/goods-135/2018/06/15277530003840f7459f.jpg');
INSERT INTO `bl_sort` VALUES (212, 23, '腐乳', 'https://img11.iblimg.com/goods-135/images/category/2017/10/506164653.jpg');
INSERT INTO `bl_sort` VALUES (213, 24, '纯牛奶', 'https://img15.iblimg.com/goods-135/images/category/2017/10/208793391.jpg');
INSERT INTO `bl_sort` VALUES (214, 24, '进口纯牛奶', 'https://img11.iblimg.com/goods-135/images/category/2017/10/805613071.jpg');
INSERT INTO `bl_sort` VALUES (215, 24, '酸奶', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1992305112.jpg');
INSERT INTO `bl_sort` VALUES (216, 24, '调味奶', 'https://img11.iblimg.com/goods-135/images/category/2017/10/446191197.jpg');
INSERT INTO `bl_sort` VALUES (217, 24, '成人奶粉', 'https://img11.iblimg.com/goods-135/images/category/2017/10/1284088762.jpg');
INSERT INTO `bl_sort` VALUES (218, 25, '咖啡豆', 'https://img12.iblimg.com/goods-135/2018/06/1527753548554841c07c.jpg');
INSERT INTO `bl_sort` VALUES (219, 25, '咖啡粉', 'https://img11.iblimg.com/goods-135/2018/06/1527753548818e93788c.jpg');
INSERT INTO `bl_sort` VALUES (220, 25, '速溶咖啡', 'https://img15.iblimg.com/goods-135/2018/06/152775305266273a6178.jpg');
INSERT INTO `bl_sort` VALUES (221, 26, '绿茶', 'https://img11.iblimg.com/goods-135/2018/06/1527752981948ab37112.jpg');
INSERT INTO `bl_sort` VALUES (222, 26, '红茶', 'https://img15.iblimg.com/goods-135/2018/06/15277530253539ed1844.jpg');
INSERT INTO `bl_sort` VALUES (223, 26, '乌龙茶', 'https://img12.iblimg.com/goods-135/2018/06/15277529823788674af1.jpg');
INSERT INTO `bl_sort` VALUES (224, 26, '普洱茶', 'https://img13.iblimg.com/goods-135/2018/06/1527753049861386a954.jpg');
INSERT INTO `bl_sort` VALUES (225, 26, '花草茶', 'https://img13.iblimg.com/goods-135/2018/06/15277530275421d713b4.jpg');
INSERT INTO `bl_sort` VALUES (226, 26, '袋泡茶', 'https://img14.iblimg.com/goods-135/2018/06/15277535494174864b75.jpg');
INSERT INTO `bl_sort` VALUES (227, 27, '麦片谷物', 'https://img15.iblimg.com/goods-135/2018/06/1527753044588b97eb33.jpg');
INSERT INTO `bl_sort` VALUES (228, 27, '成人奶粉', 'https://img14.iblimg.com/goods-135/2018/06/152775302912249f5c22.jpg');
INSERT INTO `bl_sort` VALUES (229, 27, '奶茶', 'https://img11.iblimg.com/goods-135/2018/06/152775298319030a2ec4.jpg');
INSERT INTO `bl_sort` VALUES (230, 27, '蜂蜜', 'https://img15.iblimg.com/goods-135/2018/06/1527753323763f75cb49.jpg');
INSERT INTO `bl_sort` VALUES (231, 27, '蜂蜜柚子茶', 'https://img15.iblimg.com/goods-135/2018/06/1527753028598c29f912.jpg');
INSERT INTO `bl_sort` VALUES (232, 28, '饮用水', 'https://img15.iblimg.com/goods-135/images/category/2018/05/2010018841.jpg');
INSERT INTO `bl_sort` VALUES (233, 28, '进口饮用水', 'https://img15.iblimg.com/goods-135/images/category/2018/05/846050730.jpg');
INSERT INTO `bl_sort` VALUES (234, 28, '果蔬汁', 'https://img13.iblimg.com/goods-135/2018/06/1527753069129c7e9197.jpg');
INSERT INTO `bl_sort` VALUES (235, 28, '碳酸饮料', 'https://img15.iblimg.com/goods-135/images/category/2018/05/493132307.jpg');
INSERT INTO `bl_sort` VALUES (236, 28, '即饮咖啡', 'https://img14.iblimg.com/goods-135/2018/06/1527753073526ed4badc.jpg');
INSERT INTO `bl_sort` VALUES (237, 28, '茶饮料', 'https://img11.iblimg.com/goods-135/2018/06/15277530739934e3fcc8.jpg');
INSERT INTO `bl_sort` VALUES (238, 28, '植物蛋白', 'https://img14.iblimg.com/goods-135/2018/06/152775307446972fc319.jpg');
INSERT INTO `bl_sort` VALUES (239, 28, '功能饮料', 'https://img15.iblimg.com/goods-135/2018/06/152775305191811450f9.jpg');
INSERT INTO `bl_sort` VALUES (240, 29, '乳液/面霜', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1830757378.jpg');
INSERT INTO `bl_sort` VALUES (241, 29, '护肤套装', 'https://img15.iblimg.com/goods-135/images/category/2018/05/924783391.jpg');
INSERT INTO `bl_sort` VALUES (242, 29, '洁面', 'https://img15.iblimg.com/goods-135/images/category/2018/05/2114284204.jpg');
INSERT INTO `bl_sort` VALUES (243, 29, '防晒', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1422885285.jpg');
INSERT INTO `bl_sort` VALUES (244, 29, '面膜', 'https://img15.iblimg.com/goods-135/images/category/2018/05/240776948.jpg');
INSERT INTO `bl_sort` VALUES (245, 29, '面部精华', 'https://img13.iblimg.com/goods-135/2018/06/1527753075952c128f5b.jpg');
INSERT INTO `bl_sort` VALUES (246, 29, '爽肤水', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1690644961.jpg');
INSERT INTO `bl_sort` VALUES (247, 29, '面部喷雾', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1813710555.jpg');
INSERT INTO `bl_sort` VALUES (248, 29, '眼霜', 'https://img13.iblimg.com/goods-135/2018/06/152775298413946a7b8b.jpg');
INSERT INTO `bl_sort` VALUES (249, 29, '润唇膏', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1525059416.jpg');
INSERT INTO `bl_sort` VALUES (250, 29, '卸妆', 'https://img15.iblimg.com/goods-135/images/category/2018/05/312779060.jpg');
INSERT INTO `bl_sort` VALUES (251, 30, '洗发水', 'https://img14.iblimg.com/goods-135/2018/06/152775302008448eddd0.jpg');
INSERT INTO `bl_sort` VALUES (252, 30, '进口洗发水', 'https://img15.iblimg.com/goods-135/images/category/2018/05/696563384.jpg');
INSERT INTO `bl_sort` VALUES (253, 30, '护发素', 'https://img12.iblimg.com/goods-135/2018/06/1527753053890fb2a837.jpg');
INSERT INTO `bl_sort` VALUES (254, 30, '发膜', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1381116029.jpg');
INSERT INTO `bl_sort` VALUES (255, 30, '洗护发套装', 'https://img11.iblimg.com/goods-135/2018/06/15277530753944d184ad.jpg');
INSERT INTO `bl_sort` VALUES (256, 30, '头发造型', 'https://img11.iblimg.com/goods-135/2018/06/1527753029589df29a35.jpg');
INSERT INTO `bl_sort` VALUES (257, 30, '染发', 'https://img13.iblimg.com/goods-135/2018/06/152775304209737066c9.jpg');
INSERT INTO `bl_sort` VALUES (258, 31, '身体乳', 'https://img15.iblimg.com/goods-135/2018/06/152775355077383a7448.jpg');
INSERT INTO `bl_sort` VALUES (259, 31, '洗手液', 'https://img14.iblimg.com/goods-135/2018/06/15277529944731ce3845.jpg');
INSERT INTO `bl_sort` VALUES (260, 31, '香皂', 'https://img15.iblimg.com/goods-135/2018/06/1527752995078ba05d4a.jpg');
INSERT INTO `bl_sort` VALUES (261, 31, '沐浴露', 'https://img15.iblimg.com/goods-135/2018/06/15277530077227a483c5.jpg');
INSERT INTO `bl_sort` VALUES (262, 31, '护手霜', 'https://img12.iblimg.com/goods-135/2018/06/152775355092593945e7.jpg');
INSERT INTO `bl_sort` VALUES (263, 31, '足部护理', 'https://img14.iblimg.com/goods-135/2018/06/1527753551071af749cb.jpg');
INSERT INTO `bl_sort` VALUES (264, 31, '脱毛/去角质', 'https://img15.iblimg.com/goods-135/images/category/2018/05/207826177.jpg');
INSERT INTO `bl_sort` VALUES (265, 31, '纤体塑身', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1262049588.jpg');
INSERT INTO `bl_sort` VALUES (266, 31, '精油芳疗', 'https://img15.iblimg.com/goods-135/images/category/2018/05/667850226.jpg');
INSERT INTO `bl_sort` VALUES (267, 32, 'BB霜/CC霜', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1404320867.jpg');
INSERT INTO `bl_sort` VALUES (268, 32, '隔离', 'https://img15.iblimg.com/goods-135/images/category/2018/05/800987429.jpg');
INSERT INTO `bl_sort` VALUES (269, 32, '粉底', 'https://img11.iblimg.com/goods-135/2018/06/152775339149895bf472.jpg');
INSERT INTO `bl_sort` VALUES (270, 32, '粉饼', 'https://img13.iblimg.com/goods-135/2018/06/15277533840969e0b58f.jpg');
INSERT INTO `bl_sort` VALUES (271, 32, '遮瑕', 'https://img15.iblimg.com/goods-135/2018/06/1527753384775c51bce8.jpg');
INSERT INTO `bl_sort` VALUES (272, 32, '散粉/蜜粉', 'https://img13.iblimg.com/goods-135/2018/06/1527753385468de7d3ae.jpg');
INSERT INTO `bl_sort` VALUES (273, 32, '口红', 'https://img14.iblimg.com/goods-135/2018/06/1527753392139b10e3a7.jpg');
INSERT INTO `bl_sort` VALUES (274, 32, '唇彩', 'https://img15.iblimg.com/goods-135/images/category/2018/05/86201014.jpg');
INSERT INTO `bl_sort` VALUES (275, 32, '睫毛膏', 'https://img15.iblimg.com/goods-135/2018/06/152775339337679c3242.jpg');
INSERT INTO `bl_sort` VALUES (276, 32, '眼影', 'https://img13.iblimg.com/goods-135/2018/06/15277533868099fd828e.jpg');
INSERT INTO `bl_sort` VALUES (277, 32, '眼线', 'https://img14.iblimg.com/goods-135/2018/06/15277533927793f6ed83.jpg');
INSERT INTO `bl_sort` VALUES (278, 32, '眉笔/眉粉', 'https://img15.iblimg.com/goods-135/2018/06/15277533875104ef17e9.jpg');
INSERT INTO `bl_sort` VALUES (279, 32, '香水', 'https://img12.iblimg.com/goods-135/2018/06/15277533908647ce8315.jpg');
INSERT INTO `bl_sort` VALUES (280, 32, '女士香水', 'https://img15.iblimg.com/goods-135/images/category/2018/05/592282120.jpg');
INSERT INTO `bl_sort` VALUES (281, 33, '卫生巾', 'https://img13.iblimg.com/goods-135/2018/06/152775303109498e3406.jpg');
INSERT INTO `bl_sort` VALUES (282, 33, '日用', 'https://img15.iblimg.com/goods-135/images/category/2018/05/129123897.jpg');
INSERT INTO `bl_sort` VALUES (283, 33, '夜用', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1248438062.jpg');
INSERT INTO `bl_sort` VALUES (284, 33, '安心裤', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1253171976.jpg');
INSERT INTO `bl_sort` VALUES (285, 33, '进口女性护理', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1287598666.jpg');
INSERT INTO `bl_sort` VALUES (286, 33, '卫生护垫', 'https://img13.iblimg.com/goods-135/2018/06/1527752996379b6bede2.jpg');
INSERT INTO `bl_sort` VALUES (287, 33, '卫生棉条', 'https://img15.iblimg.com/goods-135/images/category/2018/05/771394991.jpg');
INSERT INTO `bl_sort` VALUES (288, 33, '女性洗液', 'https://img15.iblimg.com/goods-135/2018/06/15277530314675ae07a9.jpg');
INSERT INTO `bl_sort` VALUES (289, 34, '牙膏', 'https://img11.iblimg.com/goods-135/2018/06/1527753017945b020e7d.jpg');
INSERT INTO `bl_sort` VALUES (290, 34, '进口牙膏', 'https://img15.iblimg.com/goods-135/images/category/2018/05/777791907.jpg');
INSERT INTO `bl_sort` VALUES (291, 34, '漱口水', 'https://img12.iblimg.com/goods-135/2018/06/1527753031808b8ec80a.jpg');
INSERT INTO `bl_sort` VALUES (292, 34, '牙刷', 'https://img14.iblimg.com/goods-135/2018/06/15277530322825a31273.jpg');
INSERT INTO `bl_sort` VALUES (293, 35, '男士洁面', 'https://img11.iblimg.com/goods-135/2018/06/1527753006813870f398.jpg');
INSERT INTO `bl_sort` VALUES (294, 35, '男士爽肤水', 'https://img15.iblimg.com/goods-135/2018/06/152775355619293b6a0e.jpg');
INSERT INTO `bl_sort` VALUES (295, 35, '男士乳液面霜', 'https://img15.iblimg.com/goods-135/images/category/2018/05/295682596.jpg');
INSERT INTO `bl_sort` VALUES (296, 35, '男士面部精华', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1989049786.jpg');
INSERT INTO `bl_sort` VALUES (297, 35, '男士乳液面霜', 'https://img15.iblimg.com/goods-135/2018/06/15277535560635b41d77.jpg');
INSERT INTO `bl_sort` VALUES (298, 35, '男士洗发水', 'https://img13.iblimg.com/goods-135/2018/06/1527753221052cba63fd.jpg');
INSERT INTO `bl_sort` VALUES (299, 35, '男士沐浴露', 'https://img12.iblimg.com/goods-135/2018/06/152775322180178008e5.jpg');
INSERT INTO `bl_sort` VALUES (300, 35, '剃须刀', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1554132310.jpg');
INSERT INTO `bl_sort` VALUES (301, 35, '剃须泡沫', 'https://img15.iblimg.com/goods-135/2018/06/1527753317206e1e2fd6.jpg');
INSERT INTO `bl_sort` VALUES (302, 36, '化妆棉', 'https://img13.iblimg.com/goods-135/2018/06/15277535573958f21693.jpg');
INSERT INTO `bl_sort` VALUES (303, 36, '美发梳', 'https://img11.iblimg.com/goods-135/2018/06/1527753556922b50c687.jpg');
INSERT INTO `bl_sort` VALUES (304, 36, '美妆工具', 'https://img15.iblimg.com/goods-135/2018/06/152775355722863bd7da.jpg');
INSERT INTO `bl_sort` VALUES (305, 36, '浴球/浴花', 'https://img15.iblimg.com/goods-135/2018/06/1527752995780c423689.jpg');
INSERT INTO `bl_sort` VALUES (306, 37, '1段奶粉', 'https://img14.iblimg.com/goods-135/2018/06/1527753082678121ce8a.jpg');
INSERT INTO `bl_sort` VALUES (307, 37, '2段奶粉', 'https://img14.iblimg.com/goods-135/2018/06/15277533642262aca3fe.jpg');
INSERT INTO `bl_sort` VALUES (308, 37, '3段奶粉', 'https://img11.iblimg.com/goods-135/2018/06/15277533648682dbddc5.jpg');
INSERT INTO `bl_sort` VALUES (309, 37, '4段奶粉', 'https://img12.iblimg.com/goods-135/2018/06/15277533655302b16c9a.jpg');
INSERT INTO `bl_sort` VALUES (310, 37, '有机奶粉', 'https://img15.iblimg.com/goods-135/images/category/2017/05/2089655505.jpg');
INSERT INTO `bl_sort` VALUES (311, 37, '零食', 'https://img12.iblimg.com/goods-135/images/category/2018/05/113178991.jpg');
INSERT INTO `bl_sort` VALUES (312, 37, '米粉/米糊', 'https://img14.iblimg.com/goods-135/2018/06/1527753021724bf61863.jpg');
INSERT INTO `bl_sort` VALUES (313, 37, '面食', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1664300062.jpg');
INSERT INTO `bl_sort` VALUES (314, 37, '果泥', 'https://img12.iblimg.com/goods-135/images/category/2018/05/2110356105.jpg');
INSERT INTO `bl_sort` VALUES (315, 37, '母婴营养品', 'https://img13.iblimg.com/goods-135/2018/06/15277532593979691010.jpg');
INSERT INTO `bl_sort` VALUES (316, 37, '钙铁锌/维生素', 'https://img12.iblimg.com/goods-135/images/category/2018/05/84584754.jpg');
INSERT INTO `bl_sort` VALUES (317, 37, '鱼肝油', 'https://img12.iblimg.com/goods-135/images/category/2018/05/973854233.jpg');
INSERT INTO `bl_sort` VALUES (318, 37, '益生菌', 'https://img12.iblimg.com/goods-135/images/category/2018/05/724194103.jpg');
INSERT INTO `bl_sort` VALUES (319, 38, '纸尿裤', 'https://img15.iblimg.com/goods-135/images/category/2017/05/312613794.jpg');
INSERT INTO `bl_sort` VALUES (320, 38, 'NB', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1891084352.jpg');
INSERT INTO `bl_sort` VALUES (321, 38, 'S', 'https://img12.iblimg.com/goods-135/images/category/2017/05/1654024341.jpg');
INSERT INTO `bl_sort` VALUES (322, 38, 'M', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1029189877.jpg');
INSERT INTO `bl_sort` VALUES (323, 38, 'L', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1556008239.jpg');
INSERT INTO `bl_sort` VALUES (324, 38, 'XL', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1007862323.jpg');
INSERT INTO `bl_sort` VALUES (325, 38, '拉拉裤', 'https://img12.iblimg.com/goods-135/images/category/2017/05/338614830.jpg');
INSERT INTO `bl_sort` VALUES (326, 38, '婴儿湿巾', 'https://img15.iblimg.com/goods-135/images/category/2017/05/519728169.jpg');
INSERT INTO `bl_sort` VALUES (327, 38, '婴儿纸巾', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1094714613.jpg');
INSERT INTO `bl_sort` VALUES (328, 39, '洗发/护发', 'https://img15.iblimg.com/goods-135/2018/06/15277530379936b49895.jpg');
INSERT INTO `bl_sort` VALUES (329, 39, '沐浴露', 'https://img13.iblimg.com/goods-135/2018/06/1527753038663be91e7f.jpg');
INSERT INTO `bl_sort` VALUES (330, 39, '宝宝护肤', 'https://img13.iblimg.com/goods-135/2018/06/15277530392961e2ec97.jpg');
INSERT INTO `bl_sort` VALUES (331, 39, '口腔清洁', 'https://img15.iblimg.com/goods-135/2018/06/152775303512481889d2.jpg');
INSERT INTO `bl_sort` VALUES (332, 39, '驱蚊/防痱', 'https://img12.iblimg.com/goods-135/2018/06/1527753040015d83ed80.jpg');
INSERT INTO `bl_sort` VALUES (333, 39, '奶瓶清洁', 'https://img11.iblimg.com/goods-135/2018/06/15277533676695baaa03.jpg');
INSERT INTO `bl_sort` VALUES (334, 39, '洗衣液', 'https://img15.iblimg.com/goods-135/2018/06/15277530359113531d77.jpg');
INSERT INTO `bl_sort` VALUES (335, 39, '洗衣皂', 'https://img12.iblimg.com/goods-135/2018/06/1527753213887c394cfd.jpg');
INSERT INTO `bl_sort` VALUES (336, 39, '洗手液', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1900845060.jpg');
INSERT INTO `bl_sort` VALUES (337, 39, '卫浴用品', 'https://img14.iblimg.com/goods-135/2018/06/1527753369479780ea64.jpg');
INSERT INTO `bl_sort` VALUES (338, 40, '奶嘴/奶瓶', 'https://img15.iblimg.com/goods-135/2018/06/15277531926394da4d62.jpg');
INSERT INTO `bl_sort` VALUES (339, 40, '吸奶器', 'https://img11.iblimg.com/goods-135/2018/06/15277531919118a3ecd5.jpg');
INSERT INTO `bl_sort` VALUES (340, 40, '水壶水具', 'https://img12.iblimg.com/goods-135/images/category/2018/05/821814923.jpg');
INSERT INTO `bl_sort` VALUES (341, 40, '奶瓶消毒', 'https://img12.iblimg.com/goods-135/2018/06/152775337619413feae9.jpg');
INSERT INTO `bl_sort` VALUES (342, 40, '暖奶器', 'https://img13.iblimg.com/goods-135/2018/06/1527753376642be8c276.jpg');
INSERT INTO `bl_sort` VALUES (343, 40, '储奶袋/瓶', 'https://img14.iblimg.com/goods-135/2018/06/1527753371247304061b.jpg');
INSERT INTO `bl_sort` VALUES (344, 40, '安抚奶嘴', 'https://img15.iblimg.com/goods-135/2018/06/152775337170949e5eb5.jpg');
INSERT INTO `bl_sort` VALUES (345, 40, '牙胶/咬咬乐', 'https://img13.iblimg.com/goods-135/2018/06/1527753377113dcef18f.jpg');
INSERT INTO `bl_sort` VALUES (346, 40, '奶瓶刷/奶嘴刷', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1973317973.jpg');
INSERT INTO `bl_sort` VALUES (347, 40, '儿童餐具', 'https://img15.iblimg.com/goods-135/2018/06/15277533721766df2116.jpg');
INSERT INTO `bl_sort` VALUES (348, 41, '早教益智', 'https://img12.iblimg.com/goods-135/images/category/2017/05/834230364.jpg');
INSERT INTO `bl_sort` VALUES (349, 41, '彩泥手工', 'https://img15.iblimg.com/goods-135/images/category/2017/05/801031894.jpg');
INSERT INTO `bl_sort` VALUES (350, 41, '婴幼儿玩具', 'https://img11.iblimg.com/goods-135/2018/06/1527753211082826232e.jpg');
INSERT INTO `bl_sort` VALUES (351, 41, '电动玩具', 'https://img15.iblimg.com/goods-135/images/category/2017/05/353882073.jpg');
INSERT INTO `bl_sort` VALUES (352, 41, '积木拼图', 'https://img12.iblimg.com/goods-135/images/category/2017/05/112354702.jpg');
INSERT INTO `bl_sort` VALUES (353, 41, '娃娃', 'https://img15.iblimg.com/goods-135/images/category/2017/05/33335016.jpg');
INSERT INTO `bl_sort` VALUES (354, 41, '休闲玩具', 'https://img12.iblimg.com/goods-135/2018/06/15277532088451f35565.jpg');
INSERT INTO `bl_sort` VALUES (355, 41, '益智', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1715755434.jpg');
INSERT INTO `bl_sort` VALUES (356, 41, '动漫/机器人', 'https://img12.iblimg.com/goods-135/images/category/2018/05/985075105.jpg');
INSERT INTO `bl_sort` VALUES (357, 42, '防溢乳垫', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1938080328.jpg');
INSERT INTO `bl_sort` VALUES (358, 42, '孕妈洗护', 'https://img11.iblimg.com/goods-135/2018/06/15277532188788c5fd2b.jpg');
INSERT INTO `bl_sort` VALUES (359, 42, '产后修复', 'https://img15.iblimg.com/goods-135/images/category/2017/05/280743174.jpg');
INSERT INTO `bl_sort` VALUES (360, 42, '文胸/内裤', 'https://img14.iblimg.com/goods-135/images/category/2017/05/1838666787.jpg');
INSERT INTO `bl_sort` VALUES (361, 42, '防辐射服', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1542496628.jpg');
INSERT INTO `bl_sort` VALUES (362, 42, '哺乳用品', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1759381419.jpg');
INSERT INTO `bl_sort` VALUES (363, 42, '孕妈服饰', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1922475504.jpg');
INSERT INTO `bl_sort` VALUES (364, 42, '待产用品', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1734079010.jpg');
INSERT INTO `bl_sort` VALUES (365, 43, '安全座椅', 'https://img12.iblimg.com/goods-135/2018/06/15277531793315c80f3d.jpg');
INSERT INTO `bl_sort` VALUES (366, 43, '婴儿手推车', 'https://img12.iblimg.com/goods-135/2018/06/1527753176555078ddc1.jpg');
INSERT INTO `bl_sort` VALUES (367, 43, '婴儿背带', 'https://img12.iblimg.com/goods-135/images/category/2017/05/1573932961.jpg');
INSERT INTO `bl_sort` VALUES (368, 43, '学步车', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1551501031.jpg');
INSERT INTO `bl_sort` VALUES (369, 43, '婴儿床', 'https://img15.iblimg.com/goods-135/2018/06/1527753176181e96593e.jpg');
INSERT INTO `bl_sort` VALUES (370, 43, '餐椅', 'https://img11.iblimg.com/goods-135/2018/06/1527753179770c8ef2b2.jpg');
INSERT INTO `bl_sort` VALUES (371, 44, '内衣裤', 'https://img13.iblimg.com/goods-135/2018/06/15277532310711b98b9a.jpg');
INSERT INTO `bl_sort` VALUES (372, 44, '童套装', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1285026249.jpg');
INSERT INTO `bl_sort` VALUES (373, 44, '婴童运动鞋', 'https://img11.iblimg.com/goods-135/2018/06/1527753219513fbb1abf.jpg');
INSERT INTO `bl_sort` VALUES (374, 44, 'T恤', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1772733094.jpg');
INSERT INTO `bl_sort` VALUES (375, 44, '连衣裙', 'https://img15.iblimg.com/goods-135/2018/06/152775325011849a2693.jpg');
INSERT INTO `bl_sort` VALUES (376, 44, '毛衣/针织衫', 'https://img12.iblimg.com/goods-135/images/category/2018/05/933283427.jpg');
INSERT INTO `bl_sort` VALUES (377, 44, '外套/夹克', 'https://img14.iblimg.com/goods-135/2018/06/1527753248575ddc6f79.jpg');
INSERT INTO `bl_sort` VALUES (378, 44, '婴儿服饰', 'https://img12.iblimg.com/goods-135/images/category/2018/05/39145869.jpg');
INSERT INTO `bl_sort` VALUES (379, 44, '童裤', 'https://img15.iblimg.com/goods-135/images/category/2017/05/489425203.jpg');
INSERT INTO `bl_sort` VALUES (380, 44, '连身衣', 'https://img12.iblimg.com/goods-135/images/category/2018/05/449651868.jpg');
INSERT INTO `bl_sort` VALUES (381, 45, '枕头/枕芯', 'https://img11.iblimg.com/goods-135/2018/06/1527753378520d4fb0cd.jpg');
INSERT INTO `bl_sort` VALUES (382, 45, '抱被/抱毯', 'https://img12.iblimg.com/goods-135/2018/06/1527753378997da3acd4.jpg');
INSERT INTO `bl_sort` VALUES (383, 45, '床品', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1677457246.jpg');
INSERT INTO `bl_sort` VALUES (384, 45, '口水巾/吸汗巾', 'https://img12.iblimg.com/goods-135/images/category/2018/05/948755169.jpg');
INSERT INTO `bl_sort` VALUES (385, 45, '睡袋', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1176038363.jpg');
INSERT INTO `bl_sort` VALUES (386, 46, '0-2岁', 'https://img12.iblimg.com/goods-135/images/category/2018/05/2048620353.jpg');
INSERT INTO `bl_sort` VALUES (387, 46, '3-6岁', 'https://img12.iblimg.com/goods-135/images/category/2018/05/256297311.jpg');
INSERT INTO `bl_sort` VALUES (388, 46, '早教启蒙', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1599550937.jpg');
INSERT INTO `bl_sort` VALUES (389, 46, '幼儿手工', 'https://img12.iblimg.com/goods-135/images/category/2018/05/2021500317.jpg');
INSERT INTO `bl_sort` VALUES (390, 46, '亲子读物', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1010943935.jpg');
INSERT INTO `bl_sort` VALUES (391, 46, '智力开发', 'https://img12.iblimg.com/goods-135/images/category/2018/05/698798860.jpg');
INSERT INTO `bl_sort` VALUES (392, 46, '少儿英语', 'https://img12.iblimg.com/goods-135/images/category/2018/05/2116689594.jpg');
INSERT INTO `bl_sort` VALUES (393, 46, '儿童文学', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1091854748.jpg');
INSERT INTO `bl_sort` VALUES (394, 46, '少儿技能', 'https://img12.iblimg.com/goods-135/images/category/2018/05/15778521.jpg');
INSERT INTO `bl_sort` VALUES (395, 46, '少儿百科', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1309916845.jpg');
INSERT INTO `bl_sort` VALUES (396, 46, '孕产育儿', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1980442540.jpg');
INSERT INTO `bl_sort` VALUES (397, 46, '胎教', 'https://img12.iblimg.com/goods-135/images/category/2018/05/174752725.jpg');
INSERT INTO `bl_sort` VALUES (398, 47, '套装锅', 'https://img11.iblimg.com/goods-135/2018/06/152775331222608839b4.jpg');
INSERT INTO `bl_sort` VALUES (399, 47, '炒锅', 'https://img13.iblimg.com/goods-135/2018/06/1527752986177853421b.jpg');
INSERT INTO `bl_sort` VALUES (400, 47, '平底锅/煎锅', 'https://img15.iblimg.com/goods-135/2018/06/15277530223604ab1010.jpg');
INSERT INTO `bl_sort` VALUES (401, 47, '蒸锅', 'https://img11.iblimg.com/goods-135/2018/06/15277530853910d06f65.jpg');
INSERT INTO `bl_sort` VALUES (402, 47, '汤锅', 'https://img13.iblimg.com/goods-135/2018/06/1527753203514aa44c53.jpg');
INSERT INTO `bl_sort` VALUES (403, 47, '煲/砂锅', 'https://img14.iblimg.com/goods-135/2018/06/1527753204108786bc0d.jpg');
INSERT INTO `bl_sort` VALUES (404, 47, '压力锅', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1984311792.jpg');
INSERT INTO `bl_sort` VALUES (405, 47, '烧水壶', 'https://img13.iblimg.com/goods-135/2018/06/1527753086070e1a4450.jpg');
INSERT INTO `bl_sort` VALUES (406, 47, '刀具', 'https://img15.iblimg.com/goods-135/2018/06/1527753312962b8ca30b.jpg');
INSERT INTO `bl_sort` VALUES (407, 47, '砧板', 'https://img11.iblimg.com/goods-135/2018/06/152775330731656956d8.jpg');
INSERT INTO `bl_sort` VALUES (408, 47, '铲勺', 'https://img15.iblimg.com/goods-135/2018/06/152775308663228a26c1.jpg');
INSERT INTO `bl_sort` VALUES (409, 47, '收纳', 'https://img12.iblimg.com/goods-135/2018/06/1527753061042a5e4352.jpg');
INSERT INTO `bl_sort` VALUES (410, 47, '置物架', 'https://img12.iblimg.com/goods-135/2018/06/152775307750941ae6e1.jpg');
INSERT INTO `bl_sort` VALUES (411, 47, '厨房工具', 'https://img13.iblimg.com/goods-135/2018/06/152775306166766a1294.jpg');
INSERT INTO `bl_sort` VALUES (412, 48, '水杯/壶', 'https://img15.iblimg.com/goods-135/images/category/2017/05/544952440.jpg');
INSERT INTO `bl_sort` VALUES (413, 48, '保鲜盒', 'https://img13.iblimg.com/goods-135/images/category/2017/05/801004061.jpg');
INSERT INTO `bl_sort` VALUES (414, 48, '滤水壶', 'https://img13.iblimg.com/goods-135/images/category/2017/05/1617469.jpg');
INSERT INTO `bl_sort` VALUES (415, 48, '碗/碟/盘', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1529198930.jpg');
INSERT INTO `bl_sort` VALUES (416, 48, '餐具套装', 'https://img13.iblimg.com/goods-135/images/category/2017/05/2038275113.jpg');
INSERT INTO `bl_sort` VALUES (417, 48, '果盘/托盘', 'https://img13.iblimg.com/goods-135/images/category/2017/05/700004639.jpg');
INSERT INTO `bl_sort` VALUES (418, 48, '刀/叉/匙', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1510386897.jpg');
INSERT INTO `bl_sort` VALUES (419, 48, '筷子', 'https://img15.iblimg.com/goods-135/images/category/2017/05/57593786.jpg');
INSERT INTO `bl_sort` VALUES (420, 48, '茶具', 'https://img15.iblimg.com/goods-135/images/category/2017/05/107608359.jpg');
INSERT INTO `bl_sort` VALUES (421, 48, '酒杯/酒具', 'https://img13.iblimg.com/goods-135/images/category/2017/05/1830472917.jpg');
INSERT INTO `bl_sort` VALUES (422, 48, '保温杯', 'https://img15.iblimg.com/goods-135/images/category/2017/05/182012053.jpg');
INSERT INTO `bl_sort` VALUES (423, 49, '床品套件', 'https://img.iblimg.com/goods-16/images/category/2016/10/%E5%9B%9B%E4%BB%B6%E5%A5%97.jpg');
INSERT INTO `bl_sort` VALUES (424, 49, '秋冬被', 'https://img13.iblimg.com/goods-135/images/category/2018/05/858927698.jpg');
INSERT INTO `bl_sort` VALUES (425, 49, '床垫/床褥', 'https://img13.iblimg.com/goods-135/images/category/2018/05/583739212.jpg');
INSERT INTO `bl_sort` VALUES (426, 49, '被子', 'https://img.iblimg.com/goods-16/images/category/2016/10/%E5%86%AC%E8%A2%AB.jpg');
INSERT INTO `bl_sort` VALUES (427, 49, '枕头', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1935241084.jpg');
INSERT INTO `bl_sort` VALUES (428, 49, '毛毯', 'https://img.iblimg.com/goods-16/images/category/2016/10/%E6%AF%AF%E5%AD%90.jpg');
INSERT INTO `bl_sort` VALUES (429, 49, '床单被罩', 'https://img13.iblimg.com/goods-135/images/category/2018/05/283102200.jpg');
INSERT INTO `bl_sort` VALUES (430, 50, '毛巾', 'https://img15.iblimg.com/goods-135/images/category/2017/05/679236986.jpg');
INSERT INTO `bl_sort` VALUES (431, 50, '毛巾礼盒', 'https://img13.iblimg.com/goods-135/images/category/2017/05/1372377352.jpg');
INSERT INTO `bl_sort` VALUES (432, 50, '浴巾/浴袍', 'https://img13.iblimg.com/goods-135/images/category/2017/05/1937814459.jpg');
INSERT INTO `bl_sort` VALUES (433, 50, '家居拖鞋', 'https://img13.iblimg.com/goods-135/images/category/2017/05/749449750.jpg');
INSERT INTO `bl_sort` VALUES (434, 50, '靠垫坐垫', 'https://img11.iblimg.com/goods-135/2018/06/15277533078098f9749d.jpg');
INSERT INTO `bl_sort` VALUES (435, 50, '地毯地垫', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1285690420.jpg');
INSERT INTO `bl_sort` VALUES (436, 50, '围裙/袖套', 'https://img13.iblimg.com/goods-135/images/category/2017/05/463967660.jpg');
INSERT INTO `bl_sort` VALUES (437, 51, '收纳箱', 'https://img11.iblimg.com/goods-135/2018/06/1527753013550bf7f0f1.jpg');
INSERT INTO `bl_sort` VALUES (438, 51, '收纳柜', 'https://img15.iblimg.com/goods-135/images/category/2017/04/351027548.jpg');
INSERT INTO `bl_sort` VALUES (439, 51, '压缩袋/泵', 'https://img12.iblimg.com/goods-135/2018/06/1527753077078d56fd3d.jpg');
INSERT INTO `bl_sort` VALUES (440, 51, '衣架', 'https://img12.iblimg.com/goods-135/images/category/2017/04/999138467.jpg');
INSERT INTO `bl_sort` VALUES (441, 51, '晾晒衣架', 'https://img15.iblimg.com/goods-135/images/category/2017/05/1362554916.jpg');
INSERT INTO `bl_sort` VALUES (442, 51, '杂物收纳', 'https://img12.iblimg.com/goods-135/2018/06/15277533158818e4f7f1.jpg');
INSERT INTO `bl_sort` VALUES (443, 52, '太阳伞', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1920795243.jpg');
INSERT INTO `bl_sort` VALUES (444, 52, '雨伞雨具', 'https://img15.iblimg.com/goods-135/images/category/2017/04/1749017726.jpg');
INSERT INTO `bl_sort` VALUES (445, 52, '粘钩/挂钩', 'https://img15.iblimg.com/goods-135/images/category/2017/04/451641574.jpg');
INSERT INTO `bl_sort` VALUES (446, 52, '口罩', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1081421387.jpg');
INSERT INTO `bl_sort` VALUES (447, 53, '花瓶', 'https://img13.iblimg.com/goods-135/2018/06/1527753308948fd0379a.jpg');
INSERT INTO `bl_sort` VALUES (448, 53, '防油贴', 'https://img15.iblimg.com/goods-135/2018/06/152775302703910b27d6.jpg');
INSERT INTO `bl_sort` VALUES (449, 54, '浴霸', 'https://img15.iblimg.com/goods-135/2018/06/15277533309089c1d2b5.jpg');
INSERT INTO `bl_sort` VALUES (450, 54, '马桶盖', 'https://img15.iblimg.com/goods-135/images/category/2017/04/55333143.jpg');
INSERT INTO `bl_sort` VALUES (451, 54, '厨房装修', 'https://img13.iblimg.com/goods-135/images/category/2017/05/913681021.jpg');
INSERT INTO `bl_sort` VALUES (452, 54, '卫浴装修', 'https://img13.iblimg.com/goods-135/images/category/2017/05/1841649523.jpg');
INSERT INTO `bl_sort` VALUES (453, 54, '灯具灯饰', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1026104578.jpg');
INSERT INTO `bl_sort` VALUES (454, 54, '台灯', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1574669266.jpg');
INSERT INTO `bl_sort` VALUES (455, 54, '灯管/灯泡', 'https://img12.iblimg.com/goods-135/images/category/2017/04/66643695.jpg');
INSERT INTO `bl_sort` VALUES (456, 54, '拖线板', 'https://img15.iblimg.com/goods-135/images/category/2017/04/1579827957.jpg');
INSERT INTO `bl_sort` VALUES (457, 54, '开关插座', 'https://img15.iblimg.com/goods-135/images/category/2017/04/2062201761.jpg');
INSERT INTO `bl_sort` VALUES (458, 54, '五金工具', 'https://img15.iblimg.com/goods-135/images/category/2017/04/1268169482.jpg');
INSERT INTO `bl_sort` VALUES (459, 54, '地板', 'https://img13.iblimg.com/goods-135/images/category/2017/05/225928092.jpg');
INSERT INTO `bl_sort` VALUES (460, 55, '床垫/席梦思', 'https://img13.iblimg.com/goods-135/images/category/2018/05/766961185.jpg');
INSERT INTO `bl_sort` VALUES (461, 55, '床', 'https://img13.iblimg.com/goods-135/images/category/2017/05/1436396067.jpg');
INSERT INTO `bl_sort` VALUES (462, 55, '架类', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1717619046.jpg');
INSERT INTO `bl_sort` VALUES (463, 55, '凳椅', 'https://img15.iblimg.com/goods-135/images/category/2017/04/1707110501.jpg');
INSERT INTO `bl_sort` VALUES (464, 55, '桌类', 'https://img13.iblimg.com/goods-135/images/category/2018/05/114458490.jpg');
INSERT INTO `bl_sort` VALUES (465, 55, '柜类', 'https://img15.iblimg.com/goods-135/images/category/2017/05/304714824.jpg');
INSERT INTO `bl_sort` VALUES (466, 56, '猫粮', 'https://img13.iblimg.com/goods-135/images/category/2017/05/1829328230.jpg');
INSERT INTO `bl_sort` VALUES (467, 56, '狗粮', 'https://img15.iblimg.com/goods-135/images/category/2017/05/198862256.jpg');
INSERT INTO `bl_sort` VALUES (468, 56, '宠物用品', 'https://img13.iblimg.com/goods-135/images/category/2017/05/1792897175.jpg');
INSERT INTO `bl_sort` VALUES (469, 57, '抽纸', 'https://img11.iblimg.com/goods-135/2018/06/15277529871040b7976c.jpg');
INSERT INTO `bl_sort` VALUES (470, 57, '卷筒纸', 'https://img11.iblimg.com/goods-135/2018/06/1527753064079efaccd3.jpg');
INSERT INTO `bl_sort` VALUES (471, 57, '手帕纸', 'https://img15.iblimg.com/goods-135/2018/06/1527753074954bf88ea8.jpg');
INSERT INTO `bl_sort` VALUES (472, 57, '湿巾', 'https://img12.iblimg.com/goods-135/2018/06/1527753087190d691848.jpg');
INSERT INTO `bl_sort` VALUES (473, 57, '平板卫生纸', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1664059179.jpg');
INSERT INTO `bl_sort` VALUES (474, 57, '厨房用纸', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1931333372.jpg');
INSERT INTO `bl_sort` VALUES (475, 57, '湿厕纸', 'https://img15.iblimg.com/goods-135/images/category/2018/05/473078811.jpg');
INSERT INTO `bl_sort` VALUES (476, 58, '洗衣液凝珠', 'https://img13.iblimg.com/goods-135/2018/06/1527753043306c2d728f.jpg');
INSERT INTO `bl_sort` VALUES (477, 58, '凝珠', 'https://img11.iblimg.com/goods-135/images/category/2019/03/688612492.jpg');
INSERT INTO `bl_sort` VALUES (478, 58, '衣物除菌液', 'https://img13.iblimg.com/goods-135/images/category/2017/04/73379765.jpg');
INSERT INTO `bl_sort` VALUES (479, 58, '洗衣粉', 'https://img14.iblimg.com/goods-135/2018/06/1527752987593e669986.jpg');
INSERT INTO `bl_sort` VALUES (480, 58, '柔顺剂', 'https://img13.iblimg.com/goods-135/images/category/2017/04/562067517.jpg');
INSERT INTO `bl_sort` VALUES (481, 58, '洗衣皂', 'https://img14.iblimg.com/goods-135/2018/06/1527753042731e0638c3.jpg');
INSERT INTO `bl_sort` VALUES (482, 58, '衣领净', 'https://img13.iblimg.com/goods-135/images/category/2017/04/874842099.jpg');
INSERT INTO `bl_sort` VALUES (483, 58, '漂白/去渍', 'https://img13.iblimg.com/goods-135/2018/06/1527753358114de62571.jpg');
INSERT INTO `bl_sort` VALUES (484, 58, '天然皂粉', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1066286404.jpg');
INSERT INTO `bl_sort` VALUES (485, 59, '洗洁精', 'https://img13.iblimg.com/goods-135/images/category/2017/04/644744307.jpg');
INSERT INTO `bl_sort` VALUES (486, 59, '油污净', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1018517996.jpg');
INSERT INTO `bl_sort` VALUES (487, 59, '洁厕剂', 'https://img15.iblimg.com/goods-135/images/category/2018/05/597565443.jpg');
INSERT INTO `bl_sort` VALUES (488, 59, '管道疏通剂', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1490153291.jpg');
INSERT INTO `bl_sort` VALUES (489, 59, '卫浴清洁', 'https://img15.iblimg.com/goods-135/images/category/2018/05/2016182049.jpg');
INSERT INTO `bl_sort` VALUES (490, 59, '除垢剂', 'https://img15.iblimg.com/goods-135/images/category/2018/05/460032770.jpg');
INSERT INTO `bl_sort` VALUES (491, 60, '防潮防蛀', 'https://img11.iblimg.com/goods-135/images/category/2018/01/769955160.jpg');
INSERT INTO `bl_sort` VALUES (492, 60, '驱蚊', 'https://img15.iblimg.com/goods-135/images/category/2018/05/695088150.jpg');
INSERT INTO `bl_sort` VALUES (493, 60, '驱虫', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1318130429.jpg');
INSERT INTO `bl_sort` VALUES (494, 60, '冰箱除臭', 'https://img15.iblimg.com/goods-135/images/category/2018/05/960745437.jpg');
INSERT INTO `bl_sort` VALUES (495, 60, '除甲醛', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1144021146.jpg');
INSERT INTO `bl_sort` VALUES (496, 60, '空气清新', 'https://img15.iblimg.com/goods-135/images/category/2018/05/325649061.jpg');
INSERT INTO `bl_sort` VALUES (497, 60, '玻璃清洁', 'https://img12.iblimg.com/goods-135/2018/06/152775298802731b31f2.jpg');
INSERT INTO `bl_sort` VALUES (498, 60, '家电清洁', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1977282887.jpg');
INSERT INTO `bl_sort` VALUES (499, 60, '多用途清洁剂', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1107663928.jpg');
INSERT INTO `bl_sort` VALUES (500, 60, '地板清洁', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1192826096.jpg');
INSERT INTO `bl_sort` VALUES (501, 61, '保鲜膜', 'https://img.iblimg.com/goods-130/images/category/2016/12/1608278979.jpg');
INSERT INTO `bl_sort` VALUES (502, 61, '保鲜袋', 'https://img.iblimg.com/goods-130/images/category/2016/12/1953987000.jpg');
INSERT INTO `bl_sort` VALUES (503, 61, '垃圾袋', 'https://img.iblimg.com/goods-130/images/category/2016/12/260413358.jpg');
INSERT INTO `bl_sort` VALUES (504, 61, '一次性塑杯', 'https://img.iblimg.com/goods-130/images/category/2016/12/841551582.jpg');
INSERT INTO `bl_sort` VALUES (505, 61, '一次性纸杯', 'https://img.iblimg.com/goods-130/images/category/2016/12/951884519.jpg');
INSERT INTO `bl_sort` VALUES (506, 61, '一次性餐具', 'https://img.iblimg.com/goods-130/images/category/2016/12/1732845592.jpg');
INSERT INTO `bl_sort` VALUES (507, 61, '锡纸/铝箔', 'https://img.iblimg.com/goods-130/images/category/2016/12/1280969310.jpg');
INSERT INTO `bl_sort` VALUES (508, 62, '拖把/配件', 'https://img15.iblimg.com/goods-135/images/category/2018/05/156538953.jpg');
INSERT INTO `bl_sort` VALUES (509, 62, '抹布', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1780851896.jpg');
INSERT INTO `bl_sort` VALUES (510, 62, '百洁布', 'https://img15.iblimg.com/goods-135/images/category/2018/05/276754017.jpg');
INSERT INTO `bl_sort` VALUES (511, 62, '钢丝球', 'https://img15.iblimg.com/goods-135/images/category/2018/05/867818633.jpg');
INSERT INTO `bl_sort` VALUES (512, 62, '清洁手套', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1316114494.jpg');
INSERT INTO `bl_sort` VALUES (513, 62, '垃圾桶', 'https://img13.iblimg.com/goods-135/images/category/2017/04/522639167.jpg');
INSERT INTO `bl_sort` VALUES (514, 62, '除尘工具', 'https://img15.iblimg.com/goods-135/images/category/2018/05/645212080.jpg');
INSERT INTO `bl_sort` VALUES (515, 62, '肥皂盒/架', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1200213189.jpg');
INSERT INTO `bl_sort` VALUES (516, 62, '浴室防滑垫', 'https://img15.iblimg.com/goods-135/images/category/2018/05/258016760.jpg');
INSERT INTO `bl_sort` VALUES (517, 62, '脸盆', 'https://img13.iblimg.com/goods-135/images/category/2017/04/192162957.jpg');
INSERT INTO `bl_sort` VALUES (518, 63, 'T恤', 'https://img12.iblimg.com/goods-135/images/category/2018/05/381505191.jpg');
INSERT INTO `bl_sort` VALUES (519, 63, '衬衫', 'https://img.iblimg.com/goods-124/images/category/2016/12/931095112.jpg');
INSERT INTO `bl_sort` VALUES (520, 63, '针织衫', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1055400930.jpg');
INSERT INTO `bl_sort` VALUES (521, 63, '外套', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1159423212.jpg');
INSERT INTO `bl_sort` VALUES (522, 63, '卫衣', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1464977922.jpg');
INSERT INTO `bl_sort` VALUES (523, 63, '风衣', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1349629574.jpg');
INSERT INTO `bl_sort` VALUES (524, 64, '牛仔裤', 'https://img15.iblimg.com/goods-135/2018/06/15277530210575e717d3.jpg');
INSERT INTO `bl_sort` VALUES (525, 64, '短裤', 'https://img12.iblimg.com/goods-135/images/category/2018/05/691156218.jpg');
INSERT INTO `bl_sort` VALUES (526, 64, '休闲裤', 'https://img12.iblimg.com/goods-135/images/category/2018/05/966124868.jpg');
INSERT INTO `bl_sort` VALUES (527, 64, '小脚裤', 'https://img12.iblimg.com/goods-135/images/category/2018/05/1376742701.jpg');
INSERT INTO `bl_sort` VALUES (528, 65, '连衣裙', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1295528800.jpg');
INSERT INTO `bl_sort` VALUES (529, 65, '背心裙', 'https://img13.iblimg.com/goods-135/images/category/2018/05/2036607567.jpg');
INSERT INTO `bl_sort` VALUES (530, 65, '半身裙', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1733457200.jpg');
INSERT INTO `bl_sort` VALUES (531, 65, '包臀裙', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1988025402.jpg');
INSERT INTO `bl_sort` VALUES (532, 65, '百褶裙', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1741815305.jpg');
INSERT INTO `bl_sort` VALUES (533, 66, 'T恤', 'https://img13.iblimg.com/goods-135/images/category/2018/05/132372229.jpg');
INSERT INTO `bl_sort` VALUES (534, 66, '衬衫', 'https://img13.iblimg.com/goods-135/images/category/2018/05/471029905.jpg');
INSERT INTO `bl_sort` VALUES (535, 66, 'Polo衫', 'https://img13.iblimg.com/goods-135/images/category/2018/05/955774549.jpg');
INSERT INTO `bl_sort` VALUES (536, 66, '卫衣', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1103616025.jpg');
INSERT INTO `bl_sort` VALUES (537, 66, '针织衫', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1599919572.jpg');
INSERT INTO `bl_sort` VALUES (538, 66, '外套', 'https://img13.iblimg.com/goods-135/images/category/2018/05/519823838.jpg');
INSERT INTO `bl_sort` VALUES (539, 66, '休闲西装', 'https://img13.iblimg.com/goods-135/images/category/2018/05/2061360579.jpg');
INSERT INTO `bl_sort` VALUES (540, 66, '毛呢大衣', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1906101647.jpg');
INSERT INTO `bl_sort` VALUES (541, 67, '休闲裤', 'https://img13.iblimg.com/goods-135/images/category/2018/05/149406736.jpg');
INSERT INTO `bl_sort` VALUES (542, 67, '短裤', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1713806892.jpg');
INSERT INTO `bl_sort` VALUES (543, 67, '牛仔裤', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1465075560.jpg');
INSERT INTO `bl_sort` VALUES (544, 68, '女士内裤', 'https://img13.iblimg.com/goods-135/2018/06/1527753206761196714e.jpg');
INSERT INTO `bl_sort` VALUES (545, 68, '男士内裤', 'https://img11.iblimg.com/goods-135/2018/06/152775322887313549d2.jpg');
INSERT INTO `bl_sort` VALUES (546, 68, '女袜', 'https://img13.iblimg.com/goods-135/images/category/2018/05/608748757.jpg');
INSERT INTO `bl_sort` VALUES (547, 68, '男袜', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1731013009.jpg');
INSERT INTO `bl_sort` VALUES (548, 68, '连裤袜', 'https://img14.iblimg.com/goods-135/2018/06/1527753229666d3741f6.jpg');
INSERT INTO `bl_sort` VALUES (549, 69, '文胸', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1538470976.jpg');
INSERT INTO `bl_sort` VALUES (550, 69, '文胸套装', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1082932380.jpg');
INSERT INTO `bl_sort` VALUES (551, 70, '男士家居服', 'https://img13.iblimg.com/goods-135/images/category/2018/05/308332413.jpg');
INSERT INTO `bl_sort` VALUES (552, 70, '女士家居服', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1672530344.jpg');
INSERT INTO `bl_sort` VALUES (553, 70, '春夏家居服', 'https://img13.iblimg.com/goods-135/images/category/2018/05/590563187.jpg');
INSERT INTO `bl_sort` VALUES (554, 71, '围巾围脖', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1224123033.jpg');
INSERT INTO `bl_sort` VALUES (555, 71, '帽子', 'https://img13.iblimg.com/goods-135/images/category/2018/05/344156965.jpg');
INSERT INTO `bl_sort` VALUES (556, 71, '皮带', 'https://img13.iblimg.com/goods-135/images/category/2018/05/2008745830.jpg');
INSERT INTO `bl_sort` VALUES (557, 72, '凉鞋', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1091392445.jpg');
INSERT INTO `bl_sort` VALUES (558, 72, '凉拖', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1811536805.jpg');
INSERT INTO `bl_sort` VALUES (559, 72, '单鞋/休闲鞋', 'https://img11.iblimg.com/goods-135/images/category/2018/05/159376464.jpg');
INSERT INTO `bl_sort` VALUES (560, 72, '女靴', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1861413777.jpg');
INSERT INTO `bl_sort` VALUES (561, 73, '女士钱包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/2142381809.jpg');
INSERT INTO `bl_sort` VALUES (562, 73, '单肩包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/634002594.jpg');
INSERT INTO `bl_sort` VALUES (563, 73, '斜挎包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/946942700.jpg');
INSERT INTO `bl_sort` VALUES (564, 73, '手提包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/879827191.jpg');
INSERT INTO `bl_sort` VALUES (565, 73, '真皮包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1035526949.jpg');
INSERT INTO `bl_sort` VALUES (566, 74, '男士钱包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/430724448.jpg');
INSERT INTO `bl_sort` VALUES (567, 74, '单肩包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1349454713.jpg');
INSERT INTO `bl_sort` VALUES (568, 74, '斜挎包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/335666288.jpg');
INSERT INTO `bl_sort` VALUES (569, 74, '手提包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1669250385.jpg');
INSERT INTO `bl_sort` VALUES (570, 74, '手拿包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1199223947.jpg');
INSERT INTO `bl_sort` VALUES (571, 74, '公交包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1517429379.jpg');
INSERT INTO `bl_sort` VALUES (572, 75, '凉鞋', 'https://img11.iblimg.com/goods-135/images/category/2018/05/701809084.jpg');
INSERT INTO `bl_sort` VALUES (573, 75, '休闲鞋', 'https://img11.iblimg.com/goods-135/images/category/2018/05/165173649.jpg');
INSERT INTO `bl_sort` VALUES (574, 75, '商务鞋', 'https://img11.iblimg.com/goods-135/images/category/2018/05/967608783.jpg');
INSERT INTO `bl_sort` VALUES (575, 76, '旅行箱', 'https://img11.iblimg.com/goods-135/images/category/2018/05/641755660.jpg');
INSERT INTO `bl_sort` VALUES (576, 76, '万向轮箱', 'https://img11.iblimg.com/goods-135/images/category/2018/05/126426862.jpg');
INSERT INTO `bl_sort` VALUES (577, 76, '登机箱', 'https://img11.iblimg.com/goods-135/images/category/2018/05/422672879.jpg');
INSERT INTO `bl_sort` VALUES (578, 76, '硬箱', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1645320783.jpg');
INSERT INTO `bl_sort` VALUES (579, 76, '软箱', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1309583877.jpg');
INSERT INTO `bl_sort` VALUES (580, 76, '双肩包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/859523139.jpg');
INSERT INTO `bl_sort` VALUES (581, 76, '腰包胸包', 'https://img11.iblimg.com/goods-135/images/category/2018/05/2083464915.jpg');
INSERT INTO `bl_sort` VALUES (582, 77, '太阳镜', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1547258365.jpg');
INSERT INTO `bl_sort` VALUES (583, 77, '框架眼镜', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1706994693.jpg');
INSERT INTO `bl_sort` VALUES (584, 77, '吴良材', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1028608565.jpg');
INSERT INTO `bl_sort` VALUES (585, 78, '耳饰', 'https://img11.iblimg.com/goods-135/images/category/2018/05/643690743.jpg');
INSERT INTO `bl_sort` VALUES (586, 78, '项链', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1417487923.jpg');
INSERT INTO `bl_sort` VALUES (587, 78, '吊坠', 'https://img11.iblimg.com/goods-135/images/category/2018/05/673366738.jpg');
INSERT INTO `bl_sort` VALUES (588, 78, '戒指', 'https://img11.iblimg.com/goods-135/images/category/2018/05/595505206.jpg');
INSERT INTO `bl_sort` VALUES (589, 78, '手镯', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1497687584.jpg');
INSERT INTO `bl_sort` VALUES (590, 78, '手链', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1078741398.jpg');
INSERT INTO `bl_sort` VALUES (591, 78, '发饰', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1985758861.jpg');
INSERT INTO `bl_sort` VALUES (592, 79, '金银投资', 'https://img13.iblimg.com/goods-134/images/category/2017/02/2107993662.jpg');
INSERT INTO `bl_sort` VALUES (593, 79, '黄金饰品', 'https://img12.iblimg.com/goods-135/2018/06/1527753223387a3754b9.jpg');
INSERT INTO `bl_sort` VALUES (594, 79, 'k金饰品', 'https://img13.iblimg.com/goods-135/2018/06/152775335531661e0df9.jpg');
INSERT INTO `bl_sort` VALUES (595, 79, '铂金饰品', 'https://img15.iblimg.com/goods-135/images/category/2018/05/697331431.jpg');
INSERT INTO `bl_sort` VALUES (596, 79, '钻石饰品', 'https://img15.iblimg.com/goods-135/2018/06/15277533559984a584c0.jpg');
INSERT INTO `bl_sort` VALUES (597, 79, '银饰品', 'https://img12.iblimg.com/goods-135/2018/06/152775322408124b9728.jpg');
INSERT INTO `bl_sort` VALUES (598, 79, '琥珀蜜蜡', 'https://img11.iblimg.com/goods-135/images/category/2018/05/871551977.jpg');
INSERT INTO `bl_sort` VALUES (599, 79, '宝石饰品', 'https://img11.iblimg.com/goods-135/images/category/2018/05/428645979.jpg');
INSERT INTO `bl_sort` VALUES (600, 79, '纪念币/钞', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1478992558.jpg');
INSERT INTO `bl_sort` VALUES (601, 80, '女士手表', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1013864532.jpg');
INSERT INTO `bl_sort` VALUES (602, 80, '男士手表', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1195123367.jpg');
INSERT INTO `bl_sort` VALUES (603, 80, '机械表', 'https://img15.iblimg.com/goods-135/images/category/2018/05/2095854026.jpg');
INSERT INTO `bl_sort` VALUES (604, 80, '石英表', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1871355945.jpg');
INSERT INTO `bl_sort` VALUES (605, 81, '手机', 'https://img14.iblimg.com/goods-135/2018/06/1527753032702c73df69.jpg');
INSERT INTO `bl_sort` VALUES (606, 81, '华为', 'https://img11.iblimg.com/goods-135/images/category/2018/05/495123311.jpg');
INSERT INTO `bl_sort` VALUES (607, 81, '荣耀', 'https://img11.iblimg.com/goods-135/images/category/2018/05/2124143756.jpg');
INSERT INTO `bl_sort` VALUES (608, 81, '小米', 'https://img11.iblimg.com/goods-135/images/category/2018/05/974665380.jpg');
INSERT INTO `bl_sort` VALUES (609, 81, 'iPhone', 'https://img11.iblimg.com/goods-135/images/category/2018/05/417668059.jpg');
INSERT INTO `bl_sort` VALUES (610, 81, 'SAMSUNG', 'https://img11.iblimg.com/goods-135/images/category/2018/05/396282538.jpg');
INSERT INTO `bl_sort` VALUES (611, 81, 'OPPO', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1764933872.jpg');
INSERT INTO `bl_sort` VALUES (612, 81, '魅族', 'https://img11.iblimg.com/goods-135/images/category/2018/05/650988611.jpg');
INSERT INTO `bl_sort` VALUES (613, 81, 'VIVO', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1494633824.jpg');
INSERT INTO `bl_sort` VALUES (614, 82, '数码相机', 'https://img15.iblimg.com/goods-135/2018/06/152775300880833437df.jpg');
INSERT INTO `bl_sort` VALUES (615, 82, '单反相机', 'https://img14.iblimg.com/goods-135/2018/06/1527753009385a63f83a.jpg');
INSERT INTO `bl_sort` VALUES (616, 82, '镜头', 'https://img12.iblimg.com/goods-135/2018/06/1527753009955a9a84ea.jpg');
INSERT INTO `bl_sort` VALUES (617, 82, '单电/微单', 'https://img12.iblimg.com/goods-135/2018/06/152775301058982025d3.jpg');
INSERT INTO `bl_sort` VALUES (618, 82, '拍立得相机', 'https://img12.iblimg.com/goods-135/2018/06/1527753070758e47add0.jpg');
INSERT INTO `bl_sort` VALUES (619, 82, '摄像机', 'https://img11.iblimg.com/goods-135/2018/06/1527753011147407dcc4.jpg');
INSERT INTO `bl_sort` VALUES (620, 82, '相机包', 'https://img12.iblimg.com/goods-135/2018/06/1527753340574a257965.jpg');
INSERT INTO `bl_sort` VALUES (621, 82, '三脚架/云台', 'https://img12.iblimg.com/goods-135/2018/06/1527753338033854b1c9.jpg');
INSERT INTO `bl_sort` VALUES (622, 83, '耳机/耳麦', 'https://img12.iblimg.com/goods-135/2018/06/15277530339785fbca85.jpg');
INSERT INTO `bl_sort` VALUES (623, 83, '音箱', 'https://img13.iblimg.com/goods-135/2018/06/1527752985590f744c33.jpg');
INSERT INTO `bl_sort` VALUES (624, 83, '便携/无线音箱', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1350803010.jpg');
INSERT INTO `bl_sort` VALUES (625, 83, 'MP3/MP4', 'https://img13.iblimg.com/goods-135/2018/06/1527753046035df62d80.jpg');
INSERT INTO `bl_sort` VALUES (626, 83, '电玩游戏', 'https://img11.iblimg.com/goods-135/2018/06/1527753226689eaafed8.jpg');
INSERT INTO `bl_sort` VALUES (627, 84, '智能手环', 'https://img12.iblimg.com/goods-135/2018/06/15277530334961100241.jpg');
INSERT INTO `bl_sort` VALUES (628, 84, '智能手表', 'https://img12.iblimg.com/goods-135/2018/06/1527753054460ba87e62.jpg');
INSERT INTO `bl_sort` VALUES (629, 84, '智能眼镜', 'https://img14.iblimg.com/goods-135/2018/06/152775340363155df434.jpg');
INSERT INTO `bl_sort` VALUES (630, 84, '智能儿童手表', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1460831570.jpg');
INSERT INTO `bl_sort` VALUES (631, 84, '无人机', 'https://img13.iblimg.com/goods-135/2018/06/15277535592477490972.jpg');
INSERT INTO `bl_sort` VALUES (632, 85, '数据线', 'https://img15.iblimg.com/goods-135/2018/06/1527753002607e64cef0.jpg');
INSERT INTO `bl_sort` VALUES (633, 85, '干电池', 'https://img11.iblimg.com/goods-135/2018/06/152775308775593a0718.jpg');
INSERT INTO `bl_sort` VALUES (634, 85, '蓝牙耳机', 'https://img14.iblimg.com/goods-135/images/category/2017/05/1953490802.jpg');
INSERT INTO `bl_sort` VALUES (635, 85, '手机耳机', 'https://img14.iblimg.com/goods-135/images/category/2017/05/1405155325.jpg');
INSERT INTO `bl_sort` VALUES (636, 85, '移动电源', 'https://img14.iblimg.com/goods-135/2018/06/152775304682484c336c.jpg');
INSERT INTO `bl_sort` VALUES (637, 85, '手机保护套', 'https://img11.iblimg.com/goods-135/2018/06/15277530406849055c45.jpg');
INSERT INTO `bl_sort` VALUES (638, 85, '贴膜', 'https://img13.iblimg.com/goods-135/2018/06/15277529927379809508.jpg');
INSERT INTO `bl_sort` VALUES (639, 85, '存储卡', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1797836267.jpg');
INSERT INTO `bl_sort` VALUES (640, 86, '电纸书', 'https://img15.iblimg.com/goods-135/2018/06/15277530331173de0d67.jpg');
INSERT INTO `bl_sort` VALUES (641, 86, '录音笔', 'https://img11.iblimg.com/goods-135/2018/06/15277532248283a4583d.jpg');
INSERT INTO `bl_sort` VALUES (642, 86, '电子词典', 'https://img12.iblimg.com/goods-135/2018/06/1527753225383eda0837.jpg');
INSERT INTO `bl_sort` VALUES (643, 86, '点读机', 'https://img13.iblimg.com/goods-135/2018/06/1527753226054923d72e.jpg');
INSERT INTO `bl_sort` VALUES (644, 86, '早教益智', 'https://img11.iblimg.com/goods-135/images/category/2018/05/179608571.jpg');
INSERT INTO `bl_sort` VALUES (645, 87, '笔记本电脑', 'https://img13.iblimg.com/goods-135/2018/06/152775307793573e003f.jpg');
INSERT INTO `bl_sort` VALUES (646, 87, '游戏本', 'https://img14.iblimg.com/goods-135/2018/06/1527753078430cdc2bc7.jpg');
INSERT INTO `bl_sort` VALUES (647, 87, '轻薄本', 'https://img11.iblimg.com/goods-135/images/category/2018/01/22073741.jpg');
INSERT INTO `bl_sort` VALUES (648, 87, '平板电脑', 'https://img13.iblimg.com/goods-135/2018/06/15277530646461412a85.jpg');
INSERT INTO `bl_sort` VALUES (649, 87, 'iPad', 'https://img13.iblimg.com/goods-135/2018/06/1527753558742d116b4d.jpg');
INSERT INTO `bl_sort` VALUES (650, 87, 'Surface', 'https://img13.iblimg.com/goods-135/2018/06/1527753558887c0ecc42.jpg');
INSERT INTO `bl_sort` VALUES (651, 87, '台式机', 'https://img15.iblimg.com/goods-135/2018/06/1527753078891fb079f5.jpg');
INSERT INTO `bl_sort` VALUES (652, 87, '一体机', 'https://img14.iblimg.com/goods-135/2018/06/152775307943482803b9.jpg');
INSERT INTO `bl_sort` VALUES (653, 87, '显示器', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1417200801.jpg');
INSERT INTO `bl_sort` VALUES (654, 88, '鼠标', 'https://img12.iblimg.com/goods-135/images/category/2018/01/2087974095.jpg');
INSERT INTO `bl_sort` VALUES (655, 88, '键盘', 'https://img12.iblimg.com/goods-135/images/category/2018/01/1830428877.jpg');
INSERT INTO `bl_sort` VALUES (656, 88, '键鼠套装', 'https://img12.iblimg.com/goods-135/images/category/2018/01/162666726.jpg');
INSERT INTO `bl_sort` VALUES (657, 88, 'U盘', 'https://img12.iblimg.com/goods-135/2018/06/15277530018563e62a27.jpg');
INSERT INTO `bl_sort` VALUES (658, 88, '移动硬盘', 'https://img14.iblimg.com/goods-135/2018/06/152775300109168c29aa.jpg');
INSERT INTO `bl_sort` VALUES (659, 89, '路由器', 'https://img12.iblimg.com/goods-135/images/category/2018/01/1120564689.jpg');
INSERT INTO `bl_sort` VALUES (660, 89, '4G/3G上网', 'https://img12.iblimg.com/goods-135/2018/06/15277532588812f898b8.jpg');
INSERT INTO `bl_sort` VALUES (661, 90, '多功能一体机', 'https://img12.iblimg.com/goods-135/2018/06/152775321809360a3f6c.jpg');
INSERT INTO `bl_sort` VALUES (662, 90, '投影仪', 'https://img12.iblimg.com/goods-135/images/category/2018/01/1937578078.jpg');
INSERT INTO `bl_sort` VALUES (663, 90, '打印机', 'https://img11.iblimg.com/goods-135/2018/06/15277530532253695a75.jpg');
INSERT INTO `bl_sort` VALUES (664, 90, '打印耗材', 'https://img12.iblimg.com/goods-135/2018/06/152775322028381d04bb.jpg');
INSERT INTO `bl_sort` VALUES (665, 90, '硒鼓/墨粉', 'https://img15.iblimg.com/goods-135/images/category/2018/05/953756320.jpg');
INSERT INTO `bl_sort` VALUES (666, 90, '墨盒', 'https://img15.iblimg.com/goods-135/images/category/2018/05/2068328508.jpg');
INSERT INTO `bl_sort` VALUES (667, 90, '碎纸机', 'https://img12.iblimg.com/goods-135/images/category/2018/01/1810573726.jpg');
INSERT INTO `bl_sort` VALUES (668, 90, '保险箱', 'https://img12.iblimg.com/goods-135/images/category/2018/01/2126832693.jpg');
INSERT INTO `bl_sort` VALUES (669, 91, '笔类', 'https://img12.iblimg.com/goods-135/images/category/2018/01/170920303.jpg');
INSERT INTO `bl_sort` VALUES (670, 91, '纸', 'https://img13.iblimg.com/goods-135/2018/06/152775333196684f3279.jpg');
INSERT INTO `bl_sort` VALUES (671, 91, '本册便签', 'https://img12.iblimg.com/goods-135/images/category/2018/01/570097557.jpg');
INSERT INTO `bl_sort` VALUES (672, 91, '文件管理', 'https://img12.iblimg.com/goods-135/images/category/2018/01/1273126502.jpg');
INSERT INTO `bl_sort` VALUES (673, 91, '计算器', 'https://img12.iblimg.com/goods-135/images/category/2018/01/2130073824.jpg');
INSERT INTO `bl_sort` VALUES (674, 91, '装订用品', 'https://img12.iblimg.com/goods-135/images/category/2018/01/140163620.jpg');
INSERT INTO `bl_sort` VALUES (675, 92, '书包', 'https://img14.iblimg.com/goods-135/2018/06/1527753005498c7386fc.jpg');
INSERT INTO `bl_sort` VALUES (676, 92, '笔袋/笔盒', 'https://img15.iblimg.com/goods-135/2018/06/15277529845232819a70.jpg');
INSERT INTO `bl_sort` VALUES (677, 92, '水彩笔', 'https://img13.iblimg.com/goods-135/2018/06/1527753088591b05286d.jpg');
INSERT INTO `bl_sort` VALUES (678, 93, '平板电视', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1277701455.jpg');
INSERT INTO `bl_sort` VALUES (679, 93, '4K超高清', 'https://img11.iblimg.com/goods-135/images/category/2018/01/135310086.jpg');
INSERT INTO `bl_sort` VALUES (680, 93, '智能电视', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1509033882.jpg');
INSERT INTO `bl_sort` VALUES (681, 93, '曲面电视', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1499934706.jpg');
INSERT INTO `bl_sort` VALUES (682, 93, 'OLED电视', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1591537240.jpg');
INSERT INTO `bl_sort` VALUES (683, 94, '空调', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1598255811.jpg');
INSERT INTO `bl_sort` VALUES (684, 94, '壁挂式空调', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1755533364.jpg');
INSERT INTO `bl_sort` VALUES (685, 94, '柜式空调', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1089386918.jpg');
INSERT INTO `bl_sort` VALUES (686, 94, '变频空调', 'https://img11.iblimg.com/goods-135/images/category/2018/01/405180978.jpg');
INSERT INTO `bl_sort` VALUES (687, 95, '洗衣机', 'https://img11.iblimg.com/goods-135/images/category/2018/01/701431977.jpg');
INSERT INTO `bl_sort` VALUES (688, 95, '滚筒洗衣机', 'https://img11.iblimg.com/goods-135/images/category/2018/01/4830789.jpg');
INSERT INTO `bl_sort` VALUES (689, 95, '洗烘一体机', 'https://img11.iblimg.com/goods-135/images/category/2018/01/955856320.jpg');
INSERT INTO `bl_sort` VALUES (690, 95, '波轮洗衣机', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1432655382.jpg');
INSERT INTO `bl_sort` VALUES (691, 95, '迷你洗衣机', 'https://img11.iblimg.com/goods-135/images/category/2018/05/745756580.jpg');
INSERT INTO `bl_sort` VALUES (692, 95, '干衣机', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1875381956.jpg');
INSERT INTO `bl_sort` VALUES (693, 96, '冰箱', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1357113131.jpg');
INSERT INTO `bl_sort` VALUES (694, 96, '多门冰箱', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1143126744.jpg');
INSERT INTO `bl_sort` VALUES (695, 96, '对开门冰箱', 'https://img11.iblimg.com/goods-135/images/category/2018/01/866804460.jpg');
INSERT INTO `bl_sort` VALUES (696, 96, '三门冰箱', 'https://img11.iblimg.com/goods-135/images/category/2018/01/273783221.jpg');
INSERT INTO `bl_sort` VALUES (697, 96, '双门冰箱', 'https://img11.iblimg.com/goods-135/images/category/2018/01/2047578154.jpg');
INSERT INTO `bl_sort` VALUES (698, 96, '十字门冰箱', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1210746399.jpg');
INSERT INTO `bl_sort` VALUES (699, 96, '无霜冰箱', 'https://img11.iblimg.com/goods-135/images/category/2018/05/555278540.jpg');
INSERT INTO `bl_sort` VALUES (700, 96, '冷柜/冰吧', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1138644071.jpg');
INSERT INTO `bl_sort` VALUES (701, 97, '燃气热水器', 'https://img11.iblimg.com/goods-135/images/category/2018/01/22895847.jpg');
INSERT INTO `bl_sort` VALUES (702, 97, '电热水器', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1507212199.jpg');
INSERT INTO `bl_sort` VALUES (703, 97, '小厨宝', 'https://img11.iblimg.com/goods-135/images/category/2018/05/301802668.jpg');
INSERT INTO `bl_sort` VALUES (704, 97, '洗碗机', 'https://img11.iblimg.com/goods-135/images/category/2018/01/852274724.jpg');
INSERT INTO `bl_sort` VALUES (705, 97, '油烟机', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1334008046.jpg');
INSERT INTO `bl_sort` VALUES (706, 97, '烟灶套装', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1441023841.jpg');
INSERT INTO `bl_sort` VALUES (707, 97, '燃气灶', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1713415007.jpg');
INSERT INTO `bl_sort` VALUES (708, 97, '消毒柜', 'https://img11.iblimg.com/goods-135/images/category/2018/01/299159142.jpg');
INSERT INTO `bl_sort` VALUES (709, 97, '嵌入式电蒸烤箱', 'https://img11.iblimg.com/goods-135/images/category/2018/01/530332447.jpg');
INSERT INTO `bl_sort` VALUES (710, 98, '电饭煲', 'https://img13.iblimg.com/goods-135/2018/06/1527753193373cc515f3.jpg');
INSERT INTO `bl_sort` VALUES (711, 98, '养生壶/煎药壶', 'https://img11.iblimg.com/goods-135/images/category/2018/01/1591685679.jpg');
INSERT INTO `bl_sort` VALUES (712, 98, '电压力锅', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1615932998.jpg');
INSERT INTO `bl_sort` VALUES (713, 98, '电磁炉', 'https://img14.iblimg.com/goods-135/2018/06/1527753194989f33b12f.jpg');
INSERT INTO `bl_sort` VALUES (714, 98, '电饼铛', 'https://img14.iblimg.com/goods-135/2018/06/1527753196018c112c80.jpg');
INSERT INTO `bl_sort` VALUES (715, 98, '电水壶/热水瓶', 'https://img11.iblimg.com/goods-135/images/category/2018/05/904808298.jpg');
INSERT INTO `bl_sort` VALUES (716, 98, '电炖锅', 'https://img11.iblimg.com/goods-135/images/category/2018/05/657036693.jpg');
INSERT INTO `bl_sort` VALUES (717, 98, '多用途锅', 'https://img11.iblimg.com/goods-135/images/category/2018/05/668621016.jpg');
INSERT INTO `bl_sort` VALUES (718, 98, '电火锅', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1113626872.jpg');
INSERT INTO `bl_sort` VALUES (719, 99, '微波炉', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1152816637.jpg');
INSERT INTO `bl_sort` VALUES (720, 99, '电烤箱', 'https://img14.iblimg.com/goods-135/2018/06/1527753196884ec1e666.jpg');
INSERT INTO `bl_sort` VALUES (721, 99, '咖啡机', 'https://img11.iblimg.com/goods-135/images/category/2018/05/858409015.jpg');
INSERT INTO `bl_sort` VALUES (722, 99, '面包机', 'https://img14.iblimg.com/goods-135/2018/06/1527753197644c71dac5.jpg');
INSERT INTO `bl_sort` VALUES (723, 99, '破壁机', 'https://img11.iblimg.com/goods-135/images/category/2018/05/302735969.jpg');
INSERT INTO `bl_sort` VALUES (724, 99, '料理机', 'https://img11.iblimg.com/goods-135/images/category/2018/05/317272431.jpg');
INSERT INTO `bl_sort` VALUES (725, 99, '榨汁机', 'https://img11.iblimg.com/goods-135/2018/06/1527753199189d56f231.jpg');
INSERT INTO `bl_sort` VALUES (726, 99, '煮蛋器', 'https://img15.iblimg.com/goods-135/2018/06/15277532007799e2fdaa.jpg');
INSERT INTO `bl_sort` VALUES (727, 99, '多士炉', 'https://img15.iblimg.com/goods-135/2018/06/1527753198376d836acd.jpg');
INSERT INTO `bl_sort` VALUES (728, 100, '蒸汽拖把', 'https://img15.iblimg.com/goods-135/images/category/2019/09/1410575652.png');
INSERT INTO `bl_sort` VALUES (729, 100, '电风扇', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1214431573.jpg');
INSERT INTO `bl_sort` VALUES (730, 100, '智能扫地机', 'https://img12.iblimg.com/goods-135/2018/06/152775299052997c3bb1.jpg');
INSERT INTO `bl_sort` VALUES (731, 100, '空气净化器', 'https://img11.iblimg.com/goods-135/images/category/2018/05/325697491.jpg');
INSERT INTO `bl_sort` VALUES (732, 100, '净水设备', 'https://img11.iblimg.com/goods-135/images/category/2018/05/2129073942.jpg');
INSERT INTO `bl_sort` VALUES (733, 100, '吸尘器', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1756272627.jpg');
INSERT INTO `bl_sort` VALUES (734, 100, '加湿器', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1127674467.jpg');
INSERT INTO `bl_sort` VALUES (735, 100, '除湿机', 'https://img11.iblimg.com/goods-135/images/category/2018/05/197095358.jpg');
INSERT INTO `bl_sort` VALUES (736, 100, '电熨斗', 'https://img11.iblimg.com/goods-135/images/category/2018/05/36954560.jpg');
INSERT INTO `bl_sort` VALUES (737, 100, '挂烫机', 'https://img11.iblimg.com/goods-135/images/category/2018/05/760973742.jpg');
INSERT INTO `bl_sort` VALUES (738, 100, '取暖器', 'https://img15.iblimg.com/goods-135/images/category/2018/10/394127163.jpg');
INSERT INTO `bl_sort` VALUES (739, 100, '干衣机', 'https://img11.iblimg.com/goods-135/images/category/2018/01/636140546.jpg');
INSERT INTO `bl_sort` VALUES (740, 101, '剃须刀', 'https://img11.iblimg.com/goods-135/images/category/2018/05/629859977.jpg');
INSERT INTO `bl_sort` VALUES (741, 101, '电动牙刷', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1712420346.jpg');
INSERT INTO `bl_sort` VALUES (742, 101, '电吹风', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1025082114.jpg');
INSERT INTO `bl_sort` VALUES (743, 101, '美发器', 'https://img11.iblimg.com/goods-135/images/category/2018/05/515410301.jpg');
INSERT INTO `bl_sort` VALUES (744, 101, '洁面仪', 'https://img11.iblimg.com/goods-135/images/category/2018/01/868871872.jpg');
INSERT INTO `bl_sort` VALUES (745, 101, '美颜仪', 'https://img15.iblimg.com/goods-135/images/category/2019/04/1334725490.jpg');
INSERT INTO `bl_sort` VALUES (746, 101, '脱/剃毛器', 'https://img11.iblimg.com/goods-135/images/category/2018/01/488769519.jpg');
INSERT INTO `bl_sort` VALUES (747, 101, '人体秤/体脂称', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1465452620.jpg');
INSERT INTO `bl_sort` VALUES (748, 101, '足浴盆', 'https://img12.iblimg.com/goods-135/2018/06/1527753006278a5f3836.jpg');
INSERT INTO `bl_sort` VALUES (749, 101, '按摩器材', 'https://img11.iblimg.com/goods-135/images/category/2018/05/1143902184.jpg');
INSERT INTO `bl_sort` VALUES (750, 102, '网络机顶盒', 'https://img11.iblimg.com/goods-135/2018/06/1527753047464d7a7c88.jpg');
INSERT INTO `bl_sort` VALUES (751, 102, '家庭影院', 'https://img15.iblimg.com/goods-135/2018/06/15277530031758fccc74.jpg');
INSERT INTO `bl_sort` VALUES (752, 102, '收/录音机', 'https://img12.iblimg.com/goods-135/2018/06/152775298968393681de.jpg');
INSERT INTO `bl_sort` VALUES (753, 103, '添加剂', 'https://img13.iblimg.com/goods-135/2018/06/1527753262900494b44e.jpg');
INSERT INTO `bl_sort` VALUES (754, 103, '玻璃水', 'https://img14.iblimg.com/goods-135/2018/06/1527753359998037c255.jpg');
INSERT INTO `bl_sort` VALUES (755, 104, '行车记录仪', 'https://img13.iblimg.com/goods-135/2018/06/1527753067163aa669d4.jpg');
INSERT INTO `bl_sort` VALUES (756, 104, '车载净化器', 'https://img13.iblimg.com/goods-135/2018/06/1527753067642897d8b2.jpg');
INSERT INTO `bl_sort` VALUES (757, 104, '车载充电器', 'https://img15.iblimg.com/goods-135/2018/06/1527753227472d38f0d5.jpg');
INSERT INTO `bl_sort` VALUES (758, 104, '车载吸尘器', 'https://img13.iblimg.com/goods-135/2018/06/1527753263416ce17c22.jpg');
INSERT INTO `bl_sort` VALUES (759, 104, '充电泵', 'https://img14.iblimg.com/goods-135/2018/06/15277532584513eccb21.jpg');
INSERT INTO `bl_sort` VALUES (760, 105, '头枕腰靠', 'https://img.iblimg.com/goods-47/images/category/2016/12/214018024.jpg');
INSERT INTO `bl_sort` VALUES (761, 105, '车载香水', 'https://img13.iblimg.com/goods-135/2018/06/15277532618947dda57a.jpg');
INSERT INTO `bl_sort` VALUES (762, 106, '车蜡', 'https://img13.iblimg.com/goods-135/images/category/2018/05/853990817.jpg');
INSERT INTO `bl_sort` VALUES (763, 106, '擦车巾/车掸', 'https://img13.iblimg.com/goods-135/images/category/2018/05/872212647.jpg');
INSERT INTO `bl_sort` VALUES (764, 106, '清洁剂', 'https://img13.iblimg.com/goods-135/images/category/2018/05/832128480.jpg');
INSERT INTO `bl_sort` VALUES (765, 107, '运动T恤', 'https://img15.iblimg.com/goods-135/images/category/2018/05/956294156.jpg');
INSERT INTO `bl_sort` VALUES (766, 107, '运动外套/卫衣', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1888298150.jpg');
INSERT INTO `bl_sort` VALUES (767, 107, '运动裤', 'https://img11.iblimg.com/goods-135/2018/06/15277533278780f0bc88.jpg');
INSERT INTO `bl_sort` VALUES (768, 107, '跑步鞋', 'https://img15.iblimg.com/goods-135/images/category/2018/05/637264831.jpg');
INSERT INTO `bl_sort` VALUES (769, 107, '篮球鞋', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1277718451.jpg');
INSERT INTO `bl_sort` VALUES (770, 107, '板鞋/休闲鞋', 'https://img15.iblimg.com/goods-135/images/category/2018/05/640159386.jpg');
INSERT INTO `bl_sort` VALUES (771, 107, '运动包', 'https://img11.iblimg.com/goods-135/2018/06/1527753267236a0711d2.jpg');
INSERT INTO `bl_sort` VALUES (772, 108, '冲锋衣裤', 'https://img11.iblimg.com/goods-135/2018/06/1527753177764b7221b5.jpg');
INSERT INTO `bl_sort` VALUES (773, 108, '皮肤风衣', 'https://img14.iblimg.com/goods-135/2018/06/15277531812917d1d3d1.jpg');
INSERT INTO `bl_sort` VALUES (774, 108, '速干衣裤', 'https://img15.iblimg.com/goods-135/2018/06/15277531818344fd9fe0.jpg');
INSERT INTO `bl_sort` VALUES (775, 108, '抓绒衣裤', 'https://img15.iblimg.com/goods-135/images/category/2018/05/807628395.jpg');
INSERT INTO `bl_sort` VALUES (776, 108, '登山鞋/徒步鞋', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1541612838.jpg');
INSERT INTO `bl_sort` VALUES (777, 109, '望远镜', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1192981470.jpg');
INSERT INTO `bl_sort` VALUES (778, 110, '自行车', 'https://img15.iblimg.com/goods-135/images/category/2018/05/426175773.jpg');
INSERT INTO `bl_sort` VALUES (779, 110, '电动车', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1161476225.jpg');
INSERT INTO `bl_sort` VALUES (780, 110, '跑步机', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1081437479.jpg');
INSERT INTO `bl_sort` VALUES (781, 110, '动感单车', 'https://img15.iblimg.com/goods-135/images/category/2018/05/505524106.jpg');
INSERT INTO `bl_sort` VALUES (782, 110, '综合训练', 'https://img15.iblimg.com/goods-135/images/category/2018/05/449283486.jpg');
INSERT INTO `bl_sort` VALUES (783, 110, '球类运动', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1690299863.jpg');
INSERT INTO `bl_sort` VALUES (784, 110, '游泳', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1561512794.jpg');
INSERT INTO `bl_sort` VALUES (785, 111, '石斛/枫斗', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1539089193.jpg');
INSERT INTO `bl_sort` VALUES (786, 111, '冬虫夏草', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1699978234.jpg');
INSERT INTO `bl_sort` VALUES (787, 111, '酵素', 'https://img13.iblimg.com/goods-135/images/category/2017/05/524288242.jpg');
INSERT INTO `bl_sort` VALUES (788, 111, '燕窝', 'https://img12.iblimg.com/goods-135/images/category/2017/04/982647165.jpg');
INSERT INTO `bl_sort` VALUES (789, 111, '胶原蛋白', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1102263738.jpg');
INSERT INTO `bl_sort` VALUES (790, 111, '蜂蜜', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1279442691.jpg');
INSERT INTO `bl_sort` VALUES (791, 111, '三七', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1711611812.jpg');
INSERT INTO `bl_sort` VALUES (792, 111, '葡萄籽', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1469449541.jpg');
INSERT INTO `bl_sort` VALUES (793, 111, '玛卡', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1567856072.jpg');
INSERT INTO `bl_sort` VALUES (794, 111, '代餐蛋白粉', 'https://img15.iblimg.com/goods-135/images/category/2018/05/1012372780.jpg');
INSERT INTO `bl_sort` VALUES (795, 112, '蜂蜜', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1680050438.jpg');
INSERT INTO `bl_sort` VALUES (796, 112, '维生素', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1528775661.jpg');
INSERT INTO `bl_sort` VALUES (797, 112, '葡萄籽', 'https://img13.iblimg.com/goods-135/images/category/2017/04/10038213.jpg');
INSERT INTO `bl_sort` VALUES (798, 112, '鱼油', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1855678149.jpg');
INSERT INTO `bl_sort` VALUES (799, 112, '维骨力', 'https://img13.iblimg.com/goods-135/images/category/2017/04/344603741.jpg');
INSERT INTO `bl_sort` VALUES (800, 112, '代餐蛋白粉', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1249669666.jpg');
INSERT INTO `bl_sort` VALUES (801, 112, '辅酶Q10', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1414926060.jpg');
INSERT INTO `bl_sort` VALUES (802, 112, '月见草', 'https://img13.iblimg.com/goods-135/images/category/2017/04/778980213.jpg');
INSERT INTO `bl_sort` VALUES (803, 113, '蜂蜜', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1680050438.jpg');
INSERT INTO `bl_sort` VALUES (804, 113, '阿胶', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1160200929.jpg');
INSERT INTO `bl_sort` VALUES (805, 113, '燕窝', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1024298833.jpg');
INSERT INTO `bl_sort` VALUES (806, 113, '参类', 'https://img12.iblimg.com/goods-135/images/category/2017/04/389924273.jpg');
INSERT INTO `bl_sort` VALUES (807, 113, '灵芝', 'https://img12.iblimg.com/goods-135/images/category/2017/04/984953664.jpg');
INSERT INTO `bl_sort` VALUES (808, 113, '三七', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1279417055.jpg');
INSERT INTO `bl_sort` VALUES (809, 113, '冬虫夏草', 'https://img13.iblimg.com/goods-135/images/category/2017/04/776043884.jpg');
INSERT INTO `bl_sort` VALUES (810, 113, '石斛/枫斗', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1103595737.jpg');
INSERT INTO `bl_sort` VALUES (811, 113, '鹿茸', 'https://img13.iblimg.com/goods-135/images/category/2017/04/755102413.jpg');
INSERT INTO `bl_sort` VALUES (812, 114, '增强免疫力', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1991183059.jpg');
INSERT INTO `bl_sort` VALUES (813, 114, '减肥瘦身', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1724155618.jpg');
INSERT INTO `bl_sort` VALUES (814, 114, '美容养颜', 'https://img13.iblimg.com/goods-135/images/category/2017/04/669456658.jpg');
INSERT INTO `bl_sort` VALUES (815, 114, '强健骨骼', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1339894677.jpg');
INSERT INTO `bl_sort` VALUES (816, 114, '调节三高', 'https://img13.iblimg.com/goods-135/images/category/2017/04/902182702.jpg');
INSERT INTO `bl_sort` VALUES (817, 115, '玛卡', 'https://img12.iblimg.com/goods-135/images/category/2017/04/568272322.jpg');
INSERT INTO `bl_sort` VALUES (818, 115, '葡萄籽', 'https://img12.iblimg.com/goods-135/images/category/2017/04/128472878.jpg');
INSERT INTO `bl_sort` VALUES (819, 115, '蔓越莓', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1192906645.jpg');
INSERT INTO `bl_sort` VALUES (820, 115, '奶蓟草', 'https://img13.iblimg.com/goods-135/images/category/2017/04/255939684.jpg');
INSERT INTO `bl_sort` VALUES (821, 115, '鱼油', 'https://img12.iblimg.com/goods-135/images/category/2017/04/2073826005.jpg');
INSERT INTO `bl_sort` VALUES (822, 115, '珍珠粉', 'https://img13.iblimg.com/goods-135/images/category/2017/04/2037894849.jpg');
INSERT INTO `bl_sort` VALUES (823, 115, '螺旋藻', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1812319770.jpg');
INSERT INTO `bl_sort` VALUES (824, 116, '维生素B', 'https://img12.iblimg.com/goods-135/images/category/2017/04/2087532275.jpg');
INSERT INTO `bl_sort` VALUES (825, 116, '维生素C', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1291427537.jpg');
INSERT INTO `bl_sort` VALUES (826, 116, '维生素D', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1520562848.jpg');
INSERT INTO `bl_sort` VALUES (827, 116, '钙', 'https://img12.iblimg.com/goods-135/images/category/2017/04/25674286.jpg');
INSERT INTO `bl_sort` VALUES (828, 116, '铁', 'https://img13.iblimg.com/goods-135/images/category/2017/04/1445819398.jpg');
INSERT INTO `bl_sort` VALUES (829, 116, '复合维生素', 'https://img13.iblimg.com/goods-135/images/category/2017/04/75372306.jpg');
INSERT INTO `bl_sort` VALUES (830, 117, '男士保健', 'https://img13.iblimg.com/goods-135/images/category/2017/04/592468261.jpg');
INSERT INTO `bl_sort` VALUES (831, 117, '女士保养', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1736868512.jpg');
INSERT INTO `bl_sort` VALUES (832, 117, '呵护老人', 'https://img12.iblimg.com/goods-135/images/category/2017/04/1686859807.jpg');
INSERT INTO `bl_sort` VALUES (833, 118, '小说', 'https://img12.iblimg.com/goods-135/2018/06/1527753539547e756986.jpg');
INSERT INTO `bl_sort` VALUES (834, 118, '人物传记', 'https://img14.iblimg.com/goods-135/2018/06/1527753538941f23b257.jpg');
INSERT INTO `bl_sort` VALUES (835, 119, '亲子读物', 'https://img13.iblimg.com/goods-135/2018/06/15277534752503205fa9.jpg');
INSERT INTO `bl_sort` VALUES (836, 119, '少儿文学', 'https://img12.iblimg.com/goods-135/2018/06/1527753477269607faee.jpg');
INSERT INTO `bl_sort` VALUES (837, 119, '少儿百科', 'https://img15.iblimg.com/goods-135/2018/06/15277534780688892142.jpg');
INSERT INTO `bl_sort` VALUES (838, 120, '中国史', 'https://img15.iblimg.com/goods-135/2018/06/15277534820802477f56.jpg');
INSERT INTO `bl_sort` VALUES (839, 120, '世界史', 'https://img11.iblimg.com/goods-135/2018/06/1527753478884ac353d4.jpg');
INSERT INTO `bl_sort` VALUES (840, 120, '宗教', 'https://img13.iblimg.com/goods-135/2018/06/1527753482914dfc0bc0.jpg');
INSERT INTO `bl_sort` VALUES (841, 120, '法律', 'https://img15.iblimg.com/goods-135/2018/06/1527753479710752cc9f.jpg');
INSERT INTO `bl_sort` VALUES (842, 121, '旅游', 'https://img13.iblimg.com/goods-135/2018/06/1527753474012ab95b23.jpg');
INSERT INTO `bl_sort` VALUES (843, 121, '饮食', 'https://img15.iblimg.com/goods-135/2018/06/152775347111474839ef.jpg');
INSERT INTO `bl_sort` VALUES (844, 121, '休闲娱乐', 'https://img15.iblimg.com/goods-135/2018/06/1527753471647d1d3be0.jpg');
INSERT INTO `bl_sort` VALUES (845, 121, '体育健身', 'https://img11.iblimg.com/goods-135/2018/06/1527753470596084c6ef.png');
INSERT INTO `bl_sort` VALUES (846, 121, '养生保健', 'https://img12.iblimg.com/goods-135/2018/06/1527753472760ee06e54.jpg');
INSERT INTO `bl_sort` VALUES (847, 121, '美容美体', 'https://img12.iblimg.com/goods-135/2018/06/1527753474661ed7d92a.jpg');
INSERT INTO `bl_sort` VALUES (848, 121, '摄影', 'https://img11.iblimg.com/goods-135/2018/06/15277535201574646c85.jpg');
INSERT INTO `bl_sort` VALUES (849, 122, '医学', 'https://img15.iblimg.com/goods-135/2018/06/15277534804661ce82c8.jpg');
INSERT INTO `bl_sort` VALUES (850, 122, '科普读物', 'https://img11.iblimg.com/goods-135/2018/06/1527753481239b8ee3f6.jpg');
INSERT INTO `bl_sort` VALUES (851, 123, '家庭教育', 'https://img12.iblimg.com/goods-135/2018/06/15277534836004bf149a.jpg');
INSERT INTO `bl_sort` VALUES (852, 124, '实体卡', 'https://img13.iblimg.com/goods-135/images/category/2018/05/50735719.jpg');
INSERT INTO `bl_sort` VALUES (853, 125, '新经典卡', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1328368266.jpg');
INSERT INTO `bl_sort` VALUES (854, 125, '感恩卡', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1120249382.jpg');
INSERT INTO `bl_sort` VALUES (855, 125, '生日卡', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1693473229.jpg');
INSERT INTO `bl_sort` VALUES (856, 126, '100面值', 'https://img13.iblimg.com/goods-135/images/category/2018/05/606048930.jpg');
INSERT INTO `bl_sort` VALUES (857, 126, '200面值', 'https://img13.iblimg.com/goods-135/images/category/2018/05/35329019.jpg');
INSERT INTO `bl_sort` VALUES (858, 126, '300面值', 'https://img13.iblimg.com/goods-135/images/category/2018/05/2129126075.jpg');
INSERT INTO `bl_sort` VALUES (859, 126, '500面值', 'https://img13.iblimg.com/goods-135/images/category/2018/05/2003860316.jpg');
INSERT INTO `bl_sort` VALUES (860, 126, '1000面值', 'https://img13.iblimg.com/goods-135/images/category/2018/05/481206553.jpg');
INSERT INTO `bl_sort` VALUES (861, 127, '糕点卡券', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1801772853.jpg');
INSERT INTO `bl_sort` VALUES (862, 127, '宜芝多', 'https://img13.iblimg.com/goods-135/images/category/2018/05/357019106.jpg');
INSERT INTO `bl_sort` VALUES (863, 127, '诺心', 'https://img13.iblimg.com/goods-135/images/category/2018/05/532758291.jpg');
INSERT INTO `bl_sort` VALUES (864, 127, '新雅', 'https://img13.iblimg.com/goods-135/images/category/2018/05/559950869.jpg');
INSERT INTO `bl_sort` VALUES (865, 127, '杏花楼', 'https://img13.iblimg.com/goods-135/images/category/2018/05/637897083.jpg');
INSERT INTO `bl_sort` VALUES (866, 127, '功德林', 'https://img13.iblimg.com/goods-135/images/category/2018/05/147007729.jpg');
INSERT INTO `bl_sort` VALUES (867, 127, '静安面包房', 'https://img13.iblimg.com/goods-135/images/category/2018/05/779943292.jpg');
INSERT INTO `bl_sort` VALUES (868, 127, '红宝石', 'https://img13.iblimg.com/goods-135/images/category/2018/05/231707458.jpg');
INSERT INTO `bl_sort` VALUES (869, 127, '克莉丝汀', 'https://img13.iblimg.com/goods-135/images/category/2018/05/1122507530.jpg');
INSERT INTO `bl_sort` VALUES (870, 127, 'Mcake', 'https://img13.iblimg.com/goods-135/images/category/2018/05/999141792.jpg');

-- ----------------------------
-- Table structure for bl_swipe_images
-- ----------------------------
DROP TABLE IF EXISTS `bl_swipe_images`;
CREATE TABLE `bl_swipe_images`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '轮播图_image路径',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '轮播图_链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_swipe_images
-- ----------------------------
INSERT INTO `bl_swipe_images` VALUES (2, 'https://img23.iblimg.com/market-3/images/activity/1234749970.jpg', 'www.bai.com');
INSERT INTO `bl_swipe_images` VALUES (3, 'https://img23.iblimg.com/market-3/images/activity/22839846.jpg', 'www.baidu.com');
INSERT INTO `bl_swipe_images` VALUES (4, 'https://img23.iblimg.com/market-3/images/activity/249693861.jpg', 'www.baidu.com');
INSERT INTO `bl_swipe_images` VALUES (5, 'https://img22.iblimg.com/market-3/images/activity/1225056021.jpg', 'www.baidu.com');
INSERT INTO `bl_swipe_images` VALUES (6, 'https://img22.iblimg.com/market-3/images/activity/1287519962.jpg', 'www.baidu.com');
INSERT INTO `bl_swipe_images` VALUES (7, 'https://img23.iblimg.com/market-3/images/activity/409554687.jpg', 'www.baidu.com');
INSERT INTO `bl_swipe_images` VALUES (9, 'https://img22.iblimg.com/market-3/images/activity/1687072937.jpg', 'www.baidu.com');

-- ----------------------------
-- Table structure for bl_users
-- ----------------------------
DROP TABLE IF EXISTS `bl_users`;
CREATE TABLE `bl_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名 手机号\r\n',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'md5 密码 固定长度\r\n',
  `regtime` int(10) UNSIGNED NOT NULL COMMENT '注册用户的时间戳',
  `face` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像路径 ',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '性别  保密：0   男： 1  女：2',
  `birth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出生日期\r\n',
  `preference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '偏好',
  `license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `payment` tinyint(6) UNSIGNED NULL DEFAULT NULL COMMENT '支付密码',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `certificates_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `certificates_number` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '证件号码',
  `integral` int(255) UNSIGNED NULL DEFAULT 0 COMMENT '积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bl_users
-- ----------------------------
INSERT INTO `bl_users` VALUES (1, '17553041262', '96597773c8e79ab3fb26fb82b1c68163', 1574045007, 'uploads\\20200221\\09.jpg', '没时间', 1, '2020-01-09', '食品粮油,酒水冲饮', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bl_users` VALUES (2, '17553041265', '96597773c8e79ab3fb26fb82b1c68163', 1574045092, 'uploads\\20200221\\09.jpg', '17553041265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bl_users` VALUES (3, '17553011212', 'd031de2cfa15701ba134526f7ea26cb2', 1574342728, 'uploads\\20200221\\09.jpg', '17553011212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bl_users` VALUES (4, '17553041261', '2a4c9da9d08b6b420bd725398b08dbbe', 1574388126, 'uploads\\20200221\\09.jpg', '17553041261', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bl_users` VALUES (5, '18573522318', '70672a2998fa19953fe019f361f37bc7', 1574404048, 'uploads\\20200221\\09.jpg', '18573522318', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bl_users` VALUES (6, '17511112222', '2a4c9da9d08b6b420bd725398b08dbbe', 1574417961, 'uploads\\20200221\\09.jpg', '17511112222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bl_users` VALUES (7, '17553140323', '2a4c9da9d08b6b420bd725398b08dbbe', 1574418173, 'uploads\\20200221\\09.jpg', '17553140323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bl_users` VALUES (8, '17553041222', '2a4c9da9d08b6b420bd725398b08dbbe', 1574640694, 'uploads\\20200221\\75.jpg', '时间Giu', 0, '1947-01-26', '百联进口,生鲜食品', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bl_users` VALUES (9, '17553041266', '2a4c9da9d08b6b420bd725398b08dbbe', 1574652610, 'uploads\\20200221\\09.jpg', 'msj', 2, '1947-11-01', '百联进口,生鲜食品', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `bl_users` VALUES (10, '17553041111', '2a4c9da9d08b6b420bd725398b08dbbe', 1578531601, 'uploads\\20200221\\19.jpg', '阿什顿', 1, '2020-01-09', '食品粮油', NULL, NULL, NULL, NULL, NULL, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
