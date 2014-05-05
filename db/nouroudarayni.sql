-- phpMyAdmin SQL Dump
-- version 4.1.9
-- http://www.phpmyadmin.net
--
-- Client :  localhost:8889
-- Généré le :  Mar 01 Avril 2014 à 05:17
-- Version du serveur :  5.5.34
-- Version de PHP :  5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `nouroudarayni`
--

-- --------------------------------------------------------

--
-- Structure de la table `cotisationdiverse`
--

DROP TABLE IF EXISTS `cotisationdiverse`;
CREATE TABLE `cotisationdiverse` (
  `montant` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `commentaire` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cotisationevenement`
--

DROP TABLE IF EXISTS `cotisationevenement`;
CREATE TABLE `cotisationevenement` (
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

DROP TABLE IF EXISTS `cotisationkst`;
CREATE TABLE `cotisationkst` (
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

DROP TABLE IF EXISTS `cotisationmembre`;
CREATE TABLE `cotisationmembre` (
  `id` int(11) NOT NULL COMMENT 'id cotisation membre',
  `montant` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `idMembre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dahira`
--

DROP TABLE IF EXISTS `dahira`;
CREATE TABLE `dahira` (
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
CREATE TABLE `evenement` (
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
CREATE TABLE `membre` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=203 ;

--
-- Contenu de la table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `datenaissance`, `adresse`, `ville`, `province`, `codepostale`, `telephone`, `email`, `pays`) VALUES
(202, 'Thimbo', 'Moussa', '1985-08-03', 'arthur-peloquin', 'montreal', 'quebec', 'h3s1r7', '5142960552', 'test@gmail.com', 'Canada');

-- --------------------------------------------------------

--
-- Structure de la table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', 251);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE `utilisateur` (
  `login` varchar(20) NOT NULL,
  `pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
