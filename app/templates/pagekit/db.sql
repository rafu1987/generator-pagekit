-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Erstellungszeit: 22. Dez 2016 um 13:37
-- Server-Version: 5.6.35
-- PHP-Version: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `pagekit-yeoman`
--
CREATE DATABASE IF NOT EXISTS `pagekit-yeoman` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `pagekit-yeoman`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_blog_comment`
--

CREATE TABLE `pk_blog_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_blog_post`
--

CREATE TABLE `pk_blog_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `date` datetime DEFAULT NULL,
  `modified` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` longtext COLLATE utf8_unicode_ci NOT NULL,
  `comment_status` tinyint(1) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_blog_post`
--

INSERT INTO `pk_blog_post` (`id`, `user_id`, `slug`, `title`, `status`, `date`, `modified`, `content`, `excerpt`, `comment_status`, `comment_count`, `data`, `roles`) VALUES
(1, 1, 'hello-pagekit', 'Hello Pagekit', 2, '2016-12-22 13:21:08', '2016-12-22 13:21:08', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '', 1, 0, '{\"title\":null,\"markdown\":true}', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_auth`
--

CREATE TABLE `pk_system_auth` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_auth`
--

INSERT INTO `pk_system_auth` (`id`, `user_id`, `access`, `status`, `data`) VALUES
('560342fa36dda88e03715e17b0d3d5b37ac6e935', 1, '2016-12-22 13:21:15', 1, '{\"ip\":\"172.20.0.1\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.95 Safari\\/537.36\"}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_config`
--

CREATE TABLE `pk_system_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_config`
--

INSERT INTO `pk_system_config` (`id`, `name`, `value`) VALUES
(1, 'system/dashboard', '{\"55dda578e93b5\":{\"type\":\"location\",\"column\":1,\"idx\":0,\"units\":\"metric\",\"id\":\"55dda578e93b5\",\"uid\":2911298,\"city\":\"Hamburg\",\"country\":\"DE\",\"coords\":{\"lon\":10,\"lat\":53.549999}},\"55dda581d5781\":{\"type\":\"feed\",\"column\":2,\"idx\":0,\"count\":5,\"content\":\"1\",\"id\":\"55dda581d5781\",\"title\":\"Pagekit News\",\"url\":\"http:\\/\\/pagekit.com\\/blog\\/feed\"},\"55dda6e3dd661\":{\"type\":\"user\",\"column\":0,\"idx\":100,\"show\":\"registered\",\"display\":\"thumbnail\",\"total\":\"1\",\"count\":12,\"id\":\"55dda6e3dd661\"}}'),
(2, 'system/site', '{\"menus\":{\"main\":{\"id\":\"main\",\"label\":\"Main\"}},\"title\":\"Pagekit Demo\",\"frontpage\":1,\"view\":{\"logo\":\"storage\\/pagekit-logo.svg\"}}'),
(3, 'system', '{\"admin\":{\"locale\":\"de_DE\"},\"site\":{\"locale\":\"de_DE\",\"theme\":\"theme-one\"},\"version\":\"1.0.9\",\"packages\":{\"blog\":\"1.0.2\",\"theme-one\":\"1.0.0\"},\"extensions\":[\"blog\"]}'),
(6, 'theme-one', '{\"logo_contrast\":\"storage\\/pagekit-logo-contrast.svg\",\"_menus\":{\"main\":\"main\",\"offcanvas\":\"main\"},\"_positions\":{\"hero\":[1],\"footer\":[2]},\"_widgets\":{\"1\":{\"title_hide\":true,\"title_size\":\"uk-panel-title\",\"alignment\":true,\"html_class\":\"\",\"panel\":\"\"},\"2\":{\"title_hide\":true,\"title_size\":\"uk-panel-title\",\"alignment\":\"true\",\"html_class\":\"\",\"panel\":\"\"}},\"_nodes\":{\"1\":{\"title_hide\":true,\"title_large\":false,\"alignment\":true,\"html_class\":\"\",\"sidebar_first\":false,\"hero_image\":\"storage\\/home-hero.jpg\",\"hero_viewport\":true,\"hero_contrast\":true,\"navbar_transparent\":true}}}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_node`
--

CREATE TABLE `pk_system_node` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(1023) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_node`
--

INSERT INTO `pk_system_node` (`id`, `parent_id`, `priority`, `status`, `title`, `slug`, `path`, `link`, `type`, `menu`, `roles`, `data`) VALUES
(1, 0, 1, 1, 'Home', 'home', '/home', '@page/1', 'page', 'main', NULL, '{\"defaults\":{\"id\":1}}'),
(2, 0, 2, 1, 'Blog', 'blog', '/blog', '@blog', 'blog', 'main', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_page`
--

CREATE TABLE `pk_system_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_page`
--

INSERT INTO `pk_system_page` (`id`, `title`, `content`, `data`) VALUES
(1, 'Home', '<div class=\"uk-width-medium-3-4 uk-container-center\">\n    \n<h3 class=\"uk-h1 uk-margin-large-bottom\">Uniting fresh design and clean code<br class=\"uk-hidden-small\"> to create beautiful websites.</h3>\n\n<p class=\"uk-width-medium-4-6 uk-container-center\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n\n</div>', '{\"title\":true}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_role`
--

CREATE TABLE `pk_system_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `permissions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_role`
--

INSERT INTO `pk_system_role` (`id`, `name`, `priority`, `permissions`) VALUES
(1, 'Anonymous', 0, NULL),
(2, 'Authenticated', 1, 'blog: post comments'),
(3, 'Administrator', 2, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_session`
--

CREATE TABLE `pk_system_session` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_session`
--

INSERT INTO `pk_system_session` (`id`, `time`, `data`) VALUES
('0d5d340a9c27bfa5673228a433915f5e', '2016-12-22 13:21:14', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiNGU3MjYwNTEzNjUwODM0NjJhYjAzNGM1ZmY2NGMyMjQxZmIzNTYzZiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0ODI0MTI4NzM7czoxOiJjIjtpOjE0ODI0MTI4NzM7czoxOiJsIjtzOjE6IjAiO30='),
('a942e47b81801da24046d290d1817484', '2016-12-22 13:21:15', 'X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiNGU3MjYwNTEzNjUwODM0NjJhYjAzNGM1ZmY2NGMyMjQxZmIzNTYzZiI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE0ODI0MTI4NzU7czoxOiJjIjtpOjE0ODI0MTI4NzM7czoxOiJsIjtzOjE6IjAiO30=');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_user`
--

CREATE TABLE `pk_system_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `registered` datetime NOT NULL,
  `login` datetime DEFAULT NULL,
  `activation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_user`
--

INSERT INTO `pk_system_user` (`id`, `name`, `username`, `email`, `password`, `url`, `status`, `registered`, `login`, `activation`, `roles`, `data`) VALUES
(1, '###NAME###', '###USER###', '###EMAIL###', '###PASS###', '', 1, '2016-12-22 13:21:08', '2016-12-22 13:21:15', NULL, '2,3', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pk_system_widget`
--

CREATE TABLE `pk_system_widget` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `nodes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `pk_system_widget`
--

INSERT INTO `pk_system_widget` (`id`, `title`, `type`, `status`, `nodes`, `roles`, `data`) VALUES
(1, 'Hello, I\'m Pagekit', 'system/text', 1, '1', NULL, '{\"content\":\"<h1 class=\\\"uk-heading-large uk-margin-large-bottom\\\">Hello, I\'m Pagekit,<br class=\\\"uk-hidden-small\\\"> your new favorite CMS.<\\/h1>\\n\\n<a class=\\\"uk-button uk-button-large\\\" href=\\\"http:\\/\\/www.pagekit.com\\\">Get started<\\/a>\"}'),
(2, 'Powered by Pagekit', 'system/text', 1, NULL, NULL, '{\"content\":\"<ul class=\\\"uk-grid uk-grid-medium uk-flex uk-flex-center\\\">\\n    <li><a href=\\\"https:\\/\\/github.com\\/pagekit\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-github\\\"><\\/a><\\/li>\\n    <li><a href=\\\"https:\\/\\/twitter.com\\/pagekit\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-twitter\\\"><\\/a><\\/li>\\n    <li><a href=\\\"https:\\/\\/gitter.im\\/pagekit\\/pagekit\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-comment-o\\\"><\\/a><\\/li>\\n    <li><a href=\\\"https:\\/\\/plus.google.com\\/communities\\/104125443335488004107\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-google-plus\\\"><\\/a><\\/li>\\n<\\/ul>\\n\\n<p>Powered by <a href=\\\"https:\\/\\/pagekit.com\\\">Pagekit<\\/a><\\/p>\"}');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `pk_blog_comment`
--
ALTER TABLE `pk_blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_BLOG_COMMENT_AUTHOR` (`author`),
  ADD KEY `pk_BLOG_COMMENT_CREATED` (`created`),
  ADD KEY `pk_BLOG_COMMENT_STATUS` (`status`),
  ADD KEY `pk_BLOG_COMMENT_POST_ID` (`post_id`),
  ADD KEY `pk_BLOG_COMMENT_POST_ID_STATUS` (`post_id`,`status`);

--
-- Indizes für die Tabelle `pk_blog_post`
--
ALTER TABLE `pk_blog_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_BLOG_POST_SLUG` (`slug`),
  ADD KEY `pk_BLOG_POST_TITLE` (`title`),
  ADD KEY `pk_BLOG_POST_USER_ID` (`user_id`),
  ADD KEY `pk_BLOG_POST_DATE` (`date`);

--
-- Indizes für die Tabelle `pk_system_auth`
--
ALTER TABLE `pk_system_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pk_system_config`
--
ALTER TABLE `pk_system_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_SYSTEM_CONFIG_NAME` (`name`);

--
-- Indizes für die Tabelle `pk_system_node`
--
ALTER TABLE `pk_system_node`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pk_system_page`
--
ALTER TABLE `pk_system_page`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pk_system_role`
--
ALTER TABLE `pk_system_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_SYSTEM_ROLE_NAME` (`name`),
  ADD KEY `pk_SYSTEM_ROLE_NAME_PRIORITY` (`name`,`priority`);

--
-- Indizes für die Tabelle `pk_system_session`
--
ALTER TABLE `pk_system_session`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pk_system_user`
--
ALTER TABLE `pk_system_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pk_SYSTEM_USER_USERNAME` (`username`),
  ADD UNIQUE KEY `pk_SYSTEM_USER_EMAIL` (`email`);

--
-- Indizes für die Tabelle `pk_system_widget`
--
ALTER TABLE `pk_system_widget`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `pk_blog_comment`
--
ALTER TABLE `pk_blog_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `pk_blog_post`
--
ALTER TABLE `pk_blog_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `pk_system_config`
--
ALTER TABLE `pk_system_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT für Tabelle `pk_system_node`
--
ALTER TABLE `pk_system_node`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `pk_system_page`
--
ALTER TABLE `pk_system_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `pk_system_role`
--
ALTER TABLE `pk_system_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `pk_system_user`
--
ALTER TABLE `pk_system_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `pk_system_widget`
--
ALTER TABLE `pk_system_widget`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
