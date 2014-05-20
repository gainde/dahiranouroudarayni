-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 18 Mai 2014 à 20:46
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `asfcanada`
--
CREATE DATABASE IF NOT EXISTS `asfcanada` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `asfcanada`;

-- --------------------------------------------------------

--
-- Structure de la table `asf_assets`
--

DROP TABLE IF EXISTS `asf_assets`;
CREATE TABLE IF NOT EXISTS `asf_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=90 ;

--
-- Contenu de la table `asf_assets`
--

INSERT INTO `asf_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 177, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 18, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 19, 124, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 125, 126, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 127, 128, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 129, 130, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 131, 132, 1, 'com_login', 'com_login', '{}'),
(13, 1, 133, 134, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 135, 136, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 137, 138, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 139, 140, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 141, 142, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 143, 144, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 145, 150, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 151, 152, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 153, 154, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 155, 156, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 157, 158, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 159, 162, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.own":{"6":1},"core.edit.state":[]}'),
(25, 1, 163, 168, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 169, 170, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 20, 119, 2, 'com_content.category.2', 'Non catégorisé', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Non catégorisé', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Non catégorisé', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 146, 147, 2, 'com_newsfeeds.category.5', 'Non catégorisé', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 164, 165, 2, 'com_weblinks.category.6', 'Non catégorisé', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 160, 161, 1, 'com_users.category.7', 'Non catégorisé', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 171, 172, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 25, 166, 167, 2, 'com_weblinks.category.8', 'Liens de Blog', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(35, 8, 120, 123, 2, 'com_content.category.9', 'Blog', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(36, 27, 21, 22, 3, 'com_content.article.1', 'A propos de ce site', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(37, 27, 23, 24, 3, 'com_content.article.2', 'Travailler sur le site', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(38, 27, 65, 66, 3, 'com_content.article.3', 'PROJET HAITI 2012-2018', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(39, 27, 69, 70, 3, 'com_content.article.4', 'LE DÉFI', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(40, 27, 67, 68, 3, 'com_content.article.5', 'NOS ACTIVITÉS AU CANADA', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 1, 173, 174, 1, 'com_users.notes.category.10', 'Non catégorisé', ''),
(42, 1, 175, 176, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(43, 27, 51, 52, 3, 'com_content.article.6', 'Notre action', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(44, 27, 33, 34, 3, 'com_content.article.7', 'parrainer une famille', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(45, 27, 31, 32, 3, 'com_content.article.8', 'Faire un don', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(46, 27, 25, 26, 3, 'com_content.article.9', 'Impliquez-vous', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(47, 27, 27, 28, 3, 'com_content.article.10', 'Faire un don', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(48, 35, 121, 122, 3, 'com_content.article.11', 'Impliquez-vous', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(49, 27, 29, 30, 3, 'com_content.article.12', 'Mission, objectifs et valeurs', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(50, 7, 16, 17, 2, 'com_contact.category.10', 'asf-contact', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(51, 27, 47, 48, 3, 'com_content.article.13', 'Historique', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(52, 27, 35, 36, 3, 'com_content.article.14', 'Parrainer dès Maintenant', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(53, 27, 37, 38, 3, 'com_content.article.15', 'Développement communautaire', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(54, 27, 59, 60, 3, 'com_content.article.16', 'Publication', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(55, 27, 55, 56, 3, 'com_content.article.17', 'Notre_action_au_quebec', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(56, 27, 53, 54, 3, 'com_content.article.18', 'Notre_action_au_canada', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(57, 27, 57, 58, 3, 'com_content.article.19', 'Notre_action_a_l''internationnal', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(58, 27, 49, 50, 3, 'com_content.article.20', 'Espace Parrainage', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(59, 27, 45, 46, 3, 'com_content.article.21', 'FAQ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(60, 27, 43, 44, 3, 'com_content.article.22', 'Entreprises', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(61, 27, 41, 42, 3, 'com_content.article.23', 'Carriéres', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(62, 27, 39, 40, 3, 'com_content.article.24', 'Développement social', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(63, 27, 61, 62, 3, 'com_content.article.25', 'Santé psychosociale', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(64, 27, 63, 64, 3, 'com_content.article.26', 'Santé psychosociale', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(65, 27, 71, 72, 3, 'com_content.article.27', 'Notre organisme', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(66, 27, 73, 74, 3, 'com_content.article.28', 'Nos axes d’intervention', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(67, 27, 75, 76, 3, 'com_content.article.29', 'Missions, objectifs et valeurs', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(68, 27, 77, 78, 3, 'com_content.article.30', 'Fonctionnement du Parrainage', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(69, 27, 79, 80, 3, 'com_content.article.31', 'Notre équipe', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(70, 27, 81, 82, 3, 'com_content.article.32', 'Actualités ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(71, 27, 83, 84, 3, 'com_content.article.33', 'Nouvelles', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(72, 27, 85, 86, 3, 'com_content.article.34', 'Agenda des évènements', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(73, 27, 87, 88, 3, 'com_content.article.35', 'Le Blog de l’équipe', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(74, 27, 89, 90, 3, 'com_content.article.36', 'S’inscrire à la Newsletter', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(75, 27, 91, 92, 3, 'com_content.article.37', 'Agir ensemble', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(76, 27, 93, 94, 3, 'com_content.article.38', 'Donner', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(77, 27, 95, 96, 3, 'com_content.article.39', 'Faire un Don', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(78, 27, 97, 98, 3, 'com_content.article.40', 'Demander une brochure', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(79, 27, 99, 100, 3, 'com_content.article.41', 'Offrir un cadeau solidaire ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(80, 27, 101, 102, 3, 'com_content.article.42', '(crayons/stylos, matériel pédagogique, etc. pour nos missions)', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(81, 27, 103, 104, 3, 'com_content.article.43', 'Offrir du matériel informatique (fournitures de bureau etc. pour l’ASF)', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(82, 27, 105, 106, 3, 'com_content.article.44', 'Nos partenaires', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(83, 27, 107, 108, 3, 'com_content.article.45', 'Bénévolat', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(84, 27, 109, 110, 3, 'com_content.article.46', 'Offres de stages', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(85, 27, 111, 112, 3, 'com_content.article.47', 'Contact ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(86, 27, 113, 114, 3, 'com_content.article.48', 'Infos (infos, google maps, réseaux sociaux, etc.)', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(87, 19, 148, 149, 2, 'com_newsfeeds.category.11', 'actualitesfbook', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(88, 27, 115, 116, 3, 'com_content.article.49', 'Galeries', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(89, 27, 117, 118, 3, 'com_content.article.50', 'visitez vos parrainés', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}');

-- --------------------------------------------------------

--
-- Structure de la table `asf_associations`
--

DROP TABLE IF EXISTS `asf_associations`;
CREATE TABLE IF NOT EXISTS `asf_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_banner_clients`
--

DROP TABLE IF EXISTS `asf_banner_clients`;
CREATE TABLE IF NOT EXISTS `asf_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `asf_banner_tracks`
--

DROP TABLE IF EXISTS `asf_banner_tracks`;
CREATE TABLE IF NOT EXISTS `asf_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_banners`
--

DROP TABLE IF EXISTS `asf_banners`;
CREATE TABLE IF NOT EXISTS `asf_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `asf_categories`
--

DROP TABLE IF EXISTS `asf_categories`;
CREATE TABLE IF NOT EXISTS `asf_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `asf_categories`
--

INSERT INTO `asf_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`) VALUES
(1, 0, 0, 0, 23, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 883, '2009-10-18 16:07:09', 0, '0000-00-00 00:00:00', 0, '*'),
(2, 27, 1, 15, 16, 1, 'non-categorise', 'com_content', 'Non catégorisé', 'non-categorise', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 883, '2010-06-28 13:26:37', 0, '0000-00-00 00:00:00', 0, '*'),
(3, 28, 1, 1, 2, 1, 'non-categorise', 'com_banners', 'Non catégorisé', 'non-categorise', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 883, '2010-06-28 13:27:35', 0, '0000-00-00 00:00:00', 0, '*'),
(4, 29, 1, 3, 4, 1, 'non-categorise', 'com_contact', 'Non catégorisé', 'non-categorise', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 883, '2010-06-28 13:27:57', 0, '0000-00-00 00:00:00', 0, '*'),
(5, 30, 1, 5, 6, 1, 'non-categorise', 'com_newsfeeds', 'Non catégorisé', 'non-categorise', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 883, '2010-06-28 13:28:15', 0, '0000-00-00 00:00:00', 0, '*'),
(6, 31, 1, 7, 8, 1, 'non-categorise', 'com_weblinks', 'Non catégorisé', 'non-categorise', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 883, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(7, 32, 1, 9, 10, 1, 'non-categorise', 'com_users', 'Non catégorisé', 'non-categorise', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 883, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(8, 34, 1, 11, 12, 1, 'liens-blog', 'com_weblinks', 'Liens de Blog', 'liens-blog', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 883, '2012-01-04 15:02:08', 0, '0000-00-00 00:00:00', 0, '*'),
(9, 35, 1, 13, 14, 1, 'blog', 'com_content', 'Blog', 'blog', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 883, '2012-01-04 15:43:10', 0, '0000-00-00 00:00:00', 0, '*'),
(10, 50, 1, 19, 20, 1, 'asf-contact', 'com_contact', 'asf-contact', 'asf-contact', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 883, '2014-02-26 18:57:22', 0, '0000-00-00 00:00:00', 0, '*'),
(11, 87, 1, 21, 22, 1, 'actualitesfbook', 'com_newsfeeds', 'actualitesfbook', 'actualitesfbook', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 883, '2014-04-01 19:36:58', 0, '0000-00-00 00:00:00', 0, '*');

-- --------------------------------------------------------

--
-- Structure de la table `asf_contact_details`
--

DROP TABLE IF EXISTS `asf_contact_details`;
CREATE TABLE IF NOT EXISTS `asf_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `asf_contact_details`
--

INSERT INTO `asf_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `sortname1`, `sortname2`, `sortname3`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`) VALUES
(1, 'ASF Canada', 'asf-canada', 'Artistes Sans Frontières Canada est une initiative de la Fondation québécoise pour la danse contemporaine (FQDC). Le numéro d’organisme de charité de la FQDC est le : 86018 2799 RR0001.', '372, rue Ste-Catherine Ouest, bureau 327, 3ème étage, Montréal(Québec) Canada\r\nMétro Place-des-Arts, sortie Bleury', 'Montréal', '', 'Canada', ' H3B 1A2', '514-878-2586, poste 33', '514-395-2276', '<p>Nos heures de bureaux sont du lundi au vendredi de 9h30 à 17h30.</p>\r\n<p>Vous pouvez nous joindre en tout temps par courriel :  info@asfcanada.org.</p>\r\n<p>Pour les demandes d''emplois, de stages et de bénévolat : emploi@asfcanada.org</p>', 'images/logo.png', NULL, 'info@asfcanada.org', 0, 1, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"plain","show_name":"0","show_position":"1","show_email":"1","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"1","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"","linka":false,"linkb_name":"","linkb":false,"linkc_name":"","linkc":false,"linkd_name":"","linkd":false,"linke_name":"","linke":"","contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 10, 1, '', '', '', '', '', '*', '2014-02-26 18:54:19', 883, '', '2014-02-27 21:33:38', 883, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `asf_content`
--

DROP TABLE IF EXISTS `asf_content`;
CREATE TABLE IF NOT EXISTS `asf_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Contenu de la table `asf_content`
--

INSERT INTO `asf_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 36, 'A propos de ce site', 'a-propos', '', '<p>Cette page a pour but de présenter brièvement le Blog et la personne qui l''écrit.</p>\r\n<p>Lorsque vous serez connecté, vous aurez la possibilité de modifier cette page en cliquant sur le lien «Modifier».</p>', '', 1, 0, 0, 2, '2012-01-04 16:10:42', 883, '', '2014-03-11 20:08:05', 883, 0, '0000-00-00 00:00:00', '2012-01-04 16:10:42', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 17, '', '', 1, 53, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(2, 37, 'Travailler sur le site', 'travailler-sur-le-site', '', '<p style="text-align: justify;">Vous trouverez ici quelques astuces basiques pour travailler sur votre site.</p>\r\n<ul>\r\n<li style="text-align: justify;">Joomla! a une partie «Site» (ou frontale), que vous êtes en train de regarder, et une partie «Administration» (ou arrière) qui est l''endroit où vous effectuez le travail plus avancé comme régler les menus ou décider quels modules afficher. Vous devez vous connecter à l''administration séparément en utilisant le même identifiant et le même mot de passe que vous utilisez sur cette partie du site.</li>\r\n<li style="text-align: justify;">Une des premières choses que vous souhaiterez faire sera probablement de changer le titre du site ansi que sa description. Pour cela, connectez-vous à l''administration puis, dans le menu «Extensions», cliquez sur «Gestion des templates». Ce site est installé avec le template «Protostar» (actuellement utilisé) et le template «Beez3». Pour appliquer un template, cliquez sur l''étoile à droite de son titre, la couleur jaune indique que le template est celui utilisé. En cliquant sur le nom du template, un formulaire est affiché vous permettant de modifier les paramètres selon vos souhaits. Vous pouvez expérimenter les différents paramètres proposés.</li>\r\n<li style="text-align: justify;">Vous souhaitez probablement installer un nouveau template pour changer l''aspect du site. Pour cela, dans le menu «Extension», cliquez sur «Gestion des extensions», vous accédez à l''onglet «Installation».<br />Il existe de nombreux templates gratuits et commerciaux pour Joomla!</li>\r\n<li style="text-align: justify;">Comme vous l''avez déjà vu, vous pouvez contrôler qui peut voir les différentes parties de votre site. Quand vous travaillez aves des modules, articles ou liens web, régler le niveau d''accès sur «Enregistré» signifie que seuls les utilisateurs identifiés sur le site pourront y accéder.</li>\r\n<li style="text-align: justify;">Quand vous créez un nouvel article ou un autre type de contenu, vous pouvez également l''enregistrer comme «Publié» ou «Non-publié». S''il est «Non-publié», les visiteurs du site ne pourront pas le voir, mais vous oui.</li>\r\n<li style="text-align: justify;">Vous pouvez en apprendre d''avantage sur comment travailler avec Joomla! en consultant le <a href="http://docs.joomla.org">site de documentation Joomla</a> et obtenir de l''aide des autres utilisateurs en consultant les <a href="http://forum.joomla.org">forums Joomla.org</a> (en anglais) et les <a href="http://forum.joomla.fr">forums Joomla.fr</a> (en français).<br />Dans l''administration, un bouton «Aide» est disponible dans toutes les interfaces, vous apportant des informations détaillées sur leur utilisation.</li>\r\n</ul>', '', 1, 0, 0, 2, '2012-01-04 16:48:38', 883, '', '2012-01-17 16:02:30', 42, 0, '0000-00-00 00:00:00', '2012-01-04 16:48:38', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":"","urlatext":"","targeta":"","urlb":"","urlbtext":"","targetb":"","urlc":"","urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 6, 0, 14, '', '', 3, 7, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(3, 38, 'PROJET HAITI 2012-2018', 'projet-haiti-2012-2018', '', '<p><span style="text-align: justify; line-height: 1.3em;">Ce site est un exemple d''affichage d''articles sous forme de Blog.</span><span style="line-height: 1.3em;">Si vous vous connectez sur le site (le lien «Connexion ''Auteur''» se trouve dans le «Menu bas») vous pourrez modifier cet article ainsi que tous</span><span style="text-align: justify; line-height: 1.3em;">les autres. Vous pourrez également créer un nouvel article.</span><span style="text-align: justify; line-height: 1.3em;">En ajoutant et en modifiant vos articles, vous verrez les changements effectués sur votre site et vous pourrez le personnaliser de différentes façons.</span><span style="text-align: justify; line-height: 1.3em;">Vous pouvez y aller sans crainte, vous nel </span><span style="line-height: 1.3em;">a suite de l''article blsssss</span></p>\r\n<p style="text-align: justify;"> </p>\r\n<p style="text-align: justify;"> </p>', '', 1, 0, 0, 2, '2012-01-04 16:55:36', 883, '', '2014-03-28 18:54:34', 883, 0, '0000-00-00 00:00:00', '2012-01-04 16:55:36', '0000-00-00 00:00:00', '{"image_intro":"images\\/Photos_articles\\/100_6582.JPG","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"none","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"1","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_vote":"0","show_hits":"0","show_noauth":"0","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"0","show_article_options":"0","show_urls_images_backend":"","show_urls_images_frontend":""}', 46, 0, 34, '', '', 1, 25, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(4, 39, 'LE DÉFI', 'le-defi', '', '<p style="text-align: justify;">La page d''accueil est paramétrée pour afficher les quatres articles les plus récents de la catégorie «Blog», sous forme de colonne. Il y a ensuite les liens vers les 4 articles précédents. Vous pouvez changer <span style="line-height: 1.3em;">ces </span><span style="line-height: 1.3em;">nombres en éditant les paramètres de contenu, onglet Blog/En vedette, dans l''administration du site. Vous trouverez un lien vers votre administration dans le menu haut.</span><span style="line-height: 1.3em;">Si vous souhaitez avoir vos articles de Blog divisés en deux parties, une introduction et ensuite une page enière, utilisez le bouton «Lire la suite» pour insérer une séparation (tel ci-dessous).</span></p>\r\n<p style="text-align: justify;">s<span style="line-height: 1.3em;">ur la page entière vous verrez l''introduction ainsi que le reste de l''article. Vous pouvez changer les réglages afin de cacher le texte d''introduction si vous le souhaitez.</span></p>', '', 1, 0, 0, 2, '2012-01-04 17:47:03', 883, '', '2014-03-28 19:17:35', 883, 0, '0000-00-00 00:00:00', '2012-01-04 17:47:03', '0000-00-00 00:00:00', '{"image_intro":"images\\/Photos_articles\\/40prod_c.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"1","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_vote":"0","show_hits":"0","show_noauth":"0","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"0","show_article_options":"0","show_urls_images_backend":"0","show_urls_images_frontend":""}', 21, 0, 33, '', '', 1, 23, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(5, 40, 'NOS ACTIVITÉS AU CANADA', 'nos-activites-au-canada', '', '<p style="text-align: justify;">Votre site possède quelques modules communs déjà pré-configurés. Cela inclut :</p>\r\n<p style="text-align: justify;"><span style="line-height: 1.3em;">Le «Module image» qui affiche l''image sous le menu. C''est un module de type «Contenu </span></p>\r\n<ul>\r\n<li>personnalisé» que vous pouvez modifier pour changer l''image.</li>\r\n<li>Le module «Liens de Blog» qui vous permet d''afficher des liens vers d''autres Blogs. Nous avons mis trois exemples, mais vous pouvez en ajouter ou en supprimer. Quand vous êtes connecté, cliquez sur «Gestion des liens» pour afficher la liste des liens et leur icône de modification.</li>\r\n</ul>\r\n<ul style="text-align: justify;">\r\n<li>Le module «Articles les plus lus» liste les articles, basé sur le nombre de fois qu''ils ont été affichés.</li>\r\n<li>Le module «Anciens articles» liste les articles par mois.</li>\r\n<li>Le module «Lien de flux RSS» permet à vos lecteurs de lire vos articles dans un lecteur de flux (Fil d''actualité).</li>\r\n</ul>\r\n<p style="text-align: justify;">Chacun de ces modules possède de nombreux paramètres que vous pouvez expérimenter dans la «Gestion des modules» à partir de l''administration. Joomla inclut également de nombreux autres modules que vous pouvez incorporer à votre site. En développant votre site, vous souhaiterez sans doute ajouter d''autres modules, vous pourrez en trouver sur le site officiel des extensions de Joomla (<a href="http://extensions.joomla.org">JED - Joomla Extensions Directory)</a> ou sur le site officiel des extensions en français pour Joomla (<a href="http://extensions.joomla.fr" target="_blank">extensions.joomla.fr</a>).</p>\r\n<p> </p>', '', 1, 0, 0, 2, '2012-01-05 09:30:17', 883, '', '2014-03-28 19:52:21', 883, 0, '0000-00-00 00:00:00', '2012-01-05 09:30:17', '0000-00-00 00:00:00', '{"image_intro":"images\\/Photos_articles\\/100_3739.JPG","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"1","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_vote":"0","show_hits":"0","show_noauth":"0","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 16, 0, 32, '', '', 1, 7, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(6, 43, 'Notre action', 'notre-action', '', '<p>Notre action</p>', '', 1, 0, 0, 2, '2014-01-30 19:57:27', 883, '', '2014-03-11 20:00:47', 883, 0, '0000-00-00 00:00:00', '2014-01-30 19:57:27', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 6, 0, 31, '', '', 1, 52, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(7, 44, 'parrainer une famille', 'parrainer-une-famille', '', '<p>vvv</p>', '', 1, 0, 0, 2, '2014-01-30 20:25:54', 883, '', '2014-03-11 20:02:14', 883, 0, '0000-00-00 00:00:00', '2014-01-30 20:25:54', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 30, '', '', 1, 20, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(8, 45, 'Faire un don', 'faire', '', '<p>Faire un don à asfcanada :</p>\r\n<p><a href="https://www.canadahelps.org/CharityProfilePage.aspx?Language=fr&amp;CharityID=d94303"><img src="http://www.canadahelps.org/image/DonateNowLink/fr/Donate1.png" border="0" alt="Faire un don maintenant par CanadaHelps.org!" /></a></p>', '', 1, 0, 0, 2, '2014-01-30 20:26:56', 883, '', '2014-03-11 19:55:49', 883, 883, '2014-03-29 18:24:41', '2014-01-30 20:26:56', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 6, 0, 29, '', '', 1, 16, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(9, 46, 'Impliquez-vous', 'impliquez-vous', '', '<p>dd</p>', '', -2, 0, 0, 2, '2014-01-30 20:41:47', 883, '', '2014-01-30 20:45:34', 883, 0, '0000-00-00 00:00:00', '2014-01-30 20:41:47', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(10, 47, 'Faire un don', 'faire-un-don', '', '<p>Faire un don:</p>\r\n<p><a href="https://www.canadahelps.org/CharityProfilePage.aspx?Language=fr&amp;CharityID=d94303"><img src="http://www.canadahelps.org/image/DonateNowLink/fr/Donate1.png" border="0" alt="Faire un don maintenant par CanadaHelps.org!" /></a>  </p>\r\n<p> </p>', '', -2, 0, 0, 2, '2014-01-30 20:42:57', 883, '', '2014-03-06 20:21:46', 883, 0, '0000-00-00 00:00:00', '2014-01-30 20:42:57', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(11, 48, 'Impliquez-vous', 'impliquez-vous', '', '<p>bbb</p>', '', -2, 0, 0, 9, '2014-01-30 20:48:59', 883, '', '2014-03-05 01:04:41', 883, 0, '0000-00-00 00:00:00', '2014-01-30 20:48:59', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_vote":"0","show_hits":"0","show_noauth":"0","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 15, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(12, 49, 'Mission, objectifs et valeurs', 'mission-d-asf-canada', '', '<p><strong>Mssion D''ASF canada</strong></p>\r\n<p><strong> </strong></p>\r\n<p><strong>bbaklala<br /></strong></p>', '', 1, 0, 0, 2, '2014-01-30 20:52:29', 883, '', '2014-03-11 19:52:42', 883, 883, '2014-05-08 19:51:34', '2014-01-30 20:52:29', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 0, 28, '', '', 1, 32, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(13, 51, 'Historique', 'historique', '', '<p>Historique</p>', '', 1, 0, 0, 2, '2014-03-04 05:53:54', 883, '', '2014-03-11 20:00:02', 883, 0, '0000-00-00 00:00:00', '2014-03-04 05:53:54', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_vote":"0","show_hits":"0","show_noauth":"0","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 0, 27, '', '', 1, 65, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(14, 52, 'Parrainer dès Maintenant', 'parrainer-des-maintenant', '', '<div class="pageParrDesMtn">\r\n<h2 style="text-align: center;"><span style="color: #ff9900; font-size: 34px; font-weight: bold;">Pourquoi parrainer?</span></h2>\r\n<p> </p>\r\n<p> </p>\r\n<div class="position-imageParrDesMtn">\r\n<p><img src="images/Photos_articles/asf-50.jpg" border="0" alt="pourquoi parrainer" width="560" height="500" style="float: left;" /></p>\r\n<div class="texte">\r\n<p><span style="font-size: small;">Le parrainage est un geste de générosité qui permet une ouverture sur le monde et sur d''autres cultures. Parrainer constitue un véritable enrichissement humain et personnel qui permet à des familles de grandir et à leur village d''avancer.</span></p>\r\n<p> </p>\r\n<p>Parrainer, c''est offrir un espoir, un avenir meilleur aux enfants, jeunes et femmes des pays en développement et à leurs familles! Vous participez à l’amélioration des conditions de vie du parrainé, de sa famille et de sa communauté. Au fil du temps, vous serez le témoin privilégié des progrès accomplis; votre travailleur devient l’ambassadeur de sa communauté.</p>\r\n</div>\r\n</div>\r\n<div class="position-texteParrDesMtn">\r\n<p class="rtejustify">Toute personne, quel que soit son âge. Cependant, dans le cas où la contribution de parrainage s''effectue par prélèvement automatique; la solution la plus pratique et économique pour ASF Canada est que l''autorisation de prélèvement soit signée par une personne majeure.</p>\r\n<p class="rtejustify"> </p>\r\n<p class="rtejustify">Chaque travailleur du pays en voie de développement que vous parrainez peut être parrainé par : une personne, une famille, un groupe de personnes, une classe ou un comité d''entreprise.</p>\r\n<p class="rtejustify"> </p>\r\n<p class="rtejustify">Le coût des services qu’ASF Canada soutient chez les parrainés, (la scolarité, l’alimentation, la pratique artistique, l’aide psychosociale, ou la formation professionnelle axée sur les compétences) varie considérablement. Chaque travailleur parrainé peut bénéficier d’une moyenne de 5 à 8 parrains ou marraines.</p>\r\n<p class="rtejustify"> </p>\r\n<p class="rtejustify"><span style="color: #ff9900; font-size: large;">Devenez membre du programme dès maintenant!</span></p>\r\n<p class="rtejustify"><span style="color: #ff9900; font-size: large;"> </span></p>\r\n<p class="rtejustify">Nous sommes très enthousiastes à l’idée de collaborer avec vous et vous remercions pour votre solidarité. En choisissant de parrainer un(e) citoyen(e) actif(ve) haïtien(ne) et sa famille, vous accompagnez <em>ASF Canada</em> dans son action pour que les besoins vitaux de chaque individu soient comblés. C’est en collaborant main dans la main que nous pouvons y parvenir!</p>\r\n<p class="rtejustify"> </p>\r\n<p class="rtejustify">Pour commencer, faites-nous parvenir votre fiche d''ouverture de dossier ci-jointe par la poste à l''adresse suivante. Nous vous demandons aussi de joindre à votre envoi le formulaire d''adhésion au parrainage direct si vous choisissez cette option.</p>\r\n<p class="rtejustify"> </p>\r\n<p class="rtejustify" style="text-align: justify;"><span style="color: #888888; font-size: large;"><em>372 rue St-Catherine Ouest, Bureau 327</em></span></p>\r\n<p class="rtejustify" style="text-align: justify;"><span style="color: #888888; font-size: large;"><em>Montréal, Qc, Canada</em></span></p>\r\n<p class="rtejustify" style="text-align: justify;"><span style="color: #888888; font-size: large;"><em>H3B 1A2</em></span></p>\r\n<p class="rtejustify" style="text-align: justify;"><span style="color: #888888; font-size: large;"><em> </em></span></p>\r\n<p class="rtejustify" style="text-align: justify; background-color: #6fcbf3; width: 185px; padding: 5px;"><span style="color: #ffffff; font-size: large;"><em>Dossier parrainnage</em></span></p>\r\n</div>\r\n</div>', '', 1, 0, 0, 2, '2014-03-04 06:19:52', 883, '', '2014-05-11 18:37:37', 883, 0, '0000-00-00 00:00:00', '2014-03-04 06:19:52', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 48, 0, 26, '', '', 1, 69, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(15, 53, 'Développement communautaire', 'developpement-communautaire', '', '<p>Développement communautaire</p>', '', 1, 0, 0, 2, '2014-03-04 06:31:59', 883, '', '2014-03-11 19:58:09', 883, 0, '0000-00-00 00:00:00', '2014-03-04 06:31:59', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_vote":"0","show_hits":"0","show_noauth":"0","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 25, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(16, 54, 'Publication', 'publication', '', '<p>Publication</p>', '', 1, 0, 0, 2, '2014-03-04 06:39:35', 883, '', '2014-03-11 20:03:16', 883, 0, '0000-00-00 00:00:00', '2014-03-04 06:39:35', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 24, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(17, 55, 'Notre_action_au_quebec', 'notre-action-au-quebec', '', '<p>Notre action au quebec</p>', '', 1, 0, 0, 2, '2014-03-05 00:08:46', 883, '', '2014-03-11 20:01:44', 883, 0, '0000-00-00 00:00:00', '2014-03-05 00:08:46', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 23, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(18, 56, 'Notre_action_au_canada', 'notre-action-au-canada', '', '<p>Notre action au canada</p>', '', 1, 0, 0, 2, '2014-03-05 00:09:40', 883, '', '2014-03-28 19:20:34', 883, 0, '0000-00-00 00:00:00', '2014-03-05 00:09:40', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 22, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(19, 57, 'Notre_action_a_l''internationnal', 'notre-action-a-l-internationnal', '', '<p>Notre action a l''internationnal</p>', '', 1, 0, 0, 2, '2014-03-05 00:10:44', 883, '', '2014-03-11 20:02:36', 883, 0, '0000-00-00 00:00:00', '2014-03-05 00:10:44', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 21, '', '', 1, 6, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(20, 58, 'Espace Parrainage', 'espace-parrainage', '', '<div class="pageEspParr">\r\n<h2 style="text-align: center;"><span style="font-size: 40px; color: #ff9900; font-weight: bold;">Espace parrainage</span></h2>\r\n<p><span style="font-size: x-large; color: #ff9900;"> </span></p>\r\n<p><span style="font-size: x-large; color: #ff9900;"> </span></p>\r\n<div class="position-imageEspParr">\r\n<p><img src="images/Photos_articles/asf-60.jpg" border="0" alt="espace parriner" width="500" height="300" style="float: left; margin-bottom: 5px;" /></p>\r\n<p><img src="images/Photos_articles/asf-87.jpg" border="0" alt="espace parrainer" width="500" height="300" style="float: left; margin-top: 5px;" /></p>\r\n</div>\r\n<div class="position-texteEspParr">\r\n<p><a href="#spucontentvisitezVosParraines"><span style="color: #ff9900; font-size: large;"><strong><span style="color: #ff9900;">Visitez vos parrainés</span></strong></span></a></p>\r\n{simplepopup link=”visitezVosParraines” popup="false"} Ok, so here goes the text I want to display... {/simplepopup}\r\n<p><span style="color: #ff9900; font-size: large;"><strong><span style="color: #ff9900;"> </span></strong></span></p>\r\n<p><strong>Rencontrez les personnes que vous parrainez dans un contexte de solidarité mondiale!</strong></p>\r\n<p> </p>\r\n<p><span style="color: #ff9900; font-size: large;"><strong><a href="http://www.asfcanada.org/fr/content/%C3%A9crivez-%C3%A0-vos-parrain%C3%A9s"><span style="color: #ff9900;">Écrivez à vos parrainés</span></a></strong></span></p>\r\n<p><span style="color: #ff9900; font-size: large;"><strong><span style="color: #ff9900;"> </span></strong></span></p>\r\n<p>Dans cette section, vous trouverez toutes les informations nécessaires à la correspondance entre vous et la famille du travailleur que vous parrainez (marche à suivre pour faire<span style="line-height: 1.3em;">parvenir la lettre, consignes d''écritures, exemple de lettre, etc.)</span></p>\r\n<p> </p>\r\n<p><span style="font-size: large; color: #ff9900;"><a href="http://www.asfcanada.org/fr/content/club-de-quartier"><span style="color: #ff9900;">Club de quartier</span></a></span></p>\r\n<p><span style="font-size: large; color: #ff9900;"><span style="color: #ff9900;"> </span></span></p>\r\n<p>Rencontrez des personnes qui comme vous participent au programme de parrainage!</p>\r\n<p> </p>\r\n<p><span style="color: #ff9900; font-size: large;"><a href="http://www.asfcanada.org/fr/content/dons-ponctuels"><span style="color: #ff9900;">Le don ponctuel</span></a></span></p>\r\n<p><span style="color: #ff9900; font-size: large;"><span style="color: #ff9900;"> </span></span></p>\r\n<p>Apportez davantage de soutien au parrainé et à sa famille durant le Temps des Fêtes et les Fêtes du Village!</p>\r\n<p> </p>\r\n<p> </p>\r\n</div>\r\n</div>', '', 1, 0, 0, 2, '2014-03-05 00:45:54', 883, '', '2014-05-16 20:40:38', 883, 883, '2014-05-16 20:40:38', '2014-03-05 00:45:54', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 48, 0, 20, '', '', 1, 74, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(21, 59, 'FAQ', 'familles-et-individus', '', '<div class="&quot;pageFAQ">\r\n<h2 style="text-align: center;"> <strong><span style="color: #ff9900; font-size: x-large;">Foire aux questions</span></strong></h2>\r\n<p><strong><span style="color: #ff9900; font-size: x-large;"> </span></strong></p>\r\n<p><strong><span style="color: #ff9900; font-size: x-large;"> </span></strong></p>\r\n<div class="imageFAQ">\r\n<div class="position-imageFAQ" style="margin-right: 5px;">\r\n<p><img src="images/Photos_articles/asf-52.jpg" border="0" alt="faq" width="400" height="250" /></p>\r\n</div>\r\n<div class="position-imageFAQ" style="margin-left: 5px;">\r\n<p><img src="images/Photos_articles/asf-36.jpg" border="0" alt="faq" width="400" height="250" /></p>\r\n<p> </p>\r\n<p> </p>\r\n</div>\r\n</div>\r\n<div class="texteFAQ">\r\n<p><span style="line-height: 1.3em;">{slider=</span><span style="color: #ff9900; font-size: large;"><strong style="font-family: Arial, Helvetica, sans-serif; font-size: 1em; line-height: 1.3em;">Qu''arrive-t-il si je suis dans l''impossibilité de faire mes paiements de parrainage?</strong></span><span style="line-height: 1.3em;">}</span></p>\r\n<p><span style="font-family: arial, helvetica, sans-serif;">Si vous étiez dans l''impossibilité de faire vos paiements, de façon temporaire ou permanente, veuillez communiquer avec <em>ASF Canada </em> dès que possible pour étudier les possibilités. Le parrainage est avant tout un engagement moral. Si vous rencontrez des difficultés, vous pouvez à tout moment interrompre votre parrainage sur simple lettre ou par email à donation@asfcanada.org.</span></p>\r\n<p><span style="line-height: 1.3em;">{/slider}</span></p>\r\n<p><span style="line-height: 1.3em;">{slider=</span><span style="color: #ff9900; font-size: large;"><strong style="font-family: Arial, Helvetica, sans-serif; font-size: 1em; line-height: 1.3em;">Ma contribution est-elle remise directement au travailleur?</strong></span><span style="line-height: 1.3em;">}</span></p>\r\n<p><span style="font-family: arial, helvetica, sans-serif; color: #000000;">Non. Les contributions du parrainage vont au-delà du travailleur; elles sont mises en commun pour un plus grand impact et servent à financer des projets qui améliorent la vie des enfants, de leurs familles et de la collectivité. Plus de 70 ans d''expérience des autres ONG nous ont appris qu’aider les familles et les communautés à devenir autonomes est le meilleur moyen pour donner aux familles de meilleures perspectives d’avenir.En combinant le parrainage de plusieurs parrains et marraines dans une région donnée, nous pouvons financer des programmes qui favorisent la viabilité de la communauté et qui donnent la chance aux enfants et leurs parents de mener une vie stable et productive.</span></p>\r\n<p><span style="line-height: 1.3em;"> {/slider} </span></p>\r\n<p><span style="line-height: 1.3em;">{slider=</span><span style="color: #ff9900; font-size: large;"><strong style="font-family: Arial, Helvetica, sans-serif; font-size: 1em; line-height: 1.3em;">Comment le parrainage est-il présenté au travailleur et à sa famille ?</strong></span>}</p>\r\n<p><span style="color: #000000; font-family: arial, helvetica, sans-serif;">Les délégués de nos partenaires locaux, proches du travailleur et de leurs familles, expliquent longuement la finalité du parrainage: il ne s''agit en aucun cas d''une démarche d''assistanat, mais d''une aide apportée à toute la communauté. La compréhension et l''accord des familles sont indispensables.</span></p>\r\n<p><span style="line-height: 1.3em;">{/slider}</span></p>\r\n<p><span>{slider=</span><span style="font-size: large;"><span style="color: #ff9900;"><strong style="font-family: Arial, Helvetica, sans-serif; font-size: 1em; line-height: 1.3em;">Quand et comment vais-je recevoir mon reçu de bienfaisance </strong></span><strong style="line-height: 1.3em;"><span style="color: #ff9900;">?</span> </strong></span><span style="line-height: 1.3em;">}</span></p>\r\n<p><span style="font-family: arial, helvetica, sans-serif; color: #000000;">Vos contributions sont déductibles d’impôt. Au début du mois de mars, nous vous adressons un reçu fiscal à joindre à votre déclaration de revenus, qui indique le montant total de vos versements pour l''année écoulée. Il vous est envoyé par courriel. Si vous n’avez pas de courriel, il vous sera envoyé par la poste. Vous n’avez pas obtenu votre reçu de bienfaisance ? Communiquez avec nous au <a href="mailto:donation@asfcanada.org"><span style="color: #000000;">donation@asfcanada.org</span></a> afin de mettre à jour vos coordonnées et nous vous le renverrons dans les 3 jours ouvrables.</span></p>\r\n<p><span>{/slider}</span></p>\r\n<p>{slider=<span style="color: #ff9900; font-size: large;"><strong style="font-family: Arial, Helvetica, sans-serif; font-size: 1em; line-height: 1.3em;">Comment puis-je mettre mes renseignements personnels à jours ?</strong></span><span style="line-height: 1.3em;">}</span></p>\r\n<p><span style="color: #000000; font-family: arial, helvetica, sans-serif;">Si vous avez besoin de notifier un changement d''adresse ou information bancaire appelez au 514-878-2586 et demander le département de la comptabilité.</span></p>\r\n<p>{/slider}</p>\r\n<p><span> </span></p>\r\n<p><span style="line-height: 1.3em;"> </span></p>\r\n</div>\r\n</div>', '', 1, 0, 0, 2, '2014-03-05 00:47:17', 883, '', '2014-05-10 18:47:41', 883, 0, '0000-00-00 00:00:00', '2014-03-05 00:47:17', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 36, 0, 19, '', '', 1, 65, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(22, 60, 'Entreprises', 'entreprises', '', '<p>Entreprises</p>', '', 1, 0, 0, 2, '2014-03-05 00:47:42', 883, '', '2014-03-11 19:59:15', 883, 0, '0000-00-00 00:00:00', '2014-03-05 00:47:42', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 18, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(23, 61, 'Carriéres', 'carrieres', '', '<p>Carriéres</p>', '', 1, 0, 0, 2, '2014-03-05 00:48:01', 883, '', '2014-03-11 19:58:54', 883, 0, '0000-00-00 00:00:00', '2014-03-05 00:48:01', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 16, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(24, 62, 'Développement social', 'developpement-social', '', '<p>Développement social</p>', '', 1, 0, 0, 2, '2014-03-05 01:12:49', 883, '', '2014-03-11 19:58:30', 883, 0, '0000-00-00 00:00:00', '2014-03-05 01:12:49', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 15, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(25, 63, 'Santé psychosociale', 'sante-psychosociale', '', '<p>Santé psychosociale</p>', '', 1, 0, 0, 2, '2014-03-05 01:14:05', 883, '', '2014-03-11 20:05:20', 883, 0, '0000-00-00 00:00:00', '2014-03-05 01:14:05', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 13, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `asf_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(26, 64, 'Santé psychosociale', 'sante', '', '<p>santé psychosociale</p>', '', -2, 0, 0, 2, '2014-03-05 01:25:10', 883, '', '2014-03-11 20:59:50', 883, 0, '0000-00-00 00:00:00', '2014-03-05 01:25:10', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(27, 65, 'Notre organisme', 'notre-organisme', '', '<p>Notre organisme...</p>', '', 1, 0, 0, 2, '2014-03-29 17:23:47', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:23:47', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 12, '', '', 1, 20, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(28, 66, 'Nos axes d’intervention', 'nos-axes-d-intervention', '', '<p>Nos axes d’intervention...</p>', '', 1, 0, 0, 2, '2014-03-29 17:24:06', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:24:06', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 11, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(29, 67, 'Missions, objectifs et valeurs', 'missions-objectifs-et-valeurs', '', '<div class="page">\r\n<div class="position-image">\r\n<p><img src="images/Photos_articles/asf-79.jpg" border="0" alt="mission et valeur" width="400" height="300" style="float: left;" /><img src="images/Photos_articles/asf-97.jpg" border="0" alt="misson valeur" width="400" height="300" style="float: left;" /></p>\r\n</div>\r\n<div class="position-texte">\r\n<div class="position">\r\n<h2><span style="font-size: large; color: #ff9900;">Mission d’ASF Canada</span></h2>\r\n<p><span style="font-size: large; color: #ff9900;"> </span></p>\r\n<p class="rtejustify"><span style="font-family: arial, helvetica, sans-serif; color: #000000;">Lutter contre la violence et le non-respect des droits humains en favorisant l’autonomisation des femmes et des jeunes avec l’aide de la pratique artistique. </span></p>\r\n<p class="rtejustify"> </p>\r\n<p><span style="color: #ff9900; font-size: large;">Objectifs </span></p>\r\n<p><span style="color: #99ccff; font-size: medium;"><strong>Éveiller, autonomiser, rayonner</strong></span></p>\r\n<p><span style="color: #99ccff; font-size: medium;"><strong> </strong></span></p>\r\n<ol>\r\n<li class="rtejustify"><span style="color: #000000; font-family: arial, helvetica, sans-serif;" dir="ltr">Développer des partenariats et collaborer à la mise en place de programmes de services sociaux structurant, en collaboration avec les organismes communautaires de base et les ONG natives dans l’objectif d’un développement communautaire durable.</span></li>\r\n<li class="rtejustify"><span style="color: #000000; font-family: arial, helvetica, sans-serif;" dir="ltr"> </span></li>\r\n<li><span style="color: #000000; font-family: arial, helvetica, sans-serif;" dir="ltr">Éveiller les jeunes et les femmes à la liberté d''expression et au respect de leurs droits. </span></li>\r\n<li><span style="color: #000000; font-family: arial, helvetica, sans-serif;" dir="ltr"> </span></li>\r\n<li class="rtejustify"><span style="color: #000000; font-family: arial, helvetica, sans-serif;" dir="ltr">Autonomiser et habiliter les jeunes et les femmes à agir pour leurs besoins, leur mieux-être et leur engagement citoyen en offrant des programmes de service social auprès de populations éprises par la pauvreté, l’oppression, les catastrophes naturelles, conflits armés au Canada et à l’étranger.</span></li>\r\n</ol></div>\r\n<div class="position" style="margin-left: 20px; margin-top: 37px;">\r\n<ul>\r\n<li class="rtejustify"><span style="color: #000000; font-family: arial, helvetica, sans-serif;" dir="ltr">Encourager le rayonnement de l’expression artistique pour le mieux-être et le changement social.</span></li>\r\n<li class="rtejustify"><span style="color: #000000; font-family: arial, helvetica, sans-serif;" dir="ltr"> </span></li>\r\n<li class="rtejustify"><span style="color: #000000; font-family: arial, helvetica, sans-serif;" dir="ltr">Promouvoir la pratique artistique comme outil de changement social : renforcement des droits humains, la justice sociale, l’égalité, l’engagement citoyen, l’éducation, la prévention, la psychoéducation ou l’intégration sociale.</span></li>\r\n<li class="rtejustify"><span style="color: #000000; font-family: arial, helvetica, sans-serif;" dir="ltr"> </span></li>\r\n<li class="rtejustify"><span style="color: #000000; font-family: arial, helvetica, sans-serif;" dir="ltr">Théoriser et développer de l’expertise sur les services sociaux avec l’aide de l’art.</span></li>\r\n<li class="rtejustify"><span style="color: #000000; font-family: arial, helvetica, sans-serif;" dir="ltr"> </span></li>\r\n<li class="rtejustify"><span style="color: #000000; font-family: arial, helvetica, sans-serif;">Mobiliser, ressourcer, réseauter et offrir des formations professionnelles aux intervenants pour œuvrer pour le changement social.</span></li>\r\n<li class="rtejustify"></li>\r\n</ul>\r\n<h2><span style="color: #ff9900; font-size: large;"> </span></h2>\r\n<h2><span style="color: #ff9900; font-size: large;">Nos valeurs</span></h2>\r\n<p><span style="color: #ff9900; font-size: large;"> </span></p>\r\n<p class="rtejustify"><span style="color: #000000; font-family: arial, helvetica, sans-serif;">Nos valeurs sont l’égalité, le pouvoir d’agir, la non-violence, l’expressivité, la solidarité, le partage et la créativité.</span></p>\r\n<p class="rtejustify"><span style="text-decoration: underline;"><span><a href="http://www.asfcanada.org/sites/default/files/Depliant_ASF.pdf">Dépliant ASF Canada</a></span></span></p>\r\n<p><span style="text-decoration: underline;"> </span></p>\r\n</div>\r\n</div>\r\n</div>', '', 1, 0, 0, 2, '2014-03-29 17:24:19', 883, '', '2014-05-08 20:35:31', 883, 0, '0000-00-00 00:00:00', '2014-03-29 17:24:19', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 18, 0, 10, '', '', 1, 29, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(30, 68, 'Fonctionnement du Parrainage', 'fonctionnement-du-parrainage', '', '<div class="pageParrFamille">\r\n<h2 style="text-align: center;"><strong><span style="color: #ff9900; font-size: 40px;">Parrainer une famille</span></strong></h2>\r\n<p><strong><span style="color: #ff9900; font-size: 40px;"> </span></strong></p>\r\n<div class="position-imageParrFamille">\r\n<p><img src="images/Photos_articles/asf-4.jpg" border="0" alt="parrainer une famille" width="500" height="200" /><img src="images/Photos_articles/children-205219.jpg" border="0" alt="parrainer une famille" width="500" height="200" /></p>\r\n<p> </p>\r\n<p> </p>\r\n</div>\r\n<div class="position-texteG">\r\n<p><span style="color: #ff9900; font-size: large;">Fonctionnement du parrainage</span></p>\r\n<p><span style="color: #ff9900; font-size: large;"> </span></p>\r\n<p><span>Pour un don mensuel supérieur à <span style="color: #99ccff; font-size: medium;">35$ </span>, le parrain peut adhérer au </span><strong>parrainage direct</strong><span>. Celui-ci vous permet d’établir une relation privilégiée avec le travailleur parrainé et sa famille. Le parrainage direct se matérialise par un échange de courriers, de dessins ou de photos à Noël. S''il y a lieu, les enfants de la famille du travailleur haïtien que vous parrainez pourraient vouloir entrer en contact avec vos enfants. En parrainant le travailleur, vous parrainez en réalité sa famille et sa communauté: le conjoint, ses enfants et les grands parents et tous ceux qu’il ou elle soutient à travers des initiatives pour le développement durable.</span></p>\r\n<p><span> </span></p>\r\n<p class="rtejustify"><span style="color: #ff9900; font-size: large;">Parrainer un travailleur (travailleuse) plutôt qu''un enfant</span></p>\r\n<p class="rtejustify"><span style="color: #ff9900; font-size: large;"> </span></p>\r\n<p class="rtejustify">Nous avons choisi de venir en aide aux travailleurs plutôt qu''aux enfants pour les raisons suivantes:</p>\r\n<p class="rtejustify"> </p>\r\n<ul>\r\n<li class="rtejustify">Le parrainage d’enfants cause des sentiments d’injustice. Dans un village, une famille bénéficiant du parrainage vit à côté d’une famille qui n’en bénéficie pas. Ceci entraîne des disparités et affaiblit le sentiment de solidarité dans la communauté. Cela peut créer un manque chez les non-bénéficiaires et des conflits persistants.</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li class="rtejustify">En  parrainant un travailleur, vous parrainez toute la communauté, incluant les enfants. Nous avons accompagné les <em>leaders</em> locaux à des activités de développement communautaire durable afin qu’ils définissent et mettent en place des services essentiels pour la communauté : éducation, nutrition, activités génératrices de revenus. Ainsi, ces travailleurs posent des gestes concrets pour éradiquer la pauvreté.</li>\r\n</ul>\r\n</div>\r\n<div class="position-texteD">\r\n<p class="rtejustify"><span style="color: #ff9900; font-size: large;">Vous avez l''opportunité de parrainer 7 types de travailleurs:</span></p>\r\n<p class="rtejustify"><span style="color: #ff9900; font-size: large;"> </span></p>\r\n<ul style="list-style-type: disc; margin-left: 20px;">\r\n<ul style="list-style-type: disc;">\r\n<li><span style="line-height: 1.3em;">  Le leader en développement communautaire</span></li>\r\n<li><span style="line-height: 1.3em;">  Le professeur d’école</span></li>\r\n<li><span style="line-height: 1.3em;">  Le cuisinier à l’école communautaire</span></li>\r\n<li><span style="line-height: 1.3em;">  L''artiste activiste performeur pour le respect des droits humains</span></li>\r\n<li><span style="line-height: 1.3em;">  L''enseignant artistique</span></li>\r\n<li><span style="line-height: 1.3em;">  L''intervenant psychosocial de première ligne</span></li>\r\n<li><span style="line-height: 1.3em;">  Le travailleur social</span></li>\r\n</ul>\r\n</ul>\r\n<p><span style="line-height: 1.3em;"><span style="line-height: 1.3em;"><span style="line-height: 1.3em;"> </span></span></span></p>\r\n<p class="rtejustify"><span style="color: #ff9900; font-size: large;">Comment l''argent est-il remis au travailleur que je parraine?</span></p>\r\n<p class="rtejustify"><span style="color: #ff9900; font-size: large;"> </span></p>\r\n<p class="rtejustify">ASF Canada est fier de présenter à tous ses donateurs une politique de <strong>transparence totale.</strong> Chaque mois, nous versons les cotisations aux associations et institutions locales du pays en voie de développement.  Nos partenaires doivent utiliser ces fonds selon une entente de développement communautaire durable pour des activités qu’ils ont eux-mêmes créées avec les activistes d’ASF Canada. Le travailleur natif est rémunéré pour le travail qu’il accomplit, par l’institution scolaire ou par l’association qui gère les services psychosociaux ou agricoles.</p>\r\n<p class="rtejustify"> <span style="line-height: 1.3em;"> </span></p>\r\n<p class="rtejustify"><span style="color: #99ccff; font-size: medium;">80%  </span>de votre don est utilisé sur le terrain en Haïti</p>\r\n<p class="rtejustify"><span style="color: #99ccff; font-size: medium;">11%</span>  sert aux frais d''administration</p>\r\n<p class="rtejustify"> <span style="color: #99ccff; font-size: medium;">9%</span>  finance les levées de fonds.</p>\r\n<p class="rtejustify"> </p>\r\n<p class="rtejustify"><span style="color: #ff9900; font-size: large;">Durée du parrainage</span></p>\r\n<p class="rtejustify"><span style="color: #ff9900; font-size: large;"> </span></p>\r\n<p class="rtejustify">Le parrainage du travailleur du pays en voie de développement perdure jusqu’à ce qu’il n’occupe plus le poste au sein de l’association ou de l’institution partenaire avec ASF Canada. Dans ce cas, votre parrainage prend fin en même temps que votre relation avec le travailleur. ASF Canada communique avec vous et vous propose alors de poursuivre votre soutien avec un autre travailleur qui prendra le relais pour le même poste.</p>\r\n<p class="rtejustify"> </p>\r\n<p class="rtejustify">Si votre situation financière change, il vous est possible de modifier le montant de votre don, ou de l’annuler.</p>\r\n<p><span> </span></p>\r\n</div>\r\n</div>', '', 1, 0, 0, 2, '2014-03-29 17:24:42', 883, '', '2014-05-12 17:21:21', 883, 883, '2014-05-12 17:21:21', '2014-03-29 17:24:42', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 32, 0, 9, '', '', 1, 53, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(31, 69, 'Notre équipe', 'notre-equipe', '', '<p>Notre équipe...</p>', '', 1, 0, 0, 2, '2014-03-29 17:25:00', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:25:00', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 8, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(32, 70, 'Actualités ', 'actualites', '', '<p><span style="text-decoration: underline;">Actualités</span>...</p>', '', 1, 0, 0, 2, '2014-03-29 17:25:54', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:25:54', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 7, '', '', 1, 13, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(33, 71, 'Nouvelles', 'nouvelles', '', '<p>Nouvelles</p>', '', -2, 0, 0, 2, '2014-03-29 17:26:06', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:26:06', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 15, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(34, 72, 'Agenda des évènements', 'agenda-des-evenements', '', '<p>Agenda des évènements...</p>', '', -2, 0, 0, 2, '2014-03-29 17:26:19', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:26:19', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 14, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(35, 73, 'Le Blog de l’équipe', 'le-blog-de-l-equipe', '', '<p>Le Blog de l’équipe...</p>', '', -2, 0, 0, 2, '2014-03-29 17:26:38', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:26:38', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 13, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(36, 74, 'S’inscrire à la Newsletter', 's-inscrire-a-la-newsletter', '', '<p>S’inscrire à la Newsletter...</p>', '', -2, 0, 0, 2, '2014-03-29 17:26:56', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:26:56', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 12, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(37, 75, 'Agir ensemble', 'agir-ensemble', '', '<p><span style="text-decoration: underline;">Agir ensemble</span>...</p>', '', 1, 0, 0, 2, '2014-03-29 17:27:09', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:27:09', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 6, '', '', 1, 6, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(38, 76, 'Donner', 'donner', '', '<p>Donner...</p>', '', 1, 0, 0, 2, '2014-03-29 17:27:21', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:27:21', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 5, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(39, 77, 'Faire un Don', 'faire-don', '', '<p>Faire un Don..</p>', '', -2, 0, 0, 2, '2014-03-29 17:27:49', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:27:49', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 9, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(40, 78, 'Demander une brochure', 'demander-une-brochure', '', '<p>Demander une brochure...</p>', '', -2, 0, 0, 2, '2014-03-29 17:28:07', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:28:07', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 8, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(41, 79, 'Offrir un cadeau solidaire ', 'offrir-un-cadeau-solidaire', '', '<p>Offrir un cadeau solidaire...</p>', '', -2, 0, 0, 2, '2014-03-29 17:28:18', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:28:18', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 7, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(42, 80, '(crayons/stylos, matériel pédagogique, etc. pour nos missions)', 'cadeau-materiel', '', '<p>(crayons/stylos, matériel pédagogique, etc. pour nos missions)....</p>', '', -2, 0, 0, 2, '2014-03-29 17:28:53', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:28:53', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 6, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(43, 81, 'Offrir du matériel informatique (fournitures de bureau etc. pour l’ASF)', 'materiel-informatique', '', '<p>Offrir du matériel informatique (fournitures de bureau etc. pour l’ASF)</p>', '', -2, 0, 0, 2, '2014-03-29 17:29:12', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:29:12', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 5, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(44, 82, 'Nos partenaires', 'nos-partenaires', '', '<p>Nos partenaires...</p>', '', 1, 0, 0, 2, '2014-03-29 17:29:29', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:29:29', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 4, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(45, 83, 'Bénévolat', 'benevolat', '', '<p>Le bénévolat humanitaire (devenir intervenant)...</p>', '', 1, 0, 0, 2, '2014-03-29 17:29:48', 883, '', '2014-05-08 01:09:11', 883, 0, '0000-00-00 00:00:00', '2014-03-29 17:29:48', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 3, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(46, 84, 'Offres de stages', 'offres-de-stages', '', '<p>Offres de stages/bénévolat...</p>', '', 1, 0, 0, 2, '2014-03-29 17:30:03', 883, '', '2014-05-08 01:09:30', 883, 0, '0000-00-00 00:00:00', '2014-03-29 17:30:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 2, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(47, 85, 'Contact ', 'contact', '', '<p><span style="text-decoration: underline;">Contact</span>...</p>', '', -2, 0, 0, 2, '2014-03-29 17:30:18', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:30:18', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 1, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(48, 86, 'Infos (infos, google maps, réseaux sociaux, etc.)', 'infos', '', '<p>Infos (infos, google maps, réseaux sociaux, etc.)...</p>', '', -2, 0, 0, 2, '2014-03-29 17:30:36', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-03-29 17:30:36', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(49, 88, 'Galeries', 'galeries', '', '<p>ascas</p>', '', 1, 0, 0, 2, '2014-05-08 01:20:54', 883, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-05-08 01:20:54', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 1, '', '', 1, 28, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(50, 89, 'visitez vos parrainés', 'visitez-vos-parrines', '', '<p class="rtejustify"><strong>Marche à suivre</strong></p>\r\n<p class="rtejustify">Chaque année, 3 ou 4 familles partent ensemble visiter les familles haïtiennes qu’ils parrainent. Un mode tourisme novateur qui soutient l’économie locale!</p>\r\n<p class="rtejustify">Cela vous permet d''apprécier par vous-même les avantages que procurent vos contributions. Vous devez communiquer avec <em>ASF Canada</em> au moins trois mois avant la date prévue de votre départ, avant de faire vos préparatifs de voyage. Pour organiser votre visite, veuillez communiquer avec le chargé des voyages d’<em>ASF Canada</em>au 514-878-2586 ou a <a href="mailto:voyagesolidaire@asfcanada.org">voyagesolidaire@asfcanada.org</a>. Pour plus de détails, visitez notre site web, dans la section sensibilisation/voyage de solidarité. Informez-vous: <a href="mailto:ong@asfcanada.org">ong@asfcanada.org</a></p>\r\n<p class="rtejustify"><strong>Informez-vous!</strong></p>\r\n<p class="rtejustify">Pour plus d''informations, consultez<a href="http://www.asfcanada.org/sites/default/files/2.FR_trousseINFO_PHOTO2_voyageSolidaire_FR_MGSA79_g_0.pdf"> la trousse de départ ci-jointe. </a></p>\r\n<p class="rtejustify"><strong>Vous souhaitez partir en mission avec nous?</strong> Nous recherchons toujours des intervenants qui poursuivent une carrière d’enseignant, de travailleur social ou communautaire, d’artiste activiste ou encore d’organisateur en développement communautaire, etc. pour mener à bout notre projet en Haïti. Joignez-vous à notre équipe! </p>\r\n<p class="rtejustify"><strong>Informez-vous : ong@asfcanada.org</strong></p>', '', 1, 0, 0, 2, '2014-05-16 18:56:08', 883, '', '2014-05-16 18:57:44', 883, 0, '0000-00-00 00:00:00', '2014-05-16 18:56:08', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Structure de la table `asf_content_frontpage`
--

DROP TABLE IF EXISTS `asf_content_frontpage`;
CREATE TABLE IF NOT EXISTS `asf_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `asf_content_frontpage`
--

INSERT INTO `asf_content_frontpage` (`content_id`, `ordering`) VALUES
(1, 2),
(3, 3),
(4, 4),
(5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `asf_content_rating`
--

DROP TABLE IF EXISTS `asf_content_rating`;
CREATE TABLE IF NOT EXISTS `asf_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_core_log_searches`
--

DROP TABLE IF EXISTS `asf_core_log_searches`;
CREATE TABLE IF NOT EXISTS `asf_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_extensions`
--

DROP TABLE IF EXISTS `asf_extensions`;
CREATE TABLE IF NOT EXISTS `asf_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=816 ;

--
-- Contenu de la table `asf_extensions`
--

INSERT INTO `asf_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{"cachetimeout":"6"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"fr-FR","site":"fr-FR"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"0","show_readmore_title":"0","readmore_limit":"100","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"1","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_heading_title_text":"0","show_category_title":"0","show_description":"0","show_description_image":"1","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"0","show_cat_num_articles_cat":"0","num_leading_articles":"1","num_intro_articles":"4","num_columns":"3","num_links":"4","multi_column_order":"1","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","guest_usergroup":"1","sendpassword":"1","useractivation":"2","mail_to_admin":"1","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"legacy":false,"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_FINDER_XML_DESCRIPTION","group":""}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"legacy":false,"name":"PHPMailer","type":"library","creationDate":"2001","author":"PHPMailer","copyright":"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.","authorEmail":"jimjag@gmail.com","authorUrl":"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/","version":"5.2","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"legacy":false,"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"legacy":false,"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"11.4","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'Pied de page', 'module', 'mod_footer', '', 0, 1, 1, 1, '{"legacy":false,"name":"Pied de page","type":"module","creationDate":"Unknown","author":"Moussa Thimbo","copyright":"","authorEmail":"","authorUrl":"","version":"1.0.0","description":"Module footer pour ASF CANADA.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"legacy":false,"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FINDER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"legacy":false,"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_geshi","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"","authorUrl":"qbnz.com\\/highlighter","version":"2.5.0","description":"PLG_CONTENT_GESHI_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"2.5.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2013","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.5.4.1","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"2","skin":"0","entity_encoding":"raw","lang_mode":"0","lang_code":"fr","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%d-%m-%Y","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0);
INSERT INTO `asf_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"legacy":false,"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"legacy":false,"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"legacy":false,"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"legacy":false,"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_weblinks","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_WEBLINKS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(500, 'atomic', 'template', 'atomic', '', 0, 1, 1, 0, '{"legacy":false,"name":"atomic","type":"template","creationDate":"10\\/10\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"2.5.0","description":"TPL_ATOMIC_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(502, 'bluestork', 'template', 'bluestork', '', 1, 1, 1, 0, '{"legacy":false,"name":"bluestork","type":"template","creationDate":"07\\/02\\/09","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}', '{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez_20', 'template', 'beez_20', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez_20","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ2_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"legacy":false,"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"2.5.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(505, 'beez5', 'template', 'beez5', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez5","type":"template","creationDate":"21 May 2010","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ5_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","html5":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.10","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.10","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(602, 'French Language Pack', 'package', 'pkg_fr-FR', '', 0, 1, 1, 1, '{"legacy":false,"name":"French Language Pack","type":"package","creationDate":"December 2013","author":"French translation team : joomla.fr","copyright":"Copyright (C) 2005 - 2013 joomla.fr et Open Source Matters. Tous droits r\\u00e9serv\\u00e9s","authorEmail":"traduction@joomla.fr","authorUrl":"www.joomla.fr","version":"2.5.17.1","description":"\\n\\t\\t\\n\\t\\t<h3>Joomla! Full French (fr-FR) Language Package version 2.5.17v1<\\/h3>\\n\\t\\t<h3>Paquet de langue fran\\u00e7ais complet Joomla! fr-FR version 2.5.17v1<\\/h3>\\n\\t\\t<div>Installation incluse du pack de langue fr-FR de TinyMCE 3.5.4 pour Joomla 2.5.17<\\/div><br>\\n\\t\\t<div style=\\"font-weight: normal; padding-bottom:15px;\\">N''oubliez pas de s\\u00e9lectionner la langue FR dans les <a href=\\"index.php?option=com_plugins&amp;view=plugins&amp;filter_search=TinyMCE\\"><strong>param\\u00e8tres du plug-in ''\\u00c9diteur - TinyMCE''<\\/strong><\\/a> (param\\u00e8tre  ''Langue de l''\\u00e9diteur'' = fr).<br>\\n \\t\\tSi vous utilisez la <strong>d\\u00e9tection automatique<\\/strong>, veillez \\u00e0 ce que soient install\\u00e9s les diff\\u00e9rents packs de langue de TinyMCE correspondants aux packs de langue install\\u00e9s pour Joomla!<\\/div>\\n\\t\\t\\n\\t","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(603, 'French (fr-FR)', 'language', 'fr-FR', '', 1, 1, 0, 1, '{"legacy":false,"name":"French (fr-FR)","type":"language","creationDate":"December 2013","author":"French translation team : joomla.fr","copyright":"Copyright (C) 2005 - 2013 Open Source Matters & Joomla.fr. All rights reserved.","authorEmail":"traduction@joomla.fr","authorUrl":"www.joomla.fr","version":"2.5.17.1","description":"French administrator language for Joomla 3.0","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(604, 'French (fr-FR)', 'language', 'fr-FR', '', 0, 1, 0, 1, '{"legacy":false,"name":"French (fr-FR)","type":"language","creationDate":"December 2013","author":"French translation team : joomla.fr","copyright":"Copyright (C) 2005 - 2013 Open Source Matters & joomla.fr. All rights reserved.","authorEmail":"traduction@joomla.fr","authorUrl":"www.joomla.fr","version":"2.5.17.1","description":"French site language for Joomla 3.0","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(605, 'TinyMCE langue FR', 'file', 'TinyMCE_fr-FR', '', 0, 1, 0, 1, 'false', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"files_joomla","type":"file","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.17","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(800, 'PKG_JOOMLA', 'package', 'pkg_joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"PKG_JOOMLA","type":"package","creationDate":"2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"2.5.0","description":"PKG_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(801, 'plg_system_jsntplframework', 'plugin', 'jsntplframework', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_jsntplframework","type":"plugin","creationDate":"01\\/14\\/2014","author":"JoomlaShine.com","copyright":"Copyright (C) 2012 JoomlaShine.com. All Rights Reserved.","authorEmail":"admin@joomlashine.com","authorUrl":"www.joomlashine.com","version":"2.1.4","description":"","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 9999, 0),
(803, 'tk_gen_free_ii', 'template', 'tk_gen_free_ii', '', 0, 1, 1, 0, '{"legacy":false,"name":"tk_gen_free_ii","type":"template","creationDate":"August 2012","author":"ThemeKat","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@themekat.com","authorUrl":"http:\\/\\/themekat.com","version":"2.0.0","description":"TK Gen Free II is a Joomla 2.5 template designed by ThemeKat (themekat.com) and powered by the Warp Theme Framework (yootheme.com)","group":""}', '{"config":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(805, 'jaxstorm-blue', 'template', 'jaxstorm-blue', '', 0, 1, 1, 0, '{"legacy":false,"name":"jaxstorm-blue","type":"template","creationDate":"2013-06-25","author":"Hurricane Media","copyright":"HurricaneMedia 2011-2013","authorEmail":"info@hurricanemedia.net","authorUrl":"http:\\/\\/www.hurricanemedia.net","version":"1.8","description":"\\n\\t\\t<div style=\\"text-align:left\\"><span style=\\"font-weight:bold;font-size:1.1em;color:#000\\">--- JaxStorm-Blue HM03J ---<br \\/><hr style=\\"border:0;color:rgb(226,226,226);background-color:rgb(226,226,226);height:1px\\" \\/>Template for Joomla designed by Hurricane Media<br \\/><span style=\\"color: #e70000\\">Get the lastest version of this template, visit <a href=\\"http:\\/\\/www.hurricanemedia.net\\" target=\\"_blank\\">www.hurricanemedia.net<\\/a><\\/span>.<br \\/><br \\/>Position Layout:<br \\/><\\/span>\\n\\t\\t<br \\/>\\n\\t\\t<div style=\\"border: 1px solid #c3c3c3;width:340px;overflow:auto;font-weight:normal;font-size:11px;background-color:#f8f8f8\\">\\n\\n\\t\\t\\t<div style=\\"float:right;width:200px;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6;text-align:right\\">position-13 (top navigation)<\\/div>\\t\\n\\t\\t\\t<div style=\\"float:right;clear:both;width:240px;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6\\">position-1 (topmenu)<\\/div>\\n\\t\\t\\t<div style=\\"clear:both;width:328px;height:60px;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6\\">position-15 (slideshow)<\\/div>\\n\\t\\t\\t<div style=\\"clear:both;width:328px;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6\\">position-2 (breadcrumbs)<\\/div>\\n\\n\\t\\t\\t<div style=\\"float:left;width:70px;margin:0;padding:0\\">\\n\\n\\t\\t\\t\\t<div style=\\"float:left;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6;width:60px;height:30px\\">position-7<\\/div>\\n\\t\\t\\t\\t<div style=\\"float:left;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6;width:60px;height:30px\\">position-4<\\/div>\\n\\t\\t\\t\\t<div style=\\"float:left;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6;width:60px;height:30px\\">position-5<\\/div>\\n\\n\\t\\t\\t<\\/div>\\n\\n\\t\\t\\t<div style=\\"float:left;width:198px;margin:0;padding:0\\">\\n\\t\\t\\t\\t<div style=\\"float:left;width:198px;margin:0;padding:0\\">\\n\\t\\t\\t\\t\\t<div style=\\"border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6;width:188px;height:16px\\">position-12<\\/div>\\n\\t\\t\\t\\t<\\/div>\\n\\t\\t\\t\\t<div style=\\"float:left;width:198px;margin:0;padding:0\\">\\n\\t\\t\\t\\t\\t<div style=\\"border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6;width:188px;height:160px\\">content (message\\/component)<\\/div>\\n\\t\\t\\t\\t<\\/div>\\n\\t\\t\\t<\\/div>\\n\\n\\t\\t\\t<div style=\\"float:right;width:70px;margin:0;padding:0\\">\\n\\n\\t\\t\\t\\t<div style=\\"float:right;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6;width:60px;height:30px\\">position-6<\\/div>\\n\\t\\t\\t\\t<div style=\\"float:right;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6;width:60px;height:30px\\">position-8<\\/div>\\n\\t\\t\\t\\t<div style=\\"float:right;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6;width:60px;height:30px\\">position-3<\\/div>\\n\\n\\t\\t\\t<\\/div>\\n\\n\\t\\t\\t<div style=\\"clear:both;width:328px;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6\\">position-14 (footer)<\\/div>\\n\\t\\t\\t\\n\\t\\t\\t<div style=\\"float:left;;width:101px;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6\\">position-9 (box 1)<\\/div>\\n\\t\\t\\t<div style=\\"float:left;;width:101px;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6\\">position-10 (box 2)<\\/div>\\n\\t\\t\\t<div style=\\"float:left;;width:101px;border: 1px solid #c3c3c3;margin:2px;padding:3px;background-color:#e6e6e6\\">position-11 (box 3)<\\/div>\\n\\n\\t\\t\\t<\\/div>\\n\\t\\t<\\/div>\\n\\t","group":""}', '{"logoimage":"1","logo":"","sitetitle":"JaxStormBlue","sitedescription":"Designed by Hurricane Media","slides":"1","slideseffect":"0","slidesimage1":"","slideslink1":"","slidesimage2":"","slideslink2":"","slidesimage3":"","slideslink3":"","slidesimage4":"","slideslink4":"","slidesimage5":"","slideslink5":"","slidesimage6":"","slideslink6":"","socialposition":"1","socialicon1":"1","sociallink1":"http:\\/\\/www.facebook.com\\/","socialicon2":"11","sociallink2":"http:\\/\\/twitter.com\\/","socialicon3":"3","sociallink3":"http:\\/\\/plus.google.com","socialicon4":"0","sociallink4":"","socialicon5":"0","sociallink5":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(808, 'asfc_template', 'template', 'asfc_template', '', 0, 1, 1, 0, '{"legacy":false,"name":"asfc_template","type":"template","creationDate":"Fevrier 2014","author":"Moussa","copyright":"Copyright (C) asfcanada","authorEmail":"","authorUrl":"","version":"1.0","description":"Template pour le site de asfcanada","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(809, 'JM Slideshow Responsive', 'module', 'mod_jmslideshow', '', 0, 1, 0, 0, '{"legacy":false,"name":"JM Slideshow Responsive","type":"module","creationDate":"Sep 2013","author":"JoomlaMan.com","copyright":"\\u00a9 2012-2014 JoomlaMan.com","authorEmail":"info@joomlaman.com","authorUrl":"www.joomlaman.com","version":"2.0.1","description":"\\n        \\n    ","group":""}', '{"jmslideshow_responsive":"1","jmslideshow_width":"700","jmslideshow_image_width":"700","jmslideshow_image_height":"400","jmslideshow_image_style":"1","class_sfx":"","slider_source":"0","jmslideshow_k2_categories":"","jmslideshow_hikashop_categories":"","jmslideshow_image_source":"0","jmslideshow_article_image_source":"3","jmslideshow_ordering":"0","jmslideshow_orderby":"0","jmslideshow_count":"5","jmslideshow_layout":"default","jmslideshow_effect":"fade","jmslideshow_speed":"500","jmslideshow_auto":"1","jmslideshow_timeout":"5000","jmslideshow_caption_position":"topleft","jmslideshow_caption_left":"30","jmslideshow_caption_top":"30","jmslideshow_caption_right":"30","jmslideshow_caption_bottom":"30","jmslideshow_caption_width":"500","jmslideshow_desc_length":"150","jmslideshow_desc_html":"","jmslideshow_readmore_text":"Read more","jmslideshow_show_nav_buttons":"1","jmslideshow_show_pager":"1","jmslideshow_pager_type":"1","jmslideshow_pager_position":"bottomleft","jmslideshow_image_thumbnail_width":"100","jmslideshow_image_thumbnail_height":"65","jmslideshow_pager_left":"30","jmslideshow_pager_top":"30","jmslideshow_pager_right":"30","jmslideshow_pager_bottom":"30","jmslideshow_include_jquery":"2","jmslideshow_about":"MOD_JMSLIDESHOW_ABOUT_TAB_DESC","jmslideshow_update":"UPDATE will be revealed later!"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(810, 'Slideshow CK', 'module', 'mod_slideshowck', '', 0, 1, 0, 0, '{"legacy":false,"name":"Slideshow CK","type":"module","creationDate":"Avril 2012","author":"C\\u00e9dric KEIFLIN","copyright":"C\\u00e9dric KEIFLIN","authorEmail":"ced1870@gmail.com","authorUrl":"http:\\/\\/www.joomlack.fr","version":"1.3.11","description":"MOD_SLIDESHOWCK_XML_DESCRIPTION","group":""}', '{"slides":"[{|qq|imgname|qq|:|qq|modules\\\\\\/mod_slideshowck\\\\\\/images\\\\\\/slides\\\\\\/bridge.jpg|qq|,|qq|imgcaption|qq|:|qq|This is a bridge|qq|,|qq|imgthumb|qq|:|qq|..\\\\\\/modules\\\\\\/mod_slideshowck\\\\\\/images\\\\\\/slides\\\\\\/bridge.jpg|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|},{|qq|imgname|qq|:|qq|modules\\\\\\/mod_slideshowck\\\\\\/images\\\\\\/slides\\\\\\/road.jpg|qq|,|qq|imgcaption|qq|:|qq|This slideshow uses the JQuery script from <a href=|dq|http:\\\\\\/\\\\\\/www.pixedelic.com\\\\\\/plugins\\\\\\/camera\\\\\\/|dq|>Pixedelic<\\\\\\/a>|qq|,|qq|imgthumb|qq|:|qq|..\\\\\\/modules\\\\\\/mod_slideshowck\\\\\\/images\\\\\\/slides\\\\\\/road.jpg|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|},{|qq|imgname|qq|:|qq|modules\\\\\\/mod_slideshowck\\\\\\/images\\\\\\/slides\\\\\\/big_bunny_fake.jpg|qq|,|qq|imgcaption|qq|:|qq|This is a Video slide|qq|,|qq|imgthumb|qq|:|qq|..\\\\\\/modules\\\\\\/mod_slideshowck\\\\\\/images\\\\\\/slides\\\\\\/big_bunny_fake.jpg|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq|http:\\\\\\/\\\\\\/player.vimeo.com\\\\\\/video\\\\\\/2203727|qq|,|qq|slideselect|qq|:|qq|video|qq|}]","skin":"camera_amber_skin","alignment":"center","loader":"pie","width":"auto","height":"400","navigation":"2","thumbnails":"1","thumbnailwidth":"100","thumbnailheight":"75","pagination":"1","effect":"random","time":"7000","transperiod":"1500","captioneffect":"random","portrait":"0","autoAdvance":"1","hover":"1","displayorder":"normal","limitslides":"","fullpage":"0","imagetarget":"_parent","usemobileimage":"0","mobileimageresolution":"640","loadjquery":"1","loadjqueryeasing":"1","loadjquerymobile":"1","cache":"1","cache_time":"900","cachemode":"itemid","articlelength":"150","articlelink":"readmore","articletitle":"h3","showarticletitle":"1","captionstylesusefont":"1","captionstylestextgfont":"Droid Sans","captionstylesfontsize":"12px","captionstylesfontcolor":"","captionstylesfontweight":"normal","captionstylesdescfontsize":"10px","captionstylesdescfontcolor":"","captionstylesusemargin":"1","captionstylesmargintop":"0","captionstylesmarginright":"0","captionstylesmarginbottom":"0","captionstylesmarginleft":"0","captionstylespaddingtop":"0","captionstylespaddingright":"0","captionstylespaddingbottom":"0","captionstylespaddingleft":"0","captionstylesusebackground":"1","captionstylesbgcolor1":"","captionstylesbgpositionx":"left","captionstylesbgpositiony":"top","captionstylesbgimagerepeat":"repeat","captionstylesusegradient":"1","captionstylesbgcolor2":"","captionstylesuseroundedcorners":"1","captionstylesroundedcornerstl":"5","captionstylesroundedcornerstr":"5","captionstylesroundedcornersbr":"5","captionstylesroundedcornersbl":"5","captionstylesuseshadow":"1","captionstylesshadowcolor":"","captionstylesshadowblur":"3","captionstylesshadowspread":"0","captionstylesshadowoffsetx":"0","captionstylesshadowoffsety":"0","captionstylesshadowinset":"0","captionstylesuseborders":"1","captionstylesbordercolor":"","captionstylesborderwidth":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(811, 'Maximenu CK', 'module', 'mod_maximenuck', '', 0, 1, 0, 0, '{"legacy":false,"name":"Maximenu CK","type":"module","creationDate":"janvier 2011","author":"C\\u00e9dric KEIFLIN","copyright":"C\\u00e9dric KEIFLIN","authorEmail":"ced1870@gmail.com","authorUrl":"http:\\/\\/www.joomlack.fr","version":"6.2.6","description":"MOD_MAXIMENUCK_XML_DESCRIPTION","group":""}', '{"menuid":"maximenuck","startLevel":"1","endLevel":"0","dependantitems":"1","zindexlevel":"10","cache":"1","cache_time":"900","cachemode":"itemid","imagerollprefix":"_hover","imageactiveprefix":"_active","imageonly":"0","menu_images_align":"top","usemootools":"1","load":"domready","stopdropdownlevel":"0","menuposition":"0","style":"moomenu","opentype":"open","mooduration":"500","mootransition":"Quad","mooease":"easeOut","dureein":"0","dureeout":"500","useopacity":"0","testoverflow":"0","direction":"normal","directionoffset1":"30","directionoffset2":"30","showactivesubitems":"0","usefancy":"1","fancyduration":"500","fancytransition":"Quad","fancyease":"easeOut","theme":"css3megamenu","usecss":"1","orientation":"0","useresponsive":"1","templatelayer":"beez_20-position1","logoposition":"left","logomargintop":"0","logomarginright":"0","logomarginbottom":"0","logomarginleft":"0","thirdparty":"none","usevmimages":"0","usevmsuffix":"0","vmimagesuffix":"_mini","vmcategoryroot":"0","vmcategorydepth":"0","hikashopitemid":"0","usehikashopimages":"0","usehikashopsuffix":"0","hikashopimagesuffix":"_mini","hikashopcategoryroot":"0","hikashopcategorydepth":"0","hikashopshowall":"0","usek2images":"0","usek2suffix":"0","k2imagesuffix":"_mini","k2categoryroot":"0","k2categorydepth":"0","k2showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(812, 'WeSeK Read More', 'module', 'mod_WeSeKReadMore', '', 0, 1, 0, 0, '{"legacy":false,"name":"WeSeK Read More","type":"module","creationDate":"Dezember 2013","author":"Thomas Kutter","copyright":"Copyright (C)2013 WeSeK","authorEmail":"info@wesek.de","authorUrl":"http:\\/\\/www.wesek.de","version":"1.0","description":"Read More Module by WeSeK","group":""}', '{"title":"Your Title","description":"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.","textcolor":"#FFFFFF","Directory":"images\\/","pxHeight":"200","pxWidth":"200","link":"http:\\/\\/www.wesek.de","bgcolor":"#006699","readMore":"Read More"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(813, 'Noo Timeline', 'module', 'mod_noo_timeline', '', 0, 1, 0, 0, '{"legacy":false,"name":"Noo Timeline","type":"module","creationDate":"August 2013","author":"NooTheme","copyright":"Copyright (C) 2013 NooTheme. All rights reserved.","authorEmail":"admin@nootheme.com","authorUrl":"www.nootheme.com","version":"1.0.2","description":"\\n\\t\\t\\n\\t\\t\\t<span style=\\"color: #008000;\\"><strong>Noo Timeline Module for Joomla 3!<\\/strong><\\/span><br \\/>\\n\\t\\t\\t<div style=''font-weight:normal''>\\n\\t\\t\\tThe module allows you show your company timeline or resume on a vertical line. You can add any time frame to the timeline easily.\\n\\t\\t\\t<p>Copyright 2013 <a href=\\"http:\\/\\/nootheme.com\\" title=\\"Visit nootheme.com\\">NooTheme.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\t\\t \\n\\t","group":""}', '{"display":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(814, 'Tabs & Sliders [for articles] (by JoomlaWorks)', 'plugin', 'jw_ts', 'content', 0, 1, 1, 0, '{"legacy":true,"name":"Tabs & Sliders [for articles] (by JoomlaWorks)","type":"plugin","creationDate":"November 17th, 2012","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.","authorEmail":"contact@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7","description":"JW_PLG_TS_XML_DESC","group":""}', '{"template":"Default","tabContentHeight":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(815, 'Content - Simple Pop-Up', 'plugin', 'simplepopup', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"Content - Simple Pop-Up","type":"plugin","creationDate":"2011-05-14","author":"Anders Was\\u00e9n","copyright":"Copyright 2011 (C) Anders Was\\u00e9n. All rights reserved.","authorEmail":"awasen@gmail.com","authorUrl":"http:\\/\\/wasen.net","version":"2.0","description":"Simple Pop-Up - It will display a FancyBox Pop-Up on any page where added in an article...","group":""}', '{"spu_aligntext":"center","spu_boxwidth":"400","spu_boxheight":"auto","spu_autodimensions":"true","spu_cookie":"1","spu_cookiepersistence":"365","spu_style":"fancybox","spu_lblimage":"Image # of #","spu_lblclose":"CLOSE","spu_showlblimage":"1","spu_jqueryinclude":"0","spu_jquery":"0","upload_jqueryver":"1.7.2","upload_jqueryj3":"0","spu_debug":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_filters`
--

DROP TABLE IF EXISTS `asf_finder_filters`;
CREATE TABLE IF NOT EXISTS `asf_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links`
--

DROP TABLE IF EXISTS `asf_finder_links`;
CREATE TABLE IF NOT EXISTS `asf_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_terms0`
--

DROP TABLE IF EXISTS `asf_finder_links_terms0`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_terms1`
--

DROP TABLE IF EXISTS `asf_finder_links_terms1`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_terms2`
--

DROP TABLE IF EXISTS `asf_finder_links_terms2`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_terms3`
--

DROP TABLE IF EXISTS `asf_finder_links_terms3`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_terms4`
--

DROP TABLE IF EXISTS `asf_finder_links_terms4`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_terms5`
--

DROP TABLE IF EXISTS `asf_finder_links_terms5`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_terms6`
--

DROP TABLE IF EXISTS `asf_finder_links_terms6`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_terms7`
--

DROP TABLE IF EXISTS `asf_finder_links_terms7`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_terms8`
--

DROP TABLE IF EXISTS `asf_finder_links_terms8`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_terms9`
--

DROP TABLE IF EXISTS `asf_finder_links_terms9`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_termsa`
--

DROP TABLE IF EXISTS `asf_finder_links_termsa`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_termsb`
--

DROP TABLE IF EXISTS `asf_finder_links_termsb`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_termsc`
--

DROP TABLE IF EXISTS `asf_finder_links_termsc`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_termsd`
--

DROP TABLE IF EXISTS `asf_finder_links_termsd`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_termse`
--

DROP TABLE IF EXISTS `asf_finder_links_termse`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_links_termsf`
--

DROP TABLE IF EXISTS `asf_finder_links_termsf`;
CREATE TABLE IF NOT EXISTS `asf_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_taxonomy`
--

DROP TABLE IF EXISTS `asf_finder_taxonomy`;
CREATE TABLE IF NOT EXISTS `asf_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `asf_finder_taxonomy`
--

INSERT INTO `asf_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `asf_finder_taxonomy_map`;
CREATE TABLE IF NOT EXISTS `asf_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_terms`
--

DROP TABLE IF EXISTS `asf_finder_terms`;
CREATE TABLE IF NOT EXISTS `asf_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_terms_common`
--

DROP TABLE IF EXISTS `asf_finder_terms_common`;
CREATE TABLE IF NOT EXISTS `asf_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `asf_finder_terms_common`
--

INSERT INTO `asf_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_tokens`
--

DROP TABLE IF EXISTS `asf_finder_tokens`;
CREATE TABLE IF NOT EXISTS `asf_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `asf_finder_tokens_aggregate`;
CREATE TABLE IF NOT EXISTS `asf_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_finder_types`
--

DROP TABLE IF EXISTS `asf_finder_types`;
CREATE TABLE IF NOT EXISTS `asf_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `asf_languages`
--

DROP TABLE IF EXISTS `asf_languages`;
CREATE TABLE IF NOT EXISTS `asf_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `asf_languages`
--

INSERT INTO `asf_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 0, 1),
(2, 'fr-FR', 'Français (FR)', 'Français (FR)', 'fr', 'fr', '', '', '', '', 1, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `asf_menu`
--

DROP TABLE IF EXISTS `asf_menu`;
CREATE TABLE IF NOT EXISTS `asf_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=166 ;

--
-- Contenu de la table `asf_menu`
--

INSERT INTO `asf_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 173, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 39, 48, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 40, 41, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 42, 43, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 44, 45, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 46, 47, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 49, 54, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 50, 51, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 52, 53, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 55, 60, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 56, 57, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 58, 59, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 61, 66, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 62, 63, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 64, 65, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 79, 80, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 71, 72, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 73, 78, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 74, 75, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 76, 77, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 69, 70, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 67, 68, 0, '*', 1),
(101, 'mainmenuv2', 'ACCUEIL', 'accueil', '', 'accueil', 'index.php?option=com_content&view=category&layout=blog&id=9', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"0","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"0","show_empty_categories":"0","show_no_articles":"0","show_subcat_desc":"0","show_cat_num_articles":"0","page_subheading":"","num_leading_articles":"3","num_intro_articles":"3","num_columns":"3","num_links":"0","multi_column_order":"0","show_subcategory_content":"0","orderby_pri":"none","orderby_sec":"front","order_date":"","show_pagination":"2","show_pagination_results":"1","show_title":"1","link_titles":"1","show_intro":"1","show_category":"0","link_category":"","show_parent_category":"0","link_parent_category":"","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"0","show_readmore_title":"1","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","show_feed_link":"1","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 97, 98, 1, '*', 0),
(102, 'bottommenu', 'Connexion ''Auteur''', 'connexion', '', 'connexion', 'index.php?option=com_users&view=login', 'component', 1, 1, 1, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 3, '{"login_redirect_url":"index.php?Itemid=101","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 81, 82, 0, '*', 0),
(103, 'authormenu', 'Modifier votre Profil', 'modifier-votre-profil', '', 'modifier-votre-profil', 'index.php?option=com_users&view=profile&layout=edit', 'component', 1, 1, 1, 25, 0, 0, '0000-00-00 00:00:00', 0, 2, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 25, 26, 0, '*', 0),
(104, 'authormenu', 'Créer un article', 'creer-un-article', '', 'creer-un-article', 'index.php?option=com_content&view=form&layout=edit', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 3, '', 0, '{"enable_category":"1","catid":"9","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 27, 28, 0, '*', 0),
(105, 'authormenu', 'Ajouter un lien', 'ajouter-un-lien', '', 'ajouter-un-lien', 'index.php?option=com_weblinks&view=form&layout=edit', 'component', 1, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 3, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 29, 30, 0, '*', 0),
(106, 'authormenu', 'Administration du site', '2012-01-04-15-46-42', '', '2012-01-04-15-46-42', 'administrator', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 1, 3, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 35, 36, 0, '*', 0),
(107, 'authormenu', 'Déconnexion', 'deconnexion', '', 'deconnexion', 'index.php?option=com_users&view=login', 'component', 1, 1, 1, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 37, 38, 0, '*', 0),
(108, 'mainmenu', 'A propos de ce site', 'a-propos-de-ce-site', '', 'a-propos-de-ce-site', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 1, 12, 0, '*', 0),
(109, 'authormenu', 'Travailler sur votre site', 'travailler-sur-votre-site', '', 'travailler-sur-votre-site', 'index.php?option=com_content&view=article&id=2', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 33, 34, 0, '*', 0),
(110, 'authormenu', 'Gestion des liens', 'gestion-des-liens', '', 'gestion-des-liens', 'index.php?option=com_weblinks&view=category&id=8', 'component', 1, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_subcat_desc":"","show_cat_num_links":"","show_pagination_limit":"","show_headings":"","show_link_description":"","show_link_hits":"","show_pagination":"","show_pagination_results":"","show_feed_link":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 31, 32, 0, '*', 0),
(111, 'mainmenu', 'Notre action', 'notre-action', '', 'notre-action', 'index.php?option=com_content&view=article&id=6', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 13, 24, 0, '*', 0),
(112, 'mainmenu', 'Parrainer une famille', 'parrainer-une-famille', '', 'parrainer-une-famille', 'index.php?option=com_content&view=article&id=7', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 83, 84, 0, '*', 0),
(113, 'mainmenu', 'Faire un don', 'faire-un-don', '', 'faire-un-don', 'index.php?option=com_content&view=article&id=8', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 85, 86, 0, '*', 0),
(114, 'mainmenu', 'Impliquez-vous', 'impliquez-vous', '', 'impliquez-vous', 'index.php?option=com_content&view=article&id=20', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 87, 94, 0, '*', 0),
(115, 'asf-contact', 'Contactez-nous', 'contactez-nous', '', 'contactez-nous', 'index.php?option=com_contact&view=contact&id=1', 'component', 1, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"presentation_style":"","show_contact_category":"","show_contact_list":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 95, 96, 0, '*', 0),
(116, 'mainmenu', 'Mission, objectifs et valeurs', 'mission-objectifs-et-valeurs', '', 'a-propos-de-ce-site/mission-objectifs-et-valeurs', 'index.php?option=com_content&view=article&id=12', 'component', 1, 108, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"","show_intro":"","show_category":"0","link_category":"","show_parent_category":"0","link_parent_category":"1","show_author":"0","link_author":"","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 2, 3, 0, '*', 0),
(117, 'mainmenu', 'Historique', 'historique', '', 'a-propos-de-ce-site/historique', 'index.php?option=com_content&view=article&id=13', 'component', 1, 108, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"background:yellow;","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 4, 5, 0, '*', 0),
(118, 'mainmenu', 'Empowerment', 'empowerment', '', 'a-propos-de-ce-site/empowerment', 'index.php?option=com_content&view=article&id=14', 'component', 1, 108, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 6, 7, 0, '*', 0),
(119, 'mainmenu', 'Développement communautaire', 'developpement-communautaire', '', 'a-propos-de-ce-site/developpement-communautaire', 'index.php?option=com_content&view=article&id=15', 'component', 1, 108, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 10, 11, 0, '*', 0),
(120, 'mainmenu', 'Publication', 'publication', '', 'a-propos-de-ce-site/publication', 'index.php?option=com_content&view=article&id=16', 'component', 1, 108, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 8, 9, 0, '*', 0),
(121, 'mainmenu', 'Au Québec', 'au-quebec', '', 'notre-action/au-quebec', 'index.php?option=com_content&view=article&id=17', 'component', 1, 111, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"","show_category":"0","link_category":"","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 14, 15, 0, '*', 0),
(122, 'mainmenu', 'Au Canada', 'notre-action-au-canada', '', 'notre-action/notre-action-au-canada', 'index.php?option=com_content&view=article&id=18', 'component', 1, 111, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 16, 17, 0, '*', 0),
(123, 'mainmenu', 'A l''internationnal', 'a-l-internationnal', '', 'notre-action/a-l-internationnal', 'index.php?option=com_content&view=article&id=19', 'component', 1, 111, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 18, 23, 0, '*', 0),
(124, 'mainmenu', 'Familles et individus', 'familles-et-individus', '', 'impliquez-vous/familles-et-individus', 'index.php?option=com_content&view=article&id=21', 'component', 1, 114, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 88, 89, 0, '*', 0),
(125, 'mainmenu', 'Entreprises', 'entreprises', '', 'impliquez-vous/entreprises', 'index.php?option=com_content&view=article&id=22', 'component', 1, 114, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 90, 91, 0, '*', 0),
(126, 'mainmenu', 'Carriéres', 'carrieres', '', 'impliquez-vous/carrieres', 'index.php?option=com_content&view=article&id=23', 'component', 1, 114, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 92, 93, 0, '*', 0),
(127, 'mainmenu', 'Développement social', 'developpement-social', '', 'notre-action/a-l-internationnal/developpement-social', 'index.php?option=com_content&view=article&id=24', 'component', 1, 123, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 19, 20, 0, '*', 0),
(128, 'mainmenu', 'Santé psychosociale', 'sante-psychosociale', '', 'notre-action/a-l-internationnal/sante-psychosociale', 'index.php?option=com_content&view=article&id=25', 'component', 1, 123, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 21, 22, 0, '*', 0),
(129, 'mainmenuv2', 'NOTRE ORGANISME', 'notre-organisme', '', 'notre-organisme', 'index.php?option=com_content&view=article&id=27', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 109, 120, 0, '*', 0),
(130, 'mainmenuv2', 'Nos Axes D’intervention', 'nos-axes-d-intervention', '', 'notre-organisme/nos-axes-d-intervention', 'index.php?option=com_content&view=article&id=28', 'component', 1, 129, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 114, 115, 0, '*', 0),
(131, 'mainmenuv2', 'Missions, Objectifs et Valeurs', 'missions-objectifs-et-valeurs', '', 'notre-organisme/missions-objectifs-et-valeurs', 'index.php?option=com_content&view=article&id=29', 'component', 1, 129, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 110, 111, 0, '*', 0),
(132, 'mainmenuv2', 'Rigueur et transparence', 'rigueur-et-transparence-transparence-financiere', '', 'notre-organisme/rigueur-et-transparence-transparence-financiere', 'index.php?option=com_content&view=article&id=30', 'component', -2, 129, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 116, 117, 0, '*', 0),
(133, 'mainmenuv2', 'Notre équipe', 'notre-equipe', '', 'notre-organisme/notre-equipe', 'index.php?option=com_content&view=article&id=31', 'component', 1, 129, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 118, 119, 0, '*', 0),
(134, 'mainmenuv2', 'Historique', 'historique', '', 'notre-organisme/historique', 'index.php?option=com_content&view=article&id=13', 'component', 1, 129, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 112, 113, 0, '*', 0),
(135, 'mainmenuv2', 'ACTUALITÉS', 'actualites', '', 'actualites', 'index.php?option=com_content&view=article&id=32', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 99, 108, 0, '*', 0),
(136, 'mainmenuv2', 'Nouvelles', 'nouvelles', '', 'actualites/nouvelles', 'index.php?option=com_content&view=article&id=33', 'component', -2, 135, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 100, 101, 0, '*', 0),
(137, 'mainmenuv2', 'Agenda des évènements', 'agenda-des-evenements', '', 'actualites/agenda-des-evenements', 'index.php?option=com_content&view=article&id=34', 'component', -2, 135, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 102, 103, 0, '*', 0),
(138, 'mainmenuv2', 'Le Blog de l’équipe', 'le-blog-de-l-equipe', '', 'actualites/le-blog-de-l-equipe', 'index.php?option=com_content&view=article&id=35', 'component', -2, 135, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 104, 105, 0, '*', 0),
(139, 'mainmenuv2', 'S’inscrire à la Newsletter', 's-inscrire-a-la-newsletter', '', 'actualites/s-inscrire-a-la-newsletter', 'index.php?option=com_content&view=article&id=36', 'component', -2, 135, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 106, 107, 0, '*', 0),
(140, 'mainmenuv2', 'AGIR ENSEMBLE', 'agir-ensemble', '', 'agir-ensemble', 'index.php?option=com_content&view=article&id=37', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 121, 152, 0, '*', 0),
(141, 'mainmenuv2', 'Faire un Don', 'donner', '', 'agir-ensemble/donner', 'index.php?option=com_content&view=article&id=38', 'component', 1, 140, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 124, 135, 0, '*', 0),
(142, 'mainmenuv2', 'Faire un Don', 'faire-un-don', '', 'agir-ensemble/donner/faire-un-don', 'index.php?option=com_content&view=article&id=39', 'component', -2, 141, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 125, 126, 0, '*', 0),
(143, 'mainmenuv2', 'Demander une brochure', 'demander-une-brochure', '', 'agir-ensemble/donner/demander-une-brochure', 'index.php?option=com_content&view=article&id=40', 'component', -2, 141, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 127, 128, 0, '*', 0),
(144, 'mainmenuv2', 'Offrir un cadeau solidaire ', 'offrir-un-cadeau-solidaire', '', 'agir-ensemble/donner/offrir-un-cadeau-solidaire', 'index.php?option=com_content&view=article&id=41', 'component', -2, 141, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 129, 134, 0, '*', 0),
(145, 'mainmenuv2', '(crayons/stylos, matériel pédagogique, etc. pour nos missions)', 'crayons-stylos-materiel-pedagogique-etc-pour-nos-missions', '', 'agir-ensemble/donner/offrir-un-cadeau-solidaire/crayons-stylos-materiel-pedagogique-etc-pour-nos-missions', 'index.php?option=com_content&view=article&id=42', 'component', -2, 144, 4, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 130, 131, 0, '*', 0),
(146, 'mainmenuv2', 'Offrir du matériel informatique (fournitures de bureau etc. pour l’ASF)', 'offrir-du-materiel-informatique-fournitures-de-bureau-etc-pour-l-asf', '', 'agir-ensemble/donner/offrir-un-cadeau-solidaire/offrir-du-materiel-informatique-fournitures-de-bureau-etc-pour-l-asf', 'index.php?option=com_content&view=article&id=43', 'component', -2, 144, 4, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 132, 133, 0, '*', 0),
(147, 'mainmenuv2', 'Nos Partenaires', 'nos-partenaires', '', 'agir-ensemble/nos-partenaires', 'index.php?option=com_content&view=article&id=44', 'component', 1, 140, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 122, 123, 0, '*', 0),
(148, 'mainmenuv2', 'Le bénévolat humanitaire', 'le-benevolat-humanitaire-devenir-intervenant', '', 'agir-ensemble/le-benevolat-humanitaire-devenir-intervenant', 'index.php?option=com_content&view=article&id=45', 'component', -2, 140, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 136, 137, 0, '*', 0),
(149, 'mainmenuv2', 'Offres de Stages', 'offres-de-stages', '', 'agir-ensemble/offres-de-stages', 'index.php?option=com_content&view=article&id=46', 'component', 1, 140, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 148, 149, 0, '*', 0),
(150, 'mainmenuv2', 'CONTACTEZ-NOUS', 'contact', '', 'contact', 'index.php?option=com_content&view=article&id=47', 'component', -2, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 153, 170, 0, '*', 0),
(151, 'mainmenuv2', 'Infos ', 'infos', '', 'contact/infos', 'index.php?option=com_content&view=article&id=48', 'component', -2, 150, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 154, 155, 0, '*', 0),
(152, 'mainmenuv2', 'Donner', 'donner', '', 'contact/donner', 'index.php?option=com_content&view=article&id=38', 'component', -2, 150, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 156, 167, 0, '*', 0),
(153, 'mainmenuv2', 'Faire un Don', 'faire-un-don', '', 'contact/donner/faire-un-don', 'index.php?option=com_content&view=article&id=39', 'component', -2, 152, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 157, 158, 0, '*', 0);
INSERT INTO `asf_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(154, 'mainmenuv2', 'Demander une brochure', 'demander-une-brochure', '', 'contact/donner/demander-une-brochure', 'index.php?option=com_content&view=article&id=40', 'component', -2, 152, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 159, 160, 0, '*', 0),
(155, 'mainmenuv2', 'Offrir un cadeau solidaire ', 'offrir-un-cadeau-solidaire', '', 'contact/donner/offrir-un-cadeau-solidaire', 'index.php?option=com_content&view=article&id=41', 'component', -2, 152, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 161, 166, 0, '*', 0),
(156, 'mainmenuv2', '(crayons/stylos, matériel pédagogique, etc. pour nos missions)', 'crayons-stylos-materiel-pedagogique-etc-pour-nos-missions', '', 'contact/donner/offrir-un-cadeau-solidaire/crayons-stylos-materiel-pedagogique-etc-pour-nos-missions', 'index.php?option=com_content&view=article&id=42', 'component', -2, 155, 4, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 162, 163, 0, '*', 0),
(157, 'mainmenuv2', 'Offrir du matériel informatique (fournitures de bureau etc. pour l’ASF)', 'offrir-du-materiel-informatique-fournitures-de-bureau-etc-pour-l-asf', '', 'contact/donner/offrir-un-cadeau-solidaire/offrir-du-materiel-informatique-fournitures-de-bureau-etc-pour-l-asf', 'index.php?option=com_content&view=article&id=43', 'component', -2, 155, 4, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 164, 165, 0, '*', 0),
(158, 'mainmenuv2', 'Offres de stages/bénévolat', 'offres-de-stages-benevolat', '', 'contact/offres-de-stages-benevolat', 'index.php?option=com_content&view=article&id=46', 'component', -2, 150, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 168, 169, 0, '*', 0),
(159, 'mainmenuv2', 'Parrainer une Famille', 'parrainer-une-famille', '', 'agir-ensemble/parrainer-une-famille', 'index.php?option=com_content&view=article&id=7', 'component', 1, 140, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 138, 147, 0, '*', 0),
(160, 'mainmenuv2', 'Bénévolat', 'benevolat', '', 'agir-ensemble/benevolat', 'index.php?option=com_content&view=article&id=45', 'component', 1, 140, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 150, 151, 0, '*', 0),
(161, 'mainmenuv2', 'Fonctionnement du Parrainage', 'fonctionnement-du-parrainage', '', 'agir-ensemble/parrainer-une-famille/fonctionnement-du-parrainage', 'index.php?option=com_content&view=article&id=30', 'component', 1, 159, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 139, 140, 0, '*', 0),
(162, 'mainmenuv2', 'Parrainez dès Maintenant', 'parrainez-des-maintenant', '', 'agir-ensemble/parrainer-une-famille/parrainez-des-maintenant', 'index.php?option=com_content&view=article&id=14', 'component', 1, 159, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 141, 142, 0, '*', 0),
(163, 'mainmenuv2', 'Espace Parrainage', 'espace-parrainage', '', 'agir-ensemble/parrainer-une-famille/espace-parrainage', 'index.php?option=com_content&view=article&id=20', 'component', 1, 159, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 143, 144, 0, '*', 0),
(164, 'mainmenuv2', 'FAQ', 'faq', '', 'agir-ensemble/parrainer-une-famille/faq', 'index.php?option=com_content&view=article&id=21', 'component', 1, 159, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 145, 146, 0, '*', 0),
(165, 'mainmenuv2', 'GALERIES', 'galeries', '', 'galeries', 'index.php?option=com_content&view=article&id=49', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 171, 172, 0, '*', 0);

-- --------------------------------------------------------

--
-- Structure de la table `asf_menu_types`
--

DROP TABLE IF EXISTS `asf_menu_types`;
CREATE TABLE IF NOT EXISTS `asf_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `asf_menu_types`
--

INSERT INTO `asf_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Menu principal', 'Menu principal de ce site'),
(2, 'authormenu', 'Menu auteurs', 'Menu pour auteurs'),
(3, 'bottommenu', 'Menu bas', 'Menu bas de page'),
(6, 'asf-contact', 'Menu contact', 'contact'),
(7, 'mainmenuv2', 'Menu pricipal V2', '');

-- --------------------------------------------------------

--
-- Structure de la table `asf_messages`
--

DROP TABLE IF EXISTS `asf_messages`;
CREATE TABLE IF NOT EXISTS `asf_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `asf_messages_cfg`
--

DROP TABLE IF EXISTS `asf_messages_cfg`;
CREATE TABLE IF NOT EXISTS `asf_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `asf_modules`
--

DROP TABLE IF EXISTS `asf_modules`;
CREATE TABLE IF NOT EXISTS `asf_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

--
-- Contenu de la table `asf_modules`
--

INSERT INTO `asf_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 'Menu pricipal', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Articles populaires', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Articles ajoutés récemment', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(8, 'Barre d''outils', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Icône de raccourcis', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Utilisateurs connectés', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Menu administration', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Sous-menu administration', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'Statut utilisateur', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Titre', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 'Formulaire de connexion', '', '', 7, 'position-7', 883, '2014-03-07 20:07:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 'Fil de navigation', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"Accueil","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(79, 'Status multilingue', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(80, 'Menu auteur', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 0, '{"menutype":"authormenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(81, 'Liens de Blog', '', '', 5, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_weblinks', 1, 1, '{"catid":"8","count":"5","ordering":"title","direction":"asc","target":"1","description":"0","hits":"0","count_clicks":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(82, 'Lien de flux RSS', '', '', 6, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_syndicate', 1, 0, '{"display_text":1,"text":"Flux du Blog","format":"rss","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 0, '*'),
(83, 'Articles archivés', '', '', 4, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_archive', 1, 1, '{"count":"10","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(84, 'Articles les plus lus', '', '', 2, 'position-7', 883, '2014-03-07 20:08:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_popular', 1, 1, '{"catid":["9"],"count":"5","show_front":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(85, 'Anciens articles', '', '', 3, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_category', 1, 1, '{"mode":"normal","show_on_article_page":"1","show_front":"show","count":"0","category_filtering_type":"1","catid":["9"],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"month_year","article_grouping_direction":"krsort","month_year_format":"F Y","item_heading":"4","link_titles":"1","show_date":"1","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"0","introtext_limit":"100","show_readmore":"0","show_readmore_title":"1","readmore_limit":"15","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900"}', 0, '*'),
(86, 'Menu bas', '', '', 8, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"bottommenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(87, 'Recherche', '', '', 1, 'position-0', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 1, '{"label":"recherche","width":"20","text":"","button":"","button_pos":"left","imagebutton":"1","button_text":"","opensearch":"0","opensearch_title":"recherche","set_itemid":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(88, 'En-tête', '', '<div style="padding: 0px 0px 10px 5px; border-bottom: 1px dotted #c0c0c0;">\r\n<div style="color: #095197; font-size: 15px; font-family: ''Titillium Maps'',Arial; padding-bottom: 10px;">Module « En-tête du Blog »</div>\r\n<div>Module personnalisé au contenu rédigé par vos soins. Vous pouvez y intégrer des images ou autres types de média.</div>\r\n</div>', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(89, 'Menu contact', '', '', 1, 'position-13', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"asf-contact","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(90, 'Footer', '', '', 1, 'position-9', 883, '2014-02-27 01:20:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_footer', 1, 0, '', 0, '*'),
(91, 'JM Slideshow Responsive', '', '', 1, 'position-15', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jmslideshow', 1, 1, '{"jmslideshow_responsive":"1","jmslideshow_width":"700","jmslideshow_image_width":"700","jmslideshow_image_height":"400","jmslideshow_image_style":"fill","class_sfx":"","slider_source":"9","jmslideshow_article_ids":"","jmslideshow_k2_ids":"","jmslideshow_hikashop_ids":"","jmslideshow_file_image_url":"","jmslideshow_file_image_title":"","jmslideshow_file_image_title_link":"","jmslideshow_file_image_desc":"","jmslideshow_file_image":"[{\\"url\\":\\"images\\/slides\\/102_3546.JPG\\",\\"title\\":\\"Partager%20L","jmslideshow_foder_image":"","jmslideshow_image_source":"0","jmslideshow_article_image_source":"3","jmslideshow_ordering":"ASC","jmslideshow_orderby":"1","jmslideshow_count":"5","jmslideshow_layout":"default","jmslideshow_effect":"fade","jmslideshow_speed":"500","jmslideshow_auto":"1","jmslideshow_timeout":"5000","jmslideshow_caption_position":"bottomright","jmslideshow_caption_left":"30","jmslideshow_caption_top":"30","jmslideshow_caption_right":"30","jmslideshow_caption_bottom":"30","jmslideshow_caption_width":"500","jmslideshow_show_desc":"1","jmslideshow_desc_length":"150","jmslideshow_desc_html":"","jmslideshow_readmore_text":"Read more","jmslideshow_show_nav_buttons":"1","jmslideshow_show_pager":"0","jmslideshow_pager_type":"1","jmslideshow_pager_position":"bottomleft","jmslideshow_image_thumbnail_width":"100","jmslideshow_image_thumbnail_height":"65","jmslideshow_pager_left":"30","jmslideshow_pager_top":"30","jmslideshow_pager_right":"30","jmslideshow_pager_bottom":"30","jmslideshow_include_jquery":"2"}', 0, '*'),
(92, 'Slideshow CK', '', '', 1, 'position-15', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_slideshowck', 1, 1, '{"slides":"[{|qq|imgname|qq|:|qq|images\\/slides\\/102_3546.JPG|qq|,|qq|imgcaption|qq|:|qq|Partager L''Espoir|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost\\/asfcanada\\/images\\/slides\\/102_3546.JPG|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|bottomCenter|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|images\\/slides\\/102_3983.JPG|qq|,|qq|imgcaption|qq|:|qq|Partager L''Espoir|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost\\/asfcanada\\/images\\/slides\\/102_3983.JPG|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|images\\/slides\\/DSCF0303.JPG|qq|,|qq|imgcaption|qq|:|qq|Partager L''Espoir|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost\\/asfcanada\\/images\\/slides\\/DSCF0303.JPG|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq|http:\\/\\/player.vimeo.com\\/video\\/2203727|qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|images\\/slides\\/DSCF4134.JPG|qq|,|qq|imgcaption|qq|:|qq|Partager L''Espoir|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost\\/asfcanada\\/images\\/slides\\/DSCF4134.JPG|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|default|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|images\\/slides\\/DSC_0043.JPG|qq|,|qq|imgcaption|qq|:|qq|Partager L''Espoir|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost\\/asfcanada\\/images\\/slides\\/DSC_0043.JPG|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|default|qq|,|qq|imgalignment|qq|:|qq|bottomCenter|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|}]","theme":"default","skin":"camera_amber_skin","alignment":"center","loader":"none","width":"auto","height":"400","navigation":"2","thumbnails":"0","thumbnailwidth":"100","thumbnailheight":"75","pagination":"0","effect":["random"],"time":"7000","transperiod":"1500","captioneffect":"moveFromLeft","portrait":"0","autoAdvance":"1","hover":"0","displayorder":"normal","limitslides":"","fullpage":"0","imagetarget":"_parent","usemobileimage":"0","mobileimageresolution":"640","loadjquery":"1","loadjqueryeasing":"1","loadjquerymobile":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","articlelength":"150","articlelink":"readmore","articletitle":"h3","showarticletitle":"1","captionstylesusefont":"1","captionstylestextgfont":"Droid Sans","captionstylesfontsize":"12px","captionstylesfontcolor":"","captionstylesfontweight":"normal","captionstylesdescfontsize":"10px","captionstylesdescfontcolor":"","captionstylesusemargin":"1","captionstylesmargintop":"0","captionstylesmarginright":"0","captionstylesmarginbottom":"0","captionstylesmarginleft":"0","captionstylespaddingtop":"0","captionstylespaddingright":"0","captionstylespaddingbottom":"0","captionstylespaddingleft":"0","captionstylesusebackground":"1","captionstylesbgcolor1":"","captionstylesbgimage":"","captionstylesbgpositionx":"left","captionstylesbgpositiony":"top","captionstylesbgimagerepeat":"repeat","captionstylesusegradient":"1","captionstylesbgcolor2":"","captionstylesuseroundedcorners":"1","captionstylesroundedcornerstl":"5","captionstylesroundedcornerstr":"5","captionstylesroundedcornersbr":"5","captionstylesroundedcornersbl":"5","captionstylesuseshadow":"1","captionstylesshadowcolor":"","captionstylesshadowblur":"3","captionstylesshadowspread":"0","captionstylesshadowoffsetx":"0","captionstylesshadowoffsety":"0","captionstylesshadowinset":"0","captionstylesuseborders":"1","captionstylesbordercolor":"","captionstylesborderwidth":"1"}', 0, '*'),
(93, 'Maximenu CK', '', '', 2, 'position-1', 883, '2014-03-29 18:30:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_maximenuck', 1, 1, '{"menutype":"mainmenu","menuid":"maximenuck","startLevel":"1","endLevel":"0","dependantitems":"1","zindexlevel":"10","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","imagerollprefix":"_hover","imageactiveprefix":"_active","imageonly":"0","menu_images_align":"top","usemootools":"1","load":"domready","stopdropdownlevel":"0","menuposition":"0","style":"moomenu","opentype":"open","mooduration":"500","mootransition":"Quad","mooease":"easeOut","dureein":"0","dureeout":"500","useopacity":"0","testoverflow":"0","direction":"normal","directionoffset1":"30","directionoffset2":"30","showactivesubitems":"0","usefancy":"1","fancyduration":"500","fancytransition":"Quad","fancyease":"easeOut","theme":"css3megamenu","usecss":"1","orientation":"0","useresponsive":"1","templatelayer":"beez_20-position1","logoimage":"","logolink":"","logoalt":"","logoposition":"left","logowidth":"","logoheight":"","logomargintop":"0","logomarginright":"0","logomarginbottom":"0","logomarginleft":"0","thirdparty":"none","usevmimages":"0","usevmsuffix":"0","vmimagesuffix":"_mini","vmcategoryroot":"0","vmcategorydepth":"0","hikashopitemid":"0","usehikashopimages":"0","usehikashopsuffix":"0","hikashopimagesuffix":"_mini","hikashopcategoryroot":"0","hikashopcategorydepth":"0","hikashopshowall":"0","usek2images":"0","usek2suffix":"0","k2imagesuffix":"_mini","k2categoryroot":"0","k2categorydepth":"0","k2showall":"1"}', 0, '*'),
(94, 'PROJET HAITI 2012-2018', '', '', 1, 'position-121', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_WeSeKReadMore', 1, 0, '{"title":"PROJET HAITI 2012-2018","description":"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.","textcolor":"#FFFFFF","Directory":"images\\/Photos_articles\\/103_5141_fmt1.jpeg","pxHeight":"200","pxWidth":"200","link":"index.php?option=com_content&view=article&layout=edit&id=3","bgcolor":"#006699","readMore":"Read More"}', 0, '*'),
(95, 'LE DEFI', '', '', 1, 'position-122', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_WeSeKReadMore', 1, 0, '{"title":"LE DEFI","description":"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.","textcolor":"#FFFFFF","Directory":"images\\/Photos_articles\\/100_6582.JPG","pxHeight":"200","pxWidth":"200","link":"index.php?option=com_content&view=article&layout=edit&id=4","bgcolor":"#006699","readMore":"Read More"}', 0, '*'),
(96, 'NOS ACTIVITES AU CANADA', '', '', 1, 'position-123', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_WeSeKReadMore', 1, 0, '{"title":"NOS ACTIVITES AU CANADA","description":"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.","textcolor":"#FFFFFF","Directory":"images\\/Photos_articles\\/40prod_c.jpg","pxHeight":"200","pxWidth":"200","link":"index.php?option=com_content&view=article&layout=edit&id=5","bgcolor":"#006699","readMore":"Read More"}', 0, '*'),
(97, 'FAIRE UN DON', '', '', 1, 'position-124', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_WeSeKReadMore', 1, 0, '{"title":"FAIRE UN DON","description":"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.","textcolor":"#FFFFFF","Directory":"images\\/Photos_articles\\/don img.png","pxHeight":"200","pxWidth":"200","link":"https:\\/\\/www.canadahelps.org\\/CharityProfilePage.aspx?Language=fr&CharityID=d94303","bgcolor":"#006699","readMore":"Read More"}', 0, '*'),
(98, 'Menu pricipal V2', '', '', 2, 'position-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenuv2","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(99, 'Actualités', '', '', 1, 'position-12', 883, '2014-04-17 18:27:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_feed', 1, 1, '{"rssurl":"http:\\/\\/www.facebook.com\\/feeds\\/page.php?format=atom10&id=171343846290816","rssrtl":"0","rsstitle":"0","rssdesc":"0","rssimage":"0","rssitems":"1","rssitemdesc":"1","word_count":"50","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900"}', 0, '*'),
(100, 'Noo Timeline', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_noo_timeline', 1, 1, '', 0, '*'),
(101, 'timeline', '', '', 1, 'position-15', 883, '2014-05-01 23:26:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_noo_timeline', 1, 1, '{"display":"0","timeline":"{&quot;0&quot;:{&quot;frame&quot;:&quot;2005&quot;,&quot;title&quot;:&quot;2005&quot;,&quot;description&quot;:&quot;Marco-Genya St-Arnaud rencontre M\\u00e9lusine de Maill\\u00e9. Ensemble, ils con\\u00e7oivent Artistes\\\\nSans Fronti\\u00e8res Canada (ASF Canada). Marco met \\u00e0 profit son exp\\u00e9rience et sa passion de\\\\nl\\u2019art et ses comp\\u00e9tences d\\u00e9velopp\\u00e9es en psychologie et en approche psychocorporelle.\\\\nQuant \\u00e0 M\\u00e9lusine, elle offre son exp\\u00e9rience des arts et du spectacle. De plus, elle nourrit ASF\\\\nCanada de sa conviction que l\\u2019art est un acte de transformation citoyen et politique. ASF\\\\nCanada devient donc un vecteur de leurs id\\u00e9aux.&quot;},&quot;1&quot;:{&quot;frame&quot;:&quot;2006&quot;,&quot;title&quot;:&quot;2006&quot;,&quot;description&quot;:&quot;La Fondation qu\\u00e9b\\u00e9coise pour la Danse Contemporaine (FQDC) est cr\\u00e9\\u00e9e. Ainsi, un programme\\\\nde d\\u00e9veloppement social et communautaire \\u00e9manant de la FQDC est enregistr\\u00e9\\\\nsous le nom d\\u2019Artistes Sans Fronti\\u00e8res Canada.Son num\\u00e9ro d\\u2019organisme de bienfaisance est\\\\nle 86018 2799 RR0001.&quot;},&quot;2&quot;:{&quot;frame&quot;:&quot;2007&quot;,&quot;title&quot;:&quot;2007 \\u00e0 2008&quot;,&quot;description&quot;:&quot;Plusieurs programmes sont r\\u00e9alis\\u00e9s :Cr\\u00e9ation D\\u00e9tention Danse! Programme mis en place\\\\ndans la prison f\\u00e9d\\u00e9rale de Joliette pour une vingtaine de femmes. Dansons Ensemble! Programme\\\\nimpliquant une quinzaine de jeunes montr\\u00e9alais. Northern Dances Programme au\\\\nsein des Premi\\u00e8res Nations dans le Grand Nord du Qu\\u00e9bec.&quot;},&quot;3&quot;:{&quot;frame&quot;:&quot;2009&quot;,&quot;title&quot;:&quot;2009&quot;,&quot;description&quot;:&quot;Cette ann\\u00e9e est marqu\\u00e9e par le renforcement de la structure administrative de l\\u2019organisation.\\\\nArtistes Sans Fronti\\u00e8res Canada se d\\u00e9veloppe gr\\u00e2ce aux dons priv\\u00e9s. Il devient donc essentiel\\\\nde mettre en place des m\\u00e9canismes de financement (exemple : des dons de particuliers,\\\\ndes dons corporatifs et des demandes de commandites).&quot;},&quot;4&quot;:{&quot;frame&quot;:&quot;2010&quot;,&quot;title&quot;:&quot;2010&quot;,&quot;description&quot;:&quot;Alors que Marc prend la direction d\\u2019ASF Canada, M\\u00e9lusine prend celle de La Friche de Montr\\u00e9al,\\\\ncentre chor\\u00e9graphique. Cette p\\u00e9riode est fructueuse en projets et permet de se projeter\\\\ndans l\\u2019avenir. ASF Canada s\\u2019investit dans trois principaux projets: Northern Dances Danse\\\\nmaman, danse! Danse dans la rue!&quot;},&quot;5&quot;:{&quot;frame&quot;:&quot;2011&quot;,&quot;title&quot;:&quot;2011&quot;,&quot;description&quot;:&quot;L\\u2019ann\\u00e9e est marqu\\u00e9e par l\\u2019am\\u00e9lioration de l\\u2019infrastructure de l\\u2019organisme.&quot;}}","moduleclass_sfx":"","layout":"_:default","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(102, 'galeries', '', '', 1, 'position-12', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_slideshowck', 1, 1, '{"slides":"[{|qq|imgname|qq|:|qq|modules\\/mod_slideshowck\\/images\\/slides\\/bridge.jpg|qq|,|qq|imgcaption|qq|:|qq|This is a bridge|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost:8888\\/asfcanada\\/modules\\/mod_slideshowck\\/images\\/slides\\/bridge.jpg|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|modules\\/mod_slideshowck\\/images\\/slides\\/road.jpg|qq|,|qq|imgcaption|qq|:|qq|This slideshow uses the JQuery script from <a href=|dq|http:\\/\\/www.pixedelic.com\\/plugins\\/camera\\/|dq|>Pixedelic<\\/a>|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost:8888\\/asfcanada\\/modules\\/mod_slideshowck\\/images\\/slides\\/road.jpg|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|modules\\/mod_slideshowck\\/images\\/slides\\/big_bunny_fake.jpg|qq|,|qq|imgcaption|qq|:|qq|This is a Video slide|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost:8888\\/asfcanada\\/modules\\/mod_slideshowck\\/images\\/slides\\/big_bunny_fake.jpg|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq|http:\\/\\/player.vimeo.com\\/video\\/2203727|qq|,|qq|slideselect|qq|:|qq|video|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|}]","theme":"default","skin":"camera_amber_skin","alignment":"center","loader":"pie","width":"auto","height":"400","navigation":"2","thumbnails":"1","thumbnailwidth":"100","thumbnailheight":"75","pagination":"1","effect":["random"],"time":"7000","transperiod":"1500","captioneffect":"moveFromLeft","portrait":"0","autoAdvance":"1","hover":"1","displayorder":"normal","limitslides":"","fullpage":"0","imagetarget":"_parent","usemobileimage":"0","mobileimageresolution":"640","loadjquery":"1","loadjqueryeasing":"1","loadjquerymobile":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","articlelength":"150","articlelink":"readmore","articletitle":"h3","showarticletitle":"1","captionstylesusefont":"1","captionstylestextgfont":"Droid Sans","captionstylesfontsize":"12px","captionstylesfontcolor":"","captionstylesfontweight":"normal","captionstylesdescfontsize":"10px","captionstylesdescfontcolor":"","captionstylesusemargin":"1","captionstylesmargintop":"0","captionstylesmarginright":"0","captionstylesmarginbottom":"0","captionstylesmarginleft":"0","captionstylespaddingtop":"0","captionstylespaddingright":"0","captionstylespaddingbottom":"0","captionstylespaddingleft":"0","captionstylesusebackground":"1","captionstylesbgcolor1":"","captionstylesbgimage":"","captionstylesbgpositionx":"left","captionstylesbgpositiony":"top","captionstylesbgimagerepeat":"repeat","captionstylesusegradient":"1","captionstylesbgcolor2":"","captionstylesuseroundedcorners":"1","captionstylesroundedcornerstl":"5","captionstylesroundedcornerstr":"5","captionstylesroundedcornersbr":"5","captionstylesroundedcornersbl":"5","captionstylesuseshadow":"1","captionstylesshadowcolor":"","captionstylesshadowblur":"3","captionstylesshadowspread":"0","captionstylesshadowoffsetx":"0","captionstylesshadowoffsety":"0","captionstylesshadowinset":"0","captionstylesuseborders":"1","captionstylesbordercolor":"","captionstylesborderwidth":"1"}', 0, '*'),
(103, 'Galeries', '', '', 1, 'position-15', 883, '2014-05-14 20:41:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_slideshowck', 1, 1, '{"slides":"[{|qq|imgname|qq|:|qq|images\\/slides\\/102_3546.JPG|qq|,|qq|imgcaption|qq|:|qq|Partager L''Espoir|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost:8888\\/asfcanada\\/images\\/slides\\/102_3546.JPG|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|bottomCenter|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|images\\/slides\\/102_3983.JPG|qq|,|qq|imgcaption|qq|:|qq|Partager L''Espoir|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost\\/asfcanada\\/images\\/slides\\/102_3983.JPG|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|images\\/slides\\/DSCF0303.JPG|qq|,|qq|imgcaption|qq|:|qq|Partager L''Espoir|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost\\/asfcanada\\/images\\/slides\\/DSCF0303.JPG|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq|http:\\/\\/player.vimeo.com\\/video\\/2203727|qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|images\\/slides\\/DSCF4134.JPG|qq|,|qq|imgcaption|qq|:|qq|Partager L''Espoir|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost\\/asfcanada\\/images\\/slides\\/DSCF4134.JPG|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|default|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|images\\/slides\\/DSC_0043.JPG|qq|,|qq|imgcaption|qq|:|qq|Partager L''Espoir|qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/localhost\\/asfcanada\\/images\\/slides\\/DSC_0043.JPG|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|default|qq|,|qq|imgalignment|qq|:|qq|bottomCenter|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slideselect|qq|:|qq|image|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|}]","theme":"default","skin":"camera_amber_skin","alignment":"center","loader":"none","width":"auto","height":"400","navigation":"2","thumbnails":"0","thumbnailwidth":"100","thumbnailheight":"75","pagination":"0","effect":["blindCurtainBottomLeft"],"time":"7000","transperiod":"1500","captioneffect":"moveFromLeft","portrait":"0","autoAdvance":"1","hover":"0","displayorder":"normal","limitslides":"","fullpage":"0","imagetarget":"_parent","usemobileimage":"0","mobileimageresolution":"640","loadjquery":"1","loadjqueryeasing":"1","loadjquerymobile":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","articlelength":"150","articlelink":"readmore","articletitle":"h3","showarticletitle":"1","captionstylesusefont":"1","captionstylestextgfont":"Droid Sans","captionstylesfontsize":"12px","captionstylesfontcolor":"","captionstylesfontweight":"normal","captionstylesdescfontsize":"10px","captionstylesdescfontcolor":"","captionstylesusemargin":"1","captionstylesmargintop":"0","captionstylesmarginright":"0","captionstylesmarginbottom":"0","captionstylesmarginleft":"0","captionstylespaddingtop":"0","captionstylespaddingright":"0","captionstylespaddingbottom":"0","captionstylespaddingleft":"0","captionstylesusebackground":"1","captionstylesbgcolor1":"","captionstylesbgimage":"","captionstylesbgpositionx":"left","captionstylesbgpositiony":"top","captionstylesbgimagerepeat":"repeat","captionstylesusegradient":"1","captionstylesbgcolor2":"","captionstylesuseroundedcorners":"1","captionstylesroundedcornerstl":"5","captionstylesroundedcornerstr":"5","captionstylesroundedcornersbr":"5","captionstylesroundedcornersbl":"5","captionstylesuseshadow":"1","captionstylesshadowcolor":"","captionstylesshadowblur":"3","captionstylesshadowspread":"0","captionstylesshadowoffsetx":"0","captionstylesshadowoffsety":"0","captionstylesshadowinset":"0","captionstylesuseborders":"1","captionstylesbordercolor":"","captionstylesborderwidth":"1"}', 0, '*');

-- --------------------------------------------------------

--
-- Structure de la table `asf_modules_menu`
--

DROP TABLE IF EXISTS `asf_modules_menu`;
CREATE TABLE IF NOT EXISTS `asf_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `asf_modules_menu`
--

INSERT INTO `asf_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 101),
(92, 111),
(93, 101),
(93, 102),
(93, 103),
(93, 104),
(93, 105),
(93, 106),
(93, 107),
(93, 108),
(93, 109),
(93, 110),
(93, 111),
(93, 112),
(93, 113),
(93, 114),
(93, 115),
(93, 116),
(93, 117),
(93, 118),
(93, 119),
(93, 120),
(93, 121),
(93, 122),
(93, 123),
(93, 124),
(93, 125),
(93, 126),
(93, 127),
(93, 128),
(94, 101),
(95, 101),
(96, 101),
(96, 102),
(96, 103),
(96, 104),
(96, 105),
(96, 106),
(96, 107),
(96, 109),
(96, 110),
(96, 115),
(97, 101),
(98, 0),
(99, 101),
(99, 102),
(99, 103),
(99, 104),
(99, 105),
(99, 106),
(99, 107),
(99, 108),
(99, 109),
(99, 110),
(99, 111),
(99, 112),
(99, 113),
(99, 114),
(99, 115),
(99, 116),
(99, 117),
(99, 118),
(99, 119),
(99, 120),
(99, 121),
(99, 122),
(99, 123),
(99, 124),
(99, 125),
(99, 126),
(99, 127),
(99, 128),
(101, 134),
(102, 165),
(103, 165);

-- --------------------------------------------------------

--
-- Structure de la table `asf_newsfeeds`
--

DROP TABLE IF EXISTS `asf_newsfeeds`;
CREATE TABLE IF NOT EXISTS `asf_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `asf_newsfeeds`
--

INSERT INTO `asf_newsfeeds` (`catid`, `id`, `name`, `alias`, `link`, `filename`, `published`, `numarticles`, `cache_time`, `checked_out`, `checked_out_time`, `ordering`, `rtl`, `access`, `language`, `params`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `xreference`, `publish_up`, `publish_down`) VALUES
(11, 1, 'Notre page facebook', 'notre-page-facebook', 'https://www.facebook.com/feeds/page.php?format=rss20&id=171343846290816', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 1, 0, 1, '*', '{"show_feed_image":"","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","newsfeed_layout":"","feed_display_order":"des"}', '2014-04-01 19:41:26', 883, '', '0000-00-00 00:00:00', 0, '', '', '{"robots":"","rights":""}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `asf_overrider`
--

DROP TABLE IF EXISTS `asf_overrider`;
CREATE TABLE IF NOT EXISTS `asf_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `asf_redirect_links`
--

DROP TABLE IF EXISTS `asf_redirect_links`;
CREATE TABLE IF NOT EXISTS `asf_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `asf_redirect_links`
--

INSERT INTO `asf_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `hits`, `published`, `created_date`, `modified_date`) VALUES
(1, 'http://localhost/trunk123111/index.php/create-a-post/login', '', 'http://localhost/trunk123111/index.php/login', '', 0, 0, '2012-01-04 15:48:49', '0000-00-00 00:00:00'),
(2, 'http://localhost/trunk123111/index.php/create-an-article', '', 'http://localhost/trunk123111/index.php/creating-your-site', '', 0, 0, '2012-01-05 02:01:07', '0000-00-00 00:00:00'),
(3, 'http://localhost/joomla-cms/index.php/using-joomla', '', 'http://localhost/joomla-cms/', '', 0, 0, '2012-01-17 06:21:35', '0000-00-00 00:00:00'),
(4, 'http://localhost/asfcanada/index.php/contacter-nous', '', '', '', 1, 0, '2014-02-27 20:16:03', '0000-00-00 00:00:00'),
(5, 'http://localhost/asfcanada/index.php/menu-haut', '', 'http://localhost/asfcanada/index.php/menu-haut', '', 1, 0, '2014-03-04 07:09:40', '0000-00-00 00:00:00'),
(6, 'http://localhost/asfcanada/index.php/administrator', '', '', '', 1, 0, '2014-03-04 21:37:41', '0000-00-00 00:00:00'),
(7, 'http://localhost/asfcanada/index.php/impliquez-vous', '', 'http://localhost/asfcanada/', '', 1, 0, '2014-03-06 01:56:53', '0000-00-00 00:00:00'),
(8, 'http://localhost/asfcanada/index.php/component/content/article?layout=edit&id=3', '', 'http://localhost/asfcanada/', '', 1, 0, '2014-03-28 18:48:24', '0000-00-00 00:00:00'),
(9, 'http://localhost/asfcanada/index.php/notre-organisme/historique/tp?=1', '', '', '', 1, 0, '2014-05-01 22:10:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `asf_schemas`
--

DROP TABLE IF EXISTS `asf_schemas`;
CREATE TABLE IF NOT EXISTS `asf_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `asf_schemas`
--

INSERT INTO `asf_schemas` (`extension_id`, `version_id`) VALUES
(700, '2.5.17');

-- --------------------------------------------------------

--
-- Structure de la table `asf_session`
--

DROP TABLE IF EXISTS `asf_session`;
CREATE TABLE IF NOT EXISTS `asf_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `asf_session`
--

INSERT INTO `asf_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`, `usertype`) VALUES
('5552689d496777c9187e630d33bbac72', 0, 1, '1400310270', '__default|a:7:{s:22:"session.client.browser";s:72:"Mozilla/5.0 (Windows NT 6.2; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0";s:15:"session.counter";i:2;s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:19:"session.timer.start";i:1400310269;s:18:"session.timer.last";i:1400310269;s:17:"session.timer.now";i:1400310269;}', 0, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `asf_template_styles`
--

DROP TABLE IF EXISTS `asf_template_styles`;
CREATE TABLE IF NOT EXISTS `asf_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `asf_template_styles`
--

INSERT INTO `asf_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(2, 'bluestork', 1, '0', 'Bluestork - Défault', '{"useRoundedCorners":"1","showSiteName":"0"}'),
(3, 'atomic', 0, '0', 'Atomic - Défault', '{}'),
(4, 'beez_20', 0, '0', 'Beez2 - default', '{"wrapperSmall":53,"wrapperLarge":72,"logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal"}'),
(5, 'hathor', 1, '1', 'Hathor - Défault', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(6, 'beez5', 0, '0', 'Beez5 - Défault', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/sampledata\\/fruitshop\\/fruits.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","html5":"0"}'),
(7, 'jsn_decor_free', 0, '0', 'JSN Decor FREE - Par défaut', '[]'),
(8, 'tk_gen_free_ii', 0, '0', 'tk_gen_free_ii - Par défaut', '{"config":""}'),
(9, 'jaxstorm-blue', 0, '1', 'jaxstorm-blue - Par défaut', '{"logoimage":"1","logo":"","sitetitle":"JaxStormBlue","sitedescription":"Designed by Hurricane Media","slides":"1","slideseffect":"0","slidesimage1":"","slideslink1":"","slidesimage2":"","slideslink2":"","slidesimage3":"","slideslink3":"","slidesimage4":"","slideslink4":"","slidesimage5":"","slideslink5":"","slidesimage6":"","slideslink6":"","socialposition":"1","socialicon1":"1","sociallink1":"http:\\/\\/www.facebook.com\\/","socialicon2":"11","sociallink2":"http:\\/\\/twitter.com\\/","socialicon3":"3","sociallink3":"http:\\/\\/plus.google.com","socialicon4":"0","sociallink4":"","socialicon5":"0","sociallink5":""}'),
(10, 'jaxstorm-blue', 0, '0', 'jaxstorm-blue - Par défaut', '{"logoimage":"1","logo":"","sitetitle":"JaxStormBlue","sitedescription":"Designed by Hurricane Media","slides":"1","slideseffect":"0","slidesimage1":"","slideslink1":"","slidesimage2":"","slideslink2":"","slidesimage3":"","slideslink3":"","slidesimage4":"","slideslink4":"","slidesimage5":"","slideslink5":"","slidesimage6":"","slideslink6":"","socialposition":"1","socialicon1":"1","sociallink1":"http:\\/\\/www.facebook.com\\/","socialicon2":"11","sociallink2":"http:\\/\\/twitter.com\\/","socialicon3":"3","sociallink3":"http:\\/\\/plus.google.com","socialicon4":"0","sociallink4":"","socialicon5":"0","sociallink5":""}'),
(13, 'asfc_template', 0, '0', 'asfc_template - Par défaut', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `asf_update_categories`
--

DROP TABLE IF EXISTS `asf_update_categories`;
CREATE TABLE IF NOT EXISTS `asf_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Update Categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `asf_update_sites`
--

DROP TABLE IF EXISTS `asf_update_sites`;
CREATE TABLE IF NOT EXISTS `asf_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=7 ;

--
-- Contenu de la table `asf_update_sites`
--

INSERT INTO `asf_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 0, 1393362266),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 0, 1393362266),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist.xml', 0, 1393362266),
(4, 'JM Slideshow Responsive', 'extension', 'http://extensions.joomlaman.com/jmslideshow/update.xml', 0, 1393969082),
(5, 'Slideshow CK Update', 'extension', 'http://update.joomlack.fr/mod_slideshowck_update.xml', 0, 1393969082),
(6, 'Maximenu CK Update', 'extension', 'http://update.joomlack.fr/mod_maximenuck_update.xml', 0, 1393969082);

-- --------------------------------------------------------

--
-- Structure de la table `asf_update_sites_extensions`
--

DROP TABLE IF EXISTS `asf_update_sites_extensions`;
CREATE TABLE IF NOT EXISTS `asf_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Contenu de la table `asf_update_sites_extensions`
--

INSERT INTO `asf_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(4, 602),
(4, 809),
(5, 810),
(6, 811);

-- --------------------------------------------------------

--
-- Structure de la table `asf_updates`
--

DROP TABLE IF EXISTS `asf_updates`;
CREATE TABLE IF NOT EXISTS `asf_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=234 ;

--
-- Contenu de la table `asf_updates`
--

INSERT INTO `asf_updates` (`update_id`, `update_site_id`, `extension_id`, `categoryid`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`) VALUES
(1, 3, 0, 0, 'Armenian', '', 'pkg_hy-AM', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/hy-AM_details.xml', ''),
(2, 3, 0, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '2.5.13.1', '', 'http://update.joomla.org/language/details/id-ID_details.xml', ''),
(3, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.14.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(4, 3, 0, 0, 'Khmer', '', 'pkg_km-KH', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/km-KH_details.xml', ''),
(5, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(6, 3, 0, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '2.5.14.1', '', 'http://update.joomla.org/language/details/hu-HU_details.xml', ''),
(7, 3, 0, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/bg-BG_details.xml', ''),
(8, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(9, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(10, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(11, 3, 0, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '2.5.13.1', '', 'http://update.joomla.org/language/details/tr-TR_details.xml', ''),
(12, 3, 0, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '2.5.13.11', '', 'http://update.joomla.org/language/details/uk-UA_details.xml', ''),
(13, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(14, 3, 0, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/be-BY_details.xml', ''),
(15, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(16, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2-5-17.1', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(17, 3, 0, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ro-RO_details.xml', ''),
(18, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(19, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.13.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(20, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(21, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(22, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(23, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(24, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.16.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(25, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(26, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(27, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(28, 3, 0, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/lt-LT_details.xml', ''),
(29, 3, 0, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '2.5.1.5', '', 'http://update.joomla.org/language/details/sq-AL_details.xml', ''),
(30, 3, 0, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '2.5.16.1', '', 'http://update.joomla.org/language/details/cs-CZ_details.xml', ''),
(31, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(32, 3, 0, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '2.5.7.4', '', 'http://update.joomla.org/language/details/gl-ES_details.xml', ''),
(33, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(34, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(35, 3, 0, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/pt-PT_details.xml', ''),
(36, 3, 0, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/ru-RU_details.xml', ''),
(37, 3, 0, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/he-IL_details.xml', ''),
(38, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.16.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(39, 3, 0, 0, 'Laotian', '', 'pkg_lo-LA', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/lo-LA_details.xml', ''),
(40, 3, 0, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '2.5.16.1', '', 'http://update.joomla.org/language/details/af-ZA_details.xml', ''),
(41, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(42, 3, 0, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/el-GR_details.xml', ''),
(43, 3, 0, 0, 'Esperanto', '', 'pkg_eo-XX', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/eo-XX_details.xml', ''),
(44, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.13.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(45, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(46, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(47, 3, 0, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/vi-VN_details.xml', ''),
(48, 3, 0, 0, 'Kurdish Sorani', '', 'pkg_ckb-IQ', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ckb-IQ_details.xml', ''),
(49, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(50, 3, 0, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '2.5.13.1', '', 'http://update.joomla.org/language/details/hr-HR_details.xml', ''),
(51, 3, 0, 0, 'Azeri', '', 'pkg_az-AZ', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/az-AZ_details.xml', ''),
(52, 3, 0, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/nn-NO_details.xml', ''),
(53, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(54, 3, 0, 0, 'Scottish Gaelic', '', 'pkg_gd-GB', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/gd-GB_details.xml', ''),
(55, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(56, 3, 0, 0, 'Basque', '', 'pkg_eu-ES', 'package', '', 0, '1.7.0.1', '', 'http://update.joomla.org/language/details/eu-ES_details.xml', ''),
(57, 3, 0, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/ug-CN_details.xml', ''),
(58, 3, 0, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ko-KR_details.xml', ''),
(59, 3, 0, 0, 'Hindi', '', 'pkg_hi-IN', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/hi-IN_details.xml', ''),
(60, 3, 0, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/cy-GB_details.xml', ''),
(61, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.17.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(62, 1, 700, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.18', '', 'http://update.joomla.org/core/extension.xml', ''),
(63, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(64, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(65, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(66, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(67, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(68, 3, 602, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(69, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(70, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(71, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(72, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(73, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(74, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(75, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(76, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(77, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(78, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(79, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(80, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(81, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(82, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(83, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(84, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(85, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(86, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(87, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(88, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(89, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(90, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(91, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(92, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(93, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(94, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(95, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(96, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(97, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(98, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(99, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(100, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(101, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(102, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(103, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(104, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(105, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(106, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(107, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(108, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(109, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(110, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(111, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(112, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(113, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(114, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(115, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(116, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(117, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(118, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(119, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(120, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(121, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(122, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(123, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(124, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(125, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(126, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(127, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(128, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(129, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(130, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(131, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(132, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(133, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(134, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(135, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(136, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(137, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(138, 3, 0, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/cs-CZ_details.xml', ''),
(139, 3, 0, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/cs-CZ_details.xml', ''),
(140, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(141, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(142, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(143, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(144, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(145, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(146, 3, 0, 0, 'Bengali', '', 'pkg_bn-BD', 'package', '', 0, '2.5.0.1', '', 'http://update.joomla.org/language/details/bn-BD_details.xml', ''),
(147, 3, 0, 0, 'Bengali', '', 'pkg_bn-BD', 'package', '', 0, '2.5.0.1', '', 'http://update.joomla.org/language/details/bn-BD_details.xml', ''),
(148, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(149, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(150, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(151, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(152, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(153, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(154, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(155, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(156, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(157, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(158, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(159, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(160, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(161, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(162, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(163, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(164, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(165, 3, 0, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/cs-CZ_details.xml', ''),
(166, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(167, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(168, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(169, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(170, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(171, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(172, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(173, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(174, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(175, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(176, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(177, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(178, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(179, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(180, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(181, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(182, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(183, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(184, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(185, 3, 0, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/cs-CZ_details.xml', ''),
(186, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(187, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(188, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(189, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(190, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(191, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(192, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(193, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(194, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(195, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(196, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(197, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(198, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(199, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(200, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(201, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(202, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(203, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(204, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(205, 3, 0, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/cs-CZ_details.xml', ''),
(206, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(207, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(208, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(209, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(210, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(211, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(212, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(213, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(214, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(215, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(216, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(217, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(218, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.17.2', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(219, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(220, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(221, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(222, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(223, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(224, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(225, 3, 0, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/cs-CZ_details.xml', ''),
(226, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(227, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(228, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(229, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(230, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(231, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.18.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(232, 5, 810, 0, 'Slideshow CK', 'Show your images with a nice effect', 'mod_slideshowck', 'module', '', 0, '1.3.12', '', 'http://update.joomlack.fr/mod_slideshowck_update.xml', 'http://www.joomlack.fr/extensions-joomla/slideshow-ck'),
(233, 5, 810, 0, 'Slideshow CK', 'Show your images with a nice effect', 'mod_slideshowck', 'module', '', 0, '1.3.12', '', 'http://update.joomlack.fr/mod_slideshowck_update.xml', 'http://www.joomlack.fr/extensions-joomla/slideshow-ck');

-- --------------------------------------------------------

--
-- Structure de la table `asf_user_notes`
--

DROP TABLE IF EXISTS `asf_user_notes`;
CREATE TABLE IF NOT EXISTS `asf_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `asf_user_profiles`
--

DROP TABLE IF EXISTS `asf_user_profiles`;
CREATE TABLE IF NOT EXISTS `asf_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Structure de la table `asf_user_usergroup_map`
--

DROP TABLE IF EXISTS `asf_user_usergroup_map`;
CREATE TABLE IF NOT EXISTS `asf_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `asf_user_usergroup_map`
--

INSERT INTO `asf_user_usergroup_map` (`user_id`, `group_id`) VALUES
(883, 8);

-- --------------------------------------------------------

--
-- Structure de la table `asf_usergroups`
--

DROP TABLE IF EXISTS `asf_usergroups`;
CREATE TABLE IF NOT EXISTS `asf_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `asf_usergroups`
--

INSERT INTO `asf_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 20, 'Public'),
(2, 1, 6, 17, 'Enregistré'),
(3, 2, 7, 14, 'Auteur'),
(4, 3, 8, 11, 'Rédacteur'),
(5, 4, 9, 10, 'Éditeur'),
(6, 1, 2, 5, 'Gestionnaire'),
(7, 6, 3, 4, 'Administrateur'),
(8, 1, 18, 19, 'Super Utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `asf_users`
--

DROP TABLE IF EXISTS `asf_users`;
CREATE TABLE IF NOT EXISTS `asf_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=884 ;

--
-- Contenu de la table `asf_users`
--

INSERT INTO `asf_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`) VALUES
(883, 'Super Utilisateur', 'admin', 'soulgaye@gmail.com', 'ca3df29a3778726fbd05390045b7eff4:gMP9tbae2CQ56S36iiYmChUr4YUbJ13h', 'deprecated', 0, 1, '2014-01-24 02:15:41', '2014-05-16 18:36:58', '0', '', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `asf_viewlevels`
--

DROP TABLE IF EXISTS `asf_viewlevels`;
CREATE TABLE IF NOT EXISTS `asf_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `asf_viewlevels`
--

INSERT INTO `asf_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Accès Public', 0, '[1]'),
(2, 'Accès Enregistré', 1, '[6,2,8]'),
(3, 'Accès Spécial', 2, '[6,3,8]');

-- --------------------------------------------------------

--
-- Structure de la table `asf_weblinks`
--

DROP TABLE IF EXISTS `asf_weblinks`;
CREATE TABLE IF NOT EXISTS `asf_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `asf_weblinks`
--

INSERT INTO `asf_weblinks` (`id`, `catid`, `sid`, `title`, `alias`, `url`, `description`, `date`, `hits`, `state`, `checked_out`, `checked_out_time`, `ordering`, `archived`, `approved`, `access`, `params`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`) VALUES
(1, 8, 0, 'Communauté Joomla!', 'communaute-joomla', 'http://community.joomla.org/blogs/community.html', '', '0000-00-00 00:00:00', 0, 1, 0, '0000-00-00 00:00:00', 1, 0, 1, 1, '{"target":"","width":"","height":"","count_clicks":""}', '*', '2012-01-04 15:04:03', 883, '', '2012-01-04 16:17:27', 42, '', '', '', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 8, 0, 'Blog Joomla! Leadership', 'blog-joomla-leadership', 'http://community.joomla.org/blogs/leadership.html', '', '0000-00-00 00:00:00', 0, 1, 0, '0000-00-00 00:00:00', 2, 0, 1, 1, '{"target":"","width":"","height":"","count_clicks":""}', '*', '2012-01-04 15:04:48', 883, '', '2012-01-04 16:17:27', 42, '', '', '', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 8, 0, 'Communauté Joomla! francophone', 'communaute-joomla-francophone', 'http://www.joomla.fr', '', '0000-00-00 00:00:00', 0, 1, 0, '0000-00-00 00:00:00', 3, 0, 1, 1, '{"target":"","width":"","height":"","count_clicks":""}', '*', '2012-01-04 15:04:48', 883, '', '2012-01-04 16:17:27', 42, '', '', '', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
