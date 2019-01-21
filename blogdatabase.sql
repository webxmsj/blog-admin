/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : blogdatabase

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 21/01/2019 23:13:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_albums_post
-- ----------------------------
DROP TABLE IF EXISTS `blog_albums_post`;
CREATE TABLE `blog_albums_post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `album_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_albums_post
-- ----------------------------
INSERT INTO `blog_albums_post` VALUES (1, 14, 'http://img.bfrontend.com/12053349.jpg');
INSERT INTO `blog_albums_post` VALUES (2, 14, 'http://img.bfrontend.com/IMG_0866.JPG');
INSERT INTO `blog_albums_post` VALUES (3, 15, 'http://img.bfrontend.com/166fc20eb514750d.jpg');
INSERT INTO `blog_albums_post` VALUES (4, 15, 'http://img.bfrontend.com/1670c4f7c0eee292.jpg');
INSERT INTO `blog_albums_post` VALUES (5, 16, 'http://img.bfrontend.com/166fc20eb514750d.jpg');
INSERT INTO `blog_albums_post` VALUES (6, 16, 'http://img.bfrontend.com/1670c4f7c0eee292.jpg');
INSERT INTO `blog_albums_post` VALUES (7, 17, 'http://img.bfrontend.com/166fc20eb514750d.jpg');
INSERT INTO `blog_albums_post` VALUES (8, 17, 'http://img.bfrontend.com/1670c4f7c0eee292.jpg');
INSERT INTO `blog_albums_post` VALUES (9, 22, 'http://img.bfrontend.com/timg.jpg');

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
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展属性',
  `create_time` bigint(20) NULL DEFAULT NULL,
  `isdelete` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '是否已删除1:已删 0:未删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (38, 0, 0, 1, 0, 10000, '旅行随感', '到处流浪的感受', '0', '', '', '', NULL, 1539938197992, 0);
