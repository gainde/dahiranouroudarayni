-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 14 Mai 2014 à 02:38
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

CREATE TABLE IF NOT EXISTS `cotisationdiverse` (
  `montant` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `commentaire` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cotisationevenement`
--

CREATE TABLE IF NOT EXISTS `cotisationevenement` (
  `id` int(11) NOT NULL,
  `montant` decimal(10,0) NOT NULL,
  `date` datetime NOT NULL,
  `idEven` int(11) NOT NULL,
  `idMembre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cotisationkst`
--

CREATE TABLE IF NOT EXISTS `cotisationkst` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `idMembre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cotisationmembre`
--

CREATE TABLE IF NOT EXISTS `cotisationmembre` (
  `id` int(11) NOT NULL COMMENT 'id cotisation membre',
  `montant` int(11) NOT NULL,
  `datecotisation` date NOT NULL,
  `idMembre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cotisationmembre`
--

INSERT INTO `cotisationmembre` (`id`, `montant`, `datecotisation`, `idMembre`) VALUES
(352, 500, '1985-08-03', 202),
(402, 500, '1985-08-03', 202),
(502, 1000, '2009-02-10', 202),
(552, 1000, '2009-02-10', 202),
(652, 7777, '2014-05-10', 202),
(702, 500, '2014-05-12', 202),
(752, 1000, '2014-05-05', 202);

-- --------------------------------------------------------

--
-- Structure de la table `dahira`
--

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

CREATE TABLE IF NOT EXISTS `membre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `datenaissance` date DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `codepostale` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pays` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=303 ;

--
-- Contenu de la table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `datenaissance`, `adresse`, `ville`, `province`, `codepostale`, `telephone`, `email`, `pays`) VALUES
(252, 'Dieng', 'Ousmane', '1985-08-03', 'arthur-peloquin', 'montreal', 'quebec', 'h3s1r7', '5142960552', 'test@gmail.com', 'Canada'),
(302, 'Dieng', 'Ousmane', '1985-08-03', 'arthur-peloquin', 'montreal', 'quebec', 'h3s1r7', '5142960552', 'test@gmail.com', 'Canada');

-- --------------------------------------------------------

--
-- Structure de la table `sequence`
--

CREATE TABLE IF NOT EXISTS `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '851');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `login` varchar(20) NOT NULL,
  `pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
