/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : pbdtxbank1

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 24/04/2023 17:32:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mytest_car_inout
-- ----------------------------
DROP TABLE IF EXISTS `mytest_car_inout`;
CREATE TABLE `mytest_car_inout`  (
  `inoutid` int(0) NOT NULL AUTO_INCREMENT COMMENT '进出ID',
  `bid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务Id',
  `communityid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小区ID',
  `carnum` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车牌号',
  `state` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态，100300 进场状态 100400 支付完成 100500 离场状态 100600 支付超时重新支付',
  `intime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '进场时间',
  `outtime` timestamp(0) NULL DEFAULT NULL COMMENT '离场时间',
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `statuscd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '数据状态，详细参考c_status表，S 保存，0, 在用 1失效',
  PRIMARY KEY (`inoutid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mytest_car_inout_detail
-- ----------------------------
DROP TABLE IF EXISTS `mytest_car_inout_detail`;
CREATE TABLE `mytest_car_inout_detail`  (
  `detail_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情ID',
  `inout_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '进出ID',
  `b_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务Id',
  `community_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小区ID',
  `machine_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备ID',
  `machine_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编码',
  `car_inout` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '3306 进场 3307 出场',
  `car_num` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车牌号',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status_cd` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '数据状态，详细参考c_status表，S 保存，0, 在用 1失效'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mytest_pay_fee
-- ----------------------------
DROP TABLE IF EXISTS `mytest_pay_fee`;
CREATE TABLE `mytest_pay_fee`  (
  `feeid` int(0) NOT NULL AUTO_INCREMENT COMMENT '费用ID',
  `bid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务Id',
  `feetypecd` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用类型，物业费，停车费',
  `communityid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小区ID',
  `payerobjid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款方ID',
  `incomeobjid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款方ID',
  `starttime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `amount` decimal(10, 2) NULL DEFAULT -1.00 COMMENT '总金额，如物业费，停车费等没有总金额的，填写为-1.00',
  `userid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户ID',
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `operate` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据状态，添加ADD，修改MOD 删除DEL',
  `feeflag` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1003006' COMMENT '费用标识 1003006 为周期性费用 2006012 为一次性费用',
  `state` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2008001' COMMENT '状态 2007001收费未开始 2008001 收费中状态 2009001 收费结束',
  `configid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '-1' COMMENT '费用项ID',
  `payerobjtype` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3333' COMMENT '付费对象类型 3333 房屋 6666 是车位',
  `batchid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '-1' COMMENT '批次ID',
  `carnum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  PRIMARY KEY (`feeid`) USING BTREE,
  INDEX `idx_bpf_fee_id`(`feeid`) USING BTREE,
  INDEX `idx_bpf_b_id`(`bid`) USING BTREE,
  INDEX `idx_pf_fee_id`(`feeid`) USING BTREE,
  INDEX `idx_pf_b_id`(`bid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mytest_pay_fee
-- ----------------------------
INSERT INTO `mytest_pay_fee` VALUES (1, '1', '1', '1', '1', '1', '2023-04-23 15:46:38', NULL, -1.00, '1', '2023-04-24 15:47:36', '1', '1003006', '待支付', '-1', '3333', '-1', 'yxx');

SET FOREIGN_KEY_CHECKS = 1;