INSERT INTO `blog_category` VALUES (39, 0, 0, 1, 0, 10000, '技术文章', '技术人的天地', '1', '', '', '', NULL, 1539938230613, 0);
INSERT INTO `blog_category` VALUES (40, 0, 0, 1, 0, 10000, '西藏之行', '别有风味的西藏行', '0,0', '心灵对话', '心灵对话', '心灵对话', NULL, 1540172081184, 0);
INSERT INTO `blog_category` VALUES (42, 0, 0, 1, 0, 10000, '云南之行', '彩云之南', '0,1', '', '', '', NULL, 1540178639434, 0);
INSERT INTO `blog_category` VALUES (44, 0, 0, 1, 0, 10000, '修改阿里', '人文丰富的阿里地区', '0,0,0', '', '', '', NULL, 1540261053138, 0);
INSERT INTO `blog_category` VALUES (45, 0, 0, 1, 0, 10000, '测试文章', '一个进行测试的类别', '2', 'test', 'test', 'test', NULL, 1540794581260, 0);
INSERT INTO `blog_category` VALUES (46, 0, 0, 1, 0, 10000, 'javascript', 'javascript', '1,0', 'javascript', 'javascript', 'javascript', NULL, 1541405152118, 0);
INSERT INTO `blog_category` VALUES (47, 0, 0, 1, 0, 10000, 'css', 'css', '1,1', 'css', 'css', 'css', NULL, 1541405163045, 0);
INSERT INTO `blog_category` VALUES (48, 0, 0, 1, 0, 10000, 'html', 'html', '1,2', 'html', 'html', 'html', NULL, 1541405173229, 0);
INSERT INTO `blog_category` VALUES (49, 0, 0, 1, 0, 10000, 'test1', 'test1', '2,0', 'test1', 'test1', 'test1', NULL, 1541406829289, 0);
INSERT INTO `blog_category` VALUES (50, 0, 0, 1, 0, 10000, '精彩生活', '精彩生活', '3', '精彩生活', '精彩生活', '精彩生活', NULL, 1547976399886, 0);
INSERT INTO `blog_category` VALUES (51, 0, 0, 1, 0, 10000, '精彩在小细节', '精彩在小细节', '3,0', '精彩在小细节', '精彩在小细节', '精彩在小细节', NULL, 1547976425046, 0);
INSERT INTO `blog_category` VALUES (52, 0, 0, 1, 0, 10000, '励志美文', '励志美文', '4', '励志美文', '励志美文', '励志美文', NULL, 1548083286227, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category_post
-- ----------------------------
INSERT INTO `blog_category_post` VALUES (7, 12, 46, 10000, 1);
INSERT INTO `blog_category_post` VALUES (8, 13, 46, 10000, 1);
INSERT INTO `blog_category_post` VALUES (9, 14, 49, 10000, 1);
INSERT INTO `blog_category_post` VALUES (10, 15, 46, 10000, 1);
INSERT INTO `blog_category_post` VALUES (11, 16, 46, 10000, 1);
INSERT INTO `blog_category_post` VALUES (12, 17, 46, 10000, 1);
INSERT INTO `blog_category_post` VALUES (13, 18, 46, 10000, 1);
INSERT INTO `blog_category_post` VALUES (14, 19, 51, 10000, 1);
INSERT INTO `blog_category_post` VALUES (15, 20, 49, 10000, 1);
INSERT INTO `blog_category_post` VALUES (16, 21, 49, 10000, 1);
INSERT INTO `blog_category_post` VALUES (17, 22, 52, 10000, 1);

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '被回复的评论id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发表评论的用户id',
  `to_user_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '被评论的用户id',
  `like_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `dislike_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '不喜欢数',
  `floor` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '楼层数',
  `create_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论时间',
  `delete_time` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '删除时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:已审核,0:未审核',
  `full_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '层级关系',
  `post_id` int(10) NULL DEFAULT NULL COMMENT '文章id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展属性',
  `isdelete` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `table_id_status`(`status`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES (82, NULL, 33, NULL, 1, 1, 0, 1541746458732, NULL, 0, 'heartdream', 'null', '0', 12, '写较少的if判断，可以优化阅读体验', NULL, 0);
INSERT INTO `blog_comment` VALUES (83, NULL, 33, NULL, 0, 0, 1, 1541746670118, NULL, 1, 'heartdream', 'null', '1', 12, '你好，我再好好看看', NULL, 0);
INSERT INTO `blog_comment` VALUES (84, NULL, 33, NULL, 0, 0, 2, 1541746725712, NULL, 1, 'heartdream', 'null', '2', 12, 'test', NULL, 0);
INSERT INTO `blog_comment` VALUES (85, NULL, 33, NULL, 0, 0, 3, 1541746899696, NULL, 1, 'heartdream', 'null', '3', 12, 'aaaa', NULL, 0);
INSERT INTO `blog_comment` VALUES (86, NULL, 33, NULL, 0, 0, 4, 1541746976383, NULL, 1, 'heartdream', 'null', '4', 12, 'asdf', NULL, 0);
INSERT INTO `blog_comment` VALUES (87, NULL, 33, NULL, 0, 0, 5, 1541747072271, NULL, 1, 'heartdream', 'null', '5', 12, 'bbbb', NULL, 0);

-- ----------------------------
-- Table structure for blog_link
-- ----------------------------
DROP TABLE IF EXISTS `blog_link`;
CREATE TABLE `blog_link`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT 0 COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  `isdelete` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '友情链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_link
-- ----------------------------
INSERT INTO `blog_link` VALUES (1, 0, 0, 10000, '百度首页', 'http://www.baidu.com', '百度', '', '_blank', '', 0);
INSERT INTO `blog_link` VALUES (2, 0, 0, 10000, 'asdfas', 'asdfa', 'fasdfasd', '', 'da', '', 1);
INSERT INTO `blog_link` VALUES (3, 0, 1, 2, '修改了乐视的简介', 'http://www.le.com', '乐视视频', 'http://www.lethis.com/q.jpg', '_blank', '', 1);
INSERT INTO `blog_link` VALUES (5, 0, 1, 4, 'asdf', 'mi.com', '小米', '', '_blank', '', 0);

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
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `published_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布时间',
  `delete_time` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章内容',
  `post_thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展属性,如缩略图;格式为json',
  `isdelete` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_status_date`(`post_status`, `create_time`, `id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'portal应用 文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_post
-- ----------------------------
INSERT INTO `blog_post` VALUES (12, 46, 'md', 5, 1, 1, 0, 0, 30, 0, 6, 1541746005219, 0, 1541746005219, NULL, '小技巧写出更好的javascript条件语句', 'js', '<p>小技巧写出更好的javascript条件语句</p>\n', 'https://scotch.io/tutorials/5-tips-to-write-better-conditionals-in-javascript', '<h2 id=\"1-array-includes-\">1. 使用<code>Array.includes</code>来处理多重条件</h2>\n<p>使用前：</p>\n<pre><code><span class=\"hljs-comment\">// 条件语句</span>\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">fruit</span>) </span>{\n  <span class=\"hljs-keyword\">if</span> (fruit == <span class=\"hljs-string\">\'apple\'</span> || fruit == <span class=\"hljs-string\">\'redjujube\'</span>) {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'red\'</span>);\n  }\n}</code></pre><p>乍一看，这么些似乎没有什么大问题。然而，如果我们想要匹配更多的红色水果呢，比如说[火龙果]和[草莓]？我们是不是得用更多的 <code>||</code> 来扩展这条语句？<br>我们可以使用 <code>Array.includes</code> 重写以上条件句。</p>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">fruit</span>) </span>{\n  <span class=\"hljs-comment\">// 将条件提取到数组中</span>\n  <span class=\"hljs-keyword\">const</span> redFruits = [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>, <span class=\"hljs-string\">\'cherry\'</span>, <span class=\"hljs-string\">\'cranberries\'</span>]\n\n  <span class=\"hljs-keyword\">if</span> (redFruits.includes(fruit)) {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'red\'</span>)\n  }\n}</code></pre><h2 id=\"2-\">2. 少写嵌套，尽早返回</h2>\n<p>让我们为之前的例子添加两个条件：</p>\n<ul>\n<li>如果没有提供水果，抛出错误。</li>\n<li>如果该水果的数量大于10，将其打印出来</li>\n</ul>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">fruit, quantity</span>) </span>{\n  <span class=\"hljs-keyword\">const</span> redFruits = [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>, <span class=\"hljs-string\">\'cherry\'</span>, <span class=\"hljs-string\">\'cranberries\'</span>]\n\n  <span class=\"hljs-keyword\">if</span> (fruit) {\n    <span class=\"hljs-keyword\">if</span> (redFruits.includes(fruit)) {\n      <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'red\'</span>)\n\n      <span class=\"hljs-keyword\">if</span> (quantity &gt; <span class=\"hljs-number\">10</span>) {\n        <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'big quantity\'</span>)\n      }\n    }\n  } <span class=\"hljs-keyword\">else</span> {\n    <span class=\"hljs-keyword\">throw</span> <span class=\"hljs-keyword\">new</span> <span class=\"hljs-built_in\">Error</span>(<span class=\"hljs-string\">\'No fruit\'</span>)\n  }\n}</code></pre><p>让我们回顾上面的代码,我们有：</p>\n<ul>\n<li>1个if/else语句来筛选无效的条件</li>\n<li>3层if 语句嵌套</li>\n</ul>\n<ol>\n<li>减少嵌套</li>\n</ol>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">fruit, quantity</span>) </span>{\n  <span class=\"hljs-keyword\">const</span> redFruits = [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>, <span class=\"hljs-string\">\'cherry\'</span>, <span class=\"hljs-string\">\'cranberries\'</span>]\n\n  <span class=\"hljs-keyword\">if</span> (!fruit) <span class=\"hljs-keyword\">throw</span> <span class=\"hljs-keyword\">new</span> <span class=\"hljs-built_in\">Error</span>(<span class=\"hljs-string\">\'No fruit\'</span>)\n\n  <span class=\"hljs-keyword\">if</span> (redFruits.includes(fruit)) {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'red\'</span>)\n\n    <span class=\"hljs-keyword\">if</span> (quantity &gt; <span class=\"hljs-number\">10</span>) {\n      <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'big quantity\'</span>)\n    }\n  }\n}</code></pre><p>// 不推荐使用以下此版本</p>\n<ul>\n<li>条件反转会导致更多的思考过程(增加认知负担)</li>\n<li>进一步减少嵌套</li>\n</ul>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">fruit, quantity</span>) </span>{\n  <span class=\"hljs-keyword\">const</span> redFruits = [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>, <span class=\"hljs-string\">\'cherry\'</span>, <span class=\"hljs-string\">\'cranberries\'</span>]\n\n  <span class=\"hljs-keyword\">if</span> (!fruit) <span class=\"hljs-keyword\">throw</span> <span class=\"hljs-keyword\">new</span> <span class=\"hljs-built_in\">Error</span>(<span class=\"hljs-string\">\'No fruit\'</span>)\n  <span class=\"hljs-keyword\">if</span> (!redFruits.includes(fruit)) <span class=\"hljs-keyword\">return</span> ;\n\n  <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'red\'</span>)\n\n  <span class=\"hljs-keyword\">if</span> (quantity &gt; <span class=\"hljs-number\">10</span>) {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'big quantity\'</span>)\n  }\n}</code></pre><h2 id=\"3-\">3. 使用函数默认参数和解构</h2>\n<p>在javascript 中我们经常需要检查<code>null</code>/<code>undefined</code>并赋予默认值</p>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\">fruit,quantity</span>) </span>{\n  <span class=\"hljs-keyword\">if</span> (!fruit) <span class=\"hljs-keyword\">return</span>;\n  <span class=\"hljs-keyword\">const</span> q = quantity || <span class=\"hljs-number\">1</span>; <span class=\"hljs-comment\">// 如果没有提供 quantity, 默认为1</span>\n  <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">`we have <span class=\"hljs-subst\">${q}</span> <span class=\"hljs-subst\">${fruit}</span>`</span>)\n}</code></pre><p>事实上我们可以通过函数的默认参数来去掉变量 <code>q</code></p>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\">fruit,quantity = <span class=\"hljs-number\">1</span></span>) </span>{\n  <span class=\"hljs-keyword\">if</span> (!fruit) <span class=\"hljs-keyword\">return</span>;\n  <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">`we have <span class=\"hljs-subst\">${q}</span> <span class=\"hljs-subst\">${fruit}</span>`</span>)\n}</code></pre><p>那么如果<code>fruit</code>是一个对象(Object)呢？我们还可以使用默认参数吗？</p>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\">fruit</span>) </span>{\n  <span class=\"hljs-keyword\">if</span> (fruit &amp;&amp; fruit.name) {\n    <span class=\"hljs-built_in\">console</span>.log(fruit.name)\n  } <span class=\"hljs-keyword\">else</span> {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'unknown\'</span>)\n  }\n}</code></pre><p>观察上面的例子，当水果名称属性存在时，我们希望将其打印出来，否则打印<code>unknown</code>，我们可以通过默认参数和解构赋值的方法来避免写出<code>fruit &amp;&amp; fruit.name</code> 这种条件</p>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\">{name} = {}</span>) </span>{\n  <span class=\"hljs-built_in\">console</span>.log(name || <span class=\"hljs-string\">\'unknown\'</span>)\n}</code></pre><p>既然我们只需要fruit的<code>name</code>属性,我们可以使用<code>{name}</code>来将其解构出来，之后我们就可以在代码中使用<code>name</code>变量来取代<code>fruit.name</code></p>\n<h2 id=\"4-switch-map-object-\">4. 相较于switch ,Map/Object 也许是更好的选择</h2>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">color</span>) </span>{\n  <span class=\"hljs-keyword\">switch</span> (color) {\n    <span class=\"hljs-keyword\">case</span> <span class=\"hljs-string\">\'red\'</span>:\n      <span class=\"hljs-keyword\">return</span> [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>]\n    <span class=\"hljs-keyword\">case</span> <span class=\"hljs-string\">\'yellow\'</span>:\n      <span class=\"hljs-keyword\">return</span> [<span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-string\">\'pineapple\'</span>]\n    <span class=\"hljs-keyword\">case</span> <span class=\"hljs-string\">\'purple\'</span>:\n      <span class=\"hljs-keyword\">return</span> [<span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-string\">\'plum\'</span>]\n    <span class=\"hljs-keyword\">default</span>:\n      <span class=\"hljs-keyword\">return</span> []\n  }\n}</code></pre><p>使用对象字面量来进行优化</p>\n<pre><code><span class=\"hljs-keyword\">const</span> fruitColor = {\n  <span class=\"hljs-attr\">red</span>: [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>],\n  <span class=\"hljs-attr\">yellow</span>: [<span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-string\">\'pineapple\'</span>],\n  <span class=\"hljs-attr\">purple</span>: [<span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-string\">\'plum\'</span>]\n}\n\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">color</span>) </span>{\n  <span class=\"hljs-keyword\">return</span> fruitColor[color] || []\n}</code></pre><p>或者使用 <code>Map</code> 来实现同样的效果</p>\n<pre><code><span class=\"hljs-keyword\">const</span> fruitColor = <span class=\"hljs-keyword\">new</span> Map()\n    .<span class=\"hljs-keyword\">set</span>(<span class=\"hljs-string\">\'red\'</span>, [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>])\n    .<span class=\"hljs-keyword\">set</span>(<span class=\"hljs-string\">\'yellow\'</span>, [<span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-string\">\'pineapple\'</span>])\n    .<span class=\"hljs-keyword\">set</span>(<span class=\"hljs-string\">\'purple\'</span>, [<span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-string\">\'plum\'</span>])\n<span class=\"hljs-function\">function <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">color</span>) </span>{\n  <span class=\"hljs-keyword\">return</span> fruitColor.<span class=\"hljs-keyword\">get</span>(color) || []\n}</code></pre><p>或者 使用 <code>Array.filter</code> 实现同样的效果</p>\n<pre><code><span class=\"hljs-keyword\">const</span> fruits = [{\n  <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'apple\'</span>,\n  <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'red\'</span>\n}, {\n  <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'strawberry\'</span>,\n  <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'red\'</span>\n}, {\n  <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'banana\'</span>,\n  <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'yellow\'</span>\n}]\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">color</span>) </span>{\n  <span class=\"hljs-keyword\">return</span> fruits.filter(<span class=\"hljs-function\"><span class=\"hljs-params\">f</span> =&gt;</span> f.color == color)\n}</code></pre><h2 id=\"5-array-every-array-some-\">5. 使用 Array.every 和 Array.some 来处理全部/部分满足条件</h2>\n<pre><code><span class=\"hljs-keyword\">const</span> fruits = [\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'red\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'yellow\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'purple\'</span> }\n  ];\n\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\"></span>) </span>{\n  <span class=\"hljs-keyword\">let</span> isAllRed = <span class=\"hljs-literal\">true</span>;\n\n  <span class=\"hljs-comment\">// 条件：所有的水果都必须是红色</span>\n  <span class=\"hljs-keyword\">for</span> (<span class=\"hljs-keyword\">let</span> f <span class=\"hljs-keyword\">of</span> fruits) {\n    <span class=\"hljs-keyword\">if</span> (!isAllRed) <span class=\"hljs-keyword\">break</span>;\n    isAllRed = (f.color == <span class=\"hljs-string\">\'red\'</span>);\n  }\n\n  <span class=\"hljs-built_in\">console</span>.log(isAllRed); <span class=\"hljs-comment\">// false</span>\n}</code></pre><p>使用 <code>Array.every</code> 来缩减代码</p>\n<pre><code><span class=\"hljs-keyword\">const</span> fruits = [\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'red\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'yellow\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'purple\'</span> }\n  ];\n\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\"></span>) </span>{\n  <span class=\"hljs-comment\">// 条件：（简短形式）所有的水果都必须是红色</span>\n  <span class=\"hljs-keyword\">const</span> isAllRed = fruits.every(<span class=\"hljs-function\"><span class=\"hljs-params\">f</span> =&gt;</span> f.color == <span class=\"hljs-string\">\'red\'</span>);\n\n  <span class=\"hljs-built_in\">console</span>.log(isAllRed); <span class=\"hljs-comment\">// false</span>\n}</code></pre><p>如果我们想要检查是否有至少一个水果是红色的，我们可以使用 <code>Array.some</code> </p>\n<pre><code><span class=\"hljs-keyword\">const</span> fruits = [\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'red\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'yellow\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'purple\'</span> }\n];\n\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\"></span>) </span>{\n  <span class=\"hljs-comment\">// 条件：至少一个水果是红色的</span>\n  <span class=\"hljs-keyword\">const</span> isAnyRed = fruits.some(<span class=\"hljs-function\"><span class=\"hljs-params\">f</span> =&gt;</span> f.color == <span class=\"hljs-string\">\'red\'</span>);\n\n  <span class=\"hljs-built_in\">console</span>.log(isAnyRed); <span class=\"hljs-comment\">// true</span>\n}\n</code></pre>', 'http://img.bfrontend.com/es6.png', NULL, 0);
INSERT INTO `blog_post` VALUES (13, 46, 'md', 5, 1, 1, 0, 0, 52, 0, 1, 1541747394421, 0, 1541747394421, 1548080925869, 'class 在 ES6/ES5 中的实现', 'js,class', '<p>class 在 ES6/ES5 中的实现</p>\n', '', '<h2 id=\"1-es6-class-\">1. ES6 class 的简单实现</h2>\n<pre><code><span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">Animal</span> </span>{\n  <span class=\"hljs-keyword\">constructor</span> (options) {\n    <span class=\"hljs-keyword\">this</span>.options = options\n  }\n\n  eat () {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'i can eat\'</span>)\n  }\n}</code></pre><blockquote>\n<p>ES6 -&gt; babel -&gt; ES5  es6转换为es5的结果</p>\n</blockquote>\n<pre><code><span class=\"hljs-meta\">\'use strict\'</span>;\n\n<span class=\"hljs-keyword\">var</span> _createClass = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\"></span>) </span>{\n    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">defineProperties</span>(<span class=\"hljs-params\">target, props</span>) </span>{\n        <span class=\"hljs-keyword\">for</span> (<span class=\"hljs-keyword\">var</span> i = <span class=\"hljs-number\">0</span>; i &lt; props.length; i++) {\n          <span class=\"hljs-keyword\">var</span> descriptor = props[i];\n          descriptor.enumerable = descriptor.enumerable || <span class=\"hljs-literal\">false</span>;\n          descriptor.configurable = <span class=\"hljs-literal\">true</span>;\n          <span class=\"hljs-keyword\">if</span> (<span class=\"hljs-string\">\"value\"</span> <span class=\"hljs-keyword\">in</span> descriptor) descriptor.writable = <span class=\"hljs-literal\">true</span>;\n          <span class=\"hljs-built_in\">Object</span>.defineProperty(target, descriptor.key, descriptor);\n        }\n    }\n\n    <span class=\"hljs-keyword\">return</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span>(<span class=\"hljs-params\">Constructor, protoProps, staticProps</span>) </span>{\n        <span class=\"hljs-keyword\">if</span> (protoProps) defineProperties(Constructor.prototype, protoProps);\n        <span class=\"hljs-keyword\">if</span> (staticProps) defineProperties(Constructor, staticProps);\n        <span class=\"hljs-keyword\">return</span> Constructor;\n      };\n}();\n\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">_classCallCheck</span> (<span class=\"hljs-params\">instance, Constructor</span>) </span>{\n    <span class=\"hljs-keyword\">if</span> (!(instance <span class=\"hljs-keyword\">instanceof</span> Constructor)) {\n        <span class=\"hljs-keyword\">throw</span> <span class=\"hljs-keyword\">new</span> <span class=\"hljs-built_in\">TypeError</span>(<span class=\"hljs-string\">\'Cannot call a class as a function\'</span>)\n    }\n}\n\n<span class=\"hljs-keyword\">var</span> Animal = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\">options</span>) </span>{\n    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">Animal</span> (<span class=\"hljs-params\">options</span>) </span>{\n        _classCallCheck(<span class=\"hljs-keyword\">this</span>, Animal);\n        <span class=\"hljs-keyword\">this</span>.options = options;\n    }\n\n    _createClass (Animal, [{\n        <span class=\"hljs-attr\">key</span>: <span class=\"hljs-string\">\'eat\'</span>,\n        <span class=\"hljs-attr\">value</span>: <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">eat</span>(<span class=\"hljs-params\"></span>) </span>{\n            <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'i can eat\'</span>)\n        }\n    }])\n    <span class=\"hljs-keyword\">return</span> Animal;\n}();</code></pre><h2 id=\"es5-class-\">ES5 class 的实现</h2>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">Animal</span> (<span class=\"hljs-params\">options</span>) </span>{\n  <span class=\"hljs-keyword\">if</span> (!(<span class=\"hljs-keyword\">this</span> <span class=\"hljs-keyword\">instanceof</span> Animal)) {\n    <span class=\"hljs-keyword\">throw</span> <span class=\"hljs-keyword\">new</span> <span class=\"hljs-built_in\">TypeError</span>(<span class=\"hljs-string\">\'Cannot call a class as a function\'</span>)\n  }\n  <span class=\"hljs-keyword\">this</span>.options = options\n}\nAnimal.prototype.eat = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\"></span>) </span>{\n  <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'i can eat\'</span>)\n}</code></pre>', '', NULL, 1);
INSERT INTO `blog_post` VALUES (14, 49, 'md', 5, 1, 1, 0, 0, 8, 0, 0, 1542008862083, 0, 1542008862083, 1548080889242, 'asdf', 'asdf', '<p>asdf</p>\n', 'asdf', '<p>asdfasdf</p>\n', '', NULL, 1);
INSERT INTO `blog_post` VALUES (15, 46, 'md', 5, 1, 1, 0, 0, 4, 0, 0, 1547975332078, 0, 1547975332078, NULL, '相册测试', '生活', '<p>文章摘要</p>\n', '', '<h1 id=\"-\">文章正文</h1>\n<p><img src=\"http://img.bfrontend.com/p2539661066_看图王.jpg\" alt=\"p2539661066_看图王\"></p>\n', 'http://img.bfrontend.com/favicon.ico', NULL, 0);
INSERT INTO `blog_post` VALUES (16, 46, 'html', 5, 1, 1, 1, 1, 2, 0, 0, 1548077723884, 0, 1548077723884, NULL, '富文本测试', '富文本', '<p>文章摘要</p>\n', '', '<p><span style=\"font-weight: bold;\">你好</span><br></p><h3><span style=\"font-weight: normal;\">这里是使用富文本编辑的文章内容</span></h3><div><p><br></p></div>', 'http://img.bfrontend.com/1670c4f7c0eee292.jpg', NULL, 0);
INSERT INTO `blog_post` VALUES (17, 46, 'html', 5, 1, 1, 1, 1, 0, 0, 0, 1548077826366, 0, 1548077826366, 1548078686088, '富文本测试', '富文本', '<p>文章摘要</p>\n', '', '<p><span style=\"font-weight: bold;\">你好</span><br></p><h3><span style=\"font-weight: normal;\">这里是使用富文本编辑的文章内容</span></h3><div><p><br></p></div>', 'http://img.bfrontend.com/1670c4f7c0eee292.jpg', NULL, 1);
INSERT INTO `blog_post` VALUES (18, 46, 'md', 5, 1, 1, 0, 0, 1, 0, 0, 1548078230988, 0, 1548078230988, 1548078253870, 'xx', 'xx', '<p>asdfasdf</p>\n', 'xx', '<p>asdfasdf</p>\n', '', NULL, 1);
INSERT INTO `blog_post` VALUES (19, 51, 'md', 5, 1, 1, 0, 0, 0, 0, 0, 1548078852313, 0, 1548078852313, 1548080769071, 'asdf', 'asdf', '<p>文章摘要</p>\n', 'asdf', '<p>草稿箱文章</p>\n', 'http://img.bfrontend.com/favicon.ico', NULL, 1);
INSERT INTO `blog_post` VALUES (20, 49, 'md', 5, 1, 1, 0, 0, 1, 0, 0, 1548078943141, 0, 0, NULL, '草稿箱', '草稿箱文章', '<p>这里是草稿箱文章摘要</p>\n', 'xx ', '<p>草稿箱文章内容</p>\n', '', NULL, 0);
INSERT INTO `blog_post` VALUES (21, 49, 'md', 5, 1, 1, 0, 0, 1, 0, 0, 1548082361502, 0, 0, NULL, '存入草稿箱', '草稿箱', '<h2 id=\"-\">文章摘要</h2>\n<ol>\n<li>要点1</li>\n<li>要点2</li>\n<li>要点3</li>\n</ol>\n<blockquote>\n<p> jiasdf<br>```</p>\n</blockquote>\n<div>我是测试代码</div>\n```', 'ASDF', '<h1 id=\"-\">这里是正文内容</h1>\n<h2 id=\"-\">正在测试</h2>\n<blockquote>\n<p>ajiasdf<br>a sdfajisdf</p>\n</blockquote>\n', 'http://img.bfrontend.com/1670c4f7c0eee292.jpg', NULL, 0);
INSERT INTO `blog_post` VALUES (22, 52, 'md', 5, 1, 1, 0, 0, 1, 0, 0, 1548083476088, 0, 1548083476088, NULL, '压力是成功的动力', '压力是成功的动力', '<p>压力，是每个人成长路上必须要经历的东西，通俗一点就是磨难，包括你在工作或者生活当中碰到的，无压力就没有动力，在我看来是这样的，无压一身轻的确是，但你确很难做动事情。其实这些东西都是我通过实践里一步步摸索出来的。</p>\n', 'xxx', '<p>压力，是每个人成长路上必须要经历的东西，通俗一点就是磨难，包括你在工作或者生活当中碰到的，无压力就没有动力，在我看来是这样的，无压一身轻的确是，但你确很难做动事情。其实这些东西都是我通过实践里一步步摸索出来的。</p>\n<p>有句话是这么说的，叫做失败是成功之母，没错，在我看来，压力就是成功之父了哈哈。不过过了头可不行，适当的压力会促使你进步成长，过度的沉浸在压力的洗涤下，那么很容易产生所谓的抑郁症，属于精神疾病的一种，最近在网上看了好多新闻，有学生，也有进入社会工作的基层人员，甚至是一些年纪大的到了管理阶层的。他们都被压力所打败，包括学习的压力也好，工作的压力也好，甚至是家庭公司给你的压力。没理解好就很容易产生自卑心理，拿自己和别人一对比，一下子好和坏，优与劣一些子就显示出来了。</p>\n<p>拿我自己举例子的话，我从14年迈入社会到18年底也有五年的时间了，这短短五年的时间里笼罩在我脑海里有许多数不清的回忆，有的美好幸福，有的悲伤忧愤，甚至于有的悲天怨地。第一个就是社会经验和自己心态不行的问题，还有一个没有正确的把握好压力。有两次公司安排拓展培训，都说必须去，其中有一个项目我特别忌惮，当然老板叫我们去也是为了不让我们过度感觉到压力。项目的名字我不记得了，反正就是高空项目，我记得我是倒数第二个上去的，而最后一个上的就是老板，当然他没什么问题，我腿看到下面就直哆嗦，那个表情恐怕我也一辈子不会望去。</p>\n<p>整个公司的人就我一个人占用时间最长，丢脸丢到家了，而且还拍了照片过来。那时候我很羞涩。好像才刚刚成年吧，也不怎么懂事。如果让我现在去的话应该没什么问题了。有成功就有失败，有欢喜就有悲伤，有酸甜苦辣就有喜怒哀乐。要不怎么说人是最复杂的高级动物那，就是这么回事。有压力就有动力，越说越有道理。拿我今年那个工作来说其实就是销售，你业绩不好的时候心里很复杂，各种各样交杂的情绪油然而生。但你业绩好的时候就会很开心，不过来面试的人很多，但真正能坚持下来的太少了，后面因为一些特殊原因没做了，如果我受不住压力可能在试用期前七天我就离职了。</p>\n<p>可以说今年和前几年的变化有很多，感觉比原来成熟了，懂得一点怎么去释怀压力，甚至去利用压力去达到自己的目的了。每个人都有自己的童年，但是你要懂得适可而止，目前的你是什么样子，未来你要把自己到达一个什么样的高度，然后其中遇到了苦难压力是不是知难而退。未来前进方向上到达终点站树立几个阶段性目标，当然你不可能一下子就到达，想起来是那么简单，但做起来其实很难的。人与人之间互相尊重是没错的，但这社会没有绝对的公平，千军易得，一将难求，要看看你是想一直做基层奋斗的士兵那，还是想做统领千军万马的将军。这个还是很有讲究的，关键看你自己怎么做。</p>\n<p>未来的路，可能会迷茫不知所措，在黑暗的角落里没有人能照清你，最主要的还是要自己学会释怀。</p>\n', 'http://img.bfrontend.com/timg2.jpg', NULL, 0);

-- ----------------------------
-- Table structure for blog_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `blog_recycle_bin`;
CREATE TABLE `blog_recycle_bin`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NULL DEFAULT 0 COMMENT '删除内容 id',
  `create_time` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `table_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = ' 回收站' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_recycle_bin
-- ----------------------------
INSERT INTO `blog_recycle_bin` VALUES (10, 18, 1548078253817, 'blog_post', 'xx', 5);
INSERT INTO `blog_recycle_bin` VALUES (11, 17, 1548078685987, 'blog_post', '富文本测试', 5);
INSERT INTO `blog_recycle_bin` VALUES (12, 19, 1548080769021, 'blog_post', 'asdf', 5);
INSERT INTO `blog_recycle_bin` VALUES (13, 14, 1548080889168, 'blog_post', 'asdf', 5);
INSERT INTO `blog_recycle_bin` VALUES (14, 13, 1548080925856, 'blog_post', 'class 在 ES6/ES5 中的实现', 5);

-- ----------------------------
-- Table structure for blog_setting
-- ----------------------------
DROP TABLE IF EXISTS `blog_setting`;
CREATE TABLE `blog_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设置的类型',
  `data` json NULL COMMENT 'json格式的key-value',
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
  `isdelete` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '是否已删除1:已删2:未删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (3, 1, 0, 0, 'js', 0);
INSERT INTO `blog_tag` VALUES (4, 1, 1, 0, 'html', 0);
INSERT INTO `blog_tag` VALUES (5, 1, 0, 0, 'vue', 0);
INSERT INTO `blog_tag` VALUES (6, 1, 0, 0, 'react', 0);
INSERT INTO `blog_tag` VALUES (7, 1, 0, 0, 'sass', 0);
INSERT INTO `blog_tag` VALUES (8, 1, 0, 0, '励志', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag_post
-- ----------------------------
INSERT INTO `blog_tag_post` VALUES (8, 3, 12, 1);
INSERT INTO `blog_tag_post` VALUES (9, 3, 13, 1);
INSERT INTO `blog_tag_post` VALUES (10, 3, 14, 1);
INSERT INTO `blog_tag_post` VALUES (11, 4, 15, 1);
INSERT INTO `blog_tag_post` VALUES (12, 4, 16, 1);
INSERT INTO `blog_tag_post` VALUES (13, 3, 16, 1);
INSERT INTO `blog_tag_post` VALUES (14, 5, 16, 1);
INSERT INTO `blog_tag_post` VALUES (15, 4, 17, 1);
INSERT INTO `blog_tag_post` VALUES (16, 3, 17, 1);
INSERT INTO `blog_tag_post` VALUES (17, 5, 17, 1);
INSERT INTO `blog_tag_post` VALUES (18, 3, 18, 1);
INSERT INTO `blog_tag_post` VALUES (19, 4, 19, 1);
INSERT INTO `blog_tag_post` VALUES (20, 5, 20, 1);
INSERT INTO `blog_tag_post` VALUES (21, 4, 21, 1);
INSERT INTO `blog_tag_post` VALUES (22, 8, 22, 1);

-- ----------------------------
-- Table structure for blog_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_third_party_user`;
CREATE TABLE `blog_third_party_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '本站用户id',
  `last_login_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `expire_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'access_token过期时间',
  `create_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '绑定时间',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展信息',
  PRIMARY KEY (`id`, `expire_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '第三方用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_third_party_user
-- ----------------------------
INSERT INTO `blog_third_party_user` VALUES (5, 33, 1541053834963, 0, 1541053834963, 0, 1, 'heartdream', 'github', '', '', '29cf14a9caf4dc4d629c1de973c14643940ac7e3', '40289489', '', NULL);

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
  `user_activation_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '激活码',
  `islive` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展属性',
  `isdelete` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_login`(`user_login`) USING BTREE,
  INDEX `user_nickname`(`user_nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES (5, 3, 1, '0', 0, 0, 0, 0.00, 0, 1, 'bfrontend', 'e10adc3949ba59abbe56e057f20f883e', 'bfrontend', '', 'bfrontend website', 'http://img.bfrontend.com/banner2.png', 'bfrontend 个性签名', '', '', NULL, '0', NULL, 0);
INSERT INTO `blog_user` VALUES (12, 2, 2, '2018-10-08', 0, 0, 0, 0.00, 0, 1, 'testuser', '5d9c68c6c50ed3d02a2fcf54f63993b6', '测试员', '', '我是测试员的网址', 'http://img.bfrontend.com/testperson.jpg', '勤劳的测试员', '', '', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXIiOiJ0ZXN0dXNlciIsImVtYWlsIjoiMTc2MjU0OTI0MjRAMTYzLmNvbSJ9LCJleHAiOjE1Mzk4MzIxNDcsImlhdCI6MTUzOTc0NTc0N30.nXk9QPFwvXM60-h9OKgJ6rM_Fd_8ZIhnsxuVmnnDHO7us7viRajXH0x3KGr7z4G-uAnTbFIjE_jExP937-mDkdxIOCxQubWcHWrVicp5jO9LBiCKiwPTCnPUWCIHtZlq1PQxusNdrH7OoIicvpLf1e43YvmhhTYsaOUZVwAK8YYbD1E31cElDmzM7aEAwrmpuzdGkBnR1JHe_StObkGDfTRZ8kdkVDxsJZ50tBiE3nprhx0OjV56Et4c6rtz4w19UikY3c9GC4CuHAQYtvNf0vB2FkJlLgav1beii9oP4a6Nm-8L2JYZAFUZVRIIJEkB7zbwHMTdbTyrNRJFhwSQaw', '1', NULL, 0);
INSERT INTO `blog_user` VALUES (14, 1, 0, '', 0, 0, 0, 0.00, 0, 1, 'msobj', '5d41402abc4b2a76b9719d911017c592', 'msobj', '', '', '', '', '', '', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXIiOiJtc29iaiIsImVtYWlsIjoiMTc2MjU0OTI0MjRAMTYzLmNvbSJ9LCJleHAiOjE1Mzk4NTI2MTMsImlhdCI6MTUzOTc2NjIxM30.fUYchOPZTnDJUCaiPmM6mTuHgQDDLqKh0J-N17I8NKdKRiNjitOposRcLbKsifK4_lDiKPUD0brA6hc_GF1l-gg50QAR3Ylu0e-39oalLF7qBnr7Q-uMvIfjAox6OwDHOazBvxyJyFZWnnMKTyYj8BwbnYl9eJqSm1TOvbC8mHWgUW2oB6TsHTBd7ZFp6dKU4iv7iHDLF4-jjW3cGBrVyGAXTMJLx5AwZthpUu3AC61vSdQ6Kxp_MVQvtP9IMhmG4Onit1rbaTjnW4IcaSXmCeaQeqTC6laiPztaUV48MXWa1vmOF_xxu20RNVq5uMEpBvQMWGvdMacT7yDLo02A4w', '1', NULL, 0);
INSERT INTO `blog_user` VALUES (33, 1, 0, '0', 1541053834894, 0, 0, 0.00, 1541053834894, 1, '', '', 'heartdream', 'null', '', 'https://avatars2.githubusercontent.com/u/40289489?v=4', '', '', '', NULL, '0', NULL, 0);

-- ----------------------------
-- Table structure for blog_user_dislike
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_dislike`;
CREATE TABLE `blog_user_dislike`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户 id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '内容原来的主键id',
  `create_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户讨厌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_dislike
-- ----------------------------
INSERT INTO `blog_user_dislike` VALUES (1, 5, 82, 1541750705112);

-- ----------------------------
-- Table structure for blog_user_like
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_like`;
CREATE TABLE `blog_user_like`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户 id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '内容原来的主键id',
  `create_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_like
-- ----------------------------
INSERT INTO `blog_user_like` VALUES (2, 5, 82, 1541750573127);

-- ----------------------------
-- Table structure for blog_user_like_copy1
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_like_copy1`;
CREATE TABLE `blog_user_like_copy1`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户 id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '内容原来的主键id',
  `create_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_like_copy1
-- ----------------------------
INSERT INTO `blog_user_like_copy1` VALUES (2, 5, 82, 1541750573127);
INSERT INTO `blog_user_like_copy1` VALUES (3, 33, 83, 1541915897197);
INSERT INTO `blog_user_like_copy1` VALUES (4, 33, 90, 1541916765613);
INSERT INTO `blog_user_like_copy1` VALUES (5, 33, 91, 1541916804404);

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户客户端登录 token 表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_token
-- ----------------------------
INSERT INTO `blog_user_token` VALUES (23, 5, 1548166997899, 1548080597899, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjo1fSwiZXhwIjoxNTQ4Njg1Mzk3LCJpYXQiOjE1NDgwODA1OTd9.JhX-ubF3w9zwIwVjV9vp_1hdvVWjYWkeJpgI0K7dk3xoo0W1p0TvIeVqWe68d-M3n5HGNDqbaQ7bJdPts85edqqcPR7KF9qZuVfBoUHBQAB9pEj9Rl9pwiF6Z830EXhYrFTYEgPD7cnck-dv9tDDum7W5s-VmfvxGzcTQuRbLBMsnXka_QZSNyInk3hThhTpRQI5xMBVKkvLeVumli24h5TfeLVwJQ12EfXxClnjESk_gkKJy9JVRPP3syEy2LZkqPb4LlrttvOe0nKYoEm8iivLn5eH4yc9BzxrPuIITar6F4THFgwKrmhwdtRzXCPYWtAApD3HE82SwIRfdHe3Gw', '', '::1');

SET FOREIGN_KEY_CHECKS = 1;
