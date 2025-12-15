/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : jianshen_shop

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2024-12-22 23:01:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `phone` varchar(255) DEFAULT NULL COMMENT '收件人电话',
  `address` varchar(255) DEFAULT NULL COMMENT '收件人地址',
  `name` varchar(255) DEFAULT NULL COMMENT '收件人姓名',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收货地址';

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '13422222222', '上海市南京路57号', '张三2', '1');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) DEFAULT NULL COMMENT '登录账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', 'admin');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `cart_num` int(11) DEFAULT NULL COMMENT '数量',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cate_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '类型名称',
  `cate_parent_id` int(10) DEFAULT NULL COMMENT '父类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分类';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '健身器材', '0');
INSERT INTO `category` VALUES ('2', '运动装备', '0');
INSERT INTO `category` VALUES ('3', '营养补剂', '0');
INSERT INTO `category` VALUES ('4', '健身课程', '0');
INSERT INTO `category` VALUES ('5', '有氧健身器材', '1');
INSERT INTO `category` VALUES ('6', '力量器械', '1');
INSERT INTO `category` VALUES ('7', '室外运动器械', '1');
INSERT INTO `category` VALUES ('8', '球类装备', '2');
INSERT INTO `category` VALUES ('9', '拍类装备', '2');
INSERT INTO `category` VALUES ('10', '跑步装备', '2');
INSERT INTO `category` VALUES ('11', '户外运动装备', '2');
INSERT INTO `category` VALUES ('12', '能量补充类', '3');
INSERT INTO `category` VALUES ('13', '促肌肉增长类', '3');
INSERT INTO `category` VALUES ('14', '减脂效果类', '3');
INSERT INTO `category` VALUES ('15', '私教课', '4');
INSERT INTO `category` VALUES ('16', '视频教程', '4');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单Id',
  `order_no` varchar(32) DEFAULT NULL COMMENT '订单编号',
  `product_id` int(11) DEFAULT NULL COMMENT '产品Id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户Id',
  `num` int(11) DEFAULT NULL COMMENT '产品数量',
  `price` double(10,2) DEFAULT NULL COMMENT '产品总价',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `status` int(4) DEFAULT NULL COMMENT '订单状态',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(255) DEFAULT NULL COMMENT '收件人电话',
  `realname` varchar(255) DEFAULT NULL COMMENT '收件人姓名',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('6', 'ORDE522661778698', '22', '1', '2', '10.00', '2024-11-29 09:31:06', '0', '上海市南京路57号', '13422222222', '张三2');
INSERT INTO `orders` VALUES ('7', 'ORDE980916767260', '5', '1', '1', '24.00', '2024-11-29 16:58:41', '0', '上海市南京路57号', '13422222222', '张三2');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '商品名称',
  `product_description` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '产品简介',
  `product_price` decimal(10,2) NOT NULL COMMENT '价格',
  `product_stock` int(10) DEFAULT NULL COMMENT '库存',
  `product_fid` int(10) DEFAULT NULL COMMENT '父分类id',
  `product_cid` int(10) DEFAULT NULL COMMENT '分类id',
  `product_image` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片',
  `product_status` int(11) NOT NULL DEFAULT '1' COMMENT '商品状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '跑步机', '跑步机是家庭及健身房常备的健身器材，而且是当今家庭健身器材中最简单的一种', '1500.00', '60', '1', '5', 'wkqvxvwxiiaslrcp.png', '1');
