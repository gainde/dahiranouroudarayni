-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 20 Mai 2014 à 05:24
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `nouroudarayni`
--
CREATE DATABASE IF NOT EXISTS `nouroudarayni` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nouroudarayni`;

-- --------------------------------------------------------

--
-- Structure de la table `cotisationdiverse`
--

DROP TABLE IF EXISTS `cotisationdiverse`;
CREATE TABLE IF NOT EXISTS `cotisationdiverse` (
  `montant` int(11) NOT NULL,
  `datecotisation` datetime NOT NULL,
  `commentaire` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cotisationevenement`
--

DROP TABLE IF EXISTS `cotisationevenement`;
CREATE TABLE IF NOT EXISTS `cotisationevenement` (
  `id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `datecotisation` datetime NOT NULL,
  `idEven` varchar(50) NOT NULL,
  `idMembre` varchar(50) NOT NULL DEFAULT 'Anonyme'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cotisationevenement`
--

INSERT INTO `cotisationevenement` (`id`, `montant`, `datecotisation`, `idEven`, `idMembre`) VALUES
(1152, 500, '2014-05-15 00:00:00', 'Autre', 'Anonyme'),
(1202, 56, '2013-05-05 00:00:00', 'Autre', 'Anonyme'),
(1352, 100, '2014-04-27 00:00:00', 'Autre', 'address@gmail.com'),
(1353, 75, '2014-04-22 00:00:00', 'Autre', 'address@gmail.com'),
(1354, 50, '2013-04-10 00:00:00', 'Autre', 'address@gmail.com'),
(1366, 100, '2014-04-01 00:00:00', 'Autre', 'test@gmail.com'),
(1403, 450, '2014-05-13 00:00:00', 'Autre', 'test@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `cotisationkst`
--

DROP TABLE IF EXISTS `cotisationkst`;
CREATE TABLE IF NOT EXISTS `cotisationkst` (
  `id` int(11) NOT NULL,
  `type` varchar(1) NOT NULL DEFAULT '0',
  `montant` double NOT NULL,
  `datecotisation` date NOT NULL,
  `idMembre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cotisationkst`
--

INSERT INTO `cotisationkst` (`id`, `type`, `montant`, `datecotisation`, `idMembre`) VALUES
(1253, '1', 100, '2014-04-27', 'test@gmail.com'),
(1254, '1', 50, '2014-05-15', 'test@gmail.com'),
(1360, '1', 50, '2014-05-08', 'address@gmail.com'),
(1361, '1', 50, '2014-05-08', 'address@gmail.com'),
(1362, '1', 50, '2014-05-08', 'address@gmail.com'),
(1363, '1', 50, '2014-04-08', 'address@gmail.com'),
(1364, '1', 50, '2014-03-11', 'address@gmail.com'),
(1365, '0', 500, '2013-03-06', 'address@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `cotisationmembre`
--

DROP TABLE IF EXISTS `cotisationmembre`;
CREATE TABLE IF NOT EXISTS `cotisationmembre` (
  `id` int(11) NOT NULL COMMENT 'id cotisation membre',
  `montant` int(11) NOT NULL,
  `datecotisation` date NOT NULL,
  `idMembre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cotisationmembre`
--

INSERT INTO `cotisationmembre` (`id`, `montant`, `datecotisation`, `idMembre`) VALUES
(1252, 90, '2014-05-16', 'test@gmail.com'),
(1302, 45, '2014-05-07', 'address@gmail.com'),
(1355, 20, '2013-05-03', 'address@gmail.com'),
(1356, 20, '2012-05-05', 'address@gmail.com'),
(1357, 50, '2012-05-08', 'address@gmail.com'),
(1358, 60, '2012-05-08', 'address@gmail.com'),
(1359, 60, '2013-09-18', 'address@gmail.com'),
(1402, 12, '2014-05-14', 'test@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `dahira`
--

DROP TABLE IF EXISTS `dahira`;
CREATE TABLE IF NOT EXISTS `dahira` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `numeroEnregistrement` int(10) unsigned NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `siteWeb` varchar(100) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `codePostale` varchar(7) NOT NULL,
  `province` varchar(100) NOT NULL,
  `pays` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `id` int(10) unsigned NOT NULL,
  `nom` varchar(100) NOT NULL,
  `budget` decimal(10,0) NOT NULL,
  `depense` decimal(10,0) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `datenaissance` date DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `codepostale` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL DEFAULT '',
  `pays` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `membre`
--

INSERT INTO `membre` (`nom`, `prenom`, `datenaissance`, `adresse`, `ville`, `province`, `codepostale`, `telephone`, `email`, `pays`) VALUES
('Dieng', 'Mansour', '1984-07-04', 'arthur-peloquin', 'montreal', 'quebec', 'h3s1r7', '5148880001', 'address@gmail.com', 'Canada'),
('Thimbo', 'Moussa', '1985-08-03', 'arthur-peloquin', 'montreal', 'quebec', 'h3s1r7', '5142960552', 'test@gmail.com', 'Canada');

-- --------------------------------------------------------

--
-- Structure de la table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
CREATE TABLE IF NOT EXISTS `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '1451');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `login` varchar(20) NOT NULL,
  `pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`login`, `pass`) VALUES
('moussa', '0cc85dab9975ab9f00c966a9666df97e');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
