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

 Date: 06/11/2018 18:46:42
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
  `isdelete` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 2 COMMENT '是否已删除1:已删2:未删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章分类表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category_post
-- ----------------------------
INSERT INTO `blog_category_post` VALUES (1, 6, 41, 10000, 1);
INSERT INTO `blog_category_post` VALUES (2, 7, 45, 10000, 1);
INSERT INTO `blog_category_post` VALUES (3, 8, 45, 10000, 1);
INSERT INTO `blog_category_post` VALUES (4, 9, 39, 10000, 1);
INSERT INTO `blog_category_post` VALUES (5, 10, 39, 10000, 1);
INSERT INTO `blog_category_post` VALUES (6, 11, 39, 10000, 1);

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) UNSIGNED DEFAULT 0 COMMENT '被回复的评论id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发表评论的用户id',
  `to_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被评论的用户id',
  `like_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `dislike_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '不喜欢数',
  `floor` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '楼层数',
  `create_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论时间',
  `delete_time` bigint(20) UNSIGNED DEFAULT 0 COMMENT '删除时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态,1:已审核,0:未审核',
  `full_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '层级关系',
  `post_id` int(10) DEFAULT NULL COMMENT '文章id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `table_id_status`(`status`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES (15, NULL, 33, 33, 0, 0, 1, 1541478639338, NULL, 1, 'heartdream', 'null', '0', 2, '你好，不错的文章', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '友情链接表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'portal应用 文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_post
-- ----------------------------
INSERT INTO `blog_post` VALUES (1, 39, 'md', 5, 1, 1, 0, 0, 0, 0, 0, 1540195447087, 0, 0, 1540795032096, 'hello', 'js', 'asdfasdf', '', '', '', NULL, 1);
INSERT INTO `blog_post` VALUES (2, 42, 'md', 5, 1, 1, 0, 0, 0, 0, 0, 1540195676849, 0, 0, 0, '彩云之南', '旅行', '这是一片神奇的土地', '', '<p>在这里你将会有无限的收获，不是嫩够用言语表达的</p>\n', 'http://img.bfrontend.com/banner1.png', NULL, 0);
INSERT INTO `blog_post` VALUES (3, 41, 'md', 5, 1, 1, 0, 0, 0, 0, 0, 1540198994146, 0, 0, 1540794992188, 'asdf', 'asdf', 'asdf', '', '<p>在这里你将会有无限的收获，不是嫩够用言语表达的</p>\n', '', NULL, 1);
INSERT INTO `blog_post` VALUES (7, 45, 'md', 5, 0, 1, 0, 0, 0, 0, 0, 1540795312409, 0, 0, 0, 'asdfasdf', 'a', '有时候，一样食物给人留下的记忆，远比一顿暴打更深刻，更烙入骨髓。\n\n　　对小素而言，不能对她提一种叫做麻球的小吃。金黄黄的，包了红糖馅、滚了白芝麻、入了油锅炸的糯米点心。\n\n　　童年时，家境清寒。三间外面大雨、里面小雨的草房，三棵李树、两株桃树和屋后的一片竹子，就是家里的全部不动产了。好在那时也没过过好日子，并不觉得有多苦。', 'b', '', '', NULL, 0);
INSERT INTO `blog_post` VALUES (8, 45, 'md', 5, 0, 1, 0, 0, 0, 0, 0, 1540796004347, 0, 0, NULL, 'test', 'a', '<div style=\"background: red;width:300px;height:300px;\">asdf</div>', 'b', '', '', NULL, 0);
INSERT INTO `blog_post` VALUES (9, 39, 'md', 5, 0, 1, 1, 0, 0, 0, 0, 1541391505935, 0, 0, NULL, 'SOLID原则在 面向对象中的使用', 'solid', '<p>SOLID 是面向对象设计5大重要原则的首字母缩写，当我们设计类和模块的时候，遵守SOLID原则可以让软件更加健壮和稳定。那么什么是SOLID原则呢？</p>\n', '', '<ul>\n<li>单一职责原则(SRP) </li>\n<li>开放封闭原则(OCP)</li>\n<li>里氏替换原则(LSP)</li>\n<li>接口隔离原则(ISP)</li>\n<li>依赖倒置原则(DIP)</li>\n<li>小结</li>\n</ul>\n<p>SOLID 是面向对象设计5大重要原则的首字母缩写，当我们设计类和模块的时候，遵守SOLID原则可以让软件更加健壮和稳定。那么什么是SOLID原则呢？</p>\n<h2 id=\"-srp-\">单一职责原则(SRP)</h2>\n<p>单一职责原则(SRP)表明一个类有且只有要给职责。一个类就像容器一样，他能添加任意数量的属性/方法等。然而，如果你试图让一个类实现太多，很快这个类就会变得笨重。任意小的改变都将导致这个单一类的变化。当你改了这个类，你将需要重新测试一遍。如果你遵守SRP，你的类将将变得简洁和灵活。每一个类将负责单一的问题/任务或者它关注的点，这种方式你只需改变相应的类，只有这个类需要再次测试。SRP核心是把整个问题分成小部分，并且每个小部分都将通过一个单独的类负责。</p>\n<p>假设你在构建一个应用程序，其中有个模块是根据条件搜索顾客并以Excel形式导出。随着业务的发展，搜索条件会不断增加，导出数据的分类也会不断增加。如果此时将搜索与数据导出功能放在同一个类中，势必会变得笨重起来，即使是微小的改动，也可能影响其他功能。所以根据单一职责原则，一个类只有一个职责，故创建两个单独的类，分别处理搜索以及导出数据。</p>\n<h2 id=\"-ocp-\">开放封闭原则(OCP)</h2>\n<p>开放封闭原则(OCP)指出，一个类应该对扩展开放，对修改关闭。这意味一旦你创建了一个类并且应用程序的其他部分开始使用它，你不应该修改它。为什么呢？因为如果你改变它，很可能你的改变会引发系统的奔溃。如果你需要一些额外功能，你应该扩展这个类而不是修改它。使用这种方式，现有系统不会看到任何新变化的影响。同时，你只需要测试新创建的类。</p>\n<p>假设你现在正在开发一个web应用程序，包括一个在线纳税计算器。用户可以访问web页面，指定他们的收入和费用的细节，并使用一些数学公式来计算应纳税额。考虑到这点，你创建了如下类：</p>\n<pre><code>class TaxCalculator{\n    Calculate(income, deduction, country){\n        var taxAmount = 0;\n        var taxableIncome = income - deduction\n        switch(country){\n            case &#39;India&#39;:\n                // TODO calculation\n                break;\n            case &#39;USA&#39;:\n                // TODO calculation\n                break;\n            case &#39;UK&#39;:\n                // TODO calculation\n                break;\n        }\n        return taxAmount;\n    }\n}</code></pre><p>这个方法非常简单，通过指定收入和支出，可以动态切换不同的国家计算不同的纳税额。但这里隐含了一个问题，它只考虑了三个国家。当这个web应用变得越来越流行时，越来越多的国家将被加进来，你不得不去修改Calculate方法。这违反了开放封闭原则，有可能你的修改会导致系统其它模块的崩溃。</p>\n<p>让我们对这个功能进行重构，以符合对扩展时开放，对修改时封闭的。</p>\n<p><img src=\"https://images.cnblogs.com/cnblogs_com/OceanEyes/836627/o_ocp.png\" alt=\"img\"></p>\n<p>根据类图，可以看到通过继承实现横向的扩展，并且不会引发对其他不相关类的修改。这时TaxCalucator类中的Calculate方法会异常简单：</p>\n<pre><code>class TaxCalculator{\n    Calculate(obj) {\n        var taxAmount = 0;\n        taxAmount = obj.CalculateTaxAmount();\n        return taxAmount;\n    }\n}</code></pre><h2 id=\"-lsp-\">里氏替换原则(LSP)</h2>\n<p>里氏替换原则提出，派生的子类应该是可替换基类的，也就是说任何基类可以出现的地方，子类一定可以出现。值得注意的是，当你通过继承实现多态行为时，如果派生类没有遵守LSP，可能会让系统引发异常。所以请谨慎使用继承，只有确定是&quot;is-a&quot;的关系时才能使用继承。</p>\n<p>假设你在开发一个大的门户网站，并提供很多定制的功能给终端用户，根据用户的级别，系统提供了不同级别的设定。考虑到这个需求，设计如下类图：</p>\n<p><img src=\"https://images.cnblogs.com/cnblogs_com/OceanEyes/836627/o_ISettings.png\" alt=\"img\"></p>\n<p>可以看到，ISettings 接口有 GlobalSettings、 SectionSettings 以及UserSettings 三个不同的实现。GlobalSettings设置会影响整个应用程序，例如标题、主题等。SectionSettings适用于门户的各个部分，如新闻、天气、体育等设置。UserSettings为特定登录用户设置，如电子邮件和通知偏好。</p>\n<p>这样的设计没问题、但如果有另一个需求，系统需要指出游客访问，唯一区别是游客不支持系统的设定，为了满足这个需求，你可能会如下设计：</p>\n<pre><code>public class GuestSettings: ISettings\n{\n    public void GetSettings () \n    {\n        // get settings from database\n        // include guest name ip address\n    }\n    public void SetSettings () \n    {\n        // guests are not allowed settings\n        throw new NotImplementedException();\n    }\n}</code></pre><p>这样没问题吗？准确来说，系统存在隐患。当单独使用GuestSettings时，因为我们了解游客不能设置，所以我们潜意识并不会主动调用SetSettings方法。但是由于多态，ISettings接口的实现可以被替换为GuestSettings对象，当调用SetSettings方法时，可能会引发系统异常。</p>\n<p>重构这个功能，拆分为两个不同的接口： IReadableSettings 和 IWritableSettings。子类根据需求实现所需的接口。</p>\n<p><img src=\"https://images.cnblogs.com/cnblogs_com/OceanEyes/836627/o_lsp.png\" alt=\"img\"></p>\n<h2 id=\"-isp-\">接口隔离原则(ISP)</h2>\n<p>接口隔离原则(ISP)表明类不应该被迫依赖他们不使用的方法，也就是说一个接口应该拥有尽可能少的行为，它是精简的，也是单一的。</p>\n<p>假设你正在开发一个电子商务的网站，需要有一个购物车和关联订单处理机制。你设计一个接口IOrderProcessor，它用包含一个验证信用卡是否有效的方法(ValidateCardInfo)以及收件人地址是否有效的方法(ValidateShippingAddress)。与此同时，创建一个OnlineOrderProcessor的类表示在线支付。</p>\n<p>这非常好，你的网站也能正常工作。现在让我们来考虑另一种情形，假设在线信用卡支付不在有效，公司决定接受货到付款支付。乍一看，这个解决方案听起来很简单，你可以创建一个CashOnDeliveryProcessor并实现IOrderProcessor接口。货到付款的购买方式不会涉及任何信贷卡验证，所以，CashOnDeliveryOrderProcessor类内部的ValidateCardInfo方法抛出NotImplementedException。</p>\n<p><img src=\"https://images.cnblogs.com/cnblogs_com/OceanEyes/836627/o_IOrderProcess.png\" alt=\"img\"></p>\n<p>这样的设计在未来可能会出现的潜在问题。假设由于某种原因在线信用卡付款需要额外的验证步骤。自然IOrderProcessor将被修改，它将包括哪些额外的方法，与此同时OnlineOrderProcessor将实现这些额外的方法。然而,CashOnDeliveryOrderProcessor尽管不需要任何的附加功能，但你必须实现这些附加的功能。显然，这违反了接口隔离原则。</p>\n<p>你需要将这个功能重构</p>\n<p><img src=\"https://images.cnblogs.com/cnblogs_com/OceanEyes/836627/o_isp.png\" alt=\"img\"></p>\n<p>新的设计分成两个接口。IOrderProcessor接口只包含两个方法：ValidateShippingAddress和ProcessOrder，而ValidateCardInfo抽象到一个单独的接口: IOnlineOrderProcessor。现在，自爱吸纳信用卡支付的任何改变只局限于IOnlineOrderProcessor和它的子类实现，而CashOnDeliveryOrderProcessor是不会被影响。因此，新设计符合接口隔离原则。</p>\n<h2 id=\"-dip-\">依赖倒置原则(DIP)</h2>\n<p>依赖倒置原则(DIP)表明高层模块不应该依赖底层模块，相反，他们应该依赖抽象类或者接口。这意味着你不应该在高层模块中使用具体的低层模块。因为这样的话，高层模块变得紧耦合低层模块。如果明天你改变了低层模块，那么高层模块也会被修改。根据DIP原则，高层模块应该依赖抽象(以抽象类喝着接口的形式),低层模块也是如此。通过面向接口(抽象类)编程，紧耦合被移除。</p>\n<p>那么什么事高层模块，什么事低层模块呢？通常情况下，我们会在一个类(高层模块)的内部实例化它依赖的对象(低层模块),这样势必造成两者的紧耦合，任何依赖对象的改变都将引起类的改变。</p>\n<p>依赖倒置原则表明高层模块、低层模块都依赖于抽象，举个例子，你现在正在开发一个通知系统，当用户改变密码时，邮件通知用户。</p>\n<pre><code>public class UserManager\n{\n    public void ChangePassword(string username, string oldpwd, string newpws)\n    {\n        EmailNotifier notifier = new EmailNotifier();\n        // add some logic and change password\n        / Notify the user\n        notifier.Notify(&quot;Password was changed on &quot; + DateTime.Now);\n    }\n}</code></pre><p>这样的实现在功能没有问题，但试想一下，新的需求希望通过SNS形式通知用户，那么我们只能手动将EmailNotifier替换为SNSNotifier。在这儿，UserManager就是高层模块，而EmailNotifier就是低层模块，他们彼此耦合。我们希望解耦，依赖于抽象INotifier，也就是面向接口的编程。</p>\n<p><img src=\"https://images.cnblogs.com/cnblogs_com/OceanEyes/836627/o_dip.png\" alt=\"img\"></p>\n<h2 id=\"-\">小结</h2>\n<p>在这篇文章中，你可以看到，继承和多态在SOLID原则中扮演了非常重要的角色。我们的应用程序不能过度设计，当然也不能随意设计。了解基本的SOLID原则能让你的应用程序变得健壮。</p>\n', 'http://img.bfrontend.com/favicon.jpg', NULL, 0);
INSERT INTO `blog_post` VALUES (10, 39, 'md', 5, 0, 1, 0, 0, 0, 0, 0, 1541399603976, 0, 0, NULL, 'a', 'c', '', 'c', '<pre><code>&lt;div&gt;\n&lt;p&gt;asdfasdf&lt;/p&gt;\n&lt;/div&gt;</code></pre>', '', NULL, 0);
INSERT INTO `blog_post` VALUES (11, 39, 'md', 5, 0, 1, 0, 0, 0, 0, 0, 1541400578917, 0, 0, NULL, 'd', 'd', '<p>test</p>\n', 'd', '<pre><code><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>asdfasdfasdf<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></code></pre>', '', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = ' 回收站' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'portal应用 标签文章对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag_post
-- ----------------------------
INSERT INTO `blog_tag_post` VALUES (1, 3, 5, 1);
INSERT INTO `blog_tag_post` VALUES (2, 4, 6, 1);
INSERT INTO `blog_tag_post` VALUES (3, 4, 7, 1);
INSERT INTO `blog_tag_post` VALUES (4, 4, 8, 1);
INSERT INTO `blog_tag_post` VALUES (5, 3, 9, 1);
INSERT INTO `blog_tag_post` VALUES (6, 3, 10, 1);
INSERT INTO `blog_tag_post` VALUES (7, 4, 11, 1);

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
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '扩展信息',
  PRIMARY KEY (`id`, `expire_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '第三方用户表' ROW_FORMAT = Dynamic;

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
  `user_activation_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '激活码',
  `islive` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_login`(`user_login`) USING BTREE,
  INDEX `user_nickname`(`user_nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES (5, 3, 1, '0', 0, 0, 0, 0.00, 0, 1, 'bfrontend', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'bfrontend website', 'http://img.bfrontend.com/banner2.png', 'bfrontend 个性签名', '', '', NULL, '0', NULL);
INSERT INTO `blog_user` VALUES (12, 2, 2, '2018-10-08', 0, 0, 0, 0.00, 0, 1, 'testuser', '5d9c68c6c50ed3d02a2fcf54f63993b6', '测试员', '', '我是测试员的网址', 'http://img.bfrontend.com/testperson.jpg', '勤劳的测试员', '', '', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXIiOiJ0ZXN0dXNlciIsImVtYWlsIjoiMTc2MjU0OTI0MjRAMTYzLmNvbSJ9LCJleHAiOjE1Mzk4MzIxNDcsImlhdCI6MTUzOTc0NTc0N30.nXk9QPFwvXM60-h9OKgJ6rM_Fd_8ZIhnsxuVmnnDHO7us7viRajXH0x3KGr7z4G-uAnTbFIjE_jExP937-mDkdxIOCxQubWcHWrVicp5jO9LBiCKiwPTCnPUWCIHtZlq1PQxusNdrH7OoIicvpLf1e43YvmhhTYsaOUZVwAK8YYbD1E31cElDmzM7aEAwrmpuzdGkBnR1JHe_StObkGDfTRZ8kdkVDxsJZ50tBiE3nprhx0OjV56Et4c6rtz4w19UikY3c9GC4CuHAQYtvNf0vB2FkJlLgav1beii9oP4a6Nm-8L2JYZAFUZVRIIJEkB7zbwHMTdbTyrNRJFhwSQaw', '1', NULL);
INSERT INTO `blog_user` VALUES (14, 1, 0, '', 0, 0, 0, 0.00, 0, 1, 'msobj', '5d41402abc4b2a76b9719d911017c592', 'msobj', '', '', '', '', '', '', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXIiOiJtc29iaiIsImVtYWlsIjoiMTc2MjU0OTI0MjRAMTYzLmNvbSJ9LCJleHAiOjE1Mzk4NTI2MTMsImlhdCI6MTUzOTc2NjIxM30.fUYchOPZTnDJUCaiPmM6mTuHgQDDLqKh0J-N17I8NKdKRiNjitOposRcLbKsifK4_lDiKPUD0brA6hc_GF1l-gg50QAR3Ylu0e-39oalLF7qBnr7Q-uMvIfjAox6OwDHOazBvxyJyFZWnnMKTyYj8BwbnYl9eJqSm1TOvbC8mHWgUW2oB6TsHTBd7ZFp6dKU4iv7iHDLF4-jjW3cGBrVyGAXTMJLx5AwZthpUu3AC61vSdQ6Kxp_MVQvtP9IMhmG4Onit1rbaTjnW4IcaSXmCeaQeqTC6laiPztaUV48MXWa1vmOF_xxu20RNVq5uMEpBvQMWGvdMacT7yDLo02A4w', '1', NULL);
INSERT INTO `blog_user` VALUES (33, 1, 0, '0', 1541053834894, 0, 0, 0.00, 1541053834894, 1, '', '', 'heartdream', 'null', '', 'https://avatars2.githubusercontent.com/u/40289489?v=4', '', '', '', NULL, '0', NULL);

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
INSERT INTO `blog_user_token` VALUES (21, 5, 1541485335418, 1541398935418, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjo1fSwiZXhwIjoxNTQxNDg1MzM1LCJpYXQiOjE1NDEzOTg5MzV9.Vg2n9e892LpDqtVLKSPsFmumw13l8UBTo9cEQTUVM_Io79XusZ4SJEVsrkGfEyl5nZAk5nVHkpK2eMH7VWz7H6xR8Vt60Xy6GxYkP9mcP-Q_NiTbR50XUdGrXAtwNshUcjwQOvN2y_gCtqqF8gD9tMjWhmFMED3yTM0auXPy6K_8M27RMOKLrARGKKaPUeclkcfOsVtHOxXL1tVryevsagJTtS3S4UPso62-6vsCvtclO-RZ6VDgTOiu70f5BgrcJktc5QKlzCHudjmPkLGIAHoZbnGVsREjSIZjydqhF97EFFMifPK2W9drL0asbGxrtxSZnbxG-5ygs1kj4-WBQw', '', '::1');
INSERT INTO `blog_user_token` VALUES (22, 11, 1539746096135, 1539659696135, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoxMX0sImV4cCI6MTUzOTc0NjA5NiwiaWF0IjoxNTM5NjU5Njk2fQ.Ff_zVlv8tkmO3cEshqA48QYXXhllwI9xcAPbEBHW9dIZG7DUpk9QH5hXaZOwS-w3aR68wpxtbsyuRPylMSjezYfRw4aCGA8ITNEiz-aPoyv-nhKhVHI0XczbrZIcqMvKvQcwpMCltVhudhsRKOsdBestdA1RHbZLCGGyWxvWUkXHQnA3YbMNPIwTDdK8RDSBmXQ9dcO_bHioDs2oFcYcnFOVFjjJNjjR6RZgYQt41mauXIBRV8RNEzvEsF1g5bxKBxrxZuE_6_xSBmp3osF-CBOC812vLzW_BqfYc0f2VS9STRiX7SKjin0aJCM7wydU8u1dKuyS64VyR7ikZNnznw', '', '::1');

SET FOREIGN_KEY_CHECKS = 1;