INSERT INTO `product` VALUES ('2', '动感单车', '是一种结合了音乐、视觉效果等独特的充满活力的室内自行车训练课程', '1850.00', '50', '1', '5', 'uxhfqsnmdibcvkjt.png', '1');
INSERT INTO `product` VALUES ('3', '健身车', '主要是通过身体较长时间，适当强度的运动来促进心血管的运动，加快新陈代谢，增强心脏和肺部功能', '2200.00', '50', '1', '5', 'lnhrmfqyktdtszbb.png', '1');
INSERT INTO `product` VALUES ('4', '哑铃', '是举重和健身练习的一种辅助器材。 比杠铃小', '240.00', '120', '1', '6', 'xagwqxrejxfsgdzx.png', '1');
INSERT INTO `product` VALUES ('5', '杠铃', '是一种核心训练运动训练器材，也是举重所用器材。杠铃运动属于重量训练的一种。', '1300.00', '80', '1', '6', 'qzfxctsbxooxyprc.png', '1');
INSERT INTO `product` VALUES ('6', '仰卧板', '是针对腹部训练而设计出来的一种健身器材,此健身器材让您用正确的方式,事半功倍的效果让你的小腹平坦', '250.00', '300', '1', '7', 'muldbhdrrordphor.png', '1');
INSERT INTO `product` VALUES ('7', '计数跳绳', '计数跳绳是采用齿轮转动机械计数原理，能自动记录跳绳次数', '80.00', '500', '1', '7', 'rpwmcxjlpzyjbbwm.png', '1');
INSERT INTO `product` VALUES ('8', '篮球', '是以手为中心的身体对抗性体育运动，是奥运会核心比赛项目 ，是仅次于足球的世界第二大运动', '150.00', '300', '2', '8', 'nlyvvtouckmfusdh.png', '1');
INSERT INTO `product` VALUES ('9', '足球', '世界第一运动', '200.00', '450', '2', '8', 'xzglqtcgyyrydcop.jpg', '1');
INSERT INTO `product` VALUES ('10', '乒乓球拍', '由底板、胶皮和海绵三部分组成。三者的合理搭配决定了一块球拍的质量', '69.00', '500', '2', '9', 'selicbbjvbuiwovu.png', '1');
INSERT INTO `product` VALUES ('11', '羽毛球拍', '羽毛球拍一般由拍头、拍杆、拍柄及拍框与拍杆的接头构成', '169.00', '500', '2', '9', 'vhecapacdgpxjiel.png', '1');
INSERT INTO `product` VALUES ('12', '跑步鞋', '顾名思义最适合跑步穿的鞋', '250.00', '500', '2', '10', 'shkcwyvrypxgkrug.png', '1');
INSERT INTO `product` VALUES ('13', '运动手表', '支持室外跑步、室内跑步、游泳、徒步、健身、瑜伽等功能的手表', '600.00', '150', '2', '11', 'ofcqwzcihqvxfjpy.png', '1');
INSERT INTO `product` VALUES ('14', '脉动', '脉动以富含维生素和低糖的配方，深受新一代崇尚健康的年轻消费者喜爱', '5.00', '2000', '3', '12', 'jlbntiliyijtyvys.png', '1');
INSERT INTO `product` VALUES ('15', '红牛', '全球首先推出且被人熟知的能量饮品之一', '5.00', '2000', '3', '12', 'nfukbsjtztslpunp.png', '1');
INSERT INTO `product` VALUES ('16', '增肌粉', '是将离析浓缩乳清蛋白和蛋白质效果的其它成分结合的产物。', '56.00', '500', '3', '13', 'grvvrxeicdgyngie.png', '1');
INSERT INTO `product` VALUES ('17', '私教课', '张教练是非常好的健身教练', '600.00', '10', '4', '15', 'eugjlkiahfvhmyxi.png', '1');
INSERT INTO `product` VALUES ('18', '私教课', '杨教练擅长增肌提耐力', '580.00', '20', '4', '15', 'qjkxxaarvsorrhas.png', '1');
INSERT INTO `product` VALUES ('19', '刘畊宏健身操', '刘畊宏直播录像健身操', '300.00', '600', '4', '16', 'opzybjmndewqtikc.png', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '登录账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `balance` varchar(255) DEFAULT NULL COMMENT '账号余额',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'qqyx', '123', '0.0', '男', '13458586969', '123@1234', '1253');
