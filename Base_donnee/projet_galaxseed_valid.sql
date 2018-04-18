-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 28 mars 2018 à 13:54
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet_galaxseed`
--

-- --------------------------------------------------------

--
-- Structure de la table `allows`
--

DROP TABLE IF EXISTS `allows`;
CREATE TABLE IF NOT EXISTS `allows` (
  `l_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  PRIMARY KEY (`l_id`,`s_id`),
  KEY `FK_allows_s_id` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `authorization`
--

DROP TABLE IF EXISTS `authorization`;
CREATE TABLE IF NOT EXISTS `authorization` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(25) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `capacity`
--

DROP TABLE IF EXISTS `capacity`;
CREATE TABLE IF NOT EXISTS `capacity` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(25) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `capacity`
--

INSERT INTO `capacity` (`c_id`, `c_name`) VALUES
(1, 'guest'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `card_game`
--

DROP TABLE IF EXISTS `card_game`;
CREATE TABLE IF NOT EXISTS `card_game` (
  `cg_id` int(11) NOT NULL AUTO_INCREMENT,
  `cg_health_point` int(11) DEFAULT NULL,
  `cg_attack` int(11) DEFAULT NULL,
  `cg_shield` tinyint(4) NOT NULL,
  `hg_id` int(11) NOT NULL,
  `ct_id` int(11) NOT NULL,
  `l_id` int(11) NOT NULL,
  PRIMARY KEY (`cg_id`),
  KEY `FK_card_game_hg_id` (`hg_id`),
  KEY `FK_card_game_ct_id` (`ct_id`),
  KEY `FK_card_game_l_id` (`l_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `card_template`
--

DROP TABLE IF EXISTS `card_template`;
CREATE TABLE IF NOT EXISTS `card_template` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_name` varchar(200) NOT NULL,
  `ct_health_point` int(11) DEFAULT NULL,
  `ct_attack` int(11) DEFAULT NULL,
  `ct_cost` int(11) DEFAULT NULL,
  `ct_shield` tinyint(4) NOT NULL,
  `t_id` int(11) NOT NULL,
  PRIMARY KEY (`ct_id`),
  KEY `FK_card_template_t_id` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_date` date NOT NULL,
  `g_round_count` int(11) NOT NULL,
  `u_id_p1` int(11) NOT NULL,
  `hg_id_p1` int(11) NOT NULL,
  `u_id_p2` int(11) NOT NULL,
  `hg_id_p2` int(11) NOT NULL,
  PRIMARY KEY (`g_id`),
  KEY `FK_game_u_id` (`u_id_p1`),
  KEY `FK_game_hg_id` (`hg_id_p1`),
  KEY `FK_game_u_id_user` (`u_id_p2`),
  KEY `FK_game_hg_id_hero_game` (`hg_id_p2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `give_authorization`
--

DROP TABLE IF EXISTS `give_authorization`;
CREATE TABLE IF NOT EXISTS `give_authorization` (
  `c_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`,`a_id`),
  KEY `FK_give_authorization_a_id` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `hero_game`
--

DROP TABLE IF EXISTS `hero_game`;
CREATE TABLE IF NOT EXISTS `hero_game` (
  `hg_id` int(11) NOT NULL AUTO_INCREMENT,
  `hg_health_count` int(11) NOT NULL,
  `hg_mana_count` int(11) NOT NULL,
  `hg_user_turn` tinyint(4) NOT NULL,
  `ht_id` int(11) NOT NULL,
  `g_id` int(11) NOT NULL,
  PRIMARY KEY (`hg_id`),
  KEY `FK_hero_game_ht_id` (`ht_id`),
  KEY `FK_hero_game_g_id` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `hero_template`
--

DROP TABLE IF EXISTS `hero_template`;
CREATE TABLE IF NOT EXISTS `hero_template` (
  `ht_id` int(11) NOT NULL AUTO_INCREMENT,
  `ht_name` varchar(50) NOT NULL,
  `ht_health_count` int(11) NOT NULL,
  `ht_mana_count` int(11) NOT NULL,
  `ht_board` varchar(50) NOT NULL,
  PRIMARY KEY (`ht_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `hero_template`
--

INSERT INTO `hero_template` (`ht_id`, `ht_name`, `ht_health_count`, `ht_mana_count`, `ht_board`) VALUES
(1, 'diskor', 20, 1, 'diskor'),
(2, 'reine_sadida', 20, 1, 'reine_sadida');

-- --------------------------------------------------------

--
-- Structure de la table `illustrate_card`
--

DROP TABLE IF EXISTS `illustrate_card`;
CREATE TABLE IF NOT EXISTS `illustrate_card` (
  `ct_id` int(11) NOT NULL,
  `i_id` int(11) NOT NULL,
  PRIMARY KEY (`ct_id`,`i_id`),
  KEY `FK_illustrate_card_i_id` (`i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `illustrate_hero`
--

DROP TABLE IF EXISTS `illustrate_hero`;
CREATE TABLE IF NOT EXISTS `illustrate_hero` (
  `i_id` int(11) NOT NULL,
  `ht_id` int(11) NOT NULL,
  PRIMARY KEY (`i_id`,`ht_id`),
  KEY `FK_illustrate_hero_ht_id` (`ht_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `illustration`
--

DROP TABLE IF EXISTS `illustration`;
CREATE TABLE IF NOT EXISTS `illustration` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `i_name` varchar(25) NOT NULL,
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_name` varchar(25) NOT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`l_id`, `l_name`) VALUES
(1, 'deck'),
(2, 'hand'),
(3, 'board'),
(4, 'discard');

-- --------------------------------------------------------

--
-- Structure de la table `sign_up_news`
--

DROP TABLE IF EXISTS `sign_up_news`;
CREATE TABLE IF NOT EXISTS `sign_up_news` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_email` varchar(50) NOT NULL,
  `s_date` date NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sign_up_news`
--

INSERT INTO `sign_up_news` (`s_id`, `s_email`, `s_date`) VALUES
(1, 'demcel83@gmail.com', '2018-03-28'),
(2, 'sebastien.caillault@gmail.com', '2018-03-28'),
(3, 'vignau.raphael@gmail.com', '2018-03-28'),
(4, 'skandernabli34@gmail.com', '2018-03-28');

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(25) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(25) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`t_id`, `t_name`) VALUES
(1, 'legendary'),
(2, 'spell'),
(3, 'creature');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_login` varchar(200) NOT NULL,
  `u_password` varchar(200) NOT NULL,
  `u_email` varchar(200) NOT NULL,
  `u_registration_date` date NOT NULL,
  `u_game_count` int(11) NOT NULL,
  `u_victory_count` int(11) NOT NULL,
  `u_connect` tinyint(1) NOT NULL,
  `c_id` int(11) NOT NULL,
  `g_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `g_id_game` int(11) NOT NULL,
  PRIMARY KEY (`u_id`),
  KEY `FK_user_c_id` (`c_id`),
  KEY `FK_user_g_id` (`g_id`),
  KEY `FK_user_s_id` (`s_id`),
  KEY `FK_user_g_id_game` (`g_id_game`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `allows`
--
ALTER TABLE `allows`
  ADD CONSTRAINT `FK_allows_l_id` FOREIGN KEY (`l_id`) REFERENCES `location` (`l_id`),
  ADD CONSTRAINT `FK_allows_s_id` FOREIGN KEY (`s_id`) REFERENCES `status` (`s_id`);

--
-- Contraintes pour la table `card_game`
--
ALTER TABLE `card_game`
  ADD CONSTRAINT `FK_card_game_ct_id` FOREIGN KEY (`ct_id`) REFERENCES `card_template` (`ct_id`),
  ADD CONSTRAINT `FK_card_game_hg_id` FOREIGN KEY (`hg_id`) REFERENCES `hero_game` (`hg_id`),
  ADD CONSTRAINT `FK_card_game_l_id` FOREIGN KEY (`l_id`) REFERENCES `location` (`l_id`);

--
-- Contraintes pour la table `card_template`
--
ALTER TABLE `card_template`
  ADD CONSTRAINT `FK_card_template_t_id` FOREIGN KEY (`t_id`) REFERENCES `type` (`t_id`);

--
-- Contraintes pour la table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `FK_game_hg_id` FOREIGN KEY (`hg_id_p1`) REFERENCES `hero_game` (`hg_id`),
  ADD CONSTRAINT `FK_game_hg_id_hero_game` FOREIGN KEY (`hg_id_p2`) REFERENCES `hero_game` (`hg_id`),
  ADD CONSTRAINT `FK_game_u_id` FOREIGN KEY (`u_id_p1`) REFERENCES `user` (`u_id`),
  ADD CONSTRAINT `FK_game_u_id_user` FOREIGN KEY (`u_id_p2`) REFERENCES `user` (`u_id`);

--
-- Contraintes pour la table `give_authorization`
--
ALTER TABLE `give_authorization`
  ADD CONSTRAINT `FK_give_authorization_a_id` FOREIGN KEY (`a_id`) REFERENCES `authorization` (`a_id`),
  ADD CONSTRAINT `FK_give_authorization_c_id` FOREIGN KEY (`c_id`) REFERENCES `capacity` (`c_id`);

--
-- Contraintes pour la table `hero_game`
--
ALTER TABLE `hero_game`
  ADD CONSTRAINT `FK_hero_game_g_id` FOREIGN KEY (`g_id`) REFERENCES `game` (`g_id`),
  ADD CONSTRAINT `FK_hero_game_ht_id` FOREIGN KEY (`ht_id`) REFERENCES `hero_template` (`ht_id`);

--
-- Contraintes pour la table `illustrate_card`
--
ALTER TABLE `illustrate_card`
  ADD CONSTRAINT `FK_illustrate_card_ct_id` FOREIGN KEY (`ct_id`) REFERENCES `card_template` (`ct_id`),
  ADD CONSTRAINT `FK_illustrate_card_i_id` FOREIGN KEY (`i_id`) REFERENCES `illustration` (`i_id`);

--
-- Contraintes pour la table `illustrate_hero`
--
ALTER TABLE `illustrate_hero`
  ADD CONSTRAINT `FK_illustrate_hero_ht_id` FOREIGN KEY (`ht_id`) REFERENCES `hero_template` (`ht_id`),
  ADD CONSTRAINT `FK_illustrate_hero_i_id` FOREIGN KEY (`i_id`) REFERENCES `illustration` (`i_id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_c_id` FOREIGN KEY (`c_id`) REFERENCES `capacity` (`c_id`),
  ADD CONSTRAINT `FK_user_g_id` FOREIGN KEY (`g_id`) REFERENCES `game` (`g_id`),
  ADD CONSTRAINT `FK_user_g_id_game` FOREIGN KEY (`g_id_game`) REFERENCES `game` (`g_id`),
  ADD CONSTRAINT `FK_user_s_id` FOREIGN KEY (`s_id`) REFERENCES `sign_up_news` (`s_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
