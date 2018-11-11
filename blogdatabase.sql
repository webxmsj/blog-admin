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

 Date: 11/11/2018 16:08:46
*/

SET NAMES utf8;
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
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `seo_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展属性',
  `create_time` bigint(20) NULL DEFAULT NULL,
  `isdelete` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 2 COMMENT '是否已删除1:已删2:未删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (38, 0, 0, 1, 0, 10000, '旅行随感', '到处流浪的感受', '0', '', '', '', NULL, 1539938197992, 0);
INSERT INTO `blog_category` VALUES (39, 0, 0, 1, 0, 10000, '技术文章', '技术人的天地', '1', '', '', '', NULL, 1539938230613, 0);
INSERT INTO `blog_category` VALUES (40, 0, 0, 1, 0, 10000, '西藏之行', '别有风味的西藏行', '0,0', '心灵对话', '心灵对话', '心灵对话', NULL, 1540172081184, 0);
INSERT INTO `blog_category` VALUES (42, 0, 0, 1, 0, 10000, '云南之行', '彩云之南', '0,1', '', '', '', NULL, 1540178639434, 0);
INSERT INTO `blog_category` VALUES (44, 0, 0, 1, 0, 10000, '修改阿里', '人文丰富的阿里地区', '0,0,0', '', '', '', NULL, 1540261053138, 0);
INSERT INTO `blog_category` VALUES (45, 0, 0, 1, 0, 10000, '测试文章', '一个进行测试的类别', '2', 'test', 'test', 'test', NULL, 1540794581260, 0);
INSERT INTO `blog_category` VALUES (46, 0, 0, 1, 0, 10000, 'javascript', 'javascript', '1,0', 'javascript', 'javascript', 'javascript', NULL, 1541405152118, 2);
INSERT INTO `blog_category` VALUES (47, 0, 0, 1, 0, 10000, 'css', 'css', '1,1', 'css', 'css', 'css', NULL, 1541405163045, 2);
INSERT INTO `blog_category` VALUES (48, 0, 0, 1, 0, 10000, 'html', 'html', '1,2', 'html', 'html', 'html', NULL, 1541405173229, 2);
INSERT INTO `blog_category` VALUES (49, 0, 0, 1, 0, 10000, 'test1', 'test1', '2,0', 'test1', 'test1', 'test1', NULL, 1541406829289, 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category_post
-- ----------------------------
INSERT INTO `blog_category_post` VALUES (7, 12, 46, 10000, 1);
INSERT INTO `blog_category_post` VALUES (8, 13, 46, 10000, 1);

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
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `table_id_status`(`status`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES (82, NULL, 33, NULL, 1, 1, 0, 1541746458732, NULL, 1, 'heartdream', 'null', '0', 12, '写较少的if判断，可以优化阅读体验', NULL);
INSERT INTO `blog_comment` VALUES (83, NULL, 33, NULL, 1, 0, 1, 1541746670118, NULL, 1, 'heartdream', 'null', '1', 12, '你好，我再好好看看', NULL);
INSERT INTO `blog_comment` VALUES (84, NULL, 33, NULL, 0, 0, 2, 1541746725712, NULL, 1, 'heartdream', 'null', '2', 12, 'test', NULL);
INSERT INTO `blog_comment` VALUES (85, NULL, 33, NULL, 0, 0, 3, 1541746899696, NULL, 1, 'heartdream', 'null', '3', 12, 'aaaa', NULL);
INSERT INTO `blog_comment` VALUES (86, NULL, 33, NULL, 0, 0, 4, 1541746976383, NULL, 1, 'heartdream', 'null', '4', 12, 'asdf', NULL);
INSERT INTO `blog_comment` VALUES (87, NULL, 33, NULL, 0, 0, 5, 1541747072271, NULL, 1, 'heartdream', 'null', '5', 12, 'bbbb', NULL);
INSERT INTO `blog_comment` VALUES (88, NULL, 5, NULL, 0, 0, 6, 1541825165143, NULL, 1, 'bfrontend', NULL, '6', 12, '你好', NULL);
INSERT INTO `blog_comment` VALUES (89, NULL, 33, NULL, 0, 0, 7, 1541916454024, NULL, 1, 'heartdream', 'null', '7', 12, 'test', NULL);
INSERT INTO `blog_comment` VALUES (90, NULL, 33, NULL, 1, 0, 8, 1541916468611, NULL, 1, 'heartdream', 'null', '8', 13, 'bbb', NULL);
INSERT INTO `blog_comment` VALUES (91, NULL, 33, NULL, 1, 0, 0, 1541916468612, NULL, 1, 'heartdream', 'null', '0', 13, 'bbb', NULL);
INSERT INTO `blog_comment` VALUES (92, 91, 33, 33, 0, 0, 0, 1541918443055, NULL, 1, 'heartdream', 'null', '0,0', 13, 'nihao', NULL);
INSERT INTO `blog_comment` VALUES (93, NULL, 33, NULL, 0, 0, 8, 1541920613908, NULL, 1, 'heartdream', 'null', '8', 12, 'aa\'asdf\'', NULL);
INSERT INTO `blog_comment` VALUES (94, NULL, 33, NULL, 0, 0, 9, 1541920797395, NULL, 1, 'heartdream', 'null', '9', 12, 'asdf', NULL);

-- ----------------------------
-- Table structure for blog_link
-- ----------------------------
DROP TABLE IF EXISTS `blog_link`;
CREATE TABLE `blog_link`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT 0 COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情链接表' ROW_FORMAT = Dynamic;

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
  `post_format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '内容格式; html、md',
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
  `post_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `post_thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展属性,如缩略图;格式为json',
  `isdelete` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_status_date`(`post_status`, `create_time`, `id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_post
