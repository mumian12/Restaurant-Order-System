/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : localhost:3306
 Source Schema         : rostest

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 06/11/2023 18:11:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'item', 'item table', NULL, NULL, 'Item', 'crud', 'com.ruoyi.item', 'item', 'item', 'item', 'group14', '0', '/', '{}', 'admin', '2023-10-24 14:14:27', '', '2023-10-24 14:27:46', NULL);
INSERT INTO `gen_table` VALUES (4, 'orders', 'orders table', NULL, NULL, 'Orders', 'crud', 'com.ruoyi.orders', 'orders', 'orders', 'orders', 'group14', '0', '/', '{}', 'admin', '2023-10-24 15:01:57', '', '2023-10-24 15:12:52', NULL);
INSERT INTO `gen_table` VALUES (5, 'order_details', 'order details table', NULL, NULL, 'OrderDetails', 'crud', 'com.ruoyi.details', 'details', 'details', 'details', 'group14', '0', '/', '{}', 'admin', '2023-10-24 15:02:01', '', '2023-10-24 15:18:16', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'item_id', 'item id', 'bigint(20)', 'Long', 'itemId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-24 14:14:27', '', '2023-10-24 14:27:46');
INSERT INTO `gen_table_column` VALUES (2, 1, 'item_pic', 'item picture', 'varchar(200)', 'String', 'itemPic', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 2, 'admin', '2023-10-24 14:14:27', '', '2023-10-24 14:27:46');
INSERT INTO `gen_table_column` VALUES (3, 1, 'item_name', 'item name', 'varchar(30)', 'String', 'itemName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-10-24 14:14:27', '', '2023-10-24 14:27:46');
INSERT INTO `gen_table_column` VALUES (4, 1, 'item_price', 'item price', 'double(10,2)', 'BigDecimal', 'itemPrice', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'input', '', 4, 'admin', '2023-10-24 14:14:27', '', '2023-10-24 14:27:46');
INSERT INTO `gen_table_column` VALUES (5, 1, 'item_description', 'item description', 'varchar(100)', 'String', 'itemDescription', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-10-24 14:14:27', '', '2023-10-24 14:27:46');
INSERT INTO `gen_table_column` VALUES (6, 1, 'order_num', 'order number', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2023-10-24 14:14:27', '', '2023-10-24 14:27:46');
INSERT INTO `gen_table_column` VALUES (15, 4, 'order_id', 'item id', 'bigint(20)', 'Long', 'orderId', '1', '1', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2023-10-24 15:01:57', '', '2023-10-24 15:12:52');
INSERT INTO `gen_table_column` VALUES (16, 4, 'user_id', 'user id', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-10-24 15:01:57', '', '2023-10-24 15:12:52');
INSERT INTO `gen_table_column` VALUES (17, 4, 'order_time', 'order time', 'datetime', 'Date', 'orderTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 3, 'admin', '2023-10-24 15:01:57', '', '2023-10-24 15:12:52');
INSERT INTO `gen_table_column` VALUES (18, 4, 'order_state', 'order state', 'varchar(30)', 'String', 'orderState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2023-10-24 15:01:57', '', '2023-10-24 15:12:52');
INSERT INTO `gen_table_column` VALUES (19, 5, 'detail_id', 'detail id', 'int(11)', 'Long', 'detailId', '1', '1', NULL, '1', NULL, NULL, '0', 'EQ', 'input', '', 1, 'admin', '2023-10-24 15:02:01', '', '2023-10-24 15:18:17');
INSERT INTO `gen_table_column` VALUES (20, 5, 'order_id', 'order id', 'bigint(20)', 'Long', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-10-24 15:02:01', '', '2023-10-24 15:18:17');
INSERT INTO `gen_table_column` VALUES (21, 5, 'item_id', 'item id', 'bigint(20)', 'Long', 'itemId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-10-24 15:02:01', '', '2023-10-24 15:18:17');
INSERT INTO `gen_table_column` VALUES (22, 5, 'quantity', 'quantity', 'int(11)', 'Long', 'quantity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-10-24 15:02:01', '', '2023-10-24 15:18:17');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'item id',
  `item_pic` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'item picture',
  `item_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'item name',
  `item_price` double(10, 2) NULL DEFAULT 0.00 COMMENT 'item price',
  `item_description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'item description',
  `order_num` int(4) NULL DEFAULT 0 COMMENT 'order number',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 238 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'item table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (235, '/profile/upload/2023/11/03/OIP_20231103141448A001.jpg', 'noodle', 5.00, 'spicy', 0);
INSERT INTO `item` VALUES (236, '/profile/upload/2023/11/03/rice_20231103141512A002.jpg', 'fried rice', 10.00, 'spicy', 0);
INSERT INTO `item` VALUES (237, '/profile/upload/2023/11/03/cs载_20231103142118A003.jpg', 'chaoshou', 7.00, 'spicy', 0);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'detail id',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT 'order id',
  `item_id` bigint(20) NULL DEFAULT NULL COMMENT 'item id',
  `quantity` int(11) NULL DEFAULT NULL COMMENT 'quantity',
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'order details table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (205, 220, 235, 1);
INSERT INTO `order_details` VALUES (206, 220, 236, 2);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'item id',
  `user_id` bigint(20) NULL DEFAULT 0 COMMENT 'user id',
  `order_time` datetime NULL DEFAULT NULL COMMENT 'order time',
  `order_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'uncompleted' COMMENT 'order',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 221 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'order table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (220, 103, '2023-11-03 00:00:00', 'uncompleted');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-10-24 13:50:37', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-10-24 13:50:37', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-10-24 13:50:37', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-10-24 13:50:37', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2023-10-24 13:50:37', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-10-24 13:50:37', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-24 13:50:37', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-24 13:50:37', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-24 13:50:37', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-24 13:50:37', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-24 13:50:37', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-24 13:50:37', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-24 13:50:37', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-24 13:50:37', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-24 13:50:37', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-24 13:50:37', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-10-24 13:50:37', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-10-24 13:50:37', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-10-24 13:50:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-10-24 13:54:23');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-24 13:54:23');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-10-24 13:54:27');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-24 13:54:30');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-24 16:46:01');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-25 16:24:29');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-25 17:13:22');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-25 17:35:37');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-25 17:48:23');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 12:22:47');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-26 12:23:31');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 12:24:08');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-26 12:25:50');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 12:44:53');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-26 12:45:56');
INSERT INTO `sys_logininfor` VALUES (115, 'customer1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-10-26 12:47:14');
INSERT INTO `sys_logininfor` VALUES (116, 'customer1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 12:47:29');
INSERT INTO `sys_logininfor` VALUES (117, 'customer1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-26 12:47:41');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-10-26 12:52:29');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-26 12:52:32');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 12:55:15');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 13:42:24');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 13:56:42');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-26 14:54:02');
INSERT INTO `sys_logininfor` VALUES (124, 'customer1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-10-26 14:54:41');
INSERT INTO `sys_logininfor` VALUES (125, 'customer', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-26 14:55:00');
INSERT INTO `sys_logininfor` VALUES (126, 'customer1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 14:55:06');
INSERT INTO `sys_logininfor` VALUES (127, 'customer1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 15:05:05');
INSERT INTO `sys_logininfor` VALUES (128, 'customer1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-26 15:05:14');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 15:05:20');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-26 15:07:36');
INSERT INTO `sys_logininfor` VALUES (131, 'customer1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 15:07:49');
INSERT INTO `sys_logininfor` VALUES (132, 'customer1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-26 15:08:15');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 15:08:19');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-26 15:54:03');
INSERT INTO `sys_logininfor` VALUES (135, 'customer1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 15:54:17');
INSERT INTO `sys_logininfor` VALUES (136, 'customer1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-26 15:54:52');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 15:54:57');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 16:06:59');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 17:46:30');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 19:12:21');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 20:46:33');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-28 22:55:41');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-28 22:59:35');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 13:27:55');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 13:40:03');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 14:04:03');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 15:06:58');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 16:14:36');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 16:46:17');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 14:02:28');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 14:59:11');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 15:59:41');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-02 15:59:47');
INSERT INTO `sys_logininfor` VALUES (154, '111', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-11-02 16:00:00');
INSERT INTO `sys_logininfor` VALUES (155, '111', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 16:01:07');
INSERT INTO `sys_logininfor` VALUES (156, '111', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-02 16:01:13');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 16:01:19');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-02 16:02:02');
INSERT INTO `sys_logininfor` VALUES (159, '111', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 16:02:11');
INSERT INTO `sys_logininfor` VALUES (160, '111', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-02 16:03:13');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 16:03:17');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-02 16:03:32');
INSERT INTO `sys_logininfor` VALUES (163, '111', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 16:03:38');
INSERT INTO `sys_logininfor` VALUES (164, '111', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-02 16:03:59');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 16:04:05');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-02 16:05:33');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 16:05:36');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-02 16:05:41');
INSERT INTO `sys_logininfor` VALUES (169, '111', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-11-02 16:05:48');
INSERT INTO `sys_logininfor` VALUES (170, '111', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-02 16:05:48');
INSERT INTO `sys_logininfor` VALUES (171, '111', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 16:05:55');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 14:08:32');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 14:15:52');
INSERT INTO `sys_logininfor` VALUES (174, 'cus1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-11-03 14:16:26');
INSERT INTO `sys_logininfor` VALUES (175, 'cus1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 14:16:39');
INSERT INTO `sys_logininfor` VALUES (176, 'cus1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 14:18:40');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 14:18:45');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 14:19:14');
INSERT INTO `sys_logininfor` VALUES (179, 'cus1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-11-03 14:20:18');
INSERT INTO `sys_logininfor` VALUES (180, 'cus1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-03 14:20:18');
INSERT INTO `sys_logininfor` VALUES (181, 'cus1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 14:20:26');
INSERT INTO `sys_logininfor` VALUES (182, 'cus1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 14:20:58');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 14:21:02');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 14:21:54');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2031 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2007, 'item', 0, 1, 'item', 'item/item/index', NULL, 1, 0, 'C', '0', '0', 'item:item:list', 'build', 'admin', '2023-10-24 14:29:03', 'admin', '2023-10-25 16:24:59', 'item菜单');
INSERT INTO `sys_menu` VALUES (2008, 'item查询', 2007, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'item:item:query', '#', 'admin', '2023-10-24 14:29:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, 'item新增', 2007, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'item:item:add', '#', 'admin', '2023-10-24 14:29:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, 'item修改', 2007, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'item:item:edit', '#', 'admin', '2023-10-24 14:29:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, 'item删除', 2007, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'item:item:remove', '#', 'admin', '2023-10-24 14:29:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, 'item导出', 2007, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'item:item:export', '#', 'admin', '2023-10-24 14:29:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, 'orders', 0, 1, 'orders', 'orders/orders/index', NULL, 1, 0, 'C', '0', '0', 'orders:orders:list', 'cascader', 'admin', '2023-10-24 15:03:39', 'admin', '2023-10-25 16:25:10', 'orders菜单');
INSERT INTO `sys_menu` VALUES (2020, 'orders查询', 2019, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'orders:orders:query', '#', 'admin', '2023-10-24 15:03:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, 'orders新增', 2019, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'orders:orders:add', '#', 'admin', '2023-10-24 15:03:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, 'orders修改', 2019, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'orders:orders:edit', '#', 'admin', '2023-10-24 15:03:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, 'orders删除', 2019, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'orders:orders:remove', '#', 'admin', '2023-10-24 15:03:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, 'orders导出', 2019, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'orders:orders:export', '#', 'admin', '2023-10-24 15:03:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, 'details', 0, 1, 'details', 'details/details/index', NULL, 1, 0, 'C', '0', '0', 'details:details:list', '#', 'admin', '2023-10-24 15:19:42', '', NULL, 'details菜单');
INSERT INTO `sys_menu` VALUES (2026, 'details查询', 2025, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'details:details:query', '#', 'admin', '2023-10-24 15:19:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, 'details新增', 2025, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'details:details:add', '#', 'admin', '2023-10-24 15:19:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, 'details修改', 2025, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'details:details:edit', '#', 'admin', '2023-10-24 15:19:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, 'details删除', 2025, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'details:details:remove', '#', 'admin', '2023-10-24 15:19:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, 'details导出', 2025, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'details:details:export', '#', 'admin', '2023-10-24 15:19:42', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-10-24 13:50:37', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-10-24 13:50:37', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 250 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"item_manage\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"item_manage\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 14:13:03', 46);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"item,orders,order_details\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 14:14:27', 143);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"item\",\"className\":\"Item\",\"columns\":[{\"capJavaField\":\"ItemId\",\"columnComment\":\"item id\",\"columnId\":1,\"columnName\":\"item_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"itemId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItemPic\",\"columnComment\":\"item picture\",\"columnId\":2,\"columnName\":\"item_pic\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"itemPic\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItemName\",\"columnComment\":\"item name\",\"columnId\":3,\"columnName\":\"item_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"itemName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItemPrice\",\"columnComment\":\"item price\",\"columnId\":4,\"columnName\":\"item_price\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"itemPrice\",\"javaType\":\"BigDeci', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 14:16:02', 82);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order_details\",\"className\":\"OrderDetails\",\"columns\":[{\"capJavaField\":\"DetailId\",\"columnComment\":\"detail id\",\"columnId\":7,\"columnName\":\"detail_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"detailId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"order id\",\"columnId\":8,\"columnName\":\"order_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItemId\",\"columnComment\":\"item id\",\"columnId\":9,\"columnName\":\"item_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"itemId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Quantity\",\"columnComment\":\"quantity\",\"columnId\":10,\"columnName\":\"quantity\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"quantity\",\"javaType\":\"Long\",\"list\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 14:17:10', 57);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"item\"}', NULL, 0, NULL, '2023-10-24 14:17:28', 393);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"item\",\"className\":\"Item\",\"columns\":[{\"capJavaField\":\"ItemId\",\"columnComment\":\"item id\",\"columnId\":1,\"columnName\":\"item_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"itemId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 14:16:02\",\"usableColumn\":false},{\"capJavaField\":\"ItemPic\",\"columnComment\":\"item picture\",\"columnId\":2,\"columnName\":\"item_pic\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"itemPic\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 14:16:02\",\"usableColumn\":false},{\"capJavaField\":\"ItemName\",\"columnComment\":\"item name\",\"columnId\":3,\"columnName\":\"item_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"itemName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 14:16:02\",\"usableColumn\":false},{\"capJavaField\":\"ItemPrice\",\"columnComment\":\"item price\",\"columnId\":4,\"columnName\":\"item_price\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrem', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 14:23:28', 58);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"item\",\"className\":\"Item\",\"columns\":[{\"capJavaField\":\"ItemId\",\"columnComment\":\"item id\",\"columnId\":1,\"columnName\":\"item_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"itemId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 14:23:28\",\"usableColumn\":false},{\"capJavaField\":\"ItemPic\",\"columnComment\":\"item picture\",\"columnId\":2,\"columnName\":\"item_pic\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"itemPic\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 14:23:28\",\"usableColumn\":false},{\"capJavaField\":\"ItemName\",\"columnComment\":\"item name\",\"columnId\":3,\"columnName\":\"item_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"itemName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 14:23:28\",\"usableColumn\":false},{\"capJavaField\":\"ItemPrice\",\"columnComment\":\"item price\",\"columnId\":4,\"columnName\":\"item_price\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrem', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 14:23:51', 35);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"item\"}', NULL, 0, NULL, '2023-10-24 14:23:53', 130);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 14:24:18', 15);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"item\",\"className\":\"Item\",\"columns\":[{\"capJavaField\":\"ItemId\",\"columnComment\":\"item id\",\"columnId\":1,\"columnName\":\"item_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"itemId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 14:23:51\",\"usableColumn\":false},{\"capJavaField\":\"ItemPic\",\"columnComment\":\"item picture\",\"columnId\":2,\"columnName\":\"item_pic\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"itemPic\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 14:23:51\",\"usableColumn\":false},{\"capJavaField\":\"ItemName\",\"columnComment\":\"item name\",\"columnId\":3,\"columnName\":\"item_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"itemName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 14:23:51\",\"usableColumn\":false},{\"capJavaField\":\"ItemPrice\",\"columnComment\":\"item price\",\"columnId\":4,\"columnName\":\"item_price\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 14:27:46', 56);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"item\"}', NULL, 0, NULL, '2023-10-24 14:27:49', 164);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"Orders\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"item id\",\"columnId\":11,\"columnName\":\"order_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"picture\",\"columnId\":12,\"columnName\":\"user_id\",\"columnType\":\"char(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderTime\",\"columnComment\":\"order time\",\"columnId\":13,\"columnName\":\"order_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"orderTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderState\",\"columnComment\":\"order\",\"columnId\":14,\"columnName\":\"order_state\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 14:14:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"orderState\",\"java', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 14:35:02', 71);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"orders\"}', NULL, 0, NULL, '2023-10-24 14:35:05', 243);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 14:58:46', 80);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 15:01:45', 14);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"orders\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 15:01:57', 45);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"order_details\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 15:02:01', 20);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"orders\",\"className\":\"Orders\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"item id\",\"columnId\":15,\"columnName\":\"order_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:01:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"user id\",\"columnId\":16,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:01:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderTime\",\"columnComment\":\"order time\",\"columnId\":17,\"columnName\":\"order_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:01:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"orderTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderState\",\"columnComment\":\"order\",\"columnId\":18,\"columnName\":\"order_state\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:01:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"orderState\",\"java', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 15:02:58', 21);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"orders\"}', NULL, 0, NULL, '2023-10-24 15:03:02', 153);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"orders\",\"className\":\"Orders\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"item id\",\"columnId\":15,\"columnName\":\"order_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:01:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 15:02:58\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"user id\",\"columnId\":16,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:01:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 15:02:58\",\"usableColumn\":false},{\"capJavaField\":\"OrderTime\",\"columnComment\":\"order time\",\"columnId\":17,\"columnName\":\"order_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:01:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"orderTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-10-24 15:02:58\",\"usableColumn\":false},{\"capJavaField\":\"OrderState\",\"columnComment\":\"order state\",\"columnId\":18,\"columnName\":\"order_state\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:01:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 15:12:52', 77);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"orders\"}', NULL, 0, NULL, '2023-10-24 15:12:58', 235);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"details\",\"className\":\"OrderDetails\",\"columns\":[{\"capJavaField\":\"DetailId\",\"columnComment\":\"detail id\",\"columnId\":19,\"columnName\":\"detail_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:02:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"0\",\"javaField\":\"detailId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"order id\",\"columnId\":20,\"columnName\":\"order_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:02:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItemId\",\"columnComment\":\"item id\",\"columnId\":21,\"columnName\":\"item_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:02:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"itemId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Quantity\",\"columnComment\":\"quantity\",\"columnId\":22,\"columnName\":\"quantity\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-24 15:02:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"quantity\",\"javaType\":\"Long\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 15:18:17', 80);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"order_details\"}', NULL, 0, NULL, '2023-10-24 15:18:20', 191);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"item/item/index\",\"createTime\":\"2023-10-24 14:29:03\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"item\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"item\",\"perms\":\"item:item:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 16:24:59', 62);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"orders/orders/index\",\"createTime\":\"2023-10-24 15:03:39\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"orders\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"orders\",\"perms\":\"orders:orders:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 16:25:10', 15);
INSERT INTO `sys_oper_log` VALUES (125, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemDescription\":\"trditional SiChuan food\",\"itemId\":200,\"itemName\":\"hot pot\",\"itemPrice\":24.00,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 16:45:47', 6);
INSERT INTO `sys_oper_log` VALUES (126, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemDescription\":\"little spicy\",\"itemId\":201,\"itemName\":\"beef noodle\",\"itemPrice\":6.00,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 16:46:29', 3);
INSERT INTO `sys_oper_log` VALUES (127, 'item', 2, 'com.ruoyi.item.controller.ItemController.edit()', 'PUT', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemDescription\":\"traditional SiChuan food\",\"itemId\":200,\"itemName\":\"hot pot\",\"itemPic\":\"\",\"itemPrice\":24,\"orderNum\":0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 16:55:03', 13);
INSERT INTO `sys_oper_log` VALUES (128, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-25 17:50:45', 95);
INSERT INTO `sys_oper_log` VALUES (129, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":202,\"itemName\":\"123\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 17:50:54', 8);
INSERT INTO `sys_oper_log` VALUES (130, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":203,\"itemName\":\"456\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 17:50:58', 14);
INSERT INTO `sys_oper_log` VALUES (131, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":204,\"itemName\":\"789\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 17:51:03', 13);
INSERT INTO `sys_oper_log` VALUES (132, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":205,\"itemName\":\"852\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 17:51:07', 13);
INSERT INTO `sys_oper_log` VALUES (133, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":206,\"itemName\":\"741\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 17:51:11', 13);
INSERT INTO `sys_oper_log` VALUES (134, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":207,\"itemName\":\"963\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 17:51:15', 15);
INSERT INTO `sys_oper_log` VALUES (135, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":208,\"itemName\":\"753\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 17:51:23', 13);
INSERT INTO `sys_oper_log` VALUES (136, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":209,\"itemName\":\"159\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 17:51:27', 13);
INSERT INTO `sys_oper_log` VALUES (137, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":210,\"itemName\":\"469\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 17:51:32', 13);
INSERT INTO `sys_oper_log` VALUES (138, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":211,\"itemName\":\"\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 17:54:46', 13);
INSERT INTO `sys_oper_log` VALUES (139, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/211', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 17:54:49', 20);
INSERT INTO `sys_oper_log` VALUES (140, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/202', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-25 18:00:29', 13);
INSERT INTO `sys_oper_log` VALUES (141, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":200,\"orderTime\":\"2023-10-26\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 14:27:41', 23);
INSERT INTO `sys_oper_log` VALUES (142, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":201,\"orderTime\":\"2023-10-25\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 14:28:39', 10);
INSERT INTO `sys_oper_log` VALUES (143, 'orders', 5, 'com.ruoyi.orders.controller.OrdersController.export()', 'POST', 1, 'admin', NULL, '/orders/orders/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-10-26 14:28:57', 1082);
INSERT INTO `sys_oper_log` VALUES (144, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":202,\"orderTime\":\"2023-10-24\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 14:30:07', 11);
INSERT INTO `sys_oper_log` VALUES (145, 'orders', 2, 'com.ruoyi.orders.controller.OrdersController.edit()', 'PUT', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":201,\"orderState\":\"uncompleted\",\"orderTime\":\"2023-10-27\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 14:30:50', 11);
INSERT INTO `sys_oper_log` VALUES (146, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-24 13:50:37\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2008,2009,2010,2011,2012,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030],\"params\":{},\"remark\":\"common role\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 15:06:38', 78);
INSERT INTO `sys_oper_log` VALUES (147, 'details', 1, 'com.ruoyi.details.controller.OrderDetailsController.add()', 'POST', 1, 'admin', NULL, '/details/details', '127.0.0.1', '内网IP', '{\"detailId\":200,\"itemId\":200,\"orderId\":200,\"params\":{},\"quantity\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 15:09:50', 17);
INSERT INTO `sys_oper_log` VALUES (148, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-24 13:50:37\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2008,2009,2011,2012,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030],\"params\":{},\"remark\":\"common role\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 15:53:58', 32);
INSERT INTO `sys_oper_log` VALUES (149, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":203,\"orderTime\":\"2023-10-26\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 17:52:22', 25);
INSERT INTO `sys_oper_log` VALUES (150, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":204,\"orderTime\":\"2023-10-26\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 18:02:19', 0);
INSERT INTO `sys_oper_log` VALUES (151, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":205,\"orderTime\":\"2023-10-26\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 18:03:26', 4);
INSERT INTO `sys_oper_log` VALUES (152, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":206,\"orderTime\":\"2023-10-26\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 18:05:05', 11);
INSERT INTO `sys_oper_log` VALUES (153, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":207,\"orderTime\":\"2023-10-26\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 18:08:00', 5);
INSERT INTO `sys_oper_log` VALUES (154, 'orders', 2, 'com.ruoyi.orders.controller.OrdersController.edit()', 'PUT', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":201,\"orderState\":\"completed\",\"orderTime\":\"2023-10-27\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 18:49:59', 9);
INSERT INTO `sys_oper_log` VALUES (155, 'orders', 2, 'com.ruoyi.orders.controller.OrdersController.edit()', 'PUT', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":200,\"orderState\":\"completed\",\"orderTime\":\"2023-10-26\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 18:50:07', 8);
INSERT INTO `sys_oper_log` VALUES (156, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-24 13:50:37\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2019,2008,2009,2011,2012,2020,2025,2026,2027,2028,2029,2030],\"params\":{},\"remark\":\"common role\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 18:51:47', 46);
INSERT INTO `sys_oper_log` VALUES (157, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":208,\"orderTime\":\"2023-10-26\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 19:13:09', 23);
INSERT INTO `sys_oper_log` VALUES (158, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":209,\"orderTime\":\"2023-10-26\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 19:20:35', 14);
INSERT INTO `sys_oper_log` VALUES (159, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-26 20:47:09', 79);
INSERT INTO `sys_oper_log` VALUES (160, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-26 20:53:14', 11);
INSERT INTO `sys_oper_log` VALUES (161, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":212,\"itemName\":\"rice\",\"itemPrice\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 20:56:10', 13);
INSERT INTO `sys_oper_log` VALUES (162, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":213,\"itemName\":\"BBQ\",\"itemPrice\":1.5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 20:57:51', 15);
INSERT INTO `sys_oper_log` VALUES (163, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-26 20:59:49', 4);
INSERT INTO `sys_oper_log` VALUES (164, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/213', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:02:36', 21);
INSERT INTO `sys_oper_log` VALUES (165, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":214,\"itemName\":\"BBQ\",\"itemPrice\":1.5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:02:44', 10);
INSERT INTO `sys_oper_log` VALUES (166, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-26 21:04:08', 0);
INSERT INTO `sys_oper_log` VALUES (167, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-26 21:04:48', 0);
INSERT INTO `sys_oper_log` VALUES (168, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-26 21:05:16', 0);
INSERT INTO `sys_oper_log` VALUES (169, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-26 21:05:32', 4);
INSERT INTO `sys_oper_log` VALUES (170, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":215,\"itemName\":\"soap\",\"itemPrice\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:06:11', 9);
INSERT INTO `sys_oper_log` VALUES (171, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":216,\"itemName\":\"porage\",\"itemPrice\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:07:04', 0);
INSERT INTO `sys_oper_log` VALUES (172, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/212', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:07:40', 10);
INSERT INTO `sys_oper_log` VALUES (173, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":217,\"itemName\":\"rice\",\"itemPrice\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:07:45', 0);
INSERT INTO `sys_oper_log` VALUES (174, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":218,\"itemName\":\"chicken rice\",\"itemPrice\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:08:39', 0);
INSERT INTO `sys_oper_log` VALUES (175, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":219,\"itemName\":\"123\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:09:36', 9);
INSERT INTO `sys_oper_log` VALUES (176, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-26 21:09:38', 6);
INSERT INTO `sys_oper_log` VALUES (177, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":220,\"itemName\":\"ewer\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:09:42', 10);
INSERT INTO `sys_oper_log` VALUES (178, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":221,\"itemName\":\"cvx\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:09:50', 11);
INSERT INTO `sys_oper_log` VALUES (179, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":222,\"itemName\":\"gvea\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:09:53', 11);
INSERT INTO `sys_oper_log` VALUES (180, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/222', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:09:57', 13);
INSERT INTO `sys_oper_log` VALUES (181, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/220', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:09:59', 10);
INSERT INTO `sys_oper_log` VALUES (182, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/221', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:10:04', 13);
INSERT INTO `sys_oper_log` VALUES (183, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/219', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-26 21:10:06', 15);
INSERT INTO `sys_oper_log` VALUES (184, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":210,\"orderTime\":\"2023-10-28\",\"params\":{},\"userId\":1}', '{\"orderId\":210,\"orderTime\":\"2023-10-28\",\"params\":{},\"userId\":1}', 0, NULL, '2023-10-28 23:03:49', 37);
INSERT INTO `sys_oper_log` VALUES (185, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":211,\"orderTime\":\"2023-10-28\",\"params\":{},\"userId\":1}', '{\"orderId\":211,\"orderTime\":\"2023-10-28\",\"params\":{},\"userId\":1}', 0, NULL, '2023-10-28 23:07:37', 0);
INSERT INTO `sys_oper_log` VALUES (186, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":212,\"orderTime\":\"2023-10-28\",\"params\":{},\"userId\":1}', '{\"orderId\":212,\"orderTime\":\"2023-10-28\",\"params\":{},\"userId\":1}', 0, NULL, '2023-10-28 23:23:05', 157);
INSERT INTO `sys_oper_log` VALUES (187, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":213,\"orderTime\":\"2023-10-28\",\"params\":{},\"userId\":1}', '{\"orderId\":213,\"orderTime\":\"2023-10-28\",\"params\":{},\"userId\":1}', 0, NULL, '2023-10-28 23:23:28', 8);
INSERT INTO `sys_oper_log` VALUES (188, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-29 13:28:13', 141);
INSERT INTO `sys_oper_log` VALUES (189, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-29 13:29:44', 7);
INSERT INTO `sys_oper_log` VALUES (190, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":223,\"itemName\":\"rabbit head\",\"itemPrice\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:40:19', 54);
INSERT INTO `sys_oper_log` VALUES (191, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":224,\"itemName\":\"23\",\"itemPrice\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:43:48', 38);
INSERT INTO `sys_oper_log` VALUES (192, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/224', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:43:51', 32);
INSERT INTO `sys_oper_log` VALUES (193, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":225,\"itemName\":\"123\",\"itemPrice\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:46:14', 13);
INSERT INTO `sys_oper_log` VALUES (194, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/225', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:46:18', 15);
INSERT INTO `sys_oper_log` VALUES (195, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":226,\"itemName\":\"123\",\"itemPrice\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:48:42', 0);
INSERT INTO `sys_oper_log` VALUES (196, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/226', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:48:49', 13);
INSERT INTO `sys_oper_log` VALUES (197, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":214,\"orderTime\":\"2023-10-29\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:52:34', 41);
INSERT INTO `sys_oper_log` VALUES (198, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":227,\"itemName\":\"123\",\"itemPrice\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:52:54', 16);
INSERT INTO `sys_oper_log` VALUES (199, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/227', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:52:58', 21);
INSERT INTO `sys_oper_log` VALUES (200, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":228,\"itemName\":\"123\",\"itemPrice\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:56:28', 250);
INSERT INTO `sys_oper_log` VALUES (201, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/228', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:56:31', 29);
INSERT INTO `sys_oper_log` VALUES (202, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":215,\"orderTime\":\"2023-10-29\",\"params\":{},\"userId\":1}', '{\"orderId\":215,\"orderTime\":\"2023-10-29\",\"params\":{},\"userId\":1}', 0, NULL, '2023-10-29 13:56:36', 37);
INSERT INTO `sys_oper_log` VALUES (203, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":229,\"itemName\":\"123\",\"itemPrice\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:58:51', 15);
INSERT INTO `sys_oper_log` VALUES (204, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/229', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 13:58:54', 17);
INSERT INTO `sys_oper_log` VALUES (205, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.insertItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into item\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-10-29 13:59:53', 191);
INSERT INTO `sys_oper_log` VALUES (206, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":216,\"orderTime\":\"2023-10-29\",\"params\":{},\"userId\":1}', '{\"orderId\":216,\"orderTime\":\"2023-10-29\",\"params\":{},\"userId\":1}', 0, NULL, '2023-10-29 14:00:36', 12);
INSERT INTO `sys_oper_log` VALUES (207, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":217,\"orderTime\":\"2023-10-29\",\"params\":{},\"userId\":1}', '{\"orderId\":217,\"orderTime\":\"2023-10-29\",\"params\":{},\"userId\":1}', 0, NULL, '2023-10-29 14:01:24', 374);
INSERT INTO `sys_oper_log` VALUES (208, 'details', 1, 'com.ruoyi.details.controller.OrderDetailsController.add()', 'POST', 1, 'admin', NULL, '/details/details', '127.0.0.1', '内网IP', '{\"detailId\":201,\"itemId\":214,\"orderId\":217,\"params\":{},\"quantity\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 14:01:24', 25);
INSERT INTO `sys_oper_log` VALUES (209, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemDescription\":\"5\",\"itemId\":230,\"itemName\":\"555\",\"itemPrice\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 14:01:46', 26);
INSERT INTO `sys_oper_log` VALUES (210, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":231,\"itemName\":\"555\",\"itemPrice\":156,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 14:04:27', 47);
INSERT INTO `sys_oper_log` VALUES (211, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/230', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 14:04:30', 24);
INSERT INTO `sys_oper_log` VALUES (212, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/231', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 14:04:32', 20);
INSERT INTO `sys_oper_log` VALUES (213, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":232,\"itemName\":\"123\",\"itemPrice\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 15:07:23', 42);
INSERT INTO `sys_oper_log` VALUES (214, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/232', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 15:07:33', 36);
INSERT INTO `sys_oper_log` VALUES (215, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":233,\"itemName\":\"4\",\"itemPrice\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 15:12:45', 18);
INSERT INTO `sys_oper_log` VALUES (216, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/233', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 15:12:48', 19);
INSERT INTO `sys_oper_log` VALUES (217, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'admin', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":218,\"orderTime\":\"2023-10-29\",\"params\":{},\"userId\":1}', '{\"orderId\":218,\"orderTime\":\"2023-10-29\",\"params\":{},\"userId\":1}', 0, NULL, '2023-10-29 15:12:50', 32);
INSERT INTO `sys_oper_log` VALUES (218, 'details', 1, 'com.ruoyi.details.controller.OrderDetailsController.add()', 'POST', 1, 'admin', NULL, '/details/details', '127.0.0.1', '内网IP', '{\"detailId\":202,\"itemId\":200,\"orderId\":218,\"params\":{},\"quantity\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 15:12:51', 24);
INSERT INTO `sys_oper_log` VALUES (219, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-24 13:50:37\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2019,2008,2009,2011,2012,2020],\"params\":{},\"remark\":\"common role\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 16:01:59', 79);
INSERT INTO `sys_oper_log` VALUES (220, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-24 13:50:37\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2019,2025,2008,2009,2011,2012,2020,2027],\"params\":{},\"remark\":\"common role\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 16:03:29', 27);
INSERT INTO `sys_oper_log` VALUES (221, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-24 13:50:37\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2007,2019,2008,2009,2011,2012,2020,2027],\"params\":{},\"remark\":\"common role\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 16:04:22', 24);
INSERT INTO `sys_oper_log` VALUES (222, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-24 13:50:37\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2007,2008,2019,2020,2021,2027],\"params\":{},\"remark\":\"common role\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 16:05:06', 22);
INSERT INTO `sys_oper_log` VALUES (223, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-24 13:50:37\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2007,2008,2019,2020,2021,2026,2027],\"params\":{},\"remark\":\"common role\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 16:05:20', 31);
INSERT INTO `sys_oper_log` VALUES (224, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-24 13:50:37\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2007,2008,2019,2020,2021,2026,2027],\"params\":{},\"remark\":\"common role\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 16:05:30', 24);
INSERT INTO `sys_oper_log` VALUES (225, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, '111', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":219,\"orderTime\":\"2023-11-02\",\"params\":{},\"userId\":102}', '{\"orderId\":219,\"orderTime\":\"2023-11-02\",\"params\":{},\"userId\":102}', 0, NULL, '2023-11-02 16:06:02', 9);
INSERT INTO `sys_oper_log` VALUES (226, 'details', 1, 'com.ruoyi.details.controller.OrderDetailsController.add()', 'POST', 1, '111', NULL, '/details/details', '127.0.0.1', '内网IP', '{\"detailId\":203,\"itemId\":200,\"orderId\":219,\"params\":{},\"quantity\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 16:06:03', 17);
INSERT INTO `sys_oper_log` VALUES (227, 'details', 1, 'com.ruoyi.details.controller.OrderDetailsController.add()', 'POST', 1, '111', NULL, '/details/details', '127.0.0.1', '内网IP', '{\"detailId\":204,\"itemId\":201,\"orderId\":219,\"params\":{},\"quantity\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 16:06:03', 13);
INSERT INTO `sys_oper_log` VALUES (228, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemId\":234,\"itemName\":\"noodles\",\"itemPic\":\"/profile/upload/2023/11/03/OIP_20231103140845A001.jpg\",\"itemPrice\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:08:54', 30);
INSERT INTO `sys_oper_log` VALUES (229, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/200', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.deleteItemByItemIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from item where item_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))', '2023-11-03 14:10:52', 115);
INSERT INTO `sys_oper_log` VALUES (230, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/200', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.deleteItemByItemIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from item where item_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))', '2023-11-03 14:10:59', 4);
INSERT INTO `sys_oper_log` VALUES (231, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/234', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:11:07', 29);
INSERT INTO `sys_oper_log` VALUES (232, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/223', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:11:09', 3);
INSERT INTO `sys_oper_log` VALUES (233, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/200', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.deleteItemByItemIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from item where item_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))', '2023-11-03 14:11:12', 6);
INSERT INTO `sys_oper_log` VALUES (234, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/218', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:11:16', 9);
INSERT INTO `sys_oper_log` VALUES (235, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/201', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.deleteItemByItemIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from item where item_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))', '2023-11-03 14:11:18', 16);
INSERT INTO `sys_oper_log` VALUES (236, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/214', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))\r\n### The error may exist in file [C:\\Users\\ASUS\\Desktop\\Restaurant-Order-System\\Restaurant_ordering_System_Backend\\item\\target\\classes\\mapper\\item\\ItemMapper.xml]\r\n### The error may involve com.ruoyi.item.mapper.ItemMapper.deleteItemByItemIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from item where item_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`rostest`.`order_details`, CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`))', '2023-11-03 14:11:22', 8);
INSERT INTO `sys_oper_log` VALUES (237, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/215', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:11:25', 17);
INSERT INTO `sys_oper_log` VALUES (238, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/200', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:12:18', 11);
INSERT INTO `sys_oper_log` VALUES (239, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/201', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:12:21', 12);
INSERT INTO `sys_oper_log` VALUES (240, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/214', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:12:23', 16);
INSERT INTO `sys_oper_log` VALUES (241, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/216', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:12:24', 16);
INSERT INTO `sys_oper_log` VALUES (242, 'item', 3, 'com.ruoyi.item.controller.ItemController.remove()', 'DELETE', 1, 'admin', NULL, '/item/item/217', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:12:26', 0);
INSERT INTO `sys_oper_log` VALUES (243, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemDescription\":\"spicy\",\"itemId\":235,\"itemName\":\"noodle\",\"itemPic\":\"/profile/upload/2023/11/03/OIP_20231103141448A001.jpg\",\"itemPrice\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:15:06', 16);
INSERT INTO `sys_oper_log` VALUES (244, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemDescription\":\"spicy\",\"itemId\":236,\"itemName\":\"fried rice\",\"itemPic\":\"/profile/upload/2023/11/03/rice_20231103141512A002.jpg\",\"itemPrice\":10,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:15:25', 0);
INSERT INTO `sys_oper_log` VALUES (245, 'orders', 1, 'com.ruoyi.orders.controller.OrdersController.add()', 'POST', 1, 'cus1', NULL, '/orders/orders', '127.0.0.1', '内网IP', '{\"orderId\":220,\"orderTime\":\"2023-11-03\",\"params\":{},\"userId\":103}', '{\"orderId\":220,\"orderTime\":\"2023-11-03\",\"params\":{},\"userId\":103}', 0, NULL, '2023-11-03 14:16:53', 10);
INSERT INTO `sys_oper_log` VALUES (246, 'details', 1, 'com.ruoyi.details.controller.OrderDetailsController.add()', 'POST', 1, 'cus1', NULL, '/details/details', '127.0.0.1', '内网IP', '{\"detailId\":205,\"itemId\":235,\"orderId\":220,\"params\":{},\"quantity\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:16:54', 17);
INSERT INTO `sys_oper_log` VALUES (247, 'details', 1, 'com.ruoyi.details.controller.OrderDetailsController.add()', 'POST', 1, 'cus1', NULL, '/details/details', '127.0.0.1', '内网IP', '{\"detailId\":206,\"itemId\":236,\"orderId\":220,\"params\":{},\"quantity\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:16:54', 5);
INSERT INTO `sys_oper_log` VALUES (248, 'item', 1, 'com.ruoyi.item.controller.ItemController.add()', 'POST', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemDescription\":\"spicy\",\"itemId\":237,\"itemName\":\"chaoshou\",\"itemPic\":\"/profile/upload/2023/11/03/cs载_20231103142118A003.jpg\",\"itemPrice\":20,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:21:31', 11);
INSERT INTO `sys_oper_log` VALUES (249, 'item', 2, 'com.ruoyi.item.controller.ItemController.edit()', 'PUT', 1, 'admin', NULL, '/item/item', '127.0.0.1', '内网IP', '{\"itemDescription\":\"spicy\",\"itemId\":237,\"itemName\":\"chaoshou\",\"itemPic\":\"/profile/upload/2023/11/03/cs载_20231103142118A003.jpg\",\"itemPrice\":7,\"orderNum\":0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-03 14:21:39', 13);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-10-24 13:50:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-10-24 13:50:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-10-24 13:50:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-10-24 13:50:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-10-24 13:50:37', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 0, 1, '0', '0', 'admin', '2023-10-24 13:50:37', 'admin', '2023-11-02 16:05:30', 'common role');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-11-03 14:21:03', 'admin', '2023-10-24 13:50:37', '', '2023-11-03 14:21:02', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-10-24 13:50:37', 'admin', '2023-10-24 13:50:37', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (101, NULL, 'customer1', 'customer1', '00', '', '', '0', '', '$2a$10$cO6NTD5vEex5eH7SHSy32OiCE2Rm5Ov5UeGIwVYIUYWUtxEYINxm2', '0', '0', '127.0.0.1', '2023-10-26 15:54:17', '', '2023-10-26 14:54:41', '', '2023-10-26 15:54:17', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, '111', '111', '00', '', '', '0', '', '$2a$10$rcO1nJS7gIgemU6zmIcP5O.uq6FPjbm3f.8VM1CGOzgz5KyPts8sK', '0', '0', '127.0.0.1', '2023-11-02 16:05:55', '', '2023-11-02 16:00:00', '', '2023-11-02 16:05:55', NULL);
INSERT INTO `sys_user` VALUES (103, NULL, 'cus1', 'cus1', '00', '', '', '0', '', '$2a$10$yeVim86JziIHih4UTvOcquT0uCtkpzf6pJORP508Hs6mU5vU5sLjy', '0', '0', '127.0.0.1', '2023-11-03 14:20:27', '', '2023-11-03 14:16:26', '', '2023-11-03 14:20:26', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (102, 2);
INSERT INTO `sys_user_role` VALUES (103, 2);

SET FOREIGN_KEY_CHECKS = 1;
