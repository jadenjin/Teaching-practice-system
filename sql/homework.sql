/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : homework

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 21/02/2024 20:27:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments_like
-- ----------------------------
DROP TABLE IF EXISTS `comments_like`;
CREATE TABLE `comments_like`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `liked_id` int NULL DEFAULT NULL COMMENT '被点赞内容ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '点赞' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comments_like
-- ----------------------------
INSERT INTO `comments_like` VALUES (8, 1, 100);
INSERT INTO `comments_like` VALUES (9, 1, 101);
INSERT INTO `comments_like` VALUES (10, 1, 1000);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (4, 'stu_messages', '学生留言表', '', NULL, 'StuMessages', 'crud', 'com.ruoyi.project.homewoek', 'homework', 'stumessages', '学生留言', 'AbuCoder QQ932696181', '0', '/', '{\"parentMenuId\":\"2018\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"留言管理\",\"treeCode\":\"\"}', 'admin', '2022-04-10 12:01:26', '', '2022-04-10 12:06:07', '');
INSERT INTO `gen_table` VALUES (5, 'stu_teaching_material', '教学资料表', '', NULL, 'TeachingMaterial', 'crud', 'com.ruoyi.project.homework', 'homework', 'teachingmaterial', '教学资料', 'AbuCoder QQ932696181', '0', '/', '{\"parentMenuId\":\"2025\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"教学资料\",\"treeCode\":\"\"}', 'admin', '2022-04-10 14:38:31', '', '2022-04-10 14:43:35', '');
INSERT INTO `gen_table` VALUES (6, 'stu_leavehomework', '发布作业表', '', NULL, 'Leavehomework', 'crud', 'com.ruoyi.project.homework', 'homework', 'leavehomework', '发布作业', 'AbuCoder QQ932696181', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"作业管理\",\"treeCode\":\"\"}', 'admin', '2022-04-10 15:00:02', '', '2022-04-10 15:04:40', '');
INSERT INTO `gen_table` VALUES (7, 'stu_hand_in_homework', '写作业表', '', NULL, 'HandInHomework', 'crud', 'com.ruoyi.project.homework', 'homework', 'myhomework', '我的作业', 'AbuCoder QQ932696181', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"作业管理\",\"treeCode\":\"\"}', 'admin', '2022-04-10 15:28:42', '', '2022-04-11 19:51:55', '');
INSERT INTO `gen_table` VALUES (8, 'sys_dept', '部门表', '', NULL, 'Stuclass', 'crud', 'com.ruoyi.project.homework', 'homework', 'stuclass', '班级管理', 'AbuCoder QQ932696181', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"作业管理\",\"treeCode\":\"\"}', 'admin', '2022-04-23 22:04:19', '', '2022-04-23 22:53:08', '');
INSERT INTO `gen_table` VALUES (9, 'stu_question_options', '题目选项表', '', NULL, 'QuestionOptions', 'crud', 'com.ruoyi.project.homework', 'homework', 'questionoptions', '选项管理', 'AbuCoder QQ932696181', '0', '/', '{\"parentMenuId\":\"2048\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"题库管理\",\"treeCode\":\"\"}', 'admin', '2022-04-25 12:05:28', '', '2022-04-25 12:16:45', '');
INSERT INTO `gen_table` VALUES (10, 'stu_question_bank', '题目表', 'stu_question_options', 'qid', 'QuestionBank', 'sub', 'com.ruoyi.project.homework', 'homework', 'questionbank', '题目管理', 'AbuCoder QQ932696181', '0', '/', '{\"parentMenuId\":\"2048\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"题库管理\",\"treeCode\":\"\"}', 'admin', '2022-04-25 12:05:29', '', '2022-05-06 14:20:10', '');
INSERT INTO `gen_table` VALUES (11, 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'com.ruoyi.project.homework', 'homework', 'user', '用户信息', 'AbuCoder QQ932696181', '0', '/', NULL, 'admin', '2022-04-29 22:24:04', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'stu_paper', '试卷表', '', NULL, 'Paper', 'crud', 'com.ruoyi.project.homework', 'homework', 'paper', '试卷管理', 'AbuCoder QQ932696181', '0', '/', '{\"parentMenuId\":\"2048\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"题库管理\",\"treeCode\":\"\"}', 'admin', '2022-05-04 14:02:44', '', '2022-05-04 14:08:13', '');
INSERT INTO `gen_table` VALUES (13, 'stu_answer', '', NULL, NULL, 'Answer', 'crud', 'com.ruoyi.project.homework', 'homework', 'answer', NULL, 'AbuCoder QQ932696181', '0', '/', NULL, 'admin', '2022-05-08 17:38:51', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (19, 'guest_comments', '', NULL, NULL, 'GuestComments', 'crud', 'com.ruoyi.project.homework', 'homework', 'comments', NULL, 'AbuCoder QQ932696181', '0', '/', NULL, 'admin', '2023-01-25 17:07:28', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (20, 'replay_comments', '用户评论表', NULL, NULL, 'ReplayComments', 'crud', 'com.ruoyi.project.homework', 'homework', 'comments', '用户评论', 'AbuCoder QQ932696181', '0', '/', NULL, 'admin', '2023-01-25 17:07:28', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (21, 'comments_like', '点赞', '', NULL, 'CommentsLike', 'crud', 'com.ruoyi.project.homework', 'homework', 'commentslike', '点赞', 'AbuCoder QQ932696181', '0', '/', '{\"parentMenuId\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"\",\"treeCode\":\"\"}', 'admin', '2023-01-27 19:47:22', '', '2023-01-27 19:47:55', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (34, '4', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-04-10 12:01:26', NULL, '2022-04-10 12:06:07');
INSERT INTO `gen_table_column` VALUES (35, '4', 'title', '留言标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2022-04-10 12:01:26', NULL, '2022-04-10 12:06:07');
INSERT INTO `gen_table_column` VALUES (36, '4', 'content', '留言内容', 'text', 'String', 'content', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'summernote', '', 5, 'admin', '2022-04-10 12:01:26', NULL, '2022-04-10 12:06:07');
INSERT INTO `gen_table_column` VALUES (37, '4', 'material', '附件', 'varchar(255)', 'String', 'material', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'upload', '', 6, 'admin', '2022-04-10 12:01:26', NULL, '2022-04-10 12:06:07');
INSERT INTO `gen_table_column` VALUES (38, '4', 'create_time', '留言时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-04-10 12:01:26', NULL, '2022-04-10 12:06:07');
INSERT INTO `gen_table_column` VALUES (39, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-04-10 12:01:26', NULL, '2022-04-10 12:06:07');
INSERT INTO `gen_table_column` VALUES (40, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-04-10 12:01:26', NULL, '2022-04-10 12:06:07');
INSERT INTO `gen_table_column` VALUES (41, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-04-10 12:01:26', NULL, '2022-04-10 12:06:07');
INSERT INTO `gen_table_column` VALUES (42, '4', 'stuname', '留言人', 'varchar(255)', 'String', 'stuname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, '', '2022-04-10 12:03:11', NULL, '2022-04-10 12:06:07');
INSERT INTO `gen_table_column` VALUES (43, '4', 'phone', '联系方式', 'varchar(20)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 3, '', '2022-04-10 12:03:11', NULL, '2022-04-10 12:06:07');
INSERT INTO `gen_table_column` VALUES (44, '5', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-04-10 14:38:31', NULL, '2022-04-10 14:43:35');
INSERT INTO `gen_table_column` VALUES (45, '5', 'title', '资料名称', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-04-10 14:38:31', NULL, '2022-04-10 14:43:35');
INSERT INTO `gen_table_column` VALUES (46, '5', 'content', '资料内容', 'text', 'String', 'content', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'summernote', '', 3, 'admin', '2022-04-10 14:38:31', NULL, '2022-04-10 14:43:35');
INSERT INTO `gen_table_column` VALUES (47, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 5, 'admin', '2022-04-10 14:38:31', NULL, '2022-04-10 14:43:35');
INSERT INTO `gen_table_column` VALUES (48, '5', 'material', '附件', 'varchar(255)', 'String', 'material', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'upload', '', 4, 'admin', '2022-04-10 14:38:31', NULL, '2022-04-10 14:43:35');
INSERT INTO `gen_table_column` VALUES (49, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-04-10 14:38:31', NULL, '2022-04-10 14:43:35');
INSERT INTO `gen_table_column` VALUES (50, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-04-10 14:38:31', NULL, '2022-04-10 14:43:35');
INSERT INTO `gen_table_column` VALUES (51, '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-04-10 14:38:31', NULL, '2022-04-10 14:43:35');
INSERT INTO `gen_table_column` VALUES (52, '6', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (53, '6', 'teacher_id', '教师id', 'varchar(20)', 'String', 'teacherId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (54, '6', 'teacher_name', '教师姓名', 'varchar(20)', 'String', 'teacherName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (55, '6', 'course_name', '课程名称', 'varchar(20)', 'String', 'courseName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (56, '6', 'title', '作业标题', 'varchar(100)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (57, '6', 'content', '作业内容', 'text', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'summernote', '', 9, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (58, '6', 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (59, '6', 'end_time', '截止时间', 'datetime', 'Date', 'endTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (60, '6', 'material', '附件', 'varchar(255)', 'String', 'material', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (61, '6', 'remark', '备注信息', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (62, '6', 'status', '状态(0开始，1结束)', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 's_homework_status', 14, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (63, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 15, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (64, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 16, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (65, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 17, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (66, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', NULL, 18, 'admin', '2022-04-10 15:00:02', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (68, '7', 'student_id', '学生id', 'varchar(20)', 'String', 'studentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-04-10 15:28:42', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (69, '7', 'student_name', '学生姓名', 'varchar(20)', 'String', 'studentName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-04-10 15:28:42', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (70, '7', 'homework_id', '作业id', 'bigint(20)', 'Long', 'homeworkId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-04-10 15:28:42', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (71, '7', 'homework_title', '作业标题', 'varchar(100)', 'String', 'homeworkTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-04-10 15:28:42', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (72, '7', 'homework_content', '作业内容', 'varchar(2000)', 'String', 'homeworkContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'summernote', '', 13, 'admin', '2022-04-10 15:28:42', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (73, '7', 'create_time', '提交时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 14, 'admin', '2022-04-10 15:28:42', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (74, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 15, 'admin', '2022-04-10 15:28:42', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (75, '7', 'homework_score', '主观分', 'decimal(11,2)', 'BigDecimal', 'homeworkScore', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2022-04-10 15:28:42', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (76, '7', 'material', '附件', 'varchar(255)', 'String', 'material', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2022-04-10 15:28:42', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (77, '7', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 19, 'admin', '2022-04-10 15:28:42', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (78, '7', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', NULL, 20, 'admin', '2022-04-10 15:28:42', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (80, '7', 'teacher_name', '教师姓名', 'varchar(20)', 'String', 'teacherName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, '', '2022-04-10 17:06:51', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (81, '7', 'course_name', '课程名称', 'varchar(255)', 'String', 'courseName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 10, '', '2022-04-10 17:06:51', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (82, '7', 'state', '作业状态', 'varchar(10)', 'String', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'stu_homework_state', 21, '', '2022-04-10 18:36:44', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (83, '7', 'mark_man', '批阅人', 'varchar(255)', 'String', 'markMan', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, '', '2022-04-10 20:38:59', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (84, '7', 'mark_time', '批改时间', 'datetime', 'Date', 'markTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 23, '', '2022-04-10 20:38:59', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (85, '6', 'stuclass_id', '班级', 'varchar(10)', 'String', 'stuclassId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2022-04-11 13:14:50', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (86, '7', 'remark', '批阅意见', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 24, '', '2022-04-11 14:31:59', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (88, '7', 'class_id', '班级', 'varchar(10)', 'String', 'classId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2022-04-11 17:16:05', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (89, '7', 'hid', '主键', 'bigint(20)', 'Long', 'hid', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, '', '2022-04-11 19:10:05', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (90, '8', 'dept_id', '部门id', 'bigint(20)', 'Long', 'deptId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (91, '8', 'parent_id', '父部门id', 'bigint(20)', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (92, '8', 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (93, '8', 'dept_name', '部门名称', 'varchar(30)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (94, '8', 'dept_type', '部门类型', 'varchar(30)', 'String', 'deptType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'depttype', 5, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (95, '8', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (96, '8', 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (97, '8', 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (98, '8', 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (99, '8', 'status', '部门状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (100, '8', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (101, '8', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (102, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (103, '8', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (104, '8', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2022-04-23 22:04:19', NULL, '2022-04-23 22:53:08');
INSERT INTO `gen_table_column` VALUES (105, '9', 'optionId', '选项编号', 'int(11)', 'Long', 'optionId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-04-25 12:05:28', NULL, '2022-05-05 21:11:45');
INSERT INTO `gen_table_column` VALUES (107, '9', 'optionContent', '选项内容', 'varchar(255)', 'String', 'optionContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'summernote', '', 3, 'admin', '2022-04-25 12:05:28', NULL, '2022-05-05 21:11:45');
INSERT INTO `gen_table_column` VALUES (108, '9', 'optionTag', '选项标识符（ABCDE）', 'varchar(1)', 'String', 'optionTag', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-04-25 12:05:28', NULL, '2022-05-05 21:11:45');
INSERT INTO `gen_table_column` VALUES (109, '9', 'correctAnswerStatus', '正确答案状态（0：正确、1：错误）', 'varchar(255)', 'String', 'correctAnswerStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'correctAnswerStatus', 5, 'admin', '2022-04-25 12:05:28', NULL, '2022-05-05 21:11:45');
INSERT INTO `gen_table_column` VALUES (110, '9', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 6, 'admin', '2022-04-25 12:05:28', NULL, '2022-05-05 21:11:45');
INSERT INTO `gen_table_column` VALUES (111, '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 7, 'admin', '2022-04-25 12:05:29', NULL, '2022-05-05 21:11:45');
INSERT INTO `gen_table_column` VALUES (112, '9', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', NULL, 8, 'admin', '2022-04-25 12:05:29', NULL, '2022-05-05 21:11:45');
INSERT INTO `gen_table_column` VALUES (113, '9', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 9, 'admin', '2022-04-25 12:05:29', NULL, '2022-05-05 21:11:45');
INSERT INTO `gen_table_column` VALUES (114, '9', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-04-25 12:05:29', NULL, '2022-05-05 21:11:45');
INSERT INTO `gen_table_column` VALUES (116, '10', 'questions', '题目名称', 'varchar(255)', 'String', 'questions', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-04-25 12:05:29', NULL, '2022-05-06 14:20:10');
INSERT INTO `gen_table_column` VALUES (118, '10', 'scores', '试题分值', 'decimal(11,2)', 'BigDecimal', 'scores', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-04-25 12:05:29', NULL, '2022-05-06 14:20:10');
INSERT INTO `gen_table_column` VALUES (119, '10', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-04-25 12:05:29', NULL, '2022-05-06 14:20:10');
INSERT INTO `gen_table_column` VALUES (120, '10', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-04-25 12:05:29', NULL, '2022-05-06 14:20:10');
INSERT INTO `gen_table_column` VALUES (121, '10', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-04-25 12:05:29', NULL, '2022-05-06 14:20:10');
INSERT INTO `gen_table_column` VALUES (122, '10', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-04-25 12:05:29', NULL, '2022-05-06 14:20:10');
INSERT INTO `gen_table_column` VALUES (123, '10', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-04-25 12:05:29', NULL, '2022-05-06 14:20:10');
INSERT INTO `gen_table_column` VALUES (124, '6', 'stuclas_sname', '班级名称', 'varchar(10)', 'String', 'stuclasSname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, '', '2022-04-25 16:42:10', NULL, '2022-05-06 15:18:51');
INSERT INTO `gen_table_column` VALUES (125, '7', 'stuclas_sname', '班级名称', 'varchar(10)', 'String', 'stuclasSname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, '', '2022-04-26 15:44:28', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (126, '7', 'teacherr_id', '教师id', 'varchar(20)', 'String', 'teacherrId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2022-04-29 20:39:11', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (127, '7', 'student_content', '作业内容', 'varchar(2000)', 'String', 'studentContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'summernote', '', 12, '', '2022-04-29 20:39:11', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (128, '11', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (129, '11', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (130, '11', 'login_name', '登录账号', 'varchar(30)', 'String', 'loginName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (131, '11', 'user_name', '用户昵称', 'varchar(30)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (132, '11', 'user_type', '用户类型（00系统用户 01注册用户）', 'varchar(10)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (133, '11', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (134, '11', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (135, '11', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (136, '11', 'avatar', '头像路径', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (137, '11', 'password', '密码', 'varchar(50)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (138, '11', 'salt', '盐加密', 'varchar(20)', 'String', 'salt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (139, '11', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 12, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (140, '11', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (141, '11', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (142, '11', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (143, '11', 'pwd_update_date', '密码最后更新时间', 'datetime', 'Date', 'pwdUpdateDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (144, '11', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (145, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (146, '11', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (147, '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (148, '11', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 21, 'admin', '2022-04-29 22:24:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, '12', 'paperid', '试卷ID', 'int(20)', 'Long', 'paperid', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-05-04 14:02:44', NULL, '2022-05-04 14:08:13');
INSERT INTO `gen_table_column` VALUES (150, '12', 'paper_title', '试卷标题', 'varchar(255)', 'String', 'paperTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-05-04 14:02:44', NULL, '2022-05-04 14:08:13');
INSERT INTO `gen_table_column` VALUES (151, '12', 'paper_type', '试卷类型', 'int(2)', 'Integer', 'paperType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'papertype', 3, 'admin', '2022-05-04 14:02:44', NULL, '2022-05-04 14:08:13');
INSERT INTO `gen_table_column` VALUES (152, '12', 'paper_resources', '试卷来源', 'varchar(20)', 'String', 'paperResources', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-05-04 14:02:44', NULL, '2022-05-04 14:08:13');
INSERT INTO `gen_table_column` VALUES (153, '12', 'state', '状态', 'int(1)', 'Integer', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'paperstate', 5, 'admin', '2022-05-04 14:02:44', NULL, '2022-05-04 14:08:13');
INSERT INTO `gen_table_column` VALUES (154, '12', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-05-04 14:02:44', NULL, '2022-05-04 14:08:13');
INSERT INTO `gen_table_column` VALUES (155, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-05-04 14:02:44', NULL, '2022-05-04 14:08:13');
INSERT INTO `gen_table_column` VALUES (156, '12', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-05-04 14:02:44', NULL, '2022-05-04 14:08:13');
INSERT INTO `gen_table_column` VALUES (157, '12', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-05-04 14:02:44', NULL, '2022-05-04 14:08:13');
INSERT INTO `gen_table_column` VALUES (158, '12', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-05-04 14:02:44', NULL, '2022-05-04 14:08:13');
INSERT INTO `gen_table_column` VALUES (159, '10', 'paperid', '试卷ID', 'int(20)', 'Long', 'paperid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2022-05-05 17:26:32', NULL, '2022-05-06 14:20:10');
INSERT INTO `gen_table_column` VALUES (161, '9', 'qid', '题目编号', 'int(11)', 'Long', 'qid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2022-05-05 20:03:08', NULL, '2022-05-05 21:11:45');
INSERT INTO `gen_table_column` VALUES (162, '10', 'questionid', '题目ID', 'int(20)', 'Long', 'questionid', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '', '2022-05-05 21:11:30', NULL, '2022-05-06 14:20:10');
INSERT INTO `gen_table_column` VALUES (163, '10', 'questiontype', '题目类型（0：单选题、1：多选题、2：简答题）', 'int(2)', 'Integer', 'questiontype', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'questionType', 4, '', '2022-05-05 21:11:30', NULL, '2022-05-06 14:20:10');
INSERT INTO `gen_table_column` VALUES (164, '7', 'paperid', '试卷ID', 'int(20)', 'Long', 'paperid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2022-05-06 15:12:34', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (165, '6', 'paperid', '试卷ID', 'int(20)', 'Long', 'paperid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2022-05-06 15:18:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (166, '13', 'id', 'ID', 'int(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (167, '13', 'stucalssid', '班级ID', 'varchar(50)', 'String', 'stucalssid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (168, '13', 'teacherid', '教师ID', 'varchar(50)', 'String', 'teacherid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (169, '13', 'paperid', '试卷ID', 'int(20)', 'Long', 'paperid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (170, '13', 'questionid', '题目ID', 'int(20)', 'Long', 'questionid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (171, '13', 'question', '题目', 'varchar(255)', 'String', 'question', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (172, '13', 'answer', '答案', 'int(255)', 'String', 'answer', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (173, '13', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 13, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (174, '13', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 14, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (175, '13', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', NULL, 15, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (176, '13', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 16, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (177, '13', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 17, 'admin', '2022-05-08 17:38:51', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (178, '13', 'optionid', '答案ID', 'int(20)', 'Long', 'optionid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2022-05-08 18:53:11', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (179, '13', 'student_id', '学生id', 'varchar(20)', 'String', 'studentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2022-05-08 20:02:58', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (180, '13', 'student_name', '学生姓名', 'varchar(20)', 'String', 'studentName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, '', '2022-05-08 20:02:58', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (181, '13', 'correctAnswerStatus', '正确答案状态（0：正确、1：错误）', 'varchar(255)', 'String', 'correctAnswerStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 12, '', '2022-05-08 20:02:58', NULL, '2022-05-08 23:10:35');
INSERT INTO `gen_table_column` VALUES (182, '7', 'allscores', '作业总分', 'decimal(11,2)', 'BigDecimal', 'allscores', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, '', '2022-05-08 22:39:44', NULL, '2022-05-08 22:47:03');
INSERT INTO `gen_table_column` VALUES (183, '7', 'radioscore', '客观分', 'decimal(11,2)', 'BigDecimal', 'radioscore', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 25, '', '2022-05-08 22:47:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (184, '13', 'homeworkid', '作业ID', 'varchar(20)', 'String', 'homeworkid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2022-05-08 23:10:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (238, '19', 'id', '', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:31');
INSERT INTO `gen_table_column` VALUES (239, '19', 'user_id', '用户ID', 'int(11)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:31');
INSERT INTO `gen_table_column` VALUES (240, '19', 'guest_id', '留言ID', 'int(11)', 'Long', 'guestId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:31');
INSERT INTO `gen_table_column` VALUES (241, '19', 'content', '留言内容', 'varchar(2048)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'summernote', '', 4, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:31');
INSERT INTO `gen_table_column` VALUES (242, '19', 'create_time', '留言时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 5, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:31');
INSERT INTO `gen_table_column` VALUES (243, '19', 'user_name', '用户昵称', 'varchar(20)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:31');
INSERT INTO `gen_table_column` VALUES (244, '20', 'id', 'ID', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:33');
INSERT INTO `gen_table_column` VALUES (245, '20', 'guest_id', '留言ID', 'int(11)', 'Long', 'guestId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:33');
INSERT INTO `gen_table_column` VALUES (246, '20', 'comment_id', '评论ID', 'int(11)', 'Long', 'commentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:33');
INSERT INTO `gen_table_column` VALUES (247, '20', 'replay_user_id', '回复者ID', 'int(11)', 'Long', 'replayUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:34');
INSERT INTO `gen_table_column` VALUES (248, '20', 'replied_user_id', '被回复者ID', 'int(11)', 'Long', 'repliedUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:34');
INSERT INTO `gen_table_column` VALUES (249, '20', 'content', '回复内容', 'varchar(2048)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'summernote', '', 6, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:34');
INSERT INTO `gen_table_column` VALUES (250, '20', 'create_time', '回复时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 7, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:34');
INSERT INTO `gen_table_column` VALUES (251, '20', 'replyed_user_name', '被回复者昵称', 'varchar(20)', 'String', 'replyedUserName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:34');
INSERT INTO `gen_table_column` VALUES (252, '20', 'reply_user_name', '回复者昵称', 'varchar(20)', 'String', 'replyUserName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 9, 'admin', '2023-01-25 17:07:28', NULL, '2023-01-27 18:42:34');
INSERT INTO `gen_table_column` VALUES (253, '19', 'like', '点赞', 'int(20)', 'Long', 'like', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, '', '2023-01-27 18:42:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (254, '20', 'like', '点赞', 'int(20)', 'Long', 'like', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, '', '2023-01-27 18:42:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (255, '21', 'id', 'ID', 'int(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-27 19:47:22', NULL, '2023-01-27 19:47:55');
INSERT INTO `gen_table_column` VALUES (256, '21', 'user_id', '用户ID', 'int(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-01-27 19:47:22', NULL, '2023-01-27 19:47:55');
INSERT INTO `gen_table_column` VALUES (257, '21', 'liked_id', '被点赞内容ID', 'int(20)', 'Long', 'likedId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-27 19:47:22', NULL, '2023-01-27 19:47:55');

-- ----------------------------
-- Table structure for guest_comments
-- ----------------------------
DROP TABLE IF EXISTS `guest_comments`;
CREATE TABLE `guest_comments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户ID',
  `guest_id` int NOT NULL COMMENT '留言ID',
  `content` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '留言内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `user_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `like` int NULL DEFAULT 0 COMMENT '点赞',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of guest_comments
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000179C1AABDD878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000179C1AABDD878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000179C1AABDD878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-JCM6ESO1622594101122', 1622595365169, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `int_prop_1` int NULL DEFAULT NULL,
  `int_prop_2` int NULL DEFAULT NULL,
  `long_prop_1` bigint NULL DEFAULT NULL,
  `long_prop_2` bigint NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint NULL DEFAULT NULL,
  `prev_fire_time` bigint NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1622594110000, -1, 5, 'PAUSED', 'CRON', 1622594101000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1622594115000, -1, 5, 'PAUSED', 'CRON', 1622594101000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1622594120000, -1, 5, 'PAUSED', 'CRON', 1622594101000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for replay_comments
-- ----------------------------
DROP TABLE IF EXISTS `replay_comments`;
CREATE TABLE `replay_comments`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `guest_id` int NOT NULL COMMENT '留言ID',
  `comment_id` int NOT NULL COMMENT '评论ID',
  `replay_user_id` int NOT NULL COMMENT '回复者ID',
  `replied_user_id` int NOT NULL COMMENT '被回复者ID',
  `content` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '回复内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  `replyed_user_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '被回复者昵称',
  `reply_user_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '回复者昵称',
  `like` int NULL DEFAULT 0 COMMENT '点赞',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of replay_comments
-- ----------------------------

-- ----------------------------
-- Table structure for stu_answer
-- ----------------------------
DROP TABLE IF EXISTS `stu_answer`;
CREATE TABLE `stu_answer`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `homeworkid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作业ID',
  `student_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生id',
  `student_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `stucalssid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级ID',
  `teacherid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师ID',
  `paperid` int NULL DEFAULT NULL COMMENT '试卷ID',
  `questionid` int NULL DEFAULT NULL COMMENT '题目ID',
  `optionid` int NULL DEFAULT NULL COMMENT '答案ID',
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '题目',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答案',
  `correctAnswerStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '正确答案状态（0：正确、1：错误）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生客观题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_answer
-- ----------------------------
INSERT INTO `stu_answer` VALUES (10, '12', 'wt', '王涛', '103', 'abu', 1, 12, 34, 'JavaScript是运行在(  )的脚本语言？', '客户端', '0', 'wt', '2022-05-10 12:45:40', '', NULL, NULL);
INSERT INTO `stu_answer` VALUES (11, '12', 'wt', '王涛', '103', 'abu', 1, 13, 42, 'setTimeout(\"buy( )\",20)表示的意思是？', '间隔20分钟后，buy( )函数被调用一次', '1', 'wt', '2022-05-10 12:45:40', '', NULL, NULL);
INSERT INTO `stu_answer` VALUES (12, '12', 'wt', '王涛', '103', 'abu', 1, 14, 51, '在JavaScript中，能使文本框失去焦点的方法是？', 'blur( )', '0', 'wt', '2022-05-10 12:45:40', '', NULL, NULL);

-- ----------------------------
-- Table structure for stu_comment
-- ----------------------------
DROP TABLE IF EXISTS `stu_comment`;
CREATE TABLE `stu_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名称',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `foreign_id` int NULL DEFAULT NULL COMMENT '学生留言模块的id',
  `pid` int NULL DEFAULT NULL COMMENT '父级评论id',
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '回复对象',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_comment
-- ----------------------------
INSERT INTO `stu_comment` VALUES (13, '测试数据库', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (14, '穿裤子', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (15, 'dsa', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (16, 'DASD', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (17, 'DSADSA', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (18, '1', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (19, '111', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (20, 'dea', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (21, '1', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (22, 'njknjk', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (23, '11', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (24, '111', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (25, '1', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (26, '1', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (27, '1', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (28, '1', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (29, 'nlnl', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (30, '1', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (31, '1', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (32, 'dsa', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (33, '1', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (34, '1', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (35, '7', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);
INSERT INTO `stu_comment` VALUES (36, '7', '张三', 1, 1, NULL, NULL, '', '2023-01-25 15:30:10', '', NULL, NULL);

-- ----------------------------
-- Table structure for stu_hand_in_homework
-- ----------------------------
DROP TABLE IF EXISTS `stu_hand_in_homework`;
CREATE TABLE `stu_hand_in_homework`  (
  `hid` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生id',
  `student_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `class_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级',
  `stuclas_sname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `teacherr_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师id',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师姓名',
  `homework_id` bigint NULL DEFAULT NULL COMMENT '作业id',
  `paperid` int NULL DEFAULT NULL COMMENT '试卷ID',
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `homework_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作业标题',
  `student_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作业内容',
  `homework_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作业内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '提交时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `homework_score` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '主观分',
  `allscores` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '作业总分',
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '待批阅' COMMENT '作业状态',
  `mark_man` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批阅人',
  `mark_time` datetime NULL DEFAULT NULL COMMENT '批改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批阅意见',
  `radioscore` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '客观分',
  PRIMARY KEY (`hid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '写作业表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_hand_in_homework
-- ----------------------------
INSERT INTO `stu_hand_in_homework` VALUES (6, 'wtt', '王婷婷', '103', 'A班', 'abu', '阿卜', 13, NULL, NULL, '请证明为什么1+1=2.认真作答下；', '<p>1+1为什么等于2呢？你们有思考过么？</p>', '<p>老师啊，你太无聊了吧，不知道，自己去证明玩吧，呵呵呵</p>', '2022-05-10 12:26:22', '2022-05-10 12:28:17', 20.00, 20.00, '', 'wtt', '阿卜', '已批阅', '阿卜', '2022-05-10 12:28:17', '你这，唉，不知道探索一下么。真的是，算了！！！', 0.00);
INSERT INTO `stu_hand_in_homework` VALUES (7, 'wt', '王涛', '103', 'A班', 'abu', '阿卜', 12, 1, NULL, '背诵阿房宫赋，并做下在线选择题！', '<p>背诵阿房宫赋，并做下在线选择题！<br></p>', '<p>做完啦啦啦啦啦</p>', '2022-05-10 12:45:40', '2022-05-10 12:51:59', 47.50, 54.50, '', 'wt', '阿卜', '已批阅', '阿卜', '2022-05-10 12:51:59', '非常好哦！超级赞！！！！', 7.00);

-- ----------------------------
-- Table structure for stu_leavehomework
-- ----------------------------
DROP TABLE IF EXISTS `stu_leavehomework`;
CREATE TABLE `stu_leavehomework`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `teacher_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师id',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师姓名',
  `stuclass_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级',
  `paperid` int NULL DEFAULT NULL COMMENT '试卷ID',
  `stuclas_sname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `course_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作业标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '作业内容',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '截止时间',
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态(0开始，1结束)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布作业表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_leavehomework
-- ----------------------------
INSERT INTO `stu_leavehomework` VALUES (12, 'abu', '阿卜', '103', 1, 'A班', NULL, '背诵阿房宫赋，并做下在线选择题！', '<p>背诵阿房宫赋，并做下在线选择题！<br></p>', '2022-05-09 10:00:57', '2022-07-01 10:00:57', '', NULL, '0', '2022-05-09 10:04:53', NULL, 'abu', NULL);
INSERT INTO `stu_leavehomework` VALUES (13, 'abu', '阿卜', '103', NULL, 'A班', NULL, '请证明为什么1+1=2.认真作答下；', '<p>1+1为什么等于2呢？你们有思考过么？</p>', '2022-05-10 09:52:28', '2022-12-01 09:50:13', '', NULL, '0', '2022-05-10 09:52:47', NULL, 'abu', NULL);

-- ----------------------------
-- Table structure for stu_messages
-- ----------------------------
DROP TABLE IF EXISTS `stu_messages`;
CREATE TABLE `stu_messages`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stuname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '留言内容',
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生留言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_messages
-- ----------------------------

-- ----------------------------
-- Table structure for stu_paper
-- ----------------------------
DROP TABLE IF EXISTS `stu_paper`;
CREATE TABLE `stu_paper`  (
  `paperid` int NOT NULL AUTO_INCREMENT COMMENT '试卷ID',
  `paper_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷标题',
  `paper_type` int NULL DEFAULT 0 COMMENT '试卷类型',
  `paper_resources` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷来源',
  `state` int NULL DEFAULT 0 COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`paperid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试卷表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_paper
-- ----------------------------

-- ----------------------------
-- Table structure for stu_question_bank
-- ----------------------------
DROP TABLE IF EXISTS `stu_question_bank`;
CREATE TABLE `stu_question_bank`  (
  `questionid` int NOT NULL AUTO_INCREMENT COMMENT '题目ID',
  `paperid` int NULL DEFAULT NULL COMMENT '试卷ID',
  `questions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '题目名称',
  `questiontype` int NULL DEFAULT NULL COMMENT '题目类型（0：单选题、1：多选题、2：简答题）',
  `scores` decimal(11, 2) NULL DEFAULT NULL COMMENT '试题分值',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`questionid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '题目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_question_bank
-- ----------------------------
INSERT INTO `stu_question_bank` VALUES (12, 1, 'JavaScript是运行在(  )的脚本语言？', 0, 5.00, '', '2022-05-06 14:15:00', '', '2022-05-06 14:15:25', '');
INSERT INTO `stu_question_bank` VALUES (13, 1, 'setTimeout(\"buy( )\",20)表示的意思是？', 0, 2.00, '', '2022-05-06 14:18:12', '', '2022-05-06 14:19:05', '');
INSERT INTO `stu_question_bank` VALUES (14, 1, '在JavaScript中，能使文本框失去焦点的方法是？', 0, 2.00, '', '2022-05-06 14:23:26', '', '2022-05-06 14:23:35', '');
INSERT INTO `stu_question_bank` VALUES (15, 2, '在Javascript中，运行Math.ceil();的结果是？？', 0, 2.00, '', '2022-05-06 14:24:48', '', '2022-05-06 14:26:45', '');
INSERT INTO `stu_question_bank` VALUES (16, 2, '在JavaScript中(  )方法可以对数组元素进行排序？', 0, 2.00, '', '2022-05-06 14:26:30', '', '2022-05-06 14:28:01', '');
INSERT INTO `stu_question_bank` VALUES (17, 2, '在JavaScript中，把字符串“123”转换为整型值123的正确方法是?', 0, 2.00, '', '2022-05-06 14:27:55', '', '2022-05-06 14:28:04', '');

-- ----------------------------
-- Table structure for stu_question_options
-- ----------------------------
DROP TABLE IF EXISTS `stu_question_options`;
CREATE TABLE `stu_question_options`  (
  `optionId` int NOT NULL AUTO_INCREMENT COMMENT '选项编号',
  `qid` int NULL DEFAULT NULL COMMENT '题目编号',
  `optionContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选项内容',
  `optionTag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选项标识符（ABCDE）',
  `correctAnswerStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '正确答案状态（0：正确、1：错误）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`optionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '题目选项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_question_options
-- ----------------------------
INSERT INTO `stu_question_options` VALUES (33, 12, '服务器端', 'A', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (34, 12, '客户端', 'B', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (35, 12, '在服务器运行后，把结果返回到客户端', 'C', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (36, 12, '在客户端运行后，把结果返回到服务端', 'D', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (41, 13, '间隔20秒后，buy( )函数被调用一次', 'A', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (42, 13, '间隔20分钟后，buy( )函数被调用一次', 'B', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (43, 13, '间隔20毫秒后，buy( )函数被调用一次', 'C', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (44, 13, 'buy( )函数被持续调用20次', 'D', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (49, 14, 'onblur( )', 'A', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (50, 14, 'focus( )', 'B', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (51, 14, 'blur( )', 'C', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (52, 14, 'leave( )', 'D', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (61, 15, '24', 'A', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (62, 15, '25', 'B', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (63, 15, '25.5', 'C', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (64, 15, '26', 'D', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (69, 16, 'add()', 'A', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (70, 16, 'join()', 'B', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (71, 16, 'sort()', 'C', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (72, 16, 'length( )', 'D', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (73, 17, 'var str=\"123\";var num=(int)str;', 'A', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (74, 17, 'var str=\"123\";var num=str.parseInt(str);', 'B', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (75, 17, 'var str=\"123\";var num=parseInt(str);', 'C', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stu_question_options` VALUES (76, 17, 'var str=\"123\";var num=Integer.parseInt(str);', 'D', '1', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for stu_teaching_material
-- ----------------------------
DROP TABLE IF EXISTS `stu_teaching_material`;
CREATE TABLE `stu_teaching_material`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资料名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '资料内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教学资料表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_teaching_material
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-05-31 17:04:22', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-05-31 17:04:22', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-05-31 17:04:22', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-05-31 17:04:22', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-05-31 17:04:22', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-05-31 17:04:22', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-05-31 17:04:22', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-05-31 17:04:22', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2021-05-31 17:04:22', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `dept_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门类型',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '金陵科技学院', '学校', 0, '阿卜', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-31 17:04:18', 'admin', '2022-04-23 22:23:10');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '网络安全学院', '学院', 1, '阿卜', '13000000000', 'ry@qq.com', '0', '0', 'admin', '2021-05-31 17:04:18', 'admin', '2022-04-23 22:23:10');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', 'A班', '班级', 1, 'A班主任', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-31 17:04:18', 'admin', '2022-04-23 22:23:10');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', 'B班', '班级', 2, 'B班主任', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-05-31 17:04:18', 'admin', '2022-04-23 22:23:15');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-05-31 17:04:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '语文', 'yw', 's_course_name', NULL, NULL, 'Y', '0', 'admin', '2021-06-01 09:47:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 2, '数学', 'sx', 's_course_name', NULL, NULL, 'Y', '0', 'admin', '2021-06-01 09:47:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 3, '外语', 'wy', 's_course_name', NULL, NULL, 'Y', '0', 'admin', '2021-06-01 09:47:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 1, '开始', '0', 's_homework_status', '', 'info', 'Y', '0', 'admin', '2021-06-01 10:24:48', 'admin', '2021-06-01 10:25:26', '作业开始');
INSERT INTO `sys_dict_data` VALUES (34, 2, '结束', '1', 's_homework_status', '', 'danger', 'Y', '0', 'admin', '2021-06-01 10:25:08', 'admin', '2021-06-01 10:25:36', '作业结束');
INSERT INTO `sys_dict_data` VALUES (35, 1, '待批阅', '待批阅', 'stu_homework_state', '', 'primary', 'Y', '0', 'admin', '2022-04-10 18:38:38', 'admin', '2022-04-10 20:45:45', '');
INSERT INTO `sys_dict_data` VALUES (36, 2, '已批阅', '已批阅', 'stu_homework_state', '', 'danger', 'Y', '0', 'admin', '2022-04-10 18:38:59', 'admin', '2022-04-10 20:47:00', '');
INSERT INTO `sys_dict_data` VALUES (37, 1, '学校', '学校', 'depttype', NULL, 'primary', 'Y', '0', 'admin', '2022-04-23 22:03:37', '', NULL, '学校');
INSERT INTO `sys_dict_data` VALUES (38, 2, '学院', '学院', 'depttype', NULL, 'success', 'Y', '0', 'admin', '2022-04-23 22:03:50', '', NULL, '学院');
INSERT INTO `sys_dict_data` VALUES (39, 3, '班级', '班级', 'depttype', NULL, 'info', 'Y', '0', 'admin', '2022-04-23 22:04:02', '', NULL, '班级');
INSERT INTO `sys_dict_data` VALUES (40, 1, '单选题', '0', 'questionType', '', 'primary', 'Y', '0', 'admin', '2022-04-25 12:09:33', 'admin', '2022-04-25 12:10:25', '单选');
INSERT INTO `sys_dict_data` VALUES (41, 2, '多选题', '1', 'questionType', '', 'success', 'Y', '0', 'admin', '2022-04-25 12:09:50', 'admin', '2022-04-25 12:10:20', '多选');
INSERT INTO `sys_dict_data` VALUES (42, 3, '判断题', '2', 'questionType', '', 'danger', 'Y', '0', 'admin', '2022-04-25 12:10:15', 'admin', '2022-04-25 12:10:39', '判断题');
INSERT INTO `sys_dict_data` VALUES (43, 1, '正确', '0', 'correctAnswerStatus', NULL, 'primary', 'Y', '0', 'admin', '2022-04-25 12:13:04', '', NULL, '正确状态');
INSERT INTO `sys_dict_data` VALUES (44, 2, '错误', '1', 'correctAnswerStatus', NULL, 'danger', 'Y', '0', 'admin', '2022-04-25 12:13:33', '', NULL, '错误状态');
INSERT INTO `sys_dict_data` VALUES (45, 1, '系统用户', '00', 'sysusertype', NULL, NULL, 'Y', '0', 'admin', '2022-04-29 22:25:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (46, 2, '注册用户', '01', 'sysusertype', NULL, NULL, 'Y', '0', 'admin', '2022-04-29 22:26:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (47, 3, '学生', '3', 'sysusertype', NULL, NULL, 'Y', '0', 'admin', '2022-04-29 22:26:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (48, 4, '老师', '4', 'sysusertype', NULL, NULL, 'Y', '0', 'admin', '2022-04-29 22:26:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (49, 5, '管理员', '5', 'sysusertype', NULL, NULL, 'Y', '0', 'admin', '2022-04-29 22:28:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (50, 1, '作业', '0', 'papertype', NULL, 'primary', 'Y', '0', 'admin', '2022-05-04 14:05:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (51, 2, '检测', '1', 'papertype', NULL, 'success', 'Y', '0', 'admin', '2022-05-04 14:05:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (52, 2, '开启', '0', 'paperstate', '', 'primary', 'Y', '0', 'admin', '2022-05-04 14:06:29', 'admin', '2022-05-06 14:18:42', '开启');
INSERT INTO `sys_dict_data` VALUES (53, 1, '关闭', '1', 'paperstate', '', 'danger', 'Y', '0', 'admin', '2022-05-04 14:06:46', 'admin', '2022-05-06 14:18:52', '关闭');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-05-31 17:04:21', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-05-31 17:04:21', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-05-31 17:04:21', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-05-31 17:04:21', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-05-31 17:04:21', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-05-31 17:04:21', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-05-31 17:04:21', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-05-31 17:04:21', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-05-31 17:04:21', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-05-31 17:04:21', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '课程名称', 's_course_name', '0', 'admin', '2021-06-01 09:46:06', '', NULL, '课程名称');
INSERT INTO `sys_dict_type` VALUES (12, '作业状态', 's_homework_status', '0', 'admin', '2021-06-01 10:24:23', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (13, '学生作业状态', 'stu_homework_state', '0', 'admin', '2022-04-10 18:34:45', '', NULL, '学生作业状态');
INSERT INTO `sys_dict_type` VALUES (14, '部门类型', 'depttype', '0', 'admin', '2022-04-23 22:03:17', '', NULL, '部门类型');
INSERT INTO `sys_dict_type` VALUES (15, '题目类型', 'questionType', '0', 'admin', '2022-04-25 12:09:08', '', NULL, '题目类型');
INSERT INTO `sys_dict_type` VALUES (16, '答案正确状态', 'correctAnswerStatus', '0', 'admin', '2022-04-25 12:11:11', '', NULL, '答案正确状态');
INSERT INTO `sys_dict_type` VALUES (17, '用户类型', 'sysusertype', '0', 'admin', '2022-04-29 22:24:46', '', NULL, '用户类型');
INSERT INTO `sys_dict_type` VALUES (18, '试卷类型', 'papertype', '0', 'admin', '2022-05-04 14:04:41', '', NULL, '试卷类型');
INSERT INTO `sys_dict_type` VALUES (19, '试卷状态', 'paperstate', '0', 'admin', '2022-05-04 14:06:09', '', NULL, '试卷状态');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-05-31 17:04:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-05-31 17:04:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-05-31 17:04:23', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 616 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-21 20:19:36');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-21 20:21:53');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-21 20:21:58');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-21 20:22:30');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-21 20:22:33');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-02-21 20:22:59');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-21 20:23:29');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-21 20:24:03');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-21 20:24:15');
INSERT INTO `sys_logininfor` VALUES (10, 'padmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-02-21 20:24:23');
INSERT INTO `sys_logininfor` VALUES (11, 'padmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误2次', '2024-02-21 20:24:30');
INSERT INTO `sys_logininfor` VALUES (12, 'padmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-21 20:24:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2071 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-06-03 18:35:06', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2021-06-03 18:35:06', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-06-03 18:35:06', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-06-03 18:35:06', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-06-03 18:35:06', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-06-03 18:35:06', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '班级管理', 1, 4, '/system/dept', 'menuItem', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-06-03 18:35:06', 'admin', '2022-04-11 15:15:12', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-06-03 18:35:06', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-06-03 18:35:06', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-06-03 18:35:07', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-06-03 18:35:07', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-06-03 18:35:07', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-06-03 18:35:07', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-06-03 18:35:07', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-06-03 18:35:07', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-06-03 18:35:07', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-06-03 18:35:07', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-06-03 18:35:07', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-06-03 18:35:07', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-06-03 18:35:07', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-06-03 18:35:07', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-06-03 18:35:07', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-06-03 18:35:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-06-03 18:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-06-03 18:35:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '作业管理', 0, 6, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-address-card-o', 'admin', '2021-06-04 21:41:01', 'admin', '2022-04-10 14:41:09', '');
INSERT INTO `sys_menu` VALUES (2018, '留言管理', 0, 5, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-envelope-open', 'admin', '2022-04-10 12:05:37', 'admin', '2022-04-10 14:42:47', '');
INSERT INTO `sys_menu` VALUES (2019, '留言', 2018, 1, '/homework/stumessages', '', 'C', '0', '1', 'homework:stumessages:view', '#', 'admin', '2022-04-10 13:54:18', '', NULL, '学生留言菜单');
INSERT INTO `sys_menu` VALUES (2020, '学生留言查询', 2019, 1, '#', '', 'F', '0', '1', 'homework:stumessages:list', '#', 'admin', '2022-04-10 13:54:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '学生留言新增', 2019, 2, '#', '', 'F', '0', '1', 'homework:stumessages:add', '#', 'admin', '2022-04-10 13:54:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '学生留言修改', 2019, 3, '#', '', 'F', '0', '1', 'homework:stumessages:edit', '#', 'admin', '2022-04-10 13:54:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '学生留言删除', 2019, 4, '#', '', 'F', '0', '1', 'homework:stumessages:remove', '#', 'admin', '2022-04-10 13:54:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '学生留言导出', 2019, 5, '#', '', 'F', '0', '1', 'homework:stumessages:export', '#', 'admin', '2022-04-10 13:54:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '教学资料', 0, 4, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-folder-open', 'admin', '2022-04-10 14:40:31', 'admin', '2022-04-10 14:42:38', '');
INSERT INTO `sys_menu` VALUES (2026, '学生留言详情', 2019, 6, '#', 'menuItem', 'F', '0', '1', 'homework:stumessages:detail', '#', 'admin', '2022-04-10 14:44:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '教学资料', 2025, 1, '/homework/teachingmaterial', '', 'C', '0', '1', 'homework:teachingmaterial:view', '#', 'admin', '2022-04-10 14:44:53', '', NULL, '教学资料菜单');
INSERT INTO `sys_menu` VALUES (2028, '教学资料查询', 2027, 1, '#', '', 'F', '0', '1', 'homework:teachingmaterial:list', '#', 'admin', '2022-04-10 14:44:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '教学资料新增', 2027, 2, '#', '', 'F', '0', '1', 'homework:teachingmaterial:add', '#', 'admin', '2022-04-10 14:44:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '教学资料修改', 2027, 3, '#', '', 'F', '0', '1', 'homework:teachingmaterial:edit', '#', 'admin', '2022-04-10 14:44:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '教学资料删除', 2027, 4, '#', '', 'F', '0', '1', 'homework:teachingmaterial:remove', '#', 'admin', '2022-04-10 14:44:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '教学资料导出', 2027, 5, '#', '', 'F', '0', '1', 'homework:teachingmaterial:export', '#', 'admin', '2022-04-10 14:44:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '教学资料详情', 2027, 6, '#', 'menuItem', 'F', '0', '1', 'homework:teachingmaterial:detail', '#', 'admin', '2022-04-10 14:53:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '发布作业', 2000, 1, '/homework/leavehomework', '', 'C', '0', '1', 'homework:leavehomework:view', '#', 'admin', '2022-04-10 15:05:03', '', NULL, '发布作业菜单');
INSERT INTO `sys_menu` VALUES (2035, '发布作业查询', 2034, 1, '#', '', 'F', '0', '1', 'homework:leavehomework:list', '#', 'admin', '2022-04-10 15:05:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '发布作业新增', 2034, 2, '#', '', 'F', '0', '1', 'homework:leavehomework:add', '#', 'admin', '2022-04-10 15:05:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '发布作业修改', 2034, 3, '#', '', 'F', '0', '1', 'homework:leavehomework:edit', '#', 'admin', '2022-04-10 15:05:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '发布作业删除', 2034, 4, '#', '', 'F', '0', '1', 'homework:leavehomework:remove', '#', 'admin', '2022-04-10 15:05:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '发布作业导出', 2034, 5, '#', '', 'F', '0', '1', 'homework:leavehomework:export', '#', 'admin', '2022-04-10 15:05:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '我的作业', 2000, 1, '/homework/myhomework', '', 'C', '0', '1', 'homework:myhomework:view', '#', 'admin', '2022-04-10 15:59:30', '', NULL, '我的作业菜单');
INSERT INTO `sys_menu` VALUES (2041, '我的作业查询', 2040, 1, '#', '', 'F', '0', '1', 'homework:myhomework:list', '#', 'admin', '2022-04-10 15:59:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '我的作业新增', 2040, 2, '#', '', 'F', '0', '1', 'homework:myhomework:add', '#', 'admin', '2022-04-10 15:59:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '我的作业修改', 2040, 3, '#', '', 'F', '0', '1', 'homework:myhomework:edit', '#', 'admin', '2022-04-10 15:59:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '我的作业删除', 2040, 4, '#', '', 'F', '0', '1', 'homework:myhomework:remove', '#', 'admin', '2022-04-10 15:59:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '我的作业导出', 2040, 5, '#', '', 'F', '0', '1', 'homework:myhomework:export', '#', 'admin', '2022-04-10 15:59:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '提交作业', 2000, 2, '/homework/handinhomework', 'menuItem', 'C', '0', '1', 'homework:handinhomework:view', 'fa fa-check', 'admin', '2022-04-10 16:07:45', 'admin', '2022-04-10 16:08:22', '');
INSERT INTO `sys_menu` VALUES (2047, '批阅作业', 2000, 2, '/homework/markstuhomework', 'menuItem', 'C', '0', '1', 'homework:markstuhomework:view,homework:markstuhomework:list,homework:myhomework:edit', 'fa fa-check', 'admin', '2022-04-10 21:33:29', 'admin', '2022-04-11 13:53:43', '');
INSERT INTO `sys_menu` VALUES (2048, '题库管理', 0, 6, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-file-word-o', 'admin', '2022-04-25 12:06:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '试卷管理', 2048, 1, '/homework/paper', '', 'C', '0', '1', 'homework:paper:view', '#', 'admin', '2022-05-04 14:09:18', '', NULL, '试卷管理菜单');
INSERT INTO `sys_menu` VALUES (2056, '试卷管理查询', 2055, 1, '#', '', 'F', '0', '1', 'homework:paper:list', '#', 'admin', '2022-05-04 14:09:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '试卷管理新增', 2055, 2, '#', '', 'F', '0', '1', 'homework:paper:add', '#', 'admin', '2022-05-04 14:09:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '试卷管理修改', 2055, 3, '#', '', 'F', '0', '1', 'homework:paper:edit', '#', 'admin', '2022-05-04 14:09:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '试卷管理删除', 2055, 4, '#', '', 'F', '0', '1', 'homework:paper:remove', '#', 'admin', '2022-05-04 14:09:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '试卷管理导出', 2055, 5, '#', '', 'F', '0', '1', 'homework:paper:export', '#', 'admin', '2022-05-04 14:09:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '题目管理', 2055, 6, '#', 'menuItem', 'F', '0', '1', 'homework:questionbank:view', '#', 'admin', '2022-05-10 17:12:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '题目查询', 2055, 6, '#', 'menuItem', 'F', '0', '1', 'homework:questionbank:list', '#', 'admin', '2022-05-10 17:13:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '题目导出', 2055, 6, '#', 'menuItem', 'F', '0', '1', 'homework:questionbank:export', '#', 'admin', '2022-05-10 17:13:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '题目操作', 2055, 6, '#', 'menuItem', 'F', '0', '1', 'homework:questionbank:add,homework:questionbank:edit,homework:questionbank:remove', '#', 'admin', '2022-05-10 17:13:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '评论管理', 2018, 1, '/homework/stucomment', '', 'C', '0', '1', 'homework:stucomment:view', '#', 'admin', '2023-01-25 10:29:01', '', NULL, '评论管理菜单');
INSERT INTO `sys_menu` VALUES (2066, '评论管理查询', 2065, 1, '#', '', 'F', '0', '1', 'homework:stucomment:list', '#', 'admin', '2023-01-25 10:29:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '评论管理新增', 2065, 2, '#', '', 'F', '0', '1', 'homework:stucomment:add', '#', 'admin', '2023-01-25 10:29:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '评论管理修改', 2065, 3, '#', '', 'F', '0', '1', 'homework:stucomment:edit', '#', 'admin', '2023-01-25 10:29:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '评论管理删除', 2065, 4, '#', '', 'F', '0', '1', 'homework:stucomment:remove', '#', 'admin', '2023-01-25 10:29:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '评论管理导出', 2065, 5, '#', '', 'F', '0', '1', 'homework:stucomment:export', '#', 'admin', '2023-01-25 10:29:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 745 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.ruoyi.project.monitor.operlog.controller.OperlogController.clean()', 'POST', 1, 'admin', 'XX学校', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-02-21 20:11:31');
INSERT INTO `sys_oper_log` VALUES (2, '登录日志', 9, 'com.ruoyi.project.monitor.logininfor.controller.LogininforController.clean()', 'POST', 1, 'admin', 'XX学校', '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-02-21 20:11:38');
INSERT INTO `sys_oper_log` VALUES (3, '教学资料', 3, 'com.ruoyi.project.homework.teachingmaterial.controller.TeachingMaterialController.remove()', 'POST', 1, 'admin', 'XX学校', '/homework/teachingmaterial/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-02-21 20:12:07');
INSERT INTO `sys_oper_log` VALUES (4, '教学资料', 3, 'com.ruoyi.project.homework.teachingmaterial.controller.TeachingMaterialController.remove()', 'POST', 1, 'admin', 'XX学校', '/homework/teachingmaterial/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-02-21 20:12:09');
INSERT INTO `sys_oper_log` VALUES (5, '学生留言', 3, 'com.ruoyi.project.homework.stumessages.controller.StuMessagesController.remove()', 'POST', 1, 'admin', 'XX学校', '/homework/stumessages/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2,3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-02-21 20:12:15');
INSERT INTO `sys_oper_log` VALUES (6, '试卷管理', 1, 'com.ruoyi.project.homework.paper.controller.PaperController.addSave()', 'POST', 1, 'admin', 'XX学校', '/homework/paper/add', '127.0.0.1', '内网IP', '{\"paperTitle\":[\"test\"],\"paperType\":[\"1\"],\"paperResources\":[\"\"],\"state\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-02-21 20:13:25');
INSERT INTO `sys_oper_log` VALUES (7, '试卷管理', 3, 'com.ruoyi.project.homework.paper.controller.PaperController.remove()', 'POST', 1, 'admin', 'XX学校', '/homework/paper/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-02-21 20:14:00');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'teacher', '教师', 1, '0', 'admin', '2021-05-31 17:04:19', 'admin', '2021-06-01 09:49:00', '');
INSERT INTO `sys_post` VALUES (2, 'student', '学生', 2, '0', 'admin', '2021-05-31 17:04:19', 'admin', '2021-06-01 09:49:28', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通管理员', 4, '0', 'admin', '2021-05-31 17:04:19', 'admin', '2021-06-01 09:51:07', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-05-31 17:04:19', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '管理员角色', 'common', 2, '2', '0', '0', 'admin', '2021-05-31 17:04:19', 'admin', '2022-05-10 17:14:28', '普通角色');
INSERT INTO `sys_role` VALUES (3, '教师角色', 'sys_teacher_role', 3, '1', '0', '0', 'admin', '2021-06-01 10:15:31', 'admin', '2022-05-10 17:14:24', '教师角色');
INSERT INTO `sys_role` VALUES (4, '学生角色', 'sys_student_role', 4, '5', '0', '0', 'admin', '2021-06-01 10:16:06', 'admin', '2022-04-11 10:55:48', '学生角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 103);
INSERT INTO `sys_role_dept` VALUES (2, 104);
INSERT INTO `sys_role_dept` VALUES (2, 105);
INSERT INTO `sys_role_dept` VALUES (2, 106);
INSERT INTO `sys_role_dept` VALUES (2, 107);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2048);
INSERT INTO `sys_role_menu` VALUES (2, 2055);
INSERT INTO `sys_role_menu` VALUES (2, 2056);
INSERT INTO `sys_role_menu` VALUES (2, 2057);
INSERT INTO `sys_role_menu` VALUES (2, 2058);
INSERT INTO `sys_role_menu` VALUES (2, 2059);
INSERT INTO `sys_role_menu` VALUES (2, 2060);
INSERT INTO `sys_role_menu` VALUES (2, 2061);
INSERT INTO `sys_role_menu` VALUES (2, 2062);
INSERT INTO `sys_role_menu` VALUES (2, 2063);
INSERT INTO `sys_role_menu` VALUES (2, 2064);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 2000);
INSERT INTO `sys_role_menu` VALUES (3, 2018);
INSERT INTO `sys_role_menu` VALUES (3, 2019);
INSERT INTO `sys_role_menu` VALUES (3, 2020);
INSERT INTO `sys_role_menu` VALUES (3, 2021);
INSERT INTO `sys_role_menu` VALUES (3, 2022);
INSERT INTO `sys_role_menu` VALUES (3, 2023);
INSERT INTO `sys_role_menu` VALUES (3, 2024);
INSERT INTO `sys_role_menu` VALUES (3, 2025);
INSERT INTO `sys_role_menu` VALUES (3, 2026);
INSERT INTO `sys_role_menu` VALUES (3, 2027);
INSERT INTO `sys_role_menu` VALUES (3, 2028);
INSERT INTO `sys_role_menu` VALUES (3, 2029);
INSERT INTO `sys_role_menu` VALUES (3, 2030);
INSERT INTO `sys_role_menu` VALUES (3, 2031);
INSERT INTO `sys_role_menu` VALUES (3, 2032);
INSERT INTO `sys_role_menu` VALUES (3, 2033);
INSERT INTO `sys_role_menu` VALUES (3, 2034);
INSERT INTO `sys_role_menu` VALUES (3, 2035);
INSERT INTO `sys_role_menu` VALUES (3, 2036);
INSERT INTO `sys_role_menu` VALUES (3, 2037);
INSERT INTO `sys_role_menu` VALUES (3, 2038);
INSERT INTO `sys_role_menu` VALUES (3, 2039);
INSERT INTO `sys_role_menu` VALUES (3, 2040);
INSERT INTO `sys_role_menu` VALUES (3, 2041);
INSERT INTO `sys_role_menu` VALUES (3, 2042);
INSERT INTO `sys_role_menu` VALUES (3, 2043);
INSERT INTO `sys_role_menu` VALUES (3, 2044);
INSERT INTO `sys_role_menu` VALUES (3, 2045);
INSERT INTO `sys_role_menu` VALUES (3, 2046);
INSERT INTO `sys_role_menu` VALUES (3, 2047);
INSERT INTO `sys_role_menu` VALUES (3, 2048);
INSERT INTO `sys_role_menu` VALUES (3, 2055);
INSERT INTO `sys_role_menu` VALUES (3, 2056);
INSERT INTO `sys_role_menu` VALUES (3, 2057);
INSERT INTO `sys_role_menu` VALUES (3, 2058);
INSERT INTO `sys_role_menu` VALUES (3, 2059);
INSERT INTO `sys_role_menu` VALUES (3, 2060);
INSERT INTO `sys_role_menu` VALUES (3, 2061);
INSERT INTO `sys_role_menu` VALUES (3, 2062);
INSERT INTO `sys_role_menu` VALUES (3, 2063);
INSERT INTO `sys_role_menu` VALUES (3, 2064);
INSERT INTO `sys_role_menu` VALUES (4, 2000);
INSERT INTO `sys_role_menu` VALUES (4, 2018);
INSERT INTO `sys_role_menu` VALUES (4, 2019);
INSERT INTO `sys_role_menu` VALUES (4, 2020);
INSERT INTO `sys_role_menu` VALUES (4, 2021);
INSERT INTO `sys_role_menu` VALUES (4, 2025);
INSERT INTO `sys_role_menu` VALUES (4, 2026);
INSERT INTO `sys_role_menu` VALUES (4, 2027);
INSERT INTO `sys_role_menu` VALUES (4, 2028);
INSERT INTO `sys_role_menu` VALUES (4, 2033);
INSERT INTO `sys_role_menu` VALUES (4, 2040);
INSERT INTO `sys_role_menu` VALUES (4, 2041);
INSERT INTO `sys_role_menu` VALUES (4, 2042);
INSERT INTO `sys_role_menu` VALUES (4, 2043);
INSERT INTO `sys_role_menu` VALUES (4, 2044);
INSERT INTO `sys_role_menu` VALUES (4, 2045);
INSERT INTO `sys_role_menu` VALUES (4, 2046);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '超级管理员', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2024-02-21 20:24:04', '2021-05-31 17:04:19', 'admin', '2021-05-31 17:04:19', '', '2024-02-21 20:24:03', '超级管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'padmin', '超级管理员', '00', 'ry@qq.com', '15666666666', '1', '', '9037d18640c6e59bb6f32643ee14457e', 'b75c4c', '0', '0', '127.0.0.1', '2024-02-21 20:24:45', '2021-05-31 17:04:19', 'admin', '2021-05-31 17:04:19', '', '2024-02-21 20:24:45', '超级管理员');
INSERT INTO `sys_user` VALUES (3, 103, 'abu', '阿卜', '4', '', '', '0', '', '42cbf29dc37d57447bf8b445ac6af808', '63cc69', '0', '0', '127.0.0.1', '2022-05-10 17:15:13', NULL, 'admin', '2022-04-11 10:47:47', 'admin', '2022-05-10 17:15:13', '');
INSERT INTO `sys_user` VALUES (4, 104, 'abu100', '阿卜100', '4', '', '', '0', '', '0d85230ce6968ef500971538a6ee7d1b', 'b9ac3b', '0', '0', '127.0.0.1', '2022-05-09 10:03:08', NULL, 'admin', '2022-04-11 10:52:33', 'admin', '2022-05-09 10:03:08', '');
INSERT INTO `sys_user` VALUES (5, 103, 'wt', '王涛', '3', '', '', '0', '', 'b238e5061015e9b4d86188395e5e69c7', 'ac5e08', '0', '0', '127.0.0.1', '2022-05-10 17:15:45', NULL, 'admin', '2022-04-11 10:53:29', 'admin', '2022-05-10 17:15:45', '');
INSERT INTO `sys_user` VALUES (6, 104, 'lf', '刘峰', '3', '', '', '0', '', 'f7c78ec4ae891fd8fe3538a833030f53', '643b9a', '0', '0', '127.0.0.1', '2022-05-10 13:15:22', NULL, 'admin', '2022-04-11 10:54:05', 'admin', '2022-05-10 13:15:21', '');
INSERT INTO `sys_user` VALUES (7, 103, 'go', '郭向阳', '3', '', '', '0', '', '21f240316b42351df3b9072981602407', '29b5e7', '0', '0', '127.0.0.1', '2022-04-27 22:07:08', NULL, 'admin', '2022-04-27 22:06:51', 'admin', '2022-04-29 22:47:51', '');
INSERT INTO `sys_user` VALUES (8, 103, 'ahua', '阿华', '3', '', '', '0', '', '1a358f45d71b839acfb80e0c24c496d4', 'fe9c12', '0', '0', '127.0.0.1', '2022-05-10 13:16:04', NULL, 'admin', '2022-04-30 17:23:10', '', '2022-05-10 13:16:03', NULL);
INSERT INTO `sys_user` VALUES (9, 103, 'asan', '阿三', '3', '', '', '0', '', 'e8ad0248fd4ba880ba8801cf62821301', '2ab983', '0', '0', '127.0.0.1', '2022-05-02 07:08:25', NULL, 'admin', '2022-04-30 17:23:29', '', '2022-05-02 07:08:24', NULL);
INSERT INTO `sys_user` VALUES (10, 103, 'abin', '阿斌', '3', '', '', '0', '', 'b12c36c9ad96312d59ec796bd6bea2ac', '41befd', '0', '0', '127.0.0.1', '2022-05-02 07:05:12', NULL, 'admin', '2022-04-30 17:24:31', '', '2022-05-02 07:05:11', NULL);
INSERT INTO `sys_user` VALUES (11, 103, 'zb', '张斌', '3', '', '', '0', '', '20b3ddfa686457068809c8a9eb4de3fc', '3d343f', '0', '0', '127.0.0.1', '2022-05-02 07:05:46', NULL, 'admin', '2022-04-30 17:25:14', '', '2022-05-02 07:05:45', NULL);
INSERT INTO `sys_user` VALUES (12, 103, 'wb', '王斌', '3', '', '', '0', '', '6a9fccf5c32d10c799250f835b973914', 'fbc51a', '0', '0', '', NULL, NULL, 'admin', '2022-04-30 17:25:36', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (13, 103, 'dd', '大点', '3', '', '', '0', '', 'a88ec95fbf0381ec7bf60ba3313f30f8', '5f0368', '0', '0', '', NULL, NULL, 'admin', '2022-04-30 17:25:52', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (14, 103, 'wtt', '王婷婷', '3', '', '', '0', '', '49de0019b8afa4dda194ffa4b544abd1', '683b20', '0', '0', '127.0.0.1', '2022-05-10 12:16:11', NULL, 'admin', '2022-04-30 17:26:58', '', '2022-05-10 12:16:10', NULL);
INSERT INTO `sys_user` VALUES (15, 104, 'cs1', '测试1', '3', '', '', '0', '', '2c1ee7d585a69abed17e84818ff71f90', 'd8dc21', '0', '0', '', NULL, NULL, 'admin', '2022-04-30 17:27:29', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (16, 104, 'cs2', '测试2', '3', '', '', '0', '', '6c7d7c904af8860fce275866edd73600', '1ecfab', '0', '0', '', NULL, NULL, 'admin', '2022-04-30 17:27:51', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (17, 104, 'db', '大斌', '3', '', '', '0', '', 'e027268b01343cb54553bd87fe10362d', 'd1fe21', '0', '0', '', NULL, NULL, 'admin', '2022-04-30 17:28:16', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (18, 104, 'zy', '张岩', '3', '', '', '0', '', '41ba9091efd3fce72f34e0e8c356f41a', '914fb4', '0', '0', '', NULL, NULL, 'admin', '2022-04-30 17:28:33', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (19, 104, 'lff', '李飞', '3', '', '', '0', '', 'f27053d84abc8933c4f980ba145d6b9e', '17d59a', '0', '0', '', NULL, NULL, 'admin', '2022-04-30 17:29:00', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线用户记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('079f2e55-28a2-4464-ae96-0e870ba5c885', 'padmin', 'XX学校', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', 'on_line', '2024-02-21 19:54:58', '2024-02-21 19:58:02', 1800000);
INSERT INTO `sys_user_online` VALUES ('3bd1713a-2670-4e28-94d3-3292d041f945', 'padmin', '金陵科技学院', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', 'on_line', '2024-02-21 20:24:15', '2024-02-21 20:25:52', 1800000);
INSERT INTO `sys_user_online` VALUES ('3db6557b-c936-48ce-908f-ef4ff0b506fa', 'admin', 'XX学校', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', 'on_line', '2024-02-21 20:07:25', '2024-02-21 20:17:47', 1800000);
INSERT INTO `sys_user_online` VALUES ('47b88a83-80aa-4d56-bf83-15b58f8bb739', 'admin', '金陵科技学院', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', 'on_line', '2024-02-21 20:22:31', '2024-02-21 20:22:34', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (3, 1);
INSERT INTO `sys_user_post` VALUES (4, 1);
INSERT INTO `sys_user_post` VALUES (5, 2);
INSERT INTO `sys_user_post` VALUES (6, 2);
INSERT INTO `sys_user_post` VALUES (7, 2);
INSERT INTO `sys_user_post` VALUES (8, 2);
INSERT INTO `sys_user_post` VALUES (9, 2);
INSERT INTO `sys_user_post` VALUES (10, 2);
INSERT INTO `sys_user_post` VALUES (11, 2);
INSERT INTO `sys_user_post` VALUES (12, 2);
INSERT INTO `sys_user_post` VALUES (13, 2);
INSERT INTO `sys_user_post` VALUES (14, 2);
INSERT INTO `sys_user_post` VALUES (15, 2);
INSERT INTO `sys_user_post` VALUES (16, 2);
INSERT INTO `sys_user_post` VALUES (17, 2);
INSERT INTO `sys_user_post` VALUES (18, 2);
INSERT INTO `sys_user_post` VALUES (19, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 3);
INSERT INTO `sys_user_role` VALUES (5, 4);
INSERT INTO `sys_user_role` VALUES (6, 4);
INSERT INTO `sys_user_role` VALUES (7, 4);
INSERT INTO `sys_user_role` VALUES (8, 4);
INSERT INTO `sys_user_role` VALUES (9, 4);
INSERT INTO `sys_user_role` VALUES (10, 4);
INSERT INTO `sys_user_role` VALUES (11, 4);
INSERT INTO `sys_user_role` VALUES (12, 4);
INSERT INTO `sys_user_role` VALUES (14, 4);
INSERT INTO `sys_user_role` VALUES (15, 4);
INSERT INTO `sys_user_role` VALUES (16, 4);
INSERT INTO `sys_user_role` VALUES (17, 4);
INSERT INTO `sys_user_role` VALUES (18, 4);
INSERT INTO `sys_user_role` VALUES (19, 4);

SET FOREIGN_KEY_CHECKS = 1;