-- ----------------------------
INSERT INTO `blog_post` VALUES (12, 46, 'md', 5, 0, 1, 0, 0, 51, 0, 10, 1541746005219, 0, 1541746005219, NULL, '小技巧写出更好的javascript条件语句', 'js', '<p>小技巧写出更好的javascript条件语句</p>\n', 'https://scotch.io/tutorials/5-tips-to-write-better-conditionals-in-javascript', '<h2 id=\"1-array-includes-\">1. 使用<code>Array.includes</code>来处理多重条件</h2>\n<p>使用前：</p>\n<pre><code><span class=\"hljs-comment\">// 条件语句</span>\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">fruit</span>) </span>{\n  <span class=\"hljs-keyword\">if</span> (fruit == <span class=\"hljs-string\">\'apple\'</span> || fruit == <span class=\"hljs-string\">\'redjujube\'</span>) {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'red\'</span>);\n  }\n}</code></pre><p>乍一看，这么些似乎没有什么大问题。然而，如果我们想要匹配更多的红色水果呢，比如说[火龙果]和[草莓]？我们是不是得用更多的 <code>||</code> 来扩展这条语句？<br>我们可以使用 <code>Array.includes</code> 重写以上条件句。</p>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">fruit</span>) </span>{\n  <span class=\"hljs-comment\">// 将条件提取到数组中</span>\n  <span class=\"hljs-keyword\">const</span> redFruits = [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>, <span class=\"hljs-string\">\'cherry\'</span>, <span class=\"hljs-string\">\'cranberries\'</span>]\n\n  <span class=\"hljs-keyword\">if</span> (redFruits.includes(fruit)) {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'red\'</span>)\n  }\n}</code></pre><h2 id=\"2-\">2. 少写嵌套，尽早返回</h2>\n<p>让我们为之前的例子添加两个条件：</p>\n<ul>\n<li>如果没有提供水果，抛出错误。</li>\n<li>如果该水果的数量大于10，将其打印出来</li>\n</ul>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">fruit, quantity</span>) </span>{\n  <span class=\"hljs-keyword\">const</span> redFruits = [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>, <span class=\"hljs-string\">\'cherry\'</span>, <span class=\"hljs-string\">\'cranberries\'</span>]\n\n  <span class=\"hljs-keyword\">if</span> (fruit) {\n    <span class=\"hljs-keyword\">if</span> (redFruits.includes(fruit)) {\n      <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'red\'</span>)\n\n      <span class=\"hljs-keyword\">if</span> (quantity &gt; <span class=\"hljs-number\">10</span>) {\n        <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'big quantity\'</span>)\n      }\n    }\n  } <span class=\"hljs-keyword\">else</span> {\n    <span class=\"hljs-keyword\">throw</span> <span class=\"hljs-keyword\">new</span> <span class=\"hljs-built_in\">Error</span>(<span class=\"hljs-string\">\'No fruit\'</span>)\n  }\n}</code></pre><p>让我们回顾上面的代码,我们有：</p>\n<ul>\n<li>1个if/else语句来筛选无效的条件</li>\n<li>3层if 语句嵌套</li>\n</ul>\n<ol>\n<li>减少嵌套</li>\n</ol>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">fruit, quantity</span>) </span>{\n  <span class=\"hljs-keyword\">const</span> redFruits = [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>, <span class=\"hljs-string\">\'cherry\'</span>, <span class=\"hljs-string\">\'cranberries\'</span>]\n\n  <span class=\"hljs-keyword\">if</span> (!fruit) <span class=\"hljs-keyword\">throw</span> <span class=\"hljs-keyword\">new</span> <span class=\"hljs-built_in\">Error</span>(<span class=\"hljs-string\">\'No fruit\'</span>)\n\n  <span class=\"hljs-keyword\">if</span> (redFruits.includes(fruit)) {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'red\'</span>)\n\n    <span class=\"hljs-keyword\">if</span> (quantity &gt; <span class=\"hljs-number\">10</span>) {\n      <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'big quantity\'</span>)\n    }\n  }\n}</code></pre><p>// 不推荐使用以下此版本</p>\n<ul>\n<li>条件反转会导致更多的思考过程(增加认知负担)</li>\n<li>进一步减少嵌套</li>\n</ul>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">fruit, quantity</span>) </span>{\n  <span class=\"hljs-keyword\">const</span> redFruits = [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>, <span class=\"hljs-string\">\'cherry\'</span>, <span class=\"hljs-string\">\'cranberries\'</span>]\n\n  <span class=\"hljs-keyword\">if</span> (!fruit) <span class=\"hljs-keyword\">throw</span> <span class=\"hljs-keyword\">new</span> <span class=\"hljs-built_in\">Error</span>(<span class=\"hljs-string\">\'No fruit\'</span>)\n  <span class=\"hljs-keyword\">if</span> (!redFruits.includes(fruit)) <span class=\"hljs-keyword\">return</span> ;\n\n  <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'red\'</span>)\n\n  <span class=\"hljs-keyword\">if</span> (quantity &gt; <span class=\"hljs-number\">10</span>) {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'big quantity\'</span>)\n  }\n}</code></pre><h2 id=\"3-\">3. 使用函数默认参数和解构</h2>\n<p>在javascript 中我们经常需要检查<code>null</code>/<code>undefined</code>并赋予默认值</p>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\">fruit,quantity</span>) </span>{\n  <span class=\"hljs-keyword\">if</span> (!fruit) <span class=\"hljs-keyword\">return</span>;\n  <span class=\"hljs-keyword\">const</span> q = quantity || <span class=\"hljs-number\">1</span>; <span class=\"hljs-comment\">// 如果没有提供 quantity, 默认为1</span>\n  <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">`we have <span class=\"hljs-subst\">${q}</span> <span class=\"hljs-subst\">${fruit}</span>`</span>)\n}</code></pre><p>事实上我们可以通过函数的默认参数来去掉变量 <code>q</code></p>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\">fruit,quantity = <span class=\"hljs-number\">1</span></span>) </span>{\n  <span class=\"hljs-keyword\">if</span> (!fruit) <span class=\"hljs-keyword\">return</span>;\n  <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">`we have <span class=\"hljs-subst\">${q}</span> <span class=\"hljs-subst\">${fruit}</span>`</span>)\n}</code></pre><p>那么如果<code>fruit</code>是一个对象(Object)呢？我们还可以使用默认参数吗？</p>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\">fruit</span>) </span>{\n  <span class=\"hljs-keyword\">if</span> (fruit &amp;&amp; fruit.name) {\n    <span class=\"hljs-built_in\">console</span>.log(fruit.name)\n  } <span class=\"hljs-keyword\">else</span> {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'unknown\'</span>)\n  }\n}</code></pre><p>观察上面的例子，当水果名称属性存在时，我们希望将其打印出来，否则打印<code>unknown</code>，我们可以通过默认参数和解构赋值的方法来避免写出<code>fruit &amp;&amp; fruit.name</code> 这种条件</p>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\">{name} = {}</span>) </span>{\n  <span class=\"hljs-built_in\">console</span>.log(name || <span class=\"hljs-string\">\'unknown\'</span>)\n}</code></pre><p>既然我们只需要fruit的<code>name</code>属性,我们可以使用<code>{name}</code>来将其解构出来，之后我们就可以在代码中使用<code>name</code>变量来取代<code>fruit.name</code></p>\n<h2 id=\"4-switch-map-object-\">4. 相较于switch ,Map/Object 也许是更好的选择</h2>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">color</span>) </span>{\n  <span class=\"hljs-keyword\">switch</span> (color) {\n    <span class=\"hljs-keyword\">case</span> <span class=\"hljs-string\">\'red\'</span>:\n      <span class=\"hljs-keyword\">return</span> [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>]\n    <span class=\"hljs-keyword\">case</span> <span class=\"hljs-string\">\'yellow\'</span>:\n      <span class=\"hljs-keyword\">return</span> [<span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-string\">\'pineapple\'</span>]\n    <span class=\"hljs-keyword\">case</span> <span class=\"hljs-string\">\'purple\'</span>:\n      <span class=\"hljs-keyword\">return</span> [<span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-string\">\'plum\'</span>]\n    <span class=\"hljs-keyword\">default</span>:\n      <span class=\"hljs-keyword\">return</span> []\n  }\n}</code></pre><p>使用对象字面量来进行优化</p>\n<pre><code><span class=\"hljs-keyword\">const</span> fruitColor = {\n  <span class=\"hljs-attr\">red</span>: [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>],\n  <span class=\"hljs-attr\">yellow</span>: [<span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-string\">\'pineapple\'</span>],\n  <span class=\"hljs-attr\">purple</span>: [<span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-string\">\'plum\'</span>]\n}\n\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">color</span>) </span>{\n  <span class=\"hljs-keyword\">return</span> fruitColor[color] || []\n}</code></pre><p>或者使用 <code>Map</code> 来实现同样的效果</p>\n<pre><code><span class=\"hljs-keyword\">const</span> fruitColor = <span class=\"hljs-keyword\">new</span> Map()\n    .<span class=\"hljs-keyword\">set</span>(<span class=\"hljs-string\">\'red\'</span>, [<span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-string\">\'strawberry\'</span>])\n    .<span class=\"hljs-keyword\">set</span>(<span class=\"hljs-string\">\'yellow\'</span>, [<span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-string\">\'pineapple\'</span>])\n    .<span class=\"hljs-keyword\">set</span>(<span class=\"hljs-string\">\'purple\'</span>, [<span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-string\">\'plum\'</span>])\n<span class=\"hljs-function\">function <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">color</span>) </span>{\n  <span class=\"hljs-keyword\">return</span> fruitColor.<span class=\"hljs-keyword\">get</span>(color) || []\n}</code></pre><p>或者 使用 <code>Array.filter</code> 实现同样的效果</p>\n<pre><code><span class=\"hljs-keyword\">const</span> fruits = [{\n  <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'apple\'</span>,\n  <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'red\'</span>\n}, {\n  <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'strawberry\'</span>,\n  <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'red\'</span>\n}, {\n  <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'banana\'</span>,\n  <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'yellow\'</span>\n}]\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span> (<span class=\"hljs-params\">color</span>) </span>{\n  <span class=\"hljs-keyword\">return</span> fruits.filter(<span class=\"hljs-function\"><span class=\"hljs-params\">f</span> =&gt;</span> f.color == color)\n}</code></pre><h2 id=\"5-array-every-array-some-\">5. 使用 Array.every 和 Array.some 来处理全部/部分满足条件</h2>\n<pre><code><span class=\"hljs-keyword\">const</span> fruits = [\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'red\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'yellow\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'purple\'</span> }\n  ];\n\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\"></span>) </span>{\n  <span class=\"hljs-keyword\">let</span> isAllRed = <span class=\"hljs-literal\">true</span>;\n\n  <span class=\"hljs-comment\">// 条件：所有的水果都必须是红色</span>\n  <span class=\"hljs-keyword\">for</span> (<span class=\"hljs-keyword\">let</span> f <span class=\"hljs-keyword\">of</span> fruits) {\n    <span class=\"hljs-keyword\">if</span> (!isAllRed) <span class=\"hljs-keyword\">break</span>;\n    isAllRed = (f.color == <span class=\"hljs-string\">\'red\'</span>);\n  }\n\n  <span class=\"hljs-built_in\">console</span>.log(isAllRed); <span class=\"hljs-comment\">// false</span>\n}</code></pre><p>使用 <code>Array.every</code> 来缩减代码</p>\n<pre><code><span class=\"hljs-keyword\">const</span> fruits = [\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'red\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'yellow\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'purple\'</span> }\n  ];\n\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\"></span>) </span>{\n  <span class=\"hljs-comment\">// 条件：（简短形式）所有的水果都必须是红色</span>\n  <span class=\"hljs-keyword\">const</span> isAllRed = fruits.every(<span class=\"hljs-function\"><span class=\"hljs-params\">f</span> =&gt;</span> f.color == <span class=\"hljs-string\">\'red\'</span>);\n\n  <span class=\"hljs-built_in\">console</span>.log(isAllRed); <span class=\"hljs-comment\">// false</span>\n}</code></pre><p>如果我们想要检查是否有至少一个水果是红色的，我们可以使用 <code>Array.some</code> </p>\n<pre><code><span class=\"hljs-keyword\">const</span> fruits = [\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'apple\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'red\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'banana\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'yellow\'</span> },\n    { <span class=\"hljs-attr\">name</span>: <span class=\"hljs-string\">\'grape\'</span>, <span class=\"hljs-attr\">color</span>: <span class=\"hljs-string\">\'purple\'</span> }\n];\n\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">test</span>(<span class=\"hljs-params\"></span>) </span>{\n  <span class=\"hljs-comment\">// 条件：至少一个水果是红色的</span>\n  <span class=\"hljs-keyword\">const</span> isAnyRed = fruits.some(<span class=\"hljs-function\"><span class=\"hljs-params\">f</span> =&gt;</span> f.color == <span class=\"hljs-string\">\'red\'</span>);\n\n  <span class=\"hljs-built_in\">console</span>.log(isAnyRed); <span class=\"hljs-comment\">// true</span>\n}\n</code></pre>', 'http://img.bfrontend.com/es6.png', NULL, 0);
INSERT INTO `blog_post` VALUES (13, 46, 'md', 5, 1, 1, 0, 0, 57, 0, 4, 1541747394421, 0, 1541747394421, NULL, 'class 在 ES6/ES5 中的实现', 'js,class', '<p>class 在 ES6/ES5 中的实现</p>\n', '', '<h2 id=\"1-es6-class-\">1. ES6 class 的简单实现</h2>\n<pre><code><span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">Animal</span> </span>{\n  <span class=\"hljs-keyword\">constructor</span> (options) {\n    <span class=\"hljs-keyword\">this</span>.options = options\n  }\n\n  eat () {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'i can eat\'</span>)\n  }\n}</code></pre><blockquote>\n<p>ES6 -&gt; babel -&gt; ES5  es6转换为es5的结果</p>\n</blockquote>\n<pre><code><span class=\"hljs-meta\">\'use strict\'</span>;\n\n<span class=\"hljs-keyword\">var</span> _createClass = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\"></span>) </span>{\n    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">defineProperties</span>(<span class=\"hljs-params\">target, props</span>) </span>{\n        <span class=\"hljs-keyword\">for</span> (<span class=\"hljs-keyword\">var</span> i = <span class=\"hljs-number\">0</span>; i &lt; props.length; i++) {\n          <span class=\"hljs-keyword\">var</span> descriptor = props[i];\n          descriptor.enumerable = descriptor.enumerable || <span class=\"hljs-literal\">false</span>;\n          descriptor.configurable = <span class=\"hljs-literal\">true</span>;\n          <span class=\"hljs-keyword\">if</span> (<span class=\"hljs-string\">\"value\"</span> <span class=\"hljs-keyword\">in</span> descriptor) descriptor.writable = <span class=\"hljs-literal\">true</span>;\n          <span class=\"hljs-built_in\">Object</span>.defineProperty(target, descriptor.key, descriptor);\n        }\n    }\n\n    <span class=\"hljs-keyword\">return</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span>(<span class=\"hljs-params\">Constructor, protoProps, staticProps</span>) </span>{\n        <span class=\"hljs-keyword\">if</span> (protoProps) defineProperties(Constructor.prototype, protoProps);\n        <span class=\"hljs-keyword\">if</span> (staticProps) defineProperties(Constructor, staticProps);\n        <span class=\"hljs-keyword\">return</span> Constructor;\n      };\n}();\n\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">_classCallCheck</span> (<span class=\"hljs-params\">instance, Constructor</span>) </span>{\n    <span class=\"hljs-keyword\">if</span> (!(instance <span class=\"hljs-keyword\">instanceof</span> Constructor)) {\n        <span class=\"hljs-keyword\">throw</span> <span class=\"hljs-keyword\">new</span> <span class=\"hljs-built_in\">TypeError</span>(<span class=\"hljs-string\">\'Cannot call a class as a function\'</span>)\n    }\n}\n\n<span class=\"hljs-keyword\">var</span> Animal = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\">options</span>) </span>{\n    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">Animal</span> (<span class=\"hljs-params\">options</span>) </span>{\n        _classCallCheck(<span class=\"hljs-keyword\">this</span>, Animal);\n        <span class=\"hljs-keyword\">this</span>.options = options;\n    }\n\n    _createClass (Animal, [{\n        <span class=\"hljs-attr\">key</span>: <span class=\"hljs-string\">\'eat\'</span>,\n        <span class=\"hljs-attr\">value</span>: <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">eat</span>(<span class=\"hljs-params\"></span>) </span>{\n            <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'i can eat\'</span>)\n        }\n    }])\n    <span class=\"hljs-keyword\">return</span> Animal;\n}();</code></pre><h2 id=\"es5-class-\">ES5 class 的实现</h2>\n<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">Animal</span> (<span class=\"hljs-params\">options</span>) </span>{\n  <span class=\"hljs-keyword\">if</span> (!(<span class=\"hljs-keyword\">this</span> <span class=\"hljs-keyword\">instanceof</span> Animal)) {\n    <span class=\"hljs-keyword\">throw</span> <span class=\"hljs-keyword\">new</span> <span class=\"hljs-built_in\">TypeError</span>(<span class=\"hljs-string\">\'Cannot call a class as a function\'</span>)\n  }\n  <span class=\"hljs-keyword\">this</span>.options = options\n}\nAnimal.prototype.eat = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\"></span>) </span>{\n  <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'i can eat\'</span>)\n}</code></pre>', '', NULL, 0);

