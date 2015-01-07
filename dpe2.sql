/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50533
Source Host           : 127.0.0.1:3306
Source Database       : dpe2

Target Server Type    : MYSQL
Target Server Version : 50533
File Encoding         : 65001

Date: 2014-12-15 19:48:36
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dpe_configs`
-- ----------------------------
DROP TABLE IF EXISTS `dpe_configs`;
CREATE TABLE `dpe_configs` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `configure` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dpe_configs
-- ----------------------------
INSERT INTO `dpe_configs` VALUES ('1', 'default_template', '{\"top\":\"*1\",\"menu\":{\"name\":\"menu\",\"params\":\"top\"},\"content\":\"3\",\"time\":{\"name\":\"time\",\"params\":\"\"}}');
INSERT INTO `dpe_configs` VALUES ('2', 'frame_about', '{\"top\":\"Потолок\",\"menu\":\"Меню\",\"content\":\"Центарльная часть\",\"time\":\"Время значит\"}');
INSERT INTO `dpe_configs` VALUES ('3', 'del_page_del_menu', '1');
INSERT INTO `dpe_configs` VALUES ('4', 'meta_site', '[{\"http-equiv\":\"X-UA-Compatible\",\"content\":\"IE=edge\"},{\"name\":\"viewport\"},{\"content\":\"width=device-width, initial-scale=1\"},{\"name\":\"description\",\"content\":\"\"},{\"name\":\"author\",\"content\":\"\"},{\"http-equiv\":\"Pragma\",\"content\":\"no-cache\"}]');
INSERT INTO `dpe_configs` VALUES ('5', 'version', '9 unstable');

-- ----------------------------
-- Table structure for `dpe_engine_groups`
-- ----------------------------
DROP TABLE IF EXISTS `dpe_engine_groups`;
CREATE TABLE `dpe_engine_groups` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `about` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dpe_engine_groups
-- ----------------------------
INSERT INTO `dpe_engine_groups` VALUES ('1', 'administrator', 'Администратор');

-- ----------------------------
-- Table structure for `dpe_engine_perms`
-- ----------------------------
DROP TABLE IF EXISTS `dpe_engine_perms`;
CREATE TABLE `dpe_engine_perms` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `func` varchar(256) DEFAULT NULL,
  `geg` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dpe_engine_perms
-- ----------------------------
INSERT INTO `dpe_engine_perms` VALUES ('1', 'Создание страницы', 'create_page', '[1]');
INSERT INTO `dpe_engine_perms` VALUES ('2', 'Редактирование страниц - Просмотр', 'edit_page_show', '[1]');
INSERT INTO `dpe_engine_perms` VALUES ('3', 'Редактирование страниц', 'edit_page', '[1]');
INSERT INTO `dpe_engine_perms` VALUES ('4', 'Удаление страниц', 'delete_page', '[1]');
INSERT INTO `dpe_engine_perms` VALUES ('5', 'Редактирование обвязки', 'edit_frame', '[1]');
INSERT INTO `dpe_engine_perms` VALUES ('6', 'Модули', 'moduls', '[1]');
INSERT INTO `dpe_engine_perms` VALUES ('7', 'Модули - настройка', 'moduls/settings', '[1]');
INSERT INTO `dpe_engine_perms` VALUES ('8', 'Размещение модулей на страницах', 'direction_modules', '[1]');
INSERT INTO `dpe_engine_perms` VALUES ('9', 'Размещение модулей на страницах - Удаление', 'direction_modules/uninstall', '[1]');
INSERT INTO `dpe_engine_perms` VALUES ('10', 'Установка модулей', 'moduls/install', '[1]');

-- ----------------------------
-- Table structure for `dpe_engine_users`
-- ----------------------------
DROP TABLE IF EXISTS `dpe_engine_users`;
CREATE TABLE `dpe_engine_users` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `group_id` int(3) DEFAULT NULL,
  `session` varchar(40) DEFAULT NULL,
  `fail_enter` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dpe_engine_users
-- ----------------------------
INSERT INTO `dpe_engine_users` VALUES ('1', 'admin', '4764587bf7c0b61fd6e12d274c6a47ce', 'fireunix@yandex.ru', '192.168.1.181', '1', '1538d786def8ae25892d9a76f38d11c7', '0');

-- ----------------------------
-- Table structure for `dpe_module_Form`
-- ----------------------------
DROP TABLE IF EXISTS `dpe_module_Form`;
CREATE TABLE `dpe_module_Form` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `mp3` varchar(256) NOT NULL,
  `portfolio` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dpe_module_Form
-- ----------------------------
INSERT INTO `dpe_module_Form` VALUES ('3', 'ac941f2249c1419f11f1d821f1ffe795.mp3', 'ae12696dddcc534222f134c7b7d7300f.doc');

-- ----------------------------
-- Table structure for `dpe_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `dpe_sessions`;
CREATE TABLE `dpe_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dpe_sessions
-- ----------------------------
INSERT INTO `dpe_sessions` VALUES ('03769873f9334dd576dfd30742fa6c88', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '1418661622', '');
INSERT INTO `dpe_sessions` VALUES ('1538d786def8ae25892d9a76f38d11c7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '1418571616', 'a:4:{s:9:\"user_data\";s:0:\"\";s:5:\"login\";s:5:\"admin\";s:8:\"group_id\";s:1:\"1\";s:9:\"logged_in\";b:1;}');
INSERT INTO `dpe_sessions` VALUES ('6d6b090c0f7e7e5aa9b175e9a74d7170', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '1418564997', 'a:4:{s:9:\"user_data\";s:0:\"\";s:5:\"login\";s:5:\"admin\";s:8:\"group_id\";s:1:\"1\";s:9:\"logged_in\";b:1;}');

-- ----------------------------
-- Table structure for `dpe_site_contents`
-- ----------------------------
DROP TABLE IF EXISTS `dpe_site_contents`;
CREATE TABLE `dpe_site_contents` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `level` int(2) DEFAULT NULL,
  `delete` int(1) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dpe_site_contents
-- ----------------------------
INSERT INTO `dpe_site_contents` VALUES ('1', '<div class=\"col-md-4\">\n<h2 style=\"text-align:center\">AWJWRET&lt;/ASD</h2>\n</div>\n', '15', '0', 'text');
INSERT INTO `dpe_site_contents` VALUES ('3', '<hr />\n<p>Открытый благотворительный фестиваль &laquo;Звездный сад&raquo; - это новая добрая традиция, направленная на постоянное развитие творческих способностей обычных детей и детей с ограниченными возможностями в атмосфере дружбы и <em>взаимопонимания.</em></p>\n\n<p>Фестиваль поддерживает равные права и возможности для творческой деятельности детей из России, стран СНГ и ближнего Зарубежья. Повышает</p>\n\n<p>&laquo;Звездный сад&raquo; - это крупное культурное событие в области музыки и танца, ежегодно объединяющее более ХХХ человек. Интересные и разноплановые номера программы собираютдрузей, выявляют новые таланты, повышают уровень социальной адаптации детей с ограниченными возможностями.</p>\n\n<p>Мы приглашаем конкурсантов к выступлению по направлениям: вокал (солисты, коллективы), хореография, инструментальных исполнителей в возрасте от 8-ми до 18-ти лет.</p>\n\n<p>В этом году участники фестиваля выйдут на сцену вместе с (<ins>Марком Тишманом</ins>, <ins>Сосо Павлиашвили</ins>, <ins>Дмитрием Маликовым</ins>, <ins>Юлианом</ins>, <ins>Татьяной Лазаревой</ins>, <ins>Игорем Корнелюком</ins>, <ins>Ольгой Тумайкиной</ins>, <ins>Юлией Самойловой</ins> и другими. Наши известные гости будут продолжать курировать победителей фестиваля - давать мастер-классы, направлять на лечение детей с ограниченными возможностями и т.д. ЗДЕСЬ НАДО КОНКРЕТНЕЕ &ndash; размытые формулировки ведут к имиджевым потерям. Вариант: просто сказать, что победителей ждут мастер-классы от звезд - тогда лучше больше и не развивать пока, достаточно общения со звездами и мастер -классы</p>\n\n<p>Мы хотим согреть Ваши сердца! Если Вы способны удивлять, готовы доказать себе и всему миру, что у Вас есть талант - тогда &laquo;Звездный сад&raquo; ждет Вас!</p>\n\n<hr />', '15', '0', 'text');
INSERT INTO `dpe_site_contents` VALUES ('4', '<p>rwerwr</p>\n', '15', '0', 'text');

-- ----------------------------
-- Table structure for `dpe_site_menu`
-- ----------------------------
DROP TABLE IF EXISTS `dpe_site_menu`;
CREATE TABLE `dpe_site_menu` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `url` varchar(32) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `hidden` int(1) DEFAULT NULL,
  `position` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dpe_site_menu
-- ----------------------------
INSERT INTO `dpe_site_menu` VALUES ('1', 'inside', 'engine', 'админка', '0', 'top');
INSERT INTO `dpe_site_menu` VALUES ('2', 'inside', 'start', 'start', '0', 'top');
INSERT INTO `dpe_site_menu` VALUES ('7', 'inside', 'test', 'Тест формы', '0', 'top');

-- ----------------------------
-- Table structure for `dpe_site_modules`
-- ----------------------------
DROP TABLE IF EXISTS `dpe_site_modules`;
CREATE TABLE `dpe_site_modules` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `group` varchar(128) DEFAULT NULL,
  `enable` int(1) DEFAULT NULL,
  `version` int(3) DEFAULT NULL,
  `settings` varchar(128) DEFAULT NULL,
  `author` varchar(128) DEFAULT NULL,
  `about` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dpe_site_modules
-- ----------------------------
INSERT INTO `dpe_site_modules` VALUES ('1', 'menu', '[]', '1', '1', null, 'Хемуль', 'модуль для отображения меню на сайте');
INSERT INTO `dpe_site_modules` VALUES ('2', 'time', '[]', '1', '1', '[]', 'Хемуль', 'Модуль отображения времени');
INSERT INTO `dpe_site_modules` VALUES ('5', 'form_competition', null, '1', '1', '[]', 'Хемуль', 'Модуль для загрузки и использования контента, загруженного на сайте');

-- ----------------------------
-- Table structure for `dpe_site_pages`
-- ----------------------------
DROP TABLE IF EXISTS `dpe_site_pages`;
CREATE TABLE `dpe_site_pages` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `meta` varchar(256) DEFAULT NULL,
  `composition` varchar(2048) DEFAULT NULL,
  `moduls` varchar(128) DEFAULT NULL,
  `delete` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dpe_site_pages
-- ----------------------------
INSERT INTO `dpe_site_pages` VALUES ('1', 'start', 'start', '', '{\"top\":1,\"menu\":{\"name\":\"menu\",\"params\":\"top\"},\"content\":3,\"time\":{\"name\":\"time\",\"params\":\"\"}}', null, null);
INSERT INTO `dpe_site_pages` VALUES ('2', 'engine', 'engine', '', '{\"top\":1,\"menu\":{\"name\":\"menu\",\"params\":\"top\"},\"content\":3,\"time\":{\"name\":\"time\",\"params\":\"\"}}', null, null);
INSERT INTO `dpe_site_pages` VALUES ('3', 'test', 'test', '', '{\"top\":1,\"menu\":{\"name\":\"menu\",\"params\":\"top\"},\"content\":{\"name\":\"form_competition\",\"params\":\"\"},\"time\":{\"name\":\"time\",\"params\":\"\"}}', null, null);

-- ----------------------------
-- Table structure for `dpe_visited`
-- ----------------------------
DROP TABLE IF EXISTS `dpe_visited`;
CREATE TABLE `dpe_visited` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `elapsed_time` float(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dpe_visited
-- ----------------------------
INSERT INTO `dpe_visited` VALUES ('1', '2014-11-06 21:47:36', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.036');
INSERT INTO `dpe_visited` VALUES ('2', '2014-11-06 21:47:38', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.046');
INSERT INTO `dpe_visited` VALUES ('3', '2014-11-06 21:47:41', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('4', '2014-11-06 21:47:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.041');
INSERT INTO `dpe_visited` VALUES ('5', '2014-11-06 21:47:47', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.038');
INSERT INTO `dpe_visited` VALUES ('6', '2014-11-06 21:47:51', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.044');
INSERT INTO `dpe_visited` VALUES ('7', '2014-11-06 21:49:22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.052');
INSERT INTO `dpe_visited` VALUES ('8', '2014-11-06 21:50:50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.057');
INSERT INTO `dpe_visited` VALUES ('9', '2014-11-06 21:50:53', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.043');
INSERT INTO `dpe_visited` VALUES ('10', '2014-11-06 21:50:56', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('11', '2014-11-06 21:51:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.052');
INSERT INTO `dpe_visited` VALUES ('12', '2014-11-06 21:51:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.043');
INSERT INTO `dpe_visited` VALUES ('13', '2014-11-06 21:53:56', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.044');
INSERT INTO `dpe_visited` VALUES ('14', '2014-11-06 21:55:22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('15', '2014-11-06 21:55:25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.043');
INSERT INTO `dpe_visited` VALUES ('16', '2014-11-06 21:55:27', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.037');
INSERT INTO `dpe_visited` VALUES ('17', '2014-11-06 21:55:28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.043');
INSERT INTO `dpe_visited` VALUES ('18', '2014-11-06 21:56:02', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.036');
INSERT INTO `dpe_visited` VALUES ('19', '2014-11-06 21:56:07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.047');
INSERT INTO `dpe_visited` VALUES ('20', '2014-11-06 21:56:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('21', '2014-11-06 22:03:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.051');
INSERT INTO `dpe_visited` VALUES ('22', '2014-11-06 22:03:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.050');
INSERT INTO `dpe_visited` VALUES ('23', '2014-11-06 22:03:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.041');
INSERT INTO `dpe_visited` VALUES ('24', '2014-11-06 22:04:21', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.041');
INSERT INTO `dpe_visited` VALUES ('25', '2014-11-06 22:05:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.044');
INSERT INTO `dpe_visited` VALUES ('26', '2014-11-06 22:05:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.040');
INSERT INTO `dpe_visited` VALUES ('27', '2014-11-06 22:06:10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.057');
INSERT INTO `dpe_visited` VALUES ('28', '2014-11-06 22:07:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.050');
INSERT INTO `dpe_visited` VALUES ('29', '2014-11-07 20:15:58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.349');
INSERT INTO `dpe_visited` VALUES ('30', '2014-11-07 20:24:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.054');
INSERT INTO `dpe_visited` VALUES ('31', '2014-11-07 20:27:24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dpe/include_engine/css/images/sort_both.png', '0.031');
INSERT INTO `dpe_visited` VALUES ('32', '2014-11-07 20:27:24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dpe/include_engine/css/images/sort_asc.png', '0.044');
INSERT INTO `dpe_visited` VALUES ('33', '2014-11-07 20:30:18', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.050');
INSERT INTO `dpe_visited` VALUES ('34', '2014-11-07 20:42:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dpe/include_engine/css/images/sort_both.png', '0.030');
INSERT INTO `dpe_visited` VALUES ('35', '2014-11-07 20:42:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dpe/include_engine/css/images/sort_asc.png', '0.041');
INSERT INTO `dpe_visited` VALUES ('36', '2014-11-07 22:20:07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.044');
INSERT INTO `dpe_visited` VALUES ('37', '2014-11-07 22:20:08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.044');
INSERT INTO `dpe_visited` VALUES ('38', '2014-11-07 22:21:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.042');
INSERT INTO `dpe_visited` VALUES ('39', '2014-11-09 14:55:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.355');
INSERT INTO `dpe_visited` VALUES ('40', '2014-11-09 15:01:52', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('41', '2014-11-09 15:02:22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.048');
INSERT INTO `dpe_visited` VALUES ('42', '2014-11-09 15:02:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('43', '2014-11-09 15:02:27', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('44', '2014-11-09 15:02:36', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.054');
INSERT INTO `dpe_visited` VALUES ('45', '2014-11-09 15:02:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.047');
INSERT INTO `dpe_visited` VALUES ('46', '2014-11-09 15:02:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('47', '2014-11-09 15:02:39', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.038');
INSERT INTO `dpe_visited` VALUES ('48', '2014-11-09 15:02:39', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('49', '2014-11-09 15:02:41', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.050');
INSERT INTO `dpe_visited` VALUES ('50', '2014-11-09 15:02:42', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.045');
INSERT INTO `dpe_visited` VALUES ('51', '2014-11-09 15:02:47', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.043');
INSERT INTO `dpe_visited` VALUES ('52', '2014-11-09 15:09:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.042');
INSERT INTO `dpe_visited` VALUES ('53', '2014-11-09 15:09:58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.042');
INSERT INTO `dpe_visited` VALUES ('54', '2014-11-09 15:13:04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.041');
INSERT INTO `dpe_visited` VALUES ('55', '2014-11-09 15:18:03', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.057');
INSERT INTO `dpe_visited` VALUES ('56', '2014-11-09 15:18:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.036');
INSERT INTO `dpe_visited` VALUES ('57', '2014-11-09 15:18:36', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dpe/include_engine/css/images/sort_both.png', '0.041');
INSERT INTO `dpe_visited` VALUES ('58', '2014-11-09 15:18:36', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dpe/include_engine/css/images/sort_asc.png', '0.035');
INSERT INTO `dpe_visited` VALUES ('59', '2014-11-09 15:18:56', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.041');
INSERT INTO `dpe_visited` VALUES ('60', '2014-11-09 15:46:34', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.097');
INSERT INTO `dpe_visited` VALUES ('61', '2014-11-09 15:46:35', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.041');
INSERT INTO `dpe_visited` VALUES ('62', '2014-11-09 15:51:57', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.048');
INSERT INTO `dpe_visited` VALUES ('63', '2014-11-09 15:51:58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.039');
INSERT INTO `dpe_visited` VALUES ('64', '2014-11-09 15:53:22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.051');
INSERT INTO `dpe_visited` VALUES ('65', '2014-11-09 15:53:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.034');
INSERT INTO `dpe_visited` VALUES ('66', '2014-11-09 15:53:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dpe/include_engine/css/images/sort_both.png', '0.029');
INSERT INTO `dpe_visited` VALUES ('67', '2014-11-09 15:53:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dpe/include_engine/css/images/sort_asc.png', '0.054');
INSERT INTO `dpe_visited` VALUES ('68', '2014-11-09 15:54:04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.042');
INSERT INTO `dpe_visited` VALUES ('69', '2014-11-09 15:54:46', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('70', '2014-11-09 16:14:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.061');
INSERT INTO `dpe_visited` VALUES ('71', '2014-11-09 16:14:38', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.038');
INSERT INTO `dpe_visited` VALUES ('72', '2014-11-09 16:14:40', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.037');
INSERT INTO `dpe_visited` VALUES ('73', '2014-11-09 18:00:36', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.096');
INSERT INTO `dpe_visited` VALUES ('74', '2014-11-09 18:07:02', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.047');
INSERT INTO `dpe_visited` VALUES ('75', '2014-11-09 18:07:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.050');
INSERT INTO `dpe_visited` VALUES ('76', '2014-11-09 18:07:08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('77', '2014-11-09 18:07:10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.039');
INSERT INTO `dpe_visited` VALUES ('78', '2014-11-09 18:07:14', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.048');
INSERT INTO `dpe_visited` VALUES ('79', '2014-11-09 18:08:07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('80', '2014-11-09 18:08:09', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('81', '2014-11-09 18:08:12', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.036');
INSERT INTO `dpe_visited` VALUES ('82', '2014-11-09 18:08:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('83', '2014-11-09 18:08:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('84', '2014-11-09 18:08:16', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.042');
INSERT INTO `dpe_visited` VALUES ('85', '2014-11-09 18:08:19', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('86', '2014-11-09 18:08:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('87', '2014-11-09 18:08:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('88', '2014-11-09 18:08:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('89', '2014-11-09 18:08:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('90', '2014-11-09 18:08:24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('91', '2014-11-09 18:08:24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.044');
INSERT INTO `dpe_visited` VALUES ('92', '2014-11-09 18:08:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dpe/include_engine/css/images/sort_both.png', '0.033');
INSERT INTO `dpe_visited` VALUES ('93', '2014-11-09 18:08:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dpe/include_engine/css/images/sort_asc.png', '0.046');
INSERT INTO `dpe_visited` VALUES ('94', '2014-11-09 18:09:19', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.044');
INSERT INTO `dpe_visited` VALUES ('95', '2014-11-09 18:09:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.038');
INSERT INTO `dpe_visited` VALUES ('96', '2014-11-09 18:09:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.045');
INSERT INTO `dpe_visited` VALUES ('97', '2014-11-09 18:09:30', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.047');
INSERT INTO `dpe_visited` VALUES ('98', '2014-11-09 18:09:30', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.044');
INSERT INTO `dpe_visited` VALUES ('99', '2014-11-09 18:09:50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.047');
INSERT INTO `dpe_visited` VALUES ('100', '2014-11-09 18:09:51', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.047');
INSERT INTO `dpe_visited` VALUES ('101', '2014-11-09 18:09:51', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.044');
INSERT INTO `dpe_visited` VALUES ('102', '2014-11-09 18:09:52', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.041');
INSERT INTO `dpe_visited` VALUES ('103', '2014-11-09 18:09:53', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.048');
INSERT INTO `dpe_visited` VALUES ('104', '2014-11-09 18:10:07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.056');
INSERT INTO `dpe_visited` VALUES ('105', '2014-11-09 18:10:08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.038');
INSERT INTO `dpe_visited` VALUES ('106', '2014-11-09 18:10:12', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.039');
INSERT INTO `dpe_visited` VALUES ('107', '2014-11-09 18:10:12', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('108', '2014-11-09 18:10:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.048');
INSERT INTO `dpe_visited` VALUES ('109', '2014-11-09 18:10:16', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.043');
INSERT INTO `dpe_visited` VALUES ('110', '2014-11-09 18:10:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.041');
INSERT INTO `dpe_visited` VALUES ('111', '2014-11-09 18:10:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('112', '2014-11-09 18:10:25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.048');
INSERT INTO `dpe_visited` VALUES ('113', '2014-11-09 18:10:25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.049');
INSERT INTO `dpe_visited` VALUES ('114', '2014-11-09 18:10:32', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.040');
INSERT INTO `dpe_visited` VALUES ('115', '2014-11-09 18:10:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.049');
INSERT INTO `dpe_visited` VALUES ('116', '2014-11-09 18:10:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.038');
INSERT INTO `dpe_visited` VALUES ('117', '2014-11-09 18:10:38', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.041');
INSERT INTO `dpe_visited` VALUES ('118', '2014-11-09 18:10:40', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.049');
INSERT INTO `dpe_visited` VALUES ('119', '2014-11-09 18:10:41', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.040');
INSERT INTO `dpe_visited` VALUES ('120', '2014-11-09 18:10:42', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.035');
INSERT INTO `dpe_visited` VALUES ('121', '2014-11-09 18:10:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.035');
INSERT INTO `dpe_visited` VALUES ('122', '2014-11-09 18:10:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.040');
INSERT INTO `dpe_visited` VALUES ('123', '2014-11-09 18:10:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.039');
INSERT INTO `dpe_visited` VALUES ('124', '2014-11-09 18:10:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.040');
INSERT INTO `dpe_visited` VALUES ('125', '2014-11-09 18:10:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.045');
INSERT INTO `dpe_visited` VALUES ('126', '2014-11-09 18:10:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/dsadasdasda', '0.034');
INSERT INTO `dpe_visited` VALUES ('127', '2014-11-09 18:11:34', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.031');
INSERT INTO `dpe_visited` VALUES ('128', '2014-11-09 18:11:35', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.033');
INSERT INTO `dpe_visited` VALUES ('129', '2014-11-09 18:11:36', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.042');
INSERT INTO `dpe_visited` VALUES ('130', '2014-11-09 18:11:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.038');
INSERT INTO `dpe_visited` VALUES ('131', '2014-11-09 18:11:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.035');
INSERT INTO `dpe_visited` VALUES ('132', '2014-11-09 18:11:38', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.045');
INSERT INTO `dpe_visited` VALUES ('133', '2014-11-09 18:11:39', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.036');
INSERT INTO `dpe_visited` VALUES ('134', '2014-11-09 18:11:39', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.041');
INSERT INTO `dpe_visited` VALUES ('135', '2014-11-09 18:11:40', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.041');
INSERT INTO `dpe_visited` VALUES ('136', '2014-11-09 18:11:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.053');
INSERT INTO `dpe_visited` VALUES ('137', '2014-11-09 18:11:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.034');
INSERT INTO `dpe_visited` VALUES ('138', '2014-11-09 18:11:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('139', '2014-11-09 18:11:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('140', '2014-11-09 18:11:47', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.032');
INSERT INTO `dpe_visited` VALUES ('141', '2014-11-09 18:11:48', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.036');
INSERT INTO `dpe_visited` VALUES ('142', '2014-11-09 18:11:48', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.035');
INSERT INTO `dpe_visited` VALUES ('143', '2014-11-09 18:11:49', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.035');
INSERT INTO `dpe_visited` VALUES ('144', '2014-11-09 18:11:49', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('145', '2014-11-09 18:11:50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.034');
INSERT INTO `dpe_visited` VALUES ('146', '2014-11-09 18:11:50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.046');
INSERT INTO `dpe_visited` VALUES ('147', '2014-11-09 18:19:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.047');
INSERT INTO `dpe_visited` VALUES ('148', '2014-11-09 18:19:21', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.034');
INSERT INTO `dpe_visited` VALUES ('149', '2014-11-09 18:19:31', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.039');
INSERT INTO `dpe_visited` VALUES ('150', '2014-11-09 18:19:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.035');
INSERT INTO `dpe_visited` VALUES ('151', '2014-11-09 20:41:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.113');
INSERT INTO `dpe_visited` VALUES ('152', '2014-11-09 21:06:15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.093');
INSERT INTO `dpe_visited` VALUES ('153', '2014-11-09 21:06:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.041');
INSERT INTO `dpe_visited` VALUES ('154', '2014-11-09 21:06:39', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.038');
INSERT INTO `dpe_visited` VALUES ('155', '2014-11-09 21:06:40', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('156', '2014-11-09 21:07:01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('157', '2014-11-09 21:49:47', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.093');
INSERT INTO `dpe_visited` VALUES ('158', '2014-11-15 16:15:29', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.371');
INSERT INTO `dpe_visited` VALUES ('159', '2014-11-15 16:15:35', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.060');
INSERT INTO `dpe_visited` VALUES ('160', '2014-11-15 16:15:36', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.050');
INSERT INTO `dpe_visited` VALUES ('161', '2014-11-15 16:15:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.040');
INSERT INTO `dpe_visited` VALUES ('162', '2014-11-15 16:15:40', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('163', '2014-11-15 16:15:41', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.036');
INSERT INTO `dpe_visited` VALUES ('164', '2014-11-15 22:09:56', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.099');
INSERT INTO `dpe_visited` VALUES ('165', '2014-11-15 23:23:51', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.109');
INSERT INTO `dpe_visited` VALUES ('166', '2014-11-15 23:23:55', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.041');
INSERT INTO `dpe_visited` VALUES ('167', '2014-11-15 23:23:56', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/start', '0.031');
INSERT INTO `dpe_visited` VALUES ('168', '2014-11-16 13:39:40', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.404');
INSERT INTO `dpe_visited` VALUES ('169', '2014-11-16 13:39:46', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.057');
INSERT INTO `dpe_visited` VALUES ('170', '2014-11-16 13:39:47', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.050');
INSERT INTO `dpe_visited` VALUES ('171', '2014-11-16 13:39:48', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.041');
INSERT INTO `dpe_visited` VALUES ('172', '2014-11-26 20:34:33', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.098');
INSERT INTO `dpe_visited` VALUES ('173', '2014-11-26 20:36:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://server/', '0.084');
INSERT INTO `dpe_visited` VALUES ('174', '2014-11-26 20:50:14', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.065');
INSERT INTO `dpe_visited` VALUES ('175', '2014-11-26 20:50:15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.046');
INSERT INTO `dpe_visited` VALUES ('176', '2014-11-26 20:50:16', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.036');
INSERT INTO `dpe_visited` VALUES ('177', '2014-11-26 20:50:16', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.046');
INSERT INTO `dpe_visited` VALUES ('178', '2014-11-26 20:50:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('179', '2014-11-26 20:50:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.033');
INSERT INTO `dpe_visited` VALUES ('180', '2014-11-26 20:50:18', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.031');
INSERT INTO `dpe_visited` VALUES ('181', '2014-11-26 20:50:18', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.051');
INSERT INTO `dpe_visited` VALUES ('182', '2014-11-26 20:51:15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.048');
INSERT INTO `dpe_visited` VALUES ('183', '2014-11-26 20:51:16', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.033');
INSERT INTO `dpe_visited` VALUES ('184', '2014-11-26 20:51:48', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.045');
INSERT INTO `dpe_visited` VALUES ('185', '2014-11-26 20:51:49', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.041');
INSERT INTO `dpe_visited` VALUES ('186', '2014-11-26 21:01:30', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.038');
INSERT INTO `dpe_visited` VALUES ('187', '2014-11-26 21:03:16', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.050');
INSERT INTO `dpe_visited` VALUES ('188', '2014-11-26 21:03:19', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('189', '2014-11-26 21:03:19', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.045');
INSERT INTO `dpe_visited` VALUES ('190', '2014-11-26 21:03:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.046');
INSERT INTO `dpe_visited` VALUES ('191', '2014-11-26 21:04:10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.041');
INSERT INTO `dpe_visited` VALUES ('192', '2014-11-26 21:04:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.037');
INSERT INTO `dpe_visited` VALUES ('193', '2014-11-26 21:05:10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.087');
INSERT INTO `dpe_visited` VALUES ('194', '2014-11-26 21:05:10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.049');
INSERT INTO `dpe_visited` VALUES ('195', '2014-11-26 21:06:14', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.053');
INSERT INTO `dpe_visited` VALUES ('196', '2014-11-26 21:06:19', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.098');
INSERT INTO `dpe_visited` VALUES ('197', '2014-11-26 21:06:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.047');
INSERT INTO `dpe_visited` VALUES ('198', '2014-11-26 21:06:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.033');
INSERT INTO `dpe_visited` VALUES ('199', '2014-11-26 21:07:55', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.052');
INSERT INTO `dpe_visited` VALUES ('200', '2014-11-26 21:07:57', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/test', '0.040');
INSERT INTO `dpe_visited` VALUES ('201', '2014-11-26 21:33:01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.063');
INSERT INTO `dpe_visited` VALUES ('202', '2014-11-26 21:33:03', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.046');
INSERT INTO `dpe_visited` VALUES ('203', '2014-11-26 21:33:32', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.064');
INSERT INTO `dpe_visited` VALUES ('204', '2014-11-26 21:33:33', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.048');
INSERT INTO `dpe_visited` VALUES ('205', '2014-11-26 21:33:33', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128/', '0.045');
INSERT INTO `dpe_visited` VALUES ('206', '2014-11-26 21:33:51', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.073');
INSERT INTO `dpe_visited` VALUES ('207', '2014-11-26 21:33:53', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.051');
INSERT INTO `dpe_visited` VALUES ('208', '2014-11-26 21:34:01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.067');
INSERT INTO `dpe_visited` VALUES ('209', '2014-11-26 21:34:27', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.068');
INSERT INTO `dpe_visited` VALUES ('210', '2014-11-26 21:34:35', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/start', '0.067');
INSERT INTO `dpe_visited` VALUES ('211', '2014-11-26 21:34:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/dpe/include_engine/css/images/sort_both.png', '0.076');
INSERT INTO `dpe_visited` VALUES ('212', '2014-11-26 21:34:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/dpe/include_engine/css/images/sort_asc.png', '0.071');
INSERT INTO `dpe_visited` VALUES ('213', '2014-11-30 11:30:26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.998');
INSERT INTO `dpe_visited` VALUES ('214', '2014-11-30 11:30:29', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/start', '0.061');
INSERT INTO `dpe_visited` VALUES ('215', '2014-11-30 11:30:31', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.045');
INSERT INTO `dpe_visited` VALUES ('216', '2014-11-30 11:30:33', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/start', '0.054');
INSERT INTO `dpe_visited` VALUES ('217', '2014-11-30 11:30:35', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.051');
INSERT INTO `dpe_visited` VALUES ('218', '2014-11-30 11:30:41', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/start', '0.064');
INSERT INTO `dpe_visited` VALUES ('219', '2014-11-30 11:35:47', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.060');
INSERT INTO `dpe_visited` VALUES ('220', '2014-11-30 11:54:00', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.048');
INSERT INTO `dpe_visited` VALUES ('221', '2014-11-30 11:54:03', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.042');
INSERT INTO `dpe_visited` VALUES ('222', '2014-11-30 12:01:18', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/start', '0.156');
INSERT INTO `dpe_visited` VALUES ('223', '2014-11-30 12:01:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.051');
INSERT INTO `dpe_visited` VALUES ('224', '2014-11-30 12:01:22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/start', '0.044');
INSERT INTO `dpe_visited` VALUES ('225', '2014-11-30 12:01:26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.076');
INSERT INTO `dpe_visited` VALUES ('226', '2014-11-30 12:02:02', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.055');
INSERT INTO `dpe_visited` VALUES ('227', '2014-11-30 12:02:04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('228', '2014-11-30 12:02:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.061');
INSERT INTO `dpe_visited` VALUES ('229', '2014-11-30 12:02:29', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/dpe/include_engine/css/images/sort_both.png', '0.048');
INSERT INTO `dpe_visited` VALUES ('230', '2014-11-30 12:02:29', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/dpe/include_engine/css/images/sort_asc.png', '0.052');
INSERT INTO `dpe_visited` VALUES ('231', '2014-11-30 12:02:50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.056');
INSERT INTO `dpe_visited` VALUES ('232', '2014-11-30 12:03:01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.046');
INSERT INTO `dpe_visited` VALUES ('233', '2014-11-30 12:03:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.056');
INSERT INTO `dpe_visited` VALUES ('234', '2014-11-30 12:04:02', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('235', '2014-11-30 12:04:03', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.051');
INSERT INTO `dpe_visited` VALUES ('236', '2014-11-30 12:04:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.049');
INSERT INTO `dpe_visited` VALUES ('237', '2014-11-30 12:04:52', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.047');
INSERT INTO `dpe_visited` VALUES ('238', '2014-11-30 12:05:04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('239', '2014-11-30 12:05:16', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.046');
INSERT INTO `dpe_visited` VALUES ('240', '2014-11-30 12:05:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.051');
INSERT INTO `dpe_visited` VALUES ('241', '2014-11-30 12:05:42', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.052');
INSERT INTO `dpe_visited` VALUES ('242', '2014-11-30 12:06:16', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.045');
INSERT INTO `dpe_visited` VALUES ('243', '2014-11-30 12:06:38', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.047');
INSERT INTO `dpe_visited` VALUES ('244', '2014-11-30 12:06:39', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.045');
INSERT INTO `dpe_visited` VALUES ('245', '2014-11-30 12:09:02', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.053');
INSERT INTO `dpe_visited` VALUES ('246', '2014-11-30 12:09:03', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.069');
INSERT INTO `dpe_visited` VALUES ('247', '2014-11-30 12:09:25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.051');
INSERT INTO `dpe_visited` VALUES ('248', '2014-11-30 12:09:26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.054');
INSERT INTO `dpe_visited` VALUES ('249', '2014-11-30 12:09:48', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.046');
INSERT INTO `dpe_visited` VALUES ('250', '2014-11-30 12:09:50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('251', '2014-11-30 12:09:54', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('252', '2014-11-30 12:10:40', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('253', '2014-11-30 12:10:51', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.049');
INSERT INTO `dpe_visited` VALUES ('254', '2014-11-30 12:12:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.049');
INSERT INTO `dpe_visited` VALUES ('255', '2014-11-30 12:12:12', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.047');
INSERT INTO `dpe_visited` VALUES ('256', '2014-11-30 12:12:21', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.049');
INSERT INTO `dpe_visited` VALUES ('257', '2014-11-30 12:12:35', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.059');
INSERT INTO `dpe_visited` VALUES ('258', '2014-11-30 12:12:38', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('259', '2014-11-30 12:12:52', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('260', '2014-11-30 12:12:58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.046');
INSERT INTO `dpe_visited` VALUES ('261', '2014-11-30 12:13:05', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.051');
INSERT INTO `dpe_visited` VALUES ('262', '2014-11-30 12:13:41', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.056');
INSERT INTO `dpe_visited` VALUES ('263', '2014-11-30 12:15:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.050');
INSERT INTO `dpe_visited` VALUES ('264', '2014-11-30 12:15:28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.044');
INSERT INTO `dpe_visited` VALUES ('265', '2014-11-30 12:16:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('266', '2014-11-30 12:16:27', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.051');
INSERT INTO `dpe_visited` VALUES ('267', '2014-11-30 12:16:41', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.057');
INSERT INTO `dpe_visited` VALUES ('268', '2014-11-30 12:16:52', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('269', '2014-11-30 12:16:54', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.056');
INSERT INTO `dpe_visited` VALUES ('270', '2014-11-30 12:16:56', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.049');
INSERT INTO `dpe_visited` VALUES ('271', '2014-11-30 12:17:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('272', '2014-11-30 12:17:21', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.050');
INSERT INTO `dpe_visited` VALUES ('273', '2014-11-30 12:17:28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.044');
INSERT INTO `dpe_visited` VALUES ('274', '2014-11-30 12:17:35', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.066');
INSERT INTO `dpe_visited` VALUES ('275', '2014-11-30 12:17:52', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('276', '2014-11-30 12:18:12', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.056');
INSERT INTO `dpe_visited` VALUES ('277', '2014-11-30 12:18:22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.051');
INSERT INTO `dpe_visited` VALUES ('278', '2014-11-30 12:18:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.062');
INSERT INTO `dpe_visited` VALUES ('279', '2014-11-30 12:18:46', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.045');
INSERT INTO `dpe_visited` VALUES ('280', '2014-11-30 12:18:57', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.056');
INSERT INTO `dpe_visited` VALUES ('281', '2014-11-30 12:19:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.050');
INSERT INTO `dpe_visited` VALUES ('282', '2014-11-30 12:19:33', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('283', '2014-11-30 12:19:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.057');
INSERT INTO `dpe_visited` VALUES ('284', '2014-11-30 12:19:54', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('285', '2014-11-30 12:20:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.042');
INSERT INTO `dpe_visited` VALUES ('286', '2014-11-30 12:20:42', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.045');
INSERT INTO `dpe_visited` VALUES ('287', '2014-11-30 12:21:02', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.045');
INSERT INTO `dpe_visited` VALUES ('288', '2014-11-30 12:21:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.044');
INSERT INTO `dpe_visited` VALUES ('289', '2014-11-30 12:21:16', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('290', '2014-11-30 12:22:07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.044');
INSERT INTO `dpe_visited` VALUES ('291', '2014-11-30 12:22:08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.044');
INSERT INTO `dpe_visited` VALUES ('292', '2014-11-30 12:22:10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.061');
INSERT INTO `dpe_visited` VALUES ('293', '2014-11-30 12:22:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.050');
INSERT INTO `dpe_visited` VALUES ('294', '2014-11-30 12:22:25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.050');
INSERT INTO `dpe_visited` VALUES ('295', '2014-11-30 12:22:30', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.049');
INSERT INTO `dpe_visited` VALUES ('296', '2014-11-30 12:22:52', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.044');
INSERT INTO `dpe_visited` VALUES ('297', '2014-11-30 12:25:10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.059');
INSERT INTO `dpe_visited` VALUES ('298', '2014-11-30 12:25:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('299', '2014-11-30 12:26:01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.046');
INSERT INTO `dpe_visited` VALUES ('300', '2014-11-30 12:26:14', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.049');
INSERT INTO `dpe_visited` VALUES ('301', '2014-11-30 12:26:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.050');
INSERT INTO `dpe_visited` VALUES ('302', '2014-11-30 12:26:40', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.046');
INSERT INTO `dpe_visited` VALUES ('303', '2014-11-30 12:26:51', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.058');
INSERT INTO `dpe_visited` VALUES ('304', '2014-11-30 12:27:05', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.049');
INSERT INTO `dpe_visited` VALUES ('305', '2014-11-30 12:27:33', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('306', '2014-11-30 12:27:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.056');
INSERT INTO `dpe_visited` VALUES ('307', '2014-11-30 12:27:52', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.050');
INSERT INTO `dpe_visited` VALUES ('308', '2014-11-30 12:27:59', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.054');
INSERT INTO `dpe_visited` VALUES ('309', '2014-11-30 12:28:07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.051');
INSERT INTO `dpe_visited` VALUES ('310', '2014-11-30 12:28:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.050');
INSERT INTO `dpe_visited` VALUES ('311', '2014-11-30 12:28:26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.046');
INSERT INTO `dpe_visited` VALUES ('312', '2014-11-30 12:28:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.050');
INSERT INTO `dpe_visited` VALUES ('313', '2014-11-30 12:28:50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.044');
INSERT INTO `dpe_visited` VALUES ('314', '2014-11-30 12:29:50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('315', '2014-11-30 12:29:54', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.049');
INSERT INTO `dpe_visited` VALUES ('316', '2014-11-30 12:30:10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.045');
INSERT INTO `dpe_visited` VALUES ('317', '2014-11-30 12:31:14', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.044');
INSERT INTO `dpe_visited` VALUES ('318', '2014-11-30 12:32:50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.044');
INSERT INTO `dpe_visited` VALUES ('319', '2014-11-30 12:32:51', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('320', '2014-11-30 12:32:52', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.063');
INSERT INTO `dpe_visited` VALUES ('321', '2014-11-30 12:33:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.065');
INSERT INTO `dpe_visited` VALUES ('322', '2014-11-30 12:33:18', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('323', '2014-11-30 12:33:18', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.045');
INSERT INTO `dpe_visited` VALUES ('324', '2014-11-30 12:34:05', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.047');
INSERT INTO `dpe_visited` VALUES ('325', '2014-11-30 12:34:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.053');
INSERT INTO `dpe_visited` VALUES ('326', '2014-11-30 12:35:15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('327', '2014-11-30 12:35:16', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.043');
INSERT INTO `dpe_visited` VALUES ('328', '2014-11-30 12:35:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.061');
INSERT INTO `dpe_visited` VALUES ('329', '2014-11-30 12:35:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.050');
INSERT INTO `dpe_visited` VALUES ('330', '2014-11-30 12:35:33', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.060');
INSERT INTO `dpe_visited` VALUES ('331', '2014-11-30 12:35:34', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.054');
INSERT INTO `dpe_visited` VALUES ('332', '2014-11-30 12:35:39', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.049');
INSERT INTO `dpe_visited` VALUES ('333', '2014-11-30 12:35:40', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.046');
INSERT INTO `dpe_visited` VALUES ('334', '2014-11-30 12:36:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.046');
INSERT INTO `dpe_visited` VALUES ('335', '2014-11-30 12:37:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('336', '2014-11-30 12:37:50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.058');
INSERT INTO `dpe_visited` VALUES ('337', '2014-11-30 12:38:49', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.112');
INSERT INTO `dpe_visited` VALUES ('338', '2014-11-30 12:39:00', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.052');
INSERT INTO `dpe_visited` VALUES ('339', '2014-11-30 12:39:01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.046');
INSERT INTO `dpe_visited` VALUES ('340', '2014-11-30 12:39:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.061');
INSERT INTO `dpe_visited` VALUES ('341', '2014-11-30 12:39:48', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.093');
INSERT INTO `dpe_visited` VALUES ('342', '2014-11-30 13:54:00', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.110');
INSERT INTO `dpe_visited` VALUES ('343', '2014-11-30 13:54:01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.061');
INSERT INTO `dpe_visited` VALUES ('344', '2014-11-30 13:54:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/start', '0.056');
INSERT INTO `dpe_visited` VALUES ('345', '2014-11-30 13:55:04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.058');
INSERT INTO `dpe_visited` VALUES ('346', '2014-11-30 13:55:09', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('347', '2014-11-30 13:55:25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/form', '0.051');
INSERT INTO `dpe_visited` VALUES ('348', '2014-11-30 13:55:28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.047');
INSERT INTO `dpe_visited` VALUES ('349', '2014-11-30 13:56:56', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.058');
INSERT INTO `dpe_visited` VALUES ('350', '2014-11-30 13:57:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.062');
INSERT INTO `dpe_visited` VALUES ('351', '2014-11-30 13:57:50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.064');
INSERT INTO `dpe_visited` VALUES ('352', '2014-11-30 13:58:05', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.054');
INSERT INTO `dpe_visited` VALUES ('353', '2014-11-30 13:58:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.072');
INSERT INTO `dpe_visited` VALUES ('354', '2014-11-30 13:58:17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.058');
INSERT INTO `dpe_visited` VALUES ('355', '2014-11-30 13:58:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.047');
INSERT INTO `dpe_visited` VALUES ('356', '2014-11-30 13:58:54', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.050');
INSERT INTO `dpe_visited` VALUES ('357', '2014-11-30 13:58:58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.053');
INSERT INTO `dpe_visited` VALUES ('358', '2014-11-30 13:59:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.053');
INSERT INTO `dpe_visited` VALUES ('359', '2014-11-30 13:59:22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.049');
INSERT INTO `dpe_visited` VALUES ('360', '2014-11-30 13:59:26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.068');
INSERT INTO `dpe_visited` VALUES ('361', '2014-11-30 13:59:31', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.052');
INSERT INTO `dpe_visited` VALUES ('362', '2014-11-30 13:59:39', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.048');
INSERT INTO `dpe_visited` VALUES ('363', '2014-11-30 14:01:51', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.143');
INSERT INTO `dpe_visited` VALUES ('364', '2014-11-30 14:02:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.131');
INSERT INTO `dpe_visited` VALUES ('365', '2014-11-30 14:02:48', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.057');
INSERT INTO `dpe_visited` VALUES ('366', '2014-11-30 14:02:56', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.118');
INSERT INTO `dpe_visited` VALUES ('367', '2014-11-30 14:10:03', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.057');
INSERT INTO `dpe_visited` VALUES ('368', '2014-11-30 14:10:14', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.147');
INSERT INTO `dpe_visited` VALUES ('369', '2014-11-30 14:13:55', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.052');
INSERT INTO `dpe_visited` VALUES ('370', '2014-11-30 17:34:30', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.069');
INSERT INTO `dpe_visited` VALUES ('371', '2014-11-30 17:35:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.059');
INSERT INTO `dpe_visited` VALUES ('372', '2014-11-30 17:35:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.044');
INSERT INTO `dpe_visited` VALUES ('373', '2014-11-30 17:36:47', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/participants', '0.098');
INSERT INTO `dpe_visited` VALUES ('374', '2014-11-30 17:37:18', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/participants', '0.063');
INSERT INTO `dpe_visited` VALUES ('375', '2014-11-30 17:37:19', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/participants', '0.060');
INSERT INTO `dpe_visited` VALUES ('376', '2014-11-30 17:37:25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/participants', '0.065');
INSERT INTO `dpe_visited` VALUES ('377', '2014-12-03 14:54:02', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.863');
INSERT INTO `dpe_visited` VALUES ('378', '2014-12-03 14:54:04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/test', '0.117');
INSERT INTO `dpe_visited` VALUES ('379', '2014-12-03 14:54:05', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/start', '0.046');
INSERT INTO `dpe_visited` VALUES ('380', '2014-12-03 15:07:16', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/start', '0.084');
INSERT INTO `dpe_visited` VALUES ('381', '2014-12-03 15:17:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.072');
INSERT INTO `dpe_visited` VALUES ('382', '2014-12-03 15:20:04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.045');
INSERT INTO `dpe_visited` VALUES ('383', '2014-12-03 15:20:08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/dpe/include_engine/css/images/sort_both.png', '0.051');
INSERT INTO `dpe_visited` VALUES ('384', '2014-12-03 15:20:08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/dpe/include_engine/css/images/sort_asc.png', '0.044');
INSERT INTO `dpe_visited` VALUES ('385', '2014-12-03 15:22:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.042');
INSERT INTO `dpe_visited` VALUES ('386', '2014-12-03 15:24:57', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.045');
INSERT INTO `dpe_visited` VALUES ('387', '2014-12-03 15:28:10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.047');
INSERT INTO `dpe_visited` VALUES ('388', '2014-12-03 15:33:36', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/dpe/include_engine/css/images/sort_both.png', '0.048');
INSERT INTO `dpe_visited` VALUES ('389', '2014-12-03 15:33:36', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/dpe/include_engine/css/images/sort_asc.png', '0.046');
INSERT INTO `dpe_visited` VALUES ('390', '2014-12-05 14:20:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.896');
INSERT INTO `dpe_visited` VALUES ('391', '2014-12-05 14:20:49', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '192.168.1.129', 'http://192.168.1.128:81/', '0.072');
INSERT INTO `dpe_visited` VALUES ('392', '2014-12-13 13:11:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.315');
INSERT INTO `dpe_visited` VALUES ('393', '2014-12-13 13:11:51', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.107');
INSERT INTO `dpe_visited` VALUES ('394', '2014-12-13 13:11:52', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.107');
INSERT INTO `dpe_visited` VALUES ('395', '2014-12-13 13:12:38', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.274');
INSERT INTO `dpe_visited` VALUES ('396', '2014-12-13 13:13:21', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.138');
INSERT INTO `dpe_visited` VALUES ('397', '2014-12-13 13:13:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.107');
INSERT INTO `dpe_visited` VALUES ('398', '2014-12-13 13:13:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.107');
INSERT INTO `dpe_visited` VALUES ('399', '2014-12-13 13:13:59', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.109');
INSERT INTO `dpe_visited` VALUES ('400', '2014-12-13 13:14:00', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.114');
INSERT INTO `dpe_visited` VALUES ('401', '2014-12-13 13:14:05', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.104');
INSERT INTO `dpe_visited` VALUES ('402', '2014-12-13 13:14:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.104');
INSERT INTO `dpe_visited` VALUES ('403', '2014-12-13 13:14:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.104');
INSERT INTO `dpe_visited` VALUES ('404', '2014-12-13 13:14:24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.118');
INSERT INTO `dpe_visited` VALUES ('405', '2014-12-13 13:14:25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.109');
INSERT INTO `dpe_visited` VALUES ('406', '2014-12-13 13:14:26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.106');
INSERT INTO `dpe_visited` VALUES ('407', '2014-12-13 13:14:26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.112');
INSERT INTO `dpe_visited` VALUES ('408', '2014-12-13 13:14:28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.120');
INSERT INTO `dpe_visited` VALUES ('409', '2014-12-13 13:14:28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.105');
INSERT INTO `dpe_visited` VALUES ('410', '2014-12-13 13:14:29', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.105');
INSERT INTO `dpe_visited` VALUES ('411', '2014-12-13 13:14:30', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.106');
INSERT INTO `dpe_visited` VALUES ('412', '2014-12-13 13:14:32', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.120');
INSERT INTO `dpe_visited` VALUES ('413', '2014-12-13 13:14:33', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.104');
INSERT INTO `dpe_visited` VALUES ('414', '2014-12-13 13:14:33', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.106');
INSERT INTO `dpe_visited` VALUES ('415', '2014-12-13 19:06:37', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '1.319');
INSERT INTO `dpe_visited` VALUES ('416', '2014-12-13 19:06:39', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.202');
INSERT INTO `dpe_visited` VALUES ('417', '2014-12-13 19:06:40', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.101');
INSERT INTO `dpe_visited` VALUES ('418', '2014-12-13 19:06:41', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.118');
INSERT INTO `dpe_visited` VALUES ('419', '2014-12-13 19:06:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.106');
INSERT INTO `dpe_visited` VALUES ('420', '2014-12-13 19:07:53', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.219');
INSERT INTO `dpe_visited` VALUES ('421', '2014-12-13 19:08:54', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.155');
INSERT INTO `dpe_visited` VALUES ('422', '2014-12-13 19:09:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.138');
INSERT INTO `dpe_visited` VALUES ('423', '2014-12-13 19:09:51', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.147');
INSERT INTO `dpe_visited` VALUES ('424', '2014-12-13 19:13:41', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.131');
INSERT INTO `dpe_visited` VALUES ('425', '2014-12-13 19:14:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.123');
INSERT INTO `dpe_visited` VALUES ('426', '2014-12-13 19:15:08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.113');
INSERT INTO `dpe_visited` VALUES ('427', '2014-12-13 19:15:10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.106');
INSERT INTO `dpe_visited` VALUES ('428', '2014-12-13 19:15:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.119');
INSERT INTO `dpe_visited` VALUES ('429', '2014-12-13 19:15:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.109');
INSERT INTO `dpe_visited` VALUES ('430', '2014-12-13 19:18:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.119');
INSERT INTO `dpe_visited` VALUES ('431', '2014-12-13 19:41:12', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.155');
INSERT INTO `dpe_visited` VALUES ('432', '2014-12-13 19:41:36', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.156');
INSERT INTO `dpe_visited` VALUES ('433', '2014-12-13 19:44:48', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.141');
INSERT INTO `dpe_visited` VALUES ('434', '2014-12-13 19:47:15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.139');
INSERT INTO `dpe_visited` VALUES ('435', '2014-12-13 19:47:28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.129');
INSERT INTO `dpe_visited` VALUES ('436', '2014-12-13 19:47:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.120');
INSERT INTO `dpe_visited` VALUES ('437', '2014-12-13 19:47:46', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.110');
INSERT INTO `dpe_visited` VALUES ('438', '2014-12-13 20:08:21', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.123');
INSERT INTO `dpe_visited` VALUES ('439', '2014-12-14 12:59:29', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.268');
INSERT INTO `dpe_visited` VALUES ('440', '2014-12-14 13:15:58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.118');
INSERT INTO `dpe_visited` VALUES ('441', '2014-12-14 13:17:53', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.118');
INSERT INTO `dpe_visited` VALUES ('442', '2014-12-14 13:17:54', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.103');
INSERT INTO `dpe_visited` VALUES ('443', '2014-12-14 13:21:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/dpe/include_engine/css/images/sort_both.png', '0.173');
INSERT INTO `dpe_visited` VALUES ('444', '2014-12-14 13:21:13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/dpe/include_engine/css/images/sort_asc.png', '0.165');
INSERT INTO `dpe_visited` VALUES ('445', '2014-12-14 13:48:15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.147');
INSERT INTO `dpe_visited` VALUES ('446', '2014-12-14 13:48:18', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.110');
INSERT INTO `dpe_visited` VALUES ('447', '2014-12-14 13:51:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.130');
INSERT INTO `dpe_visited` VALUES ('448', '2014-12-14 13:51:44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.317');
INSERT INTO `dpe_visited` VALUES ('449', '2014-12-14 14:00:20', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.172');
INSERT INTO `dpe_visited` VALUES ('450', '2014-12-14 14:00:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.123');
INSERT INTO `dpe_visited` VALUES ('451', '2014-12-14 14:00:24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.151');
INSERT INTO `dpe_visited` VALUES ('452', '2014-12-14 14:00:25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.108');
INSERT INTO `dpe_visited` VALUES ('453', '2014-12-14 14:00:25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.124');
INSERT INTO `dpe_visited` VALUES ('454', '2014-12-14 14:00:45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.122');
INSERT INTO `dpe_visited` VALUES ('455', '2014-12-14 14:01:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.160');
INSERT INTO `dpe_visited` VALUES ('456', '2014-12-14 14:06:38', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.146');
INSERT INTO `dpe_visited` VALUES ('457', '2014-12-14 14:31:46', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.113');
INSERT INTO `dpe_visited` VALUES ('458', '2014-12-14 14:32:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.111');
INSERT INTO `dpe_visited` VALUES ('459', '2014-12-14 14:32:07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.108');
INSERT INTO `dpe_visited` VALUES ('460', '2014-12-14 14:32:08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.112');
INSERT INTO `dpe_visited` VALUES ('461', '2014-12-14 14:32:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.117');
INSERT INTO `dpe_visited` VALUES ('462', '2014-12-14 14:32:11', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.110');
INSERT INTO `dpe_visited` VALUES ('463', '2014-12-14 14:32:12', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://192.168.1.128:81/', '0.115');
INSERT INTO `dpe_visited` VALUES ('464', '2014-12-14 14:32:39', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.111');
INSERT INTO `dpe_visited` VALUES ('465', '2014-12-14 15:46:43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.142');
INSERT INTO `dpe_visited` VALUES ('466', '2014-12-14 15:46:46', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.303');
INSERT INTO `dpe_visited` VALUES ('467', '2014-12-14 15:46:47', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.104');
INSERT INTO `dpe_visited` VALUES ('468', '2014-12-14 16:10:59', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.136');
INSERT INTO `dpe_visited` VALUES ('469', '2014-12-14 16:11:01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.118');
INSERT INTO `dpe_visited` VALUES ('470', '2014-12-14 16:11:01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.103');
INSERT INTO `dpe_visited` VALUES ('471', '2014-12-14 16:11:22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.129');
INSERT INTO `dpe_visited` VALUES ('472', '2014-12-14 16:17:06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.139');
INSERT INTO `dpe_visited` VALUES ('473', '2014-12-14 16:17:09', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/dasdadsadasd', '0.108');
INSERT INTO `dpe_visited` VALUES ('474', '2014-12-14 16:17:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/DROPTABE', '0.116');
INSERT INTO `dpe_visited` VALUES ('475', '2014-12-14 16:17:27', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/DROPTABE', '0.123');
INSERT INTO `dpe_visited` VALUES ('476', '2014-12-14 16:40:15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.122');
INSERT INTO `dpe_visited` VALUES ('477', '2014-12-14 16:42:07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.138');
INSERT INTO `dpe_visited` VALUES ('478', '2014-12-14 16:49:57', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.216');
INSERT INTO `dpe_visited` VALUES ('479', '2014-12-14 17:06:58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.124');
INSERT INTO `dpe_visited` VALUES ('480', '2014-12-14 17:07:28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/dpe/include_engine/css/images/sort_both.png', '0.189');
INSERT INTO `dpe_visited` VALUES ('481', '2014-12-14 17:07:28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/dpe/include_engine/css/images/sort_asc.png', '0.195');
INSERT INTO `dpe_visited` VALUES ('482', '2014-12-14 18:39:59', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.136');
INSERT INTO `dpe_visited` VALUES ('483', '2014-12-15 19:40:23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/', '0.592');
INSERT INTO `dpe_visited` VALUES ('484', '2014-12-15 19:40:25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/test', '0.212');
INSERT INTO `dpe_visited` VALUES ('485', '2014-12-15 19:40:26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '127.0.0.1', 'http://dpe2/start', '0.110');
