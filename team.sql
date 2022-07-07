/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : team

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 06/07/2022 22:53:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '团员ID',
  `team_id` int(11) NULL DEFAULT NULL COMMENT '团队ID',
  `cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '费用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (1, 1, 1, 1300.00, 'AA制团费');
INSERT INTO `bill` VALUES (2, 2, 1, 1300.00, 'AA制团费');

-- ----------------------------
-- Table structure for cost_his
-- ----------------------------
DROP TABLE IF EXISTS `cost_his`;
CREATE TABLE `cost_his`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `team_id` int(11) NOT NULL COMMENT '团队ID',
  `cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '费用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团费历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cost_his
-- ----------------------------
INSERT INTO `cost_his` VALUES (1, 1, 2000.00, '初始团费');
INSERT INTO `cost_his` VALUES (2, 1, 200.00, 'A');
INSERT INTO `cost_his` VALUES (3, 1, 200.00, 'B');
INSERT INTO `cost_his` VALUES (4, 1, 200.00, 'C');
INSERT INTO `cost_his` VALUES (5, 1, 200.00, 'D');

-- ----------------------------
-- Table structure for join_record
-- ----------------------------
DROP TABLE IF EXISTS `join_record`;
CREATE TABLE `join_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `team_id` int(11) NOT NULL COMMENT '团队ID',
  `user_id` int(11) NOT NULL COMMENT '团员ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参团记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of join_record
-- ----------------------------
INSERT INTO `join_record` VALUES (1, 1, 1);
INSERT INTO `join_record` VALUES (2, 1, 2);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, '团队活动\"骑马射箭\"创建成功', '2022-07-05 22:08:27');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '团队ID',
  `team_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团队名称',
  `team_leader` int(11) NOT NULL COMMENT '团长ID',
  `start_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `state` int(1) NULL DEFAULT NULL COMMENT '状态',
  `cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '费用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团队' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, '骑马射箭', 1, '2022-07-04', '2022-07-04', 3, 2800.00);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `role` int(1) NOT NULL DEFAULT 0 COMMENT '用户角色 0 团员 1 团长',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'allen', '123456', 'allen', NULL, 1);
INSERT INTO `user` VALUES (2, 'bob', '123456', 'bob', NULL, 0);
INSERT INTO `user` VALUES (3, 'calvin', '123456', '凯文', '13800138000', 0);

SET FOREIGN_KEY_CHECKS = 1;