-- ----------------------------
-- Table structure for blog_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `blog_recycle_bin`;
CREATE TABLE `blog_recycle_bin`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NULL DEFAULT 0 COMMENT '删除内容 id',
  `create_time` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `table_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = ' 回收站' ROW_FORMAT = Dynamic;

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
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `isdelete` int(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否已删除1:已删2:未删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章标签表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag_post
-- ----------------------------
INSERT INTO `blog_tag_post` VALUES (8, 3, 12, 1);
INSERT INTO `blog_tag_post` VALUES (9, 3, 13, 1);

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
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展信息',
  PRIMARY KEY (`id`, `expire_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方用户表' ROW_FORMAT = Dynamic;

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
  `birthday` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '用户积分',
  `coin` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '金币',
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `create_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `user_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录密码 加密',
  `user_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户手机号',
  `user_activation_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '激活码',
  `islive` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_login`(`user_login`) USING BTREE,
  INDEX `user_nickname`(`user_nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES (5, 3, 1, '0', 0, 0, 0, 0.00, 0, 1, 'bfrontend', 'e10adc3949ba59abbe56e057f20f883e', 'bfrontend', '', 'bfrontend website', 'http://img.bfrontend.com/banner2.png', 'bfrontend 个性签名', '', '', NULL, '0', NULL);
