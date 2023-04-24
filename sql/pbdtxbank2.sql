/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : pbdtxbank2

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 24/04/2023 17:32:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mytest_account
-- ----------------------------
DROP TABLE IF EXISTS `mytest_account`;
CREATE TABLE `mytest_account`  (
  `acct_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户ID',
  `acct_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户名称',
  `acct_type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户类型，2003 现金账户 2004 积分账户 2005 优惠券账户',
  `amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `obj_type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对象类型，6006 个人 7007 商户',
  `obj_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对象ID',
  `b_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务Id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status_cd` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '数据状态，详细参考c_status表，S 保存，0, 在用 1失效',
  `part_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '局部ID',
  PRIMARY KEY (`acct_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mytest_account
-- ----------------------------
INSERT INTO `mytest_account` VALUES ('1', '运营总账户', '2003', 0.00, '7007', '400000000000000001', '-1', '2021-06-23 13:39:55', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021062123890315', 'HC测试商家', '2003', 299.99, '7007', '402021062178540311', '202021062199440611', '2021-06-21 16:57:07', '0', '');
INSERT INTO `mytest_account` VALUES ('312021062175580316', 'HC测试商家', '2004', 0.00, '7007', '402021062178540311', '202021062168680612', '2021-06-21 16:57:07', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021062194250317', 'HC测试商家', '2006', 0.00, '7007', '402021062178540311', '202021062186570613', '2021-06-21 16:57:07', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021062198760001', '学文本', '2003', 60.00, '6006', '772021050961690382', '-1', '2021-06-21 16:39:50', '0', '7020181217000001');
INSERT INTO `mytest_account` VALUES ('312021062259210014', '小张20210605', '2003', 176.00, '6006', '772021060447241555', '-1', '2021-06-22 17:07:47', '0', '7020181217000001');
INSERT INTO `mytest_account` VALUES ('312021062314610001', 'yz002', '2003', 10000.00, '6006', '772021062391351069', '-1', '2021-06-23 13:39:55', '0', '2021062365411062');
INSERT INTO `mytest_account` VALUES ('312021062822930795', '师延俊的饭店', '2003', 0.00, '7007', '402021062890020791', '202021062851042094', '2021-06-28 14:37:48', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021062864410797', '师延俊的饭店', '2006', 0.00, '7007', '402021062890020791', '202021062871802096', '2021-06-28 14:37:48', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021062866780796', '师延俊的饭店', '2004', 0.00, '7007', '402021062890020791', '202021062845552095', '2021-06-28 14:37:48', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021062913300221', '测试有限公司', '2003', 0.00, '7007', '402021062906740217', '202021062934760918', '2021-06-29 19:12:58', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021062930420223', '测试有限公司', '2006', 0.00, '7007', '402021062906740217', '202021062958420920', '2021-06-29 19:12:58', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021062947490001', '张子健', '2003', 301.98, '6006', '772021062909320130', '-1', '2021-06-29 17:10:14', '0', '7020181217000001');
INSERT INTO `mytest_account` VALUES ('312021062971600222', '测试有限公司', '2004', 0.00, '7007', '402021062906740217', '202021062948010919', '2021-06-29 19:12:58', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021070146410003', '师延俊', '2003', 10000.00, '6006', '772021070175870145', '-1', '2021-07-01 11:34:23', '0', '2021070193680018');
INSERT INTO `mytest_account` VALUES ('312021070521010010', 'king', '2003', 26666.00, '6006', '772021070194960049', '-1', '2021-07-05 18:01:09', '0', '2021051917670021');
INSERT INTO `mytest_account` VALUES ('312021070564910001', '小小鱼', '2003', 3006.99, '6006', '772021070341390194', '-1', '2021-07-05 09:08:10', '0', '7020181217000001');
INSERT INTO `mytest_account` VALUES ('312021070614731765', '猎米', '2004', 0.00, '7007', '402021070695291760', '202021070657145151', '2021-07-06 16:22:21', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021070626070014', '小小小雨', '2003', 221.18, '6006', '772021070609881327', '-1', '2021-07-06 14:05:29', '0', '7020181217000001');
INSERT INTO `mytest_account` VALUES ('312021070657770019', '小敏', '2003', 200.00, '6006', '772021070602571683', '-1', '2021-07-06 15:27:19', '0', '2021070619361652');
INSERT INTO `mytest_account` VALUES ('312021070657931766', '猎米', '2006', 0.00, '7007', '402021070695291760', '202021070688255152', '2021-07-06 16:22:21', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021070687201764', '猎米', '2003', 0.00, '7007', '402021070695291760', '202021070681835150', '2021-07-06 16:22:21', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021070929160080', '飞享物业', '2006', 0.00, '7007', '402021070943050074', '202021070975750045', '2021-07-09 10:08:34', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021070954450078', '飞享物业', '2003', 0.00, '7007', '402021070943050074', '202021070907960043', '2021-07-09 10:08:34', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021070980100079', '飞享物业', '2004', 0.00, '7007', '402021070943050074', '202021070940340044', '2021-07-09 10:08:34', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021071220820003', '李白', '2003', 201.96, '6006', '772021070867950953', '-1', '2021-07-12 12:00:16', '0', '2021070662771672');
INSERT INTO `mytest_account` VALUES ('312021071332420009', '深湾小王', '2003', 2211.96, '6006', '772021071398732058', '-1', '2021-07-13 11:21:00', '0', '2021071353841568');
INSERT INTO `mytest_account` VALUES ('312021071363690012', '深湾小刘', '2003', 4000.00, '6006', '772021071367972062', '-1', '2021-07-13 11:21:15', '0', '2021071353841568');
INSERT INTO `mytest_account` VALUES ('312021072265630001', '而我国如果为', '2003', 40.00, '6006', '772021070663731623', '-1', '2021-07-22 12:00:34', '0', '7020181217000001');
INSERT INTO `mytest_account` VALUES ('312021072316280002', '小粒子', '2003', 2001222.00, '6006', '772021072373470228', '-1', '2021-07-23 08:03:43', '0', '7020181217000001');
INSERT INTO `mytest_account` VALUES ('312021073120770001', 'AdamGao', '2003', 2000000.00, '6006', '772021073152050045', '-1', '2021-07-31 16:22:42', '0', '2021070688791277');
INSERT INTO `mytest_account` VALUES ('312021080227500001', '李木子', '2003', 220010.00, '6006', '772021073113180009', '-1', '2021-08-02 10:41:00', '0', '2021051173621015');
INSERT INTO `mytest_account` VALUES ('312021080421850023', 'HC商城测试', '2006', 0.00, '7007', '402021080419640017', '202021080493530046', '2021-08-04 21:56:21', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021080454250021', 'HC商城测试', '2003', 5000.03, '7007', '402021080419640017', '202021080494670044', '2021-08-04 21:56:21', '0', '');
INSERT INTO `mytest_account` VALUES ('312021080477290022', 'HC商城测试', '2004', 0.00, '7007', '402021080419640017', '202021080493760045', '2021-08-04 21:56:21', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021080850380001', '2323', '2003', 90.00, '6006', '772021080598870015', '-1', '2021-08-08 13:12:53', '0', '2021080494780158');
INSERT INTO `mytest_account` VALUES ('312021081033910002', 'jary', '2003', 26444.00, '6006', '772021081006680236', '-1', '2021-08-10 22:40:23', '0', '2021080494780158');
INSERT INTO `mytest_account` VALUES ('312021081047140331', 'HC商城演示', '2006', 0.00, '7007', '402021081044920325', '202021081045840415', '2021-08-10 09:51:03', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021081053660329', 'HC商城演示', '2003', 0.00, '7007', '402021081044920325', '202021081012820413', '2021-08-10 09:51:03', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021081084620330', 'HC商城演示', '2004', 0.00, '7007', '402021081044920325', '202021081019550414', '2021-08-10 09:51:03', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021081266570001', '张三李四', '2003', 24726.00, '6006', '772021081112700495', '-1', '2021-08-12 15:34:55', '0', '2021080494780158');
INSERT INTO `mytest_account` VALUES ('312021081318140056', '批发佬', '2006', 0.00, '7007', '402021081398220050', '202021081343290105', '2021-08-13 20:59:40', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021081348730055', '批发佬', '2004', 0.00, '7007', '402021081398220050', '202021081358470104', '2021-08-13 20:59:40', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021081398710054', '批发佬', '2003', 0.00, '7007', '402021081398220050', '202021081327280103', '2021-08-13 20:59:39', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021081616880001', 'TOM', '2003', 540.00, '6006', '772021081691010023', '-1', '2021-08-16 20:54:35', '0', '2021081028000020');
INSERT INTO `mytest_account` VALUES ('312021081725980003', '小马', '2003', 400.00, '6006', '772021081744170093', '-1', '2021-08-17 17:08:38', '0', '2021081736770075');
INSERT INTO `mytest_account` VALUES ('312021082023390001', '测试业主', '2003', 20.00, '6006', '772021082003530215', '-1', '2021-08-20 16:23:34', '0', '2021080494780158');
INSERT INTO `mytest_account` VALUES ('312021082101850020', '王元化', '2003', 2.00, '6006', '772021082148280247', '-1', '2021-08-21 14:34:18', '0', '2021081177860471');
INSERT INTO `mytest_account` VALUES ('312021082103030004', '优化', '2003', 2000.00, '6006', '772021082174450047', '-1', '2021-08-21 17:24:47', '0', '2021082101120006');
INSERT INTO `mytest_account` VALUES ('312021082137770017', '你好', '2003', 1020.00, '6006', '772021082139780126', '-1', '2021-08-21 14:33:51', '0', '2021081177860471');
INSERT INTO `mytest_account` VALUES ('312021082139850012', 'PEANUT', '2003', 3000.00, '6006', '772021082123190260', '-1', '2021-08-21 14:25:42', '0', '2021080494780158');
INSERT INTO `mytest_account` VALUES ('312021082147480007', '大厦', '2003', 2.00, '6006', '772021082154830111', '-1', '2021-08-21 11:51:32', '0', '2021081177860471');
INSERT INTO `mytest_account` VALUES ('312021082158980027', '张三', '2003', 0.00, '6006', '772021082113640300', '-1', '2021-08-21 15:21:25', '0', '2021080494780158');
INSERT INTO `mytest_account` VALUES ('312021082175760001', 'danei', '2003', 2000.00, '6006', '772021082106380012', '-1', '2021-08-21 11:09:42', '0', '2021081335020102');
INSERT INTO `mytest_account` VALUES ('312021082181310004', '武汉', '2003', 2.00, '6006', '772021082144220147', '-1', '2021-08-21 11:44:49', '0', '2021081177860471');
INSERT INTO `mytest_account` VALUES ('312021082185720001', '午好', '2003', 2000.00, '6006', '772021082134430039', '-1', '2021-08-21 17:22:08', '0', '2021082101120006');
INSERT INTO `mytest_account` VALUES ('312021082304950227', '123321', '2003', 0.00, '7007', '402021082335510223', '202021082308140295', '2021-08-23 16:59:39', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021082377220228', '123321', '2004', 0.00, '7007', '402021082335510223', '202021082318310296', '2021-08-23 16:59:39', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021082385390229', '123321', '2006', 0.00, '7007', '402021082335510223', '202021082327970297', '2021-08-23 16:59:39', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021082704730001', '李四', '2003', 200.00, '6006', '772021082744050029', '-1', '2021-08-27 10:40:37', '0', '2021082665540071');
INSERT INTO `mytest_account` VALUES ('312021083023590300', '刘记炸鸡', '2006', 0.00, '7007', '402021083096450294', '202021083095572853', '2021-08-30 14:33:04', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021083026670298', '刘记炸鸡', '2003', 0.00, '7007', '402021083096450294', '202021083027232851', '2021-08-30 14:33:04', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021083076060299', '刘记炸鸡', '2004', 0.00, '7007', '402021083096450294', '202021083095852852', '2021-08-30 14:33:04', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021083103341173', '江小白有限公司', '2006', 0.00, '7007', '402021083167201167', '202021083130034975', '2021-08-31 17:21:10', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021083107221172', '江小白有限公司', '2004', 0.00, '7007', '402021083167201167', '202021083114644974', '2021-08-31 17:21:10', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021083125681036', '云信华诚', '2004', 0.00, '7007', '402021083120771031', '202021083158424483', '2021-08-31 16:10:44', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021083141591037', '云信华诚', '2006', 0.00, '7007', '402021083120771031', '202021083158014484', '2021-08-31 16:10:44', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021083169151171', '江小白有限公司', '2003', 0.00, '7007', '402021083167201167', '202021083199694973', '2021-08-31 17:21:10', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021083176181035', '云信华诚', '2003', 0.00, '7007', '402021083120771031', '202021083129934482', '2021-08-31 16:10:44', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021090126720001', '王五', '2003', 20000.00, '6006', '772021090151570046', '-1', '2021-09-01 15:01:48', '0', '2021082665540071');
INSERT INTO `mytest_account` VALUES ('312021090314880855', 'ooooooo', '2004', 0.00, '7007', '402021090312530850', '202021090365741789', '2021-09-03 11:55:26', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021090340340856', 'ooooooo', '2006', 0.00, '7007', '402021090312530850', '202021090308081790', '2021-09-03 11:55:26', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021090397020854', 'ooooooo', '2003', 0.00, '7007', '402021090312530850', '202021090384381788', '2021-09-03 11:55:26', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021090577840145', '物管', '2006', 0.00, '7007', '402021090562680139', '202021090550240180', '2021-09-05 18:30:20', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021090581400143', '物管', '2003', 0.00, '7007', '402021090562680139', '202021090516200178', '2021-09-05 18:30:20', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021090597980144', '物管', '2004', 0.00, '7007', '402021090562680139', '202021090569130179', '2021-09-05 18:30:20', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021090632710144', '雷神水果店', '2006', 0.00, '7007', '402021090629280138', '202021090648380519', '2021-09-06 18:13:39', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021090639450143', '雷神水果店', '2004', 0.00, '7007', '402021090629280138', '202021090682940518', '2021-09-06 18:13:39', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021090642760142', '雷神水果店', '2003', 0.03, '7007', '402021090629280138', '202021090651020517', '2021-09-06 18:13:39', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021090922650001', '学文', '2003', 200.00, '6006', '772021090835400062', '-1', '2021-09-09 01:28:01', '0', '2021081100880486');
INSERT INTO `mytest_account` VALUES ('312021090964690011', '张三6', '2003', 5000.00, '6006', '772021082710800399', '-1', '2021-09-09 01:30:32', '0', '2021081100880486');
INSERT INTO `mytest_account` VALUES ('312021090994460006', '张三8', '2003', 200.00, '6006', '772021090211530197', '-1', '2021-09-09 01:29:18', '0', '2021081100880486');
INSERT INTO `mytest_account` VALUES ('312021091048820001', '3-2-1', '2003', 321.00, '6006', '772021091030100314', '-1', '2021-09-10 15:12:29', '0', '2021081177860471');
INSERT INTO `mytest_account` VALUES ('312021091689960001', '冯夏富', '2003', 3000.00, '6006', '772021091645830055', '-1', '2021-09-16 09:22:38', '0', '2021091654710033');
INSERT INTO `mytest_account` VALUES ('312021091957330001', '崔崔', '2003', 999999.00, '6006', '772021091942410076', '-1', '2021-09-19 19:48:12', '0', '2021081177860471');
INSERT INTO `mytest_account` VALUES ('312021092256940004', 'test', '2003', 1.00, '6006', '772021092288520333', '-1', '2021-09-22 16:00:00', '0', '2021080494780158');
INSERT INTO `mytest_account` VALUES ('312021092416960004', '黄大梨', '2003', 1000.00, '6006', '772021092439030019', '-1', '2021-09-24 17:06:21', '0', '2021081177860471');
INSERT INTO `mytest_account` VALUES ('312021092480460001', '张三', '2003', 1000.00, '6006', '772021092324900222', '-1', '2021-09-24 17:04:55', '0', '2021081177860471');
INSERT INTO `mytest_account` VALUES ('312021092678910007', '11', '2003', 21.00, '6006', '772021092581540146', '-1', '2021-09-26 16:34:47', '0', '2021081177860471');
INSERT INTO `mytest_account` VALUES ('312021092751120001', '一一', '2003', 200.00, '6006', '772021092769750200', '-1', '2021-09-27 20:39:24', '0', '2021080494780158');
INSERT INTO `mytest_account` VALUES ('312021092912140590', '跑腿公司', '2003', 0.00, '7007', '402021092907050586', '202021092945311564', '2021-09-29 15:18:04', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092913320552', '跑腿公司', '2003', 0.00, '7007', '402021092914510548', '202021092944991479', '2021-09-29 14:20:40', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092925640573', '跑腿公司', '2006', 0.00, '7007', '402021092905290567', '202021092900861514', '2021-09-29 14:38:28', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092939260554', '跑腿公司', '2006', 0.00, '7007', '402021092914510548', '202021092970211481', '2021-09-29 14:20:40', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092942600562', '跑腿公司', '2003', 0.00, '7007', '402021092919870558', '202021092961211496', '2021-09-29 14:34:00', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092952150564', '跑腿公司', '2006', 0.00, '7007', '402021092919870558', '202021092971401498', '2021-09-29 14:34:00', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092953560545', '跑腿公司', '2006', 0.00, '7007', '402021092963770539', '202021092944841465', '2021-09-29 13:59:48', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092953590572', '跑腿公司', '2004', 0.00, '7007', '402021092905290567', '202021092903371513', '2021-09-29 14:38:27', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092963310592', '跑腿公司', '2006', 0.00, '7007', '402021092907050586', '202021092988721566', '2021-09-29 15:18:05', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092967330544', '跑腿公司', '2004', 0.00, '7007', '402021092963770539', '202021092991781464', '2021-09-29 13:59:48', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092967630591', '跑腿公司', '2004', 0.00, '7007', '402021092907050586', '202021092965871565', '2021-09-29 15:18:04', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092973000563', '跑腿公司', '2004', 0.00, '7007', '402021092919870558', '202021092993771497', '2021-09-29 14:34:00', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092974790006', '崔崔', '2003', 12100.00, '6006', '772021092211280002', '-1', '2021-09-29 23:22:44', '0', '2021080494780158');
INSERT INTO `mytest_account` VALUES ('312021092975490571', '跑腿公司', '2003', 0.00, '7007', '402021092905290567', '202021092932401512', '2021-09-29 14:38:27', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092989150543', '跑腿公司', '2003', 0.00, '7007', '402021092963770539', '202021092969291463', '2021-09-29 13:59:48', '0', NULL);
INSERT INTO `mytest_account` VALUES ('312021092990100553', '跑腿公司', '2004', 0.00, '7007', '402021092914510548', '202021092927061480', '2021-09-29 14:20:40', '0', NULL);

-- ----------------------------
-- Table structure for mytest_account_flow
-- ----------------------------
DROP TABLE IF EXISTS `mytest_account_flow`;
CREATE TABLE `mytest_account_flow`  (
  `detail_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '明细ID',
  `acct_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户ID',
  `detail_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型，1001 转入 2002 转出',
  `rel_acct_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '-1' COMMENT '关联账户',
  `amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `obj_type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对象类型，6006 个人 7007 商户',
  `obj_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对象ID',
  `order_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易单号',
  `b_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务Id',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status_cd` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '数据状态，详细参考c_status表，S 保存，0, 在用 1失效',
  PRIMARY KEY (`detail_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mytest_account_flow
-- ----------------------------
INSERT INTO `mytest_account_flow` VALUES ('912021062101550003', '312021062198760001', '1001', '-1', 20.00, '6006', '772021050961690382', '962021062145260002', '-1', '', '2021-06-21 16:39:50', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021062125130005', '312021062198760001', '1001', '-1', 20.00, '6006', '772021050961690382', '962021062136220004', '-1', '', '2021-06-21 16:54:27', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021062156690012', '312021062123890315', '2002', '-1', 0.00, '7007', '402021062178540311', '962021062143550013', '-1', '1231', '2021-06-21 18:19:58', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021062190710009', '312021062123890315', '2002', '-1', 0.00, '7007', '402021062178540311', '962021062146260010', '-1', '1234123', '2021-06-21 18:17:00', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021062268100016', '312021062259210014', '1001', '-1', 88.00, '6006', '772021060447241555', '962021062203550015', '-1', '', '2021-06-22 17:07:47', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021062320770003', '312021062314610001', '1001', '-1', 5000.00, '6006', '772021062391351069', '962021062333430002', '-1', '业主账号预存5000', '2021-06-23 13:39:56', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021062387780004', '312021062123890315', '1001', '-1', 0.00, '7007', '402021062178540311', '962021062382280005', '-1', '拒绝:滚', '2021-06-23 19:21:57', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021062665530008', '312021062123890315', '1001', '-1', 12.00, '2003', '402021062178540311', '962021062628790005', '-1', NULL, '2021-06-26 15:08:42', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021062674790007', '312021062123890315', '1001', '-1', 12.00, '2003', '402021062178540311', '962021062666330005', '-1', NULL, '2021-06-26 14:33:34', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021062696380006', '312021062123890315', '1001', '-1', 12.00, '2003', '402021062178540311', '962021062666330005', '-1', NULL, '2021-06-26 14:33:30', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021062955260003', '312021062947490001', '1001', '-1', 100.99, '6006', '772021062909320130', '962021062985360002', '-1', '存100.99', '2021-06-29 17:10:14', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021063065980002', '312021062123890315', '1001', '-1', 10.00, '2003', '402021062178540311', '962021063094460002', '-1', NULL, '2021-06-30 08:32:49', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021063080130002', '312021062947490001', '1001', '-1', 100.00, '6006', '772021062909320130', '962021063035710001', '-1', '100张子健', '2021-06-30 10:19:06', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070126430002', '312021062123890315', '1001', '-1', 8.00, '2003', '402021062178540311', '962021070195150026', '-1', NULL, '2021-07-01 11:05:22', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070135620001', '312021062123890315', '1001', '-1', 8.00, '2003', '402021062178540311', '962021070195150026', '-1', NULL, '2021-07-01 11:05:20', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070185480005', '312021070146410003', '1001', '-1', 5000.00, '6006', '772021070175870145', '962021070154060004', '-1', '', '2021-07-01 11:34:24', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070424060001', '312021062123890315', '1001', '-1', 0.00, '2003', '402021062178540311', '962021070460490005', '-1', NULL, '2021-07-04 07:11:34', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070519380005', '312021070564910001', '1001', '-1', 1000.90, '6006', '772021070341390194', '962021070566650004', '-1', '预存1000.9', '2021-07-05 09:08:59', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070547940009', '312021070564910001', '1001', '-1', 1.09, '6006', '772021070341390194', '962021070505900008', '-1', '1.099预存还是随时所所所所所所所所所所所所所所所所所所所所所所所所', '2021-07-05 09:12:24', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070555460012', '312021070521010010', '1001', '-1', 13333.00, '6006', '772021070194960049', '962021070577410011', '-1', '', '2021-07-05 18:01:09', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070585260003', '312021070564910001', '1001', '-1', 1000.00, '6006', '772021070341390194', '962021070588420002', '-1', '小小鱼预存1000', '2021-07-05 09:08:10', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070598820007', '312021070564910001', '1001', '-1', 5.00, '6006', '772021070341390194', '962021070577210006', '-1', '五块', '2021-07-05 09:11:12', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070601150013', '312021062123890315', '1001', '-1', 300.00, '2003', '402021062178540311', '962021070618580004', '-1', NULL, '2021-07-06 12:54:17', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070656600016', '312021070626070014', '1001', '-1', 55.59, '6006', '772021070609881327', '962021070652570015', '-1', '55.59', '2021-07-06 14:05:29', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070657230021', '312021070657770019', '1001', '-1', 100.00, '6006', '772021070602571683', '962021070607980020', '-1', '晓敏预存100元', '2021-07-06 15:27:19', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021070677190018', '312021070626070014', '1001', '-1', 100.00, '6006', '772021070609881327', '962021070653950017', '-1', '100', '2021-07-06 14:05:56', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021071291940005', '312021071220820003', '1001', '-1', 100.98, '6006', '772021070867950953', '962021071263620004', '-1', '', '2021-07-12 12:00:17', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021071302050008', '312021070626070014', '1001', '-1', 10.00, '6006', '772021070609881327', '962021071390930007', '-1', '', '2021-07-13 09:47:35', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021071309240014', '312021071363690012', '1001', '-1', 2000.00, '6006', '772021071367972062', '962021071397060013', '-1', '', '2021-07-13 11:21:15', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021071376860011', '312021071332420009', '1001', '-1', 1000.98, '6006', '772021071398732058', '962021071362130010', '-1', '', '2021-07-13 11:21:00', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021071380540016', '312021071332420009', '1001', '-1', 200.00, '6006', '772021071398732058', '962021071329300015', '-1', '', '2021-07-13 17:17:29', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021071396870018', '312021071332420009', '1001', '-1', 10.00, '6006', '772021071398732058', '962021071350600017', '-1', '', '2021-07-13 17:25:26', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021072291030003', '312021072265630001', '1001', '-1', 20.00, '6006', '772021070663731623', '962021072297550002', '-1', '', '2021-07-22 12:00:35', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021072320140004', '312021072316280002', '1001', '-1', 1000000.00, '6006', '772021072373470228', '962021072345400003', '-1', '', '2021-07-23 08:03:43', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021072700290002', '312021062123890315', '2002', '-1', 100.00, '7007', '402021062178540311', '962021072740560003', '-1', '123123', '2021-07-27 01:55:18', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021072759870002', '312021062123890315', '2002', '-1', 50.00, '7007', '402021062178540311', '962021072783560003', '-1', '101010', '2021-07-27 00:53:21', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021072828510005', '312021072316280002', '1001', '-1', 1222.00, '6006', '772021072373470228', '962021072842080004', '-1', '', '2021-07-28 14:45:03', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021072897830004', '312021062123890315', '2002', '-1', 0.01, '7007', '402021062178540311', '962021072806210005', '-1', '测试', '2021-07-28 17:11:46', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021073001300002', '312021062123890315', '1001', '-1', 50.00, '2003', '402021062178540311', '962021073059140015', '-1', NULL, '2021-07-30 11:19:58', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021073066090003', '312021062123890315', '1001', '-1', 50.00, '2003', '402021062178540311', '962021073059140015', '-1', NULL, '2021-07-30 11:20:07', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021073132370003', '312021073120770001', '1001', '-1', 1000000.00, '6006', '772021073152050045', '962021073132990002', '-1', '', '2021-07-31 16:22:43', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021080289730003', '312021080227500001', '1001', '-1', 110005.00, '6006', '772021073113180009', '962021080251910002', '-1', '', '2021-08-02 10:41:00', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021080422020001', '312021080454250021', '1001', '-1', 5000.00, '2003', '402021080419640017', '962021080478150006', '-1', NULL, '2021-08-04 22:43:48', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021080896250003', '312021080850380001', '1001', '-1', 45.00, '6006', '772021080598870015', '962021080842960002', '-1', '', '2021-08-08 13:12:53', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021081098320004', '312021081033910002', '1001', '-1', 13222.00, '6006', '772021081006680236', '962021081014910003', '-1', '', '2021-08-10 22:40:24', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021081266940003', '312021081266570001', '1001', '-1', 12313.00, '6006', '772021081112700495', '962021081229020002', '-1', '', '2021-08-12 15:34:56', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021081606440003', '312021081616880001', '1001', '-1', 20.00, '6006', '772021081691010023', '962021081637220002', '-1', '', '2021-08-16 20:54:36', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021081689770005', '312021081616880001', '1001', '-1', 500.00, '6006', '772021081691010023', '962021081626760004', '-1', '', '2021-08-16 20:55:14', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021081738850005', '312021081725980003', '1001', '-1', 200.00, '6006', '772021081744170093', '962021081715720004', '-1', '', '2021-08-17 17:08:39', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082072430003', '312021082023390001', '1001', '-1', 10.00, '6006', '772021082003530215', '962021082014670002', '-1', '', '2021-08-20 16:23:34', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082109340022', '312021082101850020', '1001', '-1', 1.00, '6006', '772021082148280247', '962021082143410021', '-1', '', '2021-08-21 14:34:19', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082112950011', '312021082147480007', '1001', '-1', 0.00, '6006', '772021082154830111', '962021082125870010', '-1', '', '2021-08-21 11:52:15', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082114680006', '312021082103030004', '1001', '-1', 1000.00, '6006', '772021082174450047', '962021082105060005', '-1', '', '2021-08-21 17:24:48', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082115560016', '312021082139850012', '1001', '-1', 1000.00, '6006', '772021082123190260', '962021082149390015', '-1', 'peanuttester2', '2021-08-21 14:28:52', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082123720009', '312021082147480007', '1001', '-1', 1.00, '6006', '772021082154830111', '962021082120270008', '-1', '', '2021-08-21 11:51:32', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082148860019', '312021082137770017', '1001', '-1', 10.00, '6006', '772021082139780126', '962021082196590018', '-1', '', '2021-08-21 14:33:51', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082153580024', '312021082137770017', '1001', '-1', 1000.00, '6006', '772021082139780126', '962021082136850023', '-1', '', '2021-08-21 14:38:11', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082154300006', '312021082181310004', '1001', '-1', 1.00, '6006', '772021082144220147', '962021082138490005', '-1', '', '2021-08-21 11:44:50', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082157690029', '312021082158980027', '1001', '-1', 0.00, '6006', '772021082113640300', '962021082193390028', '-1', '', '2021-08-21 15:21:25', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082161090003', '312021082175760001', '1001', '-1', 1000.00, '6006', '772021082106380012', '962021082100530002', '-1', '', '2021-08-21 11:09:42', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082166210003', '312021082185720001', '1001', '-1', 1000.00, '6006', '772021082134430039', '962021082195580002', '-1', '', '2021-08-21 17:22:09', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082166370026', '312021081266570001', '1001', '-1', 100.00, '6006', '772021081112700495', '962021082116230025', '-1', '', '2021-08-21 15:14:37', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082171620014', '312021082139850012', '1001', '-1', 1000.00, '6006', '772021082123190260', '962021082125130013', '-1', 'peanuttester', '2021-08-21 14:25:43', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021082792420003', '312021082704730001', '1001', '-1', 100.00, '6006', '772021082744050029', '962021082799490002', '-1', '', '2021-08-27 10:40:37', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090111660004', '312021080454250021', '1001', '-1', 0.01, '2003', '402021080419640017', '962021090144230208', '-1', NULL, '2021-09-01 16:56:57', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090196090003', '312021090126720001', '1001', '-1', 10000.00, '6006', '772021090151570046', '962021090116390002', '-1', '预存', '2021-09-01 15:01:49', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090227720002', '312021080454250021', '1001', '-1', 0.01, '2003', '402021080419640017', '962021090270610265', '-1', NULL, '2021-09-02 14:28:34', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090245700003', '312021080454250021', '1001', '-1', 0.01, '2003', '402021080419640017', '962021090248850277', '-1', NULL, '2021-09-02 14:29:28', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090246060001', '312021080454250021', '1001', '-1', 0.01, '2003', '402021080419640017', '962021090270610265', '-1', NULL, '2021-09-02 14:28:32', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090668350002', '312021090642760142', '1001', '-1', 0.01, '2003', '402021090629280138', '962021090633490666', '-1', NULL, '2021-09-06 18:48:47', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090723640003', '312021090642760142', '1001', '-1', 0.01, '2003', '402021090629280138', '962021090717590724', '-1', NULL, '2021-09-07 08:44:20', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090751420004', '312021090642760142', '1001', '-1', 0.01, '2003', '402021090629280138', '962021090773680814', '-1', NULL, '2021-09-07 09:13:28', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090902610010', '312021090994460006', '1001', '-1', 100.00, '6006', '772021090211530197', '962021090942700009', '-1', '是的', '2021-09-09 01:29:38', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090947990005', '312021090922650001', '1001', '-1', 100.00, '6006', '772021090835400062', '962021090957150004', '-1', '水电费', '2021-09-09 01:28:38', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090952950013', '312021090964690011', '1001', '-1', 5000.00, '6006', '772021082710800399', '962021090900160012', '-1', '水电费', '2021-09-09 01:30:32', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090955670008', '312021090994460006', '1001', '-1', 100.00, '6006', '772021090211530197', '962021090938440007', '-1', '水电费', '2021-09-09 01:29:18', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021090984700003', '312021090922650001', '1001', '-1', 100.00, '6006', '772021090835400062', '962021090947200002', '-1', '水电费', '2021-09-09 01:28:01', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021091016440003', '312021091048820001', '1001', '-1', 321.00, '6006', '772021091030100314', '962021091072020002', '-1', '', '2021-09-10 15:12:30', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021091606590003', '312021091689960001', '1001', '-1', 3000.00, '6006', '772021091645830055', '962021091618950002', '-1', '', '2021-09-16 09:22:38', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021091968020003', '312021091957330001', '1001', '-1', 999999.00, '6006', '772021091942410076', '962021091914380002', '-1', '999999', '2021-09-19 19:48:12', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021092281910006', '312021092256940004', '1001', '-1', 1.00, '6006', '772021092288520333', '962021092275670005', '-1', '', '2021-09-22 16:00:01', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021092401580006', '312021092416960004', '1001', '-1', 1000.00, '6006', '772021092439030019', '962021092462920005', '-1', '', '2021-09-24 17:06:21', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021092479520003', '312021092480460001', '1001', '-1', 1000.00, '6006', '772021092324900222', '962021092490550002', '-1', '', '2021-09-24 17:04:55', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021092665350009', '312021092678910007', '1001', '-1', 21.00, '6006', '772021092581540146', '962021092683910008', '-1', '', '2021-09-26 16:34:47', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021092709860003', '312021092751120001', '1001', '-1', 100.00, '6006', '772021092769750200', '962021092702960002', '-1', '', '2021-09-27 20:39:24', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021092906560008', '312021092974790006', '1001', '-1', 100.00, '6006', '772021092211280002', '962021092909600007', '-1', '', '2021-09-29 23:22:44', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021092912270005', '312021092751120001', '1001', '-1', 100.00, '6006', '772021092769750200', '962021092981500004', '-1', '', '2021-09-29 23:22:28', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021092930800010', '312021092974790006', '1001', '-1', 50.00, '6006', '772021092211280002', '962021092983950009', '-1', '', '2021-09-29 23:23:59', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021092955600643', '312021092974790006', '2002', '912021092908690645', 50.00, '6006', '772021092211280002', '962021092946640644', '202021092972841750', '前台缴费扣款', '2021-09-29 23:24:25', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021100756230014', '312021092974790006', '1001', '-1', 2000.00, '6006', '772021092211280002', '962021100737170013', '-1', '', '2021-10-07 13:59:00', '0');
INSERT INTO `mytest_account_flow` VALUES ('912021100766470012', '312021092974790006', '1001', '-1', 10000.00, '6006', '772021092211280002', '962021100786220011', '-1', '', '2021-10-07 13:22:03', '0');

SET FOREIGN_KEY_CHECKS = 1;
