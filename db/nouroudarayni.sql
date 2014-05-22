-- phpMyAdmin SQL Dump
-- version 4.1.9
-- http://www.phpmyadmin.net
--
-- Client :  localhost:8889
-- Généré le :  Jeu 22 Mai 2014 à 21:15
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

CREATE TABLE `cotisationdiverse` (
  `montant` int(11) NOT NULL,
  `datecotisation` datetime NOT NULL,
  `commentaire` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cotisationevenement`
--

CREATE TABLE `cotisationevenement` (
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

CREATE TABLE `cotisationkst` (
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

CREATE TABLE `cotisationmembre` (
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

CREATE TABLE `dahira` (
  `nom` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `numeroEnregistrement` varchar(100) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `siteWeb` varchar(100) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `codepostale` varchar(7) NOT NULL,
  `province` varchar(100) NOT NULL,
  `pays` varchar(100) NOT NULL,
  PRIMARY KEY (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `dahira`
--

INSERT INTO `dahira` (`nom`, `description`, `numeroEnregistrement`, `telephone`, `email`, `siteWeb`, `adresse`, `ville`, `codepostale`, `province`, `pays`) VALUES
('Fondation Norou Darayni', 'Expliquer...', '84807 4597 PR0001', '000 000 0000', 'xxxx@gmail.com', 'www.dahiranouroudarayni.ca', '4255 Av. De Courtrai', 'Montréal', 'H3S 1B8', 'Québec', 'Canada');

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `nom` varchar(100) NOT NULL,
  `budget` decimal(10,0) NOT NULL,
  `depense` decimal(10,0) DEFAULT NULL,
  `dateEvent` datetime NOT NULL,
  PRIMARY KEY (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `evenement`
--

INSERT INTO `evenement` (`nom`, `budget`, `depense`, `dateEvent`) VALUES
('Thiant2011', 7000, NULL, '2011-05-01 00:00:00'),
('Thiant2012', 4000, NULL, '2012-05-01 00:00:00'),
('thiant2013', 5000, NULL, '2012-05-10 00:00:00'),
('Thiant2014', 41000, 40000, '2014-04-30 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
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
('Amar', 'Abdou khadre', '2014-05-22', '', '', 'Quebec', '', '', 'aba@gmail.com', 'Canada'),
('Khouma', 'Babacar', '2014-05-22', '', '', 'Quebec', '', '666 372 8898', 'abcd@gmail.com', 'Canada'),
('Diop', 'Cheikh Ibrahima', '2014-05-22', '', '', 'Quebec', '', '435 222 3212', 'ava@gmail.ca', 'Canada'),
('Fall', 'Doumbia', '2014-05-22', '', '', 'Quebec', '', '333 344 2213', 'bayess@gmail.com', 'Canada'),
('Bamba', 'Goor', '2014-05-22', '', '', 'Quebec', '', '444 553 4534', 'bdd@gmail.com', 'Canada'),
('Mbodji', 'Abib', '2014-05-22', '', '', 'Quebec', '', '222 111 3323', 'ffss@gmail.com', 'Canada'),
('Gueye', 'Malick', '2014-05-22', '', '', 'Quebec', '', '', 'gueyemalick1@hotmail.com', 'Canada'),
('Mboup', 'Makhtar', '2014-05-22', 'De Courtrai', '', 'Quebec', '', '889 342 3323', 'idi@gmail.com', 'Canada'),
('Sarr', 'Ahmadou', '2014-05-22', '', '', 'Quebec', '', '543 678 9879', 'kkkk@gmail.com', 'Canada'),
('Mbengue', 'Mansour', '2009-05-15', '8190, rue Arthur Peloquin', 'Saint léonard', 'Quebec', 'H1R 2S8', '5147778888', 'mansour.tlse@gmail.com', 'Canada'),
('Mboup', 'Mamadou', '2014-05-22', '8190, rue Arthur peloquin', 'Saint Léonard', 'Quebec', 'H1R 2S8', '000 000 0000', 'mboupmamadou@hotmail.com', 'Canada'),
('Thimbo 2', 'Moussa', '2007-05-17', '1 er Av. Vane Horne', 'Montréal', 'Quebec', 'H2R 3S8', '514 555 6666', 'moussa.thimbo@gmail.com', 'Canada'),
('Thimbo', 'Moussa', '2011-05-05', '8190, rue Arthur Peloquin', 'Saint Léonard', 'Quebec', 'H1R 2S8', '514 708 4444', 'moussa.thimbo@hotmail.com', 'Canada'),
('Niang', 'Serigne Mbaye', '2014-05-22', '', '', 'Quebec', '', '', 'oudxxx@gmail.com', 'Canada'),
('Ndiaye', 'Djiby Oumar', '2014-05-22', 'Vane Horne', 'Saint Laurent', 'Quebec', 'H1S 2K3', '514 666 7777', 'oumar@hotmail.ca', 'Canada'),
('Dieng', 'Ousmane', '2011-05-12', '8190, rue Arthur Peloquin', 'Saint Léonard', 'Quebec', 'H1R 2S8', '5147084568', 'oussou.dieng@gmail.com', 'Canada'),
('Dieng 2', 'Ousmane', '2014-05-14', '2890, rue Cote des Neiges', 'Montréal', 'Quebec', 'H1S 2K2', '4385679999', 'ouzdam@yahoo.fr', 'Canada'),
('Mboup', 'Karim', '2014-05-22', '', '', 'Quebec', '', '', 'sasssa@gmail.ca', 'Canada'),
('Khassaide', 'Kourel', '2014-05-22', '', '', 'Quebec', '', '333 333 3333', 'sedfff@gmail.com', 'Canada'),
('Dieng', 'Khadim', '2014-05-22', 'Touba', 'Ndiarème', 'Quebec', 'H1E 2S3', '345 657 8899', 'sfe@gmail.com', 'Canada'),
('mboup', 'Maguette', '2014-05-22', '', '', 'Quebec', '', '000 000 1111', 'x1@gmail.com', 'Canada'),
('Kebe', 'Ousmane', '2014-05-22', '', '', 'Quebec', '', '000 333 4444', 'x2@gmail.com', 'Canada'),
('Niang', 'Samba', '2014-05-22', '', '', 'Quebec', '', '333 000 3333', 'x3@gmail.com', 'Canada'),
('Dioum', 'Djily', '2014-05-22', '', '', 'Quebec', '', '333 444 3333', 'x4@gmail.com', 'Canada'),
('Dieng', 'Abo', '2014-05-22', '', '', 'Quebec', '', '000 111 3333', 'x5@gmail.com', 'Canada'),
('Diouf', 'Ousseynou', '2014-05-22', '', '', 'Quebec', '', '000 222 1111', 'x6@yahoo.fr', 'Canada'),
('Niang', 'Oumar', '2014-05-22', '', '', 'Quebec', '', '', 'x7@gamil.com', 'Canada'),
('Ndiaye', 'Ibrahima', '2014-05-22', '', '', 'Quebec', '', '999 999 9999', 'x8@gmail.com', 'Canada'),
('Ndao', 'Mamadou lamine', '2014-05-22', '', '', 'Quebec', '', '453 323 1112', 'xlm@gmail.com', 'Canada'),
('Seck', 'Ousseynou', '2014-05-22', '', '', 'Quebec', '', '', 'xx@gmail.com', 'Canada');

-- --------------------------------------------------------

--
-- Structure de la table `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', 1751);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `login` varchar(20) NOT NULL,
  `pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`login`, `pass`) VALUES
('moussa', '0cc85dab9975ab9f00c966a9666df97e');