INSERT INTO `blog_user` VALUES (12, 2, 2, '2018-10-08', 0, 0, 0, 0.00, 0, 1, 'testuser', '5d9c68c6c50ed3d02a2fcf54f63993b6', '测试员', '', '我是测试员的网址', 'http://img.bfrontend.com/testperson.jpg', '勤劳的测试员', '', '', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXIiOiJ0ZXN0dXNlciIsImVtYWlsIjoiMTc2MjU0OTI0MjRAMTYzLmNvbSJ9LCJleHAiOjE1Mzk4MzIxNDcsImlhdCI6MTUzOTc0NTc0N30.nXk9QPFwvXM60-h9OKgJ6rM_Fd_8ZIhnsxuVmnnDHO7us7viRajXH0x3KGr7z4G-uAnTbFIjE_jExP937-mDkdxIOCxQubWcHWrVicp5jO9LBiCKiwPTCnPUWCIHtZlq1PQxusNdrH7OoIicvpLf1e43YvmhhTYsaOUZVwAK8YYbD1E31cElDmzM7aEAwrmpuzdGkBnR1JHe_StObkGDfTRZ8kdkVDxsJZ50tBiE3nprhx0OjV56Et4c6rtz4w19UikY3c9GC4CuHAQYtvNf0vB2FkJlLgav1beii9oP4a6Nm-8L2JYZAFUZVRIIJEkB7zbwHMTdbTyrNRJFhwSQaw', '1', NULL);
INSERT INTO `blog_user` VALUES (14, 1, 0, '', 0, 0, 0, 0.00, 0, 1, 'msobj', '5d41402abc4b2a76b9719d911017c592', 'msobj', '', '', '', '', '', '', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXIiOiJtc29iaiIsImVtYWlsIjoiMTc2MjU0OTI0MjRAMTYzLmNvbSJ9LCJleHAiOjE1Mzk4NTI2MTMsImlhdCI6MTUzOTc2NjIxM30.fUYchOPZTnDJUCaiPmM6mTuHgQDDLqKh0J-N17I8NKdKRiNjitOposRcLbKsifK4_lDiKPUD0brA6hc_GF1l-gg50QAR3Ylu0e-39oalLF7qBnr7Q-uMvIfjAox6OwDHOazBvxyJyFZWnnMKTyYj8BwbnYl9eJqSm1TOvbC8mHWgUW2oB6TsHTBd7ZFp6dKU4iv7iHDLF4-jjW3cGBrVyGAXTMJLx5AwZthpUu3AC61vSdQ6Kxp_MVQvtP9IMhmG4Onit1rbaTjnW4IcaSXmCeaQeqTC6laiPztaUV48MXWa1vmOF_xxu20RNVq5uMEpBvQMWGvdMacT7yDLo02A4w', '1', NULL);
INSERT INTO `blog_user` VALUES (33, 1, 0, '0', 1541053834894, 0, 0, 0.00, 1541053834894, 1, '', '', 'heartdream', 'null', '', 'https://avatars2.githubusercontent.com/u/40289489?v=4', '', '', '', NULL, '0', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户讨厌表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_like
-- ----------------------------
INSERT INTO `blog_user_like` VALUES (2, 5, 82, 1541750573127);
INSERT INTO `blog_user_like` VALUES (3, 33, 83, 1541915897197);
INSERT INTO `blog_user_like` VALUES (4, 33, 90, 1541916765613);
INSERT INTO `blog_user_like` VALUES (5, 33, 91, 1541916804404);

-- ----------------------------
-- Table structure for blog_user_token
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_token`;
CREATE TABLE `blog_user_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `expire_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT ' 过期时间',
  `create_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `token` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  `ip_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户客户端登录 token 表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
