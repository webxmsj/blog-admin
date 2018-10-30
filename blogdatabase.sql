/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : blogdatabase

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 30/10/2018 17:56:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类父id',
  `post_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类文章数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `delete_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `seo_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '扩展属性',
  `create_time` bigint(20) DEFAULT NULL,
  `isdelete` int(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否已删除1:已删2:未删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (38, 0, 0, 1, 0, 10000, '旅行随感', '到处流浪的感受', '0', '', '', '', NULL, 1539938197992, 000);
INSERT INTO `blog_category` VALUES (39, 0, 0, 1, 0, 10000, '技术文章', '技术人的天地', '1', '', '', '', NULL, 1539938230613, 000);
INSERT INTO `blog_category` VALUES (40, 0, 0, 1, 0, 10000, '西藏之行', '别有风味的西藏行', '0,0', '心灵对话', '心灵对话', '心灵对话', NULL, 1540172081184, 000);
INSERT INTO `blog_category` VALUES (42, 0, 0, 1, 0, 10000, '云南之行', '彩云之南', '0,1', '', '', '', NULL, 1540178639434, 000);
INSERT INTO `blog_category` VALUES (44, 0, 0, 1, 0, 10000, '修改阿里', '人文丰富的阿里地区', '0,0,0', '', '', '', NULL, 1540261053138, 000);
INSERT INTO `blog_category` VALUES (45, 0, 0, 1, 0, 10000, '测试文章', '一个进行测试的类别', '2', 'test', 'test', 'test', NULL, 1540794581260, 000);

-- ----------------------------
-- Table structure for blog_category_post
-- ----------------------------
DROP TABLE IF EXISTS `blog_category_post`;
CREATE TABLE `blog_category_post`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章id',
  `category_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `term_taxonomy_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category_post
-- ----------------------------
INSERT INTO `blog_category_post` VALUES (1, 6, 41, 10000, 1);
INSERT INTO `blog_category_post` VALUES (2, 7, 45, 10000, 1);
INSERT INTO `blog_category_post` VALUES (3, 8, 45, 10000, 1);

-- ----------------------------
-- Table structure for blog_link
-- ----------------------------
DROP TABLE IF EXISTS `blog_link`;
CREATE TABLE `blog_link`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT 0 COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '友情链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_link
-- ----------------------------
INSERT INTO `blog_link` VALUES (1, 1, 0, 10000, '百度首页', 'http://www.baidu.com', '百度', '', '_blank', '');
INSERT INTO `blog_link` VALUES (2, 1, 0, 10000, 'asdfas', 'asdfa', 'fasdfasd', '', 'da', '');
INSERT INTO `blog_link` VALUES (3, 0, 1, 2, '修改了乐视的简介', 'http://www.le.com', '乐视视频', 'http://www.lethis.com/q.jpg', '_blank', '');

-- ----------------------------
-- Table structure for blog_post
-- ----------------------------
DROP TABLE IF EXISTS `blog_post`;
CREATE TABLE `blog_post`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `post_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '内容格式; html、md',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发表者用户id',
  `post_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '查看数',
  `post_like` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `comment_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论数',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `published_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布时间',
  `delete_time` bigint(20) UNSIGNED DEFAULT NULL COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '文章内容',
  `post_thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '缩略图',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '扩展属性,如缩略图;格式为json',
  `isdelete` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_status_date`(`post_status`, `create_time`, `id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'portal应用 文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_post
-- ----------------------------
INSERT INTO `blog_post` VALUES (1, 39, 'md', 5, 1, 1, 0, 0, 0, 0, 0, 1540195447087, 0, 0, 1540795032096, 'hello', 'js', 'asdfasdf', '', '', '', NULL, 1);
INSERT INTO `blog_post` VALUES (2, 42, 'md', 5, 1, 1, 0, 0, 0, 0, 0, 1540195676849, 0, 0, 0, '彩云之南', '旅行', '这是一片神奇的土地', '', '<p>在这里你将会有无限的收获，不是嫩够用言语表达的</p>\n', 'http://img.bfrontend.com/banner1.png', NULL, 0);
INSERT INTO `blog_post` VALUES (3, 41, 'md', 5, 1, 1, 0, 0, 0, 0, 0, 1540198994146, 0, 0, 1540794992188, 'asdf', 'asdf', 'asdf', '', '<p>在这里你将会有无限的收获，不是嫩够用言语表达的</p>\n', '', NULL, 1);
INSERT INTO `blog_post` VALUES (7, 45, 'md', 5, 0, 1, 0, 0, 0, 0, 0, 1540795312409, 0, 0, 0, 'asdfasdf', 'a', '有时候，一样食物给人留下的记忆，远比一顿暴打更深刻，更烙入骨髓。\n\n　　对小素而言，不能对她提一种叫做麻球的小吃。金黄黄的，包了红糖馅、滚了白芝麻、入了油锅炸的糯米点心。\n\n　　童年时，家境清寒。三间外面大雨、里面小雨的草房，三棵李树、两株桃树和屋后的一片竹子，就是家里的全部不动产了。好在那时也没过过好日子，并不觉得有多苦。', 'b', '', '', NULL, 0);
INSERT INTO `blog_post` VALUES (8, 45, 'md', 5, 0, 1, 0, 0, 0, 0, 0, 1540796004347, 0, 0, NULL, 'test', 'a', '<div style=\"background: red;width:300px;height:300px;\">asdf</div>', 'b', '', '', NULL, 0);

-- ----------------------------
-- Table structure for blog_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `blog_recycle_bin`;
CREATE TABLE `blog_recycle_bin`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT 0 COMMENT '删除内容 id',
  `create_time` bigint(20) UNSIGNED DEFAULT 0 COMMENT '创建时间',
  `table_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = ' 回收站' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_recycle_bin
-- ----------------------------
INSERT INTO `blog_recycle_bin` VALUES (2, 4, 1540266176124, 'blog_post', 'asdf', 5);
INSERT INTO `blog_recycle_bin` VALUES (3, 3, 1540266246140, 'blog_post', 'asdf', 5);
INSERT INTO `blog_recycle_bin` VALUES (4, 2, 1540794121778, 'blog_post', '彩云之南', 5);
INSERT INTO `blog_recycle_bin` VALUES (5, 2, 1540794141733, 'blog_post', '彩云之南', 5);
INSERT INTO `blog_recycle_bin` VALUES (6, 3, 1540794261176, 'blog_post', 'asdf', 5);
INSERT INTO `blog_recycle_bin` VALUES (7, 1, 1540794527668, 'blog_post', 'hello', 5);
INSERT INTO `blog_recycle_bin` VALUES (8, 3, 1540794992133, 'blog_post', 'asdf', 5);
INSERT INTO `blog_recycle_bin` VALUES (9, 1, 1540795032033, 'blog_post', 'hello', 5);

-- ----------------------------
-- Table structure for blog_setting
-- ----------------------------
DROP TABLE IF EXISTS `blog_setting`;
CREATE TABLE `blog_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设置的类型',
  `data` json COMMENT 'json格式的key-value',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_setting
-- ----------------------------
INSERT INTO `blog_setting` VALUES (19, 'qiniu', '{\"bucket\": \"ddd\", \"domain\": \"cccc\", \"accessKey\": \"a\", \"secretKey\": \"b\"}');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `isdelete` int(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否已删除1:已删2:未删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (3, 1, 0, 0, 'js', 000);
INSERT INTO `blog_tag` VALUES (4, 1, 1, 0, 'html', 000);

-- ----------------------------
-- Table structure for blog_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag_post`;
CREATE TABLE `blog_tag_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签 id',
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag_post
-- ----------------------------
INSERT INTO `blog_tag_post` VALUES (1, 3, 5, 1);
INSERT INTO `blog_tag_post` VALUES (2, 4, 6, 1);
INSERT INTO `blog_tag_post` VALUES (3, 4, 7, 1);
INSERT INTO `blog_tag_post` VALUES (4, 4, 8, 1);

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户类型;1:普通用户;2:基础后台管理用户3:超级后台管理用户',
  `sex` tinyint(2) NOT NULL DEFAULT 0 COMMENT '性别;0:保密,1:男,2:女',
  `birthday` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '用户积分',
  `coin` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '金币',
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `create_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `user_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '登录密码 加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户手机号',
  `user_activation_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '激活码',
  `islive` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_login`(`user_login`) USING BTREE,
  INDEX `user_nickname`(`user_nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES (5, 3, 1, '0', 0, 0, 0, 0.00, 0, 1, 'bfrontend', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'bfrontend website', 'http://img.bfrontend.com/banner2.png', 'bfrontend 个性签名', '', '', NULL, '0', NULL);
INSERT INTO `blog_user` VALUES (12, 2, 2, '2018-10-08', 0, 0, 0, 0.00, 0, 1, 'testuser', '5d9c68c6c50ed3d02a2fcf54f63993b6', '测试员', '', '我是测试员的网址', 'http://img.bfrontend.com/testperson.jpg', '勤劳的测试员', '', '', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXIiOiJ0ZXN0dXNlciIsImVtYWlsIjoiMTc2MjU0OTI0MjRAMTYzLmNvbSJ9LCJleHAiOjE1Mzk4MzIxNDcsImlhdCI6MTUzOTc0NTc0N30.nXk9QPFwvXM60-h9OKgJ6rM_Fd_8ZIhnsxuVmnnDHO7us7viRajXH0x3KGr7z4G-uAnTbFIjE_jExP937-mDkdxIOCxQubWcHWrVicp5jO9LBiCKiwPTCnPUWCIHtZlq1PQxusNdrH7OoIicvpLf1e43YvmhhTYsaOUZVwAK8YYbD1E31cElDmzM7aEAwrmpuzdGkBnR1JHe_StObkGDfTRZ8kdkVDxsJZ50tBiE3nprhx0OjV56Et4c6rtz4w19UikY3c9GC4CuHAQYtvNf0vB2FkJlLgav1beii9oP4a6Nm-8L2JYZAFUZVRIIJEkB7zbwHMTdbTyrNRJFhwSQaw', '1', NULL);
INSERT INTO `blog_user` VALUES (14, 1, 0, '', 0, 0, 0, 0.00, 0, 1, 'msobj', '5d41402abc4b2a76b9719d911017c592', 'msobj', '', '', '', '', '', '', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXIiOiJtc29iaiIsImVtYWlsIjoiMTc2MjU0OTI0MjRAMTYzLmNvbSJ9LCJleHAiOjE1Mzk4NTI2MTMsImlhdCI6MTUzOTc2NjIxM30.fUYchOPZTnDJUCaiPmM6mTuHgQDDLqKh0J-N17I8NKdKRiNjitOposRcLbKsifK4_lDiKPUD0brA6hc_GF1l-gg50QAR3Ylu0e-39oalLF7qBnr7Q-uMvIfjAox6OwDHOazBvxyJyFZWnnMKTyYj8BwbnYl9eJqSm1TOvbC8mHWgUW2oB6TsHTBd7ZFp6dKU4iv7iHDLF4-jjW3cGBrVyGAXTMJLx5AwZthpUu3AC61vSdQ6Kxp_MVQvtP9IMhmG4Onit1rbaTjnW4IcaSXmCeaQeqTC6laiPztaUV48MXWa1vmOF_xxu20RNVq5uMEpBvQMWGvdMacT7yDLo02A4w', '1', NULL);

-- ----------------------------
-- Table structure for blog_user_token
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_token`;
CREATE TABLE `blog_user_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `expire_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT ' 过期时间',
  `create_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `token` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  `ip_address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户客户端登录 token 表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_token
-- ----------------------------
INSERT INTO `blog_user_token` VALUES (20, 4, 1539635316187, 1539548916187, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjo0fSwiZXhwIjoxNTM5NjM1MzE2LCJpYXQiOjE1Mzk1NDg5MTZ9.VMlDnMaL-yWOC3uemh9xpB5JhKtXwDZTSXbvV-op4EHdTUSh7C9YaEvinkpoG1jyKqT_n0jP1enkmLtvYKAVAGsVh9zIGGw5yMKCgrocUlfX02QvpTnwr3les_g-d5ENfzgBBrA_xq5fSWFjdyrTZzv3tU-85lcUJOHp-eAY1KLSSVkc05LIGNqxGNGBQB6HUMcRh_-U7gsTsyUaXb9Km7hxMt7TCfJhOvs65W_eQ0TZwcsTuK809AL_3cwknC1tzoLG8EEW1C7HO6betiO7-968I_2VZ_ZfuC2ZmyuDS6yiwn2LFW6eMQqA4hpQVZSgIgQ0DZanEbBJV8-cydkEGA', '', '::1');
INSERT INTO `blog_user_token` VALUES (21, 5, 1540956852964, 1540870452964, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjo1fSwiZXhwIjoxNTQwOTU2ODUyLCJpYXQiOjE1NDA4NzA0NTJ9.b5CAmjDrdtYKUca23tEewGehq_CWgHuwZLfR6QZcsalOqdOdZ78gTAHTtzTzVS4ISSa6kjw23tbhN96lGepTmkfWhvrUPuVRkUynDUo7bJ1dCNYcpi2e7csDfnAEOquRK4PcTpqlrahnewS87ZXft2QhKuSiPg7Bp53GTHA8OHM22wFxNgR9Tz1AzSjwwpeMk8fO5RceTTRbn9V-41YqGn-oLlJrrbX5DSkqJhhS2krF570jCjVhY4R7w7vM5boyeXC49ZQKy1GILmY_hpVvFTYfkVmSKQiyOW0TEwwXSskoZNoYv-TW6VWqsSkfXFHUjIcpL1GqK1O3NhyjG1pVqg', '', '::1');
INSERT INTO `blog_user_token` VALUES (22, 11, 1539746096135, 1539659696135, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoxMX0sImV4cCI6MTUzOTc0NjA5NiwiaWF0IjoxNTM5NjU5Njk2fQ.Ff_zVlv8tkmO3cEshqA48QYXXhllwI9xcAPbEBHW9dIZG7DUpk9QH5hXaZOwS-w3aR68wpxtbsyuRPylMSjezYfRw4aCGA8ITNEiz-aPoyv-nhKhVHI0XczbrZIcqMvKvQcwpMCltVhudhsRKOsdBestdA1RHbZLCGGyWxvWUkXHQnA3YbMNPIwTDdK8RDSBmXQ9dcO_bHioDs2oFcYcnFOVFjjJNjjR6RZgYQt41mauXIBRV8RNEzvEsF1g5bxKBxrxZuE_6_xSBmp3osF-CBOC812vLzW_BqfYc0f2VS9STRiX7SKjin0aJCM7wydU8u1dKuyS64VyR7ikZNnznw', '', '::1');

SET FOREIGN_KEY_CHECKS = 1;
